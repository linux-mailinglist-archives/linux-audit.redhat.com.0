Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9340069224C
	for <lists+linux-audit@lfdr.de>; Fri, 10 Feb 2023 16:34:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676043241;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NRzrKYxamBr2/gCIRIWnKs0Kb+a5sdl2ZDHK6riM66U=;
	b=ENDccBIB8oPjWJuTGkRV4ik/LJQgBIL+DsRXBXEUORk5yp5xJ0o41FbBS/GIcCv2o1Uqef
	wyJZ1obIj3HDKUGVNyvU4R/ejQFIlA+awJT2jDuemhjla15EKOOY1Exlg8yKJqDmDk/yD5
	zx4z38ZZ0/6pzzfqwW1PcguWAy2ywbw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-i9YM-2WOMG-6GvVfyKBnNA-1; Fri, 10 Feb 2023 10:33:59 -0500
X-MC-Unique: i9YM-2WOMG-6GvVfyKBnNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FD2183394A;
	Fri, 10 Feb 2023 15:33:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64632140EBF4;
	Fri, 10 Feb 2023 15:33:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7340419465A3;
	Fri, 10 Feb 2023 15:33:41 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 78135194658F for <linux-audit@listman.corp.redhat.com>;
 Fri, 10 Feb 2023 15:33:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 69426400DB37; Fri, 10 Feb 2023 15:33:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61C57401014C
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 15:33:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41730299E758
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 15:33:40 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-448-NYSd2gobMWClJVu1nvDuIA-1; Fri, 10 Feb 2023 10:33:38 -0500
X-MC-Unique: NYSd2gobMWClJVu1nvDuIA-1
Received: by mail-pg1-f175.google.com with SMTP id n3so3937279pgr.9
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 07:33:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676043218;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6VZ+XOrSTIecQMUD2x7ocznlsT2yTW/MOJ04EsNi4t4=;
 b=J36pX3Q7mjc0sCOtz//+MLF944sBtl0JHnIpuWxYmjWnniCWOu3Z1Qeh/eMGm0ieXd
 6nEXU6uHr2ImcKPlLJ6bHRElRS+ox7FSHeqIxOv5WBMtZpgk2cVxIM6DjY8ZxgfTGfgU
 cRC75kPAvrQT9vgPE6PDex2on27HcYFtXecykrXkobbBcwHeLGh2WpErUhfjeAZr+cld
 v5amS7qNRw2R3BuuBJLwOYCx+aNBG/i9xWQJi7k89jnvqew3tFhNcIEJwgzM0EiO2y/c
 z+YYr4WTgkT1GiRHayAKBAxeuT2N1HwIeh29GoszAzL+As/WmYda/sue0JJCivY8M5I/
 Ze8g==
X-Gm-Message-State: AO0yUKVAyGs77Djxal2GBGQDgUex/Vet0fObPwmRP6m8TuSX8USaEF5O
 WFZjVOCSvwIin68XCXaG98XkkcJ3HEYjxd5MEBlKZ8VBB9SV
X-Google-Smtp-Source: AK7set8WDQ84iFNVjAJNUq6rkApsHXnccnK2E4kViJ2s5HDDWlO2HW8HTcnS2RZWy1SWIRCd7hKhkSxCJMC5kRGL8xg=
X-Received: by 2002:a62:5f02:0:b0:5a8:5247:2589 with SMTP id
 t2-20020a625f02000000b005a852472589mr1395187pfb.7.1676043217708; Fri, 10 Feb
 2023 07:33:37 -0800 (PST)
MIME-Version: 1.0
References: <b5dfdcd541115c86dbc774aa9dd502c964849c5f.1675282642.git.rgb@redhat.com>
 <Y+VrSLZKZoAGikUS@madcap2.tricolour.ca>
 <CAHC9VhTNb4gOpk9=49-ABtYs1DFKqqwXPSc-2bhJX7wcZ82o=g@mail.gmail.com>
 <13293926.uLZWGnKmhe@x2>
In-Reply-To: <13293926.uLZWGnKmhe@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 10 Feb 2023 10:33:26 -0500
Message-ID: <CAHC9VhTrzsc5bTz6uKumog0iO4LPNn1LJN5XeiHhYXhTAYVDkg@mail.gmail.com>
Subject: Re: [PATCH v2] io_uring,audit: don't log IORING_OP_MADVISE
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Christian Brauner <brauner@kernel.org>, Richard Guy Briggs <rgb@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 9, 2023 at 5:54 PM Steve Grubb <sgrubb@redhat.com> wrote:
> On Thursday, February 9, 2023 5:37:22 PM EST Paul Moore wrote:
> > On Thu, Feb 9, 2023 at 4:53 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2023-02-01 16:18, Paul Moore wrote:
> > > > On Wed, Feb 1, 2023 at 3:34 PM Richard Guy Briggs <rgb@redhat.com>
> wrote:
> > > > > fadvise and madvise both provide hints for caching or access pattern
> > > > > for file and memory respectively.  Skip them.
> > > >
> > > > You forgot to update the first sentence in the commit description :/
> > >
> > > I didn't forget.  I updated that sentence to reflect the fact that the
> > > two should be treated similarly rather than differently.
> >
> > Ooookay.  Can we at least agree that the commit description should be
> > rephrased to make it clear that the patch only adjusts madvise?  Right
> > now I read the commit description and it sounds like you are adjusting
> > the behavior for both fadvise and madvise in this patch, which is not
> > true.
> >
> > > > I'm still looking for some type of statement that you've done some
> > > > homework on the IORING_OP_MADVISE case to ensure that it doesn't end
> > > > up calling into the LSM, see my previous emails on this.  I need more
> > > > than "Steve told me to do this".
> > > >
> > > > I basically just want to see that some care and thought has gone into
> > > > this patch to verify it is correct and good.
> > >
> > > Steve suggested I look into a number of iouring ops.  I looked at the
> > > description code and agreed that it wasn't necessary to audit madvise.
> > > The rationale for fadvise was detemined to have been conflated with
> > > fallocate and subsequently dropped.  Steve also suggested a number of
> > > others and after investigation I decided that their current state was
> > > correct.  *getxattr you've advised against, so it was dropped.  It
> > > appears fewer modifications were necessary than originally suspected.
> >
> > My concern is that three of the four changes you initially proposed
> > were rejected, which gives me pause about the fourth.  You mention
> > that based on your reading of madvise's description you feel auditing
> > isn't necessary - and you may be right - but based on our experience
> > so far with this patchset I would like to hear that you have properly
> > investigated all of the madvise code paths, and I would like that in
> > the commit description.
>
> I think you're being unnecessarily hard on this.

Asking that a patch author does the proper level of due diligence to
ensure that the patch they are submitting is correct isn't being
"unnecessarily hard", it's part of being a good code reviewer and
maintainer.  I'm a bit amazed that you and Richard would rather spend
your time arguing about this rather than spending the hour (?) it
would take to verify the change and make a proper statement about the
correctness of the patch.

> Yes, the commit message
> might be touched up. But madvise is advisory in nature. It is not security
> relevant. And a grep through the security directory doesn't turn up any
> hooks.

You can't rely on grep, you need to chase the code paths to see what
code might be exercised.  For example, look at the truncate syscalls
(truncate, truncate64, ftruncate64, etc.), if you grep through the
SELinux hook code looking for some form of "truncate" you will not
find anything relevant; SELinux doesn't provide implementations for
either the security_file_truncate() or security_path_truncate() hooks.
However, if you follow the syscall code paths you will see that the
truncate syscalls end up calling security_inode_permission() which
*is* implemented in SELinux.

You need to do your homework; relying only on a gut feeling, a few
lines from a manpage, or a code comment is a good way to introduce
bugs.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CFE731D6DAA
	for <lists+linux-audit@lfdr.de>; Sun, 17 May 2020 23:52:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589752345;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5ZDR5a4pOYOmO2WdwvpORsazaKpfxsa1HJ6zu2ccTbQ=;
	b=h+zrKz5UmzFb0aiL+ccQPF362bA03NxGtO3knAiTioL6wrWLwOfVJwwuPGy5ssVdet/h6q
	GJkUWZA6v9I58ZbsTYHiqN18pB2TofO5VHuQreHkuT5QPiImzQF/D5TU+WDh+XLDB/omvP
	zH9w6SKd5/GVAWzHmYqMlyXB/FFOsCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-35AyXY44PdKXsphAeqgSPw-1; Sun, 17 May 2020 17:52:23 -0400
X-MC-Unique: 35AyXY44PdKXsphAeqgSPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 725281005510;
	Sun, 17 May 2020 21:52:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6136C5D9D7;
	Sun, 17 May 2020 21:52:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D99C81809543;
	Sun, 17 May 2020 21:52:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04HLoZrN020612 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 17 May 2020 17:50:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 204B42EF96; Sun, 17 May 2020 21:50:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BC162EF95
	for <linux-audit@redhat.com>; Sun, 17 May 2020 21:50:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28EA4811E77
	for <linux-audit@redhat.com>; Sun, 17 May 2020 21:50:33 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-275-cIrsoMilMYGUgAGL4_BqYQ-1; Sun, 17 May 2020 17:50:30 -0400
X-MC-Unique: cIrsoMilMYGUgAGL4_BqYQ-1
Received: by mail-ed1-f67.google.com with SMTP id g9so6803428edw.10
	for <linux-audit@redhat.com>; Sun, 17 May 2020 14:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BX4FoYb8Q9EUURS8yvzmijT8sCdQaCXfsixMsyCwRGM=;
	b=bOQlTVu9GiktU5pp0lEveE8gGhmQ3MLy4pJLqVwZkzn7xiNZ8mb65vzPPAwVUhcWBD
	VRoDIbK7CMp1Exx4RVzUFUl8My4Ks4KbSNBzDKJdezIKzBdccNUErwBjdVMXAa5IrYy2
	G8wXAMGRlVLjQ8N8TQylcPbYX4NZHHoQxHbopKr4YQHy+nTsL3jofwEnWdlvcmZRTyiy
	onJfOif2g40aUZrCsgTEUAUWVhiZ51Aj+BGwo7sLKKRfL3XAdh8b6ipBrkXgZUlkxPp7
	ixYq6egbyCnkX5gEFbpNTpH9B75R7XCmu0cCqMlbBOKureu3x6HRVv87j2S66fOBIJXf
	I6xg==
X-Gm-Message-State: AOAM5316tyPSHTTfuYIluhHw7j4HqhI/Bt3s8herX8+2DgBq6mZOY6JM
	+ok2gK9aYzgX0AgSrmq8NbV8hMuxmsGSsJsN/Xoy
X-Google-Smtp-Source: ABdhPJxJHZfif+YkeAZlV6VgpM2vWo43nbq0dxQ8qHlu/3zavUpgbK+2904Uk21mHW+zmAA0UbvAKzcGxZk5vfvNBUQ=
X-Received: by 2002:aa7:cb8d:: with SMTP id r13mr3078029edt.12.1589752228961; 
	Sun, 17 May 2020 14:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587500467.git.rgb@redhat.com>
	<b8ba40255978a73ea15e3859d5c945ecd5fede8e.1587500467.git.rgb@redhat.com>
	<CAHC9VhR9sNB58A8uQ4FNgAXOgVJ3RaWF4y5MAo=3mcTojaym0Q@mail.gmail.com>
	<20200517141515.qqx3jx5ulb2546tx@madcap2.tricolour.ca>
In-Reply-To: <20200517141515.qqx3jx5ulb2546tx@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 17 May 2020 17:50:17 -0400
Message-ID: <CAHC9VhQVRyJ7GRHrujW5Ri-pvBRBgFM2Y8+OYQxca1bUyv2eyg@mail.gmail.com>
Subject: Re: [PATCH ghak25 v4 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, May 17, 2020 at 10:15 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-04-28 18:25, Paul Moore wrote:
> > On Wed, Apr 22, 2020 at 5:40 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > Some table unregister actions seem to be initiated by the kernel to
> > > garbage collect unused tables that are not initiated by any userspace
> > > actions.  It was found to be necessary to add the subject credentials to
> > > cover this case to reveal the source of these actions.  A sample record:
> > >
> > >   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat family=bridge entries=0 op=unregister pid=153 uid=root auid=unset tty=(none) ses=unset subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2 exe=(null)
> >
> > [I'm going to comment up here instead of in the code because it is a
> > bit easier for everyone to see what the actual impact might be on the
> > records.]
> >
> > Steve wants subject info in this case, okay, but let's try to trim out
> > some of the fields which simply don't make sense in this record; I'm
> > thinking of fields that are unset/empty in the kernel case and are
> > duplicates of other records in the userspace/syscall case.  I think
> > that means we can drop "tty", "ses", "comm", and "exe" ... yes?
> >
> > While "auid" is a potential target for removal based on the
> > dup-or-unset criteria, I think it falls under Steve's request for
> > subject info here, even if it is garbage in this case.
>
> Can you explain why auid falls under this criteria but ses does not if
> both are unset?

"While "auid" is a potential target for removal based on the
dup-or-unset criteria, I think it falls under Steve's request for
subject info here, even if it is garbage in this case."

It's a concession to Steve.  As I mentioned previously, I think the
subject info is bogus in this case; either it is valid and we get it
from the SYSCALL record or it simply isn't present in any meaningful
way.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


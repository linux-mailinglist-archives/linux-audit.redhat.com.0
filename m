Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 83643232082
	for <lists+linux-audit@lfdr.de>; Wed, 29 Jul 2020 16:34:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-weJxnqXuM4aJrOyyGf_-SA-1; Wed, 29 Jul 2020 10:34:05 -0400
X-MC-Unique: weJxnqXuM4aJrOyyGf_-SA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 547418C3541;
	Wed, 29 Jul 2020 14:34:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AE645DA72;
	Wed, 29 Jul 2020 14:33:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A4A695A6F;
	Wed, 29 Jul 2020 14:33:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06TEXOr7024953 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 Jul 2020 10:33:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B67A82166B28; Wed, 29 Jul 2020 14:33:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB9722157F25
	for <linux-audit@redhat.com>; Wed, 29 Jul 2020 14:33:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E84080CC2A
	for <linux-audit@redhat.com>; Wed, 29 Jul 2020 14:33:18 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-230-RTG7yVj4M3uX7xv1yIfBOA-1; Wed, 29 Jul 2020 10:33:16 -0400
X-MC-Unique: RTG7yVj4M3uX7xv1yIfBOA-1
Received: by mail-ej1-f65.google.com with SMTP id w9so24561887ejc.8
	for <linux-audit@redhat.com>; Wed, 29 Jul 2020 07:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kMlKqVpMYZrkq++S2RWxZ8THr8EJ0z+y5ejuGh6soGk=;
	b=LvmXgRWjKHzFJbKU20kLZnwLyPw4B+0kHENv4FX1/Z7Vv6vlyS2FjhrwqPOq9/CGFx
	LyYGKsyj7Hyuwxm47OjSSGZgSms86AEZlVuEp6TMM4cpQsq9S5ExHcWSMvzWR4L48928
	M/qO/pSOR7+yUtjf5fD6FwBSkc7YDchXm/zyTsR0wpgJHe9boSXavKehGUYE/nvBpmi4
	2qSETPMGCsO+gnR+z9bMC6E0mH++HovPUncOtIGtppvACQ0CaTKdw8u7W9l6C0mPlK+w
	8X2j23/Dm/iqb0zsxWtNy9srPoA9YA+A93gDMZoakRqW2mDhYgL09I4yR5tL3piZrMIQ
	zKlQ==
X-Gm-Message-State: AOAM530e/plO5O0QFgm2/Y5z3ynm//t/kh+6U0XbE3rekxWC5iztRP0U
	MgxglBxCjBtKrgHGN6CjcrSt+Sqov2vR0+JEV7si
X-Google-Smtp-Source: ABdhPJxu3J7ZoN3kZhJpKA1IX3J82l3Bi86eK/HpPbP3LYDzrwmhud5SD+ftjnc27nh35GLdzF1yxpuRBb6pIis3cPs=
X-Received: by 2002:a17:906:43c9:: with SMTP id
	j9mr14520051ejn.542.1596033194870; 
	Wed, 29 Jul 2020 07:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <e3e9c9da9115fd233c5a7895dbb4a698a365b1b0.1595884394.git.rgb@redhat.com>
	<CAHC9VhSx23JiN6GprskxdEcs9uftJOp03Svh7YJbQLOV91AMiQ@mail.gmail.com>
	<20200728162722.djvy3qyclj57wsfn@madcap2.tricolour.ca>
	<CAHC9VhSDoi8QS3c6Wmx6agmmphja60cS3+aTKVx76xvdkxJ0DQ@mail.gmail.com>
	<20200729020106.x5tfijvnxdmujtbj@madcap2.tricolour.ca>
In-Reply-To: <20200729020106.x5tfijvnxdmujtbj@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 Jul 2020 10:33:03 -0400
Message-ID: <CAHC9VhSf6eSjTvUA4FfUP+qBv_GDufBPfs=t3+BPPdFcTCD_4w@mail.gmail.com>
Subject: Re: [PATCH V3fix ghak120] audit: initialize context values in case of
	mandatory events
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 28, 2020 at 10:01 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> On 2020-07-28 14:47, Paul Moore wrote:
> > On Tue, Jul 28, 2020 at 12:27 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > I know you like only really minimal fixes this late, but this seemed
> > > pretty minimal to me...
> >
> > Minimal is a one (two?) line NULL check in audit_log_name(), this
> > patch is not that.
>
> I didn't try and test that since I'm not sure that would have worked
> because there appeared to be a low non-NULL value in it.  brauer1's trace had
> 0x60 and mine had 0xd0.  Or am I missing something obvious?

Well, you mentioned the obvious already: both 0x60 and 0xd0 are not
NULL.  We already have a NULL check for context->pwd elsewhere so
there is precedence for this solving a similar problem, although
without going through the git log I'm not sure what problem that
solved, or if it was precautionary.

I agree the low value looks suspicious, it almost looks like an offset
to me, ideally it would be good to understand how/why that value is
"off'.  It could be that the audit_context is not being properly
initialized, reset, or something unrelated is clobbering the value;
all things that would be nice to know.

> The patch provided the information rather than ignoring the problem ...

I disagree.

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0B25122A4A1
	for <lists+linux-audit@lfdr.de>; Thu, 23 Jul 2020 03:33:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-pcIyMJOFNuOWm9hLtyMVjQ-1; Wed, 22 Jul 2020 21:33:51 -0400
X-MC-Unique: pcIyMJOFNuOWm9hLtyMVjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC5A1192FDA0;
	Thu, 23 Jul 2020 01:33:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC33460C05;
	Thu, 23 Jul 2020 01:33:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 852F41809557;
	Thu, 23 Jul 2020 01:33:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06N11Uc7016806 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 21:01:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AEF142089A16; Thu, 23 Jul 2020 01:01:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A994B2026D67
	for <linux-audit@redhat.com>; Thu, 23 Jul 2020 01:01:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDE008007A4
	for <linux-audit@redhat.com>; Thu, 23 Jul 2020 01:01:27 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-502-yrPWcZPjPvKg7XmdJNN6DA-1; Wed, 22 Jul 2020 21:01:23 -0400
X-MC-Unique: yrPWcZPjPvKg7XmdJNN6DA-1
Received: by mail-ej1-f65.google.com with SMTP id n22so4556696ejy.3
	for <linux-audit@redhat.com>; Wed, 22 Jul 2020 18:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NeqeFyFOYH1YWghxsvFwpUi9Twpr2Q5ltIXBAiZctzI=;
	b=BjbS5MoqV97cJLHnxAHgus9Q+hnkqdnquOXbPX+UqHYz20t8Jx2CkFPwCIJEXNnfvr
	glhaTGZqGy8fLy//RmY16P3KgwHiPEfGb8f8n7FRCSBAwCCv3F+/+LNcmy+OBveYbWSc
	asEvwoFF7yf9d9xxjwAE/GTCQXd0w36x2Rl778nzR1Mbjb1sf5hfUwO9uQFLC3MsO6+o
	j1M0syg9xBJ6KOXrHwJEuuDFvWsZPG706v+0IA3z7/vbUUyYLePGiPaNCQICKnu0Lv3Q
	QVrOIeyXUvKHB1pT87L7RGdTLNm9/CV8aiyHOlWBi8vatsp3iGx9T6h01M4nSoCXvYVX
	RQsw==
X-Gm-Message-State: AOAM532Mlw9GB9DuHGdas20wQTbERUNbID94hqFHJduw3aS2QSkYrYe+
	8MnVQMkKnjKmSg4q07c/uVkXvU3m0vhInGtSFdzc
X-Google-Smtp-Source: ABdhPJxpqRU7WP32NVBdnn4BMJbVI0H9g7ezPq7DV6fkflYsHBzVU4XWMfstYGnABqz22kf6KdmJe1EIgCNQaTJ1f3U=
X-Received: by 2002:a17:906:456:: with SMTP id
	e22mr2079266eja.178.1595466082377; 
	Wed, 22 Jul 2020 18:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <9c8f1fc6-2b8e-e9e3-37bf-2d1d6bedace1@gmail.com>
	<360c7a62-fd39-ad02-60b8-87fb18022eeb@defensec.nl>
	<CAHC9VhRGJ4EwFYpRtoHe=m_GNB6WAt3cDCf7pd4YbvydEPpy3w@mail.gmail.com>
	<CAHC9VhTbMB==FaxwUDviw9D5-M6wUGnYwwHz7wCDMYSOUw07dA@mail.gmail.com>
	<20200722020100.tigrpqzoxj6pqf52@madcap2.tricolour.ca>
In-Reply-To: <20200722020100.tigrpqzoxj6pqf52@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Jul 2020 21:01:11 -0400
Message-ID: <CAHC9VhT6A0mo4FozQV9G1+U7F=8B6ApjxonTtXXEBCnSy4ikgw@mail.gmail.com>
Subject: Re: null pointer dereference regression in 5.7
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: bauen1 <j2468h@googlemail.com>, linux-audit@redhat.com,
	Dominick Grift <dominick.grift@defensec.nl>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 21, 2020 at 10:01 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-07-21 18:45, Paul Moore wrote:
> > On Tue, Jul 21, 2020 at 6:30 PM Paul Moore <paul@paul-moore.com> wrote:
> > > Richard, you broke it, you bought it :)  Did you want to take a closer
> > > look at this?  If you can't let me know.  Based on a quick look, my
> > > gut feeling is that either context->pwd is never set properly or it is
> > > getting free'd prematurely; I'm highly suspicious of the latter but
> > > the former seems like it might be a reasonable place to start.
> >
> > Actually, yes, I'm pretty certain the problem is that context->pwd is
> > never set in this case.
>
> Does the ghak96 upstream patch in audit/next on 5.8-rc1 fix it?
>         d7481b24b816 ("audit: issue CWD record to accompany LSM_AUDIT_DATA_* records")
>
> The avc is generated by common_lsm_audit() which calls
> dump_common_audit_data() that now calls audit_getcwd() on the 5
> LSM_AUDIT_DATA_* types that deal with paths.

I would expect that it would resolve the problem being reported, which
is good, but I'm not sure it is a general solution to the problem.  I
suspect there is bigger problem of context->pwd not always having a
"safe" value when the task exits or the syscall returns to userspace.

> > Normally context->pwd would be set by a call to
> > audit_getname()/__audit_getname(), but if there audit context is a
> > dummy context, that is skipped and context->pwd is never set.
> > Normally that is fine, expect with Richard's patch if the kernel
> > explicitly calls audit_log_start() we mark the context as ... not a
> > dummy?  smart?  I'm not sure of the right term here ... which then
> > triggers all the usual logging one would expect.  In this particular
> > case, a SELinux AVC, the audit_log_start() happens *after* the
> > pathname has been resolved and the audit_getname() calls are made;
> > thus in this case context->pwd is not valid when the normal audit
> > logging takes place on exit and things explode in predictable fashion.
>
> The first two AVCs that were accompanied by syscalls had "items=0" but
> the one that blew up had "items=2" so it appears the paths were already
> present in the context, but missing the pwd.

Yes, the issue is with context->pwd, although I suppose other fields
could also be suspect.

> > Unfortunately, it is beginning to look like 1320a4052ea1 ("audit:
> > trigger accompanying records when no rules present") may be more
> > dangerous than initially thought.  I'm borderline tempted to just
> > revert this patch, but I'll leave this open for discussion ...
> > Richard, I think you need to go through the code and audit all of the
> > functions that store data in an audit context that are skipped when
> > there is a dummy context to see which fields are potentially unset,
> > and then look at all the end of task/syscall code to make sure the
> > necessary set/unset checks are in place.
>
> Auditing all the callers is not a small task, but I agree it may be
> necessary.

Do you have a rough idea as to how long it would take to chase down
all the code paths?  I'm asking not to rush you, but to figure out if
we should revert the patch now to resolve the problem and restore it
later once we are confident there are no additional issues lurking.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


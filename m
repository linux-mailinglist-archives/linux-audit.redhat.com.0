Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5611F228C40
	for <lists+linux-audit@lfdr.de>; Wed, 22 Jul 2020 00:52:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-VNApBhJCM2mwz1O5sjGAyg-1; Tue, 21 Jul 2020 18:52:45 -0400
X-MC-Unique: VNApBhJCM2mwz1O5sjGAyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F5D3800469;
	Tue, 21 Jul 2020 22:52:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9346469314;
	Tue, 21 Jul 2020 22:52:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE8A9730C9;
	Tue, 21 Jul 2020 22:52:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LMkGSs020554 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 18:46:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 076D22166B28; Tue, 21 Jul 2020 22:46:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02A692166BA0
	for <linux-audit@redhat.com>; Tue, 21 Jul 2020 22:46:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBD011832D2D
	for <linux-audit@redhat.com>; Tue, 21 Jul 2020 22:46:13 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-514-Vh2UqhyUO6G9gUL9Ps32Pg-1; Tue, 21 Jul 2020 18:46:11 -0400
X-MC-Unique: Vh2UqhyUO6G9gUL9Ps32Pg-1
Received: by mail-ej1-f66.google.com with SMTP id o18so153047eje.7
	for <linux-audit@redhat.com>; Tue, 21 Jul 2020 15:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FPBhzjyz02b+jaCaoXKegdmSvMFIabgz2Ngou9zAqVc=;
	b=RBBTznBqfraok90ylsWlbGUAzAy+A3U8whf8BZciV67MdUUlR+ad2Cadu6nZTE3eXl
	7debdykVLZaLO2IDYnTzqG0YakIkmzI3lWjUyq15jo1HRp1uYra1EKDAvZB9v2dVBN/j
	dLIEKh1LYf/LnOCioyvcECEWrAdWYVjjewYmU3OE/EszYa/MCCElLZ06sjNegAJl0Uln
	t7e9ulp3Dv2T8q4xAAdgaMYMKYvhxaM3sc+BB+4ExCm/uavGH4eGOFeRZ65R2wQD78I3
	cFUJqO6G03aXeu3caRbPhTqNltIDkY7znci2BgHA86MUEirqx1TJfRPG82i1WTe4oic1
	J/2Q==
X-Gm-Message-State: AOAM531cqIYylsvWq7sx9w7b0CKh8Ne/yEEF8GcRULSQW3sjaGKr2ckR
	8J0BFGCsGgNgSGvwoZQpXmn8hC73XSyKyvSjpLUTKvM6YA==
X-Google-Smtp-Source: ABdhPJxox8qo7b+3MfITNVksHdHIhF4hLFmvJMAQPMzzPUkcCDjZgWcFy5SNiziQGTtn/80nEGqp5Mf8jN2EJIYu63U=
X-Received: by 2002:a17:906:456:: with SMTP id
	e22mr26854084eja.178.1595371570198; 
	Tue, 21 Jul 2020 15:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <9c8f1fc6-2b8e-e9e3-37bf-2d1d6bedace1@gmail.com>
	<360c7a62-fd39-ad02-60b8-87fb18022eeb@defensec.nl>
	<CAHC9VhRGJ4EwFYpRtoHe=m_GNB6WAt3cDCf7pd4YbvydEPpy3w@mail.gmail.com>
In-Reply-To: <CAHC9VhRGJ4EwFYpRtoHe=m_GNB6WAt3cDCf7pd4YbvydEPpy3w@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 21 Jul 2020 18:45:58 -0400
Message-ID: <CAHC9VhTbMB==FaxwUDviw9D5-M6wUGnYwwHz7wCDMYSOUw07dA@mail.gmail.com>
Subject: Re: null pointer dereference regression in 5.7
To: Dominick Grift <dominick.grift@defensec.nl>,
	bauen1 <j2468h@googlemail.com>, rgb@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 21, 2020 at 6:30 PM Paul Moore <paul@paul-moore.com> wrote:
> Richard, you broke it, you bought it :)  Did you want to take a closer
> look at this?  If you can't let me know.  Based on a quick look, my
> gut feeling is that either context->pwd is never set properly or it is
> getting free'd prematurely; I'm highly suspicious of the latter but
> the former seems like it might be a reasonable place to start.

Actually, yes, I'm pretty certain the problem is that context->pwd is
never set in this case.

Normally context->pwd would be set by a call to
audit_getname()/__audit_getname(), but if there audit context is a
dummy context, that is skipped and context->pwd is never set.
Normally that is fine, expect with Richard's patch if the kernel
explicitly calls audit_log_start() we mark the context as ... not a
dummy?  smart?  I'm not sure of the right term here ... which then
triggers all the usual logging one would expect.  In this particular
case, a SELinux AVC, the audit_log_start() happens *after* the
pathname has been resolved and the audit_getname() calls are made;
thus in this case context->pwd is not valid when the normal audit
logging takes place on exit and things explode in predictable fashion.

Unfortunately, it is beginning to look like 1320a4052ea1 ("audit:
trigger accompanying records when no rules present") may be more
dangerous than initially thought.  I'm borderline tempted to just
revert this patch, but I'll leave this open for discussion ...
Richard, I think you need to go through the code and audit all of the
functions that store data in an audit context that are skipped when
there is a dummy context to see which fields are potentially unset,
and then look at all the end of task/syscall code to make sure the
necessary set/unset checks are in place.

This should be a priority.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


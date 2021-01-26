Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 34A08304991
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 21:08:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-WJGpVxBkPRSh6Rg9YIByfA-1; Tue, 26 Jan 2021 15:08:41 -0500
X-MC-Unique: WJGpVxBkPRSh6Rg9YIByfA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A549190B2AD;
	Tue, 26 Jan 2021 20:08:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE6385D97F;
	Tue, 26 Jan 2021 20:08:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FAD9180954D;
	Tue, 26 Jan 2021 20:08:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QK5oIA026985 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 15:05:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3A4261003219; Tue, 26 Jan 2021 20:05:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36732100415A
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 20:05:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF35B101A562
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 20:05:47 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-543-XXLxbNCHNJWiaOqOVr3x0A-1; Tue, 26 Jan 2021 15:05:45 -0500
X-MC-Unique: XXLxbNCHNJWiaOqOVr3x0A-1
Received: by mail-ed1-f50.google.com with SMTP id n6so21257243edt.10
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 12:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZzjmGy0oL0rvnaJhjHzvUitQdjvDnUa+214czaKdGnA=;
	b=CBLkRMFBLRqLj241ENWGmwS+lzWtQpLnYTM6W6AEOm4+xzJ91CNOjI7LV5peQuRzwy
	RQsnFJTMUoK3+SdiQSSKe/OyQ3qnphMaQRDvTv4Pj9+PUaio54b7dZO3ehbtHQL3/EgZ
	HZrjIsSL+T5ZQ61iwO0PDCB3BAb3diDEdiA+ctO65yuiqeb19VE7IhtyUtivBss/P8JQ
	TpPuH3LWAaej+UxAlDGm8X2SxdMq1gWjlxp8ARnEdKq2MYA2T1MdeAhh0GlD/j8V56lV
	aT/0k2iT2ADZPyN6xVb3X/foNgEB0bwqrHuPwZK80gISos6CK74iYlhOGud+PuyO6obJ
	QDQw==
X-Gm-Message-State: AOAM532JFyXVn/JSMwbX6kbT8Mm6cTzxIha4S8bqNcYp25zHBvmx2VZx
	CgoAOMHZZQHj/2k4WM1k+UGdFf3aA+ZTtfmuSUnIEdNk/lar
X-Google-Smtp-Source: ABdhPJyMOLOliiATOkZ4ERhtuxbTd3QWUMvRFlx9Yy9aqe0YyblGN5PjNZyYAGPRFmjGlQK0P3fD+x5QxodPBG51rsw=
X-Received: by 2002:a05:6402:54d:: with SMTP id
	i13mr5868684edx.12.1611691543921; 
	Tue, 26 Jan 2021 12:05:43 -0800 (PST)
MIME-Version: 1.0
References: <20210126164108.1958-1-casey@schaufler-ca.com>
	<20210126164108.1958-22-casey@schaufler-ca.com>
	<20210126184246.GM1762914@madcap2.tricolour.ca>
	<e9140e2a-a6ca-9d51-9db4-a0ec0dfd56cc@schaufler-ca.com>
In-Reply-To: <e9140e2a-a6ca-9d51-9db4-a0ec0dfd56cc@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 26 Jan 2021 15:05:32 -0500
Message-ID: <CAHC9VhRFQDoNwhdLf4FEJKZzrVq3a5nnAkWS373JSbabdj3Pow@mail.gmail.com>
Subject: Re: [PATCH v24 21/25] audit: add support for non-syscall auxiliary
	records
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, Richard Guy Briggs <rgb@redhat.com>,
	James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
	selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, casey.schaufler@intel.com,
	Stephen Smalley <sds@tycho.nsa.gov>
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

On Tue, Jan 26, 2021 at 1:58 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> On 1/26/2021 10:42 AM, Richard Guy Briggs wrote:
> > On 2021-01-26 08:41, Casey Schaufler wrote:
> >> Standalone audit records have the timestamp and serial number generated
> >> on the fly and as such are unique, making them standalone.  This new
> >> function audit_alloc_local() generates a local audit context that will
> >> be used only for a standalone record and its auxiliary record(s).  The
> >> context is discarded immediately after the local associated records are
> >> produced.
> >>
> >> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> >> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> >> Cc: linux-audit@redhat.com
> >> To: Richard Guy Briggs <rgb@redhat.com>
> > This has been minorly bothering me for several revisions...  Is there a
> > way for the development/authorship to be accurately reflected
> > if/when this patch is merged before the contid patch set?
>
> I don't know the right way to do that because I had to pull
> some of what was in the original patch out. Any way you would
> like it done is fine with me.

I'm not sure if there is one perfect way.  I typically see either a
"From: " line if the author is different from the submitter, or in
more complex cases such as this it seems like a simple note giving
credit in the description might be the best option.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


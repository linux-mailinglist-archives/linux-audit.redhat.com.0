Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 96F4E3205C6
	for <lists+linux-audit@lfdr.de>; Sat, 20 Feb 2021 15:45:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-s9B57l8kPriMX7yxxiq5oA-1; Sat, 20 Feb 2021 09:45:06 -0500
X-MC-Unique: s9B57l8kPriMX7yxxiq5oA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CD0C835E24;
	Sat, 20 Feb 2021 14:45:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD8E919C79;
	Sat, 20 Feb 2021 14:45:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9C209990;
	Sat, 20 Feb 2021 14:44:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11KEialh032409 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 20 Feb 2021 09:44:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 55AC7103CBB; Sat, 20 Feb 2021 14:44:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FAC8103439
	for <linux-audit@redhat.com>; Sat, 20 Feb 2021 14:44:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE7CE9291A1
	for <linux-audit@redhat.com>; Sat, 20 Feb 2021 14:44:33 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-465-dBjU8_JXN-SSKc-zW6c2dQ-1; Sat, 20 Feb 2021 09:44:31 -0500
X-MC-Unique: dBjU8_JXN-SSKc-zW6c2dQ-1
Received: by mail-ed1-f45.google.com with SMTP id z22so15828866edb.9
	for <linux-audit@redhat.com>; Sat, 20 Feb 2021 06:44:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JcH1Au1axr2FL2n0WJkJ/xnkEcygLgIq8xrE+zFFwww=;
	b=HlbS8WM56aEQr/yLMteEtdqHU8GcGMpgfLNaLMG+DfBAjn1N95yartmnN/UwUDBho/
	EVMxRZAsuzXjU/0RpIN///wQTXqIGnF5YjvI72nu3g3wL5mVpfIH3RAkaBnB+2rL6j7H
	dIKCKeOgzo2JPXz98gHxDdauDTWTtSuBZfqaJl6k0Gf356Tiav4PHH6kkK0HzqWinmYV
	BB3/MyoO/mvdPILEJu5oHX8XrIVW0u22at7dEQpqoeh1tQ+XXYxAMWa0gDxgOflEoC0h
	YWk20CUKXWlFMozRtS5cQQJAbh37OjFlFHEFvq2prnslfNgDNGITSz9+pxsG7VgMDyzN
	nv9Q==
X-Gm-Message-State: AOAM532ZHZo8++HbhIUjK/AOXVZ1gyDvN/V5SUzcturRgNxqz31wwsdC
	dEDURRwCj12d7tWuuRWShqZ7lEFwuQWWpwHl5e+M
X-Google-Smtp-Source: ABdhPJw4uzG6aOVrE1Bv5LOsRcaI3+fRj1Lk88hkXx94Q7+sJvBX8lqme6hlap+E/TVRsyXRt2DfqPOJFuxo1NhawLY=
X-Received: by 2002:a05:6402:4391:: with SMTP id
	o17mr14334079edc.196.1613832270244; 
	Sat, 20 Feb 2021 06:44:30 -0800 (PST)
MIME-Version: 1.0
References: <161377712068.87807.12246856567527156637.stgit@sifl>
	<161377734508.87807.8537642254664217815.stgit@sifl>
	<eda68a4e-f4f5-88c9-e748-1f1831f0266a@namei.org>
In-Reply-To: <eda68a4e-f4f5-88c9-e748-1f1831f0266a@namei.org>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 20 Feb 2021 09:44:19 -0500
Message-ID: <CAHC9VhRJ-CHMag-dmxDVBp0efQbj7mgGdhs2AjfWFP_kDCGTfw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] lsm: separate security_task_getsecid() into
	subjective and objective variants
To: linux-security-module@vger.kernel.org, selinux@vger.kernel.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: John Johansen <john.johansen@canonical.com>,
	James Morris <jmorris@namei.org>, linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 19, 2021 at 9:57 PM James Morris <jmorris@namei.org> wrote:
> On Fri, 19 Feb 2021, Paul Moore wrote:
> > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > index c119736ca56ac..39d501261108d 100644
> > --- a/drivers/android/binder.c
> > +++ b/drivers/android/binder.c
> > @@ -2700,7 +2700,7 @@ static void binder_transaction(struct binder_proc *proc,
> >               u32 secid;
> >               size_t added_size;
> >
> > -             security_task_getsecid(proc->tsk, &secid);
> > +             security_task_getsecid_subj(proc->tsk, &secid);
> >               ret = security_secid_to_secctx(secid, &secctx, &secctx_sz);
> >               if (ret) {
> >                       return_error = BR_FAILED_REPLY;
>
> Can someone from the Android project confirm this is correct for binder?

Yes, please take a look Android folks.  As I mentioned previously,
review of the binder changes is one area where I think some extra
review is needed; I'm just not confident enough in my understanding of
binder.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


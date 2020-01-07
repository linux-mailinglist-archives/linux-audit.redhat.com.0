Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E3CD8133770
	for <lists+linux-audit@lfdr.de>; Wed,  8 Jan 2020 00:29:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578439798;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aOGmNi1omzIWggHVxzLnVOU+zUQBXg359jUl2zw0rZY=;
	b=eqZYFNiiWKnyZy0lbW5m0gBhCKcXrju7LhwY8481+UmCEg5FseQ/RTXRME5Ldg6aYjNRW+
	F2GFAtUg1Ry34Oz8vJ67sStJZSvOn2izLW/h66H3nF6HfoFPIN1pWd3FfyI1+C2z4JFozw
	bssNoNi4YpQkNqPXmBfzBpkQ8A94CKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-JlxJFfOtMc6pSveZljKLEA-1; Tue, 07 Jan 2020 18:29:56 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76230477;
	Tue,  7 Jan 2020 23:29:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89D509A84;
	Tue,  7 Jan 2020 23:29:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E4F5D18089CD;
	Tue,  7 Jan 2020 23:29:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 007NTcgV007385 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 7 Jan 2020 18:29:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E203C2166B28; Tue,  7 Jan 2020 23:29:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD1F72166B27
	for <linux-audit@redhat.com>; Tue,  7 Jan 2020 23:29:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5A7B801E8A
	for <linux-audit@redhat.com>; Tue,  7 Jan 2020 23:29:35 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-330-dsHwKmV2M_-heOEqycdExA-1; Tue, 07 Jan 2020 18:29:31 -0500
Received: by mail-lf1-f66.google.com with SMTP id v201so989213lfa.11
	for <linux-audit@redhat.com>; Tue, 07 Jan 2020 15:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eX4eMt31053J3JdFE+ShGWEGfbhfir7YurphyQcHstI=;
	b=XFp3bZcBgx3RkKVF7g21Yxk9C8G6sPlRAohB+IJ6HsR3UWjIOYBYkxa3ZhwEzR4Y1c
	mTrp2mIIsw4/PXA/BV2ncRAzo+BWc7t2IHvjw0bSqzenAd67HGBfmvfNwyTIlCpH1vTv
	Ve5YI0vH/3pGGdaeQsCBTOiQDpLwUOxvUgC+tLSY/fakj+3Yy7hcAYtfl3NybSWIzQBh
	sRNK7r09/zhjv7KQzeDmx/CmOB64VjpPHFgEsel/K23IzOTNKLBK/tqYw4oMNJd18k1J
	doA2ecxSsuWHwmAYGbHHLmGnP0R6pvFK78y38Pnva3V36Ce+m2/1INaYc5KHKHMq3d/p
	6vRQ==
X-Gm-Message-State: APjAAAXQB0hSopUL6SDUtCYH065JUhwFvmjPeOYIb8/ysFBw+JkXhbda
	nvMsPkiwnxsH1kaX9/BEchA4Uth8ttiDAJeQQHBZQvM=
X-Google-Smtp-Source: APXvYqwvHWjGefj2Yuwi9mrdgJs4ShFuo1Uc0JXgfdyxfFBkWdG6H7oAVpavamJtKvhVDuzzuEG1NMm4hLQqsh/9AOQ=
X-Received: by 2002:a19:4f02:: with SMTP id d2mr1048391lfb.119.1578439769728; 
	Tue, 07 Jan 2020 15:29:29 -0800 (PST)
MIME-Version: 1.0
References: <2595185.DiOs4DVqks@x2>
	<CAHC9VhT28zhWmt2pNDmaLR2p6D39o3LRmVU34Ue3Z_WUNzMdcw@mail.gmail.com>
	<5079865.NZeRZbyqen@x2>
In-Reply-To: <5079865.NZeRZbyqen@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 7 Jan 2020 18:29:18 -0500
Message-ID: <CAHC9VhTX1H1bVd2uApdpgARfZFyu8hhwrpcdh61=MxXchShG3Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] audit: CONFIG_CHANGE don't log internal bookkeeping
	as an event
To: Steve Grubb <sgrubb@redhat.com>
X-MC-Unique: dsHwKmV2M_-heOEqycdExA-1
X-MC-Unique: JlxJFfOtMc6pSveZljKLEA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 007NTcgV007385
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 7, 2020 at 5:52 PM Steve Grubb <sgrubb@redhat.com> wrote:
> On Monday, January 6, 2020 8:47:33 PM EST Paul Moore wrote:
> > On Sun, Jan 5, 2020 at 10:22 AM Steve Grubb <sgrubb@redhat.com> wrote:
> > > Common Criteria calls out for any action that modifies the audit trail to
> > > be recorded. That usually is interpreted to mean insertion or removal of
> > > rules. It is not required to log modification of the inode information
> > > since the watch is still in effect. Additionally, if the rule is a never
> > > rule and the underlying file is one they do not want events for, they
> > > get an event for this bookkeeping update against their wishes.
> > >
> > > Since no device/inode info is logged at insertion and no device/inode
> > > information is logged on update, there is nothing meaningful being
> > > communicated to the admin by the CONFIG_CHANGE updated_rules event. One
> > > can assume that the rule was not "modified" because it is still watching
> > > the intended target. If the device or inode cannot be resolved, then
> > > audit_panic is called which is sufficient.
> > >
> > > I think the correct resolution is to drop logging config_update events
> > > since the watch is still in effect but just on another unknown inode.
> >
> > Either this patch is the correct resolution or it isn't, the
> > description should state that clearly.  If you are unsure we can
> > discuss it, but it sounds like you are certain that this record isn't
> > needed here, yes?
>
> It's not needed based on the rationale above and it's irritating some people
> because of that.

I didn't need you to repeat your conclusion, I needed you to rewrite
your patch description to remove the ambiguity and resubmit :)

To be clear, the phrase "I think the correct resolution ..." is the
problem; patches should be certain that their solution is correct.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


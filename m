Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 30C112F92C0
	for <lists+linux-audit@lfdr.de>; Sun, 17 Jan 2021 15:08:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-1pkOQ27NMtak3Ae3GD4qFg-1; Sun, 17 Jan 2021 09:08:15 -0500
X-MC-Unique: 1pkOQ27NMtak3Ae3GD4qFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EED10800D53;
	Sun, 17 Jan 2021 14:08:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DAF119C44;
	Sun, 17 Jan 2021 14:08:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB4EB180954D;
	Sun, 17 Jan 2021 14:07:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10HE7PKk024530 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 17 Jan 2021 09:07:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8F7E72166B2C; Sun, 17 Jan 2021 14:07:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A7342166B29
	for <linux-audit@redhat.com>; Sun, 17 Jan 2021 14:07:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 453E0101A560
	for <linux-audit@redhat.com>; Sun, 17 Jan 2021 14:07:23 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
	[209.85.218.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-21-wSaYxAEdN7ieXGy8r-xndA-1; Sun, 17 Jan 2021 09:07:20 -0500
X-MC-Unique: wSaYxAEdN7ieXGy8r-xndA-1
Received: by mail-ej1-f50.google.com with SMTP id g12so19995180ejf.8
	for <linux-audit@redhat.com>; Sun, 17 Jan 2021 06:07:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bi7JqApwHHAdyHdtOlTkMWeiLRrYz7dWVJT92xL3m1E=;
	b=rXrK225sHOQuzkyVUpJen3c0KZM7sFMcBvy5gesKdgApVSlrVWlfQaUOALVJkTaHcO
	aMGCUHfW5vSlk8IKFp7fPIW5SXaWlS16vY9ilRxZwFj4T06wqoJ+6ZCvDvbQYUqfv1eu
	ICiMZhRoVwfebo0bjjamBfvZehjl5HJbEfAYSvYENoOUeBc46eoI1E4LK2YE/YMDHLKy
	Wx2iJUpVJtwPh7OrgpEsVsZAqOsR2K/1WK0Xz1gZxNQzKlZOubLH0tD+/D/S4e0dNYXE
	wqSf9uryk7GyRjkekTJ8TzGJ2Mq5IerGn2l4hciZj2BP47PegM0TopHG6mEwQkynWT4L
	0KQw==
X-Gm-Message-State: AOAM530Fq2Yq8ck5LiqLJRTLqrCs+LFveCamJ92kkMOeEiVsIKKtfPCP
	PI2iacHDaEQLXts38eVbbQqMtZuUnZxAtqlswG7byoUHPA==
X-Google-Smtp-Source: ABdhPJyKHx/Ia1dK3R+q2HuE3YcFFjCuuNO7Ld8G9ZLMkgM03t4X8X/dwk2n7V/2tiJqhitYgCSux6j1YNZ0ghW4UA4=
X-Received: by 2002:a17:907:c01:: with SMTP id
	ga1mr14205637ejc.488.1610892439240; 
	Sun, 17 Jan 2021 06:07:19 -0800 (PST)
MIME-Version: 1.0
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<5426593.DvuYhMxLoT@x2>
	<1340951117184f479e4f5dc75766fba91ed2c085.camel@iinet.net.au>
	<2756596.e9J7NaK4W3@x2>
	<8368b5c67757f2de8f664bc2eef5f5ca153a0c87.camel@iinet.net.au>
	<b54cbdc20be119eff5c33074df8bed671ae5571f.camel@iinet.net.au>
	<c42f4c5bb88a390e9bf36b026bee0d48a169cf9d.camel@iinet.net.au>
	<20210116003558.GK2015948@madcap2.tricolour.ca>
	<bdcc07550a210ac539863ab182b6cc2dabf473e8.camel@iinet.net.au>
In-Reply-To: <bdcc07550a210ac539863ab182b6cc2dabf473e8.camel@iinet.net.au>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 17 Jan 2021 09:07:08 -0500
Message-ID: <CAHC9VhT_moHEPvkQpN6YmPYrk9KGRwsEocvkTREdjV=qtmCtFg@mail.gmail.com>
Subject: Re: Occasional delayed output of events
To: burn@swtf.dyndns.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, Linux Audit <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 15, 2021 at 9:43 PM Burn Alting <burn.alting@iinet.net.au> wrote:
> On Fri, 2021-01-15 at 19:35 -0500, Richard Guy Briggs wrote:
>> Or we go back to userspace code looking for the EOE record?  This
>> doesn't help if they arrive out of order.  Do we number the records in
>> the kernel?  N of M...
>
> I like the N of M concept but there would be a LOT of change - especially for all the non-kernel event sources. The EOE would be the most seamless, but at a cost.
> My preference is to allow the 2 second 'timer' to be configurable.

Agree with Burn, numbering the records coming up from the kernel is
going to be a real nightmare, and not something to consider lightly.
Especially when it sounds like we don't yet have a root cause for the
issue.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AB1F02B9B05
	for <lists+linux-audit@lfdr.de>; Thu, 19 Nov 2020 20:00:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-Hu3P9f5OOF6pkfWgjC5wIA-1; Thu, 19 Nov 2020 14:00:35 -0500
X-MC-Unique: Hu3P9f5OOF6pkfWgjC5wIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1826B18766FC;
	Thu, 19 Nov 2020 19:00:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D69C160843;
	Thu, 19 Nov 2020 19:00:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 136F9180954D;
	Thu, 19 Nov 2020 19:00:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AJJ0Mc4031287 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 19 Nov 2020 14:00:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 027A2DAF16; Thu, 19 Nov 2020 19:00:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0BA9DEE64
	for <linux-audit@redhat.com>; Thu, 19 Nov 2020 19:00:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB9CB8F3489
	for <linux-audit@redhat.com>; Thu, 19 Nov 2020 19:00:17 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-359-BWduFQbqPhOMwuoDhIkSig-1; Thu, 19 Nov 2020 14:00:13 -0500
X-MC-Unique: BWduFQbqPhOMwuoDhIkSig-1
Received: from mail-pg1-f199.google.com ([209.85.215.199])
	by youngberry.canonical.com with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <andreas.hasenack@canonical.com>) id 1kfpAB-0000C2-Lf
	for Linux-audit@redhat.com; Thu, 19 Nov 2020 19:00:11 +0000
Received: by mail-pg1-f199.google.com with SMTP id z130so4722260pgz.19
	for <Linux-audit@redhat.com>; Thu, 19 Nov 2020 11:00:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=TM9M+aFrVbmhCjUpLWSpiOfQDu63vPOd6I+uzdW5nq8=;
	b=MikPnzfqsbqFk4RSsr2d5kGWAoOjN24GF8GYJl6E4khA+6V4w2dufAE0BR4Er6hH3P
	cTj2oTsc4AY/7SBA7PeIG+y72L9n7QcjKB6xQQLGN00/uwKJ2Impe7UvIF+8mKw+2qci
	nIyj2Ih3T7e2JePi0R2sSKZqab/jlSMyRS6lI+fIFVMeKeuKeAV0FcOFxITwgU2UlyCE
	VGE1IDMe/knflnPkSL4v8sajMgPIMTXu1b9+ikbtUyA53zpZ9Yh7ex/Bvyz1UsQ2aVPu
	C+bAVt/DL2RbjBjD2VIlRNLKn62ImWMOLFQQmXRPCf19BqnQ3joGiRPSMMi20Dc0dgl0
	ssVA==
X-Gm-Message-State: AOAM532P2cX8+44135I/l1qVGNEVp7TZ7d7ZJb7RcvSvaSgOeoYb2Txw
	BJp3FHoZbv2KLkYKWCsmBu8SlPuZ5XS7MZ/1b32p2L0ZSEj57S2ebfgQTJ3mbJy0Yx5zi88yknW
	1K+pqkwFoYDXLEkkv5oCZUHWTbHOUJ0I7Nk6fT7rDTipA3C27IA==
X-Received: by 2002:a17:902:a504:b029:d8:ebc7:a864 with SMTP id
	s4-20020a170902a504b02900d8ebc7a864mr9803484plq.60.1605812409997;
	Thu, 19 Nov 2020 11:00:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybkas7kdAs82mDbSoq0ptVWUzb5F3uLb7x3dvPTO0GxkAYDB2mt5uuUpCsSe7qW7bhAqGFTwXMzsrFcx9aopA=
X-Received: by 2002:a17:902:a504:b029:d8:ebc7:a864 with SMTP id
	s4-20020a170902a504b02900d8ebc7a864mr9803457plq.60.1605812409702;
	Thu, 19 Nov 2020 11:00:09 -0800 (PST)
MIME-Version: 1.0
References: <CANYNYEEYUsU8BGj7E+=T=jyrkxVn1x60qipf8rvk1Oi6DPquyg@mail.gmail.com>
	<5560785.MhkbZ0Pkbq@x2>
In-Reply-To: <5560785.MhkbZ0Pkbq@x2>
From: Andreas Hasenack <andreas@canonical.com>
Date: Thu, 19 Nov 2020 15:59:58 -0300
Message-ID: <CANYNYEE1T5y9injWUjx=X300nC_GYRVW6P8WS+DLq3e1W=diLA@mail.gmail.com>
Subject: Re: -a never,exit still being logged
To: Linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On Thu, Nov 19, 2020 at 3:52 PM Steve Grubb <sgrubb@redhat.com> wrote:
>
> On Thursday, November 19, 2020 1:43:34 PM EST Andreas Hasenack wrote:
> > Why is it being logged, given that it matches the second (and last) rule I
> > have?
>
> These two events are considered kernel configuration changes. Which means that
> they do not originate via the SYSCALL rule engine. The -a never,exit
> technique works only when the event is generated as a result of other SYSCALL
> rules. Normally you would place that higher up so it matches first.
>
> In this case, what you would want to do is suppress it using the exclude
> filter:
>
> -a always,exclude -F msgtype=NETFILTER_CFG
>
> That should fix it.

I see, and I can still add auid=-1 to that one, right? Just not the exe filter?

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


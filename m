Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 81F2130CDF9
	for <lists+linux-audit@lfdr.de>; Tue,  2 Feb 2021 22:36:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-3vAxMeQYNOmqgdaqGOC8hg-1; Tue, 02 Feb 2021 16:36:40 -0500
X-MC-Unique: 3vAxMeQYNOmqgdaqGOC8hg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CFB11934103;
	Tue,  2 Feb 2021 21:36:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C63A60C5F;
	Tue,  2 Feb 2021 21:36:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8366E18095CB;
	Tue,  2 Feb 2021 21:36:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 112La1Fl016499 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 16:36:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E2C872166B2E; Tue,  2 Feb 2021 21:36:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDD402166B2D
	for <linux-audit@redhat.com>; Tue,  2 Feb 2021 21:35:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8627E1875049
	for <linux-audit@redhat.com>; Tue,  2 Feb 2021 21:35:57 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
	[209.85.218.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-428-NCpxm1L9PWSOtK9BOMzkEg-1; Tue, 02 Feb 2021 16:35:54 -0500
X-MC-Unique: NCpxm1L9PWSOtK9BOMzkEg-1
Received: by mail-ej1-f41.google.com with SMTP id i8so15829679ejc.7
	for <linux-audit@redhat.com>; Tue, 02 Feb 2021 13:35:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3W0QXjSj6WJdZVt7QsEUQadUyum+DiV55Mp+gEhAQSA=;
	b=k5DKGrMtC2l6gAEiDQDyo3fOFLMpyjRJ4cKdvBS01u0pMTbTmOcw9UD7Tw3WvUnM2Z
	bLPGPS23q2X3E+YEODbCY9YT3pgNtaYfueWdFvX/misVwdfK2v5DbgvLRWDmxwxIJ4hp
	PoGTNceCrCn1qXNjRHKMFPf3piN9KPYbxbq2TDrrQ+jvJdHNJX7QqgWIFQ2Ar0hrwYXd
	BAQ2VJYZPWXuE9WzoQhrM/kz2ZpLpGFAzshq/x3FIx62XkrlacbHSyoqywbxKvTIKO2H
	SnRqyMl9Rb4RKdFcT4F6I0RMRwih2DDAXhu7wVYwVfPuSeclvPq8WL9z4/ouTD6dm2CF
	Fv2g==
X-Gm-Message-State: AOAM531P2dm+96GPMfi8ozn52w5UXHXTJ9KKYos2t5VQNZIh1GEZcK7w
	IeVwflxNO+Np8woibxXuaCWuLjGwJxdzEdl6rxz+eRvRSpVBIaY=
X-Google-Smtp-Source: ABdhPJxMKVdU7ng8yeFfmrPNdyZcm9VSHIfKD9qQljEp7HDLPkm9J0tzuIfNrwP4xKIR4fZRaLY2dvkmvsyF+J5DC+s=
X-Received: by 2002:a17:906:35d9:: with SMTP id
	p25mr10945ejb.398.1612301753339; 
	Tue, 02 Feb 2021 13:35:53 -0800 (PST)
MIME-Version: 1.0
References: <20210202212930.18845-1-danielwa@cisco.com>
In-Reply-To: <20210202212930.18845-1-danielwa@cisco.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 2 Feb 2021 16:35:42 -0500
Message-ID: <CAHC9VhShkEJHWmuE2C_RLQy-Z3CpvAhTj68ki22v=AKF5hfvrQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] audit: show user land backtrace as part of audit
	context messages
To: Daniel Walker <danielwa@cisco.com>, Victor Kamensky <kamensky@cisco.com>
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
Cc: linux-audit@redhat.com, Ruslan Bilovol <rbilovol@cisco.com>,
	linux-kernel@vger.kernel.org, xe-linux-external@cisco.com
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

On Tue, Feb 2, 2021 at 4:29 PM Daniel Walker <danielwa@cisco.com> wrote:
> From: Victor Kamensky <kamensky@cisco.com>
>
> To efficiently find out where SELinux AVC denial is comming from
> take backtrace of user land process and display it as type=UBACKTRACE
> message that comes as audit context for SELinux AVC and other audit
> messages ...

Have you tried the new perf tracepoint for SELinux AVC decisions that
trigger an audit event?  It's a new feature for v5.10 and looks to
accomplish most of what you are looking for with this patch.

* https://www.paul-moore.com/blog/d/2020/12/linux_v510.html

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


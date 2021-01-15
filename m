Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E8C122F81B4
	for <lists+linux-audit@lfdr.de>; Fri, 15 Jan 2021 18:10:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-ISTUalB4NVS9Gb9Uaj4KtQ-1; Fri, 15 Jan 2021 12:10:25 -0500
X-MC-Unique: ISTUalB4NVS9Gb9Uaj4KtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 024EF104FB68;
	Fri, 15 Jan 2021 17:09:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C5E860C84;
	Fri, 15 Jan 2021 17:09:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 464A118095C9;
	Fri, 15 Jan 2021 17:09:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10FH971R009604 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 15 Jan 2021 12:09:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6CF602166B2C; Fri, 15 Jan 2021 17:09:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 678F72166B2A
	for <linux-audit@redhat.com>; Fri, 15 Jan 2021 17:09:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 994D6811E85
	for <linux-audit@redhat.com>; Fri, 15 Jan 2021 17:09:04 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-387-QSXtXJCfNUiBhagSTjleww-1; Fri, 15 Jan 2021 12:09:02 -0500
X-MC-Unique: QSXtXJCfNUiBhagSTjleww-1
Received: by mail-ed1-f49.google.com with SMTP id i24so10305517edj.8
	for <linux-audit@redhat.com>; Fri, 15 Jan 2021 09:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Mp/1fyTsDJMlSI/FaHpM+seifJxobeX1FXsOzUnBmcI=;
	b=dzJGPOY/xG07DYQL8H7AixVeJ8/wvr2uiEB7PAfkTFfot6qimkIexMVcvgKSWRiRwW
	lK/yb/FiMK7A7mfHEbzsJmaISdCTDjc9K2NqWkJ306HMpEJgD3zEYch+EjVeQCJoOAwO
	yOscGqXYvG8FLkRdy4MfKJtT4CFqyAYyZJKUXkq4yi+SQwxJHffwX0iJP063snjyU788
	/6mFeiHPpkcUdmulg695U/xqhU+oj2pxD2perb7nx9MZAug5vBzgwlqFH850efk+lISl
	dZU7DcYI0ibpQh4xyXrcrge3F2FzPLgPEOVJFiONrpbL072ZMQkEKf/ZsGkIIGW96Jvi
	Qkfw==
X-Gm-Message-State: AOAM533sn9/0KxUngy3p2ez6jkONGq84j72slzJsecLXujsVwfnkhjkb
	/w52oJdsApzEsmxORQtGMbe7N3RbuLUu1omedgpO
X-Google-Smtp-Source: ABdhPJyoO1QL3M4wvByKi/WWaordDVC5YXmtAdQJ4dm59pDZUzHXtm5vzSEfdB+GhAg2P04d1T8MPpgnaxA3SZUr6x4=
X-Received: by 2002:a05:6402:1bcd:: with SMTP id
	ch13mr9067292edb.31.1610730540970; 
	Fri, 15 Jan 2021 09:09:00 -0800 (PST)
MIME-Version: 1.0
References: <20210115001201.116832-1-dave@stgolabs.net>
In-Reply-To: <20210115001201.116832-1-dave@stgolabs.net>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 15 Jan 2021 12:08:50 -0500
Message-ID: <CAHC9VhS=f93bcHQMtrpvEM=aqyKFf8gjRGpM6QkOO4r2gEpuCw@mail.gmail.com>
Subject: Re: [PATCH] audit: Remove leftover reference to the audit_tasklet
To: Davidlohr Bueso <dave@stgolabs.net>
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
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org,
	Davidlohr Bueso <dbueso@suse.de>
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

On Thu, Jan 14, 2021 at 7:12 PM Davidlohr Bueso <dave@stgolabs.net> wrote:
>
> This was replaced with a kauditd_wait kthread long ago,
> back in:
>
>      b7d1125817c (AUDIT: Send netlink messages from a separate kernel thread)
>
> Update the stale comment.
>
> Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
> ---
>  kernel/audit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Nice catch.  Merged into audit/next, thanks!

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 1ffc2e059027..8fd735190c12 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2365,7 +2365,7 @@ int audit_signal_info(int sig, struct task_struct *t)
>   *
>   * We can not do a netlink send inside an irq context because it blocks (last
>   * arg, flags, is not set to MSG_DONTWAIT), so the audit buffer is placed on a
> - * queue and a tasklet is scheduled to remove them from the queue outside the
> + * queue and a kthread is scheduled to remove them from the queue outside the
>   * irq context.  May be called in any context.
>   */
>  void audit_log_end(struct audit_buffer *ab)
> --
> 2.26.2

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


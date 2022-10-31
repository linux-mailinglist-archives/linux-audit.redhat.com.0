Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D22F61348D
	for <lists+linux-audit@lfdr.de>; Mon, 31 Oct 2022 12:34:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667216095;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=waGxLRFjq3em2eLuSvxPuKb7y4Es/dKoQwztpzXip7A=;
	b=ZIOqKZB8sg6MB3VtpGX4uZLVc6jBpwkTmHfYk80PPvv8IfN5pPHbdmlaAkHjq5dflVttxg
	azWIk27P9ainH1lCbxp2BaJ5lqjfnChduPA4Q4Mfa5d/v0nekK5m6PVfN9plfB8bICemAN
	Fjd+jMHGsziDp0ZzyZDuT0YY7ZSum3U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-zlLhAHm6NYGE18CPEomOUQ-1; Mon, 31 Oct 2022 07:34:54 -0400
X-MC-Unique: zlLhAHm6NYGE18CPEomOUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50416858F13;
	Mon, 31 Oct 2022 11:34:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E467B2166B29;
	Mon, 31 Oct 2022 11:34:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C284B19465B1;
	Mon, 31 Oct 2022 11:34:48 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 71F45194658C for <linux-audit@listman.corp.redhat.com>;
 Mon, 31 Oct 2022 11:34:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5D4A81415102; Mon, 31 Oct 2022 11:34:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55310140EBF5
 for <linux-audit@redhat.com>; Mon, 31 Oct 2022 11:34:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A4B53C0F660
 for <linux-audit@redhat.com>; Mon, 31 Oct 2022 11:34:47 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-MwyHmSqAOByONZIe4qpzeg-1; Mon, 31 Oct 2022 07:34:41 -0400
X-MC-Unique: MwyHmSqAOByONZIe4qpzeg-1
Received: by mail-oo1-f46.google.com with SMTP id
 v8-20020a4ab688000000b00486ac81143fso1603870ooo.1
 for <linux-audit@redhat.com>; Mon, 31 Oct 2022 04:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+k41K4fz1GJUUJTlCyRdw9u2Z0OkSuYGQIkWIjl1WMw=;
 b=W6XPCELt6UYwLaZIMZ6NI6+AdI23pOLHrp01uBsitcvmhVlwaN70w0nyRdx/qhekYF
 wXbtdL/V5gnHt2VsWXqhoslgmO37cVJQtenN+o3VHqqprFGiHsal+X/HP0j2ZBazNUqO
 E5UmjrI+OAd3hAjha0+6cfQT/cVWp/xYP5sTkJT48uGKR73YpJt+aWXW0wRiTwtR9J5A
 wN2+/geFJ8m8LYgrkXFLOl9AqLVSWpzv39g4XDMvtP3aqAIY2PQ9C4sHI0vGdaoI/cSU
 2UOZnjbyu9Se1iUMjwkEyx9TYKGhhkQ5CzMgWStnlAr4dfPgD0tCrkd7nO4wDhCqbrnh
 szfQ==
X-Gm-Message-State: ACrzQf1Z4DNon1t4N9LQUllmbvVZGMz+er9wnfdUfqKTe3WUw3O3hDJK
 2n/lrQ+iBzPa3C0/gRDEZHzkWnjsMIYgCa+lmpVz
X-Google-Smtp-Source: AMsMyM46mFk7I9HXLYXiElO0irM3Qz7AyYbmjgvzBN6xrMuk1avsYpYfDgeS+fqVXyMjT0mYvXA7Ls9N0YSdRYq/Lzk=
X-Received: by 2002:a4a:e0c7:0:b0:49a:445e:5b38 with SMTP id
 e7-20020a4ae0c7000000b0049a445e5b38mr3163167oot.24.1667216077930; Mon, 31 Oct
 2022 04:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221031021021.3888564-1-cuigaosheng1@huawei.com>
In-Reply-To: <20221031021021.3888564-1-cuigaosheng1@huawei.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 31 Oct 2022 07:34:26 -0400
Message-ID: <CAHC9VhQ2q0rA_OtL9VZm=dMLwMKu2cME3bC2LEzTBa3A-XsQbg@mail.gmail.com>
Subject: Re: [PATCH] audit: fix undefined behavior in bit shift for AUDIT_BIT
To: Gaosheng Cui <cuigaosheng1@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: arnd@arndb.de, paulmck@kernel.org, eparis@redhat.com, dhowells@redhat.com,
 linux-audit@redhat.com, mtk.manpages@gmail.com, tglx@linutronix.de
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 30, 2022 at 10:10 PM Gaosheng Cui <cuigaosheng1@huawei.com> wrote:
>
> Shifting signed 32-bit value by 31 bits is undefined, so changing
> significant bit to unsigned. The UBSAN warning calltrace like below:
>
> UBSAN: shift-out-of-bounds in kernel/auditfilter.c:179:23
> left shift of 1 by 31 places cannot be represented in type 'int'
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x7d/0xa5
>  dump_stack+0x15/0x1b
>  ubsan_epilogue+0xe/0x4e
>  __ubsan_handle_shift_out_of_bounds+0x1e7/0x20c
>  audit_register_class+0x9d/0x137
>  audit_classes_init+0x4d/0xb8
>  do_one_initcall+0x76/0x430
>  kernel_init_freeable+0x3b3/0x422
>  kernel_init+0x24/0x1e0
>  ret_from_fork+0x1f/0x30
>  </TASK>
>
> Fixes: 607ca46e97a1 ("UAPI: (Scripted) Disintegrate include/linux")

Thanks, this patch looks good, although the 'Fixes:' line above isn't
correct.  The commit you reference may be the commit which created
AUDIT_BIT in include/uapi/linux/audit.h, but before that it was
defined in include/linux/audit.h with the original implementation
shipping in v2.6.6-rc1.  As the original AUDIT_BIT implementation
predates git itself, I would suggest removing the 'Fixes' line
entirely and I'll simply add the usual stable marking when I merge it
into audit/stable-6.1.  If that is okay with you I'll go ahead and
merge this patch which that tweak - is that okay?

> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  include/uapi/linux/audit.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index 7c1dc818b1d5..d676ed2b246e 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -187,7 +187,7 @@
>  #define AUDIT_MAX_KEY_LEN  256
>  #define AUDIT_BITMASK_SIZE 64
>  #define AUDIT_WORD(nr) ((__u32)((nr)/32))
> -#define AUDIT_BIT(nr)  (1 << ((nr) - AUDIT_WORD(nr)*32))
> +#define AUDIT_BIT(nr)  (1U << ((nr) - AUDIT_WORD(nr)*32))
>
>  #define AUDIT_SYSCALL_CLASSES 16
>  #define AUDIT_CLASS_DIR_WRITE 0
> --
> 2.25.1

--
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


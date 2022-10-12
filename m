Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE17F5FD2F2
	for <lists+linux-audit@lfdr.de>; Thu, 13 Oct 2022 03:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665625734;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tWpoa59wPKJKBhDqFVAEuGRl9wQ+N6vMoTGkGq39B0s=;
	b=KTuDxlMpuubzAwxnFas334sPrHvPah7+iKIlIeOCZ8/UlMFhjO+lA6/chzj+cXzl9YUtl2
	YOewEBpBEFbUv/dRcFysfiHWLUS4CIwOPq94aJfru+qkwukYm6UF+VoGSyhzjb6lidML9K
	DsIiw3epgXqhgrDvXOcLjSXeUClsLEA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-1F5Rqr_nM1GYvdd8bXG87A-1; Wed, 12 Oct 2022 21:48:51 -0400
X-MC-Unique: 1F5Rqr_nM1GYvdd8bXG87A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49ED8185A7AD;
	Thu, 13 Oct 2022 01:48:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A8541457F37;
	Thu, 13 Oct 2022 01:47:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2DD7C1946A4D;
	Thu, 13 Oct 2022 01:47:52 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 224A91946588 for <linux-audit@listman.corp.redhat.com>;
 Wed, 12 Oct 2022 21:22:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BC943404CD9B; Wed, 12 Oct 2022 21:22:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B564F404CDA0
 for <linux-audit@redhat.com>; Wed, 12 Oct 2022 21:22:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 949E386F12E
 for <linux-audit@redhat.com>; Wed, 12 Oct 2022 21:22:48 +0000 (UTC)
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch
 [45.157.188.10]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-90c4RBNEOgCJW5nvY8-NVw-1; Wed, 12 Oct 2022 17:22:47 -0400
X-MC-Unique: 90c4RBNEOgCJW5nvY8-NVw-1
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Mnlm41LkRzMq807;
 Wed, 12 Oct 2022 23:15:00 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
 by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Mnlm32qB4zx0;
 Wed, 12 Oct 2022 23:14:59 +0200 (CEST)
Message-ID: <00f438de-3591-1d3e-905b-1df267da8833@digikod.net>
Date: Wed, 12 Oct 2022 23:14:58 +0200
MIME-Version: 1.0
User-Agent: 
Subject: Re: [PATCH v38 02/39] LSM: Add an LSM identifier for external use
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
 paul@paul-moore.com, linux-security-module@vger.kernel.org
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-3-casey@schaufler-ca.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <20220927195421.14713-3-casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Thu, 13 Oct 2022 01:47:50 +0000
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
Cc: john.johansen@canonical.com, selinux@vger.kernel.org, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 27/09/2022 21:53, Casey Schaufler wrote:
> Add an integer member "id" to the struct lsm_id. This value is
> a unique identifier associated with each security module. The
> values are defined in a new UAPI header file. Each existing LSM
> has been updated to include it's LSMID in the lsm_id.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>   include/linux/lsm_hooks.h    |  1 +
>   include/uapi/linux/lsm.h     | 32 ++++++++++++++++++++++++++++++++
>   security/apparmor/lsm.c      |  2 ++
>   security/bpf/hooks.c         |  2 ++
>   security/commoncap.c         |  2 ++
>   security/landlock/setup.c    |  2 ++
>   security/loadpin/loadpin.c   |  2 ++
>   security/lockdown/lockdown.c |  4 +++-
>   security/safesetid/lsm.c     |  2 ++
>   security/selinux/hooks.c     |  2 ++
>   security/smack/smack_lsm.c   |  2 ++
>   security/tomoyo/tomoyo.c     |  2 ++
>   security/yama/yama_lsm.c     |  2 ++
>   13 files changed, 56 insertions(+), 1 deletion(-)
>   create mode 100644 include/uapi/linux/lsm.h
> 
> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
> index 23054881eb08..407f57aaa6ef 100644
> --- a/include/linux/lsm_hooks.h
> +++ b/include/linux/lsm_hooks.h
> @@ -1603,6 +1603,7 @@ struct security_hook_heads {
>    */
>   struct lsm_id {
>   	const char	*lsm;		/* Name of the LSM */
> +	int		id;		/* LSM ID */
>   };
>   
>   /*
> diff --git a/include/uapi/linux/lsm.h b/include/uapi/linux/lsm.h
> new file mode 100644
> index 000000000000..5647c3e220c0
> --- /dev/null
> +++ b/include/uapi/linux/lsm.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Linus Security Modules (LSM) - User space API
> + *
> + * Copyright (C) 2022 Casey Schaufler <casey@schaufler-ca.com>
> + * Copyright (C) Intel Corporation
> + */
> +
> +#ifndef _UAPI_LINUX_LSM_H
> +#define _UAPI_LINUX_LSM_H
> +
> +/*
> + * ID values to identify security modules.
> + * A system may use more than one security module.
> + *
> + * LSM_ID_XXX values 32 and below are reserved for future use

What do you have in mind? Why not "reserve" higher bits instead and 
start with SELinux at 1?


> + */
> +#define LSM_ID_INVALID		-1
> +#define LSM_ID_SELINUX		33
> +#define LSM_ID_SMACK		34
> +#define LSM_ID_TOMOYO		35
> +#define LSM_ID_IMA		36
> +#define LSM_ID_APPARMOR		37
> +#define LSM_ID_YAMA		38
> +#define LSM_ID_LOADPIN		39
> +#define LSM_ID_SAFESETID	40
> +#define LSM_ID_LOCKDOWN		41
> +#define LSM_ID_BPF		42
> +#define LSM_ID_LANDLOCK		43
> +#define LSM_ID_CAPABILITY	44

Out of curiosity, why this order?


> +
> +#endif /* _UAPI_LINUX_LSM_H */
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index b71f7d4159d7..fb6c7edd5393 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -24,6 +24,7 @@
>   #include <linux/zlib.h>
>   #include <net/sock.h>
>   #include <uapi/linux/mount.h>
> +#include <uapi/linux/lsm.h>
>   
>   #include "include/apparmor.h"
>   #include "include/apparmorfs.h"
> @@ -1204,6 +1205,7 @@ struct lsm_blob_sizes apparmor_blob_sizes __lsm_ro_after_init = {
>   
>   static struct lsm_id apparmor_lsmid __lsm_ro_after_init = {
>   	.lsm      = "apparmor",
> +	.id       = LSM_ID_APPARMOR,
>   };
>   
>   static struct security_hook_list apparmor_hooks[] __lsm_ro_after_init = {
> diff --git a/security/bpf/hooks.c b/security/bpf/hooks.c
> index e50de3abfde2..c462fc41dd57 100644
> --- a/security/bpf/hooks.c
> +++ b/security/bpf/hooks.c
> @@ -5,6 +5,7 @@
>    */
>   #include <linux/lsm_hooks.h>
>   #include <linux/bpf_lsm.h>
> +#include <uapi/linux/lsm.h>
>   
>   static struct security_hook_list bpf_lsm_hooks[] __lsm_ro_after_init = {
>   	#define LSM_HOOK(RET, DEFAULT, NAME, ...) \
> @@ -21,6 +22,7 @@ static struct security_hook_list bpf_lsm_hooks[] __lsm_ro_after_init = {
>    */
>   struct lsm_id bpf_lsmid __lsm_ro_after_init = {
>   	.lsm      = "bpf",
> +	.id       = LSM_ID_BPF,
>   };
>   
>   static int __init bpf_lsm_init(void)
> diff --git a/security/commoncap.c b/security/commoncap.c
> index dab1b5f5e6aa..4e9b140159d8 100644
> --- a/security/commoncap.c
> +++ b/security/commoncap.c
> @@ -25,6 +25,7 @@
>   #include <linux/binfmts.h>
>   #include <linux/personality.h>
>   #include <linux/mnt_idmapping.h>
> +#include <uapi/linux/lsm.h>
>   
>   /*
>    * If a non-root user executes a setuid-root binary in
> @@ -1448,6 +1449,7 @@ int cap_mmap_file(struct file *file, unsigned long reqprot,
>   
>   static struct lsm_id capability_lsmid __lsm_ro_after_init = {
>   	.lsm      = "capability",
> +	.id       = LSM_ID_CAPABILITY,
>   };
>   
>   static struct security_hook_list capability_hooks[] __lsm_ro_after_init = {
> diff --git a/security/landlock/setup.c b/security/landlock/setup.c
> index fc7b69c5839e..1242c61c9de4 100644
> --- a/security/landlock/setup.c
> +++ b/security/landlock/setup.c
> @@ -8,6 +8,7 @@
>   
>   #include <linux/init.h>
>   #include <linux/lsm_hooks.h>
> +#include <uapi/linux/lsm.h>
>   
>   #include "common.h"
>   #include "cred.h"
> @@ -25,6 +26,7 @@ struct lsm_blob_sizes landlock_blob_sizes __lsm_ro_after_init = {
>   
>   struct lsm_id landlock_lsmid __lsm_ro_after_init = {
>   	.lsm      = LANDLOCK_NAME,
> +	.id       = LSM_ID_LANDLOCK,

Please only use one space after ".id"

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


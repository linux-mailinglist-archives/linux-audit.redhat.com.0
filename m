Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A74596AAC89
	for <lists+linux-audit@lfdr.de>; Sat,  4 Mar 2023 21:55:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677963338;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NJDYbsp5uDwK2KJtca6nWIUAJjx6Nbz0T6mIIbjJhyI=;
	b=QV/VsYM3Bb61bAUei755y6mnVDfi9hK8oA/Jh7es/bWHuQM5qkOCaAh9U2UkUmvcKx0ZaR
	0fyMDxHWrYXGlm0e/bqLlbCIW44VyyMkt0FueNCixyXhiIK4Q+sz3zDSrHdu0qdjwx9Fx4
	iLS5P47yZlqqA8COFtBfJiIlGovlvkg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-nIWh61mVP068xdBxXFGRjA-1; Sat, 04 Mar 2023 15:55:36 -0500
X-MC-Unique: nIWh61mVP068xdBxXFGRjA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41AB83C0F224;
	Sat,  4 Mar 2023 20:55:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 495B11121319;
	Sat,  4 Mar 2023 20:55:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AEF2E1948642;
	Sat,  4 Mar 2023 20:55:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C722919465A0 for <linux-audit@listman.corp.redhat.com>;
 Fri,  3 Mar 2023 17:15:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9821F492C18; Fri,  3 Mar 2023 17:15:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90361492C14
 for <linux-audit@redhat.com>; Fri,  3 Mar 2023 17:15:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 704B018154DE
 for <linux-audit@redhat.com>; Fri,  3 Mar 2023 17:15:04 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-372-LEP18y3RMFy66atoSvXYgQ-1; Fri,
 03 Mar 2023 12:15:02 -0500
X-MC-Unique: LEP18y3RMFy66atoSvXYgQ-1
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 494A9412FD
 for <linux-audit@redhat.com>; Fri,  3 Mar 2023 17:15:00 +0000 (UTC)
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-172b1468431so1832272fac.10
 for <linux-audit@redhat.com>; Fri, 03 Mar 2023 09:15:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677863698;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DgYuLHBDbdAWqdmpPBV0ZgLbsqK4fpD+XI7eYMml57w=;
 b=Ark2VzS+hfuK3huCbWWNmTYjSO9Xkyo0YzakjdqmPesPiUIhwFQbNQ5kWkeaYUhK1+
 OMohSgMGike+NYEo523rHIrlLsFUxWfo2D0LjIAuUiQ/CgS5s/Yg6WzyeyOkjw9jPhwM
 g9PwLrgvJtdaHftuKy6OJCnqozo8aMDi7y0u/93KVKXQwJTWbTe48BejSTxkR5v1y5E3
 zRoxVPLAqAA/IPs0JYmTcD/F/VWdj32JY4VEsJ1EQYDTCBZyNcTaO2mjk3tWBmMfVjgI
 tnPm0GZQAuvIz8+gG+/iFXdMaOPIBaC+qKPeZfUOXasB2vhEi+oxRn0UMF739bL7IqfQ
 Pu2A==
X-Gm-Message-State: AO0yUKVfhlaNxBHKwZ2GpC5ATDOwLO0TWW2BCe/rnm388lRX3at/s7LB
 XEadjOk8tTJ5BwZOh721XDaJlHQFM8ukjoqh2KaOvEXXwGho1vClAyLqBBoU3sWgDrAkqP6QGQa
 uY7QI+Yw3r+fgIgBU573acCLBiewfhsSd5g==
X-Received: by 2002:a05:6808:2da:b0:383:f572:2646 with SMTP id
 a26-20020a05680802da00b00383f5722646mr1024919oid.5.1677863698256; 
 Fri, 03 Mar 2023 09:14:58 -0800 (PST)
X-Google-Smtp-Source: AK7set91nMG7k4hO2azPicxGrh/XawJFU9THxqJLa8ekYeoTNuviyDUD4h3iG2EGjdO8YhglzEJxMg==
X-Received: by 2002:a05:6808:2da:b0:383:f572:2646 with SMTP id
 a26-20020a05680802da00b00383f5722646mr1024907oid.5.1677863697929; 
 Fri, 03 Mar 2023 09:14:57 -0800 (PST)
Received: from ?IPv6:2804:1b3:a7c3:d46d:73b6:f440:93a4:30?
 ([2804:1b3:a7c3:d46d:73b6:f440:93a4:30])
 by smtp.gmail.com with ESMTPSA id
 bb16-20020a056808169000b00383ebc74edasm1122650oib.7.2023.03.03.09.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 09:14:57 -0800 (PST)
Message-ID: <d04cf3d047712ff7f705c3f895ea5a09b9a81211.camel@canonical.com>
Subject: Re: [PATCH v38 02/39] LSM: Add an LSM identifier for external use
From: Georgia Garcia <georgia.garcia@canonical.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com, 
 paul@paul-moore.com, linux-security-module@vger.kernel.org
Date: Fri, 03 Mar 2023 14:14:52 -0300
In-Reply-To: <20220927195421.14713-3-casey@schaufler-ca.com>
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-3-casey@schaufler-ca.com>
Organization: Canonical
User-Agent: Evolution 3.44.4-0ubuntu1
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Sat, 04 Mar 2023 20:55:24 +0000
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
Cc: john.johansen@canonical.com, keescook@chromium.org, selinux@vger.kernel.org,
 jmorris@namei.org, linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2022-09-27 at 12:53 -0700, Casey Schaufler wrote:
> Add an integer member "id" to the struct lsm_id. This value is
> a unique identifier associated with each security module. The
> values are defined in a new UAPI header file. Each existing LSM
> has been updated to include it's LSMID in the lsm_id.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>

Reviewed-by: Georgia Garcia <georgia.garcia@canonical.com>

> ---
>  include/linux/lsm_hooks.h    |  1 +
>  include/uapi/linux/lsm.h     | 32 ++++++++++++++++++++++++++++++++
>  security/apparmor/lsm.c      |  2 ++
>  security/bpf/hooks.c         |  2 ++
>  security/commoncap.c         |  2 ++
>  security/landlock/setup.c    |  2 ++
>  security/loadpin/loadpin.c   |  2 ++
>  security/lockdown/lockdown.c |  4 +++-
>  security/safesetid/lsm.c     |  2 ++
>  security/selinux/hooks.c     |  2 ++
>  security/smack/smack_lsm.c   |  2 ++
>  security/tomoyo/tomoyo.c     |  2 ++
>  security/yama/yama_lsm.c     |  2 ++
>  13 files changed, 56 insertions(+), 1 deletion(-)
>  create mode 100644 include/uapi/linux/lsm.h
> 
> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
> index 23054881eb08..407f57aaa6ef 100644
> --- a/include/linux/lsm_hooks.h
> +++ b/include/linux/lsm_hooks.h
> @@ -1603,6 +1603,7 @@ struct security_hook_heads {
>   */
>  struct lsm_id {
>  	const char	*lsm;		/* Name of the LSM */
> +	int		id;		/* LSM ID */
>  };
>  
>  /*
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
> +
> +#endif /* _UAPI_LINUX_LSM_H */
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index b71f7d4159d7..fb6c7edd5393 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -24,6 +24,7 @@
>  #include <linux/zlib.h>
>  #include <net/sock.h>
>  #include <uapi/linux/mount.h>
> +#include <uapi/linux/lsm.h>
>  
>  #include "include/apparmor.h"
>  #include "include/apparmorfs.h"
> @@ -1204,6 +1205,7 @@ struct lsm_blob_sizes apparmor_blob_sizes __lsm_ro_after_init = {
>  
>  static struct lsm_id apparmor_lsmid __lsm_ro_after_init = {
>  	.lsm      = "apparmor",
> +	.id       = LSM_ID_APPARMOR,
>  };
>  
>  static struct security_hook_list apparmor_hooks[] __lsm_ro_after_init = {
> diff --git a/security/bpf/hooks.c b/security/bpf/hooks.c
> index e50de3abfde2..c462fc41dd57 100644
> --- a/security/bpf/hooks.c
> +++ b/security/bpf/hooks.c
> @@ -5,6 +5,7 @@
>   */
>  #include <linux/lsm_hooks.h>
>  #include <linux/bpf_lsm.h>
> +#include <uapi/linux/lsm.h>
>  
>  static struct security_hook_list bpf_lsm_hooks[] __lsm_ro_after_init = {
>  	#define LSM_HOOK(RET, DEFAULT, NAME, ...) \
> @@ -21,6 +22,7 @@ static struct security_hook_list bpf_lsm_hooks[] __lsm_ro_after_init = {
>   */
>  struct lsm_id bpf_lsmid __lsm_ro_after_init = {
>  	.lsm      = "bpf",
> +	.id       = LSM_ID_BPF,
>  };
>  
>  static int __init bpf_lsm_init(void)
> diff --git a/security/commoncap.c b/security/commoncap.c
> index dab1b5f5e6aa..4e9b140159d8 100644
> --- a/security/commoncap.c
> +++ b/security/commoncap.c
> @@ -25,6 +25,7 @@
>  #include <linux/binfmts.h>
>  #include <linux/personality.h>
>  #include <linux/mnt_idmapping.h>
> +#include <uapi/linux/lsm.h>
>  
>  /*
>   * If a non-root user executes a setuid-root binary in
> @@ -1448,6 +1449,7 @@ int cap_mmap_file(struct file *file, unsigned long reqprot,
>  
>  static struct lsm_id capability_lsmid __lsm_ro_after_init = {
>  	.lsm      = "capability",
> +	.id       = LSM_ID_CAPABILITY,
>  };
>  
>  static struct security_hook_list capability_hooks[] __lsm_ro_after_init = {
> diff --git a/security/landlock/setup.c b/security/landlock/setup.c
> index fc7b69c5839e..1242c61c9de4 100644
> --- a/security/landlock/setup.c
> +++ b/security/landlock/setup.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/init.h>
>  #include <linux/lsm_hooks.h>
> +#include <uapi/linux/lsm.h>
>  
>  #include "common.h"
>  #include "cred.h"
> @@ -25,6 +26,7 @@ struct lsm_blob_sizes landlock_blob_sizes __lsm_ro_after_init = {
>  
>  struct lsm_id landlock_lsmid __lsm_ro_after_init = {
>  	.lsm      = LANDLOCK_NAME,
> +	.id       = LSM_ID_LANDLOCK,
>  };
>  
>  static int __init landlock_init(void)
> diff --git a/security/loadpin/loadpin.c b/security/loadpin/loadpin.c
> index 7e5c897ccbb2..276c8a7cd6fe 100644
> --- a/security/loadpin/loadpin.c
> +++ b/security/loadpin/loadpin.c
> @@ -20,6 +20,7 @@
>  #include <linux/string_helpers.h>
>  #include <linux/dm-verity-loadpin.h>
>  #include <uapi/linux/loadpin.h>
> +#include <uapi/linux/lsm.h>
>  
>  static void report_load(const char *origin, struct file *file, char *operation)
>  {
> @@ -197,6 +198,7 @@ static int loadpin_load_data(enum kernel_load_data_id id, bool contents)
>  
>  static struct lsm_id loadpin_lsmid __lsm_ro_after_init = {
>  	.lsm      = "loadpin",
> +	.id       = LSM_ID_LOADPIN,
>  };
>  
>  static struct security_hook_list loadpin_hooks[] __lsm_ro_after_init = {
> diff --git a/security/lockdown/lockdown.c b/security/lockdown/lockdown.c
> index 2af4bff8d101..3d3347f3dbd1 100644
> --- a/security/lockdown/lockdown.c
> +++ b/security/lockdown/lockdown.c
> @@ -13,6 +13,7 @@
>  #include <linux/security.h>
>  #include <linux/export.h>
>  #include <linux/lsm_hooks.h>
> +#include <uapi/linux/lsm.h>
>  
>  static enum lockdown_reason kernel_locked_down;
>  
> @@ -76,7 +77,8 @@ static struct security_hook_list lockdown_hooks[] __lsm_ro_after_init = {
>  };
>  
>  static struct lsm_id lockdown_lsmid __lsm_ro_after_init = {
> -	.lsm     = "lockdown",
> +	.lsm      = "lockdown",
> +	.id       = LSM_ID_LOCKDOWN,
>  };
>  
>  static int __init lockdown_lsm_init(void)
> diff --git a/security/safesetid/lsm.c b/security/safesetid/lsm.c
> index 3a94103f3c5b..88002731e603 100644
> --- a/security/safesetid/lsm.c
> +++ b/security/safesetid/lsm.c
> @@ -19,6 +19,7 @@
>  #include <linux/ptrace.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/security.h>
> +#include <uapi/linux/lsm.h>
>  #include "lsm.h"
>  
>  /* Flag indicating whether initialization completed */
> @@ -263,6 +264,7 @@ static int safesetid_task_fix_setgroups(struct cred *new, const struct cred *old
>  
>  static struct lsm_id safesetid_lsmid __lsm_ro_after_init = {
>  	.lsm      = "safesetid",
> +	.id       = LSM_ID_SAFESETID,
>  };
>  
>  static struct security_hook_list safesetid_security_hooks[] = {
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 5e4938f3ce11..9803bbbc6747 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -92,6 +92,7 @@
>  #include <linux/fsnotify.h>
>  #include <linux/fanotify.h>
>  #include <linux/io_uring.h>
> +#include <uapi/linux/lsm.h>
>  
>  #include "avc.h"
>  #include "objsec.h"
> @@ -7014,6 +7015,7 @@ static int selinux_uring_cmd(struct io_uring_cmd *ioucmd)
>  
>  static struct lsm_id selinux_lsmid __lsm_ro_after_init = {
>  	.lsm      = "selinux",
> +	.id       = LSM_ID_SELINUX,
>  };
>  
>  /*
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 5d8bc13feb09..2a88b4e7669e 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -43,6 +43,7 @@
>  #include <linux/fs_parser.h>
>  #include <linux/watch_queue.h>
>  #include <linux/io_uring.h>
> +#include <uapi/linux/lsm.h>
>  #include "smack.h"
>  
>  #define TRANS_TRUE	"TRUE"
> @@ -4776,6 +4777,7 @@ struct lsm_blob_sizes smack_blob_sizes __lsm_ro_after_init = {
>  
>  static struct lsm_id smack_lsmid __lsm_ro_after_init = {
>  	.lsm      = "smack",
> +	.id       = LSM_ID_SMACK,
>  };
>  
>  static struct security_hook_list smack_hooks[] __lsm_ro_after_init = {
> diff --git a/security/tomoyo/tomoyo.c b/security/tomoyo/tomoyo.c
> index 38342c1fa4bc..71eab206ba6e 100644
> --- a/security/tomoyo/tomoyo.c
> +++ b/security/tomoyo/tomoyo.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/lsm_hooks.h>
> +#include <uapi/linux/lsm.h>
>  #include "common.h"
>  
>  /**
> @@ -532,6 +533,7 @@ static void tomoyo_task_free(struct task_struct *task)
>  
>  static struct lsm_id tomoyo_lsmid __lsm_ro_after_init = {
>  	.lsm      = "tomoyo",
> +	.id       = LSM_ID_TOMOYO,
>  };
>  
>  /*
> diff --git a/security/yama/yama_lsm.c b/security/yama/yama_lsm.c
> index ed6d45e62e0d..b178d74bb00b 100644
> --- a/security/yama/yama_lsm.c
> +++ b/security/yama/yama_lsm.c
> @@ -18,6 +18,7 @@
>  #include <linux/task_work.h>
>  #include <linux/sched.h>
>  #include <linux/spinlock.h>
> +#include <uapi/linux/lsm.h>
>  
>  #define YAMA_SCOPE_DISABLED	0
>  #define YAMA_SCOPE_RELATIONAL	1
> @@ -423,6 +424,7 @@ static int yama_ptrace_traceme(struct task_struct *parent)
>  
>  static struct lsm_id yama_lsmid __lsm_ro_after_init = {
>  	.lsm      = "yama",
> +	.id       = LSM_ID_YAMA,
>  };
>  
>  static struct security_hook_list yama_hooks[] __lsm_ro_after_init = {

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


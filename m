Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CCF5FD2EF
	for <lists+linux-audit@lfdr.de>; Thu, 13 Oct 2022 03:48:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665625733;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DnAZvNCAM6WcYigBDYNr4D3Gx7btNxtFo/KGyDmR4DE=;
	b=i9Ih7ipXHe3vnyPLwII870RBrKztIoX6u0Y1SqexTwPgJw6GOuhOZKPGm8VMv26P13FHMz
	NZfSN9eNiziK0to10wIY84Qem+d6lUhs1j2EwbtxDYM8ieGJebcTeK0zTcLoAitiT8RusE
	6Z/XnLDnC+1t1E8LGZ9IuIdXDt6yVkk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-4kBlnAlRPyOkKLDwMoT9GA-1; Wed, 12 Oct 2022 21:48:51 -0400
X-MC-Unique: 4kBlnAlRPyOkKLDwMoT9GA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67DE780600C;
	Thu, 13 Oct 2022 01:48:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C243492B10;
	Thu, 13 Oct 2022 01:47:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1568E1946A43;
	Thu, 13 Oct 2022 01:47:51 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C54941946588 for <linux-audit@listman.corp.redhat.com>;
 Wed, 12 Oct 2022 21:27:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 73E71414A818; Wed, 12 Oct 2022 21:27:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CECD414A809
 for <linux-audit@redhat.com>; Wed, 12 Oct 2022 21:27:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B7D9803D4A
 for <linux-audit@redhat.com>; Wed, 12 Oct 2022 21:27:50 +0000 (UTC)
Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch
 [83.166.143.168]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-354-L5vtMa3jOlitIvgtEmOp9g-1; Wed, 12 Oct 2022 17:27:48 -0400
X-MC-Unique: L5vtMa3jOlitIvgtEmOp9g-1
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4MnlsP3w5jzMq2xd;
 Wed, 12 Oct 2022 23:19:37 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
 by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4MnlsN2gQzzMpnPh;
 Wed, 12 Oct 2022 23:19:36 +0200 (CEST)
Message-ID: <ecfb35c0-147c-52c8-b733-7ab753c152ea@digikod.net>
Date: Wed, 12 Oct 2022 23:19:35 +0200
MIME-Version: 1.0
User-Agent: 
Subject: Re: [PATCH v38 20/39] LSM: Specify which LSM to display
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
 paul@paul-moore.com, linux-security-module@vger.kernel.org
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-21-casey@schaufler-ca.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <20220927195421.14713-21-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 27/09/2022 21:54, Casey Schaufler wrote:
> Create two new prctl() options PR_LSM_ATTR_SET and PR_LSM_ATTR_GET
> which change and report the Interface LSM respectively.
> 
> The LSM ID number of an active LSM that supplies hooks for
> human readable data may be passed in the arg2 value with the
> PR_LSM_ATTR_SET option. The PR_LSM_ATT_GET option returns the
> LSM ID currently in use. At this point there can only be one LSM
> capable of display active. A helper function lsm_task_ilsm() is
> provided to get the interface lsm slot for a task_struct.
> 
> Security modules that wish to restrict this action may provide
> a task_prctl hook to do so. Each such security module is
> responsible for defining its policy.
> 
> AppArmor hook initially provided by John Johansen
> <john.johansen@canonical.com>. SELinux hook initially provided by
> Stephen Smalley <stephen.smalley.work@gmail.com>
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---

[...]

> diff --git a/security/security.c b/security/security.c
> index 80133d6e982c..43d2431dbda0 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -28,6 +28,7 @@
>   #include <linux/backing-dev.h>
>   #include <linux/string.h>
>   #include <linux/msg.h>
> +#include <linux/prctl.h>
>   #include <uapi/linux/lsm.h>
>   #include <net/flow.h>
>   #include <net/sock.h>
> @@ -81,7 +82,16 @@ static struct kmem_cache *lsm_file_cache;
>   static struct kmem_cache *lsm_inode_cache;
>   
>   char *lsm_names;
> -static struct lsm_blob_sizes blob_sizes __lsm_ro_after_init;
> +
> +/*
> + * The task blob includes the "interface_lsm" slot used for
> + * chosing which module presents contexts.
> + * Using a long to avoid potential alignment issues with
> + * module assigned task blobs.
> + */
> +static struct lsm_blob_sizes blob_sizes __lsm_ro_after_init = {
> +	.lbs_task = sizeof(long),
> +};
>   
>   /* Boot-time LSM user choice */
>   static __initdata const char *chosen_lsm_order;
> @@ -691,6 +701,8 @@ int lsm_inode_alloc(struct inode *inode)
>    */
>   static int lsm_task_alloc(struct task_struct *task)
>   {
> +	int *ilsm;
> +
>   	if (blob_sizes.lbs_task == 0) {
>   		task->security = NULL;
>   		return 0;
> @@ -699,6 +711,15 @@ static int lsm_task_alloc(struct task_struct *task)
>   	task->security = kzalloc(blob_sizes.lbs_task, GFP_KERNEL);
>   	if (task->security == NULL)
>   		return -ENOMEM;
> +
> +	/*
> +	 * The start of the task blob contains the "interface" LSM slot number.
> +	 * Start with it set to the invalid slot number, indicating that the
> +	 * default first registered LSM be displayed.
> +	 */
> +	ilsm = task->security;
> +	*ilsm = LSMBLOB_INVALID;
> +
>   	return 0;
>   }
>   
> @@ -1765,14 +1786,26 @@ int security_file_open(struct file *file)
>   
>   int security_task_alloc(struct task_struct *task, unsigned long clone_flags)
>   {
> +	int *oilsm = current->security;
> +	int *nilsm;
>   	int rc = lsm_task_alloc(task);
>   
> -	if (rc)
> +	if (unlikely(rc))
>   		return rc;
> +
>   	rc = call_int_hook(task_alloc, 0, task, clone_flags);
> -	if (unlikely(rc))
> +	if (unlikely(rc)) {
>   		security_task_free(task);
> -	return rc;
> +		return rc;
> +	}
> +
> +	if (oilsm) {
> +		nilsm = task->security;
> +		if (nilsm)
> +			*nilsm = *oilsm;
> +	}
> +
> +	return 0;
>   }
>   
>   void security_task_free(struct task_struct *task)
> @@ -2031,10 +2064,15 @@ int security_task_kill(struct task_struct *p, struct kernel_siginfo *info,
>   int security_task_prctl(int option, unsigned long arg2, unsigned long arg3,
>   			 unsigned long arg4, unsigned long arg5)
>   {
> +	int *ilsm = current->security;
>   	int thisrc;
> +	int slot;
>   	int rc = LSM_RET_DEFAULT(task_prctl);
>   	struct security_hook_list *hp;
>   
> +	if (lsm_slot == 0)
> +		return -EINVAL;
> +
>   	hlist_for_each_entry(hp, &security_hook_heads.task_prctl, list) {
>   		thisrc = hp->hook.task_prctl(option, arg2, arg3, arg4, arg5);
>   		if (thisrc != LSM_RET_DEFAULT(task_prctl)) {
> @@ -2043,6 +2081,25 @@ int security_task_prctl(int option, unsigned long arg2, unsigned long arg3,
>   				break;
>   		}
>   	}
> +
> +	switch (option) {
> +	case PR_LSM_ATTR_SET:
> +		if (rc && rc != LSM_RET_DEFAULT(task_prctl))
> +			return rc;
> +		for (slot = 0; slot < lsm_slot; slot++)
> +			if (lsm_slotlist[slot]->id == arg2) {

This doesn't build if LSMBLOB_ENTRIES == 0


> +				*ilsm = lsm_slotlist[slot]->slot;
> +				return 0;
> +			}
> +		return -EINVAL;
> +	case PR_LSM_ATTR_GET:
> +		if (rc && rc != LSM_RET_DEFAULT(task_prctl))
> +			return rc;
> +		if (*ilsm != LSMBLOB_INVALID)
> +			return lsm_slotlist[*ilsm]->id;
> +		return lsm_slotlist[0]->id;
> +	}
> +
>   	return rc;
>   }
>   

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


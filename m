Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DE35FD2F3
	for <lists+linux-audit@lfdr.de>; Thu, 13 Oct 2022 03:48:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665625736;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cPCeC7flQH1FFyFLCNejzAWYo4kF8Rrx+812YLjMZWk=;
	b=SkQhkepT1H7Q7GmYGD16Knfr7flqq3BVIPRUGpvLPB9dCZ9PAzsdwZs8ZTbmVIHuU9CexN
	7+NkcCTp+7ETwM7WcbrqNvD147POXrW4BcZng3om9wwvVRkABwumWLGzPIdtut3seyEFYj
	gzMES5mkLuJytNVoe697fTqoLbQtFlg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-NwWdZm7AMOaguYQKznwQkA-1; Wed, 12 Oct 2022 21:48:53 -0400
X-MC-Unique: NwWdZm7AMOaguYQKznwQkA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 754A6858F13;
	Thu, 13 Oct 2022 01:48:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F887C2C8C7;
	Thu, 13 Oct 2022 01:47:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9CD3519465A3;
	Thu, 13 Oct 2022 01:47:50 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1FF501946588 for <linux-audit@listman.corp.redhat.com>;
 Wed, 12 Oct 2022 21:19:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C406940449E0; Wed, 12 Oct 2022 21:19:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCA9540449E8
 for <linux-audit@redhat.com>; Wed, 12 Oct 2022 21:19:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1D6E1C05AF3
 for <linux-audit@redhat.com>; Wed, 12 Oct 2022 21:19:55 +0000 (UTC)
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch
 [185.125.25.12]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-UdcrdswAO-yv2cT14fUUqg-1; Wed, 12 Oct 2022 17:19:52 -0400
X-MC-Unique: UdcrdswAO-yv2cT14fUUqg-1
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Mnlsf5j9vzMq66Y;
 Wed, 12 Oct 2022 23:19:50 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
 by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Mnlsd6018zMppr6;
 Wed, 12 Oct 2022 23:19:49 +0200 (CEST)
Message-ID: <13ab134b-e7a9-fe3f-a05a-7cece1d52403@digikod.net>
Date: Wed, 12 Oct 2022 23:19:49 +0200
MIME-Version: 1.0
User-Agent: 
Subject: Re: [PATCH v38 39/39] LSM: Create lsm_module_list system call
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
 paul@paul-moore.com, linux-security-module@vger.kernel.org
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927203155.15060-1-casey@schaufler-ca.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <20220927203155.15060-1-casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: john.johansen@canonical.com, Arnd Bergmann <arnd@arndb.de>,
 selinux@vger.kernel.org, linux-api@vger.kernel.org, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 27/09/2022 22:31, Casey Schaufler wrote:
> Create a system call to report the list of Linux Security Modules
> that are active on the system. The list is provided as an array
> of LSM ID numbers.

With lsm_self_attr(), this would look like a dir/file structure.

Would it be useful for user space to list all the currently used LSMs 
instead of only retrieving information about a known (list of) LSM?
What is the use case for this syscall?


> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>   arch/x86/entry/syscalls/syscall_64.tbl |  1 +
>   include/linux/syscalls.h               |  1 +
>   include/uapi/asm-generic/unistd.h      |  5 ++-
>   kernel/sys_ni.c                        |  1 +
>   security/lsm_syscalls.c                | 50 ++++++++++++++++++++++++++
>   5 files changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
> index 56d5c5202fd0..40b35e7069a7 100644
> --- a/arch/x86/entry/syscalls/syscall_64.tbl
> +++ b/arch/x86/entry/syscalls/syscall_64.tbl
> @@ -373,6 +373,7 @@
>   449	common	futex_waitv		sys_futex_waitv
>   450	common	set_mempolicy_home_node	sys_set_mempolicy_home_node
>   451	common	lsm_self_attr		sys_lsm_self_attr
> +452	common	lsm_module_list		sys_lsm_module_list

As for the other syscall, this should also be in the same dedicated 
"wire syscalls" patch.


>   
>   #
>   # Due to a historical design error, certain syscalls are numbered differently
> diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
> index 7f87ef8be546..e2e2a9e93e8c 100644
> --- a/include/linux/syscalls.h
> +++ b/include/linux/syscalls.h
> @@ -1057,6 +1057,7 @@ asmlinkage long sys_set_mempolicy_home_node(unsigned long start, unsigned long l
>   					    unsigned long home_node,
>   					    unsigned long flags);
>   asmlinkage long sys_lsm_self_attr(struct lsm_ctx *ctx, size_t *size, int flags);
> +asmlinkage long sys_lsm_module_list(unsigned int *ids, size_t *size, int flags);
>   
>   /*
>    * Architecture-specific system calls
> diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
> index aa66718e1b48..090617a9a53a 100644
> --- a/include/uapi/asm-generic/unistd.h
> +++ b/include/uapi/asm-generic/unistd.h
> @@ -889,8 +889,11 @@ __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
>   #define __NR_lsm_self_attr 451
>   __SYSCALL(__NR_lsm_self_attr, sys_lsm_self_attr)
>   
> +#define __NR_lsm_module_list 452
> +__SYSCALL(__NR_lsm_module_list, sys_lsm_module_list)
> +
>   #undef __NR_syscalls
> -#define __NR_syscalls 452
> +#define __NR_syscalls 453

Same here.


>   
>   /*
>    * 32 bit systems traditionally used different
> diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
> index 0fdb0341251d..bde9e74a3473 100644
> --- a/kernel/sys_ni.c
> +++ b/kernel/sys_ni.c
> @@ -264,6 +264,7 @@ COND_SYSCALL(mremap);
>   
>   /* security/lsm_syscalls.c */
>   COND_SYSCALL(lsm_self_attr);
> +COND_SYSCALL(lsm_module_list);
>   
>   /* security/keys/keyctl.c */
>   COND_SYSCALL(add_key);
> diff --git a/security/lsm_syscalls.c b/security/lsm_syscalls.c
> index da0fab7065e2..41d9ef945ede 100644
> --- a/security/lsm_syscalls.c
> +++ b/security/lsm_syscalls.c
> @@ -154,3 +154,53 @@ SYSCALL_DEFINE3(lsm_self_attr,
>   	kfree(final);
>   	return rc;
>   }
> +
> +/**
> + * lsm_module_list - Return a list of the active security modules
> + * @ids: the LSM module ids
> + * @size: size of @ids, updated on return
> + * @flags: reserved for future use, must be zero
> + *
> + * Returns a list of the active LSM ids. On success this function
> + * returns the number of @ids array elements. This value may be zero
> + * if there are no LSMs active. If @size is insufficient to contain
> + * the return data -E2BIG is returned and @size is set to the minimum
> + * required size. In all other cases a negative value indicating the
> + * error is returned.
> + */
> +SYSCALL_DEFINE3(lsm_module_list,
> +	       unsigned int __user *, ids,
> +	       size_t __user *, size,
> +	       int, flags)
> +{
> +	unsigned int *interum;
> +	size_t total_size = lsm_id * sizeof(*interum);
> +	size_t usize;
> +	int rc;
> +	int i;
> +
> +	if (get_user(usize, size))
> +		return -EFAULT;
> +
> +	if (usize < total_size) {
> +		if (put_user(total_size, size) != 0)
> +			return -EFAULT;
> +		return -E2BIG;
> +	}
> +
> +	interum = kzalloc(total_size, GFP_KERNEL);
> +	if (interum == NULL)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < lsm_id; i++)
> +		interum[i] = lsm_idlist[i]->id;
> +
> +	if (copy_to_user(ids, interum, total_size) != 0 ||
> +	    put_user(total_size, size) != 0)
> +		rc = -EFAULT;
> +	else
> +		rc = lsm_id;
> +
> +	kfree(interum);
> +	return rc;
> +}

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


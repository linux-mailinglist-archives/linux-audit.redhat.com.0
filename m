Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E6E682E71
	for <lists+linux-audit@lfdr.de>; Tue, 31 Jan 2023 14:51:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675173108;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YlzG8maf60mQ40ECAcs7ag5seo8J3/s3501jqP8UXJY=;
	b=fEyooEA3R/oS2/nwiLunJkoA206fND6/Vxrmz9u05gjIJr9nD/BtraYm6ZCxc6zq6IsaBN
	+Hn3Q0Ww8/xj+08chvBUtzBGwMSBN/aooLI86kfSOoBeaifhbjZ7avM80M1kpa88SQ/nsd
	vp0FuMgO3bbbDf9XqPUIp6t3qvimkqw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-si1VCK4bN_O_bv1XlQIJwg-1; Tue, 31 Jan 2023 08:51:45 -0500
X-MC-Unique: si1VCK4bN_O_bv1XlQIJwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E070100DECE;
	Tue, 31 Jan 2023 13:51:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62F9B140EBF4;
	Tue, 31 Jan 2023 13:51:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C97DE1946A52;
	Tue, 31 Jan 2023 13:51:29 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 16D341946589 for <linux-audit@listman.corp.redhat.com>;
 Tue, 31 Jan 2023 12:52:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EF33F40444C0; Tue, 31 Jan 2023 12:52:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E733240C2064
 for <linux-audit@redhat.com>; Tue, 31 Jan 2023 12:52:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C782785A5A3
 for <linux-audit@redhat.com>; Tue, 31 Jan 2023 12:52:29 +0000 (UTC)
Received: from frasgout13.his.huawei.com (frasgout13.his.huawei.com
 [14.137.139.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-EVi4e6h3MHatMyqGTMTpvw-1; Tue, 31 Jan 2023 07:52:27 -0500
X-MC-Unique: EVi4e6h3MHatMyqGTMTpvw-1
Received: from mail02.huawei.com (unknown [172.18.147.229])
 by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4P5l9Z5l7Cz9xGmr;
 Tue, 31 Jan 2023 20:44:18 +0800 (CST)
Received: from roberto-ThinkStation-P620 (unknown [10.204.63.22])
 by APP1 (Coremail) with SMTP id LxC2BwCXHwvlDtljpffgAA--.10854S2;
 Tue, 31 Jan 2023 13:52:02 +0100 (CET)
Message-ID: <412da9a9da2e75e896911f01bfd735dd4b5789f4.camel@huaweicloud.com>
Subject: Re: [RFC PATCH v9 06/16] ipe: add LSM hooks on execution and kernel
 read
From: Roberto Sassu <roberto.sassu@huaweicloud.com>
To: Fan Wu <wufan@linux.microsoft.com>, corbet@lwn.net, zohar@linux.ibm.com,
 jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, ebiggers@kernel.org, 
 axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, eparis@redhat.com, 
 paul@paul-moore.com
Date: Tue, 31 Jan 2023 13:51:39 +0100
In-Reply-To: <1675119451-23180-7-git-send-email-wufan@linux.microsoft.com>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-7-git-send-email-wufan@linux.microsoft.com>
User-Agent: Evolution 3.36.5-0ubuntu1
MIME-Version: 1.0
X-CM-TRANSID: LxC2BwCXHwvlDtljpffgAA--.10854S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WrW8XF13Jry8Aw4DGF4xCrg_yoWfXw18pF
 9xJ3ZxGrWDXF9a9r1xJa1UuanxK395Kr4UW3sxWFy8AanFqr10kr1aqF17ZFW5Grn5t3ZY
 v3W2vr42g34qyrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxV
 AFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
 6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
 7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
 AIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
 aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07UZ18PUUUUU=
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAQAOBF1jj4hR2wAAs4
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Tue, 31 Jan 2023 13:51:24 +0000
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
Cc: dm-devel@redhat.com, linux-doc@vger.kernel.org,
 Deven Bowers <deven.desai@linux.microsoft.com>, roberto.sassu@huawei.com,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-audit@redhat.com, linux-integrity@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2023-01-30 at 14:57 -0800, Fan Wu wrote:
> From: Deven Bowers <deven.desai@linux.microsoft.com>
> 
> IPE's initial goal is to control both execution and the loading of
> kernel modules based on the system's definition of trust. It
> accomplishes this by plugging into the security hooks for
> bprm_check_security, file_mprotect, mmap_file, kernel_load_data,
> and kernel_read_data.
> 
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
> ---
> v2:
>   + Split evaluation loop, access control hooks,
>     and evaluation loop from policy parser and userspace
>     interface to pass mailing list character limit
> 
> v3:
>   + Move ipe_load_properties to patch 04.
>   + Remove useless 0-initializations
>   + Prefix extern variables with ipe_
>   + Remove kernel module parameters, as these are
>     exposed through sysctls.
>   + Add more prose to the IPE base config option
>     help text.
>   + Use GFP_KERNEL for audit_log_start.
>   + Remove unnecessary caching system.
>   + Remove comments from headers
>   + Use rcu_access_pointer for rcu-pointer null check
>   + Remove usage of reqprot; use prot only.
>   + Move policy load and activation audit event to 03/12
> 
> v4:
>   + Remove sysctls in favor of securityfs nodes
>   + Re-add kernel module parameters, as these are now
>     exposed through securityfs.
>   + Refactor property audit loop to a separate function.
> 
> v5:
>   + fix minor grammatical errors
>   + do not group rule by curly-brace in audit record,
>     reconstruct the exact rule.
> 
> v6:
>   + No changes
> 
> v7:
>   + Further split lsm creation, the audit system, the evaluation loop
>     and access control hooks into separate commits.
> 
> v8:
>   + Rename hook functions to follow the lsmname_hook_name convention
>   + Remove ipe_hook enumeration, can be derived from correlation with
>     syscall audit record.
> 
> v9:
>   + Minor changes for adapting to the new parser
> ---
>  security/ipe/hooks.c | 169 +++++++++++++++++++++++++++++++++++++++++++
>  security/ipe/hooks.h |  13 ++++
>  security/ipe/ipe.c   |   6 ++
>  3 files changed, 188 insertions(+)
> 
> diff --git a/security/ipe/hooks.c b/security/ipe/hooks.c
> index 335b773c7ae1..fd5109e29c76 100644
> --- a/security/ipe/hooks.c
> +++ b/security/ipe/hooks.c
> @@ -23,3 +23,172 @@ void ipe_sb_free_security(struct super_block *mnt_sb)
>  {
>  	ipe_invalidate_pinned_sb(mnt_sb);
>  }
> +
> +/**
> + * ipe_bprm_check_security - ipe security hook function for bprm check.
> + * @bprm: Supplies a pointer to a linux_binprm structure to source the file
> + *	  being evaluated.
> + *
> + * This LSM hook is called when a binary is loaded through the exec
> + * family of system calls.
> + * Return:
> + * *0	- OK
> + * *!0	- Error
> + */
> +int ipe_bprm_check_security(struct linux_binprm *bprm)
> +{
> +	struct ipe_eval_ctx ctx = { 0 };
> +
> +	build_eval_ctx(&ctx, bprm->file, ipe_op_exec);
> +	return ipe_evaluate_event(&ctx);
> +}
> +
> +/**
> + * ipe_mmap_file - ipe security hook function for mmap check.
> + * @f: File being mmap'd. Can be NULL in the case of anonymous memory.
> + * @reqprot: The requested protection on the mmap, passed from usermode.
> + * @prot: The effective protection on the mmap, resolved from reqprot and
> + *	  system configuration.
> + * @flags: Unused.
> + *
> + * This hook is called when a file is loaded through the mmap
> + * family of system calls.
> + *
> + * Return:
> + * * 0	- OK
> + * * !0	- Error
> + */
> +int ipe_mmap_file(struct file *f, unsigned long reqprot, unsigned long prot,
> +		  unsigned long flags)
> +{
> +	struct ipe_eval_ctx ctx = { 0 };
> +
> +	if (prot & PROT_EXEC || reqprot & PROT_EXEC) {

Since the kernel only adds flags and doesn't clear them, isn't safe to
just consider prot? Oh, you mentioned it in the changelog, maybe just
for ipe_file_mprotect().

> +		build_eval_ctx(&ctx, f, ipe_op_exec);
> +		return ipe_evaluate_event(&ctx);
> +	}

Uhm, I think some considerations that IMA does for mmap() are relevant
also for IPE.

For example, look at mmap_violation_check(). It checks if there are
writable mappings, and if yes, it denies the access.

Similarly for mprotect(), is adding PROT_EXEC safe?

> +
> +	return 0;
> +}
> +
> +/**
> + * ipe_file_mprotect - ipe security hook function for mprotect check.
> + * @vma: Existing virtual memory area created by mmap or similar.
> + * @reqprot: The requested protection on the mmap, passed from usermode.
> + * @prot: The effective protection on the mmap, resolved from reqprot and
> + *	  system configuration.
> + *
> + * This LSM hook is called when a mmap'd region of memory is changing
> + * its protections via mprotect.
> + *
> + * Return:
> + * * 0	- OK
> + * * !0	- Error
> + */
> +int ipe_file_mprotect(struct vm_area_struct *vma, unsigned long reqprot,
> +		      unsigned long prot)
> +{
> +	struct ipe_eval_ctx ctx = { 0 };
> +
> +	/* Already Executable */
> +	if (vma->vm_flags & VM_EXEC)
> +		return 0;
> +
> +	if (prot & PROT_EXEC) {
> +		build_eval_ctx(&ctx, vma->vm_file, ipe_op_exec);
> +		return ipe_evaluate_event(&ctx);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * ipe_kernel_read_file - ipe security hook function for kernel read.
> + * @file: Supplies a pointer to the file structure being read in from disk.
> + * @id: Supplies the enumeration identifying the purpose of the read.
> + * @contents: Unused.
> + *
> + * This LSM hook is called when a file is being read in from disk from
> + * the kernel.
> + *
> + * Return:
> + * 0 - OK
> + * !0 - Error
> + */
> +int ipe_kernel_read_file(struct file *file, enum kernel_read_file_id id,
> +			 bool contents)
> +{
> +	enum ipe_op_type op;
> +	struct ipe_eval_ctx ctx;
> +
> +	switch (id) {
> +	case READING_FIRMWARE:
> +		op = ipe_op_firmware;
> +		break;
> +	case READING_MODULE:
> +		op = ipe_op_kernel_module;
> +		break;
> +	case READING_KEXEC_INITRAMFS:
> +		op = ipe_op_kexec_initramfs;
> +		break;
> +	case READING_KEXEC_IMAGE:
> +		op = ipe_op_kexec_image;
> +		break;
> +	case READING_POLICY:
> +		op = ipe_op_ima_policy;
> +		break;
> +	case READING_X509_CERTIFICATE:
> +		op = ipe_op_ima_x509;
> +		break;
> +	default:
> +		op = ipe_op_max;
> +		WARN(op == ipe_op_max, "no rule setup for enum %d", id);
> +	}
> +
> +	build_eval_ctx(&ctx, file, op);
> +	return ipe_evaluate_event(&ctx);
> +}
> +
> +/**
> + * ipe_kernel_load_data - ipe security hook function for kernel load data.
> + * @id: Supplies the enumeration identifying the purpose of the read.
> + * @contents: Unused.
> + *
> + * This LSM hook is called when a buffer is being read in from disk.
> + *
> + * Return:
> + * * 0	- OK
> + * * !0	- Error
> + */
> +int ipe_kernel_load_data(enum kernel_load_data_id id, bool contents)
> +{
> +	enum ipe_op_type op;
> +	struct ipe_eval_ctx ctx = { 0 };
> +
> +	switch (id) {
> +	case LOADING_FIRMWARE:
> +		op = ipe_op_firmware;
> +		break;
> +	case LOADING_MODULE:
> +		op = ipe_op_kernel_module;
> +		break;
> +	case LOADING_KEXEC_INITRAMFS:
> +		op = ipe_op_kexec_initramfs;
> +		break;
> +	case LOADING_KEXEC_IMAGE:
> +		op = ipe_op_kexec_image;
> +		break;
> +	case LOADING_POLICY:
> +		op = ipe_op_ima_policy;
> +		break;
> +	case LOADING_X509_CERTIFICATE:
> +		op = ipe_op_ima_x509;
> +		break;
> +	default:
> +		op = ipe_op_max;
> +		WARN(op == ipe_op_max, "no rule setup for enum %d", id);
> +	}
> +
> +	build_eval_ctx(&ctx, NULL, op);
> +	return ipe_evaluate_event(&ctx);
> +}
> diff --git a/security/ipe/hooks.h b/security/ipe/hooks.h
> index 30fe455389bf..857cae69678c 100644
> --- a/security/ipe/hooks.h
> +++ b/security/ipe/hooks.h
> @@ -11,4 +11,17 @@
>  
>  void ipe_sb_free_security(struct super_block *mnt_sb);
>  
> +int ipe_bprm_check_security(struct linux_binprm *bprm);
> +
> +int ipe_mmap_file(struct file *f, unsigned long reqprot, unsigned long prot,
> +		  unsigned long flags);
> +
> +int ipe_file_mprotect(struct vm_area_struct *vma, unsigned long reqprot,
> +		      unsigned long prot);
> +
> +int ipe_kernel_read_file(struct file *file, enum kernel_read_file_id id,
> +			 bool contents);
> +
> +int ipe_kernel_load_data(enum kernel_load_data_id id, bool contents);
> +
>  #endif /* IPE_HOOKS_H */
> diff --git a/security/ipe/ipe.c b/security/ipe/ipe.c
> index bef923026b50..7af2f942decd 100644
> --- a/security/ipe/ipe.c
> +++ b/security/ipe/ipe.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "ipe.h"
> +#include "hooks.h"
>  
>  bool ipe_enabled;
>  
> @@ -12,6 +13,11 @@ static struct lsm_blob_sizes ipe_blobs __lsm_ro_after_init = {
>  
>  static struct security_hook_list ipe_hooks[] __lsm_ro_after_init = {
>  	LSM_HOOK_INIT(sb_free_security, ipe_sb_free_security),
> +	LSM_HOOK_INIT(bprm_check_security, ipe_bprm_check_security),
> +	LSM_HOOK_INIT(mmap_file, ipe_mmap_file),
> +	LSM_HOOK_INIT(file_mprotect, ipe_file_mprotect),
> +	LSM_HOOK_INIT(kernel_read_file, ipe_kernel_read_file),
> +	LSM_HOOK_INIT(kernel_load_data, ipe_kernel_load_data),
>  };

Uhm, maybe I would incorporate patch 1 with this.

Roberto

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


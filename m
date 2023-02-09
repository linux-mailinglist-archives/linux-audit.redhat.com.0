Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CB5690ACA
	for <lists+linux-audit@lfdr.de>; Thu,  9 Feb 2023 14:46:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675950411;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YfH6FQZ2Gbprso2wh9OyN7jP7/CKUCXyGYvDroCHU2k=;
	b=NbBNTJgscrm8GfYcOa04GpJjJEOcFc+5wCQCHAiCuNUgilAIdBKYdqP2ieRVEmL06P/FGb
	HTUPxfGaaqixzqXXrz1wyS3LB3+eOjj5X5oUZCjB/D82dKawsK+U3WagK/z9XrVXah9GNo
	Ran2O0RcbwixbuObjEPKBeB6d5i8s1k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-bVgoioz0Np22AJpUUWZ1uQ-1; Thu, 09 Feb 2023 08:46:47 -0500
X-MC-Unique: bVgoioz0Np22AJpUUWZ1uQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EDDA1C0754F;
	Thu,  9 Feb 2023 13:46:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F17A40C83B6;
	Thu,  9 Feb 2023 13:46:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9A74719465A0;
	Thu,  9 Feb 2023 13:46:38 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B4FCA1946589 for <linux-audit@listman.corp.redhat.com>;
 Thu,  9 Feb 2023 03:37:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A8EEB492B00; Thu,  9 Feb 2023 03:37:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0E0E492C3E
 for <linux-audit@redhat.com>; Thu,  9 Feb 2023 03:37:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8442E87B2A0
 for <linux-audit@redhat.com>; Thu,  9 Feb 2023 03:37:59 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-HCcgC_WvMo-r6KjP9mEL7g-1; Wed, 08 Feb 2023 22:37:55 -0500
X-MC-Unique: HCcgC_WvMo-r6KjP9mEL7g-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 78040CE22A2;
 Thu,  9 Feb 2023 03:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811C9C433EF;
 Thu,  9 Feb 2023 03:30:35 +0000 (UTC)
Date: Wed, 8 Feb 2023 19:30:33 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Fan Wu <wufan@linux.microsoft.com>
Subject: Re: [RFC PATCH v9 12/16] fsverity: consume builtin signature via LSM
 hook
Message-ID: <Y+Ro2Uor21d/Gfqc@sol.localdomain>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-13-git-send-email-wufan@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <1675119451-23180-13-git-send-email-wufan@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Thu, 09 Feb 2023 13:46:37 +0000
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
Cc: axboe@kernel.dk, tytso@mit.edu, dm-devel@redhat.com, corbet@lwn.net,
 roberto.sassu@huawei.com, Deven Bowers <deven.desai@linux.microsoft.com>,
 linux-doc@vger.kernel.org, snitzer@kernel.org, jmorris@namei.org,
 zohar@linux.ibm.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 eparis@redhat.com, linux-fscrypt@vger.kernel.org,
 linux-integrity@vger.kernel.org, agk@redhat.com, serge@hallyn.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

So disregarding the fact that using the fsverity builtin signatures still seems
like a bad idea to me, here's a few comments on the diff itself:

On Mon, Jan 30, 2023 at 02:57:27PM -0800, Fan Wu wrote:
> diff --git a/fs/verity/open.c b/fs/verity/open.c
> index 81ff94442f7b..7e6fa52c0e9c 100644
> --- a/fs/verity/open.c
> +++ b/fs/verity/open.c
> @@ -7,7 +7,9 @@
>  
>  #include "fsverity_private.h"
>  
> +#include <linux/security.h>
>  #include <linux/slab.h>
> +#include <crypto/public_key.h>

There's no need to include <crypto/public_key.h>.

>  
>  static struct kmem_cache *fsverity_info_cachep;
>  
> @@ -146,7 +148,7 @@ static int compute_file_digest(struct fsverity_hash_alg *hash_alg,
>   * appended signature), and check the signature if present.  The
>   * fsverity_descriptor must have already undergone basic validation.
>   */
> -struct fsverity_info *fsverity_create_info(const struct inode *inode,
> +struct fsverity_info *fsverity_create_info(struct inode *inode,
>  					   struct fsverity_descriptor *desc)
>  {
>  	struct fsverity_info *vi;
> @@ -182,6 +184,15 @@ struct fsverity_info *fsverity_create_info(const struct inode *inode,
>  
>  	err = fsverity_verify_signature(vi, desc->signature,
>  					le32_to_cpu(desc->sig_size));
> +	if (err) {
> +		fsverity_err(inode, "Error %d verifying signature", err);
> +		goto out;
> +	}

The above error message is unnecessary because fsverity_verify_signature()
already prints an error message on failure.

> +
> +	err = security_inode_setsecurity(inode, FS_VERITY_INODE_SEC_NAME, desc->signature,
> +					 le32_to_cpu(desc->sig_size), 0);

This runs even if CONFIG_FS_VERITY_BUILTIN_SIGNATURES is disabled.  Is that
really the right behavior?

Also a nit: please stick to the preferred line length of 80 characters.
See Documentation/process/coding-style.rst

> diff --git a/fs/verity/signature.c b/fs/verity/signature.c
> index 143a530a8008..5d7b9496f9c4 100644
> --- a/fs/verity/signature.c
> +++ b/fs/verity/signature.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/cred.h>
>  #include <linux/key.h>
> +#include <linux/security.h>
>  #include <linux/slab.h>
>  #include <linux/verification.h>

This change is unnecessary.

> diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> index 40f14e5fed9d..29e9888287ba 100644
> --- a/include/linux/fsverity.h
> +++ b/include/linux/fsverity.h
> @@ -254,4 +254,6 @@ static inline bool fsverity_active(const struct inode *inode)
>  	return fsverity_get_info(inode) != NULL;
>  }
>  
> +#define FS_VERITY_INODE_SEC_NAME "fsverity.inode-info"

"inode-info" is very vague.  Shouldn't it be named "builtin-sig" or something?

- Eric

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


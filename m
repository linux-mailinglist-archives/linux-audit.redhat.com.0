Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8856C691389
	for <lists+linux-audit@lfdr.de>; Thu,  9 Feb 2023 23:39:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675982361;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4CGBRWuijPfoTbyrMwnfJ4WuLXfhCX2eqGTASy7yfO4=;
	b=HCZ3xmxuj8yODNJfJ3MRclhOaPaTUv+bkhk3Fdhz0CbEKzNVJBP/9IIpvnNFV4lkBn5fGh
	VvSp6KQOOwGXloRaI7DG8I4pt97ap2OgrQB/2sScWNJBk65EOk+JVvFFB1qCnmdRtyW4yL
	KNd9D8/HRj+FprV3uW6gDVb6hUtOoug=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-0hyKOus6OUyg0U27Yd-iLA-1; Thu, 09 Feb 2023 17:39:17 -0500
X-MC-Unique: 0hyKOus6OUyg0U27Yd-iLA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCE5B85D063;
	Thu,  9 Feb 2023 22:39:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C397140EBF6;
	Thu,  9 Feb 2023 22:39:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2AB2019465A0;
	Thu,  9 Feb 2023 22:39:08 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B97E01946589 for <linux-audit@listman.corp.redhat.com>;
 Thu,  9 Feb 2023 22:21:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AA81B492B00; Thu,  9 Feb 2023 22:21:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A337A492C3F
 for <linux-audit@redhat.com>; Thu,  9 Feb 2023 22:21:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8713A29AB3F6
 for <linux-audit@redhat.com>; Thu,  9 Feb 2023 22:21:58 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-172-wB0krBDmNFeq_K3sWoXa1Q-1; Thu,
 09 Feb 2023 17:21:54 -0500
X-MC-Unique: wB0krBDmNFeq_K3sWoXa1Q-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id 89F6A20C8AF3; Thu,  9 Feb 2023 14:21:53 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 89F6A20C8AF3
Date: Thu, 9 Feb 2023 14:21:53 -0800
From: Fan Wu <wufan@linux.microsoft.com>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [RFC PATCH v9 12/16] fsverity: consume builtin signature via LSM
 hook
Message-ID: <20230209222153.GA6647@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-13-git-send-email-wufan@linux.microsoft.com>
 <Y+Ro2Uor21d/Gfqc@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <Y+Ro2Uor21d/Gfqc@sol.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Thu, 09 Feb 2023 22:39:07 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 08, 2023 at 07:30:33PM -0800, Eric Biggers wrote:
> So disregarding the fact that using the fsverity builtin signatures still seems
> like a bad idea to me, here's a few comments on the diff itself:
> 
Thanks for the review. I have verified the headers are indeed unnecessary,
I will remove them in the next version.

> On Mon, Jan 30, 2023 at 02:57:27PM -0800, Fan Wu wrote:
> > diff --git a/fs/verity/open.c b/fs/verity/open.c
> > index 81ff94442f7b..7e6fa52c0e9c 100644
> > --- a/fs/verity/open.c
> > +++ b/fs/verity/open.c
> > @@ -7,7 +7,9 @@
> >  
> >  #include "fsverity_private.h"
> >  
> > +#include <linux/security.h>
> >  #include <linux/slab.h>
> > +#include <crypto/public_key.h>
> 
> There's no need to include <crypto/public_key.h>.
> 
> >  
> > +	if (err) {
> > +		fsverity_err(inode, "Error %d verifying signature", err);
> > +		goto out;
> > +	}
> 
> The above error message is unnecessary because fsverity_verify_signature()
> already prints an error message on failure.
> 
> > +
> > +	err = security_inode_setsecurity(inode, FS_VERITY_INODE_SEC_NAME, desc->signature,
> > +					 le32_to_cpu(desc->sig_size), 0);
> 
> This runs even if CONFIG_FS_VERITY_BUILTIN_SIGNATURES is disabled.  Is that
> really the right behavior?
> 
Yes the hook call should better depend on a KCONFIG. After second thought I think it
should depend on CONFIG_IPE_PROP_FS_VERITY, which also indirectly introduces the
dependency on CONFIG_FS_VERITY_BUILTIN_SIGNATURES.

Currently security_inode_setsecurity only allows one LSM to save data with a given name.
In our case IPE will be the only LSM that saves the signature.

I will update this part in the next version.

> Also a nit: please stick to the preferred line length of 80 characters.
> See Documentation/process/coding-style.rst
> 
> > diff --git a/fs/verity/signature.c b/fs/verity/signature.c
> > index 143a530a8008..5d7b9496f9c4 100644
> > --- a/fs/verity/signature.c
> > +++ b/fs/verity/signature.c
> > @@ -9,6 +9,7 @@
> >  
> >  #include <linux/cred.h>
> >  #include <linux/key.h>
> > +#include <linux/security.h>
> >  #include <linux/slab.h>
> >  #include <linux/verification.h>
> 
> This change is unnecessary.
> 
> > diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> > index 40f14e5fed9d..29e9888287ba 100644
> > --- a/include/linux/fsverity.h
> > +++ b/include/linux/fsverity.h
> > @@ -254,4 +254,6 @@ static inline bool fsverity_active(const struct inode *inode)
> >  	return fsverity_get_info(inode) != NULL;
> >  }
> >  
> > +#define FS_VERITY_INODE_SEC_NAME "fsverity.inode-info"
> 
> "inode-info" is very vague.  Shouldn't it be named "builtin-sig" or something?
> 
> - Eric

I agree this name works better, I will change it to "fsverity.builtin-sig".
-Fan

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


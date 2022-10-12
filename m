Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F25FCE13
	for <lists+linux-audit@lfdr.de>; Thu, 13 Oct 2022 00:04:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665612280;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WWlw80OdYeyJp8xfwWiAm0m4i+Ai2FPDy08jd/8faNo=;
	b=WL98YZHiO5Ze7tzyd/iBruC7C95G8Q2oCjEWzA1bTX6FCc0cfdwMd8kHkil4drr1cF4vsP
	NBemkIuMzZneIxfz8lNobwK+xNouxA205GKvch6txlHvYw0I1QyDqUhSKXCVGrnvKT79ni
	c3dJ240zOHf7hI4csDeNTxdepA7fPFE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-T51a-cOBM3K-j0fIDhN1HQ-1; Wed, 12 Oct 2022 18:04:36 -0400
X-MC-Unique: T51a-cOBM3K-j0fIDhN1HQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48A10101A54E;
	Wed, 12 Oct 2022 22:04:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 77BD3140EBF3;
	Wed, 12 Oct 2022 22:04:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E61E519465A3;
	Wed, 12 Oct 2022 22:04:25 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5B2E41946588 for <linux-audit@listman.corp.redhat.com>;
 Wed, 12 Oct 2022 22:04:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EA3C4414A818; Wed, 12 Oct 2022 22:04:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E27C7414A809
 for <linux-audit@redhat.com>; Wed, 12 Oct 2022 22:04:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6CE28027EB
 for <linux-audit@redhat.com>; Wed, 12 Oct 2022 22:04:23 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-H4hjrEY5O8CucdR8vxBArQ-1; Wed, 12 Oct 2022 18:04:12 -0400
X-MC-Unique: H4hjrEY5O8CucdR8vxBArQ-1
Received: by mail-pj1-f48.google.com with SMTP id fw14so265411pjb.3
 for <linux-audit@redhat.com>; Wed, 12 Oct 2022 15:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pGHWCM3N3OUCM1ER+rKkscIwlNTBChe1kgAgXac27k=;
 b=mVLRt6065kBBWqQWMaG0Ds+syXJ0yUyjTVFwiX5tzbaf/gJ/rN/8yrV+zJUSjbxDOh
 5a7dQQR7A2C5agHLzZPHT53Z7TyjaXROCmzcwu2uMPAfixl8h9w2qi+FEiq4/2hVNi3X
 STG3uBbOqp9rgNbcTfIV+5qdlgbxTSyym7rMWGIAP0m5sLcatVQ1vhBY+L51gHJy17+n
 Jc/H7kfcVdiqA11gqSJaqx+vKXjuJHfDmzV9aJOAq4CKWym1sy06mJlVBAILgRgytdUV
 +9858Q9msbHTNJCiOxf0I8SVDQQbpaFZ0qmUGPcljUKwq/tsIb2iTAcEt5xK3SDDrq+6
 h2xw==
X-Gm-Message-State: ACrzQf3KzX7FLn2cnu8q8zcnHNa0673G2EpGJ8GxkqhtwKncT+946O4L
 sdy2dmOVdNyvolG/zbwdVAUqtw==
X-Google-Smtp-Source: AMsMyM5qJXypLtEuI7LmQWOcC6PZlx4jhq65/txaKudvas3aDV4YoebnKIfrSMm8JqEgIT2QXo2a9Q==
X-Received: by 2002:a17:90b:400c:b0:20a:bb11:a0f3 with SMTP id
 ie12-20020a17090b400c00b0020abb11a0f3mr7423615pjb.166.1665612251178; 
 Wed, 12 Oct 2022 15:04:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 w133-20020a62828b000000b0052d4b0d0c74sm360959pfd.70.2022.10.12.15.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 15:04:10 -0700 (PDT)
Date: Wed, 12 Oct 2022 15:04:09 -0700
From: Kees Cook <keescook@chromium.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v38 39/39] LSM: Create lsm_module_list system call
Message-ID: <202210121459.00980C2@keescook>
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927203155.15060-1-casey@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <20220927203155.15060-1-casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-audit@redhat.com, casey.schaufler@intel.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 27, 2022 at 01:31:55PM -0700, Casey Schaufler wrote:
> +SYSCALL_DEFINE3(lsm_module_list,
> +	       unsigned int __user *, ids,
> +	       size_t __user *, size,
> +	       int, flags)

Please make this unsigned int.

> +{
> +	unsigned int *interum;
> +	size_t total_size = lsm_id * sizeof(*interum);
> +	size_t usize;
> +	int rc;
> +	int i;

Please test that flags == 0 so it can be used in the future:

	if (flags)
		return -EINVAL;

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

No need to repeat this, if it is written first.

> +	else
> +		rc = lsm_id;
> +
> +	kfree(interum);
> +	return rc;

No need for the alloc/free. Here's what I would imagine for the whole
thing:

	if (flags)
		return -EINVAL;

	if (get_user(usize, size))
		return -EFAULT;

	if (put_user(total_size, size) != 0)
		return -EFAULT;

	if (usize < total_size)
		return -E2BIG;

	for (i = 0; i < lsm_id; i++)
		if (put_user(lsm_idlist[i]->id, id++))
			return -EFAULT;

	return lsm_id;

-- 
Kees Cook

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


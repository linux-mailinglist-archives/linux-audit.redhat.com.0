Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E98B686F8D
	for <lists+linux-audit@lfdr.de>; Wed,  1 Feb 2023 21:07:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675282051;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y9dPLQL11Di/Z7ZWWnAo+Xrb/I3ThT8suriHEjlNLKM=;
	b=fdwKaExP2/U2yM2Wduebc8nT2uyQFdgttQy4eA9SjoxSqppQx/RyIpSGM3q4ou3JbN0ANS
	wE1gE4QVJqZQBBpb0vicERwrM6st42QAXjkSvyCxn5YpEIWDVagmZCcnrEYuNyV518yFC7
	7BsngKz9SfOztlMw9f4zNQXnudYXUj8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-9BgR1uTgP0uETC6pJIjugQ-1; Wed, 01 Feb 2023 15:07:27 -0500
X-MC-Unique: 9BgR1uTgP0uETC6pJIjugQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4C771C189A4;
	Wed,  1 Feb 2023 20:07:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B1DC112132C;
	Wed,  1 Feb 2023 20:07:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 23B0F19465B8;
	Wed,  1 Feb 2023 20:07:15 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1CA8C19465A3 for <linux-audit@listman.corp.redhat.com>;
 Wed,  1 Feb 2023 19:46:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3A8652026D76; Wed,  1 Feb 2023 19:46:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 334322026D4B
 for <linux-audit@redhat.com>; Wed,  1 Feb 2023 19:46:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1319C100DEAA
 for <linux-audit@redhat.com>; Wed,  1 Feb 2023 19:46:53 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-553-Z18uxoJQPJWlBJnSN-BBDQ-1; Wed,
 01 Feb 2023 14:46:48 -0500
X-MC-Unique: Z18uxoJQPJWlBJnSN-BBDQ-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id 5F2CE20B7102; Wed,  1 Feb 2023 11:46:47 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5F2CE20B7102
Date: Wed, 1 Feb 2023 11:46:47 -0800
From: Fan Wu <wufan@linux.microsoft.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [RFC PATCH v9 05/16] ipe: add userspace interface
Message-ID: <20230201194647.GA11892@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-6-git-send-email-wufan@linux.microsoft.com>
 <255c119de8f8665b88c411d981762fddc0fe7eaa.camel@huaweicloud.com>
MIME-Version: 1.0
In-Reply-To: <255c119de8f8665b88c411d981762fddc0fe7eaa.camel@huaweicloud.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Wed, 01 Feb 2023 20:07:14 +0000
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, tytso@mit.edu,
 dm-devel@redhat.com, corbet@lwn.net, roberto.sassu@huawei.com,
 Deven Bowers <deven.desai@linux.microsoft.com>, linux-doc@vger.kernel.org,
 snitzer@kernel.org, jmorris@namei.org, zohar@linux.ibm.com,
 linux-kernel@vger.kernel.org, ebiggers@kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 eparis@redhat.com, linux-fscrypt@vger.kernel.org,
 linux-integrity@vger.kernel.org, agk@redhat.com, serge@hallyn.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 31, 2023 at 11:49:44AM +0100, Roberto Sassu wrote:
> On Mon, 2023-01-30 at 14:57 -0800, Fan Wu wrote:
> > From: Deven Bowers <deven.desai@linux.microsoft.com>
> > +
> > +/**
> > + * new_policy - Write handler for the securityfs node, "ipe/new_policy".
> > + * @f: Supplies a file structure representing the securityfs node.
> > + * @data: Suppleis a buffer passed to the write syscall.
> 
> Typo: Suppleis.
> 
Thanks for spotting the typos!

> > + * @len: Supplies the length of @data.
> > + * @offset: unused.
> > + *
> > + * Return:
> > + * * >0	- Success, Length of buffer written
> > + * * <0	- Error
> > + */
> > +static ssize_t new_policy(struct file *f, const char __user *data,
> > +			  size_t len, loff_t *offset)
> > +{
> > +	int rc = 0;
> > +	char *copy = NULL;
> > +	struct ipe_policy *p = NULL;
> > +
> > +	if (!file_ns_capable(f, &init_user_ns, CAP_MAC_ADMIN))
> > +		return -EPERM;
> > +
> > +	copy = memdup_user_nul(data, len);
> > +	if (IS_ERR(copy)) {
> > +		rc = PTR_ERR(copy);
> > +		goto err;
> > +	}
> > +
> > +	p = ipe_new_policy(NULL, 0, copy, len);
> > +	if (IS_ERR(p)) {
> > +		rc = PTR_ERR(p);
> > +		goto err;
> > +	}
> > +
> > +	rc = ipe_new_policyfs_node(p);
> > +	if (rc)
> > +		goto err;
> 
> Uhm, don't you need to do cleanup of allocated memory or revert the
> actions of ipe_new_policy()?
> 
Yes that should be cleaned up but should be done in ipe_new_policy instead,
will add a ipe_free_policy call at the end. Thanks for pointing that out.

> 
> I would like more to see all the functions managing the policy
> together. If the patch is too long, you could further split by adding
> the helpers (that don't directly deal with the policy) in a separate
> patch.
> 
> Here you would simply instantiate dirs/files in securityfs and call the
> existing functions previously introduced.
> 
> Roberto
> 

I will try to split them in the next version. Thanks for the suggestion.
-Fan

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


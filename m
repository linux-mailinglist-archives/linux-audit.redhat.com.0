Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B1F687FA9
	for <lists+linux-audit@lfdr.de>; Thu,  2 Feb 2023 15:14:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675347250;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c7dnN7p67gkbSxhqCxgc7wfEzKfyUpQIOqxvb27X4Ew=;
	b=Im2muCar3m598hkifT98hKPT8M26WS7DYQyON28oQe4EO75nM0dWmmf++1CEp11nzTfV7r
	4vtdlbqI1KCavtqjih99c0QpEy35KUT/H7IMy5ezQzLpYJJfLh3d4YL/e9mIskXcxntqs7
	7YByUWp70uF4iOjEMON82AOG1TNNpVA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-qMKtc1RPOBKXQNmXy87-uA-1; Thu, 02 Feb 2023 09:14:08 -0500
X-MC-Unique: qMKtc1RPOBKXQNmXy87-uA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDD021C08792;
	Thu,  2 Feb 2023 14:14:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39992492C14;
	Thu,  2 Feb 2023 14:14:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 689F619465B2;
	Thu,  2 Feb 2023 14:14:01 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6E7AE194658F for <linux-audit@listman.corp.redhat.com>;
 Wed,  1 Feb 2023 23:50:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4DCDE140EBF6; Wed,  1 Feb 2023 23:50:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45DBE140EBF4
 for <linux-audit@redhat.com>; Wed,  1 Feb 2023 23:50:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 236D285A5B1
 for <linux-audit@redhat.com>; Wed,  1 Feb 2023 23:50:38 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-80-Bz3GMnGCPnGJDTxjMBDWQQ-1; Wed,
 01 Feb 2023 18:50:33 -0500
X-MC-Unique: Bz3GMnGCPnGJDTxjMBDWQQ-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id BDF7320B74F7; Wed,  1 Feb 2023 15:50:31 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BDF7320B74F7
Date: Wed, 1 Feb 2023 15:50:31 -0800
From: Fan Wu <wufan@linux.microsoft.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [RFC PATCH v9 13/16] ipe: enable support for fs-verity as a
 trust provider
Message-ID: <20230201235031.GC9075@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-14-git-send-email-wufan@linux.microsoft.com>
 <d62907da62b5e0b25c9d7bd4b3119a3d1827bd29.camel@huaweicloud.com>
MIME-Version: 1.0
In-Reply-To: <d62907da62b5e0b25c9d7bd4b3119a3d1827bd29.camel@huaweicloud.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Thu, 02 Feb 2023 14:14:00 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 31, 2023 at 03:00:08PM +0100, Roberto Sassu wrote:
> On Mon, 2023-01-30 at 14:57 -0800, Fan Wu wrote:
> > +/**
> > + * evaluate_fsv_sig_false - Analyze @ctx against a fsv sig false property.
> > + * @ctx: Supplies a pointer to the context being evaluated.
> > + * @p: Supplies a pointer to the property being evaluated.
> > + *
> > + * Return:
> > + * * true	- The current @ctx match the @p
> > + * * false	- The current @ctx doesn't match the @p
> > + */
> > +static bool evaluate_fsv_sig_false(const struct ipe_eval_ctx *const ctx,
> > +				   struct ipe_prop *p)
> > +{
> > +	return !ctx->ino ||
> > +	       !IS_VERITY(ctx->ino) ||
> > +	       !ctx->ipe_inode ||
> > +	       !ctx->ipe_inode->fs_verity_signed;
> > +}
> > +
> > +/**
> > + * evaluate_fsv_sig_true - Analyze @ctx against a fsv sig true property.
> > + * @ctx: Supplies a pointer to the context being evaluated.
> > + * @p: Supplies a pointer to the property being evaluated.
> > + *
> > + * Return:
> > + * * true - The current @ctx match the @p
> > + * * false - The current @ctx doesn't match the @p
> > + */
> > +static bool evaluate_fsv_sig_true(const struct ipe_eval_ctx *const ctx,
> > +				  struct ipe_prop *p)
> > +{
> > +	return ctx->ino &&
> > +	       IS_VERITY(ctx->ino) &&
> > +	       ctx->ipe_inode &&
> > +	       ctx->ipe_inode->fs_verity_signed;
> > +}
> 
> Isn't better to just define one function and prepend a ! in
> evaluate_property()?
Yes that's a better way to do it, I will take this idea.

> 
> Not sure about the usefulness of the fsverity_signature= property as it
> is. I would at minimum allow to specify which keyring signatures are
> verified against, and ensure that the keyring has a restriction.
> 
> And maybe I would call fsverity_verify_signature() directly, after
> extending it to pass the desired keyring.
> 
Thanks for the suggestion.
For the initial version we only have the fsverity_signature property
to enable the policy can make decision based on the existence of the
signature. In the future we plan to add more properties to leverage
the remaining signature information so we can have the restrictions
you mentioned.

-Fan

> I would also split this patch in two, one for fsverity_digest= and one
> for fsverity_signature=.
> 
> Roberto

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


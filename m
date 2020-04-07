Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2281A1510
	for <lists+linux-audit@lfdr.de>; Tue,  7 Apr 2020 20:41:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586284901;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xv21xqya6tWK1r0wLRKR/2LA7b4OkejyZAH0U75UzOc=;
	b=jM1bFj4Ns0B/4KYpMMfr0zPiEe8yTR/EZzbnOjfRFI9NS/JU7dpFEZ2p3Nw0P8+aZIejSc
	SgEsKczuYvUXM9RanjFKgDoRe0D0m8OF8IReTVBXC63fcyo0eEn01a5UZ8+VEgVnb4/avi
	/sRBGyVFrEWrpfniLyFjH7Ns3FFDrXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-Wys_9sx4N_ey5f1D70h0yw-1; Tue, 07 Apr 2020 14:41:39 -0400
X-MC-Unique: Wys_9sx4N_ey5f1D70h0yw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD2DC8024CF;
	Tue,  7 Apr 2020 18:41:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B95A898A57;
	Tue,  7 Apr 2020 18:41:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F18793A61;
	Tue,  7 Apr 2020 18:41:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 037IfVZr007761 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 7 Apr 2020 14:41:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2735910545E0; Tue,  7 Apr 2020 18:41:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2303C10545E1
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 18:41:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07C0C80029A
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 18:41:31 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-30-AQksJA2YOzKoIGF0B87QTA-1; Tue, 07 Apr 2020 14:41:28 -0400
X-MC-Unique: AQksJA2YOzKoIGF0B87QTA-1
Received: by mail-pj1-f68.google.com with SMTP id l36so123887pjb.3
	for <linux-audit@redhat.com>; Tue, 07 Apr 2020 11:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=4iSXnK+r3XUqMC5ZNqDl47FITYmKD31Ulwd1Kd1nS1Y=;
	b=Bkp6iwweWAIBZ13vsxNsxAleVuoCSxUYa3+gAwGwzEvVmoU/0wwt7CYpMOgxCvemRA
	9+tEJXO9qUiyPIbjJdV4jAylmiFpoVLEPae1yzq0nNCfd/j60Q53ab46gTBdDUJpUnDh
	jwqSH6OmpjHTdZuj4CSKI2ZL1FPNai3m09SI2j9c78Nw97n9IQACu/1jqqlnMugQWG/s
	NmEg5ZqWuxEW3CpSdr+QW1Enor9YH9aK04HdLbnfmUm5/QKuhjkGYly1eYw5mov0OSnk
	cyF1r4D4mYWeeLiXrfEfDoQr4qxEu023XNSyurb6em5ZPKj5GDCKOEeTPTEnIjh0HmaP
	Dneg==
X-Gm-Message-State: AGi0PubhI8dScBENQYtDA3F5Tb93E+1AOcEEqrBsyKSUYXQrSYNvXQag
	tXeOLmDQu5jswQnWemVmWmqXkA==
X-Google-Smtp-Source: APiQypIBcKNccD64BGznoeVtkLvXQwDxglXqycluhTkEDP9xiZJ0Nx+Tyx8ZTYJ7o6Aaeh75cPVDng==
X-Received: by 2002:a17:90a:cb18:: with SMTP id
	z24mr723008pjt.67.1586284886939; 
	Tue, 07 Apr 2020 11:41:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	mu15sm2396662pjb.30.2020.04.07.11.41.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Apr 2020 11:41:26 -0700 (PDT)
Date: Tue, 7 Apr 2020 11:41:25 -0700
From: Kees Cook <keescook@chromium.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v16 16/23] LSM: Use lsmcontext in security_inode_getsecctx
Message-ID: <202004071141.51D1FE524C@keescook>
References: <20200407000159.43602-1-casey@schaufler-ca.com>
	<20200407000159.43602-17-casey@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <20200407000159.43602-17-casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 037IfVZr007761
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org, jmorris@namei.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, sds@tycho.nsa.gov
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Apr 06, 2020 at 05:01:52PM -0700, Casey Schaufler wrote:
> Change the security_inode_getsecctx() interface to fill
> a lsmcontext structure instead of data and length pointers.
> This provides the information about which LSM created the
> context so that security_release_secctx() can use the
> correct hook.
> 
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  fs/nfsd/nfs4xdr.c        | 23 +++++++++--------------
>  include/linux/security.h |  5 +++--
>  security/security.c      | 13 +++++++++++--
>  3 files changed, 23 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
> index df308b1b37fa..ac8eb77d0053 100644
> --- a/fs/nfsd/nfs4xdr.c
> +++ b/fs/nfsd/nfs4xdr.c
> @@ -2379,11 +2379,11 @@ nfsd4_encode_layout_types(struct xdr_stream *xdr, u32 layout_types)
>  #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
>  static inline __be32
>  nfsd4_encode_security_label(struct xdr_stream *xdr, struct svc_rqst *rqstp,
> -			    void *context, int len)
> +			    struct lsmcontext *context)
>  {
>  	__be32 *p;
>  
> -	p = xdr_reserve_space(xdr, len + 4 + 4 + 4);
> +	p = xdr_reserve_space(xdr, context->len + 4 + 4 + 4);
>  	if (!p)
>  		return nfserr_resource;
>  
> @@ -2393,13 +2393,13 @@ nfsd4_encode_security_label(struct xdr_stream *xdr, struct svc_rqst *rqstp,
>  	 */
>  	*p++ = cpu_to_be32(0); /* lfs */
>  	*p++ = cpu_to_be32(0); /* pi */
> -	p = xdr_encode_opaque(p, context, len);
> +	p = xdr_encode_opaque(p, context->context, context->len);
>  	return 0;
>  }
>  #else
>  static inline __be32
>  nfsd4_encode_security_label(struct xdr_stream *xdr, struct svc_rqst *rqstp,
> -			    void *context, int len)
> +			    struct lsmcontext *context)
>  { return 0; }
>  #endif
>  
> @@ -2496,9 +2496,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
>  	int err;
>  	struct nfs4_acl *acl = NULL;
>  #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
> -	struct lsmcontext scaff; /* scaffolding */
> -	void *context = NULL;
> -	int contextlen;
> +	struct lsmcontext context = { };
>  #endif
>  	bool contextsupport = false;
>  	struct nfsd4_compoundres *resp = rqstp->rq_resp;
> @@ -2556,7 +2554,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
>  	     bmval0 & FATTR4_WORD0_SUPPORTED_ATTRS) {
>  		if (exp->ex_flags & NFSEXP_SECURITY_LABEL)
>  			err = security_inode_getsecctx(d_inode(dentry),
> -						&context, &contextlen);
> +						       &context);
>  		else
>  			err = -EOPNOTSUPP;
>  		contextsupport = (err == 0);
> @@ -2986,8 +2984,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
>  
>  #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
>  	if (bmval2 & FATTR4_WORD2_SECURITY_LABEL) {
> -		status = nfsd4_encode_security_label(xdr, rqstp, context,
> -								contextlen);
> +		status = nfsd4_encode_security_label(xdr, rqstp, &context);
>  		if (status)
>  			goto out;
>  	}
> @@ -2999,10 +2996,8 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
>  
>  out:
>  #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
> -	if (context) {
> -		lsmcontext_init(&scaff, context, contextlen, 0); /*scaffolding*/
> -		security_release_secctx(&scaff);
> -	}
> +	if (context.context)
> +		security_release_secctx(&context);
>  #endif /* CONFIG_NFSD_V4_SECURITY_LABEL */
>  	kfree(acl);
>  	if (tempfh) {
> diff --git a/include/linux/security.h b/include/linux/security.h
> index ec64ccd2e168..fac5547dd89e 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -556,7 +556,7 @@ void security_release_secctx(struct lsmcontext *cp);
>  void security_inode_invalidate_secctx(struct inode *inode);
>  int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
>  int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
> -int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen);
> +int security_inode_getsecctx(struct inode *inode, struct lsmcontext *cp);
>  int security_locked_down(enum lockdown_reason what);
>  #else /* CONFIG_SECURITY */
>  
> @@ -1382,7 +1382,8 @@ static inline int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32
>  {
>  	return -EOPNOTSUPP;
>  }
> -static inline int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen)
> +static inline int security_inode_getsecctx(struct inode *inode,
> +					   struct lsmcontext *cp)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/security/security.c b/security/security.c
> index 356c5cd94c48..84f33bd4990a 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -2211,9 +2211,18 @@ int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen)
>  }
>  EXPORT_SYMBOL(security_inode_setsecctx);
>  
> -int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen)
> +int security_inode_getsecctx(struct inode *inode, struct lsmcontext *cp)
>  {
> -	return call_int_hook(inode_getsecctx, -EOPNOTSUPP, inode, ctx, ctxlen);
> +	struct security_hook_list *hp;
> +
> +	memset(cp, 0, sizeof(*cp));
> +
> +	hlist_for_each_entry(hp, &security_hook_heads.inode_getsecctx, list) {
> +		cp->slot = hp->lsmid->slot;
> +		return hp->hook.inode_getsecctx(inode, (void **)&cp->context,
> +						&cp->len);
> +	}
> +	return -EOPNOTSUPP;
>  }
>  EXPORT_SYMBOL(security_inode_getsecctx);
>  
> -- 
> 2.24.1
> 

-- 
Kees Cook


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 028C21A13C3
	for <lists+linux-audit@lfdr.de>; Tue,  7 Apr 2020 20:37:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586284628;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YFzIk2E2H0zJLok7dIPa/YEcsfhia+F6gbG5OYes+PQ=;
	b=DaNBmzWcqrwW7FbfOvEImDPn963PoooHvg+IfnLWYPS3T6llHCgHqZo5ssgZpsqgxqslLK
	XlKH1bDFG8rUispYXZ4O2AlweW3gC2bGWnKaxiHhXqdY5o8HqXsPhkCYLNJO8ZeozrIhbR
	xs3ZAb/gTjfu9DvP0AXi90oFLBK6dTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-tmkCYer9Nh6pzPfSHC-efA-1; Tue, 07 Apr 2020 14:37:05 -0400
X-MC-Unique: tmkCYer9Nh6pzPfSHC-efA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 029278017F3;
	Tue,  7 Apr 2020 18:37:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B682360BEC;
	Tue,  7 Apr 2020 18:36:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5465B18095FF;
	Tue,  7 Apr 2020 18:36:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 037Iacc4007251 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 7 Apr 2020 14:36:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 93894107CCF7; Tue,  7 Apr 2020 18:36:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F922107CCEA
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 18:36:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECD96185A791
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 18:36:35 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-495-d9fuPN-XOs-I6CjS-smwxw-1; Tue, 07 Apr 2020 14:36:33 -0400
X-MC-Unique: d9fuPN-XOs-I6CjS-smwxw-1
Received: by mail-pl1-f195.google.com with SMTP id t4so1544831plq.12
	for <linux-audit@redhat.com>; Tue, 07 Apr 2020 11:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=360wLLRPM0g31vdvKEAXUZcvzbXxpjbH+wGk28lVsyM=;
	b=bKEMhyCB3FW789dOf+lHbv5S2rNn2OO4SNc3mCyBPfwSK1Daw7ss6yMKonkwunnaLw
	gSzA6tAE8D5cbbI1MA4GouKfHSYRtghbi+w55A8Vdr/jif51AoVkJu6EpCjguq7H/jYK
	sqaXKmWtLjaKU+lVOHeRCJU0WIzXOlqoSlWksM58Tza7cNhJ9tt54Cr/k7rEhNw1tq6a
	NoNiLDnZfs5Uvz6msLIXipSqdkbhO+fujJp6uVAlqQFhnqXt79PNglzmlaDvxPHqD+yr
	7CHAcdzH09d7E3KrOds55O1R3CH/iWcVFQKdqVga0rT/Pkg8yZ7Uf1v55+WWS/okAAU2
	4IHA==
X-Gm-Message-State: AGi0PubUwzIuszrtpaJOdn7FlqEhQOheh5DHdklgtDMTxVMtLDKDjIvl
	KAoZYRRXeOegXAocJeJHujVBJg==
X-Google-Smtp-Source: APiQypLhxBeHJYGL/r4g0yuLKT5m/MHbH5UdSf2R6HRZyR6s4bS8Wm7Y+3TXum8s3RGBL1wV+De4gw==
X-Received: by 2002:a17:902:6ac9:: with SMTP id
	i9mr3769265plt.35.1586284592370; 
	Tue, 07 Apr 2020 11:36:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	l15sm13843030pgk.59.2020.04.07.11.36.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Apr 2020 11:36:31 -0700 (PDT)
Date: Tue, 7 Apr 2020 11:36:30 -0700
From: Kees Cook <keescook@chromium.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v16 06/23] Use lsmblob in security_secctx_to_secid
Message-ID: <202004071136.DF44F4C@keescook>
References: <20200407000159.43602-1-casey@schaufler-ca.com>
	<20200407000159.43602-7-casey@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <20200407000159.43602-7-casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 037Iacc4007251
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Apr 06, 2020 at 05:01:42PM -0700, Casey Schaufler wrote:
> Change security_secctx_to_secid() to fill in a lsmblob instead
> of a u32 secid. Multiple LSMs may be able to interpret the
> string, and this allows for setting whichever secid is
> appropriate. Change security_secmark_relabel_packet() to use a
> lsmblob instead of a u32 secid. In some other cases there is
> scaffolding where interfaces have yet to be converted.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  include/linux/security.h          | 30 +++++++++++++++++++++++----
>  include/net/scm.h                 |  7 +++++--
>  kernel/cred.c                     |  4 +---
>  net/ipv4/ip_sockglue.c            |  6 ++++--
>  net/netfilter/nft_meta.c          | 18 +++++++++-------
>  net/netfilter/xt_SECMARK.c        |  9 ++++++--
>  net/netlabel/netlabel_unlabeled.c | 23 +++++++++++++--------
>  security/security.c               | 34 ++++++++++++++++++++++++++-----
>  8 files changed, 98 insertions(+), 33 deletions(-)
> 
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 2ad58e2900e7..554fe4cbbf48 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -188,6 +188,27 @@ static inline bool lsmblob_equal(struct lsmblob *bloba, struct lsmblob *blobb)
>  	return !memcmp(bloba, blobb, sizeof(*bloba));
>  }
>  
> +/**
> + * lsmblob_value - find the first non-zero value in an lsmblob structure.
> + * @blob: Pointer to the data
> + *
> + * This needs to be used with extreme caution, as the cases where
> + * it is appropriate are rare.
> + *
> + * Return the first secid value set in the lsmblob.
> + * There should only be one.
> + */
> +static inline u32 lsmblob_value(const struct lsmblob *blob)
> +{
> +	int i;
> +
> +	for (i = 0; i < LSMBLOB_ENTRIES; i++)
> +		if (blob->secid[i])
> +			return blob->secid[i];
> +
> +	return 0;
> +}
> +
>  /* These functions are in security/commoncap.c */
>  extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
>  		       int cap, unsigned int opts);
> @@ -498,7 +519,8 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
>  int security_netlink_send(struct sock *sk, struct sk_buff *skb);
>  int security_ismaclabel(const char *name);
>  int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen);
> -int security_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid);
> +int security_secctx_to_secid(const char *secdata, u32 seclen,
> +			     struct lsmblob *blob);
>  void security_release_secctx(char *secdata, u32 seclen);
>  void security_inode_invalidate_secctx(struct inode *inode);
>  int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
> @@ -1304,7 +1326,7 @@ static inline int security_secid_to_secctx(u32 secid, char **secdata, u32 *secle
>  
>  static inline int security_secctx_to_secid(const char *secdata,
>  					   u32 seclen,
> -					   u32 *secid)
> +					   struct lsmblob *blob)
>  {
>  	return -EOPNOTSUPP;
>  }
> @@ -1372,7 +1394,7 @@ void security_inet_csk_clone(struct sock *newsk,
>  			const struct request_sock *req);
>  void security_inet_conn_established(struct sock *sk,
>  			struct sk_buff *skb);
> -int security_secmark_relabel_packet(u32 secid);
> +int security_secmark_relabel_packet(struct lsmblob *blob);
>  void security_secmark_refcount_inc(void);
>  void security_secmark_refcount_dec(void);
>  int security_tun_dev_alloc_security(void **security);
> @@ -1545,7 +1567,7 @@ static inline void security_inet_conn_established(struct sock *sk,
>  {
>  }
>  
> -static inline int security_secmark_relabel_packet(u32 secid)
> +static inline int security_secmark_relabel_packet(struct lsmblob *blob)
>  {
>  	return 0;
>  }
> diff --git a/include/net/scm.h b/include/net/scm.h
> index e2e71c4bf9d0..c09f2dfeec88 100644
> --- a/include/net/scm.h
> +++ b/include/net/scm.h
> @@ -97,8 +97,11 @@ static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct sc
>  	int err;
>  
>  	if (test_bit(SOCK_PASSSEC, &sock->flags)) {
> -		/* Scaffolding - it has to be element 0 for now */
> -		err = security_secid_to_secctx(scm->lsmblob.secid[0],
> +		/* There can currently be only one value in the lsmblob,
> +		 * so getting it from lsmblob_value is appropriate until
> +		 * security_secid_to_secctx() is converted to taking a
> +		 * lsmblob directly. */
> +		err = security_secid_to_secctx(lsmblob_value(&scm->lsmblob),
>  					       &secdata, &seclen);
>  
>  		if (!err) {
> diff --git a/kernel/cred.c b/kernel/cred.c
> index fae63c0a1b36..e654a5a84408 100644
> --- a/kernel/cred.c
> +++ b/kernel/cred.c
> @@ -756,14 +756,12 @@ EXPORT_SYMBOL(set_security_override);
>  int set_security_override_from_ctx(struct cred *new, const char *secctx)
>  {
>  	struct lsmblob blob;
> -	u32 secid;
>  	int ret;
>  
> -	ret = security_secctx_to_secid(secctx, strlen(secctx), &secid);
> +	ret = security_secctx_to_secid(secctx, strlen(secctx), &blob);
>  	if (ret < 0)
>  		return ret;
>  
> -	lsmblob_init(&blob, secid);
>  	return set_security_override(new, &blob);
>  }
>  EXPORT_SYMBOL(set_security_override_from_ctx);
> diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
> index 6cf57d5ac899..7207f90eba44 100644
> --- a/net/ipv4/ip_sockglue.c
> +++ b/net/ipv4/ip_sockglue.c
> @@ -139,8 +139,10 @@ static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
>  	if (err)
>  		return;
>  
> -	/* Scaffolding - it has to be element 0 */
> -	err = security_secid_to_secctx(lb.secid[0], &secdata, &seclen);
> +	/* There can only be one secid in the lsmblob at this point,
> +	 * so getting it using lsmblob_value() is sufficient until
> +	 * security_secid_to_secctx() is changed to use a lsmblob */
> +	err = security_secid_to_secctx(lsmblob_value(&lb), &secdata, &seclen);
>  	if (err)
>  		return;
>  
> diff --git a/net/netfilter/nft_meta.c b/net/netfilter/nft_meta.c
> index 951b6e87ed5d..5875222aeac5 100644
> --- a/net/netfilter/nft_meta.c
> +++ b/net/netfilter/nft_meta.c
> @@ -801,7 +801,7 @@ struct nft_expr_type nft_meta_type __read_mostly = {
>  
>  #ifdef CONFIG_NETWORK_SECMARK
>  struct nft_secmark {
> -	u32 secid;
> +	struct lsmblob lsmdata;
>  	char *ctx;
>  };
>  
> @@ -811,21 +811,21 @@ static const struct nla_policy nft_secmark_policy[NFTA_SECMARK_MAX + 1] = {
>  
>  static int nft_secmark_compute_secid(struct nft_secmark *priv)
>  {
> -	u32 tmp_secid = 0;
> +	struct lsmblob blob;
>  	int err;
>  
> -	err = security_secctx_to_secid(priv->ctx, strlen(priv->ctx), &tmp_secid);
> +	err = security_secctx_to_secid(priv->ctx, strlen(priv->ctx), &blob);
>  	if (err)
>  		return err;
>  
> -	if (!tmp_secid)
> +	if (!lsmblob_is_set(&blob))
>  		return -ENOENT;
>  
> -	err = security_secmark_relabel_packet(tmp_secid);
> +	err = security_secmark_relabel_packet(&blob);
>  	if (err)
>  		return err;
>  
> -	priv->secid = tmp_secid;
> +	priv->lsmdata = blob;
>  	return 0;
>  }
>  
> @@ -835,7 +835,11 @@ static void nft_secmark_obj_eval(struct nft_object *obj, struct nft_regs *regs,
>  	const struct nft_secmark *priv = nft_obj_data(obj);
>  	struct sk_buff *skb = pkt->skb;
>  
> -	skb->secmark = priv->secid;
> +	/* It is not possible for more than one secid to be set in
> +	 * the lsmblob structure because it is set using
> +	 * security_secctx_to_secid(). Any secid that is set must therefore
> +	 * be the one that should go in the secmark. */
> +	skb->secmark = lsmblob_value(&priv->lsmdata);
>  }
>  
>  static int nft_secmark_obj_init(const struct nft_ctx *ctx,
> diff --git a/net/netfilter/xt_SECMARK.c b/net/netfilter/xt_SECMARK.c
> index 2317721f3ecb..8a004d018871 100644
> --- a/net/netfilter/xt_SECMARK.c
> +++ b/net/netfilter/xt_SECMARK.c
> @@ -45,13 +45,14 @@ secmark_tg(struct sk_buff *skb, const struct xt_action_param *par)
>  
>  static int checkentry_lsm(struct xt_secmark_target_info *info)
>  {
> +	struct lsmblob blob;
>  	int err;
>  
>  	info->secctx[SECMARK_SECCTX_MAX - 1] = '\0';
>  	info->secid = 0;
>  
>  	err = security_secctx_to_secid(info->secctx, strlen(info->secctx),
> -				       &info->secid);
> +				       &blob);
>  	if (err) {
>  		if (err == -EINVAL)
>  			pr_info_ratelimited("invalid security context \'%s\'\n",
> @@ -59,13 +60,17 @@ static int checkentry_lsm(struct xt_secmark_target_info *info)
>  		return err;
>  	}
>  
> +	/* xt_secmark_target_info can't be changed to use lsmblobs because
> +	 * it is exposed as an API. Use lsmblob_value() to get the one
> +	 * value that got set by security_secctx_to_secid(). */
> +	info->secid = lsmblob_value(&blob);
>  	if (!info->secid) {
>  		pr_info_ratelimited("unable to map security context \'%s\'\n",
>  				    info->secctx);
>  		return -ENOENT;
>  	}
>  
> -	err = security_secmark_relabel_packet(info->secid);
> +	err = security_secmark_relabel_packet(&blob);
>  	if (err) {
>  		pr_info_ratelimited("unable to obtain relabeling permission\n");
>  		return err;
> diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
> index 77bb1bb22c3b..8948557eaebb 100644
> --- a/net/netlabel/netlabel_unlabeled.c
> +++ b/net/netlabel/netlabel_unlabeled.c
> @@ -882,7 +882,7 @@ static int netlbl_unlabel_staticadd(struct sk_buff *skb,
>  	void *addr;
>  	void *mask;
>  	u32 addr_len;
> -	u32 secid;
> +	struct lsmblob blob;
>  	struct netlbl_audit audit_info;
>  
>  	/* Don't allow users to add both IPv4 and IPv6 addresses for a
> @@ -906,13 +906,18 @@ static int netlbl_unlabel_staticadd(struct sk_buff *skb,
>  	ret_val = security_secctx_to_secid(
>  		                  nla_data(info->attrs[NLBL_UNLABEL_A_SECCTX]),
>  				  nla_len(info->attrs[NLBL_UNLABEL_A_SECCTX]),
> -				  &secid);
> +				  &blob);
>  	if (ret_val != 0)
>  		return ret_val;
>  
> +	/* netlbl_unlhsh_add will be changed to pass a struct lsmblob *
> +	 * instead of a u32 later in this patch set. security_secctx_to_secid()
> +	 * will only be setting one entry in the lsmblob struct, so it is
> +	 * safe to use lsmblob_value() to get that one value. */
> +
>  	return netlbl_unlhsh_add(&init_net,
> -				 dev_name, addr, mask, addr_len, secid,
> -				 &audit_info);
> +				 dev_name, addr, mask, addr_len,
> +				 lsmblob_value(&blob), &audit_info);
>  }
>  
>  /**
> @@ -933,7 +938,7 @@ static int netlbl_unlabel_staticadddef(struct sk_buff *skb,
>  	void *addr;
>  	void *mask;
>  	u32 addr_len;
> -	u32 secid;
> +	struct lsmblob blob;
>  	struct netlbl_audit audit_info;
>  
>  	/* Don't allow users to add both IPv4 and IPv6 addresses for a
> @@ -955,13 +960,15 @@ static int netlbl_unlabel_staticadddef(struct sk_buff *skb,
>  	ret_val = security_secctx_to_secid(
>  		                  nla_data(info->attrs[NLBL_UNLABEL_A_SECCTX]),
>  				  nla_len(info->attrs[NLBL_UNLABEL_A_SECCTX]),
> -				  &secid);
> +				  &blob);
>  	if (ret_val != 0)
>  		return ret_val;
>  
> +	/* security_secctx_to_secid() will only put one secid into the lsmblob
> +	 * so it's safe to use lsmblob_value() to get the secid. */
>  	return netlbl_unlhsh_add(&init_net,
> -				 NULL, addr, mask, addr_len, secid,
> -				 &audit_info);
> +				 NULL, addr, mask, addr_len,
> +				 lsmblob_value(&blob), &audit_info);
>  }
>  
>  /**
> diff --git a/security/security.c b/security/security.c
> index 2fa826000889..6edbcb4c655e 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -2002,10 +2002,22 @@ int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
>  }
>  EXPORT_SYMBOL(security_secid_to_secctx);
>  
> -int security_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid)
> +int security_secctx_to_secid(const char *secdata, u32 seclen,
> +			     struct lsmblob *blob)
>  {
> -	*secid = 0;
> -	return call_int_hook(secctx_to_secid, 0, secdata, seclen, secid);
> +	struct security_hook_list *hp;
> +	int rc;
> +
> +	lsmblob_init(blob, 0);
> +	hlist_for_each_entry(hp, &security_hook_heads.secctx_to_secid, list) {
> +		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
> +			continue;
> +		rc = hp->hook.secctx_to_secid(secdata, seclen,
> +					      &blob->secid[hp->lsmid->slot]);
> +		if (rc != 0)
> +			return rc;
> +	}
> +	return 0;
>  }
>  EXPORT_SYMBOL(security_secctx_to_secid);
>  
> @@ -2222,9 +2234,21 @@ void security_inet_conn_established(struct sock *sk,
>  }
>  EXPORT_SYMBOL(security_inet_conn_established);
>  
> -int security_secmark_relabel_packet(u32 secid)
> +int security_secmark_relabel_packet(struct lsmblob *blob)
>  {
> -	return call_int_hook(secmark_relabel_packet, 0, secid);
> +	struct security_hook_list *hp;
> +	int rc = 0;
> +
> +	hlist_for_each_entry(hp, &security_hook_heads.secmark_relabel_packet,
> +			     list) {
> +		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
> +			continue;
> +		rc = hp->hook.secmark_relabel_packet(
> +						blob->secid[hp->lsmid->slot]);
> +		if (rc != 0)
> +			break;
> +	}
> +	return rc;
>  }
>  EXPORT_SYMBOL(security_secmark_relabel_packet);
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


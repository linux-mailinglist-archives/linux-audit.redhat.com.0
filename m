Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 37DE01A13C4
	for <lists+linux-audit@lfdr.de>; Tue,  7 Apr 2020 20:37:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586284628;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q7PgpKbWQYUdQaVwdGoxM9cIfZzfYCcg0O4pTGZ2IPw=;
	b=FlF1CBadfeiOL0gxYJ3h3h+3mRU3jl3qBoqK33oJQsD+i1ohaxmnnejo7mfvCLtv7gs4Jm
	5Sienm/WDR0MuMm9BdCZI4M8ikfbjPVtYLvgSxwW31afi8RKWTlvExY54763JZVZZ8Sud8
	Wm3aQ37pdHsE8oFbPxTA1OV6vwAZ9xU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-DptafBA5MHGROUBok7WYyQ-1; Tue, 07 Apr 2020 14:37:05 -0400
X-MC-Unique: DptafBA5MHGROUBok7WYyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8016107ACC9;
	Tue,  7 Apr 2020 18:36:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BE9110002BC;
	Tue,  7 Apr 2020 18:36:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A2D51803C32;
	Tue,  7 Apr 2020 18:36:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 037IaYW4007237 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 7 Apr 2020 14:36:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 882EE2166B27; Tue,  7 Apr 2020 18:36:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 801052166B2A
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 18:36:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC4EA101A55E
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 18:36:31 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-454-BqqsH3v1PNeAqmndSOZXVg-1; Tue, 07 Apr 2020 14:36:29 -0400
X-MC-Unique: BqqsH3v1PNeAqmndSOZXVg-1
Received: by mail-pg1-f195.google.com with SMTP id n13so696142pgp.11
	for <linux-audit@redhat.com>; Tue, 07 Apr 2020 11:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=aHnRL++sQeIzIG4uOoaQVOsp/SJs7CMC+RGF+Q09CSs=;
	b=Y2dJWqAQ48FAPlCLGcv6Q8j9z0VlNJgRASloSSGUPbxTMg/sECBtEAOltaED+ZBJXY
	nJvaQGWq6YvOhtB++5sUF21BYoxS4ohklyCzfiQOz2xtKfYS2T4LTOH6AA302by0pd4l
	dopL94xgUvLk+MLxF11nJJ8XKN3YW8UpSqkRl0CgLFpFpCaxiqra7ZD2LkRAKfFrsP/7
	BfBI7eh6x1uueoHpMD0/gBOX0BUtn6xCpGusJt7vFLhu3FBuPa3D4bj6O31xDOAlXsmY
	F5wliXvjQlN5ePs577hhsR9E9HVAxT1m7MXkLSxFYZ3rtCJXPGMvXVz4Yl4jGZC2OLNU
	dcuA==
X-Gm-Message-State: AGi0PuZ6KFXfVFIhsI7L9M5PEKMWHJYXpMQKQq2+LrAsJRrXq9vWVP6X
	2CQAJnFatFEqET51a7qltcMzUA==
X-Google-Smtp-Source: APiQypLnXrP5UBZa+Ix8QihYZWzGch3sH+UT2i++hPq0fSIx0Me4vkk4P1WotRNKueZeRSDGVNl2ug==
X-Received: by 2002:a62:7a82:: with SMTP id v124mr3693734pfc.10.1586284587788; 
	Tue, 07 Apr 2020 11:36:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	y207sm14844397pfb.189.2020.04.07.11.36.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Apr 2020 11:36:26 -0700 (PDT)
Date: Tue, 7 Apr 2020 11:36:25 -0700
From: Kees Cook <keescook@chromium.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v16 05/23] net: Prepare UDS for security module stacking
Message-ID: <202004071136.02DAD485@keescook>
References: <20200407000159.43602-1-casey@schaufler-ca.com>
	<20200407000159.43602-6-casey@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <20200407000159.43602-6-casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 037IaYW4007237
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Apr 06, 2020 at 05:01:41PM -0700, Casey Schaufler wrote:
> Change the data used in UDS SO_PEERSEC processing from a
> secid to a more general struct lsmblob. Update the
> security_socket_getpeersec_dgram() interface to use the
> lsmblob. There is a small amount of scaffolding code
> that will come out when the security_secid_to_secctx()
> code is brought in line with the lsmblob.
> 
> The secid field of the unix_skb_parms structure has been
> replaced with a pointer to an lsmblob structure, and the
> lsmblob is allocated as needed. This is similar to how the
> list of passed files is managed. While an lsmblob structure
> will fit in the available space today, there is no guarantee
> that the addition of other data to the unix_skb_parms or
> support for additional security modules wouldn't exceed what
> is available.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> cc: netdev@vger.kernel.org
> ---
>  include/linux/security.h |  7 +++++--
>  include/net/af_unix.h    |  2 +-
>  include/net/scm.h        |  8 +++++---
>  net/ipv4/ip_sockglue.c   |  8 +++++---
>  net/unix/af_unix.c       |  7 ++++---
>  net/unix/scm.c           |  6 ++++++
>  security/security.c      | 18 +++++++++++++++---
>  7 files changed, 41 insertions(+), 15 deletions(-)
> 
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 1bfaf9ece13e..2ad58e2900e7 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -1358,7 +1358,8 @@ int security_socket_shutdown(struct socket *sock, int how);
>  int security_sock_rcv_skb(struct sock *sk, struct sk_buff *skb);
>  int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
>  				      int __user *optlen, unsigned len);
> -int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid);
> +int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
> +				     struct lsmblob *blob);
>  int security_sk_alloc(struct sock *sk, int family, gfp_t priority);
>  void security_sk_free(struct sock *sk);
>  void security_sk_clone(const struct sock *sk, struct sock *newsk);
> @@ -1496,7 +1497,9 @@ static inline int security_socket_getpeersec_stream(struct socket *sock, char __
>  	return -ENOPROTOOPT;
>  }
>  
> -static inline int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid)
> +static inline int security_socket_getpeersec_dgram(struct socket *sock,
> +						   struct sk_buff *skb,
> +						   struct lsmblob *blob)
>  {
>  	return -ENOPROTOOPT;
>  }
> diff --git a/include/net/af_unix.h b/include/net/af_unix.h
> index 17e10fba2152..83c3b3034030 100644
> --- a/include/net/af_unix.h
> +++ b/include/net/af_unix.h
> @@ -36,7 +36,7 @@ struct unix_skb_parms {
>  	kgid_t			gid;
>  	struct scm_fp_list	*fp;		/* Passed files		*/
>  #ifdef CONFIG_SECURITY_NETWORK
> -	u32			secid;		/* Security ID		*/
> +	struct lsmblob		*lsmdata;	/* Security LSM data	*/
>  #endif
>  	u32			consumed;
>  } __randomize_layout;
> diff --git a/include/net/scm.h b/include/net/scm.h
> index 1ce365f4c256..e2e71c4bf9d0 100644
> --- a/include/net/scm.h
> +++ b/include/net/scm.h
> @@ -33,7 +33,7 @@ struct scm_cookie {
>  	struct scm_fp_list	*fp;		/* Passed files		*/
>  	struct scm_creds	creds;		/* Skb credentials	*/
>  #ifdef CONFIG_SECURITY_NETWORK
> -	u32			secid;		/* Passed security ID 	*/
> +	struct lsmblob		lsmblob;	/* Passed LSM data	*/
>  #endif
>  };
>  
> @@ -46,7 +46,7 @@ struct scm_fp_list *scm_fp_dup(struct scm_fp_list *fpl);
>  #ifdef CONFIG_SECURITY_NETWORK
>  static __inline__ void unix_get_peersec_dgram(struct socket *sock, struct scm_cookie *scm)
>  {
> -	security_socket_getpeersec_dgram(sock, NULL, &scm->secid);
> +	security_socket_getpeersec_dgram(sock, NULL, &scm->lsmblob);
>  }
>  #else
>  static __inline__ void unix_get_peersec_dgram(struct socket *sock, struct scm_cookie *scm)
> @@ -97,7 +97,9 @@ static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct sc
>  	int err;
>  
>  	if (test_bit(SOCK_PASSSEC, &sock->flags)) {
> -		err = security_secid_to_secctx(scm->secid, &secdata, &seclen);
> +		/* Scaffolding - it has to be element 0 for now */
> +		err = security_secid_to_secctx(scm->lsmblob.secid[0],
> +					       &secdata, &seclen);
>  
>  		if (!err) {
>  			put_cmsg(msg, SOL_SOCKET, SCM_SECURITY, seclen, secdata);
> diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
> index aa3fd61818c4..6cf57d5ac899 100644
> --- a/net/ipv4/ip_sockglue.c
> +++ b/net/ipv4/ip_sockglue.c
> @@ -130,15 +130,17 @@ static void ip_cmsg_recv_checksum(struct msghdr *msg, struct sk_buff *skb,
>  
>  static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
>  {
> +	struct lsmblob lb;
>  	char *secdata;
> -	u32 seclen, secid;
> +	u32 seclen;
>  	int err;
>  
> -	err = security_socket_getpeersec_dgram(NULL, skb, &secid);
> +	err = security_socket_getpeersec_dgram(NULL, skb, &lb);
>  	if (err)
>  		return;
>  
> -	err = security_secid_to_secctx(secid, &secdata, &seclen);
> +	/* Scaffolding - it has to be element 0 */
> +	err = security_secid_to_secctx(lb.secid[0], &secdata, &seclen);
>  	if (err)
>  		return;
>  
> diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
> index 68debcb28fa4..179876573d6d 100644
> --- a/net/unix/af_unix.c
> +++ b/net/unix/af_unix.c
> @@ -138,17 +138,18 @@ static struct hlist_head *unix_sockets_unbound(void *addr)
>  #ifdef CONFIG_SECURITY_NETWORK
>  static void unix_get_secdata(struct scm_cookie *scm, struct sk_buff *skb)
>  {
> -	UNIXCB(skb).secid = scm->secid;
> +	UNIXCB(skb).lsmdata = kmemdup(&scm->lsmblob, sizeof(scm->lsmblob),
> +				      GFP_KERNEL);
>  }
>  
>  static inline void unix_set_secdata(struct scm_cookie *scm, struct sk_buff *skb)
>  {
> -	scm->secid = UNIXCB(skb).secid;
> +	scm->lsmblob = *(UNIXCB(skb).lsmdata);
>  }
>  
>  static inline bool unix_secdata_eq(struct scm_cookie *scm, struct sk_buff *skb)
>  {
> -	return (scm->secid == UNIXCB(skb).secid);
> +	return lsmblob_equal(&scm->lsmblob, UNIXCB(skb).lsmdata);
>  }
>  #else
>  static inline void unix_get_secdata(struct scm_cookie *scm, struct sk_buff *skb)
> diff --git a/net/unix/scm.c b/net/unix/scm.c
> index 8c40f2b32392..3094323935a4 100644
> --- a/net/unix/scm.c
> +++ b/net/unix/scm.c
> @@ -142,6 +142,12 @@ void unix_destruct_scm(struct sk_buff *skb)
>  	scm.pid  = UNIXCB(skb).pid;
>  	if (UNIXCB(skb).fp)
>  		unix_detach_fds(&scm, skb);
> +#ifdef CONFIG_SECURITY_NETWORK
> +	if (UNIXCB(skb).lsmdata) {
> +		kfree(UNIXCB(skb).lsmdata);
> +		UNIXCB(skb).lsmdata = NULL;
> +	}
> +#endif
>  
>  	/* Alas, it calls VFS */
>  	/* So fscking what? fput() had been SMP-safe since the last Summer */
> diff --git a/security/security.c b/security/security.c
> index 914aecd89822..2fa826000889 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -2140,10 +2140,22 @@ int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
>  				optval, optlen, len);
>  }
>  
> -int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid)
> +int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
> +				     struct lsmblob *blob)
>  {
> -	return call_int_hook(socket_getpeersec_dgram, -ENOPROTOOPT, sock,
> -			     skb, secid);
> +	struct security_hook_list *hp;
> +	int rc = -ENOPROTOOPT;
> +
> +	hlist_for_each_entry(hp, &security_hook_heads.socket_getpeersec_dgram,
> +			     list) {
> +		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
> +			continue;
> +		rc = hp->hook.socket_getpeersec_dgram(sock, skb,
> +						&blob->secid[hp->lsmid->slot]);
> +		if (rc != 0)
> +			break;
> +	}
> +	return rc;
>  }
>  EXPORT_SYMBOL(security_socket_getpeersec_dgram);
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


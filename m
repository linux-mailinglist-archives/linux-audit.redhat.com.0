Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 844095FD2F0
	for <lists+linux-audit@lfdr.de>; Thu, 13 Oct 2022 03:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665625734;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=we962S9H7MqfZdUKUa1lMxIH7jja6ep+myAS1ES6cxo=;
	b=ayE+uCrW1kWOYZJZvQnWed6kjfbB2ToIopw9OSqUBHUeOsf0I/2H4O4mL2GasX+dNtluaZ
	9PMcSnKBPfeKEGiPBegr5wQ+h1XPMC5SmRAF4B+qb68kzjJS1HNxI8CpxmxZuPR2JDy+zy
	cMQaSm5SufcpF97RijBYpRqZReZhaBk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-A7vL50krMWKtWtMPf_eosw-1; Wed, 12 Oct 2022 21:48:53 -0400
X-MC-Unique: A7vL50krMWKtWtMPf_eosw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A07B03C11058;
	Thu, 13 Oct 2022 01:48:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02F4AC16922;
	Thu, 13 Oct 2022 01:47:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E552B19465B6;
	Thu, 13 Oct 2022 01:47:50 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 822371946588 for <linux-audit@listman.corp.redhat.com>;
 Wed, 12 Oct 2022 21:18:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 583E5111CA02; Wed, 12 Oct 2022 21:18:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50FAA1121320
 for <linux-audit@redhat.com>; Wed, 12 Oct 2022 21:18:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E50D299E75E
 for <linux-audit@redhat.com>; Wed, 12 Oct 2022 21:18:02 +0000 (UTC)
Received: from smtp-8fa9.mail.infomaniak.ch (smtp-8fa9.mail.infomaniak.ch
 [83.166.143.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-404-TuVlo8XzPIyUV_t3XWXnyQ-1; Wed, 12 Oct 2022 17:18:00 -0400
X-MC-Unique: TuVlo8XzPIyUV_t3XWXnyQ-1
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
 by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4MnlqT4PtTzMqV3n;
 Wed, 12 Oct 2022 23:17:57 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
 by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4MnlqS5WmQzMppql;
 Wed, 12 Oct 2022 23:17:56 +0200 (CEST)
Message-ID: <c9d98857-1ea4-fd55-53fb-0669223830ec@digikod.net>
Date: Wed, 12 Oct 2022 23:17:56 +0200
MIME-Version: 1.0
User-Agent: 
Subject: Re: [PATCH v38 08/39] LSM: Infrastructure management of the sock
 security
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
 paul@paul-moore.com, linux-security-module@vger.kernel.org
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-9-casey@schaufler-ca.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <20220927195421.14713-9-casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Thu, 13 Oct 2022 01:47:49 +0000
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
 linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 27/09/2022 21:53, Casey Schaufler wrote:
> Move management of the sock->sk_security blob out
> of the individual security modules and into the security
> infrastructure. Instead of allocating the blobs from within
> the modules the modules tell the infrastructure how much
> space is required, and the space is allocated there.
> 
> Acked-by: Paul Moore <paul@paul-moore.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>   include/linux/lsm_hooks.h         |  1 +
>   security/apparmor/include/net.h   |  6 ++-
>   security/apparmor/lsm.c           | 38 ++++----------
>   security/apparmor/net.c           |  2 +-
>   security/security.c               | 36 +++++++++++++-
>   security/selinux/hooks.c          | 82 +++++++++++++++----------------
>   security/selinux/include/objsec.h |  5 ++
>   security/selinux/netlabel.c       | 23 ++++-----
>   security/smack/smack.h            |  5 ++
>   security/smack/smack_lsm.c        | 66 ++++++++++++-------------
>   security/smack/smack_netfilter.c  |  4 +-
>   11 files changed, 146 insertions(+), 122 deletions(-)
> 
> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
> index ded76db3f523..b266d0826278 100644
> --- a/include/linux/lsm_hooks.h
> +++ b/include/linux/lsm_hooks.h
> @@ -1625,6 +1625,7 @@ struct lsm_blob_sizes {
>   	int	lbs_cred;
>   	int	lbs_file;
>   	int	lbs_inode;
> +	int	lbs_sock;
>   	int	lbs_superblock;
>   	int	lbs_ipc;
>   	int	lbs_msg_msg;
> diff --git a/security/apparmor/include/net.h b/security/apparmor/include/net.h
> index aadb4b29fb66..fac8999ba7a3 100644
> --- a/security/apparmor/include/net.h
> +++ b/security/apparmor/include/net.h
> @@ -51,7 +51,11 @@ struct aa_sk_ctx {
>   	struct aa_label *peer;
>   };
>   
> -#define SK_CTX(X) ((X)->sk_security)
> +static inline struct aa_sk_ctx *aa_sock(const struct sock *sk)
> +{
> +	return sk->sk_security + apparmor_blob_sizes.lbs_sock;
> +}
> +
>   #define SOCK_ctx(X) SOCK_INODE(X)->i_security
>   #define DEFINE_AUDIT_NET(NAME, OP, SK, F, T, P)				  \
>   	struct lsm_network_audit NAME ## _net = { .sk = (SK),		  \
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 40266cc4866c..caad42a0c913 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -803,33 +803,15 @@ static int apparmor_task_kill(struct task_struct *target, struct kernel_siginfo
>   	return error;
>   }
>   
> -/**
> - * apparmor_sk_alloc_security - allocate and attach the sk_security field
> - */
> -static int apparmor_sk_alloc_security(struct sock *sk, int family, gfp_t flags)
> -{
> -	struct aa_sk_ctx *ctx;
> -
> -	ctx = kzalloc(sizeof(*ctx), flags);
> -	if (!ctx)
> -		return -ENOMEM;
> -
> -	SK_CTX(sk) = ctx;
> -
> -	return 0;
> -}
> -
>   /**
>    * apparmor_sk_free_security - free the sk_security field
>    */
>   static void apparmor_sk_free_security(struct sock *sk)
>   {
> -	struct aa_sk_ctx *ctx = SK_CTX(sk);
> +	struct aa_sk_ctx *ctx = aa_sock(sk);
>   
> -	SK_CTX(sk) = NULL;
>   	aa_put_label(ctx->label);
>   	aa_put_label(ctx->peer);
> -	kfree(ctx);
>   }
>   
>   /**
> @@ -838,8 +820,8 @@ static void apparmor_sk_free_security(struct sock *sk)
>   static void apparmor_sk_clone_security(const struct sock *sk,
>   				       struct sock *newsk)
>   {
> -	struct aa_sk_ctx *ctx = SK_CTX(sk);
> -	struct aa_sk_ctx *new = SK_CTX(newsk);
> +	struct aa_sk_ctx *ctx = aa_sock(sk);
> +	struct aa_sk_ctx *new = aa_sock(newsk);
>   
>   	if (new->label)
>   		aa_put_label(new->label);
> @@ -892,7 +874,7 @@ static int apparmor_socket_post_create(struct socket *sock, int family,
>   		label = aa_get_current_label();
>   
>   	if (sock->sk) {
> -		struct aa_sk_ctx *ctx = SK_CTX(sock->sk);
> +		struct aa_sk_ctx *ctx = aa_sock(sock->sk);
>   
>   		aa_put_label(ctx->label);
>   		ctx->label = aa_get_label(label);
> @@ -1077,7 +1059,7 @@ static int apparmor_socket_shutdown(struct socket *sock, int how)
>    */
>   static int apparmor_socket_sock_rcv_skb(struct sock *sk, struct sk_buff *skb)
>   {
> -	struct aa_sk_ctx *ctx = SK_CTX(sk);
> +	struct aa_sk_ctx *ctx = aa_sock(sk);
>   
>   	if (!skb->secmark)
>   		return 0;
> @@ -1090,7 +1072,7 @@ static int apparmor_socket_sock_rcv_skb(struct sock *sk, struct sk_buff *skb)
>   
>   static struct aa_label *sk_peer_label(struct sock *sk)
>   {
> -	struct aa_sk_ctx *ctx = SK_CTX(sk);
> +	struct aa_sk_ctx *ctx = aa_sock(sk);
>   
>   	if (ctx->peer)
>   		return ctx->peer;
> @@ -1174,7 +1156,7 @@ static int apparmor_socket_getpeersec_dgram(struct socket *sock,
>    */
>   static void apparmor_sock_graft(struct sock *sk, struct socket *parent)
>   {
> -	struct aa_sk_ctx *ctx = SK_CTX(sk);
> +	struct aa_sk_ctx *ctx = aa_sock(sk);
>   
>   	if (!ctx->label)
>   		ctx->label = aa_get_current_label();
> @@ -1184,7 +1166,7 @@ static void apparmor_sock_graft(struct sock *sk, struct socket *parent)
>   static int apparmor_inet_conn_request(const struct sock *sk, struct sk_buff *skb,
>   				      struct request_sock *req)
>   {
> -	struct aa_sk_ctx *ctx = SK_CTX(sk);
> +	struct aa_sk_ctx *ctx = aa_sock(sk);
>   
>   	if (!skb->secmark)
>   		return 0;
> @@ -1201,6 +1183,7 @@ struct lsm_blob_sizes apparmor_blob_sizes __lsm_ro_after_init = {
>   	.lbs_cred = sizeof(struct aa_task_ctx *),
>   	.lbs_file = sizeof(struct aa_file_ctx),
>   	.lbs_task = sizeof(struct aa_task_ctx),
> +	.lbs_sock = sizeof(struct aa_sk_ctx),
>   };
>   
>   static struct lsm_id apparmor_lsmid __lsm_ro_after_init = {
> @@ -1243,7 +1226,6 @@ static struct security_hook_list apparmor_hooks[] __lsm_ro_after_init = {
>   	LSM_HOOK_INIT(getprocattr, apparmor_getprocattr),
>   	LSM_HOOK_INIT(setprocattr, apparmor_setprocattr),
>   
> -	LSM_HOOK_INIT(sk_alloc_security, apparmor_sk_alloc_security),
>   	LSM_HOOK_INIT(sk_free_security, apparmor_sk_free_security),
>   	LSM_HOOK_INIT(sk_clone_security, apparmor_sk_clone_security),
>   
> @@ -1809,7 +1791,7 @@ static unsigned int apparmor_ip_postroute(void *priv,
>   	if (sk == NULL)
>   		return NF_ACCEPT;
>   
> -	ctx = SK_CTX(sk);
> +	ctx = aa_sock(sk);
>   	if (!apparmor_secmark_check(ctx->label, OP_SENDMSG, AA_MAY_SEND,
>   				    skb->secmark, sk))
>   		return NF_ACCEPT;
> diff --git a/security/apparmor/net.c b/security/apparmor/net.c
> index 7efe4d17273d..b336e23a4467 100644
> --- a/security/apparmor/net.c
> +++ b/security/apparmor/net.c
> @@ -145,7 +145,7 @@ int aa_af_perm(struct aa_label *label, const char *op, u32 request, u16 family,
>   static int aa_label_sk_perm(struct aa_label *label, const char *op, u32 request,
>   			    struct sock *sk)
>   {
> -	struct aa_sk_ctx *ctx = SK_CTX(sk);
> +	struct aa_sk_ctx *ctx = aa_sock(sk);
>   	int error = 0;
>   
>   	AA_BUG(!label);
> diff --git a/security/security.c b/security/security.c
> index b916469388b0..7a604a74716a 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -30,6 +30,7 @@
>   #include <linux/msg.h>
>   #include <uapi/linux/lsm.h>
>   #include <net/flow.h>
> +#include <net/sock.h>
>   
>   #define MAX_LSM_EVM_XATTR	2
>   
> @@ -207,6 +208,7 @@ static void __init lsm_set_blob_sizes(struct lsm_blob_sizes *needed)
>   	lsm_set_blob_size(&needed->lbs_inode, &blob_sizes.lbs_inode);
>   	lsm_set_blob_size(&needed->lbs_ipc, &blob_sizes.lbs_ipc);
>   	lsm_set_blob_size(&needed->lbs_msg_msg, &blob_sizes.lbs_msg_msg);
> +	lsm_set_blob_size(&needed->lbs_sock, &blob_sizes.lbs_sock);
>   	lsm_set_blob_size(&needed->lbs_superblock, &blob_sizes.lbs_superblock);
>   	lsm_set_blob_size(&needed->lbs_task, &blob_sizes.lbs_task);
>   }
> @@ -349,6 +351,7 @@ static void __init ordered_lsm_init(void)
>   	init_debug("inode blob size      = %d\n", blob_sizes.lbs_inode);
>   	init_debug("ipc blob size        = %d\n", blob_sizes.lbs_ipc);
>   	init_debug("msg_msg blob size    = %d\n", blob_sizes.lbs_msg_msg);
> +	init_debug("sock blob size       = %d\n", blob_sizes.lbs_sock);
>   	init_debug("superblock blob size = %d\n", blob_sizes.lbs_superblock);
>   	init_debug("task blob size       = %d\n", blob_sizes.lbs_task);
>   
> @@ -678,6 +681,28 @@ static int lsm_msg_msg_alloc(struct msg_msg *mp)
>   	return 0;
>   }
>   
> +/**
> + * lsm_sock_alloc - allocate a composite sock blob
> + * @sock: the sock that needs a blob
> + * @priority: allocation mode
> + *
> + * Allocate the sock blob for all the modules
> + *
> + * Returns 0, or -ENOMEM if memory can't be allocated.
> + */
> +static int lsm_sock_alloc(struct sock *sock, gfp_t priority)

This is not used (and throw a warning) if CONFIG_SECURITY_NETWORK is not 
defined.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA971A1519
	for <lists+linux-audit@lfdr.de>; Tue,  7 Apr 2020 20:43:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586285016;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PcpH3fr/ZyrjhB7jGZyubBihzKCc78zEmejSrj1iLgI=;
	b=X9ThWlUgo4i26AKgV4/aSzl/Hjdw+k5irLBdA/L0GCfxaWgJBe0pUcmoN0D+tgmJWJQYu7
	Ztj94UNA54Tr+rVkyd08S+ANd1UhOzymk54upXGN9Bz7OwDtn1k9JGXz4eeIxKIBycFX2w
	e0q2tYCaBRrnTMKVyVi2hG7kDlXbmI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-eLpPE-3UOH62hYsdvtIkKg-1; Tue, 07 Apr 2020 14:43:34 -0400
X-MC-Unique: eLpPE-3UOH62hYsdvtIkKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6942B13F8;
	Tue,  7 Apr 2020 18:43:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E866019C69;
	Tue,  7 Apr 2020 18:43:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54B7B93A62;
	Tue,  7 Apr 2020 18:43:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 037IhOoZ008022 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 7 Apr 2020 14:43:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E67320230A6; Tue,  7 Apr 2020 18:43:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A32E2026D69
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 18:43:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B67A18FF66C
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 18:43:21 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-85-t4PO4gqlNWW5UmwSjiyEvg-1; Tue, 07 Apr 2020 14:43:19 -0400
X-MC-Unique: t4PO4gqlNWW5UmwSjiyEvg-1
Received: by mail-pj1-f65.google.com with SMTP id k3so130772pjj.2
	for <linux-audit@redhat.com>; Tue, 07 Apr 2020 11:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=aWFfuPdMIgsENljoUMiI9SU8Q9i1frzzzO5RCjP6DXA=;
	b=FeMg+C7YE/A/JdYqtJ20OP2rDA8wd6PxFzEq0QEM6tfw5iBDiuVpmSnMl4pjBPcWcY
	806hueFnNaDo8hr5PjIz8KgoYJaRpqkIof4thZyj549ZFbfVDMSyxCqC39OjSULGfcS7
	dAAEALzHpcQfV4hYckfWvSVjNG9W0x9GZvh+cWko/76eJtEmQZ/XpuVloNxounxlFRXt
	nIHB7otaXp/8oQvTOTDZT+EsmTtn0esH6R88FI81MFxVgs2h4h8jqgm3ujBMWxAYPpyI
	v9i8cR9U7E1vignJI9RtLD2kAkUuFLLV6Q+Ou5j0BwdwxcXOY3oltKqboCoNcqbcH0Aj
	nyPQ==
X-Gm-Message-State: AGi0PuZKTOOcwia+QlAOPnPLt8rXr+sgYXyRFUUg4Y/YL2LSxW/FmKSw
	N+eaBv2/CyFHgIOtdECawE8OXg==
X-Google-Smtp-Source: APiQypIQWcKUX9MPeWoVlEbvqbawPoymLCYJtWqfDxC5vuwpRfHdMIBJ+EJJrj0M2jdeVcsJL+Ra4A==
X-Received: by 2002:a17:902:8c94:: with SMTP id
	t20mr3571272plo.336.1586284998202; 
	Tue, 07 Apr 2020 11:43:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	k12sm1366131pgj.33.2020.04.07.11.43.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Apr 2020 11:43:17 -0700 (PDT)
Date: Tue, 7 Apr 2020 11:43:16 -0700
From: Kees Cook <keescook@chromium.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v16 20/23] Audit: Add a new record for multiple subject
	LSM attributes
Message-ID: <202004071143.60C2D1F29@keescook>
References: <20200407000159.43602-1-casey@schaufler-ca.com>
	<20200407000159.43602-21-casey@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <20200407000159.43602-21-casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 037IhOoZ008022
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Apr 06, 2020 at 05:01:56PM -0700, Casey Schaufler wrote:
> Create a new audit record type to contain the subject information
> when there are multiple security modules that require such data.
> This record is emitted before the other records for the event, but
> is linked with the same timestamp and serial number.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> Cc: linux-audit@redhat.com
> ---
>  drivers/android/binder.c                |  2 +-
>  include/linux/security.h                |  9 +++-
>  include/net/scm.h                       |  3 +-
>  include/uapi/linux/audit.h              |  1 +
>  kernel/audit.c                          | 56 +++++++++++++++++++------
>  kernel/auditsc.c                        |  7 ++--
>  net/ipv4/ip_sockglue.c                  |  2 +-
>  net/netfilter/nf_conntrack_netlink.c    |  4 +-
>  net/netfilter/nf_conntrack_standalone.c |  2 +-
>  net/netfilter/nfnetlink_queue.c         |  2 +-
>  net/netlabel/netlabel_unlabeled.c       | 11 +++--
>  net/netlabel/netlabel_user.c            |  2 +-
>  security/security.c                     | 51 ++++++++++++++++++++--
>  13 files changed, 118 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index c76fc2abd091..e79c4948ab12 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -3109,7 +3109,7 @@ static void binder_transaction(struct binder_proc *proc,
>  		size_t added_size;
>  
>  		security_task_getsecid(proc->tsk, &blob);
> -		ret = security_secid_to_secctx(&blob, &lsmctx);
> +		ret = security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_DISPLAY);
>  		if (ret) {
>  			return_error = BR_FAILED_REPLY;
>  			return_error_param = ret;
> diff --git a/include/linux/security.h b/include/linux/security.h
> index fac5547dd89e..896b939f5d62 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -178,6 +178,8 @@ struct lsmblob {
>  #define LSMBLOB_INVALID		-1	/* Not a valid LSM slot number */
>  #define LSMBLOB_NEEDED		-2	/* Slot requested on initialization */
>  #define LSMBLOB_NOT_NEEDED	-3	/* Slot not requested */
> +#define LSMBLOB_DISPLAY		-4	/* Use the "display" slot */
> +#define LSMBLOB_FIRST		-5	/* Use the default "display" slot */
>  
>  /**
>   * lsmblob_init - initialize an lsmblob structure.
> @@ -240,6 +242,8 @@ static inline u32 lsmblob_value(const struct lsmblob *blob)
>  	return 0;
>  }
>  
> +const char *security_lsm_slot_name(int slot);
> +
>  /* These functions are in security/commoncap.c */
>  extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
>  		       int cap, unsigned int opts);
> @@ -549,7 +553,8 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
>  			 size_t size);
>  int security_netlink_send(struct sock *sk, struct sk_buff *skb);
>  int security_ismaclabel(const char *name);
> -int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp);
> +int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp,
> +			     int display);
>  int security_secctx_to_secid(const char *secdata, u32 seclen,
>  			     struct lsmblob *blob);
>  void security_release_secctx(struct lsmcontext *cp);
> @@ -1354,7 +1359,7 @@ static inline int security_ismaclabel(const char *name)
>  }
>  
>  static inline int security_secid_to_secctx(struct lsmblob *blob,
> -					   struct lsmcontext *cp)
> +					   struct lsmcontext *cp, int display)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/include/net/scm.h b/include/net/scm.h
> index 4a6ad8caf423..8b5a4737e1b8 100644
> --- a/include/net/scm.h
> +++ b/include/net/scm.h
> @@ -96,7 +96,8 @@ static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct sc
>  	int err;
>  
>  	if (test_bit(SOCK_PASSSEC, &sock->flags)) {
> -		err = security_secid_to_secctx(&scm->lsmblob, &context);
> +		err = security_secid_to_secctx(&scm->lsmblob, &context,
> +					       LSMBLOB_DISPLAY);
>  
>  		if (!err) {
>  			put_cmsg(msg, SOL_SOCKET, SCM_SECURITY,
> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index a534d71e689a..2e6dbf907ee3 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -138,6 +138,7 @@
>  #define AUDIT_MAC_UNLBL_STCDEL	1417	/* NetLabel: del a static label */
>  #define AUDIT_MAC_CALIPSO_ADD	1418	/* NetLabel: add CALIPSO DOI entry */
>  #define AUDIT_MAC_CALIPSO_DEL	1419	/* NetLabel: del CALIPSO DOI entry */
> +#define AUDIT_MAC_TASK_CONTEXTS	1420	/* Multiple LSM contexts */
>  
>  #define AUDIT_FIRST_KERN_ANOM_MSG   1700
>  #define AUDIT_LAST_KERN_ANOM_MSG    1799
> diff --git a/kernel/audit.c b/kernel/audit.c
> index 013a90dd2bd5..00a4fbecfdf7 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -1419,7 +1419,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
>  	case AUDIT_SIGNAL_INFO:
>  		if (lsmblob_is_set(&audit_sig_lsm)) {
>  			err = security_secid_to_secctx(&audit_sig_lsm,
> -						       &context);
> +						       &context, LSMBLOB_FIRST);
>  			if (err)
>  				return err;
>  		}
> @@ -2058,28 +2058,58 @@ void audit_log_key(struct audit_buffer *ab, char *key)
>  
>  int audit_log_task_context(struct audit_buffer *ab)
>  {
> +	int i;
>  	int error;
> +	bool sep = false;
>  	struct lsmblob blob;
> -	struct lsmcontext context;
> +	struct lsmcontext lsmdata;
> +	struct audit_buffer *lsmab = NULL;
> +	struct audit_context *context = NULL;
>  
>  	security_task_getsecid(current, &blob);
>  	if (!lsmblob_is_set(&blob))
>  		return 0;
>  
> -	error = security_secid_to_secctx(&blob, &context);
> -	if (error) {
> -		if (error != -EINVAL)
> -			goto error_path;
> -		return 0;
> +	/*
> +	 * If there is more than one security module that has a
> +	 * subject "context" it's necessary to put the subject data
> +	 * into a separate record to maintain compatibility.
> +	 */
> +	if (security_lsm_slot_name(1) != NULL) {
> +		audit_log_format(ab, " subj=?");
> +		context = ab->ctx;
> +		if (context)
> +			lsmab = audit_log_start(context, GFP_KERNEL,
> +						AUDIT_MAC_TASK_CONTEXTS);
>  	}
>  
> -	audit_log_format(ab, " subj=%s", context.context);
> -	security_release_secctx(&context);
> -	return 0;
> +	for (i = 0; i < LSMBLOB_ENTRIES; i++) {
> +		if (blob.secid[i] == 0)
> +			continue;
> +		error = security_secid_to_secctx(&blob, &lsmdata, i);
> +		if (error && error != -EINVAL) {
> +			audit_panic("error in audit_log_task_context");
> +			return error;
> +		}
> +
> +		if (context) {
> +			audit_log_format(lsmab, "%ssubj_%s=%s",
> +					 sep ? " " : "",
> +					 security_lsm_slot_name(i),
> +					 lsmdata.context);
> +			sep = true;
> +		} else
> +			audit_log_format(ab, " subj=%s", lsmdata.context);
> +
> +		security_release_secctx(&lsmdata);
> +		if (!context)
> +			break;
> +	}
> +
> +	if (context)
> +		audit_log_end(lsmab);
>  
> -error_path:
> -	audit_panic("error in audit_log_task_context");
> -	return error;
> +	return 0;
>  }
>  EXPORT_SYMBOL(audit_log_task_context);
>  
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index b7275860ba5f..4df540c32581 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -980,7 +980,7 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
>  			 from_kuid(&init_user_ns, auid),
>  			 from_kuid(&init_user_ns, uid), sessionid);
>  	if (lsmblob_is_set(blob)) {
> -		if (security_secid_to_secctx(blob, &lsmctx)) {
> +		if (security_secid_to_secctx(blob, &lsmctx, LSMBLOB_FIRST)) {
>  			audit_log_format(ab, " obj=(none)");
>  			rc = 1;
>  		} else {
> @@ -1225,7 +1225,8 @@ static void show_special(struct audit_context *context, int *call_panic)
>  			struct lsmblob blob;
>  
>  			lsmblob_init(&blob, osid);
> -			if (security_secid_to_secctx(&blob, &lsmcxt)) {
> +			if (security_secid_to_secctx(&blob, &lsmcxt,
> +						     LSMBLOB_FIRST)) {
>  				audit_log_format(ab, " osid=%u", osid);
>  				*call_panic = 1;
>  			} else {
> @@ -1377,7 +1378,7 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
>  		struct lsmcontext lsmctx;
>  
>  		lsmblob_init(&blob, n->osid);
> -		if (security_secid_to_secctx(&blob, &lsmctx)) {
> +		if (security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_FIRST)) {
>  			audit_log_format(ab, " osid=%u", n->osid);
>  			if (call_panic)
>  				*call_panic = 2;
> diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
> index 27af7a6b8780..10b418029cdd 100644
> --- a/net/ipv4/ip_sockglue.c
> +++ b/net/ipv4/ip_sockglue.c
> @@ -138,7 +138,7 @@ static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
>  	if (err)
>  		return;
>  
> -	err = security_secid_to_secctx(&lb, &context);
> +	err = security_secid_to_secctx(&lb, &context, LSMBLOB_DISPLAY);
>  	if (err)
>  		return;
>  
> diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
> index 2fa1e5bd781d..cd559fada596 100644
> --- a/net/netfilter/nf_conntrack_netlink.c
> +++ b/net/netfilter/nf_conntrack_netlink.c
> @@ -337,7 +337,7 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb, const struct nf_conn *ct)
>  	 * security_secid_to_secctx() will know which security module
>  	 * to use to create the secctx.  */
>  	lsmblob_init(&blob, ct->secmark);
> -	ret = security_secid_to_secctx(&blob, &context);
> +	ret = security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
>  	if (ret)
>  		return 0;
>  
> @@ -651,7 +651,7 @@ static inline int ctnetlink_secctx_size(const struct nf_conn *ct)
>  	struct lsmblob blob;
>  	struct lsmcontext context;
>  
> -	ret = security_secid_to_secctx(&blob, &context);
> +	ret = security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
>  	if (ret)
>  		return 0;
>  
> diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_conntrack_standalone.c
> index 383a4f44be63..9551e8be6ca4 100644
> --- a/net/netfilter/nf_conntrack_standalone.c
> +++ b/net/netfilter/nf_conntrack_standalone.c
> @@ -177,7 +177,7 @@ static void ct_show_secctx(struct seq_file *s, const struct nf_conn *ct)
>  	struct lsmcontext context;
>  
>  	lsmblob_init(&blob, ct->secmark);
> -	ret = security_secid_to_secctx(&blob, &context);
> +	ret = security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
>  	if (ret)
>  		return;
>  
> diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
> index d07900c317fd..dc8902f8cea2 100644
> --- a/net/netfilter/nfnetlink_queue.c
> +++ b/net/netfilter/nfnetlink_queue.c
> @@ -316,7 +316,7 @@ static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, struct lsmcontext *context)
>  		 * blob. security_secid_to_secctx() will know which security
>  		 * module to use to create the secctx.  */
>  		lsmblob_init(&blob, skb->secmark);
> -		security_secid_to_secctx(&blob, context);
> +		security_secid_to_secctx(&blob, context, LSMBLOB_DISPLAY);
>  	}
>  
>  	read_unlock_bh(&skb->sk->sk_callback_lock);
> diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
> index c14a485ff045..d816909866cc 100644
> --- a/net/netlabel/netlabel_unlabeled.c
> +++ b/net/netlabel/netlabel_unlabeled.c
> @@ -437,7 +437,8 @@ int netlbl_unlhsh_add(struct net *net,
>  unlhsh_add_return:
>  	rcu_read_unlock();
>  	if (audit_buf != NULL) {
> -		if (security_secid_to_secctx(lsmblob, &context) == 0) {
> +		if (security_secid_to_secctx(lsmblob, &context,
> +					     LSMBLOB_FIRST) == 0) {
>  			audit_log_format(audit_buf, " sec_obj=%s",
>  					 context.context);
>  			security_release_secctx(&context);
> @@ -492,7 +493,8 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
>  		if (dev != NULL)
>  			dev_put(dev);
>  		if (entry != NULL &&
> -		    security_secid_to_secctx(&entry->lsmblob, &context) == 0) {
> +		    security_secid_to_secctx(&entry->lsmblob, &context,
> +					     LSMBLOB_FIRST) == 0) {
>  			audit_log_format(audit_buf, " sec_obj=%s",
>  					 context.context);
>  			security_release_secctx(&context);
> @@ -552,7 +554,8 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
>  		if (dev != NULL)
>  			dev_put(dev);
>  		if (entry != NULL &&
> -		    security_secid_to_secctx(&entry->lsmblob, &context) == 0) {
> +		    security_secid_to_secctx(&entry->lsmblob, &context,
> +					     LSMBLOB_FIRST) == 0) {
>  			audit_log_format(audit_buf, " sec_obj=%s",
>  					 context.context);
>  			security_release_secctx(&context);
> @@ -1122,7 +1125,7 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
>  		lsmb = (struct lsmblob *)&addr6->lsmblob;
>  	}
>  
> -	ret_val = security_secid_to_secctx(lsmb, &context);
> +	ret_val = security_secid_to_secctx(lsmb, &context, LSMBLOB_FIRST);
>  	if (ret_val != 0)
>  		goto list_cb_failure;
>  	ret_val = nla_put(cb_arg->skb,
> diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
> index 951ba0639d20..1941877fd16f 100644
> --- a/net/netlabel/netlabel_user.c
> +++ b/net/netlabel/netlabel_user.c
> @@ -100,7 +100,7 @@ struct audit_buffer *netlbl_audit_start_common(int type,
>  
>  	lsmblob_init(&blob, audit_info->secid);
>  	if (audit_info->secid != 0 &&
> -	    security_secid_to_secctx(&blob, &context) == 0) {
> +	    security_secid_to_secctx(&blob, &context, LSMBLOB_FIRST) == 0) {
>  		audit_log_format(audit_buf, " subj=%s", context.context);
>  		security_release_secctx(&context);
>  	}
> diff --git a/security/security.c b/security/security.c
> index b7c2ed1eee42..d3bf71d66724 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -480,7 +480,31 @@ static int lsm_append(const char *new, char **result)
>   * Pointers to the LSM id structures for local use.
>   */
>  static int lsm_slot __lsm_ro_after_init;
> -static struct lsm_id *lsm_slotlist[LSMBLOB_ENTRIES];
> +static struct lsm_id *lsm_slotlist[LSMBLOB_ENTRIES] __lsm_ro_after_init;
> +
> +/**
> + * security_lsm_slot_name - Get the name of the security module in a slot
> + * @slot: index into the "display" slot list.
> + *
> + * Provide the name of the security module associated with
> + * a display slot.
> + *
> + * If @slot is LSMBLOB_INVALID return the value
> + * for slot 0 if it has been set, otherwise NULL.
> + *
> + * Returns a pointer to the name string or NULL.
> + */
> +const char *security_lsm_slot_name(int slot)
> +{
> +	if (slot == LSMBLOB_INVALID)
> +		slot = 0;
> +	else if (slot >= LSMBLOB_ENTRIES || slot < 0)
> +		return NULL;
> +
> +	if (lsm_slotlist[slot] == NULL)
> +		return NULL;
> +	return lsm_slotlist[slot]->lsm;
> +}
>  
>  /**
>   * security_add_hooks - Add a modules hooks to the hook lists.
> @@ -2169,13 +2193,32 @@ int security_ismaclabel(const char *name)
>  }
>  EXPORT_SYMBOL(security_ismaclabel);
>  
> -int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp)
> +int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp,
> +			     int display)
>  {
>  	struct security_hook_list *hp;
> -	int display = lsm_task_display(current);
>  
>  	memset(cp, 0, sizeof(*cp));
>  
> +	/*
> +	 * display either is the slot number use for formatting
> +	 * or an instruction on which relative slot to use.
> +	 */
> +	if (display == LSMBLOB_DISPLAY)
> +		display = lsm_task_display(current);
> +	else if (display == LSMBLOB_FIRST)
> +		display = LSMBLOB_INVALID;
> +	else if (display < 0) {
> +		WARN_ONCE(true,
> +			"LSM: %s unknown display\n", __func__);
> +		display = LSMBLOB_INVALID;
> +	} else if (display >= lsm_slot) {
> +		WARN_ONCE(true,
> +			"LSM: %s invalid display\n", __func__);
> +		display = LSMBLOB_INVALID;
> +	}
> +
> +
>  	hlist_for_each_entry(hp, &security_hook_heads.secid_to_secctx, list) {
>  		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
>  			continue;
> @@ -2186,7 +2229,7 @@ int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp)
>  					&cp->context, &cp->len);
>  		}
>  	}
> -	return 0;
> +	return -EOPNOTSUPP;
>  }
>  EXPORT_SYMBOL(security_secid_to_secctx);
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


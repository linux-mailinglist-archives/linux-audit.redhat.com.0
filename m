Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D98531A1523
	for <lists+linux-audit@lfdr.de>; Tue,  7 Apr 2020 20:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586285052;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PTwkgIS4iouuYdAsN0JeQdukkk1MAoXW6WqsA0ucrPE=;
	b=bsvQvUSYZFjUPbfem5YMwTx0Z2lUjEuAyNEXQwvILo3kJvt20S+Lb4esIE7xYC1vSkNJOk
	exfTdWu5JEZZjTw/MpeCq2C8VTPvT7avHjPlk+eAxqcD8P/SrQ760mYWLTWviggNoXG6DW
	4ZBJtOoHvyc5naKv3ixrDyEmd9Q9Cd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-as7lcEWZPxq-VekLMbsMNg-1; Tue, 07 Apr 2020 14:44:11 -0400
X-MC-Unique: as7lcEWZPxq-VekLMbsMNg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 446EB8017F3;
	Tue,  7 Apr 2020 18:44:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1299699DEF;
	Tue,  7 Apr 2020 18:44:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B094E93A62;
	Tue,  7 Apr 2020 18:44:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 037Ii1x4008088 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 7 Apr 2020 14:44:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4C7810ABC96; Tue,  7 Apr 2020 18:44:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0CA710ABC8F
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 18:43:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B301185A78F
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 18:43:59 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-189-spFYt8PpOV-_4b-BW2A8sg-1; Tue, 07 Apr 2020 14:43:55 -0400
X-MC-Unique: spFYt8PpOV-_4b-BW2A8sg-1
Received: by mail-pj1-f65.google.com with SMTP id q16so1380473pje.1
	for <linux-audit@redhat.com>; Tue, 07 Apr 2020 11:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=fTiDneXmJHXWR79FocZB97LPz5VyRes0dVnQaJxwFe8=;
	b=Rg8Bo0m6ZZ6BtylYt1j4fEftCM+9dHduMgnFszvh7P5TLkNld608MZYcv65MBZrRsP
	0RxEbxykqUirWU0O5wAHHUe+GtqVb5wS/cmituRBWmZI8ymux8BfrByJ2UKO77DCeiPB
	b/c1NfaDwGp9jNjo4+hrS29r6ronPhjeFhg/MIVvHeRruEg/LObRCF089eK6pCriNgmL
	P4R3G48xH/ItMSiTOOL8Sl+zrwBGYACVSHzhaYmgjUbrvoHU676gIaW46tJu+cl8UITe
	ArlfKh9qBbQz4eQ4xLP6CzbvchbVMCViEA1/KYBYAWN8qexxviPB1jeJz/H7vNiqPa2U
	A91w==
X-Gm-Message-State: AGi0PuagV1iKV7GlIhpAB3Y+XoCtBoz9hxInVk+IdsJVUGhvTOKdSH8m
	GRzYL3r/+lDYz+XNVoIFLxCauw==
X-Google-Smtp-Source: APiQypISlujf12Z+gZJsUCR9+GqyLL4yBrdWMACVoU/iHcPSICucyaiyFo7ztUupmf/+vP86R6upEw==
X-Received: by 2002:a17:90a:7785:: with SMTP id
	v5mr808169pjk.120.1586285034092; 
	Tue, 07 Apr 2020 11:43:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	h64sm14258601pfg.191.2020.04.07.11.43.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Apr 2020 11:43:53 -0700 (PDT)
Date: Tue, 7 Apr 2020 11:43:52 -0700
From: Kees Cook <keescook@chromium.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v16 21/23] Audit: Add a new record for multiple object
	LSM attributes
Message-ID: <202004071143.067D340B9@keescook>
References: <20200407000159.43602-1-casey@schaufler-ca.com>
	<20200407000159.43602-22-casey@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <20200407000159.43602-22-casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 037Ii1x4008088
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

On Mon, Apr 06, 2020 at 05:01:57PM -0700, Casey Schaufler wrote:
> Create a new audit record type to contain the object information
> when there are multiple security modules that require such data.
> This record is emitted before the other records for the event, but
> is linked with the same timestamp and serial number.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  include/linux/audit.h      |  2 ++
>  include/uapi/linux/audit.h |  1 +
>  kernel/audit.c             | 53 +++++++++++++++++++++++++++++
>  kernel/audit.h             |  4 +--
>  kernel/auditsc.c           | 70 +++++---------------------------------
>  5 files changed, 67 insertions(+), 63 deletions(-)
> 
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index 8e1c759fd1ff..4c7c0ee867a1 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -163,6 +163,8 @@ extern void		    audit_log_path_denied(int type,
>  extern void		    audit_log_lost(const char *message);
>  
>  extern int audit_log_task_context(struct audit_buffer *ab);
> +extern int audit_log_object_context(struct audit_buffer *ab,
> +				    struct lsmblob *blob);
>  extern void audit_log_task_info(struct audit_buffer *ab);
>  
>  extern int		    audit_update_lsm_rules(void);
> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index 2e6dbf907ee3..2269100ba0ca 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -139,6 +139,7 @@
>  #define AUDIT_MAC_CALIPSO_ADD	1418	/* NetLabel: add CALIPSO DOI entry */
>  #define AUDIT_MAC_CALIPSO_DEL	1419	/* NetLabel: del CALIPSO DOI entry */
>  #define AUDIT_MAC_TASK_CONTEXTS	1420	/* Multiple LSM contexts */
> +#define AUDIT_MAC_OBJ_CONTEXTS	1421	/* Multiple LSM object contexts */
>  
>  #define AUDIT_FIRST_KERN_ANOM_MSG   1700
>  #define AUDIT_LAST_KERN_ANOM_MSG    1799
> diff --git a/kernel/audit.c b/kernel/audit.c
> index 00a4fbecfdf7..6a6146a34cc9 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2113,6 +2113,59 @@ int audit_log_task_context(struct audit_buffer *ab)
>  }
>  EXPORT_SYMBOL(audit_log_task_context);
>  
> +int audit_log_object_context(struct audit_buffer *ab,
> +				    struct lsmblob *blob)
> +{
> +	int i;
> +	int error;
> +	bool sep = false;
> +	struct lsmcontext lsmdata;
> +	struct audit_buffer *lsmab = NULL;
> +	struct audit_context *context = NULL;
> +
> +	/*
> +	 * If there is more than one security module that has a
> +	 * object "context" it's necessary to put the object data
> +	 * into a separate record to maintain compatibility.
> +	 */
> +	if (security_lsm_slot_name(1) != NULL) {
> +		audit_log_format(ab, " obj=?");
> +		context = ab->ctx;
> +		if (context)
> +			lsmab = audit_log_start(context, GFP_KERNEL,
> +						AUDIT_MAC_OBJ_CONTEXTS);
> +	}
> +
> +	for (i = 0; i < LSMBLOB_ENTRIES; i++) {
> +		if (blob->secid[i] == 0)
> +			continue;
> +		error = security_secid_to_secctx(blob, &lsmdata, i);
> +		if (error && error != -EINVAL) {
> +			audit_panic("error in audit_log_object_context");
> +			return error;
> +		}
> +
> +		if (context) {
> +			audit_log_format(lsmab, "%sobj_%s=%s",
> +					 sep ? " " : "",
> +					 security_lsm_slot_name(i),
> +					 lsmdata.context);
> +			sep = true;
> +		} else
> +			audit_log_format(ab, " obj=%s", lsmdata.context);
> +
> +		security_release_secctx(&lsmdata);
> +		if (!context)
> +			break;
> +	}
> +
> +	if (context)
> +		audit_log_end(lsmab);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(audit_log_object_context);
> +
>  void audit_log_d_path_exe(struct audit_buffer *ab,
>  			  struct mm_struct *mm)
>  {
> diff --git a/kernel/audit.h b/kernel/audit.h
> index f65f516913c6..9a26ba213f6a 100644
> --- a/kernel/audit.h
> +++ b/kernel/audit.h
> @@ -78,7 +78,7 @@ struct audit_names {
>  	kuid_t			uid;
>  	kgid_t			gid;
>  	dev_t			rdev;
> -	u32			osid;
> +	struct lsmblob		oblob;
>  	struct audit_cap_data	fcap;
>  	unsigned int		fcap_ver;
>  	unsigned char		type;		/* record type */
> @@ -152,7 +152,7 @@ struct audit_context {
>  			kuid_t			uid;
>  			kgid_t			gid;
>  			umode_t			mode;
> -			u32			osid;
> +			struct lsmblob		oblob;
>  			int			has_perm;
>  			uid_t			perm_uid;
>  			gid_t			perm_gid;
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 4df540c32581..f567f3776ca5 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -659,14 +659,6 @@ static int audit_filter_rules(struct task_struct *tsk,
>  			if (f->lsm_isset) {
>  				/* Find files that match */
>  				if (name) {
> -					/*
> -					 * lsmblob_init sets all values in the
> -					 * lsmblob to sid. This is temporary
> -					 * until name->osid is converted to a
> -					 * lsmblob, which happens later in
> -					 * this patch set.
> -					 */
> -					lsmblob_init(&blob, name->osid);
>  					result = security_audit_rule_match(
>  								&blob,
>  								f->type,
> @@ -674,7 +666,6 @@ static int audit_filter_rules(struct task_struct *tsk,
>  								f->lsm_rules);
>  				} else if (ctx) {
>  					list_for_each_entry(n, &ctx->names_list, list) {
> -						lsmblob_init(&blob, name->osid);
>  						if (security_audit_rule_match(
>  								&blob,
>  								f->type,
> @@ -688,8 +679,7 @@ static int audit_filter_rules(struct task_struct *tsk,
>  				/* Find ipc objects that match */
>  				if (!ctx || ctx->type != AUDIT_IPC)
>  					break;
> -				lsmblob_init(&blob, ctx->ipc.osid);
> -				if (security_audit_rule_match(&blob,
> +				if (security_audit_rule_match(&ctx->ipc.oblob,
>  							      f->type, f->op,
>  							      f->lsm_rules))
>  					++result;
> @@ -969,7 +959,6 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
>  				 struct lsmblob *blob, char *comm)
>  {
>  	struct audit_buffer *ab;
> -	struct lsmcontext lsmctx;
>  	int rc = 0;
>  
>  	ab = audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
> @@ -979,15 +968,7 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
>  	audit_log_format(ab, "opid=%d oauid=%d ouid=%d oses=%d", pid,
>  			 from_kuid(&init_user_ns, auid),
>  			 from_kuid(&init_user_ns, uid), sessionid);
> -	if (lsmblob_is_set(blob)) {
> -		if (security_secid_to_secctx(blob, &lsmctx, LSMBLOB_FIRST)) {
> -			audit_log_format(ab, " obj=(none)");
> -			rc = 1;
> -		} else {
> -			audit_log_format(ab, " obj=%s", lsmctx.context);
> -			security_release_secctx(&lsmctx);
> -		}
> -	}
> +	rc = audit_log_object_context(ab, blob);
>  	audit_log_format(ab, " ocomm=");
>  	audit_log_untrustedstring(ab, comm);
>  	audit_log_end(ab);
> @@ -1214,26 +1195,14 @@ static void show_special(struct audit_context *context, int *call_panic)
>  				context->socketcall.args[i]);
>  		break; }
>  	case AUDIT_IPC: {
> -		u32 osid = context->ipc.osid;
> +		struct lsmblob *oblob = &context->ipc.oblob;
>  
>  		audit_log_format(ab, "ouid=%u ogid=%u mode=%#ho",
>  				 from_kuid(&init_user_ns, context->ipc.uid),
>  				 from_kgid(&init_user_ns, context->ipc.gid),
>  				 context->ipc.mode);
> -		if (osid) {
> -			struct lsmcontext lsmcxt;
> -			struct lsmblob blob;
> -
> -			lsmblob_init(&blob, osid);
> -			if (security_secid_to_secctx(&blob, &lsmcxt,
> -						     LSMBLOB_FIRST)) {
> -				audit_log_format(ab, " osid=%u", osid);
> -				*call_panic = 1;
> -			} else {
> -				audit_log_format(ab, " obj=%s", lsmcxt.context);
> -				security_release_secctx(&lsmcxt);
> -			}
> -		}
> +		if (audit_log_object_context(ab, oblob))
> +			*call_panic = 1;
>  		if (context->ipc.has_perm) {
>  			audit_log_end(ab);
>  			ab = audit_log_start(context, GFP_KERNEL,
> @@ -1373,20 +1342,8 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
>  				 from_kgid(&init_user_ns, n->gid),
>  				 MAJOR(n->rdev),
>  				 MINOR(n->rdev));
> -	if (n->osid != 0) {
> -		struct lsmblob blob;
> -		struct lsmcontext lsmctx;
> -
> -		lsmblob_init(&blob, n->osid);
> -		if (security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_FIRST)) {
> -			audit_log_format(ab, " osid=%u", n->osid);
> -			if (call_panic)
> -				*call_panic = 2;
> -		} else {
> -			audit_log_format(ab, " obj=%s", lsmctx.context);
> -			security_release_secctx(&lsmctx);
> -		}
> -	}
> +	if (audit_log_object_context(ab, &n->oblob) && call_panic)
> +		*call_panic = 2;
>  
>  	/* log the audit_names record type */
>  	switch (n->type) {
> @@ -1935,17 +1892,13 @@ static void audit_copy_inode(struct audit_names *name,
>  			     const struct dentry *dentry,
>  			     struct inode *inode, unsigned int flags)
>  {
> -	struct lsmblob blob;
> -
>  	name->ino   = inode->i_ino;
>  	name->dev   = inode->i_sb->s_dev;
>  	name->mode  = inode->i_mode;
>  	name->uid   = inode->i_uid;
>  	name->gid   = inode->i_gid;
>  	name->rdev  = inode->i_rdev;
> -	security_inode_getsecid(inode, &blob);
> -	/* scaffolding until osid is updated */
> -	name->osid = blob.secid[0];
> +	security_inode_getsecid(inode, &name->oblob);
>  	if (flags & AUDIT_INODE_NOEVAL) {
>  		name->fcap_ver = -1;
>  		return;
> @@ -2291,16 +2244,11 @@ void __audit_mq_getsetattr(mqd_t mqdes, struct mq_attr *mqstat)
>  void __audit_ipc_obj(struct kern_ipc_perm *ipcp)
>  {
>  	struct audit_context *context = audit_context();
> -	struct lsmblob blob;
>  	context->ipc.uid = ipcp->uid;
>  	context->ipc.gid = ipcp->gid;
>  	context->ipc.mode = ipcp->mode;
>  	context->ipc.has_perm = 0;
> -	security_ipc_getsecid(ipcp, &blob);
> -	/* context->ipc.osid will be changed to a lsmblob later in
> -	 * the patch series. This will allow auditing of all the object
> -	 * labels associated with the ipc object. */
> -	context->ipc.osid = lsmblob_value(&blob);
> +	security_ipc_getsecid(ipcp, &context->ipc.oblob);
>  	context->type = AUDIT_IPC;
>  }
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


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F178E3201B7
	for <lists+linux-audit@lfdr.de>; Sat, 20 Feb 2021 00:29:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-NZHjo0TfMP27XFoUza0Hmg-1; Fri, 19 Feb 2021 18:29:42 -0500
X-MC-Unique: NZHjo0TfMP27XFoUza0Hmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 488F01936B65;
	Fri, 19 Feb 2021 23:29:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C4486FEE2;
	Fri, 19 Feb 2021 23:29:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 797834EE7F;
	Fri, 19 Feb 2021 23:29:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11JNT9I0029865 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 19 Feb 2021 18:29:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 71C6820CA486; Fri, 19 Feb 2021 23:29:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C3382166B2D
	for <linux-audit@redhat.com>; Fri, 19 Feb 2021 23:29:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F8B89291A3
	for <linux-audit@redhat.com>; Fri, 19 Feb 2021 23:29:09 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-244-TbTvmkpEN7mgmXQBovYahA-1; Fri, 19 Feb 2021 18:29:07 -0500
X-MC-Unique: TbTvmkpEN7mgmXQBovYahA-1
Received: by mail-qk1-f172.google.com with SMTP id t62so7265414qke.7
	for <linux-audit@redhat.com>; Fri, 19 Feb 2021 15:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=wCyRr1s1Q50L7dfTjP22sXRMm4M7NMzKEpM5WNi5jqk=;
	b=WKRMJb9mFcioW03vcg9n36fPNh9W78AsOxvZtYmqmVrRf2mHaZOWxFKDPPuJ3T4L/i
	OPT2paFN+6ifgmcETbwDd0IPwIwdDr/+RnLB0f4A92JNp0z0jX2XFjBfDUgWscbC6MGX
	7Y+gq1tTKTVT6utnGT+LYlm9S93evOIRutEPt12XMPMkJ11oTq9LSg+VMWkQDqUhy6+W
	cRmTb6v2ucTwKNF/3unFz4hg3CQ2H3sH9Mq5q1CaTwAZwPzDAxt1PUHIfiw/hImiI262
	mU2DIhcLAgXbBrDErJSxewoCnNZx4dLXdO5YJdUsVmHnP1+M5ISTCy3CEY7Ls0EuCmZK
	q5zA==
X-Gm-Message-State: AOAM530Od8aNqczzGfFISQaMoYCJIAIGr6byymvD60XXBxaO5F0hLN+8
	JeCec7km0ZJIcqL7vu6K5g+a
X-Google-Smtp-Source: ABdhPJwefJ+uwNrxQOowyEJn+AzsJsiW4N1Zdv6Kj2OjaRlAHxpVSVQQMNepnsnj6NpQpZGpUncI4A==
X-Received: by 2002:a37:63c7:: with SMTP id
	x190mr11874580qkb.189.1613777346436; 
	Fri, 19 Feb 2021 15:29:06 -0800 (PST)
Received: from localhost ([151.203.60.33])
	by smtp.gmail.com with ESMTPSA id 76sm7464944qke.95.2021.02.19.15.29.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 19 Feb 2021 15:29:05 -0800 (PST)
Subject: [RFC PATCH 1/4] lsm: separate security_task_getsecid() into
	subjective and objective variants
From: Paul Moore <paul@paul-moore.com>
To: Casey Schaufler <casey@schaufler-ca.com>,
	John Johansen <john.johansen@canonical.com>
Date: Fri, 19 Feb 2021 18:29:05 -0500
Message-ID: <161377734508.87807.8537642254664217815.stgit@sifl>
In-Reply-To: <161377712068.87807.12246856567527156637.stgit@sifl>
References: <161377712068.87807.12246856567527156637.stgit@sifl>
User-Agent: StGit/1.0
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Of the three LSMs that implement the security_task_getsecid() LSM
hook, all three LSMs provide the task's objective security
credentials.  This turns out to be unfortunate as most of the hook's
callers seem to expect the task's subjective credentials, although
a small handful of callers do correctly expect the objective
credentials.

This patch is the first step towards fixing the problem: it splits
the existing security_task_getsecid() hook into two variants, one
for the subjective creds, one for the objective creds.

  void security_task_getsecid_subj(struct task_struct *p,
				   u32 *secid);
  void security_task_getsecid_obj(struct task_struct *p,
				  u32 *secid);

While this patch does fix all of the callers to use the correct
variant, in order to keep this patch focused on the callers and to
ease review, the LSMs continue to use the same implementation for
both hooks.  The net effect is that this patch should not change
the behavior of the kernel in any way, it will be up to the latter
LSM specific patches in this series to change the hook
implementations and return the correct credentials.

Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 drivers/android/binder.c              |    2 +-
 include/linux/cred.h                  |    2 +-
 include/linux/lsm_hook_defs.h         |    5 ++++-
 include/linux/lsm_hooks.h             |    8 ++++++--
 include/linux/security.h              |   10 ++++++++--
 kernel/audit.c                        |    4 ++--
 kernel/auditfilter.c                  |    3 ++-
 kernel/auditsc.c                      |    8 ++++----
 net/netlabel/netlabel_unlabeled.c     |    2 +-
 net/netlabel/netlabel_user.h          |    2 +-
 security/apparmor/lsm.c               |    3 ++-
 security/integrity/ima/ima_appraise.c |    2 +-
 security/integrity/ima/ima_main.c     |   14 +++++++-------
 security/security.c                   |   13 ++++++++++---
 security/selinux/hooks.c              |    3 ++-
 security/smack/smack_lsm.c            |    3 ++-
 16 files changed, 54 insertions(+), 30 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index c119736ca56ac..39d501261108d 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -2700,7 +2700,7 @@ static void binder_transaction(struct binder_proc *proc,
 		u32 secid;
 		size_t added_size;
 
-		security_task_getsecid(proc->tsk, &secid);
+		security_task_getsecid_subj(proc->tsk, &secid);
 		ret = security_secid_to_secctx(secid, &secctx, &secctx_sz);
 		if (ret) {
 			return_error = BR_FAILED_REPLY;
diff --git a/include/linux/cred.h b/include/linux/cred.h
index 18639c069263f..42b9d88d9a565 100644
--- a/include/linux/cred.h
+++ b/include/linux/cred.h
@@ -140,7 +140,7 @@ struct cred {
 	struct key	*request_key_auth; /* assumed request_key authority */
 #endif
 #ifdef CONFIG_SECURITY
-	void		*security;	/* subjective LSM security */
+	void		*security;	/* LSM security */
 #endif
 	struct user_struct *user;	/* real user ID subscription */
 	struct user_namespace *user_ns; /* user_ns the caps and keyrings are relative to. */
diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index dfd261dcbcb04..1490a185135a0 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -200,7 +200,10 @@ LSM_HOOK(int, 0, task_fix_setgid, struct cred *new, const struct cred * old,
 LSM_HOOK(int, 0, task_setpgid, struct task_struct *p, pid_t pgid)
 LSM_HOOK(int, 0, task_getpgid, struct task_struct *p)
 LSM_HOOK(int, 0, task_getsid, struct task_struct *p)
-LSM_HOOK(void, LSM_RET_VOID, task_getsecid, struct task_struct *p, u32 *secid)
+LSM_HOOK(void, LSM_RET_VOID, task_getsecid_subj,
+	 struct task_struct *p, u32 *secid)
+LSM_HOOK(void, LSM_RET_VOID, task_getsecid_obj,
+	 struct task_struct *p, u32 *secid)
 LSM_HOOK(int, 0, task_setnice, struct task_struct *p, int nice)
 LSM_HOOK(int, 0, task_setioprio, struct task_struct *p, int ioprio)
 LSM_HOOK(int, 0, task_getioprio, struct task_struct *p)
diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index bdfc8a76a4f79..13d2a9a6f2014 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -706,8 +706,12 @@
  *	@p.
  *	@p contains the task_struct for the process.
  *	Return 0 if permission is granted.
- * @task_getsecid:
- *	Retrieve the security identifier of the process @p.
+ * @task_getsecid_subj:
+ *	Retrieve the subjective security identifier of the process @p.
+ *	@p contains the task_struct for the process and place is into @secid.
+ *	In case of failure, @secid will be set to zero.
+ * @task_getsecid_obj:
+ *	Retrieve the objective security identifier of the process @p.
  *	@p contains the task_struct for the process and place is into @secid.
  *	In case of failure, @secid will be set to zero.
  *
diff --git a/include/linux/security.h b/include/linux/security.h
index b0d14f04b16de..1826bb0cea825 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -406,7 +406,8 @@ int security_task_fix_setgid(struct cred *new, const struct cred *old,
 int security_task_setpgid(struct task_struct *p, pid_t pgid);
 int security_task_getpgid(struct task_struct *p);
 int security_task_getsid(struct task_struct *p);
-void security_task_getsecid(struct task_struct *p, u32 *secid);
+void security_task_getsecid_subj(struct task_struct *p, u32 *secid);
+void security_task_getsecid_obj(struct task_struct *p, u32 *secid);
 int security_task_setnice(struct task_struct *p, int nice);
 int security_task_setioprio(struct task_struct *p, int ioprio);
 int security_task_getioprio(struct task_struct *p);
@@ -1084,7 +1085,12 @@ static inline int security_task_getsid(struct task_struct *p)
 	return 0;
 }
 
-static inline void security_task_getsecid(struct task_struct *p, u32 *secid)
+static inline void security_task_getsecid_subj(struct task_struct *p, u32 *secid)
+{
+	*secid = 0;
+}
+
+static inline void security_task_getsecid_obj(struct task_struct *p, u32 *secid)
 {
 	*secid = 0;
 }
diff --git a/kernel/audit.c b/kernel/audit.c
index 1ffc2e059027d..8e725db6ecb02 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2132,7 +2132,7 @@ int audit_log_task_context(struct audit_buffer *ab)
 	int error;
 	u32 sid;
 
-	security_task_getsecid(current, &sid);
+	security_task_getsecid_subj(current, &sid);
 	if (!sid)
 		return 0;
 
@@ -2353,7 +2353,7 @@ int audit_signal_info(int sig, struct task_struct *t)
 			audit_sig_uid = auid;
 		else
 			audit_sig_uid = uid;
-		security_task_getsecid(current, &audit_sig_sid);
+		security_task_getsecid_subj(current, &audit_sig_sid);
 	}
 
 	return audit_signal_info_syscall(t);
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 333b3bcfc5458..db2c6b59dfc33 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1359,7 +1359,8 @@ int audit_filter(int msgtype, unsigned int listtype)
 			case AUDIT_SUBJ_SEN:
 			case AUDIT_SUBJ_CLR:
 				if (f->lsm_rule) {
-					security_task_getsecid(current, &sid);
+					security_task_getsecid_subj(current,
+								    &sid);
 					result = security_audit_rule_match(sid,
 						   f->type, f->op, f->lsm_rule);
 				}
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index ce8c9e2279ba9..3bfbecca4664a 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -667,7 +667,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 			   logged upon error */
 			if (f->lsm_rule) {
 				if (need_sid) {
-					security_task_getsecid(tsk, &sid);
+					security_task_getsecid_subj(tsk, &sid);
 					need_sid = 0;
 				}
 				result = security_audit_rule_match(sid, f->type,
@@ -2400,7 +2400,7 @@ void __audit_ptrace(struct task_struct *t)
 	context->target_auid = audit_get_loginuid(t);
 	context->target_uid = task_uid(t);
 	context->target_sessionid = audit_get_sessionid(t);
-	security_task_getsecid(t, &context->target_sid);
+	security_task_getsecid_obj(t, &context->target_sid);
 	memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
 }
 
@@ -2427,7 +2427,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 		ctx->target_auid = audit_get_loginuid(t);
 		ctx->target_uid = t_uid;
 		ctx->target_sessionid = audit_get_sessionid(t);
-		security_task_getsecid(t, &ctx->target_sid);
+		security_task_getsecid_obj(t, &ctx->target_sid);
 		memcpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
 		return 0;
 	}
@@ -2448,7 +2448,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 	axp->target_auid[axp->pid_count] = audit_get_loginuid(t);
 	axp->target_uid[axp->pid_count] = t_uid;
 	axp->target_sessionid[axp->pid_count] = audit_get_sessionid(t);
-	security_task_getsecid(t, &axp->target_sid[axp->pid_count]);
+	security_task_getsecid_obj(t, &axp->target_sid[axp->pid_count]);
 	memcpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
 	axp->pid_count++;
 
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
index ccb4916428116..3e6ac9b790b15 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -1539,7 +1539,7 @@ int __init netlbl_unlabel_defconf(void)
 	/* Only the kernel is allowed to call this function and the only time
 	 * it is called is at bootup before the audit subsystem is reporting
 	 * messages so don't worry to much about these values. */
-	security_task_getsecid(current, &audit_info.secid);
+	security_task_getsecid_subj(current, &audit_info.secid);
 	audit_info.loginuid = GLOBAL_ROOT_UID;
 	audit_info.sessionid = 0;
 
diff --git a/net/netlabel/netlabel_user.h b/net/netlabel/netlabel_user.h
index 3c67afce64f12..b9ba8112b3c52 100644
--- a/net/netlabel/netlabel_user.h
+++ b/net/netlabel/netlabel_user.h
@@ -34,7 +34,7 @@
 static inline void netlbl_netlink_auditinfo(struct sk_buff *skb,
 					    struct netlbl_audit *audit_info)
 {
-	security_task_getsecid(current, &audit_info->secid);
+	security_task_getsecid_subj(current, &audit_info->secid);
 	audit_info->loginuid = audit_get_loginuid(current);
 	audit_info->sessionid = audit_get_sessionid(current);
 }
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 1b0aba8eb7235..15e37b9132679 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1243,7 +1243,8 @@ static struct security_hook_list apparmor_hooks[] __lsm_ro_after_init = {
 
 	LSM_HOOK_INIT(task_free, apparmor_task_free),
 	LSM_HOOK_INIT(task_alloc, apparmor_task_alloc),
-	LSM_HOOK_INIT(task_getsecid, apparmor_task_getsecid),
+	LSM_HOOK_INIT(task_getsecid_subj, apparmor_task_getsecid),
+	LSM_HOOK_INIT(task_getsecid_obj, apparmor_task_getsecid),
 	LSM_HOOK_INIT(task_setrlimit, apparmor_task_setrlimit),
 	LSM_HOOK_INIT(task_kill, apparmor_task_kill),
 
diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index 8361941ee0a12..afa4923dbd33d 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -75,7 +75,7 @@ int ima_must_appraise(struct inode *inode, int mask, enum ima_hooks func)
 	if (!ima_appraise)
 		return 0;
 
-	security_task_getsecid(current, &secid);
+	security_task_getsecid_subj(current, &secid);
 	return ima_match_policy(inode, current_cred(), secid, func, mask,
 				IMA_APPRAISE | IMA_HASH, NULL, NULL, NULL);
 }
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index f87cb29329e91..97a6913bb3d86 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -391,7 +391,7 @@ int ima_file_mmap(struct file *file, unsigned long prot)
 	u32 secid;
 
 	if (file && (prot & PROT_EXEC)) {
-		security_task_getsecid(current, &secid);
+		security_task_getsecid_subj(current, &secid);
 		return process_measurement(file, current_cred(), secid, NULL,
 					   0, MAY_EXEC, MMAP_CHECK);
 	}
@@ -429,7 +429,7 @@ int ima_file_mprotect(struct vm_area_struct *vma, unsigned long prot)
 	    !(prot & PROT_EXEC) || (vma->vm_flags & VM_EXEC))
 		return 0;
 
-	security_task_getsecid(current, &secid);
+	security_task_getsecid_subj(current, &secid);
 	inode = file_inode(vma->vm_file);
 	action = ima_get_action(inode, current_cred(), secid, MAY_EXEC,
 				MMAP_CHECK, &pcr, &template, 0);
@@ -469,7 +469,7 @@ int ima_bprm_check(struct linux_binprm *bprm)
 	int ret;
 	u32 secid;
 
-	security_task_getsecid(current, &secid);
+	security_task_getsecid_subj(current, &secid);
 	ret = process_measurement(bprm->file, current_cred(), secid, NULL, 0,
 				  MAY_EXEC, BPRM_CHECK);
 	if (ret)
@@ -494,7 +494,7 @@ int ima_file_check(struct file *file, int mask)
 {
 	u32 secid;
 
-	security_task_getsecid(current, &secid);
+	security_task_getsecid_subj(current, &secid);
 	return process_measurement(file, current_cred(), secid, NULL, 0,
 				   mask & (MAY_READ | MAY_WRITE | MAY_EXEC |
 					   MAY_APPEND), FILE_CHECK);
@@ -679,7 +679,7 @@ int ima_read_file(struct file *file, enum kernel_read_file_id read_id,
 
 	/* Read entire file for all partial reads. */
 	func = read_idmap[read_id] ?: FILE_CHECK;
-	security_task_getsecid(current, &secid);
+	security_task_getsecid_subj(current, &secid);
 	return process_measurement(file, current_cred(), secid, NULL,
 				   0, MAY_READ, func);
 }
@@ -722,7 +722,7 @@ int ima_post_read_file(struct file *file, void *buf, loff_t size,
 	}
 
 	func = read_idmap[read_id] ?: FILE_CHECK;
-	security_task_getsecid(current, &secid);
+	security_task_getsecid_subj(current, &secid);
 	return process_measurement(file, current_cred(), secid, buf, size,
 				   MAY_READ, func);
 }
@@ -859,7 +859,7 @@ void process_buffer_measurement(struct inode *inode, const void *buf, int size,
 	 * buffer measurements.
 	 */
 	if (func) {
-		security_task_getsecid(current, &secid);
+		security_task_getsecid_subj(current, &secid);
 		action = ima_get_action(inode, current_cred(), secid, 0, func,
 					&pcr, &template, keyring);
 		if (!(action & IMA_MEASURE))
diff --git a/security/security.c b/security/security.c
index 401663b5b70ea..85e504df051b3 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1757,12 +1757,19 @@ int security_task_getsid(struct task_struct *p)
 	return call_int_hook(task_getsid, 0, p);
 }
 
-void security_task_getsecid(struct task_struct *p, u32 *secid)
+void security_task_getsecid_subj(struct task_struct *p, u32 *secid)
 {
 	*secid = 0;
-	call_void_hook(task_getsecid, p, secid);
+	call_void_hook(task_getsecid_subj, p, secid);
 }
-EXPORT_SYMBOL(security_task_getsecid);
+EXPORT_SYMBOL(security_task_getsecid_subj);
+
+void security_task_getsecid_obj(struct task_struct *p, u32 *secid)
+{
+	*secid = 0;
+	call_void_hook(task_getsecid_obj, p, secid);
+}
+EXPORT_SYMBOL(security_task_getsecid_obj);
 
 int security_task_setnice(struct task_struct *p, int nice)
 {
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index af2994adf9dd1..f311541c4972e 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -7143,7 +7143,8 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(task_setpgid, selinux_task_setpgid),
 	LSM_HOOK_INIT(task_getpgid, selinux_task_getpgid),
 	LSM_HOOK_INIT(task_getsid, selinux_task_getsid),
-	LSM_HOOK_INIT(task_getsecid, selinux_task_getsecid),
+	LSM_HOOK_INIT(task_getsecid_subj, selinux_task_getsecid),
+	LSM_HOOK_INIT(task_getsecid_obj, selinux_task_getsecid),
 	LSM_HOOK_INIT(task_setnice, selinux_task_setnice),
 	LSM_HOOK_INIT(task_setioprio, selinux_task_setioprio),
 	LSM_HOOK_INIT(task_getioprio, selinux_task_getioprio),
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index f69c3dd9a0c67..2bb354ef2c4a9 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4755,7 +4755,8 @@ static struct security_hook_list smack_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(task_setpgid, smack_task_setpgid),
 	LSM_HOOK_INIT(task_getpgid, smack_task_getpgid),
 	LSM_HOOK_INIT(task_getsid, smack_task_getsid),
-	LSM_HOOK_INIT(task_getsecid, smack_task_getsecid),
+	LSM_HOOK_INIT(task_getsecid_subj, smack_task_getsecid),
+	LSM_HOOK_INIT(task_getsecid_obj, smack_task_getsecid),
 	LSM_HOOK_INIT(task_setnice, smack_task_setnice),
 	LSM_HOOK_INIT(task_setioprio, smack_task_setioprio),
 	LSM_HOOK_INIT(task_getioprio, smack_task_getioprio),

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


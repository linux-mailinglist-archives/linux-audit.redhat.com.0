Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8494325339A
	for <lists+linux-audit@lfdr.de>; Wed, 26 Aug 2020 17:26:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-E93TIwTEPU-KNa_2hMB5_Q-1; Wed, 26 Aug 2020 11:26:16 -0400
X-MC-Unique: E93TIwTEPU-KNa_2hMB5_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D83ED109E203;
	Wed, 26 Aug 2020 15:26:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B927174E3B;
	Wed, 26 Aug 2020 15:26:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 899F6181A869;
	Wed, 26 Aug 2020 15:26:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07QFOmqR012032 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 11:24:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D69EA2028DCC; Wed, 26 Aug 2020 15:24:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2514220227BA
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:24:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 705E1102F226
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:24:44 +0000 (UTC)
Received: from sonic310-30.consmr.mail.ne1.yahoo.com
	(sonic310-30.consmr.mail.ne1.yahoo.com [66.163.186.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-217-QToEAYT4MXufrwWLJDhROQ-1;
	Wed, 26 Aug 2020 11:24:40 -0400
X-MC-Unique: QToEAYT4MXufrwWLJDhROQ-1
X-YMail-OSG: P_AidvMVM1nNWApN63lkwYhdttSTQ0u1cNGUCUAxDbir5MfTDyKsyY1OaQyn5gv
	Viv41DZIltDe34Xl9G.zFTvZ0EaF9Z9Tz2kvSm5XXCJCgnzbjokJk5dzgatq4IWrQR0Bws4w57jg
	cJdOksfICcvCY6LWSs0jFH3vhun_RFnBzWXkgM0zB8CP.OXnSDp2kye1yiljCu1p_vzK8M8_rPsK
	cEOIO4WNxr1MuJ.e91rRdhakoxUuyODVD2ASZISxpvOslmqk8lM0eCZtgrJYqv2kH40yfR9gWF07
	mw7UoPDE0fndpriaqxPmIqJNiomrvnBfAZraQWSERy5h29UJL_8psKHVFG_NQPWz3h5Mwc.0_33N
	CY8QJyQSB7Eg5hoZ1lf7K4yB04sTNhRs_EAFeA3.TmOC9c098aUxzX2eBp9Ws90V92oo6Vtf0ca7
	sLCYJ.daEB6LKFGN97GSyc.l1d.MqOlMnK8A6R9YFw0garLApJEew26az_9KwXHt84zdRCp2w86c
	uCoBVx93RisKhT4YsQkwQh4VFveoSX245NUXs36tNGKbjRU06oNzMrLH8Os3nUjvAaOCmTGfEs.a
	V6L6PIqMuIMypa300voNxFkFvh7vfs_gXZtYyHA3mS7x5Irg_7sC.1.R2_A_oPU9CdHFuHGi4K6I
	uV_MSXdFqzEtfQa7_mmk7bMfZS8PUfS5UuRwOpqon31lSUMdLYsOzRSkEb9_eApbb51JsyUhCPsj
	aG3v2bNLAdmxNYpESz_YvtD5a.aYceYlT6T7e2Y0rKxmL_F4QHPPctdxyxjexVY2Has0i4ozaTG8
	.6q.MJr1KNr8RCuCzbvHltN8zJHGFQjAlwaegNr16i6hdnCpZkaMhEw7CibnnQFQfojKayrBnht9
	m7ZSDYnM3_p8UgyUkK9JkXEwu2O05Y7dmdGzTorwdvm12k1ZrC24qKLxRkW.dPEPbwhiEpPauS4y
	2J_0KMTNhJ4GBAdvoYWDcPfiWNa0jvxt.OClEcWWhn4r_LcCE73JvOmvgRsAKYCP7r4PyrVPpl14
	I8c_K9DuIlxahffgAKKS10SiTlvfKd7WjuvrSDwZdG1G41ofVkQpVKRzBq6qO.2axvXEvh6a63mZ
	iSAob2yIwHVB9vXGnpr1D59u9_BrLXGf.E6lLXikhx56ZJ.6d_Hl0XfvZMSXIM8LhBlcw3F24uXy
	.dwsHcr3shhJl.6SYGUNKRVDJ5d7qNsXDLH4ERXmFgI738O00OXnkp0ZRaupkR7MdCrExXDYHYqX
	GpK6Mf7LmAQti22WCy2B7Jtqtu8es2jXLz8AcbpIJaOdL_TaNn_0Tzfxh6Knhmye6aRAzF9PIuMB
	PXK98DLzY_EaRvNZx87PVlzavdlT.anPz4na9vB8VMJQJ.1lhIDY2jCflUsoRl_tRb8s_CLkSaF4
	xjc9brz4ZA_Nu8OsPVM0R3Kh_u_QOa2Q1QmWuAyq9IsDVjkaj2HlU8_hRAfl8hdl3nw9IJ44Eq.L
	QHzv0pDyNqgRhpXL.qHnoQDZQ9XKkla5otYbs630x6QtIcNhTcLpcXPoOb0KRIYTuKy.DSR8by8f
	tOvYycjbmQ_3K6f7k_c0-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic310.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 26 Aug 2020 15:24:39 +0000
Received: by smtp406.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID c683c0ebda2acb61fe5f303aaaf51560; 
	Wed, 26 Aug 2020 15:24:35 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v20 21/23] Audit: Add a new record for multiple object LSM
	attributes
Date: Wed, 26 Aug 2020 07:52:45 -0700
Message-Id: <20200826145247.10029-22-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-1-casey@schaufler-ca.com>
References: <20200826145247.10029-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, linux-audit@redhat.com, sds@tycho.nsa.gov
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Create a new audit record type to contain the object information
when there are multiple security modules that require such data.
This record is emitted before the other records for the event, but
is linked with the same timestamp and serial number.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc: linux-audit@redhat.com
---
 include/linux/audit.h      |  2 ++
 include/uapi/linux/audit.h |  1 +
 kernel/audit.c             | 53 +++++++++++++++++++++++++++++
 kernel/audit.h             |  4 +--
 kernel/auditsc.c           | 70 +++++---------------------------------
 5 files changed, 67 insertions(+), 63 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index fe027df0d9a8..55cc03c1bed8 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -189,6 +189,8 @@ extern void		    audit_log_lost(const char *message);
 extern void audit_log_lsm(struct lsmblob *blob, bool exiting);
 extern int audit_log_task_context(struct audit_buffer *ab,
 				  struct lsmblob *blob);
+extern int audit_log_object_context(struct audit_buffer *ab,
+				    struct lsmblob *blob);
 extern void audit_log_task_info(struct audit_buffer *ab);
 
 extern int		    audit_update_lsm_rules(void);
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 2a63720e56f6..dbb1dce16962 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -140,6 +140,7 @@
 #define AUDIT_MAC_CALIPSO_ADD	1418	/* NetLabel: add CALIPSO DOI entry */
 #define AUDIT_MAC_CALIPSO_DEL	1419	/* NetLabel: del CALIPSO DOI entry */
 #define AUDIT_MAC_TASK_CONTEXTS	1420	/* Multiple LSM contexts */
+#define AUDIT_MAC_OBJ_CONTEXTS	1421	/* Multiple LSM object contexts */
 
 #define AUDIT_FIRST_KERN_ANOM_MSG   1700
 #define AUDIT_LAST_KERN_ANOM_MSG    1799
diff --git a/kernel/audit.c b/kernel/audit.c
index 0e7831c9f321..8991a0c0ba0b 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2194,6 +2194,59 @@ int audit_log_task_context(struct audit_buffer *ab, struct lsmblob *blob)
 }
 EXPORT_SYMBOL(audit_log_task_context);
 
+int audit_log_object_context(struct audit_buffer *ab,
+				    struct lsmblob *blob)
+{
+	int i;
+	int error;
+	bool sep = false;
+	struct lsmcontext lsmdata;
+	struct audit_buffer *lsmab = NULL;
+	struct audit_context *context = NULL;
+
+	/*
+	 * If there is more than one security module that has a
+	 * object "context" it's necessary to put the object data
+	 * into a separate record to maintain compatibility.
+	 */
+	if (lsm_multiple_contexts()) {
+		audit_log_format(ab, " obj=?");
+		context = ab->ctx;
+		if (context)
+			lsmab = audit_log_start(context, GFP_KERNEL,
+						AUDIT_MAC_OBJ_CONTEXTS);
+	}
+
+	for (i = 0; i < LSMBLOB_ENTRIES; i++) {
+		if (blob->secid[i] == 0)
+			continue;
+		error = security_secid_to_secctx(blob, &lsmdata, i);
+		if (error && error != -EINVAL) {
+			audit_panic("error in audit_log_object_context");
+			return error;
+		}
+
+		if (context) {
+			audit_log_format(lsmab, "%sobj_%s=%s",
+					 sep ? " " : "",
+					 security_lsm_slot_name(i),
+					 lsmdata.context);
+			sep = true;
+		} else
+			audit_log_format(ab, " obj=%s", lsmdata.context);
+
+		security_release_secctx(&lsmdata);
+		if (!context)
+			break;
+	}
+
+	if (context)
+		audit_log_end(lsmab);
+
+	return 0;
+}
+EXPORT_SYMBOL(audit_log_object_context);
+
 void audit_log_d_path_exe(struct audit_buffer *ab,
 			  struct mm_struct *mm)
 {
diff --git a/kernel/audit.h b/kernel/audit.h
index ec0cfa7364cc..ab9d4a466198 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -78,7 +78,7 @@ struct audit_names {
 	kuid_t			uid;
 	kgid_t			gid;
 	dev_t			rdev;
-	u32			osid;
+	struct lsmblob		oblob;
 	struct audit_cap_data	fcap;
 	unsigned int		fcap_ver;
 	unsigned char		type;		/* record type */
@@ -152,7 +152,7 @@ struct audit_context {
 			kuid_t			uid;
 			kgid_t			gid;
 			umode_t			mode;
-			u32			osid;
+			struct lsmblob		oblob;
 			int			has_perm;
 			uid_t			perm_uid;
 			gid_t			perm_gid;
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index cf5dbd0e3a3d..7269deb4a348 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -688,14 +688,6 @@ static int audit_filter_rules(struct task_struct *tsk,
 			if (f->lsm_isset) {
 				/* Find files that match */
 				if (name) {
-					/*
-					 * lsmblob_init sets all values in the
-					 * lsmblob to sid. This is temporary
-					 * until name->osid is converted to a
-					 * lsmblob, which happens later in
-					 * this patch set.
-					 */
-					lsmblob_init(&blob, name->osid);
 					result = security_audit_rule_match(
 								&blob,
 								f->type,
@@ -703,7 +695,6 @@ static int audit_filter_rules(struct task_struct *tsk,
 								f->lsm_rules);
 				} else if (ctx) {
 					list_for_each_entry(n, &ctx->names_list, list) {
-						lsmblob_init(&blob, name->osid);
 						if (security_audit_rule_match(
 								&blob,
 								f->type,
@@ -717,8 +708,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 				/* Find ipc objects that match */
 				if (!ctx || ctx->type != AUDIT_IPC)
 					break;
-				lsmblob_init(&blob, ctx->ipc.osid);
-				if (security_audit_rule_match(&blob,
+				if (security_audit_rule_match(&ctx->ipc.oblob,
 							      f->type, f->op,
 							      f->lsm_rules))
 					++result;
@@ -1000,7 +990,6 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 				 struct lsmblob *blob, char *comm)
 {
 	struct audit_buffer *ab;
-	struct lsmcontext lsmctx;
 	int rc = 0;
 
 	ab = audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
@@ -1010,15 +999,7 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 	audit_log_format(ab, "opid=%d oauid=%d ouid=%d oses=%d", pid,
 			 from_kuid(&init_user_ns, auid),
 			 from_kuid(&init_user_ns, uid), sessionid);
-	if (lsmblob_is_set(blob)) {
-		if (security_secid_to_secctx(blob, &lsmctx, LSMBLOB_FIRST)) {
-			audit_log_format(ab, " obj=(none)");
-			rc = 1;
-		} else {
-			audit_log_format(ab, " obj=%s", lsmctx.context);
-			security_release_secctx(&lsmctx);
-		}
-	}
+	rc = audit_log_object_context(ab, blob);
 	audit_log_format(ab, " ocomm=");
 	audit_log_untrustedstring(ab, comm);
 	audit_log_end(ab);
@@ -1245,26 +1226,14 @@ static void show_special(struct audit_context *context, int *call_panic)
 				context->socketcall.args[i]);
 		break; }
 	case AUDIT_IPC: {
-		u32 osid = context->ipc.osid;
+		struct lsmblob *oblob = &context->ipc.oblob;
 
 		audit_log_format(ab, "ouid=%u ogid=%u mode=%#ho",
 				 from_kuid(&init_user_ns, context->ipc.uid),
 				 from_kgid(&init_user_ns, context->ipc.gid),
 				 context->ipc.mode);
-		if (osid) {
-			struct lsmcontext lsmcxt;
-			struct lsmblob blob;
-
-			lsmblob_init(&blob, osid);
-			if (security_secid_to_secctx(&blob, &lsmcxt,
-						     LSMBLOB_FIRST)) {
-				audit_log_format(ab, " osid=%u", osid);
-				*call_panic = 1;
-			} else {
-				audit_log_format(ab, " obj=%s", lsmcxt.context);
-				security_release_secctx(&lsmcxt);
-			}
-		}
+		if (audit_log_object_context(ab, oblob))
+			*call_panic = 1;
 		if (context->ipc.has_perm) {
 			audit_log_end(ab);
 			ab = audit_log_start(context, GFP_KERNEL,
@@ -1404,20 +1373,8 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
 				 from_kgid(&init_user_ns, n->gid),
 				 MAJOR(n->rdev),
 				 MINOR(n->rdev));
-	if (n->osid != 0) {
-		struct lsmblob blob;
-		struct lsmcontext lsmctx;
-
-		lsmblob_init(&blob, n->osid);
-		if (security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_FIRST)) {
-			audit_log_format(ab, " osid=%u", n->osid);
-			if (call_panic)
-				*call_panic = 2;
-		} else {
-			audit_log_format(ab, " obj=%s", lsmctx.context);
-			security_release_secctx(&lsmctx);
-		}
-	}
+	if (audit_log_object_context(ab, &n->oblob) && call_panic)
+		*call_panic = 2;
 
 	/* log the audit_names record type */
 	switch (n->type) {
@@ -2026,17 +1983,13 @@ static void audit_copy_inode(struct audit_names *name,
 			     const struct dentry *dentry,
 			     struct inode *inode, unsigned int flags)
 {
-	struct lsmblob blob;
-
 	name->ino   = inode->i_ino;
 	name->dev   = inode->i_sb->s_dev;
 	name->mode  = inode->i_mode;
 	name->uid   = inode->i_uid;
 	name->gid   = inode->i_gid;
 	name->rdev  = inode->i_rdev;
-	security_inode_getsecid(inode, &blob);
-	/* scaffolding until osid is updated */
-	name->osid = blob.secid[0];
+	security_inode_getsecid(inode, &name->oblob);
 	if (flags & AUDIT_INODE_NOEVAL) {
 		name->fcap_ver = -1;
 		return;
@@ -2403,16 +2356,11 @@ void __audit_mq_getsetattr(mqd_t mqdes, struct mq_attr *mqstat)
 void __audit_ipc_obj(struct kern_ipc_perm *ipcp)
 {
 	struct audit_context *context = audit_context();
-	struct lsmblob blob;
 	context->ipc.uid = ipcp->uid;
 	context->ipc.gid = ipcp->gid;
 	context->ipc.mode = ipcp->mode;
 	context->ipc.has_perm = 0;
-	security_ipc_getsecid(ipcp, &blob);
-	/* context->ipc.osid will be changed to a lsmblob later in
-	 * the patch series. This will allow auditing of all the object
-	 * labels associated with the ipc object. */
-	context->ipc.osid = lsmblob_value(&blob);
+	security_ipc_getsecid(ipcp, &context->ipc.oblob);
 	context->type = AUDIT_IPC;
 }
 
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


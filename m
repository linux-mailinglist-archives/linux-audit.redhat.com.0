Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EFDA322D013
	for <lists+linux-audit@lfdr.de>; Fri, 24 Jul 2020 22:56:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-dL-0OE4_N3WIfINvkj7iDg-1; Fri, 24 Jul 2020 16:56:13 -0400
X-MC-Unique: dL-0OE4_N3WIfINvkj7iDg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1581F91270;
	Fri, 24 Jul 2020 20:56:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C885E87E00;
	Fri, 24 Jul 2020 20:56:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99C97A3595;
	Fri, 24 Jul 2020 20:56:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OKu4rR000843 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 16:56:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9A71AEAFA2; Fri, 24 Jul 2020 20:56:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 959E6EAFA0
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 20:56:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D16A800800
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 20:56:01 +0000 (UTC)
Received: from sonic315-22.consmr.mail.bf2.yahoo.com
	(sonic315-22.consmr.mail.bf2.yahoo.com [74.6.134.196]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-153-SwUDDO0nO3uG6eF1X-W_1g-1;
	Fri, 24 Jul 2020 16:55:59 -0400
X-MC-Unique: SwUDDO0nO3uG6eF1X-W_1g-1
X-YMail-OSG: YdRwR6IVM1m9IPOvTDQU1mFKyuZCzkJ9Y0TU6uEFoDADjWAKIUiui_3JZH6P2.h
	Vi.iYvUHqwJOZ9.zSIlp5Q7EFE4LI09mAIUQ_5z8jG6qsk3jQdXCB64X8s58SC67qd4gXvQ8fb7z
	gzcY0jKV_N4_jTGEl3m.6MivRzKl2V5rkLbvYy_aRKoaZq2VVau6NyHOOposnEL.lwoY7p77VZhN
	yPhd5_i9BnhYdcC6cI5R9KhVCP0OHOyc9U36o_ZtUl9fMOT6OAFHQxGcEGHjc3q8ZuE.a8QFeos5
	KlMpwpiQOePJTFmh1shrIuquiqzJVcg3lEkeamIJ7SimxsbK1XdYA78ozyV17OKlCIALpj.3eT_u
	3dURj4mHaZY3FOuiJuq.d2_w13G8CylU7Kn6cqKVhiQhrqQ1ieaUCYN141s.oKmFQS.FVuu9zPZB
	_a7qrSp_smr8er5w0wMNgQKqenMWh7CFd5pGv3145gl_KHpNhGZWHFJSnxSgXkEmhmBAvyXJPEf2
	twdHLok6x2uN9JOLkd3p1_WlL0rgoB7lWt1bYxzB1Xsp6YBC7aB7B7Q9pofyVrWpNymBz8i1fQZ1
	IVh7cpbuaPCL6RuGDV2m.QFiajwOEarHr9WDx_02XMKpyYwrYlVG2av81jG80xDNUbnrDQDtT9c1
	2_6o5y9uKyvaRPexi03FeBVepgHXYVvSKJR.NfAFMwIEPjB13xncOn8UULzw6xBuWUSftEXbwMmF
	ywucGF7uMHMG0Q.bl5QppwFpLCPupTfnZ211chpaWDp0hkOtIhYzhM6YuXKi678yc0TKWhkVw9ce
	9bOqnfH8mE07QhyWiw3ABOYsha5ErQwmw_EKcfAIapxwMv97VMhfHER3tHRqO9NA43zDk3gryciJ
	IZO3SFJovuLvAndzXYc3h3kpDrz7u3pTsYdrRFlrf0I4pvY4m..JeCjl1EX_ESBBLbWr6tEhDye2
	9Zgi1.3MDlO_8nXdr90Eya_nRzjWHlwfLLBsQcnURiOfW5xOcHVD8Roca.0Y8c85Wjb4FTRulOZr
	CIKSYG2u5efmZk4O6Um.R0zspIXtlk4oawd5hQsyhTL1n5n3VS9w4RY_cQe0P8LE7rWGIS8aVJno
	ZTgTkuz.k2rdB41R738GOk1HYb8TjY9ar5Q42pEuYniP8xhMTV2yFcCIsy5J7UePqti9.jD2gtfB
	Xfm9FziRnMtuk0V9aUSTqQNODjq_tI0kLV.Uzqhm4m9.4bwBUCandCvTlEOBOQiOoROtusqej2BD
	FzuEWPl.n8H_GBWQaZx36bvFX90RAO1tLaN9uSj9ZSm_aO_tWFVkwuGEF8x4NYAbnL8RbzAerqTS
	mbEqxz.gC41nnexGRszDMNGX1iO1H71So1OAUyfgdJilRqNDv5CK307DHwFMiwoQSDd9tiqCBU7N
	ZMKRBBUBVvuAQ.bns.ycLcxnQh4Oa.ywnrC6V
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic315.consmr.mail.bf2.yahoo.com with HTTP;
	Fri, 24 Jul 2020 20:55:58 +0000
Received: by smtp416.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 77f7b25704aa37d9806a16cdb6616eb6; 
	Fri, 24 Jul 2020 20:55:53 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v19 21/23] Audit: Add a new record for multiple object LSM
	attributes
Date: Fri, 24 Jul 2020 13:32:24 -0700
Message-Id: <20200724203226.16374-22-casey@schaufler-ca.com>
In-Reply-To: <20200724203226.16374-1-casey@schaufler-ca.com>
References: <20200724203226.16374-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
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
index 4693febcf41f..3cc02ddd7779 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -171,6 +171,8 @@ extern void		    audit_log_lost(const char *message);
 extern void audit_log_lsm(struct lsmblob *blob, bool exiting);
 extern int audit_log_task_context(struct audit_buffer *ab,
 				  struct lsmblob *blob);
+extern int audit_log_object_context(struct audit_buffer *ab,
+				    struct lsmblob *blob);
 extern void audit_log_task_info(struct audit_buffer *ab);
 
 extern int		    audit_update_lsm_rules(void);
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index a5403efc2fdf..753a69c6bbbe 100644
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
index 777d8da41082..5d49dfed7674 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2177,6 +2177,59 @@ int audit_log_task_context(struct audit_buffer *ab, struct lsmblob *blob)
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
index 6ab012e5fe98..78bc11bfeba6 100644
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
index 55642a039632..7f1ee0de5b56 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -670,14 +670,6 @@ static int audit_filter_rules(struct task_struct *tsk,
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
@@ -685,7 +677,6 @@ static int audit_filter_rules(struct task_struct *tsk,
 								f->lsm_rules);
 				} else if (ctx) {
 					list_for_each_entry(n, &ctx->names_list, list) {
-						lsmblob_init(&blob, name->osid);
 						if (security_audit_rule_match(
 								&blob,
 								f->type,
@@ -699,8 +690,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 				/* Find ipc objects that match */
 				if (!ctx || ctx->type != AUDIT_IPC)
 					break;
-				lsmblob_init(&blob, ctx->ipc.osid);
-				if (security_audit_rule_match(&blob,
+				if (security_audit_rule_match(&ctx->ipc.oblob,
 							      f->type, f->op,
 							      f->lsm_rules))
 					++result;
@@ -982,7 +972,6 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 				 struct lsmblob *blob, char *comm)
 {
 	struct audit_buffer *ab;
-	struct lsmcontext lsmctx;
 	int rc = 0;
 
 	ab = audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
@@ -992,15 +981,7 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
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
@@ -1227,26 +1208,14 @@ static void show_special(struct audit_context *context, int *call_panic)
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
@@ -1386,20 +1355,8 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
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
@@ -1992,17 +1949,13 @@ static void audit_copy_inode(struct audit_names *name,
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
@@ -2369,16 +2322,11 @@ void __audit_mq_getsetattr(mqd_t mqdes, struct mq_attr *mqstat)
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


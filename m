Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CB5B328C2CA
	for <lists+linux-audit@lfdr.de>; Mon, 12 Oct 2020 22:42:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-SOcJrFSMPmyFKTbz3xOFwg-1; Mon, 12 Oct 2020 16:42:55 -0400
X-MC-Unique: SOcJrFSMPmyFKTbz3xOFwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5207D56B35;
	Mon, 12 Oct 2020 20:42:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 343575578F;
	Mon, 12 Oct 2020 20:42:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 029375810A;
	Mon, 12 Oct 2020 20:42:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09CKgk2q021266 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 16:42:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 64C1C2A288D; Mon, 12 Oct 2020 20:42:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ED402BFEA3
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:42:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D00C811E76
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:42:43 +0000 (UTC)
Received: from sonic302-28.consmr.mail.ne1.yahoo.com
	(sonic302-28.consmr.mail.ne1.yahoo.com [66.163.186.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-97-btvsfE7UPiOG-L3ElXS-VA-1;
	Mon, 12 Oct 2020 16:42:41 -0400
X-MC-Unique: btvsfE7UPiOG-L3ElXS-VA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1602535360; bh=aJ7S3wgpj2bsMfvZldhcHB6esGWFN2hvwJ42s46Evi8=;
	h=From:To:Subject:Date;
	b=gr4s8e6pUB2suFH3zFqCV47HatK2tOU+OWaoVpHyDFHLOPWuIhzYaft3HTMQJS1WxcHAewLNBD9pyJK2sViGxGkkpztsLygD1vUVDg9WhJEkDVpLFDI1Gb57qan9uahK6V5r1fK7zeK+V988c8J71md0U4C2UMOZsDYbCj6yMlstrOIFE09RXvcYZAWQCbNJMs3dsCx0TaPuWjDRqfk1x0/8RoVsUj0l2Hhpfdrq+8yMuEI7Ybubt4fxSifOFi7wfQlG3mmOCT9SobGK0U0UQEV1fsAY8fXxgztgJZ31lK/6bfRELvXcHHicz3+9gesLIBJFWWhbR2R0Y6+7VNJ6jA==
X-YMail-OSG: k7tdG4MVM1mxjNCqr2I8pJKgtTnNc8YRJ5iEq181hb3rskPO2.g5BuQKLDiq_UQ
	kaybrSqZvuk2LdGLhNhxTGW689kKlbbHOT2zkE4s9.uh_HzNn2D6XbHvucWyNCvdl1UE_or2HyXX
	hTePZz6Yle_iCUaFhQSBsV58EIYTnhwmv1Jo3eu0mIH3BV4LdN1sssUUuD5MOgHOf58vbpkucRnV
	bS2C0Dpbn9o5WmVRFh_S3.Uad78wnLD80q1CqBByllDXebadIGArGqwOueuRLS_zB_OgwMlJ22Gl
	VZiMUC5oBtUO6og_XdvaoeYgNVYVIMtb49m1in4thQ4nCBOvtuKz77Dkb_wSE.iHRr6vLbyzvLbU
	UOeWewZJzqy2DCF45FjehxHU.8mlKcvru1KL3mVT1saz_ckN3qVMDuTdb2R2MhynhylxrFqT7Zdv
	WwU3UOl8NgRS3BmA3FI1LdnCEwODrD6SYfJWt1ZPeUmyb3T_rhw_8jx0NC6F8D03nadhrRezELZw
	lsB.DEysdwAC1oZmgqIATyGqU9Bz59PQfclkdAt14AdYm4XYOoUgFfVvBKQ3ILTPMxbl5SnmStrp
	A9N0cdR3hpnoggbItT9pjeu08E0EqwfeRbY9rSs5XOnU49RYlaHcwmy4T51miLJsxvRcNf997SZ_
	ieh.PvQ2dt_YVWP0zxQTHgkFMW6GJZ.SOLMO3QsJ7RPPKZN7coHU2Fxtt4txrrM4wCd5VqM8qtwu
	n7LOI6cFMjTTLfxUMdRUMvA7V.RwrhpV26xp3doFmwUHYp3dRpDC9PQJO6SRBRTUvn3aCvTls5zj
	Rf7CUI6a7lHvnHUptgIn4avRZHBU0oiijMINqWQnezzuy3hUjKABH0FlyiCBaPK4N2Pk7cERTEV0
	N53p3EhbEwhkK7Elr7HrFid1Om9qbMM9dtr50pvOazHlLhgWPNI4Ot5ddjAGRiEnq3YQZzJOq2H3
	h8AlOy.k6Ln7wl5jh0Z54zZRMhv7EYKqo5jhNp1oTSmhMz5YVO1YllM5yaVHUiBehIULfwJ5oSHw
	wLDrS6jOUbV4l3MxaemCrE4jkmeuy..BTEfvgSuYn4nwJDB9oJRljd8u1eXwpM0v4zVXY8IlTBfJ
	A4zR_djV8XHj.6BdViS4Z2eGR6du52fGZHLfJEt3A2fK0ggZMCkoRwj9agWQvlr9l0yQOOBsPRgV
	8KBig0.JorAaTT0545JbG10QMUVVwnZ9VY6laOcr_NHpImwf5YizhU2Pb_nTPxTiCs8VDA_cWtpL
	p28ab0fu9FAkF9qLVZpecyp6GojLL_bRgKYWLDde8g2xe3t2Q6Js_KCi6reldu0DbFoElof5dE9a
	woX2R5WoVSDTVq0Ln82_9F5MfyT0j2aQRkS8.vf6SbPrGXvMdcUHWWly2n2MvidmHUgYdd8yQKXV
	nRUTPiL.zwtQJ.rAk2FwKvEqHDqlmLCDmgqdb5waydfQEhD9xuLzKqUDB2dJbaQjqm.mykIpI.0D
	Z7Lf089gixtJQc7APvuOT_Z0i4c2uWiOHMl44SBEv97Nmr4HHU9VQ7CvGxHIp9A2SYZiW1mU6yZz
	6Bm57RJxY5h3YfOqMIp_byg--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic302.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 12 Oct 2020 20:42:40 +0000
Received: by smtp415.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID c7ab10592733d79b4afc594da366f9fa; 
	Mon, 12 Oct 2020 20:42:38 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v21 21/23] Audit: Add a new record for multiple object LSM
	attributes
Date: Mon, 12 Oct 2020 13:19:22 -0700
Message-Id: <20201012201924.71463-22-casey@schaufler-ca.com>
In-Reply-To: <20201012201924.71463-1-casey@schaufler-ca.com>
References: <20201012201924.71463-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Create a new audit record type to contain the object information
when there are multiple security modules that may require such data.
This record is linked with the same timestamp and serial number.

An example of the MAC_OBJ_CONTEXTS (1421) record is:

	type=UNKNOWN[1421]
	msg=audit(1601152467.009:1050):
	obj_selinux=unconfined_u:object_r:user_home_t:s0

Not all security modules that can provide object information
do so in all cases. It is possible that a security module won't
apply an object attribute in all cases.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc: linux-audit@redhat.com
Cc: Paul Moore <paul@paul-moore.com>
---
 include/linux/audit.h      |  7 ++++
 include/uapi/linux/audit.h |  1 +
 kernel/audit.c             | 53 +++++++++++++++++++++++++++
 kernel/audit.h             |  4 +--
 kernel/auditsc.c           | 73 +++++++-------------------------------
 5 files changed, 75 insertions(+), 63 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index ad1eda37166f..af9403ba8a8a 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -189,6 +189,8 @@ extern void		    audit_log_path_denied(int type,
 extern void		    audit_log_lost(const char *message);
 
 extern int audit_log_task_context(struct audit_buffer *ab);
+extern int audit_log_object_context(struct audit_buffer *ab,
+				    struct lsmblob *blob);
 extern void audit_log_task_info(struct audit_buffer *ab);
 extern void audit_log_lsm(struct audit_context *context);
 
@@ -256,6 +258,11 @@ static inline int audit_log_task_context(struct audit_buffer *ab)
 {
 	return 0;
 }
+static inline int audit_log_object_context(struct audit_buffer *ab,
+					   struct lsmblob *blob)
+{
+	return 0;
+}
 static inline void audit_log_task_info(struct audit_buffer *ab)
 { }
 static void audit_log_lsm(struct audit_context *context)
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
index 99a48603b0e2..7024d1bf0961 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2165,6 +2165,59 @@ int audit_log_task_context(struct audit_buffer *ab)
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
index a5b52b5dbbab..ab80f74452a2 100644
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
@@ -154,7 +154,7 @@ struct audit_context {
 			kuid_t			uid;
 			kgid_t			gid;
 			umode_t			mode;
-			u32			osid;
+			struct lsmblob		oblob;
 			int			has_perm;
 			uid_t			perm_uid;
 			gid_t			perm_gid;
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 44b150432147..c314533dd220 100644
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
@@ -1027,7 +1017,6 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 				 struct lsmblob *blob, char *comm)
 {
 	struct audit_buffer *ab;
-	struct lsmcontext lsmctx;
 	int rc = 0;
 
 	ab = audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
@@ -1037,15 +1026,8 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
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
+	if (lsmblob_is_set(blob))
+		rc = audit_log_object_context(ab, blob);
 	audit_log_format(ab, " ocomm=");
 	audit_log_untrustedstring(ab, comm);
 	audit_log_end(ab);
@@ -1272,26 +1254,15 @@ static void show_special(struct audit_context *context, int *call_panic)
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
+		if (lsmblob_is_set(oblob) &&
+		    audit_log_object_context(ab, oblob))
+			*call_panic = 1;
 		if (context->ipc.has_perm) {
 			audit_log_end(ab);
 			ab = audit_log_start(context, GFP_KERNEL,
@@ -1431,20 +1402,9 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
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
+	if (lsmblob_is_set(&n->oblob) &&
+	    audit_log_object_context(ab, &n->oblob) && call_panic)
+		*call_panic = 2;
 
 	/* log the audit_names record type */
 	switch (n->type) {
@@ -2047,17 +2007,13 @@ static void audit_copy_inode(struct audit_names *name,
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
@@ -2403,16 +2359,11 @@ void __audit_mq_getsetattr(mqd_t mqdes, struct mq_attr *mqstat)
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


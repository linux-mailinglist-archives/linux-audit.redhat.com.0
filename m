Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 58D31168AB9
	for <lists+linux-audit@lfdr.de>; Sat, 22 Feb 2020 01:06:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582329995;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+q3dtdoU5mmYe34duAMylmgBrmcYirkS+ld2aoZ7c5s=;
	b=AUwzzyBMPe9pnFrasCSZZZ7FKgTzaIBMTvQlLyllXMEDgOVMcGJox+8bw906jEUrYhqolZ
	jPzpHwc0vkyh6x56tBI6EPOlM/7je7TVH11yljBAkWXLTtmEBO4jeiZ7GPsmOrIfkFY8S1
	W4ZN95sHn26BYdmx34NMLbErLkCUnwA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-C5e9hpjYMXm8RzwY_RyB-A-1; Fri, 21 Feb 2020 19:06:31 -0500
X-MC-Unique: C5e9hpjYMXm8RzwY_RyB-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29E0E801E67;
	Sat, 22 Feb 2020 00:06:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04CCB1001925;
	Sat, 22 Feb 2020 00:06:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8CCD860C7;
	Sat, 22 Feb 2020 00:06:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01M06L6m001779 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 19:06:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BEEE9165435; Sat, 22 Feb 2020 00:06:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BADA7165444
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 00:06:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 467D6185A790
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 00:06:19 +0000 (UTC)
Received: from sonic309-28.consmr.mail.ne1.yahoo.com
	(sonic309-28.consmr.mail.ne1.yahoo.com [66.163.184.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-29-TCEVpdLdMkCzrzvA4OZjcg-1;
	Fri, 21 Feb 2020 19:06:17 -0500
X-MC-Unique: TCEVpdLdMkCzrzvA4OZjcg-1
X-YMail-OSG: Ae2cbUwVM1kDeztWjlHYjLAWcB3mT_8Wz7oEYO__8oopL9ihN7ftmuq1gzekNvF
	z9w0D_MDnr12ML3J1QqJ4aRDxMEPsoG9tV4Z6pJ8Cq1cEeeIyzCRIKPEfQyTRAmgEq.fzpCkE_Pp
	CdiiXMMQzTK5f9b3TH6QMpNl2Z4OyHJkZ.mi.OUIiaGB383oUFFSHKhwxSPa7YErDLp3LdTC.hiY
	V9l3N95YzniUnobC7BxCNNpW8KJGpBVuDIb9ZDrzHt8meIMOkDt2Cd23PKcsfWkozFEincIWOZj2
	M59eeqP4XNz1A_9g1w_K9fmDPxs6b9cpLhxdJJ8Jt15OI_Wxc.yCSNzdJwX60QL9h1fEw1TP3h4l
	xy42uMh_F4Y7mmvfgF0.HCA3JFiqIv0uT1VwVnske_og2uOK.1mtuw6VonTKJP7RIJF.eujI05OB
	BrhW4wOOK1mZ9Khq54PSoXbYmXlOglubPaCkbYh_hp6aXAyNdJqiIpDn1VyyE9rYPdXqpv9mRQmR
	RshliKLgjxkf_6M9UFYr7IJdmYlxvdhUooI1xVDb9EQO93TGSX8xY3XPkdPjkpEB5D_ryeunjAGJ
	i6ywysGJ5A8DKrb1Em7J7CdmSWPlZcTNwtXPpQAyWwFiRaqpxtANxWvL__8WBDWEFA_6nVsLHnvV
	oR6eGh86zZmpI4.QixejTCMfnqDW5zLP2mrkjoH5pNzVLLnGczSC6vZxhBWSu5t6eNH.KsS2c_8D
	LNaAN_gbuItjrvPYSQkn2JCDZplsa753GJnuk1QCEU39XLRKWhqiq.8Ky1mvCz0paMQaE5KFuInI
	zUqcIJKKbRLWLWqS0nawl0IN6UKtEaWPqIwAhzYQKBGSSAyEY5CfCfHP2V7vCq5.vJY.IgEFmGFS
	ZwgOUlVJflfCRsLthxdJA938tKtpr3bahaw0Yo7UykgoIeTQTaYGTunSfz69NKPB4XSY2DFcJSX0
	i7tg.LW_8u_W.5XeYYJHhLHIAj4DbrSykeewa00O4ciuQs9gk063fhE_ff07lehOeu05GJAMoxBO
	mbilq6MEDvns4rHp105TV.YojOrUHtwBEkZ8gS9YQwlIhHqJ6eLCGMBkcxCPsNZzMBgv89K_XfWE
	Rxlh_ZskxZGbjzl5FRWWl3WNUsiV1Nl1TOq6pduiNJ9uQaDNQRSdtYenA3CBfa02SjqD1JIZSfMo
	PQP7akopDyZ5rTudpzHIAduru5JvwFR2LX2lzSNIStsKmaydZCFJQeumx87yt7elxDC9NcMqlqti
	zpJOS2EJscPtuhGSeV7UTXyFJuAYS8wiEDdOHw9awnc4bkL0XXYBAk9Y.kiDTa.b7XHlLjprqLuk
	e8pm7elocbm0oxHxEp_CWRGInWGvQ7FSAUfzMKW522yuQiJivnFgjqt6N98.FB9_lYcGbr7CeLe8
	hVUpaShACt74tm79bddoK7A--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.ne1.yahoo.com with HTTP;
	Sat, 22 Feb 2020 00:06:16 +0000
Received: by smtp414.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 0e706714352d04af1a6921209e6db81a; 
	Sat, 22 Feb 2020 00:06:10 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, linux-audit@redhat.com
Subject: [PATCH v15 21/23] Audit: Include object data for all security modules
Date: Fri, 21 Feb 2020 16:04:07 -0800
Message-Id: <20200222000407.110158-14-casey@schaufler-ca.com>
In-Reply-To: <20200222000407.110158-1-casey@schaufler-ca.com>
References: <20200222000407.110158-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01M06L6m001779
X-loop: linux-audit@redhat.com
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

When there is more than one context displaying security
module extend what goes into the audit record by supplimenting
the "obj=" with an "obj_<lsm>=" for each such security
module.

Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc:linux-audit@redhat.com
---
 kernel/audit.h   |   4 +-
 kernel/auditsc.c | 106 ++++++++++++++++++++++++-----------------------
 2 files changed, 56 insertions(+), 54 deletions(-)

diff --git a/kernel/audit.h b/kernel/audit.h
index f65f516913c6..9a26ba213f6a 100644
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
index 68ae5fa843c1..7dab48661e31 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -659,7 +659,6 @@ static int audit_filter_rules(struct task_struct *tsk,
 			if (f->lsm_isset) {
 				/* Find files that match */
 				if (name) {
-					lsmblob_init(&blob, name->osid);
 					result = security_audit_rule_match(
 								&blob,
 								f->type,
@@ -667,7 +666,6 @@ static int audit_filter_rules(struct task_struct *tsk,
 								f->lsm_rules);
 				} else if (ctx) {
 					list_for_each_entry(n, &ctx->names_list, list) {
-						lsmblob_init(&blob, name->osid);
 						if (security_audit_rule_match(
 								&blob,
 								f->type,
@@ -681,8 +679,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 				/* Find ipc objects that match */
 				if (!ctx || ctx->type != AUDIT_IPC)
 					break;
-				lsmblob_init(&blob, ctx->ipc.osid);
-				if (security_audit_rule_match(&blob,
+				if (security_audit_rule_match(&ctx->ipc.oblob,
 							      f->type, f->op,
 							      f->lsm_rules))
 					++result;
@@ -956,13 +953,57 @@ static inline void audit_free_context(struct audit_context *context)
 	kfree(context);
 }
 
+static int audit_log_object_context(struct audit_buffer *ab,
+				    struct lsmblob *blob)
+{
+	struct lsmcontext context;
+	const char *lsm;
+	int i;
+
+	/*
+	 * None of the installed modules have object labels.
+	 */
+	if (security_lsm_slot_name(0) == NULL)
+		return 0;
+
+	if (blob->secid[0] != 0) {
+		if (security_secid_to_secctx(blob, &context, 0)) {
+			audit_log_format(ab, " obj=?");
+			return 1;
+		}
+		audit_log_format(ab, " obj=%s", context.context);
+		security_release_secctx(&context);
+	}
+
+	/*
+	 * Don't do anything more unless there is more than one LSM
+	 * with a security context to report.
+	 */
+	if (security_lsm_slot_name(1) == NULL)
+		return 0;
+
+	for (i = 0; i < LSMBLOB_ENTRIES; i++) {
+		lsm = security_lsm_slot_name(i);
+		if (lsm == NULL)
+			break;
+		if (blob->secid[i] == 0)
+			continue;
+		if (security_secid_to_secctx(blob, &context, i)) {
+			audit_log_format(ab, " obj_%s=?", lsm);
+			continue;
+		}
+		audit_log_format(ab, " obj_%s=%s", lsm, context.context);
+		security_release_secctx(&context);
+	}
+	return 0;
+}
+
 static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 				 kuid_t auid, kuid_t uid,
 				 unsigned int sessionid,
 				 struct lsmblob *blob, char *comm)
 {
 	struct audit_buffer *ab;
-	struct lsmcontext lsmctx;
 	int rc = 0;
 
 	ab = audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
@@ -972,15 +1013,7 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
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
@@ -1207,26 +1240,14 @@ static void show_special(struct audit_context *context, int *call_panic)
 				context->socketcall.args[i]);
 		break; }
 	case AUDIT_IPC: {
-		u32 osid = context->ipc.osid;
+		struct lsmblob *oblob = & context->ipc.oblob;
 
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
@@ -1366,20 +1387,8 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
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
@@ -1929,17 +1938,13 @@ static void audit_copy_inode(struct audit_names *name,
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
@@ -2285,14 +2290,11 @@ void __audit_mq_getsetattr(mqd_t mqdes, struct mq_attr *mqstat)
 void __audit_ipc_obj(struct kern_ipc_perm *ipcp)
 {
 	struct audit_context *context = audit_context();
-	struct lsmblob blob;
 	context->ipc.uid = ipcp->uid;
 	context->ipc.gid = ipcp->gid;
 	context->ipc.mode = ipcp->mode;
 	context->ipc.has_perm = 0;
-	security_ipc_getsecid(ipcp, &blob);
-	/* scaffolding on the [0] - change "osid" to a lsmblob */
-	context->ipc.osid = blob.secid[0];
+	security_ipc_getsecid(ipcp, &context->ipc.oblob);
 	context->type = AUDIT_IPC;
 }
 
-- 
2.24.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


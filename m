Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 40FE31D40A1
	for <lists+linux-audit@lfdr.de>; Fri, 15 May 2020 00:17:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589494619;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DWF6npcnu66fgOHrbRe1XbICZxTHxFTspKZGI8fVxD4=;
	b=HGdG68p7Wdy/Ae0ow6dQcuM3rDaYhPjIccL+4vtgov2oQ0sIv1GDLid6cHNgZD62KKQ4QX
	dbaoez/8jflYY/FGi0vf++YuVQRbZoeOlvqF0OldbieFIasnsdfLLgp5HPaafmjBPeSYEK
	Y+lwXaiciVtXXWzT8VfMOFUFf9Kbwzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-OJFTzlrdPSeJ5fjQPDORrg-1; Thu, 14 May 2020 18:16:57 -0400
X-MC-Unique: OJFTzlrdPSeJ5fjQPDORrg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ECEB53;
	Thu, 14 May 2020 22:16:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 839D05C1D3;
	Thu, 14 May 2020 22:16:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 584BE1809543;
	Thu, 14 May 2020 22:16:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EMFJ5E017865 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 18:15:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B543B2156A4D; Thu, 14 May 2020 22:15:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F0022156A49
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:15:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 879151859163
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:15:17 +0000 (UTC)
Received: from sonic307-16.consmr.mail.ne1.yahoo.com
	(sonic307-16.consmr.mail.ne1.yahoo.com [66.163.190.39]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-452-WImXBIupNYGo6CbkmWf5qg-1;
	Thu, 14 May 2020 18:15:15 -0400
X-MC-Unique: WImXBIupNYGo6CbkmWf5qg-1
X-YMail-OSG: 1uDkwhEVM1n1lcF0R65LV0aBgqL5BgyX6Ser7c6xA4ArIHypYRXPtSERDK.HemD
	PQqovqa0FcgjhRH544zqta_qEntTfoulNivwjyYEEQnwHmJdqnnxxzA.Ha.ElOr62b5GRn47U.W2
	psrsVLjzto3sVqw5IlzH0xkr3Wma949ydOG3KODnqRPYOKlkNyVKCopT3r2qgV51J1AMdrPBn86n
	BRA9acd2QIJwYQwu5gC8A27Fu6LEyRtKlNI.E5MV4DEZ84TF1X8h51RyZ1LI3sjEYiliscboirOH
	xm3B6FadwjZQeNQeOAvSZJjj1yKzWxzsQi0D_yMEvE40ThPr4LerktWmmsO7Bln6ND3LasJ_46al
	aMfGeGm3KwQGBrAstPruLQqFUE7Fmy9h1EW3IrVc.c7KFgcqqKw8aTBnB9GBXPZHS.fJcKcvSn1p
	VtYlo1Wknt2Oc3TUP8AgSwg5GPaeY.Qx8wgyxexwnObLqu00nuXJ9BstOsVX_MD2U94VyZYZkQ5D
	4mlaBZWZtt0BF4VdAzY7ZbJ0DsZUWF1rZlgpvtusd2RXcVYVtOmp49bPg2jNISqZluO3BTh9VpS9
	VIe_y7HATYG1Mkm1Q2ujbHNDdMvN7T1M1rSwteYDlThINO2BCB6RmrzOltl8N6ufkOQy_RFvH5tF
	fuYD59zZ6tgyhp5jEAHQdUetB.B2HWN353RSmbw1NVUbbMR8YL5xDW8lGx2PWP8gVX.zNm7DHWWk
	DGMhFe3rdgr.nvMyrx3nhgk.XKx1a3BoISvES_PXHSOGsoZClnUPJwSwgX_xRHmAHCxZBLwYtKGc
	CLG9vaFst67Nwi5wfmPPs1fYaZNCwOcbJeUxL8hFLCpXy82tnoeEMAA.iMCHJxjp5rt1l2r5lpHk
	WHtnLErFllNalSV8tr2FWT9pCJN6EDvim2Gv31suKSlSmp6LhG.61nP80Wqcv6yNqS2t.u7lMwde
	QNdi2bciLv4a5EXteicuov.UkBX6IPH907w_8EhKxFWmTWZ75WxYC8TA.7.zi2AzWDTJTk4dHaWJ
	2e.GVGQULLy_6PeBoRSRYgjFP8uiXKc2rOuRNoj5XWio.axMqvEJYGi5qMjIjKu1lrO7SxVJn3TB
	mTHmsSwHk.rmMj.nt8nZ4v_F7D7xhvjnsgrzo8GLq8L7Ctns.f1GltOqj1wXJsLM6xDhjdL11jnQ
	nbmAQg_O.5X8EkYRP_9CPwhDI.U_h9Jz_6lhLDM0MKdVuYEkILgKQ7t.gCJqbPIvy1VnqQHIsQGn
	p2C9cx7Nwg3DYeaNs9VjUMJ8iptz.keEZy7BN0kwz8CCbQjh_w0CbvRuBpOcd8MNBb9W_g4OexnC
	Fp1c6dprQFZmJqnodx9qx_jUolb9w38FZ19inr1EWQpp9HINuAe4wDX8wjd4tdfIAjn9WJ5J7nfL
	TMG8_FgYf997wA_QVEO9cpjnvmDwkzCyNfJs0PD7ib5bddQnhmUq9_LQ-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic307.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 14 May 2020 22:15:14 +0000
Received: by smtp405.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID c05acd8f7c5bb2850db99d6d8e7c31a6; 
	Thu, 14 May 2020 22:15:11 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v17 03/23] LSM: Use lsmblob in security_audit_rule_match
Date: Thu, 14 May 2020 15:11:22 -0700
Message-Id: <20200514221142.11857-4-casey@schaufler-ca.com>
In-Reply-To: <20200514221142.11857-1-casey@schaufler-ca.com>
References: <20200514221142.11857-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change the secid parameter of security_audit_rule_match
to a lsmblob structure pointer. Pass the entry from the
lsmblob structure for the approprite slot to the LSM hook.

Change the users of security_audit_rule_match to use the
lsmblob instead of a u32. The scaffolding function lsmblob_init()
fills the blob with the value of the old secid, ensuring that
it is available to the appropriate module hook. The sources of
the secid, security_task_getsecid() and security_inode_getsecid(),
will be converted to use the blob structure later in the series.
At the point the use of lsmblob_init() is dropped.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h            |  7 ++++---
 kernel/auditfilter.c                |  6 ++++--
 kernel/auditsc.c                    | 14 ++++++++++----
 security/integrity/ima/ima.h        |  4 ++--
 security/integrity/ima/ima_policy.c |  7 +++++--
 security/security.c                 |  6 ++++--
 6 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 94e90d7150ca..ad8e29486ebe 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1838,7 +1838,8 @@ static inline int security_key_getsecurity(struct key *key, char **_buffer)
 #ifdef CONFIG_SECURITY
 int security_audit_rule_init(u32 field, u32 op, char *rulestr, void **lsmrule);
 int security_audit_rule_known(struct audit_krule *krule);
-int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule);
+int security_audit_rule_match(struct lsmblob *blob, u32 field, u32 op,
+			      void **lsmrule);
 void security_audit_rule_free(void **lsmrule);
 
 #else
@@ -1854,8 +1855,8 @@ static inline int security_audit_rule_known(struct audit_krule *krule)
 	return 0;
 }
 
-static inline int security_audit_rule_match(u32 secid, u32 field, u32 op,
-					    void **lsmrule)
+static inline int security_audit_rule_match(struct lsmblob *blob, u32 field,
+					    u32 op, void **lsmrule)
 {
 	return 0;
 }
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 978051c498d5..542eee7ad882 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1333,6 +1333,7 @@ int audit_filter(int msgtype, unsigned int listtype)
 			struct audit_field *f = &e->rule.fields[i];
 			pid_t pid;
 			u32 sid;
+			struct lsmblob blob;
 
 			switch (f->type) {
 			case AUDIT_PID:
@@ -1363,8 +1364,9 @@ int audit_filter(int msgtype, unsigned int listtype)
 			case AUDIT_SUBJ_CLR:
 				if (f->lsm_isset) {
 					security_task_getsecid(current, &sid);
-					result = security_audit_rule_match(sid,
-						   f->type, f->op,
+					lsmblob_init(&blob, sid);
+					result = security_audit_rule_match(
+						   &blob, f->type, f->op,
 						   f->lsm_rules);
 				}
 				break;
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 03cb9841d1a4..c4f718fd858b 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -445,6 +445,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 	const struct cred *cred;
 	int i, need_sid = 1;
 	u32 sid;
+	struct lsmblob blob;
 	unsigned int sessionid;
 
 	cred = rcu_dereference_check(tsk->cred, tsk == current || task_creation);
@@ -643,7 +644,9 @@ static int audit_filter_rules(struct task_struct *tsk,
 					security_task_getsecid(tsk, &sid);
 					need_sid = 0;
 				}
-				result = security_audit_rule_match(sid, f->type,
+				lsmblob_init(&blob, sid);
+				result = security_audit_rule_match(&blob,
+								   f->type,
 								   f->op,
 								   f->lsm_rules);
 			}
@@ -658,15 +661,17 @@ static int audit_filter_rules(struct task_struct *tsk,
 			if (f->lsm_isset) {
 				/* Find files that match */
 				if (name) {
+					lsmblob_init(&blob, name->osid);
 					result = security_audit_rule_match(
-								name->osid,
+								&blob,
 								f->type,
 								f->op,
 								f->lsm_rules);
 				} else if (ctx) {
 					list_for_each_entry(n, &ctx->names_list, list) {
+						lsmblob_init(&blob, name->osid);
 						if (security_audit_rule_match(
-								n->osid,
+								&blob,
 								f->type,
 								f->op,
 								f->lsm_rules)) {
@@ -678,7 +683,8 @@ static int audit_filter_rules(struct task_struct *tsk,
 				/* Find ipc objects that match */
 				if (!ctx || ctx->type != AUDIT_IPC)
 					break;
-				if (security_audit_rule_match(ctx->ipc.osid,
+				lsmblob_init(&blob, ctx->ipc.osid);
+				if (security_audit_rule_match(&blob,
 							      f->type, f->op,
 							      f->lsm_rules))
 					++result;
diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index 64317d95363e..f9e3ca96fa52 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -408,8 +408,8 @@ static inline int security_filter_rule_init(u32 field, u32 op, char *rulestr,
 	return -EINVAL;
 }
 
-static inline int security_filter_rule_match(u32 secid, u32 field, u32 op,
-					     void *lsmrule)
+static inline int security_filter_rule_match(struct lsmblob *blob, u32 field,
+					     u32 op, void *lsmrule)
 {
 	return -EINVAL;
 }
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index db6b62c5c035..2c1a92cc1bf8 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -480,6 +480,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 	for (i = 0; i < MAX_LSM_RULES; i++) {
 		int rc = 0;
 		u32 osid;
+		struct lsmblob lsmdata;
 
 		if (!ima_lsm_isset(rule->lsm[i].rules)) {
 			if (!rule->lsm[i].args_p)
@@ -492,7 +493,8 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		case LSM_OBJ_ROLE:
 		case LSM_OBJ_TYPE:
 			security_inode_getsecid(inode, &osid);
-			rc = security_filter_rule_match(osid,
+			lsmblob_init(&lsmdata, osid);
+			rc = security_filter_rule_match(&lsmdata,
 							rule->lsm[i].type,
 							Audit_equal,
 							rule->lsm[i].rules);
@@ -500,7 +502,8 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		case LSM_SUBJ_USER:
 		case LSM_SUBJ_ROLE:
 		case LSM_SUBJ_TYPE:
-			rc = security_filter_rule_match(secid,
+			lsmblob_init(&lsmdata, secid);
+			rc = security_filter_rule_match(&lsmdata,
 							rule->lsm[i].type,
 							Audit_equal,
 							rule->lsm[i].rules);
diff --git a/security/security.c b/security/security.c
index 8d92c88d0da5..11ff3f3beec1 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2486,7 +2486,8 @@ void security_audit_rule_free(void **lsmrule)
 	}
 }
 
-int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule)
+int security_audit_rule_match(struct lsmblob *blob, u32 field, u32 op,
+			      void **lsmrule)
 {
 	struct security_hook_list *hp;
 	int rc;
@@ -2494,7 +2495,8 @@ int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule)
 	hlist_for_each_entry(hp, &security_hook_heads.audit_rule_match, list) {
 		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
 			continue;
-		rc = hp->hook.audit_rule_match(secid, field, op,
+		rc = hp->hook.audit_rule_match(blob->secid[hp->lsmid->slot],
+					       field, op,
 					       &lsmrule[hp->lsmid->slot]);
 		if (rc)
 			return rc;
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


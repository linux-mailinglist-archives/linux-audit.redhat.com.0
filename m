Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0B9168AA8
	for <lists+linux-audit@lfdr.de>; Sat, 22 Feb 2020 01:05:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582329905;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wy9gJKhIU6xppEW501IHKX5//WHVQ1vzzu88dolSM5k=;
	b=doAGZsdLNw6uoNhtqlsEJW0kn3dSge4k6RXySiv6EEpNYIaSD60s7n/7X1rpi9jR1Tp/+9
	62FEgWCEtoZqg3PQi1K3eJeNAima42++yemWGZhReNLbnexnTT0O9yugCBCSH2JzXPfqsV
	3a7WpAqRKUsiAsnIC0udMocRcjK0gQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-ysdCy88hPDmX3V33uacNJQ-1; Fri, 21 Feb 2020 19:05:03 -0500
X-MC-Unique: ysdCy88hPDmX3V33uacNJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AF538017CC;
	Sat, 22 Feb 2020 00:04:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02BB12709B;
	Sat, 22 Feb 2020 00:04:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7FC218089C8;
	Sat, 22 Feb 2020 00:04:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01M04ed8001317 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 19:04:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6E2EE2063FE6; Sat, 22 Feb 2020 00:04:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6944C2063FE5
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 00:04:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DA85800296
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 00:04:38 +0000 (UTC)
Received: from sonic309-28.consmr.mail.ne1.yahoo.com
	(sonic309-28.consmr.mail.ne1.yahoo.com [66.163.184.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-295-ZraYXQ_LOUmfSKJ5X7ZxGA-1;
	Fri, 21 Feb 2020 19:04:35 -0500
X-MC-Unique: ZraYXQ_LOUmfSKJ5X7ZxGA-1
X-YMail-OSG: kbHZLIoVM1lHOvEayEUPGSHI2v_uMbok9Or_dUS9SAEaGyfiwiyCzGv8mMLWMB8
	tnECiDAuCNLJHimzi18HMNAlCBfVXLqvy8fWssVDYYYGe1XsNhzqMskREkJF0ReuWqmrwRpMoeIR
	p8hFrmt2qMr_ZB3bPe6EDS0C1yiZKUlZ2M6wjTIJeI4qMyDKk5HJUBbXvI7coRVz_ahTY6c6xtdY
	9YrnDuKLYIx9eE8uC.xvQh_mPyhDTAN1vqzKQB2XIQ3Fi9.xUOBqeCYk09J_25eR3MYFOtRzAr6y
	Rsfy5qQD_4uUkaYYvFrfKkTYilhXdtdzJEwx5wPWZdDU1JCp.uuhv6_TYpBe.fMPKbDYbVC7aCza
	yUbSiVDoT76ELl2YwUHRnOp.JnyBjO806b0kcyHi8tGMcPTy.rIFYQixOidKsRNZLjaNU3yPBuoQ
	plZhameMIQtyz7b0fQXjqmzP3W8wD74N9fBGIRPMSlnuGR8emyg1Z9O1WX_UmKj3OJSj7L2DBesY
	IXUfioIL29.TLBXi7DzYp1.3SxkQQm8FdABz5lVgUOhgxoH902v5Cjw8N0x07aUtVzfzrUsopSo5
	5Gzc2j4mOyN9nbPzNqEAKuDmp_G4I2LnoY7iV.eIIoh7NmWWgz2vtHOXwhcLjE4KEaozDPzXFAzL
	ojDQvY4r4vyNF38hzQ2JrrUNJ_Dq5eHN9TZPqVHo5bi.ha2qQv3ex_kl4sSOQ9QJxXLdsgVDTc4E
	NXW.PNArLfW6e9052tgjYV.dEDkEYPSrXczjmbaovlNOGLC_4jwFjocoSMJbELBWtuV25snwJw0G
	mi4_P_MDfJIKiJoESUUeBK2h5abS0bgaaBaoj9Y6icsmEmkhfnf8kR61LoSKhE2iwe2S6PWkiZEG
	OrJFQUa8sfT_l2fwukbtbqgdSvnDQ1QwrdFs7rllL77h7HC0jKMz77ll.jiBmXxQkvFWhrIuKX07
	Zcoi19cEalNm7bn8ia6NeIOb51SU.1ng8Zx1pGEMVrFtKF1CZK7E09t3k1k3DnkUFbGSMR8658Hu
	4k0TTppAsnXzCdt.k9FzDLYh5O1PdSSfbktc_ixLu2YJEyUEkc460bIoFXM2ZLnrDNoYlGkjM6.A
	y2Zik8LA62V85NmxFXDP8AU7Yqp7YTyCUp23Wouhf0cbO1Dj6jbZA1M2wxXQ.mjERZGFywYavjm9
	8NbujXx82KuwYcjn.qbbVMAUMGy_0Lnx1hlHaOrC7x6gwfRXRjfyfb3M6dpEgPYWaCB7SsxwAgX5
	CmT4VU7toIGtVWZngSS_a4ee3TsF6RWlrlAJOZt1xS9cPQpRVcYCnYVmhxJmytWLUrJCmer_kC1B
	SsJxDX9Y3AzhP5A8G2tgnoH4chqVNDgloAFTl30LOlOTXeb9Vq5Q55vmLtzZh7q6gdDjKdHQ7NCq
	yda_yDrb9v8ePheKTCPq2k8VXfGerDu800aA8uQKnlwwse7v7X6huKA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.ne1.yahoo.com with HTTP;
	Sat, 22 Feb 2020 00:04:35 +0000
Received: by smtp423.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 83f4d3cb30b306a950d46deb9986301b; 
	Sat, 22 Feb 2020 00:04:32 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, linux-audit@redhat.com
Subject: [PATCH v15 03/23] LSM: Use lsmblob in security_audit_rule_match
Date: Fri, 21 Feb 2020 16:03:57 -0800
Message-Id: <20200222000407.110158-4-casey@schaufler-ca.com>
In-Reply-To: <20200222000407.110158-1-casey@schaufler-ca.com>
References: <20200222000407.110158-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01M04ed8001317
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change the secid parameter of security_audit_rule_match
to a lsmblob structure pointer. Pass the entry from the
lsmblob structure for the approprite slot to the LSM hook.

Change the users of security_audit_rule_match to use the
lsmblob instead of a u32. In some cases this requires a
temporary conversion using lsmblob_init() that will go
away when other interfaces get converted.

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
 security/security.c                 |  8 +++++---
 6 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 8c2751763c52..9d83c6832bae 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1839,7 +1839,8 @@ static inline int security_key_getsecurity(struct key *key, char **_buffer)
 #ifdef CONFIG_SECURITY
 int security_audit_rule_init(u32 field, u32 op, char *rulestr, void **lsmrule);
 int security_audit_rule_known(struct audit_krule *krule);
-int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule);
+int security_audit_rule_match(struct lsmblob *blob, u32 field, u32 op,
+			      void **lsmrule);
 void security_audit_rule_free(void **lsmrule);
 
 #else
@@ -1855,8 +1856,8 @@ static inline int security_audit_rule_known(struct audit_krule *krule)
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
index 3a44abf4fced..509eb21eff7f 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1327,6 +1327,7 @@ int audit_filter(int msgtype, unsigned int listtype)
 			struct audit_field *f = &e->rule.fields[i];
 			pid_t pid;
 			u32 sid;
+			struct lsmblob blob;
 
 			switch (f->type) {
 			case AUDIT_PID:
@@ -1357,8 +1358,9 @@ int audit_filter(int msgtype, unsigned int listtype)
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
index 0c239c29a9d5..ef2f5e7eec7b 100644
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
index 624ed1a34842..ad48b7b60cff 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -476,6 +476,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 	for (i = 0; i < MAX_LSM_RULES; i++) {
 		int rc = 0;
 		u32 osid;
+		struct lsmblob blob;
 
 		if (!ima_lsm_isset(rule->lsm[i].rules)) {
 			if (!rule->lsm[i].args_p)
@@ -488,7 +489,8 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		case LSM_OBJ_ROLE:
 		case LSM_OBJ_TYPE:
 			security_inode_getsecid(inode, &osid);
-			rc = security_filter_rule_match(osid,
+			lsmblob_init(&blob, osid);
+			rc = security_filter_rule_match(&blob,
 							rule->lsm[i].type,
 							Audit_equal,
 							rule->lsm[i].rules);
@@ -496,7 +498,8 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		case LSM_SUBJ_USER:
 		case LSM_SUBJ_ROLE:
 		case LSM_SUBJ_TYPE:
-			rc = security_filter_rule_match(secid,
+			lsmblob_init(&blob, secid);
+			rc = security_filter_rule_match(&blob,
 							rule->lsm[i].type,
 							Audit_equal,
 							rule->lsm[i].rules);
diff --git a/security/security.c b/security/security.c
index 67c8116d8711..b3fab8fdbb57 100644
--- a/security/security.c
+++ b/security/security.c
@@ -471,7 +471,7 @@ static int lsm_append(const char *new, char **result)
 /*
  * Current index to use while initializing the lsmblob secid list.
  */
-static int lsm_slot __initdata;
+static int lsm_slot __lsm_ro_after_init;
 
 /**
  * security_add_hooks - Add a modules hooks to the hook lists.
@@ -2467,7 +2467,8 @@ void security_audit_rule_free(void **lsmrule)
 	} 
 }
 
-int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule)
+int security_audit_rule_match(struct lsmblob *blob, u32 field, u32 op,
+			      void **lsmrule)
 {
 	struct security_hook_list *hp;
 	int rc;
@@ -2475,7 +2476,8 @@ int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule)
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


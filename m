Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0F17D1A02A7
	for <lists+linux-audit@lfdr.de>; Tue,  7 Apr 2020 02:05:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586217940;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=URbzNfdegiQUzqFmOJt8rNZX3DhkJZ43+ZStph9V23o=;
	b=MB61jqcoobNP7zn+G41y0k4UybK38/kPNYYyy2CPjIVb9DqVjDpGNA5fb3X/WJbJKj9SzM
	9R/Iwuiy1eeaVwUV+zKWCwObiQTscCApML8Poy+CKp48FTDjNXNmVeafRSB1Z5M2AgibFy
	e0TEVSFJglDTc3u2EO0OTf8oeQw3xj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-D-ZVg1XQNGSD1GiZc4bhMA-1; Mon, 06 Apr 2020 20:05:38 -0400
X-MC-Unique: D-ZVg1XQNGSD1GiZc4bhMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28D7F149C1;
	Tue,  7 Apr 2020 00:05:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D94E8100164D;
	Tue,  7 Apr 2020 00:05:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74C1718089CD;
	Tue,  7 Apr 2020 00:05:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03705TGv024443 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 20:05:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F78B2026D69; Tue,  7 Apr 2020 00:05:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B5AB2028DCB
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:05:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C56D4185A78E
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:05:26 +0000 (UTC)
Received: from sonic306-28.consmr.mail.ne1.yahoo.com
	(sonic306-28.consmr.mail.ne1.yahoo.com [66.163.189.90]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-159-wCVPwofOPKiPubXlpE6j0w-1;
	Mon, 06 Apr 2020 20:05:24 -0400
X-MC-Unique: wCVPwofOPKiPubXlpE6j0w-1
X-YMail-OSG: C6haa64VM1k0leL.7DfmM..f.XmN9lD4v7wUUengx.q_zWqztFohQD52MKcDAuK
	SjaiKPOJOt_JODRT15wIotfjnvoftR0PVklTIg6v4bDUUl7tFZGzt9y8DRFlA.11nZGKmQUdtUb9
	OuShDVnbV56iLjslYO1IUnE_84cThzYFxlPwUryIIrHZIuX_GTG94M296hhboP29hlJJb19eJA_n
	mXieRccrSoOLf1K5wktZRw1vRtSGh6.D8gcJ4kzq89_CSiZg.yOZEfxPP1iy5LUyMr64INFXYhZj
	LTiw4LVTGUmURNx4Z7h1KxPLdqquneuCL5nDhhD3INLmUiuQ6RjStDgCujtBnEe_Jwd5s_y.QKXW
	Osc2rGEEpC5AwqdQCk.WgKH_WkD.h1XSoX5VOGnegFbzL6HBg4hU4vFWfDCIisTxXr2DaA6SwjCx
	G2KbBTusrLl8dSlwIFdp9RYYoZM7wgfjy8v85A38Mh9_f4PSTNytwTlzp2DT71ojXSi_OwBKzZK5
	Cy6N2UQ4o_3fwHiQTD7IUIvFCG_cZtdoUytLqF83S0xqy3gvvPVzapfQBT2wbsQ90wPeXEBQhEO1
	8S69It_xWlT9ZJGFGZeqEzwjbZza8z55QitKra4fx08d3NunBIsunFDbq2v0N6GPeNz3ubIR821B
	_me6brKm.dEQy8h6Iw3xvAAe2H06eJA3uXmycQNWb0OOlOJTD11afCaE3ciWUdq7dhs1y7Sb3P_z
	Ubmm7GCaKct3JH9kAYBe6HqO3nU2nbKZa7yhm0m46TBqzMCp4gjmrtxY2O1Po7a6J8KINk8AW5fv
	6c0cigQkVXTFdeCH_8vICYkgXhtrEBoPe9XQDNfjPnh5X3YydOCsTLLRevNbjfOAn.22wULGNO40
	tXuH21a1L2R7cAy5PWbWaIjzaXi.iCXMQTyHNPhrIdOpA.tkEU4ZTcwjfLX4UFseS13WfvYi9uLY
	oN5Qmngfg4e6d7E0AK9Co6zDoyc.x2AmURI6_b94SBrk6tGWaAqyWtwy0WpaUzW_sPQQl7OwWwZi
	TFDQn5AMIaJaxlO5WLsLQ2kKy.svwJUxEQc4jVMR_reTIPB4ki4E8ev6reju.537jR2ZRtPGobPU
	3so31qjmlj5wiIHvUMEV3tbxjN_XjslaRmNq3r_WsgjMP2ndBmepL5C_.FFNvLPv6ycuu2KzH4vR
	.zIC7.toCEEY75jBcW5vIfo2vKZhh91lRJX8LybX_VontWDDg4Og3rRU7CC4_N04talUDD7yTGVm
	mwgUzlIV7WUYJhQxrZRs.dFbd9BNPgq7u9vLLS77peaZdt4f4hIG0E78cdc4AGKdOLpt1g8ESZ9R
	WgLMHtBeeqk89BrP0IPPwuRFNBQ5Kp9Xw7ZmuMF6XvUpe6GG91v3dGWfwgGk2mQIVypo7LfKfqTf
	5tfMoAFqKxK8_oBzq_3BWpmgj0CfTz5UbcUr5GL1iSUuDKnY3n.RNnHSyWBLQHw--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 7 Apr 2020 00:05:24 +0000
Received: by smtp431.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID a68cf8b6813c24e99d394d3a2f4b12ab; 
	Tue, 07 Apr 2020 00:05:19 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v16 03/23] LSM: Use lsmblob in security_audit_rule_match
Date: Mon,  6 Apr 2020 17:01:39 -0700
Message-Id: <20200407000159.43602-4-casey@schaufler-ca.com>
In-Reply-To: <20200407000159.43602-1-casey@schaufler-ca.com>
References: <20200407000159.43602-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03705TGv024443
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index 006447d6c366..55cca6a57178 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -482,6 +482,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 	for (i = 0; i < MAX_LSM_RULES; i++) {
 		int rc = 0;
 		u32 osid;
+		struct lsmblob lsmdata;
 
 		if (!ima_lsm_isset(rule->lsm[i].rules)) {
 			if (!rule->lsm[i].args_p)
@@ -494,7 +495,8 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		case LSM_OBJ_ROLE:
 		case LSM_OBJ_TYPE:
 			security_inode_getsecid(inode, &osid);
-			rc = security_filter_rule_match(osid,
+			lsmblob_init(&lsmdata, osid);
+			rc = security_filter_rule_match(&lsmdata,
 							rule->lsm[i].type,
 							Audit_equal,
 							rule->lsm[i].rules);
@@ -502,7 +504,8 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
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
index 8e66f27d6adb..b3fab8fdbb57 100644
--- a/security/security.c
+++ b/security/security.c
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


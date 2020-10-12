Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C254228C23A
	for <lists+linux-audit@lfdr.de>; Mon, 12 Oct 2020 22:23:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-dE6ORgaBMmya44HME80CcA-1; Mon, 12 Oct 2020 16:23:06 -0400
X-MC-Unique: dE6ORgaBMmya44HME80CcA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E05F91074652;
	Mon, 12 Oct 2020 20:23:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE7085C225;
	Mon, 12 Oct 2020 20:23:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D57A58109;
	Mon, 12 Oct 2020 20:23:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09CKMugT018532 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 16:22:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF25D10F1CDB; Mon, 12 Oct 2020 20:22:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7CB4114F0BF
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:22:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C06481823612
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:22:54 +0000 (UTC)
Received: from sonic317-38.consmr.mail.ne1.yahoo.com
	(sonic317-38.consmr.mail.ne1.yahoo.com [66.163.184.49]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-448-_eBK_Um2OmOVyWAj1d-4IA-1;
	Mon, 12 Oct 2020 16:22:52 -0400
X-MC-Unique: _eBK_Um2OmOVyWAj1d-4IA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1602534172; bh=lK6X0S8GaLx/VtFsAiYHPkWDHji22ONDn6fMvGYps6t=;
	h=From:To:Subject:Date;
	b=a5z7gnW443dHRZVHhffqZEVYDOjBMn/eWaUMbWfabM/hTEVs7jnOufovJPehhldGvoUSw9SaZu8EXEneBVEINykgJmDnbyj2EUx/po5VSO3PgqiuDk2NP8z0tq5Aq4RwHRV9XqGvynsYHkWkVUy4OI8KA45tMMh94KeecTyPHvCnF7bIwKQqSoHabvDstjNrd4S7tgGNSvxuPjZicy4q+M4J8UaxdS9JrqPq8kI0kGcGnt1XoGGHJbi1wh2x9m52JdJWlgiP8JXbCRqyHDUQZKvh87LleXoxsXUMq1kdsmNMxDWn2TJ7bpOGNB+N5ZecxRpbG5NQq6BLAKn5LkPtwQ==
X-YMail-OSG: 2OANYZcVM1mBTVsCljR9vTKDUtg9fcqmTwUENz.s9JQL7lgj7mr8l82PQqfGFIC
	tYnmZNIA6IHx_ahifYOjKBo.7nRzZ2ZkznJG527TsRT.dVlPjqssQzz3PNzGLmxRzQXhoMnHjqtb
	H4VpTNIi9f1jW5V6fxtIPi7o9hN51dd1G19GQNiKZ6W3ITIQQIEctS_ceZBrbNSYGyJFcpPlNE4k
	r.R_ktwXmhfUgA0VzNqT6IqXRFRFvfDdIxXgXOY8lFMH.vYFIMw.bdXCIoUru0YKI0ic4HgB.BTY
	BaMZoM_eYjstyCWy44onMk7DCIbxpDPQ0W4Q0y5XCJzl3kRPF_74ZZy82_A0L816I9WPaisB_P4.
	EETIiP4kjdQNEt46Of8JKtF2ck9AiLDvW_r1Q_YOCLU7IAtyi.DSqljfN4NNBwlHfOSxY3wWwbdh
	OvH6PuRgrMw0vPmkn37sV5Kt6mq5WF6MigZAGdXDgacasp1CUztXAUI8mnnU88RjCXFqD7NJAv4r
	33LmfellP_LSVTVsYASdJ8_FL8l8N2w3PIPQYz4uLkJ661wTkNy4e3gg8vjgBcngZv7waUtAOpUt
	5PD1fKebx9WGdccbyzJlHCLUlFf0wHjYc_RTf5hbcZNbgPBfr2hvRROHZYzbOqglpmQMlr_cvpe0
	wGJ26zb5a6mlhdeIa23E6XrZnduHssomtZ.l18Wsi0sJzLlT4byviUo7EqKJpIWK3RRNQY6hhbUL
	SA08ukQEkCQIi.qhF8KP.ZEhtUY3PjXzlxLXatxiYmrqa6KFy4MJneKN_8l_x0CWUMG193JB1_7Z
	z5SASjRnxETVAtQNs6xRxNkXXi7Kn2kszbVASqQOMMpLAML7JTHlbHwgLI3UDsbOQGO3qbEXn_5s
	9Z0vU8dWiP.rtArrpQ3lwAqZX3Zgt1J1aEtbhk3uiL..jpawlA_FL8Q0fXB_vQiPIkh0oZEzm9QZ
	uCMO75MJ2WQhqPe7mTYBKaR06pjveIu2tabekJTDceDM8lQbAj3T3qGAk95zPYrc5hVjBhY9RLd2
	zt8rRE_7yzAZzc0hj8wJVhcA4rdK_rkJkn_r71aClMeA89V70bLiMLzokE16nxu6DPEfFm84_Cj9
	rNidJ07EhOVUCoi7c9i0MRqF7FR4LixhVt8nsCAG4vWsj3uhznAEYksNBitrx9lqSg6nslSf8v0L
	1zdnfopb3rDE0HJeQQzHJNSRnAEr.Rt.y92Kxy7xhE9aLnrM7P6ZOuih_yU4P04BkVxl4I2Vvs8t
	uJbsGojgu3RkWLxBmS2VChE50fjzCVam4Tat0AlZLhXQnY9udSTuuZbnA0cZEjKb2JPZhp_8v7ej
	A4n8QzXAsUIlROK6XsdHp4f9AdNfsEY5t1OLRn64_EvFBK48fTpK52l7S3qkBNY8Re1v7DeUr70V
	SXFfPskafnZbX.c2oQh2UgKFjP9oQk1gjiLTPhtetbdHxDUYyd_Fx2HiZ6TWMGlu3_iNH__inh8g
	29WntfzrZPyQLHVxc5BoTvaxbuP5PnKx1MhIBqTgUHFRwsCICy19wZogxEwhepqKVAID.JueVcWZ
	VkRodYqmhTSEGllk5VVJPiuoCjihLHMkMPUk-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 12 Oct 2020 20:22:52 +0000
Received: by smtp418.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 05209e85b756436189efd23d3a492c15; 
	Mon, 12 Oct 2020 20:22:47 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v21 03/23] LSM: Use lsmblob in security_audit_rule_match
Date: Mon, 12 Oct 2020 13:19:04 -0700
Message-Id: <20201012201924.71463-4-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
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
Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h            |  7 ++++---
 kernel/auditfilter.c                |  6 ++++--
 kernel/auditsc.c                    | 14 ++++++++++----
 security/integrity/ima/ima.h        |  4 ++--
 security/integrity/ima/ima_policy.c |  7 +++++--
 security/security.c                 | 10 ++++++++--
 6 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index c91389d7aebc..cbf1eea42e72 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1879,7 +1879,8 @@ static inline int security_key_getsecurity(struct key *key, char **_buffer)
 #ifdef CONFIG_SECURITY
 int security_audit_rule_init(u32 field, u32 op, char *rulestr, void **lsmrule);
 int security_audit_rule_known(struct audit_krule *krule);
-int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule);
+int security_audit_rule_match(struct lsmblob *blob, u32 field, u32 op,
+			      void **lsmrule);
 void security_audit_rule_free(void **lsmrule);
 
 #else
@@ -1895,8 +1896,8 @@ static inline int security_audit_rule_known(struct audit_krule *krule)
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
index 45da229f9f1f..e27424216159 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1331,6 +1331,7 @@ int audit_filter(int msgtype, unsigned int listtype)
 			struct audit_field *f = &e->rule.fields[i];
 			pid_t pid;
 			u32 sid;
+			struct lsmblob blob;
 
 			switch (f->type) {
 			case AUDIT_PID:
@@ -1361,8 +1362,9 @@ int audit_filter(int msgtype, unsigned int listtype)
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
index 16e3430f7d07..7dd6b815a9eb 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -474,6 +474,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 	const struct cred *cred;
 	int i, need_sid = 1;
 	u32 sid;
+	struct lsmblob blob;
 	unsigned int sessionid;
 
 	cred = rcu_dereference_check(tsk->cred, tsk == current || task_creation);
@@ -672,7 +673,9 @@ static int audit_filter_rules(struct task_struct *tsk,
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
@@ -687,15 +690,17 @@ static int audit_filter_rules(struct task_struct *tsk,
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
@@ -707,7 +712,8 @@ static int audit_filter_rules(struct task_struct *tsk,
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
index 38043074ce5e..d7fe1d5ee8c9 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -429,8 +429,8 @@ static inline void ima_filter_rule_free(void *lsmrule)
 {
 }
 
-static inline int ima_filter_rule_match(u32 secid, u32 field, u32 op,
-					void *lsmrule)
+static inline int ima_filter_rule_match(struct lsmblob *blob, u32 field,
+					u32 op, void *lsmrule)
 {
 	return -EINVAL;
 }
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index 50aa77139498..6b43ac22220c 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -500,6 +500,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 	for (i = 0; i < MAX_LSM_RULES; i++) {
 		int rc = 0;
 		u32 osid;
+		struct lsmblob lsmdata;
 
 		if (!ima_lsm_isset(rule->lsm[i].rules)) {
 			if (!rule->lsm[i].args_p)
@@ -512,14 +513,16 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		case LSM_OBJ_ROLE:
 		case LSM_OBJ_TYPE:
 			security_inode_getsecid(inode, &osid);
-			rc = ima_filter_rule_match(osid, rule->lsm[i].type,
+			lsmblob_init(&lsmdata, osid);
+			rc = ima_filter_rule_match(&lsmdata, rule->lsm[i].type,
 						   Audit_equal,
 						   rule->lsm[i].rules);
 			break;
 		case LSM_SUBJ_USER:
 		case LSM_SUBJ_ROLE:
 		case LSM_SUBJ_TYPE:
-			rc = ima_filter_rule_match(secid, rule->lsm[i].type,
+			lsmblob_init(&lsmdata, secid);
+			rc = ima_filter_rule_match(&lsmdata, rule->lsm[i].type,
 						   Audit_equal,
 						   rule->lsm[i].rules);
 		default:
diff --git a/security/security.c b/security/security.c
index 17d701cd7f69..f9a249a93215 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2542,11 +2542,14 @@ void security_audit_rule_free(void **lsmrule)
 	hlist_for_each_entry(hp, &security_hook_heads.audit_rule_free, list) {
 		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
 			continue;
+		if (lsmrule[hp->lsmid->slot] == NULL)
+			continue;
 		hp->hook.audit_rule_free(lsmrule[hp->lsmid->slot]);
 	}
 }
 
-int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule)
+int security_audit_rule_match(struct lsmblob *blob, u32 field, u32 op,
+			      void **lsmrule)
 {
 	struct security_hook_list *hp;
 	int rc;
@@ -2554,7 +2557,10 @@ int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule)
 	hlist_for_each_entry(hp, &security_hook_heads.audit_rule_match, list) {
 		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
 			continue;
-		rc = hp->hook.audit_rule_match(secid, field, op,
+		if (lsmrule[hp->lsmid->slot] == NULL)
+			continue;
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


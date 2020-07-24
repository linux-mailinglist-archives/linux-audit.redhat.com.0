Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 14DE422CF81
	for <lists+linux-audit@lfdr.de>; Fri, 24 Jul 2020 22:36:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-Xgw3rOgbNc2TvaNZnvnhZw-1; Fri, 24 Jul 2020 16:36:17 -0400
X-MC-Unique: Xgw3rOgbNc2TvaNZnvnhZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FEC78014D7;
	Fri, 24 Jul 2020 20:36:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D9C510013D9;
	Fri, 24 Jul 2020 20:36:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF505A3596;
	Fri, 24 Jul 2020 20:36:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OKa8Pu030357 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 16:36:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 02C472BF7C0; Fri, 24 Jul 2020 20:36:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2A1C2BF7C1
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 20:36:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A386080067A
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 20:36:05 +0000 (UTC)
Received: from sonic317-32.consmr.mail.bf2.yahoo.com
	(sonic317-32.consmr.mail.bf2.yahoo.com [74.6.129.87]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-261-A3daOB08Od66KL76KLveEQ-1;
	Fri, 24 Jul 2020 16:36:03 -0400
X-MC-Unique: A3daOB08Od66KL76KLveEQ-1
X-YMail-OSG: dBlKsDwVM1nlvbAwPNBo.ksFfvmPJggA1m_q3ijPkZHnbab3lJzJ2kyrl8E2krO
	SfZ7U.9Bgxj7Jus3qjAqw6KxCZoKOE5Gdr4ZkoyWlPfq0HEXvCcGjnE8QayusOUwXdumCiXPw.xE
	YTyEkVoKHDt.TQJebUgAcNJITuXj55kks781KshPzK3.4z27g8KqcDQCyBnLCxLBhjq1zdpHsPR.
	ux6AP_JZuyh.WnhejXAlSFuaZS5x0vS0WY81A1iFs87U9YSm_O63g8yidFY9LLcMMHyVrjK6r8D0
	RWBRMo4P8s.k_x1LCLxMzmevDyQ2Tkp.dVt25MxM1Uz7nDqQNV0oNeWdU8R.io2tExcKjf47F_II
	mzs6vmlX89rRJmt.EqpehATgy_UICBAO5Hj73f4jDJi41KafiaiWnqWOujstXXeaRjHnNXC4IXZA
	FhBw0iyOskykGQeoXyALe4a9s2C2vjWjxauPtKaj2ckM.4sqcxzPB03lsoWp5sDZ5Oas4blUfTnZ
	L.J_JZdke5eWenAGwLItZvBaAXOyefsz7fRkXXj_zoqvKftVZs6ivSwMimGH_.c5fBUPwM69RM8w
	x6ZpS4owF_5JEe.Rld1NUC_yfUG0Mw04e1jEhgg8Df3GPfVreg8bDTx4uwGVHFPirFnBqWSFC1Xc
	vOemeabXdMdXInSkzaXOQOaF5P.jalYNLhwvVZnw7HyODncL7vJPgRBOixup3yayh.ou3JasdoFl
	MJCLFpgVbg5MNFSo32._5_LdDxaMpMAXlfKyBeDOk60.u.q8zGkm4YtMjCumsRFqCVm0sCemuOgT
	18jWQG0QIehtr5SSE3aHRdXdne.zDiLDoDGK08C519WZ51pBkW48FmuWFFi6ou87wMdK9AqqAG3L
	OArKiThaU68h8bpm7QxqSkIw2V_nfJbpKuY2sV0JvGmDDcTejzCHXRxmEDdWKJ1iTTy.IZFdW6y0
	ZFtKnHeuE6GCB1yGE_Mwg_zg_7oG_7.9YuCVKQUEqpd2izk_8kbLKL1.gB7TjjCwf1QMy9eQTPsy
	oRGffmlk_10PWyJ.UR7Dpa05rROylYGvtk03uzXbR6i26jiExAmcbVT_JNnaq6FAay3aYBfF3ORi
	Oao0hzwjm.cG3ud1fR5PJjRyRmaiIWe.jYDaACXV4pfFlj2LTaWM7K6eatRTLNUdqLQvbkEyVt9k
	gTHnTNID8Fn1tG2eOjbn1__h7SWSofQO5nM9SHauJu1OpaM78G7rZX3a40QtMHJKURaR10Iy9gZI
	KHXVAkoiXoAVmGwhrwQOATikYuBmOkT7UbEUFsYrbgg9CX7aYK5iKiQ.t.FowDXLe8AVrAVQgupr
	JatI.Vl_UvwP_X24gIcxxjPfGmIPDjdFXrbStoTUqzRivx2sH03DkXjn1ggQ65qFToWggiEqa2Re
	Pbq_4KgoroSeuD1Y6l2CZ22E_bcKc3dk_
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.bf2.yahoo.com with HTTP;
	Fri, 24 Jul 2020 20:36:02 +0000
Received: by smtp424.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID f55548587b73a51473c911cd88020c4a; 
	Fri, 24 Jul 2020 20:35:58 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v19 03/23] LSM: Use lsmblob in security_audit_rule_match
Date: Fri, 24 Jul 2020 13:32:06 -0700
Message-Id: <20200724203226.16374-4-casey@schaufler-ca.com>
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
 security/security.c                 | 10 ++++++++--
 6 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 591dae299c6f..294410533b51 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1878,7 +1878,8 @@ static inline int security_key_getsecurity(struct key *key, char **_buffer)
 #ifdef CONFIG_SECURITY
 int security_audit_rule_init(u32 field, u32 op, char *rulestr, void **lsmrule);
 int security_audit_rule_known(struct audit_krule *krule);
-int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule);
+int security_audit_rule_match(struct lsmblob *blob, u32 field, u32 op,
+			      void **lsmrule);
 void security_audit_rule_free(void **lsmrule);
 
 #else
@@ -1894,8 +1895,8 @@ static inline int security_audit_rule_known(struct audit_krule *krule)
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
index f9a632ae7be1..15a7fb80d6a7 100644
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
index bafa03a5c866..975c3b8c8d0d 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -456,6 +456,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 	const struct cred *cred;
 	int i, need_sid = 1;
 	u32 sid;
+	struct lsmblob blob;
 	unsigned int sessionid;
 
 	cred = rcu_dereference_check(tsk->cred, tsk == current || task_creation);
@@ -654,7 +655,9 @@ static int audit_filter_rules(struct task_struct *tsk,
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
@@ -669,15 +672,17 @@ static int audit_filter_rules(struct task_struct *tsk,
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
@@ -689,7 +694,8 @@ static int audit_filter_rules(struct task_struct *tsk,
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
index 9d94080bdad8..d72af93f8d6f 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -414,8 +414,8 @@ static inline int security_filter_rule_init(u32 field, u32 op, char *rulestr,
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
index a442b8940e93..9a0f462e8891 100644
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


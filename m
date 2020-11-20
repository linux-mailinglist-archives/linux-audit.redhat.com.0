Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5EB2BB65C
	for <lists+linux-audit@lfdr.de>; Fri, 20 Nov 2020 21:18:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-a-g21ed_M1mEks7_7GflcA-1; Fri, 20 Nov 2020 15:18:50 -0500
X-MC-Unique: a-g21ed_M1mEks7_7GflcA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53E2C809DD4;
	Fri, 20 Nov 2020 20:18:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06C2660C15;
	Fri, 20 Nov 2020 20:18:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CBF47180954D;
	Fri, 20 Nov 2020 20:18:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKKIgS1029920 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 15:18:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 09C42F1004; Fri, 20 Nov 2020 20:18:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03775F1014
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 20:18:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5FB9101A575
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 20:18:38 +0000 (UTC)
Received: from sonic302-28.consmr.mail.ne1.yahoo.com
	(sonic302-28.consmr.mail.ne1.yahoo.com [66.163.186.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-452-SiZivRf9PzuH-UGsXFPIHQ-1;
	Fri, 20 Nov 2020 15:18:36 -0500
X-MC-Unique: SiZivRf9PzuH-UGsXFPIHQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1605903515; bh=Y+lYtThC/ExlOTD+qnOBk0yHzxOLu1peAaLXotSet6m=;
	h=From:To:Subject:Date:From:Subject;
	b=VatUHeKkgKiBL755P4aYxOxWiJZIPo76RXi2BAR40uJxNOMxeI7Zw6y+HCG+/T7hEOgvW0w+H0giUHQpB3qLZlgmdcVQP+w7nJhU4N+YgXQJrAgPDNzHgCQJMZdt1tCNeBki9rPhVaR3CqfF2USvOlBUmYZ5qdDiE5Acmqb5/GM9kfcA44rKIb7PN86p4Vq8LvYJlnpPadVqZngFeQK1nvxEMtYDAZIP+NK9BZn+N/D0HOaS4GCpu04xNDefjIHPczEB/D+Y1oXBJOxRUiRop56zcjgoxJw8qiA4CSQEzvQW38jB3Fqwvn9h25qlIuqr+f+7R9r/USt+YC/5xN8yuA==
X-YMail-OSG: 4qBx6DQVM1lyqmxeej7TQbyLc0TUsrN2ma5B3KO_769QV29_NOtVjhT3IgbNi03
	osstjdU7iLHxPIoxq2yYl5TmNVVbbHrn5XZc3nclXxNCg6cpsbAC8JXUUyS15F2TjUW0JFiBNeso
	yUF45QoL4Gelsa_ZqXhJ7ByJwkPsNe8XqbjdO1b7NuR7YQ7KxR.MbLpisF0siZk9r2IOthAmMYJ.
	djBdHUPx2hDOykVkEXmVIJ52NtaYbrWaV3bRleLBHaxmjzD9g.cDWPD_9lvT204MpZo6RDH7M68c
	B108btKU0z.uEppdUsT8Q3ClCGLeTy_TMskHNNYhzIXFoYUwPjNSkShRHRnWmF.7YAxi1vA_PksQ
	w2WgyNjjTA41BOT5uzbv1ZYwczmrQ2wNvqVRw.1yQ0MJgd5h_19nQrQqc5WVe21nnPc5kg8YOdsp
	7l9.vSTWt7oNDXiYeU5sz5InNqFsxAgeVrVay1Th6m2u.hHvDc3aGW8qS4dviIcs2tOsqurQc7Xo
	cxYeG9MuW81RNtGYkqwCEXufeehxsJNvfywYZa7AiUGkmoyX8ynoE4WjGyexmZfKddA_PYPybwC8
	gYwOicW9PP.tb0gWu5jvUPMIJA216qxJC2c0d2lblg4JNZtDDZ7kuiINhv74JVbL2DmcHM3s3Zw9
	cRLT_RfhDQ9x8vYykjqlHPSmIF9TmjzOzIUU_tjpMk_suJZFMySb6wBsN8kK.GA23SPqvkWpa4nr
	5tgOXHAYXiBIxRZdorTlpyq.1PNuVF5O2FQN5XkqhAm2pmSNrR5pDDao7BaatqeIKJhYHEOBy_cy
	4TGqHwnX6XS8Dp3OBDSkzwtgzBaVNIsiayGV0iLGJMshg3D5JF1J2RjJZDu5ZqE.kGb2b4xgRNnr
	5tESrnAYclVcwvUqWbX65Ph7Q7DCNLX3NP57phmvTLoYY4WV20FzIxZrkLAEgz2PjtXfUcjFj318
	BqHR5QT6hZ962tBHbBch0nUav7ANp5AvMiTkfh35iu32PaSZ6lZJDsx9YRo9NcG22a4abXOS9csM
	F.6wsW5SFTBFUc4D_Gr3AdDQ1q6u4vNvZYe.DemJXcV2HIDqnOmriM1ov50QKHXEtjaMm6aTvxxJ
	qwdAKnvJRGIac8p6LLFzIGzI7bz02QKYLED.9x1DIIhYT8FNSVgiA8cRZBXv8TIK4eRILw_NdA9X
	unJsmY10.jWTOBIztGXYEiyXms2VRajr0OXU0r2pWjJNxYM7dcj6ewl1Z40E2SXGAphKgr1r09z6
	IeQRaghSzC1lOo.tuJBb4xg9Y1OYJE9EVBuRESiGRRRr.yzqLhIW4iK85q8ZJCaJS64geYlHTiZu
	mVjHG.wro16vK.FROG.YZBCJx9QUBOmHvdNdiQhseWcs95l_SQtMjKMSaIBYCaq7TMfM5wxFrljt
	a8hSJ1Bv4nRdvCWU4Gz74JArVaaYlTbUECGClRRzXvX43K0WUWIRUXmKWAFahbPp.y7OxNvk6zkv
	2l.MDEYJCFDPxd.Qi6BHD2jCYZutZvpJL6LL2Ln9C3ZJPQsbvtbkCEsIVWcEQ0v9dN_benzS4dWR
	UEWV7MBxyEkjmLpGl3gK_eqXJTFbqRGM.6V7bRZFv9Hb2hX10_n__XgVbpM1WJ6zlvwREPOGEER2
	39vuAwkRpCByie3paDni2xdQkfVGO16mlqSJoqJcZebc_DGMBM31OJiAVaknPpjEmKch5Oq8GP.9
	Z3CAyq9NTvMMAI8.YjWDOw6EmqulJiJjdeExS3yE41Ezxe.HC3UtklP2BKPpd1GJovvmoOQzw7G4
	ppN412uwUI.kdHi_75mv8MkKJl5qyaaqSG74STfLYF90RfYbT41uaSzvSD33srQpxXXbQdfs9OCI
	LOSxKMJGzcC7xv9ah46w8yEIQq7TufMARFbmroG2Gq5c2KI9r4ERGD2OPLuDPUZcKEK8lSFL9dRa
	gZDkCFMwBox1wn56pLAR7T2mNy7pBitwNYyMK2WMxGuwoc0zyTErEh2QfYSycHHRpEopIksUM4CR
	SpsTu3OHSW6rPDstGlQbK4lH0r2ErjTLjcyB3qwLm0z7d8vm96Iu63BIggXoL3BcCt6DrWiP1X.j
	XBRFRsSbYsBIcWLgwinxe0HbrywcaHimVkZM_pDW6HXp8EiUNZPnwJx8URp.cUFps0VCwK11rnl.
	zYAstC_MHfomHnkAihCL1gqmoArJva1vs9BiqS_VuwXpgIpiehRHfkD34Fiqm7yxB.7MhhSB_tNt
	RtLnSuzCBSCKSbRjYty7pqj9hd.TU5bBMAME2RjjwAtzIEhXsJQML1bcSPewSS.X9T4J7KWNzElU
	MW.VNWbJw5NOSvIOwHgIT.JLdywKsU5ld_t.KyoPpRxr3qw03wzLsZTyLPI4ug7i7TIfzNIeNthd
	yYJzIslIQi40tlSeceKTCZu1blfrWtq0wRJLjyz_lv03PWSQI8ACj5DXeoFzJ_3wqQCt208am9u0
	PS7l9WI_hXtHvcLGpZqPKiVacG90.5iMvlmzwOP57Z1Ptoc6R9eCGbt9c_Wr6oU60_K3jqaINVVK
	J6n9p6rPx3W43p4VIjHanH1UvLP.eCyXCmTvKUmWTmbpB0xV4wsVzfK677XkF7dlVc3BI.vQBe28
	4JpG3YGrLfi1Ai.OOhPWV343gfLuqBXgXU0u4MS2uKLx1ccjLg9h25uEWLk1EhDn.0LwN3N0g5S2
	4KbhV12rObaGz6tDyEDiHw2HeYFLzcKJdUBkZzrujvaFw8YxX2b.httTPXOuO.pUefq2XutnbEMZ
	gsI9u.aMuCbjkQ6Uogkkfyx4hAtOjvf2yAc4KCaiiL7uMTd0SvkiKjA.ZxYWmwAfCRPRmg_xj_vv
	Kl4ENe9RL4jNOz363LH6mCzhjTtbkUfPJP4BTjrE9nGlqe.LkvRCCCJdongDC6KqCF3zS_D4P7Mh
	40qDxobdfmVPVbdj_u6Ejg9r7Xxp3iBRzxetwuCdDe7RVh7zS7y4lSR_4B7hPt8O8NF0Be70UnCj
	AuQdoQEufRgSED47bfuKUXVytlMDMfFK6CMsNwftms0ZwjcjTgNKuu.Y3MctJ0ZinOjAVHfp5h4A
	j8idDHmKAW2UL6fxCkXciFy45kpGA3AXB_lprFuSq.XX3AvTZsIpJpBS4UPq_bKUZWibYdDWEmvj
	zZifM5uDKhDj_oy4487qyIQqPn_tAtbllF_osvgDAo7Ut.XlAuOdb3tWB3lI7u.J1ocK4LnMh9ri
	D7GbTdnCkVVnkFnFBSUJYxe.FnxWTgb5Dk.12cGpDRStAPN5aezS6YCupQC6H0xCos1Xa2GMbgmB
	f8mzkxpCQt26uZeVXr1JC89iUNUxHkFV9IzfZSnMK6Gic.40pTR3D8EnP8KiwX.4vGYRBhRv0_v_
	QMkKQsfZxZvlJgMYIvKZ_qzGQgPENWEGlDm9QQoPfhUDQudgJMISD.Y8aBl3yFCbGrWEItPu6G0z
	t2mbe4hLap0Ica9W.bLM-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic302.consmr.mail.ne1.yahoo.com with HTTP;
	Fri, 20 Nov 2020 20:18:35 +0000
Received: by smtp424.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 928f9f0a3ea665543955f7060f39dc12; 
	Fri, 20 Nov 2020 20:18:34 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v23 03/23] LSM: Use lsmblob in security_audit_rule_match
Date: Fri, 20 Nov 2020 12:14:47 -0800
Message-Id: <20201120201507.11993-4-casey@schaufler-ca.com>
In-Reply-To: <20201120201507.11993-1-casey@schaufler-ca.com>
References: <20201120201507.11993-1-casey@schaufler-ca.com>
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
Cc: john.johansen@canonical.com, linux-kernel@vger.kernel.org,
	linux-audit@redhat.com, linux-integrity@vger.kernel.org, sds@tycho.nsa.gov
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: linux-audit@redhat.com
Cc: linux-integrity@vger.kernel.org
To: Mimi Zohar <zohar@linux.ibm.com
---
 include/linux/security.h            |  7 ++++---
 kernel/auditfilter.c                |  6 ++++--
 kernel/auditsc.c                    | 14 ++++++++++----
 security/integrity/ima/ima.h        |  4 ++--
 security/integrity/ima/ima_policy.c |  7 +++++--
 security/security.c                 | 10 ++++++++--
 6 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index fdb6e95c98e8..89c538aa283e 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1892,7 +1892,8 @@ static inline int security_key_getsecurity(struct key *key, char **_buffer)
 #ifdef CONFIG_SECURITY
 int security_audit_rule_init(u32 field, u32 op, char *rulestr, void **lsmrule);
 int security_audit_rule_known(struct audit_krule *krule);
-int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule);
+int security_audit_rule_match(struct lsmblob *blob, u32 field, u32 op,
+			      void **lsmrule);
 void security_audit_rule_free(void **lsmrule);
 
 #else
@@ -1908,8 +1909,8 @@ static inline int security_audit_rule_known(struct audit_krule *krule)
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
index 6ebefec616e4..6bae2ee9b251 100644
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
index cd393aaa17d5..3e47cc9b7400 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -562,6 +562,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 	for (i = 0; i < MAX_LSM_RULES; i++) {
 		int rc = 0;
 		u32 osid;
+		struct lsmblob lsmdata;
 
 		if (!ima_lsm_isset(rule->lsm[i].rules)) {
 			if (!rule->lsm[i].args_p)
@@ -574,14 +575,16 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
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
index d01363cb0082..4ecbef074809 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2558,11 +2558,14 @@ void security_audit_rule_free(void **lsmrule)
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
@@ -2570,7 +2573,10 @@ int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule)
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


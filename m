Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 868DB3043F7
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 17:47:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-_4W_8NdUPCqMHSrSKZ3jgA-1; Tue, 26 Jan 2021 11:47:29 -0500
X-MC-Unique: _4W_8NdUPCqMHSrSKZ3jgA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E8D21005D5C;
	Tue, 26 Jan 2021 16:47:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD71C1880F;
	Tue, 26 Jan 2021 16:47:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8E0F180954D;
	Tue, 26 Jan 2021 16:47:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QGl1ke026852 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 11:47:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 530FA2026D39; Tue, 26 Jan 2021 16:47:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CE2A2026D76
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 16:46:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2059E187504D
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 16:46:58 +0000 (UTC)
Received: from sonic314-26.consmr.mail.ne1.yahoo.com
	(sonic314-26.consmr.mail.ne1.yahoo.com [66.163.189.152]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-45-H5DYu9vePqmteknhIrNzig-1;
	Tue, 26 Jan 2021 11:46:55 -0500
X-MC-Unique: H5DYu9vePqmteknhIrNzig-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1611679615; bh=Hj4mSh/elUiAaC+durhrt1GKiyX0BghODUQOcPer6uC=;
	h=From:To:Subject:Date:From:Subject:Reply-To;
	b=D3P6LJpZ5orrVrZvc6Wgp5icvEeukSZNZFne1HksYk53UWWad2/B5TojI94hZCwkpJV+dBv+7QQLO5rTp7LoLkGoM1WOKkwG6T4a0PTzYd6F1TsB3oMjbgmCKkoZxHLCV/LvpxvsePbts0Myuap+uccOJj0YrylxgVmXOmnu4DNMvmO2sGpFZBtFUg1qbxvQ/1o70hMl1mn0bgnHIasK6KinmVseO4OIOM6i5wlB7pxWqEoUInB/TSk20NpGtclQcuv9mBqi1juKaIMVw0PUQLTl5Wz2CnqlRgbCtPcUyXT0qIGYB/Z61p88axag4GIniDtKm8Wx8GSWLs6jZ3dFEw==
X-YMail-OSG: izcoDdkVM1mx_Ac3NTEsNJJUn0koRn5zIdGZ5S5KZ6RzOIUluVzv4WgzYq2bCpe
	XNMb8QGVRrNtqNP27zptGH9X9PpGqzXCR.yzC5hMC50b388pzqUoLIqQ7w2EknrdlFrwbchfebhY
	JPgKFMPmPBKx_Pxk3A9vBY.0YGOxnacYCw4D83LMTe5LJq_1HqYVRZmEOUoIirM5osBK0qDJdub5
	Zj9_nIzFmlPwgmlOabhx4360sLSzAdxAaOecMp3brAa6BR.4q4QglIX8NqumadszIlpduVLmhFCz
	tpLght7HpheKdDMEXyPLyBPU7sLXUynIkpx4MfqVpNES5I0bD2lUkruKjDpfChvxraOb6hhXfd5Z
	tWMmdok3ZVGyQTLDcS3FgeQvzg5qfDp7Umy2n4nnY5KhYlBoHVAtkPatWagkD5w62kEutZWGy6Xm
	w1hrCNoCKdpWM6mPfYOevh2pna4YDBCF9Yi7TqEjqYhsvI2gqdyHrfWbMUA0NNquqJ1aokAgo4RE
	AO5CIa4MOVEPBlZurBUChZsHqAVBgtdsrEbAkMr8YXHlCpUFSrenGV1N6efJx2FryGOncvE25E6R
	0CxdbEx.MKB0XwIq9hAXnyecQScNg9_YozPqarXdwW.haVSy5IvANpbLMeuEwQST_vqvklhOm9JV
	2srBUpru.C8PdAg7vW.le5jyGTaEK1YqcK9edv6euItZ7tN5T6oRqswJSI83v0VzboLjEkyZEPcS
	Y53IEYNzcZHwmtqsjUt6Or_msJZZCxeOdLk_laYDhUmiFIX5foSVcFrtYikg2knrp.8h5Eaq253w
	.P3H.YIcCM266PozyqvIUAl1hRVG2RRnriD90.BwLt2v_kqax3aF7ER_IVTOCY5Xpg.BN1nYk4NF
	jiChgxkiOqCzVodPDDk2edFPpFDNa4ZMIHLX_cNdyd8.58hguVp4rN8o16_i9hcI3w2CIIttmuK3
	ksoM7X.HI2SBI.LekvA1ExZk29uHWK32DHVY4qXbxE7eGEHhN1gshIKhIkYqdf1MgjCsC0z8WmaY
	cLIWUpHc.T9V2aSJKhnqbCXBpOuiXPMhY7eAgsGQdpDKafpez6JzhM8f18jCQnpp0eTPTnBowx3p
	LIHxEXQagR95ubV.bcfHc3pMADDALEgflyCzWSQOmaHxcQKUM_CfZTo8.Y_zfSK3o2bqSk81t_89
	BElrXGlJ6nEtWkXB7XYmNP3fypDywg5UuU3TpAf8rFfMTVpCfRXNeYCogCvXeKJ_wXaOP_v9MYO.
	ShiMHRpwJsDZhOt4MCjTvE9VO0Rzq4Yh064ngA.kK0dPn5NhKpB6Hk8zva_rAAw7c3cdHkfloZ.5
	zhG88aY8QUGaO40yKyFTpZSr2ar9QgFO0dXPyuwTiR6VWS.IYDV1UTFY8jZ9oucKQH_Y0actWBVB
	0rhtQiQJ7QI.pTrAgvTzlBbLD6Ace_dNTeF2ahBYfYHXX0Ef.IU.lAjfW5UOE3FkEZFgdXUM8zDu
	jDNcAryd1j.i6nhlGp_.lb5qfBsfA0Bz6sVcw4a08ivBa5vBaQ4MoF1ShmYIjlXVBBe6uphwDLGQ
	jg9TXPFl1qsr9lioOT36aGIZFXQMe4OCo77gTn3xA4luPGWrDQP4IK1AaIRCRodTodJ8dE9bFPTn
	HUWV6Afa9Cp6qAwFGiHNAUqjdbd0Psih.jtNsHsFOyJm2PU0oWJOlXsIm18yVBQ_BTGTKfASk0YA
	QCkeGARtSvdyeoRQ1gPa5TcniRYRvmV0LAHaKr3P_xE7VTFqh0_SmxWDry8Z2pDsqjIndJENDoka
	RMJRdPHxQy5nEROBCt_SdH8dAX7AqubKdhcLcK7VWcM6hvSR9MpQ86r73lrxRZNGloN.cN3CuCyI
	MOZW7FNReZNLGB5RAlV.a7tYIAyvq1PZliJJMkdFgS0Sgv7cdi4RnOTY3xQQ3kAuExiaeght_FCE
	2JU3veJMP9Ng_O5pcUvn8qC.0DyKhEM0yvYBp8XcI7lCU4.52LW53Lftsk4kBR.EpbvSyb1tIsJd
	a5NOzWGTu5KO7Nay8IANH5LggDWX_m2DvCohNK1ZjVXKfqIAyuHQZZRq_zqGaiXJy9mNpUgC1YH_
	8ID8YG87JaIcSkrbUoIqx_6d5Wqg6e4Ghc6zthBl7NfDqFsTsstD.Y2_2..A90x7l1GQ0BswA678
	8ZC9P.6hlVw0FQvyVcDvWqj2WMVuSlGHQaT7JgBIjxLmZbucYUNa8u3jUe1AfnMH0CowRq4Xjgbz
	M1LZou0m__lCkRtMiKMMsnt0dN375Xy2dO1tw5rzdXHtgKRnSEERs7Y3fj9UYS4EYfwV3UETsxQe
	LA0h_HzUMockgAD_ARBCIL91pehYo4_2tT3vB20bBjfnnHTDYC5ECsbsbFZnG35j36AeZOi_jK7Y
	ZZgXL.OuEpMZiYbSHuenAuvNPr_DagN375bmHMVrA_VWYlMl5Z7P1Z6O2FLfiRvTu6cEqfJ6Rf6G
	uFxkQmV6EqdLcZIXtNJRl6G7aSg4jevT0iKRRXMJSe5Z.8vHwyWt50qD4h.1ra4iimxYfhpTb4uT
	Z_wCi7FUprkePnOGZl2mxsmNGS4zNOeZGudL8EM9esRdCCQ7umZ.d55hr_2tTpzfS.Z3VnZg.vnz
	bRXxF1w2cBWLuA_JPOUn2sn1Mo8_ygJd1nhj2zA9mQid7Uh.ldOpwWBM4INzQUVKxXe06ugf2dcu
	3XoQzgRZ7XmmEqM60OeBZnjpZANSpcZTImPzKheVFCPRq7lLfPbxx_gScw8o13Wwfzt3h5EBmuTw
	JvOwO0YN5QHhf42tSVSTVFZDqTJQafQjA2ZL0.C1otAIpejHy0UDRtKxzrhAu3G_zj75a66RmKY5
	_rzs9JQY4Ro_EXjoUdnoPn6a44e8Lzs9mxQqGRELeVva9ZicO9fan4wQG8AhjlcNTMETMJWIyOpo
	3GgLICkR1N4txBiGMpkc2FetklGV0i.aixs6bVfw9gDqf.kGsp4SCJMevFmAJzWBQyvnzEmZD3VK
	5eQYb2nYfF_TmwMiAxz0q2esn4hMzpjaSdQQdICPi3wWIxCWxh_VA1HMBLe82K9ITFw.veYwlhCj
	yEZUMnWT6LV.VwXcLfQeCC6Ruu5kW9Y12aeejqd1ASNX2te3C4L09zaCahnjzgLYnMhNpGBDBR_y
	BdEWjVhe6GSjldPaKtT2DEyCQzNIvwEMDTdc-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 26 Jan 2021 16:46:55 +0000
Received: by smtp423.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 32fbc15af0745cf1933c31a9f9c8038e; 
	Tue, 26 Jan 2021 16:46:48 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v24 05/25] LSM: Use lsmblob in security_audit_rule_match
Date: Tue, 26 Jan 2021 08:40:48 -0800
Message-Id: <20210126164108.1958-6-casey@schaufler-ca.com>
In-Reply-To: <20210126164108.1958-1-casey@schaufler-ca.com>
References: <20210126164108.1958-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Cc: linux-audit@redhat.com
Cc: linux-integrity@vger.kernel.org
To: Mimi Zohar <zohar@linux.ibm.com>
---
 include/linux/security.h            |  7 ++++---
 kernel/auditfilter.c                |  6 ++++--
 kernel/auditsc.c                    | 14 ++++++++++----
 security/integrity/ima/ima.h        |  4 ++--
 security/integrity/ima/ima_policy.c |  7 +++++--
 security/security.c                 | 10 ++++++++--
 6 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index a99a4307176f..112aadf3e7f9 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1902,7 +1902,8 @@ static inline int security_key_getsecurity(struct key *key, char **_buffer)
 #ifdef CONFIG_SECURITY
 int security_audit_rule_init(u32 field, u32 op, char *rulestr, void **lsmrule);
 int security_audit_rule_known(struct audit_krule *krule);
-int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule);
+int security_audit_rule_match(struct lsmblob *blob, u32 field, u32 op,
+			      void **lsmrule);
 void security_audit_rule_free(void **lsmrule);
 
 #else
@@ -1918,8 +1919,8 @@ static inline int security_audit_rule_known(struct audit_krule *krule)
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
index 9eea55525480..a8335cbe0091 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -472,6 +472,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 	const struct cred *cred;
 	int i, need_sid = 1;
 	u32 sid;
+	struct lsmblob blob;
 	unsigned int sessionid;
 
 	cred = rcu_dereference_check(tsk->cred, tsk == current || task_creation);
@@ -670,7 +671,9 @@ static int audit_filter_rules(struct task_struct *tsk,
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
@@ -685,15 +688,17 @@ static int audit_filter_rules(struct task_struct *tsk,
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
@@ -705,7 +710,8 @@ static int audit_filter_rules(struct task_struct *tsk,
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
index 8e8b1e3cb847..0c520ea21677 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -430,8 +430,8 @@ static inline void ima_filter_rule_free(void *lsmrule)
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
index de72b719c90c..265184921eef 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -576,6 +576,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 	for (i = 0; i < MAX_LSM_RULES; i++) {
 		int rc = 0;
 		u32 osid;
+		struct lsmblob lsmdata;
 
 		if (!ima_lsm_isset(rule, i)) {
 			if (!rule->lsm[i].args_p)
@@ -588,14 +589,16 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
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
index 05ce02ae7c46..291db266fdc2 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2605,11 +2605,14 @@ void security_audit_rule_free(void **lsmrule)
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
@@ -2617,7 +2620,10 @@ int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule)
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
2.25.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


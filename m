Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 35E9E2A732F
	for <lists+linux-audit@lfdr.de>; Thu,  5 Nov 2020 00:52:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-JAcYxfvlMr-Gf2Ptws9M3g-1; Wed, 04 Nov 2020 18:52:49 -0500
X-MC-Unique: JAcYxfvlMr-Gf2Ptws9M3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5567E809DED;
	Wed,  4 Nov 2020 23:52:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E362A5577D;
	Wed,  4 Nov 2020 23:52:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D67CA922E1;
	Wed,  4 Nov 2020 23:52:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A4Nqb71018990 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 4 Nov 2020 18:52:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7931A200E21E; Wed,  4 Nov 2020 23:52:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 738BF205F395
	for <linux-audit@redhat.com>; Wed,  4 Nov 2020 23:52:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2E99803537
	for <linux-audit@redhat.com>; Wed,  4 Nov 2020 23:52:34 +0000 (UTC)
Received: from sonic313-15.consmr.mail.ne1.yahoo.com
	(sonic313-15.consmr.mail.ne1.yahoo.com [66.163.185.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-238-LKIoNBfxPrmo2RaldTAphA-1;
	Wed, 04 Nov 2020 18:52:32 -0500
X-MC-Unique: LKIoNBfxPrmo2RaldTAphA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1604533952; bh=FWeADDGvhP4tBC30iACHhd1/5pqoUdABTolo3HVOdhp=;
	h=From:To:Subject:Date;
	b=i8y972YOmfj9XLyJDenRqT2y2VtHZpepSArqTpMQXu6VAbztWraAQ1whggiP28k8WD6CdykLfptNm8vUGpMeriEwzyJh7uT0wPH+lbXfxWzqkQU8/2Wf5RRRo5ItZ0JiTgEC8mYqppbCwpQguBiU3XZlneVdxNBFG0iTUTQx9SNtHlMw5VZGeplpNGBSAyO4ww1wvSgeFB1bk7uvAOzMAR8tjJgqJvPipAPs9nePwmWdIrM8Riis7PfK681wEIJFmttT4CrTsB40I/SDtWYS5nghUkXX5Fo6ygHY1IQHEsoInUR3i1dUUKVON+rI+AhLykC+sl6/TrJ5vjIpAKmhIA==
X-YMail-OSG: atJBtdUVM1kF7O0SSsxxEUWpivmfTLBoOSIlZ_ffK5Mn__OUD7npoIRu.FkftQB
	HVmOiw4QmJKMmoNVtlhqgs2r12lWc.NbQdwohVsruKxLrLH4lEn27bZCxNnqbyksQ.xW9y5DWNp_
	T2NqvfCNqG.FgsvwY4eazHbD1dEGGk0MsVR5Kqy.rQyS381FnJ6xBO_YC.BqLdHooUeq.AiAXCBh
	EErGVZR4pO68ZqD569blNE1..SyJju2lppqucveRhSdxUEzoCfA4axlbvOE42iywKElt_ikiUXf7
	KEcOoa.NNrfKtH4T0yrMhHF7TRbKrJBmRa79fxArKno6ub8pSZzgDnIPHs2_NnoWjePd7b1Db.n6
	FAwj4GKSS7SxfjK5lesGflpLyaBZT6yzdXpHSk65dFZsxPMv_P5bfrBIU8w30zqB47FXkryjfQmv
	TJzMUEUfEkApTMWlydgm3yE8RrJlrY56g.7MPl608JW_8l4XUHb6RU_92SF4Dr3YTJoMo9YxRM56
	Rc.swzykmpWeOw9GVPdy7Vvjx_lMXYdrURpXC2Z4vP3liVEqDW_FD9YXZxUXoBtj6zB35hLxKTE.
	Ki8krITbDuOyndRfYFJVMcyOvAVdiJw1GjmDbzn7.3Fw3sHJEENksa8Q.rXQ.5hp2tjqzhnXk3pf
	zWAGeXrshzFVYWo1e9XWVL210hWMG9VbH3DYWWDLHRsUTmyVJHPQ.yEYJn_qunoj4IkjXJ4TSR4Z
	3gXMcZH1aqvH18RHqe7BXoTnAo1SGIyVoMR6rat2WaRWcuuJGVaGHVXeL7ygEax9Cn8MZWJFM_Ve
	0VMDKyi1cMARjbu21J8BgnIF.Zwliuec.Hlqdx922wwQC0GXMeT2vOVFn35XPrLGhHwfbjcei2Jr
	ifbm_i_EjgQ5qTVjrtaOC92gfY7JrX9gLxSGLKYl4f9ooEHkCItWo4Zg.nIW9Mk7h.qdrEs0eil2
	iAr8sGeM3tuHGpBSx.bqYxiVwikH6XcUiBqfqTA9v3.QnA7MsbUVKMJyGVKzfYWqn6htH.4J3Qc1
	uNPEVC3_xsJRWRzr8p3N3h.fuX4yLivbSDWOAONi_QNhiW6K80EEaTHFpr.AQKKzW8KNveto3dai
	uYT0bZ1iD8dlshZBGQc9t9OL2z.RDktHTPeOg_U1afVDG_6ikcnmeKv7.wE1w7F1RoRceH9w9D1C
	BnZZnXZRfkmBReU5gjmtGxnLs37gUIx2PH4VDhB6VErjRNlAIRV1EStsU.DV.ow6QOE9x2.PPvsa
	kT6fctTBQvVhe704MKl5qIaPw1kRTj5ZBt04zilYe7_LyokEuwDNavlfDpmemPhm6iF_I9omDYFs
	HSzXZm89h3LMB9Mh1fZ.1iaVaDblGhAMbQc_lf5YfSl_i2xXD2NFRaDUKFicn0WYXsucq7tUWRHo
	Mbq._iv.Y2aoy6VsboAPuVe0pF2Xi8EGPDFr0iMdkq_B.1CoAlg5hIdtPlaaTi0oVkRGe8t1rhAL
	bVJ2tX7D.hN0QzhZri3BT1VBMsjxBl0Eeg_rRe5kv3uTxuj29yPj5ETbQM5Gk36F6wV9BELGPJP8
	Db_6o9VK9wUHKJTSi15pcH9cGd.vhKoNKTc8p038qJfk5td3eKiLhg.rLAWCgf2C0SG_ZvJ35ERb
	ml98TMRZ_7hTV2.eiVkIr6whdXp1rtbZNnrBilSrcJPg.qU0j7V_kwc10JdQ_uYY0gjwz5azTxZX
	Ns5zcJpN3WUPbIqNAiyZqANIXQ_R8XTwyYQc3BHCgmioHowFDdPut0v.wph8E7Ds92KeSnyDkD_n
	IYr.KHFdqwnXDC.JvTgqavTH.LJC7Xuqbx0rlIhQMgSw2VBhMlGqeNcvbiEwhvsxSHryD90SXa_L
	Cg7IA0GLpRzQCv8mXaLbh3ki3WSI6Qp_Tw0YbxRXa8P4nHobV3ZSpzlULvZKkId03zQmCdLJQ.6p
	b4mq4krJIjBrI02Kn1pEMjGO84Z.xebidf2AtWUCLy1NVTTkyd1G7BnBUirRjPATtG3_6lFrTgbh
	vm6k5rH9v9rY8ouVgRCAntYQC_8RALSn4yvyqMJmcQKCfP.c6ELxgpfchPLSLXNmp.4U5QCJQpOA
	j91uv7AvW9soSqbardS5fncBVEwkeiu5Bc2YZd55mTv3bsWANy2yuAnQh93xcqkFEuqIKOOzFvu7
	S5yuglyfVSiKH5dCsbu6GPXBgau3agfGt.6YEJWflg2OE7oYVMDsiTQJNa7nT2lEMPtuYMVtXrvt
	47SQCWxGFwISKuB5Z7rafKU_W1zRU1m4Y9j1BN.MO4qwroHSoXGd3KfECajaBj6dW8dtb1fBj.Tx
	9lHBXHY1h8tYYyUUmj0WarTEl1Jswfj9dn1IcEGGEF87Uz3j.6onR3ApMkl7aSwrxtzKp3j3g0jB
	sPXvejB8TBO9fo4gMjlLEFIUqRdb_K0W1JB6GvocqAlbzkkDXJw3ZsXqvwNBUjWyM4su1cXi24nn
	c8bBA.oWhN.wKCJK426.ZKvCwL6xfyCp3JYbJIkqkJFn9a0CecC5bgR1X9S2fwe5AyWls8hYqV3F
	5wf_rwhRBVffbSDxOuh3_jguNv3Jh72cdVRcFaEdNNkZC1ljrWifOPNHfri8aOvz1lao86STxQlk
	Uvkbm_.eTJNE3nF6F20iySwGroR9XrM3jwFwcnX60TLroU7rfGp6_aB2BCG40CZtKBryjr2Ao0MU
	TiYi63QcnanmY6DACexlOv.7rPFOJSe2d1okvl0sM8UZLwdB3T_5PAhIrr_rGW7MzD.nhW.lXzRV
	iqf4D93Aun.2UxX0Y_jCoxJ9S.Khl7f90I0UemygdcBw0wNq7ml_.dP8mf75jGjd0hzezJNMcB4J
	jWyy5Llv3Q8muYJY6uHHBnj_KozLtTYHmS.RpdlaQ0S1_oVRfmmbYE4lvC1pH1j_K_SgbQuu5jCQ
	yxtmQ49EtGyOzlnUZso5ITjuIWejy6_3.v_FX_vSl_8Uu8ymw.39F7FCq3e0jRIaaZI9Jn8IwTTX
	RY2gYKOhjPHmIJsoIoe3fKztANyFMOnDFNqInKr60vCIMDWbkrdxULjSh7j9GfHJUEI3GDNlw5oX
	I.AQMgH5aVARfEeuoDAErMsy1Xio0T3Aup9vM0xlT_vkFU9OqrAfD_JfgUCjHBgKEFs76NxyowND
	ZwL4A.Qc8W0M_aagzXM3sKuq_aY57Ou7Mt7STyl1uoQRAcO1gEUt6B4Lj5sfgUagaDMlMWucOAD7
	ODK6sz1S6nPrIoTMKt4vo2jhi.MN42bXpAkLJp5mRYZ5SJZD9yM3z11l_U2zd9ZZtfZafMc7gEk_
	qI5HeTaU7KVa_xfzE.wjhpVWREBLA2SPXVrsMi.fa934nXhsCQ7AUStEHtnRBPHOVRMQKBbfaE45
	RMla99idx9ZMb3ERhH2FGzPILmUQknsoQd6rQE4I1_RxPIdmEZ.BTufxeLlJBBpkmG6z7NUsP7aX
	0ifVpQ8F8jcqRMQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 4 Nov 2020 23:52:32 +0000
Received: by smtp405.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 3474b28a6b02d5760a35af9bdeaf56de; 
	Wed, 04 Nov 2020 23:52:29 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v22 09/23] LSM: Use lsmblob in security_inode_getsecid
Date: Wed,  4 Nov 2020 15:41:00 -0800
Message-Id: <20201104234114.11346-10-casey@schaufler-ca.com>
In-Reply-To: <20201104234114.11346-1-casey@schaufler-ca.com>
References: <20201104234114.11346-1-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change the security_inode_getsecid() interface to fill in a
lsmblob structure instead of a u32 secid. This allows for its
callers to gather data from all registered LSMs. Data is provided
for IMA and audit.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc: linux-integrity@vger.kernel.org
Cc: linux-audit@redhat.com
---
 include/linux/security.h            |  7 ++++---
 kernel/auditsc.c                    |  6 +++++-
 security/integrity/ima/ima_policy.c |  4 +---
 security/security.c                 | 11 +++++++++--
 4 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 6b9e3571960d..a7968dde27c6 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -436,7 +436,7 @@ int security_inode_killpriv(struct dentry *dentry);
 int security_inode_getsecurity(struct inode *inode, const char *name, void **buffer, bool alloc);
 int security_inode_setsecurity(struct inode *inode, const char *name, const void *value, size_t size, int flags);
 int security_inode_listsecurity(struct inode *inode, char *buffer, size_t buffer_size);
-void security_inode_getsecid(struct inode *inode, u32 *secid);
+void security_inode_getsecid(struct inode *inode, struct lsmblob *blob);
 int security_inode_copy_up(struct dentry *src, struct cred **new);
 int security_inode_copy_up_xattr(const char *name);
 int security_kernfs_init_security(struct kernfs_node *kn_dir,
@@ -963,9 +963,10 @@ static inline int security_inode_listsecurity(struct inode *inode, char *buffer,
 	return 0;
 }
 
-static inline void security_inode_getsecid(struct inode *inode, u32 *secid)
+static inline void security_inode_getsecid(struct inode *inode,
+					   struct lsmblob *blob)
 {
-	*secid = 0;
+	lsmblob_init(blob, 0);
 }
 
 static inline int security_inode_copy_up(struct dentry *src, struct cred **new)
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 8916a13406c3..b58b0048702a 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1980,13 +1980,17 @@ static void audit_copy_inode(struct audit_names *name,
 			     const struct dentry *dentry,
 			     struct inode *inode, unsigned int flags)
 {
+	struct lsmblob blob;
+
 	name->ino   = inode->i_ino;
 	name->dev   = inode->i_sb->s_dev;
 	name->mode  = inode->i_mode;
 	name->uid   = inode->i_uid;
 	name->gid   = inode->i_gid;
 	name->rdev  = inode->i_rdev;
-	security_inode_getsecid(inode, &name->osid);
+	security_inode_getsecid(inode, &blob);
+	/* scaffolding until osid is updated */
+	name->osid = blob.secid[0];
 	if (flags & AUDIT_INODE_NOEVAL) {
 		name->fcap_ver = -1;
 		return;
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index 3e47cc9b7400..bbf9fa79740a 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -561,7 +561,6 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		return false;
 	for (i = 0; i < MAX_LSM_RULES; i++) {
 		int rc = 0;
-		u32 osid;
 		struct lsmblob lsmdata;
 
 		if (!ima_lsm_isset(rule->lsm[i].rules)) {
@@ -574,8 +573,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		case LSM_OBJ_USER:
 		case LSM_OBJ_ROLE:
 		case LSM_OBJ_TYPE:
-			security_inode_getsecid(inode, &osid);
-			lsmblob_init(&lsmdata, osid);
+			security_inode_getsecid(inode, &lsmdata);
 			rc = ima_filter_rule_match(&lsmdata, rule->lsm[i].type,
 						   Audit_equal,
 						   rule->lsm[i].rules);
diff --git a/security/security.c b/security/security.c
index 421ff85015da..f3f6caae392f 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1443,9 +1443,16 @@ int security_inode_listsecurity(struct inode *inode, char *buffer, size_t buffer
 }
 EXPORT_SYMBOL(security_inode_listsecurity);
 
-void security_inode_getsecid(struct inode *inode, u32 *secid)
+void security_inode_getsecid(struct inode *inode, struct lsmblob *blob)
 {
-	call_void_hook(inode_getsecid, inode, secid);
+	struct security_hook_list *hp;
+
+	lsmblob_init(blob, 0);
+	hlist_for_each_entry(hp, &security_hook_heads.inode_getsecid, list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		hp->hook.inode_getsecid(inode, &blob->secid[hp->lsmid->slot]);
+	}
 }
 
 int security_inode_copy_up(struct dentry *src, struct cred **new)
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


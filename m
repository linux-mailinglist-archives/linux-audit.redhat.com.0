Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3FA1A0377
	for <lists+linux-audit@lfdr.de>; Tue,  7 Apr 2020 02:13:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586218404;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YpfxiOVoPuKmS3ulMyzz+mqPmSO0GencowZfhBpqbKs=;
	b=bnsHal+Sd5vq98Io95CabR34WyTZsSlp6KnbYXxRcApgu0uynctfPsCIwCqAHA7IUJ4eb9
	PvapBurA4AEQ1WHVvAyHMGBQ4czELOvcV5Y+QS7r6WYP7pQVJwkPwXXmTEGoHmHk2RQAMX
	gAhRnv6gH2n8bM/QVqLF5hVxVfqwy8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-avW7o92iMgWDid6U7-eEtg-1; Mon, 06 Apr 2020 20:13:22 -0400
X-MC-Unique: avW7o92iMgWDid6U7-eEtg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A28DF1084430;
	Tue,  7 Apr 2020 00:13:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32D2B272D1;
	Tue,  7 Apr 2020 00:13:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81AB618089CD;
	Tue,  7 Apr 2020 00:13:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0370D9Bn025272 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 20:13:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 504A72166B2D; Tue,  7 Apr 2020 00:13:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C1892166B2A
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:13:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3206101A55E
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:13:06 +0000 (UTC)
Received: from sonic313-15.consmr.mail.ne1.yahoo.com
	(sonic313-15.consmr.mail.ne1.yahoo.com [66.163.185.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-21-E4uJY22rP9iAPA2lo0Og7Q-1;
	Mon, 06 Apr 2020 20:13:04 -0400
X-MC-Unique: E4uJY22rP9iAPA2lo0Og7Q-1
X-YMail-OSG: DlV1f.kVM1mPGzxT6.vJaFz4pYC40Voes2wY0XxpN2nhRTDupFb9iZq92ehBv21
	ZzileCcui1EHEPvmoc0F7pFymfP1GZG2Cpf9rIeyT0Um5MZNn36ff3cCMA_pMG79UFF.exDxowez
	YeqHuSLGaAbIgGtra3YwEwZ9kHpL5orjeHdUwSRfF.yKZja0nuUrzcg727P3jRyKBn3CgReyJm94
	c8QwyqL_mHD8ZYYYkBcl.ilwyoYbBhaM0xY5xMnfDMIlpl0QJIUIeQacCwtQ.oaFMJKdB3amG_WN
	wDxd5hCIAggVLmozTmkCPhqvzys7UM7DyHCiiqEqGR72QhGCse2zTiaNpV.FDR4cwe7kQsRmS58g
	YJrBl4.5O0MCyyPSNVk8_JvQm5DgJyoDgxZ6Mce9Y.kXNARENA8DVcwV2RarQMqaQCXlHn19qb55
	RwmQ4HbqD5lVr8UL.HvmuayxSkCCPQlUXERvex6KQ.HXCpsWqwPo4MRusdlM0fq0ou9niym1H8E9
	Q8uFcXMtu57idIAbznccqc6Mn_xlyyRNFNStX.J.hhEtBl5tNGzm55WaIGg32vfifb5xoGyelgSG
	c7XpC2pak1Uy.sVkc.ZE56oIkDir7msxdsU0_8vg8BEyJ92.EfuuYj3ZRHQcGw7ZWO8i2b4xZySM
	rg6Ul96fB2xVwllehLl1G.5O3QLF5H1sxSw8PridIu.AZ3XNdkzaZV_QJ4znduTXHinZvRX5ZQWR
	JvlMcK.KKpMiqRrg2opQye7PJGiWg64Lj9JfbJakGsDuBrujF7.hutj8Ay7WFU2sVySb4WcC78gI
	pDMA9FlCcDxJdTXIUIwsZ5MvPhbskovS.rN2NsF_GFhjHJ8JeiqZWeUAygYzMnowcPetjp46lZDJ
	pScPqxPfgaPc_febpfa6T9Iz9XfpwZfRnSrM40lB23maTJbqp3uBOn0P9uMeXRzKzL.B3lkv.1yo
	Buf6jof77PgahxEcNv1EzUmPB0ogh8jeZV521ENMyV3VO8SyofUhDAfj5OF_LuhdTM5AliKDb._y
	2AiioXjspdyydRpuuisO37kN.kHzc4OGAYvi162g0LBWBwsF4_BK.CGc96wLjDz1xKc08evmbd_D
	WihB.aOlnfZuz3IZsV1EVzMexJ.8RAgeISPUGO3msQoST0LD4Kl8VaQ3ImiHt_Teauh4xRV590Xu
	RAXBKzD5yVcqaDmLib8WHYMEFvMOO_gxBF4CIdXxLNswL2NgxQwQ6R0ky6hT.uOVFQ3fLyd_5IJB
	ZDcn5jvbB74NRIg4qLdWsQWOUwFNeItrz8Mx1Te.60hskpKFLYs.d.cINKwiUWJHzXbq7HNbrYGh
	smtoSXL1Ns_TJ8i_u5WsHi3PlOEtQo8oPEfqa2ROgjTTzroUEr9je5zz2J60dvENjUmflFBx6nV8
	_oQE.WJRJR3JR56d4CjCp88S3SUMZT8.VmyQJHvuWEBw5FyLqV0cTQkkpLI8gcETxrqo-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 7 Apr 2020 00:13:03 +0000
Received: by smtp418.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 8db2901e53ac4beb8f71170a41efc7ad; 
	Tue, 07 Apr 2020 00:13:01 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v16 10/23] LSM: Use lsmblob in security_inode_getsecid
Date: Mon,  6 Apr 2020 17:01:46 -0700
Message-Id: <20200407000159.43602-11-casey@schaufler-ca.com>
In-Reply-To: <20200407000159.43602-1-casey@schaufler-ca.com>
References: <20200407000159.43602-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0370D9Bn025272
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
cc: linux-integrity@vger.kernel.org
---
 include/linux/security.h            |  7 ++++---
 kernel/auditsc.c                    |  6 +++++-
 security/integrity/ima/ima_policy.c |  4 +---
 security/security.c                 | 11 +++++++++--
 4 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index cbc02e13e4b4..3f07ba240ec5 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -432,7 +432,7 @@ int security_inode_killpriv(struct dentry *dentry);
 int security_inode_getsecurity(struct inode *inode, const char *name, void **buffer, bool alloc);
 int security_inode_setsecurity(struct inode *inode, const char *name, const void *value, size_t size, int flags);
 int security_inode_listsecurity(struct inode *inode, char *buffer, size_t buffer_size);
-void security_inode_getsecid(struct inode *inode, u32 *secid);
+void security_inode_getsecid(struct inode *inode, struct lsmblob *blob);
 int security_inode_copy_up(struct dentry *src, struct cred **new);
 int security_inode_copy_up_xattr(const char *name);
 int security_kernfs_init_security(struct kernfs_node *kn_dir,
@@ -947,9 +947,10 @@ static inline int security_inode_listsecurity(struct inode *inode, char *buffer,
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
index e64f73cd5bc4..5d4ce44bff91 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1938,13 +1938,17 @@ static void audit_copy_inode(struct audit_names *name,
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
index 55cca6a57178..594cf716a16b 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -481,7 +481,6 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		return false;
 	for (i = 0; i < MAX_LSM_RULES; i++) {
 		int rc = 0;
-		u32 osid;
 		struct lsmblob lsmdata;
 
 		if (!ima_lsm_isset(rule->lsm[i].rules)) {
@@ -494,8 +493,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		case LSM_OBJ_USER:
 		case LSM_OBJ_ROLE:
 		case LSM_OBJ_TYPE:
-			security_inode_getsecid(inode, &osid);
-			lsmblob_init(&lsmdata, osid);
+			security_inode_getsecid(inode, &lsmdata);
 			rc = security_filter_rule_match(&lsmdata,
 							rule->lsm[i].type,
 							Audit_equal,
diff --git a/security/security.c b/security/security.c
index 58c8866d2871..8cced3fc9ad3 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1418,9 +1418,16 @@ int security_inode_listsecurity(struct inode *inode, char *buffer, size_t buffer
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


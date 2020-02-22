Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 155FF168AAF
	for <lists+linux-audit@lfdr.de>; Sat, 22 Feb 2020 01:05:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582329931;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OBpxlYpQ40iw6sVUKCyxcokVvEiuaVj/1JquJug0ZPc=;
	b=d0kPCvt8dADlSnKfsZDiqb+YoW309T2rOIyOW9SzGolcRCeW1Yj8Yx7+HlWidowGvTfJxV
	COX0k6eu+1Rp/b8kw25jWNwfGye3EsKs4iYmLgfo7yz4NHwvhn8hGAwOvG3EeOXxGq3DgK
	PeBv7QLS0H2AFsxOEtOxC4LPEpDbnAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-WkvzVrucN9GUN99lGMlHiA-1; Fri, 21 Feb 2020 19:05:29 -0500
X-MC-Unique: WkvzVrucN9GUN99lGMlHiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D2C6107ACC9;
	Sat, 22 Feb 2020 00:05:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6D6C60C99;
	Sat, 22 Feb 2020 00:05:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8844218089CE;
	Sat, 22 Feb 2020 00:05:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01M05Kh2001460 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 19:05:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 003DE2166B2E; Sat, 22 Feb 2020 00:05:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F00B12166B2B
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 00:05:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD155101A55A
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 00:05:19 +0000 (UTC)
Received: from sonic309-28.consmr.mail.ne1.yahoo.com
	(sonic309-28.consmr.mail.ne1.yahoo.com [66.163.184.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-327-BVvuR5E3O4Ghml8dr_ogbA-1;
	Fri, 21 Feb 2020 19:05:16 -0500
X-MC-Unique: BVvuR5E3O4Ghml8dr_ogbA-1
X-YMail-OSG: mv_mnPEVM1k_Y3gRM5ZV.eEJqPQJQsmLoWY.xdQJp6MCrI8FneAC8y5GKwSdERl
	CCovpKcLTEE_m5P3w4EbWdaOPo0.fl8_sGnb9nSG6GElIlJOl75M2b.H.tCTxPDXGD9ICp48F2Aa
	7c5h2768X9bfmgEKLvNtp3sOBQ.ZgwDcKc49C2vCW5e_YAtaoepioSRfE.30cFh.LNU8KwwxTzR2
	6HEWLtplfvbJeZ4zR791SbIOXjksU_DKPRgGkbP6doij.pI47BvGR25z64QtUIUrcMdCCt45G2q1
	.hkLD01Fm_52w541BdLS8_sFZOftZRQZtaGLG8oph56vWDw2WX5Yt0aiTZOky183DlD6xHizUnSd
	K9TNIFQMblA71qM.k_WohDHm2l09HC9tqJwBfqQUaBrngdXjazGxRY0lL2vneNIBbTOrfK_2uY1B
	3ZYHYXff5cK1dC34mdkd.JDv2vxB6T0nNa6Fk4KD1tmz7kdzcjuqS55QXTQ2d1vlDzai69vkuGwC
	XSI_KUnNC_8UyzOiYYUtU5LorRHWS4u8CKABgb3TP.5f50NqK.sh3uHWB_hQr6IjmXth8olTsYdQ
	WPgE3Xc3P9SH3jdoqIJAmJdlkuBNTTPf5TvWUIEYuHYAEcEZCxmJN_zyXM_h5kHUdc8at2cFXHgK
	a9ynRb80iR1M.HHGMnPLrhWuqup6YmHY3H7zdXAl9Pr.sDlhkOXlXZYcRLmKuW_e3GoCuNOU9eHE
	5jwb5M7ICJuPhM.22LNHMD3qxxQpje7cgabV0UKYy2ZrRrewdGuCGJgboSWqsfYjIDo0m7pG3c8n
	wjcmNk1Z71kYt0JwHNJ3HcH3BRDf70fhKZ.oaJIlN.u_6HM8KZZlrCd0aDCdZKC_jnnMA7aiSAdL
	bO6CyyCehgrXlc_s7oZDxb1ETwsk751U.tIGuxhVSGeo1wbD.Prpk.b3tyvzMZleDSKPeZ3dD9M8
	NcsvGIRujNjLMMN74BsVUkHrj58pgQPhfqcyJKoV.Twi6Nhv0fu0CgTym0wSXi_aQWErkO87rZ5f
	kdQ5whsLRl2v4jrhFH.ld_aJqtc6zyuRRYbTjdTSMmRqEvcriX9VSZOvDxr40_FcGjKEoUrHizRq
	.fHq4unhMSB2uAkxS7v5ZU6loO6YLSxa6y1BO5OnPDLFKp86ku979IXNw40IcD.tjL.ylPzJr1iD
	c8VD6VUtFkGs.AzIBNn3zgdNRa_MShyfq8Mr46Wd60h3TdWvJ3CLTUQ.d.M8ADCVlTpGSP_hOgUD
	IdaPcg95_vqZYxES8pr9W7JM6X_DTrONu1jhAE0t0Btqnce4iHXc4FWT88OtzjX3eKVlpPe7n6q3
	10qA5TiwO4mIXseLXxTNK8oXeaTwNl1YMRJ42GfwIzFlK9T87KEhztPqsiPCPkF0Atk37S.yGOkk
	u6zrTRJ5MyK2q32H2DXL148dtdf6.LwLdv0EJhhOx422FTtF_IQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.ne1.yahoo.com with HTTP;
	Sat, 22 Feb 2020 00:05:15 +0000
Received: by smtp421.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 84a22e2ef9ddf52ac160ead79f3db1ba; 
	Sat, 22 Feb 2020 00:05:12 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, linux-audit@redhat.com
Subject: [PATCH v15 10/23] LSM: Use lsmblob in security_inode_getsecid
Date: Fri, 21 Feb 2020 16:04:01 -0800
Message-Id: <20200222000407.110158-8-casey@schaufler-ca.com>
In-Reply-To: <20200222000407.110158-1-casey@schaufler-ca.com>
References: <20200222000407.110158-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01M05Kh2001460
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
index b5ffb2286bcf..62e095c34bcf 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -411,7 +411,7 @@ int security_inode_killpriv(struct dentry *dentry);
 int security_inode_getsecurity(struct inode *inode, const char *name, void **buffer, bool alloc);
 int security_inode_setsecurity(struct inode *inode, const char *name, const void *value, size_t size, int flags);
 int security_inode_listsecurity(struct inode *inode, char *buffer, size_t buffer_size);
-void security_inode_getsecid(struct inode *inode, u32 *secid);
+void security_inode_getsecid(struct inode *inode, struct lsmblob *blob);
 int security_inode_copy_up(struct dentry *src, struct cred **new);
 int security_inode_copy_up_xattr(const char *name);
 int security_kernfs_init_security(struct kernfs_node *kn_dir,
@@ -926,9 +926,10 @@ static inline int security_inode_listsecurity(struct inode *inode, char *buffer,
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
index 3e5ccb7a46d1..b55e66c2451d 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1931,13 +1931,17 @@ static void audit_copy_inode(struct audit_names *name,
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
index ad48b7b60cff..5c3270050dd8 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -475,7 +475,6 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		return false;
 	for (i = 0; i < MAX_LSM_RULES; i++) {
 		int rc = 0;
-		u32 osid;
 		struct lsmblob blob;
 
 		if (!ima_lsm_isset(rule->lsm[i].rules)) {
@@ -488,8 +487,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		case LSM_OBJ_USER:
 		case LSM_OBJ_ROLE:
 		case LSM_OBJ_TYPE:
-			security_inode_getsecid(inode, &osid);
-			lsmblob_init(&blob, osid);
+			security_inode_getsecid(inode, &blob);
 			rc = security_filter_rule_match(&blob,
 							rule->lsm[i].type,
 							Audit_equal,
diff --git a/security/security.c b/security/security.c
index 85cdd24abcd6..116800662a0f 100644
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


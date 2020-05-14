Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D1FBF1D40D7
	for <lists+linux-audit@lfdr.de>; Fri, 15 May 2020 00:23:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589494996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Vp0mFq2d+O3xuaWqdu1OfjQvTH1/7zJ6vMDqx6n1sbs=;
	b=LJkAZaWvtTAWkBeX+wzOqmbtgnQCkHr7KlAd2BtsEvjLtnRGtIhUkpuLIWltql5y5rqqS5
	gIKYNaxzNy/zaZJIGgbL+J4Oj/bxEnYnlzqc8sr4U8bBO25OKeF041GU6oi4wDsPPKm0Bz
	sIazd1LvZ8aUC2s1hGiKJwycfemXjyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-tVR1bFr-MLSlHdlnmnOQug-1; Thu, 14 May 2020 18:23:14 -0400
X-MC-Unique: tVR1bFr-MLSlHdlnmnOQug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53D321005512;
	Thu, 14 May 2020 22:23:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9753560F8D;
	Thu, 14 May 2020 22:23:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7B934E994;
	Thu, 14 May 2020 22:23:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EMN0Tx019225 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 18:23:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28803106B46A; Thu, 14 May 2020 22:22:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91774106B46F
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:22:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB44C89C836
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:22:51 +0000 (UTC)
Received: from sonic316-27.consmr.mail.ne1.yahoo.com
	(sonic316-27.consmr.mail.ne1.yahoo.com [66.163.187.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-277-00djoHKBN2eJcag-hgbbeA-1;
	Thu, 14 May 2020 18:22:49 -0400
X-MC-Unique: 00djoHKBN2eJcag-hgbbeA-1
X-YMail-OSG: sf2ys8oVM1mc1HDzilccL8MmySbLrH8dwVO.6WzKUgdZ_rWYY4CWH5tJ0d0ND1z
	ayZPDRpqtg3YxrqxYFHaT5P9Pft8Jv3dq9IFYBIri4K5zvSwizqQ5MQm8j2o8IhdpwTDkCOyqDAZ
	W5iPWUKvJQfwxfjU3.3nhnAuDIpDHGfXET.vVaGwAxB_afPHpVmmgGarVObBdkOFZ3_F6M7k2QFy
	AoH3RKNrHTQ3EmOzHpFcwRi2367CA3wobpJi7MU3BnVObuh9ZHVdyjVW_CJjhEvM7PIeaVVR3MRj
	wDqtkqgrun8yz1eHMkZtWF8MfDKfxQYpLNw.VxqsuUnVXrLMzVCQGs31Y_ON1.QpQ0imvECiKN8X
	Wv3gtlSQBaw6GEjCwYJ48Rg4AIEpPb2lphCo.Bft2njP0mDs9FlHDTST8KJUZuzK7p7be1uGSgkT
	oYoG2gMzIuxwCl9xu6rZBF_vau1BtZOCNko1eIlrpuIgmo.KRMeHrcpFRVyWoqN8.eHHHgCGleV7
	rZIurPtiE2579ThfCp0LvTkioGB9xf8LkL7LlVslzND4p38msdE.WCOK.6HKucn7Wh__mU0kTDjP
	8HOP_gTVt5lMzSfWBmIvxALcgGUUSbv0kq8PllyumLDBjCgsFUVLZkQhgn_gzM_uqUNIzbgyZJZ7
	F1nw9HvAM7ck0I2UBGm26f7.DrWLiVs5yka90BzXGhbGz4TOeJxzejXnxjHVvQoXNLL.h9tdaXOC
	qiKuzXCaEFfJ3uFD5uFhATTjbWbIVgm3TN3.UGUN8HF2Q_RwFuCGXM6T71RjP8iojo1gv1SsKEW8
	v8ZitGInfVXy5Ot8Vii.zGxn4t8yovAunTkri_kr2q9ycRolQZuBa9mmwsRTwJ9N671C4LvFwXRJ
	BD3uX37RfpWGoTuYp2Ew4nAd.AYzurWpl4NoZfkwuxNFsIFnnJG.yAgNIPfpe5h5.5Lfj40rZBLG
	l1ZhTpUy8v3mRSPPF.XJKXDMBaFyCP1my4vGyLiUFOCpegYJhue6Mnvk.d8WwJJvfR.7xrNuo8FU
	XC2W7YNyz5RzBxJinHFkTQIXCgo_POVau74Kr9aJ6hekZsnL1LrrTmjEKDbA48U0RpBWs3Sjokkv
	5mzjIRmPmnd2ZidIUCTONzQplqfwGfF9ExT1NHlzSuodr38lIMiAU_NJ1BdI.LhEw_MgMtMesPIu
	ZWgOvxKkj7fuIon44T.ZqUDIcr_Os0nS_8vtEQrCNEy7dpa06E2aVUQsvo4CuLiZVBSTfa8Oa4Rq
	WLZIXczP7F6Jya__4f4_mE6fLo3S0oomZC5l3ApSg5jembgE.JAoiT3EKiph3ll.3otKn9RzvdN_
	vSzuxq7QKfOKhzcRN11DDeeLBDUCkt999GysfZlLTcSMPpZpkH8X4RvnrIV4YJEVX6EXm4PLvCxr
	mMHlDruVw8cghQaxbDVkpH58P0hFRq_v2in6TZ5iJgiBc20C6dfLP5ExyDuSC.Q--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic316.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 14 May 2020 22:22:48 +0000
Received: by smtp416.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID c7b3420ad493daad796606174d9ee147; 
	Thu, 14 May 2020 22:22:47 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v17 10/23] LSM: Use lsmblob in security_inode_getsecid
Date: Thu, 14 May 2020 15:11:29 -0700
Message-Id: <20200514221142.11857-11-casey@schaufler-ca.com>
In-Reply-To: <20200514221142.11857-1-casey@schaufler-ca.com>
References: <20200514221142.11857-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, linux-audit@redhat.com,
	linux-integrity@vger.kernel.org, sds@tycho.nsa.gov
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
index abb88a7727c4..c46da9c03162 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -431,7 +431,7 @@ int security_inode_killpriv(struct dentry *dentry);
 int security_inode_getsecurity(struct inode *inode, const char *name, void **buffer, bool alloc);
 int security_inode_setsecurity(struct inode *inode, const char *name, const void *value, size_t size, int flags);
 int security_inode_listsecurity(struct inode *inode, char *buffer, size_t buffer_size);
-void security_inode_getsecid(struct inode *inode, u32 *secid);
+void security_inode_getsecid(struct inode *inode, struct lsmblob *blob);
 int security_inode_copy_up(struct dentry *src, struct cred **new);
 int security_inode_copy_up_xattr(const char *name);
 int security_kernfs_init_security(struct kernfs_node *kn_dir,
@@ -946,9 +946,10 @@ static inline int security_inode_listsecurity(struct inode *inode, char *buffer,
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
index f4c45ec8f59f..3201f0997a5d 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1935,13 +1935,17 @@ static void audit_copy_inode(struct audit_names *name,
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
index 2c1a92cc1bf8..2f084a388142 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -479,7 +479,6 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		return false;
 	for (i = 0; i < MAX_LSM_RULES; i++) {
 		int rc = 0;
-		u32 osid;
 		struct lsmblob lsmdata;
 
 		if (!ima_lsm_isset(rule->lsm[i].rules)) {
@@ -492,8 +491,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
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
index 60b3d42b2e3b..1e8456a6fe3c 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1437,9 +1437,16 @@ int security_inode_listsecurity(struct inode *inode, char *buffer, size_t buffer
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


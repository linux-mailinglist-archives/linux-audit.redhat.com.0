Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C77A7102B56
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 19:03:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574186636;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8ZkpC+RmhnGzHxdmJf+knVtQ6HAp7EFWsNDiiYK1uSM=;
	b=Wv/e2A7jXtBz0TmMQhAHZqtMiYCb3N58CDpq/9wy0RMHfYzDC2qRFOkqrjZFlsupQZ5tvX
	5GflnSp3u65l2CKaqWnBhiiTF7JHoLsnx/AMnCaDKV827G7LtY5PCOsdSEuwc5As+pTIxO
	MY7tAKEpcOBA2dnI7sXYjeIxOphjKNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-1ZAL3mDdNN-jSkv5S6gYQw-1; Tue, 19 Nov 2019 13:03:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3C3810753F6;
	Tue, 19 Nov 2019 18:03:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFD881EA;
	Tue, 19 Nov 2019 18:03:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CD7318089C8;
	Tue, 19 Nov 2019 18:03:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJI3dAq001058 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 13:03:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C7C7617590; Tue, 19 Nov 2019 18:03:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C32601C59A
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A483280029B
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:39 +0000 (UTC)
X-YMail-OSG: nb.7IbcVM1mMO9LyXlONeQZB0ggK.wtMW3u74_mjv1QV3nJz1ZULyPAl1gIDwOe
	1chpAKsCq3CNyeAMVOIAml_1XF30WoLh74QCOe_ikZhrBxDldqhBC3XsF4g4aof2DG68akvwYfu2
	rSi5Lt.7KfZ7xuy6pcNcA1bebA_KiO7N7Bh89aNpZSf6DZCDUZg.oi05Ybsv5ZWsQz3Wwf7slFnb
	zQPsFXePITZuyoc0f.qy9UOF.U9SQTBqnCyD0WyJMjPqO5WAFeDKTKC2yCWSnjjgtZAf0pcdyNyj
	_Zz2BxSBCaeHydAK.h4bkIIgkDW1LYLMA1lXXEt0.C8Gq5bxrp6o5lnUb5Z7et.kk0H5jY7v2C6H
	xraVF6.uqfbXmuoE8g8nqiecJyxeg87VO1gCkBUoFJD8aehoWjeRHRy1Tw4Yev2ahBvZOWfyTmT9
	.mnVtTG6hKa7Ve8nNOZu9PduCVCwqrwRtz58XBz_exjMsH70VpaM218YPjZKuB0WbowiXIvVF9Q4
	JxX4n.HJypbL9fYOuT0ikef33SvNLT.P5hBsskNycjPE8aS6.T9YWmoRzz9Vd9zG.wyKUAhD2hF3
	y4C6XJfVlli_dv24XDSdtfOImKxIP2.5vL2w0wq4GxNtACoNZrciXGPQ.gDIc.pGBP4qgCFYMDiF
	NFQfJJBVVKotqZcmZAENK5YFJ4jehpLzDPUb_17_YGO_NN9OJrGCy0p_XZ.6TNmlW5Zg2XM0mxpx
	JIfK_wI2dNv6QwFlVTELc40z51GY.v2qWDChswpvYNrRfDACVmqa4cIx963bUZoqHrPUJUIy.qnP
	Fo7r55Br3D7XXWxELwVcsoEmCyF2_RUGBznC_MOg.ZWulKW56TVnFSaVar6IEaqxM3SqGEl8WVOM
	bAgBBpVxdSltiqThLpdNW4P6ekxGPmGx1L5fJlImkxYaWpEPK6dc2EhWYitrbvj8NED9TK6.IqiO
	_0Q5PWSQwnQJ8MkdcvUtQ7RD42_gBgnNbRcIRcNfON2oQRsSpTtBcpMbrEvVioW1yM_x_OJ0Jbfp
	Tdvyxo4Cdv9ePp91RmwmB2RPVA9_yq9DWP6558UwubNkN1b8tyFAY2lul3ZrZAWiyNOPG25wdb2e
	zUEDWPpbNSL17OVAzeXfQ9gAT4G3Ep.suhLZSPh2sjsrjuL8TSNG84WmbFxwwfSCzFHtDWzFdEwV
	snRvspfUnlODCZPDR9FjBoQIzFkOST2hGHvEp5r.DfMox5VeoAVsA8TwjgBNoxg01.w5_FwPeW6d
	J4_Xt_e_f4dFEJ0WBnZyr9oq4kSsZbWulycbdAhRtpWCsjnEU.OjTQlWvklB__NApbkLzrY1_Shf
	Vd8B0VLLdkykkEViwZ.aj2e0qwZCCmR06mh.TLsKHzz_dZXAu6HofqWlUVGPwqX8N39jPjnAssje
	yrUpVnSDILscXxn9mOcxJRZOLEl.DjasPQe1bJonb5Hcmie9AHB4-
Received: from sonic315-26.consmr.mail.ne1.yahoo.com
	(sonic315-26.consmr.mail.ne1.yahoo.com [66.163.190.152]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-151-NlfzQ8ilNM6Q7-58QrgESQ-1;
	Tue, 19 Nov 2019 13:03:37 -0500
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic315.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 19 Nov 2019 18:03:36 +0000
Received: by smtp413.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 3fb5178ac301ad9f620e9736a13e6599; 
	Tue, 19 Nov 2019 18:03:35 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: linux-audit@redhat.com
Subject: [PATCH v11 10/25] LSM: Use lsmblob in security_inode_getsecid
Date: Tue, 19 Nov 2019 10:03:09 -0800
Message-Id: <20191119180315.12254-6-casey@schaufler-ca.com>
In-Reply-To: <20191119180315.12254-1-casey@schaufler-ca.com>
References: <20191119180315.12254-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-MC-Unique: NlfzQ8ilNM6Q7-58QrgESQ-1
X-MC-Unique: 1ZAL3mDdNN-jSkv5S6gYQw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAJI3dAq001058
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Change the security_inode_getsecid() interface to fill in a
lsmblob structure instead of a u32 secid. This allows for its
callers to gather data from all registered LSMs. Data is provided
for IMA and audit.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
cc: linux-integrity@vger.kernel.org
---
 include/linux/security.h            |  7 ++++---
 kernel/auditsc.c                    |  6 +++++-
 security/integrity/ima/ima_policy.c |  4 +---
 security/security.c                 | 11 +++++++++--
 4 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 67f95a335b5d..a845254fc415 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -407,7 +407,7 @@ int security_inode_killpriv(struct dentry *dentry);
 int security_inode_getsecurity(struct inode *inode, const char *name, void=
 **buffer, bool alloc);
 int security_inode_setsecurity(struct inode *inode, const char *name, cons=
t void *value, size_t size, int flags);
 int security_inode_listsecurity(struct inode *inode, char *buffer, size_t =
buffer_size);
-void security_inode_getsecid(struct inode *inode, u32 *secid);
+void security_inode_getsecid(struct inode *inode, struct lsmblob *blob);
 int security_inode_copy_up(struct dentry *src, struct cred **new);
 int security_inode_copy_up_xattr(const char *name);
 int security_kernfs_init_security(struct kernfs_node *kn_dir,
@@ -922,9 +922,10 @@ static inline int security_inode_listsecurity(struct i=
node *inode, char *buffer,
 =09return 0;
 }
=20
-static inline void security_inode_getsecid(struct inode *inode, u32 *secid=
)
+static inline void security_inode_getsecid(struct inode *inode,
+=09=09=09=09=09   struct lsmblob *blob)
 {
-=09*secid =3D 0;
+=09lsmblob_init(blob, 0);
 }
=20
 static inline int security_inode_copy_up(struct dentry *src, struct cred *=
*new)
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index cccb681ad081..5752e51883d5 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1931,13 +1931,17 @@ static void audit_copy_inode(struct audit_names *na=
me,
 =09=09=09     const struct dentry *dentry,
 =09=09=09     struct inode *inode, unsigned int flags)
 {
+=09struct lsmblob blob;
+
 =09name->ino   =3D inode->i_ino;
 =09name->dev   =3D inode->i_sb->s_dev;
 =09name->mode  =3D inode->i_mode;
 =09name->uid   =3D inode->i_uid;
 =09name->gid   =3D inode->i_gid;
 =09name->rdev  =3D inode->i_rdev;
-=09security_inode_getsecid(inode, &name->osid);
+=09security_inode_getsecid(inode, &blob);
+=09/* scaffolding until osid is updated */
+=09name->osid =3D blob.secid[0];
 =09if (flags & AUDIT_INODE_NOEVAL) {
 =09=09name->fcap_ver =3D -1;
 =09=09return;
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/i=
ma_policy.c
index 7711cc6a3fe3..c5417045e165 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -413,7 +413,6 @@ static bool ima_match_rules(struct ima_rule_entry *rule=
, struct inode *inode,
 =09=09return false;
 =09for (i =3D 0; i < MAX_LSM_RULES; i++) {
 =09=09int rc =3D 0;
-=09=09u32 osid;
 =09=09struct lsmblob blob;
=20
 =09=09if (!rule->lsm[i].rule)
@@ -423,8 +422,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule=
, struct inode *inode,
 =09=09case LSM_OBJ_USER:
 =09=09case LSM_OBJ_ROLE:
 =09=09case LSM_OBJ_TYPE:
-=09=09=09security_inode_getsecid(inode, &osid);
-=09=09=09lsmblob_init(&blob, osid);
+=09=09=09security_inode_getsecid(inode, &blob);
 =09=09=09rc =3D security_filter_rule_match(&blob,
 =09=09=09=09=09=09=09rule->lsm[i].type,
 =09=09=09=09=09=09=09Audit_equal,
diff --git a/security/security.c b/security/security.c
index e1f216d453bf..bd279a24adfc 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1386,9 +1386,16 @@ int security_inode_listsecurity(struct inode *inode,=
 char *buffer, size_t buffer
 }
 EXPORT_SYMBOL(security_inode_listsecurity);
=20
-void security_inode_getsecid(struct inode *inode, u32 *secid)
+void security_inode_getsecid(struct inode *inode, struct lsmblob *blob)
 {
-=09call_void_hook(inode_getsecid, inode, secid);
+=09struct security_hook_list *hp;
+
+=09lsmblob_init(blob, 0);
+=09hlist_for_each_entry(hp, &security_hook_heads.inode_getsecid, list) {
+=09=09if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >=3D lsm_slot))
+=09=09=09continue;
+=09=09hp->hook.inode_getsecid(inode, &blob->secid[hp->lsmid->slot]);
+=09}
 }
=20
 int security_inode_copy_up(struct dentry *src, struct cred **new)
--=20
2.20.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


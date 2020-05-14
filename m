Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE401D40A0
	for <lists+linux-audit@lfdr.de>; Fri, 15 May 2020 00:16:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589494598;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lJencFZr30JL7hhu8uhq3StvxaOIMXyTjaThYVDAxms=;
	b=h38dXDBrNdrW/CWQoveVKo91fGz9TohwwcbmbGNNaXp0p5nM1xe5lWiDrtuF0g7DOc2eRQ
	DgPjvmTuE0+tEXVecTK0ILXK/XXi0uYWFGfSxLgKBGMQ8UVCQ7u9mstd588vhNtKEHxvB+
	CLWtT+ougEUJFrcOdOT/ivbjxxG1VQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-i30sE2rxOy2B4Au_a9jQHg-1; Thu, 14 May 2020 18:16:35 -0400
X-MC-Unique: i30sE2rxOy2B4Au_a9jQHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EA711005512;
	Thu, 14 May 2020 22:16:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01C5C5C1D6;
	Thu, 14 May 2020 22:16:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC36E1809543;
	Thu, 14 May 2020 22:16:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EMGRm2017939 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 18:16:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81DFF10A179E; Thu, 14 May 2020 22:16:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71FDB10A179C
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:16:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47E221049841
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:16:24 +0000 (UTC)
Received: from sonic309-27.consmr.mail.ne1.yahoo.com
	(sonic309-27.consmr.mail.ne1.yahoo.com [66.163.184.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-131-nl7LilUpOP2o05e1eEqNAA-1;
	Thu, 14 May 2020 18:16:21 -0400
X-MC-Unique: nl7LilUpOP2o05e1eEqNAA-1
X-YMail-OSG: F4bt3bUVM1n1p8dN.JuBzgZTowXhbKgk6kqibEonwm5YyrNw4sgtxOwjvN0viM3
	qKCsJu3ejv3JgYnaHo_3bEFn.Jsqz.9iiU1kJbR6UoSHIhZibROr3QdykbXoo38iCKHL_orULfLm
	s9cbTEpbubn.ox5j5J0VTh_Fk4FsNfCE8rcyY0JttaMYWka5.13SVs9ogsp06SdfBxoEA8GtteGf
	LenU.AsKTYBXVcneBzZ8DYAwkFC4JXPHSe1ld5mXun70fIWqqWSwTesddJBwfG1Ax9YtE30oEnFA
	z7eLojhiI7raRE7gmFUZcl.kkdkuldYeT6zZMTbE2h_mCjHBJRSJkuZsZiDntmlMas6_AVX6OTm9
	s6N_01Km8NVFZKp672TmiuUTiDSLvwqGfhFdJ0BllMHORgcgXCP9SBDdraiYcLlrJHMrQ7b68IEM
	6GUTOK3DmE854AV1gUPnw8XWuWHjCAYS_7wxXwxNoLI24R8nstvJ9TNl.wycJ8cz2nCICWmA6A7j
	4ACNPIG65uTzEqU_svrTohPivalSzZQqaW_amOW83v8m8YcAWazBjVS_fNxCYkd_vNbFhexW_XuV
	K37kORZsh1GCME_GbhkoY3ARilgESiIaUH8Cek_6R5sn5RT_5KpnZJL4x60rVxWmWGESRlHU4So5
	ytk07AgPfzyu15FPSPEmSclosgSD6Qz5jZW.UW_dkQJXasu4F.MNVbX.4mH7o8frc8OryIplrcoV
	81e9sHT3z460Hs85lUYHQpY1G.YcwX32CkivZd2Uh1nwQJF6SwMTx_D49wkv0copj57_xTvzckI3
	KVFO_DL5BkgBijn5cDfwHu4vrei1RBtQK4ESRCdLfGff6jYQtS48M1TPWsOZ8OTDU6ymLEq2Y5e5
	EAEJZ_EqH2tcFXp_erx8G6WaGAZhY.0XFaWBLfJ75NvUIcJMe.lFpygmExRbT4kOJvoTSF_lDW70
	uXJdQcnYwO8U8gUFJ3pNghDoupt2Drngx_N2p89QV.rh0FtBd0Ce..25zRo4yqxKgvxxlE1V.7vm
	7nfNJ9T7fGP979GqWvPazGxc0i0Pe9wI36o561Noet.BAioO5J5jyJqfHp.iYDGbCPq0jOPR6aa8
	nGgCYzqx1jKRFCSE_iWWp7p9ccpdesgCYU86qMrpBXnFiD05FyXA6DWaEGibiFSxFzfqfVrEzFQG
	NOuBXiIWDu6dwrC9iFaI5NYtrQgppzqW9PPYgAG7Udd2JF0XaMOGvedWyuY1v_hrHNQMWlWFHmmv
	kD6V4uQaIX64ZJR2t1ZT2ByFwPmz.ZVetrEQeqttN_wk3gAuXiqke2bPpvM1FbumDLoFc34C3n1X
	vy40WQ38arPEhEzw8khPgOuB83hIlln7.vGOdEbQSJrLJgajf.ci6Cx2Cytfcl3J0WpEAdk0hvK3
	KszbB8i_j4VkF2NQeGWyK8xm9A598O0l5cLQQsbtmxy2tuG0mgSR4cZCcDA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 14 May 2020 22:16:21 +0000
Received: by smtp418.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 633676888615c52f855e83fb3a682558; 
	Thu, 14 May 2020 22:16:17 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v17 04/23] LSM: Use lsmblob in security_kernel_act_as
Date: Thu, 14 May 2020 15:11:23 -0700
Message-Id: <20200514221142.11857-5-casey@schaufler-ca.com>
In-Reply-To: <20200514221142.11857-1-casey@schaufler-ca.com>
References: <20200514221142.11857-1-casey@schaufler-ca.com>
MIME-Version: 1.0
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change the security_kernel_act_as interface to use a lsmblob
structure in place of the single u32 secid in support of
module stacking. Change its only caller, set_security_override,
to do the same. Change that one's only caller,
set_security_override_from_ctx, to call it with the new
parameter type.

The security module hook is unchanged, still taking a secid.
The infrastructure passes the correct entry from the lsmblob.
lsmblob_init() is used to fill the lsmblob structure, however
this will be removed later in the series when security_secctx_to_secid()
is undated to provide a lsmblob instead of a secid.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/cred.h     |  3 ++-
 include/linux/security.h |  5 +++--
 kernel/cred.c            | 10 ++++++----
 security/security.c      | 14 ++++++++++++--
 4 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/include/linux/cred.h b/include/linux/cred.h
index 18639c069263..03ae0182cba6 100644
--- a/include/linux/cred.h
+++ b/include/linux/cred.h
@@ -18,6 +18,7 @@
 
 struct cred;
 struct inode;
+struct lsmblob;
 
 /*
  * COW Supplementary groups list
@@ -165,7 +166,7 @@ extern const struct cred *override_creds(const struct cred *);
 extern void revert_creds(const struct cred *);
 extern struct cred *prepare_kernel_cred(struct task_struct *);
 extern int change_create_files_as(struct cred *, struct inode *);
-extern int set_security_override(struct cred *, u32);
+extern int set_security_override(struct cred *, struct lsmblob *);
 extern int set_security_override_from_ctx(struct cred *, const char *);
 extern int set_create_files_as(struct cred *, struct inode *);
 extern int cred_fscmp(const struct cred *, const struct cred *);
diff --git a/include/linux/security.h b/include/linux/security.h
index ad8e29486ebe..453737cefe09 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -438,7 +438,7 @@ void security_cred_free(struct cred *cred);
 int security_prepare_creds(struct cred *new, const struct cred *old, gfp_t gfp);
 void security_transfer_creds(struct cred *new, const struct cred *old);
 void security_cred_getsecid(const struct cred *c, u32 *secid);
-int security_kernel_act_as(struct cred *new, u32 secid);
+int security_kernel_act_as(struct cred *new, struct lsmblob *blob);
 int security_kernel_create_files_as(struct cred *new, struct inode *inode);
 int security_kernel_module_request(char *kmod_name);
 int security_kernel_load_data(enum kernel_load_data_id id);
@@ -1044,7 +1044,8 @@ static inline void security_transfer_creds(struct cred *new,
 {
 }
 
-static inline int security_kernel_act_as(struct cred *cred, u32 secid)
+static inline int security_kernel_act_as(struct cred *cred,
+					 struct lsmblob *blob)
 {
 	return 0;
 }
diff --git a/kernel/cred.c b/kernel/cred.c
index 71a792616917..91ce35520bba 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -730,14 +730,14 @@ EXPORT_SYMBOL(prepare_kernel_cred);
 /**
  * set_security_override - Set the security ID in a set of credentials
  * @new: The credentials to alter
- * @secid: The LSM security ID to set
+ * @blob: The LSM security information to set
  *
  * Set the LSM security ID in a set of credentials so that the subjective
  * security is overridden when an alternative set of credentials is used.
  */
-int set_security_override(struct cred *new, u32 secid)
+int set_security_override(struct cred *new, struct lsmblob *blob)
 {
-	return security_kernel_act_as(new, secid);
+	return security_kernel_act_as(new, blob);
 }
 EXPORT_SYMBOL(set_security_override);
 
@@ -753,6 +753,7 @@ EXPORT_SYMBOL(set_security_override);
  */
 int set_security_override_from_ctx(struct cred *new, const char *secctx)
 {
+	struct lsmblob blob;
 	u32 secid;
 	int ret;
 
@@ -760,7 +761,8 @@ int set_security_override_from_ctx(struct cred *new, const char *secctx)
 	if (ret < 0)
 		return ret;
 
-	return set_security_override(new, secid);
+	lsmblob_init(&blob, secid);
+	return set_security_override(new, &blob);
 }
 EXPORT_SYMBOL(set_security_override_from_ctx);
 
diff --git a/security/security.c b/security/security.c
index 11ff3f3beec1..0a13e98ec6fc 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1666,9 +1666,19 @@ void security_cred_getsecid(const struct cred *c, u32 *secid)
 }
 EXPORT_SYMBOL(security_cred_getsecid);
 
-int security_kernel_act_as(struct cred *new, u32 secid)
+int security_kernel_act_as(struct cred *new, struct lsmblob *blob)
 {
-	return call_int_hook(kernel_act_as, 0, new, secid);
+	struct security_hook_list *hp;
+	int rc;
+
+	hlist_for_each_entry(hp, &security_hook_heads.kernel_act_as, list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		rc = hp->hook.kernel_act_as(new, blob->secid[hp->lsmid->slot]);
+		if (rc != 0)
+			return rc;
+	}
+	return 0;
 }
 
 int security_kernel_create_files_as(struct cred *new, struct inode *inode)
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


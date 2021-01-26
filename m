Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D8923304407
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 17:54:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-VLaMaS7uNuqRkjc8uCediw-1; Tue, 26 Jan 2021 11:54:09 -0500
X-MC-Unique: VLaMaS7uNuqRkjc8uCediw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5513310CE7B9;
	Tue, 26 Jan 2021 16:53:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 736FF5DA8A;
	Tue, 26 Jan 2021 16:53:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C6A44EA6C;
	Tue, 26 Jan 2021 16:53:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QGrXEd028667 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 11:53:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0D0D963795; Tue, 26 Jan 2021 16:53:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0759DA37DC
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 16:53:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB7611875049
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 16:53:30 +0000 (UTC)
Received: from sonic302-27.consmr.mail.ne1.yahoo.com
	(sonic302-27.consmr.mail.ne1.yahoo.com [66.163.186.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-330-ejh3OAlAM5yNJlrnNyS-jg-1;
	Tue, 26 Jan 2021 11:53:28 -0500
X-MC-Unique: ejh3OAlAM5yNJlrnNyS-jg-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1611680007; bh=NPi/phvpZq7upaYuAly7VT0RdSNDi91fl2cr1eBzGdq=;
	h=From:To:Subject:Date:From:Subject:Reply-To;
	b=P2LWrNOFCPMEOflt70ivxR0vL/HxHOo3w4V3OpEeCJNt6iUqH1uYGUttnY8zriDlCAqSA7xDNFehZ6rziBkJDFESJ7UXumFLBTMvJTxcUeGV4FjUo2lS030fYuwUYjckGcQLbKV5o4U4HUAPnT6GD4oElZOswlO/WkqUqX4GnAI3XfugQ0PAZL8DhzlKxky+BQ/5e15TJVTWLs5NckJzY1hYh6n+lKUmi7ap6VgQeTcwNMz0fJpdgmQU1ovW5uWuxEZr+AM9ltrk1/b8Unhcla3vhBF2B0lAIXPN6ab0szDbiXANM7gxxzVVpaK/Nk7Hjb+TPrFwj+6DKScCYJ/r7A==
X-YMail-OSG: Fn4yG3gVM1n1z819CDuGID3GQxmzJ3Q.l.zOYIul.HyXHhXHKuv1W._jDpJo5DA
	ACq36.2FBrGIS0VW8RW0Gt3xxf0WJD22vWK9iFPEq7wJi3PBAQI9e8ULiSp9sVXSpoXY_APXxw2F
	F2P0GkxMq4Hw9ydCMQaY2fOuzZj6tEZdXoCMMz6yJFLj_XmC6cGypKXfLrYw2UIEyKfd0PfXjt_V
	t3AAzBEz2aFbVINhbFS9uxfULPuO7XBtTf.77olM3f_q6j1uBlTxzBrGRDzWSSMuVkgxeV7D.mL4
	drc8rXIpnX1UXcGIHESByeX0zEKfKvJdCyXJ2PfbgwmTQ8_6MnZClx2rVy8QJZyfAfFDdZP_zaCP
	4oUfsCCK11G3WUjNFVjXIxy0KRJEmxDYAsQTw1FQfOXp3pcWrll.rGNyzW0nLHj6_.2cl8iBoDPi
	CWPoFE_KKMkb4aG8W1Ev9QWJLyCWVONmd1COf1aNQhZS7I3q.Jwfsw5TVQjZcGDZS2coKHcSY3Ws
	wyrrTclc5bkGzbF1EijpzWzhNj3C4cC745pDaqk0r0IhkkRZOpXQ6sTIG26LceR1UE0PFNnGjOY6
	Cg3SupYP1mG8aUgntLJO8wot_GZXSiXwVKEZypd7bBgBCxT2UV1CWi5W3y._yOXXt_gmYjeShlZj
	97m0UAIsuCIqX8pgFYwtOz5ypLUbFVnlIpkQo0rFx5r1QBen7Z.ASJxoiBm.1UyauHpNSkzmJbat
	6Cn_O31s2btffkhqmwdM5teRHUrsi0lI2WRn.tX7qvgtugwWCAcC_2rsDLFl0jy73PLZSf3AN7Il
	Gs6lJWjPnJEGQvuj6D4XUnG3bNxQSkuooS.AUfsO5QIXggMixoK6m6jIeKoKvLsHcJo_BVdNK_Kc
	KgMa6QVcR_Kg39y2Z2EP1I2S5hrYFYguUHB69keWr4Pitscobt.STR1SGrh7sFDZrXn6kdG2u1MP
	L8P25g3aGq6brTW8jTgepD4KzR2LCQh2jCK2zUKJbYJ_UoZacYQNqw8vff7OnO66zT6gtkTWRy0t
	HzWRJUFhma6TSdBuKW7rkKvezFekG6dUZyB7dfNbuyjD2z4tza.0L9wH2bGWiZyW9Mzdzy9L5GjY
	ESkK8L5dKyfSRCJBwtsbAajCcbUP4XjMEl0_FDUWflvsi.dcdfVOvKVzLgIioaPX8mFdZ3lyRLYZ
	lcc.YzB5Y711Wkq9qd73FNlBkGHhlu1MPkuVtH.2RnKziogMHwiYMLHzhmPl.YTaAIp0kojvqYHI
	7DckMNDCPmauWiaHjVe3YYML6Lm0KExAQNCI0IIQYzT.Gi1CfOYE6D5DDE9m0ILVwGY5Hj4bKr9e
	h7C0NlD6.8Vuhhkxn2mvLBSMew9qsgpDCQQGmolFJziqExWURbwe_sq3EQIIn.rbSzv2Juu9lZ09
	ZNnzKqv7lvOZMHeteyzpwe5A7WGBKwrM6DTLpASta5qA2Baq495Xd6AphZeFqfqGVwhdtxU61GTj
	cjvY8IGODonXSCQEOYkWfej_dgf6dodXcGEp4b6x_cx2R6wiSNRqck7NbwyGW_ZJSefL5ZM.OCHg
	2lZSDfow0OIqTmd0telrO7dis_ZX_jGBlS4blqvIfkJDZF3FlZmtzQspDDD7gtYzEkLN3GzFohXd
	twvIRfMrE_Mq3CClDiiE0Mpea0KW9bAJ1BONe107ssBuU3_nfoYXrtMC3kyAzbpiesDcRTxwpPl7
	UoZJh2fMCyX9iJcE_CbSLlvhslw377zGG_RiorSiCfNwz25xS9Zh8Uw8Nve9tTAD31tO.IQHozWJ
	R4ayQOQ1vLVkGOQg8C0.ohBRxsQ9SAW85X4ikHbFV6sAEUIfEWGCCFpABVdjxXm8CcdbTIIcxDL2
	8OalUXC0AXSBZi9kZfYL36H04wD4vLblpoKwn7q9ZNjNWeW1WTlI8SK2a9WTsc_2KqVhMIcDVaSm
	3eQSkIOMhNzpNehjtbDUpgmpiWDwaPuDUhsvMAMBLOmo93tEqfm5wWiao6DEyxdYhUsgu20nX3bE
	QPcaH_85Xz21g590FUVzdSYyh2KvAmD9HrewJ5WmuZVHRilga9pqXZg8phF4hAi7jPOCT3IE2YJk
	7JQrnjwx2e_XEd5zgkE40ih6E7rgF6yVOSN_3RpeYfPKr02sTNRnD2UkRRDIC4ptueSQMmlz1Nld
	63xC2KuIAu_yjU9R5.bw4pDGIBlycZCvdbIqHZknqKNybyjpQ3J3nbIqiDQxG0YZsbPwQTmqxHIr
	VpmZPtUMHZ9cVaEZgAYyU5met6Xll5CFnPtKV06pCPyY1hy6mjYBY.xe_A_rDeyq2XojotCkuj1F
	T22v8EXtWD1_GNZvs_j8nNKdwAXt51FVnBePo1h84w.BqLO4hiIVULeCs5k1Sgd2ZJiY77Ei0RK4
	3wyYNZDAxcjU5RZxa29TAhmNM9W7A71khOfHnhQhvxqeZaiWtktpV74SVyNeOpitlcX7y2VY04qi
	gZddQzfosrSzcfzY0ck2C5KGxQuLPqsJEH5LXKmlgUTQgmmW.uQ4BtmY7_vl7hYF1NryYMF9oNem
	f7OaFzQp9_nPd7ZgRLiQbbIDgOyWbNqwPn.b11dU.inLvTp7VxH.rB9oeLocnWCy8ebTUCmdXha6
	Sw_a.6AJeQyJel0OA0KCA7BuZEzUN8bxRPNGC8XRW8ArvSBO_ra7M7AsXiTk8KG1e.7ZCPcsQEHk
	mxYd5CyboL4GxcFbEMKkUZw_WZ5ZOYz9CFUZ9kUZAIqV84QjNlEOReA4OafM4Sck3XrhDkOrOHtF
	w0b9EHp_yGZq2BIKg2cAlG6ykW2IDzzquKKJULW.QXtlcUmpbk2uYVlRTiH27om5Acl54NW751_Y
	mQmdnHxJt95IYnwnpDhzP.Hqnvw4N8VfLVU990Cq38ehbGeFK1L9RA1P9iaEf8T6xalZ3a.dxIqG
	WXxdfMvia.Tg3A79tYd_693QPoRejFCEjdw5a6anMpkmgALE7dOLItL3ajXVbwOX7wxfXCFjyNsY
	7ix0Ik8LR89tyR3hgJLUNntuz57ZP0.isEzfDRRc45vSogxqO5c9us3bmYNBkcrgnAD6SHJBezmZ
	a2h5TlxYzmTQ12xf3V34yhyuOWKjD5yVgYBICvzwjD9sj0hWxeVSB0YN0ds7UKiWAqYShstUp..y
	rsU3Ty4vPeyBsfS03yVRVzazLBp1St8wSia7Ekg--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic302.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 26 Jan 2021 16:53:27 +0000
Received: by smtp410.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID a4c357dd3a7ae61b0023a06a25412ebf; 
	Tue, 26 Jan 2021 16:53:24 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v24 11/25] LSM: Use lsmblob in security_inode_getsecid
Date: Tue, 26 Jan 2021 08:40:54 -0800
Message-Id: <20210126164108.1958-12-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
index 9fc245c1f739..e8d73b0220e4 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -441,7 +441,7 @@ int security_inode_killpriv(struct dentry *dentry);
 int security_inode_getsecurity(struct inode *inode, const char *name, void **buffer, bool alloc);
 int security_inode_setsecurity(struct inode *inode, const char *name, const void *value, size_t size, int flags);
 int security_inode_listsecurity(struct inode *inode, char *buffer, size_t buffer_size);
-void security_inode_getsecid(struct inode *inode, u32 *secid);
+void security_inode_getsecid(struct inode *inode, struct lsmblob *blob);
 int security_inode_copy_up(struct dentry *src, struct cred **new);
 int security_inode_copy_up_xattr(const char *name);
 int security_kernfs_init_security(struct kernfs_node *kn_dir,
@@ -968,9 +968,10 @@ static inline int security_inode_listsecurity(struct inode *inode, char *buffer,
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
index 62e2e6de5486..7883b8ac8ea4 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1966,13 +1966,17 @@ static void audit_copy_inode(struct audit_names *name,
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
index 265184921eef..ab66266fe932 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -575,7 +575,6 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		return false;
 	for (i = 0; i < MAX_LSM_RULES; i++) {
 		int rc = 0;
-		u32 osid;
 		struct lsmblob lsmdata;
 
 		if (!ima_lsm_isset(rule, i)) {
@@ -588,8 +587,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
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
index 3f0a3aedad19..9241245a9d4b 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1489,9 +1489,16 @@ int security_inode_listsecurity(struct inode *inode, char *buffer, size_t buffer
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
2.25.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E4BBF3201C1
	for <lists+linux-audit@lfdr.de>; Sat, 20 Feb 2021 00:30:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-Fv3GmgJrOzG0DIIogwGuDA-1; Fri, 19 Feb 2021 18:30:19 -0500
X-MC-Unique: Fv3GmgJrOzG0DIIogwGuDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12477801965;
	Fri, 19 Feb 2021 23:30:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E80F560BFA;
	Fri, 19 Feb 2021 23:30:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADB7657DFA;
	Fri, 19 Feb 2021 23:30:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11JNTOnU029898 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 19 Feb 2021 18:29:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2ECCC10A58F4; Fri, 19 Feb 2021 23:29:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A93210A58EC
	for <linux-audit@redhat.com>; Fri, 19 Feb 2021 23:29:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AD17185A7BC
	for <linux-audit@redhat.com>; Fri, 19 Feb 2021 23:29:21 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
	[209.85.219.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-447-IdkQgEuzPCS1NsKnKXAkpg-1; Fri, 19 Feb 2021 18:29:19 -0500
X-MC-Unique: IdkQgEuzPCS1NsKnKXAkpg-1
Received: by mail-qv1-f51.google.com with SMTP id p12so3453474qvv.5
	for <linux-audit@redhat.com>; Fri, 19 Feb 2021 15:29:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=S6kkwPyFasGabciXBJltzlq7+5sHKuwrKAkqRgvQL3M=;
	b=dGXdDqjk9d+gNcdeFfrVqb61PAgqkHGof/noITJqnKbsK73BFsuDmimG7PSlZumacl
	e2EWB24saRGV4LbJgIRFzZBOoJZOQtzXNSbk7w3oOwjPfLNGP4thcFGx0JFM4b2AOpwc
	zfvcwDrcchZEiFLe0RFMLzDO7k4cqcpQZufy7TnDM2nb/23Z4H0VFq1PzCfrQYppOThe
	aQA81dOJu9zofHXoShrSwHeyM+FYPpeID4raXOIHMvJbH6UrJ9fARno3+yDambV/SFsD
	p1THmNZAD+qaEJgOIiI4Ik1ozQfjr9Kw0kYGK0BoqLcqZJNap/wCGVDdd1RBsLTVO840
	/omQ==
X-Gm-Message-State: AOAM53158mtgZ2di6FTIhVW2Zg/i5DYWQxb5rbVevEZSPn7i4djEt91n
	KDXAzIh8uhco+5WVC63/1m56
X-Google-Smtp-Source: ABdhPJwHyXGvX+vZp5aaFyZsFbg5bgM6WfZ3lg0g95EmkbsrgxQTZ15j0Z3CDahrB9UZRwlnhsES0g==
X-Received: by 2002:a0c:90c9:: with SMTP id p67mr3868287qvp.14.1613777358770; 
	Fri, 19 Feb 2021 15:29:18 -0800 (PST)
Received: from localhost ([151.203.60.33]) by smtp.gmail.com with ESMTPSA id
	a206sm7569909qkc.7.2021.02.19.15.29.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 19 Feb 2021 15:29:18 -0800 (PST)
Subject: [RFC PATCH 3/4] smack: differentiate between subjective and objective
	task credentials
From: Paul Moore <paul@paul-moore.com>
To: Casey Schaufler <casey@schaufler-ca.com>,
	John Johansen <john.johansen@canonical.com>
Date: Fri, 19 Feb 2021 18:29:17 -0500
Message-ID: <161377735771.87807.8998552586584751981.stgit@sifl>
In-Reply-To: <161377712068.87807.12246856567527156637.stgit@sifl>
References: <161377712068.87807.12246856567527156637.stgit@sifl>
User-Agent: StGit/1.0
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
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

With the split of the security_task_getsecid() into subjective and
objective variants it's time to update Smack to ensure it is using
the correct task creds.

Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 security/smack/smack.h     |   18 +++++++++++++++++-
 security/smack/smack_lsm.c |   40 +++++++++++++++++++++++++++-------------
 2 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/security/smack/smack.h b/security/smack/smack.h
index a9768b12716bf..08f9cb80655ce 100644
--- a/security/smack/smack.h
+++ b/security/smack/smack.h
@@ -383,7 +383,23 @@ static inline struct smack_known *smk_of_task(const struct task_smack *tsp)
 	return tsp->smk_task;
 }
 
-static inline struct smack_known *smk_of_task_struct(
+static inline struct smack_known *smk_of_task_struct_subj(
+						const struct task_struct *t)
+{
+	struct smack_known *skp;
+	const struct cred *cred;
+
+	rcu_read_lock();
+
+	cred = rcu_dereference(t->cred);
+	skp = smk_of_task(smack_cred(cred));
+
+	rcu_read_unlock();
+
+	return skp;
+}
+
+static inline struct smack_known *smk_of_task_struct_obj(
 						const struct task_struct *t)
 {
 	struct smack_known *skp;
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 2bb354ef2c4a9..ea1a82742e8ba 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -159,7 +159,7 @@ static int smk_bu_current(char *note, struct smack_known *oskp,
 static int smk_bu_task(struct task_struct *otp, int mode, int rc)
 {
 	struct task_smack *tsp = smack_cred(current_cred());
-	struct smack_known *smk_task = smk_of_task_struct(otp);
+	struct smack_known *smk_task = smk_of_task_struct_obj(otp);
 	char acc[SMK_NUM_ACCESS_TYPE + 1];
 
 	if (rc <= 0)
@@ -479,7 +479,7 @@ static int smack_ptrace_access_check(struct task_struct *ctp, unsigned int mode)
 {
 	struct smack_known *skp;
 
-	skp = smk_of_task_struct(ctp);
+	skp = smk_of_task_struct_obj(ctp);
 
 	return smk_ptrace_rule_check(current, skp, mode, __func__);
 }
@@ -2031,7 +2031,7 @@ static int smk_curacc_on_task(struct task_struct *p, int access,
 				const char *caller)
 {
 	struct smk_audit_info ad;
-	struct smack_known *skp = smk_of_task_struct(p);
+	struct smack_known *skp = smk_of_task_struct_subj(p);
 	int rc;
 
 	smk_ad_init(&ad, caller, LSM_AUDIT_DATA_TASK);
@@ -2076,15 +2076,29 @@ static int smack_task_getsid(struct task_struct *p)
 }
 
 /**
- * smack_task_getsecid - get the secid of the task
- * @p: the object task
+ * smack_task_getsecid_subj - get the subjective secid of the task
+ * @p: the task
  * @secid: where to put the result
  *
- * Sets the secid to contain a u32 version of the smack label.
+ * Sets the secid to contain a u32 version of the task's subjective smack label.
+ */
+static void smack_task_getsecid_subj(struct task_struct *p, u32 *secid)
+{
+	struct smack_known *skp = smk_of_task_struct_subj(p);
+
+	*secid = skp->smk_secid;
+}
+
+/**
+ * smack_task_getsecid_obj - get the objective secid of the task
+ * @p: the task
+ * @secid: where to put the result
+ *
+ * Sets the secid to contain a u32 version of the task's objective smack label.
  */
-static void smack_task_getsecid(struct task_struct *p, u32 *secid)
+static void smack_task_getsecid_obj(struct task_struct *p, u32 *secid)
 {
-	struct smack_known *skp = smk_of_task_struct(p);
+	struct smack_known *skp = smk_of_task_struct_obj(p);
 
 	*secid = skp->smk_secid;
 }
@@ -2172,7 +2186,7 @@ static int smack_task_kill(struct task_struct *p, struct kernel_siginfo *info,
 {
 	struct smk_audit_info ad;
 	struct smack_known *skp;
-	struct smack_known *tkp = smk_of_task_struct(p);
+	struct smack_known *tkp = smk_of_task_struct_obj(p);
 	int rc;
 
 	if (!sig)
@@ -2210,7 +2224,7 @@ static int smack_task_kill(struct task_struct *p, struct kernel_siginfo *info,
 static void smack_task_to_inode(struct task_struct *p, struct inode *inode)
 {
 	struct inode_smack *isp = smack_inode(inode);
-	struct smack_known *skp = smk_of_task_struct(p);
+	struct smack_known *skp = smk_of_task_struct_obj(p);
 
 	isp->smk_inode = skp;
 	isp->smk_flags |= SMK_INODE_INSTANT;
@@ -3481,7 +3495,7 @@ static void smack_d_instantiate(struct dentry *opt_dentry, struct inode *inode)
  */
 static int smack_getprocattr(struct task_struct *p, char *name, char **value)
 {
-	struct smack_known *skp = smk_of_task_struct(p);
+	struct smack_known *skp = smk_of_task_struct_subj(p);
 	char *cp;
 	int slen;
 
@@ -4755,8 +4769,8 @@ static struct security_hook_list smack_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(task_setpgid, smack_task_setpgid),
 	LSM_HOOK_INIT(task_getpgid, smack_task_getpgid),
 	LSM_HOOK_INIT(task_getsid, smack_task_getsid),
-	LSM_HOOK_INIT(task_getsecid_subj, smack_task_getsecid),
-	LSM_HOOK_INIT(task_getsecid_obj, smack_task_getsecid),
+	LSM_HOOK_INIT(task_getsecid_subj, smack_task_getsecid_subj),
+	LSM_HOOK_INIT(task_getsecid_obj, smack_task_getsecid_obj),
 	LSM_HOOK_INIT(task_setnice, smack_task_setnice),
 	LSM_HOOK_INIT(task_setioprio, smack_task_setioprio),
 	LSM_HOOK_INIT(task_getioprio, smack_task_getioprio),

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


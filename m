Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2518B3201BF
	for <lists+linux-audit@lfdr.de>; Sat, 20 Feb 2021 00:30:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-qrNAu6nUMvCZIDbo2Wf2bw-1; Fri, 19 Feb 2021 18:30:05 -0500
X-MC-Unique: qrNAu6nUMvCZIDbo2Wf2bw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1BF66D4E0;
	Fri, 19 Feb 2021 23:30:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4CBF5D9C2;
	Fri, 19 Feb 2021 23:30:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 873FB18095CB;
	Fri, 19 Feb 2021 23:30:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11JNTRao029915 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 19 Feb 2021 18:29:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CC10F10A58EC; Fri, 19 Feb 2021 23:29:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C787110A7E43
	for <linux-audit@redhat.com>; Fri, 19 Feb 2021 23:29:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B029A8919BE
	for <linux-audit@redhat.com>; Fri, 19 Feb 2021 23:29:27 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-391-2K6C82oiP_-NHjYC5KBibg-1; Fri, 19 Feb 2021 18:29:25 -0500
X-MC-Unique: 2K6C82oiP_-NHjYC5KBibg-1
Received: by mail-qk1-f180.google.com with SMTP id h8so7273109qkk.6
	for <linux-audit@redhat.com>; Fri, 19 Feb 2021 15:29:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=E8JBjLM+VrYyjykM174pAPWmD9tkjj7saJUnrbSTTIQ=;
	b=NZFBCaZ2nmbW6ywi+l5fZ9kKYnVVmKoOY5fl88lMDB3hhm8v1cV7ob055n3E0DTd0f
	lqSzzsJOvzzbLcKbciSFldAcppwRlN009HMlRIL8C8Vh912uceZutvZqm1dz0SZoNIcU
	AAmG4QBpTqgQ5OQwiNBECHYSrTCdidQKS+fI9AMcyoj9MExqccHuGtnx0SKQBRfWGUBT
	IVNmFVHe7K+uGfSHDnJcAf7qKAMlRED5uQuc5ei31z7V3wN0fMyMvKZjGi4E2fBErc2f
	K9PZmm9PTxnBg2c6G6P9dOkZbU9B12iDcgmdfmxRlK/4ClmAz7/K54vgXoItk9xYwnsT
	srJw==
X-Gm-Message-State: AOAM532vgGgkv4Kyj/M15xHtwHrjaX+ZYHYI8Cyf357BegDsPwPeSaof
	VX7K1UL/g4YCjow07P7T7fXj
X-Google-Smtp-Source: ABdhPJxoRGMhZL78hlgpeoNTGZ7eVPG9JEN4WQFHSand8x2oz5IGs23RnAOoMBSQwfB/dM2aIvOuKQ==
X-Received: by 2002:ae9:e915:: with SMTP id x21mr11772911qkf.311.1613777364889;
	Fri, 19 Feb 2021 15:29:24 -0800 (PST)
Received: from localhost ([151.203.60.33]) by smtp.gmail.com with ESMTPSA id
	z139sm7433814qkb.0.2021.02.19.15.29.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 19 Feb 2021 15:29:24 -0800 (PST)
Subject: [RFC PATCH 4/4] apparmor: differentiate between subjective and
	objective task credentials
From: Paul Moore <paul@paul-moore.com>
To: Casey Schaufler <casey@schaufler-ca.com>,
	John Johansen <john.johansen@canonical.com>
Date: Fri, 19 Feb 2021 18:29:23 -0500
Message-ID: <161377736385.87807.7033400948278183233.stgit@sifl>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With the split of the security_task_getsecid() into subjective and
objective variants it's time to update AppArmor to ensure it is
using the correct task creds.

Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 security/apparmor/domain.c       |    2 +-
 security/apparmor/include/cred.h |   19 ++++++++++++++++---
 security/apparmor/include/task.h |    3 ++-
 security/apparmor/lsm.c          |   23 +++++++++++++++--------
 security/apparmor/task.c         |   23 ++++++++++++++++++++---
 5 files changed, 54 insertions(+), 16 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index f919ebd042fd2..9ed00b8dcdf0c 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -67,7 +67,7 @@ static int may_change_ptraced_domain(struct aa_label *to_label,
 	tracer = ptrace_parent(current);
 	if (tracer)
 		/* released below */
-		tracerl = aa_get_task_label(tracer);
+		tracerl = aa_get_task_label_subj(tracer);
 
 	/* not ptraced */
 	if (!tracer || unconfined(tracerl))
diff --git a/security/apparmor/include/cred.h b/security/apparmor/include/cred.h
index 0b9ae4804ef73..43c21ef5568ab 100644
--- a/security/apparmor/include/cred.h
+++ b/security/apparmor/include/cred.h
@@ -64,14 +64,27 @@ static inline struct aa_label *aa_get_newest_cred_label(const struct cred *cred)
 }
 
 /**
- * __aa_task_raw_label - retrieve another task's label
+ * __aa_task_raw_label_subj - retrieve another task's subjective label
  * @task: task to query  (NOT NULL)
  *
- * Returns: @task's label without incrementing its ref count
+ * Returns: @task's subjective label without incrementing its ref count
  *
  * If @task != current needs to be called in RCU safe critical section
  */
-static inline struct aa_label *__aa_task_raw_label(struct task_struct *task)
+static inline struct aa_label *__aa_task_raw_label_subj(struct task_struct *task)
+{
+	return aa_cred_raw_label(rcu_dereference(task->cred));
+}
+
+/**
+ * __aa_task_raw_label_obj - retrieve another task's objective label
+ * @task: task to query  (NOT NULL)
+ *
+ * Returns: @task's objective label without incrementing its ref count
+ *
+ * If @task != current needs to be called in RCU safe critical section
+ */
+static inline struct aa_label *__aa_task_raw_label_obj(struct task_struct *task)
 {
 	return aa_cred_raw_label(__task_cred(task));
 }
diff --git a/security/apparmor/include/task.h b/security/apparmor/include/task.h
index f13d12373b25e..27a2961558555 100644
--- a/security/apparmor/include/task.h
+++ b/security/apparmor/include/task.h
@@ -33,7 +33,8 @@ int aa_replace_current_label(struct aa_label *label);
 int aa_set_current_onexec(struct aa_label *label, bool stack);
 int aa_set_current_hat(struct aa_label *label, u64 token);
 int aa_restore_previous_label(u64 cookie);
-struct aa_label *aa_get_task_label(struct task_struct *task);
+struct aa_label *aa_get_task_label_subj(struct task_struct *task);
+struct aa_label *aa_get_task_label_obj(struct task_struct *task);
 
 /**
  * aa_free_task_ctx - free a task_ctx
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 15e37b9132679..38430851675b9 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -119,7 +119,7 @@ static int apparmor_ptrace_access_check(struct task_struct *child,
 	int error;
 
 	tracer = __begin_current_label_crit_section();
-	tracee = aa_get_task_label(child);
+	tracee = aa_get_task_label_obj(child);
 	error = aa_may_ptrace(tracer, tracee,
 			(mode & PTRACE_MODE_READ) ? AA_PTRACE_READ
 						  : AA_PTRACE_TRACE);
@@ -135,7 +135,7 @@ static int apparmor_ptrace_traceme(struct task_struct *parent)
 	int error;
 
 	tracee = __begin_current_label_crit_section();
-	tracer = aa_get_task_label(parent);
+	tracer = aa_get_task_label_subj(parent);
 	error = aa_may_ptrace(tracer, tracee, AA_PTRACE_TRACE);
 	aa_put_label(tracer);
 	__end_current_label_crit_section(tracee);
@@ -719,9 +719,16 @@ static void apparmor_bprm_committed_creds(struct linux_binprm *bprm)
 	return;
 }
 
-static void apparmor_task_getsecid(struct task_struct *p, u32 *secid)
+static void apparmor_task_getsecid_subj(struct task_struct *p, u32 *secid)
 {
-	struct aa_label *label = aa_get_task_label(p);
+	struct aa_label *label = aa_get_task_label_subj(p);
+	*secid = label->secid;
+	aa_put_label(label);
+}
+
+static void apparmor_task_getsecid_obj(struct task_struct *p, u32 *secid)
+{
+	struct aa_label *label = aa_get_task_label_obj(p);
 	*secid = label->secid;
 	aa_put_label(label);
 }
@@ -750,7 +757,7 @@ static int apparmor_task_kill(struct task_struct *target, struct kernel_siginfo
 		 * Dealing with USB IO specific behavior
 		 */
 		cl = aa_get_newest_cred_label(cred);
-		tl = aa_get_task_label(target);
+		tl = aa_get_task_label_obj(target);
 		error = aa_may_signal(cl, tl, sig);
 		aa_put_label(cl);
 		aa_put_label(tl);
@@ -758,7 +765,7 @@ static int apparmor_task_kill(struct task_struct *target, struct kernel_siginfo
 	}
 
 	cl = __begin_current_label_crit_section();
-	tl = aa_get_task_label(target);
+	tl = aa_get_task_label_obj(target);
 	error = aa_may_signal(cl, tl, sig);
 	aa_put_label(tl);
 	__end_current_label_crit_section(cl);
@@ -1243,8 +1250,8 @@ static struct security_hook_list apparmor_hooks[] __lsm_ro_after_init = {
 
 	LSM_HOOK_INIT(task_free, apparmor_task_free),
 	LSM_HOOK_INIT(task_alloc, apparmor_task_alloc),
-	LSM_HOOK_INIT(task_getsecid_subj, apparmor_task_getsecid),
-	LSM_HOOK_INIT(task_getsecid_obj, apparmor_task_getsecid),
+	LSM_HOOK_INIT(task_getsecid_subj, apparmor_task_getsecid_subj),
+	LSM_HOOK_INIT(task_getsecid_obj, apparmor_task_getsecid_obj),
 	LSM_HOOK_INIT(task_setrlimit, apparmor_task_setrlimit),
 	LSM_HOOK_INIT(task_kill, apparmor_task_kill),
 
diff --git a/security/apparmor/task.c b/security/apparmor/task.c
index d17130ee6795d..c03c8e3928055 100644
--- a/security/apparmor/task.c
+++ b/security/apparmor/task.c
@@ -16,17 +16,34 @@
 #include "include/task.h"
 
 /**
- * aa_get_task_label - Get another task's label
+ * aa_get_task_label_subj - Get another task's subjective label
  * @task: task to query  (NOT NULL)
  *
  * Returns: counted reference to @task's label
  */
-struct aa_label *aa_get_task_label(struct task_struct *task)
+struct aa_label *aa_get_task_label_subj(struct task_struct *task)
 {
 	struct aa_label *p;
 
 	rcu_read_lock();
-	p = aa_get_newest_label(__aa_task_raw_label(task));
+	p = aa_get_newest_label(__aa_task_raw_label_subj(task));
+	rcu_read_unlock();
+
+	return p;
+}
+
+/**
+ * aa_get_task_label_obj - Get another task's objective label
+ * @task: task to query  (NOT NULL)
+ *
+ * Returns: counted reference to @task's label
+ */
+struct aa_label *aa_get_task_label_obj(struct task_struct *task)
+{
+	struct aa_label *p;
+
+	rcu_read_lock();
+	p = aa_get_newest_label(__aa_task_raw_label_obj(task));
 	rcu_read_unlock();
 
 	return p;

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


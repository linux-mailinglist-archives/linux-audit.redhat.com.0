Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 20F6912DB84
	for <lists+linux-audit@lfdr.de>; Tue, 31 Dec 2019 20:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577821881;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=LHAlGnmOBRzsIyClBGNlr20NWf6F+zCfghkAeY3PMrs=;
	b=fm4Trb7SceUiWGf3YXT1LrIVCxdfLz2gXzb2HA/1PkYQRlbSKQmpNC/wspM79Fen55CK4t
	Q+he/K0HMGAAximw9GzHcm6Tq4DCle58uLM8Q11Eo5rYdwtU++d3RPvXeK+sZHsPxOOSh6
	A1oCdddN0u5ckA0+vjYSA7xvXfEI1j8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-Myr039-PMEq8hhqm15eFxg-1; Tue, 31 Dec 2019 14:51:20 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D5FC100550E;
	Tue, 31 Dec 2019 19:51:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CF8B78E99;
	Tue, 31 Dec 2019 19:51:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C12E827FA;
	Tue, 31 Dec 2019 19:51:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBVJpDlb032414 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 31 Dec 2019 14:51:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 304FD81C0A; Tue, 31 Dec 2019 19:51:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-15.phx2.redhat.com [10.3.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A15B18208E;
	Tue, 31 Dec 2019 19:51:08 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org, linux-api@vger.kernel.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	linux-fsdevel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak90 V8 12/16] audit: contid check descendancy and nesting
Date: Tue, 31 Dec 2019 14:48:25 -0500
Message-Id: <cfbb80a08fc770dd0dcf6dac6ff307a80d877c3f.1577736799.git.rgb@redhat.com>
In-Reply-To: <cover.1577736799.git.rgb@redhat.com>
References: <cover.1577736799.git.rgb@redhat.com>
In-Reply-To: <cover.1577736799.git.rgb@redhat.com>
References: <cover.1577736799.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	dhowells@redhat.com, ebiederm@xmission.com, simo@redhat.com,
	eparis@parisplace.org, mpatel@redhat.com, serge@hallyn.com
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
MIME-Version: 1.0
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Myr039-PMEq8hhqm15eFxg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Require the target task to be a descendant of the container
orchestrator/engine.

You would only change the audit container ID from one set or inherited
value to another if you were nesting containers.

If changing the contid, the container orchestrator/engine must be a
descendant and not same orchestrator as the one that set it so it is not
possible to change the contid of another orchestrator's container.

Since the task_is_descendant() function is used in YAMA and in audit,
remove the duplication and pull the function into kernel/core/sched.c

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 include/linux/sched.h    |  3 +++
 kernel/audit.c           | 44 ++++++++++++++++++++++++++++++++++++--------
 kernel/sched/core.c      | 33 +++++++++++++++++++++++++++++++++
 security/yama/yama_lsm.c | 33 ---------------------------------
 4 files changed, 72 insertions(+), 41 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index aebe24192b23..009d2cb2e2bf 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2006,4 +2006,7 @@ static inline void rseq_syscall(struct pt_regs *regs)
 
 const struct cpumask *sched_trace_rd_span(struct root_domain *rd);
 
+extern int task_is_descendant(struct task_struct *parent,
+			      struct task_struct *child);
+
 #endif
diff --git a/kernel/audit.c b/kernel/audit.c
index f7a8d3288ca0..ef8e07524c46 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2575,6 +2575,13 @@ int audit_signal_info(int sig, struct task_struct *t)
 	return audit_signal_info_syscall(t);
 }
 
+static bool audit_contid_isowner(struct task_struct *tsk)
+{
+	if (tsk->audit && tsk->audit->cont)
+		return current == tsk->audit->cont->owner;
+	return false;
+}
+
 /*
  * audit_set_contid - set current task's audit contid
  * @task: target task
@@ -2603,22 +2610,43 @@ int audit_set_contid(struct task_struct *task, u64 contid)
 	oldcontid = audit_get_contid(task);
 	read_lock(&tasklist_lock);
 	/* Don't allow the contid to be unset */
-	if (!audit_contid_valid(contid))
+	if (!audit_contid_valid(contid)) {
 		rc = -EINVAL;
+		goto unlock;
+	}
 	/* Don't allow the contid to be set to the same value again */
-	else if (contid == oldcontid) {
+	if (contid == oldcontid) {
 		rc = -EADDRINUSE;
+		goto unlock;
+	}
 	/* if we don't have caps, reject */
-	else if (!capable(CAP_AUDIT_CONTROL))
+	if (!capable(CAP_AUDIT_CONTROL)) {
 		rc = -EPERM;
-	/* if task has children or is not single-threaded, deny */
-	else if (!list_empty(&task->children))
+		goto unlock;
+	}
+	/* if task has children, deny */
+	if (!list_empty(&task->children)) {
 		rc = -EBUSY;
-	else if (!(thread_group_leader(task) && thread_group_empty(task)))
+		goto unlock;
+	}
+	/* if task is not single-threaded, deny */
+	if (!(thread_group_leader(task) && thread_group_empty(task))) {
 		rc = -EALREADY;
-	/* if contid is already set, deny */
-	else if (audit_contid_set(task))
+		goto unlock;
+	}
+	/* if task is not descendant, block */
+	if (task == current) {
+		rc = -EBADSLT;
+		goto unlock;
+	}
+	if (!task_is_descendant(current, task)) {
+		rc = -EXDEV;
+		goto unlock;
+	}
+	/* only allow contid setting again if nesting */
+	if (audit_contid_set(task) && audit_contid_isowner(task))
 		rc = -ECHILD;
+unlock:
 	read_unlock(&tasklist_lock);
 	if (!rc) {
 		struct audit_contobj *oldcont = _audit_contobj(task);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 90e4b00ace89..7d8145285eb9 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7916,6 +7916,39 @@ void dump_cpu_task(int cpu)
 }
 
 /*
+ * task_is_descendant - walk up a process family tree looking for a match
+ * @parent: the process to compare against while walking up from child
+ * @child: the process to start from while looking upwards for parent
+ *
+ * Returns 1 if child is a descendant of parent, 0 if not.
+ */
+int task_is_descendant(struct task_struct *parent,
+			      struct task_struct *child)
+{
+	int rc = 0;
+	struct task_struct *walker = child;
+
+	if (!parent || !child)
+		return 0;
+
+	rcu_read_lock();
+	if (!thread_group_leader(parent))
+		parent = rcu_dereference(parent->group_leader);
+	while (walker->pid > 0) {
+		if (!thread_group_leader(walker))
+			walker = rcu_dereference(walker->group_leader);
+		if (walker == parent) {
+			rc = 1;
+			break;
+		}
+		walker = rcu_dereference(walker->real_parent);
+	}
+	rcu_read_unlock();
+
+	return rc;
+}
+
+/*
  * Nice levels are multiplicative, with a gentle 10% change for every
  * nice level changed. I.e. when a CPU-bound task goes from nice 0 to
  * nice 1, it will get ~10% less CPU time than another CPU-bound task
diff --git a/security/yama/yama_lsm.c b/security/yama/yama_lsm.c
index 94dc346370b1..25eae205eae8 100644
--- a/security/yama/yama_lsm.c
+++ b/security/yama/yama_lsm.c
@@ -263,39 +263,6 @@ static int yama_task_prctl(int option, unsigned long arg2, unsigned long arg3,
 }
 
 /**
- * task_is_descendant - walk up a process family tree looking for a match
- * @parent: the process to compare against while walking up from child
- * @child: the process to start from while looking upwards for parent
- *
- * Returns 1 if child is a descendant of parent, 0 if not.
- */
-static int task_is_descendant(struct task_struct *parent,
-			      struct task_struct *child)
-{
-	int rc = 0;
-	struct task_struct *walker = child;
-
-	if (!parent || !child)
-		return 0;
-
-	rcu_read_lock();
-	if (!thread_group_leader(parent))
-		parent = rcu_dereference(parent->group_leader);
-	while (walker->pid > 0) {
-		if (!thread_group_leader(walker))
-			walker = rcu_dereference(walker->group_leader);
-		if (walker == parent) {
-			rc = 1;
-			break;
-		}
-		walker = rcu_dereference(walker->real_parent);
-	}
-	rcu_read_unlock();
-
-	return rc;
-}
-
-/**
  * ptracer_exception_found - tracer registered as exception for this tracee
  * @tracer: the task_struct of the process attempting ptrace
  * @tracee: the task_struct of the process to be ptraced
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


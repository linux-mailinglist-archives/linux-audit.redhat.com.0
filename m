Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 73E9412DB4F
	for <lists+linux-audit@lfdr.de>; Tue, 31 Dec 2019 20:50:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577821813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=PbEiAXoJ8no4/ReUDVYsp0NrRdmXLoVkNnW493L1OrI=;
	b=QqdmRfNyJdfHJcm/RHV8mDKFePEYU8Yp72oTlqKIwhW3yBKwbTJf/z920e+DjeonE+KYEe
	Dlj+YrMp9PiWROeeCykn6CsnC3kStQebs6ACcfglnenI298HF13+RbrE2uY1o5qLdO0mhH
	0OB+bxOQYORNREbXmpX71ZVQB+VI79o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-SOvg5DXkO_6HkoWs12SXdA-1; Tue, 31 Dec 2019 14:50:11 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C5A18024D2;
	Tue, 31 Dec 2019 19:50:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27BBE5D9E2;
	Tue, 31 Dec 2019 19:50:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6845918089C8;
	Tue, 31 Dec 2019 19:50:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBVJnmTF032102 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 31 Dec 2019 14:49:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 75CA382095; Tue, 31 Dec 2019 19:49:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-15.phx2.redhat.com [10.3.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE28681C0A;
	Tue, 31 Dec 2019 19:49:43 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org, linux-api@vger.kernel.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	linux-fsdevel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak90 V8 02/16] audit: add container id
Date: Tue, 31 Dec 2019 14:48:15 -0500
Message-Id: <70ad50e69185c50843d5e14462f1c4f03655d503.1577736799.git.rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: SOvg5DXkO_6HkoWs12SXdA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement the proc fs write to set the audit container identifier of a
process, emitting an AUDIT_CONTAINER_OP record to document the event.

This is a write from the container orchestrator task to a proc entry of
the form /proc/PID/audit_containerid where PID is the process ID of the
newly created task that is to become the first task in a container, or
an additional task added to a container.

The write expects up to a u64 value (unset: 18446744073709551615).

The writer must have capability CAP_AUDIT_CONTROL.

This will produce a record such as this:
  type=CONTAINER_OP msg=audit(2018-06-06 12:39:29.636:26949) : op=set opid=2209 contid=123456 old-contid=18446744073709551615

The "op" field indicates an initial set.  The "opid" field is the
object's PID, the process being "contained".  New and old audit
container identifier values are given in the "contid" fields.

It is not permitted to unset the audit container identifier.
A child inherits its parent's audit container identifier.

Please see the github audit kernel issue for the main feature:
  https://github.com/linux-audit/audit-kernel/issues/90
Please see the github audit userspace issue for supporting additions:
  https://github.com/linux-audit/audit-userspace/issues/51
Please see the github audit testsuiite issue for the test case:
  https://github.com/linux-audit/audit-testsuite/issues/64
Please see the github audit wiki for the feature overview:
  https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
Acked-by: Serge Hallyn <serge@hallyn.com>
Acked-by: Steve Grubb <sgrubb@redhat.com>
Acked-by: Neil Horman <nhorman@tuxdriver.com>
Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 fs/proc/base.c             | 36 ++++++++++++++++++++++++++++
 include/linux/audit.h      | 25 ++++++++++++++++++++
 include/uapi/linux/audit.h |  2 ++
 kernel/audit.c             | 58 ++++++++++++++++++++++++++++++++++++++++++++++
 kernel/audit.h             |  1 +
 kernel/auditsc.c           |  4 ++++
 6 files changed, 126 insertions(+)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index ebea9501afb8..e2e7c9f4702f 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -1307,6 +1307,40 @@ static ssize_t proc_sessionid_read(struct file * file, char __user * buf,
 	.read		= proc_sessionid_read,
 	.llseek		= generic_file_llseek,
 };
+
+static ssize_t proc_contid_write(struct file *file, const char __user *buf,
+				   size_t count, loff_t *ppos)
+{
+	struct inode *inode = file_inode(file);
+	u64 contid;
+	int rv;
+	struct task_struct *task = get_proc_task(inode);
+
+	if (!task)
+		return -ESRCH;
+	if (*ppos != 0) {
+		/* No partial writes. */
+		put_task_struct(task);
+		return -EINVAL;
+	}
+
+	rv = kstrtou64_from_user(buf, count, 10, &contid);
+	if (rv < 0) {
+		put_task_struct(task);
+		return rv;
+	}
+
+	rv = audit_set_contid(task, contid);
+	put_task_struct(task);
+	if (rv < 0)
+		return rv;
+	return count;
+}
+
+static const struct file_operations proc_contid_operations = {
+	.write		= proc_contid_write,
+	.llseek		= generic_file_llseek,
+};
 #endif
 
 #ifdef CONFIG_FAULT_INJECTION
@@ -3067,6 +3101,7 @@ static int proc_stack_depth(struct seq_file *m, struct pid_namespace *ns,
 #ifdef CONFIG_AUDIT
 	REG("loginuid",   S_IWUSR|S_IRUGO, proc_loginuid_operations),
 	REG("sessionid",  S_IRUGO, proc_sessionid_operations),
+	REG("audit_containerid", S_IWUSR, proc_contid_operations),
 #endif
 #ifdef CONFIG_FAULT_INJECTION
 	REG("make-it-fail", S_IRUGO|S_IWUSR, proc_fault_inject_operations),
@@ -3467,6 +3502,7 @@ static int proc_tid_comm_permission(struct inode *inode, int mask)
 #ifdef CONFIG_AUDIT
 	REG("loginuid",  S_IWUSR|S_IRUGO, proc_loginuid_operations),
 	REG("sessionid",  S_IRUGO, proc_sessionid_operations),
+	REG("audit_containerid", S_IWUSR, proc_contid_operations),
 #endif
 #ifdef CONFIG_FAULT_INJECTION
 	REG("make-it-fail", S_IRUGO|S_IWUSR, proc_fault_inject_operations),
diff --git a/include/linux/audit.h b/include/linux/audit.h
index 96deb28942e3..a045b34ecf44 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -97,6 +97,7 @@ struct audit_ntp_data {
 struct audit_task_info {
 	kuid_t			loginuid;
 	unsigned int		sessionid;
+	u64			contid;
 #ifdef CONFIG_AUDITSYSCALL
 	struct audit_context	*ctx;
 #endif
@@ -198,6 +199,15 @@ static inline unsigned int audit_get_sessionid(struct task_struct *tsk)
 	return tsk->audit->sessionid;
 }
 
+extern int audit_set_contid(struct task_struct *tsk, u64 contid);
+
+static inline u64 audit_get_contid(struct task_struct *tsk)
+{
+	if (!tsk->audit)
+		return AUDIT_CID_UNSET;
+	return tsk->audit->contid;
+}
+
 extern u32 audit_enabled;
 
 extern int audit_signal_info(int sig, struct task_struct *t);
@@ -262,6 +272,11 @@ static inline unsigned int audit_get_sessionid(struct task_struct *tsk)
 	return AUDIT_SID_UNSET;
 }
 
+static inline u64 audit_get_contid(struct task_struct *tsk)
+{
+	return AUDIT_CID_UNSET;
+}
+
 #define audit_enabled AUDIT_OFF
 
 static inline int audit_signal_info(int sig, struct task_struct *t)
@@ -670,6 +685,16 @@ static inline bool audit_loginuid_set(struct task_struct *tsk)
 	return uid_valid(audit_get_loginuid(tsk));
 }
 
+static inline bool audit_contid_valid(u64 contid)
+{
+	return contid != AUDIT_CID_UNSET;
+}
+
+static inline bool audit_contid_set(struct task_struct *tsk)
+{
+	return audit_contid_valid(audit_get_contid(tsk));
+}
+
 static inline void audit_log_string(struct audit_buffer *ab, const char *buf)
 {
 	audit_log_n_string(ab, buf, strlen(buf));
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 3ad935527177..866e1606c4ae 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -71,6 +71,7 @@
 #define AUDIT_TTY_SET		1017	/* Set TTY auditing status */
 #define AUDIT_SET_FEATURE	1018	/* Turn an audit feature on or off */
 #define AUDIT_GET_FEATURE	1019	/* Get which features are enabled */
+#define AUDIT_CONTAINER_OP	1020	/* Define the container id and info */
 
 #define AUDIT_FIRST_USER_MSG	1100	/* Userspace messages mostly uninteresting to kernel */
 #define AUDIT_USER_AVC		1107	/* We filter this differently */
@@ -489,6 +490,7 @@ struct audit_tty_status {
 
 #define AUDIT_UID_UNSET (unsigned int)-1
 #define AUDIT_SID_UNSET ((unsigned int)-1)
+#define AUDIT_CID_UNSET ((u64)-1)
 
 /* audit_rule_data supports filter rules with both integer and string
  * fields.  It corresponds with AUDIT_ADD_RULE, AUDIT_DEL_RULE and
diff --git a/kernel/audit.c b/kernel/audit.c
index 397f8fb4836a..2d7707426b7d 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -232,6 +232,7 @@ int audit_alloc(struct task_struct *tsk)
 	}
 	info->loginuid = audit_get_loginuid(current);
 	info->sessionid = audit_get_sessionid(current);
+	info->contid = audit_get_contid(current);
 	tsk->audit = info;
 
 	ret = audit_alloc_syscall(tsk);
@@ -246,6 +247,7 @@ int audit_alloc(struct task_struct *tsk)
 struct audit_task_info init_struct_audit = {
 	.loginuid = INVALID_UID,
 	.sessionid = AUDIT_SID_UNSET,
+	.contid = AUDIT_CID_UNSET,
 #ifdef CONFIG_AUDITSYSCALL
 	.ctx = NULL,
 #endif
@@ -2356,6 +2358,62 @@ int audit_signal_info(int sig, struct task_struct *t)
 	return audit_signal_info_syscall(t);
 }
 
+/*
+ * audit_set_contid - set current task's audit contid
+ * @task: target task
+ * @contid: contid value
+ *
+ * Returns 0 on success, -EPERM on permission failure.
+ *
+ * Called (set) from fs/proc/base.c::proc_contid_write().
+ */
+int audit_set_contid(struct task_struct *task, u64 contid)
+{
+	u64 oldcontid;
+	int rc = 0;
+	struct audit_buffer *ab;
+
+	task_lock(task);
+	/* Can't set if audit disabled */
+	if (!task->audit) {
+		task_unlock(task);
+		return -ENOPROTOOPT;
+	}
+	oldcontid = audit_get_contid(task);
+	read_lock(&tasklist_lock);
+	/* Don't allow the audit containerid to be unset */
+	if (!audit_contid_valid(contid))
+		rc = -EINVAL;
+	/* if we don't have caps, reject */
+	else if (!capable(CAP_AUDIT_CONTROL))
+		rc = -EPERM;
+	/* if task has children or is not single-threaded, deny */
+	else if (!list_empty(&task->children))
+		rc = -EBUSY;
+	else if (!(thread_group_leader(task) && thread_group_empty(task)))
+		rc = -EALREADY;
+	/* if contid is already set, deny */
+	else if (audit_contid_set(task))
+		rc = -ECHILD;
+	read_unlock(&tasklist_lock);
+	if (!rc)
+		task->audit->contid = contid;
+	task_unlock(task);
+
+	if (!audit_enabled)
+		return rc;
+
+	ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_CONTAINER_OP);
+	if (!ab)
+		return rc;
+
+	audit_log_format(ab,
+			 "op=set opid=%d contid=%llu old-contid=%llu",
+			 task_tgid_nr(task), contid, oldcontid);
+	audit_log_end(ab);
+	return rc;
+}
+
 /**
  * audit_log_end - end one audit record
  * @ab: the audit_buffer
diff --git a/kernel/audit.h b/kernel/audit.h
index 7f623ef216e6..16bd03b88e0d 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -135,6 +135,7 @@ struct audit_context {
 	kuid_t		    target_uid;
 	unsigned int	    target_sessionid;
 	u32		    target_sid;
+	u64		    target_cid;
 	char		    target_comm[TASK_COMM_LEN];
 
 	struct audit_tree_refs *trees, *first_trees;
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 10679da36bb6..0e2d50533959 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -113,6 +113,7 @@ struct audit_aux_data_pids {
 	kuid_t			target_uid[AUDIT_AUX_PIDS];
 	unsigned int		target_sessionid[AUDIT_AUX_PIDS];
 	u32			target_sid[AUDIT_AUX_PIDS];
+	u64			target_cid[AUDIT_AUX_PIDS];
 	char 			target_comm[AUDIT_AUX_PIDS][TASK_COMM_LEN];
 	int			pid_count;
 };
@@ -2375,6 +2376,7 @@ void __audit_ptrace(struct task_struct *t)
 	context->target_uid = task_uid(t);
 	context->target_sessionid = audit_get_sessionid(t);
 	security_task_getsecid(t, &context->target_sid);
+	context->target_cid = audit_get_contid(t);
 	memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
 }
 
@@ -2402,6 +2404,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 		ctx->target_uid = t_uid;
 		ctx->target_sessionid = audit_get_sessionid(t);
 		security_task_getsecid(t, &ctx->target_sid);
+		ctx->target_cid = audit_get_contid(t);
 		memcpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
 		return 0;
 	}
@@ -2423,6 +2426,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 	axp->target_uid[axp->pid_count] = t_uid;
 	axp->target_sessionid[axp->pid_count] = audit_get_sessionid(t);
 	security_task_getsecid(t, &axp->target_sid[axp->pid_count]);
+	axp->target_cid[axp->pid_count] = audit_get_contid(t);
 	memcpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
 	axp->pid_count++;
 
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


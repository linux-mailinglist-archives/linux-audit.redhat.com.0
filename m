Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7921320C1BF
	for <lists+linux-audit@lfdr.de>; Sat, 27 Jun 2020 15:25:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593264326;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=GNVLQiTdx6DE3g6alBVErGRCWwxTb7Ii+IxWx+y7MYo=;
	b=Bbv3254JDxNUQEKV4cA4P7qjP4yXl3vbo0c2DK2CqXg3SIRJ4PXonAadQagWIEaDhlfTS5
	XwEhxF3IAU5EG5kwyxOioml9yRv3X4IcOUnkUO4SGmUj9Hcd+pHNXPAxbBkz0rBpkWRev5
	+IHsvOSELld8nvkiLSUs+XDVvoAVrD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-OHg3KrBRNX6oj-QV6w2pLw-1; Sat, 27 Jun 2020 09:24:24 -0400
X-MC-Unique: OHg3KrBRNX6oj-QV6w2pLw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5C5A804003;
	Sat, 27 Jun 2020 13:23:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBCF65D9C9;
	Sat, 27 Jun 2020 13:23:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A316487861;
	Sat, 27 Jun 2020 13:23:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05RDNrQL007917 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 09:23:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C2FA8E7FB; Sat, 27 Jun 2020 13:23:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A07D8205F;
	Sat, 27 Jun 2020 13:23:43 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org, linux-api@vger.kernel.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	linux-fsdevel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak90 V9 13/13] audit: add capcontid to set contid outside
	init_user_ns
Date: Sat, 27 Jun 2020 09:20:46 -0400
Message-Id: <b6cb5500cfd7e8686ac2a7758103688c2da7f4ce.1593198710.git.rgb@redhat.com>
In-Reply-To: <cover.1593198710.git.rgb@redhat.com>
References: <cover.1593198710.git.rgb@redhat.com>
In-Reply-To: <cover.1593198710.git.rgb@redhat.com>
References: <cover.1593198710.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide a mechanism similar to CAP_AUDIT_CONTROL to explicitly give a
process in a non-init user namespace the capability to set audit
container identifiers of individual children.

Provide the /proc/$PID/audit_capcontid interface to capcontid.
Valid values are: 1==enabled, 0==disabled

Writing a "1" to this special file for the target process $PID will
enable the target process to set audit container identifiers of its
descendants.

A process must already have CAP_AUDIT_CONTROL in the initial user
namespace or have had audit_capcontid enabled by a previous use of this
feature by its parent on this process in order to be able to enable it
for another process.  The target process must be a descendant of the
calling process.

Report this action in new message type AUDIT_SET_CAPCONTID 1022 with
fields opid= capcontid= old-capcontid=

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 fs/proc/base.c             | 57 +++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/audit.h      | 14 ++++++++++++
 include/uapi/linux/audit.h |  1 +
 kernel/audit.c             | 38 ++++++++++++++++++++++++++++++-
 4 files changed, 108 insertions(+), 2 deletions(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index 794474cd8f35..1083db2ce345 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -1329,7 +1329,7 @@ static ssize_t proc_contid_read(struct file *file, char __user *buf,
 	if (!task)
 		return -ESRCH;
 	/* if we don't have caps, reject */
-	if (!capable(CAP_AUDIT_CONTROL))
+	if (!capable(CAP_AUDIT_CONTROL) && !audit_get_capcontid(current))
 		return -EPERM;
 	length = scnprintf(tmpbuf, TMPBUFLEN, "%llu", audit_get_contid(task));
 	put_task_struct(task);
@@ -1370,6 +1370,59 @@ static ssize_t proc_contid_write(struct file *file, const char __user *buf,
 	.write		= proc_contid_write,
 	.llseek		= generic_file_llseek,
 };
+
+static ssize_t proc_capcontid_read(struct file *file, char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	struct inode *inode = file_inode(file);
+	struct task_struct *task = get_proc_task(inode);
+	ssize_t length;
+	char tmpbuf[TMPBUFLEN];
+
+	if (!task)
+		return -ESRCH;
+	/* if we don't have caps, reject */
+	if (!capable(CAP_AUDIT_CONTROL) && !audit_get_capcontid(current))
+		return -EPERM;
+	length = scnprintf(tmpbuf, TMPBUFLEN, "%u", audit_get_capcontid(task));
+	put_task_struct(task);
+	return simple_read_from_buffer(buf, count, ppos, tmpbuf, length);
+}
+
+static ssize_t proc_capcontid_write(struct file *file, const char __user *buf,
+				   size_t count, loff_t *ppos)
+{
+	struct inode *inode = file_inode(file);
+	u32 capcontid;
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
+	rv = kstrtou32_from_user(buf, count, 10, &capcontid);
+	if (rv < 0) {
+		put_task_struct(task);
+		return rv;
+	}
+
+	rv = audit_set_capcontid(task, capcontid);
+	put_task_struct(task);
+	if (rv < 0)
+		return rv;
+	return count;
+}
+
+static const struct file_operations proc_capcontid_operations = {
+	.read		= proc_capcontid_read,
+	.write		= proc_capcontid_write,
+	.llseek		= generic_file_llseek,
+};
 #endif
 
 #ifdef CONFIG_FAULT_INJECTION
@@ -3273,6 +3326,7 @@ static int proc_stack_depth(struct seq_file *m, struct pid_namespace *ns,
 	REG("loginuid",   S_IWUSR|S_IRUGO, proc_loginuid_operations),
 	REG("sessionid",  S_IRUGO, proc_sessionid_operations),
 	REG("audit_containerid", S_IWUSR|S_IRUSR, proc_contid_operations),
+	REG("audit_capcontainerid", S_IWUSR|S_IRUSR, proc_capcontid_operations),
 #endif
 #ifdef CONFIG_FAULT_INJECTION
 	REG("make-it-fail", S_IRUGO|S_IWUSR, proc_fault_inject_operations),
@@ -3613,6 +3667,7 @@ static int proc_tid_comm_permission(struct inode *inode, int mask)
 	REG("loginuid",  S_IWUSR|S_IRUGO, proc_loginuid_operations),
 	REG("sessionid",  S_IRUGO, proc_sessionid_operations),
 	REG("audit_containerid", S_IWUSR|S_IRUSR, proc_contid_operations),
+	REG("audit_capcontainerid", S_IWUSR|S_IRUSR, proc_capcontid_operations),
 #endif
 #ifdef CONFIG_FAULT_INJECTION
 	REG("make-it-fail", S_IRUGO|S_IWUSR, proc_fault_inject_operations),
diff --git a/include/linux/audit.h b/include/linux/audit.h
index 025b52ae8422..2b3a2b6020ed 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -122,6 +122,7 @@ struct audit_task_info {
 	kuid_t			loginuid;
 	unsigned int		sessionid;
 	struct audit_contobj	*cont;
+	u32			capcontid;
 #ifdef CONFIG_AUDITSYSCALL
 	struct audit_context	*ctx;
 #endif
@@ -230,6 +231,14 @@ static inline unsigned int audit_get_sessionid(struct task_struct *tsk)
 	return tsk->audit->sessionid;
 }
 
+static inline u32 audit_get_capcontid(struct task_struct *tsk)
+{
+	if (!tsk->audit)
+		return 0;
+	return tsk->audit->capcontid;
+}
+
+extern int audit_set_capcontid(struct task_struct *tsk, u32 enable);
 extern int audit_set_contid(struct task_struct *tsk, u64 contid);
 
 static inline u64 audit_get_contid(struct task_struct *tsk)
@@ -311,6 +320,11 @@ static inline unsigned int audit_get_sessionid(struct task_struct *tsk)
 	return AUDIT_SID_UNSET;
 }
 
+static inline u32 audit_get_capcontid(struct task_struct *tsk)
+{
+	return 0;
+}
+
 static inline u64 audit_get_contid(struct task_struct *tsk)
 {
 	return AUDIT_CID_UNSET;
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 831c12bdd235..5e30f4c95dc2 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -73,6 +73,7 @@
 #define AUDIT_GET_FEATURE	1019	/* Get which features are enabled */
 #define AUDIT_CONTAINER_OP	1020	/* Define the container id and info */
 #define AUDIT_SIGNAL_INFO2	1021	/* Get info auditd signal sender */
+#define AUDIT_SET_CAPCONTID	1022	/* Set cap_contid of a task */
 
 #define AUDIT_FIRST_USER_MSG	1100	/* Userspace messages mostly uninteresting to kernel */
 #define AUDIT_USER_AVC		1107	/* We filter this differently */
diff --git a/kernel/audit.c b/kernel/audit.c
index aaf74702e993..454473f2e193 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -307,6 +307,7 @@ int audit_alloc(struct task_struct *tsk)
 	rcu_read_lock();
 	info->cont = _audit_contobj_get(current);
 	rcu_read_unlock();
+	info->capcontid = 0;
 	tsk->audit = info;
 
 	ret = audit_alloc_syscall(tsk);
@@ -322,6 +323,7 @@ struct audit_task_info init_struct_audit = {
 	.loginuid = INVALID_UID,
 	.sessionid = AUDIT_SID_UNSET,
 	.cont = NULL,
+	.capcontid = 0,
 #ifdef CONFIG_AUDITSYSCALL
 	.ctx = NULL,
 #endif
@@ -2763,6 +2765,40 @@ static bool audit_contid_isnesting(struct task_struct *tsk)
 	return !isowner && ownerisparent;
 }
 
+int audit_set_capcontid(struct task_struct *task, u32 enable)
+{
+	u32 oldcapcontid;
+	int rc = 0;
+	struct audit_buffer *ab;
+
+	if (!task->audit)
+		return -ENOPROTOOPT;
+	oldcapcontid = audit_get_capcontid(task);
+	/* if task is not descendant, block */
+	if (task == current || !task_is_descendant(current, task))
+		rc = -EXDEV;
+	else if (current_user_ns() == &init_user_ns) {
+		if (!capable(CAP_AUDIT_CONTROL) &&
+		    !audit_get_capcontid(current))
+			rc = -EPERM;
+	}
+	if (!rc)
+		task->audit->capcontid = enable;
+
+	if (!audit_enabled)
+		return rc;
+
+	ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_SET_CAPCONTID);
+	if (!ab)
+		return rc;
+
+	audit_log_format(ab,
+			 "opid=%d capcontid=%u old-capcontid=%u",
+			 task_tgid_nr(task), enable, oldcapcontid);
+	audit_log_end(ab);
+	return rc;
+}
+
 /*
  * audit_set_contid - set current task's audit contid
  * @task: target task
@@ -2795,7 +2831,7 @@ int audit_set_contid(struct task_struct *task, u64 contid)
 		goto unlock;
 	}
 	/* if we don't have caps, reject */
-	if (!capable(CAP_AUDIT_CONTROL)) {
+	if (!capable(CAP_AUDIT_CONTROL) && !audit_get_capcontid(current)) {
 		rc = -EPERM;
 		goto unlock;
 	}
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


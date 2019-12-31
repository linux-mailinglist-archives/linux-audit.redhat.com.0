Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 235D912DBA0
	for <lists+linux-audit@lfdr.de>; Tue, 31 Dec 2019 20:53:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577821991;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=nVSuGTQ/lrF45qWfzABsmjQGvc4oQUls8nDMfxts0XY=;
	b=Yorq+Srb/ROvBYBFQYg2hYWB3W7lIjw0nyi2CO3IrSEXAjp2/rNdqDN6XyUTy6zehfsD7e
	GfnON3k72vs8JebjrndyaFNtsknWkm39ZCIRbCQcUySwAZEFmt4ShPpD70Ns/XSMs+oVMK
	PPsvoQ2ixsZCiSbzvQSmpHC/hdofA8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-7CRQYErBMHWlk38mZWpiIg-1; Tue, 31 Dec 2019 14:51:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F9CA800D54;
	Tue, 31 Dec 2019 19:51:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26EDC5C3FD;
	Tue, 31 Dec 2019 19:51:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E5F44819C9;
	Tue, 31 Dec 2019 19:51:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBVJpeKw032539 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 31 Dec 2019 14:51:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2D23A82A07; Tue, 31 Dec 2019 19:51:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-15.phx2.redhat.com [10.3.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D66167673;
	Tue, 31 Dec 2019 19:51:35 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org, linux-api@vger.kernel.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	linux-fsdevel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak90 V8 16/16] audit: add capcontid to set contid outside
	init_user_ns
Date: Tue, 31 Dec 2019 14:48:29 -0500
Message-Id: <5941671b6b6b5de28ab2cc80e72f288cf83291d5.1577736799.git.rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 7CRQYErBMHWlk38mZWpiIg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide a mechanism similar to CAP_AUDIT_CONTROL to explicitly give a
process in a non-init user namespace the capability to set audit
container identifiers.

Provide /proc/$PID/audit_capcontid interface to capcontid.
Valid values are: 1==enabled, 0==disabled

Report this action in message type AUDIT_SET_CAPCONTID 1022 with fields
opid= capcontid= old-capcontid=

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 fs/proc/base.c             | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/audit.h      | 14 ++++++++++++
 include/uapi/linux/audit.h |  1 +
 kernel/audit.c             | 35 +++++++++++++++++++++++++++++
 4 files changed, 105 insertions(+)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index 26091800180c..283ef8e006e7 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -1360,6 +1360,59 @@ static ssize_t proc_contid_write(struct file *file, const char __user *buf,
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
@@ -3121,6 +3174,7 @@ static int proc_stack_depth(struct seq_file *m, struct pid_namespace *ns,
 	REG("loginuid",   S_IWUSR|S_IRUGO, proc_loginuid_operations),
 	REG("sessionid",  S_IRUGO, proc_sessionid_operations),
 	REG("audit_containerid", S_IWUSR|S_IRUSR, proc_contid_operations),
+	REG("audit_capcontainerid", S_IWUSR|S_IRUSR|S_IRUSR, proc_capcontid_operations),
 #endif
 #ifdef CONFIG_FAULT_INJECTION
 	REG("make-it-fail", S_IRUGO|S_IWUSR, proc_fault_inject_operations),
@@ -3522,6 +3576,7 @@ static int proc_tid_comm_permission(struct inode *inode, int mask)
 	REG("loginuid",  S_IWUSR|S_IRUGO, proc_loginuid_operations),
 	REG("sessionid",  S_IRUGO, proc_sessionid_operations),
 	REG("audit_containerid", S_IWUSR|S_IRUSR, proc_contid_operations),
+	REG("audit_capcontainerid", S_IWUSR|S_IRUSR|S_IRUSR, proc_capcontid_operations),
 #endif
 #ifdef CONFIG_FAULT_INJECTION
 	REG("make-it-fail", S_IRUGO|S_IWUSR, proc_fault_inject_operations),
diff --git a/include/linux/audit.h b/include/linux/audit.h
index 28b9c7cd86a6..62c453306c2a 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -116,6 +116,7 @@ struct audit_task_info {
 	kuid_t			loginuid;
 	unsigned int		sessionid;
 	struct audit_contobj	*cont;
+	u32			capcontid;
 #ifdef CONFIG_AUDITSYSCALL
 	struct audit_context	*ctx;
 #endif
@@ -224,6 +225,14 @@ static inline unsigned int audit_get_sessionid(struct task_struct *tsk)
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
@@ -305,6 +314,11 @@ static inline unsigned int audit_get_sessionid(struct task_struct *tsk)
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
index 2844d78cd7af..01251e6dcec0 100644
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
index 1287f0b63757..1c22dd084ae8 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2698,6 +2698,41 @@ static bool audit_contid_isowner(struct task_struct *tsk)
 	return false;
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
+	if (task == current)
+		rc = -EBADSLT;
+	else if (!task_is_descendant(current, task))
+		rc = -EXDEV;
+	else if (current_user_ns() == &init_user_ns) {
+		if (!capable(CAP_AUDIT_CONTROL) && !audit_get_capcontid(current))
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
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


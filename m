Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA1F19C3B5
	for <lists+linux-audit@lfdr.de>; Thu,  2 Apr 2020 16:14:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585836861;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qx1mJckKo26HseYuGSGUEScwyDCM2ya+ra4NvqOS+Zc=;
	b=Q9bkOaGnDG7+wJLn4ELz7OuIgkrbOh9YmD/m74BQVv1HdGiukWyEhod21vtComVut2COZl
	B3g6AUoXrujsYlmm/fzW9rsoaXeZf8Q9z2Xuv5jDdMLqefwk0bATC+HPA0yAdVUvIJiDkf
	CctjVKzFqp2qGQv1UMSF5eHVDdHJF9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-vT1FqG4SOzGHxkD1KjAO3A-1; Thu, 02 Apr 2020 10:14:19 -0400
X-MC-Unique: vT1FqG4SOzGHxkD1KjAO3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB2A2801E7A;
	Thu,  2 Apr 2020 14:14:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3D9E391;
	Thu,  2 Apr 2020 14:14:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40034944C6;
	Thu,  2 Apr 2020 14:14:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 032EDxJA031303 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 2 Apr 2020 10:13:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A326101D48A; Thu,  2 Apr 2020 14:13:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from rules.brq.redhat.com (unknown [10.40.193.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 135CC1001B2D;
	Thu,  2 Apr 2020 14:13:31 +0000 (UTC)
From: Vladis Dronov <vdronov@redhat.com>
To: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>,
	linux-audit@redhat.com, James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH ghak96] audit: set cwd in audit context for file-related LSM
	audit records
Date: Thu,  2 Apr 2020 16:13:19 +0200
Message-Id: <20200402141319.28714-1-vdronov@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Set a current working directory in an audit context for the following record
types in dump_common_audit_data(): LSM_AUDIT_DATA_PATH, LSM_AUDIT_DATA_FILE,
LSM_AUDIT_DATA_IOCTL_OP, LSM_AUDIT_DATA_DENTRY, LSM_AUDIT_DATA_INODE so a
separate CWD record is emitted later.

Link: https://github.com/linux-audit/audit-kernel/issues/96
Signed-off-by: Vladis Dronov <vdronov@redhat.com>
---
out-of-commit-message-note:

Hello,
Honestly, I'm not sure about "if (!context->in_syscall)" check in
__audit_getcwd(). It was copied from __audit_getname() and I do
not quite understand why it is there and if __audit_getcwd() needs
it. If you have an idea on this, could you please, tell?

 include/linux/audit.h |  9 ++++++++-
 kernel/auditsc.c      | 17 +++++++++++++++++
 security/lsm_audit.c  |  5 +++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index f9ceae57ca8d..b4306abc5891 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -268,7 +268,7 @@ extern void __audit_syscall_entry(int major, unsigned long a0, unsigned long a1,
 extern void __audit_syscall_exit(int ret_success, long ret_value);
 extern struct filename *__audit_reusename(const __user char *uptr);
 extern void __audit_getname(struct filename *name);
-
+extern void __audit_getcwd(void);
 extern void __audit_inode(struct filename *name, const struct dentry *dentry,
 				unsigned int flags);
 extern void __audit_file(const struct file *);
@@ -327,6 +327,11 @@ static inline void audit_getname(struct filename *name)
 	if (unlikely(!audit_dummy_context()))
 		__audit_getname(name);
 }
+static inline void audit_getcwd(void)
+{
+	if (unlikely(!audit_dummy_context()))
+		__audit_getcwd();
+}
 static inline void audit_inode(struct filename *name,
 				const struct dentry *dentry,
 				unsigned int aflags) {
@@ -545,6 +550,8 @@ static inline struct filename *audit_reusename(const __user char *name)
 }
 static inline void audit_getname(struct filename *name)
 { }
+static inline void audit_getcwd(void)
+{ }
 static inline void __audit_inode(struct filename *name,
 					const struct dentry *dentry,
 					unsigned int flags)
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 814406a35db1..16316032ef9f 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1890,6 +1890,23 @@ void __audit_getname(struct filename *name)
 		get_fs_pwd(current->fs, &context->pwd);
 }
 
+/**
+ * __audit_getcwd - set a current working directory
+ *
+ * Set a current working directory of an audited process for this context.
+ * Called from security/lsm_audit.c:dump_common_audit_data().
+ */
+void __audit_getcwd(void)
+{
+	struct audit_context *context = audit_context();
+
+	if (!context->in_syscall)
+		return;
+
+	if (!context->pwd.dentry)
+		get_fs_pwd(current->fs, &context->pwd);
+}
+
 static inline int audit_copy_fcaps(struct audit_names *name,
 				   const struct dentry *dentry)
 {
diff --git a/security/lsm_audit.c b/security/lsm_audit.c
index 2d2bf49016f4..7c555621c2bd 100644
--- a/security/lsm_audit.c
+++ b/security/lsm_audit.c
@@ -241,6 +241,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
 			audit_log_untrustedstring(ab, inode->i_sb->s_id);
 			audit_log_format(ab, " ino=%lu", inode->i_ino);
 		}
+		audit_getcwd();
 		break;
 	}
 	case LSM_AUDIT_DATA_FILE: {
@@ -254,6 +255,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
 			audit_log_untrustedstring(ab, inode->i_sb->s_id);
 			audit_log_format(ab, " ino=%lu", inode->i_ino);
 		}
+		audit_getcwd();
 		break;
 	}
 	case LSM_AUDIT_DATA_IOCTL_OP: {
@@ -269,6 +271,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
 		}
 
 		audit_log_format(ab, " ioctlcmd=0x%hx", a->u.op->cmd);
+		audit_getcwd();
 		break;
 	}
 	case LSM_AUDIT_DATA_DENTRY: {
@@ -283,6 +286,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
 			audit_log_untrustedstring(ab, inode->i_sb->s_id);
 			audit_log_format(ab, " ino=%lu", inode->i_ino);
 		}
+		audit_getcwd();
 		break;
 	}
 	case LSM_AUDIT_DATA_INODE: {
@@ -300,6 +304,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
 		audit_log_format(ab, " dev=");
 		audit_log_untrustedstring(ab, inode->i_sb->s_id);
 		audit_log_format(ab, " ino=%lu", inode->i_ino);
+		audit_getcwd();
 		break;
 	}
 	case LSM_AUDIT_DATA_TASK: {
-- 
2.20.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E4EA1213DC8
	for <lists+linux-audit@lfdr.de>; Fri,  3 Jul 2020 18:57:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593795436;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EKw8DgqkZvjF+8inzXe+ikpqXjW8s1h5aIozqH+tzS4=;
	b=K8N+KQfJro+7VeL4S9ikoK4tq8Xa3O6i18bwF+28rbJBX8oICxCaDwYKCpFZKkbLup0Awy
	4te9vIvaYIi2fxFY66uuuPEntZRkd3RtVrinvMuMxTn64a7dWUgCXBTXdQvhdp4uzXR1Nc
	I4dvkKLg1hKSmulx+NhK+1Dclv1EpyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-JMr9pz2YPNu29tgXxv2mAg-1; Fri, 03 Jul 2020 12:57:14 -0400
X-MC-Unique: JMr9pz2YPNu29tgXxv2mAg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B3D4800C60;
	Fri,  3 Jul 2020 16:57:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2568610013D4;
	Fri,  3 Jul 2020 16:57:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40ACE1809547;
	Fri,  3 Jul 2020 16:56:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063GulVX030827 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 12:56:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5926B10013D4; Fri,  3 Jul 2020 16:56:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C05310013D9;
	Fri,  3 Jul 2020 16:56:44 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Security Module list <linux-security-module@vger.kernel.org>
Subject: [PATCH ghak96 v3] audit: issue CWD record to accompany
	LSM_AUDIT_DATA_* records
Date: Fri,  3 Jul 2020 12:56:19 -0400
Message-Id: <878ac79163e31142963f1cd4f743599c35b6754a.1593691408.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, eparis@parisplace.org,
	john.johansen@canonical.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The LSM_AUDIT_DATA_* records for PATH, FILE, IOCTL_OP, DENTRY and INODE
are incomplete without the task context of the AUDIT Current Working
Directory record.  Add it.

This record addition can't use audit_dummy_context to determine whether
or not to store the record information since the LSM_AUDIT_DATA_*
records are initiated by various LSMs independent of any audit rules.
context->in_syscall is used to determine if it was called in user
context like audit_getname.

Please see the upstream issue
https://github.com/linux-audit/audit-kernel/issues/96

Adapted from Vladis Dronov's v2 patch.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
Passes audit-testsuite.

Changelog:
v3
- adapt and refactor__audit_getname, don't key on dummy

v2
2020-04-02 vdronov https://www.redhat.com/archives/linux-audit/2020-April/msg00004.html
- convert to standalone CWD record

v1:
2020-03-24 vdronov https://github.com/nefigtut/audit-kernel/commit/df0b55b7ab84e1c9faa588b08e547e604bf25c87
- add cwd= field to LSM record

 include/linux/audit.h |  9 ++++++++-
 kernel/auditsc.c      | 17 +++++++++++++++--
 security/lsm_audit.c  |  5 +++++
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 03c4035a532b..bb850d588e1c 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -292,7 +292,7 @@ extern void __audit_syscall_entry(int major, unsigned long a0, unsigned long a1,
 extern void __audit_syscall_exit(int ret_success, long ret_value);
 extern struct filename *__audit_reusename(const __user char *uptr);
 extern void __audit_getname(struct filename *name);
-
+extern void __audit_getcwd(void);
 extern void __audit_inode(struct filename *name, const struct dentry *dentry,
 				unsigned int flags);
 extern void __audit_file(const struct file *);
@@ -351,6 +351,11 @@ static inline void audit_getname(struct filename *name)
 	if (unlikely(!audit_dummy_context()))
 		__audit_getname(name);
 }
+static inline void audit_getcwd(void)
+{
+	if (unlikely(audit_context()))
+		__audit_getcwd();
+}
 static inline void audit_inode(struct filename *name,
 				const struct dentry *dentry,
 				unsigned int aflags) {
@@ -579,6 +584,8 @@ static inline struct filename *audit_reusename(const __user char *name)
 }
 static inline void audit_getname(struct filename *name)
 { }
+static inline void audit_getcwd(void)
+{ }
 static inline void audit_inode(struct filename *name,
 				const struct dentry *dentry,
 				unsigned int aflags)
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 3a9100e95fda..934ab5b8c1c5 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1891,6 +1891,20 @@ struct filename *
 	return NULL;
 }
 
+inline void _audit_getcwd(struct audit_context *context)
+{
+	if (!context->pwd.dentry)
+		get_fs_pwd(current->fs, &context->pwd);
+}
+
+void __audit_getcwd(void)
+{
+	struct audit_context *context = audit_context();
+
+	if (context->in_syscall)
+		_audit_getcwd(context);
+}
+
 /**
  * __audit_getname - add a name to the list
  * @name: name to add
@@ -1915,8 +1929,7 @@ void __audit_getname(struct filename *name)
 	name->aname = n;
 	name->refcnt++;
 
-	if (!context->pwd.dentry)
-		get_fs_pwd(current->fs, &context->pwd);
+	_audit_getcwd(context);
 }
 
 static inline int audit_copy_fcaps(struct audit_names *name,
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
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


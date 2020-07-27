Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 58E8522FB69
	for <lists+linux-audit@lfdr.de>; Mon, 27 Jul 2020 23:30:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595885448;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SfzY/arSUN766F1Mo/q9XAVKTs2DTiVR2n/XTgH3244=;
	b=K2AgzwsR7YIohky94MLy4MiG1tLKtjLcwRq7s6tDzpsXkDCGTqVOzM0giwKUyDvq35ILnc
	yVy1WnNFM6bgEkZaCi9L84rqYgWbwgKGSJPTh99jd7+4TpZ8GD1nxaisAodsfN/+woUnqO
	zY7zmlsmQsZGp+S9BtOnrtDhkdid4x0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-vvtc7XXeNOej9C_3y_kAqA-1; Mon, 27 Jul 2020 17:30:46 -0400
X-MC-Unique: vvtc7XXeNOej9C_3y_kAqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1623D800460;
	Mon, 27 Jul 2020 21:30:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96B36726B6;
	Mon, 27 Jul 2020 21:30:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C34701809554;
	Mon, 27 Jul 2020 21:30:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06RLUXMO007929 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 17:30:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8A08C1002382; Mon, 27 Jul 2020 21:30:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFBAC10013C4;
	Mon, 27 Jul 2020 21:30:25 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Security Module list <linux-security-module@vger.kernel.org>
Subject: [PATCH V3fix ghak120] audit: initialize context values in case of
	mandatory events
Date: Mon, 27 Jul 2020 17:29:59 -0400
Message-Id: <e3e9c9da9115fd233c5a7895dbb4a698a365b1b0.1595884394.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, eparis@parisplace.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Issue ghak120 enabled syscall records to accompany required records when
no rules are present to trigger the storage of syscall context.  A
reported issue showed that the cwd was not always initialized.  That
issue was already resolved, but a review of all other records that could
be triggered at the time of a syscall record revealed other potential
values that could be missing or misleading.  Initialize them.

The fds array is reset to -1 after the first syscall to indicate it
isn't valid any more, but was never set to -1 when the context was
allocated to indicate it wasn't yet valid.

The audit_inode* functions can be called without going through
getname_flags() or getname_kernel() that sets audit_names and cwd, so
set the cwd if it has not already been done so due to audit_names being
valid.

The LSM dump_common_audit_data() LSM_AUDIT_DATA_NET:AF_UNIX case was
missed with the ghak96 patch, so add that case here.

Please see issue https://github.com/linux-audit/audit-kernel/issues/120
Please see issue https://github.com/linux-audit/audit-kernel/issues/96
Passes audit-testsuite.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 kernel/auditsc.c     | 3 +++
 security/lsm_audit.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 6884b50069d1..2f97618e6a34 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -929,6 +929,7 @@ static inline struct audit_context *audit_alloc_context(enum audit_state state)
 	context->prio = state == AUDIT_RECORD_CONTEXT ? ~0ULL : 0;
 	INIT_LIST_HEAD(&context->killed_trees);
 	INIT_LIST_HEAD(&context->names_list);
+	context->fds[0] = -1;
 	return context;
 }
 
@@ -2076,6 +2077,7 @@ void __audit_inode(struct filename *name, const struct dentry *dentry,
 	}
 	handle_path(dentry);
 	audit_copy_inode(n, dentry, inode, flags & AUDIT_INODE_NOEVAL);
+	_audit_getcwd(context);
 }
 
 void __audit_file(const struct file *file)
@@ -2194,6 +2196,7 @@ void __audit_inode_child(struct inode *parent,
 		audit_copy_inode(found_child, dentry, inode, 0);
 	else
 		found_child->ino = AUDIT_INO_UNSET;
+	_audit_getcwd(context);
 }
 EXPORT_SYMBOL_GPL(__audit_inode_child);
 
diff --git a/security/lsm_audit.c b/security/lsm_audit.c
index 53d0d183db8f..e93077612246 100644
--- a/security/lsm_audit.c
+++ b/security/lsm_audit.c
@@ -369,6 +369,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
 					audit_log_untrustedstring(ab, p);
 				else
 					audit_log_n_hex(ab, p, len);
+				audit_getcwd();
 				break;
 			}
 		}
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


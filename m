Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6121B4508
	for <lists+linux-audit@lfdr.de>; Wed, 22 Apr 2020 14:25:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587558340;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GVgQx7Tr9/ANtpOF4t3IUkjg4lbGxA/HJy2aHAbuLGA=;
	b=Yos8C3J6kbgyuXBHONV46OF47l/99P+6BAdQQnDnbNFlEUPWK66CS90+REof2gkLjloF1l
	nxLoXd7Fnqwm37DqWZKdyJGA8TUoGvc3AVHecumAqG1xMw+dHuifMQdqKyHs6U5wu14BmJ
	JRE8h4w+4klvZxYnUn7zIo9wZgjPZUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-yAMXaf91NGCO3Ji_2dFrbg-1; Wed, 22 Apr 2020 08:25:38 -0400
X-MC-Unique: yAMXaf91NGCO3Ji_2dFrbg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABCDB8017FC;
	Wed, 22 Apr 2020 12:25:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 735715C1D4;
	Wed, 22 Apr 2020 12:25:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65146941BE;
	Wed, 22 Apr 2020 12:25:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03M6R4N5008172 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 02:27:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A008512172E6; Wed, 22 Apr 2020 06:27:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BCAD12172F0
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 06:27:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F11686BCCF
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 06:27:02 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-509-mpeVEy3iMf6y82yxCaZ8wQ-1; Wed, 22 Apr 2020 02:26:59 -0400
X-MC-Unique: mpeVEy3iMf6y82yxCaZ8wQ-1
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id E0A2B3AF72C7985D68D7;
	Wed, 22 Apr 2020 14:10:51 +0800 (CST)
Received: from DESKTOP-KBFSBNP.china.huawei.com (10.67.101.172) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.487.0; Wed, 22 Apr 2020 14:10:50 +0800
From: Yiwen Gu <guyiwen@huawei.com>
To: <paul@paul-moore.com>, <eparis@redhat.com>
Subject: [PATCH] audit: allow audit_reusename to check kernel path
Date: Wed, 22 Apr 2020 14:10:47 +0800
Message-ID: <1587535847-37776-1-git-send-email-guyiwen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.101.172]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03M6R4N5008172
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 22 Apr 2020 08:24:52 -0400
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, audit_reusename check file path only by comparing
userspace pointer "uptr", without checking the situation where
the file name is different with the same uptr.

Add kname into audit_reusename function to check file names
from the audit_names list.

Signed-off-by: Yiwen Gu <guyiwen@huawei.com>
---
 fs/namei.c            |  9 +++++----
 include/linux/audit.h | 11 +++++++----
 kernel/auditsc.c      |  7 ++++---
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index db6565c99825..d5fb4bd12aec 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -128,13 +128,10 @@ struct filename *
 getname_flags(const char __user *filename, int flags, int *empty)
 {
 	struct filename *result;
+	struct filename *result_audit;
 	char *kname;
 	int len;
 
-	result = audit_reusename(filename);
-	if (result)
-		return result;
-
 	result = __getname();
 	if (unlikely(!result))
 		return ERR_PTR(-ENOMEM);
@@ -197,6 +194,10 @@ getname_flags(const char __user *filename, int flags, int *empty)
 		}
 	}
 
+	result_audit = audit_reusename(filename, kname);
+	if (result_audit)
+		return result_audit;
+
 	result->uptr = filename;
 	result->aname = NULL;
 	audit_getname(result);
diff --git a/include/linux/audit.h b/include/linux/audit.h
index f9ceae57ca8d..71fb783f14c4 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -266,7 +266,8 @@ extern void __audit_free(struct task_struct *task);
 extern void __audit_syscall_entry(int major, unsigned long a0, unsigned long a1,
 				  unsigned long a2, unsigned long a3);
 extern void __audit_syscall_exit(int ret_success, long ret_value);
-extern struct filename *__audit_reusename(const __user char *uptr);
+extern struct filename *__audit_reusename(const __user char *uptr,
+				const char *kname);
 extern void __audit_getname(struct filename *name);
 
 extern void __audit_inode(struct filename *name, const struct dentry *dentry,
@@ -316,10 +317,11 @@ static inline void audit_syscall_exit(void *pt_regs)
 		__audit_syscall_exit(success, return_code);
 	}
 }
-static inline struct filename *audit_reusename(const __user char *name)
+static inline struct filename *audit_reusename(const __user char *name,
+						const char *kname)
 {
 	if (unlikely(!audit_dummy_context()))
-		return __audit_reusename(name);
+		return __audit_reusename(name, kname);
 	return NULL;
 }
 static inline void audit_getname(struct filename *name)
@@ -539,7 +541,8 @@ static inline struct audit_context *audit_context(void)
 {
 	return NULL;
 }
-static inline struct filename *audit_reusename(const __user char *name)
+static inline struct filename *audit_reusename(const __user char *name,
+						const char *kname)
 {
 	return NULL;
 }
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 4effe01ebbe2..62ffc02abb98 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1843,13 +1843,14 @@ static struct audit_names *audit_alloc_name(struct audit_context *context,
 /**
  * __audit_reusename - fill out filename with info from existing entry
  * @uptr: userland ptr to pathname
+ * @kname: kernel pathname string
  *
  * Search the audit_names list for the current audit context. If there is an
- * existing entry with a matching "uptr" then return the filename
+ * existing entry with matching "uptr" and "kname" then return the filename
  * associated with that audit_name. If not, return NULL.
  */
 struct filename *
-__audit_reusename(const __user char *uptr)
+__audit_reusename(const __user char *uptr, const char *kname)
 {
 	struct audit_context *context = audit_context();
 	struct audit_names *n;
@@ -1857,7 +1858,7 @@ __audit_reusename(const __user char *uptr)
 	list_for_each_entry(n, &context->names_list, list) {
 		if (!n->name)
 			continue;
-		if (n->name->uptr == uptr) {
+		if (n->name->uptr == uptr && !strcmp(kname, n->name->name)) {
 			n->name->refcnt++;
 			return n->name;
 		}
-- 
2.17.1



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


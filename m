Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CD6BD1E07DE
	for <lists+linux-audit@lfdr.de>; Mon, 25 May 2020 09:22:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590391375;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VxK9PB9D9foyglsThIZmkhx/EWpC4j0nSvtSPjek40k=;
	b=V7XeXPsJX7qSHjF+D2favXk+Bm9Fp1yd8uQDD8ZSJ3cExbEfwpM8orMWW9VPu3t8bqrsxI
	opJzHj1wrFtOiEwgNBtywoLUWs6WQBU2TTULw1VpAWl0LwqOpkPALRdg4BF0kwSfkS5ha3
	BajMJAR60CSrYmNX4neCjwQsafvqo8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-S3PBR_b0MsSlULTEOqXyAw-1; Mon, 25 May 2020 03:22:53 -0400
X-MC-Unique: S3PBR_b0MsSlULTEOqXyAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D36B1005512;
	Mon, 25 May 2020 07:22:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 686125D9DC;
	Mon, 25 May 2020 07:22:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59F6454D25;
	Mon, 25 May 2020 07:22:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04P7MHra021305 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 25 May 2020 03:22:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 047B42157F24; Mon, 25 May 2020 07:22:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA8142166BA0
	for <linux-audit@redhat.com>; Mon, 25 May 2020 07:22:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4FA5833B49
	for <linux-audit@redhat.com>; Mon, 25 May 2020 07:22:13 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-265-G_RMCx8EO1C5fRRpYHOd3g-1; Mon, 25 May 2020 03:22:10 -0400
X-MC-Unique: G_RMCx8EO1C5fRRpYHOd3g-1
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 153A8ACAF90B1FD35C81;
	Mon, 25 May 2020 15:22:05 +0800 (CST)
Received: from DESKTOP-KBFSBNP.china.huawei.com (10.67.101.172) by
	DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 25 May 2020 15:22:03 +0800
From: Yiwen Gu <guyiwen@huawei.com>
To: <paul@paul-moore.com>, <eparis@redhat.com>
Subject: [PATCH] audit: allow audit_reusename to check kernel path
Date: Mon, 25 May 2020 15:21:57 +0800
Message-ID: <1590391317-71528-2-git-send-email-guyiwen@huawei.com>
In-Reply-To: <1590391317-71528-1-git-send-email-guyiwen@huawei.com>
References: <1590391317-71528-1-git-send-email-guyiwen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.101.172]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 fs/namei.c            | 11 +++++++----
 include/linux/audit.h | 11 +++++++----
 kernel/auditsc.c      |  7 ++++---
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index db6565c99825..c5623858f3e2 100644
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
@@ -197,6 +194,12 @@ getname_flags(const char __user *filename, int flags, int *empty)
 		}
 	}
 
+	result_audit = audit_reusename(filename, kname);
+	if (result_audit) {
+		putname(result);
+		return result_audit;
+	}
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


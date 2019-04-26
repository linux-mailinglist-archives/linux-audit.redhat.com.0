Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0E1B453
	for <lists+linux-audit@lfdr.de>; Sat, 27 Apr 2019 20:35:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D85A308A968;
	Sat, 27 Apr 2019 18:35:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A1BD1812A;
	Sat, 27 Apr 2019 18:35:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C15A41F3F;
	Sat, 27 Apr 2019 18:35:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3QIT8Lq011286 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 26 Apr 2019 14:29:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2419727BA5; Fri, 26 Apr 2019 18:29:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE866277DD;
	Fri, 26 Apr 2019 18:29:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F48430A04E7;
	Fri, 26 Apr 2019 18:29:01 +0000 (UTC)
Received: from tleilax.poochiereds.net (cpe-71-70-156-158.nc.res.rr.com
	[71.70.156.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id AE81A21655;
	Fri, 26 Apr 2019 18:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556303337;
	bh=qPguXvk3S40sXOgTeAXxt29eR11ACNXOhNQRyIoZS7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iBRasJCyL4p+vhW0pIUG8ly+IDXVGFUojd110zzACOkg6/Acop5Qe3hxZWPV7bLC6
	Hj9KFqPyudUOMKklwD6GVJfukmZdaqe5Y0j0Qh0GxIvheRg65t1Dmo3Wrbzutqs0eC
	RM5db/pAiEzJDatZjRg0zNczopQ6Fr60Fbig2lFI=
From: Jeff Layton <jlayton@kernel.org>
To: viro@zeniv.linux.org.uk
Subject: [PATCH 5/5] audit: fix audit_compare_dname_path to take a qstr
Date: Fri, 26 Apr 2019 14:28:47 -0400
Message-Id: <20190426182847.25088-6-jlayton@kernel.org>
In-Reply-To: <20190426182847.25088-1-jlayton@kernel.org>
References: <20190426182847.25088-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 26 Apr 2019 18:29:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Fri, 26 Apr 2019 18:29:01 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'jlayton@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.102  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sat, 27 Apr 2019 14:35:10 -0400
Cc: jack@suse.cz, miklos@szeredi.hu, gregkh@linuxfoundation.org,
	amir73il@gmail.com, linux-kernel@vger.kernel.org, tj@kernel.org,
	linux-audit@redhat.com, linux-fsdevel@vger.kernel.org, rafael@kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Sat, 27 Apr 2019 18:35:33 +0000 (UTC)

...and eliminate its strlen call.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 kernel/audit.h          | 3 ++-
 kernel/audit_fsnotify.c | 2 +-
 kernel/audit_watch.c    | 6 +++---
 kernel/auditfilter.c    | 7 ++++---
 kernel/auditsc.c        | 7 +++----
 5 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/kernel/audit.h b/kernel/audit.h
index 958d5b8fc1b3..8c581fd38050 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -231,7 +231,8 @@ extern int audit_comparator(const u32 left, const u32 op, const u32 right);
 extern int audit_uid_comparator(kuid_t left, u32 op, kuid_t right);
 extern int audit_gid_comparator(kgid_t left, u32 op, kgid_t right);
 extern int parent_len(const char *path);
-extern int audit_compare_dname_path(const char *dname, const char *path, int plen);
+extern int audit_compare_dname_path(const struct qstr *dname, const char *path,
+				    int plen);
 extern struct sk_buff *audit_make_reply(int seq, int type, int done, int multi,
 					const void *payload, int size);
 extern void		    audit_panic(const char *message);
diff --git a/kernel/audit_fsnotify.c b/kernel/audit_fsnotify.c
index 6def7f426ba6..af281e965d24 100644
--- a/kernel/audit_fsnotify.c
+++ b/kernel/audit_fsnotify.c
@@ -188,7 +188,7 @@ static int audit_mark_handle_event(struct fsnotify_group *group,
 	}
 
 	if (mask & (FS_CREATE|FS_MOVED_TO|FS_DELETE|FS_MOVED_FROM)) {
-		if (audit_compare_dname_path(dname->name, audit_mark->path,
+		if (audit_compare_dname_path(dname, audit_mark->path,
 					     AUDIT_NAME_FULL))
 			return 0;
 		audit_update_mark(audit_mark, inode);
diff --git a/kernel/audit_watch.c b/kernel/audit_watch.c
index 3c12fd5b680e..b50c574223fa 100644
--- a/kernel/audit_watch.c
+++ b/kernel/audit_watch.c
@@ -255,7 +255,7 @@ static void audit_watch_log_rule_change(struct audit_krule *r, struct audit_watc
 
 /* Update inode info in audit rules based on filesystem event. */
 static void audit_update_watch(struct audit_parent *parent,
-			       const char *dname, dev_t dev,
+			       const struct qstr *dname, dev_t dev,
 			       unsigned long ino, unsigned invalidating)
 {
 	struct audit_watch *owatch, *nwatch, *nextw;
@@ -507,9 +507,9 @@ static int audit_watch_handle_event(struct fsnotify_group *group,
 	}
 
 	if (mask & (FS_CREATE|FS_MOVED_TO) && inode)
-		audit_update_watch(parent, dname->name, inode->i_sb->s_dev, inode->i_ino, 0);
+		audit_update_watch(parent, dname, inode->i_sb->s_dev, inode->i_ino, 0);
 	else if (mask & (FS_DELETE|FS_MOVED_FROM))
-		audit_update_watch(parent, dname->name, AUDIT_DEV_UNSET, AUDIT_INO_UNSET, 1);
+		audit_update_watch(parent, dname, AUDIT_DEV_UNSET, AUDIT_INO_UNSET, 1);
 	else if (mask & (FS_DELETE_SELF|FS_UNMOUNT|FS_MOVE_SELF))
 		audit_remove_parent_watches(parent);
 
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 63f8b3f26fab..6f585b48f4ef 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1290,12 +1290,13 @@ int parent_len(const char *path)
  * @parentlen:	length of the parent if known. Passing in AUDIT_NAME_FULL
  * 		here indicates that we must compute this value.
  */
-int audit_compare_dname_path(const char *dname, const char *path, int parentlen)
+int audit_compare_dname_path(const struct qstr *dname, const char *path,
+			     int parentlen)
 {
 	int dlen, pathlen;
 	const char *p;
 
-	dlen = strlen(dname);
+	dlen = dname->len;
 	pathlen = strlen(path);
 	if (pathlen < dlen)
 		return 1;
@@ -1306,7 +1307,7 @@ int audit_compare_dname_path(const char *dname, const char *path, int parentlen)
 
 	p = path + parentlen;
 
-	return strncmp(p, dname, dlen);
+	return strncmp(p, dname->name, dlen);
 }
 
 int audit_filter(int msgtype, unsigned int listtype)
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index d1eab1d4a930..05e06b766af1 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2045,7 +2045,6 @@ void __audit_inode_child(struct inode *parent,
 {
 	struct audit_context *context = audit_context();
 	struct inode *inode = d_backing_inode(dentry);
-	const char *dname = dentry->d_name.name;
 	struct audit_names *n, *found_parent = NULL, *found_child = NULL;
 	struct audit_entry *e;
 	struct list_head *list = &audit_filter_list[AUDIT_FILTER_FS];
@@ -2083,7 +2082,7 @@ void __audit_inode_child(struct inode *parent,
 			continue;
 
 		if (n->ino == parent->i_ino && n->dev == parent->i_sb->s_dev &&
-		    !audit_compare_dname_path(dname,
+		    !audit_compare_dname_path(&dentry->d_name,
 					      n->name->name, n->name_len)) {
 			if (n->type == AUDIT_TYPE_UNKNOWN)
 				n->type = AUDIT_TYPE_PARENT;
@@ -2099,8 +2098,8 @@ void __audit_inode_child(struct inode *parent,
 		    (n->type != type && n->type != AUDIT_TYPE_UNKNOWN))
 			continue;
 
-		if (!strcmp(dname, n->name->name) ||
-		    !audit_compare_dname_path(dname, n->name->name,
+		if (!strcmp(dentry->d_name.name, n->name->name) ||
+		    !audit_compare_dname_path(&dentry->d_name, n->name->name,
 						found_parent ?
 						found_parent->name_len :
 						AUDIT_NAME_FULL)) {
-- 
2.20.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

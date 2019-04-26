Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A29B451
	for <lists+linux-audit@lfdr.de>; Sat, 27 Apr 2019 20:35:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA23B306973E;
	Sat, 27 Apr 2019 18:35:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5BC7607BA;
	Sat, 27 Apr 2019 18:35:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3EA82181AC42;
	Sat, 27 Apr 2019 18:35:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3QIT6qN011266 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 26 Apr 2019 14:29:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CFF065D9D6; Fri, 26 Apr 2019 18:29:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DACE5DF48;
	Fri, 26 Apr 2019 18:29:04 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67A7F780EE;
	Fri, 26 Apr 2019 18:28:55 +0000 (UTC)
Received: from tleilax.poochiereds.net (cpe-71-70-156-158.nc.res.rr.com
	[71.70.156.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B8B1920B7C;
	Fri, 26 Apr 2019 18:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556303335;
	bh=Tmqzy32XGQfb99U/hUBF1rbLUPylqVacMlS2Hrby3j4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WORJQH/P5NuYNOEARycZEMFB2PNYuFM/fkEPqczwA2glTHwA6o2J/VEHRLX/PEOIr
	XjBtBkMoanEhgfYC3+yliQE1RiOIBGYGCkkzPwmYaXYzAtf0zBUbkxbyBEGzQ3Y4tX
	FUIMitHRvjtJOd4bktPvQ4/aUmVB9V/ORdz9FtKE=
From: Jeff Layton <jlayton@kernel.org>
To: viro@zeniv.linux.org.uk
Subject: [PATCH 3/5] fsnotify: have fsnotify() take a qstr instead of a string
Date: Fri, 26 Apr 2019 14:28:45 -0400
Message-Id: <20190426182847.25088-4-jlayton@kernel.org>
In-Reply-To: <20190426182847.25088-1-jlayton@kernel.org>
References: <20190426182847.25088-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 26 Apr 2019 18:28:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Fri, 26 Apr 2019 18:28:55 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'jlayton@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.092  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_PASS,
	T_FILL_THIS_FORM_SHORT) 198.145.29.99 mail.kernel.org 198.145.29.99
	mail.kernel.org <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Sat, 27 Apr 2019 18:35:29 +0000 (UTC)

This means that kernfs_notify_workfn has to grow a strlen as well.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/kernfs/file.c                 |  6 ++++--
 fs/notify/fsnotify.c             |  8 ++++----
 include/linux/fsnotify.h         | 10 +++++-----
 include/linux/fsnotify_backend.h |  4 ++--
 4 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
index ae948aaa4c53..a43283c515f4 100644
--- a/fs/kernfs/file.c
+++ b/fs/kernfs/file.c
@@ -885,6 +885,8 @@ static void kernfs_notify_workfn(struct work_struct *work)
 	list_for_each_entry(info, &kernfs_root(kn)->supers, node) {
 		struct kernfs_node *parent;
 		struct inode *inode;
+		const struct qstr name = { .name = kn->name,
+					   .len  = strlen(kn->name) };
 
 		/*
 		 * We want fsnotify_modify() on @kn but as the
@@ -903,7 +905,7 @@ static void kernfs_notify_workfn(struct work_struct *work)
 			p_inode = ilookup(info->sb, parent->id.ino);
 			if (p_inode) {
 				fsnotify(p_inode, FS_MODIFY | FS_EVENT_ON_CHILD,
-					 inode, FSNOTIFY_EVENT_INODE, kn->name, 0);
+					 inode, FSNOTIFY_EVENT_INODE, &name, 0);
 				iput(p_inode);
 			}
 
@@ -911,7 +913,7 @@ static void kernfs_notify_workfn(struct work_struct *work)
 		}
 
 		fsnotify(inode, FS_MODIFY, inode, FSNOTIFY_EVENT_INODE,
-			 kn->name, 0);
+			 &name, 0);
 		iput(inode);
 	}
 
diff --git a/fs/notify/fsnotify.c b/fs/notify/fsnotify.c
index fb22f76329ae..9cbb5ae11d2f 100644
--- a/fs/notify/fsnotify.c
+++ b/fs/notify/fsnotify.c
@@ -179,10 +179,10 @@ int __fsnotify_parent(const struct path *path, struct dentry *dentry, __u32 mask
 		take_dentry_name_snapshot(&name, dentry);
 		if (path)
 			ret = fsnotify(p_inode, mask, path, FSNOTIFY_EVENT_PATH,
-				       name.name.name, 0);
+				       &name.name, 0);
 		else
 			ret = fsnotify(p_inode, mask, dentry->d_inode, FSNOTIFY_EVENT_INODE,
-				       name.name.name, 0);
+				       &name.name, 0);
 		release_dentry_name_snapshot(&name);
 	}
 
@@ -325,7 +325,7 @@ static void fsnotify_iter_next(struct fsnotify_iter_info *iter_info)
  * notification event in whatever means they feel necessary.
  */
 int fsnotify(struct inode *to_tell, __u32 mask, const void *data, int data_is,
-	     const unsigned char *file_name, u32 cookie)
+	     const struct qstr *file_name, u32 cookie)
 {
 	struct fsnotify_iter_info iter_info = {};
 	struct super_block *sb = to_tell->i_sb;
@@ -379,7 +379,7 @@ int fsnotify(struct inode *to_tell, __u32 mask, const void *data, int data_is,
 	 */
 	while (fsnotify_iter_select_report_types(&iter_info)) {
 		ret = send_to_group(to_tell, mask, data, data_is, cookie,
-				    file_name, &iter_info);
+				    file_name->name, &iter_info);
 
 		if (ret && (mask & ALL_FSNOTIFY_PERM_EVENTS))
 			goto out;
diff --git a/include/linux/fsnotify.h b/include/linux/fsnotify.h
index 2de90a7e388b..66e322df78a3 100644
--- a/include/linux/fsnotify.h
+++ b/include/linux/fsnotify.h
@@ -27,7 +27,7 @@ static inline int fsnotify_dirent(struct inode *dir, struct dentry *dentry,
 				  __u32 mask)
 {
 	return fsnotify(dir, mask, d_inode(dentry), FSNOTIFY_EVENT_INODE,
-			dentry->d_name.name, 0);
+			&dentry->d_name, 0);
 }
 
 /* Notify this dentry's parent about a child's events. */
@@ -122,9 +122,9 @@ static inline void fsnotify_move(struct inode *old_dir, struct inode *new_dir,
 	}
 
 	fsnotify(old_dir, old_dir_mask, source, FSNOTIFY_EVENT_INODE,
-		 old_name->name, fs_cookie);
+		 old_name, fs_cookie);
 	fsnotify(new_dir, new_dir_mask, source, FSNOTIFY_EVENT_INODE,
-		 moved->d_name.name, fs_cookie);
+		 &moved->d_name, fs_cookie);
 
 	if (target)
 		fsnotify_link_count(target);
@@ -177,7 +177,7 @@ static inline void fsnotify_nameremove(struct dentry *dentry, int isdir)
 	take_dentry_name_snapshot(&name, dentry);
 
 	fsnotify(d_inode(parent), mask, d_inode(dentry), FSNOTIFY_EVENT_INODE,
-		 name.name.name, 0);
+		 &name.name, 0);
 
 	release_dentry_name_snapshot(&name);
 	dput(parent);
@@ -217,7 +217,7 @@ static inline void fsnotify_link(struct inode *dir, struct inode *inode, struct
 	fsnotify_link_count(inode);
 	audit_inode_child(dir, new_dentry, AUDIT_TYPE_CHILD_CREATE);
 
-	fsnotify(dir, FS_CREATE, inode, FSNOTIFY_EVENT_INODE, new_dentry->d_name.name, 0);
+	fsnotify(dir, FS_CREATE, inode, FSNOTIFY_EVENT_INODE, &new_dentry->d_name, 0);
 }
 
 /*
diff --git a/include/linux/fsnotify_backend.h b/include/linux/fsnotify_backend.h
index dfc28fcb4de8..7eb7821766d5 100644
--- a/include/linux/fsnotify_backend.h
+++ b/include/linux/fsnotify_backend.h
@@ -350,7 +350,7 @@ struct fsnotify_mark {
 
 /* main fsnotify call to send events */
 extern int fsnotify(struct inode *to_tell, __u32 mask, const void *data, int data_is,
-		    const unsigned char *name, u32 cookie);
+		    const struct qstr *name, u32 cookie);
 extern int __fsnotify_parent(const struct path *path, struct dentry *dentry, __u32 mask);
 extern void __fsnotify_inode_delete(struct inode *inode);
 extern void __fsnotify_vfsmount_delete(struct vfsmount *mnt);
@@ -505,7 +505,7 @@ static inline void fsnotify_init_event(struct fsnotify_event *event,
 #else
 
 static inline int fsnotify(struct inode *to_tell, __u32 mask, const void *data, int data_is,
-			   const unsigned char *name, u32 cookie)
+			   const struct qstr *name, u32 cookie)
 {
 	return 0;
 }
-- 
2.20.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

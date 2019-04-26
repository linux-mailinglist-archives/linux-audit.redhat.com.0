Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 558A5B455
	for <lists+linux-audit@lfdr.de>; Sat, 27 Apr 2019 20:35:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5ECCC86675;
	Sat, 27 Apr 2019 18:35:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B89A18130;
	Sat, 27 Apr 2019 18:35:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F3170181AC42;
	Sat, 27 Apr 2019 18:35:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3QIT8d4011293 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 26 Apr 2019 14:29:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C84360FD9; Fri, 26 Apr 2019 18:29:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 325ED60E3D;
	Fri, 26 Apr 2019 18:29:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0C7C92A56;
	Fri, 26 Apr 2019 18:28:52 +0000 (UTC)
Received: from tleilax.poochiereds.net (cpe-71-70-156-158.nc.res.rr.com
	[71.70.156.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C63182146E;
	Fri, 26 Apr 2019 18:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556303332;
	bh=PhejF+uxD/AHiOpiaxpAzIe9h8Sj4miG+Hyie5o3Cco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eGuQeqOu5G6ShYokxkvA2F+UX3xSLZQOFY1MPpCN301MaVQ/SxGyCL9KcPaSZSMie
	25Y6Y4uaEc8YIiku1i81MChYxVy4Ut+ncJla+C/cJ0Qz6kx9QUerpMZU05xUj9b4LR
	ZTPSJrLbE6wCB5Z8IFORmjjzwE+w9lUol8HNKa4c=
From: Jeff Layton <jlayton@kernel.org>
To: viro@zeniv.linux.org.uk
Subject: [PATCH 1/5] dcache: track the length of the string in struct
	name_snapshot
Date: Fri, 26 Apr 2019 14:28:43 -0400
Message-Id: <20190426182847.25088-2-jlayton@kernel.org>
In-Reply-To: <20190426182847.25088-1-jlayton@kernel.org>
References: <20190426182847.25088-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 26 Apr 2019 18:28:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Fri, 26 Apr 2019 18:28:53 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'jlayton@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.092  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_PASS,
	T_FILL_THIS_FORM_SHORT) 198.145.29.99 mail.kernel.org 198.145.29.99
	mail.kernel.org <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Sat, 27 Apr 2019 18:35:36 +0000 (UTC)

Several existing callers end up having to strlen the string, so just
convert the code over to set up a qstr instead and copy the length
from the original.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/dcache.c              | 11 +++++++----
 fs/debugfs/inode.c       |  2 +-
 fs/namei.c               |  2 +-
 fs/notify/fsnotify.c     |  4 ++--
 fs/overlayfs/export.c    |  2 +-
 include/linux/dcache.h   |  2 +-
 include/linux/fsnotify.h |  2 +-
 7 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/fs/dcache.c b/fs/dcache.c
index aac41adf4743..a8dcc27ce2d0 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -287,22 +287,25 @@ void take_dentry_name_snapshot(struct name_snapshot *name, struct dentry *dentry
 	if (unlikely(dname_external(dentry))) {
 		struct external_name *p = external_name(dentry);
 		atomic_inc(&p->u.count);
+		name->name.len = dentry->d_name.len;
 		spin_unlock(&dentry->d_lock);
-		name->name = p->name;
+		name->name.name = p->name;
 	} else {
 		memcpy(name->inline_name, dentry->d_iname,
 		       dentry->d_name.len + 1);
+		name->name.len = dentry->d_name.len;
 		spin_unlock(&dentry->d_lock);
-		name->name = name->inline_name;
+		name->name.name = name->inline_name;
 	}
 }
 EXPORT_SYMBOL(take_dentry_name_snapshot);
 
 void release_dentry_name_snapshot(struct name_snapshot *name)
 {
-	if (unlikely(name->name != name->inline_name)) {
+	if (unlikely(name->name.name != name->inline_name)) {
 		struct external_name *p;
-		p = container_of(name->name, struct external_name, name[0]);
+		p = container_of(name->name.name, struct external_name,
+				 name[0]);
 		if (unlikely(atomic_dec_and_test(&p->u.count)))
 			kfree_rcu(p, u.head);
 	}
diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index f25daa207421..37c0a025d7e8 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -824,7 +824,7 @@ struct dentry *debugfs_rename(struct dentry *old_dir, struct dentry *old_dentry,
 		goto exit;
 	}
 	d_move(old_dentry, dentry);
-	fsnotify_move(d_inode(old_dir), d_inode(new_dir), old_name.name,
+	fsnotify_move(d_inode(old_dir), d_inode(new_dir), old_name.name.name,
 		d_is_dir(old_dentry),
 		NULL, old_dentry);
 	release_dentry_name_snapshot(&old_name);
diff --git a/fs/namei.c b/fs/namei.c
index dede0147b3f6..c96713077326 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -4498,7 +4498,7 @@ int vfs_rename(struct inode *old_dir, struct dentry *old_dentry,
 		inode_unlock(target);
 	dput(new_dentry);
 	if (!error) {
-		fsnotify_move(old_dir, new_dir, old_name.name, is_dir,
+		fsnotify_move(old_dir, new_dir, old_name.name.name, is_dir,
 			      !(flags & RENAME_EXCHANGE) ? target : NULL, old_dentry);
 		if (flags & RENAME_EXCHANGE) {
 			fsnotify_move(new_dir, old_dir, old_dentry->d_name.name,
diff --git a/fs/notify/fsnotify.c b/fs/notify/fsnotify.c
index df06f3da166c..fb22f76329ae 100644
--- a/fs/notify/fsnotify.c
+++ b/fs/notify/fsnotify.c
@@ -179,10 +179,10 @@ int __fsnotify_parent(const struct path *path, struct dentry *dentry, __u32 mask
 		take_dentry_name_snapshot(&name, dentry);
 		if (path)
 			ret = fsnotify(p_inode, mask, path, FSNOTIFY_EVENT_PATH,
-				       name.name, 0);
+				       name.name.name, 0);
 		else
 			ret = fsnotify(p_inode, mask, dentry->d_inode, FSNOTIFY_EVENT_INODE,
-				       name.name, 0);
+				       name.name.name, 0);
 		release_dentry_name_snapshot(&name);
 	}
 
diff --git a/fs/overlayfs/export.c b/fs/overlayfs/export.c
index 54e5d17d7f3e..cc1c9e5606ba 100644
--- a/fs/overlayfs/export.c
+++ b/fs/overlayfs/export.c
@@ -398,7 +398,7 @@ static struct dentry *ovl_lookup_real_one(struct dentry *connected,
 	 * pointer because we hold no lock on the real dentry.
 	 */
 	take_dentry_name_snapshot(&name, real);
-	this = lookup_one_len(name.name, connected, strlen(name.name));
+	this = lookup_one_len(name.name.name, connected, name.name.len);
 	err = PTR_ERR(this);
 	if (IS_ERR(this)) {
 		goto fail;
diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index 60996e64c579..2ff5f3bb9ddc 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -594,7 +594,7 @@ static inline struct inode *d_real_inode(const struct dentry *dentry)
 }
 
 struct name_snapshot {
-	const unsigned char *name;
+	struct qstr name;
 	unsigned char inline_name[DNAME_INLINE_LEN];
 };
 void take_dentry_name_snapshot(struct name_snapshot *, struct dentry *);
diff --git a/include/linux/fsnotify.h b/include/linux/fsnotify.h
index 09587e2860b5..e09cfff69bb2 100644
--- a/include/linux/fsnotify.h
+++ b/include/linux/fsnotify.h
@@ -178,7 +178,7 @@ static inline void fsnotify_nameremove(struct dentry *dentry, int isdir)
 	take_dentry_name_snapshot(&name, dentry);
 
 	fsnotify(d_inode(parent), mask, d_inode(dentry), FSNOTIFY_EVENT_INODE,
-		 name.name, 0);
+		 name.name.name, 0);
 
 	release_dentry_name_snapshot(&name);
 	dput(parent);
-- 
2.20.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

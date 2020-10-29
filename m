Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 27CB529EC2B
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 13:46:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-MURtfm6QP6-cgmk1AYh7fA-1; Thu, 29 Oct 2020 08:45:47 -0400
X-MC-Unique: MURtfm6QP6-cgmk1AYh7fA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E66A21016D08;
	Thu, 29 Oct 2020 12:45:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6F1A6198C;
	Thu, 29 Oct 2020 12:45:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24BD558118;
	Thu, 29 Oct 2020 12:45:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09T0pfPE022968 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 28 Oct 2020 20:51:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8D1A1110DBC0; Thu, 29 Oct 2020 00:51:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 894E2110DBC1
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:51:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66F24185A7A1
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:51:39 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-191-gfPNh2T1M--9qQ-uJzcTlw-1; Wed, 28 Oct 2020 20:51:37 -0400
X-MC-Unique: gfPNh2T1M--9qQ-uJzcTlw-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1kXvv3-0008Ep-3C; Thu, 29 Oct 2020 00:35:57 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH 26/34] fs: add helpers for idmap mounts
Date: Thu, 29 Oct 2020 01:32:44 +0100
Message-Id: <20201029003252.2128653-27-christian.brauner@ubuntu.com>
In-Reply-To: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:45:19 -0400
Cc: Phil Estes <estesp@gmail.com>, Lennart Poettering <lennart@poettering.net>,
	Amir Goldstein <amir73il@gmail.com>, Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	containers@lists.linux-foundation.org,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Tycho Andersen <tycho@tycho.ws>, Miklos Szeredi <miklos@szeredi.hu>,
	James Morris <jmorris@namei.org>, smbarber@chromium.org,
	linux-ext4@vger.kernel.org, Mrunal Patel <mpatel@redhat.com>,
	Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
	Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>,
	Seth Forshee <seth.forshee@canonical.com>,
	Aleksa Sarai <cyphar@cyphar.com>, Andy Lutomirski <luto@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Geoffrey Thomas <geofft@ldpreload.com>,
	David Howells <dhowells@redhat.com>,
	John Johansen <john.johansen@canonical.com>, Theodore Tso <tytso@mit.edu>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-unionfs@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-api@vger.kernel.org, Alban Crequy <alban@kinvolk.io>,
	linux-integrity@vger.kernel.org,
	=?UTF-8?q?St=C3=A9phane=20Graber?= <stgraber@ubuntu.com>,
	Todd Kjos <tkjos@google.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the kernel is configured with CONFIG_IDMAP_MOUNTS additional inode methods
are provided. A filesystem that is aware of idmapped mounts will receive the
user namespace the mount has been marked with as an additional argument. This
can be used for additional permission checking and also to enable filesystems
to translate between uids and gids if they need to. We have implemented all
relevant helpers in earlier patches.

In this iteration I've decided to add a set of new inode methods instead of
adapting the existing ones. This is mainly done to keep the noise-level as low
as possible. But we're very happy to adapt the existing methods and all
filesystems using it instead of adding dedicated new helpers. In any case we
expect to be done to a single set of inode methods ones we've transitioned
filesystems whether or not we add new methods or not.

Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/attr.c          |   2 +-
 fs/namei.c         |  24 +++++----
 fs/posix_acl.c     |   4 +-
 include/linux/fs.h | 129 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 146 insertions(+), 13 deletions(-)

diff --git a/fs/attr.c b/fs/attr.c
index 4daf6ac6de6d..d13ef3f8eac0 100644
--- a/fs/attr.c
+++ b/fs/attr.c
@@ -378,7 +378,7 @@ int notify_mapped_change(struct user_namespace *user_ns, struct dentry *dentry,
 		return error;
 
 	if (inode->i_op->setattr)
-		error = inode->i_op->setattr(dentry, attr);
+		error = iop_setattr(inode, user_ns, dentry, attr);
 	else
 		error = simple_setattr(dentry, attr);
 
diff --git a/fs/namei.c b/fs/namei.c
index 76c9637eccb9..d6dbfab126d7 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -407,7 +407,7 @@ static inline int do_inode_permission(struct user_namespace *user_ns, struct ino
 {
 	if (unlikely(!(inode->i_opflags & IOP_FASTPERM))) {
 		if (likely(inode->i_op->permission))
-			return inode->i_op->permission(inode, mask);
+			return iop_permission(inode, user_ns, inode, mask);
 
 		/* This gets set once for the inode lifetime */
 		spin_lock(&inode->i_lock);
@@ -2872,7 +2872,7 @@ int vfs_mapped_create(struct user_namespace *user_ns, struct inode *dir,
 	error = security_inode_create(dir, dentry, mode);
 	if (error)
 		return error;
-	error = dir->i_op->create(dir, dentry, mode, want_excl);
+	error = iop_create(dir, user_ns, dir, dentry, mode, want_excl);
 	if (!error)
 		fsnotify_create(dir, dentry);
 	return error;
@@ -3175,14 +3175,18 @@ static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
 
 	/* Negative dentry, just create the file */
 	if (!dentry->d_inode && (open_flag & O_CREAT)) {
+		struct user_namespace *user_ns;
+
 		file->f_mode |= FMODE_CREATED;
 		audit_inode_child(dir_inode, dentry, AUDIT_TYPE_CHILD_CREATE);
 		if (!dir_inode->i_op->create) {
 			error = -EACCES;
 			goto out_dput;
 		}
-		error = dir_inode->i_op->create(dir_inode, dentry, mode,
-						open_flag & O_EXCL);
+
+		user_ns = mnt_user_ns(nd->path.mnt);
+		error = iop_create(dir_inode, user_ns, dir_inode, dentry, mode,
+				   open_flag & O_EXCL);
 		if (error)
 			goto out_dput;
 	}
@@ -3363,7 +3367,7 @@ struct dentry *vfs_mapped_tmpfile(struct user_namespace *user_ns,
 	child = d_alloc(dentry, &slash_name);
 	if (unlikely(!child))
 		goto out_err;
-	error = dir->i_op->tmpfile(dir, child, mode);
+	error = iop_tmpfile(dir, user_ns, dir, child, mode);
 	if (error)
 		goto out_err;
 	error = -ENOENT;
@@ -3640,7 +3644,7 @@ int vfs_mapped_mknod(struct user_namespace *user_ns, struct inode *dir,
 	if (error)
 		return error;
 
-	error = dir->i_op->mknod(dir, dentry, mode, dev);
+	error = iop_mknod(dir, user_ns, dir, dentry, mode, dev);
 	if (!error)
 		fsnotify_create(dir, dentry);
 	return error;
@@ -3750,7 +3754,7 @@ int vfs_mapped_mkdir(struct user_namespace *user_ns, struct inode *dir,
 	if (max_links && dir->i_nlink >= max_links)
 		return -EMLINK;
 
-	error = dir->i_op->mkdir(dir, dentry, mode);
+	error = iop_mkdir(dir, user_ns, dir, dentry, mode);
 	if (!error)
 		fsnotify_mkdir(dir, dentry);
 	return error;
@@ -4089,7 +4093,7 @@ int vfs_mapped_symlink(struct user_namespace *user_ns, struct inode *dir,
 	if (error)
 		return error;
 
-	error = dir->i_op->symlink(dir, dentry, oldname);
+	error = iop_symlink(dir, user_ns, dir, dentry, oldname);
 	if (!error)
 		fsnotify_create(dir, dentry);
 	return error;
@@ -4435,8 +4439,8 @@ int vfs_mapped_rename(struct renamedata *rd)
 		if (error)
 			goto out;
 	}
-	error = old_dir->i_op->rename(old_dir, old_dentry,
-				       new_dir, new_dentry, flags);
+	error = iop_rename(old_dir, rd->new_user_ns, old_dir, old_dentry,
+			   new_dir, new_dentry, flags);
 	if (error)
 		goto out;
 
diff --git a/fs/posix_acl.c b/fs/posix_acl.c
index 665eb7921e1c..b8e204ac2caa 100644
--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@ -578,7 +578,7 @@ posix_mapped_acl_chmod(struct user_namespace *user_ns, struct inode *inode, umod
 	ret = __posix_acl_chmod(&acl, GFP_KERNEL, mode);
 	if (ret)
 		return ret;
-	ret = inode->i_op->set_acl(inode, acl, ACL_TYPE_ACCESS);
+	ret = iop_set_acl(inode, user_ns, inode, acl, ACL_TYPE_ACCESS);
 	posix_acl_release(acl);
 	return ret;
 }
@@ -925,7 +925,7 @@ set_posix_mapped_acl(struct user_namespace *user_ns, struct inode *inode,
 		if (ret)
 			return ret;
 	}
-	return inode->i_op->set_acl(inode, acl, type);
+	return iop_set_acl(inode, user_ns, inode, acl, type);
 }
 
 int
diff --git a/include/linux/fs.h b/include/linux/fs.h
index bfcfa3d7374f..cb01141d726a 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1978,8 +1978,137 @@ struct inode_operations {
 			   umode_t create_mode);
 	int (*tmpfile) (struct inode *, struct dentry *, umode_t);
 	int (*set_acl)(struct inode *, struct posix_acl *, int);
+#ifdef CONFIG_IDMAP_MOUNTS
+	int (*permission_mapped) (struct user_namespace *, struct inode *, int);
+	int (*create_mapped) (struct user_namespace *, struct inode *,
+			      struct dentry *, umode_t, bool);
+	int (*mknod_mapped) (struct user_namespace *, struct inode *,
+			     struct dentry *, umode_t, dev_t);
+	int (*mkdir_mapped) (struct user_namespace *, struct inode *,
+			     struct dentry *, umode_t);
+	int (*tmpfile_mapped) (struct user_namespace *, struct inode *,
+			       struct dentry *, umode_t);
+	int (*symlink_mapped) (struct user_namespace *, struct inode *,
+			       struct dentry *, const char *);
+	int (*rename_mapped) (struct user_namespace *, struct inode *,
+			      struct dentry *, struct inode *, struct dentry *,
+			      unsigned int);
+	int (*setattr_mapped) (struct user_namespace *, struct dentry *,
+			       struct iattr *);
+	int (*set_acl_mapped)(struct user_namespace *, struct inode *,
+			      struct posix_acl *, int);
+#endif
 } ____cacheline_aligned;
 
+static inline int iop_permission(struct inode *caller,
+				 struct user_namespace *user_ns,
+				 struct inode *inode, int mask)
+{
+#ifdef CONFIG_IDMAP_MOUNTS
+	if (caller->i_op->permission_mapped)
+		return caller->i_op->permission_mapped(user_ns, inode, mask);
+#endif
+	return caller->i_op->permission(inode, mask);
+}
+
+static inline int iop_create(struct inode *caller,
+			     struct user_namespace *user_ns,
+			     struct inode *inode, struct dentry *dentry,
+			     umode_t mode, bool excl)
+{
+#ifdef CONFIG_IDMAP_MOUNTS
+	if (caller->i_op->create_mapped)
+		return caller->i_op->create_mapped(user_ns, inode, dentry,
+						    mode, excl);
+#endif
+	return caller->i_op->create(inode, dentry, mode, excl);
+}
+
+static inline int iop_mknod(struct inode *caller,
+			    struct user_namespace *user_ns, struct inode *inode,
+			    struct dentry *dentry, umode_t mode, dev_t dev)
+{
+#ifdef CONFIG_IDMAP_MOUNTS
+	if (caller->i_op->mknod_mapped)
+		return caller->i_op->mknod_mapped(user_ns, inode, dentry, mode, dev);
+#endif
+	return caller->i_op->mknod(inode, dentry, mode, dev);
+}
+
+static inline int iop_mkdir(struct inode *caller,
+			    struct user_namespace *user_ns, struct inode *inode,
+			    struct dentry *dentry, umode_t mode)
+{
+#ifdef CONFIG_IDMAP_MOUNTS
+	if (caller->i_op->mkdir_mapped)
+		return caller->i_op->mkdir_mapped(user_ns, inode, dentry, mode);
+#endif
+	return caller->i_op->mkdir(inode, dentry, mode);
+}
+
+static inline int iop_tmpfile(struct inode *caller,
+			      struct user_namespace *user_ns,
+			      struct inode *inode, struct dentry *dentry,
+			      umode_t mode)
+{
+#ifdef CONFIG_IDMAP_MOUNTS
+	if (caller->i_op->tmpfile_mapped)
+		return caller->i_op->tmpfile_mapped(user_ns, inode, dentry, mode);
+#endif
+	return caller->i_op->tmpfile(inode, dentry, mode);
+}
+
+static inline int iop_symlink(struct inode *caller,
+			      struct user_namespace *user_ns,
+			      struct inode *inode, struct dentry *dentry,
+			      const char *name)
+{
+#ifdef CONFIG_IDMAP_MOUNTS
+	if (caller->i_op->symlink_mapped)
+		return caller->i_op->symlink_mapped(user_ns, inode, dentry, name);
+#endif
+	return caller->i_op->symlink(inode, dentry, name);
+}
+
+static inline int iop_rename(struct inode *caller,
+			     struct user_namespace *user_ns,
+			     struct inode *old_inode, struct dentry *old_dentry,
+			     struct inode *new_inode, struct dentry *new_dentry,
+			     unsigned int flags)
+{
+#ifdef CONFIG_IDMAP_MOUNTS
+	if (caller->i_op->rename_mapped)
+		return caller->i_op->rename_mapped(user_ns, old_inode,
+						   old_dentry, new_inode,
+						   new_dentry, flags);
+#endif
+	return caller->i_op->rename(old_inode, old_dentry, new_inode,
+				    new_dentry, flags);
+}
+
+static inline int iop_setattr(struct inode *caller,
+			      struct user_namespace *user_ns,
+			      struct dentry *dentry, struct iattr *attr)
+{
+#ifdef CONFIG_IDMAP_MOUNTS
+	if (caller->i_op->setattr_mapped)
+		return caller->i_op->setattr_mapped(user_ns, dentry, attr);
+#endif
+	return caller->i_op->setattr(dentry, attr);
+}
+
+static inline int iop_set_acl(struct inode *caller,
+			      struct user_namespace *user_ns,
+			      struct inode *inode, struct posix_acl *acl,
+			      int type)
+{
+#ifdef CONFIG_IDMAP_MOUNTS
+	if (caller->i_op->set_acl_mapped)
+		return caller->i_op->set_acl_mapped(user_ns, inode, acl, type);
+#endif
+	return caller->i_op->set_acl(inode, acl, type);
+}
+
 static inline ssize_t call_read_iter(struct file *file, struct kiocb *kio,
 				     struct iov_iter *iter)
 {
-- 
2.29.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


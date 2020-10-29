Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E900D29EC39
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 13:48:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-vxHsoNHyMnS7fBaAzRaq4A-1; Thu, 29 Oct 2020 08:48:35 -0400
X-MC-Unique: vxHsoNHyMnS7fBaAzRaq4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08EC0AF9A2;
	Thu, 29 Oct 2020 12:48:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCA5B6EF69;
	Thu, 29 Oct 2020 12:48:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A74675810F;
	Thu, 29 Oct 2020 12:48:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09T0q7U0023071 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 28 Oct 2020 20:52:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ED639207A53A; Thu, 29 Oct 2020 00:52:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E896E2011575
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:52:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B73408007A4
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:52:06 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-186-Rtrz56C1Mh2bsd7MqwFRjQ-1; Wed, 28 Oct 2020 20:52:04 -0400
X-MC-Unique: Rtrz56C1Mh2bsd7MqwFRjQ-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1kXvul-0008Ep-7S; Thu, 29 Oct 2020 00:35:39 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH 16/34] namei: handle idmapped mounts in may_*() helpers
Date: Thu, 29 Oct 2020 01:32:34 +0100
Message-Id: <20201029003252.2128653-17-christian.brauner@ubuntu.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The may_follow_link(), may_linkat(), may_lookup(), may_open(), may_o_create(),
may_create_in_sticky(), may_delete(), and may_create() helpers determine
whether the caller is privileged enough to perform the associated operations.
Let them handle idmapped mounts by mappings the inode and fsids according to
the mount's user namespace. Afterwards the checks are identical to non-idmapped
inodes. If the initial user namespace is passed all operations are a nop so
non-idmapped mounts will not see a change in behavior and will also not see any
performance impact.
Since the may_*() helpers are not exposed to other parts of the kernel we can
simply extend them with an additional argument in case they don't already have
access to the mount's user namespace.

Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/namei.c | 106 +++++++++++++++++++++++++++++++----------------------
 1 file changed, 63 insertions(+), 43 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index 2635f6a57de5..76ee4d52bd5e 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -985,11 +985,14 @@ int sysctl_protected_regular __read_mostly;
  */
 static inline int may_follow_link(struct nameidata *nd, const struct inode *inode)
 {
+	struct user_namespace *user_ns;
+
 	if (!sysctl_protected_symlinks)
 		return 0;
 
+	user_ns = mnt_user_ns(nd->path.mnt);
 	/* Allowed if owner and follower match. */
-	if (uid_eq(current_cred()->fsuid, inode->i_uid))
+	if (uid_eq(current_cred()->fsuid, i_uid_into_mnt(user_ns, inode)))
 		return 0;
 
 	/* Allowed if parent directory not sticky and world-writable. */
@@ -1020,7 +1023,7 @@ static inline int may_follow_link(struct nameidata *nd, const struct inode *inod
  *
  * Otherwise returns true.
  */
-static bool safe_hardlink_source(struct inode *inode)
+static bool safe_hardlink_source(struct user_namespace *user_ns, struct inode *inode)
 {
 	umode_t mode = inode->i_mode;
 
@@ -1037,7 +1040,7 @@ static bool safe_hardlink_source(struct inode *inode)
 		return false;
 
 	/* Hardlinking to unreadable or unwritable sources is dangerous. */
-	if (inode_permission(inode, MAY_READ | MAY_WRITE))
+	if (mapped_inode_permission(user_ns, inode, MAY_READ | MAY_WRITE))
 		return false;
 
 	return true;
@@ -1058,6 +1061,7 @@ static bool safe_hardlink_source(struct inode *inode)
 int may_linkat(struct path *link)
 {
 	struct inode *inode = link->dentry->d_inode;
+	struct user_namespace *user_ns;
 
 	/* Inode writeback is not safe when the uid or gid are invalid. */
 	if (!uid_valid(inode->i_uid) || !gid_valid(inode->i_gid))
@@ -1069,7 +1073,9 @@ int may_linkat(struct path *link)
 	/* Source inode owner (or CAP_FOWNER) can hardlink all they like,
 	 * otherwise, it must be a safe source.
 	 */
-	if (safe_hardlink_source(inode) || inode_owner_or_capable(inode))
+	user_ns = mnt_user_ns(link->mnt);
+	if (safe_hardlink_source(user_ns, inode) ||
+	    mapped_inode_owner_or_capable(user_ns, inode))
 		return 0;
 
 	audit_log_path_denied(AUDIT_ANOM_LINK, "linkat");
@@ -1097,14 +1103,17 @@ int may_linkat(struct path *link)
  *
  * Returns 0 if the open is allowed, -ve on error.
  */
-static int may_create_in_sticky(umode_t dir_mode, kuid_t dir_uid,
-				struct inode * const inode)
+static int may_create_in_sticky(struct nameidata *nd, struct inode *const inode)
 {
+	struct user_namespace *user_ns;
+	umode_t dir_mode = nd->dir_mode;
+	kuid_t dir_uid = nd->dir_uid;
+
+	user_ns = mnt_user_ns(nd->path.mnt);
 	if ((!sysctl_protected_fifos && S_ISFIFO(inode->i_mode)) ||
 	    (!sysctl_protected_regular && S_ISREG(inode->i_mode)) ||
-	    likely(!(dir_mode & S_ISVTX)) ||
-	    uid_eq(inode->i_uid, dir_uid) ||
-	    uid_eq(current_fsuid(), inode->i_uid))
+	    likely(!(dir_mode & S_ISVTX)) || uid_eq(inode->i_uid, dir_uid) ||
+	    uid_eq(current_fsuid(), i_uid_into_mnt(user_ns, inode)))
 		return 0;
 
 	if (likely(dir_mode & 0002) ||
@@ -1596,14 +1605,16 @@ static struct dentry *lookup_slow(const struct qstr *name,
 
 static inline int may_lookup(struct nameidata *nd)
 {
+	struct user_namespace *user_ns = mnt_user_ns(nd->path.mnt);
+
 	if (nd->flags & LOOKUP_RCU) {
-		int err = inode_permission(nd->inode, MAY_EXEC|MAY_NOT_BLOCK);
+		int err = mapped_inode_permission(user_ns, nd->inode, MAY_EXEC|MAY_NOT_BLOCK);
 		if (err != -ECHILD)
 			return err;
 		if (unlazy_walk(nd))
 			return -ECHILD;
 	}
-	return inode_permission(nd->inode, MAY_EXEC);
+	return mapped_inode_permission(user_ns, nd->inode, MAY_EXEC);
 }
 
 static int reserve_stack(struct nameidata *nd, struct path *link, unsigned seq)
@@ -2680,15 +2691,18 @@ int user_path_at_empty(int dfd, const char __user *name, unsigned flags,
 }
 EXPORT_SYMBOL(user_path_at_empty);
 
-int __check_sticky(struct inode *dir, struct inode *inode)
+static int do_check_sticky(struct user_namespace *user_ns, struct inode *dir, struct inode *inode)
 {
-	kuid_t fsuid = current_fsuid();
-
-	if (uid_eq(inode->i_uid, fsuid))
+	if (uid_eq(i_uid_into_mnt(user_ns, inode), current_fsuid()))
 		return 0;
-	if (uid_eq(dir->i_uid, fsuid))
+	if (uid_eq(i_uid_into_mnt(user_ns, dir), current_fsuid()))
 		return 0;
-	return !capable_wrt_inode_uidgid(inode, CAP_FOWNER);
+	return !capable_wrt_mapped_inode_uidgid(user_ns, inode, CAP_FOWNER);
+}
+
+int __check_sticky(struct inode *dir, struct inode *inode)
+{
+	return do_check_sticky(&init_user_ns, dir, inode);
 }
 EXPORT_SYMBOL(__check_sticky);
 
@@ -2712,7 +2726,7 @@ EXPORT_SYMBOL(__check_sticky);
  * 11. We don't allow removal of NFS sillyrenamed files; it's handled by
  *     nfs_async_unlink().
  */
-static int may_delete(struct inode *dir, struct dentry *victim, bool isdir)
+static int may_delete(struct user_namespace *user_ns, struct inode *dir, struct dentry *victim, bool isdir)
 {
 	struct inode *inode = d_backing_inode(victim);
 	int error;
@@ -2729,13 +2743,13 @@ static int may_delete(struct inode *dir, struct dentry *victim, bool isdir)
 
 	audit_inode_child(dir, victim, AUDIT_TYPE_CHILD_DELETE);
 
-	error = inode_permission(dir, MAY_WRITE | MAY_EXEC);
+	error = mapped_inode_permission(user_ns, dir, MAY_WRITE | MAY_EXEC);
 	if (error)
 		return error;
 	if (IS_APPEND(dir))
 		return -EPERM;
 
-	if (check_sticky(dir, inode) || IS_APPEND(inode) ||
+	if (do_check_sticky(user_ns, dir, inode) || IS_APPEND(inode) ||
 	    IS_IMMUTABLE(inode) || IS_SWAPFILE(inode) || HAS_UNMAPPED_ID(inode))
 		return -EPERM;
 	if (isdir) {
@@ -2761,7 +2775,8 @@ static int may_delete(struct inode *dir, struct dentry *victim, bool isdir)
  *  4. We should have write and exec permissions on dir
  *  5. We can't do it if dir is immutable (done in permission())
  */
-static inline int may_create(struct inode *dir, struct dentry *child)
+static inline int may_create(struct user_namespace *user_ns, struct inode *dir,
+			     struct dentry *child)
 {
 	struct user_namespace *s_user_ns;
 	audit_inode_child(dir, child, AUDIT_TYPE_CHILD_CREATE);
@@ -2770,10 +2785,10 @@ static inline int may_create(struct inode *dir, struct dentry *child)
 	if (IS_DEADDIR(dir))
 		return -ENOENT;
 	s_user_ns = dir->i_sb->s_user_ns;
-	if (!kuid_has_mapping(s_user_ns, current_fsuid()) ||
-	    !kgid_has_mapping(s_user_ns, current_fsgid()))
+	if (!kuid_has_mapping(s_user_ns, fsuid_into_mnt(user_ns)) ||
+	    !kgid_has_mapping(s_user_ns, fsgid_into_mnt(user_ns)))
 		return -EOVERFLOW;
-	return inode_permission(dir, MAY_WRITE | MAY_EXEC);
+	return mapped_inode_permission(user_ns, dir, MAY_WRITE | MAY_EXEC);
 }
 
 /*
@@ -2823,7 +2838,7 @@ EXPORT_SYMBOL(unlock_rename);
 int vfs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 		bool want_excl)
 {
-	int error = may_create(dir, dentry);
+	int error = may_create(&init_user_ns, dir, dentry);
 	if (error)
 		return error;
 
@@ -2846,7 +2861,7 @@ int vfs_mkobj(struct dentry *dentry, umode_t mode,
 		void *arg)
 {
 	struct inode *dir = dentry->d_parent->d_inode;
-	int error = may_create(dir, dentry);
+	int error = may_create(&init_user_ns, dir, dentry);
 	if (error)
 		return error;
 
@@ -2870,6 +2885,7 @@ bool may_open_dev(const struct path *path)
 
 static int may_open(const struct path *path, int acc_mode, int flag)
 {
+	struct user_namespace *user_ns;
 	struct dentry *dentry = path->dentry;
 	struct inode *inode = dentry->d_inode;
 	int error;
@@ -2903,7 +2919,8 @@ static int may_open(const struct path *path, int acc_mode, int flag)
 		break;
 	}
 
-	error = inode_permission(inode, MAY_OPEN | acc_mode);
+	user_ns = mnt_user_ns(path->mnt);
+	error = mapped_inode_permission(user_ns, inode, MAY_OPEN | acc_mode);
 	if (error)
 		return error;
 
@@ -2918,7 +2935,7 @@ static int may_open(const struct path *path, int acc_mode, int flag)
 	}
 
 	/* O_NOATIME can only be set by the owner or superuser */
-	if (flag & O_NOATIME && !inode_owner_or_capable(inode))
+	if (flag & O_NOATIME && !mapped_inode_owner_or_capable(user_ns, inode))
 		return -EPERM;
 
 	return 0;
@@ -2955,17 +2972,19 @@ static inline int open_to_namei_flags(int flag)
 
 static int may_o_create(const struct path *dir, struct dentry *dentry, umode_t mode)
 {
-	struct user_namespace *s_user_ns;
+	struct user_namespace *s_user_ns, *user_ns;
 	int error = security_path_mknod(dir, dentry, mode, 0);
 	if (error)
 		return error;
 
+	user_ns = mnt_user_ns(dir->mnt);
 	s_user_ns = dir->dentry->d_sb->s_user_ns;
-	if (!kuid_has_mapping(s_user_ns, current_fsuid()) ||
-	    !kgid_has_mapping(s_user_ns, current_fsgid()))
+	if (!kuid_has_mapping(s_user_ns, fsuid_into_mnt(user_ns)) ||
+	    !kgid_has_mapping(s_user_ns, fsgid_into_mnt(user_ns)))
 		return -EOVERFLOW;
 
-	error = inode_permission(dir->dentry->d_inode, MAY_WRITE | MAY_EXEC);
+	error = mapped_inode_permission(user_ns, dir->dentry->d_inode,
+				    MAY_WRITE | MAY_EXEC);
 	if (error)
 		return error;
 
@@ -3258,7 +3277,7 @@ static int do_open(struct nameidata *nd,
 			return -EEXIST;
 		if (d_is_dir(nd->path.dentry))
 			return -EISDIR;
-		error = may_create_in_sticky(nd->dir_mode, nd->dir_uid,
+		error = may_create_in_sticky(nd,
 					     d_backing_inode(nd->path.dentry));
 		if (unlikely(error))
 			return error;
@@ -3560,7 +3579,7 @@ EXPORT_SYMBOL(user_path_create);
 int vfs_mknod(struct inode *dir, struct dentry *dentry, umode_t mode, dev_t dev)
 {
 	bool is_whiteout = S_ISCHR(mode) && dev == WHITEOUT_DEV;
-	int error = may_create(dir, dentry);
+	int error = may_create(&init_user_ns, dir, dentry);
 
 	if (error)
 		return error;
@@ -3661,7 +3680,7 @@ SYSCALL_DEFINE3(mknod, const char __user *, filename, umode_t, mode, unsigned, d
 
 int vfs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 {
-	int error = may_create(dir, dentry);
+	int error = may_create(&init_user_ns, dir, dentry);
 	unsigned max_links = dir->i_sb->s_max_links;
 
 	if (error)
@@ -3722,7 +3741,7 @@ SYSCALL_DEFINE2(mkdir, const char __user *, pathname, umode_t, mode)
 
 int vfs_rmdir(struct inode *dir, struct dentry *dentry)
 {
-	int error = may_delete(dir, dentry, 1);
+	int error = may_delete(&init_user_ns, dir, dentry, 1);
 
 	if (error)
 		return error;
@@ -3844,7 +3863,7 @@ SYSCALL_DEFINE1(rmdir, const char __user *, pathname)
 int vfs_unlink(struct inode *dir, struct dentry *dentry, struct inode **delegated_inode)
 {
 	struct inode *target = dentry->d_inode;
-	int error = may_delete(dir, dentry, 0);
+	int error = may_delete(&init_user_ns, dir, dentry, 0);
 
 	if (error)
 		return error;
@@ -3976,7 +3995,7 @@ SYSCALL_DEFINE1(unlink, const char __user *, pathname)
 
 int vfs_symlink(struct inode *dir, struct dentry *dentry, const char *oldname)
 {
-	int error = may_create(dir, dentry);
+	int error = may_create(&init_user_ns, dir, dentry);
 
 	if (error)
 		return error;
@@ -4065,7 +4084,7 @@ int vfs_link(struct dentry *old_dentry, struct inode *dir, struct dentry *new_de
 	if (!inode)
 		return -ENOENT;
 
-	error = may_create(dir, new_dentry);
+	error = may_create(&init_user_ns, dir, new_dentry);
 	if (error)
 		return error;
 
@@ -4257,6 +4276,7 @@ int vfs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	       struct inode **delegated_inode, unsigned int flags)
 {
 	int error;
+	struct user_namespace *user_ns = &init_user_ns;
 	bool is_dir = d_is_dir(old_dentry);
 	struct inode *source = old_dentry->d_inode;
 	struct inode *target = new_dentry->d_inode;
@@ -4267,19 +4287,19 @@ int vfs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	if (source == target)
 		return 0;
 
-	error = may_delete(old_dir, old_dentry, is_dir);
+	error = may_delete(user_ns, old_dir, old_dentry, is_dir);
 	if (error)
 		return error;
 
 	if (!target) {
-		error = may_create(new_dir, new_dentry);
+		error = may_create(user_ns, new_dir, new_dentry);
 	} else {
 		new_is_dir = d_is_dir(new_dentry);
 
 		if (!(flags & RENAME_EXCHANGE))
-			error = may_delete(new_dir, new_dentry, is_dir);
+			error = may_delete(user_ns, new_dir, new_dentry, is_dir);
 		else
-			error = may_delete(new_dir, new_dentry, new_is_dir);
+			error = may_delete(user_ns, new_dir, new_dentry, new_is_dir);
 	}
 	if (error)
 		return error;
-- 
2.29.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


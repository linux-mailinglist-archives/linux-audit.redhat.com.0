Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 12F192B3B4F
	for <lists+linux-audit@lfdr.de>; Mon, 16 Nov 2020 03:15:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-JjbSGxj0NZuDnOWlTAduOA-1; Sun, 15 Nov 2020 21:15:31 -0500
X-MC-Unique: JjbSGxj0NZuDnOWlTAduOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC98280EFA5;
	Mon, 16 Nov 2020 02:15:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADC3E5D9CC;
	Mon, 16 Nov 2020 02:15:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 672035811B;
	Mon, 16 Nov 2020 02:15:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AFAdTFL025231 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 15 Nov 2020 05:39:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9CABB5D23E; Sun, 15 Nov 2020 10:39:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96DB35D23C
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:39:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4ECFF858290
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:39:27 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-536-6FfA6KGYOIGiVlskwQUHVQ-1; Sun, 15 Nov 2020 05:39:24 -0500
X-MC-Unique: 6FfA6KGYOIGiVlskwQUHVQ-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1keFQy-0000Kt-VZ; Sun, 15 Nov 2020 10:39:01 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 16/39] namei: handle idmapped mounts in may_*() helpers
Date: Sun, 15 Nov 2020 11:36:55 +0100
Message-Id: <20201115103718.298186-17-christian.brauner@ubuntu.com>
In-Reply-To: <20201115103718.298186-1-christian.brauner@ubuntu.com>
References: <20201115103718.298186-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sun, 15 Nov 2020 21:15:05 -0500
Cc: Phil Estes <estesp@gmail.com>, Lennart Poettering <lennart@poettering.net>,
	Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	containers@lists.linux-foundation.org,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Christoph Hellwig <hch@lst.de>, Tycho Andersen <tycho@tycho.ws>,
	Jonathan Corbet <corbet@lwn.net>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Cc: Christoph Hellwig <hch@lst.de>
Cc: David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
/* v2 */
unchanged
---
 fs/btrfs/ioctl.c   |   5 +-
 fs/inode.c         |   2 +-
 fs/namei.c         | 121 +++++++++++++++++++++++++++------------------
 fs/xattr.c         |   2 +-
 include/linux/fs.h |  13 +++--
 5 files changed, 86 insertions(+), 57 deletions(-)

diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index 39f25b5d06ed..ccac53bb2a1c 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -915,8 +915,9 @@ static int btrfs_may_delete(struct inode *dir, struct dentry *victim, int isdir)
 		return error;
 	if (IS_APPEND(dir))
 		return -EPERM;
-	if (check_sticky(dir, d_inode(victim)) || IS_APPEND(d_inode(victim)) ||
-	    IS_IMMUTABLE(d_inode(victim)) || IS_SWAPFILE(d_inode(victim)))
+	if (check_sticky(&init_user_ns, dir, d_inode(victim)) ||
+	    IS_APPEND(d_inode(victim)) || IS_IMMUTABLE(d_inode(victim)) ||
+	    IS_SWAPFILE(d_inode(victim)))
 		return -EPERM;
 	if (isdir) {
 		if (!d_is_dir(victim))
diff --git a/fs/inode.c b/fs/inode.c
index 66d3f7397d86..75c64f003c45 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1797,7 +1797,7 @@ bool atime_needs_update(const struct path *path, struct inode *inode)
 	/* Atime updates will likely cause i_uid and i_gid to be written
 	 * back improprely if their true value is unknown to the vfs.
 	 */
-	if (HAS_UNMAPPED_ID(inode))
+	if (HAS_UNMAPPED_ID(mnt_user_ns(mnt), inode))
 		return false;
 
 	if (IS_NOATIME(inode))
diff --git a/fs/namei.c b/fs/namei.c
index 35952c28ee29..4dc842d1cd3a 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -465,7 +465,7 @@ int inode_permission(struct user_namespace *user_ns,
 		 * written back improperly if their true value is unknown
 		 * to the vfs.
 		 */
-		if (HAS_UNMAPPED_ID(inode))
+		if (HAS_UNMAPPED_ID(user_ns, inode))
 			return -EACCES;
 	}
 
@@ -963,11 +963,16 @@ int sysctl_protected_regular __read_mostly;
  */
 static inline int may_follow_link(struct nameidata *nd, const struct inode *inode)
 {
+	struct user_namespace *user_ns;
+	kuid_t i_uid;
+
 	if (!sysctl_protected_symlinks)
 		return 0;
 
+	user_ns = mnt_user_ns(nd->path.mnt);
+	i_uid = i_uid_into_mnt(user_ns, inode);
 	/* Allowed if owner and follower match. */
-	if (uid_eq(current_cred()->fsuid, inode->i_uid))
+	if (uid_eq(current_cred()->fsuid, i_uid))
 		return 0;
 
 	/* Allowed if parent directory not sticky and world-writable. */
@@ -975,7 +980,7 @@ static inline int may_follow_link(struct nameidata *nd, const struct inode *inod
 		return 0;
 
 	/* Allowed if parent directory and link owner match. */
-	if (uid_valid(nd->dir_uid) && uid_eq(nd->dir_uid, inode->i_uid))
+	if (uid_valid(nd->dir_uid) && uid_eq(nd->dir_uid, i_uid))
 		return 0;
 
 	if (nd->flags & LOOKUP_RCU)
@@ -998,7 +1003,7 @@ static inline int may_follow_link(struct nameidata *nd, const struct inode *inod
  *
  * Otherwise returns true.
  */
-static bool safe_hardlink_source(struct inode *inode)
+static bool safe_hardlink_source(struct user_namespace *user_ns, struct inode *inode)
 {
 	umode_t mode = inode->i_mode;
 
@@ -1015,7 +1020,7 @@ static bool safe_hardlink_source(struct inode *inode)
 		return false;
 
 	/* Hardlinking to unreadable or unwritable sources is dangerous. */
-	if (inode_permission(&init_user_ns, inode, MAY_READ | MAY_WRITE))
+	if (inode_permission(user_ns, inode, MAY_READ | MAY_WRITE))
 		return false;
 
 	return true;
@@ -1036,9 +1041,12 @@ static bool safe_hardlink_source(struct inode *inode)
 int may_linkat(struct path *link)
 {
 	struct inode *inode = link->dentry->d_inode;
+	struct user_namespace *user_ns;
 
 	/* Inode writeback is not safe when the uid or gid are invalid. */
-	if (!uid_valid(inode->i_uid) || !gid_valid(inode->i_gid))
+	user_ns = mnt_user_ns(link->mnt);
+	if (!uid_valid(i_uid_into_mnt(user_ns, inode)) ||
+	    !gid_valid(i_gid_into_mnt(user_ns, inode)))
 		return -EOVERFLOW;
 
 	if (!sysctl_protected_hardlinks)
@@ -1047,7 +1055,8 @@ int may_linkat(struct path *link)
 	/* Source inode owner (or CAP_FOWNER) can hardlink all they like,
 	 * otherwise, it must be a safe source.
 	 */
-	if (safe_hardlink_source(inode) || inode_owner_or_capable(&init_user_ns, inode))
+	if (safe_hardlink_source(user_ns, inode) ||
+	    inode_owner_or_capable(user_ns, inode))
 		return 0;
 
 	audit_log_path_denied(AUDIT_ANOM_LINK, "linkat");
@@ -1075,14 +1084,18 @@ int may_linkat(struct path *link)
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
 	    likely(!(dir_mode & S_ISVTX)) ||
-	    uid_eq(inode->i_uid, dir_uid) ||
-	    uid_eq(current_fsuid(), inode->i_uid))
+	    uid_eq(i_uid_into_mnt(user_ns, inode), dir_uid) ||
+	    uid_eq(current_fsuid(), i_uid_into_mnt(user_ns, inode)))
 		return 0;
 
 	if (likely(dir_mode & 0002) ||
@@ -1574,15 +1587,16 @@ static struct dentry *lookup_slow(const struct qstr *name,
 
 static inline int may_lookup(struct nameidata *nd)
 {
+	struct user_namespace *user_ns = mnt_user_ns(nd->path.mnt);
+
 	if (nd->flags & LOOKUP_RCU) {
-		int err = inode_permission(&init_user_ns, nd->inode,
-					   MAY_EXEC | MAY_NOT_BLOCK);
+		int err = inode_permission(user_ns, nd->inode, MAY_EXEC|MAY_NOT_BLOCK);
 		if (err != -ECHILD)
 			return err;
 		if (unlazy_walk(nd))
 			return -ECHILD;
 	}
-	return inode_permission(&init_user_ns, nd->inode, MAY_EXEC);
+	return inode_permission(user_ns, nd->inode, MAY_EXEC);
 }
 
 static int reserve_stack(struct nameidata *nd, struct path *link, unsigned seq)
@@ -2181,7 +2195,10 @@ static int link_path_walk(const char *name, struct nameidata *nd)
 OK:
 			/* pathname or trailing symlink, done */
 			if (!depth) {
-				nd->dir_uid = nd->inode->i_uid;
+				struct user_namespace *user_ns;
+
+				user_ns = mnt_user_ns(nd->path.mnt);
+				nd->dir_uid = i_uid_into_mnt(user_ns, nd->inode);
 				nd->dir_mode = nd->inode->i_mode;
 				nd->flags &= ~LOOKUP_PARENT;
 				return 0;
@@ -2659,15 +2676,16 @@ int user_path_at_empty(int dfd, const char __user *name, unsigned flags,
 }
 EXPORT_SYMBOL(user_path_at_empty);
 
-int __check_sticky(struct inode *dir, struct inode *inode)
+int __check_sticky(struct user_namespace *user_ns, struct inode *dir,
+		   struct inode *inode)
 {
 	kuid_t fsuid = current_fsuid();
 
-	if (uid_eq(inode->i_uid, fsuid))
+	if (uid_eq(i_uid_into_mnt(user_ns, inode), fsuid))
 		return 0;
-	if (uid_eq(dir->i_uid, fsuid))
+	if (uid_eq(i_uid_into_mnt(user_ns, dir), fsuid))
 		return 0;
-	return !capable_wrt_inode_uidgid(&init_user_ns, inode, CAP_FOWNER);
+	return !capable_wrt_inode_uidgid(user_ns, inode, CAP_FOWNER);
 }
 EXPORT_SYMBOL(__check_sticky);
 
@@ -2691,7 +2709,7 @@ EXPORT_SYMBOL(__check_sticky);
  * 11. We don't allow removal of NFS sillyrenamed files; it's handled by
  *     nfs_async_unlink().
  */
-static int may_delete(struct inode *dir, struct dentry *victim, bool isdir)
+static int may_delete(struct user_namespace *user_ns, struct inode *dir, struct dentry *victim, bool isdir)
 {
 	struct inode *inode = d_backing_inode(victim);
 	int error;
@@ -2703,19 +2721,21 @@ static int may_delete(struct inode *dir, struct dentry *victim, bool isdir)
 	BUG_ON(victim->d_parent->d_inode != dir);
 
 	/* Inode writeback is not safe when the uid or gid are invalid. */
-	if (!uid_valid(inode->i_uid) || !gid_valid(inode->i_gid))
+	if (!uid_valid(i_uid_into_mnt(user_ns, inode)) ||
+	    !gid_valid(i_gid_into_mnt(user_ns, inode)))
 		return -EOVERFLOW;
 
 	audit_inode_child(dir, victim, AUDIT_TYPE_CHILD_DELETE);
 
-	error = inode_permission(&init_user_ns, dir, MAY_WRITE | MAY_EXEC);
+	error = inode_permission(user_ns, dir, MAY_WRITE | MAY_EXEC);
 	if (error)
 		return error;
 	if (IS_APPEND(dir))
 		return -EPERM;
 
-	if (check_sticky(dir, inode) || IS_APPEND(inode) ||
-	    IS_IMMUTABLE(inode) || IS_SWAPFILE(inode) || HAS_UNMAPPED_ID(inode))
+	if (check_sticky(user_ns, dir, inode) || IS_APPEND(inode) ||
+	    IS_IMMUTABLE(inode) || IS_SWAPFILE(inode) ||
+	    HAS_UNMAPPED_ID(user_ns, inode))
 		return -EPERM;
 	if (isdir) {
 		if (!d_is_dir(victim))
@@ -2740,7 +2760,8 @@ static int may_delete(struct inode *dir, struct dentry *victim, bool isdir)
  *  4. We should have write and exec permissions on dir
  *  5. We can't do it if dir is immutable (done in permission())
  */
-static inline int may_create(struct inode *dir, struct dentry *child)
+static inline int may_create(struct user_namespace *user_ns, struct inode *dir,
+			     struct dentry *child)
 {
 	struct user_namespace *s_user_ns;
 	audit_inode_child(dir, child, AUDIT_TYPE_CHILD_CREATE);
@@ -2749,10 +2770,10 @@ static inline int may_create(struct inode *dir, struct dentry *child)
 	if (IS_DEADDIR(dir))
 		return -ENOENT;
 	s_user_ns = dir->i_sb->s_user_ns;
-	if (!kuid_has_mapping(s_user_ns, current_fsuid()) ||
-	    !kgid_has_mapping(s_user_ns, current_fsgid()))
+	if (!kuid_has_mapping(s_user_ns, fsuid_into_mnt(user_ns)) ||
+	    !kgid_has_mapping(s_user_ns, fsgid_into_mnt(user_ns)))
 		return -EOVERFLOW;
-	return inode_permission(&init_user_ns, dir, MAY_WRITE | MAY_EXEC);
+	return inode_permission(user_ns, dir, MAY_WRITE | MAY_EXEC);
 }
 
 /*
@@ -2802,7 +2823,7 @@ EXPORT_SYMBOL(unlock_rename);
 int vfs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 		bool want_excl)
 {
-	int error = may_create(dir, dentry);
+	int error = may_create(&init_user_ns, dir, dentry);
 	if (error)
 		return error;
 
@@ -2825,7 +2846,7 @@ int vfs_mkobj(struct dentry *dentry, umode_t mode,
 		void *arg)
 {
 	struct inode *dir = dentry->d_parent->d_inode;
-	int error = may_create(dir, dentry);
+	int error = may_create(&init_user_ns, dir, dentry);
 	if (error)
 		return error;
 
@@ -2849,6 +2870,7 @@ bool may_open_dev(const struct path *path)
 
 static int may_open(const struct path *path, int acc_mode, int flag)
 {
+	struct user_namespace *user_ns;
 	struct dentry *dentry = path->dentry;
 	struct inode *inode = dentry->d_inode;
 	int error;
@@ -2882,7 +2904,8 @@ static int may_open(const struct path *path, int acc_mode, int flag)
 		break;
 	}
 
-	error = inode_permission(&init_user_ns, inode, MAY_OPEN | acc_mode);
+	user_ns = mnt_user_ns(path->mnt);
+	error = inode_permission(user_ns, inode, MAY_OPEN | acc_mode);
 	if (error)
 		return error;
 
@@ -2897,7 +2920,7 @@ static int may_open(const struct path *path, int acc_mode, int flag)
 	}
 
 	/* O_NOATIME can only be set by the owner or superuser */
-	if (flag & O_NOATIME && !inode_owner_or_capable(&init_user_ns, inode))
+	if (flag & O_NOATIME && !inode_owner_or_capable(user_ns, inode))
 		return -EPERM;
 
 	return 0;
@@ -2934,17 +2957,18 @@ static inline int open_to_namei_flags(int flag)
 
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
 
-	error = inode_permission(&init_user_ns, dir->dentry->d_inode,
+	error = inode_permission(user_ns, dir->dentry->d_inode,
 				 MAY_WRITE | MAY_EXEC);
 	if (error)
 		return error;
@@ -3238,7 +3262,7 @@ static int do_open(struct nameidata *nd,
 			return -EEXIST;
 		if (d_is_dir(nd->path.dentry))
 			return -EISDIR;
-		error = may_create_in_sticky(nd->dir_mode, nd->dir_uid,
+		error = may_create_in_sticky(nd,
 					     d_backing_inode(nd->path.dentry));
 		if (unlikely(error))
 			return error;
@@ -3540,7 +3564,7 @@ EXPORT_SYMBOL(user_path_create);
 int vfs_mknod(struct inode *dir, struct dentry *dentry, umode_t mode, dev_t dev)
 {
 	bool is_whiteout = S_ISCHR(mode) && dev == WHITEOUT_DEV;
-	int error = may_create(dir, dentry);
+	int error = may_create(&init_user_ns, dir, dentry);
 
 	if (error)
 		return error;
@@ -3641,7 +3665,7 @@ SYSCALL_DEFINE3(mknod, const char __user *, filename, umode_t, mode, unsigned, d
 
 int vfs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 {
-	int error = may_create(dir, dentry);
+	int error = may_create(&init_user_ns, dir, dentry);
 	unsigned max_links = dir->i_sb->s_max_links;
 
 	if (error)
@@ -3702,7 +3726,7 @@ SYSCALL_DEFINE2(mkdir, const char __user *, pathname, umode_t, mode)
 
 int vfs_rmdir(struct inode *dir, struct dentry *dentry)
 {
-	int error = may_delete(dir, dentry, 1);
+	int error = may_delete(&init_user_ns, dir, dentry, 1);
 
 	if (error)
 		return error;
@@ -3824,7 +3848,7 @@ SYSCALL_DEFINE1(rmdir, const char __user *, pathname)
 int vfs_unlink(struct inode *dir, struct dentry *dentry, struct inode **delegated_inode)
 {
 	struct inode *target = dentry->d_inode;
-	int error = may_delete(dir, dentry, 0);
+	int error = may_delete(&init_user_ns, dir, dentry, 0);
 
 	if (error)
 		return error;
@@ -3956,7 +3980,7 @@ SYSCALL_DEFINE1(unlink, const char __user *, pathname)
 
 int vfs_symlink(struct inode *dir, struct dentry *dentry, const char *oldname)
 {
-	int error = may_create(dir, dentry);
+	int error = may_create(&init_user_ns, dir, dentry);
 
 	if (error)
 		return error;
@@ -4045,7 +4069,7 @@ int vfs_link(struct dentry *old_dentry, struct inode *dir, struct dentry *new_de
 	if (!inode)
 		return -ENOENT;
 
-	error = may_create(dir, new_dentry);
+	error = may_create(&init_user_ns, dir, new_dentry);
 	if (error)
 		return error;
 
@@ -4062,7 +4086,7 @@ int vfs_link(struct dentry *old_dentry, struct inode *dir, struct dentry *new_de
 	 * be writen back improperly if their true value is unknown to
 	 * the vfs.
 	 */
-	if (HAS_UNMAPPED_ID(inode))
+	if (HAS_UNMAPPED_ID(&init_user_ns, inode))
 		return -EPERM;
 	if (!dir->i_op->link)
 		return -EPERM;
@@ -4237,6 +4261,7 @@ int vfs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	       struct inode **delegated_inode, unsigned int flags)
 {
 	int error;
+	struct user_namespace *user_ns = &init_user_ns;
 	bool is_dir = d_is_dir(old_dentry);
 	struct inode *source = old_dentry->d_inode;
 	struct inode *target = new_dentry->d_inode;
@@ -4247,19 +4272,19 @@ int vfs_rename(struct inode *old_dir, struct dentry *old_dentry,
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
diff --git a/fs/xattr.c b/fs/xattr.c
index 8c50b2a935e4..20376592dad6 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -98,7 +98,7 @@ xattr_permission(struct user_namespace *user_ns, struct inode *inode,
 		 * to be writen back improperly if their true value is
 		 * unknown to the vfs.
 		 */
-		if (HAS_UNMAPPED_ID(inode))
+		if (HAS_UNMAPPED_ID(user_ns, inode))
 			return -EPERM;
 	}
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 17f23f0ffca3..05a228ce767a 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2065,9 +2065,10 @@ static inline bool sb_rdonly(const struct super_block *sb) { return sb->s_flags
 #define IS_WHITEOUT(inode)	(S_ISCHR(inode->i_mode) && \
 				 (inode)->i_rdev == WHITEOUT_DEV)
 
-static inline bool HAS_UNMAPPED_ID(struct inode *inode)
+static inline bool HAS_UNMAPPED_ID(struct user_namespace *user_ns, struct inode *inode)
 {
-	return !uid_valid(inode->i_uid) || !gid_valid(inode->i_gid);
+	return !uid_valid(i_uid_into_mnt(user_ns, inode)) ||
+	       !gid_valid(i_gid_into_mnt(user_ns, inode));
 }
 
 static inline enum rw_hint file_write_hint(struct file *file)
@@ -2791,7 +2792,8 @@ extern int notify_change(struct user_namespace *, struct dentry *,
 			 struct iattr *, struct inode **);
 extern int inode_permission(struct user_namespace *, struct inode *, int);
 extern int generic_permission(struct user_namespace *, struct inode *, int);
-extern int __check_sticky(struct inode *dir, struct inode *inode);
+extern int __check_sticky(struct user_namespace *user_ns, struct inode *dir,
+			  struct inode *inode);
 
 static inline bool execute_ok(struct inode *inode)
 {
@@ -3412,12 +3414,13 @@ static inline bool is_sxid(umode_t mode)
 	return (mode & S_ISUID) || ((mode & S_ISGID) && (mode & S_IXGRP));
 }
 
-static inline int check_sticky(struct inode *dir, struct inode *inode)
+static inline int check_sticky(struct user_namespace *user_ns,
+			       struct inode *dir, struct inode *inode)
 {
 	if (!(dir->i_mode & S_ISVTX))
 		return 0;
 
-	return __check_sticky(dir, inode);
+	return __check_sticky(user_ns, dir, inode);
 }
 
 static inline void inode_has_no_xattr(struct inode *inode)
-- 
2.29.2

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


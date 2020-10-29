Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 846BE29EC2A
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 13:46:02 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-ygGhz7yKPIatVIqxKRYvew-1; Thu, 29 Oct 2020 08:45:59 -0400
X-MC-Unique: ygGhz7yKPIatVIqxKRYvew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42259E9015;
	Thu, 29 Oct 2020 12:45:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FB0D5578B;
	Thu, 29 Oct 2020 12:45:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E07B958138;
	Thu, 29 Oct 2020 12:45:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09T0qKNx023122 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 28 Oct 2020 20:52:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AA0A785CBF; Thu, 29 Oct 2020 00:52:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A458785CBA
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:52:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6528E8D632E
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:52:18 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-124-lzEityt0PJWbApg7eqfFlA-1; Wed, 28 Oct 2020 20:52:16 -0400
X-MC-Unique: lzEityt0PJWbApg7eqfFlA-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1kXvue-0008Ep-Dl; Thu, 29 Oct 2020 00:35:32 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH 12/34] xattr: handle idmapped mounts
Date: Thu, 29 Oct 2020 01:32:30 +0100
Message-Id: <20201029003252.2128653-13-christian.brauner@ubuntu.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
	Tycho Andersen <tycho@tycho.pizza>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Tycho Andersen <tycho@tycho.pizza>

When interacting with extended attributes the vfs verifies that the
caller is privileged over the inode with which the extended attribute is
associated. Add helpers to handle extended attributes on idmapped
mounts. If the inode is accessed through an idmapped mount we need to
map it according to the mount's user namespace. Afterwards the checks
are identical to non-idmapped mounts.
This patch adds helpers to get, set, and remove extended attributes on
idmapped mounts. The four helpers vfs_mapped_getxattr(),
vfs_mapped_setxattr(), __vfs_mapped_removexattr(), and
vfs_mapped_removexattr() are either used directly by the vfs (e.g.
vfs_mapped_getxattr_alloc()) or by the filesystems targeted in this
first interation.

If the initial user namespace is passed all operations are a nop so
non-idmapped mounts will not see a change in behavior and will also not
see any performance impact. It also means that the non-idmapped-mount
aware helpers can be implemented on top of their idmapped-mount aware
counterparts by passing the initial user namespace.

Signed-off-by: Tycho Andersen <tycho@tycho.pizza>
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/xattr.c            | 252 +++++++++++++++++++++++++++++-------------
 include/linux/xattr.h |  23 ++++
 2 files changed, 196 insertions(+), 79 deletions(-)

diff --git a/fs/xattr.c b/fs/xattr.c
index 96ff53b42251..cdda2baeb9f7 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -83,7 +83,8 @@ xattr_resolve_name(struct inode *inode, const char **name)
  * because different namespaces have very different rules.
  */
 static int
-xattr_permission(struct inode *inode, const char *name, int mask)
+xattr_permission(struct user_namespace *user_ns, struct inode *inode,
+		 const char *name, int mask)
 {
 	/*
 	 * We can never set or remove an extended attribute on a read-only
@@ -127,11 +128,11 @@ xattr_permission(struct inode *inode, const char *name, int mask)
 		if (!S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
 			return (mask & MAY_WRITE) ? -EPERM : -ENODATA;
 		if (S_ISDIR(inode->i_mode) && (inode->i_mode & S_ISVTX) &&
-		    (mask & MAY_WRITE) && !inode_owner_or_capable(inode))
+		    (mask & MAY_WRITE) && !mapped_inode_owner_or_capable(user_ns, inode))
 			return -EPERM;
 	}
 
-	return inode_permission(inode, mask);
+	return mapped_inode_permission(user_ns, inode, mask);
 }
 
 /*
@@ -161,9 +162,10 @@ xattr_supported_namespace(struct inode *inode, const char *prefix)
 }
 EXPORT_SYMBOL(xattr_supported_namespace);
 
-int
-__vfs_setxattr(struct dentry *dentry, struct inode *inode, const char *name,
-	       const void *value, size_t size, int flags)
+static int
+__vfs_mapped_setxattr(struct user_namespace *user_ns, struct dentry *dentry,
+		  struct inode *inode, const char *name, const void *value,
+		  size_t size, int flags)
 {
 	const struct xattr_handler *handler;
 
@@ -174,7 +176,14 @@ __vfs_setxattr(struct dentry *dentry, struct inode *inode, const char *name,
 		return -EOPNOTSUPP;
 	if (size == 0)
 		value = "";  /* empty EA, do not remove */
-	return handler->set(handler, dentry, inode, name, value, size, flags);
+	return xattr_handler_set(handler, user_ns, dentry, inode, name, value, size, flags);
+}
+
+int
+__vfs_setxattr(struct dentry *dentry, struct inode *inode, const char *name,
+	       const void *value, size_t size, int flags)
+{
+	return __vfs_mapped_setxattr(&init_user_ns, dentry, inode, name, value, size, flags);
 }
 EXPORT_SYMBOL(__vfs_setxattr);
 
@@ -182,6 +191,7 @@ EXPORT_SYMBOL(__vfs_setxattr);
  *  __vfs_setxattr_noperm - perform setxattr operation without performing
  *  permission checks.
  *
+ *  @user_ns - user namespace of the mount
  *  @dentry - object to perform setxattr on
  *  @name - xattr name to set
  *  @value - value to set @name to
@@ -194,8 +204,10 @@ EXPORT_SYMBOL(__vfs_setxattr);
  *  is executed. It also assumes that the caller will make the appropriate
  *  permission checks.
  */
-int __vfs_setxattr_noperm(struct dentry *dentry, const char *name,
-		const void *value, size_t size, int flags)
+static int
+__vfs_mapped_setxattr_noperm(struct user_namespace *user_ns,
+			     struct dentry *dentry, const char *name,
+			     const void *value, size_t size, int flags)
 {
 	struct inode *inode = dentry->d_inode;
 	int error = -EAGAIN;
@@ -205,7 +217,7 @@ int __vfs_setxattr_noperm(struct dentry *dentry, const char *name,
 	if (issec)
 		inode->i_flags &= ~S_NOSEC;
 	if (inode->i_opflags & IOP_XATTR) {
-		error = __vfs_setxattr(dentry, inode, name, value, size, flags);
+		error = __vfs_mapped_setxattr(user_ns, dentry, inode, name, value, size, flags);
 		if (!error) {
 			fsnotify_xattr(dentry);
 			security_inode_post_setxattr(dentry, name, value,
@@ -231,27 +243,23 @@ int __vfs_setxattr_noperm(struct dentry *dentry, const char *name,
 	return error;
 }
 
-/**
- * __vfs_setxattr_locked - set an extended attribute while holding the inode
- * lock
- *
- *  @dentry: object to perform setxattr on
- *  @name: xattr name to set
- *  @value: value to set @name to
- *  @size: size of @value
- *  @flags: flags to pass into filesystem operations
- *  @delegated_inode: on return, will contain an inode pointer that
- *  a delegation was broken on, NULL if none.
- */
-int
-__vfs_setxattr_locked(struct dentry *dentry, const char *name,
-		const void *value, size_t size, int flags,
-		struct inode **delegated_inode)
+int __vfs_setxattr_noperm(struct dentry *dentry, const char *name,
+		const void *value, size_t size, int flags)
+{
+	return __vfs_mapped_setxattr_noperm(&init_user_ns, dentry, name, value,
+					    size, flags);
+}
+
+static int
+__vfs_mapped_setxattr_locked(struct user_namespace *user_ns,
+			     struct dentry *dentry, const char *name,
+			     const void *value, size_t size, int flags,
+			     struct inode **delegated_inode)
 {
 	struct inode *inode = dentry->d_inode;
 	int error;
 
-	error = xattr_permission(inode, name, MAY_WRITE);
+	error = xattr_permission(user_ns, inode, name, MAY_WRITE);
 	if (error)
 		return error;
 
@@ -263,16 +271,37 @@ __vfs_setxattr_locked(struct dentry *dentry, const char *name,
 	if (error)
 		goto out;
 
-	error = __vfs_setxattr_noperm(dentry, name, value, size, flags);
+	error = __vfs_mapped_setxattr_noperm(user_ns, dentry, name, value, size, flags);
 
 out:
 	return error;
 }
+
+/**
+ * __vfs_setxattr_locked - set an extended attribute while holding the inode
+ * lock
+ *
+ *  @dentry: object to perform setxattr on
+ *  @name: xattr name to set
+ *  @value: value to set @name to
+ *  @size: size of @value
+ *  @flags: flags to pass into filesystem operations
+ *  @delegated_inode: on return, will contain an inode pointer that
+ *  a delegation was broken on, NULL if none.
+ */
+int
+__vfs_setxattr_locked(struct dentry *dentry, const char *name,
+		const void *value, size_t size, int flags,
+		struct inode **delegated_inode)
+{
+	return __vfs_mapped_setxattr_locked(&init_user_ns, dentry, name, value,
+					    size, flags, delegated_inode);
+}
 EXPORT_SYMBOL_GPL(__vfs_setxattr_locked);
 
 int
-vfs_setxattr(struct dentry *dentry, const char *name, const void *value,
-		size_t size, int flags)
+vfs_mapped_setxattr(struct user_namespace *user_ns, struct dentry *dentry,
+		const char *name, const void *value, size_t size, int flags)
 {
 	struct inode *inode = dentry->d_inode;
 	struct inode *delegated_inode = NULL;
@@ -280,8 +309,8 @@ vfs_setxattr(struct dentry *dentry, const char *name, const void *value,
 
 retry_deleg:
 	inode_lock(inode);
-	error = __vfs_setxattr_locked(dentry, name, value, size, flags,
-	    &delegated_inode);
+	error = __vfs_mapped_setxattr_locked(user_ns, dentry, name, value, size,
+					     flags, &delegated_inode);
 	inode_unlock(inode);
 
 	if (delegated_inode) {
@@ -291,6 +320,14 @@ vfs_setxattr(struct dentry *dentry, const char *name, const void *value,
 	}
 	return error;
 }
+EXPORT_SYMBOL_GPL(vfs_mapped_setxattr);
+
+int
+vfs_setxattr(struct dentry *dentry, const char *name, const void *value,
+		size_t size, int flags)
+{
+	return vfs_mapped_setxattr(&init_user_ns, dentry, name, value, size, flags);
+}
 EXPORT_SYMBOL_GPL(vfs_setxattr);
 
 static ssize_t
@@ -319,24 +356,17 @@ xattr_getsecurity(struct inode *inode, const char *name, void *value,
 	return len;
 }
 
-/*
- * vfs_getxattr_alloc - allocate memory, if necessary, before calling getxattr
- *
- * Allocate memory, if not already allocated, or re-allocate correct size,
- * before retrieving the extended attribute.
- *
- * Returns the result of alloc, if failed, or the getxattr operation.
- */
 ssize_t
-vfs_getxattr_alloc(struct dentry *dentry, const char *name, char **xattr_value,
-		   size_t xattr_size, gfp_t flags)
+vfs_mapped_getxattr_alloc(struct user_namespace *user_ns, struct dentry *dentry,
+		      const char *name, char **xattr_value, size_t xattr_size,
+		      gfp_t flags)
 {
 	const struct xattr_handler *handler;
 	struct inode *inode = dentry->d_inode;
 	char *value = *xattr_value;
 	int error;
 
-	error = xattr_permission(inode, name, MAY_READ);
+	error = xattr_permission(user_ns, inode, name, MAY_READ);
 	if (error)
 		return error;
 
@@ -361,6 +391,22 @@ vfs_getxattr_alloc(struct dentry *dentry, const char *name, char **xattr_value,
 	return error;
 }
 
+/*
+ * vfs_getxattr_alloc - allocate memory, if necessary, before calling getxattr
+ *
+ * Allocate memory, if not already allocated, or re-allocate correct size,
+ * before retrieving the extended attribute.
+ *
+ * Returns the result of alloc, if failed, or the getxattr operation.
+ */
+ssize_t
+vfs_getxattr_alloc(struct dentry *dentry, const char *name, char **xattr_value,
+		   size_t xattr_size, gfp_t flags)
+{
+	return vfs_mapped_getxattr_alloc(&init_user_ns, dentry, name, xattr_value,
+				     xattr_size, flags);
+}
+
 ssize_t
 __vfs_getxattr(struct dentry *dentry, struct inode *inode, const char *name,
 	       void *value, size_t size)
@@ -377,12 +423,13 @@ __vfs_getxattr(struct dentry *dentry, struct inode *inode, const char *name,
 EXPORT_SYMBOL(__vfs_getxattr);
 
 ssize_t
-vfs_getxattr(struct dentry *dentry, const char *name, void *value, size_t size)
+vfs_mapped_getxattr(struct user_namespace *user_ns, struct dentry *dentry,
+		const char *name, void *value, size_t size)
 {
 	struct inode *inode = dentry->d_inode;
 	int error;
 
-	error = xattr_permission(inode, name, MAY_READ);
+	error = xattr_permission(user_ns, inode, name, MAY_READ);
 	if (error)
 		return error;
 
@@ -405,6 +452,13 @@ vfs_getxattr(struct dentry *dentry, const char *name, void *value, size_t size)
 nolsm:
 	return __vfs_getxattr(dentry, inode, name, value, size);
 }
+EXPORT_SYMBOL_GPL(vfs_mapped_getxattr);
+
+ssize_t
+vfs_getxattr(struct dentry *dentry, const char *name, void *value, size_t size)
+{
+	return vfs_mapped_getxattr(&init_user_ns, dentry, name, value, size);
+}
 EXPORT_SYMBOL_GPL(vfs_getxattr);
 
 ssize_t
@@ -428,7 +482,7 @@ vfs_listxattr(struct dentry *dentry, char *list, size_t size)
 EXPORT_SYMBOL_GPL(vfs_listxattr);
 
 int
-__vfs_removexattr(struct dentry *dentry, const char *name)
+__vfs_mapped_removexattr(struct user_namespace *user_ns, struct dentry *dentry, const char *name)
 {
 	struct inode *inode = d_inode(dentry);
 	const struct xattr_handler *handler;
@@ -438,27 +492,26 @@ __vfs_removexattr(struct dentry *dentry, const char *name)
 		return PTR_ERR(handler);
 	if (!handler->set)
 		return -EOPNOTSUPP;
-	return handler->set(handler, dentry, inode, name, NULL, 0, XATTR_REPLACE);
+	return xattr_handler_set(handler, user_ns, dentry, inode, name, NULL, 0, XATTR_REPLACE);
 }
-EXPORT_SYMBOL(__vfs_removexattr);
+EXPORT_SYMBOL(__vfs_mapped_removexattr);
 
-/**
- * __vfs_removexattr_locked - set an extended attribute while holding the inode
- * lock
- *
- *  @dentry: object to perform setxattr on
- *  @name: name of xattr to remove
- *  @delegated_inode: on return, will contain an inode pointer that
- *  a delegation was broken on, NULL if none.
- */
 int
-__vfs_removexattr_locked(struct dentry *dentry, const char *name,
-		struct inode **delegated_inode)
+__vfs_removexattr(struct dentry *dentry, const char *name)
+{
+	return __vfs_mapped_removexattr(&init_user_ns, dentry, name);
+}
+EXPORT_SYMBOL(__vfs_removexattr);
+
+static int
+__vfs_mapped_removexattr_locked(struct user_namespace *user_ns,
+				struct dentry *dentry, const char *name,
+				struct inode **delegated_inode)
 {
 	struct inode *inode = dentry->d_inode;
 	int error;
 
-	error = xattr_permission(inode, name, MAY_WRITE);
+	error = xattr_permission(user_ns, inode, name, MAY_WRITE);
 	if (error)
 		return error;
 
@@ -470,7 +523,7 @@ __vfs_removexattr_locked(struct dentry *dentry, const char *name,
 	if (error)
 		goto out;
 
-	error = __vfs_removexattr(dentry, name);
+	error = __vfs_mapped_removexattr(user_ns, dentry, name);
 
 	if (!error) {
 		fsnotify_xattr(dentry);
@@ -480,10 +533,27 @@ __vfs_removexattr_locked(struct dentry *dentry, const char *name,
 out:
 	return error;
 }
+
+/**
+ * __vfs_removexattr_locked - set an extended attribute while holding the inode
+ * lock
+ *
+ *  @dentry: object to perform setxattr on
+ *  @name: name of xattr to remove
+ *  @delegated_inode: on return, will contain an inode pointer that
+ *  a delegation was broken on, NULL if none.
+ */
+int
+__vfs_removexattr_locked(struct dentry *dentry, const char *name,
+			 struct inode **delegated_inode)
+{
+	return __vfs_mapped_removexattr_locked(&init_user_ns, dentry, name, delegated_inode);
+}
 EXPORT_SYMBOL_GPL(__vfs_removexattr_locked);
 
 int
-vfs_removexattr(struct dentry *dentry, const char *name)
+vfs_mapped_removexattr(struct user_namespace *user_ns, struct dentry *dentry,
+		       const char *name)
 {
 	struct inode *inode = dentry->d_inode;
 	struct inode *delegated_inode = NULL;
@@ -491,7 +561,7 @@ vfs_removexattr(struct dentry *dentry, const char *name)
 
 retry_deleg:
 	inode_lock(inode);
-	error = __vfs_removexattr_locked(dentry, name, &delegated_inode);
+	error = __vfs_mapped_removexattr_locked(user_ns, dentry, name, &delegated_inode);
 	inode_unlock(inode);
 
 	if (delegated_inode) {
@@ -502,14 +572,22 @@ vfs_removexattr(struct dentry *dentry, const char *name)
 
 	return error;
 }
+EXPORT_SYMBOL_GPL(vfs_mapped_removexattr);
+
+int
+vfs_removexattr(struct dentry *dentry, const char *name)
+{
+	return vfs_mapped_removexattr(&init_user_ns, dentry, name);
+}
 EXPORT_SYMBOL_GPL(vfs_removexattr);
 
 /*
  * Extended attribute SET operations
  */
 static long
-setxattr(struct dentry *d, const char __user *name, const void __user *value,
-	 size_t size, int flags)
+setxattr(struct user_namespace *user_ns, struct dentry *d,
+	 const char __user *name, const void __user *value, size_t size,
+	 int flags)
 {
 	int error;
 	void *kvalue = NULL;
@@ -536,16 +614,16 @@ setxattr(struct dentry *d, const char __user *name, const void __user *value,
 		}
 		if ((strcmp(kname, XATTR_NAME_POSIX_ACL_ACCESS) == 0) ||
 		    (strcmp(kname, XATTR_NAME_POSIX_ACL_DEFAULT) == 0))
-			posix_acl_fix_xattr_from_user(&init_user_ns, kvalue, size);
+			posix_acl_fix_xattr_from_user(user_ns, kvalue, size);
 		else if (strcmp(kname, XATTR_NAME_CAPS) == 0) {
-			error = cap_convert_nscap(&init_user_ns, d, &kvalue, size);
+			error = cap_convert_nscap(user_ns, d, &kvalue, size);
 			if (error < 0)
 				goto out;
 			size = error;
 		}
 	}
 
-	error = vfs_setxattr(d, kname, kvalue, size, flags);
+	error = vfs_mapped_setxattr(user_ns, d, kname, kvalue, size, flags);
 out:
 	kvfree(kvalue);
 
@@ -558,13 +636,17 @@ static int path_setxattr(const char __user *pathname,
 {
 	struct path path;
 	int error;
+
 retry:
 	error = user_path_at(AT_FDCWD, pathname, lookup_flags, &path);
 	if (error)
 		return error;
 	error = mnt_want_write(path.mnt);
 	if (!error) {
-		error = setxattr(path.dentry, name, value, size, flags);
+		struct user_namespace *user_ns;
+
+		user_ns = mnt_user_ns(path.mnt);
+		error = setxattr(user_ns, path.dentry, name, value, size, flags);
 		mnt_drop_write(path.mnt);
 	}
 	path_put(&path);
@@ -600,7 +682,11 @@ SYSCALL_DEFINE5(fsetxattr, int, fd, const char __user *, name,
 	audit_file(f.file);
 	error = mnt_want_write_file(f.file);
 	if (!error) {
-		error = setxattr(f.file->f_path.dentry, name, value, size, flags);
+		struct user_namespace *user_ns;
+
+		user_ns = mnt_user_ns(f.file->f_path.mnt);
+		error = setxattr(user_ns, f.file->f_path.dentry, name, value,
+				 size, flags);
 		mnt_drop_write_file(f.file);
 	}
 	fdput(f);
@@ -612,7 +698,7 @@ SYSCALL_DEFINE5(fsetxattr, int, fd, const char __user *, name,
  */
 static ssize_t
 getxattr(struct dentry *d, const char __user *name, void __user *value,
-	 size_t size)
+	 size_t size, struct user_namespace *user_ns)
 {
 	ssize_t error;
 	void *kvalue = NULL;
@@ -632,11 +718,11 @@ getxattr(struct dentry *d, const char __user *name, void __user *value,
 			return -ENOMEM;
 	}
 
-	error = vfs_getxattr(d, kname, kvalue, size);
+	error = vfs_mapped_getxattr(user_ns, d, kname, kvalue, size);
 	if (error > 0) {
 		if ((strcmp(kname, XATTR_NAME_POSIX_ACL_ACCESS) == 0) ||
 		    (strcmp(kname, XATTR_NAME_POSIX_ACL_DEFAULT) == 0))
-			posix_acl_fix_xattr_to_user(&init_user_ns, kvalue, error);
+			posix_acl_fix_xattr_to_user(user_ns, kvalue, error);
 		if (size && copy_to_user(value, kvalue, error))
 			error = -EFAULT;
 	} else if (error == -ERANGE && size >= XATTR_SIZE_MAX) {
@@ -654,13 +740,15 @@ static ssize_t path_getxattr(const char __user *pathname,
 			     const char __user *name, void __user *value,
 			     size_t size, unsigned int lookup_flags)
 {
+	struct user_namespace *user_ns;
 	struct path path;
 	ssize_t error;
 retry:
 	error = user_path_at(AT_FDCWD, pathname, lookup_flags, &path);
 	if (error)
 		return error;
-	error = getxattr(path.dentry, name, value, size);
+	user_ns = mnt_user_ns(path.mnt);
+	error = getxattr(path.dentry, name, value, size, user_ns);
 	path_put(&path);
 	if (retry_estale(error, lookup_flags)) {
 		lookup_flags |= LOOKUP_REVAL;
@@ -684,13 +772,15 @@ SYSCALL_DEFINE4(lgetxattr, const char __user *, pathname,
 SYSCALL_DEFINE4(fgetxattr, int, fd, const char __user *, name,
 		void __user *, value, size_t, size)
 {
+	struct user_namespace *user_ns;
 	struct fd f = fdget(fd);
 	ssize_t error = -EBADF;
 
 	if (!f.file)
 		return error;
 	audit_file(f.file);
-	error = getxattr(f.file->f_path.dentry, name, value, size);
+	user_ns = mnt_user_ns(f.file->f_path.mnt);
+	error = getxattr(f.file->f_path.dentry, name, value, size, user_ns);
 	fdput(f);
 	return error;
 }
@@ -774,7 +864,7 @@ SYSCALL_DEFINE3(flistxattr, int, fd, char __user *, list, size_t, size)
  * Extended attribute REMOVE operations
  */
 static long
-removexattr(struct dentry *d, const char __user *name)
+removexattr(struct user_namespace *user_ns, struct dentry *d, const char __user *name)
 {
 	int error;
 	char kname[XATTR_NAME_MAX + 1];
@@ -785,7 +875,7 @@ removexattr(struct dentry *d, const char __user *name)
 	if (error < 0)
 		return error;
 
-	return vfs_removexattr(d, kname);
+	return vfs_mapped_removexattr(user_ns, d, kname);
 }
 
 static int path_removexattr(const char __user *pathname,
@@ -799,7 +889,9 @@ static int path_removexattr(const char __user *pathname,
 		return error;
 	error = mnt_want_write(path.mnt);
 	if (!error) {
-		error = removexattr(path.dentry, name);
+		struct user_namespace *user_ns = mnt_user_ns(path.mnt);
+
+		error = removexattr(user_ns, path.dentry, name);
 		mnt_drop_write(path.mnt);
 	}
 	path_put(&path);
@@ -832,7 +924,9 @@ SYSCALL_DEFINE2(fremovexattr, int, fd, const char __user *, name)
 	audit_file(f.file);
 	error = mnt_want_write_file(f.file);
 	if (!error) {
-		error = removexattr(f.file->f_path.dentry, name);
+		struct user_namespace *user_ns = mnt_user_ns(f.file->f_path.mnt);
+
+		error = removexattr(user_ns, f.file->f_path.dentry, name);
 		mnt_drop_write_file(f.file);
 	}
 	fdput(f);
diff --git a/include/linux/xattr.h b/include/linux/xattr.h
index 908441e74f51..b2eeecdf6669 100644
--- a/include/linux/xattr.h
+++ b/include/linux/xattr.h
@@ -16,6 +16,7 @@
 #include <linux/types.h>
 #include <linux/spinlock.h>
 #include <linux/mm.h>
+#include <linux/user_namespace.h>
 #include <uapi/linux/xattr.h>
 
 struct inode;
@@ -45,6 +46,19 @@ struct xattr_handler {
 #endif
 };
 
+static inline int xattr_handler_set(const struct xattr_handler *handler,
+			  struct user_namespace *user_ns, struct dentry *dentry,
+			  struct inode *inode, const char *name,
+			  const void *buffer, size_t size, int flags)
+{
+#ifdef CONFIG_IDMAP_MOUNTS
+	if (handler->set_mapped)
+		return handler->set_mapped(handler, user_ns, dentry, inode,
+					   name, buffer, size, flags);
+#endif
+	return handler->set(handler, dentry, inode, name, buffer, size, flags);
+}
+
 const char *xattr_full_name(const struct xattr_handler *, const char *);
 
 struct xattr {
@@ -55,18 +69,27 @@ struct xattr {
 
 ssize_t __vfs_getxattr(struct dentry *, struct inode *, const char *, void *, size_t);
 ssize_t vfs_getxattr(struct dentry *, const char *, void *, size_t);
+ssize_t vfs_mapped_getxattr(struct user_namespace *user_ns, struct dentry *dentry,
+			const char *name, void *value, size_t size);
 ssize_t vfs_listxattr(struct dentry *d, char *list, size_t size);
 int __vfs_setxattr(struct dentry *, struct inode *, const char *, const void *, size_t, int);
 int __vfs_setxattr_noperm(struct dentry *, const char *, const void *, size_t, int);
 int __vfs_setxattr_locked(struct dentry *, const char *, const void *, size_t, int, struct inode **);
+int vfs_mapped_setxattr(struct user_namespace *, struct dentry *, const char *, const void *, size_t, int);
 int vfs_setxattr(struct dentry *, const char *, const void *, size_t, int);
 int __vfs_removexattr(struct dentry *, const char *);
+int __vfs_mapped_removexattr(struct user_namespace *, struct dentry *, const char *);
 int __vfs_removexattr_locked(struct dentry *, const char *, struct inode **);
 int vfs_removexattr(struct dentry *, const char *);
+int vfs_mapped_removexattr(struct user_namespace *user_ns, struct dentry *, const char *);
 
 ssize_t generic_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size);
 ssize_t vfs_getxattr_alloc(struct dentry *dentry, const char *name,
 			   char **xattr_value, size_t size, gfp_t flags);
+ssize_t vfs_mapped_getxattr_alloc(struct user_namespace *user_ns,
+			      struct dentry *dentry, const char *name,
+			      char **xattr_value, size_t xattr_size,
+			      gfp_t flags);
 
 int xattr_supported_namespace(struct inode *inode, const char *prefix);
 
-- 
2.29.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


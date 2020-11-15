Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 781802B3B4A
	for <lists+linux-audit@lfdr.de>; Mon, 16 Nov 2020 03:15:30 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-Gc115S-POlKnsWMpQQggvw-1; Sun, 15 Nov 2020 21:15:25 -0500
X-MC-Unique: Gc115S-POlKnsWMpQQggvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D369D1007B20;
	Mon, 16 Nov 2020 02:15:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B37001F5;
	Mon, 16 Nov 2020 02:15:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C79758121;
	Mon, 16 Nov 2020 02:15:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AFAcwg4025127 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 15 Nov 2020 05:38:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 20D695D23E; Sun, 15 Nov 2020 10:38:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BB365D23D
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:38:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0002890E426
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:38:57 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-471-RO4_cdaBMsqQpVyxkeM5jQ-1; Sun, 15 Nov 2020 05:38:53 -0500
X-MC-Unique: RO4_cdaBMsqQpVyxkeM5jQ-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1keFQa-0000Kt-D2; Sun, 15 Nov 2020 10:38:36 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 08/39] capability: handle idmapped mounts
Date: Sun, 15 Nov 2020 11:36:47 +0100
Message-Id: <20201115103718.298186-9-christian.brauner@ubuntu.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In order to determine whether a caller holds privilege over a given
inode the capability framework exposes the two helpers
privileged_wrt_inode_uidgid() and capable_wrt_inode_uidgid(). The former
verifies that the inode has a mapping in the caller's user namespace and
the latter additionally verifies that the caller has the requested
capability in their current user namespace. If the inode is accessed
through an idmapped mount we first need to map it according to the
mount's user namespace. Afterwards the checks are identical to
non-idmapped inodes. If the initial user namespace is passed all
operations are a nop so non-idmapped mounts will not see a change in
behavior and will also not see any performance impact.

Cc: Christoph Hellwig <hch@lst.de>
Cc: David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
/* v2 */
- Christoph Hellwig:
  - Don't pollute the vfs with additional helpers simply extend the existing
    helpers with an additional argument and switch all callers.
---
 fs/attr.c                  |  8 ++++----
 fs/exec.c                  |  2 +-
 fs/inode.c                 |  2 +-
 fs/namei.c                 | 13 ++++++++-----
 fs/overlayfs/super.c       |  2 +-
 fs/posix_acl.c             |  2 +-
 fs/xfs/xfs_ioctl.c         |  2 +-
 include/linux/capability.h |  7 +++++--
 kernel/capability.c        | 14 +++++++++-----
 security/commoncap.c       |  5 +++--
 10 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/fs/attr.c b/fs/attr.c
index b4bbdbd4c8ca..d270f640a192 100644
--- a/fs/attr.c
+++ b/fs/attr.c
@@ -23,7 +23,7 @@ static bool chown_ok(const struct inode *inode, kuid_t uid)
 	if (uid_eq(current_fsuid(), inode->i_uid) &&
 	    uid_eq(uid, inode->i_uid))
 		return true;
-	if (capable_wrt_inode_uidgid(inode, CAP_CHOWN))
+	if (capable_wrt_inode_uidgid(&init_user_ns, inode, CAP_CHOWN))
 		return true;
 	if (uid_eq(inode->i_uid, INVALID_UID) &&
 	    ns_capable(inode->i_sb->s_user_ns, CAP_CHOWN))
@@ -36,7 +36,7 @@ static bool chgrp_ok(const struct inode *inode, kgid_t gid)
 	if (uid_eq(current_fsuid(), inode->i_uid) &&
 	    (in_group_p(gid) || gid_eq(gid, inode->i_gid)))
 		return true;
-	if (capable_wrt_inode_uidgid(inode, CAP_CHOWN))
+	if (capable_wrt_inode_uidgid(&init_user_ns, inode, CAP_CHOWN))
 		return true;
 	if (gid_eq(inode->i_gid, INVALID_GID) &&
 	    ns_capable(inode->i_sb->s_user_ns, CAP_CHOWN))
@@ -92,7 +92,7 @@ int setattr_prepare(struct dentry *dentry, struct iattr *attr)
 		/* Also check the setgid bit! */
 		if (!in_group_p((ia_valid & ATTR_GID) ? attr->ia_gid :
 				inode->i_gid) &&
-		    !capable_wrt_inode_uidgid(inode, CAP_FSETID))
+		    !capable_wrt_inode_uidgid(&init_user_ns, inode, CAP_FSETID))
 			attr->ia_mode &= ~S_ISGID;
 	}
 
@@ -193,7 +193,7 @@ void setattr_copy(struct inode *inode, const struct iattr *attr)
 		umode_t mode = attr->ia_mode;
 
 		if (!in_group_p(inode->i_gid) &&
-		    !capable_wrt_inode_uidgid(inode, CAP_FSETID))
+		    !capable_wrt_inode_uidgid(&init_user_ns, inode, CAP_FSETID))
 			mode &= ~S_ISGID;
 		inode->i_mode = mode;
 	}
diff --git a/fs/exec.c b/fs/exec.c
index 547a2390baf5..8e75d7a33514 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1398,7 +1398,7 @@ void would_dump(struct linux_binprm *bprm, struct file *file)
 		/* Ensure mm->user_ns contains the executable */
 		user_ns = old = bprm->mm->user_ns;
 		while ((user_ns != &init_user_ns) &&
-		       !privileged_wrt_inode_uidgid(user_ns, inode))
+		       !privileged_wrt_inode_uidgid(user_ns, &init_user_ns, inode))
 			user_ns = user_ns->parent;
 
 		if (old != user_ns) {
diff --git a/fs/inode.c b/fs/inode.c
index 9d78c37b00b8..7a15372d9c2d 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2147,7 +2147,7 @@ void inode_init_owner(struct inode *inode, const struct inode *dir,
 			mode |= S_ISGID;
 		else if ((mode & (S_ISGID | S_IXGRP)) == (S_ISGID | S_IXGRP) &&
 			 !in_group_p(inode->i_gid) &&
-			 !capable_wrt_inode_uidgid(dir, CAP_FSETID))
+			 !capable_wrt_inode_uidgid(&init_user_ns, dir, CAP_FSETID))
 			mode &= ~S_ISGID;
 	} else
 		inode->i_gid = current_fsgid();
diff --git a/fs/namei.c b/fs/namei.c
index d4a6dd772303..3f52730af6c5 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -357,10 +357,11 @@ int generic_permission(struct inode *inode, int mask)
 	if (S_ISDIR(inode->i_mode)) {
 		/* DACs are overridable for directories */
 		if (!(mask & MAY_WRITE))
-			if (capable_wrt_inode_uidgid(inode,
+			if (capable_wrt_inode_uidgid(&init_user_ns, inode,
 						     CAP_DAC_READ_SEARCH))
 				return 0;
-		if (capable_wrt_inode_uidgid(inode, CAP_DAC_OVERRIDE))
+		if (capable_wrt_inode_uidgid(&init_user_ns, inode,
+					     CAP_DAC_OVERRIDE))
 			return 0;
 		return -EACCES;
 	}
@@ -370,7 +371,8 @@ int generic_permission(struct inode *inode, int mask)
 	 */
 	mask &= MAY_READ | MAY_WRITE | MAY_EXEC;
 	if (mask == MAY_READ)
-		if (capable_wrt_inode_uidgid(inode, CAP_DAC_READ_SEARCH))
+		if (capable_wrt_inode_uidgid(&init_user_ns, inode,
+					     CAP_DAC_READ_SEARCH))
 			return 0;
 	/*
 	 * Read/write DACs are always overridable.
@@ -378,7 +380,8 @@ int generic_permission(struct inode *inode, int mask)
 	 * at least one exec bit set.
 	 */
 	if (!(mask & MAY_EXEC) || (inode->i_mode & S_IXUGO))
-		if (capable_wrt_inode_uidgid(inode, CAP_DAC_OVERRIDE))
+		if (capable_wrt_inode_uidgid(&init_user_ns, inode,
+					     CAP_DAC_OVERRIDE))
 			return 0;
 
 	return -EACCES;
@@ -2657,7 +2660,7 @@ int __check_sticky(struct inode *dir, struct inode *inode)
 		return 0;
 	if (uid_eq(dir->i_uid, fsuid))
 		return 0;
-	return !capable_wrt_inode_uidgid(inode, CAP_FOWNER);
+	return !capable_wrt_inode_uidgid(&init_user_ns, inode, CAP_FOWNER);
 }
 EXPORT_SYMBOL(__check_sticky);
 
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 290983bcfbb3..196fe3e3f02b 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -972,7 +972,7 @@ ovl_posix_acl_xattr_set(const struct xattr_handler *handler,
 	if (unlikely(inode->i_mode & S_ISGID) &&
 	    handler->flags == ACL_TYPE_ACCESS &&
 	    !in_group_p(inode->i_gid) &&
-	    !capable_wrt_inode_uidgid(inode, CAP_FSETID)) {
+	    !capable_wrt_inode_uidgid(&init_user_ns, inode, CAP_FSETID)) {
 		struct iattr iattr = { .ia_valid = ATTR_KILL_SGID };
 
 		err = ovl_setattr(dentry, &iattr);
diff --git a/fs/posix_acl.c b/fs/posix_acl.c
index 95882b3f5f62..4ca6d53c6f0a 100644
--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@ -656,7 +656,7 @@ int posix_acl_update_mode(struct inode *inode, umode_t *mode_p,
 	if (error == 0)
 		*acl = NULL;
 	if (!in_group_p(inode->i_gid) &&
-	    !capable_wrt_inode_uidgid(inode, CAP_FSETID))
+	    !capable_wrt_inode_uidgid(&init_user_ns, inode, CAP_FSETID))
 		mode &= ~S_ISGID;
 	*mode_p = mode;
 	return 0;
diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index 3fbd98f61ea5..97bd29fc8c43 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -1502,7 +1502,7 @@ xfs_ioctl_setattr(
 	 */
 
 	if ((VFS_I(ip)->i_mode & (S_ISUID|S_ISGID)) &&
-	    !capable_wrt_inode_uidgid(VFS_I(ip), CAP_FSETID))
+	    !capable_wrt_inode_uidgid(&init_user_ns, VFS_I(ip), CAP_FSETID))
 		VFS_I(ip)->i_mode &= ~(S_ISUID|S_ISGID);
 
 	/* Change the ownerships and register project quota modifications */
diff --git a/include/linux/capability.h b/include/linux/capability.h
index 1e7fe311cabe..041e336f3369 100644
--- a/include/linux/capability.h
+++ b/include/linux/capability.h
@@ -247,8 +247,11 @@ static inline bool ns_capable_setid(struct user_namespace *ns, int cap)
 	return true;
 }
 #endif /* CONFIG_MULTIUSER */
-extern bool privileged_wrt_inode_uidgid(struct user_namespace *ns, const struct inode *inode);
-extern bool capable_wrt_inode_uidgid(const struct inode *inode, int cap);
+extern bool privileged_wrt_inode_uidgid(struct user_namespace *ns,
+					struct user_namespace *mnt_user_ns,
+					const struct inode *inode);
+extern bool capable_wrt_inode_uidgid(struct user_namespace *mnt_user_ns,
+				     const struct inode *inode, int cap);
 extern bool file_ns_capable(const struct file *file, struct user_namespace *ns, int cap);
 extern bool ptracer_capable(struct task_struct *tsk, struct user_namespace *ns);
 static inline bool perfmon_capable(void)
diff --git a/kernel/capability.c b/kernel/capability.c
index de7eac903a2a..28e3a599ff7a 100644
--- a/kernel/capability.c
+++ b/kernel/capability.c
@@ -484,10 +484,12 @@ EXPORT_SYMBOL(file_ns_capable);
  *
  * Return true if the inode uid and gid are within the namespace.
  */
-bool privileged_wrt_inode_uidgid(struct user_namespace *ns, const struct inode *inode)
+bool privileged_wrt_inode_uidgid(struct user_namespace *ns,
+				 struct user_namespace *mnt_user_ns,
+				 const struct inode *inode)
 {
-	return kuid_has_mapping(ns, inode->i_uid) &&
-		kgid_has_mapping(ns, inode->i_gid);
+	return kuid_has_mapping(ns, i_uid_into_mnt(mnt_user_ns, inode)) &&
+	       kgid_has_mapping(ns, i_gid_into_mnt(mnt_user_ns, inode));
 }
 
 /**
@@ -499,11 +501,13 @@ bool privileged_wrt_inode_uidgid(struct user_namespace *ns, const struct inode *
  * its own user namespace and that the given inode's uid and gid are
  * mapped into the current user namespace.
  */
-bool capable_wrt_inode_uidgid(const struct inode *inode, int cap)
+bool capable_wrt_inode_uidgid(struct user_namespace *mnt_user_ns,
+			      const struct inode *inode, int cap)
 {
 	struct user_namespace *ns = current_user_ns();
 
-	return ns_capable(ns, cap) && privileged_wrt_inode_uidgid(ns, inode);
+	return ns_capable(ns, cap) &&
+	       privileged_wrt_inode_uidgid(ns, mnt_user_ns, inode);
 }
 EXPORT_SYMBOL(capable_wrt_inode_uidgid);
 
diff --git a/security/commoncap.c b/security/commoncap.c
index 59bf3c1674c8..4cd2bdfd0a8b 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -489,7 +489,7 @@ int cap_convert_nscap(struct dentry *dentry, void **ivalue, size_t size)
 		return -EINVAL;
 	if (!validheader(size, cap))
 		return -EINVAL;
-	if (!capable_wrt_inode_uidgid(inode, CAP_SETFCAP))
+	if (!capable_wrt_inode_uidgid(&init_user_ns, inode, CAP_SETFCAP))
 		return -EPERM;
 	if (size == XATTR_CAPS_SZ_2)
 		if (ns_capable(inode->i_sb->s_user_ns, CAP_SETFCAP))
@@ -957,7 +957,8 @@ int cap_inode_removexattr(struct dentry *dentry, const char *name)
 		struct inode *inode = d_backing_inode(dentry);
 		if (!inode)
 			return -EINVAL;
-		if (!capable_wrt_inode_uidgid(inode, CAP_SETFCAP))
+		if (!capable_wrt_inode_uidgid(&init_user_ns, inode,
+					      CAP_SETFCAP))
 			return -EPERM;
 		return 0;
 	}
-- 
2.29.2

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


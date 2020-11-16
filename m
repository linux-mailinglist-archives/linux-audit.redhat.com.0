Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6524A2B3B5B
	for <lists+linux-audit@lfdr.de>; Mon, 16 Nov 2020 03:15:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-lud2tzGyP_Gl-_jc3UinsA-1; Sun, 15 Nov 2020 21:15:38 -0500
X-MC-Unique: lud2tzGyP_Gl-_jc3UinsA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F16EC6D24A;
	Mon, 16 Nov 2020 02:15:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D566560C43;
	Mon, 16 Nov 2020 02:15:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7F43181A869;
	Mon, 16 Nov 2020 02:15:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AFAdcfN025261 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 15 Nov 2020 05:39:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B958D112D438; Sun, 15 Nov 2020 10:39:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4321112D432
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:39:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 553B51823603
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:39:36 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-10-sb6_KSa4PXSAQYASZO5uvw-1; Sun, 15 Nov 2020 05:39:33 -0500
X-MC-Unique: sb6_KSa4PXSAQYASZO5uvw-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1keFR8-0000Kt-Jv; Sun, 15 Nov 2020 10:39:10 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 19/39] open: handle idmapped mounts in do_truncate()
Date: Sun, 15 Nov 2020 11:36:58 +0100
Message-Id: <20201115103718.298186-20-christian.brauner@ubuntu.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

When truncating files the vfs will verify that the caller is privileged
over the inode. Since the do_truncate() helper is only used in a few places
in the vfs code extend it to handle idmapped mounts instead of adding a new
helper.  If the inode is accessed through an idmapped mount it is mapped
according to the mount's user namespace. Afterwards the permissions checks
are identical to non-idmapped mounts. If the initial user namespace is
passed all mapping operations are a nop so non-idmapped mounts will not see
a change in behavior and will also not see any performance impact.

Cc: Christoph Hellwig <hch@lst.de>
Cc: David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
/* v2 */
unchanged
---
 fs/coredump.c      | 12 +++++++++---
 fs/inode.c         | 13 +++++++++----
 fs/namei.c         |  6 +++---
 fs/open.c          | 21 +++++++++++++--------
 include/linux/fs.h |  4 ++--
 5 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/fs/coredump.c b/fs/coredump.c
index 0cd9056d79cc..25beac7230ff 100644
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@ -703,6 +703,7 @@ void do_coredump(const kernel_siginfo_t *siginfo)
 			goto close_fail;
 		}
 	} else {
+		struct user_namespace *user_ns;
 		struct inode *inode;
 		int open_flags = O_CREAT | O_RDWR | O_NOFOLLOW |
 				 O_LARGEFILE | O_EXCL;
@@ -786,7 +787,8 @@ void do_coredump(const kernel_siginfo_t *siginfo)
 			goto close_fail;
 		if (!(cprm.file->f_mode & FMODE_CAN_WRITE))
 			goto close_fail;
-		if (do_truncate(cprm.file->f_path.dentry, 0, 0, cprm.file))
+		user_ns = mnt_user_ns(cprm.file->f_path.mnt);
+		if (do_truncate(user_ns, cprm.file->f_path.dentry, 0, 0, cprm.file))
 			goto close_fail;
 	}
 
@@ -931,8 +933,12 @@ void dump_truncate(struct coredump_params *cprm)
 
 	if (file->f_op->llseek && file->f_op->llseek != no_llseek) {
 		offset = file->f_op->llseek(file, 0, SEEK_CUR);
-		if (i_size_read(file->f_mapping->host) < offset)
-			do_truncate(file->f_path.dentry, offset, 0, file);
+		if (i_size_read(file->f_mapping->host) < offset) {
+			struct user_namespace *user_ns;
+
+			user_ns = mnt_user_ns(file->f_path.mnt);
+			do_truncate(user_ns, file->f_path.dentry, offset, 0, file);
+		}
 	}
 }
 EXPORT_SYMBOL(dump_truncate);
diff --git a/fs/inode.c b/fs/inode.c
index 75c64f003c45..0ccdd673636d 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1904,7 +1904,8 @@ int dentry_needs_remove_privs(struct dentry *dentry)
 	return mask;
 }
 
-static int __remove_privs(struct dentry *dentry, int kill)
+static int __remove_privs(struct user_namespace *user_ns, struct dentry *dentry,
+			  int kill)
 {
 	struct iattr newattrs;
 
@@ -1913,7 +1914,7 @@ static int __remove_privs(struct dentry *dentry, int kill)
 	 * Note we call this on write, so notify_change will not
 	 * encounter any conflicting delegations:
 	 */
-	return notify_change(&init_user_ns, dentry, &newattrs, NULL);
+	return notify_change(user_ns, dentry, &newattrs, NULL);
 }
 
 /*
@@ -1939,8 +1940,12 @@ int file_remove_privs(struct file *file)
 	kill = dentry_needs_remove_privs(dentry);
 	if (kill < 0)
 		return kill;
-	if (kill)
-		error = __remove_privs(dentry, kill);
+	if (kill) {
+		struct user_namespace *user_ns;
+
+		user_ns = mnt_user_ns(file->f_path.mnt);
+		error = __remove_privs(user_ns, dentry, kill);
+	}
 	if (!error)
 		inode_has_no_xattr(inode);
 
diff --git a/fs/namei.c b/fs/namei.c
index b91bf923d22c..5601b6680d4c 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2940,9 +2940,9 @@ static int handle_truncate(struct file *filp)
 	if (!error)
 		error = security_path_truncate(path);
 	if (!error) {
-		error = do_truncate(path->dentry, 0,
-				    ATTR_MTIME|ATTR_CTIME|ATTR_OPEN,
-				    filp);
+		error = do_truncate(mnt_user_ns(filp->f_path.mnt),
+				    path->dentry, 0,
+				    ATTR_MTIME | ATTR_CTIME | ATTR_OPEN, filp);
 	}
 	put_write_access(inode);
 	return error;
diff --git a/fs/open.c b/fs/open.c
index 2dc94689a7dc..137dcc52d2f8 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -35,8 +35,8 @@
 
 #include "internal.h"
 
-int do_truncate(struct dentry *dentry, loff_t length, unsigned int time_attrs,
-	struct file *filp)
+int do_truncate(struct user_namespace *user_ns, struct dentry *dentry,
+		loff_t length, unsigned int time_attrs, struct file *filp)
 {
 	int ret;
 	struct iattr newattrs;
@@ -61,13 +61,14 @@ int do_truncate(struct dentry *dentry, loff_t length, unsigned int time_attrs,
 
 	inode_lock(dentry->d_inode);
 	/* Note any delegations or leases have already been broken: */
-	ret = notify_change(&init_user_ns, dentry, &newattrs, NULL);
+	ret = notify_change(user_ns, dentry, &newattrs, NULL);
 	inode_unlock(dentry->d_inode);
 	return ret;
 }
 
 long vfs_truncate(const struct path *path, loff_t length)
 {
+	struct user_namespace *user_ns;
 	struct inode *inode;
 	long error;
 
@@ -83,7 +84,8 @@ long vfs_truncate(const struct path *path, loff_t length)
 	if (error)
 		goto out;
 
-	error = inode_permission(&init_user_ns, inode, MAY_WRITE);
+	user_ns = mnt_user_ns(path->mnt);
+	error = inode_permission(user_ns, inode, MAY_WRITE);
 	if (error)
 		goto mnt_drop_write_and_out;
 
@@ -107,7 +109,7 @@ long vfs_truncate(const struct path *path, loff_t length)
 	if (!error)
 		error = security_path_truncate(path);
 	if (!error)
-		error = do_truncate(path->dentry, length, 0, NULL);
+		error = do_truncate(user_ns, path->dentry, length, 0, NULL);
 
 put_write_and_out:
 	put_write_access(inode);
@@ -186,13 +188,16 @@ long do_sys_ftruncate(unsigned int fd, loff_t length, int small)
 	/* Check IS_APPEND on real upper inode */
 	if (IS_APPEND(file_inode(f.file)))
 		goto out_putf;
-
 	sb_start_write(inode->i_sb);
 	error = locks_verify_truncate(inode, f.file, length);
 	if (!error)
 		error = security_path_truncate(&f.file->f_path);
-	if (!error)
-		error = do_truncate(dentry, length, ATTR_MTIME|ATTR_CTIME, f.file);
+	if (!error) {
+		struct user_namespace *user_ns;
+
+		user_ns = mnt_user_ns(f.file->f_path.mnt);
+		error = do_truncate(user_ns, dentry, length, ATTR_MTIME | ATTR_CTIME, f.file);
+	}
 	sb_end_write(inode->i_sb);
 out_putf:
 	fdput(f);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index f29909139838..1f2ec4c3c70b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2565,8 +2565,8 @@ struct filename {
 static_assert(offsetof(struct filename, iname) % sizeof(long) == 0);
 
 extern long vfs_truncate(const struct path *, loff_t);
-extern int do_truncate(struct dentry *, loff_t start, unsigned int time_attrs,
-		       struct file *filp);
+extern int do_truncate(struct user_namespace *, struct dentry *, loff_t start,
+		       unsigned int time_attrs, struct file *filp);
 extern int vfs_fallocate(struct file *file, int mode, loff_t offset,
 			loff_t len);
 extern long do_sys_open(int dfd, const char __user *filename, int flags,
-- 
2.29.2

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


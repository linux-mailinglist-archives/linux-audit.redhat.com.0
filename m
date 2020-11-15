Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EAECC2B3B66
	for <lists+linux-audit@lfdr.de>; Mon, 16 Nov 2020 03:15:48 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-fHtBq_54PjKKkAvOZVUBsA-1; Sun, 15 Nov 2020 21:15:46 -0500
X-MC-Unique: fHtBq_54PjKKkAvOZVUBsA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DFF880403D;
	Mon, 16 Nov 2020 02:15:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F6B71002C07;
	Mon, 16 Nov 2020 02:15:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 21D5C58110;
	Mon, 16 Nov 2020 02:15:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AFAmrTb026041 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 15 Nov 2020 05:48:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 244FD202279A; Sun, 15 Nov 2020 10:48:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C179206323A
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:48:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEE39186E296
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:48:52 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-590-6KrZHttNMCyehbPmpmWC8A-1; Sun, 15 Nov 2020 05:48:46 -0500
X-MC-Unique: 6KrZHttNMCyehbPmpmWC8A-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1keFRC-0000Kt-3n; Sun, 15 Nov 2020 10:39:14 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 20/39] open: handle idmapped mounts
Date: Sun, 15 Nov 2020 11:36:59 +0100
Message-Id: <20201115103718.298186-21-christian.brauner@ubuntu.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For core file operations such as changing directories or chrooting,
determining file access, changing mode or ownership the vfs will verify
that the caller is privileged over the inode. Extend the various helpers to
handle idmapped mounts. If the inode is accessed through an idmapped mount
it is mapped according to the mount's user namespace.  Afterwards the
permissions checks are identical to non-idmapped mounts.  When changing
file ownership we need to map the mount from the mount's user namespace. If
the initial user namespace is passed all mapping operations are a nop so
non-idmapped mounts will not see a change in behavior and will also not see
any performance impact.

Cc: Christoph Hellwig <hch@lst.de>
Cc: David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
/* v2 */
unchanged
---
 fs/open.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/fs/open.c b/fs/open.c
index 137dcc52d2f8..2e2eb55976b1 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -401,6 +401,7 @@ static const struct cred *access_override_creds(void)
 
 static long do_faccessat(int dfd, const char __user *filename, int mode, int flags)
 {
+	struct user_namespace *user_ns;
 	struct path path;
 	struct inode *inode;
 	int res;
@@ -441,7 +442,8 @@ static long do_faccessat(int dfd, const char __user *filename, int mode, int fla
 			goto out_path_release;
 	}
 
-	res = inode_permission(&init_user_ns, inode, mode | MAY_ACCESS);
+	user_ns = mnt_user_ns(path.mnt);
+	res = inode_permission(user_ns, inode, mode | MAY_ACCESS);
 	/* SuS v2 requires we report a read only fs too */
 	if (res || !(mode & S_IWOTH) || special_file(inode->i_mode))
 		goto out_path_release;
@@ -489,6 +491,7 @@ SYSCALL_DEFINE2(access, const char __user *, filename, int, mode)
 
 SYSCALL_DEFINE1(chdir, const char __user *, filename)
 {
+	struct user_namespace *user_ns;
 	struct path path;
 	int error;
 	unsigned int lookup_flags = LOOKUP_FOLLOW | LOOKUP_DIRECTORY;
@@ -497,7 +500,8 @@ SYSCALL_DEFINE1(chdir, const char __user *, filename)
 	if (error)
 		goto out;
 
-	error = inode_permission(&init_user_ns, path.dentry->d_inode, MAY_EXEC | MAY_CHDIR);
+	user_ns = mnt_user_ns(path.mnt);
+	error = inode_permission(user_ns, path.dentry->d_inode, MAY_EXEC | MAY_CHDIR);
 	if (error)
 		goto dput_and_out;
 
@@ -515,6 +519,7 @@ SYSCALL_DEFINE1(chdir, const char __user *, filename)
 
 SYSCALL_DEFINE1(fchdir, unsigned int, fd)
 {
+	struct user_namespace *user_ns;
 	struct fd f = fdget_raw(fd);
 	int error;
 
@@ -526,7 +531,8 @@ SYSCALL_DEFINE1(fchdir, unsigned int, fd)
 	if (!d_can_lookup(f.file->f_path.dentry))
 		goto out_putf;
 
-	error = inode_permission(&init_user_ns, file_inode(f.file), MAY_EXEC | MAY_CHDIR);
+	user_ns = mnt_user_ns(f.file->f_path.mnt);
+	error = inode_permission(user_ns, file_inode(f.file), MAY_EXEC | MAY_CHDIR);
 	if (!error)
 		set_fs_pwd(current->fs, &f.file->f_path);
 out_putf:
@@ -537,6 +543,7 @@ SYSCALL_DEFINE1(fchdir, unsigned int, fd)
 
 SYSCALL_DEFINE1(chroot, const char __user *, filename)
 {
+	struct user_namespace *user_ns;
 	struct path path;
 	int error;
 	unsigned int lookup_flags = LOOKUP_FOLLOW | LOOKUP_DIRECTORY;
@@ -545,7 +552,8 @@ SYSCALL_DEFINE1(chroot, const char __user *, filename)
 	if (error)
 		goto out;
 
-	error = inode_permission(&init_user_ns, path.dentry->d_inode, MAY_EXEC | MAY_CHDIR);
+	user_ns = mnt_user_ns(path.mnt);
+	error = inode_permission(user_ns, path.dentry->d_inode, MAY_EXEC | MAY_CHDIR);
 	if (error)
 		goto dput_and_out;
 
@@ -570,6 +578,7 @@ SYSCALL_DEFINE1(chroot, const char __user *, filename)
 
 int chmod_common(const struct path *path, umode_t mode)
 {
+	struct user_namespace *user_ns;
 	struct inode *inode = path->dentry->d_inode;
 	struct inode *delegated_inode = NULL;
 	struct iattr newattrs;
@@ -585,7 +594,8 @@ int chmod_common(const struct path *path, umode_t mode)
 		goto out_unlock;
 	newattrs.ia_mode = (mode & S_IALLUGO) | (inode->i_mode & ~S_IALLUGO);
 	newattrs.ia_valid = ATTR_MODE | ATTR_CTIME;
-	error = notify_change(&init_user_ns, path->dentry, &newattrs, &delegated_inode);
+	user_ns = mnt_user_ns(path->mnt);
+	error = notify_change(user_ns, path->dentry, &newattrs, &delegated_inode);
 out_unlock:
 	inode_unlock(inode);
 	if (delegated_inode) {
@@ -646,6 +656,7 @@ SYSCALL_DEFINE2(chmod, const char __user *, filename, umode_t, mode)
 
 int chown_common(const struct path *path, uid_t user, gid_t group)
 {
+	struct user_namespace *user_ns;
 	struct inode *inode = path->dentry->d_inode;
 	struct inode *delegated_inode = NULL;
 	int error;
@@ -656,6 +667,12 @@ int chown_common(const struct path *path, uid_t user, gid_t group)
 	uid = make_kuid(current_user_ns(), user);
 	gid = make_kgid(current_user_ns(), group);
 
+	user_ns = mnt_user_ns(path->mnt);
+	if (mnt_idmapped(path->mnt)) {
+		uid = kuid_from_mnt(user_ns, uid);
+		gid = kgid_from_mnt(user_ns, gid);
+	}
+
 retry_deleg:
 	newattrs.ia_valid =  ATTR_CTIME;
 	if (user != (uid_t) -1) {
@@ -676,7 +693,7 @@ int chown_common(const struct path *path, uid_t user, gid_t group)
 	inode_lock(inode);
 	error = security_path_chown(path, uid, gid);
 	if (!error)
-		error = notify_change(&init_user_ns, path->dentry, &newattrs, &delegated_inode);
+		error = notify_change(user_ns, path->dentry, &newattrs, &delegated_inode);
 	inode_unlock(inode);
 	if (delegated_inode) {
 		error = break_deleg_wait(&delegated_inode);
@@ -1133,7 +1150,7 @@ struct file *filp_open(const char *filename, int flags, umode_t mode)
 {
 	struct filename *name = getname_kernel(filename);
 	struct file *file = ERR_CAST(name);
-	
+
 	if (!IS_ERR(name)) {
 		file = file_open_name(name, flags, mode);
 		putname(name);
-- 
2.29.2

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


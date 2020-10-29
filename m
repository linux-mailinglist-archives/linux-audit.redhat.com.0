Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1798C29EC28
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 13:46:00 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-p-bKRNa9PbOxnvdE0qRSMg-1; Thu, 29 Oct 2020 08:45:56 -0400
X-MC-Unique: p-bKRNa9PbOxnvdE0qRSMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A63291009E52;
	Thu, 29 Oct 2020 12:45:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51DBF1964A;
	Thu, 29 Oct 2020 12:45:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 255C258131;
	Thu, 29 Oct 2020 12:45:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09T0sT12023573 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 28 Oct 2020 20:54:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 872102086F71; Thu, 29 Oct 2020 00:54:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81C4E2086F68
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:54:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B4C3811E83
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:54:26 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-455-WkKU1agJPRmraz_kwr5MAw-1; Wed, 28 Oct 2020 20:54:24 -0400
X-MC-Unique: WkKU1agJPRmraz_kwr5MAw-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1kXvv6-0008Ep-K8; Thu, 29 Oct 2020 00:36:00 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH 28/34] audit: handle idmapped mounts
Date: Thu, 29 Oct 2020 01:32:46 +0100
Message-Id: <20201029003252.2128653-29-christian.brauner@ubuntu.com>
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
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:45:20 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Audit will sometimes log the inode's i_uid and i_gid. Enable audit to log the
mapped inode when it is accessed from an idmapped mount.

Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/namei.c            | 14 +++++++-------
 include/linux/audit.h | 10 ++++++----
 ipc/mqueue.c          |  8 ++++----
 kernel/auditsc.c      | 26 ++++++++++++++------------
 4 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index d6dbfab126d7..545ce391a12d 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -1006,7 +1006,7 @@ static inline int may_follow_link(struct nameidata *nd, const struct inode *inod
 	if (nd->flags & LOOKUP_RCU)
 		return -ECHILD;
 
-	audit_inode(nd->name, nd->stack[0].link.dentry, 0);
+	audit_inode(nd->name, user_ns, nd->stack[0].link.dentry, 0);
 	audit_log_path_denied(AUDIT_ANOM_LINK, "follow_link");
 	return -EACCES;
 }
@@ -2413,7 +2413,7 @@ int filename_lookup(int dfd, struct filename *name, unsigned flags,
 		retval = path_lookupat(&nd, flags | LOOKUP_REVAL, path);
 
 	if (likely(!retval))
-		audit_inode(name, path->dentry,
+		audit_inode(name, mnt_user_ns(path->mnt), path->dentry,
 			    flags & LOOKUP_MOUNTPOINT ? AUDIT_INODE_NOEVAL : 0);
 	restore_nameidata();
 	putname(name);
@@ -2455,7 +2455,7 @@ static struct filename *filename_parentat(int dfd, struct filename *name,
 	if (likely(!retval)) {
 		*last = nd.last;
 		*type = nd.last_type;
-		audit_inode(name, parent->dentry, AUDIT_INODE_PARENT);
+		audit_inode(name, mnt_user_ns(parent->mnt), parent->dentry, AUDIT_INODE_PARENT);
 	} else {
 		putname(name);
 		name = ERR_PTR(retval);
@@ -3239,7 +3239,7 @@ static const char *open_last_lookups(struct nameidata *nd,
 			if (unlikely(error))
 				return ERR_PTR(error);
 		}
-		audit_inode(nd->name, dir, AUDIT_INODE_PARENT);
+		audit_inode(nd->name, mnt_user_ns(nd->path.mnt), dir, AUDIT_INODE_PARENT);
 		/* trailing slashes? */
 		if (unlikely(nd->last.name[nd->last.len]))
 			return ERR_PTR(-EISDIR);
@@ -3305,7 +3305,7 @@ static int do_open(struct nameidata *nd,
 			return error;
 	}
 	if (!(file->f_mode & FMODE_CREATED))
-		audit_inode(nd->name, nd->path.dentry, 0);
+		audit_inode(nd->name, mnt_user_ns(nd->path.mnt), nd->path.dentry, 0);
 	if (open_flag & O_CREAT) {
 		if ((open_flag & O_EXCL) && !(file->f_mode & FMODE_CREATED))
 			return -EEXIST;
@@ -3414,7 +3414,7 @@ static int do_tmpfile(struct nameidata *nd, unsigned flags,
 		goto out2;
 	dput(path.dentry);
 	path.dentry = child;
-	audit_inode(nd->name, child, 0);
+	audit_inode(nd->name, user_ns, child, 0);
 	/* Don't check for other permissions, the inode was just created */
 	error = may_open(&path, 0, op->open_flag);
 	if (error)
@@ -3433,7 +3433,7 @@ static int do_o_path(struct nameidata *nd, unsigned flags, struct file *file)
 	struct path path;
 	int error = path_lookupat(nd, flags, &path);
 	if (!error) {
-		audit_inode(nd->name, path.dentry, 0);
+		audit_inode(nd->name, mnt_user_ns(path.mnt), path.dentry, 0);
 		error = vfs_open(&path, file);
 		path_put(&path);
 	}
diff --git a/include/linux/audit.h b/include/linux/audit.h
index b3d859831a31..217d2b0c273e 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -293,8 +293,8 @@ extern void __audit_syscall_exit(int ret_success, long ret_value);
 extern struct filename *__audit_reusename(const __user char *uptr);
 extern void __audit_getname(struct filename *name);
 extern void __audit_getcwd(void);
-extern void __audit_inode(struct filename *name, const struct dentry *dentry,
-				unsigned int flags);
+extern void __audit_inode(struct filename *name, struct user_namespace *user_ns,
+			  const struct dentry *dentry, unsigned int flags);
 extern void __audit_file(const struct file *);
 extern void __audit_inode_child(struct inode *parent,
 				const struct dentry *dentry,
@@ -357,10 +357,11 @@ static inline void audit_getcwd(void)
 		__audit_getcwd();
 }
 static inline void audit_inode(struct filename *name,
+				struct user_namespace *user_ns,
 				const struct dentry *dentry,
 				unsigned int aflags) {
 	if (unlikely(!audit_dummy_context()))
-		__audit_inode(name, dentry, aflags);
+		__audit_inode(name, user_ns, dentry, aflags);
 }
 static inline void audit_file(struct file *file)
 {
@@ -371,7 +372,7 @@ static inline void audit_inode_parent_hidden(struct filename *name,
 						const struct dentry *dentry)
 {
 	if (unlikely(!audit_dummy_context()))
-		__audit_inode(name, dentry,
+		__audit_inode(name, &init_user_ns, dentry,
 				AUDIT_INODE_PARENT | AUDIT_INODE_HIDDEN);
 }
 static inline void audit_inode_child(struct inode *parent,
@@ -587,6 +588,7 @@ static inline void audit_getname(struct filename *name)
 static inline void audit_getcwd(void)
 { }
 static inline void audit_inode(struct filename *name,
+				struct user_namespace *user_ns,
 				const struct dentry *dentry,
 				unsigned int aflags)
 { }
diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index beff0cfcd1e8..08ade6410563 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -849,8 +849,8 @@ static void remove_notification(struct mqueue_inode_info *info)
 	info->notify_user_ns = NULL;
 }
 
-static int prepare_open(struct dentry *dentry, int oflag, int ro,
-			umode_t mode, struct filename *name,
+static int prepare_open(struct user_namespace *user_ns, struct dentry *dentry,
+			int oflag, int ro, umode_t mode, struct filename *name,
 			struct mq_attr *attr)
 {
 	static const int oflag2acc[O_ACCMODE] = { MAY_READ, MAY_WRITE,
@@ -867,7 +867,7 @@ static int prepare_open(struct dentry *dentry, int oflag, int ro,
 				  mqueue_create_attr, attr);
 	}
 	/* it already existed */
-	audit_inode(name, dentry, 0);
+	audit_inode(name, user_ns, dentry, 0);
 	if ((oflag & (O_CREAT|O_EXCL)) == (O_CREAT|O_EXCL))
 		return -EEXIST;
 	if ((oflag & O_ACCMODE) == (O_RDWR | O_WRONLY))
@@ -903,7 +903,7 @@ static int do_mq_open(const char __user *u_name, int oflag, umode_t mode,
 		goto out_putfd;
 	}
 	path.mnt = mntget(mnt);
-	error = prepare_open(path.dentry, oflag, ro, mode, name, attr);
+	error = prepare_open(mnt_user_ns(path.mnt), path.dentry, oflag, ro, mode, name, attr);
 	if (!error) {
 		struct file *file = dentry_open(&path, oflag, current_cred());
 		if (!IS_ERR(file))
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 9cdecdea61d9..0dc26fcf4742 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1936,6 +1936,7 @@ void __audit_getname(struct filename *name)
 }
 
 static inline int audit_copy_fcaps(struct audit_names *name,
+				   struct user_namespace *user_ns,
 				   const struct dentry *dentry)
 {
 	struct cpu_vfs_cap_data caps;
@@ -1944,7 +1945,7 @@ static inline int audit_copy_fcaps(struct audit_names *name,
 	if (!dentry)
 		return 0;
 
-	rc = get_vfs_caps_from_disk(dentry, &caps);
+	rc = get_mapped_vfs_caps_from_disk(user_ns, dentry, &caps);
 	if (rc)
 		return rc;
 
@@ -1960,21 +1961,22 @@ static inline int audit_copy_fcaps(struct audit_names *name,
 
 /* Copy inode data into an audit_names. */
 static void audit_copy_inode(struct audit_names *name,
-			     const struct dentry *dentry,
-			     struct inode *inode, unsigned int flags)
+			     struct user_namespace *user_ns,
+			     const struct dentry *dentry, struct inode *inode,
+			     unsigned int flags)
 {
 	name->ino   = inode->i_ino;
 	name->dev   = inode->i_sb->s_dev;
 	name->mode  = inode->i_mode;
-	name->uid   = inode->i_uid;
-	name->gid   = inode->i_gid;
+	name->uid   = i_uid_into_mnt(user_ns, inode);
+	name->gid   = i_gid_into_mnt(user_ns, inode);
 	name->rdev  = inode->i_rdev;
 	security_inode_getsecid(inode, &name->osid);
 	if (flags & AUDIT_INODE_NOEVAL) {
 		name->fcap_ver = -1;
 		return;
 	}
-	audit_copy_fcaps(name, dentry);
+	audit_copy_fcaps(name, user_ns, dentry);
 }
 
 /**
@@ -1983,8 +1985,8 @@ static void audit_copy_inode(struct audit_names *name,
  * @dentry: dentry being audited
  * @flags: attributes for this particular entry
  */
-void __audit_inode(struct filename *name, const struct dentry *dentry,
-		   unsigned int flags)
+void __audit_inode(struct filename *name, struct user_namespace *user_ns,
+		   const struct dentry *dentry, unsigned int flags)
 {
 	struct audit_context *context = audit_context();
 	struct inode *inode = d_backing_inode(dentry);
@@ -2078,12 +2080,12 @@ void __audit_inode(struct filename *name, const struct dentry *dentry,
 		n->type = AUDIT_TYPE_NORMAL;
 	}
 	handle_path(dentry);
-	audit_copy_inode(n, dentry, inode, flags & AUDIT_INODE_NOEVAL);
+	audit_copy_inode(n, user_ns, dentry, inode, flags & AUDIT_INODE_NOEVAL);
 }
 
 void __audit_file(const struct file *file)
 {
-	__audit_inode(NULL, file->f_path.dentry, 0);
+	__audit_inode(NULL, mnt_user_ns(file->f_path.mnt), file->f_path.dentry, 0);
 }
 
 /**
@@ -2175,7 +2177,7 @@ void __audit_inode_child(struct inode *parent,
 		n = audit_alloc_name(context, AUDIT_TYPE_PARENT);
 		if (!n)
 			return;
-		audit_copy_inode(n, NULL, parent, 0);
+		audit_copy_inode(n, &init_user_ns, NULL, parent, 0);
 	}
 
 	if (!found_child) {
@@ -2194,7 +2196,7 @@ void __audit_inode_child(struct inode *parent,
 	}
 
 	if (inode)
-		audit_copy_inode(found_child, dentry, inode, 0);
+		audit_copy_inode(found_child, &init_user_ns, dentry, inode, 0);
 	else
 		found_child->ino = AUDIT_INO_UNSET;
 }
-- 
2.29.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


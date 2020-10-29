Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 406AE29EC2E
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 13:46:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-CZhPHmsWNi2dR_QMi3TGuw-1; Thu, 29 Oct 2020 08:46:05 -0400
X-MC-Unique: CZhPHmsWNi2dR_QMi3TGuw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 936471009E41;
	Thu, 29 Oct 2020 12:45:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72C1A5C22E;
	Thu, 29 Oct 2020 12:45:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4589058139;
	Thu, 29 Oct 2020 12:45:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09T0rDgO023312 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 28 Oct 2020 20:53:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 026ED215670A; Thu, 29 Oct 2020 00:53:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F16832156708
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:53:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7F7E811E8F
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:53:12 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-99-ZxrkiQwVOS6Q2rIkE6ZCGA-1; Wed, 28 Oct 2020 20:53:11 -0400
X-MC-Unique: ZxrkiQwVOS6Q2rIkE6ZCGA-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1kXvun-0008Ep-LI; Thu, 29 Oct 2020 00:35:41 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH 17/34] namei: introduce struct renamedata
Date: Thu, 29 Oct 2020 01:32:35 +0100
Message-Id: <20201029003252.2128653-18-christian.brauner@ubuntu.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In order to handle idmapped mounts we will extend the vfs rename helper
to take two new arguments in follow up patches. Since this operations already
takes a bunch of arguments add a simple struct renamedata (based on struct
nameidata) and make the current helper to use it before we extend it.

Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/namei.c | 144 ++++++++++++++++++++++++++++++++---------------------
 1 file changed, 88 insertions(+), 56 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index 76ee4d52bd5e..781f11795a22 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -4221,62 +4221,24 @@ SYSCALL_DEFINE2(link, const char __user *, oldname, const char __user *, newname
 	return do_linkat(AT_FDCWD, oldname, AT_FDCWD, newname, 0);
 }
 
-/**
- * vfs_rename - rename a filesystem object
- * @old_dir:	parent of source
- * @old_dentry:	source
- * @new_dir:	parent of destination
- * @new_dentry:	destination
- * @delegated_inode: returns an inode needing a delegation break
- * @flags:	rename flags
- *
- * The caller must hold multiple mutexes--see lock_rename()).
- *
- * If vfs_rename discovers a delegation in need of breaking at either
- * the source or destination, it will return -EWOULDBLOCK and return a
- * reference to the inode in delegated_inode.  The caller should then
- * break the delegation and retry.  Because breaking a delegation may
- * take a long time, the caller should drop all locks before doing
- * so.
- *
- * Alternatively, a caller may pass NULL for delegated_inode.  This may
- * be appropriate for callers that expect the underlying filesystem not
- * to be NFS exported.
- *
- * The worst of all namespace operations - renaming directory. "Perverted"
- * doesn't even start to describe it. Somebody in UCB had a heck of a trip...
- * Problems:
- *
- *	a) we can get into loop creation.
- *	b) race potential - two innocent renames can create a loop together.
- *	   That's where 4.4 screws up. Current fix: serialization on
- *	   sb->s_vfs_rename_mutex. We might be more accurate, but that's another
- *	   story.
- *	c) we have to lock _four_ objects - parents and victim (if it exists),
- *	   and source (if it is not a directory).
- *	   And that - after we got ->i_mutex on parents (until then we don't know
- *	   whether the target exists).  Solution: try to be smart with locking
- *	   order for inodes.  We rely on the fact that tree topology may change
- *	   only under ->s_vfs_rename_mutex _and_ that parent of the object we
- *	   move will be locked.  Thus we can rank directories by the tree
- *	   (ancestors first) and rank all non-directories after them.
- *	   That works since everybody except rename does "lock parent, lookup,
- *	   lock child" and rename is under ->s_vfs_rename_mutex.
- *	   HOWEVER, it relies on the assumption that any object with ->lookup()
- *	   has no more than 1 dentry.  If "hybrid" objects will ever appear,
- *	   we'd better make sure that there's no link(2) for them.
- *	d) conversion from fhandle to dentry may come in the wrong moment - when
- *	   we are removing the target. Solution: we will have to grab ->i_mutex
- *	   in the fhandle_to_dentry code. [FIXME - current nfsfh.c relies on
- *	   ->i_mutex on parents, which works but leads to some truly excessive
- *	   locking].
- */
-int vfs_rename(struct inode *old_dir, struct dentry *old_dentry,
-	       struct inode *new_dir, struct dentry *new_dentry,
-	       struct inode **delegated_inode, unsigned int flags)
+struct renamedata {
+	struct inode *old_dir;
+	struct dentry *old_dentry;
+	struct inode *new_dir;
+	struct dentry *new_dentry;
+	struct inode **delegated_inode;
+	unsigned int flags;
+} __randomize_layout;
+
+static int __vfs_rename(struct renamedata *rd)
 {
 	int error;
 	struct user_namespace *user_ns = &init_user_ns;
+	struct inode *old_dir = rd->old_dir, *new_dir = rd->new_dir;
+	struct dentry *old_dentry = rd->old_dentry,
+		      *new_dentry = rd->new_dentry;
+	struct inode **delegated_inode = rd->delegated_inode;
+	unsigned int flags = rd->flags;
 	bool is_dir = d_is_dir(old_dentry);
 	struct inode *source = old_dentry->d_inode;
 	struct inode *target = new_dentry->d_inode;
@@ -4395,11 +4357,76 @@ int vfs_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 	return error;
 }
+
+/**
+ * vfs_rename - rename a filesystem object
+ * @old_dir:	parent of source
+ * @old_dentry:	source
+ * @new_dir:	parent of destination
+ * @new_dentry:	destination
+ * @delegated_inode: returns an inode needing a delegation break
+ * @flags:	rename flags
+ *
+ * The caller must hold multiple mutexes--see lock_rename()).
+ *
+ * If vfs_rename discovers a delegation in need of breaking at either
+ * the source or destination, it will return -EWOULDBLOCK and return a
+ * reference to the inode in delegated_inode.  The caller should then
+ * break the delegation and retry.  Because breaking a delegation may
+ * take a long time, the caller should drop all locks before doing
+ * so.
+ *
+ * Alternatively, a caller may pass NULL for delegated_inode.  This may
+ * be appropriate for callers that expect the underlying filesystem not
+ * to be NFS exported.
+ *
+ * The worst of all namespace operations - renaming directory. "Perverted"
+ * doesn't even start to describe it. Somebody in UCB had a heck of a trip...
+ * Problems:
+ *
+ *	a) we can get into loop creation.
+ *	b) race potential - two innocent renames can create a loop together.
+ *	   That's where 4.4 screws up. Current fix: serialization on
+ *	   sb->s_vfs_rename_mutex. We might be more accurate, but that's another
+ *	   story.
+ *	c) we have to lock _four_ objects - parents and victim (if it exists),
+ *	   and source (if it is not a directory).
+ *	   And that - after we got ->i_mutex on parents (until then we don't know
+ *	   whether the target exists).  Solution: try to be smart with locking
+ *	   order for inodes.  We rely on the fact that tree topology may change
+ *	   only under ->s_vfs_rename_mutex _and_ that parent of the object we
+ *	   move will be locked.  Thus we can rank directories by the tree
+ *	   (ancestors first) and rank all non-directories after them.
+ *	   That works since everybody except rename does "lock parent, lookup,
+ *	   lock child" and rename is under ->s_vfs_rename_mutex.
+ *	   HOWEVER, it relies on the assumption that any object with ->lookup()
+ *	   has no more than 1 dentry.  If "hybrid" objects will ever appear,
+ *	   we'd better make sure that there's no link(2) for them.
+ *	d) conversion from fhandle to dentry may come in the wrong moment - when
+ *	   we are removing the target. Solution: we will have to grab ->i_mutex
+ *	   in the fhandle_to_dentry code. [FIXME - current nfsfh.c relies on
+ *	   ->i_mutex on parents, which works but leads to some truly excessive
+ *	   locking].
+ */
+int vfs_rename(struct inode *old_dir, struct dentry *old_dentry,
+	       struct inode *new_dir, struct dentry *new_dentry,
+	       struct inode **delegated_inode, unsigned int flags)
+{
+	struct renamedata rd = {
+		.old_dir	 = old_dir,
+		.new_dir	 = new_dir,
+		.old_dentry	 = old_dentry,
+		.delegated_inode = delegated_inode,
+		.flags		 = flags,
+	};
+	return __vfs_rename(&rd);
+}
 EXPORT_SYMBOL(vfs_rename);
 
 static int do_renameat2(int olddfd, const char __user *oldname, int newdfd,
 			const char __user *newname, unsigned int flags)
 {
+	struct renamedata rd;
 	struct dentry *old_dentry, *new_dentry;
 	struct dentry *trap;
 	struct path old_path, new_path;
@@ -4505,9 +4532,14 @@ static int do_renameat2(int olddfd, const char __user *oldname, int newdfd,
 				     &new_path, new_dentry, flags);
 	if (error)
 		goto exit5;
-	error = vfs_rename(old_path.dentry->d_inode, old_dentry,
-			   new_path.dentry->d_inode, new_dentry,
-			   &delegated_inode, flags);
+
+	rd.old_dir	   = old_path.dentry->d_inode;
+	rd.old_dentry	   = old_dentry;
+	rd.new_dir	   = new_path.dentry->d_inode;
+	rd.new_dentry	   = new_dentry;
+	rd.delegated_inode = &delegated_inode;
+	rd.flags	   = flags;
+	error = __vfs_rename(&rd);
 exit5:
 	dput(new_dentry);
 exit4:
-- 
2.29.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


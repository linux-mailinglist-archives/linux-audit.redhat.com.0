Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B75A229EC1E
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 13:45:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-YeFa19FbOyeVEBdOAWCu0A-1; Thu, 29 Oct 2020 08:45:47 -0400
X-MC-Unique: YeFa19FbOyeVEBdOAWCu0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B78A918B9EEF;
	Thu, 29 Oct 2020 12:45:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F7E45C26A;
	Thu, 29 Oct 2020 12:45:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1616158116;
	Thu, 29 Oct 2020 12:45:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09T0plJX022990 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 28 Oct 2020 20:51:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ECF18215670A; Thu, 29 Oct 2020 00:51:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E82072156708
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:51:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEC5C858280
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:51:46 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-161-k2IovQLlPi-pe20HJClm3A-1; Wed, 28 Oct 2020 20:51:44 -0400
X-MC-Unique: k2IovQLlPi-pe20HJClm3A-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1kXvuj-0008Ep-Ic; Thu, 29 Oct 2020 00:35:37 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH 15/34] stat: add mapped_generic_fillattr()
Date: Thu, 29 Oct 2020 01:32:33 +0100
Message-Id: <20201029003252.2128653-16-christian.brauner@ubuntu.com>
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

The generic_fillattr() helper fills in the basic attributes associated with an
inode. Add a mapped_generic_fillattr() helper to handle idmapped mounts. If the
inode is accessed through an idmapped mount we need to map it according to the
mount's user namespace. If the initial user namespace is passed all operations
are a nop so non-idmapped mounts will not see a change in behavior and will
also not see any performance impact. This also means that the
non-idmapped-mount aware generic_fillattr() helper can be implemented on top of
the idmapped-mount aware mapped_generic_fillattr() helper.

Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/stat.c          | 18 +++++++++++++-----
 include/linux/fs.h |  1 +
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/fs/stat.c b/fs/stat.c
index dacecdda2e79..ee6d92aec7ac 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -25,7 +25,8 @@
 #include "mount.h"
 
 /**
- * generic_fillattr - Fill in the basic attributes from the inode struct
+ * mapped_generic_fillattr - Fill in the basic attributes from the inode struct on idmapped mounts
+ * @user_ns: the user namespace from which we access this inode
  * @inode: Inode to use as the source
  * @stat: Where to fill in the attributes
  *
@@ -33,14 +34,15 @@
  * found on the VFS inode structure.  This is the default if no getattr inode
  * operation is supplied.
  */
-void generic_fillattr(struct inode *inode, struct kstat *stat)
+void mapped_generic_fillattr(struct user_namespace *mnt_user_ns,
+			 struct inode *inode, struct kstat *stat)
 {
 	stat->dev = inode->i_sb->s_dev;
 	stat->ino = inode->i_ino;
 	stat->mode = inode->i_mode;
 	stat->nlink = inode->i_nlink;
-	stat->uid = inode->i_uid;
-	stat->gid = inode->i_gid;
+	stat->uid = i_uid_into_mnt(mnt_user_ns, inode);
+	stat->gid = i_gid_into_mnt(mnt_user_ns, inode);
 	stat->rdev = inode->i_rdev;
 	stat->size = i_size_read(inode);
 	stat->atime = inode->i_atime;
@@ -49,6 +51,12 @@ void generic_fillattr(struct inode *inode, struct kstat *stat)
 	stat->blksize = i_blocksize(inode);
 	stat->blocks = inode->i_blocks;
 }
+EXPORT_SYMBOL(mapped_generic_fillattr);
+
+void generic_fillattr(struct inode *inode, struct kstat *stat)
+{
+	mapped_generic_fillattr(&init_user_ns, inode, stat);
+}
 EXPORT_SYMBOL(generic_fillattr);
 
 /**
@@ -87,7 +95,7 @@ int vfs_getattr_nosec(const struct path *path, struct kstat *stat,
 		return inode->i_op->getattr(path, stat, request_mask,
 					    query_flags);
 
-	generic_fillattr(inode, stat);
+	mapped_generic_fillattr(mnt_user_ns(path->mnt), inode, stat);
 	return 0;
 }
 EXPORT_SYMBOL(vfs_getattr_nosec);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index f41d93b0e6d7..e66852dee65d 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3162,6 +3162,7 @@ extern int page_symlink(struct inode *inode, const char *symname, int len);
 extern const struct inode_operations page_symlink_inode_operations;
 extern void kfree_link(void *);
 extern void generic_fillattr(struct inode *, struct kstat *);
+extern void mapped_generic_fillattr(struct user_namespace *, struct inode *, struct kstat *);
 extern int vfs_getattr_nosec(const struct path *, struct kstat *, u32, unsigned int);
 extern int vfs_getattr(const struct path *, struct kstat *, u32, unsigned int);
 void __inode_add_bytes(struct inode *inode, loff_t bytes);
-- 
2.29.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


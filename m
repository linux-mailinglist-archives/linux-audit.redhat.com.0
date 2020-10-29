Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EFE9F29EC22
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 13:45:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-yaf8da0COwCpFnk8bpv7dg-1; Thu, 29 Oct 2020 08:45:50 -0400
X-MC-Unique: yaf8da0COwCpFnk8bpv7dg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C772018B9ED7;
	Thu, 29 Oct 2020 12:45:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A72865C26C;
	Thu, 29 Oct 2020 12:45:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 744A8181A06E;
	Thu, 29 Oct 2020 12:45:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09T0qCYv023093 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 28 Oct 2020 20:52:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 23251110DBC0; Thu, 29 Oct 2020 00:52:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F53A110DBC1
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:52:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3A1A8D632F
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:52:09 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-477-v837TY-YNECKx21fzPS-nA-1; Wed, 28 Oct 2020 20:52:07 -0400
X-MC-Unique: v837TY-YNECKx21fzPS-nA-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1kXvuZ-0008Ep-AG; Thu, 29 Oct 2020 00:35:27 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH 09/34] inode: add idmapped mount aware init and permission
	helpers
Date: Thu, 29 Oct 2020 01:32:27 +0100
Message-Id: <20201029003252.2128653-10-christian.brauner@ubuntu.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The inode_owner_or_capable() helper determines whether the caller is the
owner of the inode or is capable with respect to that inode. Add a new
mapped_inode_owner_or_capable() helper to handle idmapped mounts. If the
If the inode is accessed through an idmapped mount we first need to map
it according to the mount's user namespace. Afterwards the checks are
identical to non-idmapped mounts. If the initial user namespace is
passed all operations are a nop so non-idmapped mounts will not see a
change in behavior and will also not see any performance impact. It also
means that the inode_owner_or_capable() helper can be implemented on top
of mapped_inode_owner_or_capable() by passing in the initial user
namespace.

Similarly, we add a new mapped_inode_init_owner() helper which
initializes a new inode on idmapped mounts by mapping the fsuid and
fsgid of the caller from the mount's user namespace. If the initial user
namespace is passed all operations are a nop so non-idmapped mounts will
not see a change in behavior and will also not see any performance
impact. It also means that the inode_init_owner() helper can be
implemented on top of mapped_inode_init_owner() by passing in the
initial user namespace.

Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/inode.c         | 53 ++++++++++++++++++++++++++++++++++++----------
 include/linux/fs.h |  4 ++++
 2 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 9d78c37b00b8..22de3cb3b1f4 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2130,15 +2130,17 @@ void init_special_inode(struct inode *inode, umode_t mode, dev_t rdev)
 EXPORT_SYMBOL(init_special_inode);
 
 /**
- * inode_init_owner - Init uid,gid,mode for new inode according to posix standards
+ * mapped_inode_init_owner - Init uid,gid,mode for new inode according to posix
+ *                           standards on idmapped mounts
  * @inode: New inode
+ * @user_ns: User namespace the inode is accessed from
  * @dir: Directory inode
  * @mode: mode of the new inode
  */
-void inode_init_owner(struct inode *inode, const struct inode *dir,
-			umode_t mode)
+void mapped_inode_init_owner(struct inode *inode, struct user_namespace *user_ns,
+			 const struct inode *dir, umode_t mode)
 {
-	inode->i_uid = current_fsuid();
+	inode->i_uid = fsuid_into_mnt(user_ns);
 	if (dir && dir->i_mode & S_ISGID) {
 		inode->i_gid = dir->i_gid;
 
@@ -2146,34 +2148,63 @@ void inode_init_owner(struct inode *inode, const struct inode *dir,
 		if (S_ISDIR(mode))
 			mode |= S_ISGID;
 		else if ((mode & (S_ISGID | S_IXGRP)) == (S_ISGID | S_IXGRP) &&
-			 !in_group_p(inode->i_gid) &&
-			 !capable_wrt_inode_uidgid(dir, CAP_FSETID))
+			 !in_group_p(i_gid_into_mnt(user_ns, inode)) &&
+			 !capable_wrt_mapped_inode_uidgid(user_ns, dir, CAP_FSETID))
 			mode &= ~S_ISGID;
 	} else
-		inode->i_gid = current_fsgid();
+		inode->i_gid = fsgid_into_mnt(user_ns);
 	inode->i_mode = mode;
 }
+EXPORT_SYMBOL(mapped_inode_init_owner);
+
+/**
+ * inode_init_owner - Init uid,gid,mode for new inode according to posix standards
+ * @inode: New inode
+ * @dir: Directory inode
+ * @mode: mode of the new inode
+ */
+void inode_init_owner(struct inode *inode, const struct inode *dir,
+			umode_t mode)
+{
+	return mapped_inode_init_owner(inode, &init_user_ns, dir, mode);
+}
 EXPORT_SYMBOL(inode_init_owner);
 
 /**
- * inode_owner_or_capable - check current task permissions to inode
+ * mapped_inode_owner_or_capable - check current task permissions to inode on idmapped mounts
+ * @user_ns: User namespace the inode is accessed from
  * @inode: inode being checked
  *
  * Return true if current either has CAP_FOWNER in a namespace with the
  * inode owner uid mapped, or owns the file.
  */
-bool inode_owner_or_capable(const struct inode *inode)
+bool mapped_inode_owner_or_capable(struct user_namespace *user_ns, const struct inode *inode)
 {
+	kuid_t i_uid;
 	struct user_namespace *ns;
 
-	if (uid_eq(current_fsuid(), inode->i_uid))
+	i_uid = i_uid_into_mnt(user_ns, inode);
+	if (uid_eq(current_fsuid(), i_uid))
 		return true;
 
 	ns = current_user_ns();
-	if (kuid_has_mapping(ns, inode->i_uid) && ns_capable(ns, CAP_FOWNER))
+	if (kuid_has_mapping(ns, i_uid) && ns_capable(ns, CAP_FOWNER))
 		return true;
 	return false;
 }
+EXPORT_SYMBOL(mapped_inode_owner_or_capable);
+
+/**
+ * inode_owner_or_capable - check current task permissions to inode
+ * @inode: inode being checked
+ *
+ * Return true if current either has CAP_FOWNER in a namespace with the
+ * inode owner uid mapped, or owns the file.
+ */
+bool inode_owner_or_capable(const struct inode *inode)
+{
+	return mapped_inode_owner_or_capable(&init_user_ns, inode);
+}
 EXPORT_SYMBOL(inode_owner_or_capable);
 
 /*
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 750ca4b3d89f..f9e2d292b7b6 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1777,6 +1777,8 @@ static inline int sb_start_intwrite_trylock(struct super_block *sb)
 
 
 extern bool inode_owner_or_capable(const struct inode *inode);
+extern bool mapped_inode_owner_or_capable(struct user_namespace *ns,
+				      const struct inode *inode);
 
 /*
  * VFS helper functions..
@@ -1820,6 +1822,8 @@ extern long compat_ptr_ioctl(struct file *file, unsigned int cmd,
  */
 extern void inode_init_owner(struct inode *inode, const struct inode *dir,
 			umode_t mode);
+extern void mapped_inode_init_owner(struct inode *inode, struct user_namespace *user_ns,
+			 const struct inode *dir, umode_t mode);
 extern bool may_open_dev(const struct path *path);
 
 /*
-- 
2.29.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


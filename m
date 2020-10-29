Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B0B2A29EC23
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 13:45:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-OKn677eBOuKDzMogdjRW8Q-1; Thu, 29 Oct 2020 08:45:50 -0400
X-MC-Unique: OKn677eBOuKDzMogdjRW8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B26C18B9ED1;
	Thu, 29 Oct 2020 12:45:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E9215B4D4;
	Thu, 29 Oct 2020 12:45:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0FE9558138;
	Thu, 29 Oct 2020 12:45:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09T0qWne023156 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 28 Oct 2020 20:52:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EFEFF110DBC1; Thu, 29 Oct 2020 00:52:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC017110DBC0
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:52:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAEF6185A7A2
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:52:29 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-541-uRxNGxxCMluECSXkPwEi1g-1; Wed, 28 Oct 2020 20:52:28 -0400
X-MC-Unique: uRxNGxxCMluECSXkPwEi1g-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1kXvv4-0008Ep-SE; Thu, 29 Oct 2020 00:35:58 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH 27/34] apparmor: handle idmapped mounts
Date: Thu, 29 Oct 2020 01:32:45 +0100
Message-Id: <20201029003252.2128653-28-christian.brauner@ubuntu.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The i_uid and i_gid are only ever used when logging for AppArmor. This is
already broken in a bunch of places where the global root id is reported
instead of the i_uid or i_gid of the file. Nonetheless, be kind and log the
mapped inode if we're coming from an idmapped mount.

Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 security/apparmor/domain.c |  9 ++++++---
 security/apparmor/file.c   |  5 ++++-
 security/apparmor/lsm.c    | 12 ++++++++----
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index f919ebd042fd..91b132961b67 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -10,12 +10,14 @@
 
 #include <linux/errno.h>
 #include <linux/fdtable.h>
+#include <linux/fs.h>
 #include <linux/file.h>
 #include <linux/mount.h>
 #include <linux/syscalls.h>
 #include <linux/tracehook.h>
 #include <linux/personality.h>
 #include <linux/xattr.h>
+#include <linux/user_namespace.h>
 
 #include "include/audit.h"
 #include "include/apparmorfs.h"
@@ -858,8 +860,10 @@ int apparmor_bprm_creds_for_exec(struct linux_binprm *bprm)
 	const char *info = NULL;
 	int error = 0;
 	bool unsafe = false;
+	struct user_namespace *user_ns = mnt_user_ns(bprm->file->f_path.mnt);
+	kuid_t i_uid = i_uid_into_mnt(user_ns, file_inode(bprm->file));
 	struct path_cond cond = {
-		file_inode(bprm->file)->i_uid,
+		i_uid,
 		file_inode(bprm->file)->i_mode
 	};
 
@@ -967,8 +971,7 @@ int apparmor_bprm_creds_for_exec(struct linux_binprm *bprm)
 	error = fn_for_each(label, profile,
 			aa_audit_file(profile, &nullperms, OP_EXEC, MAY_EXEC,
 				      bprm->filename, NULL, new,
-				      file_inode(bprm->file)->i_uid, info,
-				      error));
+				      i_uid, info, error));
 	aa_put_label(new);
 	goto done;
 }
diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index 92acf9a49405..d6d9e71f1900 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -11,6 +11,8 @@
 #include <linux/tty.h>
 #include <linux/fdtable.h>
 #include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/mount.h>
 
 #include "include/apparmor.h"
 #include "include/audit.h"
@@ -508,8 +510,9 @@ static int __file_path_perm(const char *op, struct aa_label *label,
 {
 	struct aa_profile *profile;
 	struct aa_perms perms = {};
+	struct user_namespace *user_ns = mnt_user_ns(file->f_path.mnt);
 	struct path_cond cond = {
-		.uid = file_inode(file)->i_uid,
+		.uid = i_uid_into_mnt(user_ns, file_inode(file)),
 		.mode = file_inode(file)->i_mode
 	};
 	char *buffer;
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index ffeaee5ed968..ece9afc3994f 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -224,7 +224,8 @@ static int common_perm(const char *op, const struct path *path, u32 mask,
  */
 static int common_perm_cond(const char *op, const struct path *path, u32 mask)
 {
-	struct path_cond cond = { d_backing_inode(path->dentry)->i_uid,
+	struct user_namespace *user_ns = mnt_user_ns(path->mnt);
+	struct path_cond cond = { i_uid_into_mnt(user_ns, d_backing_inode(path->dentry)),
 				  d_backing_inode(path->dentry)->i_mode
 	};
 
@@ -266,12 +267,13 @@ static int common_perm_rm(const char *op, const struct path *dir,
 			  struct dentry *dentry, u32 mask)
 {
 	struct inode *inode = d_backing_inode(dentry);
+	struct user_namespace *user_ns = mnt_user_ns(dir->mnt);
 	struct path_cond cond = { };
 
 	if (!inode || !path_mediated_fs(dentry))
 		return 0;
 
-	cond.uid = inode->i_uid;
+	cond.uid = i_uid_into_mnt(user_ns, inode);
 	cond.mode = inode->i_mode;
 
 	return common_perm_dir_dentry(op, dir, dentry, mask, &cond);
@@ -361,11 +363,12 @@ static int apparmor_path_rename(const struct path *old_dir, struct dentry *old_d
 
 	label = begin_current_label_crit_section();
 	if (!unconfined(label)) {
+		struct user_namespace *user_ns = mnt_user_ns(old_dir->mnt);
 		struct path old_path = { .mnt = old_dir->mnt,
 					 .dentry = old_dentry };
 		struct path new_path = { .mnt = new_dir->mnt,
 					 .dentry = new_dentry };
-		struct path_cond cond = { d_backing_inode(old_dentry)->i_uid,
+		struct path_cond cond = { i_uid_into_mnt(user_ns, d_backing_inode(old_dentry)),
 					  d_backing_inode(old_dentry)->i_mode
 		};
 
@@ -420,8 +423,9 @@ static int apparmor_file_open(struct file *file)
 
 	label = aa_get_newest_cred_label(file->f_cred);
 	if (!unconfined(label)) {
+		struct user_namespace *user_ns = mnt_user_ns(file->f_path.mnt);
 		struct inode *inode = file_inode(file);
-		struct path_cond cond = { inode->i_uid, inode->i_mode };
+		struct path_cond cond = { i_uid_into_mnt(user_ns, inode), inode->i_mode };
 
 		error = aa_path_perm(OP_OPEN, label, &file->f_path, 0,
 				     aa_map_file_to_perms(file), &cond);
-- 
2.29.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B6ACF29EC40
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 13:48:49 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-GiQ2orZINja6JpkEP1_zuQ-1; Thu, 29 Oct 2020 08:48:45 -0400
X-MC-Unique: GiQ2orZINja6JpkEP1_zuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B32BB106B21C;
	Thu, 29 Oct 2020 12:48:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92F445D98F;
	Thu, 29 Oct 2020 12:48:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B4435811A;
	Thu, 29 Oct 2020 12:48:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09T0sHeC023536 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 28 Oct 2020 20:54:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 704BA114F0AF; Thu, 29 Oct 2020 00:54:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C7C7114F0AD
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:54:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55D8C8D6330
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:54:17 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-103-eNTBXzOtMMCJP8V4jwjahw-1; Wed, 28 Oct 2020 20:54:15 -0400
X-MC-Unique: eNTBXzOtMMCJP8V4jwjahw-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1kXvur-0008Ep-3m; Thu, 29 Oct 2020 00:35:45 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH 19/34] namei: add lookup helpers with idmapped mounts aware
	permission checking
Date: Thu, 29 Oct 2020 01:32:37 +0100
Message-Id: <20201029003252.2128653-20-christian.brauner@ubuntu.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The lookup_one_len(), lookup_one_len_unlocked(), and lookup_positive_unlocked()
helpers are used by filesystems targeted in this first iteration to lookup
dentries if the caller is privileged over the inode of the base dentry. Add
three new helpers lookup_one_len_mapped(), lookup_one_len_mapped_unlocked(),
and lookup_one_len_mapped_unlocked() to handle idmapped mounts. If the inode is
accessed through an idmapped mount it is mapped according to the mount's user
namespace. Afterwards the permissions checks are identical to non-idmapped
mounts. If the initial user namespace is passed all mapping operations are a
nop so non-idmapped mounts will not see a change in behavior and will also not
see any performance impact. It also means that the non-idmapped-mount aware
helpers can be implemented on top of their idmapped-mount aware counterparts by
passing the initial user namespace.

Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/namei.c            | 47 ++++++++++++++++++++++++++++++++-----------
 include/linux/namei.h |  6 ++++++
 2 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index a8a3de936cfc..7901ea09e80e 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2517,8 +2517,9 @@ int vfs_path_lookup(struct dentry *dentry, struct vfsmount *mnt,
 }
 EXPORT_SYMBOL(vfs_path_lookup);
 
-static int lookup_one_len_common(const char *name, struct dentry *base,
-				 int len, struct qstr *this)
+static int lookup_one_len_common(const char *name, struct dentry *base, int len,
+				 struct qstr *this,
+				 struct user_namespace *mnt_user_ns)
 {
 	this->name = name;
 	this->len = len;
@@ -2546,7 +2547,7 @@ static int lookup_one_len_common(const char *name, struct dentry *base,
 			return err;
 	}
 
-	return inode_permission(base->d_inode, MAY_EXEC);
+	return mapped_inode_permission(mnt_user_ns, base->d_inode, MAY_EXEC);
 }
 
 /**
@@ -2570,7 +2571,7 @@ struct dentry *try_lookup_one_len(const char *name, struct dentry *base, int len
 
 	WARN_ON_ONCE(!inode_is_locked(base->d_inode));
 
-	err = lookup_one_len_common(name, base, len, &this);
+	err = lookup_one_len_common(name, base, len, &this, &init_user_ns);
 	if (err)
 		return ERR_PTR(err);
 
@@ -2589,7 +2590,8 @@ EXPORT_SYMBOL(try_lookup_one_len);
  *
  * The caller must hold base->i_mutex.
  */
-struct dentry *lookup_one_len(const char *name, struct dentry *base, int len)
+struct dentry *lookup_one_len_mapped(const char *name, struct dentry *base, int len,
+				 struct user_namespace *mnt_user_ns)
 {
 	struct dentry *dentry;
 	struct qstr this;
@@ -2597,13 +2599,19 @@ struct dentry *lookup_one_len(const char *name, struct dentry *base, int len)
 
 	WARN_ON_ONCE(!inode_is_locked(base->d_inode));
 
-	err = lookup_one_len_common(name, base, len, &this);
+	err = lookup_one_len_common(name, base, len, &this, mnt_user_ns);
 	if (err)
 		return ERR_PTR(err);
 
 	dentry = lookup_dcache(&this, base, 0);
 	return dentry ? dentry : __lookup_slow(&this, base, 0);
 }
+EXPORT_SYMBOL(lookup_one_len_mapped);
+
+struct dentry *lookup_one_len(const char *name, struct dentry *base, int len)
+{
+	return lookup_one_len_mapped(name, base, len, &init_user_ns);
+}
 EXPORT_SYMBOL(lookup_one_len);
 
 /**
@@ -2618,14 +2626,14 @@ EXPORT_SYMBOL(lookup_one_len);
  * Unlike lookup_one_len, it should be called without the parent
  * i_mutex held, and will take the i_mutex itself if necessary.
  */
-struct dentry *lookup_one_len_unlocked(const char *name,
-				       struct dentry *base, int len)
+struct dentry *lookup_one_len_mapped_unlocked(const char *name, struct dentry *base,
+					  int len, struct user_namespace *mnt_user_ns)
 {
 	struct qstr this;
 	int err;
 	struct dentry *ret;
 
-	err = lookup_one_len_common(name, base, len, &this);
+	err = lookup_one_len_common(name, base, len, &this, mnt_user_ns);
 	if (err)
 		return ERR_PTR(err);
 
@@ -2634,6 +2642,13 @@ struct dentry *lookup_one_len_unlocked(const char *name,
 		ret = lookup_slow(&this, base, 0);
 	return ret;
 }
+EXPORT_SYMBOL(lookup_one_len_mapped_unlocked);
+
+struct dentry *lookup_one_len_unlocked(const char *name,
+				       struct dentry *base, int len)
+{
+	return lookup_one_len_mapped_unlocked(name, base, len, &init_user_ns);
+}
 EXPORT_SYMBOL(lookup_one_len_unlocked);
 
 /*
@@ -2644,16 +2659,24 @@ EXPORT_SYMBOL(lookup_one_len_unlocked);
  * need to be very careful; pinned positives have ->d_inode stable, so
  * this one avoids such problems.
  */
-struct dentry *lookup_positive_unlocked(const char *name,
-				       struct dentry *base, int len)
+struct dentry *lookup_positive_mapped_unlocked(const char *name,
+					   struct dentry *base, int len,
+					   struct user_namespace *mnt_user_ns)
 {
-	struct dentry *ret = lookup_one_len_unlocked(name, base, len);
+	struct dentry *ret = lookup_one_len_mapped_unlocked(name, base, len, mnt_user_ns);
 	if (!IS_ERR(ret) && d_flags_negative(smp_load_acquire(&ret->d_flags))) {
 		dput(ret);
 		ret = ERR_PTR(-ENOENT);
 	}
 	return ret;
 }
+EXPORT_SYMBOL(lookup_positive_mapped_unlocked);
+
+struct dentry *lookup_positive_unlocked(const char *name,
+				       struct dentry *base, int len)
+{
+	return lookup_positive_mapped_unlocked(name, base, len, &init_user_ns);
+}
 EXPORT_SYMBOL(lookup_positive_unlocked);
 
 #ifdef CONFIG_UNIX98_PTYS
diff --git a/include/linux/namei.h b/include/linux/namei.h
index a4bb992623c4..42dbe4c2653a 100644
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@ -68,8 +68,14 @@ extern struct dentry *kern_path_locked(const char *, struct path *);
 
 extern struct dentry *try_lookup_one_len(const char *, struct dentry *, int);
 extern struct dentry *lookup_one_len(const char *, struct dentry *, int);
+extern struct dentry *lookup_one_len_mapped(const char *, struct dentry *, int,
+					struct user_namespace *);
 extern struct dentry *lookup_one_len_unlocked(const char *, struct dentry *, int);
+extern struct dentry *lookup_one_len_mapped_unlocked(const char *, struct dentry *,
+						 int, struct user_namespace *);
 extern struct dentry *lookup_positive_unlocked(const char *, struct dentry *, int);
+extern struct dentry *lookup_positive_mapped_unlocked(const char *, struct dentry *,
+						  int, struct user_namespace *);
 
 extern int follow_down_one(struct path *);
 extern int follow_down(struct path *);
-- 
2.29.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


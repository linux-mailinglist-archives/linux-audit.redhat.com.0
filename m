Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A698A29EC3B
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 13:48:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-hB-EsnFmPhWRvYX5kBi-Xw-1; Thu, 29 Oct 2020 08:48:40 -0400
X-MC-Unique: hB-EsnFmPhWRvYX5kBi-Xw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B79B101F7A7;
	Thu, 29 Oct 2020 12:48:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C889610AF;
	Thu, 29 Oct 2020 12:48:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D3C3158118;
	Thu, 29 Oct 2020 12:48:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09T0rNFD023344 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 28 Oct 2020 20:53:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6A00F110DBCA; Thu, 29 Oct 2020 00:53:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65AE5110DBC2
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:53:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DDA7101A540
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:53:19 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-198-ok4JImlOPQe1fpcomOfs7Q-1; Wed, 28 Oct 2020 20:53:17 -0400
X-MC-Unique: ok4JImlOPQe1fpcomOfs7Q-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1kXvuV-0008Ep-OY; Thu, 29 Oct 2020 00:35:23 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH 07/34] capability: handle idmapped mounts
Date: Thu, 29 Oct 2020 01:32:25 +0100
Message-Id: <20201029003252.2128653-8-christian.brauner@ubuntu.com>
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
Since the privileged_wrt_inode_uidgid() helper only has one caller it
makes more sense to simply add an additional user namespace argument and
adapt the single callsite it is used in. The capable_wrt_inode_uidgid()
helper is used in more places so we introduce a new
capable_wrt_mapped_inode_uidgid() helper which can be used by the vfs.

Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/exec.c                  |  2 +-
 include/linux/capability.h |  6 +++++-
 kernel/capability.c        | 22 ++++++++++++++++------
 3 files changed, 22 insertions(+), 8 deletions(-)

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
diff --git a/include/linux/capability.h b/include/linux/capability.h
index 1e7fe311cabe..308d88096745 100644
--- a/include/linux/capability.h
+++ b/include/linux/capability.h
@@ -247,8 +247,12 @@ static inline bool ns_capable_setid(struct user_namespace *ns, int cap)
 	return true;
 }
 #endif /* CONFIG_MULTIUSER */
-extern bool privileged_wrt_inode_uidgid(struct user_namespace *ns, const struct inode *inode);
+extern bool privileged_wrt_inode_uidgid(struct user_namespace *ns,
+					struct user_namespace *mnt_user_ns,
+					const struct inode *inode);
 extern bool capable_wrt_inode_uidgid(const struct inode *inode, int cap);
+extern bool capable_wrt_mapped_inode_uidgid(struct user_namespace *mnt_user_ns,
+					const struct inode *inode, int cap);
 extern bool file_ns_capable(const struct file *file, struct user_namespace *ns, int cap);
 extern bool ptracer_capable(struct task_struct *tsk, struct user_namespace *ns);
 static inline bool perfmon_capable(void)
diff --git a/kernel/capability.c b/kernel/capability.c
index de7eac903a2a..427776414487 100644
--- a/kernel/capability.c
+++ b/kernel/capability.c
@@ -484,12 +484,24 @@ EXPORT_SYMBOL(file_ns_capable);
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
 
+bool capable_wrt_mapped_inode_uidgid(struct user_namespace *mnt_user_ns,
+				 const struct inode *inode, int cap)
+{
+	struct user_namespace *ns = current_user_ns();
+
+	return ns_capable(ns, cap) &&
+	       privileged_wrt_inode_uidgid(ns, mnt_user_ns, inode);
+}
+EXPORT_SYMBOL(capable_wrt_mapped_inode_uidgid);
+
 /**
  * capable_wrt_inode_uidgid - Check nsown_capable and uid and gid mapped
  * @inode: The inode in question
@@ -501,9 +513,7 @@ bool privileged_wrt_inode_uidgid(struct user_namespace *ns, const struct inode *
  */
 bool capable_wrt_inode_uidgid(const struct inode *inode, int cap)
 {
-	struct user_namespace *ns = current_user_ns();
-
-	return ns_capable(ns, cap) && privileged_wrt_inode_uidgid(ns, inode);
+	return capable_wrt_mapped_inode_uidgid(&init_user_ns, inode, cap);
 }
 EXPORT_SYMBOL(capable_wrt_inode_uidgid);
 
-- 
2.29.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


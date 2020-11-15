Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C16FD2B3B49
	for <lists+linux-audit@lfdr.de>; Mon, 16 Nov 2020 03:15:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-AmAbevtSPnqI75iLNliHdA-1; Sun, 15 Nov 2020 21:15:26 -0500
X-MC-Unique: AmAbevtSPnqI75iLNliHdA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 092DF809DE1;
	Mon, 16 Nov 2020 02:15:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC6D45B4DA;
	Mon, 16 Nov 2020 02:15:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE5C058122;
	Mon, 16 Nov 2020 02:15:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AFAcr9X025117 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 15 Nov 2020 05:38:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D91A25D23E; Sun, 15 Nov 2020 10:38:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2CFB5D23C
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:38:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D0F38007D9
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:38:51 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-461-AdD2SJPeNAWzj4lPgOVXIQ-1; Sun, 15 Nov 2020 05:38:49 -0500
X-MC-Unique: AdD2SJPeNAWzj4lPgOVXIQ-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1keFQU-0000Kt-1U; Sun, 15 Nov 2020 10:38:30 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 06/39] fs: add id translation helpers
Date: Sun, 15 Nov 2020 11:36:45 +0100
Message-Id: <20201115103718.298186-7-christian.brauner@ubuntu.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add simple helpers to make it easy to map kuids into and from idmapped
mounts. We provide simple wrappers that filesystems can use to
e.g. initialize inodes similar to i_{uid,gid}_read() and
i_{uid,gid}_write(). Accessing an inode through an idmapped mount will
require the inode to be mapped according to the mount's user namespace.
If the fsids are used to compare against inodes or to initialize inodes
they are required to be shifted from the mount's user namespace. Passing
the initial user namespace to these helpers makes them a nop and so any
non-idmapped paths will not be impacted.

Cc: Christoph Hellwig <hch@lst.de>
Cc: David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
/* v2 */
- Christoph Hellwig <hch@lst.de>:
  - Get rid of the ifdefs and the config option that hid idmapped mounts.
---
 include/linux/fs.h | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 21cc971fd960..9e487cbf0f5c 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -39,6 +39,7 @@
 #include <linux/fs_types.h>
 #include <linux/build_bug.h>
 #include <linux/stddef.h>
+#include <linux/cred.h>
 
 #include <asm/byteorder.h>
 #include <uapi/linux/fs.h>
@@ -1574,6 +1575,48 @@ static inline void i_gid_write(struct inode *inode, gid_t gid)
 	inode->i_gid = make_kgid(inode->i_sb->s_user_ns, gid);
 }
 
+static inline kuid_t kuid_into_mnt(struct user_namespace *to, kuid_t kuid)
+{
+	return make_kuid(to, __kuid_val(kuid));
+}
+
+static inline kgid_t kgid_into_mnt(struct user_namespace *to, kgid_t kgid)
+{
+	return make_kgid(to, __kgid_val(kgid));
+}
+
+static inline kuid_t i_uid_into_mnt(struct user_namespace *to,
+				    const struct inode *inode)
+{
+	return kuid_into_mnt(to, inode->i_uid);
+}
+
+static inline kgid_t i_gid_into_mnt(struct user_namespace *to,
+				    const struct inode *inode)
+{
+	return kgid_into_mnt(to, inode->i_gid);
+}
+
+static inline kuid_t kuid_from_mnt(struct user_namespace *to, kuid_t kuid)
+{
+	return KUIDT_INIT(from_kuid(to, kuid));
+}
+
+static inline kgid_t kgid_from_mnt(struct user_namespace *to, kgid_t kgid)
+{
+	return KGIDT_INIT(from_kgid(to, kgid));
+}
+
+static inline kuid_t fsuid_into_mnt(struct user_namespace *to)
+{
+	return kuid_from_mnt(to, current_fsuid());
+}
+
+static inline kgid_t fsgid_into_mnt(struct user_namespace *to)
+{
+	return kgid_from_mnt(to, current_fsgid());
+}
+
 extern struct timespec64 current_time(struct inode *inode);
 
 /*
-- 
2.29.2

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


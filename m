Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 409AF2B3B47
	for <lists+linux-audit@lfdr.de>; Mon, 16 Nov 2020 03:15:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-S1usbH86MVOUi2oedAt7Bg-1; Sun, 15 Nov 2020 21:15:24 -0500
X-MC-Unique: S1usbH86MVOUi2oedAt7Bg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CFB010866AD;
	Mon, 16 Nov 2020 02:15:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06D4660C84;
	Mon, 16 Nov 2020 02:15:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C9A81800B6C;
	Mon, 16 Nov 2020 02:15:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AFAcdMr025076 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 15 Nov 2020 05:38:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8B5342166BA2; Sun, 15 Nov 2020 10:38:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8679D2166B44
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:38:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C4D6811E82
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:38:39 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-521-6HS0YVuXM3uvHX_x9FhPeA-1; Sun, 15 Nov 2020 05:38:35 -0500
X-MC-Unique: 6HS0YVuXM3uvHX_x9FhPeA-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1keFQD-0000Kt-Om; Sun, 15 Nov 2020 10:38:13 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 01/39] namespace: take lock_mount_hash() directly when
	changing flags
Date: Sun, 15 Nov 2020 11:36:40 +0100
Message-Id: <20201115103718.298186-2-christian.brauner@ubuntu.com>
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
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

Changing mount options always ends up taking lock_mount_hash() but when
MNT_READONLY is requested and neither the mount nor the superblock are
not already MNT_READONLY we end up taking the lock, dropping it, and
retaking it to change the other mount attributes. Instead of this,
acquire the lock once when changing mount properties. This simplifies
the locking in these codepath, makes them easier to reason about and
avoids having to reacquire the lock right after dropping it.

Cc: Christoph Hellwig <hch@lst.de>
Cc: David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
/* v2 */
- Christoph Hellwig:
  - Remove pointless __mnt_unmake_readonly() helper.
  - Even though Christoph suggested to lockdep_assert_held() into places that
    require {lock,unlock}_mount_hash() it seems that seqlock's don't support
    it.
---
 fs/namespace.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index cebaa3e81794..f183161833ad 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -463,7 +463,6 @@ static int mnt_make_readonly(struct mount *mnt)
 {
 	int ret = 0;
 
-	lock_mount_hash();
 	mnt->mnt.mnt_flags |= MNT_WRITE_HOLD;
 	/*
 	 * After storing MNT_WRITE_HOLD, we'll read the counters. This store
@@ -497,18 +496,9 @@ static int mnt_make_readonly(struct mount *mnt)
 	 */
 	smp_wmb();
 	mnt->mnt.mnt_flags &= ~MNT_WRITE_HOLD;
-	unlock_mount_hash();
 	return ret;
 }
 
-static int __mnt_unmake_readonly(struct mount *mnt)
-{
-	lock_mount_hash();
-	mnt->mnt.mnt_flags &= ~MNT_READONLY;
-	unlock_mount_hash();
-	return 0;
-}
-
 int sb_prepare_remount_readonly(struct super_block *sb)
 {
 	struct mount *mnt;
@@ -2508,7 +2498,8 @@ static int change_mount_ro_state(struct mount *mnt, unsigned int mnt_flags)
 	if (readonly_request)
 		return mnt_make_readonly(mnt);
 
-	return __mnt_unmake_readonly(mnt);
+	mnt->mnt.mnt_flags &= ~MNT_READONLY;
+	return 0;
 }
 
 /*
@@ -2517,11 +2508,9 @@ static int change_mount_ro_state(struct mount *mnt, unsigned int mnt_flags)
  */
 static void set_mount_attributes(struct mount *mnt, unsigned int mnt_flags)
 {
-	lock_mount_hash();
 	mnt_flags |= mnt->mnt.mnt_flags & ~MNT_USER_SETTABLE_MASK;
 	mnt->mnt.mnt_flags = mnt_flags;
 	touch_mnt_namespace(mnt->mnt_ns);
-	unlock_mount_hash();
 }
 
 static void mnt_warn_timestamp_expiry(struct path *mountpoint, struct vfsmount *mnt)
@@ -2567,9 +2556,11 @@ static int do_reconfigure_mnt(struct path *path, unsigned int mnt_flags)
 		return -EPERM;
 
 	down_write(&sb->s_umount);
+	lock_mount_hash();
 	ret = change_mount_ro_state(mnt, mnt_flags);
 	if (ret == 0)
 		set_mount_attributes(mnt, mnt_flags);
+	unlock_mount_hash();
 	up_write(&sb->s_umount);
 
 	mnt_warn_timestamp_expiry(path, &mnt->mnt);
@@ -2610,8 +2601,11 @@ static int do_remount(struct path *path, int ms_flags, int sb_flags,
 		err = -EPERM;
 		if (ns_capable(sb->s_user_ns, CAP_SYS_ADMIN)) {
 			err = reconfigure_super(fc);
-			if (!err)
+			if (!err) {
+				lock_mount_hash();
 				set_mount_attributes(mnt, mnt_flags);
+				unlock_mount_hash();
+			}
 		}
 		up_write(&sb->s_umount);
 	}
-- 
2.29.2

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D05502B3B6C
	for <lists+linux-audit@lfdr.de>; Mon, 16 Nov 2020 03:16:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-uMHERlwrOP25xuVg2XLZtg-1; Sun, 15 Nov 2020 21:15:26 -0500
X-MC-Unique: uMHERlwrOP25xuVg2XLZtg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A3FA80364B;
	Mon, 16 Nov 2020 02:15:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC5FF1002C1B;
	Mon, 16 Nov 2020 02:15:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5BDF15811D;
	Mon, 16 Nov 2020 02:15:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AFAclWO025093 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 15 Nov 2020 05:38:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 276132028DCC; Sun, 15 Nov 2020 10:38:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22D29200E21B
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:38:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11631185A78B
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:38:43 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-57-DYV4jfUPN7qOghA8gNpXrg-1; Sun, 15 Nov 2020 05:38:38 -0500
X-MC-Unique: DYV4jfUPN7qOghA8gNpXrg-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1keFQH-0000Kt-2k; Sun, 15 Nov 2020 10:38:17 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 02/39] mount: make {lock,unlock}_mount_hash() static
Date: Sun, 15 Nov 2020 11:36:41 +0100
Message-Id: <20201115103718.298186-3-christian.brauner@ubuntu.com>
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

The helpers are only called in fs/namespace.c functions so there's no need to
have them exposed in a header as Christoph pointed out.

Suggested-by: Christoph Hellwig <hch@lst.de>
Cc: David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
/* v2 */
- Christoph Hellwig:
  - Add a patch to make {lock,unlock)_mount_hash() static.
---
 fs/mount.h     | 10 ----------
 fs/namespace.c | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/mount.h b/fs/mount.h
index c7abb7b394d8..562d96d57bad 100644
--- a/fs/mount.h
+++ b/fs/mount.h
@@ -125,16 +125,6 @@ static inline void get_mnt_ns(struct mnt_namespace *ns)
 
 extern seqlock_t mount_lock;
 
-static inline void lock_mount_hash(void)
-{
-	write_seqlock(&mount_lock);
-}
-
-static inline void unlock_mount_hash(void)
-{
-	write_sequnlock(&mount_lock);
-}
-
 struct proc_mounts {
 	struct mnt_namespace *ns;
 	struct path root;
diff --git a/fs/namespace.c b/fs/namespace.c
index f183161833ad..798bbf4f48ad 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -87,6 +87,16 @@ EXPORT_SYMBOL_GPL(fs_kobj);
  */
 __cacheline_aligned_in_smp DEFINE_SEQLOCK(mount_lock);
 
+static inline void lock_mount_hash(void)
+{
+	write_seqlock(&mount_lock);
+}
+
+static inline void unlock_mount_hash(void)
+{
+	write_sequnlock(&mount_lock);
+}
+
 static inline struct hlist_head *m_hash(struct vfsmount *mnt, struct dentry *dentry)
 {
 	unsigned long tmp = ((unsigned long)mnt / L1_CACHE_BYTES);
-- 
2.29.2

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B58EB450
	for <lists+linux-audit@lfdr.de>; Sat, 27 Apr 2019 20:35:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CED6C307D84F;
	Sat, 27 Apr 2019 18:35:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EFC9601B3;
	Sat, 27 Apr 2019 18:35:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82641181AC92;
	Sat, 27 Apr 2019 18:35:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3QIT7sG011279 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 26 Apr 2019 14:29:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8968E2CFA7; Fri, 26 Apr 2019 18:29:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 820FE608CA;
	Fri, 26 Apr 2019 18:29:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED59F306D33F;
	Fri, 26 Apr 2019 18:28:53 +0000 (UTC)
Received: from tleilax.poochiereds.net (cpe-71-70-156-158.nc.res.rr.com
	[71.70.156.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 449BA214C6;
	Fri, 26 Apr 2019 18:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556303333;
	bh=xgtrjev1l0myncFB4+Rxefbc1PEu33mLHqZlotiEJcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hvBLan3aRLOzI/++mN09qi5Xg/iKciT/gTDSXeO0pV+JYv/jpo71hpWUB0Sk3vpi7
	Kt8OwiLPwW+q+Owr/IH/+LTlcuGeh6Rie1VbpW6VQz/kA0UAQJTxd/vyAnRywPquHo
	oGVkjD2+LF/uhRYooNxRIqV3My7ISsaRbuzGGWg8=
From: Jeff Layton <jlayton@kernel.org>
To: viro@zeniv.linux.org.uk
Subject: [PATCH 2/5] fsnotify: have fsnotify_move take a struct qstr instead
	of a string
Date: Fri, 26 Apr 2019 14:28:44 -0400
Message-Id: <20190426182847.25088-3-jlayton@kernel.org>
In-Reply-To: <20190426182847.25088-1-jlayton@kernel.org>
References: <20190426182847.25088-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 26 Apr 2019 18:28:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Fri, 26 Apr 2019 18:28:54 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'jlayton@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.092  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_PASS,
	T_FILL_THIS_FORM_SHORT) 198.145.29.99 mail.kernel.org 198.145.29.99
	mail.kernel.org <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sat, 27 Apr 2019 14:35:10 -0400
Cc: jack@suse.cz, miklos@szeredi.hu, gregkh@linuxfoundation.org,
	amir73il@gmail.com, linux-kernel@vger.kernel.org, tj@kernel.org,
	linux-audit@redhat.com, linux-fsdevel@vger.kernel.org, rafael@kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Sat, 27 Apr 2019 18:35:28 +0000 (UTC)

With this, ovl_lookup_real_one can skip the strlen call.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/debugfs/inode.c       |  2 +-
 fs/namei.c               |  4 ++--
 include/linux/fsnotify.h | 11 +++++------
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index 37c0a025d7e8..5dbeefa69a58 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -824,7 +824,7 @@ struct dentry *debugfs_rename(struct dentry *old_dir, struct dentry *old_dentry,
 		goto exit;
 	}
 	d_move(old_dentry, dentry);
-	fsnotify_move(d_inode(old_dir), d_inode(new_dir), old_name.name.name,
+	fsnotify_move(d_inode(old_dir), d_inode(new_dir), &old_name.name,
 		d_is_dir(old_dentry),
 		NULL, old_dentry);
 	release_dentry_name_snapshot(&old_name);
diff --git a/fs/namei.c b/fs/namei.c
index c96713077326..5ebd64b21970 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -4498,10 +4498,10 @@ int vfs_rename(struct inode *old_dir, struct dentry *old_dentry,
 		inode_unlock(target);
 	dput(new_dentry);
 	if (!error) {
-		fsnotify_move(old_dir, new_dir, old_name.name.name, is_dir,
+		fsnotify_move(old_dir, new_dir, &old_name.name, is_dir,
 			      !(flags & RENAME_EXCHANGE) ? target : NULL, old_dentry);
 		if (flags & RENAME_EXCHANGE) {
-			fsnotify_move(new_dir, old_dir, old_dentry->d_name.name,
+			fsnotify_move(new_dir, old_dir, &old_dentry->d_name,
 				      new_is_dir, NULL, new_dentry);
 		}
 	}
diff --git a/include/linux/fsnotify.h b/include/linux/fsnotify.h
index e09cfff69bb2..2de90a7e388b 100644
--- a/include/linux/fsnotify.h
+++ b/include/linux/fsnotify.h
@@ -102,7 +102,7 @@ static inline void fsnotify_link_count(struct inode *inode)
  * fsnotify_move - file old_name at old_dir was moved to new_name at new_dir
  */
 static inline void fsnotify_move(struct inode *old_dir, struct inode *new_dir,
-				 const unsigned char *old_name,
+				 const struct qstr *old_name,
 				 int isdir, struct inode *target,
 				 struct dentry *moved)
 {
@@ -111,7 +111,6 @@ static inline void fsnotify_move(struct inode *old_dir, struct inode *new_dir,
 	__u32 old_dir_mask = FS_MOVED_FROM;
 	__u32 new_dir_mask = FS_MOVED_TO;
 	__u32 mask = FS_MOVE_SELF;
-	const unsigned char *new_name = moved->d_name.name;
 
 	if (old_dir == new_dir)
 		old_dir_mask |= FS_DN_RENAME;
@@ -122,10 +121,10 @@ static inline void fsnotify_move(struct inode *old_dir, struct inode *new_dir,
 		mask |= FS_ISDIR;
 	}
 
-	fsnotify(old_dir, old_dir_mask, source, FSNOTIFY_EVENT_INODE, old_name,
-		 fs_cookie);
-	fsnotify(new_dir, new_dir_mask, source, FSNOTIFY_EVENT_INODE, new_name,
-		 fs_cookie);
+	fsnotify(old_dir, old_dir_mask, source, FSNOTIFY_EVENT_INODE,
+		 old_name->name, fs_cookie);
+	fsnotify(new_dir, new_dir_mask, source, FSNOTIFY_EVENT_INODE,
+		 moved->d_name.name, fs_cookie);
 
 	if (target)
 		fsnotify_link_count(target);
-- 
2.20.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

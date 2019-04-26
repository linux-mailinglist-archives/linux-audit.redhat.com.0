Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 265C5B454
	for <lists+linux-audit@lfdr.de>; Sat, 27 Apr 2019 20:35:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 826933086258;
	Sat, 27 Apr 2019 18:35:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BD3B607BA;
	Sat, 27 Apr 2019 18:35:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 122763FB11;
	Sat, 27 Apr 2019 18:35:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3QIT6Ou011263 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 26 Apr 2019 14:29:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 76E25608CA; Fri, 26 Apr 2019 18:29:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EE8B648BC;
	Fri, 26 Apr 2019 18:29:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0EA8432D0;
	Fri, 26 Apr 2019 18:28:52 +0000 (UTC)
Received: from tleilax.poochiereds.net (cpe-71-70-156-158.nc.res.rr.com
	[71.70.156.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4CE142077B;
	Fri, 26 Apr 2019 18:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556303330;
	bh=OIOZkRSK3EEbkIHFsd6WIC61v5qOMoxLgz5qbe+RnS0=;
	h=From:To:Cc:Subject:Date:From;
	b=B4QJ7uc5hkRyZHwvzioiQvptXlOTeT6ZQ6+IaE7Co69HyTziPgKm6lPyBznq3UNhL
	tP0d1oItpJ3Y9lYxo6TBnbYiUAQyHBssqlY3RPbHLT5XNvsE1+SGloCUR4End0Zrc0
	bnCfv8eJtBzg4DSlav04Up41rEFT/WJ6sxmZ7/xI=
From: Jeff Layton <jlayton@kernel.org>
To: viro@zeniv.linux.org.uk
Subject: [PATCH 0/5] vfs: track the dentry name length in name_snapshot
Date: Fri, 26 Apr 2019 14:28:42 -0400
Message-Id: <20190426182847.25088-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 26 Apr 2019 18:28:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Fri, 26 Apr 2019 18:28:53 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'jlayton@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.102  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Sat, 27 Apr 2019 18:35:35 +0000 (UTC)

name_snapshot will snapshot the current contents of a dentry's name for
later consumption. Several of those users end up needing to do a strlen
on the resulting string later. We already have that info in the original
dentry though, so we can do this a bit more efficiently by stuffing the
name length into the name_snapshot as well.

This is not well tested, but it built and booted. Do we have a testsuite
that exercises the fsnotify code, in particular?

Jeff Layton (5):
  dcache: track the length of the string in struct name_snapshot
  fsnotify: have fsnotify_move take a struct qstr instead of a string
  fsnotify: have fsnotify() take a qstr instead of a string
  fsnotify: change ->handle_event and send_to_group to take a qstr
  audit: fix audit_compare_dname_path to take a qstr

 fs/dcache.c                          | 11 +++++++----
 fs/debugfs/inode.c                   |  2 +-
 fs/kernfs/file.c                     |  6 ++++--
 fs/namei.c                           |  4 ++--
 fs/notify/dnotify/dnotify.c          |  2 +-
 fs/notify/fanotify/fanotify.c        |  2 +-
 fs/notify/fsnotify.c                 |  8 ++++----
 fs/notify/inotify/inotify.h          |  2 +-
 fs/notify/inotify/inotify_fsnotify.c |  6 +++---
 fs/overlayfs/export.c                |  2 +-
 include/linux/dcache.h               |  2 +-
 include/linux/fsnotify.h             | 17 ++++++++---------
 include/linux/fsnotify_backend.h     |  6 +++---
 kernel/audit.h                       |  3 ++-
 kernel/audit_fsnotify.c              |  5 +++--
 kernel/audit_tree.c                  |  2 +-
 kernel/audit_watch.c                 |  4 ++--
 kernel/auditfilter.c                 |  7 ++++---
 kernel/auditsc.c                     |  7 +++----
 19 files changed, 52 insertions(+), 46 deletions(-)

-- 
2.20.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

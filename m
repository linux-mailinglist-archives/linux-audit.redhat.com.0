Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9510AB44F
	for <lists+linux-audit@lfdr.de>; Sat, 27 Apr 2019 20:35:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC0703081252;
	Sat, 27 Apr 2019 18:35:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3801B282D3;
	Sat, 27 Apr 2019 18:35:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 86C3A181B9E0;
	Sat, 27 Apr 2019 18:35:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3QJ3U1S025599 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 26 Apr 2019 15:03:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8910C5C221; Fri, 26 Apr 2019 19:03:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21BEA1F8;
	Fri, 26 Apr 2019 19:03:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3696130BE493;
	Fri, 26 Apr 2019 19:03:19 +0000 (UTC)
Received: from tleilax.poochiereds.net (cpe-71-70-156-158.nc.res.rr.com
	[71.70.156.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7C26520869;
	Fri, 26 Apr 2019 19:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556305398;
	bh=Py2Wqi+xE6pgsXNg1HxGqxEnqkYnYEVvNDXhwnYtHso=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=c5F1FNOcUCniv2IpwJFaELXJugWly/+8V2JZhzs/fDyjDnD/ulZC0euGsDkiAFJdk
	8UQ33DS4ufjMrcw1WKCedM34R9e8PQ3nct17/HVsAui/3RedXyTVlrg5jVcfyKnszT
	81RO6TA99+QIZ/o/Rl05UFZv8DyEmEMORl5pVctM=
Message-ID: <eac6b8a50c98abe2c5a3858a9d11555de2cedca3.camel@kernel.org>
Subject: Re: [PATCH 0/5] vfs: track the dentry name length in name_snapshot
From: Jeff Layton <jlayton@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Date: Fri, 26 Apr 2019 15:03:16 -0400
In-Reply-To: <20190426185158.GB2217@ZenIV.linux.org.uk>
References: <20190426182847.25088-1-jlayton@kernel.org>
	<20190426185158.GB2217@ZenIV.linux.org.uk>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 26 Apr 2019 19:03:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Fri, 26 Apr 2019 19:03:19 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'jlayton@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_HI,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Sat, 27 Apr 2019 18:35:28 +0000 (UTC)

On Fri, 2019-04-26 at 19:51 +0100, Al Viro wrote:
> On Fri, Apr 26, 2019 at 02:28:42PM -0400, Jeff Layton wrote:
> > name_snapshot will snapshot the current contents of a dentry's name for
> > later consumption. Several of those users end up needing to do a strlen
> > on the resulting string later. We already have that info in the original
> > dentry though, so we can do this a bit more efficiently by stuffing the
> > name length into the name_snapshot as well.
> > 
> > This is not well tested, but it built and booted. Do we have a testsuite
> > that exercises the fsnotify code, in particular?
> 
> FWIW, my variant sits in vfs.git@work.dcache.
> 
> > Jeff Layton (5):
> >   dcache: track the length of the string in struct name_snapshot
> >   fsnotify: have fsnotify_move take a struct qstr instead of a string
> >   fsnotify: have fsnotify() take a qstr instead of a string
> >   fsnotify: change ->handle_event and send_to_group to take a qstr
> >   audit: fix audit_compare_dname_path to take a qstr
> > 
> >  fs/dcache.c                          | 11 +++++++----
> >  fs/debugfs/inode.c                   |  2 +-
> >  fs/kernfs/file.c                     |  6 ++++--
> >  fs/namei.c                           |  4 ++--
> >  fs/notify/dnotify/dnotify.c          |  2 +-
> >  fs/notify/fanotify/fanotify.c        |  2 +-
> >  fs/notify/fsnotify.c                 |  8 ++++----
> >  fs/notify/inotify/inotify.h          |  2 +-
> >  fs/notify/inotify/inotify_fsnotify.c |  6 +++---
> >  fs/overlayfs/export.c                |  2 +-
> >  include/linux/dcache.h               |  2 +-
> >  include/linux/fsnotify.h             | 17 ++++++++---------
> >  include/linux/fsnotify_backend.h     |  6 +++---
> >  kernel/audit.h                       |  3 ++-
> >  kernel/audit_fsnotify.c              |  5 +++--
> >  kernel/audit_tree.c                  |  2 +-
> >  kernel/audit_watch.c                 |  4 ++--
> >  kernel/auditfilter.c                 |  7 ++++---
> >  kernel/auditsc.c                     |  7 +++----
> >  19 files changed, 52 insertions(+), 46 deletions(-)
> 
>  fs/dcache.c                          | 14 ++++++--------
>  fs/debugfs/inode.c                   |  2 +-
>  fs/kernfs/file.c                     |  6 ++++--
>  fs/namei.c                           |  4 ++--
>  fs/notify/dnotify/dnotify.c          |  2 +-
>  fs/notify/fanotify/fanotify.c        |  2 +-
>  fs/notify/fsnotify.c                 |  8 ++++----
>  fs/notify/inotify/inotify.h          |  2 +-
>  fs/notify/inotify/inotify_fsnotify.c |  6 +++---
>  fs/overlayfs/export.c                |  2 +-
>  include/linux/dcache.h               |  2 +-
>  include/linux/fsnotify.h             | 10 +++++-----
>  include/linux/fsnotify_backend.h     |  6 +++---
>  kernel/audit.h                       |  2 +-
>  kernel/audit_fsnotify.c              |  2 +-
>  kernel/audit_tree.c                  |  2 +-
>  kernel/audit_watch.c                 |  4 ++--
>  kernel/auditfilter.c                 |  6 +++---
>  kernel/auditsc.c                     |  4 ++--
>  19 files changed, 43 insertions(+), 43 deletions(-)
> 
> here...

Pretty similar :)

Let's just go with yours then, since it breaks out some of the strlen
changes into separate patches.

Cheers,
-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

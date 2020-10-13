Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7B83328C67F
	for <lists+linux-audit@lfdr.de>; Tue, 13 Oct 2020 02:52:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-kgWe2gE0OPidWIgfqET-Sw-1; Mon, 12 Oct 2020 20:52:30 -0400
X-MC-Unique: kgWe2gE0OPidWIgfqET-Sw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7318436408;
	Tue, 13 Oct 2020 00:52:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9385E6EF54;
	Tue, 13 Oct 2020 00:52:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E022058108;
	Tue, 13 Oct 2020 00:52:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09D0pehL017851 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 20:51:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F6B82166BCC; Tue, 13 Oct 2020 00:51:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 998D02166BA4
	for <linux-audit@redhat.com>; Tue, 13 Oct 2020 00:51:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A571F858294
	for <linux-audit@redhat.com>; Tue, 13 Oct 2020 00:51:37 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-456-nqwp3QyXOdmfLwdzW9qcEA-1; Mon, 12 Oct 2020 20:51:35 -0400
X-MC-Unique: nqwp3QyXOdmfLwdzW9qcEA-1
Received: by mail-ej1-f65.google.com with SMTP id qp15so25851161ejb.3
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 17:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=pVrQdjc0e/ktldx4sQZ+nJAJs98miEhGJpNnCH/jdDo=;
	b=l7Q8r7NXHSUxuIBOAVnxu9ZIUdS9nFnjBYdypDT3jOxh4oHPQ/Y4wtFuC/WcIvURAy
	A84TB8wOckslwN5+M+mr1T2lwYIVsS8E1yK3Ug1TXB7U9UVFhQa7yYwiyWWnYvFDAZ4h
	HE5JGYo9lWHPktiuS2gh2pTdN9iBgNb2z2n9P72nbqYemYtMRNNawLNrB31lObl6qJia
	Jy3RmVoIwQkGBz0SYFnJbPjhHrr2B8QP3PNE7mjt1daF3usl5eKA1A5wuIGZAPIypOlE
	awtY+QiGdXDG7VaVkb+DRAhApemz/5M2UUn6KnshpMtU0gZD6InMkNJfkMWUzgRmF+Ua
	8ogg==
X-Gm-Message-State: AOAM5308MKqblhhMcUbBDwV9ruGsc6VYNnV835E0mi5grSiE2YU40a4O
	VUb8oOpTMws5/dpISdB4gIR2KYvuFekJmN7WB16CY7AgTZNa
X-Google-Smtp-Source: ABdhPJxYgfdVxCK9FNcCuB0YKS3usLBprBSUAoJGvuPI7J/d0z3AQQhqzf8gdJca+E/1DzVdmTvnMhpMBi8w1ri/1pI=
X-Received: by 2002:a17:906:c1d4:: with SMTP id
	bw20mr30257446ejb.91.1602550293651; 
	Mon, 12 Oct 2020 17:51:33 -0700 (PDT)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 12 Oct 2020 20:51:22 -0400
Message-ID: <CAHC9VhTNqnzrtu1DHquVF7kK9v9tCAa8q=V3f9kUZi_nLTzfYg@mail.gmail.com>
Subject: [GIT PULL] Audit patches for v5.10
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

A small set of audit patches for v5.10.  There are only three patches
in total, and all three are trivial fixes that don't really warrant
any explanations beyond their descriptions.  As usual, all three
patches pass our test suite and as of a few minutes ago they applied
cleanly to your tree.  Please merge for v5.10.

Thanks,
-Paul

--
The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

 Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   stable-5.10

for you to fetch changes up to c07203516439b9cd9f7b3cbed82a77164de5af40:

 audit: Remove redundant null check (2020-08-26 09:10:39 -0400)

----------------------------------------------------------------
Jules Irenge (2):
     audit: change unnecessary globals into statics
     audit: uninitialize variable audit_sig_sid

Xu Wang (1):
     audit: Remove redundant null check

kernel/audit.c | 9 ++++-----
kernel/audit.h | 4 ----
2 files changed, 4 insertions(+), 9 deletions(-)

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


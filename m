Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B198631C3F4
	for <lists+linux-audit@lfdr.de>; Mon, 15 Feb 2021 23:11:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-40tu2bOHPxqqVLxk_iMBHA-1; Mon, 15 Feb 2021 17:11:36 -0500
X-MC-Unique: 40tu2bOHPxqqVLxk_iMBHA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D115C282;
	Mon, 15 Feb 2021 22:11:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED00B5C541;
	Mon, 15 Feb 2021 22:11:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 708D157DFA;
	Mon, 15 Feb 2021 22:11:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11FMAtOd006597 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 15 Feb 2021 17:10:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CB3CD100F4F5; Mon, 15 Feb 2021 22:10:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C690410F8E13
	for <linux-audit@redhat.com>; Mon, 15 Feb 2021 22:10:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD655811E88
	for <linux-audit@redhat.com>; Mon, 15 Feb 2021 22:10:51 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-504-uj1TfS1gOxejR1aqM5uBHA-1; Mon, 15 Feb 2021 17:10:49 -0500
X-MC-Unique: uj1TfS1gOxejR1aqM5uBHA-1
Received: by mail-ed1-f49.google.com with SMTP id df22so10005903edb.1
	for <linux-audit@redhat.com>; Mon, 15 Feb 2021 14:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=pYLA+3nnxoVua5LijBXQo1mBB+NhAGqtgS8dvq0VqEQ=;
	b=c3iFAtT0Qg8ncV8dpgGwFMfa3knhU9ao5/x+3AAvuMsrBtJUEOJT5xFs9jUEtBOufj
	U3/p4ITXvVQigw0TELWj0TFo02dBGTvm5fWmIYs7pnJXjfzsskG5FrA4DJJm0kf4j+of
	nGB3dyYRvZPj7vpdsY3g2xsuraL9QvaEtHrfYWDnGo2AofJ0MQ8jv/zm7W3xpE142Qvl
	5tcU5O2K3nLNY44M+IDSAo96qCrxs6hFYiUofZgeNbn0Bgc/Wj5ywe/FePUkKqQ+jMmT
	GXZwibZNfHBr0VEvgGdZFa/ApTvxTIdIKKGOtwViTiyHBSYSuh03z0odl6NayJP6sefQ
	qnDw==
X-Gm-Message-State: AOAM5331P1TT/pvjKuUx2VQdn66I7S4jMhgJQnnmMZ3PCipbMOaQVQjc
	WY9OJLwA5OLfXPNV/BrXU0eeiQNphG+383vO1tyAqydt3huRHjQ=
X-Google-Smtp-Source: ABdhPJzNieooTTb9kdYmB0WNp4KiC6FvilXH3aiCdHddttzvcMJzQiB5YK3rK6kWfWl8EYDm7LhIUgul6cQ48a9ahtM=
X-Received: by 2002:a05:6402:438d:: with SMTP id
	o13mr17563068edc.135.1613427047768; 
	Mon, 15 Feb 2021 14:10:47 -0800 (PST)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 15 Feb 2021 17:10:37 -0500
Message-ID: <CAHC9VhR8gwyPpGnHbELBJ+2AZKQD0YTmhtSsLULjNbp7M-UM8g@mail.gmail.com>
Subject: [GIT PULL] Audit patches for v5.12
To: Linus Torvalds <torvalds@linux-foundation.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Three very trivial patches for audit this time.  All pass the
audit-testsuite and apply cleanly to your tree as of a few minutes
ago; please merge these for v5.12.

Thanks,
-Paul

--
The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

 Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   tags/audit-pr-20210215

for you to fetch changes up to 127c8c5f0589cea2208c329bff7dcb36e375f46c:

 audit: Make audit_filter_syscall() return void (2021-01-27 21:55:14 -0500)

----------------------------------------------------------------
audit/stable-5.12 PR 20210215

----------------------------------------------------------------
Davidlohr Bueso (1):
     audit: Remove leftover reference to the audit_tasklet

Yang Yang (1):
     audit: Make audit_filter_syscall() return void

Zheng Yongjun (1):
     kernel/audit: convert comma to semicolon

kernel/audit.c   |  4 ++--
kernel/auditsc.c | 16 ++++++++--------
2 files changed, 10 insertions(+), 10 deletions(-)

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


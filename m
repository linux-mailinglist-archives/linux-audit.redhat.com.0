Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5A50E23211D
	for <lists+linux-audit@lfdr.de>; Wed, 29 Jul 2020 16:58:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175--ZD73O6iO4SPjtsi81t6_A-1; Wed, 29 Jul 2020 10:57:57 -0400
X-MC-Unique: -ZD73O6iO4SPjtsi81t6_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EDD41893DC2;
	Wed, 29 Jul 2020 14:57:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1226D1EA;
	Wed, 29 Jul 2020 14:57:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 354C818095FF;
	Wed, 29 Jul 2020 14:57:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06TEsWEK029183 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 Jul 2020 10:54:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E899E100BC97; Wed, 29 Jul 2020 14:54:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3FFC11CC245
	for <linux-audit@redhat.com>; Wed, 29 Jul 2020 14:54:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F51180CC26
	for <linux-audit@redhat.com>; Wed, 29 Jul 2020 14:54:29 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-190-33Lk2OLtPsut-zO0KvSb6w-1; Wed, 29 Jul 2020 10:54:26 -0400
X-MC-Unique: 33Lk2OLtPsut-zO0KvSb6w-1
Received: by mail-ej1-f65.google.com with SMTP id g11so12881539ejr.0
	for <linux-audit@redhat.com>; Wed, 29 Jul 2020 07:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=/j3pJPti7R1Nqu8T1x4sAge6ACW4MRCL8TqgNXrRSNI=;
	b=Mjwpj0hbt5DDG6WI3dgqsNXFZsDpD+3zJ83eI3Djd6w2sMEs5M1wbimvojD0cjgnaR
	v4XVu+9w8ZFS8SBcFFmfmMXRdSHP8hu6HvM20gfA53vh2ULS85ydouQRIYFNOcsFqDl0
	nxF7oZrHk0iACWaym3TI6o85GZ5yHEuhvSBgUv1ccyPFicu29rFLRwzwuUPniOar6u1K
	W0fRWVtK6Pcl3TrZpt4l4cKS4JLGGcZSRIEw4/zeTuepSCySClt0TyODBy/uf8Qrd1FG
	kDi/EXY7nDUWhj1m4RwFSy4j8BV+OyzjaG1BJ9tvdY8aCmqiKCtf4aIuIaa/NYfcoyJJ
	xK2Q==
X-Gm-Message-State: AOAM532k84XWbGCOWOHLpbGBpG32qMsmnCMtn9lm7s4WUg6qYSMduyKz
	pH+ybkvlsfMMAtdZZxeRxYfomlCoSaTig1LNKVc26+gIFwd7
X-Google-Smtp-Source: ABdhPJxwfYn1Mu2F17YhaCWm+kTXC8ZtBnhObRT2ImFztho3D6TcXmKev1bBGPm4t52I3PTiibPkl/XINFHdUaFi8BY=
X-Received: by 2002:a17:906:43c9:: with SMTP id
	j9mr14596804ejn.542.1596034464837; 
	Wed, 29 Jul 2020 07:54:24 -0700 (PDT)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 Jul 2020 10:54:14 -0400
Message-ID: <CAHC9VhQSq87=vk63=Wr-0mdOZ3ExAKG3s6_9AMS=n_s8zGjhBQ@mail.gmail.com>
Subject: [GIT PULL] Audit fixes for v5.8 (#1)
To: Linus Torvalds <torvalds@linux-foundation.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

One small audit fix that you can hopefully merge before v5.8 is
released.  Unfortunately it is a revert of a patch that went in during
the v5.7 window and we just recently started to see some bug reports
relating to that commit.  We are working on a proper fix, but I'm not
yet clear on when that will be ready and we need to fix the v5.7
kernels anyway, so in the interest of time a revert seemed like the
best solution right now.

The patch passes our test suite, and as of right now it merges cleanly
against your tree.  You may notice a force-push on the
audit/stable-5.8 branch, but that was to fix a spelling mistake in the
commit that was identified after the patch had been committed.
Generally I try to avoid force-pushes, but since no one really uses
the audit/stable-X.Y branches as a base for development it seemed
safe.

Thanks,
-Paul

--
The following changes since commit 9d44a121c5a79bc8a9d67c058456bd52a83c79e7:

 audit: add subj creds to NETFILTER_CFG record to
   (2020-05-20 18:09:19 -0400)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   tags/audit-pr-20200729

for you to fetch changes up to 8ac68dc455d9d18241d44b96800d73229029ed34:

 revert: 1320a4052ea1 ("audit: trigger accompanying records when no rules
   present") (2020-07-29 10:00:36 -0400)

----------------------------------------------------------------
audit/stable-5.8 PR 20200729

----------------------------------------------------------------
Paul Moore (1):
     revert: 1320a4052ea1 ("audit: trigger accompanying records when no
       rules present")

kernel/audit.c   | 1 -
kernel/audit.h   | 8 --------
kernel/auditsc.c | 3 +++
3 files changed, 3 insertions(+), 9 deletions(-)

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


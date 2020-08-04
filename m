Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7A78D23B20C
	for <lists+linux-audit@lfdr.de>; Tue,  4 Aug 2020 03:00:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-yTBW5EI2N9SPWNF41KeIJQ-1; Mon, 03 Aug 2020 21:00:48 -0400
X-MC-Unique: yTBW5EI2N9SPWNF41KeIJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 448F91800D42;
	Tue,  4 Aug 2020 01:00:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EDF710013D7;
	Tue,  4 Aug 2020 01:00:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 116289A11A;
	Tue,  4 Aug 2020 01:00:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07410JSO030996 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 3 Aug 2020 21:00:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C270EAF8A; Tue,  4 Aug 2020 01:00:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57FBBEAF98
	for <linux-audit@redhat.com>; Tue,  4 Aug 2020 01:00:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E4931064C6C
	for <linux-audit@redhat.com>; Tue,  4 Aug 2020 01:00:16 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-374-_tBGup2NMSyr04oRucoNOQ-1; Mon, 03 Aug 2020 21:00:13 -0400
X-MC-Unique: _tBGup2NMSyr04oRucoNOQ-1
Received: by mail-ej1-f67.google.com with SMTP id m19so68537ejd.8
	for <linux-audit@redhat.com>; Mon, 03 Aug 2020 18:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=E4dcwzNRyCIA11x+yOeXcsKOAHsD/aVIQfoPgyAAnjc=;
	b=D5h0ltvYszcG1ObLFyggknxH/BiChqjfJXrpBIPqM2ShCxtXc312NMSghg8jeRW5U0
	RI6EWCGIpgNM96QH9oMv0R67lOtd13islFDw64X6Mp7vLt3hWS6idBbiSUs9UvisJ7+F
	yKBUWiJLEuz9zU2r+P0lBcnlvM2pq/PlORbc93128+2UrKn+ovahhVwI95QDdBEVPqsZ
	hfxZUXaSMgfFebgvC6QXQ1tovP5FBNhU0FPImKycIYiLDxXLpCyR6ij6UI4iHpN8PVk+
	EkZqUbjqriH5nhw59ugUMB6QU38nU5xvAkJwG5tJCazTMPNuTsxLF3d6sg7H9ZCwmMWy
	7AiQ==
X-Gm-Message-State: AOAM530vF1jGWRTEp5EgVKHYdt1S6hSPL3KjGwHa7DHwPVSXjeW7VwOv
	JRGqHGObKaoeIkASqZ5iCUZx79QGimRIFT3ifKbU
X-Google-Smtp-Source: ABdhPJwa7qnKT8GjvxOcF1UrQ0uPfcMxR8CzMiDD9D+EzWQ73UyIICWivG4UHiut7B3X/G9k+JTx6exuNc4IcRGqF+U=
X-Received: by 2002:a17:906:1911:: with SMTP id
	a17mr18091864eje.431.1596502812036; 
	Mon, 03 Aug 2020 18:00:12 -0700 (PDT)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 3 Aug 2020 21:00:01 -0400
Message-ID: <CAHC9VhRP3yN4dvrEe5_iAgVDnLNeedLOLXeb_zaE9OmBW_qSQw@mail.gmail.com>
Subject: [GIT PULL] Audit patches for v5.9
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Here are the audit patches for the v5.9 merge window.  All of the
patches in this pull request pass our test suite and merged cleanly
with your tree from a few hours ago.

Aside from some smaller bug fixes, here are the highlights:

- Add a new backlog wait metric to the audit status message, this is
intended to help admins determine how long processes have been waiting
for the audit backlog queue to clear

- Generate audit records for nftables configuration changes

- Generate CWD audit records for for the relevant LSM audit records

Please merge for v5.9, thanks,
-Paul

--
The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

 Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   tags/audit-pr-20200803

for you to fetch changes up to b43870c74f3fdf0cd06bf5f1b7a5ed70a2cd4ed2:

 audit: report audit wait metric in audit status reply
   (2020-07-21 11:21:44 -0400)

----------------------------------------------------------------
audit/stable-5.9 PR 20200803

----------------------------------------------------------------
Gustavo A. R. Silva (1):
     audit: Use struct_size() helper in alloc_chunk

Max Englander (1):
     audit: report audit wait metric in audit status reply

Paul Moore (1):
     audit: use the proper gfp flags in the audit_log_nfcfg() calls

Richard Guy Briggs (5):
     audit: log nftables configuration change events
     audit: add gfp parameter to audit_log_nfcfg
     audit: remove unused !CONFIG_AUDITSYSCALL __audit_inode* stubs
     audit: issue CWD record to accompany LSM_AUDIT_DATA_* records
     audit: purge audit_log_string from the intra-kernel audit API

include/linux/audit.h           |  46 +++++++++++------
include/uapi/linux/audit.h      |  18 ++++---
kernel/audit.c                  |  39 +++++++++-----
kernel/audit_tree.c             |   4 +-
kernel/auditsc.c                |  45 +++++++++++++---
net/bridge/netfilter/ebtables.c |   6 +--
net/netfilter/nf_tables_api.c   | 112 ++++++++++++++++++++++++++++++++++++
net/netfilter/x_tables.c        |   5 +-
security/apparmor/audit.c       |  10 ++--
security/apparmor/file.c        |  25 +++------
security/apparmor/ipc.c         |  46 ++++++++---------
security/apparmor/net.c         |  14 ++---
security/lsm_audit.c            |   9 +++-
13 files changed, 273 insertions(+), 106 deletions(-)

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


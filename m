Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 147F864AE0B
	for <lists+linux-audit@lfdr.de>; Tue, 13 Dec 2022 04:05:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670900736;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vUNWVeXtaFEj3ZB/lyXQw/HICAiJ5p/GCyWPg5R5ERY=;
	b=bRbdwEHW7dGx55wWD24rl63b0hc1hKKbh8T3kq0naPUcNSPEyGkeMOYwyUGBCkg465Q7Lx
	oCThqIHoGvmREoHboXtMJmmyA6AmlWX+don+nr/cisraN6FZAwjKscARA5PZeuueQq3yVO
	oeqe5EeW5srImPAA3t/EIhogA3C0mSo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-q3vbDCh3PZOckBCpMT98Jg-1; Mon, 12 Dec 2022 22:05:32 -0500
X-MC-Unique: q3vbDCh3PZOckBCpMT98Jg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B615A801580;
	Tue, 13 Dec 2022 03:05:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43235492C18;
	Tue, 13 Dec 2022 03:05:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1311D1946595;
	Tue, 13 Dec 2022 03:05:23 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1AF741946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 13 Dec 2022 03:05:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CA8302026D68; Tue, 13 Dec 2022 03:05:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C227F2026D4B
 for <linux-audit@redhat.com>; Tue, 13 Dec 2022 03:05:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A35FC85A588
 for <linux-audit@redhat.com>; Tue, 13 Dec 2022 03:05:21 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-QA-qUT1LOVePV0YTOnF5Sw-1; Mon, 12 Dec 2022 22:05:19 -0500
X-MC-Unique: QA-qUT1LOVePV0YTOnF5Sw-1
Received: by mail-pj1-f48.google.com with SMTP id
 t11-20020a17090a024b00b0021932afece4so2049273pje.5
 for <linux-audit@redhat.com>; Mon, 12 Dec 2022 19:05:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rtk5TESQhMYupkDzAnSZrsExO2w9BU3bH6jn+cnUrr8=;
 b=SQ3q60lmUPCwX4v5Sc20CJ+oh0v04sg1NrhbjR+/63H3hqU+Zm+ClzoW6kWfpNhmwu
 Xgiy07pi2M9lcSIJ9rejqAd5aUNvJ9HpQ5tvvFOUAx9JXoDaOUbCyswPWNfgKcxfzUVr
 KyM8siJ4/olflevl35iOnGC0EiM7OpmlfPfL5SA8EPMA5zdEH04J98FqwO0PwkZMCXnD
 vXchjA1bwufcLpUWP/ShNVDOzkSXHyZWI4IMHe0P1zmXRjLiu5BzYA1akyYdGcyC8/71
 ZlcCa6r6PDjN03hi+B1wQhL2f11NRffUM7Z1abW00L4FmUtceezJxxLVBAjlBmrcWRM2
 nm5A==
X-Gm-Message-State: ANoB5pnY3TyhlHXVMglpfeVq06Tt/9YSQpiNbHS5kOfPv7zMh+hVVi96
 YySI3Ag12ONORtwlS7T2IecNB6v1Wx3RrtmWoG6M
X-Google-Smtp-Source: AA0mqf5sXJfXq2xGHZuYJPucP5KXbmggjMQNiek+xwBIGByocsKl0BeOS+vBkTTEqug5rGt2mm4t5tq2wg7cxJagQKk=
X-Received: by 2002:a17:902:a70b:b0:189:b0a3:cf4f with SMTP id
 w11-20020a170902a70b00b00189b0a3cf4fmr37216824plq.56.1670900718781; Mon, 12
 Dec 2022 19:05:18 -0800 (PST)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 12 Dec 2022 22:05:07 -0500
Message-ID: <CAHC9VhTiYVO5SV6-P6gPcqR1chzwpEvwnDZaYEQACcU1kgvugw@mail.gmail.com>
Subject: [GIT PULL] Audit patches for v6.2
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Two performance oriented patches for the audit subsystem: one
consolidates similar code to gain some caching advantages, while the
other stores a value in a stack variable to avoid repeated lookups in
a loop.  The commit descriptions have more information, including some
before/after performance measurements.  Please merge for v6.2.

-Paul

--
The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

 Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

 https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   tags/audit-pr-20221212

for you to fetch changes up to 50979953c0c41e929e5f955800da68e1bb24c7ab:

 audit: unify audit_filter_{uring(), inode_name(), syscall()}
   (2022-10-17 14:24:42 -0400)

----------------------------------------------------------------
audit/stable-6.2 PR 20221212

----------------------------------------------------------------
Ankur Arora (2):
     audit: cache ctx->major in audit_filter_syscall()
     audit: unify audit_filter_{uring(), inode_name(), syscall()}

kernel/auditsc.c | 75 ++++++++++++++++++++++++++------------------------
1 file changed, 39 insertions(+), 36 deletions(-)

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


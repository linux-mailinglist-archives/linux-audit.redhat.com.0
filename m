Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 76D3C23A495
	for <lists+linux-audit@lfdr.de>; Mon,  3 Aug 2020 14:29:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-iBzCrxhuOBWrWPrro531tQ-1; Mon, 03 Aug 2020 08:29:39 -0400
X-MC-Unique: iBzCrxhuOBWrWPrro531tQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CB45106B246;
	Mon,  3 Aug 2020 12:29:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB83587E2C;
	Mon,  3 Aug 2020 12:29:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 050769A115;
	Mon,  3 Aug 2020 12:29:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 073CP1l2002800 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 3 Aug 2020 08:25:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F933217B435; Mon,  3 Aug 2020 12:25:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FFD1217B433
	for <linux-audit@redhat.com>; Mon,  3 Aug 2020 12:24:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32DC18008A5
	for <linux-audit@redhat.com>; Mon,  3 Aug 2020 12:24:58 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-278-rkj_AIe-Nz6NVUaC_iAzww-1; Mon, 03 Aug 2020 08:24:53 -0400
X-MC-Unique: rkj_AIe-Nz6NVUaC_iAzww-1
Received: by mail-wm1-f67.google.com with SMTP id 9so14133520wmj.5;
	Mon, 03 Aug 2020 05:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FTgfPSmSTzWTADmwe07r4VxKyWCszF67jRChwFwa6d0=;
	b=T4FjAjFbbR5SdbJ1VeAhliuxqRVihcKg7FAk/wnhNuYhka+Dfr1qKGPJvMD/SAmXRk
	xwC2PoWxfOSRbnHP5qZuOgOICAZocS7qh52b3nmNXLOp+jMtc+87Mxl2Z6558INLEoxa
	svAnC1jZpN2l+gCAPERKSNlXxajIau6Ah/NGrKt+CajUufq05I3A4HdpCaP8eU3moPsw
	szoy2BwhogTimrNJyCCZLt0oqOpzPQYNrCwJUTGTSLEE5n+3+zEpj9NZBvw25PQmd2CD
	tBA8MWLNd6qd/+enCxJoqyOrzXUbKqwYxdSSXUVX7rqLYDgPSM1SdS5PdCcK9WXWPDER
	7kGA==
X-Gm-Message-State: AOAM533CqiNE4667Yn4QTf/wiX1bI/yvERO/SohAPPCr15oqvfoMBLva
	GA1BrM8oBZrhHU/0z/5XOg==
X-Google-Smtp-Source: ABdhPJzAEMNcSysSnj7Cg5pHOtKwl+m02esoSnz41MtlOdS3tmdgi1rw2q8LAZo2gFiazyGUkdO0Jg==
X-Received: by 2002:a1c:984d:: with SMTP id a74mr16567619wme.140.1596457492292;
	Mon, 03 Aug 2020 05:24:52 -0700 (PDT)
Received: from localhost.lan (host-92-25-238-49.as13285.net. [92.25.238.49])
	by smtp.gmail.com with ESMTPSA id m1sm6559050wmc.28.2020.08.03.05.24.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Aug 2020 05:24:51 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
To: inux-kernel@vger.kernel.org
Subject: [PATCH 2/2] audit: uninitialize variable audit_sig_sid
Date: Mon,  3 Aug 2020 13:24:30 +0100
Message-Id: <20200803122430.82364-3-jbi.octave@gmail.com>
In-Reply-To: <20200803122430.82364-1-jbi.octave@gmail.com>
References: <0/2>
 <20200803122430.82364-1-jbi.octave@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:29:23 -0400
Cc: Jules Irenge <jbi.octave@gmail.com>,
	"moderated list:AUDIT SUBSYSTEM" <linux-audit@redhat.com>,
	open list <linux-kernel@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Checkpatch tool reports

"ERROR: do not initialise globals/statics to 0"

To fix this, audit_sig_sid is uninitialized
As this is stored in the .bss section,
the compiler can initialize the variable automatically.

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 kernel/audit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index afd7827cf6e8..1c74d1d788b6 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -125,7 +125,7 @@ static u32	audit_backlog_wait_time = AUDIT_BACKLOG_WAIT_TIME;
 /* The identity of the user shutting down the audit system. */
 static kuid_t		audit_sig_uid = INVALID_UID;
 static pid_t		audit_sig_pid = -1;
-static u32		audit_sig_sid = 0;
+static u32		audit_sig_sid;
 
 /* Records can be lost in several ways:
    0) [suppressed in audit_alloc]
-- 
2.26.2

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE5A23A5B4
	for <lists+linux-audit@lfdr.de>; Mon,  3 Aug 2020 14:41:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-6e2arLRyPbeqPUEKVxvMhA-1; Mon, 03 Aug 2020 08:41:25 -0400
X-MC-Unique: 6e2arLRyPbeqPUEKVxvMhA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A8AF1DE4;
	Mon,  3 Aug 2020 12:41:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A60888AD1C;
	Mon,  3 Aug 2020 12:41:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BCFCF1809554;
	Mon,  3 Aug 2020 12:41:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 073CZGL4005024 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 3 Aug 2020 08:35:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2054A20A053B; Mon,  3 Aug 2020 12:35:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E5342023597
	for <linux-audit@redhat.com>; Mon,  3 Aug 2020 12:35:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7A7080118C
	for <linux-audit@redhat.com>; Mon,  3 Aug 2020 12:35:15 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-17-Gv_zPn0UNdGGEqQRZo4sww-1; Mon, 03 Aug 2020 08:35:12 -0400
X-MC-Unique: Gv_zPn0UNdGGEqQRZo4sww-1
Received: by mail-wm1-f68.google.com with SMTP id d190so14171559wmd.4;
	Mon, 03 Aug 2020 05:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FTgfPSmSTzWTADmwe07r4VxKyWCszF67jRChwFwa6d0=;
	b=oqH9+TbOtu8iWiQPkpE84xJ1vfRYX3Ie4KlojgVTg0YI2idCyP0oaebrccyqyGMYNf
	01Zf7ZeJj8kY3uxkky5B8z3b+2qr/Hhrbl/Y5cT2KEb/VLiwdh6q6DAJP1St1rpDddX6
	67BjuVvfS8IjrrVwuwMKcYqy+tdNF0iVLynQASjU593/ULHnqDz4LTXm/IW0kniOg4K1
	PO9jq1XX4L9HFCOaTtJBSJtGuUtpLdYiQBMhMwUYlIyOK14PL4BSEQiC0/Ct8sio1C+T
	tiRURZXIJMjw7ryqeNncHpXlLc/Udjd0gDijlTE+9t9eJlUCrjE1sW6ysJ0EzxsOrVq/
	xzsA==
X-Gm-Message-State: AOAM532CTqqG739hjn7CoPDutL4nlTOKhM5OYqMruM+UYyM/0Dc5MYki
	YqcbfxBMWWurx9UOTbfPrw==
X-Google-Smtp-Source: ABdhPJzbe6LZdfAL8EIT/Oh6YY9Xm6ZbUZUyEPTt/DKov8B61cmbhjP3GfR5BPcRyxIrZO4nqxoYSw==
X-Received: by 2002:a1c:23c4:: with SMTP id j187mr15931167wmj.58.1596458110852;
	Mon, 03 Aug 2020 05:35:10 -0700 (PDT)
Received: from localhost.lan (host-92-25-238-49.as13285.net. [92.25.238.49])
	by smtp.gmail.com with ESMTPSA id
	u66sm24201133wmu.37.2020.08.03.05.35.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Aug 2020 05:35:10 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 2/2] audit: uninitialize variable audit_sig_sid
Date: Mon,  3 Aug 2020 13:34:39 +0100
Message-Id: <20200803123439.83400-3-jbi.octave@gmail.com>
In-Reply-To: <20200803123439.83400-1-jbi.octave@gmail.com>
References: <0/2>
 <20200803123439.83400-1-jbi.octave@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:41:13 -0400
Cc: Jules Irenge <jbi.octave@gmail.com>,
	"moderated list:AUDIT SUBSYSTEM" <linux-audit@redhat.com>
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


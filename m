Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2437723A494
	for <lists+linux-audit@lfdr.de>; Mon,  3 Aug 2020 14:29:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-2au7JXr2PRSZUWjHR7uuug-1; Mon, 03 Aug 2020 08:29:39 -0400
X-MC-Unique: 2au7JXr2PRSZUWjHR7uuug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68D15E918;
	Mon,  3 Aug 2020 12:29:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFDFE7C11F;
	Mon,  3 Aug 2020 12:29:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA5161809554;
	Mon,  3 Aug 2020 12:29:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 073COwm7002794 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 3 Aug 2020 08:24:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1C695AFD76; Mon,  3 Aug 2020 12:24:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15BD9C54A2
	for <linux-audit@redhat.com>; Mon,  3 Aug 2020 12:24:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F18D218A6661
	for <linux-audit@redhat.com>; Mon,  3 Aug 2020 12:24:54 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-227-yW5dQ7ExML-Jy0xNZoXWlA-1; Mon, 03 Aug 2020 08:24:52 -0400
X-MC-Unique: yW5dQ7ExML-Jy0xNZoXWlA-1
Received: by mail-wm1-f66.google.com with SMTP id d190so14142805wmd.4;
	Mon, 03 Aug 2020 05:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VR9T7sylAgjDgpJ8EDAbpDnekBXDbki41I/rzJT2SZI=;
	b=GeGn+nFyclWrm2MWfhToPCdEb+kcfE9owqcq9KT17tIqEt/E/oR2uI8W7Ty/j8HaXS
	QCNWXh9PHrZM4HV/6ds4fbf8oFdClU2dk1hZ6undr/P+hlB71TCx2dIDwpaoou7Yka/i
	3bpK8c75EA34IyM/U3SxtDRaqq0JaPnfiHjPajpKD3o7nTIKQ/9ii+8MCCtaO6BLxWG4
	u0tdxVTQ+1hAsubv/Pupd2+T65289dj93iU4gqLYHger3NGg3yOPj+VcRGUD89KAdi60
	MX/uYk4dI2DgkA37qcpZQ+mbZhbKCjzQa3iabreCU2HuISdgbD7OEwcnPngpvMCbjdZt
	wXoA==
X-Gm-Message-State: AOAM532yJspiF3lMPRRDfnfnR2jife3o89ahD7vVe607d/B5iGbQ7x62
	egZNDhNIugWjpyJGgiLfUg==
X-Google-Smtp-Source: ABdhPJxOzWCjQaTB+cJQ7jRVCWIutX9Ay2X699z2X8+4vZZyLeOr0PwCMw7b9/0acSQzT7G/3F9djw==
X-Received: by 2002:a1c:9e11:: with SMTP id h17mr3110316wme.106.1596457490306; 
	Mon, 03 Aug 2020 05:24:50 -0700 (PDT)
Received: from localhost.lan (host-92-25-238-49.as13285.net. [92.25.238.49])
	by smtp.gmail.com with ESMTPSA id m1sm6559050wmc.28.2020.08.03.05.24.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Aug 2020 05:24:49 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
To: inux-kernel@vger.kernel.org
Subject: [PATCH 1/2] audit: change unnecessary globals into statics
Date: Mon,  3 Aug 2020 13:24:29 +0100
Message-Id: <20200803122430.82364-2-jbi.octave@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Variables sig_pid, audit_sig_uid and audit_sig_sid
are only used in the audit.c file across the kernel
Hence it appears no reason for declaring them as globals
This patch removes their global declarations from the .h file
and change them into static in the .c file.

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 kernel/audit.c | 6 +++---
 kernel/audit.h | 4 ----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index b2301bdc9773..afd7827cf6e8 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -123,9 +123,9 @@ static u32	audit_backlog_limit = 64;
 static u32	audit_backlog_wait_time = AUDIT_BACKLOG_WAIT_TIME;
 
 /* The identity of the user shutting down the audit system. */
-kuid_t		audit_sig_uid = INVALID_UID;
-pid_t		audit_sig_pid = -1;
-u32		audit_sig_sid = 0;
+static kuid_t		audit_sig_uid = INVALID_UID;
+static pid_t		audit_sig_pid = -1;
+static u32		audit_sig_sid = 0;
 
 /* Records can be lost in several ways:
    0) [suppressed in audit_alloc]
diff --git a/kernel/audit.h b/kernel/audit.h
index ddc22878433d..3b9c0945225a 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -327,10 +327,6 @@ static inline int audit_signal_info_syscall(struct task_struct *t)
 
 extern char *audit_unpack_string(void **bufp, size_t *remain, size_t len);
 
-extern pid_t audit_sig_pid;
-extern kuid_t audit_sig_uid;
-extern u32 audit_sig_sid;
-
 extern int audit_filter(int msgtype, unsigned int listtype);
 
 extern void audit_ctl_lock(void);
-- 
2.26.2

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


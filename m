Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7B08823A5BB
	for <lists+linux-audit@lfdr.de>; Mon,  3 Aug 2020 14:41:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-YuDngld9O7miBAPJTZ2FLg-1; Mon, 03 Aug 2020 08:41:46 -0400
X-MC-Unique: YuDngld9O7miBAPJTZ2FLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12EE7192376B;
	Mon,  3 Aug 2020 12:41:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6E7E71765;
	Mon,  3 Aug 2020 12:41:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6152F9A0F6;
	Mon,  3 Aug 2020 12:41:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 073CZFwH005018 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 3 Aug 2020 08:35:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 010AC202B170; Mon,  3 Aug 2020 12:35:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA82E202B16C
	for <linux-audit@redhat.com>; Mon,  3 Aug 2020 12:35:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACD95800818
	for <linux-audit@redhat.com>; Mon,  3 Aug 2020 12:35:12 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-459-pxanfoNVMP-fOl3u7qDs-A-1; Mon, 03 Aug 2020 08:35:10 -0400
X-MC-Unique: pxanfoNVMP-fOl3u7qDs-A-1
Received: by mail-wm1-f68.google.com with SMTP id k20so15253064wmi.5;
	Mon, 03 Aug 2020 05:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VR9T7sylAgjDgpJ8EDAbpDnekBXDbki41I/rzJT2SZI=;
	b=tAiVlRExlfwTifHvgvUMVvQ3iaosOzcKCZ75Uw/llycc+ZqlJlAnk6U+ZTBLakdJY5
	gwMWYl4brnhlp1eLWsYkC+qxDiZngNaUnw/VoF2lzTThMJ4jh/GzndgGioY2ItgeO3IV
	IRt5TcvqIWBEDi8XODfnU/uGh8DmXna/654IOtVxl6mBpRO7Ha9hLbJsaGszePUYwrAr
	/sGshyN561dC67/2FNNrnzS6em3YMkR8bg5nxXtZkCvE8H/FWIDc+K6bFcnBkxJ0yppO
	uhaau4EOzPXt4bc7x+oQRjVNQpf4NCbXlo3+RV6nKfTp7ko/0TanmTIwP7KvSNL6NFqA
	wR+A==
X-Gm-Message-State: AOAM5312yLIjEy882fao9eEwzH5GmOWMKNEPY+t/K0ILOKOvfvKpLvDt
	RUHjO5GzlYsTuvdgb9W1vBc6Goe/iw==
X-Google-Smtp-Source: ABdhPJwJYJ1EoIWwc5DnS8UDx5TQ7vHTekDqKRD22JWPrMP6ZJ5JeQs2FFY9GFnHQzJzQsP4WI6gUQ==
X-Received: by 2002:a05:600c:21cd:: with SMTP id
	x13mr16832676wmj.155.1596458109433; 
	Mon, 03 Aug 2020 05:35:09 -0700 (PDT)
Received: from localhost.lan (host-92-25-238-49.as13285.net. [92.25.238.49])
	by smtp.gmail.com with ESMTPSA id
	u66sm24201133wmu.37.2020.08.03.05.35.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Aug 2020 05:35:09 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 1/2] audit: change unnecessary globals into statics
Date: Mon,  3 Aug 2020 13:34:38 +0100
Message-Id: <20200803123439.83400-2-jbi.octave@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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


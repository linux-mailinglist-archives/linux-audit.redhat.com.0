Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 55F4317FC78
	for <lists+linux-audit@lfdr.de>; Tue, 10 Mar 2020 14:21:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583846489;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VFUb6fPQYIO9LR1ffiK8MxMOylczvf+RNmLrzo6sFJc=;
	b=W7c/DLcMflMxP8xmV5hlUw3u/r9dkbc3mOG/gUDzqHCcSbJ5xT0n1pAQxPlcxNzN4MRxOo
	vdVm4n+9MZXLPB+8dglRCULjRlYZmRtedJmV0Zjar5Lmi6kEph96RW0qkeXNl97Ogfgltn
	xZ7d3BLATLX555PvO2b1oWaaHvKmghA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-FrP8Kv4PMyGmpBh7t5P-MA-1; Tue, 10 Mar 2020 09:21:27 -0400
X-MC-Unique: FrP8Kv4PMyGmpBh7t5P-MA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D3AA184C806;
	Tue, 10 Mar 2020 13:21:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DD458F358;
	Tue, 10 Mar 2020 13:21:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CC4018089C8;
	Tue, 10 Mar 2020 13:21:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ADKvWC029579 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 10 Mar 2020 09:20:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CC7A08D553; Tue, 10 Mar 2020 13:20:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.rdu2.redhat.com
	[10.10.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F03948F363;
	Tue, 10 Mar 2020 13:20:50 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 ghak120] audit: trigger accompanying records when no rules
	present
Date: Tue, 10 Mar 2020 09:20:17 -0400
Message-Id: <199b556aae531db6e08f2711b1751e976f8bd48a.1583801740.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, eparis@parisplace.org
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
MIME-Version: 1.0
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When there are no audit rules registered, mandatory records (config,
etc.) are missing their accompanying records (syscall, proctitle, etc.).

This is due to audit context dummy set on syscall entry based on absence
of rules that signals that no other records are to be printed.

Clear the dummy bit if any record is generated.

The proctitle context and dummy checks are pointless since the
proctitle record will not be printed if no syscall records are printed.

Please see upstream github issue
https://github.com/linux-audit/audit-kernel/issues/120

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
Chagelog:
v2:
- unconditionally clear dummy
- create audit_clear_dummy accessor function
- remove proctitle context and dummy checks
---
 kernel/audit.c   | 1 +
 kernel/audit.h   | 8 ++++++++
 kernel/auditsc.c | 3 ---
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index 17b0d523afb3..b96331e1976d 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1798,6 +1798,7 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
 	}
 
 	audit_get_stamp(ab->ctx, &t, &serial);
+	audit_clear_dummy(ab->ctx);
 	audit_log_format(ab, "audit(%llu.%03lu:%u): ",
 			 (unsigned long long)t.tv_sec, t.tv_nsec/1000000, serial);
 
diff --git a/kernel/audit.h b/kernel/audit.h
index 6fb7160412d4..2eed4d231624 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -290,6 +290,13 @@ extern bool audit_tree_match(struct audit_chunk *chunk,
 extern void audit_filter_inodes(struct task_struct *tsk,
 				struct audit_context *ctx);
 extern struct list_head *audit_killed_trees(void);
+
+static inline void audit_clear_dummy(struct audit_context *ctx)
+{
+	if (ctx)
+		ctx->dummy = 0;
+}
+
 #else /* CONFIG_AUDITSYSCALL */
 #define auditsc_get_stamp(c, t, s) 0
 #define audit_put_watch(w) {}
@@ -323,6 +330,7 @@ static inline int audit_signal_info_syscall(struct task_struct *t)
 }
 
 #define audit_filter_inodes(t, c) AUDIT_DISABLED
+#define audit_clear_dummy(c) {}
 #endif /* CONFIG_AUDITSYSCALL */
 
 extern char *audit_unpack_string(void **bufp, size_t *remain, size_t len);
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 4effe01ebbe2..814406a35db1 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1406,9 +1406,6 @@ static void audit_log_proctitle(void)
 	struct audit_context *context = audit_context();
 	struct audit_buffer *ab;
 
-	if (!context || context->dummy)
-		return;
-
 	ab = audit_log_start(context, GFP_KERNEL, AUDIT_PROCTITLE);
 	if (!ab)
 		return;	/* audit_panic or being filtered */
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


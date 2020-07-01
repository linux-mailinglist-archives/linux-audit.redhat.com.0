Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDE421152C
	for <lists+linux-audit@lfdr.de>; Wed,  1 Jul 2020 23:33:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-QIqiVzxKOcaGwH9YSFbhWg-1; Wed, 01 Jul 2020 17:33:25 -0400
X-MC-Unique: QIqiVzxKOcaGwH9YSFbhWg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07250100CCC3;
	Wed,  1 Jul 2020 21:33:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BB6273FC0;
	Wed,  1 Jul 2020 21:33:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FD816C9C6;
	Wed,  1 Jul 2020 21:33:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061LWtBL010003 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 17:32:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9DBAA20230A9; Wed,  1 Jul 2020 21:32:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E4D52037D78
	for <linux-audit@redhat.com>; Wed,  1 Jul 2020 21:32:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0255185A78B
	for <linux-audit@redhat.com>; Wed,  1 Jul 2020 21:32:52 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-126-e9Kv9I0oPBeeqI4mjOCpTQ-1; Wed, 01 Jul 2020 17:32:48 -0400
X-MC-Unique: e9Kv9I0oPBeeqI4mjOCpTQ-1
Received: by mail-qk1-f195.google.com with SMTP id r22so23676030qke.13;
	Wed, 01 Jul 2020 14:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=xDTb+9wD2FqwLGAjapvaql79qpg8l4QI6wXGVFge1Zg=;
	b=M+KGoXpyVextVIIPC/6AQ55xtqTTk24N/7LwKxIcoxn7vH4kDY07Wk93hGCuiy4dSe
	sN2YZ+hUTREmMgVd5d2LcsFUcXJzwINhOd89kXf5IaLgqP9DpNlDyG8hDr4mm/x5gwEM
	uErEZsVJJFNc7xW9//y9t3ggoCqdEsmvQ4BuxlJjg6StklsQVi2/JNC0979lEAbQU07i
	OLlf4basZcQ7Tkr9aMjR8o62+F3enJppdoW9nLlKUULVvu9992Qm3ZJ924P4dHj9nZe7
	biFJIQrgb1LY6G9UtNLjIviITXWTpT+wvSOcnRN91SVoeoJ/8M7rUoCaSWD+XvQtABsc
	tiyw==
X-Gm-Message-State: AOAM533GyU2e1xpcfN2v2sY0OeIjxMSbit3hOmiBkumRxeL+Ovmahbbl
	yRI5WhKx3Y7GA8hkbaCqw1CbXabZylI=
X-Google-Smtp-Source: ABdhPJwdiWB0g3qpGB/KgUzGSo/8em6VNWkdg3C6PtGFiqe+gJuvYBBf8vDdqdD5RLzfCy1H5H2brw==
X-Received: by 2002:a37:6295:: with SMTP id
	w143mr26042024qkb.486.1593639167983; 
	Wed, 01 Jul 2020 14:32:47 -0700 (PDT)
Received: from linux-kernel-dev (ool-182c9054.dyn.optonline.net.
	[24.44.144.84]) by smtp.gmail.com with ESMTPSA id
	w44sm7004313qtj.86.2020.07.01.14.32.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 01 Jul 2020 14:32:47 -0700 (PDT)
Date: Wed, 1 Jul 2020 21:32:46 +0000
From: Max Englander <max.englander@gmail.com>
To: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>,
	linux-audit@redhat.com
Subject: [PATCH v2] audit: report audit wait metric in audit status reply
Message-ID: <20200701213244.GA1817@linux-kernel-dev>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

In environments where the preservation of audit events and predictable
usage of system memory are prioritized, admins may use a combination of
--backlog_wait_time and -b options at the risk of degraded performance
resulting from backlog waiting. In some cases, this risk may be
preferred to lost events or unbounded memory usage. Ideally, this risk
can be mitigated by making adjustments when backlog waiting is detected.

However, detection can be diffult using the currently available metrics.
For example, an admin attempting to debug degraded performance may
falsely believe a full backlog indicates backlog waiting. It may turn
out the backlog frequently fills up but drains quickly.

To make it easier to reliably track degraded performance to backlog
waiting, this patch makes the following changes:

Add a new field backlog_wait_sum to the audit status reply. Initialize
this field to zero. Add to this field the total time spent by the
current task on scheduled timeouts while the backlog limit is exceeded.

Tested on Ubuntu 18.04 using complementary changes to the audit
userspace: https://github.com/linux-audit/audit-userspace/pull/134.

Signed-off-by: Max Englander <max.englander@gmail.com>
---
 Patch changelogs between v1 and v2:
 - Instead of printing a warning when backlog waiting occurs, add
   duration of backlog waiting to cumulative sum, and report this
   sum in audit status reply.

 include/uapi/linux/audit.h | 7 ++++++-
 kernel/audit.c             | 9 +++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index a534d71e689a..ea0cc364beca 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -340,6 +340,7 @@ enum {
 #define AUDIT_STATUS_BACKLOG_LIMIT	0x0010
 #define AUDIT_STATUS_BACKLOG_WAIT_TIME	0x0020
 #define AUDIT_STATUS_LOST		0x0040
+#define AUDIT_STATUS_BACKLOG_WAIT_SUM	0x0080
 
 #define AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT	0x00000001
 #define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME	0x00000002
@@ -348,6 +349,7 @@ enum {
 #define AUDIT_FEATURE_BITMAP_SESSIONID_FILTER	0x00000010
 #define AUDIT_FEATURE_BITMAP_LOST_RESET		0x00000020
 #define AUDIT_FEATURE_BITMAP_FILTER_FS		0x00000040
+#define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM	0x00000080
 
 #define AUDIT_FEATURE_BITMAP_ALL (AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT | \
 				  AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME | \
@@ -355,12 +357,14 @@ enum {
 				  AUDIT_FEATURE_BITMAP_EXCLUDE_EXTEND | \
 				  AUDIT_FEATURE_BITMAP_SESSIONID_FILTER | \
 				  AUDIT_FEATURE_BITMAP_LOST_RESET | \
-				  AUDIT_FEATURE_BITMAP_FILTER_FS)
+				  AUDIT_FEATURE_BITMAP_FILTER_FS | \
+				  AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM)
 
 /* deprecated: AUDIT_VERSION_* */
 #define AUDIT_VERSION_LATEST 		AUDIT_FEATURE_BITMAP_ALL
 #define AUDIT_VERSION_BACKLOG_LIMIT	AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT
 #define AUDIT_VERSION_BACKLOG_WAIT_TIME	AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME
+#define AUDIT_VERSION_BACKLOG_WAIT_SUM	AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM
 
 				/* Failure-to-log actions */
 #define AUDIT_FAIL_SILENT	0
@@ -466,6 +470,7 @@ struct audit_status {
 		__u32	feature_bitmap;	/* bitmap of kernel audit features */
 	};
 	__u32		backlog_wait_time;/* message queue wait timeout */
+	__u32           backlog_wait_sum;/* time spent waiting while message limit exceeded */
 };
 
 struct audit_features {
diff --git a/kernel/audit.c b/kernel/audit.c
index 87f31bf1f0a0..301ea4f3d750 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -136,6 +136,11 @@ u32		audit_sig_sid = 0;
 */
 static atomic_t	audit_lost = ATOMIC_INIT(0);
 
+/* Monotonically increasing sum of time the kernel has spent
+ * waiting while the backlog limit is exceeded.
+ */
+static atomic_t audit_backlog_wait_sum = ATOMIC_INIT(0);
+
 /* Hash for inode-based rules */
 struct list_head audit_inode_hash[AUDIT_INODE_BUCKETS];
 
@@ -1204,6 +1209,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 		s.backlog		= skb_queue_len(&audit_queue);
 		s.feature_bitmap	= AUDIT_FEATURE_BITMAP_ALL;
 		s.backlog_wait_time	= audit_backlog_wait_time;
+		s.backlog_wait_sum      = atomic_read(&audit_backlog_wait_sum);
 		audit_send_reply(skb, seq, AUDIT_GET, 0, 0, &s, sizeof(s));
 		break;
 	}
@@ -1794,6 +1800,9 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
 				return NULL;
 			}
 		}
+
+		if (stime != audit_backlog_wait_time)
+			atomic_add(audit_backlog_wait_time - stime, &audit_backlog_wait_sum);
 	}
 
 	ab = audit_buffer_alloc(ctx, gfp_mask, type);
-- 
2.17.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


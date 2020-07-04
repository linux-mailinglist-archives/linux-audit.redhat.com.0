Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5865D2146E0
	for <lists+linux-audit@lfdr.de>; Sat,  4 Jul 2020 17:23:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-wWDwY1rUNNmveb3qjdV7Rw-1; Sat, 04 Jul 2020 11:23:21 -0400
X-MC-Unique: wWDwY1rUNNmveb3qjdV7Rw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B39B107ACCD;
	Sat,  4 Jul 2020 15:23:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1A0010013D5;
	Sat,  4 Jul 2020 15:23:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5411C6C9E0;
	Sat,  4 Jul 2020 15:23:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 064FFaP7010484 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 4 Jul 2020 11:15:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 661F0AF987; Sat,  4 Jul 2020 15:15:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6182AAF7B6
	for <linux-audit@redhat.com>; Sat,  4 Jul 2020 15:15:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 697BD8EF3A4
	for <linux-audit@redhat.com>; Sat,  4 Jul 2020 15:15:34 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-355-eZAfngiCOk2Bhui36l8uVg-1; Sat, 04 Jul 2020 11:15:30 -0400
X-MC-Unique: eZAfngiCOk2Bhui36l8uVg-1
Received: by mail-qt1-f193.google.com with SMTP id g13so25894259qtv.8;
	Sat, 04 Jul 2020 08:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=ACriR30zO1Ybdg75cMOL2STY6qGLZwrMsBdiomPh610=;
	b=ByILfPD3p95gRX1CVOnw0SFjxgVKi5Tw4jXD2xermotqLmMB66uVdwMzoIuQGVwAy5
	ChC5W37l638/x46hfUDeahl2ZeB0GubfvvOhFsaXuw4eMNpkOkOeb7ZLd6vUh8Kvwoff
	/SW1cSgjy4CM01GU0QHtzdqQCsAPr0/m1MB8VPduhgEDVEYrqS/Ys7VlUX+lkAi04jg9
	u2pPj4BduzzKynv7ok2DfCJ0oOlUV7/Ufgj8ivu8QdSbM/hp3Hz4hJGTPADAC9ou1pKY
	8crMXN+mGYIZ5Msbb97za3MHMBOvxIotciUTRXrYBb0792BT6jPYbeuxpqpAaDhrPNWj
	+kmA==
X-Gm-Message-State: AOAM530FMw5lGdix5QQ7hnTpQiv+3SAutSLQy+jNlzozpYluvZaXTJA3
	xBFi4ufuqFd7dUtpP7brrnx2oIpUB90=
X-Google-Smtp-Source: ABdhPJyeEczx4idssaa1ZyHoMvPwZVgcyhrZVqWxA3Uj9C7R4sisdneWJ6uk+sq2TeuoPOWaJDae3g==
X-Received: by 2002:ac8:1088:: with SMTP id a8mr10875134qtj.90.1593875729424; 
	Sat, 04 Jul 2020 08:15:29 -0700 (PDT)
Received: from linux-kernel-dev (ool-182c9054.dyn.optonline.net.
	[24.44.144.84]) by smtp.gmail.com with ESMTPSA id
	x29sm14287158qtv.80.2020.07.04.08.15.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jul 2020 08:15:29 -0700 (PDT)
Date: Sat, 4 Jul 2020 15:15:28 +0000
From: Max Englander <max.englander@gmail.com>
To: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>,
	linux-audit@redhat.com
Subject: [PATCH v3] audit: report audit wait metric in audit status reply
Message-ID: <20200704151526.GA62112@linux-kernel-dev>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

However, detection can be difficult using the currently available
metrics. For example, an admin attempting to debug degraded performance
may falsely believe a full backlog indicates backlog waiting. It may
turn out the backlog frequently fills up but drains quickly.

To make it easier to reliably track degraded performance to backlog
waiting, this patch makes the following changes:

Add a new field backlog_wait_time_total to the audit status reply.
Initialize this field to zero. Add to this field the total time spent
by the current task on scheduled timeouts while the backlog limit is
exceeded. Reset field to zero upon request via AUDIT_SET.

Tested on Ubuntu 18.04 using complementary changes to the
audit-userspace and audit-testsuite:
- https://github.com/linux-audit/audit-userspace/pull/134
- https://github.com/linux-audit/audit-testsuite/pull/97

Signed-off-by: Max Englander <max.englander@gmail.com>
---
Patch changelogs between v1 and v2:
  - Instead of printing a warning when backlog waiting occurs, add
    duration of backlog waiting to cumulative sum, and report this
    sum in audit status reply.

Patch changelogs between v2 and v3:
 - Rename backlog_wait_sum to backlog_wait_time_actual.
 - Drop unneeded and unwanted header flags
   AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM and
   AUDIT_VERSION_BACKLOG_WAIT_SUM.
 - Increment backlog_wait_time_actual counter after every call to
   schedule_timeout rather than once after enqueuing (or losing) an
   audit record.
 - Add support for resetting backlog_wait_time_actual counter to zero
   upon request via AUDIT_SET.

 include/uapi/linux/audit.h | 18 +++++++++++-------
 kernel/audit.c             | 35 +++++++++++++++++++++++++----------
 2 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index a534d71e689a..92d72965ad44 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -332,14 +332,15 @@ enum {
 };
 
 /* Status symbols */
-				/* Mask values */
-#define AUDIT_STATUS_ENABLED		0x0001
-#define AUDIT_STATUS_FAILURE		0x0002
-#define AUDIT_STATUS_PID		0x0004
+						/* Mask values */
+#define AUDIT_STATUS_ENABLED			0x0001
+#define AUDIT_STATUS_FAILURE			0x0002
+#define AUDIT_STATUS_PID			0x0004
 #define AUDIT_STATUS_RATE_LIMIT		0x0008
-#define AUDIT_STATUS_BACKLOG_LIMIT	0x0010
-#define AUDIT_STATUS_BACKLOG_WAIT_TIME	0x0020
-#define AUDIT_STATUS_LOST		0x0040
+#define AUDIT_STATUS_BACKLOG_LIMIT		0x0010
+#define AUDIT_STATUS_BACKLOG_WAIT_TIME		0x0020
+#define AUDIT_STATUS_LOST			0x0040
+#define AUDIT_STATUS_BACKLOG_WAIT_TIME_ACTUAL	0x0080
 
 #define AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT	0x00000001
 #define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME	0x00000002
@@ -466,6 +467,9 @@ struct audit_status {
 		__u32	feature_bitmap;	/* bitmap of kernel audit features */
 	};
 	__u32		backlog_wait_time;/* message queue wait timeout */
+	__u32           backlog_wait_time_actual;/* time spent waiting while
+						  * message limit exceeded
+						  */
 };
 
 struct audit_features {
diff --git a/kernel/audit.c b/kernel/audit.c
index 87f31bf1f0a0..33c640fdacf7 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -136,6 +136,11 @@ u32		audit_sig_sid = 0;
 */
 static atomic_t	audit_lost = ATOMIC_INIT(0);
 
+/* Monotonically increasing sum of time the kernel has spent
+ * waiting while the backlog limit is exceeded.
+ */
+static atomic_t audit_backlog_wait_time_actual = ATOMIC_INIT(0);
+
 /* Hash for inode-based rules */
 struct list_head audit_inode_hash[AUDIT_INODE_BUCKETS];
 
@@ -1193,17 +1198,18 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 	case AUDIT_GET: {
 		struct audit_status	s;
 		memset(&s, 0, sizeof(s));
-		s.enabled		= audit_enabled;
-		s.failure		= audit_failure;
+		s.enabled		   = audit_enabled;
+		s.failure		   = audit_failure;
 		/* NOTE: use pid_vnr() so the PID is relative to the current
 		 *       namespace */
-		s.pid			= auditd_pid_vnr();
-		s.rate_limit		= audit_rate_limit;
-		s.backlog_limit		= audit_backlog_limit;
-		s.lost			= atomic_read(&audit_lost);
-		s.backlog		= skb_queue_len(&audit_queue);
-		s.feature_bitmap	= AUDIT_FEATURE_BITMAP_ALL;
-		s.backlog_wait_time	= audit_backlog_wait_time;
+		s.pid			   = auditd_pid_vnr();
+		s.rate_limit		   = audit_rate_limit;
+		s.backlog_limit		   = audit_backlog_limit;
+		s.lost			   = atomic_read(&audit_lost);
+		s.backlog		   = skb_queue_len(&audit_queue);
+		s.feature_bitmap	   = AUDIT_FEATURE_BITMAP_ALL;
+		s.backlog_wait_time	   = audit_backlog_wait_time;
+		s.backlog_wait_time_actual = atomic_read(&audit_backlog_wait_time_actual);
 		audit_send_reply(skb, seq, AUDIT_GET, 0, 0, &s, sizeof(s));
 		break;
 	}
@@ -1307,6 +1313,12 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 			audit_log_config_change("lost", 0, lost, 1);
 			return lost;
 		}
+		if (s.mask == AUDIT_STATUS_BACKLOG_WAIT_TIME_ACTUAL) {
+			u32 actual = atomic_xchg(&audit_backlog_wait_time_actual, 0);
+
+			audit_log_config_change("backlog_wait_time_actual", 0, actual, 1);
+			return actual;
+		}
 		break;
 	}
 	case AUDIT_GET_FEATURE:
@@ -1778,12 +1790,15 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
 			/* sleep if we are allowed and we haven't exhausted our
 			 * backlog wait limit */
 			if (gfpflags_allow_blocking(gfp_mask) && (stime > 0)) {
+				long rtime = stime;
+
 				DECLARE_WAITQUEUE(wait, current);
 
 				add_wait_queue_exclusive(&audit_backlog_wait,
 							 &wait);
 				set_current_state(TASK_UNINTERRUPTIBLE);
-				stime = schedule_timeout(stime);
+				stime = schedule_timeout(rtime);
+				atomic_add(rtime - stime, &audit_backlog_wait_time_actual);
 				remove_wait_queue(&audit_backlog_wait, &wait);
 			} else {
 				if (audit_rate_check() && printk_ratelimit())
-- 
2.17.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


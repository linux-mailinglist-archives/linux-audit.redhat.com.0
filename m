Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CF4BD1FA80E
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jun 2020 06:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592283580;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sROaqY2VoDdyIRXS1B4Imu32tnMvOOUlwDi7y6+2sgk=;
	b=VnBgW6uu+cSBq8yFTz6Z/jTc1ho7KqTjuJ4qpoGzPaTAaCY3WfajSyK3ERcW5zkinStawU
	2pSpmhvNl2WWPYn9FItPF2OScgZkMuqb8Ak9IVJE+fJDMxMUSRtOclKRPJaugYVhdspWap
	zdBjBp8Auw6PmmK3KVXgxjG9FJ2bzxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-PF2NRwaSPSaEsS4b0M634g-1; Tue, 16 Jun 2020 00:59:33 -0400
X-MC-Unique: PF2NRwaSPSaEsS4b0M634g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BE80106B247;
	Tue, 16 Jun 2020 04:59:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E66905C1C3;
	Tue, 16 Jun 2020 04:59:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1092833C8;
	Tue, 16 Jun 2020 04:59:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05G4x43v016688 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 00:59:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 25A6C2028DCC; Tue, 16 Jun 2020 04:59:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 216882026E04
	for <linux-audit@redhat.com>; Tue, 16 Jun 2020 04:59:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61CA71859162
	for <linux-audit@redhat.com>; Tue, 16 Jun 2020 04:59:01 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-302-SwBNJSc6MHuM3yAuMvF3TA-1; Tue, 16 Jun 2020 00:58:57 -0400
X-MC-Unique: SwBNJSc6MHuM3yAuMvF3TA-1
Received: by mail-qv1-f67.google.com with SMTP id dp10so8889608qvb.10;
	Mon, 15 Jun 2020 21:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=O023pdamltMPvSy/dRhyjJw9g+wnF//LKwrXEoBOWQE=;
	b=QbCc7UzJeQWI5mwmRqR2UpX+I4OJkD10K4ldrtedJT2oAgethwoseE1uD0jl+dK7HV
	wh6VFlmsZ+xCvNsMimbEN2CEL9Sx2y7niRaLqvk3m8sJMUfK+CkqcR/gM8DWIeC7uqh6
	7FR7zXZo60WwvcXD/Sy78RPxZjISGgiDBb+U2B+rGxqtl5m/HKI3WjgcSDkdJwZGhqXf
	L7G9y1sKVIQsP0/znv7IQXasGfQuLMU08gneYHZOc9o3SkCUX2VWHSc2QVMReIeOa+JK
	Dzzn+ONwe+/Wh4WyX/m5K3BxOcKA8GIaU1gM6iY5DcedyAu0X6E7rLnQEL9PaHnLGum8
	PzaA==
X-Gm-Message-State: AOAM5310IJLf18+PnQg7IsyhpCHO1uwuE08D8a6Pz6GSJ3GYpU34aHDQ
	SBkxBxx7oInZ0kSJ9XW8Nfd7Nr0xBFI=
X-Google-Smtp-Source: ABdhPJyo90pbrLw+VkDG01qRMqMqvoOzG3c6ZfcHWBCXJnRQ6ZPkw5bk9dnqCvH4JgEw1//C6XjEVQ==
X-Received: by 2002:a0c:f707:: with SMTP id w7mr530363qvn.39.1592283536726;
	Mon, 15 Jun 2020 21:58:56 -0700 (PDT)
Received: from linux-kernel-dev (ool-182c9054.dyn.optonline.net.
	[24.44.144.84]) by smtp.gmail.com with ESMTPSA id
	b4sm12156021qka.133.2020.06.15.21.58.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 15 Jun 2020 21:58:56 -0700 (PDT)
Date: Tue, 16 Jun 2020 04:58:55 +0000
From: Max Englander <max.englander@gmail.com>
To: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>,
	linux-audit@redhat.com
Subject: [PATCH] audit: optionally print warning after waiting to enqueue
	record
Message-ID: <20200616045855.GA1699@linux-kernel-dev>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

In environments where security is prioritized, users may set
--backlog_wait_time to a high value in order to reduce the likelihood
that any audit event is lost, even though doing so may result in
unpredictable performance if the kernel schedules a timeout when the
backlog limit is exceeded. For these users, the next best thing to
predictable performance is the ability to quickly detect and react to
degraded performance. This patch proposes to aid the detection of kernel
audit subsystem pauses through the following changes:

Add a variable named audit_backlog_warn_time. Enforce the value of this
variable to be no less than zero, and no more than the value of
audit_backlog_wait_time.

If audit_backlog_warn_time is greater than zero and if the total time
spent waiting to enqueue an audit record is greater than or equal to
audit_backlog_warn_time, then print a warning with the total time
spent waiting.

An example configuration:

	auditctl --backlog_warn_time 50

An example warning message:

	audit: sleep_time=52 >= audit_backlog_warn_time=50

Tested on Ubuntu 18.04.04 using complementary changes to the audit
userspace: https://github.com/linux-audit/audit-userspace/pull/131.

Signed-off-by: Max Englander <max.englander@gmail.com>
---
 include/uapi/linux/audit.h |  7 ++++++-
 kernel/audit.c             | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index a534d71e689a..e3e021047fdc 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -340,6 +340,7 @@ enum {
 #define AUDIT_STATUS_BACKLOG_LIMIT	0x0010
 #define AUDIT_STATUS_BACKLOG_WAIT_TIME	0x0020
 #define AUDIT_STATUS_LOST		0x0040
+#define AUDIT_STATUS_BACKLOG_WARN_TIME	0x0080
 
 #define AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT	0x00000001
 #define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME	0x00000002
@@ -348,6 +349,7 @@ enum {
 #define AUDIT_FEATURE_BITMAP_SESSIONID_FILTER	0x00000010
 #define AUDIT_FEATURE_BITMAP_LOST_RESET		0x00000020
 #define AUDIT_FEATURE_BITMAP_FILTER_FS		0x00000040
+#define AUDIT_FEATURE_BITMAP_BACKLOG_WARN_TIME	0x00000080
 
 #define AUDIT_FEATURE_BITMAP_ALL (AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT | \
 				  AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME | \
@@ -355,12 +357,14 @@ enum {
 				  AUDIT_FEATURE_BITMAP_EXCLUDE_EXTEND | \
 				  AUDIT_FEATURE_BITMAP_SESSIONID_FILTER | \
 				  AUDIT_FEATURE_BITMAP_LOST_RESET | \
-				  AUDIT_FEATURE_BITMAP_FILTER_FS)
+				  AUDIT_FEATURE_BITMAP_FILTER_FS | \
+				  AUDIT_FEATURE_BITMAP_BACKLOG_WARN_TIME)
 
 /* deprecated: AUDIT_VERSION_* */
 #define AUDIT_VERSION_LATEST 		AUDIT_FEATURE_BITMAP_ALL
 #define AUDIT_VERSION_BACKLOG_LIMIT	AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT
 #define AUDIT_VERSION_BACKLOG_WAIT_TIME	AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME
+#define AUDIT_VERSION_BACKLOG_WARN_TIME	AUDIT_FEATURE_BITMAP_BACKLOG_WARN_TIME
 
 				/* Failure-to-log actions */
 #define AUDIT_FAIL_SILENT	0
@@ -466,6 +470,7 @@ struct audit_status {
 		__u32	feature_bitmap;	/* bitmap of kernel audit features */
 	};
 	__u32		backlog_wait_time;/* message queue wait timeout */
+	__u32		backlog_warn_time;/* message queue warn threshold */
 };
 
 struct audit_features {
diff --git a/kernel/audit.c b/kernel/audit.c
index 87f31bf1f0a0..4a5437cfe61f 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -122,6 +122,12 @@ static u32	audit_backlog_limit = 64;
 #define AUDIT_BACKLOG_WAIT_TIME (60 * HZ)
 static u32	audit_backlog_wait_time = AUDIT_BACKLOG_WAIT_TIME;
 
+/* If audit_backlog_wait_time is non-zero, and the kernel waits
+ * for audit_backlog_warn_time or more to enqueue audit record,
+ * a warning will be printed with the duration of the wait
+ */
+static u32	audit_backlog_warn_time;
+
 /* The identity of the user shutting down the audit system. */
 kuid_t		audit_sig_uid = INVALID_UID;
 pid_t		audit_sig_pid = -1;
@@ -439,6 +445,12 @@ static int audit_set_backlog_wait_time(u32 timeout)
 				      &audit_backlog_wait_time, timeout);
 }
 
+static int audit_set_backlog_warn_time(u32 warn_time)
+{
+	return audit_do_config_change("audit_backlog_warn_time",
+				      &audit_backlog_warn_time, warn_time);
+}
+
 static int audit_set_enabled(u32 state)
 {
 	int rc;
@@ -1204,6 +1216,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 		s.backlog		= skb_queue_len(&audit_queue);
 		s.feature_bitmap	= AUDIT_FEATURE_BITMAP_ALL;
 		s.backlog_wait_time	= audit_backlog_wait_time;
+		s.backlog_warn_time	= audit_backlog_warn_time;
 		audit_send_reply(skb, seq, AUDIT_GET, 0, 0, &s, sizeof(s));
 		break;
 	}
@@ -1297,10 +1310,21 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 				return -EINVAL;
 			if (s.backlog_wait_time > 10*AUDIT_BACKLOG_WAIT_TIME)
 				return -EINVAL;
+			if (s.backlog_wait_time < audit_backlog_warn_time)
+				return -EINVAL;
 			err = audit_set_backlog_wait_time(s.backlog_wait_time);
 			if (err < 0)
 				return err;
 		}
+		if (s.mask & AUDIT_STATUS_BACKLOG_WARN_TIME) {
+			if (sizeof(s) > (size_t)nlh->nlmsg_len)
+				return -EINVAL;
+			if (s.backlog_warn_time > audit_backlog_wait_time)
+				return -EINVAL;
+			err = audit_set_backlog_warn_time(s.backlog_warn_time);
+			if (err < 0)
+				return err;
+		}
 		if (s.mask == AUDIT_STATUS_LOST) {
 			u32 lost = atomic_xchg(&audit_lost, 0);
 
@@ -1794,6 +1818,17 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
 				return NULL;
 			}
 		}
+
+		/* Print a warning if current task slept for at least audit_backlog_warn_time
+		 * for audit queue length to be less than the audit_backlog_limit.
+		 */
+		if (audit_backlog_wait_time > 0 &&
+		    audit_backlog_warn_time > 0 &&
+		    audit_backlog_wait_time - stime >= audit_backlog_warn_time) {
+			pr_warn("sleep_time=%li >= audit_backlog_warn_time=%u\n",
+				audit_backlog_wait_time - stime,
+				audit_backlog_warn_time);
+		}
 	}
 
 	ab = audit_buffer_alloc(ctx, gfp_mask, type);
-- 
2.17.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CD5B071D
	for <lists+linux-audit@lfdr.de>; Thu, 12 Sep 2019 05:20:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3273A308213F;
	Thu, 12 Sep 2019 03:20:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B7DA194B9;
	Thu, 12 Sep 2019 03:20:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9617C1802217;
	Thu, 12 Sep 2019 03:20:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8C3JuQj007839 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 11 Sep 2019 23:19:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 66F765C231; Thu, 12 Sep 2019 03:19:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E67E55C207;
	Thu, 12 Sep 2019 03:19:53 +0000 (UTC)
Received: from tc-sys-mailedm04.tc.baidu.com (mx60.baidu.com [61.135.168.60])
	by mx1.redhat.com (Postfix) with ESMTP id 2D5501DA6;
	Thu, 12 Sep 2019 03:19:47 +0000 (UTC)
Received: from localhost (cp01-cos-dev01.cp01.baidu.com [10.92.119.46])
	by tc-sys-mailedm04.tc.baidu.com (Postfix) with ESMTP id 5A551236C011; 
	Thu, 12 Sep 2019 11:19:45 +0800 (CST)
From: Li RongQing <lirongqing@baidu.com>
To: paul@paul-moore.com, eparis@redhat.com, linux-audit@redhat.com
Subject: [PATCH][RFC] audit: set wait time to zero when audit failed
Date: Thu, 12 Sep 2019 11:19:45 +0800
Message-Id: <1568258385-10643-1-git-send-email-lirongqing@baidu.com>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.71]); Thu, 12 Sep 2019 03:19:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Thu, 12 Sep 2019 03:19:48 +0000 (UTC) for IP:'61.135.168.60'
	DOMAIN:'mx60.baidu.com' HELO:'tc-sys-mailedm04.tc.baidu.com'
	FROM:'lirongqing@baidu.com' RCPT:''
X-RedHat-Spam-Score: -0.701  (RCVD_IN_DNSWL_LOW,
	SPF_PASS) 61.135.168.60 mx60.baidu.com 61.135.168.60
	mx60.baidu.com <lirongqing@baidu.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Thu, 12 Sep 2019 03:20:15 +0000 (UTC)

if audit_log_start failed because queue is full, kauditd is waiting
the receiving queue empty, but no receiver, a task will be forced to
wait 60 seconds for each audited syscall, and it will be hang for a
very long time

so at this condition, set the wait time to zero to reduce wait, and
restore wait time when audit works again

it partially restore the commit 3197542482df ("audit: rework
audit_log_start()")

Signed-off-by: Li RongQing <lirongqing@baidu.com>
Signed-off-by: Liang ZhiCheng <liangzhicheng@baidu.com>
---
reboot is taking a very long time on my machine(centos 6u4 +kernel 5.3)
since TIF_SYSCALL_AUDIT is set by default, and when reboot, userspace process
which receiver audit message , will be killed, and lead to that no user
drain the audit queue

git bitsect show it is caused by 3197542482df ("audit: rework audit_log_start()")

 kernel/audit.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index da8dc0db5bd3..6de23599fd43 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -119,6 +119,7 @@ static u32	audit_rate_limit;
  * When set to zero, this means unlimited. */
 static u32	audit_backlog_limit = 64;
 #define AUDIT_BACKLOG_WAIT_TIME (60 * HZ)
+static u32	audit_backlog_wait_time_master = AUDIT_BACKLOG_WAIT_TIME;
 static u32	audit_backlog_wait_time = AUDIT_BACKLOG_WAIT_TIME;
 
 /* The identity of the user shutting down the audit system. */
@@ -435,7 +436,7 @@ static int audit_set_backlog_limit(u32 limit)
 static int audit_set_backlog_wait_time(u32 timeout)
 {
 	return audit_do_config_change("audit_backlog_wait_time",
-				      &audit_backlog_wait_time, timeout);
+				      &audit_backlog_wait_time_master, timeout);
 }
 
 static int audit_set_enabled(u32 state)
@@ -1202,7 +1203,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 		s.lost			= atomic_read(&audit_lost);
 		s.backlog		= skb_queue_len(&audit_queue);
 		s.feature_bitmap	= AUDIT_FEATURE_BITMAP_ALL;
-		s.backlog_wait_time	= audit_backlog_wait_time;
+		s.backlog_wait_time	= audit_backlog_wait_time_master;
 		audit_send_reply(skb, seq, AUDIT_GET, 0, 0, &s, sizeof(s));
 		break;
 	}
@@ -1785,11 +1786,15 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
 						skb_queue_len(&audit_queue),
 						audit_backlog_limit);
 				audit_log_lost("backlog limit exceeded");
+				audit_backlog_wait_time = 0;
 				return NULL;
 			}
 		}
 	}
 
+	if (audit_backlog_wait_time != audit_backlog_wait_time_master)
+		audit_backlog_wait_time = audit_backlog_wait_time_master;
+
 	ab = audit_buffer_alloc(ctx, gfp_mask, type);
 	if (!ab) {
 		audit_log_lost("out of memory in audit_log_start");
-- 
2.16.2

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

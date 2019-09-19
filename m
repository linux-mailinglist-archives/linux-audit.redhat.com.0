Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEB9B70E9
	for <lists+linux-audit@lfdr.de>; Thu, 19 Sep 2019 03:27:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF4745945E;
	Thu, 19 Sep 2019 01:27:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE8B15C21E;
	Thu, 19 Sep 2019 01:27:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97D7C1803B37;
	Thu, 19 Sep 2019 01:27:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8J1RNTa010732 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Sep 2019 21:27:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 52F4460F9E; Thu, 19 Sep 2019 01:27:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7B3460F88;
	Thu, 19 Sep 2019 01:27:18 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org, linux-api@vger.kernel.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	linux-fsdevel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak90 V7 19/21] audit: check cont depth
Date: Wed, 18 Sep 2019 21:22:36 -0400
Message-Id: <8cb68e43b55b1b0a021710402ded89444edaf13c.1568834525.git.rgb@redhat.com>
In-Reply-To: <cover.1568834524.git.rgb@redhat.com>
References: <cover.1568834524.git.rgb@redhat.com>
In-Reply-To: <cover.1568834524.git.rgb@redhat.com>
References: <cover.1568834524.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	dhowells@redhat.com, ebiederm@xmission.com, simo@redhat.com,
	eparis@parisplace.org, mpatel@redhat.com, serge@hallyn.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 19 Sep 2019 01:27:28 +0000 (UTC)

Set an arbitrary limit on the depth of audit container identifier
nesting to limit abuse.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 kernel/audit.c | 21 +++++++++++++++++++++
 kernel/audit.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/kernel/audit.c b/kernel/audit.c
index 848fd1c8c579..a70c9184e5d9 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2667,6 +2667,22 @@ int audit_signal_info(int sig, struct task_struct *t)
 	return audit_signal_info_syscall(t);
 }
 
+static int audit_contid_depth(struct audit_cont *cont)
+{
+	struct audit_cont *parent;
+	int depth = 1;
+
+	if (!cont)
+		return 0;
+
+	parent = cont->parent;
+	while (parent) {
+		depth++;
+		parent = parent->parent;
+	}
+	return depth;
+}
+
 struct audit_cont *audit_cont(struct task_struct *tsk)
 {
 	if (!tsk->audit || !tsk->audit->cont)
@@ -2785,6 +2801,11 @@ int audit_set_contid(struct task_struct *task, u64 contid)
 			rc = -ENOSPC;
 			goto conterror;
 		}
+		/* Set max contid depth */
+		if (audit_contid_depth(audit_cont(current->real_parent)) >= AUDIT_CONTID_DEPTH) {
+			rc = -EMLINK;
+			goto conterror;
+		}
 		if (!newcont) {
 			newcont = kmalloc(sizeof(struct audit_cont), GFP_ATOMIC);
 			if (newcont) {
diff --git a/kernel/audit.h b/kernel/audit.h
index 89b7de323c13..cb25341c1a0f 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -231,6 +231,8 @@ struct audit_contid_status {
 	u64	id;
 };
 
+#define AUDIT_CONTID_DEPTH	5
+
 /* Indicates that audit should log the full pathname. */
 #define AUDIT_NAME_FULL -1
 
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

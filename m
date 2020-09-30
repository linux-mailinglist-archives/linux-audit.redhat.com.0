Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3C527EEB6
	for <lists+linux-audit@lfdr.de>; Wed, 30 Sep 2020 18:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601482567;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hXgYFb3Is1NP2p+BXO0j0Hjq/yTnCtaz4Fknp81oojM=;
	b=P0DE/0P4cMvDZmjJAGsm5QIvlWzpL0RNhvVGD5HY4aEKmrmFkXzzoL43QAw7kn2wOriFgs
	43HHnJ16jerSbI+xfq87F1L0sjDA/u8Ea26P2kQuZXzlk16qLzE8DLSgGmHh45/Tawg1/o
	xBnwVBFbulYiSDhxciMmDoUUjTh6eKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-XGDQsWTAOL-qcnnhxjQQ6A-1; Wed, 30 Sep 2020 12:16:04 -0400
X-MC-Unique: XGDQsWTAOL-qcnnhxjQQ6A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40D4364083;
	Wed, 30 Sep 2020 16:16:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D13119D7D;
	Wed, 30 Sep 2020 16:16:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC404183D022;
	Wed, 30 Sep 2020 16:15:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08UGCfwp006626 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 30 Sep 2020 12:12:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 052D45C1D0; Wed, 30 Sep 2020 16:12:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-41.rdu2.redhat.com [10.10.117.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F33D5C1CF;
	Wed, 30 Sep 2020 16:12:37 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>,
	linux-audit@redhat.com, Paul Moore <paul@paul-moore.com>
Subject: [PATCH 3/3] fanotify: Allow audit to use the full permission event
	response
Date: Wed, 30 Sep 2020 12:12:33 -0400
Message-ID: <3075502.aeNJFYEL58@x2>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: Amir Goldstein <amir73il@gmail.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch unmasks the full value so that the audit function can use all
of it. The audit function was updated to log the additional information in
the AUDIT_FANOTIFY record. The following is an example of the new record
format:

type=FANOTIFY msg=audit(1600385147.372:590): resp=2 ctx_type=1 fan_ctx=17

Signed-off-by: Steve Grubb <sgrubb@redhat.com>
---
 fs/notify/fanotify/fanotify.c | 2 +-
 kernel/auditsc.c              | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/notify/fanotify/fanotify.c b/fs/notify/fanotify/fanotify.c
index e72b7e59aa24..a9278e983e30 100644
--- a/fs/notify/fanotify/fanotify.c
+++ b/fs/notify/fanotify/fanotify.c
@@ -188,7 +188,7 @@ static int fanotify_get_response(struct fsnotify_group *group,
 
 	/* Check if the response should be audited */
 	if (event->response & FAN_AUDIT)
-		audit_fanotify(event->response & ~FAN_AUDIT);
+		audit_fanotify(event->response);
 
 	pr_debug("%s: group=%p event=%p about to return ret=%d\n", __func__,
 		 group, event, ret);
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index fd840c40abf7..9d6a3ad2037d 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -75,6 +75,7 @@
 #include <linux/uaccess.h>
 #include <linux/fsnotify_backend.h>
 #include <uapi/linux/limits.h>
+#include <uapi/linux/fanotify.h>
 
 #include "audit.h"
 
@@ -2523,8 +2524,10 @@ void __audit_log_kern_module(char *name)
 
 void __audit_fanotify(unsigned int response)
 {
-	audit_log(audit_context(), GFP_KERNEL,
-		AUDIT_FANOTIFY,	"resp=%u", response);
+	audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
+		"resp=%u ctx_type=%u fan_ctx=%u", FAN_DEC_MASK(response),
+		FAN_DEC_CONTEXT_TYPE_TO_VALUE(response),
+		FAN_DEC_CONTEXT_TO_VALUE(response));
 }
 
 void __audit_tk_injoffset(struct timespec64 offset)
-- 
2.26.2




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


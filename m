Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B31FF27EEB8
	for <lists+linux-audit@lfdr.de>; Wed, 30 Sep 2020 18:16:08 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601482567;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G3SNncwOev1vteeeQml1nlWnhBFYTPTQNwhR1qV1pog=;
	b=UM1Obf3C6xEYRMiPBpjBrQoE9/Jqhk7LNqIyNte099phAA4mnJP94nclq1StezRR7BPpwq
	QOAnklK2bDCKW0FbVaiTHeYMsZecDHYairl32nDHJtGbEmHKKBBzv2BRFAPxlzUoHCDlI5
	mwFPSjmKoSMELDMqoU1X/k/T0PHOtTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-UQsp-29gNlejn3ANcan-8w-1; Wed, 30 Sep 2020 12:16:04 -0400
X-MC-Unique: UQsp-29gNlejn3ANcan-8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5697101FFAC;
	Wed, 30 Sep 2020 16:15:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B00525D9D3;
	Wed, 30 Sep 2020 16:15:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA42E44A5F;
	Wed, 30 Sep 2020 16:15:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08UGCXVZ006594 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 30 Sep 2020 12:12:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 175367838A; Wed, 30 Sep 2020 16:12:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-41.rdu2.redhat.com [10.10.117.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E2DF1C4;
	Wed, 30 Sep 2020 16:12:27 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>,
	linux-audit@redhat.com, Paul Moore <paul@paul-moore.com>
Subject: [PATCH 1/3] fanotify: Ensure consistent variable type for response
Date: Wed, 30 Sep 2020 12:12:24 -0400
Message-ID: <12617626.uLZWGnKmhe@x2>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The user space API for the response variable is __u32. This patch makes
sure that the whole path through the kernel uses __u32 so that there is
no sign extension or truncation of the user space response.

Signed-off-by: Steve Grubb <sgrubb@redhat.com>
---
 fs/notify/fanotify/fanotify.h      | 2 +-
 fs/notify/fanotify/fanotify_user.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/notify/fanotify/fanotify.h b/fs/notify/fanotify/fanotify.h
index 8ce7ccfc4b0d..c397993830ac 100644
--- a/fs/notify/fanotify/fanotify.h
+++ b/fs/notify/fanotify/fanotify.h
@@ -165,7 +165,7 @@ FANOTIFY_PE(struct fanotify_event *event)
 struct fanotify_perm_event {
 	struct fanotify_event fae;
 	struct path path;
-	unsigned short response;	/* userspace answer to the event */
+	__u32 response;			/* userspace answer to the event */
 	unsigned short state;		/* state of the event */
 	int fd;		/* fd we passed to userspace for this event */
 };
diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
index 63b5dffdca9e..c8da9ea1e76e 100644
--- a/fs/notify/fanotify/fanotify_user.c
+++ b/fs/notify/fanotify/fanotify_user.c
@@ -157,7 +157,7 @@ static int create_fd(struct fsnotify_group *group, struct path *path,
  */
 static void finish_permission_event(struct fsnotify_group *group,
 				    struct fanotify_perm_event *event,
-				    unsigned int response)
+				    __u32 response)
 				    __releases(&group->notification_lock)
 {
 	bool destroy = false;
@@ -178,7 +178,7 @@ static int process_access_response(struct fsnotify_group *group,
 {
 	struct fanotify_perm_event *event;
 	int fd = response_struct->fd;
-	int response = response_struct->response;
+	__u32 response = response_struct->response;
 
 	pr_debug("%s: group=%p fd=%d response=%d\n", __func__, group,
 		 fd, response);
-- 
2.26.2




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A715868A4C1
	for <lists+linux-audit@lfdr.de>; Fri,  3 Feb 2023 22:37:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675460222;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AH0K6Ip/zD/IrQCNwzRWLVlsQky/Olz017OFoxPos+c=;
	b=f74S29CNc3ByQdqu/cbvpvSJ/MpyWYgDAvNcVpduyyzZq3XleVcAcS4M0064kCygTi6wcV
	qXkW2LkrGIlNC9S4rC/4tinmdnCqtPstGwSITj02tATziR7Qf8Gv8fhjCjE8RJVHGo5WbX
	QQzuzlXJTa7SpPFbLVbFPaU9KDMK7so=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-mPvcmaexNr-4bDaAPYyMsQ-1; Fri, 03 Feb 2023 16:35:46 -0500
X-MC-Unique: mPvcmaexNr-4bDaAPYyMsQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39753801779;
	Fri,  3 Feb 2023 21:35:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 435C9492C14;
	Fri,  3 Feb 2023 21:35:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F15EE19465B8;
	Fri,  3 Feb 2023 21:35:38 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 813521946586 for <linux-audit@listman.corp.redhat.com>;
 Fri,  3 Feb 2023 21:35:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 75326400E88D; Fri,  3 Feb 2023 21:35:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.com (unknown [10.22.50.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F199240CF8EA;
 Fri,  3 Feb 2023 21:35:35 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org
Subject: [PATCH v7 1/3] fanotify: Ensure consistent variable type for response
Date: Fri,  3 Feb 2023 16:35:14 -0500
Message-Id: <3778cb0b3501bc4e686ba7770b20eb9ab0506cf4.1675373475.git.rgb@redhat.com>
In-Reply-To: <cover.1675373475.git.rgb@redhat.com>
References: <cover.1675373475.git.rgb@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Jan Kara <jack@suse.cz>, Richard Guy Briggs <rgb@redhat.com>,
 Amir Goldstein <amir73il@gmail.com>, Eric Paris <eparis@parisplace.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The user space API for the response variable is __u32. This patch makes
sure that the whole path through the kernel uses u32 so that there is
no sign extension or truncation of the user space response.

Suggested-by: Steve Grubb <sgrubb@redhat.com>
Link: https://lore.kernel.org/r/12617626.uLZWGnKmhe@x2
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
Acked-by: Paul Moore <paul@paul-moore.com>
---
 fs/notify/fanotify/fanotify.h      | 2 +-
 fs/notify/fanotify/fanotify_user.c | 6 +++---
 include/linux/audit.h              | 6 +++---
 kernel/auditsc.c                   | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/notify/fanotify/fanotify.h b/fs/notify/fanotify/fanotify.h
index 57f51a9a3015..f899d610bc08 100644
--- a/fs/notify/fanotify/fanotify.h
+++ b/fs/notify/fanotify/fanotify.h
@@ -425,7 +425,7 @@ FANOTIFY_PE(struct fanotify_event *event)
 struct fanotify_perm_event {
 	struct fanotify_event fae;
 	struct path path;
-	unsigned short response;	/* userspace answer to the event */
+	u32 response;			/* userspace answer to the event */
 	unsigned short state;		/* state of the event */
 	int fd;		/* fd we passed to userspace for this event */
 };
diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
index 4546da4a54f9..caa1211bac8c 100644
--- a/fs/notify/fanotify/fanotify_user.c
+++ b/fs/notify/fanotify/fanotify_user.c
@@ -289,7 +289,7 @@ static int create_fd(struct fsnotify_group *group, const struct path *path,
  */
 static void finish_permission_event(struct fsnotify_group *group,
 				    struct fanotify_perm_event *event,
-				    unsigned int response)
+				    u32 response)
 				    __releases(&group->notification_lock)
 {
 	bool destroy = false;
@@ -310,9 +310,9 @@ static int process_access_response(struct fsnotify_group *group,
 {
 	struct fanotify_perm_event *event;
 	int fd = response_struct->fd;
-	int response = response_struct->response;
+	u32 response = response_struct->response;
 
-	pr_debug("%s: group=%p fd=%d response=%d\n", __func__, group,
+	pr_debug("%s: group=%p fd=%d response=%u\n", __func__, group,
 		 fd, response);
 	/*
 	 * make sure the response is valid, if invalid we do nothing and either
diff --git a/include/linux/audit.h b/include/linux/audit.h
index 3608992848d3..d6b7d0c7ce43 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -416,7 +416,7 @@ extern void __audit_log_capset(const struct cred *new, const struct cred *old);
 extern void __audit_mmap_fd(int fd, int flags);
 extern void __audit_openat2_how(struct open_how *how);
 extern void __audit_log_kern_module(char *name);
-extern void __audit_fanotify(unsigned int response);
+extern void __audit_fanotify(u32 response);
 extern void __audit_tk_injoffset(struct timespec64 offset);
 extern void __audit_ntp_log(const struct audit_ntp_data *ad);
 extern void __audit_log_nfcfg(const char *name, u8 af, unsigned int nentries,
@@ -523,7 +523,7 @@ static inline void audit_log_kern_module(char *name)
 		__audit_log_kern_module(name);
 }
 
-static inline void audit_fanotify(unsigned int response)
+static inline void audit_fanotify(u32 response)
 {
 	if (!audit_dummy_context())
 		__audit_fanotify(response);
@@ -679,7 +679,7 @@ static inline void audit_log_kern_module(char *name)
 {
 }
 
-static inline void audit_fanotify(unsigned int response)
+static inline void audit_fanotify(u32 response)
 { }
 
 static inline void audit_tk_injoffset(struct timespec64 offset)
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 547c88be8a28..d1fb821de104 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2877,7 +2877,7 @@ void __audit_log_kern_module(char *name)
 	context->type = AUDIT_KERN_MODULE;
 }
 
-void __audit_fanotify(unsigned int response)
+void __audit_fanotify(u32 response)
 {
 	audit_log(audit_context(), GFP_KERNEL,
 		AUDIT_FANOTIFY,	"resp=%u", response);
-- 
2.27.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFE166E841
	for <lists+linux-audit@lfdr.de>; Tue, 17 Jan 2023 22:14:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673990076;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AH0K6Ip/zD/IrQCNwzRWLVlsQky/Olz017OFoxPos+c=;
	b=IrEqs+Jg+CGxPSuQcSVzIoswn9cmq3G86xFKrwW3JUcZHywlvvvA1BW6UPJNqP/vWMU3Zp
	mz4NQPJLFiQY0zlIqevpV+0+VUzZV/C5T/Umc+Pz8xw/O7b0rHDde1t1GlcGABrLQ/5vfZ
	Jd6uAKeom81I98a56w6lJyiuxcdedh8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-2MboqFzLPBOiSplzx6TlYg-1; Tue, 17 Jan 2023 16:14:32 -0500
X-MC-Unique: 2MboqFzLPBOiSplzx6TlYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44D0885A588;
	Tue, 17 Jan 2023 21:14:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C2A62166B2A;
	Tue, 17 Jan 2023 21:14:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2FF421946A6D;
	Tue, 17 Jan 2023 21:14:22 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BB03B19465A4 for <linux-audit@listman.corp.redhat.com>;
 Tue, 17 Jan 2023 21:14:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9E802C158BA; Tue, 17 Jan 2023 21:14:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.com (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AA47C15BAD;
 Tue, 17 Jan 2023 21:14:19 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org
Subject: [PATCH v6 1/3] fanotify: Ensure consistent variable type for response
Date: Tue, 17 Jan 2023 16:14:05 -0500
Message-Id: <3778cb0b3501bc4e686ba7770b20eb9ab0506cf4.1673989212.git.rgb@redhat.com>
In-Reply-To: <cover.1673989212.git.rgb@redhat.com>
References: <cover.1673989212.git.rgb@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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


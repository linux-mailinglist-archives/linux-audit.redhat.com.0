Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6AD64A2D2
	for <lists+linux-audit@lfdr.de>; Mon, 12 Dec 2022 15:07:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670854022;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=18uTIvbhvvwE5i1+eqDN87SS3LLFEqAPPdKN94vFtIQ=;
	b=bc9ZGljy+/cLoplCrI7tQMUbGYTbwZ2Lwo43KOu3sE0jBYiHf4Y/yh/9c1XJKT6dQkE0xb
	7hb3PMRc6s99sMo7h4sxxvEIXjd7AovkOqrog9IWEldhpYIcE3D2H/EvDPzFP3GF3fJxa4
	1OTpkrcTt71vEZrCJElDlo9EDKTbnRE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-4G7dwyIjMjeIhTqw2q7JFA-1; Mon, 12 Dec 2022 09:06:27 -0500
X-MC-Unique: 4G7dwyIjMjeIhTqw2q7JFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6D9F185A7B0;
	Mon, 12 Dec 2022 14:06:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0FD5B400DE84;
	Mon, 12 Dec 2022 14:06:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E62A5194658F;
	Mon, 12 Dec 2022 14:06:23 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 552FD1946586 for <linux-audit@listman.corp.redhat.com>;
 Mon, 12 Dec 2022 14:06:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3BC3A492C1B; Mon, 12 Dec 2022 14:06:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.com (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C417C492C14;
 Mon, 12 Dec 2022 14:06:20 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org
Subject: [PATCH v5 2/3] fanotify: define struct members to hold response
 decision context
Date: Mon, 12 Dec 2022 09:06:10 -0500
Message-Id: <45da8423b9b1e8fc7abd68cd2269acff8cf9022a.1670606054.git.rgb@redhat.com>
In-Reply-To: <cover.1670606054.git.rgb@redhat.com>
References: <cover.1670606054.git.rgb@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds a flag, FAN_INFO and an extensible buffer to provide
additional information about response decisions.  The buffer contains
one or more headers defining the information type and the length of the
following information.  The patch defines one additional information
type, FAN_RESPONSE_INFO_AUDIT_RULE, to audit a rule number.  This will
allow for the creation of other information types in the future if other
users of the API identify different needs.

Suggested-by: Steve Grubb <sgrubb@redhat.com>
Link: https://lore.kernel.org/r/2745105.e9J7NaK4W3@x2
Suggested-by: Jan Kara <jack@suse.cz>
Link: https://lore.kernel.org/r/20201001101219.GE17860@quack2.suse.cz
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 fs/notify/fanotify/fanotify.c      |  5 +-
 fs/notify/fanotify/fanotify.h      |  4 ++
 fs/notify/fanotify/fanotify_user.c | 86 ++++++++++++++++++++++--------
 include/linux/fanotify.h           |  5 ++
 include/uapi/linux/fanotify.h      | 30 ++++++++++-
 5 files changed, 107 insertions(+), 23 deletions(-)

diff --git a/fs/notify/fanotify/fanotify.c b/fs/notify/fanotify/fanotify.c
index a2a15bc4df28..24ec1d66d5a8 100644
--- a/fs/notify/fanotify/fanotify.c
+++ b/fs/notify/fanotify/fanotify.c
@@ -262,7 +262,7 @@ static int fanotify_get_response(struct fsnotify_group *group,
 	}
 
 	/* userspace responded, convert to something usable */
-	switch (event->response & ~FAN_AUDIT) {
+	switch (event->response & FANOTIFY_RESPONSE_ACCESS) {
 	case FAN_ALLOW:
 		ret = 0;
 		break;
@@ -563,6 +563,9 @@ static struct fanotify_event *fanotify_alloc_perm_event(const struct path *path,
 
 	pevent->fae.type = FANOTIFY_EVENT_TYPE_PATH_PERM;
 	pevent->response = 0;
+	pevent->hdr.type = FAN_RESPONSE_INFO_NONE;
+	pevent->hdr.pad = 0;
+	pevent->hdr.len = 0;
 	pevent->state = FAN_EVENT_INIT;
 	pevent->path = *path;
 	path_get(path);
diff --git a/fs/notify/fanotify/fanotify.h b/fs/notify/fanotify/fanotify.h
index f899d610bc08..e8a3c28c5d12 100644
--- a/fs/notify/fanotify/fanotify.h
+++ b/fs/notify/fanotify/fanotify.h
@@ -428,6 +428,10 @@ struct fanotify_perm_event {
 	u32 response;			/* userspace answer to the event */
 	unsigned short state;		/* state of the event */
 	int fd;		/* fd we passed to userspace for this event */
+	union {
+		struct fanotify_response_info_header hdr;
+		struct fanotify_response_info_audit_rule audit_rule;
+	};
 };
 
 static inline struct fanotify_perm_event *
diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
index caa1211bac8c..cf3584351e00 100644
--- a/fs/notify/fanotify/fanotify_user.c
+++ b/fs/notify/fanotify/fanotify_user.c
@@ -283,19 +283,44 @@ static int create_fd(struct fsnotify_group *group, const struct path *path,
 	return client_fd;
 }
 
+static int process_access_response_info(int fd, const char __user *info, size_t info_len,
+					struct fanotify_response_info_audit_rule *friar)
+{
+	if (fd == FAN_NOFD)
+		return -ENOENT;
+
+	if (info_len != sizeof(*friar))
+		return -EINVAL;
+
+	if (copy_from_user(friar, info, sizeof(*friar)))
+		return -EFAULT;
+
+	if (friar->hdr.type != FAN_RESPONSE_INFO_AUDIT_RULE)
+		return -EINVAL;
+	if (friar->hdr.pad != 0)
+		return -EINVAL;
+	if (friar->hdr.len != sizeof(*friar))
+		return -EINVAL;
+
+	return info_len;
+}
+
 /*
  * Finish processing of permission event by setting it to ANSWERED state and
  * drop group->notification_lock.
  */
 static void finish_permission_event(struct fsnotify_group *group,
-				    struct fanotify_perm_event *event,
-				    u32 response)
+				    struct fanotify_perm_event *event, u32 response,
+				    struct fanotify_response_info_audit_rule *friar)
 				    __releases(&group->notification_lock)
 {
 	bool destroy = false;
 
 	assert_spin_locked(&group->notification_lock);
-	event->response = response;
+	event->response = response & ~FAN_INFO;
+	if (response & FAN_INFO)
+		memcpy(&event->audit_rule, friar, sizeof(*friar));
+
 	if (event->state == FAN_EVENT_CANCELED)
 		destroy = true;
 	else
@@ -306,20 +331,27 @@ static void finish_permission_event(struct fsnotify_group *group,
 }
 
 static int process_access_response(struct fsnotify_group *group,
-				   struct fanotify_response *response_struct)
+				   struct fanotify_response *response_struct,
+				   const char __user *info,
+				   size_t info_len)
 {
 	struct fanotify_perm_event *event;
 	int fd = response_struct->fd;
 	u32 response = response_struct->response;
+	int ret = info_len;
+	struct fanotify_response_info_audit_rule friar;
 
-	pr_debug("%s: group=%p fd=%d response=%u\n", __func__, group,
-		 fd, response);
+	pr_debug("%s: group=%p fd=%d response=%u buf=%p size=%zu\n", __func__,
+		 group, fd, response, info, info_len);
 	/*
 	 * make sure the response is valid, if invalid we do nothing and either
 	 * userspace can send a valid response or we will clean it up after the
 	 * timeout
 	 */
-	switch (response & ~FAN_AUDIT) {
+	if (response & ~FANOTIFY_RESPONSE_VALID_MASK)
+		return -EINVAL;
+
+	switch (response & FANOTIFY_RESPONSE_ACCESS) {
 	case FAN_ALLOW:
 	case FAN_DENY:
 		break;
@@ -327,10 +359,18 @@ static int process_access_response(struct fsnotify_group *group,
 		return -EINVAL;
 	}
 
-	if (fd < 0)
+	if ((response & FAN_AUDIT) && !FAN_GROUP_FLAG(group, FAN_ENABLE_AUDIT))
 		return -EINVAL;
 
-	if ((response & FAN_AUDIT) && !FAN_GROUP_FLAG(group, FAN_ENABLE_AUDIT))
+	if (response & FAN_INFO) {
+		ret = process_access_response_info(fd, info, info_len, &friar);
+		if (ret < 0)
+			return ret;
+	} else {
+		ret = 0;
+	}
+
+	if (fd < 0)
 		return -EINVAL;
 
 	spin_lock(&group->notification_lock);
@@ -340,9 +380,9 @@ static int process_access_response(struct fsnotify_group *group,
 			continue;
 
 		list_del_init(&event->fae.fse.list);
-		finish_permission_event(group, event, response);
+		finish_permission_event(group, event, response, &friar);
 		wake_up(&group->fanotify_data.access_waitq);
-		return 0;
+		return ret;
 	}
 	spin_unlock(&group->notification_lock);
 
@@ -804,7 +844,7 @@ static ssize_t fanotify_read(struct file *file, char __user *buf,
 			if (ret <= 0) {
 				spin_lock(&group->notification_lock);
 				finish_permission_event(group,
-					FANOTIFY_PERM(event), FAN_DENY);
+					FANOTIFY_PERM(event), FAN_DENY, NULL);
 				wake_up(&group->fanotify_data.access_waitq);
 			} else {
 				spin_lock(&group->notification_lock);
@@ -827,28 +867,32 @@ static ssize_t fanotify_read(struct file *file, char __user *buf,
 
 static ssize_t fanotify_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
 {
-	struct fanotify_response response = { .fd = -1, .response = -1 };
+	struct fanotify_response response;
 	struct fsnotify_group *group;
 	int ret;
+	const char __user *info_buf = buf + sizeof(struct fanotify_response);
+	size_t info_len;
 
 	if (!IS_ENABLED(CONFIG_FANOTIFY_ACCESS_PERMISSIONS))
 		return -EINVAL;
 
 	group = file->private_data;
 
+	pr_debug("%s: group=%p count=%zu\n", __func__, group, count);
+
 	if (count < sizeof(response))
 		return -EINVAL;
 
-	count = sizeof(response);
-
-	pr_debug("%s: group=%p count=%zu\n", __func__, group, count);
-
-	if (copy_from_user(&response, buf, count))
+	if (copy_from_user(&response, buf, sizeof(response)))
 		return -EFAULT;
 
-	ret = process_access_response(group, &response);
+	info_len = count - sizeof(response);
+
+	ret = process_access_response(group, &response, info_buf, info_len);
 	if (ret < 0)
 		count = ret;
+	else
+		count = sizeof(response) + ret;
 
 	return count;
 }
@@ -876,7 +920,7 @@ static int fanotify_release(struct inode *ignored, struct file *file)
 		event = list_first_entry(&group->fanotify_data.access_list,
 				struct fanotify_perm_event, fae.fse.list);
 		list_del_init(&event->fae.fse.list);
-		finish_permission_event(group, event, FAN_ALLOW);
+		finish_permission_event(group, event, FAN_ALLOW, NULL);
 		spin_lock(&group->notification_lock);
 	}
 
@@ -893,7 +937,7 @@ static int fanotify_release(struct inode *ignored, struct file *file)
 			fsnotify_destroy_event(group, fsn_event);
 		} else {
 			finish_permission_event(group, FANOTIFY_PERM(event),
-						FAN_ALLOW);
+						FAN_ALLOW, NULL);
 		}
 		spin_lock(&group->notification_lock);
 	}
diff --git a/include/linux/fanotify.h b/include/linux/fanotify.h
index 8ad743def6f3..4f1c4f603118 100644
--- a/include/linux/fanotify.h
+++ b/include/linux/fanotify.h
@@ -122,6 +122,11 @@
 #define ALL_FANOTIFY_EVENT_BITS		(FANOTIFY_OUTGOING_EVENTS | \
 					 FANOTIFY_EVENT_FLAGS)
 
+/* These masks check for invalid bits in permission responses. */
+#define FANOTIFY_RESPONSE_ACCESS (FAN_ALLOW | FAN_DENY)
+#define FANOTIFY_RESPONSE_FLAGS (FAN_AUDIT | FAN_INFO)
+#define FANOTIFY_RESPONSE_VALID_MASK (FANOTIFY_RESPONSE_ACCESS | FANOTIFY_RESPONSE_FLAGS)
+
 /* Do not use these old uapi constants internally */
 #undef FAN_ALL_CLASS_BITS
 #undef FAN_ALL_INIT_FLAGS
diff --git a/include/uapi/linux/fanotify.h b/include/uapi/linux/fanotify.h
index 436258214bb0..cd14c94e9a1e 100644
--- a/include/uapi/linux/fanotify.h
+++ b/include/uapi/linux/fanotify.h
@@ -188,15 +188,43 @@ struct fanotify_event_info_error {
 	__u32 error_count;
 };
 
+/*
+ * User space may need to record additional information about its decision.
+ * The extra information type records what kind of information is included.
+ * The default is none. We also define an extra information buffer whose
+ * size is determined by the extra information type.
+ *
+ * If the information type is Audit Rule, then the information following
+ * is the rule number that triggered the user space decision that
+ * requires auditing.
+ */
+
+#define FAN_RESPONSE_INFO_NONE		0
+#define FAN_RESPONSE_INFO_AUDIT_RULE	1
+
 struct fanotify_response {
 	__s32 fd;
 	__u32 response;
 };
 
+struct fanotify_response_info_header {
+	__u8 type;
+	__u8 pad;
+	__u16 len;
+};
+
+struct fanotify_response_info_audit_rule {
+	struct fanotify_response_info_header hdr;
+	__u32 rule_number;
+	__u32 subj_trust;
+	__u32 obj_trust;
+};
+
 /* Legit userspace responses to a _PERM event */
 #define FAN_ALLOW	0x01
 #define FAN_DENY	0x02
-#define FAN_AUDIT	0x10	/* Bit mask to create audit record for result */
+#define FAN_AUDIT	0x10	/* Bitmask to create audit record for result */
+#define FAN_INFO	0x20	/* Bitmask to indicate additional information */
 
 /* No fd set in event */
 #define FAN_NOFD	-1
-- 
2.27.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5905E2DFE47
	for <lists+linux-audit@lfdr.de>; Mon, 21 Dec 2020 17:58:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608569881;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gUEK3FFtMT37/svGAd/5k6v5UoWBRnS9riNdfORXbSA=;
	b=C+t8iVrOHjunx6Pp03NK8a0Es67ETFEy8MQSkalZJL5g9P7ZHgncNIFb+HE1YNp35PHZd5
	j5sKk0GUKaOY5OJBhj+t3qkl3O8ttmjIXf6lcQji58OpC1/6kUKmvaJN3oq9QHZNiLA65E
	RwXZ9kxZgOapcRTrjVDP//4rSfp4YaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-oAJ8vqQ0MR-Yyzo_-j5m2A-1; Mon, 21 Dec 2020 11:57:59 -0500
X-MC-Unique: oAJ8vqQ0MR-Yyzo_-j5m2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57B67190D340;
	Mon, 21 Dec 2020 16:57:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 349EE19744;
	Mon, 21 Dec 2020 16:57:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0188C180954D;
	Mon, 21 Dec 2020 16:57:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BLGvnJP017071 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 21 Dec 2020 11:57:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B223160C61; Mon, 21 Dec 2020 16:57:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CCAC60C0F;
	Mon, 21 Dec 2020 16:57:28 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux Containers List <containers@lists.linux-foundation.org>,
	Linux API <linux-api@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	Linux FSdevel <linux-fsdevel@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux NetDev Upstream Mailing List <netdev@vger.kernel.org>,
	Netfilter Devel List <netfilter-devel@vger.kernel.org>
Subject: [PATCH ghak90 v10 07/11] audit: add containerid filtering
Date: Mon, 21 Dec 2020 11:55:41 -0500
Message-Id: <8e4ca60dbe485749f9d6ddecb12d498ee54718eb.1608225886.git.rgb@redhat.com>
In-Reply-To: <cover.1608225886.git.rgb@redhat.com>
References: <cover.1608225886.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Neil Horman <nhorman@tuxdriver.com>,
	Richard Guy Briggs <rgb@redhat.com>, David Howells <dhowells@redhat.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Simo Sorce <simo@redhat.com>, Eric Paris <eparis@parisplace.org>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	mpatel@redhat.com, Serge Hallyn <serge@hallyn.com>
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement audit container identifier filtering using the AUDIT_CONTID
field name to send an 8-character string representing a u64 since the
value field is only u32.

Sending it as two u32 was considered, but gathering and comparing two
fields was more complex.

The feature indicator is AUDIT_FEATURE_BITMAP_CONTAINERID.

Please see the github audit kernel issue for the contid filter feature:
  https://github.com/linux-audit/audit-kernel/issues/91
Please see the github audit userspace issue for filter additions:
  https://github.com/linux-audit/audit-userspace/issues/40
Please see the github audit testsuiite issue for the test case:
  https://github.com/linux-audit/audit-testsuite/issues/64
Please see the github audit wiki for the feature overview:
  https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
Acked-by: Serge Hallyn <serge@hallyn.com>
Acked-by: Neil Horman <nhorman@tuxdriver.com>
Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 include/linux/audit.h      |  1 +
 include/uapi/linux/audit.h |  5 ++++-
 kernel/audit.c             |  5 +++++
 kernel/audit.h             |  3 +++
 kernel/auditfilter.c       | 46 ++++++++++++++++++++++++++++++++++++++
 kernel/auditsc.c           |  3 +++
 6 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 9f0238f7960f..056a7c9a12a2 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -69,6 +69,7 @@ struct audit_field {
 	u32				type;
 	union {
 		u32			val;
+		u64			val64;
 		kuid_t			uid;
 		kgid_t			gid;
 		struct {
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 94dcf3085658..66350e572e41 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -271,6 +271,7 @@
 #define AUDIT_LOGINUID_SET	24
 #define AUDIT_SESSIONID	25	/* Session ID */
 #define AUDIT_FSTYPE	26	/* FileSystem Type */
+#define AUDIT_CONTID	27	/* Container ID */
 
 				/* These are ONLY useful when checking
 				 * at syscall exit time (AUDIT_AT_EXIT). */
@@ -353,6 +354,7 @@ enum {
 #define AUDIT_FEATURE_BITMAP_SESSIONID_FILTER	0x00000010
 #define AUDIT_FEATURE_BITMAP_LOST_RESET		0x00000020
 #define AUDIT_FEATURE_BITMAP_FILTER_FS		0x00000040
+#define AUDIT_FEATURE_BITMAP_CONTAINERID	0x00000080
 
 #define AUDIT_FEATURE_BITMAP_ALL (AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT | \
 				  AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME | \
@@ -360,7 +362,8 @@ enum {
 				  AUDIT_FEATURE_BITMAP_EXCLUDE_EXTEND | \
 				  AUDIT_FEATURE_BITMAP_SESSIONID_FILTER | \
 				  AUDIT_FEATURE_BITMAP_LOST_RESET | \
-				  AUDIT_FEATURE_BITMAP_FILTER_FS)
+				  AUDIT_FEATURE_BITMAP_FILTER_FS | \
+				  AUDIT_FEATURE_BITMAP_CONTAINERID)
 
 /* deprecated: AUDIT_VERSION_* */
 #define AUDIT_VERSION_LATEST 		AUDIT_FEATURE_BITMAP_ALL
diff --git a/kernel/audit.c b/kernel/audit.c
index b23f004f4000..300daf2bcb16 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2488,6 +2488,11 @@ int audit_log_container_id_ctx(struct audit_context *context)
 	return record;
 }
 
+int audit_contid_comparator(struct task_struct *tsk, u32 op, u64 right)
+{
+	return audit_comparator64(audit_get_contid(tsk), op, right);
+}
+
 void audit_log_key(struct audit_buffer *ab, char *key)
 {
 	audit_log_format(ab, " key=");
diff --git a/kernel/audit.h b/kernel/audit.h
index 40e609787a0c..48c429c2d544 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -218,12 +218,15 @@ extern void *audit_contobj_get_bytask(struct task_struct *tsk);
 extern void audit_contobj_put(void **cont, int count);
 extern int audit_log_container_id(struct audit_context *context, void *cont);
 extern int audit_log_container_id_ctx(struct audit_context *context);
+extern int audit_contid_comparator(struct task_struct *tsk, const u32 op,
+				   const u64 right);
 
 /* Indicates that audit should log the full pathname. */
 #define AUDIT_NAME_FULL -1
 
 extern int audit_match_class(int class, unsigned syscall);
 extern int audit_comparator(const u32 left, const u32 op, const u32 right);
+extern int audit_comparator64(const u64 left, const u32 op, const u64 right);
 extern int audit_uid_comparator(kuid_t left, u32 op, kuid_t right);
 extern int audit_gid_comparator(kgid_t left, u32 op, kgid_t right);
 extern int parent_len(const char *path);
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 333b3bcfc545..9362ee9cc414 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -399,6 +399,7 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
 	case AUDIT_FILETYPE:
 	case AUDIT_FIELD_COMPARE:
 	case AUDIT_EXE:
+	case AUDIT_CONTID:
 		/* only equal and not equal valid ops */
 		if (f->op != Audit_not_equal && f->op != Audit_equal)
 			return -EINVAL;
@@ -590,6 +591,14 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
 			entry->rule.buflen += f_val;
 			entry->rule.exe = audit_mark;
 			break;
+		case AUDIT_CONTID:
+			if (f_val != sizeof(u64))
+				goto exit_free;
+			str = audit_unpack_string(&bufp, &remain, f_val);
+			if (IS_ERR(str))
+				goto exit_free;
+			f->val64 = ((u64 *)str)[0];
+			break;
 		default:
 			f->val = f_val;
 			break;
@@ -675,6 +684,11 @@ static struct audit_rule_data *audit_krule_to_data(struct audit_krule *krule)
 			data->buflen += data->values[i] =
 				audit_pack_string(&bufp, audit_mark_path(krule->exe));
 			break;
+		case AUDIT_CONTID:
+			data->buflen += data->values[i] = sizeof(u64);
+			memcpy(bufp, &f->val64, sizeof(u64));
+			bufp += sizeof(u64);
+			break;
 		case AUDIT_LOGINUID_SET:
 			if (krule->pflags & AUDIT_LOGINUID_LEGACY && !f->val) {
 				data->fields[i] = AUDIT_LOGINUID;
@@ -761,6 +775,10 @@ static int audit_compare_rule(struct audit_krule *a, struct audit_krule *b)
 			if (!gid_eq(a->fields[i].gid, b->fields[i].gid))
 				return 1;
 			break;
+		case AUDIT_CONTID:
+			if (a->fields[i].val64 != b->fields[i].val64)
+				return 1;
+			break;
 		default:
 			if (a->fields[i].val != b->fields[i].val)
 				return 1;
@@ -1216,6 +1234,30 @@ int audit_comparator(u32 left, u32 op, u32 right)
 	}
 }
 
+int audit_comparator64(u64 left, u32 op, u64 right)
+{
+	switch (op) {
+	case Audit_equal:
+		return (left == right);
+	case Audit_not_equal:
+		return (left != right);
+	case Audit_lt:
+		return (left < right);
+	case Audit_le:
+		return (left <= right);
+	case Audit_gt:
+		return (left > right);
+	case Audit_ge:
+		return (left >= right);
+	case Audit_bitmask:
+		return (left & right);
+	case Audit_bittest:
+		return ((left & right) == right);
+	default:
+		return 0;
+	}
+}
+
 int audit_uid_comparator(kuid_t left, u32 op, kuid_t right)
 {
 	switch (op) {
@@ -1350,6 +1392,10 @@ int audit_filter(int msgtype, unsigned int listtype)
 				result = audit_comparator(audit_loginuid_set(current),
 							  f->op, f->val);
 				break;
+			case AUDIT_CONTID:
+				result = audit_contid_comparator(current, f->op,
+								 f->val64);
+				break;
 			case AUDIT_MSGTYPE:
 				result = audit_comparator(msgtype, f->op, f->val);
 				break;
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index df26d0aa5e6d..7ef5502e8ef3 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -656,6 +656,9 @@ static int audit_filter_rules(struct task_struct *tsk,
 				result = audit_comparator(ctx->sockaddr->ss_family,
 							  f->op, f->val);
 			break;
+		case AUDIT_CONTID:
+			result = audit_contid_comparator(tsk, f->op, f->val64);
+			break;
 		case AUDIT_SUBJ_USER:
 		case AUDIT_SUBJ_ROLE:
 		case AUDIT_SUBJ_TYPE:
-- 
2.18.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


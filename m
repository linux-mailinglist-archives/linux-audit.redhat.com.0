Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2858517E58
	for <lists+linux-audit@lfdr.de>; Wed,  8 May 2019 18:43:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D90F5308AA12;
	Wed,  8 May 2019 16:43:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5DBF600CD;
	Wed,  8 May 2019 16:43:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A65041F58;
	Wed,  8 May 2019 16:43:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x48GhYbQ023883 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 12:43:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 66655600CD; Wed,  8 May 2019 16:43:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AB0C600C6;
	Wed,  8 May 2019 16:43:27 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: [PATCH ghak73 V2] audit: re-structure audit field valid checks
Date: Wed,  8 May 2019 12:43:04 -0400
Message-Id: <e0cb73251e93f7a0798a18298cbf688f06a2bc74.1557330625.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, eparis@parisplace.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 08 May 2019 16:43:55 +0000 (UTC)

Multiple checks were being done in one switch case statement that
started to cause some redundancies and awkward exceptions.  Separate the
valid field and op check from the select valid values checks.

Enforce the elimination of meaningless bitwise and greater/lessthan
checks on string fields and other fields with unrelated scalar values.

Honour the operator for WATCH, DIR, PERM, FILETYPE fields as is done in
the EXE field.

Please see the github issue
https://github.com/linux-audit/audit-kernel/issues/73

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
Changelog:
v2:
- address WATCH, DIR, FILETYPE, PERM lack of op checking
- touch up switch statement formatting

 kernel/auditfilter.c | 48 ++++++++++++++++++++++++++++++------------------
 kernel/auditsc.c     | 18 +++++++++++++++---
 2 files changed, 45 insertions(+), 21 deletions(-)

diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 1bc6410413e6..5beb2244d5ba 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -335,7 +335,7 @@ static u32 audit_to_op(u32 op)
 /* check if an audit field is valid */
 static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
 {
-	switch(f->type) {
+	switch (f->type) {
 	case AUDIT_MSGTYPE:
 		if (entry->rule.listnr != AUDIT_FILTER_EXCLUDE &&
 		    entry->rule.listnr != AUDIT_FILTER_USER)
@@ -347,7 +347,7 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
 		break;
 	}
 
-	switch(entry->rule.listnr) {
+	switch (entry->rule.listnr) {
 	case AUDIT_FILTER_FS:
 		switch(f->type) {
 		case AUDIT_FSTYPE:
@@ -358,9 +358,16 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
 		}
 	}
 
-	switch(f->type) {
-	default:
-		return -EINVAL;
+	/* Check for valid field type and op */
+	switch (f->type) {
+	case AUDIT_ARG0:
+	case AUDIT_ARG1:
+	case AUDIT_ARG2:
+	case AUDIT_ARG3:
+	case AUDIT_PERS: /* <uapi/linux/personality.h> */
+	case AUDIT_DEVMINOR:
+		/* all ops are valid */
+		break;
 	case AUDIT_UID:
 	case AUDIT_EUID:
 	case AUDIT_SUID:
@@ -373,11 +380,9 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
 	case AUDIT_FSGID:
 	case AUDIT_OBJ_GID:
 	case AUDIT_PID:
-	case AUDIT_PERS:
 	case AUDIT_MSGTYPE:
 	case AUDIT_PPID:
 	case AUDIT_DEVMAJOR:
-	case AUDIT_DEVMINOR:
 	case AUDIT_EXIT:
 	case AUDIT_SUCCESS:
 	case AUDIT_INODE:
@@ -386,10 +391,6 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
 		if (f->op == Audit_bitmask || f->op == Audit_bittest)
 			return -EINVAL;
 		break;
-	case AUDIT_ARG0:
-	case AUDIT_ARG1:
-	case AUDIT_ARG2:
-	case AUDIT_ARG3:
 	case AUDIT_SUBJ_USER:
 	case AUDIT_SUBJ_ROLE:
 	case AUDIT_SUBJ_TYPE:
@@ -403,16 +404,28 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
 	case AUDIT_WATCH:
 	case AUDIT_DIR:
 	case AUDIT_FILTERKEY:
-		break;
 	case AUDIT_LOGINUID_SET:
-		if ((f->val != 0) && (f->val != 1))
-			return -EINVAL;
-	/* FALL THROUGH */
 	case AUDIT_ARCH:
 	case AUDIT_FSTYPE:
+	case AUDIT_PERM:
+	case AUDIT_FILETYPE:
+	case AUDIT_FIELD_COMPARE:
+	case AUDIT_EXE:
+		/* only equal and not equal valid ops */
 		if (f->op != Audit_not_equal && f->op != Audit_equal)
 			return -EINVAL;
 		break;
+	default:
+		/* field not recognized */
+		return -EINVAL;
+	}
+
+	/* Check for select valid field values */
+	switch (f->type) {
+	case AUDIT_LOGINUID_SET:
+		if ((f->val != 0) && (f->val != 1))
+			return -EINVAL;
+		break;
 	case AUDIT_PERM:
 		if (f->val & ~15)
 			return -EINVAL;
@@ -425,11 +438,10 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
 		if (f->val > AUDIT_MAX_FIELD_COMPARE)
 			return -EINVAL;
 		break;
-	case AUDIT_EXE:
-		if (f->op != Audit_not_equal && f->op != Audit_equal)
-			return -EINVAL;
+	default:
 		break;
 	}
+
 	return 0;
 }
 
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 5371b59bde36..4bd0ec60a0e8 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -601,12 +601,20 @@ static int audit_filter_rules(struct task_struct *tsk,
 			}
 			break;
 		case AUDIT_WATCH:
-			if (name)
-				result = audit_watch_compare(rule->watch, name->ino, name->dev);
+			if (name) {
+				result = audit_watch_compare(rule->watch,
+							     name->ino,
+							     name->dev);
+				if (f->op == Audit_not_equal)
+					result = !result;
+			}
 			break;
 		case AUDIT_DIR:
-			if (ctx)
+			if (ctx) {
 				result = match_tree_refs(ctx, rule->tree);
+				if (f->op == Audit_not_equal)
+					result = !result;
+			}
 			break;
 		case AUDIT_LOGINUID:
 			result = audit_uid_comparator(audit_get_loginuid(tsk),
@@ -684,9 +692,13 @@ static int audit_filter_rules(struct task_struct *tsk,
 			break;
 		case AUDIT_PERM:
 			result = audit_match_perm(ctx, f->val);
+			if (f->op == Audit_not_equal)
+				result = !result;
 			break;
 		case AUDIT_FILETYPE:
 			result = audit_match_filetype(ctx, f->val);
+			if (f->op == Audit_not_equal)
+				result = !result;
 			break;
 		case AUDIT_FIELD_COMPARE:
 			result = audit_field_compare(tsk, cred, f, ctx, name);
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

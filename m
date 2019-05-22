Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C330271F1
	for <lists+linux-audit@lfdr.de>; Wed, 22 May 2019 23:52:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3303F8666F;
	Wed, 22 May 2019 21:52:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A03681001E82;
	Wed, 22 May 2019 21:51:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 087845B424;
	Wed, 22 May 2019 21:51:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4MLpepo000480 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 May 2019 17:51:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CBCFD607CC; Wed, 22 May 2019 21:51:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 61E0567C68;
	Wed, 22 May 2019 21:51:33 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: [PATCH ghak73 V3] audit: re-structure audit field valid checks
Date: Wed, 22 May 2019 17:51:09 -0400
Message-Id: <37cc1e38c08ca129f43891b3cd521e6daeb5f342.1558553120.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 22 May 2019 21:52:02 +0000 (UTC)

Multiple checks were being done in one switch case statement that
started to cause some redundancies and awkward exceptions.  Separate the
valid field and op check from the select valid values checks.

Enforce the elimination of meaningless bitwise and greater/lessthan
checks on string fields and other fields with unrelated scalar values.

Please see the github issue
https://github.com/linux-audit/audit-kernel/issues/73

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
Changelog:
v3:
- remove op negation for WATCH, DIR, PERM, FILETYPE (ghak114)
- move AUDIT_{SUBJ_{CLR,SEN},OBJ_LEV_{LOW,HIGH}} to range
v2:
- address WATCH, DIR, FILETYPE, PERM lack of op checking
- touch up switch statement formatting

 kernel/auditfilter.c | 56 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 303fb04770ce..d5e54e944f72 100644
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
@@ -373,46 +380,52 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
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
 	case AUDIT_SESSIONID:
+	case AUDIT_SUBJ_SEN:
+	case AUDIT_SUBJ_CLR:
+	case AUDIT_OBJ_LEV_LOW:
+	case AUDIT_OBJ_LEV_HIGH:
 		/* bit ops are only useful on syscall args */
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
-	case AUDIT_SUBJ_SEN:
-	case AUDIT_SUBJ_CLR:
 	case AUDIT_OBJ_USER:
 	case AUDIT_OBJ_ROLE:
 	case AUDIT_OBJ_TYPE:
-	case AUDIT_OBJ_LEV_LOW:
-	case AUDIT_OBJ_LEV_HIGH:
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
 
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

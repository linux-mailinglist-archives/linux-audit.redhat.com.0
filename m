Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B750314D29
	for <lists+linux-audit@lfdr.de>; Mon,  6 May 2019 16:50:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72E13307D941;
	Mon,  6 May 2019 14:50:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51E425E1A7;
	Mon,  6 May 2019 14:50:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF0F43FA45;
	Mon,  6 May 2019 14:50:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x46EmuMC030689 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 May 2019 10:48:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A05B06146F; Mon,  6 May 2019 14:48:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7CA35E1A7;
	Mon,  6 May 2019 14:48:50 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: [RFC PATCH ghak73 V1] audit: re-structure audit field valid checks
Date: Mon,  6 May 2019 10:48:26 -0400
Message-Id: <735fe10ae67e4a7b54e93802e7e21c113dc837b7.1556805665.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Mon, 06 May 2019 14:50:56 +0000 (UTC)

Multiple checks were being done in one switch case statement that
started to cause some redundancies and awkward exceptions.  Separate the
valid field and op check from the select valid values checks.

Enforce the elimination of meaningless bitwise and greater/lessthan
checks on string fields and other fields with unrelated scalar values.

Please see the github issue
https://github.com/linux-audit/audit-kernel/issues/73

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
Passes audit-testsuite on f30.
Note: This does not necessarily completely resolve ghak73, but enables
ghak64.

 kernel/auditfilter.c | 42 +++++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 1bc6410413e6..17cfccd9ee27 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -358,9 +358,16 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
 		}
 	}
 
+	/* Check for valid field type and op */
 	switch(f->type) {
-	default:
-		return -EINVAL;
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
+	switch(f->type) {
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

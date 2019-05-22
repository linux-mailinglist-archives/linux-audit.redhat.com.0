Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 483E9271F3
	for <lists+linux-audit@lfdr.de>; Wed, 22 May 2019 23:52:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F49B307D945;
	Wed, 22 May 2019 21:52:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F337600C6;
	Wed, 22 May 2019 21:52:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B94DA5B424;
	Wed, 22 May 2019 21:52:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4MLqW5m001129 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 May 2019 17:52:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B95BF52EA; Wed, 22 May 2019 21:52:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7ACB52E7;
	Wed, 22 May 2019 21:52:26 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: [PATCH ghak114 V1] audit: enforce op for string fields
Date: Wed, 22 May 2019 17:52:02 -0400
Message-Id: <2fd85f3efc5a8816483497a84c1e031ee56d4ebf.1558553100.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 22 May 2019 21:52:38 +0000 (UTC)

The field operator is ignored on several string fields.  WATCH, DIR,
PERM and FILETYPE field operators are completely ignored and meaningless
since the op is not referenced in audit_filter_rules().  Range and
bitwise operators are already addressed in ghak73.

Honour the operator for WATCH, DIR, PERM, FILETYPE fields as is done in
the EXE field.

Please see github issue
https://github.com/linux-audit/audit-kernel/issues/114
---
 kernel/auditsc.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 30aa07b0115f..087137d341a2 100644
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

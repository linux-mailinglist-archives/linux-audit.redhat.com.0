Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E6517E69
	for <lists+linux-audit@lfdr.de>; Wed,  8 May 2019 18:46:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31BD7806D5;
	Wed,  8 May 2019 16:46:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D462919729;
	Wed,  8 May 2019 16:46:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2261A41F58;
	Wed,  8 May 2019 16:46:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x48Gk546023966 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 12:46:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92D555C269; Wed,  8 May 2019 16:46:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 985145C226;
	Wed,  8 May 2019 16:45:57 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: [PATCH ghak64 V2] audit: add saddr_fam filter field
Date: Wed,  8 May 2019 12:45:33 -0400
Message-Id: <bf0d3fc2728cc4ec29aa684d08efdf6d71d185c4.1557330804.git.rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 08 May 2019 16:46:20 +0000 (UTC)

Provide a method to filter out sockaddr and bind calls by network
address family.

Existing SOCKADDR records are listed for any network activity.
Implement the AUDIT_SADDR_FAM field selector to be able to classify or
limit records to specific network address families, such as AF_INET or
AF_INET6.

An example of a network record that is unlikely to be useful and flood
the logs:

type=SOCKADDR msg=audit(07/27/2017 12:18:27.019:845) : saddr={ fam=local
path=/var/run/nscd/socket }
type=SYSCALL msg=audit(07/27/2017 12:18:27.019:845) : arch=x86_64
syscall=connect success=no exit=ENOENT(No such file or directory) a0=0x3
a1=0x7fff229c4980 a2=0x6e a3=0x6 items=1 ppid=3301 pid=6145 auid=sgrubb
uid=sgrubb gid=sgrubb euid=sgrubb suid=sgrubb fsuid=sgrubb egid=sgrubb
sgid=sgrubb fsgid=sgrubb tty=pts3 ses=4 comm=bash exe=/usr/bin/bash
subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
key=network-test

Please see the audit-testsuite PR at
https://github.com/linux-audit/audit-testsuite/pull/87
Please see the github issue
https://github.com/linux-audit/audit-kernel/issues/64
Please see the github issue for the accompanying userspace support
https://github.com/linux-audit/audit-userspace/issues/93

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
Changelog:
v2:
- rebase on ghak73 v2
- check for valid range of saddr_fam value

 include/uapi/linux/audit.h | 1 +
 kernel/auditfilter.c       | 5 +++++
 kernel/auditsc.c           | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index a1280af20336..c89c6495983d 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -281,6 +281,7 @@
 #define AUDIT_OBJ_GID	110
 #define AUDIT_FIELD_COMPARE	111
 #define AUDIT_EXE	112
+#define AUDIT_SADDR_FAM	113
 
 #define AUDIT_ARG0      200
 #define AUDIT_ARG1      (AUDIT_ARG0+1)
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 5beb2244d5ba..4c897281beb8 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -387,6 +387,7 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
 	case AUDIT_SUCCESS:
 	case AUDIT_INODE:
 	case AUDIT_SESSIONID:
+	case AUDIT_SADDR_FAM:
 		/* bit ops are only useful on syscall args */
 		if (f->op == Audit_bitmask || f->op == Audit_bittest)
 			return -EINVAL;
@@ -438,6 +439,10 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
 		if (f->val > AUDIT_MAX_FIELD_COMPARE)
 			return -EINVAL;
 		break;
+	case AUDIT_SADDR_FAM:
+		if (f->val <= AF_UNSPEC || f->val >= AF_MAX)
+			return -EINVAL;
+		break;
 	default:
 		break;
 	}
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 4bd0ec60a0e8..aab364804b9b 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -623,6 +623,11 @@ static int audit_filter_rules(struct task_struct *tsk,
 		case AUDIT_LOGINUID_SET:
 			result = audit_comparator(audit_loginuid_set(tsk), f->op, f->val);
 			break;
+		case AUDIT_SADDR_FAM:
+			if (ctx->sockaddr)
+				result = audit_comparator(ctx->sockaddr->ss_family,
+							  f->op, f->val);
+			break;
 		case AUDIT_SUBJ_USER:
 		case AUDIT_SUBJ_ROLE:
 		case AUDIT_SUBJ_TYPE:
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

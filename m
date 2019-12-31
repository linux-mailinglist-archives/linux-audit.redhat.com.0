Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B6F4612DBAB
	for <lists+linux-audit@lfdr.de>; Tue, 31 Dec 2019 20:59:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577822358;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EYuPtQCD7UVs/rhxXul+yeDzrzBltty5NLbbDNtaZLs=;
	b=FkL5DFScg6qXBwwesxn4Vf19iuSVpCJtYPIcuDww2pH1+/DOuA46UiSnW+agwi5rwm26Yb
	meowD14ynHcplHIyT1YTLz6xHqaAC9bqMJj2VN+lSeMD5iItN1YFiv8dN3uOkgvnnoBIwk
	iT5fYJtpIiQKL4CxUuNDbieIEE1bv6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-3fHlKV9iMDu0OzxNCp1Hxg-1; Tue, 31 Dec 2019 14:59:16 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E12ED107ACC5;
	Tue, 31 Dec 2019 19:59:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BECFD60BF4;
	Tue, 31 Dec 2019 19:59:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 883E018095FF;
	Tue, 31 Dec 2019 19:59:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBVJx8Lq000389 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 31 Dec 2019 14:59:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5521F60FC5; Tue, 31 Dec 2019 19:59:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-15.phx2.redhat.com [10.3.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA0AE60BF4;
	Tue, 31 Dec 2019 19:59:01 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH ghau51/ghau40 v8 03/14] auditctl: add support for AUDIT_CONTID
	filter
Date: Tue, 31 Dec 2019 14:58:10 -0500
Message-Id: <1577822301-19760-4-git-send-email-rgb@redhat.com>
In-Reply-To: <1577822301-19760-1-git-send-email-rgb@redhat.com>
References: <1577822301-19760-1-git-send-email-rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: nhorman@redhat.com, Richard Guy Briggs <rgb@redhat.com>,
	eparis@parisplace.org, mpatel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 3fHlKV9iMDu0OzxNCp1Hxg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A u64 container identifier has been added to the kernel view of tasks.
This allows container orchestrators to label tasks with a unique
tamperproof identifier that gets inherited by its children to be able to
track the provenance of actions by a container.

Add support to libaudit and auditctl for the AUDIT_CONTID field to
filter based on audit container identifier.  This field is specified
with the "contid" field name on the command line.

Since it is a u64 and larger than any other numeric field, send it as a
string but do the appropriate conversions on each end in each direction.

See: https://github.com/linux-audit/audit-userspace/issues/40
See: https://github.com/linux-audit/audit-kernel/issues/91
See: https://github.com/linux-audit/audit-testsuite/issues/64
See: https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 docs/auditctl.8        |  3 +++
 lib/fieldtab.h         |  1 +
 lib/libaudit.c         | 36 ++++++++++++++++++++++++++++++++++++
 lib/libaudit.h         |  7 +++++++
 src/auditctl-listing.c | 21 +++++++++++++++++++++
 5 files changed, 68 insertions(+)

diff --git a/docs/auditctl.8 b/docs/auditctl.8
index 6606077c2c44..daed435f03af 100644
--- a/docs/auditctl.8
+++ b/docs/auditctl.8
@@ -216,6 +216,9 @@ Address family number as found in /usr/include/bits/socket.h. For example, IPv4
 .B sessionid
 User's login session ID
 .TP
+.B contid
+Process' audit container ID
+.TP
 .B subj_user
 Program's SE Linux User
 .TP
diff --git a/lib/fieldtab.h b/lib/fieldtab.h
index b597cafb2df8..e0a49d0154bb 100644
--- a/lib/fieldtab.h
+++ b/lib/fieldtab.h
@@ -47,6 +47,7 @@ _S(AUDIT_OBJ_TYPE,     "obj_type"     )
 _S(AUDIT_OBJ_LEV_LOW,  "obj_lev_low"  )
 _S(AUDIT_OBJ_LEV_HIGH, "obj_lev_high" )
 _S(AUDIT_SESSIONID,    "sessionid"    )
+_S(AUDIT_CONTID,       "contid"       )
 
 _S(AUDIT_DEVMAJOR,     "devmajor"     )
 _S(AUDIT_DEVMINOR,     "devminor"     )
diff --git a/lib/libaudit.c b/lib/libaudit.c
index 4eda7586cff0..0d03cca18aa8 100644
--- a/lib/libaudit.c
+++ b/lib/libaudit.c
@@ -1756,6 +1756,42 @@ int audit_rule_fieldpair_data(struct audit_rule_data **rulep, const char *pair,
 			if (rule->values[rule->field_count] >= AF_MAX)
 				return -EAU_FIELDVALTOOBIG;
 			break;
+		case AUDIT_CONTID: {
+			unsigned long long val;
+
+			if ((audit_get_features() &
+				AUDIT_FEATURE_BITMAP_CONTAINERID) == 0)
+				return -EAU_FIELDNOSUPPORT;
+			if (flags != AUDIT_FILTER_EXCLUDE &&
+			    flags != AUDIT_FILTER_USER &&
+			    flags != AUDIT_FILTER_EXIT)
+				return -EAU_FIELDNOFILTER;
+			if (isdigit((char)*(v))) 
+				val = strtoull(v, NULL, 0);
+			else if (strlen(v) >= 2 && *(v)=='-' && 
+						(isdigit((char)*(v+1)))) 
+				val = strtoll(v, NULL, 0);
+			else if (strcmp(v, "unset") == 0)
+				val = ULLONG_MAX;
+			else
+				return -EAU_FIELDVALNUM;
+			if (errno)
+				return -EAU_FIELDVALNUM;
+			vlen = sizeof(unsigned long long);
+			rule->values[rule->field_count] = vlen;
+			offset = rule->buflen;
+			rule->buflen += vlen;
+			*rulep = realloc(rule, sizeof(*rule) + rule->buflen);
+			if (*rulep == NULL) {
+				free(rule);
+				audit_msg(LOG_ERR, "Cannot realloc memory!\n");
+				return -3;
+			} else {
+				rule = *rulep;
+			}
+			*(unsigned long long*)(&rule->buf[offset]) = val;
+			break;
+		}
 		case AUDIT_DEVMAJOR...AUDIT_INODE:
 		case AUDIT_SUCCESS:
 			if (flags != AUDIT_FILTER_EXIT)
diff --git a/lib/libaudit.h b/lib/libaudit.h
index ee56e7c158c7..77ce494f79fb 100644
--- a/lib/libaudit.h
+++ b/lib/libaudit.h
@@ -354,6 +354,9 @@ extern "C" {
 #ifndef AUDIT_FEATURE_BITMAP_FILTER_FS
 #define AUDIT_FEATURE_BITMAP_FILTER_FS		0x00000040
 #endif
+#ifndef AUDIT_FEATURE_BITMAP_CONTAINERID
+#define AUDIT_FEATURE_BITMAP_CONTAINERID	0x00000080
+#endif
 
 /* Defines for interfield comparison update */
 #ifndef AUDIT_OBJ_UID
@@ -380,6 +383,10 @@ extern "C" {
 #define AUDIT_FSTYPE 26
 #endif
 
+#ifndef AUDIT_CONTID
+#define AUDIT_CONTID 27
+#endif
+
 #ifndef AUDIT_COMPARE_UID_TO_OBJ_UID
 #define AUDIT_COMPARE_UID_TO_OBJ_UID   1
 #endif
diff --git a/src/auditctl-listing.c b/src/auditctl-listing.c
index f670ff9bd6e8..a62454f88b2c 100644
--- a/src/auditctl-listing.c
+++ b/src/auditctl-listing.c
@@ -25,6 +25,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
+#include <limits.h>
 #include "auditctl-listing.h"
 #include "private.h"
 #include "auditctl-llist.h"
@@ -460,6 +461,26 @@ static void print_rule(const struct audit_rule_data *r)
 						audit_operator_to_symbol(op),
 						audit_fstype_to_name(
 						r->values[i]));
+			} else if (field == AUDIT_CONTID) {
+				unsigned long long val;
+
+				if (r->values[i] == sizeof(unsigned long long)) {
+					val = *(unsigned long long*)(&r->buf[boffset]);
+
+					if (val != ULLONG_MAX)
+						printf(" -F %s%s%llu", name,
+							audit_operator_to_symbol(op),
+							val);
+					else
+						printf(" -F %s%s%s", name,
+							audit_operator_to_symbol(op),
+							"unset");
+				} else {
+					printf(" -F %s%s%s", name,
+						audit_operator_to_symbol(op),
+						"inval");
+				}
+				boffset += r->values[i];
 			} else {
 				// The default is signed decimal
 				printf(" -F %s%s%d", name, 
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D1F1F12DBBF
	for <lists+linux-audit@lfdr.de>; Tue, 31 Dec 2019 21:00:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577822406;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AoUFpWiMSh8bXJBzajo1Ok8wifqEwSMnuf9ur69ALXc=;
	b=UGNihKVkKPLV5+cQCiXdp09hvgnPH28uRNLcEJ1GRqGOdiLJ1Q6/eFiItGJOH3jJwTrbuZ
	iGDAX0jWvw5mdnV53SWAacN5iHdBJZZSdaDHwagaGfx0NxlOWik+tuH7SDeO4kXKtfiI9V
	RMVsrZA1xaZVyt4vWz0W1tXwCvzSPB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-8Ke5oxWKMJy4YdMTlbHvYg-1; Tue, 31 Dec 2019 15:00:05 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD5E0107ACC4;
	Tue, 31 Dec 2019 19:59:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 657445D9E2;
	Tue, 31 Dec 2019 19:59:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07B1118089CD;
	Tue, 31 Dec 2019 19:59:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBVJxsuk000618 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 31 Dec 2019 14:59:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8833B60FC6; Tue, 31 Dec 2019 19:59:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-15.phx2.redhat.com [10.3.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 704D960BEC;
	Tue, 31 Dec 2019 19:59:47 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH ghau51/ghau40 v8 13/14] auditctl: add a config parameter to
	limit the contid netns count
Date: Tue, 31 Dec 2019 14:58:20 -0500
Message-Id: <1577822301-19760-14-git-send-email-rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 8Ke5oxWKMJy4YdMTlbHvYg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This adds the auditctl option "--contid-netns-limit" that takes one
argument.

Please see kernel patch ("audit: add contid netns limit config param").

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 configure.ac                        |  1 +
 docs/Makefile.am                    |  1 +
 docs/audit_set_contid_netns_limit.3 | 25 +++++++++++++++++++++++++
 docs/auditctl.8                     |  5 ++++-
 lib/libaudit.c                      | 21 +++++++++++++++++++++
 lib/libaudit.h                      |  1 +
 src/auditctl-listing.c              |  4 ++++
 src/auditctl.c                      | 33 +++++++++++++++++++++++++++++++++
 8 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 docs/audit_set_contid_netns_limit.3

diff --git a/configure.ac b/configure.ac
index bb73d5631e62..1436bcd95d51 100644
--- a/configure.ac
+++ b/configure.ac
@@ -68,6 +68,7 @@ AC_CHECK_MEMBERS([struct audit_status.feature_bitmap], [], [], [[#include <linux
 AC_CHECK_DECLS([AUDIT_VERSION_BACKLOG_WAIT_TIME], [], [], [[#include <linux/audit.h>]])
 AC_CHECK_DECLS([AUDIT_STATUS_BACKLOG_WAIT_TIME], [], [], [[#include <linux/audit.h>]])
 AC_CHECK_DECLS([AUDIT_STATUS_CONTID_DEPTH_LIMIT], [], [], [[#include <linux/audit.h>]])
+AC_CHECK_DECLS([AUDIT_STATUS_CONTID_NETNS_LIMIT], [], [], [[#include <linux/audit.h>]])
 AC_CHECK_DECLS([ADDR_NO_RANDOMIZE],,, [#include <sys/personality.h>])
 dnl; posix_fallocate is used in audisp-remote
 AC_CHECK_FUNCS([posix_fallocate])
diff --git a/docs/Makefile.am b/docs/Makefile.am
index fc386d4155c2..8ba92dbd74ab 100644
--- a/docs/Makefile.am
+++ b/docs/Makefile.am
@@ -61,5 +61,6 @@ ausearch_next_event.3 ausearch_set_stop.3 \
 autrace.8 get_auditfail_action.3 set_aumessage_mode.3 \
 audispd-zos-remote.8 libaudit.conf.5 \
 augenrules.8 audit_set_backlog_wait_time.3 audit_set_contid_depth_limit.3 \
+audit_set_contid_netns_limit.3 \
 zos-remote.conf.5 
 
diff --git a/docs/audit_set_contid_netns_limit.3 b/docs/audit_set_contid_netns_limit.3
new file mode 100644
index 000000000000..858fc0147867
--- /dev/null
+++ b/docs/audit_set_contid_netns_limit.3
@@ -0,0 +1,25 @@
+.TH "AUDIT_SET_CONTID_NETNS_LIMIT" "18" "Dec 2019" "Linux Audit API"
+.SH NAME
+audit_set_contid_netns_limit \- Set the audit container identifier network namespace limit
+.SH "SYNOPSIS"
+
+.B #include <libaudit.h>
+.sp
+int audit_set_contid_netns_limit (int fd, int limit);
+
+.SH "DESCRIPTION"
+
+audit_set_contid_netns_limit sets the audit container identifier network namespace limit that the kernel will permit before preventing any further nesting.  This prevents the contid field in AUDIT_CONTAINER_OP and AUDIT_CONTAINER_ID messages from overflowing and limits the netlink and disk bandwidth these messages can use.  This parameter works in conjunction with contid_depth_limit.  The two parameters multiplied cannot exceed 400.  The default value is 100 in the kernel with a maximum of 400 when contid_depth_limit is set to 1.  If set to zero, there is no limit.
+
+.SH "RETURN VALUE"
+
+The return value is <= 0 on error, otherwise it is the netlink sequence id number. This function can have any error that sendto would encounter.
+
+.SH "SEE ALSO"
+
+.BR audit_open (3),
+.BR auditd (8),
+.BR auditctl (8).
+
+.SH AUTHOR
+Richard Guy Briggs
diff --git a/docs/auditctl.8 b/docs/auditctl.8
index d5585192ed16..5262aac8d4b5 100644
--- a/docs/auditctl.8
+++ b/docs/auditctl.8
@@ -14,7 +14,10 @@ Set max number (limit) of outstanding audit buffers allowed (Kernel Default=64)
 Set the time for the kernel to wait (Kernel Default 60*HZ) when the backlog limit is reached before queuing more audit events to be transferred to auditd. The number must be greater than or equal to zero and less that 10 times the default value.
 .TP
 .BI \-\-contid-depth-limit \ \fIlimit\fP
-Set the limit for the kernel container nesting depth (Kernel Default 4).  This prevents overflowing the contid field in CONTAINER_OP and CONTAINER_ID messages and limits netlink and disk bandwidth usage by those messages.  The default value is 4 in the kernel with a maximum of 20.  This parameter must be balanced with the maximum number of audit container identifiers used in any network namespace.  The two parameters multiplied cannot exceed 400.  If set to zero, there is no limit.
+Set the limit for the kernel container nesting depth (Kernel Default 4).  This prevents overflowing the contid field in CONTAINER_OP and CONTAINER_ID messages and limits netlink and disk bandwidth usage by those messages.  This parameter works in conjunction with contid_netns_limit.  The two parameters multiplied together cannot exceed 400.  The default value is 4 in the kernel with a maximum of 400 when contid_netns_limit is set to 1.  If set to zero, there is no limit.
+.TP
+.BI \-\-contid-netns-limit \ \fIlimit\fP
+Set the limit for the kernel container network namespace (Kernel Default 100).  This prevents overflowing the contid field in CONTAINER_OP and CONTAINER_ID messages and limits netlink and disk bandwidth usage by those messages.  This parameter works in conjunction with contid_depth_limit.  The two parameters multiplied together cannot exceed 400.  The default value is 100 in the kernel with a maximum of 400 when contid_depth_limit is set to 1.  If set to zero, there is no limit.
 .TP
 .B \-c
 Continue loading rules in spite of an error. This summarizes the results of loading the rules. The exit code will not be success if any rule fails to load.
diff --git a/lib/libaudit.c b/lib/libaudit.c
index afc7dab599dc..37e0c35ada18 100644
--- a/lib/libaudit.c
+++ b/lib/libaudit.c
@@ -560,6 +560,27 @@ int audit_set_contid_depth_limit(int fd, uint32_t limit)
 	return rc;
 }
 
+int audit_set_contid_netns_limit(int fd, uint32_t limit)
+{
+	int rc = -1;
+#if HAVE_DECL_AUDIT_STATUS_CONTID_NETNS_LIMIT == 1
+	struct audit_status s;
+
+	if ((audit_get_features() & AUDIT_FEATURE_BITMAP_CONTAINERID) == 0)
+		return -EAU_FIELDNOSUPPORT;
+
+	memset(&s, 0, sizeof(s));
+	s.mask = AUDIT_STATUS_CONTID_NETNS_LIMIT;
+	s.contid_netns_limit = limit;
+	rc = audit_send(fd, AUDIT_SET, &s, sizeof(s));
+	if (rc < 0)
+		audit_msg(audit_priority(errno),
+			"Error sending contid netns limit request (%s)", 
+			strerror(-rc));
+#endif
+	return rc;
+}
+
 int audit_set_feature(int fd, unsigned feature, unsigned value, unsigned lock)
 {
 #if defined(HAVE_DECL_AUDIT_FEATURE_VERSION) && \
diff --git a/lib/libaudit.h b/lib/libaudit.h
index 9d2e3553649e..c97ee8b957d3 100644
--- a/lib/libaudit.h
+++ b/lib/libaudit.h
@@ -653,6 +653,7 @@ extern int  audit_set_backlog_limit(int fd, uint32_t limit);
 int audit_set_backlog_wait_time(int fd, uint32_t bwt);
 int audit_reset_lost(int fd);
 extern int  audit_set_contid_depth_limit(int fd, uint32_t limit);
+extern int  audit_set_contid_netns_limit(int fd, uint32_t limit);
 extern int  audit_set_feature(int fd, unsigned feature, unsigned value, unsigned lock);
 extern int  audit_set_loginuid_immutable(int fd);
 
diff --git a/src/auditctl-listing.c b/src/auditctl-listing.c
index 7737001aa2c8..c76f19b6cfc5 100644
--- a/src/auditctl-listing.c
+++ b/src/auditctl-listing.c
@@ -590,6 +590,10 @@ int audit_print_reply(struct audit_reply *rep, int fd)
 			printf("contid_depth_limit %u\n",
 				rep->status->contid_depth_limit);
 #endif
+#if HAVE_DECL_AUDIT_STATUS_CONTID_NETNS_LIMIT == 1
+			printf("contid_netns_limit %u\n",
+				rep->status->contid_netns_limit);
+#endif
 			printed = 1;
 			break;
 #if defined(HAVE_DECL_AUDIT_FEATURE_VERSION) && \
diff --git a/src/auditctl.c b/src/auditctl.c
index b46f9772651e..2e8555525341 100644
--- a/src/auditctl.c
+++ b/src/auditctl.c
@@ -147,6 +147,9 @@ static void usage(void)
 #if HAVE_DECL_AUDIT_STATUS_CONTID_DEPTH_LIMIT
      "    --contid-depth-limit Set the kernel audit container identifier depth limit\n"
 #endif
+#if HAVE_DECL_AUDIT_STATUS_CONTID_NETNS_LIMIT
+     "    --contid-netns-limit Set the kernel audit container identifier netns limit\n"
+#endif
      );
 }
 
@@ -464,6 +467,9 @@ struct option long_opts[] =
 #if HAVE_DECL_AUDIT_STATUS_CONTID_DEPTH_LIMIT == 1
   {"contid-depth-limit", 1, NULL, 4},
 #endif
+#if HAVE_DECL_AUDIT_STATUS_CONTID_NETNS_LIMIT == 1
+  {"contid-netns-limit", 1, NULL, 5},
+#endif
   {NULL, 0, NULL, 0}
 };
 
@@ -1040,6 +1046,33 @@ process_keys:
 		retval = -1;
 #endif
 		break;
+	case 5:
+#if HAVE_DECL_AUDIT_STATUS_CONTID_NETNS_LIMIT == 1
+		if (optarg && isdigit(optarg[0])) {
+			uint32_t limit;
+			errno = 0;
+			limit = strtoul(optarg,NULL,0);
+			if (errno) {
+				audit_msg(LOG_ERR,
+					"Error converting contid-netns-limit");
+				return -1;
+			}
+			if (audit_set_contid_netns_limit(fd, limit) > 0)
+				audit_request_status(fd);
+			else
+				return -1;
+		} else {
+			audit_msg(LOG_ERR, 
+			    "contid-netns-limit must be a numeric value was %s", 
+				optarg);
+			retval = -1;
+		}
+#else
+		audit_msg(LOG_ERR,
+			"contid-netns-limit is not supported on your kernel");
+		retval = -1;
+#endif
+		break;
         default: 
 		usage();
 		retval = -1;
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


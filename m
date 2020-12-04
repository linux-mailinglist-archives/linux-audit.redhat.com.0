Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DAE252CE6A5
	for <lists+linux-audit@lfdr.de>; Fri,  4 Dec 2020 04:43:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607053428;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TexKt5etHesOPPvQKZW4BBceAqSfv/s00WCX378fKZI=;
	b=NjKRQaDSAKb0SCQSa/sIkZJfsrg1VfC6vUoJAhEhiJn310TNghbs6oYhT9fLIJ3kssOd+I
	s1pl6GuUvJLzwI8j5UVNlLMN61TqZny+RawgqW16rYqBZ60B4Vd2DiSnXqHQL2kNi6q1On
	NFpYwMLvsMFJbWL8VXY9eCf7e8v0mmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-I_r2dtU5N_erUUWtZ0cSRw-1; Thu, 03 Dec 2020 22:43:47 -0500
X-MC-Unique: I_r2dtU5N_erUUWtZ0cSRw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3C983E74B;
	Fri,  4 Dec 2020 03:43:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 157591A890;
	Fri,  4 Dec 2020 03:43:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF9AB4A7C6;
	Fri,  4 Dec 2020 03:43:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B43hR1j013276 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 22:43:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9D4861001B2C; Fri,  4 Dec 2020 03:43:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24E5E1002382;
	Fri,  4 Dec 2020 03:43:19 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: [RFC PATCH ghau10 v1] fix FEATURE_VERSION vs FEATURE_BITMAP
Date: Thu,  3 Dec 2020 22:42:36 -0500
Message-Id: <20201204034236.1543287-1-rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>
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

Untangle AUDIT_FEATURE_VERSION and AUDIT_FEATURE_BITMAP since they have nothing
to do with each other.

AUDIT_FEATURE_VERSION is a method to enable and lock certain audit features in
the kernel.  Threre are currently only two.

AUDIT_FEATURE_BITMAP is a method to determine what features exist in the kernel
implementation of audit.  There are currently seven.

fixes: a22f13a548d2f26b3fb05b31599f5b12f56d3d07 ("Fix compile time feature detection in auditctl")
fixes: 74327320a25b2d889708002908d6a051b4dfea51 ("Fix compile time feature detection in auditctl")
fixes: f588248775b4f8180b846bbc1681bc54e07871ed ("Better detect struct audit_status existence")
fixes: bed754a651f47f5a83bbf565609e4936b0270269 ("Fix building on old kernels")
Please see issue page https://github.com/linux-audit/audit-userspace/issues/10

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 lib/libaudit.c         | 12 ++++--------
 lib/libaudit.h         |  2 +-
 lib/netlink.c          |  6 ++----
 src/auditctl-listing.c |  3 +--
 src/auditctl.c         |  6 ++----
 5 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/lib/libaudit.c b/lib/libaudit.c
index 37bf508cf07a..de22e9281969 100644
--- a/lib/libaudit.c
+++ b/lib/libaudit.c
@@ -540,8 +540,7 @@ int audit_reset_lost(int fd)
 
 int audit_set_feature(int fd, unsigned feature, unsigned value, unsigned lock)
 {
-#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION) && \
-    defined(HAVE_STRUCT_AUDIT_STATUS_FEATURE_BITMAP)
+#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION)
 	int rc;
 	struct audit_features f;
 
@@ -565,8 +564,7 @@ int audit_set_feature(int fd, unsigned feature, unsigned value, unsigned lock)
 
 int audit_request_features(int fd)
 {
-#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION) && \
-    defined(HAVE_STRUCT_AUDIT_STATUS_FEATURE_BITMAP)
+#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION)
 	int rc;
 	struct audit_features f;
 
@@ -585,8 +583,7 @@ int audit_request_features(int fd)
 
 extern int  audit_set_loginuid_immutable(int fd)
 {
-#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION) && \
-    defined(HAVE_STRUCT_AUDIT_STATUS_FEATURE_BITMAP)
+#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION)
 	return audit_set_feature(fd, AUDIT_FEATURE_LOGINUID_IMMUTABLE, 1, 1);
 #else
 	errno = EINVAL;
@@ -607,8 +604,7 @@ static void load_feature_bitmap(void)
 		return;
 	}
 
-#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION) && \
-    defined(HAVE_STRUCT_AUDIT_STATUS_FEATURE_BITMAP)
+#if defined(HAVE_STRUCT_AUDIT_STATUS_FEATURE_BITMAP)
 	if ((rc = audit_request_status(fd)) > 0) {
 		struct audit_reply rep;
 		int i;
diff --git a/lib/libaudit.h b/lib/libaudit.h
index ec880eeb89ec..2305cf55d166 100644
--- a/lib/libaudit.h
+++ b/lib/libaudit.h
@@ -514,7 +514,7 @@ struct audit_reply {
 	struct nlmsgerr         *error;
 	struct audit_sig_info   *signal_info;
 	struct daemon_conf      *conf;
-#ifdef AUDIT_FEATURE_BITMAP_ALL
+#ifdef AUDIT_FEATURE_VERSION
 	struct audit_features	*features;
 #endif
 	};
diff --git a/lib/netlink.c b/lib/netlink.c
index 5b2028fda7e8..9525b8d833c0 100644
--- a/lib/netlink.c
+++ b/lib/netlink.c
@@ -147,8 +147,7 @@ static int adjust_reply(struct audit_reply *rep, int len)
 	rep->error    = NULL;
 	rep->signal_info = NULL;
 	rep->conf     = NULL;
-#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION) && \
-    defined(HAVE_STRUCT_AUDIT_STATUS_FEATURE_BITMAP)
+#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION)
 	rep->features = NULL;
 #endif
 	if (!NLMSG_OK(rep->nlh, (unsigned int)len)) {
@@ -173,8 +172,7 @@ static int adjust_reply(struct audit_reply *rep, int len)
 		case AUDIT_GET:   
 			rep->status  = NLMSG_DATA(rep->nlh); 
 			break;
-#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION) && \
-    defined(HAVE_STRUCT_AUDIT_STATUS_FEATURE_BITMAP)
+#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION)
 		case AUDIT_GET_FEATURE:
 			rep->features =  NLMSG_DATA(rep->nlh);
 			break;
diff --git a/src/auditctl-listing.c b/src/auditctl-listing.c
index 6eb3b56bbc79..2b4b43caa9d2 100644
--- a/src/auditctl-listing.c
+++ b/src/auditctl-listing.c
@@ -567,8 +567,7 @@ int audit_print_reply(struct audit_reply *rep, int fd)
 #endif
 			printed = 1;
 			break;
-#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION) && \
-    defined(HAVE_STRUCT_AUDIT_STATUS_FEATURE_BITMAP)
+#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION)
 		case AUDIT_GET_FEATURE:
 			{
 			uint32_t mask = AUDIT_FEATURE_TO_MASK(
diff --git a/src/auditctl.c b/src/auditctl.c
index 29f7215b94b6..3891db56bee7 100644
--- a/src/auditctl.c
+++ b/src/auditctl.c
@@ -133,8 +133,7 @@ static void usage(void)
      "    -v                  Version\n"
      "    -w <path>           Insert watch at <path>\n"
      "    -W <path>           Remove watch at <path>\n"
-#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION) && \
-    defined(HAVE_STRUCT_AUDIT_STATUS_FEATURE_BITMAP)
+#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION)
      "    --loginuid-immutable  Make loginuids unchangeable once set\n"
 #endif
 #if HAVE_DECL_AUDIT_VERSION_BACKLOG_WAIT_TIME == 1 || \
@@ -449,8 +448,7 @@ static int parse_syscall(const char *optarg)
 
 static struct option long_opts[] =
 {
-#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION) && \
-    defined(HAVE_STRUCT_AUDIT_STATUS_FEATURE_BITMAP)
+#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION)
   {"loginuid-immutable", 0, NULL, 1},
 #endif
 #if HAVE_DECL_AUDIT_VERSION_BACKLOG_WAIT_TIME == 1 || \
-- 
2.18.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


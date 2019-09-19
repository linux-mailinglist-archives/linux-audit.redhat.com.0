Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 872F2B7114
	for <lists+linux-audit@lfdr.de>; Thu, 19 Sep 2019 03:29:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F09AAA7F8;
	Thu, 19 Sep 2019 01:29:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF4E160606;
	Thu, 19 Sep 2019 01:29:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 842101803B37;
	Thu, 19 Sep 2019 01:29:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8J1TL0u011204 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Sep 2019 21:29:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24EDF5DA60; Thu, 19 Sep 2019 01:29:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4214D5D9CC;
	Thu, 19 Sep 2019 01:29:17 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH ghau51/ghau40 v7 12/12] libaudit: add support to get and set
	capcontid on a task
Date: Wed, 18 Sep 2019 21:27:52 -0400
Message-Id: <1568856472-10173-13-git-send-email-rgb@redhat.com>
In-Reply-To: <1568856472-10173-1-git-send-email-rgb@redhat.com>
References: <1568856472-10173-1-git-send-email-rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 19 Sep 2019 01:29:24 +0000 (UTC)

Add support to be able to set a capability to allow a task to set the
audit container identifier of descendants.

See: https://github.com/linux-audit/audit-userspace/issues/51
See: https://github.com/linux-audit/audit-kernel/issues/90
See: https://github.com/linux-audit/audit-testsuite/issues/64
See: https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID

Add the audit_get_capcontid() and audit_set_capcontid() calls analogous
to CAP_AUDIT_CONTROL for descendant user namespaces.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 docs/Makefile.am  |  1 +
 lib/libaudit.c    | 85 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/libaudit.h    | 14 +++++++++
 lib/msg_typetab.h |  2 ++
 lib/netlink.c     |  4 +++
 5 files changed, 106 insertions(+)

diff --git a/docs/Makefile.am b/docs/Makefile.am
index 821182315806..8b0e5c2c3730 100644
--- a/docs/Makefile.am
+++ b/docs/Makefile.am
@@ -29,6 +29,7 @@ auditd.conf.5 auditd-plugins.5 \
 audit_delete_rule_data.3 audit_detect_machine.3 \
 audit_encode_nv_string.3 audit_getloginuid.3 \
 audit_get_reply.3 audit_get_session.3 audit_get_containerid.3 audit_set_containerid.3 \
+audit_get_capcontid.3 audit_set_capcontid.3 \
 audit_log_acct_message.3 audit_log_user_avc_message.3 \
 audit_log_user_command.3 audit_log_user_comm_message.3 \
 audit_log_user_message.3 audit_log_semanage_message.3 \
diff --git a/lib/libaudit.c b/lib/libaudit.c
index 62e1a2a64ee5..08998610c66a 100644
--- a/lib/libaudit.c
+++ b/lib/libaudit.c
@@ -1026,6 +1026,91 @@ uint32_t audit_get_session(void)
 }
 
 /*
+ * This function will retrieve the capability container identifier or -2 if
+ * there is an error.
+ */
+uint32_t audit_get_capcontid(pid_t pid)
+{
+        if ((audit_get_features() & AUDIT_FEATURE_BITMAP_CONTAINERID) == 0) {
+		return -2;
+	} else {
+                struct audit_reply rep;
+                int i;
+                int timeout = 40; /* tenths of seconds */
+                struct pollfd pfd[1];
+                int fd = audit_open();
+		struct audit_capcontid_status cs;
+                int rc;
+
+		if (fd < 0) {
+                        audit_msg(audit_priority(errno), "Error openning get capcontid req (%s)", strerror(-rc));
+			return -2;
+		}
+		cs.pid = pid;
+                rc = audit_send(fd, AUDIT_GET_CONTID, &cs, sizeof(cs));
+                if (rc < 0 && rc != -EINVAL) {
+			audit_close(fd);
+                        audit_msg(audit_priority(errno), "Error sending set capcontid req (%s)", strerror(-rc));
+                        return -2;
+                }
+                pfd[0].fd = fd;
+                pfd[0].events = POLLIN;
+
+                for (i = 0; i < timeout; i++) {
+                        do {
+                                rc = poll(pfd, 1, 100);
+                        } while (rc < 0 && errno == EINTR);
+                        rc = audit_get_reply(fd, &rep, GET_REPLY_NONBLOCKING,0); 
+                        if (rc > 0) {
+                                /* If we get done or error, break out */
+                                if (rep.type == NLMSG_DONE ||
+                                        rep.type == NLMSG_ERROR)
+                                        break;
+
+                                /* If its not get_contid, keep looping */
+                                if (rep.type != AUDIT_GET_CAPCONTID)
+                                        continue;
+
+                                /* Found it... */
+				audit_close(fd);
+				if (rep.capcontid->pid == pid)
+                                	return rep.capcontid->cap;
+				else
+					return -2;
+			}
+		}
+		audit_close(fd);
+		return -2;
+	}
+}
+
+/*
+ * This function returns 0 on success and 1 on failure
+ */
+int audit_set_capcontid(pid_t pid, uint32_t capcontid)
+{
+        if ((audit_get_features() & AUDIT_FEATURE_BITMAP_CONTAINERID) == 0) {
+		return -2;
+	} else {
+		int rc;
+		int seq;
+                int fd = audit_open();
+		struct audit_capcontid_status cs = { pid, capcontid };
+
+		if (fd < 0) {
+                        audit_msg(audit_priority(errno), "Error openning set capcontid req (%s)", strerror(-rc));
+			return 1;
+		}
+		rc = audit_send(fd, AUDIT_SET_CAPCONTID, &cs, sizeof(cs));
+		if (rc < 0) {
+			audit_msg(audit_priority(errno), "Error sending set capcontid request (%s)", strerror(-rc));
+			return 1;
+		}
+		return 0;
+	}
+}
+
+/*
  * This function will retrieve the audit container identifier or -2 if
  * there is an error.
  */
diff --git a/lib/libaudit.h b/lib/libaudit.h
index 717724e8fbbb..8067ef30f427 100644
--- a/lib/libaudit.h
+++ b/lib/libaudit.h
@@ -275,6 +275,14 @@ extern "C" {
 #define AUDIT_GET_SESSIONID	1026    /* get current process sessionid */
 #endif
 
+#ifndef AUDIT_GET_CAPCONTID
+#define AUDIT_GET_CAPCONTID	1027    /* get contid of specified pid */
+#endif
+
+#ifndef AUDIT_SET_CAPCONTID
+#define AUDIT_SET_CAPCONTID	1028    /* set contid of specified pid */
+#endif
+
 #ifndef AUDIT_MMAP
 #define AUDIT_MMAP		1323 /* Descriptor and flags in mmap */
 #endif
@@ -532,6 +540,11 @@ struct audit_message {
 // internal - forward declaration
 struct daemon_conf;
 
+struct audit_capcontid_status {
+	pid_t		pid;
+	uint32_t	cap;
+};
+
 struct audit_cont_status {
 	pid_t		pid;
 	uint64_t	id;
@@ -559,6 +572,7 @@ struct audit_reply {
 #endif
 #ifdef AUDIT_FEATURE_BITMAP_CONTAINERID
 	struct audit_cont_status	*cont;
+	struct audit_capcontid_status	*capcontid;
 #endif
 	};
 };
diff --git a/lib/msg_typetab.h b/lib/msg_typetab.h
index 9f2b137dc7f8..f510e9790ea4 100644
--- a/lib/msg_typetab.h
+++ b/lib/msg_typetab.h
@@ -50,6 +50,8 @@ _S(AUDIT_LOGIN,                      "LOGIN"                         )
 //_S(AUDIT_GET_LOGINUID,               "GET_LOGINUID"                  )
 //_S(AUDIT_SET_LOGINUID,               "SET_LOGINUID"                  )
 //_S(AUDIT_GET_SESSIONID,              "GET_SESSIONID"                 )
+//_S(AUDIT_GET_CAPCONTID,              "GET_CAPCONTID"                 )
+_S(AUDIT_SET_CAPCONTID,              "SET_CAPCONTID"                 )
 _S(AUDIT_CONTAINER_OP,               "CONTAINER_OP"                  )
 _S(AUDIT_USER_AUTH,                  "USER_AUTH"                     )
 _S(AUDIT_USER_ACCT,                  "USER_ACCT"                     )
diff --git a/lib/netlink.c b/lib/netlink.c
index d177b865a79e..d378b32e0ff6 100644
--- a/lib/netlink.c
+++ b/lib/netlink.c
@@ -154,6 +154,7 @@ static int adjust_reply(struct audit_reply *rep, int len)
 #endif
 #ifdef AUDIT_FEATURE_BITMAP_CONTAINERID
 	rep->cont     = NULL;
+	rep->capcontid = NULL;
 #endif
 	if (!NLMSG_OK(rep->nlh, (unsigned int)len)) {
 		if (len == sizeof(rep->msg)) {
@@ -201,6 +202,9 @@ static int adjust_reply(struct audit_reply *rep, int len)
 		case AUDIT_SIGNAL_INFO2:
 			rep->signal_info2 = NLMSG_DATA(rep->nlh);
 			break;
+		case AUDIT_GET_CAPCONTID:
+			rep->capcontid = NLMSG_DATA(rep->nlh);
+			break;
 		case AUDIT_GET_CONTID:
 			rep->cont = NLMSG_DATA(rep->nlh);
 			break;
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

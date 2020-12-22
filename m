Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AE07E2DFECF
	for <lists+linux-audit@lfdr.de>; Mon, 21 Dec 2020 18:14:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608570870;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3kJSCMsJCoVoEP8v2kiIPCF3Wf7NIna/opYslqzCpDg=;
	b=ifsfQsBIo2o6t1HczySIgDZwz6JNgecU5iw0CBY/YYO7HVo+t7QOMZs1r89vlXl4NooSCe
	R4xcPjyhw7sROrcTf/GphtWh2vM5nI7lp9maVs4znbfJw1CJ+zeNl27bFoxdhhnIF35/oQ
	6FRl8X93fhGIDgBbI/i9SImgVTbpDRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-U7jYDjhXMTuFjWdCskzxTA-1; Mon, 21 Dec 2020 12:14:28 -0500
X-MC-Unique: U7jYDjhXMTuFjWdCskzxTA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 979C21934109;
	Mon, 21 Dec 2020 17:14:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 770D219744;
	Mon, 21 Dec 2020 17:14:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4869B5002C;
	Mon, 21 Dec 2020 17:14:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BLHEKnT019239 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 21 Dec 2020 12:14:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B65805D9CA; Mon, 21 Dec 2020 17:14:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 300E95D9D7;
	Mon, 21 Dec 2020 17:14:19 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux Containers List <containers@lists.linux-foundation.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH ghau51/ghau40 v10 11/11] libaudit: add support to get and set
	capcontid on a task
Date: Mon, 21 Dec 2020 12:12:51 -0500
Message-Id: <20201221171251.2610890-12-rgb@redhat.com>
In-Reply-To: <20201221171251.2610890-1-rgb@redhat.com>
References: <20201221171251.2610890-1-rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, Eric Paris <eparis@parisplace.org>,
	mpatel@redhat.com, Neil Horman <nhorman@tuxdriver.com>
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
 auparse/normalize.c            |  1 +
 auparse/normalize_record_map.h |  1 +
 docs/Makefile.am               |  1 +
 docs/audit_get_capcontid.3     | 25 +++++++++++++
 docs/audit_set_capcontid.3     | 24 ++++++++++++
 lib/libaudit.c                 | 68 ++++++++++++++++++++++++++++++++++
 lib/libaudit.h                 |  4 ++
 lib/msg_typetab.h              |  1 +
 lib/netlink.c                  |  1 +
 src/ausearch-lol.c             |  2 +
 src/ausearch-parse.c           |  1 +
 11 files changed, 129 insertions(+)
 create mode 100644 docs/audit_get_capcontid.3
 create mode 100644 docs/audit_set_capcontid.3

diff --git a/auparse/normalize.c b/auparse/normalize.c
index 2d7878ce9ba9..8bcfce280d1a 100644
--- a/auparse/normalize.c
+++ b/auparse/normalize.c
@@ -911,6 +911,7 @@ static const char *normalize_determine_evkind(int type)
 		case AUDIT_FEATURE_CHANGE ... AUDIT_REPLACE:
 		case AUDIT_USER_DEVICE:
 		case AUDIT_SOFTWARE_UPDATE:
+		case AUDIT_SET_CAPCONTID:
 			kind = NORM_EVTYPE_CONFIG;
 			break;
 		case AUDIT_SECCOMP:
diff --git a/auparse/normalize_record_map.h b/auparse/normalize_record_map.h
index 1bb4c9ac6a95..cb8fc55c0e5e 100644
--- a/auparse/normalize_record_map.h
+++ b/auparse/normalize_record_map.h
@@ -26,6 +26,7 @@
 _S(AUDIT_USER, "sent-message")
 _S(AUDIT_LOGIN, "changed-login-id-to")
 _S(AUDIT_CONTAINER_OP, "changed-container-id-to")
+_S(AUDIT_SET_CAPCONTID, "set-capcontid-to")
 _S(AUDIT_USER_AUTH, "authenticated")
 _S(AUDIT_USER_ACCT, "was-authorized")
 _S(AUDIT_USER_MGMT, "modified-user-account")
diff --git a/docs/Makefile.am b/docs/Makefile.am
index 209789bb2051..6b981b296d0c 100644
--- a/docs/Makefile.am
+++ b/docs/Makefile.am
@@ -29,6 +29,7 @@ auditd.conf.5 auditd-plugins.5 \
 audit_delete_rule_data.3 audit_detect_machine.3 \
 audit_encode_nv_string.3 audit_getloginuid.3 \
 audit_get_reply.3 audit_get_session.3 audit_get_containerid.3 \
+audit_get_capcontid.3 audit_set_capcontid.3 \
 audit_log_acct_message.3 audit_log_user_avc_message.3 \
 audit_log_user_command.3 audit_log_user_comm_message.3 \
 audit_log_user_message.3 audit_log_semanage_message.3 \
diff --git a/docs/audit_get_capcontid.3 b/docs/audit_get_capcontid.3
new file mode 100644
index 000000000000..652a4960a020
--- /dev/null
+++ b/docs/audit_get_capcontid.3
@@ -0,0 +1,25 @@
+.TH "AUDIT_GET_CAPCONTID" "26" "Aug 2019" "Red Hat" "Linux Audit API"
+.SH NAME
+audit_get_capcontid \- Get a program's capability container id value
+.SH SYNOPSIS
+.B #include <libaudit.h>
+.sp
+int audit_get_capcontid(pid_t pid);
+
+.SH DESCRIPTION
+This function returns the pid task's audit capability container identifier attribute.
+
+.SH "RETURN VALUE"
+
+This function returns the audit capability container identifier value if it is implemented. It will return a \-1 if the audit capability container identifier is unavailable.
+
+.SH "ERRORS"
+
+This function returns \-2 on failure. Additionally, in the event of a real error, errno would be set. The function can set errno based on failures of open, read, or strtoull.
+
+.SH "SEE ALSO"
+
+.BR audit_set_capcontid (3).
+
+.SH AUTHOR
+Richard Guy Briggs
diff --git a/docs/audit_set_capcontid.3 b/docs/audit_set_capcontid.3
new file mode 100644
index 000000000000..70ac8c7a4e95
--- /dev/null
+++ b/docs/audit_set_capcontid.3
@@ -0,0 +1,24 @@
+.TH "AUDIT_SET_CAPCONTID" "26" "Aug 2019" "Red Hat" "Linux Audit API"
+.SH NAME
+audit_set_capcontid \- Set a program's capability container id value
+.SH SYNOPSIS
+.B #include <libaudit.h>
+.sp
+int audit_set_capcontid(pid_t pid, uint32_t capcontid);
+
+.SH "DESCRIPTION"
+
+This function sets the pid task's attribute capability container id with the value of capcontid. The capcontid value may only be set by programs with the CAP_AUDIT_CONTROL capability in the initial user namespace or with capcontid. This normally means the root account or root in a container.
+.sp
+The capcontid value is part of the task structure and is inheritted by child processes within a user namespace. It is used to enable the capability to set container identifier of a child task in a descendent user namespace.  Container orchestrator/engines should set this value only on children it wishes to be able to set audit container identifiers.
+
+.SH "RETURN VALUE"
+
+This function returns 0 on success and non-zero otherwise.
+
+.SH "SEE ALSO"
+
+.BR audit_get_capcontid (3).
+
+.SH AUTHOR
+Richard Guy Briggs
diff --git a/lib/libaudit.c b/lib/libaudit.c
index 1d5375b256c3..5f2e4348fe40 100644
--- a/lib/libaudit.c
+++ b/lib/libaudit.c
@@ -1007,6 +1007,74 @@ uint32_t audit_get_session(void)
 		return ses;
 }
 
+/*
+ * This function will retrieve the capability container identifier or -2 if
+ * there is an error.
+ */
+uint32_t audit_get_capcontid(pid_t pid)
+{
+	int capcontid;
+	int len, in;
+	char buf[16], fnbuf[48];
+
+	if ((audit_get_features() & AUDIT_FEATURE_BITMAP_CONTAINERID) == 0)
+		return -2;
+	errno = 0;
+	snprintf(fnbuf, sizeof(fnbuf), "/proc/%d/audit_capcontainerid", pid);
+	in = open(fnbuf, O_NOFOLLOW|O_RDONLY);
+	if (in < 0)
+		return -2;
+	do {
+		len = read(in, buf, sizeof(buf));
+	} while (len < 0 && errno == EINTR);
+	close(in);
+	if (len < 0 || len >= sizeof(buf))
+		return -2;
+	buf[len] = 0;
+	errno = 0;
+	capcontid = strtol(buf, 0, 10);
+	if (errno)
+		return -2;
+	return capcontid;
+}
+
+/*
+ * This function returns 0 on success and 1 on failure
+ */
+int audit_set_capcontid(pid_t pid, uint32_t capcontid)
+{
+	char capcontidbuf[16], fnbuf[48];
+	int o, count, rc = 0;
+
+	if ((audit_get_features() & AUDIT_FEATURE_BITMAP_CONTAINERID) == 0)
+		return -2;
+	errno = 0;
+	count = snprintf(capcontidbuf, sizeof(capcontidbuf), "%u", capcontid);
+	snprintf(fnbuf, sizeof(fnbuf), "/proc/%d/audit_capcontainerid", pid);
+	o = open(fnbuf, O_NOFOLLOW|O_WRONLY|O_TRUNC);
+	if (o >= 0) {
+		int block, offset = 0;
+
+		while (count > 0) {
+			block = write(o, &capcontidbuf[offset], (unsigned int)count);
+			if (block < 0) {
+				if (errno == EINTR)
+					continue;
+				audit_msg(LOG_ERR, "Error writing capcontid");
+				close(o);
+				return 1;
+			}
+			offset += block;
+			count -= block;
+		}
+		close(o);
+	} else {
+		audit_msg(LOG_ERR, "Error opening %s", fnbuf);
+		rc = 1;
+	}
+	return rc;
+}
+
 /*
  * This function will retrieve the audit container identifier or -2 if
  * there is an error.
diff --git a/lib/libaudit.h b/lib/libaudit.h
index 43dfcc884a6e..94084a1c7835 100644
--- a/lib/libaudit.h
+++ b/lib/libaudit.h
@@ -256,6 +256,10 @@ extern "C" {
 #define AUDIT_SIGNAL_INFO2	1021    /* auditd signal sender info */
 #endif
 
+#ifndef AUDIT_SET_CAPCONTID
+#define AUDIT_SET_CAPCONTID	1022    /* set capcontid of specified pid */
+#endif
+
 #ifndef AUDIT_MMAP
 #define AUDIT_MMAP		1323 /* Descriptor and flags in mmap */
 #endif
diff --git a/lib/msg_typetab.h b/lib/msg_typetab.h
index ef33278032a2..bd9fa1b59edb 100644
--- a/lib/msg_typetab.h
+++ b/lib/msg_typetab.h
@@ -46,6 +46,7 @@ _S(AUDIT_LOGIN,                      "LOGIN"                         )
 //_S(AUDIT_GET_FEATURE,                "GET_FEATURE"                   )
 //_S(AUDIT_SIGNAL_INFO2,               "SIGNAL_INFO2"                  )
 _S(AUDIT_CONTAINER_OP,               "CONTAINER_OP"                  )
+_S(AUDIT_SET_CAPCONTID,              "SET_CAPCONTID"                 )
 _S(AUDIT_USER_AUTH,                  "USER_AUTH"                     )
 _S(AUDIT_USER_ACCT,                  "USER_ACCT"                     )
 _S(AUDIT_USER_MGMT,                  "USER_MGMT"                     )
diff --git a/lib/netlink.c b/lib/netlink.c
index 1ee2a4f7db86..5f09590d1af5 100644
--- a/lib/netlink.c
+++ b/lib/netlink.c
@@ -184,6 +184,7 @@ static int adjust_reply(struct audit_reply *rep, int len)
 		case AUDIT_USER:
 		case AUDIT_LOGIN:
 		case AUDIT_CONTAINER_OP:
+		case AUDIT_SET_CAPCONTID:
 		case AUDIT_KERNEL:
 		case AUDIT_FIRST_USER_MSG...AUDIT_LAST_USER_MSG:
 		case AUDIT_FIRST_USER_MSG2...AUDIT_LAST_USER_MSG2:
diff --git a/src/ausearch-lol.c b/src/ausearch-lol.c
index 05fe80fe3ad6..8ad88a14f30c 100644
--- a/src/ausearch-lol.c
+++ b/src/ausearch-lol.c
@@ -250,6 +250,8 @@ static void check_events(lol *lo, time_t sec)
 				   (cur->l->e.type >  AUDIT_LOGIN           &&
 				    cur->l->e.type <  AUDIT_CONTAINER_OP   ) ||
 				   (cur->l->e.type >  AUDIT_CONTAINER_OP    &&
+				    cur->l->e.type <  AUDIT_SET_CAPCONTID  ) ||
+				   (cur->l->e.type >  AUDIT_SET_CAPCONTID   &&
 				    cur->l->e.type <  AUDIT_FIRST_EVENT    ) ||
 				    cur->l->e.type == AUDIT_PROCTITLE        ||
 				   (cur->l->e.type >= AUDIT_MAC_UNLBL_ALLOW &&
diff --git a/src/ausearch-parse.c b/src/ausearch-parse.c
index 93482be3606e..9d8a5dd2d092 100644
--- a/src/ausearch-parse.c
+++ b/src/ausearch-parse.c
@@ -192,6 +192,7 @@ int extract_search_items(llist *l)
 			case AUDIT_MMAP:
 			case AUDIT_PROCTITLE:
 			case AUDIT_REPLACE...AUDIT_BPF:
+			case AUDIT_SET_CAPCONTID:
 				// Nothing to parse
 				break;
 			case AUDIT_NETFILTER_CFG:
-- 
2.18.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


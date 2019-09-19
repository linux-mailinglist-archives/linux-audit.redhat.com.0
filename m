Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E47B70D6
	for <lists+linux-audit@lfdr.de>; Thu, 19 Sep 2019 03:27:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4588530A76BE;
	Thu, 19 Sep 2019 01:27:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 212275DA60;
	Thu, 19 Sep 2019 01:27:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8A8E180B761;
	Thu, 19 Sep 2019 01:27:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8J1R1mu010650 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Sep 2019 21:27:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9745460C5E; Thu, 19 Sep 2019 01:27:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB07260F88;
	Thu, 19 Sep 2019 01:26:56 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org, linux-api@vger.kernel.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	linux-fsdevel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak90 V7 17/21] audit: add support for loginuid/sessionid
	set/get by netlink
Date: Wed, 18 Sep 2019 21:22:34 -0400
Message-Id: <6cef16c2a019e61e49f4d62497b5ca8dab79b45f.1568834525.git.rgb@redhat.com>
In-Reply-To: <cover.1568834524.git.rgb@redhat.com>
References: <cover.1568834524.git.rgb@redhat.com>
In-Reply-To: <cover.1568834524.git.rgb@redhat.com>
References: <cover.1568834524.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	dhowells@redhat.com, ebiederm@xmission.com, simo@redhat.com,
	eparis@parisplace.org, mpatel@redhat.com, serge@hallyn.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Thu, 19 Sep 2019 01:27:06 +0000 (UTC)

Add the ability to get and set the login uid and to get the session id
using an audit netlink message using message types AUDIT_GET_LOGINUID
1024, AUDIT_SET_LOGINUID 1025 and AUDIT_GET_SESSIONID 1026 in addition
to using the proc filesystem.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 include/uapi/linux/audit.h |  3 +++
 kernel/audit.c             | 62 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index e26729fc9943..eef42c8eea77 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -75,6 +75,9 @@
 #define AUDIT_SIGNAL_INFO2	1021	/* Get info auditd signal sender */
 #define AUDIT_GET_CONTID	1022	/* Get contid of a task */
 #define AUDIT_SET_CONTID	1023	/* Set contid of a task */
+#define AUDIT_GET_LOGINUID	1024	/* Get loginuid of a task */
+#define AUDIT_SET_LOGINUID	1025	/* Set loginuid of a task */
+#define AUDIT_GET_SESSIONID	1026	/* Set sessionid of a task */
 
 #define AUDIT_FIRST_USER_MSG	1100	/* Userspace messages mostly uninteresting to kernel */
 #define AUDIT_USER_AVC		1107	/* We filter this differently */
diff --git a/kernel/audit.c b/kernel/audit.c
index df92de20ed73..9e82de13d2eb 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1184,6 +1184,15 @@ static int audit_netlink_ok(struct sk_buff *skb, u16 msg_type)
 {
 	int err = 0;
 
+	/* These messages can work outside the initial namespaces */
+	switch (msg_type) {
+	case AUDIT_GET_LOGINUID:
+	case AUDIT_GET_SESSIONID:
+		return 0;
+		break;
+	default:  /* do more checks below */
+		break;
+	}
 	/* Only support initial user namespace for now. */
 	/*
 	 * We return ECONNREFUSED because it tricks userspace into thinking
@@ -1218,6 +1227,7 @@ static int audit_netlink_ok(struct sk_buff *skb, u16 msg_type)
 	case AUDIT_MAKE_EQUIV:
 	case AUDIT_GET_CONTID:
 	case AUDIT_SET_CONTID:
+	case AUDIT_SET_LOGINUID:
 		/* Only support auditd and auditctl in initial pid namespace
 		 * for now. */
 		if (task_active_pid_ns(current) != &init_pid_ns)
@@ -1292,6 +1302,33 @@ static int audit_get_contid_status(struct sk_buff *skb)
 	return 0;
 }
 
+struct audit_loginuid_status { uid_t loginuid; };
+
+static int audit_get_loginuid_status(struct sk_buff *skb)
+{
+	u32 seq;
+	uid_t loginuid;
+	struct audit_loginuid_status ls;
+
+	loginuid = from_kuid(current_user_ns(), audit_get_loginuid(current));
+	ls.loginuid = loginuid;
+
+	seq = nlmsg_hdr(skb)->nlmsg_seq;
+	audit_send_reply(skb, seq, AUDIT_GET_LOGINUID, 0, 0, &ls, sizeof(ls));
+	return loginuid;
+}
+
+static int audit_get_sessionid_status(struct sk_buff *skb)
+{
+	u32 seq;
+	struct audit_sessionid_status { u32 sessionid; };
+	struct audit_sessionid_status ss = { audit_get_sessionid(current) };
+
+	seq = nlmsg_hdr(skb)->nlmsg_seq;
+	audit_send_reply(skb, seq, AUDIT_GET_SESSIONID, 0, 0, &ss, sizeof(ss));
+	return audit_get_sessionid(current);
+}
+
 static void audit_log_feature_change(int which, u32 old_feature, u32 new_feature,
 				     u32 old_lock, u32 new_lock, int res)
 {
@@ -1740,6 +1777,31 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 		if (err)
 			return err;
 		break;
+	case AUDIT_SET_LOGINUID: {
+		uid_t *loginuid = data;
+		kuid_t kloginuid;
+
+		/* check if new data is valid */
+		if (nlmsg_len(nlh) < sizeof(u32))
+			return -EINVAL;
+
+		kloginuid = make_kuid(current_user_ns(), *loginuid);
+                if (!uid_valid(kloginuid))
+                        return -EINVAL;
+
+		return audit_set_loginuid(kloginuid);
+		break;
+	}
+	case AUDIT_GET_LOGINUID:
+		err = audit_get_loginuid_status(skb);
+		if (err)
+			return err;
+		break;
+	case AUDIT_GET_SESSIONID:
+		err = audit_get_sessionid_status(skb);
+		if (err)
+			return err;
+		break;
 	default:
 		err = -EINVAL;
 		break;
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

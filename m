Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6929FB709E
	for <lists+linux-audit@lfdr.de>; Thu, 19 Sep 2019 03:25:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95C3E796ED;
	Thu, 19 Sep 2019 01:25:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D3B152C3;
	Thu, 19 Sep 2019 01:25:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E1C31803B47;
	Thu, 19 Sep 2019 01:25:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8J1P3jp010259 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Sep 2019 21:25:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A4C2860F9E; Thu, 19 Sep 2019 01:25:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C6F860C18;
	Thu, 19 Sep 2019 01:24:41 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org, linux-api@vger.kernel.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	linux-fsdevel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak90 V7 08/21] audit: add contid support for signalling the
	audit daemon
Date: Wed, 18 Sep 2019 21:22:25 -0400
Message-Id: <0850eaa785e2ff30c8c4818fd53e9544b34ed884.1568834524.git.rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Thu, 19 Sep 2019 01:25:24 +0000 (UTC)

Add audit container identifier support to the action of signalling the
audit daemon.

Since this would need to add an element to the audit_sig_info struct,
a new record type AUDIT_SIGNAL_INFO2 was created with a new
audit_sig_info2 struct.  Corresponding support is required in the
userspace code to reflect the new record request and reply type.
An older userspace won't break since it won't know to request this
record type.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 include/linux/audit.h       |  7 +++++++
 include/uapi/linux/audit.h  |  1 +
 kernel/audit.c              | 28 ++++++++++++++++++++++++++++
 kernel/audit.h              |  1 +
 security/selinux/nlmsgtab.c |  1 +
 5 files changed, 38 insertions(+)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 0c18d8e30620..7b640c4da4ee 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -23,6 +23,13 @@ struct audit_sig_info {
 	char		ctx[0];
 };
 
+struct audit_sig_info2 {
+	uid_t		uid;
+	pid_t		pid;
+	u64		cid;
+	char		ctx[0];
+};
+
 struct audit_buffer;
 struct audit_context;
 struct inode;
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 4ed080f28b47..693ec6e0288b 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -72,6 +72,7 @@
 #define AUDIT_SET_FEATURE	1018	/* Turn an audit feature on or off */
 #define AUDIT_GET_FEATURE	1019	/* Get which features are enabled */
 #define AUDIT_CONTAINER_OP	1020	/* Define the container id and info */
+#define AUDIT_SIGNAL_INFO2	1021	/* Get info auditd signal sender */
 
 #define AUDIT_FIRST_USER_MSG	1100	/* Userspace messages mostly uninteresting to kernel */
 #define AUDIT_USER_AVC		1107	/* We filter this differently */
diff --git a/kernel/audit.c b/kernel/audit.c
index adfb3e6a7f0c..df3db29f5a8a 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -125,6 +125,7 @@ struct audit_net {
 kuid_t		audit_sig_uid = INVALID_UID;
 pid_t		audit_sig_pid = -1;
 u32		audit_sig_sid = 0;
+u64		audit_sig_cid = AUDIT_CID_UNSET;
 
 /* Records can be lost in several ways:
    0) [suppressed in audit_alloc]
@@ -1094,6 +1095,7 @@ static int audit_netlink_ok(struct sk_buff *skb, u16 msg_type)
 	case AUDIT_ADD_RULE:
 	case AUDIT_DEL_RULE:
 	case AUDIT_SIGNAL_INFO:
+	case AUDIT_SIGNAL_INFO2:
 	case AUDIT_TTY_GET:
 	case AUDIT_TTY_SET:
 	case AUDIT_TRIM:
@@ -1257,6 +1259,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 	struct audit_buffer	*ab;
 	u16			msg_type = nlh->nlmsg_type;
 	struct audit_sig_info   *sig_data;
+	struct audit_sig_info2  *sig_data2;
 	char			*ctx = NULL;
 	u32			len;
 
@@ -1516,6 +1519,30 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 				 sig_data, sizeof(*sig_data) + len);
 		kfree(sig_data);
 		break;
+	case AUDIT_SIGNAL_INFO2:
+		len = 0;
+		if (audit_sig_sid) {
+			err = security_secid_to_secctx(audit_sig_sid, &ctx, &len);
+			if (err)
+				return err;
+		}
+		sig_data2 = kmalloc(sizeof(*sig_data2) + len, GFP_KERNEL);
+		if (!sig_data2) {
+			if (audit_sig_sid)
+				security_release_secctx(ctx, len);
+			return -ENOMEM;
+		}
+		sig_data2->uid = from_kuid(&init_user_ns, audit_sig_uid);
+		sig_data2->pid = audit_sig_pid;
+		if (audit_sig_sid) {
+			memcpy(sig_data2->ctx, ctx, len);
+			security_release_secctx(ctx, len);
+		}
+		sig_data2->cid = audit_sig_cid;
+		audit_send_reply(skb, seq, AUDIT_SIGNAL_INFO2, 0, 0,
+				 sig_data2, sizeof(*sig_data2) + len);
+		kfree(sig_data2);
+		break;
 	case AUDIT_TTY_GET: {
 		struct audit_tty_status s;
 		unsigned int t;
@@ -2384,6 +2411,7 @@ int audit_signal_info(int sig, struct task_struct *t)
 		else
 			audit_sig_uid = uid;
 		security_task_getsecid(current, &audit_sig_sid);
+		audit_sig_cid = audit_get_contid(current);
 	}
 
 	return audit_signal_info_syscall(t);
diff --git a/kernel/audit.h b/kernel/audit.h
index 543f1334ba47..c9a118716ced 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -350,6 +350,7 @@ static inline int audit_signal_info_syscall(struct task_struct *t)
 extern pid_t audit_sig_pid;
 extern kuid_t audit_sig_uid;
 extern u32 audit_sig_sid;
+extern u64 audit_sig_cid;
 
 extern int audit_filter(int msgtype, unsigned int listtype);
 
diff --git a/security/selinux/nlmsgtab.c b/security/selinux/nlmsgtab.c
index 58345ba0528e..bf21979e7737 100644
--- a/security/selinux/nlmsgtab.c
+++ b/security/selinux/nlmsgtab.c
@@ -132,6 +132,7 @@ struct nlmsg_perm {
 	{ AUDIT_DEL_RULE,	NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
 	{ AUDIT_USER,		NETLINK_AUDIT_SOCKET__NLMSG_RELAY    },
 	{ AUDIT_SIGNAL_INFO,	NETLINK_AUDIT_SOCKET__NLMSG_READ     },
+	{ AUDIT_SIGNAL_INFO2,	NETLINK_AUDIT_SOCKET__NLMSG_READ     },
 	{ AUDIT_TRIM,		NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
 	{ AUDIT_MAKE_EQUIV,	NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
 	{ AUDIT_TTY_GET,	NETLINK_AUDIT_SOCKET__NLMSG_READ     },
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 68B4120C18B
	for <lists+linux-audit@lfdr.de>; Sat, 27 Jun 2020 15:22:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593264168;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=NChPaA6OJNHt2HETIvKC6acSbvsuDJJygEtbiO95Ca8=;
	b=S2s5VIJhOz/IW4YnzrZirgdRcvavrzf/qc+moAcgVAkvF/ixLmxIHeSXYk/46PNV137TmB
	Q0csM7so3SYVWKcC6bUL9yqmiTieAJQ6VczYjiEpCS2EcER7Y7rQ3cl5AuswfLlWCBCami
	EwmUJR+UBPLSeZMJxswodKHksCrr5SA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-xkTbtBotNAWlEmStafGzRg-1; Sat, 27 Jun 2020 09:22:45 -0400
X-MC-Unique: xkTbtBotNAWlEmStafGzRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 148058064AA;
	Sat, 27 Jun 2020 13:22:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBF33121E24;
	Sat, 27 Jun 2020 13:22:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1DA587865;
	Sat, 27 Jun 2020 13:22:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05RDMVDK007312 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 09:22:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CD0AA7932A; Sat, 27 Jun 2020 13:22:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E66548205F;
	Sat, 27 Jun 2020 13:22:26 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org, linux-api@vger.kernel.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	linux-fsdevel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak90 V9 06/13] audit: add contid support for signalling the
	audit daemon
Date: Sat, 27 Jun 2020 09:20:39 -0400
Message-Id: <f01f38dbb3190191e5914874322342700aecb9e1.1593198710.git.rgb@redhat.com>
In-Reply-To: <cover.1593198710.git.rgb@redhat.com>
References: <cover.1593198710.git.rgb@redhat.com>
In-Reply-To: <cover.1593198710.git.rgb@redhat.com>
References: <cover.1593198710.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

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
 include/linux/audit.h       |  8 ++++
 include/uapi/linux/audit.h  |  1 +
 kernel/audit.c              | 95 ++++++++++++++++++++++++++++++++++++++++++++-
 security/selinux/nlmsgtab.c |  1 +
 4 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 5eeba0efffc2..89cf7c66abe6 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -22,6 +22,13 @@ struct audit_sig_info {
 	char		ctx[];
 };
 
+struct audit_sig_info2 {
+	uid_t		uid;
+	pid_t		pid;
+	u32		cid_len;
+	char		data[];
+};
+
 struct audit_buffer;
 struct audit_context;
 struct inode;
@@ -105,6 +112,7 @@ struct audit_contobj {
 	u64			id;
 	struct task_struct	*owner;
 	refcount_t		refcount;
+	refcount_t		sigflag;
 	struct rcu_head         rcu;
 };
 
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index fd98460c983f..a56ad77069b9 100644
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
index a09f8f661234..54dd2cb69402 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -126,6 +126,8 @@ struct auditd_connection {
 kuid_t		audit_sig_uid = INVALID_UID;
 pid_t		audit_sig_pid = -1;
 u32		audit_sig_sid = 0;
+static struct audit_contobj *audit_sig_cid;
+static struct task_struct *audit_sig_atsk;
 
 /* Records can be lost in several ways:
    0) [suppressed in audit_alloc]
@@ -239,7 +241,33 @@ void _audit_contobj_put(struct audit_contobj *cont)
 {
 	if (!cont)
 		return;
-	if (refcount_dec_and_test(&cont->refcount)) {
+	if (refcount_dec_and_test(&cont->refcount) && !refcount_read(&cont->sigflag)) {
+		put_task_struct(cont->owner);
+		list_del_rcu(&cont->list);
+		kfree_rcu(cont, rcu);
+	}
+}
+
+/* rcu_read_lock must be held by caller unless new */
+static struct audit_contobj *_audit_contobj_get_sig(struct task_struct *tsk)
+{
+	struct audit_contobj *cont;
+
+	if (!tsk->audit)
+		return NULL;
+	cont = tsk->audit->cont;
+	if (cont)
+		refcount_set(&cont->sigflag, 1);
+	return cont;
+}
+
+/* rcu_read_lock must be held by caller */
+static void _audit_contobj_put_sig(struct audit_contobj *cont)
+{
+	if (!cont)
+		return;
+	refcount_set(&cont->sigflag, 0);
+	if (!refcount_read(&cont->refcount)) {
 		put_task_struct(cont->owner);
 		list_del_rcu(&cont->list);
 		kfree_rcu(cont, rcu);
@@ -309,6 +337,13 @@ void audit_free(struct task_struct *tsk)
 	info = tsk->audit;
 	tsk->audit = NULL;
 	kmem_cache_free(audit_task_cache, info);
+	rcu_read_lock();
+	if (audit_sig_atsk == tsk) {
+		_audit_contobj_put_sig(audit_sig_cid);
+		audit_sig_cid = NULL;
+		audit_sig_atsk = NULL;
+	}
+	rcu_read_unlock();
 }
 
 /**
@@ -1132,6 +1167,7 @@ static int audit_netlink_ok(struct sk_buff *skb, u16 msg_type)
 	case AUDIT_ADD_RULE:
 	case AUDIT_DEL_RULE:
 	case AUDIT_SIGNAL_INFO:
+	case AUDIT_SIGNAL_INFO2:
 	case AUDIT_TTY_GET:
 	case AUDIT_TTY_SET:
 	case AUDIT_TRIM:
@@ -1294,6 +1330,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 	struct audit_buffer	*ab;
 	u16			msg_type = nlh->nlmsg_type;
 	struct audit_sig_info   *sig_data;
+	struct audit_sig_info2  *sig_data2;
 	char			*ctx = NULL;
 	u32			len;
 
@@ -1559,6 +1596,52 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 				 sig_data, sizeof(*sig_data) + len);
 		kfree(sig_data);
 		break;
+	case AUDIT_SIGNAL_INFO2: {
+		unsigned int contidstrlen = 0;
+
+		len = 0;
+		if (audit_sig_sid) {
+			err = security_secid_to_secctx(audit_sig_sid, &ctx,
+						       &len);
+			if (err)
+				return err;
+		}
+		if (audit_sig_cid) {
+			contidstr = kmalloc(21, GFP_KERNEL);
+			if (!contidstr) {
+				if (audit_sig_sid)
+					security_release_secctx(ctx, len);
+				return -ENOMEM;
+			}
+			contidstrlen = scnprintf(contidstr, 20, "%llu", audit_sig_cid->id);
+		}
+		sig_data2 = kmalloc(sizeof(*sig_data2) + contidstrlen + len, GFP_KERNEL);
+		if (!sig_data2) {
+			if (audit_sig_sid)
+				security_release_secctx(ctx, len);
+			kfree(contidstr);
+			return -ENOMEM;
+		}
+		sig_data2->uid = from_kuid(&init_user_ns, audit_sig_uid);
+		sig_data2->pid = audit_sig_pid;
+		if (audit_sig_cid) {
+			memcpy(sig_data2->data, contidstr, contidstrlen);
+			sig_data2->cid_len = contidstrlen;
+			kfree(contidstr);
+		}
+		if (audit_sig_sid) {
+			memcpy(sig_data2->data + contidstrlen, ctx, len);
+			security_release_secctx(ctx, len);
+		}
+		rcu_read_lock();
+		_audit_contobj_put_sig(audit_sig_cid);
+		rcu_read_unlock();
+		audit_sig_cid = NULL;
+		audit_send_reply(skb, seq, AUDIT_SIGNAL_INFO2, 0, 0,
+				 sig_data2, sizeof(*sig_data2) + contidstrlen + len);
+		kfree(sig_data2);
+		break;
+	}
 	case AUDIT_TTY_GET: {
 		struct audit_tty_status s;
 		unsigned int t;
@@ -2470,6 +2553,11 @@ int audit_signal_info(int sig, struct task_struct *t)
 		else
 			audit_sig_uid = uid;
 		security_task_getsecid(current, &audit_sig_sid);
+		rcu_read_lock();
+		_audit_contobj_put_sig(audit_sig_cid);
+		audit_sig_cid = _audit_contobj_get_sig(current);
+		rcu_read_unlock();
+		audit_sig_atsk = t;
 	}
 
 	return audit_signal_info_syscall(t);
@@ -2532,6 +2620,11 @@ int audit_set_contid(struct task_struct *task, u64 contid)
 			if (cont->id == contid) {
 				/* task injection to existing container */
 				if (current == cont->owner) {
+					if (!refcount_read(&cont->refcount)) {
+						rc = -ESHUTDOWN;
+						spin_unlock(&audit_contobj_list_lock);
+						goto conterror;
+					}
 					_audit_contobj_hold(cont);
 					newcont = cont;
 				} else {
diff --git a/security/selinux/nlmsgtab.c b/security/selinux/nlmsgtab.c
index b69231918686..8303bb7a63d0 100644
--- a/security/selinux/nlmsgtab.c
+++ b/security/selinux/nlmsgtab.c
@@ -137,6 +137,7 @@ struct nlmsg_perm {
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


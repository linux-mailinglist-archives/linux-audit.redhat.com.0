Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 16DA72DFE42
	for <lists+linux-audit@lfdr.de>; Mon, 21 Dec 2020 17:57:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608569840;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yccs9Uu0ubvOtCE/mYCaewza45HWgJxyRO9Z5nrQa6s=;
	b=HfRHi8K+MHAH7xQL1B/HKd+QF6Sta0LdmCoO2DbJaJAH7wdanS3juG++WIJoX/FgI2eH5K
	Tiz0+e08naYztYGTJ+W1aXCIvsstvgO2d9yN26ighMw2gOJ9DLAD34/jMtMTDdpob6a79w
	UE+NxZZcp8imCg35kBd3yYpBGfzU1Ug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-yqrnYBLxNkihMN85pKZeGg-1; Mon, 21 Dec 2020 11:57:17 -0500
X-MC-Unique: yqrnYBLxNkihMN85pKZeGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D6F4100A642;
	Mon, 21 Dec 2020 16:57:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19ABA19744;
	Mon, 21 Dec 2020 16:57:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA1124BB40;
	Mon, 21 Dec 2020 16:57:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BLGv9qI016769 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 21 Dec 2020 11:57:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A531060C64; Mon, 21 Dec 2020 16:57:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3877B60C0F;
	Mon, 21 Dec 2020 16:57:04 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux Containers List <containers@lists.linux-foundation.org>,
	Linux API <linux-api@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	Linux FSdevel <linux-fsdevel@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux NetDev Upstream Mailing List <netdev@vger.kernel.org>,
	Netfilter Devel List <netfilter-devel@vger.kernel.org>
Subject: [PATCH ghak90 v10 04/11] audit: add contid support for signalling the
	audit daemon
Date: Mon, 21 Dec 2020 11:55:38 -0500
Message-Id: <5a1852e60919a4a95a79f55d4d51403165113b90.1608225886.git.rgb@redhat.com>
In-Reply-To: <cover.1608225886.git.rgb@redhat.com>
References: <cover.1608225886.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Neil Horman <nhorman@tuxdriver.com>,
	Richard Guy Briggs <rgb@redhat.com>, David Howells <dhowells@redhat.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Simo Sorce <simo@redhat.com>, Eric Paris <eparis@parisplace.org>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	mpatel@redhat.com, Serge Hallyn <serge@hallyn.com>
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
 include/linux/audit.h       |   7 +++
 include/uapi/linux/audit.h  |   1 +
 kernel/audit.c              | 116 ++++++++++++++++++++++++++++++++++--
 security/selinux/nlmsgtab.c |   1 +
 4 files changed, 120 insertions(+), 5 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 30c55e6b6a3c..7c1928e75cfe 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -23,6 +23,13 @@ struct audit_sig_info {
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
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index c56335e828dc..94dcf3085658 100644
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
index 0f97fc24a76a..1c2045c48baf 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -123,9 +123,11 @@ static u32	audit_backlog_limit = 64;
 static u32	audit_backlog_wait_time = AUDIT_BACKLOG_WAIT_TIME;
 
 /* The identity of the user shutting down the audit system. */
-static kuid_t		audit_sig_uid = INVALID_UID;
-static pid_t		audit_sig_pid = -1;
-static u32		audit_sig_sid;
+static kuid_t			audit_sig_uid = INVALID_UID;
+static pid_t			audit_sig_pid = -1;
+static u32			audit_sig_sid;
+static struct audit_contobj	*audit_sig_cid;
+static struct task_struct	*audit_sig_adtsk;
 
 /* Records can be lost in several ways:
    0) [suppressed in audit_alloc]
@@ -222,6 +224,7 @@ struct audit_contobj {
 	u64			id;
 	struct task_struct	*owner;
 	refcount_t		refcount;
+	refcount_t		sigflag;
 	struct rcu_head         rcu;
 };
 
@@ -330,6 +333,35 @@ static void _audit_contobj_put(struct audit_contobj *cont)
 	if (!cont)
 		return;
 	if (refcount_dec_and_test(&cont->refcount)) {
+		if (!refcount_read(&cont->sigflag)) {
+			put_task_struct(cont->owner);
+			list_del_rcu(&cont->list);
+			kfree_rcu(cont, rcu);
+		}
+	}
+}
+
+/* rcu_read_lock must be held by caller unless new */
+static struct audit_contobj *_audit_contobj_get_sig_bytask(struct task_struct *tsk)
+{
+	struct audit_contobj *cont;
+	struct audit_task_info *info = tsk->audit;
+
+	if (!info)
+		return NULL;
+	cont = info->cont;
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
@@ -430,6 +462,15 @@ void audit_free(struct task_struct *tsk)
 	 */
 	tsk->audit = NULL;
 	kmem_cache_free(audit_task_cache, info);
+	rcu_read_lock();
+	if (audit_sig_adtsk == tsk) {
+		spin_lock(&_audit_contobj_list_lock);
+		_audit_contobj_put_sig(audit_sig_cid);
+		spin_unlock(&_audit_contobj_list_lock);
+		audit_sig_cid = NULL;
+		audit_sig_adtsk = NULL;
+	}
+	rcu_read_unlock();
 }
 
 /**
@@ -1252,6 +1293,7 @@ static int audit_netlink_ok(struct sk_buff *skb, u16 msg_type)
 	case AUDIT_ADD_RULE:
 	case AUDIT_DEL_RULE:
 	case AUDIT_SIGNAL_INFO:
+	case AUDIT_SIGNAL_INFO2:
 	case AUDIT_TTY_GET:
 	case AUDIT_TTY_SET:
 	case AUDIT_TRIM:
@@ -1414,6 +1456,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 	struct audit_buffer	*ab;
 	u16			msg_type = nlh->nlmsg_type;
 	struct audit_sig_info   *sig_data;
+	struct audit_sig_info2  *sig_data2;
 	char			*ctx = NULL;
 	u32			len;
 
@@ -1685,7 +1728,58 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 		audit_send_reply(skb, seq, AUDIT_SIGNAL_INFO, 0, 0,
 				 sig_data, sizeof(*sig_data) + len);
 		kfree(sig_data);
+		spin_lock(&_audit_contobj_list_lock);
+		_audit_contobj_put_sig(audit_sig_cid);
+		spin_unlock(&_audit_contobj_list_lock);
+		audit_sig_cid = NULL;
 		break;
+	case AUDIT_SIGNAL_INFO2: {
+		char *contidstr = NULL;
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
+		spin_lock(&_audit_contobj_list_lock);
+		_audit_contobj_put_sig(audit_sig_cid);
+		spin_unlock(&_audit_contobj_list_lock);
+		audit_sig_cid = NULL;
+		audit_send_reply(skb, seq, AUDIT_SIGNAL_INFO2, 0, 0,
+				 sig_data2, sizeof(*sig_data2) + contidstrlen + len);
+		kfree(sig_data2);
+		break;
+	}
 	case AUDIT_TTY_GET: {
 		struct audit_tty_status s;
 		unsigned int t;
@@ -2630,11 +2724,11 @@ int audit_set_loginuid(kuid_t loginuid)
  */
 int audit_signal_info(int sig, struct task_struct *t)
 {
-	kuid_t uid = current_uid(), auid;
-
 	if (auditd_test_task(t) &&
 	    (sig == SIGTERM || sig == SIGHUP ||
 	     sig == SIGUSR1 || sig == SIGUSR2)) {
+		kuid_t uid = current_uid(), auid;
+
 		audit_sig_pid = task_tgid_nr(current);
 		auid = audit_get_loginuid(current);
 		if (uid_valid(auid))
@@ -2642,6 +2736,13 @@ int audit_signal_info(int sig, struct task_struct *t)
 		else
 			audit_sig_uid = uid;
 		security_task_getsecid(current, &audit_sig_sid);
+		spin_lock(&_audit_contobj_list_lock);
+		_audit_contobj_put_sig(audit_sig_cid);
+		spin_unlock(&_audit_contobj_list_lock);
+		rcu_read_lock();
+		audit_sig_cid = _audit_contobj_get_sig_bytask(current);
+		rcu_read_unlock();
+		audit_sig_adtsk = t;
 	}
 
 	return audit_signal_info_syscall(t);
@@ -2700,6 +2801,11 @@ int audit_set_contid(struct task_struct *tsk, u64 contid)
 		if (cont->id == contid) {
 			/* task injection to existing container */
 			if (current == cont->owner) {
+				if (!refcount_read(&cont->refcount)) {
+					rc = -ENOTUNIQ;
+					spin_unlock(&_audit_contobj_list_lock);
+					goto error;
+				}
 				_audit_contobj_get(cont);
 				newcont = cont;
 			} else {
diff --git a/security/selinux/nlmsgtab.c b/security/selinux/nlmsgtab.c
index b69231918686..8303bb7a63d0 100644
--- a/security/selinux/nlmsgtab.c
+++ b/security/selinux/nlmsgtab.c
@@ -137,6 +137,7 @@ static const struct nlmsg_perm nlmsg_audit_perms[] =
 	{ AUDIT_DEL_RULE,	NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
 	{ AUDIT_USER,		NETLINK_AUDIT_SOCKET__NLMSG_RELAY    },
 	{ AUDIT_SIGNAL_INFO,	NETLINK_AUDIT_SOCKET__NLMSG_READ     },
+	{ AUDIT_SIGNAL_INFO2,	NETLINK_AUDIT_SOCKET__NLMSG_READ     },
 	{ AUDIT_TRIM,		NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
 	{ AUDIT_MAKE_EQUIV,	NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
 	{ AUDIT_TTY_GET,	NETLINK_AUDIT_SOCKET__NLMSG_READ     },
-- 
2.18.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


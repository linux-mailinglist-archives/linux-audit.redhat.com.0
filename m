Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4522F33B5
	for <lists+linux-audit@lfdr.de>; Tue, 12 Jan 2021 16:12:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610464325;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7wCMYo+YEOKjyh5ju72GBzpreHpsZflWNnzapbYFpQI=;
	b=TstYhxYgPofZsreTwPRotjh6xFVhg91ZgeogLbZwacfAULB63/QJXWrK1N9YVV5GJBbid1
	pbJ5K2c1WB+ixvLnWV/5snQYyR4PGaaZHpYE+tPyCJ4+Z4RDxksyZu6Q9To4WZEcdrsut0
	oHxooqWnk0uq219pH6tjlvmeNvD15N0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-PMNvEOL2OC2Z-aG-5CzUaw-1; Tue, 12 Jan 2021 10:12:02 -0500
X-MC-Unique: PMNvEOL2OC2Z-aG-5CzUaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BB9CEC1A2;
	Tue, 12 Jan 2021 15:11:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA1B01975E;
	Tue, 12 Jan 2021 15:11:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B366D5002D;
	Tue, 12 Jan 2021 15:11:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10CFBtWS007541 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 12 Jan 2021 10:11:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 76B8F5D9F4; Tue, 12 Jan 2021 15:11:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF6765D9CD;
	Tue, 12 Jan 2021 15:11:51 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux Containers List <containers@lists.linux-foundation.org>,
	Linux API <linux-api@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	Linux FSdevel <linux-fsdevel@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux NetDev Upstream Mailing List <netdev@vger.kernel.org>,
	Netfilter Devel List <netfilter-devel@vger.kernel.org>
Subject: [PATCH ghak90 v11 10/11] audit: track container nesting
Date: Tue, 12 Jan 2021 10:09:38 -0500
Message-Id: <b7213e1b224ce2b7073bba90bc86edd02737921b.1610399347.git.rgb@redhat.com>
In-Reply-To: <cover.1610399347.git.rgb@redhat.com>
References: <cover.1610399347.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Track the parent container of a container to be able to filter and
report nesting.

Now that we have a way to track and check the parent container of a
container, modify the contid field format to be able to report that
nesting using a carrat ("^") modifier to indicate nesting.  The
original field format was "contid=<contid>" for task-associated records
and "contid=<contid>[,<contid>[...]]" for network-namespace-associated
records.  The new field format is
"contid=<contid>[,^<contid>[...]][,<contid>[...]]".

For task event example, an orchestrator in contid 1 spawns tasks in contid
2 and contid 3, then the task in contid 2 spawns a task in contid 4.  An
event happens in the task in contid 4:
    type=SYSCALL ...
    type=CONTAINER_ID msg=audit(<date.time>:<serno>): contid=4,^2,^1

For a network namespace event example, an orchestrator in contid 1 in
network namespace A spawns peer tasks 2 and 3 in network namespace B.  An
event happens in network namespace B:
    type=NETFILTER_PKT ...
    type=CONTAINER_ID msg=audit(<date.time>:<serno>): contid=2,^1,3,^1

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 kernel/audit.c | 75 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 62 insertions(+), 13 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index fcb78a6d8e4a..d2e9d803e5fd 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -231,6 +231,7 @@ struct audit_contobj {
 	refcount_t		refcount;
 	refcount_t		sigcount;
 	struct rcu_head         rcu;
+	struct audit_contobj	*parent;
 };
 
 struct audit_task_info {
@@ -253,6 +254,7 @@ struct audit_contobj_netns {
 
 static void audit_netns_contid_add(struct net *net, struct audit_contobj *cont);
 static void audit_netns_contid_del(struct net *net, struct audit_contobj *cont);
+static void audit_log_contid(struct audit_buffer *ab, struct audit_contobj *cont);
 
 void __init audit_task_init(void)
 {
@@ -378,6 +380,7 @@ static void _audit_contobj_put_sig(struct audit_contobj *cont)
 	if (refcount_dec_and_test(&cont->sigcount)) {
 		if (!refcount_read(&cont->refcount)) {
 			put_task_struct(cont->owner);
+			_audit_contobj_put(cont->parent);
 			list_del_rcu(&cont->list);
 			kfree_rcu(cont, rcu);
 		}
@@ -722,11 +725,11 @@ int audit_log_netns_contid_list(struct net *net, struct audit_context *context)
 				audit_log_lost("out of memory in audit_log_netns_contid_list");
 				goto out;
 			}
-			audit_log_format(ab, "record=1 contid=%llu",
-					 cont->obj->id);
+			audit_log_format(ab, "record=1 contid=");
 		} else {
-			audit_log_format(ab, ",%llu", cont->obj->id);
+			audit_log_format(ab, ",");
 		}
+		audit_log_contid(ab, cont->obj);
 	}
 	audit_log_end(ab);
 out:
@@ -1906,6 +1909,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 	case AUDIT_SIGNAL_INFO2: {
 		char *contidstr = NULL;
 		unsigned int contidstrlen = 0;
+		struct audit_contobj *cont = audit_sig_cid;
 
 		len = 0;
 		if (audit_sig_sid) {
@@ -1915,13 +1919,27 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 				return err;
 		}
 		if (audit_sig_cid) {
-			contidstr = kmalloc(21, GFP_KERNEL);
+			contidstr = kmalloc(AUDIT_MESSAGE_TEXT_MAX, GFP_KERNEL);
 			if (!contidstr) {
 				if (audit_sig_sid)
 					security_release_secctx(ctx, len);
 				return -ENOMEM;
 			}
-			contidstrlen = scnprintf(contidstr, 20, "%llu", audit_sig_cid->id);
+			rcu_read_lock();
+			while (cont) {
+				if (cont->parent)
+					contidstrlen += scnprintf(contidstr,
+								  AUDIT_MESSAGE_TEXT_MAX -
+								  contidstrlen,
+								  "%llu,^", cont->id);
+				else
+					contidstrlen += scnprintf(contidstr,
+								  AUDIT_MESSAGE_TEXT_MAX -
+								  contidstrlen,
+								  "%llu", cont->id);
+				cont = cont->parent;
+			}
+			rcu_read_unlock();
 		}
 		sig_data2 = kmalloc(sizeof(*sig_data2) + contidstrlen + len, GFP_KERNEL);
 		if (!sig_data2) {
@@ -2608,6 +2626,23 @@ void audit_log_session_info(struct audit_buffer *ab)
 	audit_log_format(ab, "auid=%u ses=%u", auid, sessionid);
 }
 
+static void audit_log_contid(struct audit_buffer *ab, struct audit_contobj *cont)
+{
+	if (!cont) {
+		audit_log_format(ab, "-1");
+		return;
+	}
+	rcu_read_lock();
+	while (cont) {
+		if (cont->parent)
+			audit_log_format(ab, "%llu,^", cont->id);
+		else
+			audit_log_format(ab, "%llu", cont->id);
+		cont = cont->parent;
+	}
+	rcu_read_unlock();
+}
+
 /*
  * _audit_log_container_id - report container info
  * @context: task or local context for record
@@ -2627,8 +2662,9 @@ static int _audit_log_container_id(struct audit_context *context,
 	ab = audit_log_start(context, GFP_KERNEL, AUDIT_CONTAINER_ID);
 	if (!ab)
 		return 0;
-	audit_log_format(ab, "record=%d contid=%llu",
-			 record = ++context->contid_records, contobj->id);
+	audit_log_format(ab, "record=%d contid=",
+			 record = ++context->contid_records);
+	audit_log_contid(ab, contobj);
 	audit_log_end(ab);
 	return record;
 }
@@ -2664,7 +2700,18 @@ int audit_log_container_id_ctx(struct audit_context *context)
 
 int audit_contid_comparator(struct task_struct *tsk, u32 op, u64 right)
 {
-	return audit_comparator64(audit_get_contid(tsk), op, right);
+	struct audit_contobj *cont = NULL;
+	int h;
+	int result = 0;
+	u64 left = audit_get_contid(tsk);
+
+	h = audit_hash_contid(left);
+	list_for_each_entry_rcu(cont, &audit_contid_hash[h], list) {
+		result = audit_comparator64(cont->id, op, right);
+		if (result)
+			break;
+	}
+	return result;
 }
 
 void audit_log_key(struct audit_buffer *ab, char *key)
@@ -3019,6 +3066,7 @@ int audit_set_contid(struct task_struct *tsk, u64 contid)
 			INIT_LIST_HEAD(&newcont->list);
 			newcont->id = contid;
 			newcont->owner = get_task_struct(current);
+			newcont->parent = _audit_contobj_get_bytask(newcont->owner);
 			refcount_set(&newcont->refcount, 1);
 			list_add_rcu(&newcont->list,
 				     &audit_contid_hash[h]);
@@ -3047,9 +3095,9 @@ int audit_set_contid(struct task_struct *tsk, u64 contid)
 	if (!ab)
 		return rc;
 
-	audit_log_format(ab,
-			 "op=set opid=%d contid=%llu old-contid=%llu",
-			 task_tgid_nr(tsk), contid, oldcont ? oldcont->id : -1);
+	audit_log_format(ab, "op=set opid=%d contid=%llu old-contid=",
+			 task_tgid_nr(tsk), contid);
+	audit_log_contid(ab, oldcont);
 	spin_lock_irqsave(&_audit_contobj_list_lock, flags);
 	_audit_contobj_put(oldcont);
 	spin_unlock_irqrestore(&_audit_contobj_list_lock, flags);
@@ -3088,8 +3136,9 @@ void audit_log_container_drop(void)
 	ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_CONTAINER_OP);
 	if (!ab)
 		goto out;
-	audit_log_format(ab, "op=drop opid=%d contid=-1 old-contid=%llu",
-			 task_tgid_nr(current), cont->id);
+	audit_log_format(ab, "op=drop opid=%d contid=-1 old-contid=",
+			 task_tgid_nr(current));
+	audit_log_contid(ab, cont);
 	audit_log_end(ab);
 out:
 	spin_lock_irqsave(&_audit_contobj_list_lock, flags);
-- 
2.18.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


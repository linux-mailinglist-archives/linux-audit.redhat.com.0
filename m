Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEA71F3270
	for <lists+linux-audit@lfdr.de>; Tue,  9 Jun 2020 05:01:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591671659;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QnWMkCv9DqnnhrhmAyjJRjclYDxXd2iB8Yki+fR7qDc=;
	b=NO8W7SZ2cgXwrFykUZwtQOxOpCz7LjefuJYvQqQ5X71hyMqGOVHYdENhE6WIMCUHrpwAf1
	ubszeF1gV8Z3rhyZhHc7Xr7YxPRZNkZWJcJvCg6qXMftSHz+08WhCnX/T4d35MibNiLh+q
	mxDh1t95dW3UvQp71DJCmgBcGYTHp9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-ic4tZMSkMd2zImQqW9F2aQ-1; Mon, 08 Jun 2020 23:00:56 -0400
X-MC-Unique: ic4tZMSkMd2zImQqW9F2aQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70CC318C35AA;
	Tue,  9 Jun 2020 03:00:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F7059F4B;
	Tue,  9 Jun 2020 03:00:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24983B3495;
	Tue,  9 Jun 2020 03:00:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058NNdNo000378 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 19:23:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E301D2156A2D; Mon,  8 Jun 2020 23:23:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7D652166BA2
	for <linux-audit@redhat.com>; Mon,  8 Jun 2020 23:23:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2233833B44
	for <linux-audit@redhat.com>; Mon,  8 Jun 2020 23:23:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-149-E2rwG-1rNqaYvhN86E2pOw-1;
	Mon, 08 Jun 2020 19:23:32 -0400
X-MC-Unique: E2rwG-1rNqaYvhN86E2pOw-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2EC6F208E4;
	Mon,  8 Jun 2020 23:23:30 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 037/106] audit: fix a net reference leak in
	audit_send_reply()
Date: Mon,  8 Jun 2020 19:21:29 -0400
Message-Id: <20200608232238.3368589-37-sashal@kernel.org>
In-Reply-To: <20200608232238.3368589-1-sashal@kernel.org>
References: <20200608232238.3368589-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 058NNdNo000378
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 08 Jun 2020 23:00:32 -0400
Cc: Richard Guy Briggs <rgb@redhat.com>, Sasha Levin <sashal@kernel.org>,
	linux-audit@redhat.com, teroincn@gmail.com
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Paul Moore <paul@paul-moore.com>

[ Upstream commit a48b284b403a4a073d8beb72d2bb33e54df67fb6 ]

If audit_send_reply() fails when trying to create a new thread to
send the reply it also fails to cleanup properly, leaking a reference
to a net structure.  This patch fixes the error path and makes a
handful of other cleanups that came up while fixing the code.

Reported-by: teroincn@gmail.com
Reviewed-by: Richard Guy Briggs <rgb@redhat.com>
Signed-off-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/audit.c | 50 +++++++++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index 7afec5f43c63..20c78480d632 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -937,19 +937,30 @@ struct sk_buff *audit_make_reply(int seq, int type, int done,
 	return NULL;
 }
 
+static void audit_free_reply(struct audit_reply *reply)
+{
+	if (!reply)
+		return;
+
+	if (reply->skb)
+		kfree_skb(reply->skb);
+	if (reply->net)
+		put_net(reply->net);
+	kfree(reply);
+}
+
 static int audit_send_reply_thread(void *arg)
 {
 	struct audit_reply *reply = (struct audit_reply *)arg;
-	struct sock *sk = audit_get_sk(reply->net);
 
 	audit_ctl_lock();
 	audit_ctl_unlock();
 
 	/* Ignore failure. It'll only happen if the sender goes away,
 	   because our timeout is set to infinite. */
-	netlink_unicast(sk, reply->skb, reply->portid, 0);
-	put_net(reply->net);
-	kfree(reply);
+	netlink_unicast(audit_get_sk(reply->net), reply->skb, reply->portid, 0);
+	reply->skb = NULL;
+	audit_free_reply(reply);
 	return 0;
 }
 
@@ -963,35 +974,32 @@ static int audit_send_reply_thread(void *arg)
  * @payload: payload data
  * @size: payload size
  *
- * Allocates an skb, builds the netlink message, and sends it to the port id.
- * No failure notifications.
+ * Allocates a skb, builds the netlink message, and sends it to the port id.
  */
 static void audit_send_reply(struct sk_buff *request_skb, int seq, int type, int done,
 			     int multi, const void *payload, int size)
 {
-	struct net *net = sock_net(NETLINK_CB(request_skb).sk);
-	struct sk_buff *skb;
 	struct task_struct *tsk;
-	struct audit_reply *reply = kmalloc(sizeof(struct audit_reply),
-					    GFP_KERNEL);
+	struct audit_reply *reply;
 
+	reply = kzalloc(sizeof(*reply), GFP_KERNEL);
 	if (!reply)
 		return;
 
-	skb = audit_make_reply(seq, type, done, multi, payload, size);
-	if (!skb)
-		goto out;
-
-	reply->net = get_net(net);
+	reply->skb = audit_make_reply(seq, type, done, multi, payload, size);
+	if (!reply->skb)
+		goto err;
+	reply->net = get_net(sock_net(NETLINK_CB(request_skb).sk));
 	reply->portid = NETLINK_CB(request_skb).portid;
-	reply->skb = skb;
 
 	tsk = kthread_run(audit_send_reply_thread, reply, "audit_send_reply");
-	if (!IS_ERR(tsk))
-		return;
-	kfree_skb(skb);
-out:
-	kfree(reply);
+	if (IS_ERR(tsk))
+		goto err;
+
+	return;
+
+err:
+	audit_free_reply(reply);
 }
 
 /*
-- 
2.25.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


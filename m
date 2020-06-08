Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0062B1F326E
	for <lists+linux-audit@lfdr.de>; Tue,  9 Jun 2020 05:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591671655;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KjwGVraYtZeNWBRHWYc10cP5sYgd8hXxnao3Yn3j3as=;
	b=biQlBYH3oXeQWQU2tKO44ZCJgCvsunxQLrthVU1MhPOV9FI5cSE/50AI97Uwv1FzC+dSIA
	J542vb/IULkMHFwoL84/lIcorMblrvnntiqbCSedf3Ej9wUT/hfFGz1rPCTVZm2gtHsaJE
	Zu+hLGvaP1/3ULgx0lTsMaYHOGAbIPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-4x3TV7vIO1GBZmgG-8RPIg-1; Mon, 08 Jun 2020 23:00:53 -0400
X-MC-Unique: 4x3TV7vIO1GBZmgG-8RPIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B79CB107ACCD;
	Tue,  9 Jun 2020 03:00:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92D082B4D5;
	Tue,  9 Jun 2020 03:00:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6047F1809561;
	Tue,  9 Jun 2020 03:00:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058NQ6oA000593 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 19:26:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4FD19B0790; Mon,  8 Jun 2020 23:26:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A8A4C68F4
	for <linux-audit@redhat.com>; Mon,  8 Jun 2020 23:26:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3065C8284A2
	for <linux-audit@redhat.com>; Mon,  8 Jun 2020 23:26:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-387-B5nTBx49Muai0Be_KmN2ZA-1;
	Mon, 08 Jun 2020 19:25:43 -0400
X-MC-Unique: B5nTBx49Muai0Be_KmN2ZA-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D96792064C;
	Mon,  8 Jun 2020 23:25:41 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 29/72] audit: fix a net reference leak in
	audit_send_reply()
Date: Mon,  8 Jun 2020 19:24:17 -0400
Message-Id: <20200608232500.3369581-29-sashal@kernel.org>
In-Reply-To: <20200608232500.3369581-1-sashal@kernel.org>
References: <20200608232500.3369581-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 058NQ6oA000593
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
index aa6d5e39526b..53224f399038 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -897,19 +897,30 @@ struct sk_buff *audit_make_reply(int seq, int type, int done,
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
 
 	mutex_lock(&audit_cmd_mutex);
 	mutex_unlock(&audit_cmd_mutex);
 
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
 
@@ -923,35 +934,32 @@ static int audit_send_reply_thread(void *arg)
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


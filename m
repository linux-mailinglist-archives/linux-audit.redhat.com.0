Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C527E1B16A2
	for <lists+linux-audit@lfdr.de>; Mon, 20 Apr 2020 22:05:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587413139;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LVFuiyh0ghENunVGSFtFuzuSUmhqoqFRBwdyWbHX3Pg=;
	b=h/PVv0tf3zP533eIZtU7n9OmG9itYs2dNKQZjUXvrqo4DZBSuK6JWDxq4xft67hWO6gMfZ
	P4sRVIu+TafCPIr41ER80ZNUH/7qJsSRUgcFfQi1ftpZKeTN2JFGl0fbaFfvBXAvQntLLg
	m0FKAYM7O7ZHj5AmU1Tp3KWvFhky750=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-udHbd1eaOTuY86oPdaehJQ-1; Mon, 20 Apr 2020 16:05:38 -0400
X-MC-Unique: udHbd1eaOTuY86oPdaehJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC371108BD14;
	Mon, 20 Apr 2020 20:05:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A4715D9E5;
	Mon, 20 Apr 2020 20:05:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56A9818089C8;
	Mon, 20 Apr 2020 20:05:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KK5BR8022653 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 16:05:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AD7DC2093CE0; Mon, 20 Apr 2020 20:05:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A985420267F2
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 20:05:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC3B686BCA6
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 20:05:07 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-109-bDy4yzSMMY-nbiswUvKR6g-1; Mon, 20 Apr 2020 16:05:04 -0400
X-MC-Unique: bDy4yzSMMY-nbiswUvKR6g-1
Received: by mail-qk1-f193.google.com with SMTP id l25so12177185qkk.3
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 13:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
	:mime-version:content-transfer-encoding;
	bh=2SoThvzY55jSe9l3kdk/xR8/SbTr02Do+xfVsT4AxbM=;
	b=nAZe5zcvMhIo/Tj3D3pscArw70g5zayQE1C59zDS9Kke37smLgQNMYcBDhjgKPDPk7
	nNERs6W7sPHpobh7ZGEqGhMHI5p6N4Eh5Lpj/13vA3dS8yXdDMnm5xGDuRwk/Lz9RYgu
	IFRTpV9bXVRlUYQC5ySSyhklANcsZCcOxcujO66dlodWO2JekIopsvkLBYn+e5JQab2r
	z/qmHYeGDlTOxgpnYKOAd+ZbaG+dYvHVsL3JW83tF3BA1bxsJHz18V93AZev6GdG0U/N
	iORqz58OnKQ8PGhW24Xxq7geuvoO0ZdeTjq4kD/hsXOnIs0U2xMIoKhGjI1kLYAsh6E+
	Ggsw==
X-Gm-Message-State: AGi0PuZWe1By8XFuALbSfWxYQhpJqcINLtEJxMt8T850gHatyKLvvJxu
	0QJjK1ryFUU1OqX7WfEtgU4vKD0XBw==
X-Google-Smtp-Source: APiQypKhpDv9HwEVizXB3ULUgK5/Ob9rjYtVOUFvcvpd/d+t4ch7Re31aPcuXrnC64oEBoX/8SJYfQ==
X-Received: by 2002:a37:a841:: with SMTP id r62mr17746218qke.135.1587413102495;
	Mon, 20 Apr 2020 13:05:02 -0700 (PDT)
Received: from localhost (pool-71-245-238-133.bstnma.fios.verizon.net.
	[71.245.238.133])
	by smtp.gmail.com with ESMTPSA id v37sm269389qtc.7.2020.04.20.13.04.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Apr 2020 13:05:01 -0700 (PDT)
Subject: [PATCH] audit: fix a net reference leak in audit_send_reply()
From: Paul Moore <paul@paul-moore.com>
To: linux-audit@redhat.com
Date: Mon, 20 Apr 2020 16:04:58 -0400
Message-ID: <158741309840.178400.7330307620088250679.stgit@chester>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: teroincn@gmail.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If audit_send_reply() fails when trying to create a new thread to
send the reply it also fails to cleanup properly, leaking a reference
to a net structure.  This patch fixes the error path and makes a
handful of other cleanups that came up while fixing the code.

Reported-by: teroincn@gmail.com
Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 kernel/audit.c |   50 +++++++++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index b69c8b460341..66b81358b64f 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -924,19 +924,30 @@ struct sk_buff *audit_make_reply(int seq, int type, int done,
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
 
@@ -950,35 +961,32 @@ static int audit_send_reply_thread(void *arg)
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
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


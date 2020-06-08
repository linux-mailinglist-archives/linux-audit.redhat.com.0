Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 285B21F3271
	for <lists+linux-audit@lfdr.de>; Tue,  9 Jun 2020 05:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591671660;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ut4gpVCpNwUhfiyF702g8oqMni077/Jumw3Lf6N9IxQ=;
	b=bIoWfETUdCij7XYvL27bcE+HGxjBJZP1MYrVEfs8qksSmllfwIiC7E8rjEcS2brW/gVBFU
	+H22wG7XzqojIrQ91o5mOLioK0sSFj09qhNSv/3FuoBy4XecOLniZ9byu5Gac2a+vG0rsN
	gQDFf1N1oDQHZ9BnuPsrYiFUq1tkQmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-MUeXrNbQO06Ypz_70ftCDA-1; Mon, 08 Jun 2020 23:00:57 -0400
X-MC-Unique: MUeXrNbQO06Ypz_70ftCDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C702E18CA272;
	Tue,  9 Jun 2020 03:00:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A43119F4B;
	Tue,  9 Jun 2020 03:00:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 73750180954D;
	Tue,  9 Jun 2020 03:00:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058NPsfo000565 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 19:25:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C17E4AFD5C; Mon,  8 Jun 2020 23:25:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDF25B0790
	for <linux-audit@redhat.com>; Mon,  8 Jun 2020 23:25:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6BFC8007CB
	for <linux-audit@redhat.com>; Mon,  8 Jun 2020 23:25:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-217-Sjp6yNfkMs6v3GOrQULj_w-1;
	Mon, 08 Jun 2020 19:25:49 -0400
X-MC-Unique: Sjp6yNfkMs6v3GOrQULj_w-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BB641207C3;
	Mon,  8 Jun 2020 23:25:46 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 33/72] audit: fix a net reference leak in
	audit_list_rules_send()
Date: Mon,  8 Jun 2020 19:24:21 -0400
Message-Id: <20200608232500.3369581-33-sashal@kernel.org>
In-Reply-To: <20200608232500.3369581-1-sashal@kernel.org>
References: <20200608232500.3369581-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 058NPsfo000565
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

[ Upstream commit 3054d06719079388a543de6adb812638675ad8f5 ]

If audit_list_rules_send() fails when trying to create a new thread
to send the rules it also fails to cleanup properly, leaking a
reference to a net structure.  This patch fixes the error patch and
renames audit_send_list() to audit_send_list_thread() to better
match its cousin, audit_send_reply_thread().

Reported-by: teroincn@gmail.com
Reviewed-by: Richard Guy Briggs <rgb@redhat.com>
Signed-off-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/audit.c       |  2 +-
 kernel/audit.h       |  2 +-
 kernel/auditfilter.c | 16 +++++++---------
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index 53224f399038..6faaa908544a 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -853,7 +853,7 @@ static int kauditd_thread(void *dummy)
 	return 0;
 }
 
-int audit_send_list(void *_dest)
+int audit_send_list_thread(void *_dest)
 {
 	struct audit_netlink_list *dest = _dest;
 	struct sk_buff *skb;
diff --git a/kernel/audit.h b/kernel/audit.h
index 9b110ae17ee3..1007773b0b81 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -248,7 +248,7 @@ struct audit_netlink_list {
 	struct sk_buff_head q;
 };
 
-int audit_send_list(void *_dest);
+int audit_send_list_thread(void *_dest);
 
 extern int selinux_audit_rule_update(void);
 
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 16cf396ea738..f26f4cb5d08d 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1137,11 +1137,8 @@ int audit_rule_change(int type, int seq, void *data, size_t datasz)
  */
 int audit_list_rules_send(struct sk_buff *request_skb, int seq)
 {
-	u32 portid = NETLINK_CB(request_skb).portid;
-	struct net *net = sock_net(NETLINK_CB(request_skb).sk);
 	struct task_struct *tsk;
 	struct audit_netlink_list *dest;
-	int err = 0;
 
 	/* We can't just spew out the rules here because we might fill
 	 * the available socket buffer space and deadlock waiting for
@@ -1149,25 +1146,26 @@ int audit_list_rules_send(struct sk_buff *request_skb, int seq)
 	 * happen if we're actually running in the context of auditctl
 	 * trying to _send_ the stuff */
 
-	dest = kmalloc(sizeof(struct audit_netlink_list), GFP_KERNEL);
+	dest = kmalloc(sizeof(*dest), GFP_KERNEL);
 	if (!dest)
 		return -ENOMEM;
-	dest->net = get_net(net);
-	dest->portid = portid;
+	dest->net = get_net(sock_net(NETLINK_CB(request_skb).sk));
+	dest->portid = NETLINK_CB(request_skb).portid;
 	skb_queue_head_init(&dest->q);
 
 	mutex_lock(&audit_filter_mutex);
 	audit_list_rules(seq, &dest->q);
 	mutex_unlock(&audit_filter_mutex);
 
-	tsk = kthread_run(audit_send_list, dest, "audit_send_list");
+	tsk = kthread_run(audit_send_list_thread, dest, "audit_send_list");
 	if (IS_ERR(tsk)) {
 		skb_queue_purge(&dest->q);
+		put_net(dest->net);
 		kfree(dest);
-		err = PTR_ERR(tsk);
+		return PTR_ERR(tsk);
 	}
 
-	return err;
+	return 0;
 }
 
 int audit_comparator(u32 left, u32 op, u32 right)
-- 
2.25.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


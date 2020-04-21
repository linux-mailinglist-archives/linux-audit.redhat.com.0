Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 342201B2BEA
	for <lists+linux-audit@lfdr.de>; Tue, 21 Apr 2020 18:07:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587485267;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j20ZB83bvFRc9917EjNeg45oRvauIEVl7gg1MnTkA3Q=;
	b=b7jY3pEP8Q4kTm+LA4KK/GUSPyGUvy7SqQazLgLNIS/AGlJ+cxGr6fvm7fo+S9FAzXybCP
	B16V9iQkPyVGseqX+TIXP9/WS5/vQLNYmAt8yQHYtpV4b6PIsKCzFpv6aoxeh6C1aOK2gP
	NwQIGJhRSX2H4/ahgRfQ3NLLKtFM2jM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-7L00KpOMMM66tuRlobrL5w-1; Tue, 21 Apr 2020 12:07:45 -0400
X-MC-Unique: 7L00KpOMMM66tuRlobrL5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9955800D53;
	Tue, 21 Apr 2020 16:07:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B69E71001920;
	Tue, 21 Apr 2020 16:07:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E29993A78;
	Tue, 21 Apr 2020 16:07:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03LG7OLl014814 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 12:07:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BDC6E115CC57; Tue, 21 Apr 2020 16:07:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B882E115CC59
	for <linux-audit@redhat.com>; Tue, 21 Apr 2020 16:07:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0531286BCC5
	for <linux-audit@redhat.com>; Tue, 21 Apr 2020 16:07:22 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-442-cj05D5A9Mm6cFb43rfq64A-1; Tue, 21 Apr 2020 12:07:19 -0400
X-MC-Unique: cj05D5A9Mm6cFb43rfq64A-1
Received: by mail-qt1-f195.google.com with SMTP id k12so1577117qtm.4
	for <linux-audit@redhat.com>; Tue, 21 Apr 2020 09:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
	:mime-version:content-transfer-encoding;
	bh=n14Vr5CUKU4UijVzHYPcmMVsX2QW1kevCQdXXNZuYVk=;
	b=IKStTmsl0gCL4HXYwrAX7uJ08BPWaq8FuJgPvyNEodjNVWXkAGciqhB90PeIlXnI7w
	Ll2BrK31dMsuwOMx0ThHJHVr709h/9G2NFeeyhQBsN+dmk/BfU5CjlYJ8ledsRnWbimk
	b4c0S6BZ0L13Cn8oh5euOzqsFcwEkRJcZSrFDv6dN4DDcj7g2OzZqwTnZ3JelySdXonJ
	BHGml8wJl8g+8bUVI+OKuqVaMSdno4jgqiNBMNOLJMhEigeEWx1EWeQ6Fyo2H1Ea/pZW
	QfYewLkdboKw6uoJzJOzH+TGa0q3FsiPIkjMWRKgAlpxktVYnaJmusnmdIPC0yx1632c
	DsCw==
X-Gm-Message-State: AGi0PuZ/fNb4OQFWbsaGBJ7wGdjbVFa+gRW4GZJfryRvfZo5DF9+WAuR
	lWrzZ/9Nkd6/gh49ssyYNyDyDjxs3Q==
X-Google-Smtp-Source: APiQypJbrsoRA3JnIAMfloXRRbAv6Zbf7Xbyv8vuNnRIQmIh1SE3qvuiGr7I9euTXH2lwfPAZPZX5Q==
X-Received: by 2002:ac8:1bb8:: with SMTP id z53mr22605250qtj.132.1587485236523;
	Tue, 21 Apr 2020 09:07:16 -0700 (PDT)
Received: from localhost (pool-71-245-238-133.bstnma.fios.verizon.net.
	[71.245.238.133]) by smtp.gmail.com with ESMTPSA id
	n10sm1865717qkk.105.2020.04.21.09.07.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Apr 2020 09:07:15 -0700 (PDT)
Subject: [PATCH] audit: fix a net reference leak in audit_list_rules_send()
From: Paul Moore <paul@paul-moore.com>
To: linux-audit@redhat.com
Date: Tue, 21 Apr 2020 12:07:14 -0400
Message-ID: <158748523449.111602.4138038965474505567.stgit@chester>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If audit_list_rules_send() fails when trying to create a new thread
to send the rules it also fails to cleanup properly, leaking a
reference to a net structure.  This patch fixes the error patch and
renames audit_send_list() to audit_send_list_thread() to better
match its cousin, audit_send_reply_thread().

Reported-by: teroincn@gmail.com
Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 kernel/audit.c       |    2 +-
 kernel/audit.h       |    2 +-
 kernel/auditfilter.c |   16 +++++++---------
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index 66b81358b64f..622c30246d19 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -880,7 +880,7 @@ static int kauditd_thread(void *dummy)
 	return 0;
 }
 
-int audit_send_list(void *_dest)
+int audit_send_list_thread(void *_dest)
 {
 	struct audit_netlink_list *dest = _dest;
 	struct sk_buff *skb;
diff --git a/kernel/audit.h b/kernel/audit.h
index 2eed4d231624..f0233dc40b17 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -229,7 +229,7 @@ struct audit_netlink_list {
 	struct sk_buff_head q;
 };
 
-int audit_send_list(void *_dest);
+int audit_send_list_thread(void *_dest);
 
 extern int selinux_audit_rule_update(void);
 
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 026e34da4ace..a10e2997aa6c 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1161,11 +1161,8 @@ int audit_rule_change(int type, int seq, void *data, size_t datasz)
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
@@ -1173,25 +1170,26 @@ int audit_list_rules_send(struct sk_buff *request_skb, int seq)
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
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


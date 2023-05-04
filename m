Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DBD6F63A5
	for <lists+linux-audit@lfdr.de>; Thu,  4 May 2023 05:42:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683171758;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NDmKfnQ28FPPjXHQZ9jlJgrLi2zjlB996BtbmV6ZCkg=;
	b=YvOSrwn2poSrWKK4KZgcOOQvEBiUnmKSCQ7+/n6jm1CONP8Q/3LCf6OHDHsgHRPP+tmqw1
	htc3y2eWY1K3Gelb3beFP4li753xDl4Td/8e6Ntr5au3FifSmWLp5lAz/9DLFIOKGZBYPL
	SDv48E8trSy+AE8bpZBdAdODSDuEdW4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-MqHXvWOVMdaSDES7p-34aQ-1; Wed, 03 May 2023 23:42:35 -0400
X-MC-Unique: MqHXvWOVMdaSDES7p-34aQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE74DA0F385;
	Thu,  4 May 2023 03:42:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 26B711121331;
	Thu,  4 May 2023 03:41:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 99E401946A43;
	Thu,  4 May 2023 03:41:46 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AABE419465BB for <linux-audit@listman.corp.redhat.com>;
 Thu,  4 May 2023 03:41:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 630BB492C14; Thu,  4 May 2023 03:41:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B16D492C13
 for <linux-audit@redhat.com>; Thu,  4 May 2023 03:41:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 121293813F32
 for <linux-audit@redhat.com>; Thu,  4 May 2023 03:41:44 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-XW5Xxjk3NZOelQoVLVHp4w-1; Wed, 03 May 2023 23:41:42 -0400
X-MC-Unique: XW5Xxjk3NZOelQoVLVHp4w-1
Received: from fsav116.sakura.ne.jp (fsav116.sakura.ne.jp [27.133.134.243])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 3442o4UR070169;
 Thu, 4 May 2023 11:50:04 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav116.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav116.sakura.ne.jp);
 Thu, 04 May 2023 11:50:04 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav116.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 3442o4vG070166
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 4 May 2023 11:50:04 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <9ae2c1df-1f20-a40b-35ed-1dc76b122a4f@I-love.SAKURA.ne.jp>
Date: Thu, 4 May 2023 11:50:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Can AUDIT_LIST_RULES causes kthreadd-spam?
To: Rinat Gadelshin <rgadelsh@gmail.com>, Paul Moore <paul@paul-moore.com>
References: <ecd4bf68-3bf1-a1d8-4da5-5fbd28c51a6b@gmail.com>
 <CAHC9VhTXHLS7bsDJ8-dSp4dQSQRcKRLiTMRYJOJVCY11G5D85A@mail.gmail.com>
 <e5713a91-37b0-d32f-a0d2-eb668122c9e4@gmail.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <e5713a91-37b0-d32f-a0d2-eb668122c9e4@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: audit@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: i-love.sakura.ne.jp
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023/05/04 7:12, Rinat Gadelshin wrote:
> On 04.05.2023 00:27, Paul Moore wrote:
>> Can you be more specific about the kernel threads you are seeing, are
>> you seeing multiple "kauditd" threads?
>>
>> % ps -fC kauditd
>> UID          PID    PPID  C STIME TTY          TIME CMD
>> root          89       2  0 Apr28 ?        00:00:00 [kauditd]

I don't think so.

kernel audit subsystem uses kthread_run() in order to run short-lived kernel threads.

  $ git grep -nF kthread_run kernel/audit*.c
  kernel/audit.c:1006:    tsk = kthread_run(audit_send_reply_thread, reply, "audit_send_reply");
  kernel/audit.c:1700:    kauditd_task = kthread_run(kauditd_thread, NULL, "kauditd");
  kernel/audit_tree.c:789:        prune_thread = kthread_run(prune_tree_thread, NULL,
  kernel/auditfilter.c:1193:      tsk = kthread_run(audit_send_list_thread, dest, "audit_send_list");

I guess that either or both of audit_send_reply_thread/audit_send_list_thread is launched
for many times.

> Are there any debug options for the kernel that I can set, rebuild the kernel,
> re-run the test and clarify the situation?

Since comm name is not available but you can afford rebuilding kernels,
counting which thread is launched could be the first step. Also, any
characteristic aspects in your usage; e.g. creating many namespaces,
crating many audit rules?

Please try something like below diff:

diff --git a/kernel/audit.c b/kernel/audit.c
index 9bc0b0301198..c28cd4ac0f30 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -911,16 +911,19 @@ int audit_send_list_thread(void *_dest)
 	struct sk_buff *skb;
 	struct sock *sk = audit_get_sk(dest->net);
 
+	pr_info("Started %s\n", __func__);
 	/* wait for parent to finish and send an ACK */
 	audit_ctl_lock();
 	audit_ctl_unlock();
 
-	while ((skb = __skb_dequeue(&dest->q)) != NULL)
+	while ((skb = __skb_dequeue(&dest->q)) != NULL) {
+		pr_info("Calling netlink_unicast\n");
 		netlink_unicast(sk, skb, dest->portid, 0);
+	}
 
 	put_net(dest->net);
 	kfree(dest);
-
+	pr_info("Finished %s\n", __func__);
 	return 0;
 }
 
@@ -963,6 +966,7 @@ static void audit_free_reply(struct audit_reply *reply)
 static int audit_send_reply_thread(void *arg)
 {
 	struct audit_reply *reply = (struct audit_reply *)arg;
+	pr_info("Started %s\n", __func__);
 
 	audit_ctl_lock();
 	audit_ctl_unlock();
@@ -972,6 +976,7 @@ static int audit_send_reply_thread(void *arg)
 	netlink_unicast(audit_get_sk(reply->net), reply->skb, reply->portid, 0);
 	reply->skb = NULL;
 	audit_free_reply(reply);
+	pr_info("Finished %s\n", __func__);
 	return 0;
 }
 


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


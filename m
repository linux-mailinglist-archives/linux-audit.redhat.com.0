Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 666FA5ECDFE
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:11:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664309481;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+MJsuhI2zojdDwMwzgGxhnxnR3TVXut17yTbGTPFUwg=;
	b=DqtnimlXQnwMqH4kuM1t3PVX+r49WV+AYkseeW3XEzaOz2Uiecm3QVbr0OtFWIABPPmsow
	2+PupQLvzvzCi5RczNfxf5e+W5cud14y8JPK/zVrxDlxQN06E1lCC6BAiB8aDcrBuSDqMx
	28+1C+oytSLZvrZG3O9MpOQBWi24Vck=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-yJG84OfDM0OAF0vFeZ02zA-1; Tue, 27 Sep 2022 16:11:03 -0400
X-MC-Unique: yJG84OfDM0OAF0vFeZ02zA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29473380452A;
	Tue, 27 Sep 2022 20:11:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEEC12027061;
	Tue, 27 Sep 2022 20:11:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B4D6D1946A4E;
	Tue, 27 Sep 2022 20:11:00 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7A4151946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:10:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5D8AA2027062; Tue, 27 Sep 2022 20:10:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55AAE2027061
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:10:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36323801231
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:10:59 +0000 (UTC)
Received: from sonic308-15.consmr.mail.ne1.yahoo.com
 (sonic308-15.consmr.mail.ne1.yahoo.com [66.163.187.38]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-281-isPaWN-IOjib1IeNJ0Dozg-1; Tue,
 27 Sep 2022 16:10:57 -0400
X-MC-Unique: isPaWN-IOjib1IeNJ0Dozg-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664309455; bh=UynV8x9bI69/c7VTXup7QVzm3oCLLMvc/GCrRTaA4Ok=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=SbPFs9H/CW2VxCpA0vIE+m3Jjm86oKzcSo3Oon5vl+BvVd78q3eHJL+5IKGGQnjuBaR6SgIpWxS+WDcKeLK+iXq0o6V+7nF9V2eMw4mE0+Vxe1MktzdtsAvWryGy/57kPeEpKqiFsurPHTe4yP2ccNFBXH2jNjiHEWzdb4msknsLazdQ5zc+YcnOj0N38bpF6uJQkH+9JhEbLzam78Wjstppwa0HPg/u6zJf9JFwJ+YZR7mT1rZzHWk+BFuvJrOxT//RAj2as8heRQqfbyq/QThl9Kjx3lbLrZ2KANYEIIbbHT2HyqzPsl7uBoFIU6xKr2qMKEwpH5hPvHAbunH8XQ==
X-YMail-OSG: SoszQHEVM1npuvo43EkpfVrp4aSVhMBmMwAlLPhfp5UJf1uc4CkLLTLJ4u.CcsH
 Jdi.1JMeDIKrhW2.lv095DQ2JwGMesYnCpb07dUbe6mIA6uXGi8gStU1uVIP9VcsVyiuhvQEOXHZ
 pZdr9O3qjTXLMqZGemCAdTQb4WOtLo8_mKdeA_LCbAWdmYfNXNkUMFSAyRF0RORTpU2QAb8eA2EF
 kJ1BqK2t9jzcwQzvNx7FLA01A0yH_g3.qTrXKn2DqfNtTzHqoaoDpV6SthLrjxH1i1g7uNLq05o5
 MalsoJGN06nmml8bmvnfdWuf8Mu.tsJu7oZTcNT4DU962QDBDAJG6QDIwBsW5d..oHiG4n3qX4px
 Lw7xc640k3uSkFD8qLpgj.NEUBwP40Pca9ntkfIrYqezxqTezhgiM3OyZKYJL797xs2PH.2zP5P2
 quebK4GcgVXdOGoBcNXf64HQFSuLqGfZxye5sd8pQpemWQel16vL1e7MxI6BLdLRhyzphhOyNFu8
 5sBgSPGFhRoti3wEXs3_8SgNRZcP9ncWnZXJI6LLXShZBngEzhWjvrMqic5f6yaa1DJybYyfoWhU
 wA8ua5cVXVU3VW9QLY6wGBDl9rmQ3eNpFXoIDVik8Y2wYYVWNntoyjALtACIUmQjpZX9EQLXctpF
 Y55dgyrLGY_DBf8R0.kMUYhO1aNnkCyUbveVhYIIBTPXWj0z7mhx7j3_ft1yhR7WrINkZP8W5phY
 Xs68VTvN8Jjn0iPZFdfhCV.5FPfARtW3fYCc__xSI67tkOYnUh9JBqLHkGGoTW4XZO57GQ2H3CzX
 KDI.EgDEJUlXVq_ptkpOnfGkhlyuPCcT7KA1LTUuUi3OXa0T0DAay5Mxvl1awa_Vjnw1a.WZ0Jf0
 rHvHi16bgYMnj5jC540FlmRkddGYYN7z7VyHpzXtHHlu11Eru9q3IlAN1R5tvv5TUEqWXCs6CAzc
 E_bnf4kWQH78jOuysHpOk3NWGHBBKwilDU0Vp2QeprOfkwEV7ErZ14R5noqtNqxRAlA87dUzyq5o
 7oPrY.T3tC7SVwRhHBRuXa1FP2rNtzc_CrLjm0WUq8O4wVNkKz8__Y79.eoShwplw5wns.9bTBDd
 TbCLWDV3Xc7LP_tn6uEfdSHkcVVx0FR4Kc8h5NB9nqyELBdID1os3bIVtKZ.u2ybXkT12.4fukk_
 upKp0awUAm8Xm8dvuT6gQqNYJ3YfEXQjOsiP3OoY44Ul6frQjndOO73dAFvlzeTEyUYadiQV6Guw
 PX2DRJUg7bqeGm2RxrI2NA0k03jwfEh7evJ11sSHHWXhc3vNzc8bvHeWG1VppnoieDHpFGYy1QK5
 59wBYXQwKcpHJe1exG297rpCCPC37ChPzDeG057YonHjUppyR1DkPXHBRU4olttoAEoXIG3lwJIs
 4wuIlRQk0domFuj9RyWOfZybIJasf5X7JsWUAPaOPwa5L5xs7lpkzRwvCNavTUicgxLIryevH8Fi
 LTpE.QkgJqgRfwNJwlus5pNgHaWp.TkKdxpg0Q4ocjz1QBvtDl77tVMmjgYK__CCf3ZStLv5bjvO
 qGMYiiAQ9IuhOrRGb42I1t752UM9f5y5xYfDhrQouzvplYWTJ3KJuP5XoQiBxklDh6_QPyA_uHpF
 wOrFRcSGIh0vDcztBsitNJhiQ.qAhtSOzHsP3O_IhE3et_AjbNPzr27XqIxvM80sc1JTyk2oQ7AK
 zP21FVPwxyHbWW.rlEWDwkrT4F.8V71r4jANX8YlHVHInS3s.9NPrqeO3TJvvGwq0.aD4dvM4Gp7
 YY4zj0UTN83YUcOiD.d9C6gHfRsvWQ1EQqerin3RZ_ImjH2Z9pUWM8Ip7_3Szu59MzQgQFElsrc8
 .tu..4VcG1zWumD_qOBbI9Go_drmMasCdQHQjKiTk4hD.tByQz09.EUtyRqABYI8xdktJdBnuFLN
 HX2OcuBziTxhO52smLSKYh5coGOvwog9MzXLp4kxJKQy58ke8cnys.vCMSL.oaxiWhTsVNMNcJLn
 ulse2fHwDUFSidkZ_t8gMiiWjb.y5KURbVfCPjo7CWlPVbbZifHRX8DA2NtvQuiRn324I5kPViTX
 Dx3yM4MmNYjwgZR5cG8115YpAUlowCKQ5tVrJXXNEWXOaQnA69ZxQh4jCt2YtFS4.boXlmLMFB0B
 T12S0LbboSIQDL1N1xR6tJS7VtRBfGOdGeX.f4VKJEn6cpp0ioTLWXDkqWNYQdTyu4EYo4CM9j.x
 gYV599U3fsq9MOEOOmAKtwI2KTsfg.q7w2_bQ5cHijJ_S62auJTL754HC.8xX.enebkRkqWORK3E
 UjLjvZqPoyGbB6jpmRfJG87Ot8q2LZAd8inbWttU-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:10:55 +0000
Received: by hermes--production-gq1-7dfd88c84d-nvfk6 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 55a7229bea084bb6b28fa3beefd2f4cd; 
 Tue, 27 Sep 2022 20:10:48 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 32/39] Audit: Allow multiple records in an audit_buffer
Date: Tue, 27 Sep 2022 12:54:14 -0700
Message-Id: <20220927195421.14713-33-casey@schaufler-ca.com>
In-Reply-To: <20220927195421.14713-1-casey@schaufler-ca.com>
References: <20220927195421.14713-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: john.johansen@canonical.com, selinux@vger.kernel.org, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace the single skb pointer in an audit_buffer with
a list of skb pointers. Add the audit_stamp information
to the audit_buffer as there's no guarantee that there
will be an audit_context containing the stamp associated
with the event. At audit_log_end() time create auxiliary
records (none are currently defined) as have been added
to the list. Functions are created to manage the skb list
in the audit_buffer.

Suggested-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 kernel/audit.c | 111 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 89 insertions(+), 22 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index 7facf6929f64..ef6b2d38e38d 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -197,8 +197,10 @@ static struct audit_ctl_mutex {
  * to place it on a transmit queue.  Multiple audit_buffers can be in
  * use simultaneously. */
 struct audit_buffer {
-	struct sk_buff       *skb;	/* formatted skb ready to send */
+	struct sk_buff       *skb;	/* the skb for audit_log functions */
+	struct sk_buff_head  skb_list;	/* formatted skbs, ready to send */
 	struct audit_context *ctx;	/* NULL or associated context */
+	struct audit_stamp   stamp;	/* audit stamp for these records */
 	gfp_t		     gfp_mask;
 };
 
@@ -1765,10 +1767,13 @@ __setup("audit_backlog_limit=", audit_backlog_limit_set);
 
 static void audit_buffer_free(struct audit_buffer *ab)
 {
+	struct sk_buff *skb;
+
 	if (!ab)
 		return;
 
-	kfree_skb(ab->skb);
+	while ((skb = skb_dequeue(&ab->skb_list)))
+		kfree_skb(skb);
 	kmem_cache_free(audit_buffer_cache, ab);
 }
 
@@ -1784,6 +1789,10 @@ static struct audit_buffer *audit_buffer_alloc(struct audit_context *ctx,
 	ab->skb = nlmsg_new(AUDIT_BUFSIZ, gfp_mask);
 	if (!ab->skb)
 		goto err;
+
+	skb_queue_head_init(&ab->skb_list);
+	skb_queue_tail(&ab->skb_list, ab->skb);
+
 	if (!nlmsg_put(ab->skb, 0, 0, type, 0, 0))
 		goto err;
 
@@ -1849,7 +1858,6 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
 				     int type)
 {
 	struct audit_buffer *ab;
-	struct audit_stamp stamp;
 
 	if (audit_initialized != AUDIT_INITIALIZED)
 		return NULL;
@@ -1904,14 +1912,14 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
 		return NULL;
 	}
 
-	audit_get_stamp(ab->ctx, &stamp);
+	audit_get_stamp(ab->ctx, &ab->stamp);
 	/* cancel dummy context to enable supporting records */
 	if (ctx)
 		ctx->dummy = 0;
 	audit_log_format(ab, "audit(%llu.%03lu:%u): ",
-			 (unsigned long long)stamp.ctime.tv_sec,
-			 stamp.ctime.tv_nsec/1000000,
-			 stamp.serial);
+			 (unsigned long long)ab->stamp.ctime.tv_sec,
+			 ab->stamp.ctime.tv_nsec/1000000,
+			 ab->stamp.serial);
 
 	return ab;
 }
@@ -2167,6 +2175,57 @@ void audit_log_key(struct audit_buffer *ab, char *key)
 		audit_log_format(ab, "(null)");
 }
 
+/**
+ * audit_buffer_aux_new - Add an aux record buffer to the skb list
+ * @ab: audit_buffer
+ * @type: message type
+ *
+ * Aux records are allocated and added to the skb list of
+ * the "main" record. The ab->skb is reset to point to the
+ * aux record on its creation. When the aux record in complete
+ * ab->skb has to be reset to point to the "main" record.
+ * This allows the audit_log_ functions to be ignorant of
+ * which kind of record it is logging to. It also avoids adding
+ * special data for aux records.
+ *
+ * On success ab->skb will point to the new aux record.
+ * Returns 0 on success, -ENOMEM should allocation fail.
+ */
+static int audit_buffer_aux_new(struct audit_buffer *ab, int type)
+{
+	WARN_ON(ab->skb != skb_peek(&ab->skb_list));
+
+	ab->skb = nlmsg_new(AUDIT_BUFSIZ, ab->gfp_mask);
+	if (!ab->skb)
+		goto err;
+	if (!nlmsg_put(ab->skb, 0, 0, type, 0, 0))
+		goto err;
+	skb_queue_tail(&ab->skb_list, ab->skb);
+
+	audit_log_format(ab, "audit(%llu.%03lu:%u): ",
+			 (unsigned long long)ab->stamp.ctime.tv_sec,
+			 ab->stamp.ctime.tv_nsec/1000000,
+			 ab->stamp.serial);
+
+	return 0;
+
+err:
+	kfree_skb(ab->skb);
+	ab->skb = skb_peek(&ab->skb_list);
+	return -ENOMEM;
+}
+
+/**
+ * audit_buffer_aux_end - Switch back to the "main" record from an aux record
+ * @ab: audit_buffer
+ *
+ * Restores the "main" audit record to ab->skb.
+ */
+static void audit_buffer_aux_end(struct audit_buffer *ab)
+{
+	ab->skb = skb_peek(&ab->skb_list);
+}
+
 int audit_log_task_context(struct audit_buffer *ab)
 {
 	int error;
@@ -2402,26 +2461,14 @@ int audit_signal_info(int sig, struct task_struct *t)
 }
 
 /**
- * audit_log_end - end one audit record
- * @ab: the audit_buffer
- *
- * We can not do a netlink send inside an irq context because it blocks (last
- * arg, flags, is not set to MSG_DONTWAIT), so the audit buffer is placed on a
- * queue and a kthread is scheduled to remove them from the queue outside the
- * irq context.  May be called in any context.
+ * __audit_log_end - enqueue one audit record
+ * @skb: the buffer to send
  */
-void audit_log_end(struct audit_buffer *ab)
+static void __audit_log_end(struct sk_buff *skb)
 {
-	struct sk_buff *skb;
 	struct nlmsghdr *nlh;
 
-	if (!ab)
-		return;
-
 	if (audit_rate_check()) {
-		skb = ab->skb;
-		ab->skb = NULL;
-
 		/* setup the netlink header, see the comments in
 		 * kauditd_send_multicast_skb() for length quirks */
 		nlh = nlmsg_hdr(skb);
@@ -2432,6 +2479,26 @@ void audit_log_end(struct audit_buffer *ab)
 		wake_up_interruptible(&kauditd_wait);
 	} else
 		audit_log_lost("rate limit exceeded");
+}
+
+/**
+ * audit_log_end - end one audit record
+ * @ab: the audit_buffer
+ *
+ * We can not do a netlink send inside an irq context because it blocks (last
+ * arg, flags, is not set to MSG_DONTWAIT), so the audit buffer is placed on a
+ * queue and a kthread is scheduled to remove them from the queue outside the
+ * irq context.  May be called in any context.
+ */
+void audit_log_end(struct audit_buffer *ab)
+{
+	struct sk_buff *skb;
+
+	if (!ab)
+		return;
+
+	while ((skb = skb_dequeue(&ab->skb_list)))
+		__audit_log_end(skb);
 
 	audit_buffer_free(ab);
 }
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


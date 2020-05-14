Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E088A1D4111
	for <lists+linux-audit@lfdr.de>; Fri, 15 May 2020 00:31:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589495515;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xdyOOF8bBnbDBivv60NbnkB1uFNAAhlowNHtdIrUIcc=;
	b=g9c5/wI9WVLG/Bkg+XStevXwBV8EYGyRApve51drpVKMFJzsyqeV4Q9hUbqD7DHD2cVE8h
	qbZcGSrC44773OQKa3G8VTo9PTAELzbSgE8+00KHLfttLUkKR1wCQQUTUese51ErYIOyLO
	EPD0ubEN5i0a4xj3BRvUmIkdy5Ar5SA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-xBJGikbIMy-y4rK1KtTpIg-1; Thu, 14 May 2020 18:31:53 -0400
X-MC-Unique: xBJGikbIMy-y4rK1KtTpIg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 484DA19200C1;
	Thu, 14 May 2020 22:31:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF86D600E5;
	Thu, 14 May 2020 22:31:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6AB504E994;
	Thu, 14 May 2020 22:31:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EMUbbe020254 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 18:30:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1BCAB217B438; Thu, 14 May 2020 22:30:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 061672166B27
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:30:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DA9C8007DB
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:30:34 +0000 (UTC)
Received: from sonic316-27.consmr.mail.ne1.yahoo.com
	(sonic316-27.consmr.mail.ne1.yahoo.com [66.163.187.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-99-jw0OjomzNESNU-RoRUMCDQ-1;
	Thu, 14 May 2020 18:30:31 -0400
X-MC-Unique: jw0OjomzNESNU-RoRUMCDQ-1
X-YMail-OSG: P0ArnsYVM1l6P3YuvGQ46Izp12WumIkJRv_Q.qb8si1MbAPiZEz.fIeQBmC1.7Z
	Vt1_McvMr6oCFbztMJc4q3cqRhp2fNxpBrTlF5zhoRo.spNxh8pftiUFrOqaLi0WW5qAW.jULdxD
	ZZdmGgEb_JHWZ1emW7JTSRXbUbmHOdY_bua4lx4.cm8RpK5NT6QOziOVN06zbgZFEcBAln_ym4qg
	ZLBHLvM8MXg2HYf48YTlb72uM5BIWkWplCAS4jwBEcR6d.N2C8VTFEfLypPU9tteZ9cKvX4WZy4B
	7dEJpSaPADXN643qcALcn4FUQLoHjGC1EVRneyqX66lmx5OCv19pflQ0dN.nYtdqPwD_KVFV8wik
	BXHxQM8B7Mwq99bdnthzVBWazj67XXoDw3jH5tQAlDrExxjxrWKlzrW29ZM9kO9VBY0nlI0N11FK
	eshg8VXew9I2pkXDEUJTuihzwLRQUp_mJhu6l6Ch2RmQS4s.INMkqYgUaBdHNV7Nz8tVcT5j_pOd
	y8JdEdbYSKl_Qz_oXclif6qREtU5ClLhXwKcFgrhydBcM5Dan6h_51slVzwWEpgJ7h14tUt5ThnX
	RLEtxHssR.StLFsMB99cFYgbtlc8sc7cKiDOmAT2.ZnVjqnRE3379pIwRuQu_1UdB9UcPir9OOKW
	dKa4tmsat2kSgax5OagsfpGn8G3o0aE24asIPDwOQJ2y1UObgO1W5RqQM9MqZBWhDxiDYaYwROco
	x7h9pNflaKwwjuPGdW4s0cKQyWbri19FZUVoPwjA8Pr3h7tHfrHpPJeh7VJvb3l8zXFjA8TgEbnG
	O2G.jQZd039a5Ry5EsWFZXdOsWHrU2TIzJTyEyeD5zucc81FTRSOSI0QZc0IeG_vFIvFBVFOicS8
	IAle20mAsTzACkS0y2OBHReGNdsGZU2SoPrCwNIOf7xCF0ihXX0A3m3bRQsD.lH_2Mw52mpq6Zvn
	4ZRgJeS_lSMJJtr.i0S1OYaG457wNZxauqavEJavBAdo1meXfbqciL.PoEGOOBI6o8YZsfcLwBbj
	FfLm4qe.uVS7vdBzJ6iR_hnyuKHPdjYbmwZh0cOny1UFZqkf9WElQFrkhhiflwR1WFaG_1sZBFqX
	RwOwcuEtjrNMEzZrLYGFc7B3PqQ_r2_RfqzJDTp5gf_AkvT64vzclxIR3eF7Lcyqmgm6XRU9k5Dq
	bOS394rTrW24PZEeyDHeaifh_wEwEV8qRccEceME8mUvY2pQrfpTfmuzEhAaQzRZ1TBmrD33wihO
	5Kz6W4CTlfnOUsfnLCrb0z9Cnr_ICIWBMSbVInAwQXiI.UjEzwHWn1atYwmRp1osuM7IPYWwcGdZ
	YXNSDu.Exz04MM7tu2mEZXAjtID7SrpkjhjObDRwunEUp0ympwSrj7Yjusl5LCvzo5.8WhKziKpc
	v28v22AOpgJ.C6umJClqxNzuajwc2QaC5cFtK3kbOCthtzWoO0s5c5q64sTC_4I0bNe2p
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic316.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 14 May 2020 22:30:31 +0000
Received: by smtp414.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID d4602fb5d17e767b22601702ddf62cb3; 
	Thu, 14 May 2020 22:30:26 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v17 17/23] LSM: security_secid_to_secctx in netlink netfilter
Date: Thu, 14 May 2020 15:11:36 -0700
Message-Id: <20200514221142.11857-18-casey@schaufler-ca.com>
In-Reply-To: <20200514221142.11857-1-casey@schaufler-ca.com>
References: <20200514221142.11857-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, netdev@vger.kernel.org, linux-audit@redhat.com,
	sds@tycho.nsa.gov
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change netlink netfilter interfaces to use lsmcontext
pointers, and remove scaffolding.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
cc: netdev@vger.kernel.org
---
 net/netfilter/nfnetlink_queue.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index fe19ae7216db..a4d4602ab9b7 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -301,12 +301,10 @@ static int nfqnl_put_sk_uidgid(struct sk_buff *skb, struct sock *sk)
 	return -1;
 }
 
-static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, char **secdata)
+static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, struct lsmcontext *context)
 {
-	u32 seclen = 0;
 #if IS_ENABLED(CONFIG_NETWORK_SECMARK)
 	struct lsmblob blob;
-	struct lsmcontext context = { };
 
 	if (!skb || !sk_fullsock(skb->sk))
 		return 0;
@@ -318,14 +316,14 @@ static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, char **secdata)
 		 * blob. security_secid_to_secctx() will know which security
 		 * module to use to create the secctx.  */
 		lsmblob_init(&blob, skb->secmark);
-		security_secid_to_secctx(&blob, &context);
-		*secdata = context.context;
+		security_secid_to_secctx(&blob, context);
 	}
 
 	read_unlock_bh(&skb->sk->sk_callback_lock);
-	seclen = context.len;
+	return context->len;
+#else
+	return 0;
 #endif
-	return seclen;
 }
 
 static u32 nfqnl_get_bridge_size(struct nf_queue_entry *entry)
@@ -401,8 +399,7 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	enum ip_conntrack_info uninitialized_var(ctinfo);
 	struct nfnl_ct_hook *nfnl_ct;
 	bool csum_verify;
-	struct lsmcontext scaff; /* scaffolding */
-	char *secdata = NULL;
+	struct lsmcontext context = { };
 	u32 seclen = 0;
 
 	size = nlmsg_total_size(sizeof(struct nfgenmsg))
@@ -469,7 +466,7 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	}
 
 	if ((queue->flags & NFQA_CFG_F_SECCTX) && entskb->sk) {
-		seclen = nfqnl_get_sk_secctx(entskb, &secdata);
+		seclen = nfqnl_get_sk_secctx(entskb, &context);
 		if (seclen)
 			size += nla_total_size(seclen);
 	}
@@ -604,7 +601,7 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	    nfqnl_put_sk_uidgid(skb, entskb->sk) < 0)
 		goto nla_put_failure;
 
-	if (seclen && nla_put(skb, NFQA_SECCTX, seclen, secdata))
+	if (seclen && nla_put(skb, NFQA_SECCTX, context.len, context.context))
 		goto nla_put_failure;
 
 	if (ct && nfnl_ct->build(skb, ct, ctinfo, NFQA_CT, NFQA_CT_INFO) < 0)
@@ -632,10 +629,8 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	}
 
 	nlh->nlmsg_len = skb->len;
-	if (seclen) {
-		lsmcontext_init(&scaff, secdata, seclen, 0);
-		security_release_secctx(&scaff);
-	}
+	if (seclen)
+		security_release_secctx(&context);
 	return skb;
 
 nla_put_failure:
@@ -643,10 +638,8 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	kfree_skb(skb);
 	net_err_ratelimited("nf_queue: error creating packet message\n");
 nlmsg_failure:
-	if (seclen) {
-		lsmcontext_init(&scaff, secdata, seclen, 0);
-		security_release_secctx(&scaff);
-	}
+	if (seclen)
+		security_release_secctx(&context);
 	return NULL;
 }
 
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C355ECDDB
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:07:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664309268;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=id57owPKcnamIGg3pnPFChs7rCUKsyzEzM4exRzQamw=;
	b=YYMEt3BnEPo7XxVk2jNwe37wapMwJYZT5KRMog/pP16e+MVy8g8Fbg51WYfOwtocB5rMHP
	ytAeLnNhfm1+WJLWFONCUbtoGrlU5pBIej1XxabCR1mB39NZPEUUhQBrVvvxLNz+v97+en
	tNlBKbtFK5A3vVBss534b6RgiyFYpRQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-EtZCg9oPMyaY3oPIWiJ3Eg-1; Tue, 27 Sep 2022 16:07:44 -0400
X-MC-Unique: EtZCg9oPMyaY3oPIWiJ3Eg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 634F3858282;
	Tue, 27 Sep 2022 20:07:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46D0817595;
	Tue, 27 Sep 2022 20:07:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 23E151946A48;
	Tue, 27 Sep 2022 20:07:42 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9531D1946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:07:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8883C492B05; Tue, 27 Sep 2022 20:07:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80AC4492B04
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:07:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 661AD1010428
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:07:41 +0000 (UTC)
Received: from sonic302-28.consmr.mail.ne1.yahoo.com
 (sonic302-28.consmr.mail.ne1.yahoo.com [66.163.186.154]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-453-0u4eKyVNODeKSNcMGzsz1w-1; Tue,
 27 Sep 2022 16:07:39 -0400
X-MC-Unique: 0u4eKyVNODeKSNcMGzsz1w-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664309256; bh=BNTUEcWg4aCj5tjF3FxT1PS/ColI80EIA5vTdWKPBmc=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=ssqqfHRfGomrM3IXfp97WJUUvLN/Xu+KcA+wL+ik023Ze8yh7WDE3AlM0hHg9bSvmok6/4UH01/wGpgm9jJoxnI6mnW89ufjdyE018S3fZNPaHawyko9AoQMGjaqWBooyzBTiaJz2o35DAwrehUusdJYm+f5in8nbzI0nnsswaOeE2U4Q+1xnPmmsXPZYtyrHfJeQGlhmvLoL5XFb7OTyiE3ePmVLB2+6UlRDsqqkZspRPXir9uvjOcIPhVYcou3hGzRdAJxfc0oEe5xQdzEU2ArEi0BbPqiQiq87YAZMFgmdB8ZXlguB6hkdQ+SaHsjPb7Hvxxv28CxMIyST4xtuw==
X-YMail-OSG: loejHKkVM1lq6BmsoMQUN_Geugpq8O7nnYJxgqGKyeyqRJd0FTQ7t8TU7t98Ei_
 pHAcZ.Rd0OxmvAlI.8PoYLwXAyvT5jjH00GNHi1y4d16Qm0tKbwP8blVbOzYXlhtww0A5.cmSDa0
 moW_IV7kDFgvcnWJZDdskGsmAajVg73F83rUWlscOuj4OuzaqE1uijozq7TaiesanBZcQOCAs_hB
 uV6mdFyRljOzReUjNerdIwpa0Wt2p3O8naHu.f.PdfsZgfzB.k4XtINt3j29xL9TjmGeHsz9KbyM
 RMFhoE3Z_EroDCtFixpY_lcVlNd6Z44lA1rpPcoDYGyvz845.NpAOYyYEzrCN.7V41TEaaQwCPyX
 KHp_kM5iKH5.bskyhhFGq3OZbOGawp81T1LQ3bvjHnrLfT5tA1mP81HE.ZOGFzagackuBo2KseTH
 po.IHG9RnQjzkM0uPCa_0EMwJ04_pLZLkJUvKuWVpCVIsJxrc75zhd_o0KTBpWMm_aCamNG8trzt
 Rzy0FBjsVq5F_q9Mj2EYLaWgdsZsZozz_lpgYz0ChaGvm83XpPy1OvaIB42JaTSGDC8YYv_FcHyx
 kVoN59s7amBH4iI.MgqLcTpjVRwVrhIyD03DquhwAJZKZio9yaSbWeAIFL3j3dCOSN0hdU6PX_0y
 iGT9J_hfsf4LQfUcmn9ECwx7CLgU.TvorfyhJzIsr8QebnOiS4ArabC_Bya.8ZhuXGSch.7CJNi7
 kjgZxzUMpdl6QWedXyRrzhNoc2j8MGgFTMNWZN50_11Q_Fwr2cQqvJy7CHG7MChf4qBsQ3fKGkP7
 U5tbWD2WFLD8pG.mzerFQIi9Y55J4rwBBEVSmQ5AdYurpEAUles1pdMp7CMgJlu5egTLWLzXqcIt
 7_nv8xStVw1.E5pSTG_y0hZOGszS_g1IyDazNq86WLXn2XVVVnXbzzaf3KUvC0HTJgrbuZxfnybS
 2ncfaU3.lFVZ7nXQU0kp58Jy7pTU6k3MHRnoxhw5soRBLVMN4Tjkg8Ytj1jCe.du3UECaa0DF9d3
 wi0uqA8SvnUj1JfQAm.OK8UwUP0uvf7RR_aZjP2VdRGESGoBSHeia0d4m0dLqoBRP1Z_iNotml0_
 tiIBpd_QvnPcZjMT_MmQIpQ5Hl4L0Lzd_6WqRM4LDQcXaw9AsFvx5o4UJoB_xMQA.1stk1IF1uqH
 LZ4pzYCwUrAX36annizoQrkWmDZ7JZoLrj8qnCuJ17nLYVLiakm3M1grkXlJf9Arq56Er68J.kJD
 qLD8pXBC109L73mnhr_7NGhUUztT2KXCsOXrBRxsNFdkwgPwIE2AANreGtwCgwkjHV0WKAzfigAp
 AEYxKSiy4auvTrtPz4Lu_GviU_K3S8L5.4BWycbT95Ofk8jVZzLjeuENr8ByCrpfYMnrGrWK6IJk
 wp_ZY4FMYwAmgIrtey0GwjrxH4oTqaH01WXJz4AZvP4trJ2h83ybx6UiHOJiOhkPNUjFK.r4U.Ei
 WDIn39TjZpZeMJ6moAtGZIT9EwHsgdk_nH9PV1N7TVFW20A7uR8AJnPAmWhltFzm94bzygJ8K9hk
 S9AJi4J5ymlVSGIi0Cdg.LGWyzd3_CQCiBlxMfe22ElOMvDHmdPQ.y.878tBdx8cILw79BwQ5Rp5
 IFCwiBuG3k8w57l52CdlMhMlGHm8wrkV5ylnKASw1nxYKu2ZFznwLuFLNBa6twMwo6.cuRZcj.FJ
 zwYvhpNCCmdLJRXY18oGmwyuwAfn8anrEc9P4e0c80AKiFvdg_MG6lPv71RT9Hzf7mlWxehB0xhI
 77q61cnnzI8GSGnVqy7HsIRL7DoQt6Up.ZB9LxQJwUkeZ2t4rjisgYgVgF9CMp.B699C81TG8.Ke
 8OYvYTsx4JG.pIFuOCMo8b9VTkUxDtpyLyonP_rhCoOPfK355jTbsLZxE9J4lh6QBknccH178s0l
 X27fz5dLg_53uSS31s5W.qjWCe_Uuev9ZBpqd50LU3yRluJ.6PMwsE_SJHBgVT3ffvZUdlaPF3pL
 0_DQikPSS6jHGFMkMybu_5AySVL6TAdegmvCx2Nil174UI1F5stnqziQ6w65YAUtwFHA5OUa6Br8
 kdeprrRheWbKj0C0gkmxzk0Bfhzs.MyXBAxsxcUu7FveQ0GalQafE3LKw96.XD14SPfquL3V.bNL
 K46DOULYmsDmDiTMN0bdAuWpYcFe89aMsfTSkV_Ahj6hfdtOnMf7AXK22D7alsVCMh8sSF8.FIRm
 zUGtXVvKFDlZudBcrRUrcKegkiZQvnJpVilx4AJ12mvknmnfi_wcne7fdTMEfy18FtWHI1zCxqLQ
 itz.EFAZC8yM-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:07:36 +0000
Received: by hermes--production-gq1-7dfd88c84d-mgq76 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 3a50061892aa4d3f76ff4b42bdd2ab9e; 
 Tue, 27 Sep 2022 20:07:33 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 25/39] LSM: security_secid_to_secctx in netlink netfilter
Date: Tue, 27 Sep 2022 12:54:07 -0700
Message-Id: <20220927195421.14713-26-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
 netdev@vger.kernel.org, jmorris@namei.org, linux-kernel@vger.kernel.org,
 linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
 Pablo Neira Ayuso <pablo@netfilter.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change netlink netfilter interfaces to use lsmcontext
pointers, and remove scaffolding.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Paul Moore <paul@paul-moore.com>
Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Acked-by: Pablo Neira Ayuso <pablo@netfilter.org>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc: netdev@vger.kernel.org
Cc: netfilter-devel@vger.kernel.org
---
 net/netfilter/nfnetlink_queue.c | 37 +++++++++++++--------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index 46f49cd2543d..3a7d1a693c5e 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -301,15 +301,13 @@ static int nfqnl_put_sk_uidgid(struct sk_buff *skb, struct sock *sk)
 	return -1;
 }
 
-static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, char **secdata)
+static void nfqnl_get_sk_secctx(struct sk_buff *skb, struct lsmcontext *context)
 {
-	u32 seclen = 0;
 #if IS_ENABLED(CONFIG_NETWORK_SECMARK)
 	struct lsmblob blob;
-	struct lsmcontext context = { };
 
 	if (!skb || !sk_fullsock(skb->sk))
-		return 0;
+		return;
 
 	read_lock_bh(&skb->sk->sk_callback_lock);
 
@@ -318,14 +316,12 @@ static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, char **secdata)
 		 * blob. security_secid_to_secctx() will know which security
 		 * module to use to create the secctx.  */
 		lsmblob_init(&blob, skb->secmark);
-		security_secid_to_secctx(&blob, &context);
-		*secdata = context.context;
+		security_secid_to_secctx(&blob, context);
 	}
 
 	read_unlock_bh(&skb->sk->sk_callback_lock);
-	seclen = context.len;
 #endif
-	return seclen;
+	return;
 }
 
 static u32 nfqnl_get_bridge_size(struct nf_queue_entry *entry)
@@ -397,12 +393,10 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	struct net_device *indev;
 	struct net_device *outdev;
 	struct nf_conn *ct = NULL;
+	struct lsmcontext context = { };
 	enum ip_conntrack_info ctinfo = 0;
 	const struct nfnl_ct_hook *nfnl_ct;
 	bool csum_verify;
-	struct lsmcontext scaff; /* scaffolding */
-	char *secdata = NULL;
-	u32 seclen = 0;
 	ktime_t tstamp;
 
 	size = nlmsg_total_size(sizeof(struct nfgenmsg))
@@ -473,9 +467,9 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	}
 
 	if ((queue->flags & NFQA_CFG_F_SECCTX) && entskb->sk) {
-		seclen = nfqnl_get_sk_secctx(entskb, &secdata);
-		if (seclen)
-			size += nla_total_size(seclen);
+		nfqnl_get_sk_secctx(entskb, &context);
+		if (context.len)
+			size += nla_total_size(context.len);
 	}
 
 	skb = alloc_skb(size, GFP_ATOMIC);
@@ -610,7 +604,8 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	    nfqnl_put_sk_uidgid(skb, entskb->sk) < 0)
 		goto nla_put_failure;
 
-	if (seclen && nla_put(skb, NFQA_SECCTX, seclen, secdata))
+	if (context.len &&
+	    nla_put(skb, NFQA_SECCTX, context.len, context.context))
 		goto nla_put_failure;
 
 	if (ct && nfnl_ct->build(skb, ct, ctinfo, NFQA_CT, NFQA_CT_INFO) < 0)
@@ -638,10 +633,8 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	}
 
 	nlh->nlmsg_len = skb->len;
-	if (seclen) {
-		lsmcontext_init(&scaff, secdata, seclen, 0);
-		security_release_secctx(&scaff);
-	}
+	if (context.len)
+		security_release_secctx(&context);
 	return skb;
 
 nla_put_failure:
@@ -649,10 +642,8 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	kfree_skb(skb);
 	net_err_ratelimited("nf_queue: error creating packet message\n");
 nlmsg_failure:
-	if (seclen) {
-		lsmcontext_init(&scaff, secdata, seclen, 0);
-		security_release_secctx(&scaff);
-	}
+	if (context.len)
+		security_release_secctx(&context);
 	return NULL;
 }
 
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


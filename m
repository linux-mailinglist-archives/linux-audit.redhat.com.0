Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 50F692A7486
	for <lists+linux-audit@lfdr.de>; Thu,  5 Nov 2020 02:08:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-SKRlcvIuPP6oq_elYyzH7w-1; Wed, 04 Nov 2020 20:08:17 -0500
X-MC-Unique: SKRlcvIuPP6oq_elYyzH7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 868511007464;
	Thu,  5 Nov 2020 01:08:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 373ED60BFA;
	Thu,  5 Nov 2020 01:08:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B3F858123;
	Thu,  5 Nov 2020 01:08:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A5189jD030202 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 4 Nov 2020 20:08:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6BD55205EB13; Thu,  5 Nov 2020 01:08:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66A452028E91
	for <linux-audit@redhat.com>; Thu,  5 Nov 2020 01:08:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E80D28582A1
	for <linux-audit@redhat.com>; Thu,  5 Nov 2020 01:08:06 +0000 (UTC)
Received: from sonic313-16.consmr.mail.ne1.yahoo.com
	(sonic313-16.consmr.mail.ne1.yahoo.com [66.163.185.39]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-308-zV9QWg9NMXmoJ1Rxqb3Miw-1;
	Wed, 04 Nov 2020 20:08:04 -0500
X-MC-Unique: zV9QWg9NMXmoJ1Rxqb3Miw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1604538484; bh=I6tkeKvUbtujRYyF/jmQY59V4N3p32wBHszLiGwJrbQ=;
	h=From:To:Subject:Date;
	b=YIbCeTFE2pKuhOG/haPD5fPo2DVky62k9TYz3IAMAJxzEsHgeLk0WXbRugaTlUvW6jiMYyWYzBbe3Ciba/rPokoNTFYQ/vnlDCfUMzp+8opXJEk70YeL+tifyR/IlMlX6lBZUKahGUPMHwKfC4oF8LpRHKVNDn7v+Zohy28iNtBeo3vWrWy/x4GKUMJKm4YV3woK3SRR1hKk7Ig61lfwQo54svsnOzBk3llKKBJjMFbBMFzBJ4B3b+DUQnL8YgQjn3ceVvOzfcUtVEtbDMuopmWfCkPJVg9CQ22DrT0ZjQv7/8z8KNIrBSMQCOpdKjDU6C+0OV6G6PD9u5fZXspHZQ==
X-YMail-OSG: nb7DKFIVM1l7ArLanzxsJpsE.et8OcBqSD029Z8SYnafHoj2wyUeAPg_oG6EvBu
	84GplfVxmJM_ArsOUZsVZoPhBzLIGByAoys1h03mH79xs2UdslDZ7aaUPyN6i1AcJQKg9.qH2.g5
	Z0tWpUlsf.2emIM.M18nDHddhmy7rIBieslZXfm7Foly2dQvtVkoLRI9j5lgDLZI24hVF8m3rAlw
	vXoxI3ziP77S1Eax3QqjwIOQzqOOPWJJ9CzS2NaR6BkWvvmMpUTDMbE4GUN7VXaTb4VmerVPAEcg
	kEJkwpSHfCC6bKsEkFu7vPDF6WYyhtA1KZ8L_EC7dQ4RhMAoDm3IdWaPKQjTh86I78aSGHnfcm8Q
	R_MlFKfwXt02f5BbkUTStiJiBWhs2LUz1ydVp4KkFwwMZ_M9oW.xGLuodtYe_s.BtID6WUl3Jw72
	OKu.47ajDG2PqcwC.ri8RT7z1Z2MS6OnVdxi47WM4dETlC2s85SUNj99529jOSmrTBkBJlgTPjso
	g2BCc4y7oxIPpAS82YMY5c5wTrfglgviFQt.GZp_ppcwjVThHFGu418mUiWNU_EIeCzCTqeGtqig
	qddhsLQz0Fh7aMz2W8ozJ1xb0wzMdbRRG99cZP4p8xbFzAHUzWuvdi3vMOU.LeDkcZ89ZZycr8EK
	EzQKEbMZIdBkVtOT8VKVJplKe8LS5r6DgScG5cB226uPtJByyAAuoHDehWbLvHtQoput0.Ik1lFi
	AmdIv9ULkVWdbuXcuYPqdixr1VFSFO31CKbiklk_41TOc_s6yx47TYyHMdus0lMxiQnu491o6JTI
	.5g8o1cDrAcNJz5L6gQMHtYYXO5Q7i8OY8ytO4EFb4y5S3FwPOFm0bAif8JltlHz4fr9DlTll4Uw
	1kn8HBStNJxTli5Rko3xYvFQfPYlzE5o2syFtDC8oXk7agYPkCt.04vkA2nmtQW25A9zHYYAH54d
	vnltX_NKty5Ru8bFNUND51S0fYckTFOP3zShgKaXuESc0_g7c90cJhjMXdzvkMuX6_iSW6KqZM8g
	jAbBmYD0ACvoCEqGKQqWIRBTF5guYLrrOsY4Yi8idTt0hBAc301h6YUMTy5.NVmKcmlwBM3d3vlx
	_5wRXrSCatwAuYFvxwWww7BGUy5GLH5P9H3OYwM1baLmll9PjNsqqVal9PeteiLhqagBILE3UdnU
	PNhzDY4tVSJzG_yJx4oKXv9DOIgjmsjAG3OR6bvov5TbQAXZoUIU25wAC6GBaZ6xyAUMAPWH5T0f
	dKFgWe3s6FFNyxPj0cE4kSkj1yOALqHgzJtIqRb4Z9MVtEPrSzkot5D5rjAC_8L8qBduyot07n_a
	dU2O_J2DR6MoNxdUIoiqrTjskQuvVz9Hd2GtvlH8DS66p7eNz6MBSF6gp7.aBtgczMsIYxDfp9fR
	pP0D12iTELhXwwRWkRcXxeu3.KzNWjbCHSS0Q9r8oLxEWnky1RrBd6wLkgC1GRsix948N.VVcl1b
	n4jX9DpMtx4a.RZhK9dhOXPC66v63n4E3_2X_XLCRMqrZwztGaUSpzabjOnp4XsyxN8JLMCwkH5D
	MJedtr2gAyrNaa9me3563_KcN5CKIa_y_4TkZ9.Lqu2kCbPyhmXbZVUNxoK_cdqxxljIgafxLku2
	uL7ZsMakCIsyrazDluBOr3tdUWfNObnRGvtPUf8StdGt_aCP8opyF6Jkji47auk1CqIOo1Ljh82n
	.LDC6F2vEJN.u6eEQRpilynR01zEIdU7CEztmptj5dUPrm.f9knry7SbQmqUOYkp72WcJd2bMn3E
	XAfRSFVBawWrIBu.RxdE8yDazoPtUtRwMQqeZ4Ug7rO75rRPXRUJF_fzl4R5lgqd6GUMLCIgLYW2
	ugewk4s7f8Et6.r_jR5Vvwgf59scehbMmDB87EudDnSaCpg7bCngmAf8fZINrWYokjLljF.Arxmd
	LsJhEPH7.3.8B2kurtmVow.FyElTdmOJsnGTo0p.EqQrgxu3cCOi.UbIkWsMGx2eH7mOnF4v0JgJ
	DyG72qI5t63t5Jp1ZEMgA3S74_00B4C0yb2Vb6x2_XaV7ppzZcqQUoRrbskvL0xUd3gy5kYrYH32
	xPzHki_.FsDN_pCqCMqhZgwBYVGvMTuWkuYhrTrsaOLF8Z8orS4lY8J3znm4g_C0pViGDiYrkcmr
	CiGXAsRrTV17LQgs.q2hfsYapKQdn1TPgwlXRwvsbELkRc9il.a9XA8fc2GugsZPopoGCWUMroPb
	43f7EFylULIfz37AxNx0GZIWNd6i1tu1DMobugRppIiZoISy89ktDzu8CoF6qk9jm5vK2ihlYri5
	n6mxwXV27QFSUQ2sYj8YLAhyEQFYsh0u15Wo7hzWlVLJxGM9ld1gHg2gAV3Bg7eL_MXcQBAyfBUN
	E4Th3TLTRc6Qo3l.pMoPoMxVqHlv2EPxmQw6nlAfj0nV6GOg0UQeTOaImyciDcwxztxToRg0omrY
	aNQ3NSEZY430S7yxCXMxeKqgqitrzgS1ec.emUyTpju4g1v804byYTs8OGSIbNlm0sfbgFs4dPem
	bvnZtbt1SlThBN.F0f1HMgnWRnLDQ7Ge0HVk65szNMjHq_LFIEXft81gzSgFLrNfe_C3rR4AMr.m
	6EtBWA58xy68aLMPlcOVJNRATozyGxq7AbzVUgGf9U_9GLiNtqIdzvGiMbsXQH8lnw3mYcvPQxpD
	vbVEshZWKaUPG4GdZZi8ZhNlcpR5v5vrDVDm6gQLk2CU53VBDiEoVzu_G05LM2EcI0Z.aNxIbNAJ
	sUwl3Vz5QfE68vIfPppqpvSpsSINDCEHSCsojGPlu6xYAlhHJYw3fBmB94icSgel.FCj8Ms6M4Dh
	VZRl32wz5ksuhcxbM.MQzti51qbtpJaCoS_DxEnaa9MRLTUO9PLKdBr2PQGLvbWTDMNaN.sFrQYM
	RTUSs808DKxQ6SmceLb6KGmFDv.xZI0wRM1ZMxT2a1ANIspINYj44hbNVCiQFJWr0qxNJ9IgqHBk
	A6aP2ftLVOJj6hVpkBd4e4HLCEE_tumNNVWcnmHtM04tcZzvU7hMyPAJ5eZgeRdnOpm2mWLslt7C
	13JCGS94f5nl5DBVxvwlFirISrCLpfmWNmdwhgYsjeB6EThWTrU6iWQvxDN364o_pqpFNfZbiaIZ
	dSnQE1NvdizW7V5afRODfQRvA51QI05hQRpftnz6ntnW.20CNLr8MuJxxYAz0T9XboWDVudqYVLP
	_oRNcWNCBeESnF4y1aWVQnxlkp7_3uWDVrZDReADgqgKPFd14ObVxsZCDX.n0D5hSSsoOcw1p_0x
	ps2gidtVFctgDihyNvbxgAvB.odMQNpqUddjYv2Ak1O9EPTAnLKy92WMjWS.7zuWlVETJ4mSctfh
	oRrL.ihq0svYetvCBbFCbVYudg84Ve9cPI49rYdU2WkPguYrTHO48vBwqZLc9JQEB_bymWs3KCC_
	5FcD4BxFtyX09Xq9kixeM67ILhppDVFnDJf.UGcDdBVNOXqLKXAQ5el1FhxhFOUWpBnQR78f2R2S
	VXiLdOtqRA86roDZ1WqW_4_m5jcwv2C8d9g--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 5 Nov 2020 01:08:04 +0000
Received: by smtp423.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID ae77dbe93dcaccc5cab788397ea5d33e; 
	Thu, 05 Nov 2020 01:08:02 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v22 16/23] LSM: security_secid_to_secctx in netlink netfilter
Date: Wed,  4 Nov 2020 16:49:17 -0800
Message-Id: <20201105004924.11651-17-casey@schaufler-ca.com>
In-Reply-To: <20201105004924.11651-1-casey@schaufler-ca.com>
References: <20201105004924.11651-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-audit@redhat.com,
	netfilter-devel@vger.kernel.org, sds@tycho.nsa.gov
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
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
Cc: netdev@vger.kernel.org
Cc: netfilter-devel@vger.kernel.org
---
 net/netfilter/nfnetlink_queue.c | 37 +++++++++++++--------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index 84be5a49a157..0d8b83d84422 100644
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
@@ -398,12 +394,10 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	struct net_device *indev;
 	struct net_device *outdev;
 	struct nf_conn *ct = NULL;
+	struct lsmcontext context = { };
 	enum ip_conntrack_info ctinfo;
 	struct nfnl_ct_hook *nfnl_ct;
 	bool csum_verify;
-	struct lsmcontext scaff; /* scaffolding */
-	char *secdata = NULL;
-	u32 seclen = 0;
 
 	size = nlmsg_total_size(sizeof(struct nfgenmsg))
 		+ nla_total_size(sizeof(struct nfqnl_msg_packet_hdr))
@@ -469,9 +463,9 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
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
@@ -604,7 +598,8 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	    nfqnl_put_sk_uidgid(skb, entskb->sk) < 0)
 		goto nla_put_failure;
 
-	if (seclen && nla_put(skb, NFQA_SECCTX, seclen, secdata))
+	if (context.len &&
+	    nla_put(skb, NFQA_SECCTX, context.len, context.context))
 		goto nla_put_failure;
 
 	if (ct && nfnl_ct->build(skb, ct, ctinfo, NFQA_CT, NFQA_CT_INFO) < 0)
@@ -632,10 +627,8 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
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
@@ -643,10 +636,8 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
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
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


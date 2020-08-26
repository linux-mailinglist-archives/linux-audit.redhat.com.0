Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B1944253373
	for <lists+linux-audit@lfdr.de>; Wed, 26 Aug 2020 17:20:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-Z5a_JgxiO1mDsEF0Eq3n9Q-1; Wed, 26 Aug 2020 11:20:37 -0400
X-MC-Unique: Z5a_JgxiO1mDsEF0Eq3n9Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D66B38797D4;
	Wed, 26 Aug 2020 15:20:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B65DF1972B;
	Wed, 26 Aug 2020 15:20:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F9EF181A869;
	Wed, 26 Aug 2020 15:20:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07QFKTAj011121 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 11:20:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DE72C2166BA4; Wed, 26 Aug 2020 15:20:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA4AC2166B28
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:20:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C90EC102F223
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:20:20 +0000 (UTC)
Received: from sonic312-29.consmr.mail.ne1.yahoo.com
	(sonic312-29.consmr.mail.ne1.yahoo.com [66.163.191.210]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-468-_Psa5K5gN2S_1LpXKUVS3w-1;
	Wed, 26 Aug 2020 11:20:15 -0400
X-MC-Unique: _Psa5K5gN2S_1LpXKUVS3w-1
X-YMail-OSG: GajDSr0VM1kZ0OF65FN7B17KCqyzINJ4OFknWUfu5MG0eIPIrtueVQn902HZfWX
	QRJ_USigcC0QuaOB4.9_.OGgrqfJv4aRa1FT86JHEhSiY48fnL19KkrQBXJ.ablryAisaL6Qx2w3
	vRU8MeZhJLQyjGGlSW994kMY0LZRhnPFn71Ov1yTu06w8I__DCTRphlSRUnwHSVod_h.0WrGaU5u
	eonjvKl.yAtO_uF8lAmKRTTU3HN4dwJ6ZsHV7gapLUiRGmy0FsG3T5p4CkdgZHxE.MaxelwFxp4P
	lvbYfQstls_rOTY4SnSgwy92mPRAYRjKVv5jNwHuIxAoJoSXLXkKPBHm.CKLK1IcVrZzHsWi_F9K
	NpP4qFP70mqNP5dU_I_dTIokfBQzoHck7sergVs26m23rV2p9T.WbNbyafhjTJ697ZIHtWt.F4ec
	cGE5VYk9zncd6g1sSMpPzp_J54VSmZ0Wxpny9GGLdPyw0t18fin2k7DMoDBE.IEe83iEEgDvQ3wS
	ZQfiGkuBsKf4_J6IK850pLIzCeUmaJ24_cEcY8IL.ksmGfBQpjbwV8KdoQvK_LHHI7OYo6X.PKoj
	3tRerT31Av87tkyz3pctiJZDFLfvF.2Qy529wWldcYtAcDhf0TfhSm1d4cya7SEZF3u15e_ZmgCj
	HnChLUAZOrLX3ymj5yfnNhyiBeutn4kkfz7i20RpWFT1ucnqG5nOh2.vWQvH6LMFieudhH5hsCfb
	D8cl1SGI7A5e_z9YjGWQ5mHzMW8g7VLkVhGqeUnjR.v1sQaM22l6b4Xg.nWiS_WG5GliKd7ChrxH
	BvBMen2Ycn3mDI4g6_pvJg0ES4jFDxlvf0LnVeKBLB7Si3UPI1dsA3fnG_eJdAWwtp2xpjgHieu6
	DzonPG6js62LKd11XQ9K_Vonx7kM3f9D8yTB3NzeeG1osuArrDc.FPpXrPQjWu4bD0nBDSriRiUD
	L02FBXsArNpAthGswV45whvqzlzf6puDrrPDTnZ0OtimLbLbKggG7dUu02K2iuTDope0r2YQiOTX
	IKS32z9CKV1ShI3m.n2TnViSlnSt.ev5trThFlsS9wfa5R9ye0TLZcwYDc6X.vImWbozGFGxPUBI
	HozLij9rR1v1d44M9zjJ8j2uiiY9S9jdzLUePFSm3pQ.1e3vSmm8_hXqHO_G34G5vQKAaTNFRUtC
	09q7pv_fUu6QMJJBVH8.dyoKuSACg_Ryy.RspCTdYELyJ5hobPg1gfWntvAp.b6P00TIuLhuBRBd
	le2snXTA1tuVemSS_7Vd91UnzwOUU4gikilFOuPmaVjg4u3qUFtltMKfWENka0ynvpcM1XAwezeC
	In.1iyx0MqFALt.h3xTrq5qkrN8kCyaZJKmMYfYWi72YhG9lYPdB5m_4HAd3x3mARlkA4Nvo0IT3
	2mw7FYDZ7Idd6wWJmBa9ixVGd8.gUIGbPgq0bO_OaFopCrX8JUTE7IP4fNUeRjS28__P7ipxW9WI
	5Al07fX7kue2HJr9i3oF6WyVfYhQTLIk6xqnNQUn0R0vjn0y2aAbcK3nyOC7d.j3Fx_RbNwZzRtg
	hHqNDw21IUPFKb_EIBawr2kr_V08SkA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic312.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 26 Aug 2020 15:20:15 +0000
Received: by smtp420.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 12a1ede8fa09b544263df0bf06dc9521; 
	Wed, 26 Aug 2020 15:20:12 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v20 17/23] LSM: security_secid_to_secctx in netlink netfilter
Date: Wed, 26 Aug 2020 07:52:41 -0700
Message-Id: <20200826145247.10029-18-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-1-casey@schaufler-ca.com>
References: <20200826145247.10029-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
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
index d3f8e808c5d3..c830401f7792 100644
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
 	enum ip_conntrack_info ctinfo;
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


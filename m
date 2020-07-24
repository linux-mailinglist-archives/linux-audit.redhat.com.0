Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E9E3D22D003
	for <lists+linux-audit@lfdr.de>; Fri, 24 Jul 2020 22:51:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-8ZcJJxDxPaGZhBWSDt-dJg-1; Fri, 24 Jul 2020 16:51:53 -0400
X-MC-Unique: 8ZcJJxDxPaGZhBWSDt-dJg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AC2818C63CF;
	Fri, 24 Jul 2020 20:51:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F5095D9D3;
	Fri, 24 Jul 2020 20:51:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE80B1809557;
	Fri, 24 Jul 2020 20:51:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OKpdAr032656 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 16:51:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5B634EAF9A; Fri, 24 Jul 2020 20:51:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5626BEAF9D
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 20:51:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F57C858F04
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 20:51:33 +0000 (UTC)
Received: from sonic317-32.consmr.mail.bf2.yahoo.com
	(sonic317-32.consmr.mail.bf2.yahoo.com [74.6.129.87]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-231-kW3ksByzObyb3MCpN-9SAA-1;
	Fri, 24 Jul 2020 16:51:31 -0400
X-MC-Unique: kW3ksByzObyb3MCpN-9SAA-1
X-YMail-OSG: 60hSpgMVM1k5SqOQDeVFnRBkvShqHBYgDb8yo9goNG1f0JpgcLBrKtXCJs_xPwE
	18QYPUr19UpDoNGp3n_rp9WmDgo60xLumoCT9IFWRCld1Y_CRNcetAWa0y2ufy6c1uL4JEW7qlBQ
	NxL.xgtXDQ0dAfsAJIZzdiPOYXZfl0QaDYncnGkPfRTMC62Wzg.Zrqpoo2ybVz.t6LLywqXNtCdk
	jV4fe1B_DKNi1f6alZrSv.x8q2eL1jmoBndzmm5iskpzmUTF0OFaUYUHXzfT2.HV5Sl5GV4Wz0Eb
	GrdK2f9zDhkERA8Fblq55P.OYHVrOxLAnVwoZwgWQbiTDMZsmMw3SYlQI3.8sQnELTljS2pKi7jd
	o0qzXQicZsfkGOIGCZYV6YD0EA2cjjWVTvEkP.vEYEkM.l2uYAtEaep922.Ql7LNQbhgKRKDhf.X
	x2dyUJRur.yNsTLfadxUXB6pfmeGIBa1ZGcKY0X9bLO7nq3XCdazQ70YQBWiH7zbWyPntcp_mQFa
	f9EeBITNrZiktZq1ldo_qX.YAnTkTtPGbV.dNv9.C0w7xayezOexf02.spqjoAE9W.kG19ocqwrF
	lvQ1xU_1JPRCPr3PgPkEINrq2m9wxrUgOi8_OK5nWYGQdPnPXFqS5sBv3BLYJew5o3hbpp1GrtbI
	b7f4zxJ53WOjJVoMb5_gdrFjtacDoWXsth.DloiuFo6M9iSMGO.XG3yB2eT.5Vwy624OPbAAarqw
	5g_2k6VMnmQka9KYfxfnaYhi8xsaPTcrKeNdci3CSHE9zGgoDDFWf7HUFf.aWN_CaG5Q8D2IXoOy
	Sch9gx3b6_yALjxTRyQyUU2KLQUlJCo0MyP7djvK3LayWWGGmaqmSQfHD0ai_.o4vABRhTFT8T4H
	EWKMz6m4RjC_swnN1vbnTL7nEJjyaUuj2hvEEbYa5rURPZrfwQtrNgqABp6.8VArPZdYlMRLLMZE
	fnirULDNhwmvRxNQCvF85tW7_ucWEhTP7HvJBH9qszp3PRSx3GLXM0M3Nz08BwWiDyh1.VMKOjLe
	ppw2wWc.URsh6gb1QhMu_n2GXkxWWFRGqdnh7BA0ttrzvd1xcC1fARXvXxGv19K1YxkphaCnSt2F
	8otCYMplRQ275PB2gCcMt6aPNUBCK5vXLGH6UM0pcvca1VOWnLjOuilh8VRcdQBci31NHM_R7.bb
	uJ.kONA9k5SH5rqw96MlE2OTFZEAotY67glJHI0Jtv4yRtmsdZjY9a5CtOzGJqetPRhF2SuAgFNe
	6Vrzxdj1jf7VW7zszJ5vRH40OOKLVYLr8NsfoOquwirDA.T0B9eOlWh242T.zJgqVB.CKzcxVtGn
	kpFJOupcK90LUTVxBP0TJHw9ION3FmEnWT4oCQNLyJ8zTN7Wts_l2G5YBbPWUimGINDOPGTJlhHP
	e9yf.14rS_62xEwU_uYQCLGAtFNdO25M_VuBBuY18
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.bf2.yahoo.com with HTTP;
	Fri, 24 Jul 2020 20:51:30 +0000
Received: by smtp423.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID b2481097b4d838262c5392d963c16744; 
	Fri, 24 Jul 2020 20:51:27 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v19 17/23] LSM: security_secid_to_secctx in netlink netfilter
Date: Fri, 24 Jul 2020 13:32:20 -0700
Message-Id: <20200724203226.16374-18-casey@schaufler-ca.com>
In-Reply-To: <20200724203226.16374-1-casey@schaufler-ca.com>
References: <20200724203226.16374-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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


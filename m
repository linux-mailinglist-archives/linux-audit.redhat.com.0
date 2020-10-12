Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6671A28C292
	for <lists+linux-audit@lfdr.de>; Mon, 12 Oct 2020 22:38:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-2jo7XDNAM3qRpGc-O9iffw-1; Mon, 12 Oct 2020 16:38:14 -0400
X-MC-Unique: 2jo7XDNAM3qRpGc-O9iffw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CF6E107AFB2;
	Mon, 12 Oct 2020 20:38:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42B92380;
	Mon, 12 Oct 2020 20:38:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E87A458108;
	Mon, 12 Oct 2020 20:38:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09CKbGPI020351 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 16:37:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1CD442016F2C; Mon, 12 Oct 2020 20:37:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16B60207A80E
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:37:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B755811E90
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:37:13 +0000 (UTC)
Received: from sonic317-38.consmr.mail.ne1.yahoo.com
	(sonic317-38.consmr.mail.ne1.yahoo.com [66.163.184.49]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-304-H3qIZChWMG6d041WhWfY0A-1;
	Mon, 12 Oct 2020 16:37:11 -0400
X-MC-Unique: H3qIZChWMG6d041WhWfY0A-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1602535030; bh=cyu7IpR3Af+V+mmg35Aq2U1YaQC/Qy5M/S9WX2BGOcu=;
	h=From:To:Subject:Date;
	b=joQTeOuOya2KUkMqAas/SfXACBBcM45RXerqSg1vxLE2tgkwcX1ZxDzVn9kcfImfbnzTJzGswU/bC63GN4cGXi0QSodxDrKngXId8jDpgUjCcZuseiyM/OHPLI0wUxwiAvfPI2ABCns92aEun/NpfgH0j2SzSly3tqmXCfqE5kEsK8sQODWY8vkVzXDo4hXgfPIFvJQI7GtfDRt7zZlmT7vPKEMGfOtouZFkXHkTztjHPxyl88KDGfdqaxVeQy4jwEj4SbbGFn7VgEE6jOQmH23RfwIJNEcxoFUSrZ46VA9P11wlBV9gx6SGb5LZp/3NiPvdKMqhDL9ZNxErrLOnRQ==
X-YMail-OSG: NXldRPQVM1klca8zFalDBF2V5rpJNj.d66mW5Tszt.iS06p95tuc.R7cxu52cMu
	v77yhROaD4LQGDxzB47GFfZzrJEPYoH.un86vkn0lWkiC9lQkDMp1dHBPLJsjAurgw8vNAw8_Pmn
	w6oPyiXE3Q_LgCa4QS3ojcIpEZR3FvMeU.UCapRovsBnY4GX1jtmuGxhTfUmdOJzK30jzYhFjL2U
	BJRcD8qwueg7vsdCUGLQZiMnmhPd_hCwj2ZdfJp2ksXLRI1yiAsLdg.7XsMBaA2R2i2nS1UuePyh
	Skbbw8bxvP_Bp6vRdC.mv4byiqdAwGB3QqmIIwY0UZEAIV_DqwjoAMIdtKNZO1cL_pLXWzZYCdn2
	eTXhndibsNMUMACl85WLNz.sK2P9Sq9nDjyLglLddLSPJYNe6ea.ry6m.4Uca2keY0RRiC1AD3tS
	4OOehrBbeAGWiAwV2ynFavPp3io4dGP1FWZlK5kP0ZCk8rwJTTq0r2ZHoJYPAw.Wy3H3sdmmTMhc
	ZgQ_UrAevpds3mNBPfG5chTMb79MUmzC1lZkPmg4K4OS97lwlECQuk5VO6XCDSLVrlFeQymby99E
	ThWgipUiPVFX_svI7vAfZgwAimCxGyWxNkSDL3KeE2bI17b8yO98LSbaGTJJi2y.o7TtI3E9jMkv
	pn4wUvYenk7qzbJEz87XQuIlLsP1FUFro8iZ5oEUTuGnP.YRuCIUJnjx8Q6zP2NbBQVhfQ_UjjW6
	szDyvts_zZzrgi4AlBcCYzDou76WRNPZmyDY4YxxFrfsL8Rhffr0774qexUUyIu6nhTDNtXOMF23
	Db7P7aZJOFPO68TdBY9QvDES7kVlP.IDxB7UTnPPHufVz_FsZdHAiC3EVe1S6m_EniIeQarCjnug
	w4cua0GyVVhCWg7xVYs7GOoxDLBPiM9yeVs8hPXRpFtL_XRX0oxRjBTPETF5qWvqq9_9yDKDjZWp
	1feTLgGLYpEk.TYDMZfSjKj2ykxv3Bc9kbQCpcIr3jusBsKqdGrxjL021PhjtAEakswY8cHpcPI8
	4scoXrGjIQ22HjFzfG.jzclCJCiG.UFlml3nja8kp9_XaBWQtu82hG0IN1pWVN5DndDbx.gzEUo4
	H5ZOpSjvbMcbC9.BTYLvjcD.vUrPrdh1PPPxgCjuMTisYlmPyK02CNi0KCnNiSyYqfkvkzl5buHF
	ccD3fSv8r75jHn9QWVRYriz8Sfby_bgtQTsJ2av9MfHk4Xynj4wg4Bs8ZIyv_rEeaQXM1sKgxt9O
	z_e.TpUI1qd.NL99y94VouYTGuJBhIyr6bY6KnGqbeqZALdF.sMgd2qQkHlGcEcKlSe4S6psn109
	uvBNSP2AZFpucx9dp_VbCMJgpH0YHb.ayixYZNGY7b09zL1qSKCSDw.IZZcp4qymMdiMtfBjgnUx
	dklzfw3uHv.x7FHZfKMhmsbkieh31FEk55wcDM2c55cVr1Nvm.sNVcUUkO98.1U3Uiu8xPg1.Lw0
	Il0o_6_ubXYfXl4v_tMG_VwqYa3knZU0d3KkboiSmlhD_.Q4G33bUialbFu_dIqjXJ6d_Rky7Lha
	s9LEsvDdyqoBgxxd10KgZ.fbA1_kWIqlJNYDnx9zk9ZuKESxr7qDjbA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 12 Oct 2020 20:37:10 +0000
Received: by smtp416.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID e62583af68d35fda33e6a51faf5fc845; 
	Mon, 12 Oct 2020 20:37:05 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v21 16/23] LSM: security_secid_to_secctx in netlink netfilter
Date: Mon, 12 Oct 2020 13:19:17 -0700
Message-Id: <20201012201924.71463-17-casey@schaufler-ca.com>
In-Reply-To: <20201012201924.71463-1-casey@schaufler-ca.com>
References: <20201012201924.71463-1-casey@schaufler-ca.com>
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
Cc: john.johansen@canonical.com, netdev@vger.kernel.org, linux-audit@redhat.com,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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


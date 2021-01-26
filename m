Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDE930447F
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 18:04:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-q2myZxPbNjOLYCmqN_ujkA-1; Tue, 26 Jan 2021 12:04:48 -0500
X-MC-Unique: q2myZxPbNjOLYCmqN_ujkA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E35F18C8C02;
	Tue, 26 Jan 2021 17:04:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 614975D739;
	Tue, 26 Jan 2021 17:04:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08B791809C9F;
	Tue, 26 Jan 2021 17:04:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QH1VZ4029838 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 12:01:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A0C9E2026D47; Tue, 26 Jan 2021 17:01:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 994542026D49
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 17:01:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73AC2811E84
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 17:01:29 +0000 (UTC)
Received: from sonic302-28.consmr.mail.ne1.yahoo.com
	(sonic302-28.consmr.mail.ne1.yahoo.com [66.163.186.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-579-PlwGLOVFNWOKpGjXh8A7qA-1;
	Tue, 26 Jan 2021 12:01:25 -0500
X-MC-Unique: PlwGLOVFNWOKpGjXh8A7qA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1611680485; bh=bVuCUsFGKiRWMV4Cd81rbOX0bsQ6NomNR9M9qO3SiUj=;
	h=From:To:Subject:Date:From:Subject:Reply-To;
	b=mkRf8Sr500HyLv755kQNjemWkXKBVmKaYZ+TAZytOsNTa7dU57W8mW5+iEKC1BzsTXYIijQ69ZfFb+2d7HUE22J4wEuiiyNgTKFws6DeD1j02ZUbEjbnud+3RRaGVGpxxkseh3iP415BZ1bAaGT/l/8bDoKKnEk4bE4ek+3dNnAvbVxeTs+dGldUAOnbO43EszkWki/xkGpQVSU1Fx5zqgCBMjApJOqUCsIEqAJEVvyQU+dUb20qUidpbHjL2EuwqqP1OmPOe+zTonnZSMgnVQMD4N2ib2Q6t2T4CdPWjePKft7I/BufslXfTeJ5Y+qAaRXLPXG63b7pOVAhcxVuig==
X-YMail-OSG: iyNXdgMVM1l5kVouslgwArlYw_zQUwYhnjGiVNgegINh71EjMeP6nBim2DQHaQn
	mrPBuQCiT595uHdwCAgFEUjwvaIy573GdC_VwgtjyMQKK6eKCGIeNq2xjsJcvrE82ZDWwmIGt6Mw
	LshpITZ3KfjsIxt4l75SI7HT1_N99.SfCEAuu_uxYXKbbjotmEiwO5qKmajbcWvTyaPbATPXpFzG
	jbBweaV5x9SZqylU7t6U9GM6dq4uDpp0tVjlOYtvK9iHf_U6wait.1.fAFz2eFo_j01sjUOP91wn
	P.ujPJpOH9TXCzNvDfO8xwRRAbBCkl1TATU0IWPeorZ90cq5wMYNXhQhfj8tExD3Gmn8IfDVX_bx
	75Cypv_AemvzXQ4sEon8ZirkLBVNtHZopGA66PfZPwGLor2.I7lQZ.mbTVZf4diwCczPRnc3Qfwi
	QWOSdfPYv16RByCaKujEXvr_I5vItVEblV_pgcw7EdkBLLJDar1skC5txxyAY9gPUONelZmPsH9_
	ZN_UCW4SdXItrY1VDcwkbWL6VLL3iZ0q4hc6NQ026lS40VaW0aAexEUvgeNyw2LDvgZ_HE1L5joI
	200XNHLQvvIeKMea1K7bzEj0LPLIQi5ITTMfc6wrf68GjUJU93D2.GBaNVfj9.WGl786A5Xe_QrI
	dhyNIl8qzDNiGF_b.KECjHfaqwuT9wMXqUmv_kYQW0Z2kokflldmgHW1ORkqbincjJIEfL.iHidQ
	_5DOYJ1B48iGRoWw5VOmHhGEZ.HZD9Q7lJLMxzuehpGXEdOusMKzKKJXFcJ0LPLrytKUe9.q1O_2
	qO.xNXJKFyPl5YXxm1unN.8PzL.8.vxnl8UU4ZFxfeQHZK6ZVhgDLgDeVIu.P4S3FhM62P2ppSl2
	q_WLlyIHPaQzj3pf75ZquiyaVI6ynq99_REDySB24h83Q7gbaMnx3TE6w8OPq_V02IizduuZGs_S
	If_ibaIpYaWzgRAVisy5_v6feR7H6uY5DrtEb5JO2TJS.57CEjofKhJX_FP7NsCvq4NGN6WucIsj
	kRxqPgDs7QlwFDYCSsddZCIuke_bBvzy2ZMw0XZYmSXcT7m1ic9cO6dFDCu81Y4A_3b40dGiY8Qd
	KlHOn9vwtiBdfMXbMvnW7FPWZLivVm_wr4kbicAw9VR7BanJpU4nhHBR03lBofOQR75gA5aZUiUJ
	FH5Ra5jLNwxS5uuPYcpCKytVGytaO9Zj1atoy0zGlh95t9PrF9WgqAJ7TnKktir0NuyqYkEKt6R1
	KJolTQqCv_0EzCECyjKyzT0jbDrwqQhongr9DYgjwqr_Qw.Dwyp8cF_248f9bEpwBSSDjpe4w2vn
	P1lbIMtnGGi7WIRorncBqZYFofQa0ORSJGHkdLUt7KFBA.DWM7cUO36yyo9CsLHA3tFvc.6WH3Rq
	BzRdTn1tuj1J4hxkpWU8CkV.ejbVCsJOFogjpquGsyEZ7T7YvVFHc6r8.D3wdyfKIaIh7wClDN8s
	7f04EkKVSTvTYNMm1Oj8Yg2ON6ljCe0LLGXxNP5zIw5dhxUjhxfZCCHfrJWS6V30SdpKrbatBglU
	uorp11tqBMSvh1P8nupoJq6tI3yYxVxEmusnHWHIt0X2e.ntgchDLkKzprxN7ekQajzJGtA34FEy
	tXd6s.b9BzlqUz0CYUCxHPcrVL_jgIvTjqHdub2sT1GAKFDOwHL3rIA8N6Hf.Im76eeySbmOXioq
	fEw6dx_H1RdMuB0yb1ss6OoRJrWbpSMmSQro95QEZjrfeMvau_s2qB8o9pQ1BOQ101znya1iTq7L
	u09eVKpZPgetMxzBmL2_6MfqFShjOhLRuFa7ujpUe9qYgGi5QD_0Y4gt7bYYQsFhNvQIEMCIg4XE
	POO1NUJB1BwL9mlMOCdMsQHOMNGqdj2hWyVt5x0y4BIAEvviSdc57vZ3JzPycpPz5IUpexXYfKVQ
	h1Jrim3g7SvZUxxCdzv0VcEnTICfNhu3DN4Rz_7TZxQxtnkOW2X3iZ.QeyiaRmQXElCIhLz3Ml0c
	GXUt8Nw.5Eq2WLoyxnSRvbnJwbDw9OrONfGYMhxY9b7isfiK580qTeigB3MfiOhGNuiBogVoV0Iw
	ph9QK1LoWCAKvYNqIHhxd0uaH5t8XU4KrJ.MbH71a.ZUu2roLfZ20vmPwDrv6y2A54xXdzTOWLGl
	VSB3fKFCM9pAYgTzdPBrGjpDMXbcEtIy19lLPO5GKgEgzWxbMEj0jpe6xAfgHqwHwbM7a2Yd8Vjb
	78D22yqjs5jBlQU4thVMB4yVafSA2iHSFjQimV4MFoD2Au.XhGXoh6o7y9hI2a06Y65Cxjfibrhg
	3rE3MiVO.gvgYnbUYmsAUMDao1vuMTYSVyG9EB2KndCYLlbx__4sPxvEsUJgfsECoMJ2xMJWNbJw
	s2QuHZDDVc1_wY.GAV4nxvwxgK2g2Vigxyzdr9BUuQGFoDxEWbtlCgVaRnDqn6Met3lxtfr3_raT
	Wq4J3UYx0fieu5swyDAtNIx9YocFJ_7pzzKa5Lj4fiWRWfr235T6oTlq07lz6Com_oqWsNPBykVx
	D7ZyNnwvdMkbYwp3rc8RnWhfRu6AMNQ0mzP8dD4jg2Zl0EXI48psQnUNN12t.wYojcYMl28hwF_b
	Q9wXc1LZiiSm.EuQq1KxYb3SzXA4307t_OIo4GwgKw.yDRv_zY2ocn8nKR_DFMzijdswcw3m05yV
	9URyOb.AwBdahIlCSPbAhWUEsM251Zj2HIQsR48C4160SS.0ArO18YVNqeIVXIKO8irrRvQGThVz
	s4GpieIWnmU4i75yjykIhK2ezHpRG2dknt1m3._hxQtUYwrJc2mUpqx3sCm5g9vZENafv.pJZTTX
	rRI30Tx7tXYmeQkc_dfb34PBVEQ37YldBFhnS.MzPA2l6xv_LMfMPnW3xHJ6yoUinI1EBGRbn7e3
	JrFF7hXhZJxE274wCVbedHLWb6ENfiG0W2KtZqAOf.Cdt9my.M7Tq9rOIqTKFrOcIQPSGiqdKclp
	ij3wPs2.goDZ4GDOF2qPi2__eWiRNBEh1rPWC7gX_CnNWl7rcaUpdUeaVhaibDB3oH2uTRhkXxpk
	0yM1GUIheVP2r7FWMzZUmTO4ugiDYfKuXBCxcJom0nAZ6Gus4.uxmQ_Cc4yIrOJaByE6HiooxP3a
	YWUxmbNVisml33CCB3h3PUmuchQTuizCIBzbKUFLBQ9uJrAFvZ0OM0mfirybxVNPNdndGg4X9.u8
	SEEreVft5Cjxw59.YdvZQgKr6KUfh74rpktxIvp42O404KnihkWpnARwDbAfFHZ3CWhXjF_ndrZo
	7YdKjstm5rrlxRlrXR9CZraxqFELqytB5t6pEGHVvxaE-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic302.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 26 Jan 2021 17:01:25 +0000
Received: by smtp406.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 95bfae2557e9d921feb8a05f30947867; 
	Tue, 26 Jan 2021 17:01:22 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v24 18/25] LSM: security_secid_to_secctx in netlink netfilter
Date: Tue, 26 Jan 2021 08:41:01 -0800
Message-Id: <20210126164108.1958-19-casey@schaufler-ca.com>
In-Reply-To: <20210126164108.1958-1-casey@schaufler-ca.com>
References: <20210126164108.1958-1-casey@schaufler-ca.com>
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
	netfilter-devel@vger.kernel.org, sds@tycho.nsa.gov,
	Pablo Neira Ayuso <pablo@netfilter.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Acked-by: Pablo Neira Ayuso <pablo@netfilter.org>
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
2.25.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


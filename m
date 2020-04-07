Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 069E31A039D
	for <lists+linux-audit@lfdr.de>; Tue,  7 Apr 2020 02:21:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586218861;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JTqI7ginojbXT9WvJ4zDlcJf+b2sKhPitcsoCI7qXcQ=;
	b=Z7bhnIkomXPoTjE6BmgR+eTsk8SdtzdDsPXc0xVf5IOSRnVDm/c38QaiP2bMGanaEO1eFT
	V8AYAGb/whezKzDiJva0IIXKN87H4u+F2wDAegEJ/yqk4S9BbKKcKmYFVXz0D6iAjy9Gi9
	RH8o8sVR0fN5Ti7deIaqwXP653/26xU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-lCn05oYdOhiJ4iph0VxiDg-1; Mon, 06 Apr 2020 20:20:59 -0400
X-MC-Unique: lCn05oYdOhiJ4iph0VxiDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F9871005516;
	Tue,  7 Apr 2020 00:20:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5986100164D;
	Tue,  7 Apr 2020 00:20:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9336018089CD;
	Tue,  7 Apr 2020 00:20:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0370KngQ026047 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 20:20:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DD59E2166B29; Tue,  7 Apr 2020 00:20:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D976E2166B2C
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:20:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 409FC185A78E
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:20:47 +0000 (UTC)
Received: from sonic311-31.consmr.mail.ne1.yahoo.com
	(sonic311-31.consmr.mail.ne1.yahoo.com [66.163.188.212]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-446-mXJccMjaP-mgjZyffM_Ynw-1;
	Mon, 06 Apr 2020 20:20:45 -0400
X-MC-Unique: mXJccMjaP-mgjZyffM_Ynw-1
X-YMail-OSG: l1kTWOcVM1kOHuppWU6odZDhVsdBmDG5MeXte_siIlauEFtxQqzDJLLZYje.OfX
	BT7HiLy7LlhBsEJnANMC712t5vbpm7ZeKsKsz6WvhiVdlBCvhAitpJ7ABtdRZWLf154XHz269esw
	n1OCys4yGe8X3YHUz_r2_VpcjmbsXUi0nPGvEpK158ndVmUqgsjNfuM0YWgKkgw6G_1zPdBi_NjJ
	Pb3fMzMO0QbYV0CBCxZcUEQHLe1UD8NYo3jFicuq1DDOs7MTsvh5vs_dqJGY5F8EcTRrwjjp6WRx
	vqEAh4zswAXYTSmcfCwQurGPHm.6AeDZWsEmoZFBNVOOW1A3IbFqjJTYpEkFMsAfkMLcUnbYfi05
	Vd56DFtzRxRuvPt1pGNmUTQDSlVTMIcFO1mzr8vhtTGG.v.cOJfJ9fr.joSeYlFDH.A3wXBIHXC3
	KYqnGijQDp4giKzGGnx_.YPe_kotjgDr7MWZ83Jogmr13bG5GIpeX_jacy.6TORo8yedsEGH_uWh
	LYqo3JgZ_IOFR33HaAXSfVDuSa5JREWOtYCfr9bcK62dudLVLI4bQPNxjpLbml_7XIr0JoxscrPg
	yamddYDpxd7GpJX55z7zlStridhJiP_MKzCkMxY37Q52qzFLyZj29qGFAZOWPCHFqWA7DodL2KFn
	B78gHw1SMf_p93aOvmS_e5DqRa8Qh3Y2H0YUxo8lGmxs5PGXZDzXfugCZIs0UGbtTuHHVcUJ92B0
	ZPAR5JrMZcvJZDQluflHS9Opsx8YiBJDYHhFMFA0XisvYHVjHB9v1IwKP6exqiiQDDL98DIErYEF
	vnRaAOFz8c1ELyp6CN2Dr8mZhSp3tei4Vyl575Wqh7boM_D7ZjG2hVJC6z4A8JOab.hnfi18KNJQ
	olrQ4e0GyusFnvei47JSd269agrPrSvJ0iLeWitV1c2yFMhUR7DJuvdGoOLwbfVcbxoQWXbvOT8o
	tSiOuRO5daXCSh7PE65Mtul5cbOJ5eau7yz.8sSDlqaCcox3_KfKDGfuZkhEbaYsZov9quFlcgtQ
	1UeCE2_8ih0hPKa1FLKHR8H1P3zbhD8k5v4XDV9QiqkcNjYbByLnnpz24jzTjti4Tj3C2tKPW.Xu
	6fOtbaPPsqlxpLpSANV5wBEkOvAMF8vbbw4cG.cxeqi4XRKlkU121xBlUPojwnx4.xy4f1o.EIPO
	E2AKZdRl0oDD97LXsQlz6OQ_f721TZNrUlVOA6BbuXjgKJoio3jlIDmiwio76UAlTBRmfbAZx5RH
	zG4Rgz00DZ7k1KS.pR08W5aVkKau3qC02EHDw508ux9F7eh1DVeySLqri.dLDhLiY.QPpLCqLQJS
	yvSPkHvA.KRG_TX1Ywxd1.FeebATNFlaThTAvld6Rh3JHL.GptnBP6DsNAVcHEyoZHaSD4WXidZ8
	Bo01V2vn2MH0DkvtW6CZHk5YN3bJMfFQO2KsHMQJRskCzDWey_v2J391vAa4DVVemqMB0
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic311.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 7 Apr 2020 00:20:44 +0000
Received: by smtp418.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 86f2db2525fe1a2c095fcf4b017ab2b8; 
	Tue, 07 Apr 2020 00:20:41 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v16 17/23] LSM: security_secid_to_secctx in netlink netfilter
Date: Mon,  6 Apr 2020 17:01:53 -0700
Message-Id: <20200407000159.43602-18-casey@schaufler-ca.com>
In-Reply-To: <20200407000159.43602-1-casey@schaufler-ca.com>
References: <20200407000159.43602-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0370KngQ026047
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, linux-audit@redhat.com, sds@tycho.nsa.gov
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
index 880da01ef4d3..d07900c317fd 100644
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


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 765F72A74D7
	for <lists+linux-audit@lfdr.de>; Thu,  5 Nov 2020 02:17:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-1ejhzbmBOjiPWV_KWwBirQ-1; Wed, 04 Nov 2020 20:17:02 -0500
X-MC-Unique: 1ejhzbmBOjiPWV_KWwBirQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8FC957090;
	Thu,  5 Nov 2020 01:16:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A825010013C1;
	Thu,  5 Nov 2020 01:16:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 774308C7DD;
	Thu,  5 Nov 2020 01:16:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A51GJDP030998 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 4 Nov 2020 20:16:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 16D6AC54DE; Thu,  5 Nov 2020 01:16:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10EC3C54D3
	for <linux-audit@redhat.com>; Thu,  5 Nov 2020 01:16:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE9D185828F
	for <linux-audit@redhat.com>; Thu,  5 Nov 2020 01:16:15 +0000 (UTC)
Received: from sonic301-36.consmr.mail.ne1.yahoo.com
	(sonic301-36.consmr.mail.ne1.yahoo.com [66.163.184.205]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-455-ZCKwBVzsP5-p__MiB3y86w-1;
	Wed, 04 Nov 2020 20:16:13 -0500
X-MC-Unique: ZCKwBVzsP5-p__MiB3y86w-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1604538972; bh=ZAFMtpEOnazVgELbNLnWZ7misYOeJpXC6zIg5jypNKI=;
	h=From:To:Subject:Date;
	b=NMUHFfokFLRYl6F4JhHwSuPQJBTwDpCERNHKVSFKVb5YcUDYp6+BnHzoWYrLEtk1FCN6VTCe0xDCUqXKl6ssb15OJP9tJreJ1Tdt4Hq3an9eQ3BXWhfUztZwmNhMv4tcRFWjlupv9Y4OxP0G5md/us6EXDySHYAoCuz2Wyqiun99R3x95b5tE8hHlrNihwwUGzKk9xtFNqKxne+onppOBt2Z1MBOQQxOgorcq0mXYJJmUA9hNShQnEqTbMMyPRk2lxXFhzXDghMLbmtwwF24pfYsHRNwMy1/WBUqsw3eBYhdaUgWTFt9Gry+mNIM/Wc9CHsr8fI3V+/nOjTu5yPG2Q==
X-YMail-OSG: uz66ApoVM1l9Q3PPl5hgCxQ_1ZcZlcX3DZQgALm1T.elz3Jajx7r1MfjZV4eHLX
	BojODkcHJx1YIWXdAxA1RBTkclb2Bj3wuZz4IgNRe5KES._QrcQcu.3owhzxbb.hQNe_3bzQ..3K
	Z43gJ8RHG80OVbKEB7x5TEYpCXiZ_v7H_v6Du_eXCp8Q1mR.8l_S1Xkj2zDQIpTZz6tiKRwZbGQl
	bW5GibYbaEJCHIR0wj69mxRDPO76eNDu37RUOPX.tG5djHHuHAAExjd_qEvogBgh9N3nXajzOnZh
	9SWsgE0Q62MtoELIKspRscYTvY7ZTv031zYATaxzRa.qWRGCD.IWCPpQW7H14IaF546voMx6XxNK
	RMJiVWp25xXlRGOAJtmiUYgUsLQweC0CTrap6EcqiLzWKW0XPalGR656uMWi5b.Z30omTWysR4kO
	_0ziEM9ec0dqYC83BohF_BKbSuut6UQC_83FtVprPF1ixFRwDt9V0gwsf5cWvANtb3TuQhK913gi
	O1.nqhMSxS8f0lGcssn50OsEO1TDr1knIyU3H5rhHWM.DtBQrk6BUVGfs2d4yoOaPwE726hvzN3w
	fMHX5TivDxd1xpRFza6gsCY9R7HWT7NYCdRwBGoXAu54Kdr5Mmh1jgMDsuMJGYHysHhxSop63GLC
	XuPngwsbcA9BeAmR6_Ywg5sW.HvYpJgUz5NDJSLMwCnlx3JdiGAkj4eTkgWby7rgHpIyOG8X8zoF
	.dfYLaypTiESp574K0zI0I1pgGT6Z8SMQdv2tIa.LutsUyC.m8W0C4wKwY.RuVLo8VkUmdrG.ynm
	qE6bHFQRewQcK4b5criXYy16_rWQOJev7TwfAjAGe77e_lsI93J46f1K53oy.W2ImKVhzu6LnsBo
	4evp_56Q.qMD3zEEBiCDqavl4vS8sglctFYHzfk8e37YHqXFY__7WGfkYZET3MVV5ik5xAk.sxUJ
	LexEFNPJk_pbkYjvL2.iNoUFcTU8rqkbLDKN9HnLbVJU4UWTkeOeI0d4jjVXyQ0EcD.R6hZW.DT7
	qvF_4yHOGDopw4N3t7Gt3SSG5vDspFbpxOitmEdjwzdJBMHIYsR3rDsWvJesDo.7KiUtYCwqCj2K
	xYHkcZGU6AZG_zwSgY1YSwl3AFsn6j0ZzHQW0ADzVQCH.JxkCcTYuzNl8w.u_2hKyMIZb3o9XZR9
	lT4PQ2F3.dpgYqZufDjPo75Iy9Dr0J2Eh2ep4suA0IHMeEH2RHZ7FbotiVtv1IJSseM6LfjgW13I
	tNOHg.SdO_DF7gEOYXDF2EmD4G9V.6.jveEZhKBwo6zIKyT2o3oZ4rGsYfZNnlt_ePjVDCLTZn0N
	49X9cSJxP_ZxdmZl385.aGTIslovkrqZcPGLs2Z2q.L1MMD5rCD.SDni8u2bFM8SJpUWPssSzIQv
	nvWW77jM1ijipPKUaJAwA5iJ3AXpSsdugyiVCHU9EjPFoh5NZHLR_LLphkazGbCMBTAgXwXWRD99
	DD2Bmkk4f9KdDNzUpvS3qckuxzQ9LwUijS2L9oq7eGyjS9rqiaQPT_wnkvCicXGrFTmGU7ZC3jwl
	SBUvV8tnMiEc19B_ZCjlJlgGhIOooNKu5o6ieVFWDFeZfqEuNJAykF_I.t1GVofipSemcLHxRdSa
	7zxAFWJTBquKdQs9S_cVUMPkYmlk9YRe1QT2Hr1k93.ebA9aY484YDBHVZ2xNwHa2N5QO0sKxcxr
	XGJhPpwnOgL2hrchj6LPoo4OS1Wcr6CxXeIT5BTn6UvrF4g7awp.9H1h2EqiWQewy8fB9kwJr7.A
	3ko6aW_0.3rLzaERp2zPG6wySnz49BNTT8b.6g8Unq93ECZJYZ2aLMxOqVtHsIEqcSW8n7PMU1UO
	5r5AXjG7l5qHz_9c9k85Xa4EUpG0WUx0yecUYNDXTfmYuSqpE8U9NcYm_qpkVKZL8h1SJEy9p6xz
	8Nm5Ejkh6boYRUHRIEZF948NM4hXl2yvxwhcM2RisLswq0ZxAFCL8HgXurNqC02TfmvXjqWIOCAf
	VLqYYx3Yu8ktjbHRvl66ncjssthS5DupC.qbi6IyLlPFTg5wUrijfZPThkjcv1siO7vX1gprq79a
	cGC0ClYThZ4boTZ8X7foPG958k78EOi3osvRhxXugkPI5O6I1z_6HllgoXza7Ben0gFmQQs4Htjk
	6tYCErIhOpM3KjXZC0CKZoMj5eltBMnbvsq3WL80c16KhrM1QJjc7X.1cIIunUntZe.J2CH1qjar
	5vr6QNke0s6UA3fiV9_KO9MG7qftOwqa0oogCzOFx19yyHfuMSdTCJIkZv6shpT8SdTlfDYwDSfn
	314U.WqwvD.qRvG1FLtt3bxQfZXa2hCdJ8yCEtVCED1Vk8qwLWyHcNLlbc3nFGofe1Em81prZOTL
	7X7h5klhXSx4OqEaWAX2XJeryj_NK16ORB6ISSee..nFSBoY4KnUNRflsAjEb8S1_odW1bEvoJzz
	qIsWSrBS4Ifw_zc.ThVOIRlX.QKUuHUV8CBSc7IQcab9WS3rvvtJZFipSGdMrchkg5JyJOkNpKaA
	A_Y8ObHKewMQP_B4DhGs0b_kgZSxMBdcmeLdGJcM21AUnEcKZk0TrhgYV4SvBZdij6Fgt4hhjvAl
	CJj8rzZgFkMACQbjzkMKLA2nzYBP12MDc6p8VTewq7qqC7wuwx2exVamUAFtnF9qAazDOVLTkoE0
	DCtcfAv_16zH4PA97M1gNQsClYZHxyc8gZ4MHLZ1H7otMeMnyabqeX__QJWnjRHFQaZhpcN7j1Qb
	CayDtU6Bp..Nd2NHhmkwmhRsAE3faaxb.lJHCRPVrJWrkIadt9AKOiztDlosWgXpKmLJ_rebs38K
	d1MMYV7PYAZvJbuNFCUZsTB278.zpJDA8SNR6utWfWj3Qw1mw8UmQzbYu3uDeJH57znZjdXbYK6.
	lmppoIVxcWB05EMalUVBCg4JB40BE3tjnRxYiOhYv8LuyL7l8bX05g4_CuMxVk3vGlQzvB5YYdQw
	iF1ktCrWuB5ydr6IFsj5cC7sZZQOEaxNhwGwzBkSzQX12Utr1yA3sR9uB1KKfL_tqVFJ6DS8DO3U
	MipNOIk7nxQUCpkRQJTdz8AXD2Tet5.KIqbkohcOApQQMybkLFWpbHhikeqIyuwaAfnxDMjmYK1b
	6nw9aOYpBxA_ndCvcWrpA96rFfNkqDN4D.yetx4bBZWhsiV7B3zFCoisH.J.JdSwtacKyueAvfbM
	JXYoyhWcJly4R6KjR0iRH3zw13VcjcoKbZ1rKRaO_zyEfz_8s7eZGmOSPFOszyDaEAVPB2JHJTJq
	eODvgeL.kh0wWxqOSU9a2m_GSNWjPN0IyEqswyeGTjXb4WJQ67ZrR4VWX7JVH2WvFCKxTTL8ZVtr
	OFRg.M5v7gyY-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic301.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 5 Nov 2020 01:16:12 +0000
Received: by smtp402.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 9b08706fcc5b5291f7c73cdec733f17c; 
	Thu, 05 Nov 2020 01:16:08 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v22 23/23] AppArmor: Remove the exclusive flag
Date: Wed,  4 Nov 2020 16:49:24 -0800
Message-Id: <20201105004924.11651-24-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, linux-kernel@vger.kernel.org,
	linux-audit@redhat.com, sds@tycho.nsa.gov
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With the inclusion of the "display" process attribute
mechanism AppArmor no longer needs to be treated as an
"exclusive" security module. Remove the flag that indicates
it is exclusive. Remove the stub getpeersec_dgram AppArmor
hook as it has no effect in the single LSM case and
interferes in the multiple LSM case.

Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Acked-by: John Johansen <john.johansen@canonical.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 security/apparmor/lsm.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 7ce570b0f491..4b7cbe9bb1be 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1129,22 +1129,6 @@ static int apparmor_socket_getpeersec_stream(struct socket *sock,
 	return error;
 }
 
-/**
- * apparmor_socket_getpeersec_dgram - get security label of packet
- * @sock: the peer socket
- * @skb: packet data
- * @secid: pointer to where to put the secid of the packet
- *
- * Sets the netlabel socket state on sk from parent
- */
-static int apparmor_socket_getpeersec_dgram(struct socket *sock,
-					    struct sk_buff *skb, u32 *secid)
-
-{
-	/* TODO: requires secid support */
-	return -ENOPROTOOPT;
-}
-
 /**
  * apparmor_sock_graft - Initialize newly created socket
  * @sk: child sock
@@ -1248,8 +1232,6 @@ static struct security_hook_list apparmor_hooks[] __lsm_ro_after_init = {
 #endif
 	LSM_HOOK_INIT(socket_getpeersec_stream,
 		      apparmor_socket_getpeersec_stream),
-	LSM_HOOK_INIT(socket_getpeersec_dgram,
-		      apparmor_socket_getpeersec_dgram),
 	LSM_HOOK_INIT(sock_graft, apparmor_sock_graft),
 #ifdef CONFIG_NETWORK_SECMARK
 	LSM_HOOK_INIT(inet_conn_request, apparmor_inet_conn_request),
@@ -1918,7 +1900,7 @@ static int __init apparmor_init(void)
 
 DEFINE_LSM(apparmor) = {
 	.name = "apparmor",
-	.flags = LSM_FLAG_LEGACY_MAJOR | LSM_FLAG_EXCLUSIVE,
+	.flags = LSM_FLAG_LEGACY_MAJOR,
 	.enabled = &apparmor_enabled,
 	.blobs = &apparmor_blob_sizes,
 	.init = apparmor_init,
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


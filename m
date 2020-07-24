Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 76C1022D02A
	for <lists+linux-audit@lfdr.de>; Fri, 24 Jul 2020 23:03:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-dm30Zka3OUeJ3ZZnnZv_eQ-1; Fri, 24 Jul 2020 17:03:12 -0400
X-MC-Unique: dm30Zka3OUeJ3ZZnnZv_eQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF77791272;
	Fri, 24 Jul 2020 21:03:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43E545D9D3;
	Fri, 24 Jul 2020 21:03:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D2E991809554;
	Fri, 24 Jul 2020 21:03:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OKwDJH001084 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 16:58:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77FA711E19C0; Fri, 24 Jul 2020 20:58:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7391A11E19C4
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 20:58:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 673B98007CD
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 20:58:11 +0000 (UTC)
Received: from sonic317-32.consmr.mail.bf2.yahoo.com
	(sonic317-32.consmr.mail.bf2.yahoo.com [74.6.129.87]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-241-dFtS5oC5PLeQCx0fjdobEQ-1;
	Fri, 24 Jul 2020 16:58:09 -0400
X-MC-Unique: dFtS5oC5PLeQCx0fjdobEQ-1
X-YMail-OSG: i36vbAgVM1k0e8FkdtI7vJlDGE2OWFzAhXMIIrvdwr2d5WKOazZzCwh.YGlI8dC
	L_AbkISGc144gyCRUW3S4LlXKaY5PnnHtjA1vVxMerOyG50hWbftTmoc3f_pcFFggtRZQan1Ja7N
	8RsEftng5hXRF_doQLGo8JiAtsu.d9owk2aybDj_QhsxWc3.JPcSL26RAdkg8vpGUR9qpPDc2v72
	5LynQQAA_MMLBSujmohvUQ_RNybiBB.uDbeiK0HU4tS7yEtFQOi.0ASPrPVxKH5GjrvCqAlUSK13
	KKZbAWr_jZqqRhSefR9didWOs7Iq39A3c3F1Ssva01egX8myw_RzfmIbLhCHje4n1I03BCy.zmrU
	pg5FdZFdbfgdBhRqR9f.F2x3.XGwb7ubNb52U9.fVnizFgua8IRba3q9x3hbHWM3ZlZ4_Uk8xjW.
	IpYOg03rtUCmW.UH4Vp3znf4qbHXEjAySKz51XSMayWc8A8uqh35t_cWJQSEXhw5Y2iMgkvMV_kw
	4cfKKQU_1wr3xp6Tzsz3UZaUSO0iPBv15c8aHz2UETg64yGb7jq9VNU3NOj_mi.Zvp3y0gSeljy4
	7X8yO2C_mQW_oMC7_3RmkBdZNSmRaCZ0nXJBtoweQoKX.sYKI6KHUpjpDrTlXisb3bnzTV9pweN0
	WFPin2xJ9VMwqjCrEGYtl7DRyEYV8LWs.9JxAYhApsOYeV1I_JYEMcS.toygaJsAmiifF9d02GZA
	T0FZLJvevFOw7pmIxS65LwSYh55dKB25e09yTkWID3O.4VO_MyzUEWhQpWnqaRfoj1teJTtFsHdZ
	j6zxQXmJ2mfxOoi0ZeLaMjJctjZOyIzqrB..JBNmcEvZnAvP669SX0PTp7owAzYKspFZeSvCYVs2
	9sqVBIugaamfJe2RPZoc_XzR70N8rrUgFxAbm0jetOdTJbxeCOwQcdX4nm0YldRaX4cQQcaHbbET
	gNZXjSyoM8ynLpsKXpYQV3KNhRPSe2P8D5VwzwQz6t5H69TincaS6wbRi_csG6I47tjaa2DsjEnW
	UhHCWB2S7yGPHibnOKi5iP4Sq4jg1_An8wsPP9sqdgtlrnStt9s8HyebhmK.nxtYXkZHbSzGwBiD
	wjyYHkq2sk_xVS1LrIsP5XPOBkwea_fotmYQpYkpkPSLJISTPlYQSMyOZtVg8yDiCrr7nex7.sKc
	PT7y4.Rh4C9mjwTb_ueOZKYrxFwRQ1JqTdIO3gXqYwwxR7fOueKODkiw9s1qu.GRRf8ZOUxW3SjR
	PrItOxXi9GPJwDLBBAoadevijbACeUrj6yb4NLZG7Tn1Fz9BjIF2Aik1LyA3t8kqv9uAhJF7U_uY
	w5UnZTtnIreBcJsPZi.I_OqY3C5QKJCNs9PyKBblIXmrRG9fhY2Gd6w4zLnIOYCM0_.r_CswDxNT
	Cx8Hc_J697ay0yD0jsQbIkFocCbKOZBGbww--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.bf2.yahoo.com with HTTP;
	Fri, 24 Jul 2020 20:58:08 +0000
Received: by smtp414.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 92e26b0705a6d44aa7f9311a94da2678; 
	Fri, 24 Jul 2020 20:58:05 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v19 23/23] AppArmor: Remove the exclusive flag
Date: Fri, 24 Jul 2020 13:32:26 -0700
Message-Id: <20200724203226.16374-24-casey@schaufler-ca.com>
In-Reply-To: <20200724203226.16374-1-casey@schaufler-ca.com>
References: <20200724203226.16374-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
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


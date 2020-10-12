Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5519428C2EB
	for <lists+linux-audit@lfdr.de>; Mon, 12 Oct 2020 22:45:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-_0Ybx4X-OdSGNc1OvysAeA-1; Mon, 12 Oct 2020 16:45:09 -0400
X-MC-Unique: _0Ybx4X-OdSGNc1OvysAeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02D4A56BE6;
	Mon, 12 Oct 2020 20:45:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D60BD5D9D2;
	Mon, 12 Oct 2020 20:45:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2EC458109;
	Mon, 12 Oct 2020 20:45:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09CKj1v0021601 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 16:45:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F3CCD2016F2C; Mon, 12 Oct 2020 20:45:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED036207A506
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:44:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9354F1823613
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:44:58 +0000 (UTC)
Received: from sonic312-30.consmr.mail.ne1.yahoo.com
	(sonic312-30.consmr.mail.ne1.yahoo.com [66.163.191.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-523-Wj1ibcO6McOvqkQtin1upw-1;
	Mon, 12 Oct 2020 16:44:56 -0400
X-MC-Unique: Wj1ibcO6McOvqkQtin1upw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1602535495; bh=QVDTnK5RSvNGdtnoHEmA6TIsda58Ah1+jcCHzL4V3VR=;
	h=From:To:Subject:Date;
	b=XnXQsW3kSPElMQNc0b+ZL/+gMN0VLw20j0QPU6g2CH7HMmNxUqEGmav3h2UELGaeR7/MvC2pfELoltnXZitOjBd3ZVPfIFQk/pa1WNvS5XYHSiHdg7I9iifTtA0CDnsGOFFby2z8UHUiD8aSs6AOXsfqAV6+agE38gyjBYtbe6rz875AfQ3exC5uHoS/cX9+nz7Bu6nPmgMk+N6EjxrL42pTYvA7W2bB1jXJ7MpGV0AjDr9JBCRO6ujnWCuLd4D/sWBRKCaR2YL6F8k04kIi6kbI2HHPA+nLdvbyWf1CLOyPdy54XFFUyWpbEMtDmcC52rWGl2/8mRWajHrBY0vXXw==
X-YMail-OSG: VruIYUQVM1l7qbiXi_7KeoBA5sqvPWyYfXNV7DJGxuvzx2jJfP576k.SWLxrvd2
	512K7YEhm8O7R6aoz6.6TD2QVkJJARayR61cgvUkGjsYa9Vv0L3LuexSbQ89EUtezbENmlYfUmR_
	7KmQBV8l2Y6goVA_ez59ADYUmoSRw7D3EiQgUwAfgJ_MQpxpaq2KL5Q62vjyY4h1jf5PduwE6mAn
	FwWpiNCCdc.2qIBXXXN9rm7o11rPOaEGiOdST.DS6mL7chWtobtTB_uitqqiXP3DKH2eMx.vw26H
	d00OxkmFTLw98pC8gx3sXWnMqJbqBXs7UdmTmgO6ZQ9FgbccC2NhGVFW1PK66RpMRpGFxYoU7SOn
	SF_515sHM2gYatc1dPh1JhHyj5DlRoOeerVZxFAKKiwd6_wSXhuAa8Rr3Q0fAJbFxAxaGxuNM0CG
	kh83JspJjvhCMN8epaApRsRrO40az5PiFgZluCkeAMpbuEjgkHMVlRT1lU8gpNYc1VsFM5a52bKg
	ODHPrfHJrPO2kMqvH1sD6NU82FAI24Ld1M57xmegqdK_yF7BwWhFbhzzZUGNV9ZFxJD3QvZhGl.4
	pVYma2R74sPEXCj0UrSx0KAcGJyKpHC2wLsR4mC9E66XfrckmJppI5s_CDw8pCBnwneyPE0JXgEh
	mLhj4LwHSWQQQwgzbvvKMjCGvLYIbAKZvqerAL4K.SspwN4nLzFXE84Rwg045dSFGx.lUqd2bC98
	zZYx9MiqvbQgmnkCJmJNvVNvrjYuzF6cMwqN994cYrn2VRaBYyFSzaBPZs8is.hIg4xo5NjXkm.a
	P753v7yM1RMo3Ndr4GxnhWtXHaRkUhn.2BSBtYF6U.JUb.bI1lG7hen2oZyemHxUvk9NCuxiKJCa
	eyyidmK2_wrAU3PzpJnCDf9S1AfQh5eAyGbT1zvazhcZF3JUY15bLYJQjgA1WkLi8EhhCP7UvvpW
	24TqvKhFY76kLrYBS10AbKMETxAft1UzMBSlbZJmUugk48GwtbSQsllpSMRejTgjR21kBle_g3dq
	oBupOryTp5E8dO2XaTjshJ.q54F6ViJkddFOHgeMV9_clyv0VTQQvrEBcO6gBW5XLMqGUYs8gwao
	oJ.TSctjQ7sC_jn68U0Yl5MUGERPY6tr8i03XiE8IQpDGY8T9LmCuB1TpdydU8.9d8GCnzmvFX35
	D0wEdYYA1S0grsU2pfDFbEPWGS9DLPDvsKlWKwK2jb8rM73S0PXjCA0Zy1ZvL05qsIvhh0RE_ZgY
	0.7TKoFHU7e2ihUIxfl1fRA0ESxdnrM7N2g72WN_zbPO2HKxOrvYrXtoawdwnjErblO8JHfqxJyY
	f5n99jsl44oxQ9AQ56QGrPhDE6LcI.42_FxVzA2P7zUgzeupioYbv1HmdP2PjqllbbVc6.7W9mNW
	yEC2QbYH8fi7IEJmNbwj4qFC0GFpdri1WHM9VpBjcg__DwST81L5Sy1w0m0Mr5ZIr69geZPwdnTp
	dUagfylWLDFFbtdEjFjUEWc3O8jLtL733bGFIm28aMypS0n.NAHVQmlEwuNaI_mM1JNSAu2y9cRc
	ULd0lvsPtbeyLQIMxsqyMszeVL588NUhBsatkR0ni.EbgzFjIVoiJKQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic312.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 12 Oct 2020 20:44:55 +0000
Received: by smtp407.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 561d699d5555ea26bc71d1774629ca03; 
	Mon, 12 Oct 2020 20:44:50 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v21 23/23] AppArmor: Remove the exclusive flag
Date: Mon, 12 Oct 2020 13:19:24 -0700
Message-Id: <20201012201924.71463-24-casey@schaufler-ca.com>
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


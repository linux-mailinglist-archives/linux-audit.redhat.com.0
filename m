Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 353433044E0
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 18:18:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-LxhwoRbcPieCFZYJ6u7r3A-1; Tue, 26 Jan 2021 12:18:41 -0500
X-MC-Unique: LxhwoRbcPieCFZYJ6u7r3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC9898030AE;
	Tue, 26 Jan 2021 17:18:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C322B5D75F;
	Tue, 26 Jan 2021 17:18:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1381180954D;
	Tue, 26 Jan 2021 17:18:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QH9Qs1030997 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 12:09:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7C5961004C74; Tue, 26 Jan 2021 17:09:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78220110E987
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 17:09:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 315C8185A794
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 17:09:24 +0000 (UTC)
Received: from sonic314-26.consmr.mail.ne1.yahoo.com
	(sonic314-26.consmr.mail.ne1.yahoo.com [66.163.189.152]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-334-kEOL4nVZP4ugeSOkaVC8oQ-1;
	Tue, 26 Jan 2021 12:09:22 -0500
X-MC-Unique: kEOL4nVZP4ugeSOkaVC8oQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1611680961; bh=WaDgOT3cGE/M2TpeQv9+8nhY9P5UAsW1EDBfPfk2QBH=;
	h=From:To:Subject:Date:From:Subject:Reply-To;
	b=s93EALRNfXF8GepqqFmKwY0ueqVTAgki9FIfsM+EG+mKr3aI6gNYpQjfc/bQ/RM37UYs1zc7MZopIVJohoWoZ7V+2mSl9eHd8ZqvWC3aMAD/kKVK3jqjI7A4korpoIhEyNCOEjnEGLB4uNMX0yyImr7Cct1p9J3DM1VK79PH7Ijt2wL1gQIOrn0EFDc8lmPbBa0dQt08BG3ZRI9CIRm+J9uxZYNCyYik80uMVuphiTrBin5BDsdt0mqwl2xR8FwxMdSIVip2FAd1UBgmytQcJ61j6lH8jIKI+x2OcRFTNkX6HUvm3ksfzXGMFTmNMDtU1Y/VQVG8XdR/VmQ0aYob9g==
X-YMail-OSG: bSpWxjAVM1mJyPAVk61e3aznmWAx1V0DaPVAqbk6mGl_vb4QdM_YVaiwjxJHBjk
	OoIWleJXtt_.W439TJ17j52_u8upAR0f5czma6z5Pxy_dkoyb3xiqSFZu_m4M81tQQsc.ngP7wSd
	Qk7.Of3MC4.1w4eaexj1wxePLMLTt7FoLS8yKmb9YJc2dnFCHbRh.CB0yuUxKK38YK8xHlgCxKcX
	QZOn9FaEOf0.5IZxN7aicTkCJGv.hl29MZ_GxL8epakHNNJ4.rCx5geNXACF.ghUkmJ1KnDnUGC9
	duujBsSN7ThgTb8Nt9Eyo3.wzcLoMmz3xzf6Rq8EAT_OuCopDOA9LD47U6aNJgWimADocrsrGTd0
	tbfSSWdStbwTz_qYeWKqkD9YuoK7RwugByIe3l65qpJ_RE14oka7_0eqAFJGLyGr82L26UtRnZ0n
	NepmQzQcIKfY26t10k11PC.rq5hGNFNicmJ4mQLuP5JqqSU.pubB.1N7BR4OnaYnmr..pspGgYZ8
	boCbJ2mW4Xerw_3TWrKLQ2y7sen1OHy3Sr9xpDIxKsVORa0GDaLU6AtKwu.2JLjSzd1KBp8tHEDt
	8oTzmL1vvo7jLO0HnwME.2ZxGug6KnNTXzcoQ1uj7FMsaFKLE2_.ZWZ2xrMRAN0cgJkqdwQndvU2
	azdUAQo0VIgRoBW355coSkXyUlsFibxrgqa4966NgWTwgDZ_CvZSYX7r4PuQAdAQInxafLl7LDUA
	G9bLeYct2aAF0hr8OvcxVQag4GQgd1SG1rEZ0gOuAtxZn58ZTF3.IOviFi8eoRCHUOXWc1nxS8Kb
	Fk4zKd09wFYgvwT3z4Z.Cy8oAudSPKyH5hlf2gWYs4GywCg.zWF4AzfLhf16TemLjZVjjkiwjIQ5
	Xazd2LM_9UQ0tzKL9zjqGIP.X7YNM8_kYZHn4gJ8wDUGCLMsl.RWeOzj9kKwMk7HOkQvdjlypQff
	.URnEXg8K5PYmSnQgOt66NonL7JYfyad7B.VDTOtx7phm8fQ.V0YnGdNulEP52Mp3rhmiOpdn4FG
	z.x_G_HK7HtpXkS6fwDRAlr65LjkYom2ppV7oHdWJWYymeKdhZeolyECBCbq7PvyylJtPhvZo0O3
	G9mMmtVEPtqwAVo0Rt2bEbNcqUTe9BfcKBZUJYipqquuuDgvvTnW52So5WGrxU4oZa2jbq5nhCzX
	z1Tzq8arKLtjCNrxgATygJJWhAs6JyZOyVpmjp0jUAyTsbZ3YFQ3RYT2hvs4YLfSGRHqtAjYQqem
	oH7xKyXn7tCpYf.KtKQMRiA7j.aaT9HdR7VeGDnmIR5KhvgBZ1BLnEd6ZSMiWqFG5j9rIVni_ZNA
	ylDOgTSG_rBpE2MSleKdGND_gt42WYkqpWBVakxATBze2hvIEG_.P.UnSBeJampursfAdd8W0ous
	d_aB1agN42OULmbj2WYbrNfqbVku3XOob6FZju5c3_pHm6cQdgJUg1.JAvlbq3LStjxNGziDwkG6
	R_9.7iFvS1gjUOx4zDu6xR4ZSD.qdI7bIUyHvLiAvKLhVmljFjUkpZ2Anis9u6X0PkAY_nFJl9Qa
	gHiyusaCVyorY2x9mHugxdbudNhTrFQYu8XyukHwLswX6joqdh5mBr5bboULzps3x90kLqBH5Nio
	otIqgX5Pp1OBPGb9.RhTNHDfF9KelbLP6_WcvdODW5oTqyOHrAzYtysRkW4ElGFRucX_zNhO87Rt
	9YOxZT1PPRCXSjguB3BuyMpEfdgSxqT8ffSneJFT3qicq6tcyu7xUu3mqHwTz7rG4e0cZOat4rGA
	4LJMzt6t5XLdDCbdNLN86eB3YS17knx8E2_o20Zi7REdLew.WMGRV.gqaOwsxHU6ksselOGM.INv
	_QtazcxgIfPr3cd4VmcWvKku6N2IN2YgYvtOMp.ULVG_TX9ujOu_m8SvlJnl1pHq9O.dq0CFDlIf
	pk7EjaaBzBTFKHNvnkER39gq25K7go9H1sV19dpCPr2IHSXftyWW8Y1OCZRD38d1193ZnQLujud2
	wkQMJeveyz_75HjfK4kAw13.Ug6ZHxtjqYf8.zWD6wnIWyTt3wSUviPRhDQ6w1gZSNPUligXr8FJ
	zy2R4hsLQ1MQIzXAxUl.D5SLTQewo2KYoEyQTKsqJH_MiUswfdBg8sBQGHYIcMq3_xx7lS0kl4jo
	hrJ7puwjvzz1hKNs38F6OwL5iCvPR7xpN6i8c326IWF7F.3HlKLkgPZR80gtPDSLdL74WXGb9bo4
	fWJVXbU7jXNCzwaYzgparEGi6WefHS6Z7qzQ2LO8azlQTpf5HHMi5n2eZxlVI_QZXcsDSt16zerY
	fPzZWOdfZ5M2LSIPw.3Rs6zoebHmJiwzQ6KeHp.JZkdlGhC2xtn0AIAxnouKmDyE.1Qal9CeCZ4z
	xpbTG4iQIbLJ7_3G6e7wMbLEg.0Dg4pie6LzDby3JDmeLuCAauWQKUfcupQ7nQDxxRghCkqIKxrh
	Fr0KP2AT6.IeEb49XEHoCkCb3hgDlppaQHGtfsnwltLc3Gwk4UQ69X1Kp4XCnAIx_3azcmqWXiB9
	0wIoTZtlbOhsycWsPNw9FIuKy0gjciGjGmuTcJrBugkgPLwmr3LIGHkBq1Qn4FtHAFzz73nBYH0U
	AhsTyd7VoeIt8hup6vEWB1broSdeen.OPEAbA1xPFE5wh2uzTIHrj2DIZyZq4d99MZgiw8THVKMh
	ZWgAtcg4ckBrv5nGMt3Dls_EMpiMaTvB10kUBtoEoUZzdg85MRiCVomxJG2NHKZtu30unOeHIrlr
	.1GEPbuACUof1ABuC6cv.CMR8cCjAn0JRYCqvr9xzEIY183idOLZJuoXlj.Wonn83D3H3LkdOAWN
	o71jc4OJkhHcNb0egU_VV6Nu9b5ubAj5EdJjwyrw51Yf2UKjnfdheTyVpTpn8P68ncVhf9TeEsO.
	jrRWidPb25ub_b.KbAVD0iDfvxE3ZbjOzwoAnc1KjT.K2.kpe.8dRhnV043KcirjUCHGyQbxEFrj
	Xja32pBANLGKdYx2kH9y25s2bZYnayGvi5y89A6g02C2eH.3.1OkDWfhL2C3AkATZZc6NY7.eXHL
	fZuRn.FItsB8K15cduAfsxu8QiA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 26 Jan 2021 17:09:21 +0000
Received: by smtp413.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 692fcfe33c3dae11a46729f413ef237f; 
	Tue, 26 Jan 2021 17:09:15 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v24 25/25] AppArmor: Remove the exclusive flag
Date: Tue, 26 Jan 2021 08:41:08 -0800
Message-Id: <20210126164108.1958-26-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With the inclusion of the interface LSM process attribute
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
index 4af0518b55d6..e3c682011d63 100644
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
2.25.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0282533A6
	for <lists+linux-audit@lfdr.de>; Wed, 26 Aug 2020 17:27:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-CGPZvk1NPq-SIHkqfIr63A-1; Wed, 26 Aug 2020 11:27:16 -0400
X-MC-Unique: CGPZvk1NPq-SIHkqfIr63A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B57361007465;
	Wed, 26 Aug 2020 15:27:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9495060C0F;
	Wed, 26 Aug 2020 15:27:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 462B9181A869;
	Wed, 26 Aug 2020 15:27:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07QFR79b012511 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 11:27:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24310114B9CB; Wed, 26 Aug 2020 15:27:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6878A114F251
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:27:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C1691814347
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:27:02 +0000 (UTC)
Received: from sonic302-27.consmr.mail.ne1.yahoo.com
	(sonic302-27.consmr.mail.ne1.yahoo.com [66.163.186.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-475-pIWAk1dUP9OUpsI1iLTzNg-1;
	Wed, 26 Aug 2020 11:26:52 -0400
X-MC-Unique: pIWAk1dUP9OUpsI1iLTzNg-1
X-YMail-OSG: L9c25aoVM1mRgn4qkAJj2r_SOlFZqHX3qneM3l4k3tmPGij543a9vlpkINSgjEB
	XJXlijNwjr3D2hjJlvsOtB33KNpmUAP5lXh_.S5w3hUgGLnObKr6dlubooKBdI_FUl9IN0oUIcBi
	7q4tJ3ALH.rsS4_Gm.OIc7KnPFPweu81HGmgAcoT8INw5FZoGzIXLEAPPTNfJ7qYwOVCz4ua7kco
	uE2ybXdGNWNUChdOMU1L4Y9zFE1AqRXzNsSRapIFuF1HzKOh5S1iTzSH60v1TIup6pk8YaC9kfXa
	CzAHM4n01DJ0l6TrukVeESNMKMY8S1oIzrsP0mv7FanBGWLsNfpWOpfFgX64NjCym_MMHy.xkC6P
	EByoFF7EiU73nWaEMiCyMSutNrRE5wocVGDC.OeI0kiJQcWzWCedCiHR86WVjkLZ.kNGcIrlWuiC
	jh_U2utNDJNqiSV9avtt2mOa6r73PG5utUmlzOHMN9if4ufqakRlmqHCa9abMdyNM8vtTm4CiB2H
	D2Q3CntArKzHxfeiD7sEsqeLzvD19Twdl8mADzuHpUWTEFQlcjBNxwke5T4sncOX5gHYx29M9k6V
	oStaZbbMDnSfY2JGBtJONPj.EhXlR6NyaAcBMhXgPihXxfaPegTEaE2XdK0BfUYgwlgMLFEkENyV
	8jgebK1C8oykRlMBd4csVfYA955wPa0mGQd7BDOLFARPpRWFHVx8ydxJTpDMT5M9To6I.gMQwtzu
	MWVtckZcCBPMdmKrklGXwbeFoXA0OY4OAR4u_O3TsmwQPT2Codsx5auELebhlKXiSQrzoPAkr1cM
	WrIXkQNjcHKNtDCpClK_qkwQhqcvR.87jXbtKpova1nhDFmvIo3a0XYYrzUChgLYGaQvYaje9KQt
	M7BNWmV7Kf.RnGurvtup3dv3SuNZpU6dcHw8GxOBBrtobeV.cHa1nExvGvgX5mg.TeCznX7N9B6P
	mVNYvxBhFmg1D2qWeObtIZ7zhiG233N7yhVVp9Y5xurxGRX3hPNJ5VliFFh5JzKqWE1RyK7AJ3gp
	Ny64GUvV_wgN2yUkT7VlwiT9leDi3gy42hR_5RRuHu88Oodf.IXcphBLskDx2pH9N.Bs0glP0PSy
	bea1_maFo0.2iYMx.ozNaAMmwHZL7hOlJiS0nIbr1d154187Q4E5fdikoRmgnXHgI2KYTqGYwSVT
	.EDiaHyEeysd3u439sTVaKw4OrehNSF67FNCP6SkSEFgq87f57BqrhUX8d6eYkXNHkgOIwT0y24r
	_E7MwHMNJeTOnrSxoDDx.SidcmrW1dFhC21sS5.yO8l5HvocAhhdSFkNGm1MSVUiUEBE3F_GOJnP
	WKsLpYqpAM7oR1FCoALKZMzERmF2FAxGi6hqEOQTBOYO5qMmyw05dtYqTfec085P51v9DGZqkbHU
	H4uid83w5EZsXo1gqCVESOrBYm.ELpvlOFX82iW3evpb30iCh_QxTCEC.c8JWZy58_4WRtCO5uBF
	jjU9nqEkzm.LAm9LpqGVUux.XfZ0RqRbAjpkugpkYntChwO2CTGAbMgLSdb5aN9BrpJ4YpK5F1j0
	3c6exY8BiIUsdmQrrYfdfbC_6Epd8vMk-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic302.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 26 Aug 2020 15:26:51 +0000
Received: by smtp405.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 0dfa992d5c241b7d78b3cce1ea5b362d; 
	Wed, 26 Aug 2020 15:26:46 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v20 23/23] AppArmor: Remove the exclusive flag
Date: Wed, 26 Aug 2020 07:52:47 -0700
Message-Id: <20200826145247.10029-24-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
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


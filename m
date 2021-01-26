Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7E685304480
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 18:05:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-N2JvjrpMNM-PZ1qxvMYymw-1; Tue, 26 Jan 2021 12:05:08 -0500
X-MC-Unique: N2JvjrpMNM-PZ1qxvMYymw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91D5F801AAC;
	Tue, 26 Jan 2021 17:05:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ECDA1F409;
	Tue, 26 Jan 2021 17:05:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 270515002C;
	Tue, 26 Jan 2021 17:05:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QH3w9V030244 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 12:03:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 33EAD2026D39; Tue, 26 Jan 2021 17:03:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F3D92026D76
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 17:03:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89B7D805B01
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 17:03:52 +0000 (UTC)
Received: from sonic307-15.consmr.mail.ne1.yahoo.com
	(sonic307-15.consmr.mail.ne1.yahoo.com [66.163.190.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-279-f-Y6wox9PQmkVErZNubiUg-1;
	Tue, 26 Jan 2021 12:03:50 -0500
X-MC-Unique: f-Y6wox9PQmkVErZNubiUg-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1611680629; bh=6eV6bWZmYFyVIFMBRWE2i7PApIWzeTihHTO+MktQD/J=;
	h=From:To:Subject:Date:From:Subject:Reply-To;
	b=p5A/hNd54f8KlfX7Shi1uUKQdlim0NtCvlUfTPmTY3NqXhb/7boDO0VUDTnsqUz05OIphkrqwq1P2j0acjS+CVzG6m0PHChgUoVtQYVclhHx8qNcxjzK31JiCA8phu+3qIf7A1RAafXNh45CfJPczJdMAQR+6LFImjWug76CfZRK5GZ+6/JyxSC3wFqqkZMLQZa20YEIdIzZsrcAKWsvKGUvLFpgMkecdZ9q55lfwO4f4Dhrb0nf1oNF5uQg4wIfNySUby1OijnFhgoRo8+7svOINnsXQSgkbeVcDN4RYNIoHgMHcAeO++C69DQRhofs+1Vef7G4YDwJoEnLjTj/pg==
X-YMail-OSG: zy7iHKkVM1mwP4FhLN4FNy9U3jUIg_uuAndzwENnHTgYBCMSORzPAwW4oww6Jmn
	x6FxAK.CTJ5_NZnF_kps4Tgr3H98lyP4jNhe33wcrEZeUydzSExpcLO3NQZMqdjAHsbHcf5hjykv
	3VPhNRk.j50moSlP2m0mY.TQahqC9.ftb4sbpNoPBo7bUjogWdAswdAQ5hRtzV6FNtKV1r9n_6D5
	hNX2zyfeBImtbtrJAvAQ7WzyRXuPrRhD6ZCuv.eoOz34R_0NoV2heFQsXz6ZZnTP9MnbvtHyFAD2
	v5I4TVyfSGqDDDNVqi0d7SL_5AR5aupyAVDhvkl3RdL43VP.HqgVe9jm9njrI2AVzgHPV32kqN4Z
	eFQlTOSR8IUL1otlEgaCmErbM3B5cNgv3Sn73Mk7N_xuKAjm2Yo8HO8UNh4QIkfTl3raPOQoh9S0
	mL21rCaDktWDndyrE9Zf_C8AA7TiJlfxjsUUzX.9PpZVq1CFClqt8dlwxX9PRqjcJXFQ7UFiMfh5
	UDqQIMcJyqNKOINwgyE3Do7lqhg6MbYv1xDwRhPlh90jDB1Ibfpy0ounh6LROqEkdRbY1E6baPva
	xWwgBEcELRUXGeIBCdZ07irX80c54.g8PiTooeMI0nF2vmygPVjJqTfBBUYpwi6A_.29Bo3QldGp
	58imH2KzQI9W2cJnYhvsB4naAS84tAWaxvAElqgvA2GagFM8UasVvYbnVB1OO7C4K81xu.GExawz
	5hvkpH_4CoaslTkmjm6440P2j7d69K5akWTVuKE00Pf2_7k1Hv6UMOqsqWseE3zCwW0d9uXMttlU
	Buig_haK5TftEa9_xDRBEd87.B3g0ZIH1OeSfk1nXm.7zDdiRWW42qreuJ3t92gwxDQLIhgbm1g4
	ZF.WZZdvgk62O0THbWRSz9aIA_DzOtcK_iiuGWTvT5cjdPPspLAr6v5DaSnzcqkgIZt4ew_u8KDg
	K1WjYKRRTjxEfrXenZuB4_4_gb0TmfK0BvGxY46L9lO8YBFLH4V1G56Y1XNkH9f2DO4b.winnrrY
	SO9ST_8cIwvkBr5qii2R82SH1ckKcRgQJ1heOmd46bq6aH8QVThMcnV3gs22A7z_5lPKuRjItDMF
	6Ip.SpQknSb18Hcp0egH6g62aztR1_jLf5IcJNmAiC04uP9pGoh58neckqLsp_v8FTI76Lq2dCfj
	M3HukaI76aQ0XSmHuNLgty0vZOW4r9b0M4vnmnlNC78a58XzKeA.5DCS9EuTtTGMfcBq0Wv3ffm4
	71JrdfvOcr5KjAyGj5snEL9JtFy9xxAdpfrwU0wO3TJQodetdCahtdYV4jvsC2W2fEAEO17ACWLD
	W6UsXbxQ6fUo3fbwO1D3VFoxnCPhH.3oJuoqguPvtUvTz_7TLQwEjoZ.884xaE2jiYrUMq_tP2W3
	tHE84JRctb6VrzwV3ixWKLFhzXFg1g7iXa_bRu4OlCFbcZrtSY7tfo56frpMbPe.BLSE07pUB_Be
	m4VG5R4lUrVB0fA5kYi5KSIUvPPdtsWTkS8oRkVp.gDK.5Ya4rmMwx_6QzxALPpfmIB2u.FdjZz_
	hNkiKmkhdA9U3gfuX6Hd7NWea6ZwX.3KJWOQtQ9T5IV4T61VtmwcmapGrmD3mi5WHIHdDggqQIHC
	E2p.DiVbGKtRVQjLT16HM.C5X_s0GPY76PohiTeJHb4XUrBDkjBO1pytZOQQRGpd.IggGBIZlv.z
	ahPVKA7a.6qR4cjMvfOWXkUAOlK4VVV26or7qn9dzDa5dU.ClNY0eBlQ8r.VZGYulCM2Oq6EacYT
	vzb2Wgf6IuQ0rPhFxDZNvMeR7_Nhcx2MjTcaC_TtBPM31ksCBAxJjGmz2dhHYn07BUS2Y9GmsN5Q
	zr_YbPpUUYLm.YWeupfZqYcbkAx3v1Buui.qiBSKkbQcY9U6cArbA.poYM94h7le9Qx176d6MWyh
	GazXpx_jWyPFHh.GgSqF5MgLLmbr9a1lg0IM_rXPbPUAUs9F_8Oxz7vgkOJgqx_oLQyTtSpj2U2p
	9oiYKWmmncA4uwmQMmBu6ciZNaurFXgqmKvCFWAAMWWlJxhQzVG_QmTuRYnymvZqxYpi5QpO8YZU
	HgIIJR3EmpqMkdxhtABhVglkAvF2CL0LhgY_Ey1cMsut_wocl3IPJ35LVUKYiwN3MdMCiiUPMr1r
	viiD1yFD5zTQGHVADLIH13vEYM3XObJUkHXTXXeIvRmsIba1CvP7n32XWOSB8JrHOmOjNYtIoFHE
	rzNlLYOYob4sJsVOU1Prnw87LN7Dr1qY2zWwZT_g5exk_QWzJ51qVy7pX2upQDspT25QT.2bo6pg
	.msms.s7KtuG9fdvFAx3V70JLFAUu3D2zuU8sKFe8AwJMlAYRXOx8uJTgd82B9jGIq0IuVS0n1LL
	.iJOYmiEUaLD9oT7QwsCmWeWdBhiJPZ2JBhz09FTVqwbB9o7caImMp7ez1kAbDLLnc8RMPiQ71aW
	lELjwIrvoUlJ8GBgGtJQMslTLNo4KDf.Y0Q16QIW1kFuCpy8s.NVdVLS.YUE8Eajusj9RuHa29YG
	OPo.u7D9hU4v.SRnbye.ItAgOVFsjGz0DaXBkVXxJdjmKfjAOjJmxnrHrRSiPq_lq3dOUYf716M_
	LFvvMIU4cx49BzPm.rGdFOMB5NtL0DaOd8DojSXZavw4Hm1HshW258_FrY9STPrfG_59E2o5Au54
	Sh8R9qMjV.pLLpELlDwWHlpsrUXOOxexFWOrsihv5wx1ZEoVA_FXiWEAI_gMOelccN6nh.EoL3Z9
	Ujlm45sxqHo6VbJvfyOpP_fxr70vLbfxN2YfxRiM2g4dWPXXkd0i9HYm2KioIetgLTTZlcMfLrm.
	qb2htc5O.CtDavq_h373Me8MU_gRVPA3bsWJSWb.xBTilZ36_XVFgug42k2atoickNI7ImCgwG6o
	SXI0xrsTQn..jgbGA70U48iiCU8Mxls9Io3eAFeWprk.oadSszwQ6wEZR0EGD.GiAFVfyQPEGmlt
	W.DAz9JcVa.cDtaa8BvcRCcqMbnHUuhfaEnFYwcWSZG3Hqw6An_dRdjkOqdmQyhF43YDgxTZEVJg
	DPLTvzVUIH.GynHZPuJ.rYAoUKbXff9gonA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic307.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 26 Jan 2021 17:03:49 +0000
Received: by smtp419.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID a2a8297cbf162325f158e403bf6e2609; 
	Tue, 26 Jan 2021 17:03:46 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v24 20/25] LSM: Verify LSM display sanity in binder
Date: Tue, 26 Jan 2021 08:41:03 -0800
Message-Id: <20210126164108.1958-21-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Verify that the tasks on the ends of a binder transaction
use the same "display" security module. This prevents confusion
of security "contexts".

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 security/security.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/security/security.c b/security/security.c
index ba39b9b13e08..03fb8a702f64 100644
--- a/security/security.c
+++ b/security/security.c
@@ -834,9 +834,38 @@ int security_binder_set_context_mgr(struct task_struct *mgr)
 	return call_int_hook(binder_set_context_mgr, 0, mgr);
 }
 
+/**
+ * security_binder_transaction - Binder driver transaction check
+ * @from: source of the transaction
+ * @to: destination of the transaction
+ *
+ * Verify that the tasks have the same LSM "display", then
+ * call the security module hooks.
+ *
+ * Returns -EINVAL if the displays don't match, or the
+ * result of the security module checks.
+ */
 int security_binder_transaction(struct task_struct *from,
 				struct task_struct *to)
 {
+	int from_ilsm = lsm_task_ilsm(from);
+	int to_ilsm = lsm_task_ilsm(to);
+
+	/*
+	 * If the ilsm is LSMBLOB_INVALID the first module that has
+	 * an entry is used. This will be in the 0 slot.
+	 *
+	 * This is currently only required if the server has requested
+	 * peer contexts, but it would be unwieldly to have too much of
+	 * the binder driver detail here.
+	 */
+	if (from_ilsm == LSMBLOB_INVALID)
+		from_ilsm = 0;
+	if (to_ilsm == LSMBLOB_INVALID)
+		to_ilsm = 0;
+	if (from_ilsm != to_ilsm)
+		return -EINVAL;
+
 	return call_int_hook(binder_transaction, 0, from, to);
 }
 
-- 
2.25.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


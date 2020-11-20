Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B6BF82BB703
	for <lists+linux-audit@lfdr.de>; Fri, 20 Nov 2020 21:35:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-4BDM9CeiM0SeBZ-ckC_1Eg-1; Fri, 20 Nov 2020 15:35:33 -0500
X-MC-Unique: 4BDM9CeiM0SeBZ-ckC_1Eg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17F8C87310E;
	Fri, 20 Nov 2020 20:35:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED2E760C15;
	Fri, 20 Nov 2020 20:35:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5D4F180954D;
	Fri, 20 Nov 2020 20:35:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKKZP2p001406 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 15:35:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 139632026D76; Fri, 20 Nov 2020 20:35:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DB2C2026D48
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 20:35:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DD0A803DCE
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 20:35:22 +0000 (UTC)
Received: from sonic317-38.consmr.mail.ne1.yahoo.com
	(sonic317-38.consmr.mail.ne1.yahoo.com [66.163.184.49]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-447-U3LvHuBiOXuR9bsLwsEPrQ-1;
	Fri, 20 Nov 2020 15:35:17 -0500
X-MC-Unique: U3LvHuBiOXuR9bsLwsEPrQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1605904517; bh=1TVinPiUK2k+jKdc0GPax/u2sZBBwpttfsntr/DfWk6=;
	h=From:To:Subject:Date:From:Subject;
	b=fM5TEUP2oitrUEOvXSOn7QAxCmyXIgrCdIu/1XX7dm0XTAt8eTwBbe8uMUnNtHGKHZ+LDmVAt1m0zs4SbuluUFegRTeYgmpTrSDjMhRbP1leDtT74F/pm77ES2IK7E3G8aJo7B25PFYyQhx8Tl//rguMDrci/Tm6X3t5oUuFaVWaqcGrTGb7JINj0ZSE2FFi2/hBcNAZi5GXT/ojaqiitwBc0iwy/hjC9rdyT1ZKQjfVv5D9sZ0Ewb5m19URMsnDaJczn3q30xPIbQyLGM5KPfqD5N/pEK8OYJVuFv6NzPVrh/YVYhuA8KPJ9r0hpvsFgCwUJdrMEDOSnc0DLIlYkA==
X-YMail-OSG: 7fBoCxQVM1nFZTkMb8UW1BMyorAIYsclp_bZ7Xw50Gim9pD6dztIogRoGTShPKq
	xhzb88i5jpnJUXyMdBbYW1quxqCdMzZpaiyVyQ5NceyHKHO2bf6uq61IKMiihLkKua7wxYy8ww12
	Yl7kCjm5uL3bcX6SysA6PMwV6dsk91WnYJVLdldNphl90Vh_Wtpkle2wS8sfkBrjm8fgyUHiCKwH
	3sFxBlXjV11icG.ZnMctyWzX9MhT7s8ZYp8gJ_96rmoVwrYkpPpsmdsS72rmz2CeEf2DVbegpNYf
	35I7hzitMGGqWUsQngPxIMmxU4hIoAEZsXAamJcyavMqTYf0PVtpF0PcUPVTWNQVr_9RVbzxOuzC
	7xl40ZqB.C6aXupF6uBU2TITB0.p_Du3ExPiCP7U6rhR_7lb8teZgHujQ.c7sjQP8E58WD0wAdQu
	xyPgbTen6wlIlrldvQmp3nPmpK7._7zSE6c4yvpfNwnYVDOiVktQCAF6lH29sB7iqQkcu3DwdxHb
	JOcUIl9TbZa74AAXFS4wWjKMZvmF.Zz9BfWqc3T9Npn4E5dUXYGlmrST9HThF0sCz1.iDllCcjdM
	DJHBqJv_.aZdZUNFPUkpchXcfhaXek2GP15hv6t4HpFQFkJVgOZU3qMpYH_n7.ClnQk7fuS5.OSO
	hrew8vWbm6DQ42nwpRVtF2TSc0.ETUManA9tH39LkEY7aljGtI6nxH5n163iO_pW4rR2yJnimya8
	DZQxZmSIEJJ6LPow1oXJWuzeaoD7KRItqP82D5oyLSv1WOcgISbE3gi23T.6.l2gh9JPllVOM.WR
	_RHZoXiixzJnq0lYUqQSZi4SRRenGAnaZfcmdwRsIXE9J59JzyVW2CkHc4XaeuNVTIkBszFptsNA
	Fz.s1pvKr4zJYfOu4uWAoyuepqDidobdzv_nXcr29xf.htqVwU6qWI4agpzvLd5VVEr24DZZ3fyL
	fZYmgJ9wT12EKHK1oRByoiwEPyxFPa0bvbyqzEQ1dgbJLhLXx04wE7QulsTj1QMEhxbnBmlLsBF6
	_3XE1u9Cf1GfxEnEv1uwV495UuGeglK5DPHkaW88rDK_K4wmMVTOtdK6sCZ7xKfkhIf9rq03bVnC
	_eR1V7JhchV7l_5a8SqO.tDLt.7E6G_tbnIYoDgEEKCjGC8FtXO61kl7M2J7.sRvkzKla5IexnCX
	R6Afst_lipSJAB83MJuCCVHYaruVjMeUvMqVVALKV5Y4sK7tJwvCWxcHVdP_pubc9abSKAOz84mf
	5mDB9ycPkJSU2vrm5rdduu4EAIJu87CtzBOFb6PuXYH8kwbrRFTza1WnBFtmsUoIPvCKhTHUAWyf
	zrmnD41sotgz_SbU7zPlJnY4155zzH_tLYSleLafw_kc2gYdp8K7SSG10HayUOA.s75n4OObb7RR
	NK04JFhMZsOk9sxzWurKD7jE58SQRL5MIkY0.cSAI.ynfCwoiK.r_ILOi1l2T2bA4c1BIsKSrjG8
	Xht_Q4PUpPTa.h6y.uAL_YbFYG51_55Nr8z7MXqNVKUC6u5nxkfTXObvpRDKtT4Vm_V6WiVIpITK
	9oEsculLiiDN3thTQhcc6mU6kVnUJrJaYnqUQxcfyYmrS_sotRV2VPBFbaAYFF8Ef.Xsxpw2B5Ay
	h5vXHT1_svWA3borauZy2SMUvicCjuUR7RRRJUac0ho_HULrTzXc.qoZcdjepIppiDmP3IFBN8p2
	.9kfqLWnASiLncswJT_KxF2yM6Rthes2g7dWcuXWifZEvu.HGZR1PVDh4n8C2Xpu_3P4LTBBewfY
	7isWKEQncxEHMqVDhmCRIYX_C8rlvc6MNX7x8zgS8MrZ2sQT2csshLb9yyYTuxPj8HrnijmEnXN5
	HqB_t6oGtAlS1GnkkhjcTxRRfEnwgbYMyMv2MrLAerq4ZVvlyyNBMLrTjav_APnJIrbWScfE9gL.
	eLH5UHNnO59eAAZmle8NBsKHaOjJnkCf2JgMvvS.uzik2nrffEtStcldppZ31wAJxiR6BeUqqetL
	onLpf6SoegKQLzo6WHFK.paNH9Q1xDWd6b8rkig2vSQvmxVypRkHS_Ur2YLlQnh_a8L.tMFNz91f
	9Urginr.D5wzkDYwXC7AFBDqDwOEUBFDg72Pp158B18MgoB9WS9nFb9TuPim1FJgZ4IQmRwYaPWZ
	nc.roVVr5EsiWXQn_gADNm.Aui9SLQw.ArZP6SeTCeTYpRINNR91qxTeCnV1QTLjon893tfu7UUE
	u7xCftZ6pYeCNB09Q9IV_G3ugx5.fe504lNbzEIOO2Qs6SnBgfdhwlsv56iE46o6q0qwwj3aV3B9
	iAo7_QOGDjHjOT5wY14.NHcEsizOKEh80i0aXA_0qyu2vqfOIAQ7nlbvJrC_ZA2tWQX7ZGiF3yD5
	gdYYYdJuyj4Ruv06oyG3TMrZ7y4B_CPDYj5BQemsqK24AgkGTBeHTAHCXln2C2n4K5GU89JMMGP6
	O9f0WacZ5FTX.jaxCkWsOY6piQfi.Bp8OxvMErirQVDiP.0vmcqnoVs1Sk_HxZaNVPTZZxvBkkzj
	LKoxlYfVJc5fSg2y4VmqVAQsQhzR_egk_6gZpk1JugBpNZ7MGFx1aUWUTbyth35FH_6Wgn16Nypa
	rPFxT8kMYOSP20iUnEtKO1NHlZIN62RB4czi2LGnjr.YGxFEQoHGHuD1WjM5daiua9V2XcEbjCoh
	fg8HESs7XvjBV6haQc2kh.We1qdf299TBCmoM8vCePE2L_RTUmlt0hq2gnt5aizThR86JDweZRfi
	C9utBDkk0G0pHv4bZP.F_SLtRkIIJHbKCJ2xtLY8wMsvSqyz17CM6vpxtRJfZYHTY.0NflQ584ET
	2ZLf7uDqLCUnwRSBeAmYNqvwjKJA1P1SdVuDiH9F.LXIYBLimtVnmON6Nb8ZNUkllKmdslFzAvzj
	4xXBGdfLLYdo0cwWuM9qV8nbtWpl1WCefm3WKoHZRm01OhlHqCDAXEdEAghBfjF.ckJY9kpZ46Lw
	BXf.6I7EoWl4YbPCPhvsiONexNpwPz7GlbuCeDtGO9aXz49vS4z4d55bngom_QA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.ne1.yahoo.com with HTTP;
	Fri, 20 Nov 2020 20:35:17 +0000
Received: by smtp425.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 16e5bfed62df244d3237915e7ed8e2c8; 
	Fri, 20 Nov 2020 20:35:13 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v23 18/23] LSM: Verify LSM display sanity in binder
Date: Fri, 20 Nov 2020 12:15:02 -0800
Message-Id: <20201120201507.11993-19-casey@schaufler-ca.com>
In-Reply-To: <20201120201507.11993-1-casey@schaufler-ca.com>
References: <20201120201507.11993-1-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
index 31c983a252b9..8803347424d4 100644
--- a/security/security.c
+++ b/security/security.c
@@ -791,9 +791,38 @@ int security_binder_set_context_mgr(struct task_struct *mgr)
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
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


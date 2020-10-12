Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 50DA928C2AA
	for <lists+linux-audit@lfdr.de>; Mon, 12 Oct 2020 22:39:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-flWikDLQMjS977bwG59BHg-1; Mon, 12 Oct 2020 16:39:38 -0400
X-MC-Unique: flWikDLQMjS977bwG59BHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CC42107AFAF;
	Mon, 12 Oct 2020 20:39:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F31EB76669;
	Mon, 12 Oct 2020 20:39:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3FB858106;
	Mon, 12 Oct 2020 20:39:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09CKdSrF020570 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 16:39:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AD1632166BCC; Mon, 12 Oct 2020 20:39:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7C4E2166BA4
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:39:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A88D7805F5F
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:39:25 +0000 (UTC)
Received: from sonic317-38.consmr.mail.ne1.yahoo.com
	(sonic317-38.consmr.mail.ne1.yahoo.com [66.163.184.49]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-35-C8g078xrO_SX2GJFAeTV4g-1;
	Mon, 12 Oct 2020 16:39:23 -0400
X-MC-Unique: C8g078xrO_SX2GJFAeTV4g-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1602535162; bh=0PJ9AFdRMre7GhsH6aN6X2O33I0af5NZeHHH832pqBG=;
	h=From:To:Subject:Date;
	b=ttPtl3egXdr6E+0C63JwairKF5OViS7LMqJDvQrAEDO/YSOddiUuox31DY7y4JSQx2RQrh1+MGPKb5yVBDoCyKFsC371MTS+PMvqU2pB4q5pvPM+OvhoizJnZO+/PuQAzu9uXcUS/Ezvb5/vGxMQDjpiAwAiFuqLK+WVsGSzXwzkA4SKxJpGcLKTzodp3N+jbzEH/l2AEWG1a/sa3G55NJMLicDKIg8lWcDOPjCnI3fLfDBE1akLrctrVT3Vvexon4H7D+97xiKfaMxz5cdu52vYyPeZ2gngTn4xDh22iWKkMAC8aiosShzxr11ov6wHRz4SadGFUK11rza87W/Brg==
X-YMail-OSG: aEiVqlMVM1l8p3g88krKllGce5JRt.PyFUUm.QIt6I8Px8tjk7273D7M19Ss6ZO
	T_qLB0YM1lw9kuIdENpJQcSToqtNKdypfQSNe.vGf2jzO1d8x2VsvT76ejBkCpw5EZd1bwQMTKea
	eVc9jm1c1UlyjwrP1_hxkU_Z2uUGhMMx9LmTnKjQJA7zLPo3dHHTXRmYzPGyBnRTR3rR7bmtM3ks
	Ae8p1uLbZlZ8l.8YCcI__T4rSSd3yML2HFeuWliTKhLBzXoJtc4VmG1fdz1lqbGxNuuWcXfO0GPq
	c8N8aK_beSIyM6zbwvp2UGVnf8B3USs_nAovUK6zF6gmqN41flKfUQoiifrogZbIkaSysXhYWmul
	2VYW52tzC_.6G4EnVpVHi1QaAFq4Y.ID0q2oe8d8pVWafNZ_IZOqOAiKn7_LptYC0TgOhR4XBcc2
	3QVc7gSaT__YV8.FCePylIqm7Py_7semi.dH5fEwt9B4RBtYGZ5nBp7Xk2Qa9sk0hwyrf4ym3B9t
	7zQkSz6670bnN1F4cAs8C.ekM4igl_cxiI.39EqnqK1X7Uq1hPAktCCaCw11_A_6OOfUNoX4PwhB
	.7qdvV8unNOPFVLBPVMT8sH6T4DmBc0niqhC.UoiJPvDY5.BJKDSKbiJVfioZdVmbZLAnDrCQ052
	b3lEl7EC2Wck7fmXiBuHreBowb.YyseYSbLwYjw5ec_ItM4SfEBoYz3B8SxzRZMj_zfvAJPbQBIZ
	oWpBuid9qOcCEeiFvD.TOpsy7sYr3CCjHHvcRAPioDVYD_X_e3gny0WKulZwza.ROKgqValWg_B2
	MXFlZCAtBchGXaq4Y7lfXirwBJOhWRvd_RFv6CHDUBUkjJVVbSfaW9sgc5gQu5t_7ZeHIlqHZ_1s
	HNpFsT0ACBYnM_LbCydzxzrJvi7DAloA4Gq9Y22oTpnM3B0pEgLrzygXTxIJNdLiRMA0eysAk5rP
	3D8np2nxs7VdirWtsUbz5soPQfGiCEWLiOXr5pDjOo_kRmlk_8qRDwsTqFsj0GDpgqroJBAKloXb
	wEHC2vHENgeri4JqIB5Aip6hsv6Md6qznoyXml_5rb4kLX3pjcA._jjrIQOpK7v27Scqpk.WMDLm
	KrPbTbz.88SMG_x3HR0CQv.G_aT61tELabp0eFUHlzA9p4i0ASjv3CHD7YI8H9B9IpKVwgwF2Nr4
	zwDO0CUiCVsze1FEC9CRXuxXEoZRVJ3WgGz60whGJlOXxLlmmYNcqjMTzlibKqA8BLkccOIUDn.f
	4v7YDiM4bYl2XDaRhHLcDXyiw5zLjgNBQyaF2DzmwpPmD2q8CAMqAlVBjc3goYtkxhxlSbW6I2eQ
	dltgzzBQGy9ltE0_PANiU2qH9KHhTTc.IzfTeTyZAqgojLgsWG2zBJGrR9Ad1swC2rq6jV2CYhs4
	094ZchHCLcBajCyCkezt3z3jnFzHgW2wIvJktM2_0Q6QWIA2rDMsBZCEaCEj2gZgo5Vq5Jr3DUlJ
	yMHWN31pQFuEePRC0b1BazqxQ_jSaDUIDNWSNXTao2u6yR5nV6faIfi3seJPMbi8K6xE4cfHnuDF
	fCJAgY8IE1Z5U_P05qX70.iOo_LcnvcQnUq4AwB5AYSQ9aOFoHR70gA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 12 Oct 2020 20:39:22 +0000
Received: by smtp409.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 9dd356bd13123518a23f9b8c99e8481d; 
	Mon, 12 Oct 2020 20:39:17 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v21 18/23] LSM: Verify LSM display sanity in binder
Date: Mon, 12 Oct 2020 13:19:19 -0700
Message-Id: <20201012201924.71463-19-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
index 022af5ae8525..d8a813ba076c 100644
--- a/security/security.c
+++ b/security/security.c
@@ -790,9 +790,38 @@ int security_binder_set_context_mgr(struct task_struct *mgr)
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
+	int from_display = lsm_task_display(from);
+	int to_display = lsm_task_display(to);
+
+	/*
+	 * If the display is LSMBLOB_INVALID the first module that has
+	 * an entry is used. This will be in the 0 slot.
+	 *
+	 * This is currently only required if the server has requested
+	 * peer contexts, but it would be unwieldly to have too much of
+	 * the binder driver detail here.
+	 */
+	if (from_display == LSMBLOB_INVALID)
+		from_display = 0;
+	if (to_display == LSMBLOB_INVALID)
+		to_display = 0;
+	if (from_display != to_display)
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


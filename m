Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 49920253384
	for <lists+linux-audit@lfdr.de>; Wed, 26 Aug 2020 17:23:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-LmR57-iaMWeBUzMvedVtdg-1; Wed, 26 Aug 2020 11:22:57 -0400
X-MC-Unique: LmR57-iaMWeBUzMvedVtdg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BDA7801AE5;
	Wed, 26 Aug 2020 15:22:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0224619C78;
	Wed, 26 Aug 2020 15:22:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F780181A869;
	Wed, 26 Aug 2020 15:22:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07QFMkvF011579 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 11:22:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E0BD100724E; Wed, 26 Aug 2020 15:22:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD484114F24D
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:22:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76D6A901841
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:22:32 +0000 (UTC)
Received: from sonic310-30.consmr.mail.ne1.yahoo.com
	(sonic310-30.consmr.mail.ne1.yahoo.com [66.163.186.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-124-fYB62QGjM9mpFk28ZOPllw-1;
	Wed, 26 Aug 2020 11:22:28 -0400
X-MC-Unique: fYB62QGjM9mpFk28ZOPllw-1
X-YMail-OSG: 5IcbxjgVM1lmlk3ezubrvSl7kP_1wa_t8ow8aFSryOPnjYfQ9j_YaHtZ3pHdV1T
	IUZ_NhWr4j2qbDiFZ0kiIAgwuN_I9X0hO9tm3I256DABDOf9YowFGSzoSR9U0t21.TLGA4qka3O.
	x0Spr9PjCcZW22DYnOCxkfue0m79GR2f6JI8e_uXk.Sn0lMV5ddsLmyOBAJAqtpX5zcLd.i2wQaJ
	zOA.xd93e4kQbBxMk_vckfIhJ6TYWzViYc07NyZxNIzjg6p5UO5kYjUGr01fgiJcIFSddeNekCY1
	9rlqF_oL0JnANiHjHAul2AJqK_4BeKmjripIBlu0Ii9C9K0CVKmSI7f530M6TdWktD2qNbuN2lWG
	V3hx6XKNpaK6vBxShBPFNb7QUhtBUSPLdHVyPQphV.AB7IyRKtOwctoUY1JhOlhtighJi_eiV7OL
	hkleqXBHdod1o7rcDzHN7iva2LiGHOUUcOACpYMybZ4GJnp_6LDOULZhw1b7mOaA8GpXAhsmG9Yw
	BTqdwkItLjukXYfnDqWqCDF7sa.3ewmctYfjYUwERL4QbeTNBp0nwQDWXlre8gLBaBPwGlKGeyGR
	qzjTgVjOwAcnVqfiZrHZZl8SXR9Z6W0SyCzqTlTk9IYYn3qugjX5SZjXF6UBAdSlgiyLh0QTWyfZ
	Thh15fOAriN00XXtDaIOw81bOoc2JgqHu_7hRaXHNb3Wcrs7cTJ_lr7K35dZXxiMG6juCsR_iCuM
	JWMLBRXffr8dx_8eKtKD0g3P1hjQt39e553WVCQhZG5m9st6zQ5cPP6fE8KpByon1KkgM28Ri7Cr
	LAPy3E1o6YZ.g1HfOQJKDo7vqlTGVjGAL3mkOcH.zQCfcJfCrQ9aBvFrmfven7sljETONlJxMwsB
	P_j8xJBh6qPlmUOjNIdMYeFg46c3rxMKNJxANQWTLySwgi75Ib7IniBFiX4KrRo0.afEybrizB6T
	RBbIajuxgJ.NcIS6zsnM8faTlP2u9ZTg1XY_qngSq5PQI5ofGzyqm5eT1fgxdMDt55tu33yQguef
	0Tm9BZhirK1njK_WsiDrOi3MDV0HsgnqKyQKqUUTFK3iGXf3CDE3.qAFquRH4.E_GfWOozh1vufK
	c1PUDJ3vG9ib3.qQBNgyO8D8JEBMygYg7cjyN8Ct1aosxF9I655FDu8UxOlpDRmHSQo_T5nn27Ut
	TvtCaxt.2mSFYzH4.xEmBNSuHzIac.aI4tjAtxKJUhEX2TSlX0SvdzLCXyGaZ_YOpF_3h7Uny6B4
	HrMbTy27yj.mc4wGZnvauK8EwZy7xkiT.cTdDL7VQDYhDOzR2bZq2cu_QHf2EX4SNHlZTj94ao_b
	NvJTJCZj.HjwUEtxUyqMRyzdVle92rjULjFgoCArPB8EeipdnQCxd31_l6cBvtiItxkmwsDyEqyA
	tqNy2w2E9Lf2YDjrwXMQW_HNsnuIc9xxvtBDo5hIHa8uLM5n3FDUHRz3esxvVLQMq03PrNZfoBtu
	P8Uq4ObRyxnObxs1anXdNlethvIxnTLmZglz3QVVofVLvYFaCHhu20skw52hsRhurdQzoBxy9qHk
	yGopcd03296xt4yw4tG_4tZzE4xX_853EsO2HEeIQZ.k-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic310.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 26 Aug 2020 15:22:27 +0000
Received: by smtp422.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 4e2715e5e80abc834d7fac6d2c42f5da; 
	Wed, 26 Aug 2020 15:22:24 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v20 19/23] LSM: Verify LSM display sanity in binder
Date: Wed, 26 Aug 2020 07:52:43 -0700
Message-Id: <20200826145247.10029-20-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Verify that the tasks on the ends of a binder transaction
use the same "display" security module. This prevents confusion
of security "contexts".

Reviewed-by: Kees Cook <keescook@chromium.org>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 security/security.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/security/security.c b/security/security.c
index ddbaf2073b02..95b48721fb17 100644
--- a/security/security.c
+++ b/security/security.c
@@ -788,9 +788,38 @@ int security_binder_set_context_mgr(struct task_struct *mgr)
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


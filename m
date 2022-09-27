Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D765ECE0E
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:13:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664309583;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=74Fq8KH5eWEZjpxjfnhdVy9QUjTtJ0Q1YS98xOzkoqU=;
	b=JN+BL51zsJgZZ6IzbcCjBhyqi+CEbAwb2W9ogJpaK1zn688MI++l+x/b0plL5T83Tk0TB7
	NJAXUM1qq2ttH7LUJNRjJ0nxJQKRry6Vz6XgCaxwxPiNDD6IKYdtHz5Fzk4ogD+/jFCBvJ
	61921uIaFjjCJ8hkjhmk95VyiMD+zeQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-P0rRX5SFOwWLFY5gln4LDA-1; Tue, 27 Sep 2022 16:12:38 -0400
X-MC-Unique: P0rRX5SFOwWLFY5gln4LDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C7C2802801;
	Tue, 27 Sep 2022 20:12:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 656322027061;
	Tue, 27 Sep 2022 20:12:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1618E1946586;
	Tue, 27 Sep 2022 20:12:36 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 671C61946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:12:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4CF99C15BA5; Tue, 27 Sep 2022 20:12:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 451E2C15BA4
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:12:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A9873C0CD44
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:12:34 +0000 (UTC)
Received: from sonic308-15.consmr.mail.ne1.yahoo.com
 (sonic308-15.consmr.mail.ne1.yahoo.com [66.163.187.38]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-646-8gIe9Wf2PE6IrrnyFJFSwA-1; Tue,
 27 Sep 2022 16:12:32 -0400
X-MC-Unique: 8gIe9Wf2PE6IrrnyFJFSwA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664309550; bh=a1w5OutSo3FwVQZ0kDH+xS9MswMkWAOFIOjlX22ySuj=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=Rj5P3gms9YdCEND7e6bSo6sFdx+qQ5PbNL/qJ6JQcKGLPA3Esw1GhIbUUobKmBAjqcJiFzWB9A/jTnXsG5ueFPTfyGvKQZTGDEDKu47pV7XlvKNuu/dX61xtoyMaMa6N8BKDZYarRDhl7iE3J47dMfwUh/gVyivV910dmgUGItQrhIphFFWP39YcfhTQH7Vys6W5Tj60jP3eKjndJ9d2oIkJ81pkGaA206l/LZpygSfMcKGKMbYVVUHYe+DMtw++54sZ1MBXYBzctNWMjnOMkYNGMkVEH4Pjw9LedRPmY0jXKvkyFPD8c2uLlgqbjb7zOPCqDb6LuOJUZPc/28jlZw==
X-YMail-OSG: EkGpCjMVM1k.UuLmA8oPw9s6uYzUMDwpqevoXd4uPa_OQETsr.JjaQz0f8ucr25
 SFbkhC0b2E2VR8B4ZqIkKTMHBzRT2d7eDb7SAmMx07YB2_1BGQEVmP3dPndBuyfVau3qWgokWAir
 eq7QaIF05S4jHCTKpnczavRzpMOIv_1eKkUwtVO4fNtC.H9lyWcSSK4ls2UUHk4DKWX3UU5RdhhR
 47pw0FPiUzUDchYZ6PNnnXs_FTdiVxm6R4OZQrfxPMzHVaTtFS9O_UbhM38NTPgI0j0QWfIzMFNT
 S1wYiL4iJNm2LQV1cUfD2C1BSaz3VFX0Ydhwtj6J7WY8mPCDzi05zZthWX3AqWdOI0QlgKCJFJcc
 qVxqPfkVxfXtFWd4cm20hOu4IOcSXlUkMdN2ZtgaXPgAuFOZqtN36F8.OVCA.q7.Ra_c.XYP0HA3
 bbBmkBzti2djlD3dwFpDhGdYkHP7VXSM0yy0mTivfKTDXiWHPnEXM5P3h7VU_sM.QvueJ0zBXLnp
 2oMsBOgvL2AcHEWdNUIJxl4VqmohI31pvzn1.HVTNjPKg0N_Lkdu.1HXbsGhFHE5lYugf2menZ.G
 D5h7Fus0b6hsC_Vr0KuVcnP1G2DHDutPEToq1GhcFsXUSg_SENRN41zI8b3ErZ4vuM30Gc1FgE2R
 2IwDazr4kSPNjgqmKYBhOw7gUdmAkRvF45jaZh7SnMqbVfvD3UI0MP0RyDg_aCHNZLWXQReK4OR1
 c5vA3VjpI1Axao5KBlDL9CmoPQ0U4a31jQwEY0F2FwwERHcZpp7JkpB.rwFcjLbCh6ATjL9zND87
 W32yHzm0Z3ahfTSpcYlkTdd22AYKYUovMhUSxMPS4j6C.g8yHvHQbZgvdhlfAOY81S2OKhzpcQeN
 1ZuIGL62Tn.f7qxdI._5EuRSNWm3.4ZalYTz72GS0BD5cm4vcDzBmQ8mB53zjsFqhOCwsEJgn.Uj
 88oGKeu65LHJ81CGNQS2gh19Lg7XgqhRh45ZMDmwF1IPGyjZ7n8vuXS8IpqizM56Mn7yg5DYIJ_5
 Pa958sx.g_bZfQtZo3wWvCOUlFUQjw_BoMYHAy8wbUhDoAv5MSA_QWg3YBm2Qo27mJiGrQaz4Gp2
 FfOkv1LLmaKQzCRjy6N1WD9O6ksaSohCNd5g7taueHjsfvSSDK.UUaDhx2c51YLEe6cgGOOSzhvi
 K_KCx9pJACwWQ6jQjPexvRnuGgD_lxrlZP2v.c2f1iFzMM_pN0KurfFYVqo.yOW9nkJGLpDUXj61
 8TxlY6wb2DPnK40UCHJGEUrU2fUpf14PmtRpWijXZ.YXK9QcuAM0U9GvVdCJctZrdlCkm3hnS2MA
 vURFh2BGLSLpTAJHC.QAq.0_QZdYcIIZkQBQUv2_W89SbejdDmLsNBRYdIWL.HDgiEHWYWG_opOV
 ZC8tifveVcrUSWosH6HbUAvaRPHNPnMuWfPpzRFBJfZ2EFIo9MOUnTRsWBX0_oy7Vo5XDoCCCNwa
 BRJ8nfudlZI4pouKVjxDM9AexL9qkcuV4X9EDWjSvO.XeUjAG25Mw2yKnGSwoggpInpeu6tVR_fI
 NKeGkEBwzsfQzHFOwOhh6kwB4E.IidhgZBP.9SRvqBW6onpRvWUkKWsnq69ZAu3L7tLM4jKSoizR
 bkHa4ojGN5P_VISnvzKi025B5vBPoNJGaITPmJ1TAfqNyawrVA8x3dUVVUJMaxH6WG9LHL_V.szA
 hZRVC0JJBSE401lbMYEoj6UWkKK6z4kgbLlyqqLFbhIOP3StZv5vPvL39zHuRr9egcmJb6.QvmLM
 Gcf.NCCaxJBKkqtIhjm0asi6wB3WGjFGlyLdz4h9xuDB2Mstf8PgA7kVI74rWYqqnb0V0N4t_YgQ
 kchVGALJEsCUcH54ZtJ.ZUIs34gGJGFpxu3u5OcIq8B5k6ZGNVs4pVOezxtnlEF5NV5yFwHlRTOa
 a2ihzBLoRKBTH4VWKjRNcFVSSViYMx.EW5WUsBqpZ8XZCdy2Prnrg1gccGxoNjqKltb9O0VEkCb0
 Gig2kufgFJb9ycUgqaDZTlY2oYSVvZZENrxCU8PclKdFTTzgFsSjaGenFWMYGPL7W6rVEIJHJnYK
 6RYz.XyAfN3LGX6qxjyWBaTibRAEYIEmJ124.DWCG8E_2UicDpAnBMUl5PQarxHpF8xra1jsHI3Q
 9OG3tlkvWGTD07GxC2O6TmxaJu16ScqN3rphv44imAwIpFYpAmbbEzFnKewzkkQtbUD.ykvsMtfz
 x.0slFsfKAoztp3mhJpXG4smlU5RWMlR7iPv3GFLZQNxZ_LftzSVAIcAggCSuGZ7Czoq_oKH38Wv
 ic6M9Poiq5H3k6FyYagrGBkbn_TSzldmMY9z0eCw-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:12:30 +0000
Received: by hermes--production-gq1-7dfd88c84d-nfz27 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 1d976fe2ee917226e6d7cc50e923ce4f; 
 Tue, 27 Sep 2022 20:12:25 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 34/39] audit: multiple subject lsm values for netlabel
Date: Tue, 27 Sep 2022 12:54:16 -0700
Message-Id: <20220927195421.14713-35-casey@schaufler-ca.com>
In-Reply-To: <20220927195421.14713-1-casey@schaufler-ca.com>
References: <20220927195421.14713-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: john.johansen@canonical.com, selinux@vger.kernel.org, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Refactor audit_log_task_context(), creating a new
audit_log_subject_context(). This is used in netlabel auditing
to provide multiple subject security contexts as necessary.

Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/audit.h        |  7 +++++++
 kernel/audit.c               | 26 ++++++++++++++++----------
 net/netlabel/netlabel_user.c |  7 +------
 3 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index edb919722448..87ba6fe7f1a2 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -188,6 +188,8 @@ extern void		    audit_log_path_denied(int type,
 						  const char *operation);
 extern void		    audit_log_lost(const char *message);
 
+extern int audit_log_subject_context(struct audit_buffer *ab,
+				     struct lsmblob *blob);
 extern int audit_log_task_context(struct audit_buffer *ab);
 extern void audit_log_task_info(struct audit_buffer *ab);
 
@@ -248,6 +250,11 @@ static inline void audit_log_key(struct audit_buffer *ab, char *key)
 { }
 static inline void audit_log_path_denied(int type, const char *operation)
 { }
+static inline int audit_log_subject_context(struct audit_buffer *ab,
+					    struct lsmblob *blob)
+{
+	return 0;
+}
 static inline int audit_log_task_context(struct audit_buffer *ab)
 {
 	return 0;
diff --git a/kernel/audit.c b/kernel/audit.c
index fb182f7e9d18..a611130f83cb 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2226,20 +2226,17 @@ static void audit_buffer_aux_end(struct audit_buffer *ab)
 	ab->skb = skb_peek(&ab->skb_list);
 }
 
-int audit_log_task_context(struct audit_buffer *ab)
+int audit_log_subject_context(struct audit_buffer *ab, struct lsmblob *blob)
 {
 	int i;
 	int error;
-	struct lsmblob blob;
 	struct lsmcontext context;
 
-	security_current_getsecid_subj(&blob);
-	if (!lsmblob_is_set(&blob))
+	if (!lsmblob_is_set(blob))
 		return 0;
 
 	if (!lsm_multiple_contexts()) {
-		error = security_secid_to_secctx(&blob, &context,
-						 LSMBLOB_FIRST);
+		error = security_secid_to_secctx(blob, &context, LSMBLOB_FIRST);
 		if (error) {
 			if (error != -EINVAL)
 				goto error_path;
@@ -2254,15 +2251,15 @@ int audit_log_task_context(struct audit_buffer *ab)
 		if (error)
 			goto error_path;
 		for (i = 0; i < LSMBLOB_ENTRIES; i++) {
-			if (blob.secid[i] == 0)
+			if (blob->secid[i] == 0)
 				continue;
-			error = security_secid_to_secctx(&blob, &context, i);
+			error = security_secid_to_secctx(blob, &context, i);
 			if (error) {
 				audit_log_format(ab, "%ssubj_%s=?",
 						 i ? " " : "",
 						 lsm_slot_to_name(i));
 				if (error != -EINVAL)
-					audit_panic("error in audit_log_task_context");
+					audit_panic("error in audit_log_subject_context");
 			} else {
 				audit_log_format(ab, "%ssubj_%s=%s",
 						 i ? " " : "",
@@ -2277,9 +2274,18 @@ int audit_log_task_context(struct audit_buffer *ab)
 	return 0;
 
 error_path:
-	audit_panic("error in audit_log_task_context");
+	audit_panic("error in audit_log_subject_context");
 	return error;
 }
+EXPORT_SYMBOL(audit_log_subject_context);
+
+int audit_log_task_context(struct audit_buffer *ab)
+{
+	struct lsmblob blob;
+
+	security_current_getsecid_subj(&blob);
+	return audit_log_subject_context(ab, &blob);
+}
 EXPORT_SYMBOL(audit_log_task_context);
 
 void audit_log_d_path_exe(struct audit_buffer *ab,
diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
index 1941877fd16f..42812bdfc31a 100644
--- a/net/netlabel/netlabel_user.c
+++ b/net/netlabel/netlabel_user.c
@@ -84,7 +84,6 @@ struct audit_buffer *netlbl_audit_start_common(int type,
 					       struct netlbl_audit *audit_info)
 {
 	struct audit_buffer *audit_buf;
-	struct lsmcontext context;
 	struct lsmblob blob;
 
 	if (audit_enabled == AUDIT_OFF)
@@ -99,11 +98,7 @@ struct audit_buffer *netlbl_audit_start_common(int type,
 			 audit_info->sessionid);
 
 	lsmblob_init(&blob, audit_info->secid);
-	if (audit_info->secid != 0 &&
-	    security_secid_to_secctx(&blob, &context, LSMBLOB_FIRST) == 0) {
-		audit_log_format(audit_buf, " subj=%s", context.context);
-		security_release_secctx(&context);
-	}
+	audit_log_subject_context(audit_buf, &blob);
 
 	return audit_buf;
 }
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


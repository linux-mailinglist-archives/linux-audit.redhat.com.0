Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6012A7233
	for <lists+linux-audit@lfdr.de>; Thu,  5 Nov 2020 00:47:40 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-zSgoeGaQPHK8cUI-o6WSvQ-1; Wed, 04 Nov 2020 18:47:37 -0500
X-MC-Unique: zSgoeGaQPHK8cUI-o6WSvQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A44C480ED80;
	Wed,  4 Nov 2020 23:47:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F1FD5DA33;
	Wed,  4 Nov 2020 23:47:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EAC235813E;
	Wed,  4 Nov 2020 23:47:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A4NlBgA018165 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 4 Nov 2020 18:47:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C1B392017E80; Wed,  4 Nov 2020 23:47:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC5522063FE3
	for <linux-audit@redhat.com>; Wed,  4 Nov 2020 23:47:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9558811E82
	for <linux-audit@redhat.com>; Wed,  4 Nov 2020 23:47:06 +0000 (UTC)
Received: from sonic313-15.consmr.mail.ne1.yahoo.com
	(sonic313-15.consmr.mail.ne1.yahoo.com [66.163.185.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-428-8xP8B9rIP5aLzRv1__72mA-1;
	Wed, 04 Nov 2020 18:47:04 -0500
X-MC-Unique: 8xP8B9rIP5aLzRv1__72mA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1604533624; bh=+hH1a8yPR6qaZDCsIMFmKPZ3In+1spyVg/V+Q95yqaF=;
	h=From:To:Subject:Date;
	b=XUplVZ9+tom/nUwDN1CcDhHjCwqjjokvwUZB08MdEwQgK5kYCF0/bZ2mche7Wcm8etNXSGB9G65Aas8pSxUM2yI0+ZyljAEvKr+fx5ucbcEeYJ4YjuPcPUaAHfpO1ySfiacoK3tPVKcht9B5GJ++4WVeS51vQVwWoJPjQatHD2UcupkCI4bMcwolAdtEcOSufHnWl+ed2F20+vxplf0xY/imt8L41Wo7I8iUXtQoaszmTLsN1fNO82O4C/kobbilsAw9xxO2BZK+zBR6U/rNvNQ1IIwybXrpSdfLP5yYBf4Yd0/avxXIQ3JQ6mEbkfd7FZYauqrUmuNrfKxB1sq1iA==
X-YMail-OSG: goq9a4wVM1m89i6MzLMqvrBtoOWYUOTFtKaYw7MYnE6lT7pvOPcDjw_SqqvRIaa
	JWkM57E0u6VhI7or7hthIw6Z_1wMvFGuW_Aj0juprAr8a5vIqpUCQ1AiP9TZHTBGDrJeRRCHgZ5V
	I3p8ewf5XeLbOHUGy_6_8b6gBhk27vZAC7JYCwCcLaykQmeOQJSh6RgW9rNg53p.3JLyTnE7j7VB
	ZfUYdIVMiYoTyMelvQvMSpjOducxCwI5TPJfLWGPr2HHHIbEsAVNOymXnDzlQLDuIsX_2pUsu.CK
	bGHxz7SEOpFkZ66WsgChfeupphVr6lYPT0JF6hzGNm7cmuMUDAmvurMDMyiPbAAUIKK.L9gpKzLA
	fCpek1ZjoloDy_RLqMtUHNviDsxNswQdiV3TqtiCy9w5q.tE6ITG.2ot4QFfV0SY_c0leQVKYkeF
	oCYymgnVZFcDhvN8FPoAPlPuiWv_J.96IJkDccnLPc95JDuoEttT1kent6HkTbVrCd.CvFPD1aKZ
	ATYOinCMOBvobmctIefR97LAt8MGGCbuJe4yFaPBwTnuSeixhLwBIgE6T69qVmnyjJg19JnXm5jF
	50ejS.9BAxeSyeQaKxTnFdy0XMO76bskIBiI_MFtlHNOzeZ5IkeXsXWANMUavUudMusEK6rD5.av
	9WYR.KP_BeOi3wL4fUEjmu4c26Ec_fu4wNFuug84tLnHjzZX_wTJtwVm1Jr4O7RJ4e4ywk8oC4D1
	s8qg6ROkJrtuMo5EbshMi0p.aLB2HCSAm_Z3.5nd83Jc_IfF..8mU27rvthpxFhQL__fN8Tu.uok
	zzPWrmyTlXRzuxpjPzZeJXmagksi98WVVRCI7kXtwhmYpafJtGZbDvN.uNPCGXqM8Dvt_Z7VUXCp
	yilhC.ObhEypdJiWM0u2rRIZavbv.3sSxbGnvo4_P81zZJTRxz3xz8QswfmreDNZmCwoqnNLfEBl
	nqJP_y53kb4XvRO3meFNmeP_Xl6NmX9v9S2om3AwEXexeUbCafEDq8RieiDcWSLMpJn1U4U4_8sK
	QW0ff02RlY98h8EDlkJC.WtYaTwTC17QOa.nS_vM_lRiTeZxIXYE_A1WaYNv.tUm77pzv7Nq3p0Z
	6lIVsnyARahdg1KytTk5jE1Thx9iZKHfxcrEOMEwAxZiUxrYocANn4ng.hsmKuroMwSMQqZWxJD9
	bsfqBGYVSplCcW2LZTLgljjK5Aj35Hj.ulITfxf2a5HrClxDn7S08cGR1GPCG7w06emabXrgl0l7
	htXMd9bxMKqciwC4AVA6X6r1jQDeMoh.dNSEJeQp1mR0RnW_XFkHXnuov_PxXg8pbAInI85wqgJn
	dTIuycwNToYhYNK8yJHFDJfVvDwA3XKwvZAonVNYu1C_rtJ_bi_v4faQU_v.e4UbKRIl0uVp9GHp
	b3zUZB3pyt5eMaEe2B4OHK6vgHT3VurxEXE1Flls8wuba0okqUq58K0qGCOgvOW1YbP3lB1ZUSmH
	vVh8vJ082TaTL1Jus9XrqJ6usxOunS47lsvFGYzSQfM6oufh0.13rHto7VSp8zNmCXBZoMvXvtkB
	LyL00PikzIpFsZFE_wPObg9VrCx.3Z2nGdVagBpEgwcmaLUPHvzCN7M3WPf8tzMHhXTYakUYGuat
	h1k_WmuP6DeUULqwaT_PcjkdpohWOqdHVyOF0Kf.hOylwLL8cYnbO_jaPhDepUF4S2RAbg6Ylkjt
	xDHG.BNerTazlZPr5RdhSqmMtUj6HxDxMTZRxcgo.BB8p6sOQG15Hh.jF5UvQFsHOViN_5hRvyfv
	WV0zucFgk3ynkB_bw2mitdoCpln2mPSAw7X4BzRNYpF1GQL9iJCfAA_w_4x8QNZrRDTpvSgHix12
	ztW_dXTf3.p5ju4bTl4FUvUIv0rtB4QUKrE6o71mz93flIPbMG.g8.fmhPt8Ko1M1dmT61UXNG9G
	hbASjD9AirjM_yfr5Q8K3ymSiuN92gSgMUY0HSOJ12m_XKAjD6qzKR28YlMt6U9Z_FvCvzteRx0f
	WRSvnqn.vnCxiGI05KdXmtca9DpsjPedIMiLw9dwHmWYF.8ZmxqM7Tej6zsUawZPSaY7vofzduHS
	w0mCsuTOh8VSzkfleqadXFXolE0dm.btUT29c4ZfPvC6MSQWKXnBEw05dB02vcL6DEJxRsw_7_BA
	1t0tIP9NWFcixe2zJjvC3JVzB9yZjoz0yV0Ab5DyOH2Qb7QyqVQ4h3iYW5ydqlct7SHpzdZ0dSDZ
	GDf3PZ1dKZxFvcx1miku_P_7IvtBH8As.0zScEn1BORJpVjHpj2JVJTIFaLp.XmnTwjO0eRq8TGb
	blJBXnkkCPuFFfPttw1ekJ.zOXRDUJYds5wgH_FyligIzii5cXPJslPBxYBuQuRCs7H91CYkrI6_
	1Dv20fIK2CD7BLai6qZIUjj1Lpf8LurlNraSWdBvJJ11ncJOOumzmd8h2Bf6f2VCfPOFEoTRYJv.
	d3I1lPpn8iUoJ0HcbEGlXIwM8fhvpYe60LxIgBmFdIHKr8KV987wgDMUmR9IMYBu4edIp372LxL6
	dTObasPfAXbEeWMdJKYJSYfwCkAf3gwzsZdvDdjNs5fR68fGLmQIyhddV3BE9EYslb_Pe8KBuIUt
	aFVq3buiiDTZxjaRArTmDaV5izHaTvVI0Tl4or3SVlW6fQhkFxizIhOIMpiBrzPwCRCZA__w.sBE
	maTDd1s9K3.AEFHmzFZrU0D6pSL3rPyFvbknMAbK_5WA2Muqk.NlMsitJjVcu1TSH6my5OJkZasL
	RgeXtLQqV5NallU2ESuH_6XyolUWx1xqgCSodTd97pBTGan5P9dpC46CJnDH_gGcFWeUkvWhxnr6
	JInA_ayhqSC2zQBgNes1D2WF8vc06oeLBW3h__a6E3KkDKuQaSppzur4xpvvrdNUQStem_Ocm1Z0
	v5v4HAeoOGMBHB6srLsqP53o73UqMfrjgAFDqCvTqq2kFfBqXKvRZnxzKvAZeS5yg3jjz2QyZP8K
	iB56rZGmanZypTvKMRHXcA1LYDWYGrUMT5eaai84QYYsd5qxtEmYl1ZRDUteBUuy0CB_myoKNRRx
	9maZRBIdVN478Dp3QsRee8vF4RGmNNpj01BJZ1HZtvoYA3ewC62jrmNRuVdjqyJJxcv4eW2Trisi
	2goZZNbJ6hwhkCl0hj5YzU8pTbz8pvNgFIlBvYKmJylvieWF0fsgeKagnKIrrVXbcUZN.qvggQVV
	F4vuWllVxNf1Dj4TDHo6_Tun7OBgd92n.8dDYfV1otflR6P0Hr7tt2XtM8d0sYx1FI3ztyJNHvE9
	DX13U4NXFIM51UeWVZ.CY.VuHIDY9RjZn11qIf17v500XMf4R4i8fjfoGn4Vdhc6IFJFqQti4UTx
	1YiVZiv6xDQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 4 Nov 2020 23:47:04 +0000
Received: by smtp422.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 703a38252183f817957522daa59f0b45; 
	Wed, 04 Nov 2020 23:47:00 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v22 04/23] LSM: Use lsmblob in security_kernel_act_as
Date: Wed,  4 Nov 2020 15:40:55 -0800
Message-Id: <20201104234114.11346-5-casey@schaufler-ca.com>
In-Reply-To: <20201104234114.11346-1-casey@schaufler-ca.com>
References: <20201104234114.11346-1-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change the security_kernel_act_as interface to use a lsmblob
structure in place of the single u32 secid in support of
module stacking. Change its only caller, set_security_override,
to do the same. Change that one's only caller,
set_security_override_from_ctx, to call it with the new
parameter type.

The security module hook is unchanged, still taking a secid.
The infrastructure passes the correct entry from the lsmblob.
lsmblob_init() is used to fill the lsmblob structure, however
this will be removed later in the series when security_secctx_to_secid()
is updated to provide a lsmblob instead of a secid.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/cred.h     |  3 ++-
 include/linux/security.h |  5 +++--
 kernel/cred.c            | 10 ++++++----
 security/security.c      | 14 ++++++++++++--
 4 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/include/linux/cred.h b/include/linux/cred.h
index 18639c069263..03ae0182cba6 100644
--- a/include/linux/cred.h
+++ b/include/linux/cred.h
@@ -18,6 +18,7 @@
 
 struct cred;
 struct inode;
+struct lsmblob;
 
 /*
  * COW Supplementary groups list
@@ -165,7 +166,7 @@ extern const struct cred *override_creds(const struct cred *);
 extern void revert_creds(const struct cred *);
 extern struct cred *prepare_kernel_cred(struct task_struct *);
 extern int change_create_files_as(struct cred *, struct inode *);
-extern int set_security_override(struct cred *, u32);
+extern int set_security_override(struct cred *, struct lsmblob *);
 extern int set_security_override_from_ctx(struct cred *, const char *);
 extern int set_create_files_as(struct cred *, struct inode *);
 extern int cred_fscmp(const struct cred *, const struct cred *);
diff --git a/include/linux/security.h b/include/linux/security.h
index 89c538aa283e..948d12a5eb25 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -443,7 +443,7 @@ void security_cred_free(struct cred *cred);
 int security_prepare_creds(struct cred *new, const struct cred *old, gfp_t gfp);
 void security_transfer_creds(struct cred *new, const struct cred *old);
 void security_cred_getsecid(const struct cred *c, u32 *secid);
-int security_kernel_act_as(struct cred *new, u32 secid);
+int security_kernel_act_as(struct cred *new, struct lsmblob *blob);
 int security_kernel_create_files_as(struct cred *new, struct inode *inode);
 int security_kernel_module_request(char *kmod_name);
 int security_kernel_load_data(enum kernel_load_data_id id, bool contents);
@@ -1061,7 +1061,8 @@ static inline void security_transfer_creds(struct cred *new,
 {
 }
 
-static inline int security_kernel_act_as(struct cred *cred, u32 secid)
+static inline int security_kernel_act_as(struct cred *cred,
+					 struct lsmblob *blob)
 {
 	return 0;
 }
diff --git a/kernel/cred.c b/kernel/cred.c
index 421b1149c651..22e0e7cbefde 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -733,14 +733,14 @@ EXPORT_SYMBOL(prepare_kernel_cred);
 /**
  * set_security_override - Set the security ID in a set of credentials
  * @new: The credentials to alter
- * @secid: The LSM security ID to set
+ * @blob: The LSM security information to set
  *
  * Set the LSM security ID in a set of credentials so that the subjective
  * security is overridden when an alternative set of credentials is used.
  */
-int set_security_override(struct cred *new, u32 secid)
+int set_security_override(struct cred *new, struct lsmblob *blob)
 {
-	return security_kernel_act_as(new, secid);
+	return security_kernel_act_as(new, blob);
 }
 EXPORT_SYMBOL(set_security_override);
 
@@ -756,6 +756,7 @@ EXPORT_SYMBOL(set_security_override);
  */
 int set_security_override_from_ctx(struct cred *new, const char *secctx)
 {
+	struct lsmblob blob;
 	u32 secid;
 	int ret;
 
@@ -763,7 +764,8 @@ int set_security_override_from_ctx(struct cred *new, const char *secctx)
 	if (ret < 0)
 		return ret;
 
-	return set_security_override(new, secid);
+	lsmblob_init(&blob, secid);
+	return set_security_override(new, &blob);
 }
 EXPORT_SYMBOL(set_security_override_from_ctx);
 
diff --git a/security/security.c b/security/security.c
index 4ecbef074809..3a88a90ddba6 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1693,9 +1693,19 @@ void security_cred_getsecid(const struct cred *c, u32 *secid)
 }
 EXPORT_SYMBOL(security_cred_getsecid);
 
-int security_kernel_act_as(struct cred *new, u32 secid)
+int security_kernel_act_as(struct cred *new, struct lsmblob *blob)
 {
-	return call_int_hook(kernel_act_as, 0, new, secid);
+	struct security_hook_list *hp;
+	int rc;
+
+	hlist_for_each_entry(hp, &security_hook_heads.kernel_act_as, list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		rc = hp->hook.kernel_act_as(new, blob->secid[hp->lsmid->slot]);
+		if (rc != 0)
+			return rc;
+	}
+	return 0;
 }
 
 int security_kernel_create_files_as(struct cred *new, struct inode *inode)
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


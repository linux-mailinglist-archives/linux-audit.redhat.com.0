Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 904373043FC
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 17:48:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-lMkHJ2VLO2mlkvs2kzvI5w-1; Tue, 26 Jan 2021 11:48:32 -0500
X-MC-Unique: lMkHJ2VLO2mlkvs2kzvI5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D47CC190B2BC;
	Tue, 26 Jan 2021 16:48:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B340574449;
	Tue, 26 Jan 2021 16:48:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8216718095C9;
	Tue, 26 Jan 2021 16:48:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QGm5Kl027707 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 11:48:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6AFF52166B2D; Tue, 26 Jan 2021 16:48:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 659832166B29
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 16:48:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9859780122F
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 16:48:02 +0000 (UTC)
Received: from sonic307-15.consmr.mail.ne1.yahoo.com
	(sonic307-15.consmr.mail.ne1.yahoo.com [66.163.190.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-213-rshbYR9jOgSQYlUx6Vwclw-1;
	Tue, 26 Jan 2021 11:47:59 -0500
X-MC-Unique: rshbYR9jOgSQYlUx6Vwclw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1611679679; bh=zbOTKkkwWXM3/hcCa45IncB0CnDJT1LVds5Z9uSbqBq=;
	h=From:To:Subject:Date:From:Subject:Reply-To;
	b=IhWmUjx+0IBbD5pmEbwkd7dkc1vlLJFGQ2pBXZ08vaA5Xt918OCO0zCzUameVgEYnN2pkDcF2E6ZlQXxdoMCZP3e1DQqmZrG8xm3YWPa5mK6peDuyPbvM9IBZlP+Tc3/g7jUDGm5dgdl1Lupk2gQ8pDI55BQkyGH0A2xjSuwmNDXcprUuIj+8l3DA2tcjEcAvC5e/Q2IKAV+a0xcRT0SGPBEyMvX91p2r2z8VMMBtJqBky04+GsjKjFFxdygjM8BxdCsu7yQdXsg9T6tg+jFH/wAq1hJLDjLHJ0DstKGVWFc2QgP/VWvwrUZNvkeiYxLI8/AyTdmiZ0IIaY/UON+SA==
X-YMail-OSG: XCdn72YVM1mND6M_2jEwLoTPfDsBdOLtppOFQ_zAcMoHZvdt43FqrQnzayy4H6v
	EB3ddGDNt9.0SudjRSKn_bFh81si6nVNkuZFbNXyf1QDR2G_xUjqJxhA4u9a28fCDU3eFDdbiTmR
	sOFfyT.tVywUD_ToidXKe84kbk0rf3tA2gWFM7zUpwk9FgBWiSLh6caYHLEBSc3z1ZvK0iUcpHPs
	afLU2SRpGiie3xYnBpnb8V1N6bNQXKS1vZsx6fqxM0wBMmN9E_i76yZgpmAXxPL9aSp4rEi5gDcg
	XpRl8ldDB6n0hEcmcR0103HVV4_JczzAyWqkZ4UV7fobya6tLAb4P96SUoqJfJOG8EwOJCUtwymo
	BQWObh0jsw5a9J0HW3qweSa_of9RkWp3OMW1.eHHLaM6NkuwUwPLHWO167CrSvDv0QKnbU97NnbI
	mEHGWnS1ucAjl.HLxML4eP_cv4RF6vssapK74x1.XhToVJ3D3tsG8a2JlckiBViSgMrPMVLhKmLn
	OHN9Q55LoFBjYjgHp14bUe1mF2Xb1gc8a0e.rWT.z4CWUNfWZmn2cKcQ09qqdEbncbhqSVlKHQeE
	0uonD8pnoitebWR4uRg0UthLnDusIF_OOiJ4MWhoVxcnIOeAKOUIOcWzpTXb7PlgbMgd8zJmxfLZ
	K9uWTFB3nqH.04urU.q6_WZ_SB41a7WzDPgowtM3ZE_7mCC_N7NLGvgpu9FalSFTOP1Da4cbRRMS
	.VJ8HtSfL5UzfbmtYhU84FruvBDqVFlU2dwFyUvfHD_PtURI2MdWdkRohR_H9WC0iC3IieoFY4h7
	0dD6xi5QZsC1qrhBfp8fw8hFVW1eh1XSob2sY609Xyl6Y198ck.7_bASYxAp_7MjH_gsY5tE8WCq
	o55N9Tyxd7skyxiKMIw82NPosciGYYwhpSyN2rEzkSst8b642clQN4Hes6Bk8bdb5ojvH_CSq3n7
	PD_v8owFyAzXLTc4bfdsiFOxNcqbFCJ055gbr_bD5MCXJOGT2DzlRy_10W_YGLkmpBIANYLdFe_L
	7mCSfQa_jFsi3UhUppARRrTYZcm38knBwenv0tbVGCqEPRks57lbNqr4Ew2gWt5scuNZNcwNMMYQ
	_lXPXn9WObvNvS.WKPusGjJQxI_7Uxfa1D.rONpEc0yk989uL4DDaUGCn_86hMbf7LOVOVd.7pDJ
	HQRvKXaEF6bUbRwpO_EqXvIFtdMP1TPvRKY5bCGLeeEdTZpuP2hQYpJKjVA9PkL1_VkUkJLyX0O4
	E0nStzJFJL7n7Acnc6.W6OATQ0MtfqSm.muXY3Ob5gIc0mMsNd5Ir9_tQAfp06.w4vOEBi0zC9RD
	fGjR3J.swdmv43._VwXK6clWY5d1Gp8filBpzIe.CUUD9GX0RPMvqJ_YSW2ZbKYTxTQo1ji1y33F
	LufkU3HRiXZqcJwcgj4Ye5Lh.zGiRoiEthM2B0_SEtHZblnnj5xpq9w3iqepU7n5wEqXsPhDCmJJ
	a0KIndTmL7hDZ4lLfguWBBX3V1X1C0Jg9UEYeJYwyZ_OciUj_mtakkcEi.834DPOxKotEb9mPyqc
	P5h6ObH_KRnfVg2Iyew9zM2Z0T1THyvQeCHSrvO_R1UxWl1eZOV86ZEqOKULJfboiKsRokCYyDwk
	X322fkvLnSpo0S0hiT2UNn9RMBN53lFCcN8qdG0HTyYpQvkObqp7ECf.n9QcFT457wkkkD_476y4
	EhOxnl.iTzH_o1jl1DzElPvVXLNhqaI9T84CR1b3Pr2vhHQJpNTt.PLDeQafPGwJapny9OYcorsT
	9OBOOJi.UhrsgWKGOLNqA0S6QqGSDKF30MjFzvQhP0oRAJSWGJmTlHQwDfxlCn2T6qXYCLOp8wQq
	1AqPIIoEDwW80SvYd7XPwFvJos82BYWMne_rhfPVf0olXUt0D348kQgsjS6IOoS_MFm4G3Xp1Sd7
	z.Lrj6Ipr6yTCbJVucmfRh0R4WuZIgrdUeWxug2FpseTFmXXZ2VlkXhj25lEg5hUDUd5Bi.qnUcs
	lwHN3P_xoGKvzctKDg4pePJyr7vm5TUKXM5rnH_ajulsA.5xtmqe13DDLlGa4MmBPA4nQDVRRa5Z
	Ehyn7vuZR1a9.Eno11G1Fxs0FUmeKLFsdWvPtKaWMqNMgWlIZjLBE7jp7FsvBsw9PV3Stz8eOtOo
	FUaaUyQ2vWw7efZjgShxEl_WWeIu7HEBOrKMxqiZW1zvOOQyh9OfPE45rcvBhIqDFqmSdglN9v7E
	VndOz70dDnkOCSXa94wy45GBkR2TdcSfAteyenE7ELUdmS8YEfZtjF7wWHj9ULeR7f0Vhr8VIhwV
	Q7HmvSZMgCaXlGkFDaDsH2v2KS2HleyB6KoAHBb9HNhMMJ6bNEM3by9gxvjgV61POEweYHg38Jmn
	lmWzNMta0hmZRN3oAcj2p1b09G3EODRzsc7FevsjZXrJzIckVemAojMAmwuVNjoLxJdbPphRuFlR
	VlcmtI9eeTqlMZSE.h1jPnboMrYlyttxoq9gKPfuq.cgh5P5DSsw9sMFFt8D5yJYFyJPGbMbUlVu
	ROQiotAvHaIIMbKUK2kLl6_pITDGfg3DYlX7IB.1d5LI_CocvyrydGJCMlwJjLCxpsI12gQ_rIWD
	tTqQ2DfiQtTAOHgObFDeCpj4OnikHM1.npdfm1Z1e0VuaLT.DJgL8HMlsiuyf06WZ3ly3b8yqisX
	_E4IXAoZrjrKMmafcmV.juo2ToXdKoV_uCapaKSpOrfMwDX4Jby_Ho.KIzxcI19s5plIlNSQN1SP
	p5WlM4ZwkHFTfa9EwZBOLejZLn3JfD.HdO9We629kNlxRp1yWywqfaEwv.Ef9.sryNckl5Dom9Iq
	qHXbvBoaepmHI4Th9mZEpFMt8PA9oFrPV2M6D4o5LvG14CjfxmSJUWrwptcdTyxuiNTYRG6P4pB8
	tYQfulqgDRS4NWpGmHRLU0UNjIawtWUj72jV.HgwkjlcBqwgbsWKYfwznbDGC5d_4MFNVYtpGXqf
	b0.5AOmVdyK8fT.MGGMpSXdIaxmQJGG0ynQjalkz7vQJ2_DwCSI0oKg0xNxqsylVqnsCaeDLignt
	tUWGb9d5EICUiGnX1k83YMzTs
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic307.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 26 Jan 2021 16:47:59 +0000
Received: by smtp416.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 792070e81a7e943f831e775718db2272; 
	Tue, 26 Jan 2021 16:47:54 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v24 06/25] LSM: Use lsmblob in security_kernel_act_as
Date: Tue, 26 Jan 2021 08:40:49 -0800
Message-Id: <20210126164108.1958-7-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
To: David Howells <dhowells@redhat.com>
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
index 112aadf3e7f9..5d8dbfb1dabb 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -448,7 +448,7 @@ void security_cred_free(struct cred *cred);
 int security_prepare_creds(struct cred *new, const struct cred *old, gfp_t gfp);
 void security_transfer_creds(struct cred *new, const struct cred *old);
 void security_cred_getsecid(const struct cred *c, u32 *secid);
-int security_kernel_act_as(struct cred *new, u32 secid);
+int security_kernel_act_as(struct cred *new, struct lsmblob *blob);
 int security_kernel_create_files_as(struct cred *new, struct inode *inode);
 int security_kernel_module_request(char *kmod_name);
 int security_kernel_load_data(enum kernel_load_data_id id, bool contents);
@@ -1066,7 +1066,8 @@ static inline void security_transfer_creds(struct cred *new,
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
index 291db266fdc2..a3e162c4c0d3 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1739,9 +1739,19 @@ void security_cred_getsecid(const struct cred *c, u32 *secid)
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
2.25.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


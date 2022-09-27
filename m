Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A529D5ECE1C
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664309655;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sHTZ7S2oXoGmFqq/NqBJ39J2cgKl3b/McVqJIoq4YHo=;
	b=CKi4veYlOX2ib6NmPNws1cJDQJo1JzZxz2RQ50AOqCryUWk+eDe81urlSYGQniEsCupzrH
	U090K2rSwehBH0bmQ76qRktzX85CM2NOveJY+VDCnOtu3WM0uGgOMb63lfd/DV97hPiesQ
	v4pmPpVXRMIy1QQMpp4JHiCxGwRgYuQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-fBDUiggPPBixy6wJ_eNx6A-1; Tue, 27 Sep 2022 16:14:14 -0400
X-MC-Unique: fBDUiggPPBixy6wJ_eNx6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3675101CC6E;
	Tue, 27 Sep 2022 20:14:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9465C111F3B6;
	Tue, 27 Sep 2022 20:14:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 69E381946A50;
	Tue, 27 Sep 2022 20:14:11 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5E0D31946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:14:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 50789C15BA5; Tue, 27 Sep 2022 20:14:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 483B2C15BA4
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:14:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28A453C01E09
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:14:10 +0000 (UTC)
Received: from sonic304-28.consmr.mail.ne1.yahoo.com
 (sonic304-28.consmr.mail.ne1.yahoo.com [66.163.191.154]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-475-YOW8fldQPgilxurVKj9Mdw-1; Tue,
 27 Sep 2022 16:14:08 -0400
X-MC-Unique: YOW8fldQPgilxurVKj9Mdw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664309646; bh=eeFCjkCXqLM2LATQYYTIdyEAeEA7gIccLl/7eHQRyik=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=hUPZDbuMncWQD5jn3bklChMSaM+vdOmDk3IeuksoedQzFTe6M+E8/cF+FbW00LT14+CCQTj/kfBgfc85bplsfR991kaSIgSFN4bWDM1aCgnnO+DKG74vd7vi1ObN0ko2VoAbpFoZpGrULsEY8qcQLFreU/BGVnj+ZGEjk1F+thdxcZs+LX0NQhd2y/8ga2Gd+ZNRp/AizeMy+yqtbDrLv50x4MRvOgNPj6AaO+9kuuUTXgmgNwLmXK/xRb9pj73qw3B7VSBSj7N1Zfef7BwsLWurO61mNUUXdEy/QVYMG2GsPRsSJqN9UK36/EmFVIkv5b7JyJLxONKrexulhi2x3Q==
X-YMail-OSG: xKwM1XMVM1mvm3mTPp958fYdRWQATey1DJdhfnAM9S3Ne1W5Cki.Ltfd5k3mctN
 AgwV8jfKha6pLcx.XgrW2iyrRv0q.0fxISZxL.TZLHsnPYOoOeNvcF9Fivn_E_Y1gNkhHrGEymsA
 93lYjjjJIJxPmswan76ZnzegBihMVpu35uiW795WpqIjlc7365zy0A02uT5RQHKPv8lz31sidPgs
 dCuMv__Rq3M_0MdWhPwPjNAugeFg4QRGul.7HR3j6jrHF830Lqbntk1y8c5v93HH0FPP2GWCAUpO
 YkxtEj9zAHkfCHV0Nj0JceRZ5XD3Is0Q7PBvOkJttv1ucyeviy7KUN7U5RKs9xvMIw_xOTVDvZ8u
 4dd70Ec3wg1z_WHkPwuJFyt2L9murSPW6MOGVjmHpSqPlRlAyI3QBIoL8tfN6uH9LYNE6_ZfV0gL
 4DeGYI.yFtX6NUMbJWbRO8C.ZroMFILpoWDdZ9Tx.i4TfSxxQOu_hM5iuP8sAbDmUNhOM7nKYWkW
 PmxWxYJbCHWtpebgx8UY0DZ84CWx3GnrPFRgPEBy4orp2ycRsKZwe1jnRGy4j7nGEF23lx0_pIfq
 4WWDEodKG_zAXpgVpFIpiqaWnc1Q.R6HgMkY1drN78gt7Tdjgh.biLz4iwoF3pRt5aUmhNlNkmWr
 SJ5ojkO13mDAAy40sE7x5Lwmr6u_p_JnTxzCiv4lp8pOTDnPi4SEABerGa_ZUtXzZcMMSexiQU.K
 hXV3kZgGk5MpBPV57xtRz2sy6h3GGe2rb4nyCpXWfSuA_hBDItLc9xI60g5dCiTr0Yo7iqqIWouu
 Be2TIzEPKX3KyhoeNvunQbostKBsTq7HF3PofoaBt_fUdxOc1S2kwl2bJPRgkRyNcGwU7Pb3.84r
 U5uYIMGYcSdR0hZPaYOdacKwvQlUVso0cwC1ajdk7JuiPayeHXNDabJ9GCK42Bh9IonUhq2elpUh
 4Tls1t6E0mL2BAgetKFSIgoQhE0S_vl7EHbabzBigAbLB.4zludxv_47V4HAEKXOwHh4cqYA3BWh
 UcpnWeH.IiI70ayDVLd9v2Y201gsGUq0DII7OcfRd4gPzi4iczUrhPax_srsDUnQK7d3dneMePT1
 5D9rzvgrH8Lf1oc0hcs8zbSciSSQj1VrIGAN53g0nbx8YJAqmcJsQDDa4v5IKfGmuv_5sbRuTLL4
 76ZcfV0zPwgcwJaKa05kd8Ii1UD6us3CYLbwPQlRMP55jpsFve3Cdd5xcyt_S1Y8hv38.596zDR6
 2CWvGummUUtSgNt2BgVCbW6ueUWM9oKwHLmO_2C_XCw8QR_g6G0e7hTsbdcJh8vhjsHngLnUQ0Am
 GokFa3ucNLvbfQx.tZFfyuDEkDlFxfNUosNH05IwaAwNmcl8ofiQ2Qd39CB77Nw34uZf4s2HcmCP
 udFhsHxEHgvX6QSp.9Z8U05BB1eDKuM4xHS9kKfAtxNVa0uzYkpRZIiES9c9uC3FpITYnLrhcuXP
 zPdvtbFSstnABRFPIc3J.VlGQp0aPJ644rvf.UhUmubnml25V2M_5j5_S13jwrOwqLHEe3kIfszN
 .kXE5CJ_vHL_AIKwnZAaGvjdzE7aTOOprKJN2Hhv07fl89i4wFRnsu3xB4K5ezKyOpphnOgabO.4
 eV.5znkC1ZPyTnA49LWaKZnA7h8SoMzJuEFVx4tV15ohjxENxHhN1.SJ8RSsLFX.fccNVLtgh3HG
 sIiDSad5Pel_y.rEqOu_5fk6WYEd4JhWHfK61kMSBcnKlmqKoDbrYzCqlQM9FGBihG2gpFM3h8JW
 xGCPQuxms.GxJUcgFSH5sUaoTn2DkVc3LAEd8stEj9xHt_wgPbTA1DrtH1m3dSiXSledhHp4UfsS
 Asp7VcpWGXLocZs6E3KiOpeqQoiQd6Rbhi48TMDACHwxGDp3qBMEWC0muP0o5yCfO5XL47AY31Et
 Q5h1Cjq1AIy9cg6d9dBVpbccflbO.Hhx_D2zoWU5CWdujqBIK8fJgssnFyrXl_kAozPSK3RDkPOq
 mnzQso6aYV3JAN_624c6r1qHPfTnqk0RIU0fBoCAET_K94ioWgtvkN6WNChWfN4gg5EQ9Lix3AXv
 lHBjmvAn3Nc09jzsa2pWd2k84kpqNt10nS6uOdhPEwFCi3y0jVgbPYleQhwz1ss3XTu938YWp4Xa
 iGxRE3JqK1s897gXb8cEv.uTvLrlqZ6QOHsw88HerbE_1uaCzPKdpA92R.QG0b.nwspZQtiMRxiI
 wbQAwwwJ1LagmbA7fEqWxBGuwSrCaUQ0Ka7OK7GvT2WRoSmSL6Gsj5XRXpQo-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:14:06 +0000
Received: by hermes--production-gq1-7dfd88c84d-65ptt (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 395ac973b3706d14ddbf652d9544c668; 
 Tue, 27 Sep 2022 20:14:03 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 37/39] LSM: Removed scaffolding function lsmcontext_init
Date: Tue, 27 Sep 2022 12:54:19 -0700
Message-Id: <20220927195421.14713-38-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The scaffolding function lsmcontext_init() is no longer used.
Remove it.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index c190b9189287..f6a247033556 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -166,25 +166,6 @@ struct lsmcontext {
 	int	slot;		/* Identifies the module */
 };
 
-/**
- * lsmcontext_init - initialize an lsmcontext structure.
- * @cp: Pointer to the context to initialize
- * @context: Initial context, or NULL
- * @size: Size of context, or 0
- * @slot: Which LSM provided the context
- *
- * Fill in the lsmcontext from the provided information.
- * This is a scaffolding function that will be removed when
- * lsmcontext integration is complete.
- */
-static inline void lsmcontext_init(struct lsmcontext *cp, char *context,
-				   u32 size, int slot)
-{
-	cp->slot = slot;
-	cp->context = context;
-	cp->len = size;
-}
-
 /*
  * Data exported by the security modules
  *
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


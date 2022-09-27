Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DABD35ECE4A
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:19:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664309992;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HUOrC/AjIC5tdSvT1edkw0GkYA1O16bkKRSbR4eDwG4=;
	b=YXhhDyGExQbbX+AP7HrO7fi/nLiVXJzXy0U7CKawf5mEAGs+OHRcUmo5iVEhFr9RfSYBgt
	sROWnWoYpGCCuU6ahjY8ymTt6xlv0K2Qj+7bEnWkIlq6JWl9p0eqLa548uLIH0i+9nQ/6X
	2eROBae+/VzWSB/0mDNf23xJGDDnfpc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-UEhVVpx6Mz6QMwi5p1_MOQ-1; Tue, 27 Sep 2022 16:19:49 -0400
X-MC-Unique: UEhVVpx6Mz6QMwi5p1_MOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89CCF185A7AC;
	Tue, 27 Sep 2022 20:19:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E13E740C2064;
	Tue, 27 Sep 2022 20:19:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 849B31946A4E;
	Tue, 27 Sep 2022 20:19:46 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3BF961946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:19:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1F05A492CA4; Tue, 27 Sep 2022 20:19:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10F6D492CA2
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:19:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCC8285A5A6
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:10:53 +0000 (UTC)
Received: from sonic308-15.consmr.mail.ne1.yahoo.com
 (sonic308-15.consmr.mail.ne1.yahoo.com [66.163.187.38]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-324-MsvNjYsbPoOfMcG-Q2q1Ag-1; Tue,
 27 Sep 2022 16:10:52 -0400
X-MC-Unique: MsvNjYsbPoOfMcG-Q2q1Ag-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664309450; bh=Pm78uT9GOCBV/z8p/R0bTSuyKxTpmx6NZc1YqKL+qrm=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=FlX25q0yk+u5QLzXqlpB5jE9/pFfL/8XM/+rCZzsz2GBdD2KfYUwm0g2crqv4F8my2dqI4AHasU6+WUClxyFw894Jpevqn5JZx+L/6kP9Vuq4tIXIFTp99UJ+HNvF+YeYeXRWxTUKD403K2K5UCz0WUCHmqzb5awJ3cpP1q04V9CIHN2usuRK6XWbdjA7uL8i+QElZXPHaWq9EwGjgf4MjQWbqlDY9/y/cgsuszuyne2pqX0okb7EXRWmes/kUY1BfvDk2DH19XKSyc+XqYO6fPZNRHzqKjnQMgtO+BMGZycE/exnEvPnimSIYvMO+J2R0A1rkJTJrtzjy4iu2SqFQ==
X-YMail-OSG: H8mhBNUVM1lTvWe4r3SvyNsoU1BebnK8RaDhI96IPcxJQuWqz37MOitw0oxocmP
 e6hbrbAC_jZna61CsFeOavOPI5.Nd1pV.v9zKyUW6QKZhfOF6HHxxO0Ckq7CE7MYyHKmkjC0Hsw2
 YQZtJhvsaVtfysq7rNJKuVHqmwfgC.RiLvpuFXxSyvkAFxg5KY.uKcmpe8bQAGyDdTZGH_1aeo3g
 .F.AXojkw5quiihBdEdLck9yvowXgBQceh3sKlsDvp8r8ZgmzwId_nWixfF9b0icLqRYPc6md_xn
 VNieAYfyo.OWHsF5NnSelDXJR84dE_zRRukfm0J2R5bEucugy5gufmCQiwXxdKFIvjFXvpg4bQLq
 1zdRQXK78uLYOP78hQPrwbXd3S0uJ5uE9D7EVUJQOBkLazkpTC5JscfJAN6vcWeUl487Fzk0eXeZ
 b46.FTm1HJJhHYn9twcu9s4AS17SnKy7PilcqC._8oWMk6Le3so1TzoWW2YmdCBlNsp6qDZmyug4
 Dx4rvb9W8WNDz4Iycf5pAUPRMp1SIai8pBGHHML76GkHCuWXYmCu8IaRPKwiQFwkNvtBJYqutx3Y
 Yi0.uzGGpclotN_y9HBEAK.5hKhVIrUh65rdH.SoKHDdiOKUiBlQUOd.PxSuDKIqzW0oz96DpJpN
 b1AfP97NtuO2pacNMoueRHpYSjEWjh4oD_p38c4uykwgaJFK_o6ExfEndDUTDd8LI8ESL43cTzxq
 ElGbRINbczYlOzy8pEFdRIbp6i8HxQTYsxvJjRGXgUpsienDsTDx5xr.SH_seBe.bap9rnFfkpEt
 RGdh_kM7RtueBuaeffcuMuBZbLYRWF0YkjgX993XqH159n1Bvy9xeRjOQqkDAfMqYb.JALHo0DoP
 p0Q4Qz4QBSqdxWXDwV5R9grYEbeRl1dEQm0oFbzpfx6ets1FxooMsanLAddbPahqumCUKxdrXwCB
 BFRfKvB0FKbyFG2u0DIvq3GfacCUCoc0GvOAukRIzk_6daIHiANKEiE0rWmT5CV7CN5Wifkg9e2d
 62gwU5DtZHrfKG_nKy3N7rp4cb0eFOlPzexbMEE8fCIdg6gn_JGxzf.B41RvUvJ513s3KzsoDkv9
 BcMng4mAduDSYvDOym45C8Q3lZQ6KehtRGXggG5PXFxc3pc7HFeG_OQ9HXsADtLunBHYSE82EmdX
 AkL_embOUypl7wArD4MtHe45pbU8V6gH4h0xDCTkzl5QXZGXl7LXQmyI9yY_gOWORzqeOTwsfJDx
 9UFPwg_h929iGOtUI1ZNrRatcTUfX3CFrqQ.R4E5AnkZGzUalPXsYV0BtfQizN5u1_6g7WAzQCR5
 ed_lwf3sAFkpKZiuWBMr7IzLuXjlXrvBnEnUQ2RCNGT6vGKbEy5nV7LGumXXTP7_SdY.tfq1lq1G
 gi78Lb4IWNWmJSLevVHkt.EwKTRcjOGnJRVp0FdKBv0xOHvVZoZHOipNvp2spCqfhCFHD7pl5ZTo
 JF78QUfB1_NbNadNW6L2DTaI5mYoyZqI69VqI2qYod4gR2llhbl3AygwCs9a85Iq9kyV4ZX4yYO5
 HzjcvwNumXHF93v9nMndax00azk3bbsfTAmdbMI6p6NsGccERS76W256VIWBOT85EeMGioDBMApP
 saA98ScQMcVk3zUtrPApQKgrFcj6sL0JUSdXhtyCJ3YoIFcVyT6.mMVOv3_gGhNBAXTh95od.isw
 Me9Gyan_OX6ZKWXtnSxfzHSxoLIMLBj4edIuouYd4Cs7yLrA84GivYksKA6UvWXTTYmqSWhgun8d
 jSPUhY488l.hwDiBpQNHy0emgQiBzCR1iNlrRjBevbqxA_ERRZ66Vc6qLgqvjC_nzSKwO_6SBHN9
 ocvBSPkorV4jiX2GyyjEkzSDO1Is8LSDtoaeY2625JkxlR9IOdacEa17ydt7Ky2EJihu._3auH.d
 iVDZ9CFTmF4wpjsLgWPb_W2C.7zwBKqTXPcpAU4Cf_Ti8fbS5EZ4qyNLw5YheJh7iq_ixJPcCcim
 CnY0hJpCh5UmEDvINyIbro5LiQM7XSk2c06f7GwaVpSjBVst_W.to1eE7JgLhd7GrBxfYecJ49Ic
 dGkLsEWz8krDlaFBqdLJcxZQ4StyRjUBpb7Vvww1IqpOJIKbBEfbP8A3lbUurBdsPwSo1EKaw8ki
 sTteO1guSVv_rBJv56Hz47Kw61OK3PhXytihZv6K9ac4v9Qa9kZq16Hozfxu2BsEZ02MBZtY0Ewm
 32fZC.COspaDjBBYWVWvw_pTXLT6jcL._n5N1V4QsCUMibAwYYZaJTCE1X0lHOc7.3iGlywbPzxx
 5tEEvm5T.uc5wwCk57LRhmrsqSXU9m2mdFbPOZ.M-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:10:50 +0000
Received: by hermes--production-gq1-7dfd88c84d-nvfk6 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 55a7229bea084bb6b28fa3beefd2f4cd; 
 Tue, 27 Sep 2022 20:10:47 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 31/39] LSM: Add a function to report multiple LSMs
Date: Tue, 27 Sep 2022 12:54:13 -0700
Message-Id: <20220927195421.14713-32-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a new boolean function lsm_multiple_contexts() to
identify when multiple security modules provide security
context strings.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Acked-by: Paul Moore <paul@paul-moore.com>
Reviewed-by: John Johansen <john.johansen@canonical.com>
---
 include/linux/security.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/security.h b/include/linux/security.h
index 170b303e9122..c190b9189287 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -262,6 +262,15 @@ static inline const char *lsm_slot_to_name(int slot)
 }
 #endif
 
+static inline bool lsm_multiple_contexts(void)
+{
+#ifdef CONFIG_SECURITY
+	return lsm_slot_to_name(1) != NULL;
+#else
+	return false;
+#endif
+}
+
 /**
  * lsmblob_value - find the first non-zero value in an lsmblob structure.
  * @blob: Pointer to the data
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


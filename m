Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B7A811D411C
	for <lists+linux-audit@lfdr.de>; Fri, 15 May 2020 00:33:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589495584;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GpyDQ1wZi6xUT5bHs+mBbup3SVckHoKwfoIyPpVKgOc=;
	b=Fao9gRXtWnvBB/ftEDLULbglEZDoPGydCwvwv2+dMn2fDa8/3Fr8lf9ROeNh0ZV6JD7Yu5
	NP6sZmNjKf+uJ5ZUoG35LPOalTSGJ4Hs/s35sK8K9YGTA/5uE39Tn9JFLz6dWcI7Fk9dTS
	Pme+zkyv67pLjNuRnenc11/XP9YUo6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-nPQtcL5FM8GZMMS7--INrA-1; Thu, 14 May 2020 18:33:03 -0400
X-MC-Unique: nPQtcL5FM8GZMMS7--INrA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 714DA80B720;
	Thu, 14 May 2020 22:32:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 560695D9D7;
	Thu, 14 May 2020 22:32:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E62A4E9B3;
	Thu, 14 May 2020 22:32:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EMWkvo020498 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 18:32:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DEEC52166B27; Thu, 14 May 2020 22:32:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D98172156A4A
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:32:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF9B489CA78
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:32:44 +0000 (UTC)
Received: from sonic309-27.consmr.mail.ne1.yahoo.com
	(sonic309-27.consmr.mail.ne1.yahoo.com [66.163.184.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-239-Tn1aDyt7ML-IaanX4lNIpA-1;
	Thu, 14 May 2020 18:32:42 -0400
X-MC-Unique: Tn1aDyt7ML-IaanX4lNIpA-1
X-YMail-OSG: vVtq8UsVM1lUjzWLpFiIOeWUwK19WFeVgJ3rrIhIEElbqapw9nprRKVsfUc7g96
	gKQ1zeX4fOZAXVRqJKkIyQH20jXIi4_f1y_hguiiTOKvJXFrG6ZrIdZbADa3_rGm.CLaDozW9e9W
	_4pK6qCdAJUKLCegYpTNEyYDCAla_nbcCKZH.kyo1OhQwAUb9RTQR.zLMEcibXwcBBK7jfo8mF20
	Q_M2PPmYa6huj8Y7Hk1E9ZitFpQNk59rf6pG7.eLIJYb05B7cxUP8VW58DHw5U0BOTOK9bUAVWaE
	1QcrVt5sk25JrPaDEjzqKGZ9uPinBRJXUMdrU9UWimKjg7zHebVlF5EBqJZvTTpPAYy7RMIMQ2K6
	Lmqjayg5S5Mc7xVPFUoJaB2ZBl4mmtJFL5rvIyVf61ISirsYLCO.avTZQ0F48Zvp8keDvBJQ7Gs3
	p2F4uoZGWkrkwAuc6MQIAlzLU.kibM7K1M71SxUrc0SB5BoZzNa3uvNaK7v6HeLflBDEQUwIXmuN
	sZr3hIK595L4lKFZf6tfpS5jsVoAkbL3fszuLVX_qa18raRDVXV5Ef63eEGToA5XWQ41llupO6za
	YSLKjhPcNzpEDXPlrziBJQvcIYyTTxWKHMW5AzbrSitBZzKFnz2s4xrMD64B.4xoyvZH0WoduMTf
	lRUXt2iTiRby.BNKY.VwizBVMMdS07tICMgPAk562l0TE.8qUhJ0NVII3q3ycZTIBj6EASsr.pOW
	UhVDDNdGvb_xI4yrfxqYnzS2T.y8MV5unp05a4dWP1d_QaW3zkuq8EeIRNbjMXMmTncxVINKJq5W
	b3Zgv.fMwHu5Fy6iZWiAz11IcGSoRny41Pt07AWuXQubOwPRGmIIvfidn6btKf6bMrSRDmLBpcR1
	ocmV0C77yzUZ7v_DWDh0qjQYseWy4eMEw6m5z0HHfih9.J3MUOP6A9tCvjEy1Y71Z_7YYXBM4jIf
	AikrSUlq0j8I5xEwUmLQTPprORLN4PAMO9wu9S3M.ZQj52YdFQnbMQi8gbKwQsdywXi0WxbYggMp
	kIRgMpvUhhPe.uz6KY66Uv_Dbfc13pjPfT.JqqDykBCvU5_ySJEcUOlhF3TPvV55NnhyZh1vOzQS
	7c3AIqp8YTeXSznGPWl5rzdv85.3kgVA69ffbCVeRJJsc9Zs3r2JI.LJICTcZZ3zCeL8uoAJVjMJ
	KvdGtw_r6S1ZtELvJ91Zfhcjfi37ygKLWZJ4nUGn7pQr660HLwUmBo5bf3Z5ZmNXCDHQ61xBr3xV
	mfFHNs9xNE1jBs.ppsGEEhUEzaYa6Nb2gJ1On2xgM66y2oFFn9AbsgkHIyJ9OHFtuwDa62Tbv9eN
	pwV1ANvoJI566CpLBL9PbvOIRbmBFxM85hMx2dwBJ0FhJDDvf006cQ7HK0PaorAMgUbv.xUnHVQu
	i8kP5BH17Wyg1ZoqusQDz8mvJ8b_ukcaCsdfmRnDlLhZ9tcNWIehgZij92C8-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 14 May 2020 22:32:42 +0000
Received: by smtp405.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID a21fe4c302c24d17582575c2e3e82ae3; 
	Thu, 14 May 2020 22:32:36 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v17 19/23] LSM: Verify LSM display sanity in binder
Date: Thu, 14 May 2020 15:11:38 -0700
Message-Id: <20200514221142.11857-20-casey@schaufler-ca.com>
In-Reply-To: <20200514221142.11857-1-casey@schaufler-ca.com>
References: <20200514221142.11857-1-casey@schaufler-ca.com>
MIME-Version: 1.0
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
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
index d082ef0673d0..677a9f409dc2 100644
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


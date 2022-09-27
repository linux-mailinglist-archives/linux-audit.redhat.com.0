Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 262B55ECDEC
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:09:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664309362;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8BII8XKC4Ud7mHZHv31r6JWmXw9y2ra05u/LJwua/o8=;
	b=Jb4wRYE1wFsQajQOm3CFYjdJrp1mQymZ+9CnX8tAAHU41MYJ4n8MZ7kHh86iktSBLyDzSd
	U0WoqvJlWl1KFyWvYHWLD6r1DVGWOlmXmr4DEK5TNMaW0u+9Qo0dPz79M4PdRihLd9E2kt
	KXlzfk+MstPWo4oIW6GYwb5VS38RkJA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-rGlFz_BiP-ythsFgXUPvZQ-1; Tue, 27 Sep 2022 16:09:20 -0400
X-MC-Unique: rGlFz_BiP-ythsFgXUPvZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C81A3804527;
	Tue, 27 Sep 2022 20:09:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42B3DC15BA4;
	Tue, 27 Sep 2022 20:09:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0D4981946A48;
	Tue, 27 Sep 2022 20:09:17 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C3C991946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:09:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 986C040C206B; Tue, 27 Sep 2022 20:09:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9087740C2066
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:09:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7609D185A794
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:09:15 +0000 (UTC)
Received: from sonic306-27.consmr.mail.ne1.yahoo.com
 (sonic306-27.consmr.mail.ne1.yahoo.com [66.163.189.89]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-54-lx6fYVomNLuLVf66OlFcmg-1; Tue,
 27 Sep 2022 16:09:12 -0400
X-MC-Unique: lx6fYVomNLuLVf66OlFcmg-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664309351; bh=jyyKoViioSEMtD728aWLJQuwwJ3bHww7hlonDVU+/Kt=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=d3PFDzcSCQcvEt1dWy3FH4RrQ2fRMC5hZhloB81WOQj6bO7leyPm9VfufmkenTk3tmEpBa+WLgiGF1SopexV5qn01PHbq5Q2tkmYwPA+9rZFNiuaO4XbTSetp8zXybEO6UahZ+uyW2vs0ggPdgo7mBlg9AKj0OzdFuYfdJaVkT7iQUqwpqTo7Aax/LIgUX1EUNAM8bedE4TCVjCmFmJPf4u79V07JUKvQF9YBQoIPZbMlpD9/5d4d7YN7fkjxSNqOZ2VUaJHf4rljyBX86Pi6Bx/MxQu3jQ7dAkXYbNLYsono0vb6NtkUWPWA54/6MZtG7hzLOTO6EeU6t3xePycGQ==
X-YMail-OSG: fHNfqrYVM1lak68bp2UhuO4XTccAU8de_.KxvxBk40UeIRhLxlEvXHJ5Fgvatyl
 CDJxrAsRMeDw0KJyk_ttzvugnLHqnjt81oaBzI07yoce8FbI6tc9PrOoqc6hOQHv_w8eFFigwChL
 fRjjAmzMVkk02T0xP7wN1qQ_EFndEQF8.Ykg6Q53hqfc7zyyY7ewva8Vf6JZfBFwAsG_YfGzaI9n
 hgFptYuclBBfR7kVIDd.HAV6fXPNGR.gTU7Q8fQp6LLkIJHmGVUEXGGrYr8vIfpc97uVSOXP0zxa
 CkcezDm6BXPl224rc9d_G6lQywSCVdAPSAYk.D5CmUHvMB1k0MFnXdLGiqgnuuDSRNFwF6sJLI8s
 9tTowMQr.BpR6ID1XEPAZ5LRt0BGNETDksU40mRyA4XBZeC.WYSXfMgTGL2jVMKrhXlujcn2EbRn
 DaycYaFSHYtHcnRUWm_uoI0kXdwdMq8Akx_JqIbYqvUavkBD0Skq_dTS6qD2_Tym8yfGqan6Kpvw
 dR1sg1j3URrc7BEMxrep3MM_TVoxENZeKf2A3WQYHbJ.q0I21bDl0HGN2zkvbgdW6LODSePZORNY
 DI0Sj.8Gux5XgLlG0OB7QAXcrOmUaiucOsDzlULryE5FdR1b.4AKc0pwC8lGwAJUK28lTodELYQ9
 nF28mA9pRy6uEozhRPzI3CGF4CThID1VnGZFtmUMS862_j8eGreSHpNT2zR9J_MUIDbYhp4dS4Qb
 mIhNcghE.pcWJJGqr8Sw0oGWONMyiedGwM.0WeSq1LE.uHmNiLMPy.vx8hIz8ptwHD1OAb0drwKi
 psibpwFwAtuAdP4SeMOwmnxGLY2YSqwz77s3C8JQuSb9pQKPeoq1xwFbfxr4PUxOY6H9DjC452sp
 21PxN7EAJeRt6WMqOR.dDmxDFU.J1Z.lJ3s7vPUs5giunUOwXOLLkhFsT8iBowL8TrPgN6dJBjPA
 5Q6SFHzQ3Lb5SF9Ck.EW2ZwrLz4SzWlDsj9b__5bLQUu6FDHidHObXBlFai0VweNbvHrtbMYR6Cj
 q_lV_5JxHfu45cNsIP4fTJa3_nMC..rKkraayEc9Qg05ZiQ0dWfvf0l2eRP7S_YfD1HATQyuskcP
 d.Gr7i3aSM3vShqV7GtTf6bccwahZOhPIxEB5iUo6AbDIDLCDiTljJ2My8C0rhNMyiVjxbfrh1QT
 qrawRLnwgMoKdiIve_IgV10ylN2ImZwub0OCqmXnnaTokv8fllrHIuWMsNbuQEtlV2Jl43vE1cg2
 rES5Cr7piiXblvRQeAm2nHigZBhXDIMQiyUuf8lzmW9Jsgi_tFVI7MdaOUn8NtsLTPDwsbYiSIPT
 5Ck5Z4EzpGYfT7tSbLbVFkK7Ph4vOLkR4CRNIvPV.hyGUHL0CpP0MIkbZibahUJ4oVThh57rsD3t
 seGVVXjGHfAgZU5tFpIturSkcwuvNw3jARk5uQmKODrSfTwdhgnvZqXJhfq.Ywy0A3oEAPOMmKFw
 SA3593E15xYzAsZ2XxGfsQk6adguT4TwmCE4TCeo2i_khr7H5g4KfeE.VNRTqYjphTwBfpWUiP4v
 4LzsuWj2p1xY3AW_RBf0S2VLC5nCK5TsgLNyYQZK83lffI7eZNgm1qnMly6PdqIPvNPZtJMaq1RN
 lB72DP45zPrTPqawfViaxocws1r5y4MFTVggQsOpq7AWxU6rUat12hnGdOwuWDOp0F5FGTT5.AnI
 YoK7fBCUQkNvpvUyripirs12eDZniEulFJT8ZMxWlrb118dLC6up.r.UuBBGp29oIqMx4To1kiH7
 gyG_.kP8_FsydPUVZMYqml9YbeJBky.cK41YFxE6JbbbCd9vtb6tAkJ1VAyatglOFcyrzowFamJy
 pzItm.9D5k5rTFZdUmBYGE63t3vlnzzQfbl1X5X8qCWOZ_nMQMyOoyvJmI_YRdoH60lQIHf.q2lH
 GKXu714eiaoBHBbA6xW2eIzBhD1awbQyuA5L4AC39tbaEN7kopdw02mnhpSaPyI8pyPdu1WyHx0w
 pwu4N6sk9hVvjYTSpoVcKZWM3CjXQe08lBy9xLxvxSBQWK3TJD6OkLddgv9fBElVAMi0vlUZY75j
 7Cny3dJvTX3utGTRnelZdPY.BkcHTW4hIo0RK0_Dpq.E4MbVfTGJZuxPwnAaJOvqaXgeP7CaZ1i6
 DqyTpIcXls0mTeAL1IFvWWPQimPuRFLmHajJWM7jf8Y6v_tHuHYuhvWMBPcYvUdB51Mz09QL3DwX
 doH1btocmHfGmn5syDTyVDuUlHQBw0.aQg1OV3DL68_y.QyJVuSshZ6htWafI
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:09:11 +0000
Received: by hermes--production-ne1-6dd4f99767-x2f2n (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 962ba498c220faeab9c55c1f2e7ba390; 
 Tue, 27 Sep 2022 20:09:09 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 27/39] binder: Pass LSM identifier for confirmation
Date: Tue, 27 Sep 2022 12:54:09 -0700
Message-Id: <20220927195421.14713-28-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Send an identifier for the security module interface_lsm
along with the security context. This allows the receiver
to verify that the receiver and the sender agree on which
security module's context is being used. If they don't
agree the message is rejected.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 drivers/android/binder.c          | 21 +++++++++++++++++++++
 drivers/android/binder_internal.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 5cfdaec0f9b5..ff8f35b9bd1b 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -3222,6 +3222,7 @@ static void binder_transaction(struct binder_proc *proc,
 				    ALIGN(extra_buffers_size, sizeof(void *)) -
 				    ALIGN(lsmctx.len, sizeof(u64));
 
+		t->security_interface = lsm_task_ilsm(current);
 		t->security_ctx = (uintptr_t)t->buffer->user_data + buf_offset;
 		err = binder_alloc_copy_to_buffer(&target_proc->alloc,
 						  t->buffer, buf_offset,
@@ -4667,6 +4668,26 @@ static int binder_thread_read(struct binder_proc *proc,
 
 		tr.secctx = t->security_ctx;
 		if (t->security_ctx) {
+			int to_ilsm = lsm_task_ilsm(current);
+			int from_ilsm = t->security_interface;
+
+			if (to_ilsm == LSMBLOB_INVALID)
+				to_ilsm = 0;
+			if (from_ilsm == LSMBLOB_INVALID)
+				from_ilsm = 0;
+			/*
+			 * The sender provided a security context from
+			 * a different security module than the one this
+			 * process wants to report if these don't match.
+			 */
+			if (from_ilsm != to_ilsm) {
+				if (t_from)
+					binder_thread_dec_tmpref(t_from);
+
+				binder_cleanup_transaction(t, "security context mismatch",
+							   BR_FAILED_REPLY);
+				return -EINVAL;
+			}
 			cmd = BR_TRANSACTION_SEC_CTX;
 			trsize = sizeof(tr);
 		}
diff --git a/drivers/android/binder_internal.h b/drivers/android/binder_internal.h
index abe19d88c6ec..152d0b55e050 100644
--- a/drivers/android/binder_internal.h
+++ b/drivers/android/binder_internal.h
@@ -528,6 +528,7 @@ struct binder_transaction {
 	long    saved_priority;
 	kuid_t  sender_euid;
 	struct list_head fd_fixups;
+	int	security_interface;
 	binder_uintptr_t security_ctx;
 	/**
 	 * @lock:  protects @from, @to_proc, and @to_thread
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F0DBF22D00D
	for <lists+linux-audit@lfdr.de>; Fri, 24 Jul 2020 22:53:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-5aadyXu3NHeICOsL88HOPA-1; Fri, 24 Jul 2020 16:53:56 -0400
X-MC-Unique: 5aadyXu3NHeICOsL88HOPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52402100CCC0;
	Fri, 24 Jul 2020 20:53:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3670979D01;
	Fri, 24 Jul 2020 20:53:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E169A3595;
	Fri, 24 Jul 2020 20:53:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OKrmdF000546 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 16:53:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9DD962166BA2; Fri, 24 Jul 2020 20:53:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 995B42166BA0
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 20:53:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBB4E1012449
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 20:53:45 +0000 (UTC)
Received: from sonic315-22.consmr.mail.bf2.yahoo.com
	(sonic315-22.consmr.mail.bf2.yahoo.com [74.6.134.196]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-203-8IKWsHFNPu-Xp7MbwDTUTQ-1;
	Fri, 24 Jul 2020 16:53:43 -0400
X-MC-Unique: 8IKWsHFNPu-Xp7MbwDTUTQ-1
X-YMail-OSG: ZLVs4.sVM1mKlYaCvqZ4crhUxaVxA_UvdwODwzg40g2jnCr7BdMX0qMVJY1o4zQ
	LNTQ8Y5ILlctli1TPRLhp5OUHQh3n9EzQBu3ux_gD1WtJs8caiB1cl6CmGh6f91Pp0ZJUkj3TVyD
	9ChBPsWiocr.ARWZRS5XsQvGGzFaZ59IcCuWVz4crwi8xv4DjMmqXrHSfCMq4ApwuDiQ2XGYOSD9
	kOZ3ahN2wnqNqJwTq5PRYohycpDOurR82w7ikbpBHJTzFmfYsS7XGS_clVXZgPr.59E0wR707eNC
	.yFC_q7nOHvd51L5tA8vWSalloL4rNVVRMoJzwxpVZRmw6d4u8151I7FcGe7kFh4bWX_QBwQ7zD8
	hRzWEz7Iiz149KLzavKWGw8PAPqKg6LYJchtwIjGguYtJs5vgS_X3GCPblRtRp5_1u79E2wc.WAN
	L0zCOKFfPkbmMxSOA9HxwrEZ4jxYmR8BO1vTGNunJD1bIGtJuGJ3q7n5D2Ihw5F.2p2ZkeKFJHBU
	LubDKKQGrOjNcXTgaO0Lt5GJCc27WnpCmAbdKyenkvHgdCbBgPlxPexbVYKWCUmMTszmJ6kKQmwQ
	a8Vzh3363W.pM7a1MfG5EqroSHYJRHcYM0pTlLTOOGV_c30HcEKf7rN6gvDhv5tuN5_HCw6gXF5H
	GJGjvU2IetqbW_2x.gfoAXmR9.4fWEuy5VwyPS9Ibx8K7Bpvthn2Iu8aET8xHp2DPThDHSS4N0nV
	uMw4q9MVm1kMub2tNtAkQS8.k5_IT2SZInxclGCvzS.kLXEKMokKZ88Ab7NL9OXcMzwIIrfR.cDx
	yYD8Hd9337RRXuRF1C4kvhOCxaRqqJuJ0QTAZP.2HfdwlUwew2JY.N1bVleXc.jOTf05zSOtI1Gc
	MkpnUbbJ6DiZfEBBIDA5EqwEHMZNqcjf75gZVkL.pj8uz_PL3mGLvWbN.qr_iQdAHqrcGLH64pgR
	0NO2liB4.dMtFfjRe0OSOqhawsPSUwtVSf1XHcYobswE1gyJFXfJmJw69Hda8JSDPO6qTTJ94l9t
	2bhA6MOMMo3daQ.U8DTvJjX0Xu.7tZp64ItEwXk1aoxlE1R7.vGM0LDxziYtwv93T4GAhO7QxPMj
	iyVe3o1XNzcjpYD0B2y41iE9JNEIp89IIZzMhh2H3A9IC1JFAxiZQ9.wNfjt5TldCWVrchDPE_v3
	2hcmwvIjV7VLtGEHlFYULEKR2ik456CMa0sLJZB0W6Wt3fMfZymlnbvFQXwR4z8ZfTEmYdYmNeO2
	Ygf5w0p7l63oE8wQnYW2qNGKSM9FNArdt.1Sz3bbrxFw4WeuI0vMIBdrU99zGVqfbcvn.0SOnn.L
	Dc0Bc9MmBctnflBnlU6keQaKDeU.c1nTMa7LoUm8yPaF0SMPn0hBG35PLFIGLt9_MESx3Iv5h9d1
	mNzAALNZXr9o9LEnq7SWRlZhNgMemryHV4pNv6mnc
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic315.consmr.mail.bf2.yahoo.com with HTTP;
	Fri, 24 Jul 2020 20:53:43 +0000
Received: by smtp426.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 85512d92fef433638dcf6811c543efee; 
	Fri, 24 Jul 2020 20:53:41 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v19 19/23] LSM: Verify LSM display sanity in binder
Date: Fri, 24 Jul 2020 13:32:22 -0700
Message-Id: <20200724203226.16374-20-casey@schaufler-ca.com>
In-Reply-To: <20200724203226.16374-1-casey@schaufler-ca.com>
References: <20200724203226.16374-1-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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


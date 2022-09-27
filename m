Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DB55ECE20
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:14:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664309667;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nP7x4juMMrtOJC9UBZ5aM2wPEyRh7n2y/1UCA2X1rcs=;
	b=VDIgxwZkdYjENPiapY8aBaa741eC+jSVA8C1Raa2dB0d7GuXZTLM/7dNgDsIZjXPYvQ1/+
	uifgO6giShczXb90LHFdRpOSW3nmFe5eKw6xM6jc0o9A+uZPmzTOoj3n9Rm8kf93LO22x1
	GkLPi9cqoO00X6RYOge8EIq3pQGuysQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-Be6wmoagPhKrqdwvxh2hag-1; Tue, 27 Sep 2022 16:14:26 -0400
X-MC-Unique: Be6wmoagPhKrqdwvxh2hag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F245385A5B6;
	Tue, 27 Sep 2022 20:14:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D95B3140EBF5;
	Tue, 27 Sep 2022 20:14:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AD0E21946586;
	Tue, 27 Sep 2022 20:14:23 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 414621946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:14:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 33B80C15BB1; Tue, 27 Sep 2022 20:14:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C281C15BA5
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:14:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EFA585A583
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:14:15 +0000 (UTC)
Received: from sonic304-28.consmr.mail.ne1.yahoo.com
 (sonic304-28.consmr.mail.ne1.yahoo.com [66.163.191.154]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-339-_vUx9R3QPna7EHnqKqfVAw-1; Tue,
 27 Sep 2022 16:14:13 -0400
X-MC-Unique: _vUx9R3QPna7EHnqKqfVAw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664309651; bh=+8ohEcMls+wtK4Yy6rdUGFCUpXdLAWwUUIIhQpKrGqt=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=g0hBr2ix4bP9vaKBJA3j8zAf+/AAlO5cOXbqtM+h4QLueHW2KOHuywDlRF54KW+iRy60u8X/phYLVNTYQsPMPpqoFoOJDGVjUwj/QAdd4syonIThoAcOxPVWzkykX5XkpMFQQ5WzzA+o6orbOtUTZUUapDLo/GHXLHVk1E25ukyovtobnu0uan6Kr5mXSRa7FbUuyxcHPDF/azuHmA9P6d4pLrbMsi6x3aWW3seTkl9vV8GU6/GemFBVzm5I9DyohoTmUGeKK7wxPseKhq11Q3vBzzbLPdpN1NT5JfksuUJSqavh6SO4UweZV/rOq74Twk4Ac0knTczwhweCFTqbhg==
X-YMail-OSG: D93IfIsVM1mKDwmH5sDPe_DoR1M.QM2jMmOBnb5BdsuWh7gd.crNxrkGivuNGUH
 P3HBfc4Qep8E.knDCnbSHzDY3wVx547vwVnL1BRCY6TTLWKM9LWoyBPA9G9jNfHJ_d51r_CvubgR
 3QRELIzDoqKF.cfgnJ3XOHApzFvIAynVK3n714C0_eNeH5lVB7zEbEPkwsH8sgLSU30vQKB_lMJb
 FI.zuRSH.PUQy95ODejHz9D40FQdX5wpgu.NpyLCFt_qUBdJuiIkGrdi5hZv5euonEQF8erK3P12
 yQvZuYyAqkmEl2__8BKQwC1es5O5TsvI.tTRNNuqIvpjF5GcdZfcbvxPVCaU0RVNwMSwrWG2Ho8j
 3Qtfsgc8lkaeomhJ7B7QA0kjDVaZITCGUAz4oGPKZjcIXhvxHQDmY5g0PRBzCXPmCnVeXw3oVOCt
 IuJTjCfIJZ3CTnZGVn0K7W8CfQkdB1URtCMeDxhWiLtFvujVoRZG5KK_U02kDZGERzgKA31i.t5E
 jW1oveGTNtYMdeY8IhLdHVumG0S.w5EuVWqtaQB_F87w6vMAVOREHwNEciRGa8DpJWz4IaH41kjR
 fj1vl.AFqk0Zkmze7pYEkF4ymOQCiFjvESYhDbo7zLB4KbcNQg6Xj9DqpXL.r1LQWa4mCj0ZINzq
 C4BqFaLzkxRq8JMS.Bfgp0U5UBcKzEdwOLNwJjc4MwQ9Sopfj9igzPYBwROkGp3DG6pql1xd2hbo
 5oAAwql8gZ6UeVgTP8lh9Wg7YBBER6j0fSBF1rFUGLFWJNQZepnI6AU0D9LAuvE5j3nJ7p0GXQb0
 INsCkIwlUzuF4c1J5Qi_ISYVWKCTeBIyQvACtU1iAh.JGRYezr.HieM4.T0_w1JuwNyoN3NeLXAP
 KISsSn3DDp72a5y1XOz6xvIURScsflTgxk2akEcUh5bGIX0GmUKQp6SbZeKTisVMJjZjiHw77qsM
 EqKWPsIAdT9zDLp6nfmTXWp8UfkBAaNjj6YFvbBk7DsVFJT_gDmuLaVGfMHg8j8sZ15Yl.INCWT1
 gHnRwrZfGOiiIwUgNqze4M1Zw5ov6vJ5RzXmAwHiB7AlgyGE4RuYqYctPwW6boGF8YSRg.CVGgEC
 8TYIHxsf_ZPuAdMnmrR6Ex3IyJqmobBCxHv8_FhH20HXgTjTqjvnVVywQS70xB9v.Y.vhPbyEjXk
 2UfsC0GxFK_2zdxEMmJYIsjyeuUkWJVE4PErHrUobosozos0ZCpNur.0t7vC5wE3y._7pEI24KCZ
 wNIquLMQ2of9iMUqTHv0Jeck0yqXjoHkMjlXTmGVMSQxCZSZUhJByV_bWpB1sS6GEKY7qkcuEHrp
 I7YtAh5wJrT9kqc9wQxux7ed8xm_BTF6w3gozDZRERG9qdbHCo9.qGkm3jeLcPqPqtaGxEhtOy7V
 Kbs9JlCFaZ0O7vbqWTTPsM2VBYxcaNFNrPA3gd3Bhufd0S9Rh1pOJ5F8g.M9nYgVZ2i5lp3QAhGc
 drdOeQdY.57FfJ0ncV0eIyWC7TaefEXJYKpV6vs0J6zkpI.hpu.jzTjHTEZxdWeLA2Q2MPPX0g4H
 YNu5m84ETxqq9hxIt8sQyld7cgN3Y9NJ8LCJLg7JACP9r_4zHYVNac8BbMzcF6qukps5vH6fLL6Y
 Py.0KbUDESoSXrz4_UEG01fzoRJjc82gJ8Tgz10bZ3dZ6Zurqell5DC2EbHk4yiv8bezzM_5e0Rc
 9UtrMTpzsSI_pB9lNIOlum5Ocm.JcwQqXXYiNZa2tAP8V4IykmrnJFWrXrdISHoa0jnutXr.jbpU
 qIdL1tvc4FTFny61Z3BfSmzICgrgUldL2tvQunZVtg8H76BErglhTFkiigU3Jr116mSSzn8G2zeE
 bBIWLFIduB5T4_tcj2KY9OvkEoaf8BERwetTx6hHNJDIjGmENLyma1bGMnASz0wZ1.PYqspqLXfz
 bS88rh0tAm2Mal3CmvmVcwvwiSTL.HE1bV8Px.kwTqCCuzi2U7_tnG6A1H766sk9sIDzGdOpuY6Y
 4YT_y3KFTIRYPr60MDoEnM8qseTKceS_qcR.eYmXAea8kZKyBxehG0ZS3vat06zerdkK7Crd_sen
 FLSaOnMEYM_HZAY024fK16jU1nPyEYknDSRmrl.8gB0.k3oViwPxiW6jYMRQbeVNASaxYhZXZ19e
 iC_kwy6ULdHNSl4eb0.alVF0EjgnMJdr7vdrhn_wok4upUzIxals.PCQQQGNNABDTu_KAlKnYKnX
 1kraAC7G90O6iW0GpAsofXRCqu0pqrkQCkp5.KWUAuGo_6Ayclo.52t65zngyfttOArCxeBvI0IL
 VOJLbYRSH.PyMCtCikTtLB5gZTpCX6rA9VVhuabY-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:14:11 +0000
Received: by hermes--production-gq1-7dfd88c84d-65ptt (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 395ac973b3706d14ddbf652d9544c668; 
 Tue, 27 Sep 2022 20:14:05 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 38/39] AppArmor: Remove the exclusive flag
Date: Tue, 27 Sep 2022 12:54:20 -0700
Message-Id: <20220927195421.14713-39-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With the inclusion of the interface LSM process attribute
mechanism AppArmor no longer needs to be treated as an
"exclusive" security module. Remove the flag that indicates
it is exclusive. Remove the stub getpeersec_dgram AppArmor
hook as it has no effect in the single LSM case and
interferes in the multiple LSM case.

Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Acked-by: John Johansen <john.johansen@canonical.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 security/apparmor/lsm.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index f47134da6723..284f74ba9af7 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1168,22 +1168,6 @@ static int apparmor_socket_getpeersec_stream(struct socket *sock,
 	return error;
 }
 
-/**
- * apparmor_socket_getpeersec_dgram - get security label of packet
- * @sock: the peer socket
- * @skb: packet data
- * @secid: pointer to where to put the secid of the packet
- *
- * Sets the netlabel socket state on sk from parent
- */
-static int apparmor_socket_getpeersec_dgram(struct socket *sock,
-					    struct sk_buff *skb, u32 *secid)
-
-{
-	/* TODO: requires secid support */
-	return -ENOPROTOOPT;
-}
-
 /**
  * apparmor_sock_graft - Initialize newly created socket
  * @sk: child sock
@@ -1290,8 +1274,6 @@ static struct security_hook_list apparmor_hooks[] __lsm_ro_after_init = {
 #endif
 	LSM_HOOK_INIT(socket_getpeersec_stream,
 		      apparmor_socket_getpeersec_stream),
-	LSM_HOOK_INIT(socket_getpeersec_dgram,
-		      apparmor_socket_getpeersec_dgram),
 	LSM_HOOK_INIT(sock_graft, apparmor_sock_graft),
 #ifdef CONFIG_NETWORK_SECMARK
 	LSM_HOOK_INIT(inet_conn_request, apparmor_inet_conn_request),
@@ -1954,7 +1936,7 @@ static int __init apparmor_init(void)
 
 DEFINE_LSM(apparmor) = {
 	.name = "apparmor",
-	.flags = LSM_FLAG_LEGACY_MAJOR | LSM_FLAG_EXCLUSIVE,
+	.flags = LSM_FLAG_LEGACY_MAJOR,
 	.enabled = &apparmor_enabled,
 	.blobs = &apparmor_blob_sizes,
 	.init = apparmor_init,
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 07FA81A03C2
	for <lists+linux-audit@lfdr.de>; Tue,  7 Apr 2020 02:27:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586219263;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mm6RuoWZgLq6lE0+KtM4JPu6g9KSqsMQ5w8bigXPEqY=;
	b=Pi0oI1s3uMVKGR/6aIEUvUkQx/KNmXlR3qMaTOWkzHdP4CMlfTd8meYPTddHcehWRc+52O
	Zd+dCY0ArlJkVSQUtdkLY0bN86sVg7MFYJql4N/uMnNelhpbOiBo6dyBFfW7p/SbdzYnn6
	5VzjQ5wc+EImoM0qGR8balcCq0EZHa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-BUQ2WpxWMziiHYopUGzl_w-1; Mon, 06 Apr 2020 20:27:39 -0400
X-MC-Unique: BUQ2WpxWMziiHYopUGzl_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26C2CDBA5;
	Tue,  7 Apr 2020 00:27:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F27AD9D359;
	Tue,  7 Apr 2020 00:27:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A280518089CD;
	Tue,  7 Apr 2020 00:27:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0370RO4D026996 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 20:27:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B92DF2022EA5; Tue,  7 Apr 2020 00:27:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B57BB2026D69
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:27:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27D708007A4
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:27:22 +0000 (UTC)
Received: from sonic311-31.consmr.mail.ne1.yahoo.com
	(sonic311-31.consmr.mail.ne1.yahoo.com [66.163.188.212]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-332-U7Davrm3Oh2yo8cKE05D3g-1;
	Mon, 06 Apr 2020 20:27:19 -0400
X-MC-Unique: U7Davrm3Oh2yo8cKE05D3g-1
X-YMail-OSG: 2ZZ7EmoVM1m1RmrGzpha4baPQ1qzlWD8qhPSY9Vk2ct_OgnsNLIQOdZgRQDeJeu
	8lrT2PflhdzlbFeIo6eXAmAEmatdrjElwpRPZqHtDxqJrrh9BSOTz_t.6QSASY__wtP94t5gBHF8
	Q8zlGA1dc.7L8NLQWtJ.hllDF3K8Yh.P6T2zR4.haIxWi_NIjffnr8TL6Yuq2nl342JfBTTqL.nq
	pszkvdmGKrHoPyyPYuAobg8_l4DL7i9R.xyqBXO2NgyRE6R5QowVXvZs6ldFQVinvVEpOnm1Mxni
	4LzxkuaQqdr.MJJfRk2RNjrAz.jaSJavIRpTNZqFCCYHBkp1jeupur52R9N.0mnzttlTLmBxNiCv
	ScoHcwZhHrmgPsAGEK5UfqcZInpMLQIBZgfnCdsSW9geThX96QYCrBOfdGkrSiiSk7kbm3l8kxw1
	IlgC2xZ05M3KUFMnQY_d2rBbxh.wtQBd7wcPlHYvolGA6e03EBlp7F6jvJV2ie5qksYBWqmxKPT3
	ACx8X2_QELz99WROPeN1kjlaWYDmzMfelT1qSbqv6tYg6nH8DXVD8.gZrBRzOGejup0eHeWKiF8A
	uX2BwkLrmErxynDjcSp8EkUgnK5FReoMMYcZCdc49ZXZVr6ml7gpBNDG3QrepHGmT0SnMLfAb1JK
	TAkc4nGiXp40S4woqzgTdq59hogPFEaKK0HZ_U9Vv_5aaZzbcReDfaSvxePLI8zmG9faGgL4xJbn
	zdqocjRo0BWd.MikVi.st.kaFimXVinmY469Odt4wkqsQqaftA2gOvApNw8CiHr_ZDl6v5Df5fIk
	IYAksJhEbjdRWWAb8LDrxg8nN9vRbBQVKMA9238MdAaW.TC90fX4ECLzM_ntWyIy_QKafov7_i99
	v6DiZ.hdzcnX5ewkTG8RKztU5.bFbQPwcosPqu_ylTU9XGzfkztS2_ADFksS2QLoRgvSInDn.e7H
	zvPeBbdijzBszDc0Ln_aZGV5is_sw.n7bEL8sn1_Jo1zHHmyLF3Uhs.Pd1VJ.7b4aqJUmEuYz8UT
	J19bO3c5jn9WHJ5lbUsaxj5omaihpLo.W0iv5pscBgCnahGvs.SQC2F2pslKV62ei1ubsnenFeMJ
	KmeEevS55hoGQkOQHdFc9QnfFLyQn5lIo9Cu513uyg99AeZgpTwEgL4ZMmqHkNP56oyuLuuE1Gek
	3OP4ANfHUf3nO6hoiRjsJ4l1rqmUBIJgWKykyK16KBJ3Q5qcfOnnQehT3fZLdGVjvCqr.j59IP6B
	Qhm5xdU1ygt6rrRcnIcQAXvfuhUHsLv4y6ZvtLVTiZ6iof1P6Yko.0zRzZd2H2etzW_efNvXRVid
	vpHGup.uRUcYs2s7ssNCpo4VgA9VM_Y56mBqBWk2jGGsZBreExzFY9MJx2XtnM0EDuINQwOnbvNl
	FuUd7En8vaEJr55muuYkNGAhRC4vXCSbYpFSjpxX4lGMe.qzRSJKX0ZTDfR1P
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic311.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 7 Apr 2020 00:27:18 +0000
Received: by smtp431.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 7593e4dc8c01eb675fc5184df100ea11; 
	Tue, 07 Apr 2020 00:27:16 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v16 23/23] AppArmor: Remove the exclusive flag
Date: Mon,  6 Apr 2020 17:01:59 -0700
Message-Id: <20200407000159.43602-24-casey@schaufler-ca.com>
In-Reply-To: <20200407000159.43602-1-casey@schaufler-ca.com>
References: <20200407000159.43602-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0370RO4D026996
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

With the inclusion of the "display" process attribute
mechanism AppArmor no longer needs to be treated as an
"exclusive" security module. Remove the flag that indicates
it is exclusive. Remove the stub getpeersec_dgram AppArmor
hook as it has no effect in the single LSM case and
interferes in the multiple LSM case.

Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 security/apparmor/lsm.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 02f305ab2c69..07729c28275e 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1124,22 +1124,6 @@ static int apparmor_socket_getpeersec_stream(struct socket *sock,
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
@@ -1243,8 +1227,6 @@ static struct security_hook_list apparmor_hooks[] __lsm_ro_after_init = {
 #endif
 	LSM_HOOK_INIT(socket_getpeersec_stream,
 		      apparmor_socket_getpeersec_stream),
-	LSM_HOOK_INIT(socket_getpeersec_dgram,
-		      apparmor_socket_getpeersec_dgram),
 	LSM_HOOK_INIT(sock_graft, apparmor_sock_graft),
 #ifdef CONFIG_NETWORK_SECMARK
 	LSM_HOOK_INIT(inet_conn_request, apparmor_inet_conn_request),
@@ -1913,7 +1895,7 @@ static int __init apparmor_init(void)
 
 DEFINE_LSM(apparmor) = {
 	.name = "apparmor",
-	.flags = LSM_FLAG_LEGACY_MAJOR | LSM_FLAG_EXCLUSIVE,
+	.flags = LSM_FLAG_LEGACY_MAJOR,
 	.enabled = &apparmor_enabled,
 	.blobs = &apparmor_blob_sizes,
 	.init = apparmor_init,
-- 
2.24.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


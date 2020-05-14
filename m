Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 387181D4133
	for <lists+linux-audit@lfdr.de>; Fri, 15 May 2020 00:37:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589495840;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=I3C3FQsxTrhsCFdaB70wJXgLaUpolA/rksZ+216B9vw=;
	b=NvFPY1WE6ZpzQs54/kvu7+h8IZ+Cu/++sskTKAlpDLgB0J/khqhcBSzsjQgB4vF9s7KK+W
	aEilB5jPbXg/p86+nrKjmbUExPMeb75rU1ydaxHPtWje9p38CEaMTygjgYEOq/fhvirOA9
	bEa24sNvO0VTFkbbCXzSLP/GZpW7D18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-qz5OrIriPJiZnVGkUedfFg-1; Thu, 14 May 2020 18:37:18 -0400
X-MC-Unique: qz5OrIriPJiZnVGkUedfFg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB074107ACF7;
	Thu, 14 May 2020 22:37:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9029B5D9D7;
	Thu, 14 May 2020 22:37:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66E754E994;
	Thu, 14 May 2020 22:37:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EMbA4h021413 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 18:37:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E03F32028CD3; Thu, 14 May 2020 22:37:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC1242014DFA
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:37:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA8CB186E3A8
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:37:07 +0000 (UTC)
Received: from sonic316-27.consmr.mail.ne1.yahoo.com
	(sonic316-27.consmr.mail.ne1.yahoo.com [66.163.187.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-10-zegh0BdtMleAvA0HhLn-jg-1;
	Thu, 14 May 2020 18:37:04 -0400
X-MC-Unique: zegh0BdtMleAvA0HhLn-jg-1
X-YMail-OSG: Ee9g38oVM1kjbDAYZlTG.z3pyp_B6yRYf7oOcp7Yjrz05F4Ljk45kOt7w51AMsW
	_3J6wWi8CfIXqqaI4oMlgW_F_MyIjaMuDgYe4MoL2nruAKV4yMrMkDJqhZ59U0_X6cWSknsmej6P
	kIo1RMK0rl6eV_5M98N5EmtowLbmvRqRzpt5maj59Xcx_daolldOLtJKW5fFfav.5CwLhxCxExbn
	hGIIKvrdEldNfPlSWZD9Nh3L1nU1IxxK1fXaITa4iwHlwwIsQ4.pK8Tfm0j7NXwx6Y14N9O9Jaix
	faDDBRvIdml6Ajs8A9VNMVYo6_CwSVKizr5aoHL.QkOakuU9F8boYpa.ZKx3wiOAP565ZFB2Zc5M
	aCBPSXJaVYpZVLo2ng3N3EK1hWGojMLbDhCx7vhyJo4mAf3JrwpCSabaq342yXbIjlwFTFEqoM8a
	hRazYE7DUA31aIX310H9v7P6m9cE2_SmnenUlKhkd_QdWjiWKDQegGDcNbFfcMy19IogosA7GHvO
	Kbr.x18uFZjqS7IfhdvTQp8Yi3h0PLCT1AKczNW3kn8tpCWWwyz2nrWG9ztNve1vAIBQexu_r0wL
	3myLfvEw1ryPmyyXGZvXOuwL35m1Gp9tCTL3Txtny2HWvO.JZTDdjGcnF0LHvpbHhCZLyvVKORVe
	F0bDTwaZvCacYHAU34RzSF8BuWFL4YR0frVdoSU2qjVTvG77gQc9BZ.bo_hxizEGoWMAXvICIw1d
	BKe9tI66Kfo8R56HskF_JZB57NqwTT5VpbCORyQufbsBOv8mMwVDWAVv7htgkkFK8LEqJGLkRHhT
	v2lctl2pKuAgBI4J7utM_2OrHP0EwR0EDEAbqWz348JjwLvJPVZopX9XAM7zxFqngRCh20_G0nT4
	OSx9yBlGZMJqI2H3dbVdQ22p6jwmSeqMjnrzr0uRynnsWVzWKxUmivmRtjlZxwLbKuYZe8EOIFkl
	tDKoz4pYNK0CL9ILcskGJ9gZWUbJbIGKEY5PDL6_s4rRJq60J6H2D5Vkds7haj6o0tkP1ckOiBMv
	UE1d0NMXstTfqdESz6Vwd1MVy03tHYjVyYJdaIzseRTh7pZL3mWFZk1SJNjUlct_HWJWubiCs8bB
	3fuEF.YmDO_4vKzWgdLgz39Gbhz6D6tPpi6CvUFqgkYi6UvGAjN5K7.2VyOd0XJGnQSxqUrnKEe8
	YU0ixEasKhqvUFkQ9fFSkexKA6FYhw8MQ6B0ECsYrDVXf1e7rpfBtHwIAsNaIENX5V.mFvecQ0Sg
	jKxD4ogivY237L4ypcUdfqJV3YrbOzwFUzOqjKWpv0XWF_xtZNbTJm1NeO.qAoAHD49Bb3gN0V4G
	dT6lPxZkKgCQ4T1h.vVISK3a9.tpGOguIgJVW.zEYOWlfUpx1QyV2TYibs4SX2ZjjzK05Jv0AQR0
	2RWz5Hm19xaK6Wo8kQFu60lVO0q7YrwNt3fNJp_ZTw0BK3JjvC1b9bm4Ezgxg2NrGE9Dr
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic316.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 14 May 2020 22:37:03 +0000
Received: by smtp430.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID c2f438aefea8e183cb6d317c26d91500; 
	Thu, 14 May 2020 22:37:00 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v17 23/23] AppArmor: Remove the exclusive flag
Date: Thu, 14 May 2020 15:11:42 -0700
Message-Id: <20200514221142.11857-24-casey@schaufler-ca.com>
In-Reply-To: <20200514221142.11857-1-casey@schaufler-ca.com>
References: <20200514221142.11857-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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


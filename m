Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 24ECC2D7890
	for <lists+linux-audit@lfdr.de>; Fri, 11 Dec 2020 16:04:23 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-alSxs_sZPqGxPyhc51xV4Q-1; Fri, 11 Dec 2020 10:04:18 -0500
X-MC-Unique: alSxs_sZPqGxPyhc51xV4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DCF218C89DC;
	Fri, 11 Dec 2020 15:04:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 880401E5;
	Fri, 11 Dec 2020 15:04:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 800E0180954D;
	Fri, 11 Dec 2020 15:04:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BB93BEZ030317 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 11 Dec 2020 04:03:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BA7E22166B2A; Fri, 11 Dec 2020 09:03:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3DCF2166B31
	for <linux-audit@redhat.com>; Fri, 11 Dec 2020 09:03:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7673E858284
	for <linux-audit@redhat.com>; Fri, 11 Dec 2020 09:03:08 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com
	[45.249.212.191]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-377-6iH2j3imPNK7DlohmXyQgA-1; Fri, 11 Dec 2020 04:03:05 -0500
X-MC-Unique: 6iH2j3imPNK7DlohmXyQgA-1
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CskmR6KXczhpld;
	Fri, 11 Dec 2020 16:41:59 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
	DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server
	id 14.3.487.0; Fri, 11 Dec 2020 16:42:25 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <paul@paul-moore.com>, <linux-audit@redhat.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH -next] kernel/audit: convert comma to semicolon
Date: Fri, 11 Dec 2020 16:42:54 +0800
Message-ID: <20201211084254.2038-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BB93BEZ030317
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 11 Dec 2020 10:03:52 -0500
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 kernel/audit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index 68cee3bc8cfe..c8497115be35 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2282,7 +2282,7 @@ static void audit_log_set_loginuid(kuid_t koldloginuid, kuid_t kloginuid,
 
 	uid = from_kuid(&init_user_ns, task_uid(current));
 	oldloginuid = from_kuid(&init_user_ns, koldloginuid);
-	loginuid = from_kuid(&init_user_ns, kloginuid),
+	loginuid = from_kuid(&init_user_ns, kloginuid);
 	tty = audit_get_tty();
 
 	audit_log_format(ab, "pid=%d uid=%u", task_tgid_nr(current), uid);
-- 
2.22.0


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


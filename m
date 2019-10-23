Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3B9E4796
	for <lists+linux-audit@lfdr.de>; Fri, 25 Oct 2019 11:42:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571996576;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A0z8B+6qaftWi4iGCaVN5KVZH1ocgmNrg6p827yK9HQ=;
	b=MABZj6Noy389s/yBtYq8OCj4KjYEyrjkutLhXltZCtW73NJNVYFP5IwUIwS1PD7EsrYOlQ
	thiqsb0SNr6hQnRjmdUXRrvcO7sde55wO7exlXneeudhePPbNMAYbZigf7YSeFYQmbnRJ/
	ll4CtOdPE041oLXOOGKQsyikKnl7M70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-h74YDD9hNE6HL_H0YEjKsA-1; Fri, 25 Oct 2019 05:42:54 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3B5847B;
	Fri, 25 Oct 2019 09:42:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E7B2600CD;
	Fri, 25 Oct 2019 09:42:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28A014E58A;
	Fri, 25 Oct 2019 09:42:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9NDRt94028056 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 23 Oct 2019 09:27:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C43E51D9; Wed, 23 Oct 2019 13:27:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 744F019C78;
	Wed, 23 Oct 2019 13:27:53 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 622D53082E6E;
	Wed, 23 Oct 2019 13:27:51 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 339D1C4DD676861ED316;
	Wed, 23 Oct 2019 21:27:47 +0800 (CST)
Received: from [127.0.0.1] (10.177.251.225) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 23 Oct 2019 21:27:38 +0800
To: <paul@paul-moore.com>, <eparis@redhat.com>
From: Yunfeng Ye <yeyunfeng@huawei.com>
Subject: [PATCH] audit: remove redundant condition check in kauditd_thread()
Message-ID: <7869bb43-5cb1-270a-07d1-31574595e13e@huawei.com>
Date: Wed, 23 Oct 2019 21:27:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.177.251.225]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Wed, 23 Oct 2019 13:27:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Wed, 23 Oct 2019 13:27:52 +0000 (UTC) for IP:'45.249.212.35'
	DOMAIN:'szxga07-in.huawei.com' HELO:'huawei.com'
	FROM:'yeyunfeng@huawei.com' RCPT:''
X-RedHat-Spam-Score: -2.302  (RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.35 szxga07-in.huawei.com
	45.249.212.35 szxga07-in.huawei.com <yeyunfeng@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 25 Oct 2019 05:42:32 -0400
Cc: "hushiyuan@huawei.com" <hushiyuan@huawei.com>,
	"linfeilong@huawei.com" <linfeilong@huawei.com>,
	linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
X-MC-Unique: h74YDD9hNE6HL_H0YEjKsA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Warning is found by the code analysis tool:
  "the condition 'if(ac && rc < 0)' is redundant: ac"

The @ac variable has been checked before. It can't be a null pointer
here, so remove the redundant condition check.

Signed-off-by: Yunfeng Ye <yeyunfeng@huawei.com>
---
 kernel/audit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index da8dc0db5bd3..193f3a1f4425 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -830,7 +830,7 @@ static int kauditd_thread(void *dummy)
 =09=09rc =3D kauditd_send_queue(sk, portid,
 =09=09=09=09=09&audit_hold_queue, UNICAST_RETRIES,
 =09=09=09=09=09NULL, kauditd_rehold_skb);
-=09=09if (ac && rc < 0) {
+=09=09if (rc < 0) {
 =09=09=09sk =3D NULL;
 =09=09=09auditd_reset(ac);
 =09=09=09goto main_queue;
@@ -840,7 +840,7 @@ static int kauditd_thread(void *dummy)
 =09=09rc =3D kauditd_send_queue(sk, portid,
 =09=09=09=09=09&audit_retry_queue, UNICAST_RETRIES,
 =09=09=09=09=09NULL, kauditd_hold_skb);
-=09=09if (ac && rc < 0) {
+=09=09if (rc < 0) {
 =09=09=09sk =3D NULL;
 =09=09=09auditd_reset(ac);
 =09=09=09goto main_queue;
--=20
2.7.4.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


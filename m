Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1579929755F
	for <lists+linux-audit@lfdr.de>; Fri, 23 Oct 2020 18:57:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-vQ-AN98wOsS0PswO4OrGFw-1; Fri, 23 Oct 2020 12:56:59 -0400
X-MC-Unique: vQ-AN98wOsS0PswO4OrGFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D523F107465C;
	Fri, 23 Oct 2020 16:56:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0F2A60CCC;
	Fri, 23 Oct 2020 16:56:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76E0192306;
	Fri, 23 Oct 2020 16:56:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09NGgVhH026505 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 23 Oct 2020 12:42:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E7767B2798; Fri, 23 Oct 2020 16:42:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFA17ADF7C
	for <linux-audit@redhat.com>; Fri, 23 Oct 2020 16:42:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A26B858284
	for <linux-audit@redhat.com>; Fri, 23 Oct 2020 16:42:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-559-zM1RtpU0M4CWU47hcmxrSg-1;
	Fri, 23 Oct 2020 12:42:22 -0400
X-MC-Unique: zM1RtpU0M4CWU47hcmxrSg-1
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
	[95.90.213.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B5B71246DD;
	Fri, 23 Oct 2020 16:33:48 +0000 (UTC)
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
	(envelope-from <mchehab@kernel.org>)
	id 1kW00g-002Axj-ML; Fri, 23 Oct 2020 18:33:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v3 51/56] audit: fix a kernel-doc markup
Date: Fri, 23 Oct 2020 18:33:38 +0200
Message-Id: <8c04d5c5d0144019c2c38d7c3f31061d6b35d360.1603469755.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09NGgVhH026505
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 23 Oct 2020 12:56:32 -0400
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org, linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

typo:
	kauditd_print_skb -> kauditd_printk_skb

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 kernel/audit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index 68cee3bc8cfe..0be42cac086b 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -523,7 +523,7 @@ static int auditd_set(struct pid *pid, u32 portid, struct net *net)
 }
 
 /**
- * kauditd_print_skb - Print the audit record to the ring buffer
+ * kauditd_printk_skb - Print the audit record to the ring buffer
  * @skb: audit record
  *
  * Whatever the reason, this packet may not make it to the auditd connection
-- 
2.26.2


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


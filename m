Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 112191BDD28
	for <lists+linux-audit@lfdr.de>; Wed, 29 Apr 2020 15:08:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588165698;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ClB7WLwFORZCB99rXhGR4U0Kg+886FTi5LOUsOMQLDo=;
	b=CQZP/+3pUd7dM35KJFVssqxhmfmrnHeJjWtrdRlpY4HzMH3qbjgfrYTCS4JSTS82ddFedI
	0SN6hEDYNGOCHEAj4QU8UMkr+gnz9jtJq/uuZhhv6oMo6Fb/MtklMPREP8nnaAEZnuNOGg
	3+OPrjqm+MYiz3l4gM8ebg+iPpiS8uY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-6z23cP_PPD-ffLMCw3t3BA-1; Wed, 29 Apr 2020 09:08:15 -0400
X-MC-Unique: 6z23cP_PPD-ffLMCw3t3BA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F200107ACF3;
	Wed, 29 Apr 2020 13:08:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABF8F5C220;
	Wed, 29 Apr 2020 13:08:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1BC1A4CAA0;
	Wed, 29 Apr 2020 13:07:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03T9JtNQ018288 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 05:19:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7933911422DB; Wed, 29 Apr 2020 09:19:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74E4D1104E8E
	for <linux-audit@redhat.com>; Wed, 29 Apr 2020 09:19:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D52C1049841
	for <linux-audit@redhat.com>; Wed, 29 Apr 2020 09:19:52 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-224-L8WQMZL4MxC5Z5AOGWIl6Q-1; Wed, 29 Apr 2020 05:19:49 -0400
X-MC-Unique: L8WQMZL4MxC5Z5AOGWIl6Q-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 4560ADCC3B8BB1414663;
	Wed, 29 Apr 2020 17:19:45 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Wed, 29 Apr 2020
	17:19:38 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <paul@paul-moore.com>, <eparis@redhat.com>, <linux-audit@redhat.com>
Subject: [PATCH] audit: make symbol 'audit_nfcfgs' static
Date: Wed, 29 Apr 2020 17:26:48 +0800
Message-ID: <20200429092648.63945-1-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03T9JtNQ018288
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 29 Apr 2020 09:07:45 -0400
Cc: zhengbin13@huawei.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix sparse warnings:

kernel/auditsc.c:138:32: warning: symbol 'audit_nfcfgs' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 kernel/auditsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index d281c18d1771..cfe3486e5f31 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -135,7 +135,7 @@ struct audit_nfcfgop_tab {
 	const char		*s;
 };

-const struct audit_nfcfgop_tab audit_nfcfgs[] = {
+static const struct audit_nfcfgop_tab audit_nfcfgs[] = {
 	{ AUDIT_XT_OP_REGISTER,		"register"	},
 	{ AUDIT_XT_OP_REPLACE,		"replace"	},
 	{ AUDIT_XT_OP_UNREGISTER,	"unregister"	},
--
2.26.0.106.g9fadedd


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


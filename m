Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FB567EC53
	for <lists+linux-audit@lfdr.de>; Fri, 27 Jan 2023 18:24:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674840266;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SmALxOztHIMuWnj4sU536U9yA2rQwxwLQK4tk0w7C+A=;
	b=A0602GZGwaOYhLebFinAgvs9DtgSsqWm2NYlOImqZturVGWtCGIKB0r4pAoX0AbfQB79+k
	QkBtRpyoWBc9UuhO7qQP4yBLWJq+I9Fb4gJI7UJ0u2ua4nutCoSLZ2A/t/KTgX+vK03mNi
	NhSTRcpnTnwPpQzoK/0F1Zh0g3FVhaU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-LCgE1iHHN0Sld-p2j_gtEw-1; Fri, 27 Jan 2023 12:24:24 -0500
X-MC-Unique: LCgE1iHHN0Sld-p2j_gtEw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 765EB858F09;
	Fri, 27 Jan 2023 17:24:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 686AD40C945A;
	Fri, 27 Jan 2023 17:24:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1FED819465B3;
	Fri, 27 Jan 2023 17:24:14 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2EF23194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 17:24:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2133C2166B2B; Fri, 27 Jan 2023 17:24:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.com (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A60262166B26;
 Fri, 27 Jan 2023 17:24:11 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, io-uring@vger.kernel.org
Subject: [PATCH v1 1/2] io_uring,
 audit: audit IORING_OP_FADVISE but not IORING_OP_MADVISE
Date: Fri, 27 Jan 2023 12:23:45 -0500
Message-Id: <68eb0c2dd50bca1af91203669f7f1f8312331f38.1674682056.git.rgb@redhat.com>
In-Reply-To: <cover.1674682056.git.rgb@redhat.com>
References: <cover.1674682056.git.rgb@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Richard Guy Briggs <rgb@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, Pavel Begunkov <asml.silence@gmail.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since FADVISE can truncate files and MADVISE operates on memory, reverse
the audit_skip tags.

Fixes: 5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_uring")
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 io_uring/opdef.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index 3aa0d65c50e3..a2bf53b4a38a 100644
--- a/io_uring/opdef.c
+++ b/io_uring/opdef.c
@@ -306,12 +306,12 @@ const struct io_op_def io_op_defs[] = {
 	},
 	[IORING_OP_FADVISE] = {
 		.needs_file		= 1,
-		.audit_skip		= 1,
 		.name			= "FADVISE",
 		.prep			= io_fadvise_prep,
 		.issue			= io_fadvise,
 	},
 	[IORING_OP_MADVISE] = {
+		.audit_skip		= 1,
 		.name			= "MADVISE",
 		.prep			= io_madvise_prep,
 		.issue			= io_madvise,
-- 
2.27.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


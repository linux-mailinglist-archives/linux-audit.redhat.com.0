Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C6D686FB1
	for <lists+linux-audit@lfdr.de>; Wed,  1 Feb 2023 21:34:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675283670;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JlXAJKPyYQvWDjUmpCwk8WQOuOoAIiOqSZvq4dz/onM=;
	b=S1alPGPX6wW+wS6UcBgLl2dDpfQEt+rIBZMP2EHLBKyppjCe/ymsTgPemdXjrnow2H443V
	qjLX4/G9tFnTojL7ugfKk74jK9gJZhYQn89QkDw7zdaGjS8T2dR0jbgWkspgAdbn3K01++
	QhI8raa50OLjd9Gq50b09y42/QuvwFI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-7ZomCUm0Ou2_hDyBXOPObQ-1; Wed, 01 Feb 2023 15:34:27 -0500
X-MC-Unique: 7ZomCUm0Ou2_hDyBXOPObQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B282438173C3;
	Wed,  1 Feb 2023 20:34:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8AF031415108;
	Wed,  1 Feb 2023 20:34:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DF70D19465B8;
	Wed,  1 Feb 2023 20:34:21 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7D67F194658F for <linux-audit@listman.corp.redhat.com>;
 Wed,  1 Feb 2023 20:34:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 61E43422FE; Wed,  1 Feb 2023 20:34:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.com (unknown [10.22.50.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C96D753A0;
 Wed,  1 Feb 2023 20:34:19 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, io-uring@vger.kernel.org
Subject: [PATCH v2] io_uring,audit: don't log IORING_OP_MADVISE
Date: Wed,  1 Feb 2023 15:33:33 -0500
Message-Id: <b5dfdcd541115c86dbc774aa9dd502c964849c5f.1675282642.git.rgb@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: Christian Brauner <brauner@kernel.org>, Richard Guy Briggs <rgb@redhat.com>,
 Stefan Roesch <shr@fb.com>, Eric Paris <eparis@parisplace.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

fadvise and madvise both provide hints for caching or access pattern for
file and memory respectively.  Skip them.

Fixes: 5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_uring")
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
changelog
v2:
- drop *GETXATTR patch
- drop FADVISE hunk

 io_uring/opdef.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index 3aa0d65c50e3..d3f36c633ceb 100644
--- a/io_uring/opdef.c
+++ b/io_uring/opdef.c
@@ -312,6 +312,7 @@ const struct io_op_def io_op_defs[] = {
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


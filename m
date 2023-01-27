Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 333EF67EC52
	for <lists+linux-audit@lfdr.de>; Fri, 27 Jan 2023 18:24:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674840264;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HM2S6seOUrwF/vurg3EfRz0LgldvEluD4VcEAmZrVUs=;
	b=FY04kvLjNxV3q61dy9fk6lS326cnFSqyrZR9rMpXPw3r84mviD2czAzYo3jqwYD8XkFcV6
	NJQ9rUh4fO58OX8hOUjqXrloxl3wdgbVQJHSkopZQi9e2kRx9zs5qRA7Y1kGC6o/z5VrNy
	LFcq3aGO1kGeYig1G3wdfDh+rRzhg8U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-KQ8YQy57MUudXyMxBdLBVQ-1; Fri, 27 Jan 2023 12:24:23 -0500
X-MC-Unique: KQ8YQy57MUudXyMxBdLBVQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7597780D0E6;
	Fri, 27 Jan 2023 17:24:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15F7B2166B2A;
	Fri, 27 Jan 2023 17:24:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DE8CE19465A8;
	Fri, 27 Jan 2023 17:24:15 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0AE97194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 17:24:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D4D362166B2A; Fri, 27 Jan 2023 17:24:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.com (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54BD72166B26;
 Fri, 27 Jan 2023 17:24:13 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, io-uring@vger.kernel.org
Subject: [PATCH v1 2/2] io_uring,audit: do not log IORING_OP_*GETXATTR
Date: Fri, 27 Jan 2023 12:23:46 -0500
Message-Id: <f602429ce0f419c2abc3ae5a0e705e1368ac5650.1674682056.git.rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Getting XATTRs is not particularly interesting security-wise.

Suggested-by: Steve Grubb <sgrubb@redhat.com>
Fixes: a56834e0fafe ("io_uring: add fgetxattr and getxattr support")
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 io_uring/opdef.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index a2bf53b4a38a..f6bfe2cf078c 100644
--- a/io_uring/opdef.c
+++ b/io_uring/opdef.c
@@ -462,12 +462,14 @@ const struct io_op_def io_op_defs[] = {
 	},
 	[IORING_OP_FGETXATTR] = {
 		.needs_file = 1,
+		.audit_skip		= 1,
 		.name			= "FGETXATTR",
 		.prep			= io_fgetxattr_prep,
 		.issue			= io_fgetxattr,
 		.cleanup		= io_xattr_cleanup,
 	},
 	[IORING_OP_GETXATTR] = {
+		.audit_skip		= 1,
 		.name			= "GETXATTR",
 		.prep			= io_getxattr_prep,
 		.issue			= io_getxattr,
-- 
2.27.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AE44667EC57
	for <lists+linux-audit@lfdr.de>; Fri, 27 Jan 2023 18:25:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674840302;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WLPw6whV19uQ5ixFwx8qNBiOXJgw8opdjBtckMiiKg0=;
	b=XYYb8QEb8BvqhyArzBdsia2t2cvRKj5rXBX9BRBt3bKMgS/PS+7zexVlpkYPFb59Y/dp5f
	elCtXOMYEAM3TIVDXZyFnbfUndeEMogonLkNKDeCpIi6dAZ7iqtnYl43tkzqOqH848IiYz
	tWrGUCqZZ3WhpAGMRRmmlD67m3kfXjw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-DEQ06qliN8ek7yLuo2c8FA-1; Fri, 27 Jan 2023 12:24:23 -0500
X-MC-Unique: DEQ06qliN8ek7yLuo2c8FA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 765B385A588;
	Fri, 27 Jan 2023 17:24:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83CB7C15BAE;
	Fri, 27 Jan 2023 17:24:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C0DFD19465A3;
	Fri, 27 Jan 2023 17:24:12 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8F33A194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 17:24:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 723BF2166B2A; Fri, 27 Jan 2023 17:24:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.com (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F33672166B26;
 Fri, 27 Jan 2023 17:24:09 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, io-uring@vger.kernel.org
Subject: [PATCH v1 0/2] two suggested iouring op audit updates
Date: Fri, 27 Jan 2023 12:23:44 -0500
Message-Id: <cover.1674682056.git.rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A couple of updates to the iouring ops audit bypass selections suggested in
consultation with Steve Grubb.

Richard Guy Briggs (2):
  io_uring,audit: audit IORING_OP_FADVISE but not IORING_OP_MADVISE
  io_uring,audit: do not log IORING_OP_*GETXATTR

 io_uring/opdef.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.27.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


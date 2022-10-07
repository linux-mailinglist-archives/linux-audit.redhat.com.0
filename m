Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6080B5F7C4A
	for <lists+linux-audit@lfdr.de>; Fri,  7 Oct 2022 19:35:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665164126;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tOKaO8h1ZddV2WMEHVhGFs5J10q8WRuryjUoqmN8Uw8=;
	b=g4gXhSTkthQz/Arpxd44Aud6t2gYAHio8rC9ml2m5PBjoZGeKFxSlAI5gJ9gTX0RYSjSAS
	AdiGa39oQWrA3YckRLUBB4IZq90gpj3mQ+dOfPdVoGO7kx+8m5hCnuJlnWH5x2pOfTEIvv
	Db4mD4qenEqroR1tlfkQPJ2XKUWMxa4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-ESzQfY6TObSYIg8JyzkpkA-1; Fri, 07 Oct 2022 13:35:23 -0400
X-MC-Unique: ESzQfY6TObSYIg8JyzkpkA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A568C1C08980;
	Fri,  7 Oct 2022 17:35:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 69B9640EFB3F;
	Fri,  7 Oct 2022 17:35:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 295FB1946A6A;
	Fri,  7 Oct 2022 17:35:13 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C051B1946595 for <linux-audit@listman.corp.redhat.com>;
 Fri,  7 Oct 2022 17:35:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B0E584B4011; Fri,  7 Oct 2022 17:35:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8F1E4B4010
 for <linux-audit@redhat.com>; Fri,  7 Oct 2022 17:35:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 898F33C0ED4E
 for <linux-audit@redhat.com>; Fri,  7 Oct 2022 17:35:11 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-2Tk0787bN12zjdoED6ksKQ-1; Fri, 07 Oct 2022 13:35:09 -0400
X-MC-Unique: 2Tk0787bN12zjdoED6ksKQ-1
Received: by mail-oi1-f170.google.com with SMTP id u15so372295oie.2
 for <linux-audit@redhat.com>; Fri, 07 Oct 2022 10:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dk6tQJdYrdVnt5J0XTqD1Ykt5Zifw0rjbpHHEmz3lLs=;
 b=Pu9Y2AUoOBwyrpLqITYBLGdeE+kTDe4FQakpUmQVDryQe8lUN+2uLNQT2PtfIyYTTn
 vX5Pdotauzu1s3/kL/+Tb8vd05krk95NTDsUDn5O8DIAr59e5dpIyyyk6FvAavMELK6Z
 veYm7urWsWRn97hU7umSSMFheul2b6i4xVd9HORND7loMBiatFysul7ipIYNYReD/f6j
 kfWbRzMb5l0RkST9DRBBqgcfVmRkylTnjBEe5fasEtIxMZHh40wEgOYubdDXp5BpFDe2
 kRUu7BqiEhDqJ1HZcc2psKIqQr6EHmuMJJlZ9DYxGSdyP/ShUPs/4CgB2abr7dxuQof+
 sjvQ==
X-Gm-Message-State: ACrzQf0fVx1PhpquAzPKtUUT73ljdyPUyn+ltL1fr9cto7j1Uo5zRAyh
 MTsoWrkpBp2Q1MTDbHm/BXa+Vn9/YUV3p84FhNjW
X-Google-Smtp-Source: AMsMyM6HOob3OhYe+iDodY/fdaWV2GZRIkRuW67saGDP2dd9w/7MHUwV1/LY76uwHOehBToBbFtWYduOjNB4W270Dzw=
X-Received: by 2002:a05:6808:144b:b0:350:a06a:f8cb with SMTP id
 x11-20020a056808144b00b00350a06af8cbmr8293565oiv.51.1665164108830; Fri, 07
 Oct 2022 10:35:08 -0700 (PDT)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 7 Oct 2022 13:34:58 -0400
Message-ID: <CAHC9VhSzQtFkksJ5zBnhOYCpvDGNjjn7SKoC4MmopepWzb+Hfg@mail.gmail.com>
Subject: IORING_OP_SENDMSG_ZC should enable auditing just like
 IORING_OP_SENDMSG
To: Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 493108d95f14 ("io_uring/net: zerocopy sendmsg") added a new
zerocopy sendmsg command to io_uring, but it enabled the
io_op_def:audit_skip flag, causing the operation to bypass auditing.
As far as I can see, the SENDMSG_ZC operation should be subject to
auditing just as SENDMSG.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


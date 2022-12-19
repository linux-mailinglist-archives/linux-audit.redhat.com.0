Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6496765116E
	for <lists+linux-audit@lfdr.de>; Mon, 19 Dec 2022 19:00:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671472841;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OGjrQpSEHw6TpGugHk3hGInt4sOU+fOseSEiCM3xVNw=;
	b=Q9W5yOmlzOcZvlw/zItrV3RqkGDNRQn9wQLjw23AcE6zCutHP0cU75XTt0xw1mSNcsyzkL
	o0uKh+UQKINlOQ/uXKVwFg7iAQXYgyBLTpX4I9SKG1BM3s2HHW2+iw5dcJS/BNeFC6ZBys
	NJRM8EsPhG2P3k2WJm2oR4LsC9Wwsyk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-q68ovVIjNLChZ4m9RcSjlg-1; Mon, 19 Dec 2022 13:00:38 -0500
X-MC-Unique: q68ovVIjNLChZ4m9RcSjlg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B55241C02D39;
	Mon, 19 Dec 2022 18:00:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22E4D40C1073;
	Mon, 19 Dec 2022 18:00:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9BD6219465A4;
	Mon, 19 Dec 2022 18:00:31 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2C071194658D for <linux-audit@listman.corp.redhat.com>;
 Mon, 19 Dec 2022 18:00:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1A3652166B2B; Mon, 19 Dec 2022 18:00:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12E602166B26
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 18:00:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3F713C10685
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 18:00:29 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-169-dVkWuIhzMoO1p5dQoWvxRQ-1; Mon, 19 Dec 2022 13:00:28 -0500
X-MC-Unique: dVkWuIhzMoO1p5dQoWvxRQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 sg39-20020a170907a42700b007c19b10a747so6658257ejc.11
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 10:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FnAiHz6ljM7ODJu0/GD9MQOC3mm+47bLds2l/+g+s9s=;
 b=eqZkfSKMaZ7uBqfkc8SfjNW1+aFMo06KIeafmICbHLRqy/0n5o/08la9/Z6P4CIFGR
 cGENcJXZEfFfafs1QukUqOlzWmYxovpUInMJbkcyYQpXZWFIqyeIMDa3mPNlZnFa3lUh
 jf9mjNacfMth9tIsMwwoaD1fpVxQjJEeM2teTOclfknt9PHJ6PKewYc9VsaRsFjp704N
 0mi8X+V79OVaiXyqu2f2puz35MJTJ0B9kuhrH0WTVdoWFH/DD+XnFL5jAaBeGdfzcdWB
 M0vzVfZwg5H5s7s+NuoTLh+w/O/2pH29/yO25VgoDBGmoVvmb7IiSHwQ7UV2mFkoXLRP
 KjIA==
X-Gm-Message-State: AFqh2kqBSrE2pHfsEwE8Ocg9JY4OSzs2wRDZY91nIkSDmNIVLUjPeaF1
 vcz0Ks7itzz3kw7BDyjS86l+uAAgr3w9CZqQ8efdQCDD02WRpmz4BNskCfss9XPJqAODhTCjj3S
 i2plV0HMpt9M2cOc+Usk=
X-Received: by 2002:a05:6402:1f0d:b0:479:400a:d943 with SMTP id
 b13-20020a0564021f0d00b00479400ad943mr6176716edb.28.1671472827164; 
 Mon, 19 Dec 2022 10:00:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvlBT/l+uXXqTk1XexJcN7ZXQbzHi34u/bh3Ff8AMn9P0qzZpjUeRRniCuAT6UP0aQe5u+iDA==
X-Received: by 2002:a05:6402:1f0d:b0:479:400a:d943 with SMTP id
 b13-20020a0564021f0d00b00479400ad943mr6176702edb.28.1671472826989; 
 Mon, 19 Dec 2022 10:00:26 -0800 (PST)
Received: from localhost.localdomain ([2a02:8308:b104:2c00:2e8:ec99:5760:fb52])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a056402278a00b0046bb7503d9asm4617691ede.24.2022.12.19.10.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 10:00:26 -0800 (PST)
From: Ondrej Mosnacek <omosnace@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: [PATCH RESEND 0/2] Provide matching audit timestamp in the SELinux
 AVC trace event
Date: Mon, 19 Dec 2022 19:00:22 +0100
Message-Id: <20221219180024.1659268-1-omosnace@redhat.com>
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
Cc: =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>,
 selinux@vger.kernel.org, Peter Enderborg <peter.enderborg@sony.com>,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 Zdenek Pytela <zpytela@redhat.com>, Michal Sekletar <msekleta@redhat.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

(Resending due to an error on the first attempt.)

This series allows to match the SELinux AVC trace events to the
corresponding audit events via the audit event timestamp. This
will help with troubleshooting SELinux denials.

Ondrej Mosnacek (2):
  audit: introduce a struct to represent an audit timestamp
  selinux: provide matching audit timestamp in the AVC trace event

 include/linux/audit.h      | 13 +++++++++++++
 include/trace/events/avc.h | 25 +++++++++++++++++--------
 kernel/audit.c             | 23 +++++++++++++++--------
 kernel/audit.h             |  4 ++--
 kernel/auditsc.c           |  9 ++++-----
 security/selinux/avc.c     |  4 +++-
 6 files changed, 54 insertions(+), 24 deletions(-)

-- 
2.38.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


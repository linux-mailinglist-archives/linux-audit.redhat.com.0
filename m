Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FB8651163
	for <lists+linux-audit@lfdr.de>; Mon, 19 Dec 2022 18:55:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671472509;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jjkNQgvhMSoeDhgt7WC3VVCVkkZTz7scUyRILFI1MuI=;
	b=e+VwjYQQ2OlYpB6MafxKuGbQD0YBPQAxqA/8HjEgm4bSMqNYOscuABfcNM+B7BE3EO3wX1
	7YC6kd+E7FgP3/40p6aXNvX1sRqJXVNHU2er8lZzp4wdy9VGtGJtNN4hJv8s1AU3dTe7Ek
	hlnDVyc4KYRToljU2wS+u6UzMPUNhzE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-lhpIQeiIMWCKKaYHnRbMyg-1; Mon, 19 Dec 2022 12:55:05 -0500
X-MC-Unique: lhpIQeiIMWCKKaYHnRbMyg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A949E1C0907A;
	Mon, 19 Dec 2022 17:55:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37955492B02;
	Mon, 19 Dec 2022 17:54:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 29C2A19465A2;
	Mon, 19 Dec 2022 17:54:57 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7CBF8194658D for <linux-audit@listman.corp.redhat.com>;
 Mon, 19 Dec 2022 17:54:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3C1FAC16021; Mon, 19 Dec 2022 17:54:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34FD1C16020
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 17:54:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 099DA857F40
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 17:54:56 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-49-WoQRvzxlMwuCbBAFae5VfQ-1; Mon, 19 Dec 2022 12:54:54 -0500
X-MC-Unique: WoQRvzxlMwuCbBAFae5VfQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 ga21-20020a1709070c1500b007c171be7cd7so6700077ejc.20
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 09:54:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A9vuU5Z4D8BDai4R1MtulQviiaupoVVoxrdaniDuSmc=;
 b=mmYyP3TZnkR0zXGxCPs7YrYc0HRZzEfuhTItd36WXXzmwl/E3mxXHxhHqDPbR6JB1v
 pQbkS0bqkwrLHuhIr2Y1qk2lmOMMBEuY1xWh0qs9lWuXUxWh/L8BvC6iR6lD64k2vkvU
 e7iqY6svxwAHgp9cWkQXVyjGE+SDDoHS/03eI/EZd26YoizjbnmQIqtNWUIrPFpU1Rgz
 Y8YVSZJ9AEB68zhoRN3ewchIx/L7oJVxlpMAh6p94dBAwoCrdOcnzOLVYGLSfmiCs69D
 bjppwbpqzQ5pjVdTzVJGly3lXUXt+Sj+yl8/1x/cXIQt2xCcvo0XFCP2/ZWGgqM8VhrJ
 HAsQ==
X-Gm-Message-State: ANoB5pkCvsBfti+a/auId+Z20aJoQLSc0yVSAh1LTrNrklvTUbhKbemO
 F+0hvvdxd4gPpO/NdecxtslUMaXvlysjhco5K7ukalTASUN8VzuMLUGs5CC+qScPBWjhndywrGE
 S5YQ5f6Q7UE9V5vpl4R4=
X-Received: by 2002:a17:906:6d0:b0:7c1:33b2:6a02 with SMTP id
 v16-20020a17090606d000b007c133b26a02mr25072792ejb.30.1671472493088; 
 Mon, 19 Dec 2022 09:54:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7QnSsvJl0qbchhgN7/T6EmdIMrXYMaGvctjJdaBF70LE3Z1Z3Ja+l487e1h6E1lUWBbvbMPg==
X-Received: by 2002:a17:906:6d0:b0:7c1:33b2:6a02 with SMTP id
 v16-20020a17090606d000b007c133b26a02mr25072780ejb.30.1671472492946; 
 Mon, 19 Dec 2022 09:54:52 -0800 (PST)
Received: from localhost.localdomain ([2a02:8308:b104:2c00:2e8:ec99:5760:fb52])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a1709063b0400b007bdc2de90e6sm4604210ejf.42.2022.12.19.09.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 09:54:52 -0800 (PST)
From: Ondrej Mosnacek <omosnace@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: [PATCH 0/2] Provide matching audit timestamp in the SELinux AVC trace
 event
Date: Mon, 19 Dec 2022 18:54:47 +0100
Message-Id: <20221219175449.1657640-1-omosnace@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

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


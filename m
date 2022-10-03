Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABC95F3639
	for <lists+linux-audit@lfdr.de>; Mon,  3 Oct 2022 21:20:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664824826;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H19RqHOWTMhSle91JX92YykSW4iUMX3UXixKMi0W4v4=;
	b=cjIjDKxfTjIC7CEr6QWOGiAWkvzy/FJ2EBvSQnmLxSqGro4fV81oWowrXS4isTN6lBpYDE
	KpYScU9xV5FAZQLoDb+dWM6+pRy0qOT2GpiabHMe/3Z7UUigxiDI4hfc2Jf097rde7YxF9
	qL5cag2TBuFf93aZOtzdpSHNR26qIrs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-XsbgGDGcNSyKnpKcP6KQhg-1; Mon, 03 Oct 2022 15:20:23 -0400
X-MC-Unique: XsbgGDGcNSyKnpKcP6KQhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CC5F86EB22;
	Mon,  3 Oct 2022 19:20:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 356A62027061;
	Mon,  3 Oct 2022 19:20:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 596031946A46;
	Mon,  3 Oct 2022 19:20:12 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EBF0B1946588 for <linux-audit@listman.corp.redhat.com>;
 Mon,  3 Oct 2022 19:20:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9AD3F2027062; Mon,  3 Oct 2022 19:20:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 938792027061
 for <linux-audit@redhat.com>; Mon,  3 Oct 2022 19:20:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F68338173C0
 for <linux-audit@redhat.com>; Mon,  3 Oct 2022 19:20:10 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-498-7Y-jrsUROhmran8_ARs8IA-1; Mon, 03 Oct 2022 15:20:08 -0400
X-MC-Unique: 7Y-jrsUROhmran8_ARs8IA-1
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-1322fa1cf6fso6830697fac.6
 for <linux-audit@redhat.com>; Mon, 03 Oct 2022 12:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=9K17YJn6Np23zeiW/E3dhUfsLZOcCAtvJyQ15VB5VuE=;
 b=Dt4tSRZopivoQBbpwvEWvWKzUSiVB5yGUxBLlQW2QLbHQot2ssPOKWMitZpXtrJXLg
 uRuFFSCCxeIZpAClH2LtkMw5lwkdpYgFGNMq4Lk3c7oDJ9dNC2xnRYeLNgJSPeChZ9T6
 5RY3OHUhHG2OlTwUD7C6I2LJW6Wa48/R0dhq3q2qr4i3qgH1ugoFpjVlIbzhFGmw0q8l
 74Vbz6KPWHlIijveesKhkPhdrqgl8CK4xuGUx/m3dLg/gM6iCtDbmAZWJBMO4b/ehHMV
 UZzBVW7Ly+zObE2QvTwcf1zF0MgCokYnBqE3r6HsrMEEQk+7ImqqA2Rf8LiB04aQx0jQ
 LyHA==
X-Gm-Message-State: ACrzQf0wdl0uHEwYPuIOtqASHTMmNj3DOUx5FLEVoLTMqvhIiyEPD96W
 +YHc3fPriAiV6ej8FZY15cppM0tRtLf/1XfjlDoM
X-Google-Smtp-Source: AMsMyM5il5LIfc7Y0PRw8xuRwkVSi6pALIg74xVZJMMxNW8V7EM3YRfgsCHOX+04tJIuGcZqNH4Wa4k2sFjfDSaV62Q=
X-Received: by 2002:a05:6870:41cb:b0:131:9656:cc30 with SMTP id
 z11-20020a05687041cb00b001319656cc30mr6146840oac.51.1664824807712; Mon, 03
 Oct 2022 12:20:07 -0700 (PDT)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 3 Oct 2022 15:19:57 -0400
Message-ID: <CAHC9VhTEHLd-PVLArOH20UGaB21JJzz5nT54VFegF23631QSxA@mail.gmail.com>
Subject: [GIT PULL] Audit patches for v6.1
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Six audit patches for v6.1, most are pretty trivial, but a quick list
of the highlights are below:

* Only free the audit proctitle information on task exit.  This allows
us to cache the information and improve performance slightly.

* Use the time_after() macro to do time comparisons instead of doing
it directly and potentially causing ourselves problems when the timer
wraps.

* Convert an audit_context state comparison from a relative enum
comparison, e.g. (x < y), to a not-equal comparison to ensure that we
are not caught out at some unknown point in the future by an enum
shuffle.

* A handful of small cleanups such as tidying up comments and removing
unused declarations.

-Paul

--
The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

 Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   tags/audit-pr-20221003

for you to fetch changes up to 934f70d9d498a7fffd611edf48356698f1d72e91:

 audit: remove selinux_audit_rule_update() declaration
   (2022-09-07 11:30:15 -0400)

----------------------------------------------------------------
audit/stable-6.1 PR 20221003

----------------------------------------------------------------
Jilin Yuan (1):
     audit: fix repeated words in comments

Richard Guy Briggs (3):
     audit: audit_context pid unused, context enum comment fix
     audit: explicitly check audit_context->context enum value
     audit: free audit_proctitle only on task exit

Xiu Jianfeng (1):
     audit: remove selinux_audit_rule_update() declaration

wuchi (1):
     audit: use time_after to compare time

kernel/audit.c   |  8 +++-----
kernel/audit.h   |  4 +---
kernel/auditsc.c | 10 +++++-----
3 files changed, 9 insertions(+), 13 deletions(-)

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 76D6C2DA5DE
	for <lists+linux-audit@lfdr.de>; Tue, 15 Dec 2020 02:58:47 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-IdnQx6IuN-GPb871QN3wxg-1; Mon, 14 Dec 2020 20:58:44 -0500
X-MC-Unique: IdnQx6IuN-GPb871QN3wxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 425321005504;
	Tue, 15 Dec 2020 01:58:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B30660C0F;
	Tue, 15 Dec 2020 01:58:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 115F6180954D;
	Tue, 15 Dec 2020 01:58:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BF1wGQv024405 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 20:58:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 34AFC2EFA1; Tue, 15 Dec 2020 01:58:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F6362EFB1
	for <linux-audit@redhat.com>; Tue, 15 Dec 2020 01:58:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDCE98007DF
	for <linux-audit@redhat.com>; Tue, 15 Dec 2020 01:58:13 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-187-E5iSB5T_O6WPVN_Cep8VSA-1; Mon, 14 Dec 2020 20:58:11 -0500
X-MC-Unique: E5iSB5T_O6WPVN_Cep8VSA-1
Received: by mail-ej1-f65.google.com with SMTP id n26so25359747eju.6
	for <linux-audit@redhat.com>; Mon, 14 Dec 2020 17:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=BWor9jDGgk/8IhRKUrohi4NuTLT40ILHKt+r7aTsdEU=;
	b=NFXHMUIC0kbVJrUjy6ZHg0kh7emMlZB2vBRNYxDAcqOrGeNvYqfAENvkatoinhTaoZ
	Ow1ob3YFH7H8TQ+5EGOqzswF3eQUYwfmDPZ9fm25q2E22OL+T4FoSHkcvzPcWjGZHcw5
	/7VkbD8Je7ou1zYJyHtzbAf4Fdw5lGdYFooU8VUsT4tNl2MTRGDvl+fNhhcc0s548Mtv
	WEx9sqIU7rVTP1tCWjFAVcUaNvNjIDgqkqGQhSLQDgldNv5A9V/0GK9OSrt2xr9z2EfP
	7M8Hkyc/RIsNHqp7GNheZKZo9Mx1JIWuCGZ1fvtuD5B8w5bhnyOcZeB3fSrjGoVriFFU
	u/2Q==
X-Gm-Message-State: AOAM533WIxEtOXNugDchC5mXRGN8hiyIdFqlwvYHry4vPfV6LWqYlcpD
	LzLZYrxL82MXYFM28N850ejpO4A24w3uafi8Lwra
X-Google-Smtp-Source: ABdhPJwHqjyHQjik6xtuRcSclby847RqniajM+UtDbYwuM4gvAH+K1vb86g3lQoxYhtSa2gi9e/13jJ8Y7cs/5O0xHg=
X-Received: by 2002:a17:906:2e82:: with SMTP id
	o2mr4625104eji.106.1607997490305; 
	Mon, 14 Dec 2020 17:58:10 -0800 (PST)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 14 Dec 2020 20:57:59 -0500
Message-ID: <CAHC9VhT5ZQaz48+DNLTKqA5x1yMQL65iQyMW7=Qby5toyc2_0w@mail.gmail.com>
Subject: [GIT PULL] Audit patches for v5.11
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
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

Hi Linus,

A small set of audit patches for v5.11 with four patches in total and
only one of any real significance.  Richard's patch to trigger
accompanying records causes the kernel to emit additional related
records when an audit event occurs; helping provide some much needed
context to events in the audit log.  It is also worth mentioning that
this is a revised patch based on an earlier attempt that had to be
reverted in the v5.8 time frame.

Everything passes our test suite, and with no problems reported please
merge this for v5.11.

Thanks,
-Paul

--
The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

 Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   tags/audit-pr-20201214

for you to fetch changes up to 6b3211842a115d697fbf78d09f3e83852200e413:

 audit: replace atomic_add_return() (2020-12-02 22:52:16 -0500)

----------------------------------------------------------------
audit/stable-5.11 PR 20201214

----------------------------------------------------------------
Alex Shi (1):
     audit: fix macros warnings

Mauro Carvalho Chehab (1):
     audit: fix a kernel-doc markup

Richard Guy Briggs (1):
     audit: trigger accompanying records when no rules present

Yejune Deng (1):
     audit: replace atomic_add_return()

include/linux/audit.h |  8 --------
kernel/audit.c        |  9 ++++++---
kernel/auditsc.c      | 38 ++++++++++++--------------------------
security/lsm_audit.c  |  5 -----
4 files changed, 18 insertions(+), 42 deletions(-)

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


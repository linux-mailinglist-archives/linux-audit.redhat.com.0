Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D93FD69D664
	for <lists+linux-audit@lfdr.de>; Mon, 20 Feb 2023 23:39:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676932739;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MvlCVf99n9FDIzBZA5CkbiBdMKtBYeLD9v7yknzU/4E=;
	b=FyMO6FYLrowf7X3CSDnH3eSzSIhtXSxwVD90mr3a/Ox2NxeftCAHK2jMfGxOm7o4NgFoDX
	RmiPrbIowwubez68x6eQPfzQyatkOEwjPeElUtFe25NPkfQp/e+8sq9bmfbJp4s08/q/gd
	KjhVYmeBhQlCIkJr72jhgwIwnnR4sVA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-OmE8jLVJOQOBEyuk-wRexA-1; Mon, 20 Feb 2023 17:38:56 -0500
X-MC-Unique: OmE8jLVJOQOBEyuk-wRexA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACD0A811E6E;
	Mon, 20 Feb 2023 22:38:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F167D18EC6;
	Mon, 20 Feb 2023 22:38:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1957B1946594;
	Mon, 20 Feb 2023 22:38:43 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D05411946588 for <linux-audit@listman.corp.redhat.com>;
 Mon, 20 Feb 2023 22:38:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7D505C15BAE; Mon, 20 Feb 2023 22:38:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75FADC15BA0
 for <linux-audit@redhat.com>; Mon, 20 Feb 2023 22:38:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B37C101A52E
 for <linux-audit@redhat.com>; Mon, 20 Feb 2023 22:38:26 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-241-pH8dsNSrO0a4WftxCQqD8w-1; Mon, 20 Feb 2023 17:38:24 -0500
X-MC-Unique: pH8dsNSrO0a4WftxCQqD8w-1
Received: by mail-pj1-f47.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso1875689pjv.0
 for <linux-audit@redhat.com>; Mon, 20 Feb 2023 14:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HcOfL4aYmBkL+o95ZvGhn5IwC7jQ4ODD/q3vrS89doQ=;
 b=jN9l8LU2PFruCyo3BLKDpCB86HD2FluIG0xZUJ7xhB9RTUdyi2lmBX+E+uY05w4ENk
 jaKPBNwrfy8XP8S/B3GHpgAnKBis6OsWy9fE18gY2REy3dZN5CUPjlkuuj6o0wRVy9ic
 m5nuv+NzbzOnLsaF4poO9dkXN4wB2kBWKgRMWOTzHuXmWzzpEDKzs8QXzU4X7D//PPhb
 KpzuoFncO4FMeDsZgOPieXCq9lLRazZ3klVDjFN1dZ7rRZaJg2ZQyRmTz9zjidA41DMK
 nBICDEk9qTGDaeCR+l6+qu8aGW36Fun2NPfD0XZ+xu6B0u9pLt9OzJU8UWPRndXcdGuB
 pvaQ==
X-Gm-Message-State: AO0yUKXdamMP9S1dBDBmLTUnFWCCbrsf/dYS5d0V/Rn0uIw31269OdXL
 s1LrqEbUW5Ye31ASh8MSvNKUtoB/iLT34Db6a8ls
X-Google-Smtp-Source: AK7set+YBBEPo07oh9X4FmcFRuQXpwUI5AOZoglJ0szpj6YQCxZpVfmiLg5bRIIgfIy/FRn0BPJN82jQtUCeE3sGbak=
X-Received: by 2002:a17:90b:4d09:b0:233:c521:271f with SMTP id
 mw9-20020a17090b4d0900b00233c521271fmr1113714pjb.139.1676932703585; Mon, 20
 Feb 2023 14:38:23 -0800 (PST)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 20 Feb 2023 17:38:12 -0500
Message-ID: <CAHC9VhT7aw1tGB2fqQMcoCFpwdvC2xfsUbgU0vaTiY_jRk+K9w@mail.gmail.com>
Subject: [GIT PULL] Audit patches for v6.3
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
Cc: audit@vger.kernel.org, linux-audit@redhat.com, linux-kernel@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Just a single audit patch for the v6.3 merge window, and even that
patch is pretty trivial as it only updates the mailing list entry in
the MAINTAINERS file.  Please merge for Linux v6.3.

Thanks,
-Paul
--
The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:

 Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)

are available in the Git repository at:

 https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   tags/audit-pr-20230220

for you to fetch changes up to 6c6cd913accd77008f74a1a9d57b816db3651daa:

 audit: update the mailing list in MAINTAINERS (2023-02-07 10:22:29 -0500)

----------------------------------------------------------------
audit/stable-6.3 PR 20230220

----------------------------------------------------------------
Paul Moore (1):
     audit: update the mailing list in MAINTAINERS

MAINTAINERS | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


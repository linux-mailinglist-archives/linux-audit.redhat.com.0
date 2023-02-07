Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D38DE68E05E
	for <lists+linux-audit@lfdr.de>; Tue,  7 Feb 2023 19:45:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675795511;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ojHId8EvKAaeyDP4COotOL6Er2obuEM4SoQdCIVrp6I=;
	b=R2fWbXwGF3yYy6e+8wz0YzKs81FgkVi4JfxDgXdUB7U+WJQ2KnGTmKAyILDqWg8PGuTL1m
	aE3RwY5oBLyeV6xLkKUCY4N8vSc0RFbtGifzIFtghcoHHcVX+1zm6iVeTKAp/nKdac6VPO
	JG1Gkcu9pqjYL7IUfIzK7kAAbki15ec=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-TgK3opVeP3iz-cdGIV7Wfw-1; Tue, 07 Feb 2023 13:45:08 -0500
X-MC-Unique: TgK3opVeP3iz-cdGIV7Wfw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6B023C02B69;
	Tue,  7 Feb 2023 18:45:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D477A492B22;
	Tue,  7 Feb 2023 18:44:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 44F3D19465A0;
	Tue,  7 Feb 2023 18:44:59 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 363911946589 for <linux-audit@listman.corp.redhat.com>;
 Tue,  7 Feb 2023 18:44:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 22BAB2026D38; Tue,  7 Feb 2023 18:44:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19EA32026D37
 for <linux-audit@redhat.com>; Tue,  7 Feb 2023 18:44:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC55A800B23
 for <linux-audit@redhat.com>; Tue,  7 Feb 2023 18:44:57 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-FFU8WJWXOaWGO0q0rbxIBg-2; Tue, 07 Feb 2023 13:44:56 -0500
X-MC-Unique: FFU8WJWXOaWGO0q0rbxIBg-2
Received: by mail-qt1-f180.google.com with SMTP id f10so17890561qtv.1
 for <linux-audit@redhat.com>; Tue, 07 Feb 2023 10:44:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fQ0wjXKbt5mcLBHlv7yIP0pjtczdMciEEMq0LvAHymw=;
 b=ZzWwF0RNXQh+19iyiGwpWA+GqCtET2Ze243zEnW3R/9EqxnzaWm6srI7YgBw1fKpi8
 N5uN61sEtjjyHaJ9eQm/sjRDelcHn5+6WnTybOddgqcveD2r3XFkU5iPiO+X00y/x/5y
 Nt2vbAeiK03UkaLILXW1Mxio+QRUhdxUss55I6pnO8z7Ph7d88BaDwZ9P+QVYkOYsg/N
 Prr03cWeCkzWDJbi75Yx/OZeClvGXTNafBnR3SkKC4VwtDyxaAnmKpXWA/SZPJG+zib3
 RXjrn6UgLTnFTFLlQtnDiNMsCrH/tPY+f1Srk7aA6IouVfXCbdPRuco2c0iFvY4VO4Kx
 nX2A==
X-Gm-Message-State: AO0yUKUHrcRzigpd4yTdmwEKW7OCOgjvOsXKFsIWr0u4m06/SdmCsJPA
 EV1dO6KkDrzixO3JHk3ZEbad8CXHv76dbaM=
X-Google-Smtp-Source: AK7set+pn8e5zM4PnBCgqrTSwNU/+2OXBG/sjJH0qiOGHDBGSV61IVN0QUObsftFLm9w1VFq6IUkmg==
X-Received: by 2002:ac8:5e08:0:b0:3b9:beca:8d8b with SMTP id
 h8-20020ac85e08000000b003b9beca8d8bmr7199457qtx.28.1675795495419; 
 Tue, 07 Feb 2023 10:44:55 -0800 (PST)
Received: from localhost (pool-108-26-161-203.bstnma.fios.verizon.net.
 [108.26.161.203]) by smtp.gmail.com with ESMTPSA id
 c77-20020ae9ed50000000b00720ae160601sm9942272qkg.22.2023.02.07.10.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 10:44:54 -0800 (PST)
From: Paul Moore <paul@paul-moore.com>
To: audit@vger.kernel.org,
	linux-audit@redhat.com
Subject: [PATCH] audit: update the mailing list in MAINTAINERS
Date: Tue,  7 Feb 2023 13:44:54 -0500
Message-Id: <20230207184454.222696-1-paul@paul-moore.com>
MIME-Version: 1.0
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We've moved the upstream Linux Kernel audit subsystem discussions to
a new mailing list, this patch updates the MAINTAINERS info with the
new list address.

Marking this for stable inclusion to help speed uptake of the new
list across all of the supported kernel releases.  This is a doc only
patch so the risk should be close to nil.

Cc: stable@vger.kernel.org
Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7f86d02cb427..b686c3af313f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3511,7 +3511,7 @@ F:	drivers/net/ieee802154/atusb.h
 AUDIT SUBSYSTEM
 M:	Paul Moore <paul@paul-moore.com>
 M:	Eric Paris <eparis@redhat.com>
-L:	linux-audit@redhat.com (moderated for non-subscribers)
+L:	audit@vger.kernel.org
 S:	Supported
 W:	https://github.com/linux-audit
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
-- 
2.39.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


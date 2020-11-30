Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5C22C86F6
	for <lists+linux-audit@lfdr.de>; Mon, 30 Nov 2020 15:41:10 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-TOaAV8LtP6iedDyOM7B53Q-1; Mon, 30 Nov 2020 09:41:07 -0500
X-MC-Unique: TOaAV8LtP6iedDyOM7B53Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA53B7FE40;
	Mon, 30 Nov 2020 14:41:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96EC85D9C0;
	Mon, 30 Nov 2020 14:40:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28441180954D;
	Mon, 30 Nov 2020 14:40:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AU8aBBW000948 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 03:36:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 294D52166B2D; Mon, 30 Nov 2020 08:36:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 241EE2166B2A
	for <linux-audit@redhat.com>; Mon, 30 Nov 2020 08:36:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E56DF80088F
	for <linux-audit@redhat.com>; Mon, 30 Nov 2020 08:36:06 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-14-7x-pSbw7ODCp6q0Qr_YjhA-1; Mon, 30 Nov 2020 03:36:03 -0500
X-MC-Unique: 7x-pSbw7ODCp6q0Qr_YjhA-1
Received: by mail-pl1-f193.google.com with SMTP id t18so6109027plo.0;
	Mon, 30 Nov 2020 00:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E6KDQhU/zBnr5DKp/uo9Fp1w3M7TMAhCF7S8/nwJn60=;
	b=KvOrPea8HHx+kd3Ya1iJ5T+nU7cpetqtegKfuxK2Jqv7W5o8f9w/ZSNdp5enQZon9l
	T2tUMh3WzrgC96lWB83EPBSlKyw51fupl/wM2Ldx8LArAblpDVhVpuZdqE65cNKX2xNk
	5dcmRVsmSFvbDb0nP2R4tSZPU0/HBPPhE1AQ3mutrKVughZ879V7zsSTXANPhCBuc26y
	XFPIuBcr4dJ7g7/5U5NMg8ai/C545Xw72ZA0BsZ/27QxFmu+GimbJtsgz5M50O7iXzyS
	glSZJ5clT5s/IgXP26M6b3xdiLoYjNTFd4PR1zQdo7O9oNkQOhrFp0HK/f3iXJD8vbRj
	wZzw==
X-Gm-Message-State: AOAM533b9WTDnHrpJkTVN+9m7PKuld8X1LFfvBp7LgmfhakRWHtOAKQl
	tESvs6OH+x6RHGhYI8iJGF4=
X-Google-Smtp-Source: ABdhPJxNmosQxaKOI4OlQed91O513K4sb8JCpFPbSGSCjUxBY2zNlUNI0Yb9ZhZtjldqsFZBmsrI7w==
X-Received: by 2002:a17:90a:67c8:: with SMTP id
	g8mr24397083pjm.114.1606725361880; 
	Mon, 30 Nov 2020 00:36:01 -0800 (PST)
Received: from localhost.localdomain ([8.210.202.142])
	by smtp.gmail.com with ESMTPSA id
	gj24sm8896637pjb.6.2020.11.30.00.35.58
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Nov 2020 00:36:01 -0800 (PST)
From: Yejune Deng <yejune.deng@gmail.com>
To: paul@paul-moore.com, eparis@redhat.com
Subject: [PATCH] audit: replace atomic_add_return()
Date: Mon, 30 Nov 2020 16:35:45 +0800
Message-Id: <1606725345-7442-1-git-send-email-yejune.deng@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 30 Nov 2020 09:38:06 -0500
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org, yejune.deng@gmail.com
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
MIME-Version: 1.0
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

atomic_inc_return() is a little neater

Signed-off-by: Yejune Deng <yejune.deng@gmail.com>
---
 kernel/audit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index e22f22b..1ffc2e0 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1779,7 +1779,7 @@ unsigned int audit_serial(void)
 {
 	static atomic_t serial = ATOMIC_INIT(0);
 
-	return atomic_add_return(1, &serial);
+	return atomic_inc_return(&serial);
 }
 
 static inline void audit_get_stamp(struct audit_context *ctx,
-- 
1.9.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


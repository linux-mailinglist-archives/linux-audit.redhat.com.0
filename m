Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E951E3007B
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 18:58:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C83035945D;
	Thu, 30 May 2019 16:57:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 255E8100203C;
	Thu, 30 May 2019 16:57:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E8F61806B0F;
	Thu, 30 May 2019 16:56:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UGtxVT029869 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 12:55:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5471D10027C7; Thu, 30 May 2019 16:55:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FCD410027B6
	for <linux-audit@redhat.com>; Thu, 30 May 2019 16:55:57 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C8813179174
	for <linux-audit@redhat.com>; Thu, 30 May 2019 16:55:39 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id b18so4306034qkc.9
	for <linux-audit@redhat.com>; Thu, 30 May 2019 09:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=subject:from:to:date:message-id:user-agent:mime-version
	:content-transfer-encoding;
	bh=JAvOXpSLILpUYZzvbphL8+A8AJ3/KASrmQsfDZZOiJc=;
	b=wwRfVSjkb/qiHIJ702tFxnBKW4E2Uy46lUCWAg1PlK8fPS/LBZMkJuQQLOjv4yRpvU
	2R03nH0NMJs4I8E+ua9dDrSTCZ22H4oM8Ntj8KHD1xs6uGkSg3leyxn6p0FkGZLW71RU
	pBrQ0KNFwEdJ8PfiWy4YTAseKykgxXoF8klpW+5X9Z9c8eHfOGoW3xlsFDNW0XfEtBVM
	RnmEMvbx5CpA9ErFmRGF8jW3xouMS0EaqV2Uu5K8EQiA0eGUOD1pnv88UzEFDyu0xLyl
	uSPvA7LB1dVS7RXtzX4UxdcUXN9+CvRHjhWnoShTRuZaPPzTF0QVGF8uTdhJuxzfEapJ
	0oyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:date:message-id:user-agent
	:mime-version:content-transfer-encoding;
	bh=JAvOXpSLILpUYZzvbphL8+A8AJ3/KASrmQsfDZZOiJc=;
	b=QOPvmmeXIyeSWbYMyYlZkN9RL5nzDi6TmJFiGrSCFZqWb+YIcGbD3cKQcnWdpdmgtw
	YZ/N5FshGGn5C1zYD0xPVtMnxuoUQEpTwTpECu4+SrApWCOZXmobep/uzvwAt8KABOHN
	glT0k9XgkfSbHRei3ai0bfq5C7A3Y3SysD1tVUm6FvIKfyupHWgXuKI2w0SE5i6U5gJG
	GYnzBmrmSP7IU+HNHIafplQSPrDE67nPCuxBW59gJJ5ThInSQ3kEbzWuPJHuHlnyJ7sP
	Ye+q8/uJC2aYYE2zWh9tXcV9TRqOhmR54CyXY+HAA63nbHTuHQFieZHTFinumr0csFqO
	Zz2A==
X-Gm-Message-State: APjAAAW6hd9+tSMjpqvYLHY4/JgD/Bztna3A29deR6SDNZ6g2D5iVAXo
	pXVVryN81kS6qdC0AiPlg3Zyt03mTA==
X-Google-Smtp-Source: APXvYqwih8HmfcA+20UQpKJjegweWG1VWh0xg6ki85w38Psrt/yBC2cVAiH2f7LJ4u+lnpIifrjXEg==
X-Received: by 2002:a37:ad0b:: with SMTP id f11mr4204483qkm.25.1559235332827; 
	Thu, 30 May 2019 09:55:32 -0700 (PDT)
Received: from localhost (static-96-233-112-89.bstnma.ftas.verizon.net.
	[96.233.112.89]) by smtp.gmail.com with ESMTPSA id
	f186sm1758831qkd.19.2019.05.30.09.55.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 30 May 2019 09:55:31 -0700 (PDT)
Subject: [PATCH] audit: remove the BUG() calls in the audit rule comparison
	functions
From: Paul Moore <paul@paul-moore.com>
To: linux-audit@redhat.com
Date: Thu, 30 May 2019 12:55:31 -0400
Message-ID: <155923533113.12169.6169677957008313366.stgit@chester>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 30 May 2019 16:55:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Thu, 30 May 2019 16:55:39 +0000 (UTC) for IP:'209.85.222.193'
	DOMAIN:'mail-qk1-f193.google.com'
	HELO:'mail-qk1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.009  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE) 209.85.222.193 mail-qk1-f193.google.com
	209.85.222.193 mail-qk1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 30 May 2019 16:58:28 +0000 (UTC)

The audit_data_to_entry() function ensures that the operator is valid
so we can get rid of these BUG() calls.  We keep the "return 0" just
so the system behaves in a sane-ish manner should something go
horribly wrong.

Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 kernel/auditfilter.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index e69d136eeaf6..1a21b6aa50d1 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1220,7 +1220,6 @@ int audit_comparator(u32 left, u32 op, u32 right)
 	case Audit_bittest:
 		return ((left & right) == right);
 	default:
-		BUG();
 		return 0;
 	}
 }
@@ -1243,7 +1242,6 @@ int audit_uid_comparator(kuid_t left, u32 op, kuid_t right)
 	case Audit_bitmask:
 	case Audit_bittest:
 	default:
-		BUG();
 		return 0;
 	}
 }
@@ -1266,7 +1264,6 @@ int audit_gid_comparator(kgid_t left, u32 op, kgid_t right)
 	case Audit_bitmask:
 	case Audit_bittest:
 	default:
-		BUG();
 		return 0;
 	}
 }

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

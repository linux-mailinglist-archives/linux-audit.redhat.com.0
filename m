Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 46783235471
	for <lists+linux-audit@lfdr.de>; Sat,  1 Aug 2020 23:46:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-xTVpNs1kPYKwx1ajGWTQ5A-1; Sat, 01 Aug 2020 17:45:59 -0400
X-MC-Unique: xTVpNs1kPYKwx1ajGWTQ5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D58738015F8;
	Sat,  1 Aug 2020 21:45:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C002787B3D;
	Sat,  1 Aug 2020 21:45:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 928BB18095FF;
	Sat,  1 Aug 2020 21:45:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 071Ikh0m021229 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 1 Aug 2020 14:46:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2390C2166B28; Sat,  1 Aug 2020 18:46:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F8BF2166BA2
	for <linux-audit@redhat.com>; Sat,  1 Aug 2020 18:46:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2544185A78B
	for <linux-audit@redhat.com>; Sat,  1 Aug 2020 18:46:40 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-470-4o6cF8C_NI6Xsl5U8FbIUA-1; Sat, 01 Aug 2020 14:46:38 -0400
X-MC-Unique: 4o6cF8C_NI6Xsl5U8FbIUA-1
Received: by mail-wm1-f67.google.com with SMTP id f18so8479912wmc.0;
	Sat, 01 Aug 2020 11:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PvnrBlZrpRslY4PpmEHw5xhWUfLd5lVP4jPMRcGfwzE=;
	b=ejJtui356vpdzLYsNnt0YR9vBlEv26gdkjwBjBRMINiFjYyWJKBkG+DeHgJRFJRaQV
	mEM6BEW0HStnVUr1mmH/mzeojgbz1vmgHHpWJZnOaR4uprc0H3KA1DlnUiuVcpyyG4Ps
	d2W/ZOpj9eH2MoRZXoCH337g5ho8Ft3H8ohEEEO9nAL3R0+KFT/s8PPlBrNfi9o6+2X/
	O+w/6CcyaS1yHHIQP+o5lNTgd9vTxygGO+eJDXUcYshsKxWf4EyuhGjg7vu94V0F3fV0
	WCEjHpseXX5wHiqze7blQqF/eKzyOyiv+IVPcVCcPhv+PVOeSvucD7IIMuioMaKyp4VD
	RwzA==
X-Gm-Message-State: AOAM532DhsnNFx/8E7TNjvG3qMB/IV4l5AQWHwMoy4CYcph0UF0Tnjuv
	3tVUR69P2kt0SeWrXtpblg==
X-Google-Smtp-Source: ABdhPJzf9LDaS8QS+PG8yGVerZ9n0pnm84BAInexjKqKIMk2EKvw/ypxB0jO93mXt95a26klGwF1Ig==
X-Received: by 2002:a1c:750a:: with SMTP id o10mr9282009wmc.165.1596307596610; 
	Sat, 01 Aug 2020 11:46:36 -0700 (PDT)
Received: from localhost.lan (host-92-25-238-49.as13285.net. [92.25.238.49])
	by smtp.gmail.com with ESMTPSA id
	g7sm17468447wrv.82.2020.08.01.11.46.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 01 Aug 2020 11:46:36 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] audit: uninitialize global variable audit_sig_sid
Date: Sat,  1 Aug 2020 19:46:01 +0100
Message-Id: <20200801184603.310769-3-jbi.octave@gmail.com>
In-Reply-To: <20200801184603.310769-1-jbi.octave@gmail.com>
References: <0/4>
 <20200801184603.310769-1-jbi.octave@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sat, 01 Aug 2020 17:45:19 -0400
Cc: Jules Irenge <jbi.octave@gmail.com>,
	"moderated list:AUDIT SUBSYSTEM" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Checkpatch tool reports an error at variable audit_sig_sid declaration

"ERROR: do not initialise globals to 0"

To fix this, the global variable has been uninitialized.

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 kernel/audit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index 8c201f414226..7b1a38a211a9 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -125,7 +125,7 @@ static u32	audit_backlog_wait_time = AUDIT_BACKLOG_WAIT_TIME;
 /* The identity of the user shutting down the audit system. */
 kuid_t		audit_sig_uid = INVALID_UID;
 pid_t		audit_sig_pid = -1;
-u32		audit_sig_sid = 0;
+u32		audit_sig_sid;
 
 /* Records can be lost in several ways:
    0) [suppressed in audit_alloc]
-- 
2.26.2

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


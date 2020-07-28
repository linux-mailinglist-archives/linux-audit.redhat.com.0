Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5A9231473
	for <lists+linux-audit@lfdr.de>; Tue, 28 Jul 2020 23:10:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-QgcX8bYSOLWlnLtgsfPGcA-1; Tue, 28 Jul 2020 17:10:23 -0400
X-MC-Unique: QgcX8bYSOLWlnLtgsfPGcA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DD7D106B244;
	Tue, 28 Jul 2020 21:10:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3341471906;
	Tue, 28 Jul 2020 21:10:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D357A35A3;
	Tue, 28 Jul 2020 21:10:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SL9lR0015199 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 17:09:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DB1872EF9E; Tue, 28 Jul 2020 21:09:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAE6CCF61D
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 21:09:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D66941012443
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 21:09:43 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-433-9sldbkmOOe6HFc2zPPwqaQ-1; Tue, 28 Jul 2020 17:09:41 -0400
X-MC-Unique: 9sldbkmOOe6HFc2zPPwqaQ-1
Received: by mail-qv1-f66.google.com with SMTP id dd12so4813293qvb.0
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 14:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:date:message-id:user-agent
	:mime-version:content-transfer-encoding;
	bh=AYopacwr3oiyrabSLAdCQssS60VdIexWcGYXioObdRw=;
	b=MJzJ59L6JsnKs2cC/I0avSZPGDQj92u97LDuumNMQjIGm4LVoL3jGvr/2ZAFsN6Gng
	/u684E88ssS/FHJuhdTcFBFYo6Vf6hXmUNaZEW4RJEUVlc/ZUxL2Q/ThVmbPWmTk7NY3
	fF6lRVeaOgO8Qr2jvsePTw/nflybXVMGLUDHrUgrNrALTOonjM9ikHNWYfY/Dvi6OqlN
	KtVAvf5dUgoLj2qNNXhfYncVK4yZsnLiNKq0oPkMywr11fdF8oOYYNhORFCjWMpsq8iV
	KKW24sSnEkhazA1Aja/oEJKLlY73rXVWuOiWyhzPlVCVow+jePf7eJMNopfwPNhndzy7
	c/7A==
X-Gm-Message-State: AOAM532sjgL8VzoPQDwf+XWP8HjTKKNUAlP5HwntelkSTWkbWGXGRBjr
	H+hhVuoF2j6j05y/lXFeqRWhQQwuK3r/
X-Google-Smtp-Source: ABdhPJxdK9SSwemoVX1+owIa2OIe1PBcXO7we0GBye3g/J40FcfpBw5GCvSwJ2RM3j8v/NK2byqqGw==
X-Received: by 2002:ad4:5042:: with SMTP id m2mr28858191qvq.225.1595970577182; 
	Tue, 28 Jul 2020 14:09:37 -0700 (PDT)
Received: from localhost (pool-96-230-24-152.bstnma.fios.verizon.net.
	[96.230.24.152]) by smtp.gmail.com with ESMTPSA id
	e9sm19038618qtq.70.2020.07.28.14.09.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jul 2020 14:09:36 -0700 (PDT)
Subject: [PATCH] revert: 1320a4052ea1 ("audit: trigger accompanying records
	when no rules present")
From: Paul Moore <paul@paul-moore.com>
To: linux-audit@redhat.com
Date: Tue, 28 Jul 2020 17:09:35 -0400
Message-ID: <159597057565.40164.9909646970085967040.stgit@sifl>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Unfortunately the commit listed in the subject line above failed
to ensure that the task's audit_context was properly initialized/set
before enabling the "accompanying records".  Depending on the
sitation, the resulting audit_context could have invalid values in
some of it's fields which could cause a kernel panic/oops when the
task/syscall exists and the audit records are generated.

We will revisit the original patch, with the necessary fixes, in a
future kernel but right now we just want to fix the kernel panic
with the least amount of added risk.

Cc: stable@vger.kernel.org
Fixes: 1320a4052ea1 ("audit: trigger accompanying records when no rules present")
Reported-by: j2468h@googlemail.com
Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 kernel/audit.c   |    1 -
 kernel/audit.h   |    8 --------
 kernel/auditsc.c |    3 +++
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index e33460e01b3b..9bf2b08b051f 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1848,7 +1848,6 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
 	}
 
 	audit_get_stamp(ab->ctx, &t, &serial);
-	audit_clear_dummy(ab->ctx);
 	audit_log_format(ab, "audit(%llu.%03lu:%u): ",
 			 (unsigned long long)t.tv_sec, t.tv_nsec/1000000, serial);
 
diff --git a/kernel/audit.h b/kernel/audit.h
index f0233dc40b17..ddc22878433d 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -290,13 +290,6 @@ extern int audit_signal_info_syscall(struct task_struct *t);
 extern void audit_filter_inodes(struct task_struct *tsk,
 				struct audit_context *ctx);
 extern struct list_head *audit_killed_trees(void);
-
-static inline void audit_clear_dummy(struct audit_context *ctx)
-{
-	if (ctx)
-		ctx->dummy = 0;
-}
-
 #else /* CONFIG_AUDITSYSCALL */
 #define auditsc_get_stamp(c, t, s) 0
 #define audit_put_watch(w) {}
@@ -330,7 +323,6 @@ static inline int audit_signal_info_syscall(struct task_struct *t)
 }
 
 #define audit_filter_inodes(t, c) AUDIT_DISABLED
-#define audit_clear_dummy(c) {}
 #endif /* CONFIG_AUDITSYSCALL */
 
 extern char *audit_unpack_string(void **bufp, size_t *remain, size_t len);
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 468a23390457..fd840c40abf7 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1417,6 +1417,9 @@ static void audit_log_proctitle(void)
 	struct audit_context *context = audit_context();
 	struct audit_buffer *ab;
 
+	if (!context || context->dummy)
+		return;
+
 	ab = audit_log_start(context, GFP_KERNEL, AUDIT_PROCTITLE);
 	if (!ab)
 		return;	/* audit_panic or being filtered */

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


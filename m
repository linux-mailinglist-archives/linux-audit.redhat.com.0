Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C0C651162
	for <lists+linux-audit@lfdr.de>; Mon, 19 Dec 2022 18:55:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671472507;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8Awi9iOhb+GdM2WFvTkFqglaw0KnCgPXd/ZVE/DOg0Y=;
	b=YAi9i6eMz7RbaIjma7OPNYMir7i7BydZl4d0PgIDC9v1JF4bH8ZXAtu1w3/+ff20DnIcEN
	BvtCxMWwN1+qdJngq6GKX8OJVZxZK912xZDD587jF+CQyb5Kd/x2gQbaumJIp199voLocC
	1cn+8/NjZ2pUOPim4GWMyMyMzwmi2bg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-h7gOuFcUPpe_NadAC-jSgw-1; Mon, 19 Dec 2022 12:55:05 -0500
X-MC-Unique: h7gOuFcUPpe_NadAC-jSgw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A93663C0D863;
	Mon, 19 Dec 2022 17:55:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 615E7492B00;
	Mon, 19 Dec 2022 17:54:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EC18A19465A8;
	Mon, 19 Dec 2022 17:54:58 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6EA9C19465A4 for <linux-audit@listman.corp.redhat.com>;
 Mon, 19 Dec 2022 17:54:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 615052166B2C; Mon, 19 Dec 2022 17:54:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 599EC2166B2B
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 17:54:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3545C101A521
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 17:54:57 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-108-2rnIyUllMDSpWtDVxSz77g-1; Mon, 19 Dec 2022 12:54:55 -0500
X-MC-Unique: 2rnIyUllMDSpWtDVxSz77g-1
Received: by mail-ej1-f72.google.com with SMTP id
 sd1-20020a1709076e0100b00810be49e7afso3111416ejc.22
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 09:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8EQJBe1ACqmTPnCsFrmQTUM9ZhpffhytSBj2Oj+XKs=;
 b=r1iQjz8iHJdcLUGpPWqbAwvJ97+W+1YOqsibW2XEk0G7UuuSHu0jeYdScxGPJE9I5t
 V3kuea5vt26+Ec3rtGTzlgIDintf0hSNxDN0cD6p7d7anuLsuLry8ieK/7LzYEhlU/x6
 8DIQmEityWHuz2yEhz6vf5/AAZG9Tiu2/rmKfpMS5EDP5X02hxB9leBQuYxufuadycBy
 eb/NYigWX2pPAY/9V8cUzWXLlbfejf3o4dvTn+JaoyB6AELzWaBK6zgOi/clPUBDUXIc
 mp9ifFM/FSKLcw837Ksy6dgfch1JH2AA9dtTlKHGOA9hu9YYkA0j/6SCRuyYMFdp5tl8
 Nb5A==
X-Gm-Message-State: ANoB5pmpOqCGOzhBhEn+YtW6ngCpBXGDNory5uMnctbr9FUl5EGNR06H
 TJOtXUGa3zQC4K2WbiqpOdA3CC8hPH9psLm47RWYvHquKyE5gxzjntO1c9+hWMCZhmguh97uCsh
 WHJshmI3KbpPqYSFlOGs=
X-Received: by 2002:a17:906:698f:b0:7ad:d250:b903 with SMTP id
 i15-20020a170906698f00b007add250b903mr48341353ejr.56.1671472494474; 
 Mon, 19 Dec 2022 09:54:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6YLtenQUjr2R0cuTQaiwIA9ywz+DM8e52twvcfKvsLPFUnaFvMUzZOwGwHSPNzGMgA0eMYNg==
X-Received: by 2002:a17:906:698f:b0:7ad:d250:b903 with SMTP id
 i15-20020a170906698f00b007add250b903mr48341337ejr.56.1671472494319; 
 Mon, 19 Dec 2022 09:54:54 -0800 (PST)
Received: from localhost.localdomain ([2a02:8308:b104:2c00:2e8:ec99:5760:fb52])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a1709063b0400b007bdc2de90e6sm4604210ejf.42.2022.12.19.09.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 09:54:53 -0800 (PST)
From: Ondrej Mosnacek <omosnace@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: [PATCH 1/2] audit: introduce a struct to represent an audit timestamp
Date: Mon, 19 Dec 2022 18:54:48 +0100
Message-Id: <20221219175449.1657640-2-omosnace@redhat.com>
In-Reply-To: <20221219175449.1657640-1-omosnace@redhat.com>
References: <20221219175449.1657640-1-omosnace@redhat.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Join the two fields that comprise an audit timestamp into a common
structure. This will be used further in later commits.

Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 include/linux/audit.h |  5 +++++
 kernel/audit.c        | 16 ++++++++--------
 kernel/audit.h        |  4 ++--
 kernel/auditsc.c      |  9 ++++-----
 4 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 3608992848d3..788ab93c3be4 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -84,6 +84,11 @@ enum audit_ntp_type {
 	AUDIT_NTP_NVALS /* count */
 };
 
+struct audit_timestamp {
+	struct timespec64 t;
+	unsigned int serial;
+};
+
 #ifdef CONFIG_AUDITSYSCALL
 struct audit_ntp_val {
 	long long oldval, newval;
diff --git a/kernel/audit.c b/kernel/audit.c
index 9bc0b0301198..aded2d69ea69 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1818,11 +1818,11 @@ unsigned int audit_serial(void)
 }
 
 static inline void audit_get_stamp(struct audit_context *ctx,
-				   struct timespec64 *t, unsigned int *serial)
+				   struct audit_timestamp *ts)
 {
-	if (!ctx || !auditsc_get_stamp(ctx, t, serial)) {
-		ktime_get_coarse_real_ts64(t);
-		*serial = audit_serial();
+	if (!ctx || !auditsc_get_stamp(ctx, ts)) {
+		ktime_get_coarse_real_ts64(&ts->t);
+		ts->serial = audit_serial();
 	}
 }
 
@@ -1845,8 +1845,7 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
 				     int type)
 {
 	struct audit_buffer *ab;
-	struct timespec64 t;
-	unsigned int serial;
+	struct audit_timestamp ts;
 
 	if (audit_initialized != AUDIT_INITIALIZED)
 		return NULL;
@@ -1901,12 +1900,13 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
 		return NULL;
 	}
 
-	audit_get_stamp(ab->ctx, &t, &serial);
+	audit_get_stamp(ab->ctx, &ts);
 	/* cancel dummy context to enable supporting records */
 	if (ctx)
 		ctx->dummy = 0;
 	audit_log_format(ab, "audit(%llu.%03lu:%u): ",
-			 (unsigned long long)t.tv_sec, t.tv_nsec/1000000, serial);
+			 (unsigned long long)ts.t.tv_sec, ts.t.tv_nsec/1000000,
+			 ts.serial);
 
 	return ab;
 }
diff --git a/kernel/audit.h b/kernel/audit.h
index c57b008b9914..e3ea00ea399a 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -262,7 +262,7 @@ extern void audit_put_tty(struct tty_struct *tty);
 #ifdef CONFIG_AUDITSYSCALL
 extern unsigned int audit_serial(void);
 extern int auditsc_get_stamp(struct audit_context *ctx,
-			      struct timespec64 *t, unsigned int *serial);
+			     struct audit_timestamp *ts);
 
 extern void audit_put_watch(struct audit_watch *watch);
 extern void audit_get_watch(struct audit_watch *watch);
@@ -303,7 +303,7 @@ extern void audit_filter_inodes(struct task_struct *tsk,
 				struct audit_context *ctx);
 extern struct list_head *audit_killed_trees(void);
 #else /* CONFIG_AUDITSYSCALL */
-#define auditsc_get_stamp(c, t, s) 0
+#define auditsc_get_stamp(c, ts) 0
 #define audit_put_watch(w) do { } while (0)
 #define audit_get_watch(w) do { } while (0)
 #define audit_to_watch(k, p, l, o) (-EINVAL)
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 9f8c05228d6d..061009ba9959 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2513,16 +2513,15 @@ EXPORT_SYMBOL_GPL(__audit_inode_child);
  *
  * Also sets the context as auditable.
  */
-int auditsc_get_stamp(struct audit_context *ctx,
-		       struct timespec64 *t, unsigned int *serial)
+int auditsc_get_stamp(struct audit_context *ctx, struct audit_timestamp *ts)
 {
 	if (ctx->context == AUDIT_CTX_UNUSED)
 		return 0;
 	if (!ctx->serial)
 		ctx->serial = audit_serial();
-	t->tv_sec  = ctx->ctime.tv_sec;
-	t->tv_nsec = ctx->ctime.tv_nsec;
-	*serial    = ctx->serial;
+	ts->t.tv_sec  = ctx->ctime.tv_sec;
+	ts->t.tv_nsec = ctx->ctime.tv_nsec;
+	ts->serial    = ctx->serial;
 	if (!ctx->prio) {
 		ctx->prio = 1;
 		ctx->current_state = AUDIT_STATE_RECORD;
-- 
2.38.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


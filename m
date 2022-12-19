Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D3865116D
	for <lists+linux-audit@lfdr.de>; Mon, 19 Dec 2022 19:00:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671472840;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8Awi9iOhb+GdM2WFvTkFqglaw0KnCgPXd/ZVE/DOg0Y=;
	b=Zo0KCjH2t742YQ7MJbTYM9029VHLKheVitVfzppAXWGnJrmy/sMQQaK0vemQvcwGo9Zn/Q
	SZQcKWbVUMqO1Tp0t9vaG0U4UYg++5C7TvjL64GqAuJ/SBFyszTJnWIk/2dBVSnl7PhWJN
	6eUHXaetH4rvyBK5gAig/qC/DPOQBT0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-0AFANgN5O9mnEbEsKbqZRg-1; Mon, 19 Dec 2022 13:00:39 -0500
X-MC-Unique: 0AFANgN5O9mnEbEsKbqZRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 643233C10692;
	Mon, 19 Dec 2022 18:00:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 47D651121314;
	Mon, 19 Dec 2022 18:00:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C244B19465A2;
	Mon, 19 Dec 2022 18:00:34 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C3A7C194658D for <linux-audit@listman.corp.redhat.com>;
 Mon, 19 Dec 2022 18:00:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B94D739D3E; Mon, 19 Dec 2022 18:00:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B12D017595
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 18:00:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 918833C10688
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 18:00:31 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-154-Qfw6ZDfEN-eR1Im5rvGTYA-1; Mon, 19 Dec 2022 13:00:30 -0500
X-MC-Unique: Qfw6ZDfEN-eR1Im5rvGTYA-1
Received: by mail-ej1-f72.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso6641595ejb.5
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 10:00:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8EQJBe1ACqmTPnCsFrmQTUM9ZhpffhytSBj2Oj+XKs=;
 b=Pxer/HGVoId2KrRT5AKpTcOYOs3xljytOhcOP/1okijyawo+05uBfTXFYksvKJgS5Q
 TTpO2U/X1YXbAZ1tM3GWdMYuCwpPuem2Te8Q6DgSz+GEh3GGumTC5BeDGJOXMj2T9udF
 qaB+TLxVM/n93+QqpyqHClkZmStu0iyhqBPCgjZx9xYBXIs1XYNagcq/LN6huJ0ru93l
 IYLdRFBeZc/JWqmrVMz0g0KueCjhFm/D/9gKbdFyhpudnvH31zunubCPC9J2UWJVqqK2
 TRNrbUAwaF47Scy6LL2f2rLHealeVdiKbE64fZ784tvrP5DUFHyLqT2OQr4T9XmWmuYX
 dfXQ==
X-Gm-Message-State: ANoB5pnABWVCHxW4brdK60SU8f0Wz5wThdYJC3dfUMtb7q94nnwzXLfC
 1jmYFTwR0NVAsEJ1EhbFOdyCAXMdbHSEX7XXQiAGaZeieQHwKNlUnqNTWrODWRXYDka7eQelRpl
 JLajzXytxTHqbqSg5xlU=
X-Received: by 2002:a05:6402:298d:b0:461:f201:2d98 with SMTP id
 eq13-20020a056402298d00b00461f2012d98mr35963075edb.3.1671472828485; 
 Mon, 19 Dec 2022 10:00:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7KkflOA+3xNI2cHDSL2Wzqd0L+IZLZJ5X6VVkcBD2gXVdodOoGPOMw9OuQAoXWPxwDNfJD2g==
X-Received: by 2002:a05:6402:298d:b0:461:f201:2d98 with SMTP id
 eq13-20020a056402298d00b00461f2012d98mr35963062edb.3.1671472828306; 
 Mon, 19 Dec 2022 10:00:28 -0800 (PST)
Received: from localhost.localdomain ([2a02:8308:b104:2c00:2e8:ec99:5760:fb52])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a056402278a00b0046bb7503d9asm4617691ede.24.2022.12.19.10.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 10:00:27 -0800 (PST)
From: Ondrej Mosnacek <omosnace@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: [PATCH RESEND 1/2] audit: introduce a struct to represent an audit
 timestamp
Date: Mon, 19 Dec 2022 19:00:23 +0100
Message-Id: <20221219180024.1659268-2-omosnace@redhat.com>
In-Reply-To: <20221219180024.1659268-1-omosnace@redhat.com>
References: <20221219180024.1659268-1-omosnace@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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


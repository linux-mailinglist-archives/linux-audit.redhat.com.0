Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CAA65116F
	for <lists+linux-audit@lfdr.de>; Mon, 19 Dec 2022 19:00:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671472843;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PRoFcJfKasdQe5PJ/mX96dYepeL8DdTIZSo28Y565A0=;
	b=VQcdaUBkDbdvI5TkRPVkDB2Zay8StgVzmS4vYP/hIqgo/JGTOnxoxRe8TdLp4f6Kb6Oqxj
	sIpx1phyrmYgUMrmrnE+yoUdsa9ZayC5FVPzV5xAhls9Kbwmu02POi/p4+m6ZJ/GbM15fZ
	LjksMfl17dbHZVFCgW+Fb+5WW9UlkJU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-IBzgF3C_PfiBC2zgC1zdwg-1; Mon, 19 Dec 2022 13:00:41 -0500
X-MC-Unique: IBzgF3C_PfiBC2zgC1zdwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 413BE1991C43;
	Mon, 19 Dec 2022 18:00:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22A9817595;
	Mon, 19 Dec 2022 18:00:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BCE2119465A2;
	Mon, 19 Dec 2022 18:00:37 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 31CFC194658D for <linux-audit@listman.corp.redhat.com>;
 Mon, 19 Dec 2022 18:00:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 07E204014D1A; Mon, 19 Dec 2022 18:00:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 001AE40C945A
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 18:00:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D711F1991C43
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 18:00:35 +0000 (UTC)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-TlIbw-34MJ6Yr1y5SEQV1A-1; Mon, 19 Dec 2022 13:00:34 -0500
X-MC-Unique: TlIbw-34MJ6Yr1y5SEQV1A-1
Received: by mail-ej1-f71.google.com with SMTP id
 dn11-20020a17090794cb00b007c14ea70afcso6583057ejc.0
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 10:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mXsj4sl5Q7Amjwuhgta29gJZDvW0Wms9duXV33JE5vE=;
 b=4if4RdkAcJhjV7tkBHP5q5OYedm8Nthia6Bo45AdHhDO5ppg/fUGsTbPfC+k+9wEKY
 E9rWAo+8f6iC+uKhqXYuC071y7fhoHYa+1XZLO+hpFtYXHzd41hq3S3RuIGe0oyjQHMS
 ZotKyezgca39Z3YxqEEtjsbPGhNNvAgvNqZEbrxgo0c6ouH3emBjHW93vgKeg8Gcu2Ys
 bgiM+uEShltLf+j95gT1yrC3yAGXM5cSoHaUNGJ+2oq3oSOmS221MiKW6zIq/ql62M35
 ARgWuvNBZnVVkHHiafyQvgo5BelvFDdLjstIxcGZIrUrFDbm14Arw3tlShFK5pfvt14o
 150Q==
X-Gm-Message-State: ANoB5pk8wrIG4somf7ajWay5DwiCpPx2U6hhdqslHkyOGk9+F8EBcSWE
 GHJcY7zv0dHZV51Bq6Pk15f9RvKzK2v1IVj6mVzuIv4fJScDwyn4PbjpIhNkEFOW8nAfa4p8Gtl
 IttPVNxww/LuO+JGIdqA=
X-Received: by 2002:aa7:c690:0:b0:470:1605:7d8b with SMTP id
 n16-20020aa7c690000000b0047016057d8bmr25983219edq.16.1671472830188; 
 Mon, 19 Dec 2022 10:00:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6PYcnrDcnWATwF5yoghg3gleoYRioZkjgtlSjE/ryAWqL2h/0APCv5Ob1MK8CPQYxIBZ3/iA==
X-Received: by 2002:aa7:c690:0:b0:470:1605:7d8b with SMTP id
 n16-20020aa7c690000000b0047016057d8bmr25983204edq.16.1671472829975; 
 Mon, 19 Dec 2022 10:00:29 -0800 (PST)
Received: from localhost.localdomain ([2a02:8308:b104:2c00:2e8:ec99:5760:fb52])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a056402278a00b0046bb7503d9asm4617691ede.24.2022.12.19.10.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 10:00:28 -0800 (PST)
From: Ondrej Mosnacek <omosnace@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: [PATCH RESEND 2/2] selinux: provide matching audit timestamp in the
 AVC trace event
Date: Mon, 19 Dec 2022 19:00:24 +0100
Message-Id: <20221219180024.1659268-3-omosnace@redhat.com>
In-Reply-To: <20221219180024.1659268-1-omosnace@redhat.com>
References: <20221219180024.1659268-1-omosnace@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In order to make it possible for the users and tooling to associate an
SELinux AVC trace event with the corresponding audit event, make it
include the audit timestamp (including the "serial number") of the
event.

First make audit_log_start() include the timestamp in the audit_buffer
struct and add a public helper to retrieve it from an audit_buffer
instance. Then retrieve it in SELinux's avc_audit_post_callback() and
include it in the "avc:selinux_audited" trace event.

After this patch the even includes the numeric fields that make up the
timestamp and the text representation includes the timestamp in the same
format as used in the audit log - e.g. "audit_ts=1671454430.092:1671".

Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 include/linux/audit.h      |  8 ++++++++
 include/trace/events/avc.h | 25 +++++++++++++++++--------
 kernel/audit.c             | 15 +++++++++++----
 security/selinux/avc.c     |  4 +++-
 4 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 788ab93c3be4..d6d7acc1b623 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -162,6 +162,9 @@ extern __printf(4, 5)
 void audit_log(struct audit_context *ctx, gfp_t gfp_mask, int type,
 	       const char *fmt, ...);
 
+extern void audit_buffer_get_timestamp(struct audit_buffer *ab,
+				       struct audit_timestamp *ts);
+
 extern struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask, int type);
 extern __printf(2, 3)
 void audit_log_format(struct audit_buffer *ab, const char *fmt, ...);
@@ -218,6 +221,11 @@ static inline __printf(4, 5)
 void audit_log(struct audit_context *ctx, gfp_t gfp_mask, int type,
 	       const char *fmt, ...)
 { }
+static inline void audit_buffer_get_timestamp(struct audit_buffer *ab,
+					      struct audit_timestamp *ts)
+{
+	*ts = (struct audit_timestamp){};
+}
 static inline struct audit_buffer *audit_log_start(struct audit_context *ctx,
 						   gfp_t gfp_mask, int type)
 {
diff --git a/include/trace/events/avc.h b/include/trace/events/avc.h
index b55fda2e0773..8cac14ae22ae 100644
--- a/include/trace/events/avc.h
+++ b/include/trace/events/avc.h
@@ -16,34 +16,43 @@ TRACE_EVENT(selinux_audited,
 	TP_PROTO(struct selinux_audit_data *sad,
 		char *scontext,
 		char *tcontext,
-		const char *tclass
+		const char *tclass,
+		const struct audit_timestamp *ts
 	),
 
-	TP_ARGS(sad, scontext, tcontext, tclass),
+	TP_ARGS(sad, scontext, tcontext, tclass, ts),
 
 	TP_STRUCT__entry(
 		__field(u32, requested)
 		__field(u32, denied)
 		__field(u32, audited)
 		__field(int, result)
+		__field(u64, audit_stamp_sec)
+		__field(u32, audit_stamp_msec)
+		__field(u32, audit_stamp_serial)
 		__string(scontext, scontext)
 		__string(tcontext, tcontext)
 		__string(tclass, tclass)
 	),
 
 	TP_fast_assign(
-		__entry->requested	= sad->requested;
-		__entry->denied		= sad->denied;
-		__entry->audited	= sad->audited;
-		__entry->result		= sad->result;
+		__entry->requested		= sad->requested;
+		__entry->denied			= sad->denied;
+		__entry->audited		= sad->audited;
+		__entry->result			= sad->result;
+		__entry->audit_stamp_sec	= ts->t.tv_sec;
+		__entry->audit_stamp_msec	= ts->t.tv_nsec / 1000000;
+		__entry->audit_stamp_serial	= ts->serial;
 		__assign_str(tcontext, tcontext);
 		__assign_str(scontext, scontext);
 		__assign_str(tclass, tclass);
 	),
 
-	TP_printk("requested=0x%x denied=0x%x audited=0x%x result=%d scontext=%s tcontext=%s tclass=%s",
+	TP_printk("requested=0x%x denied=0x%x audited=0x%x result=%d scontext=%s tcontext=%s tclass=%s audit_ts=%llu.%03u:%u",
 		__entry->requested, __entry->denied, __entry->audited, __entry->result,
-		__get_str(scontext), __get_str(tcontext), __get_str(tclass)
+		__get_str(scontext), __get_str(tcontext), __get_str(tclass),
+		__entry->audit_stamp_sec, __entry->audit_stamp_msec,
+		__entry->audit_stamp_serial
 	)
 );
 
diff --git a/kernel/audit.c b/kernel/audit.c
index aded2d69ea69..ad21d148704a 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -199,6 +199,7 @@ static struct audit_ctl_mutex {
 struct audit_buffer {
 	struct sk_buff       *skb;	/* formatted skb ready to send */
 	struct audit_context *ctx;	/* NULL or associated context */
+	struct audit_timestamp ts;	/* the timestamp of this record */
 	gfp_t		     gfp_mask;
 };
 
@@ -1826,6 +1827,12 @@ static inline void audit_get_stamp(struct audit_context *ctx,
 	}
 }
 
+void audit_buffer_get_timestamp(struct audit_buffer *ab,
+				struct audit_timestamp *ts)
+{
+	*ts = ab->ts;
+}
+
 /**
  * audit_log_start - obtain an audit buffer
  * @ctx: audit_context (may be NULL)
@@ -1845,7 +1852,6 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
 				     int type)
 {
 	struct audit_buffer *ab;
-	struct audit_timestamp ts;
 
 	if (audit_initialized != AUDIT_INITIALIZED)
 		return NULL;
@@ -1900,13 +1906,14 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
 		return NULL;
 	}
 
-	audit_get_stamp(ab->ctx, &ts);
+	audit_get_stamp(ab->ctx, &ab->ts);
 	/* cancel dummy context to enable supporting records */
 	if (ctx)
 		ctx->dummy = 0;
 	audit_log_format(ab, "audit(%llu.%03lu:%u): ",
-			 (unsigned long long)ts.t.tv_sec, ts.t.tv_nsec/1000000,
-			 ts.serial);
+			 (unsigned long long)ab->ts.t.tv_sec,
+			 ab->ts.t.tv_nsec/1000000,
+			 ab->ts.serial);
 
 	return ab;
 }
diff --git a/security/selinux/avc.c b/security/selinux/avc.c
index 9a43af0ebd7d..e59c91eb3228 100644
--- a/security/selinux/avc.c
+++ b/security/selinux/avc.c
@@ -708,6 +708,7 @@ static void avc_audit_post_callback(struct audit_buffer *ab, void *a)
 {
 	struct common_audit_data *ad = a;
 	struct selinux_audit_data *sad = ad->selinux_audit_data;
+	struct audit_timestamp ts;
 	char *scontext = NULL;
 	char *tcontext = NULL;
 	const char *tclass = NULL;
@@ -735,7 +736,8 @@ static void avc_audit_post_callback(struct audit_buffer *ab, void *a)
 	if (sad->denied)
 		audit_log_format(ab, " permissive=%u", sad->result ? 0 : 1);
 
-	trace_selinux_audited(sad, scontext, tcontext, tclass);
+	audit_buffer_get_timestamp(ab, &ts);
+	trace_selinux_audited(sad, scontext, tcontext, tclass, &ts);
 	kfree(tcontext);
 	kfree(scontext);
 
-- 
2.38.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


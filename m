Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 600B72DFE45
	for <lists+linux-audit@lfdr.de>; Mon, 21 Dec 2020 17:57:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608569853;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B460JCsHjS9bUdHdd81ymjyj3lQAtUenWAK6YMsH8Jw=;
	b=C6SwwWAygYA4+B6v4qNPFX5zM4Ac6iDo/sAUSGiatXn8HjDxUsA6ctQG9Mf1+RFjzo/11m
	WEw0mQqafvFUKkGMIFybyI7TMewP9L3OgMztNiVtdYXTxA3vTM+On9TZfi7DFycSflkYaw
	LuwR5GK5hJK0hagqZd5tSgErmgJy1T0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-B_Zkov9VOYmt8QQZACcicg-1; Mon, 21 Dec 2020 11:57:31 -0500
X-MC-Unique: B_Zkov9VOYmt8QQZACcicg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B18BC801817;
	Mon, 21 Dec 2020 16:57:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9197D10016FF;
	Mon, 21 Dec 2020 16:57:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60FC5180954D;
	Mon, 21 Dec 2020 16:57:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BLGvN4b016890 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 21 Dec 2020 11:57:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CB90160C66; Mon, 21 Dec 2020 16:57:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F28660C0F;
	Mon, 21 Dec 2020 16:57:09 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux Containers List <containers@lists.linux-foundation.org>,
	Linux API <linux-api@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	Linux FSdevel <linux-fsdevel@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux NetDev Upstream Mailing List <netdev@vger.kernel.org>,
	Netfilter Devel List <netfilter-devel@vger.kernel.org>
Subject: [PATCH ghak90 v10 05/11] audit: add support for non-syscall auxiliary
	records
Date: Mon, 21 Dec 2020 11:55:39 -0500
Message-Id: <95024db7dc025fd9b804dd66a18e1264f981e25f.1608225886.git.rgb@redhat.com>
In-Reply-To: <cover.1608225886.git.rgb@redhat.com>
References: <cover.1608225886.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Neil Horman <nhorman@tuxdriver.com>,
	Richard Guy Briggs <rgb@redhat.com>, David Howells <dhowells@redhat.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Simo Sorce <simo@redhat.com>, Eric Paris <eparis@parisplace.org>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	mpatel@redhat.com, Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Standalone audit records have the timestamp and serial number generated
on the fly and as such are unique, making them standalone.  This new
function audit_alloc_local() generates a local audit context that will
be used only for a standalone record and its auxiliary record(s).  The
context is discarded immediately after the local associated records are
produced.

A new flag, "local" was used rather than "in_syscall" since it would be
overloading the original purpose and meaning.  Events using this
function may not be triggered by a syscall but still need records
linked by timestamp and serial.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
Acked-by: Serge Hallyn <serge@hallyn.com>
Acked-by: Neil Horman <nhorman@tuxdriver.com>
Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 include/linux/audit.h |  8 ++++++++
 kernel/audit.h        |  1 +
 kernel/auditsc.c      | 31 ++++++++++++++++++++++++++-----
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 7c1928e75cfe..9f0238f7960f 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -304,6 +304,8 @@ static inline int audit_signal_info(int sig, struct task_struct *t)
 
 /* These are defined in auditsc.c */
 				/* Public API */
+extern struct audit_context *audit_alloc_local(gfp_t gfpflags);
+extern void audit_free_context(struct audit_context *context);
 extern void __audit_syscall_entry(int major, unsigned long a0, unsigned long a1,
 				  unsigned long a2, unsigned long a3);
 extern void __audit_syscall_exit(int ret_success, long ret_value);
@@ -555,6 +557,12 @@ static inline void audit_log_nfcfg(const char *name, u8 af,
 extern int audit_n_rules;
 extern int audit_signals;
 #else /* CONFIG_AUDITSYSCALL */
+static inline struct audit_context *audit_alloc_local(gfp_t gfpflags)
+{
+	return NULL;
+}
+static inline void audit_free_context(struct audit_context *context)
+{ }
 static inline void audit_syscall_entry(int major, unsigned long a0,
 				       unsigned long a1, unsigned long a2,
 				       unsigned long a3)
diff --git a/kernel/audit.h b/kernel/audit.h
index de79f59d623f..40e609787a0c 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -98,6 +98,7 @@ struct audit_proctitle {
 struct audit_context {
 	int		    dummy;	/* must be the first element */
 	int		    in_syscall;	/* 1 if task is in a syscall */
+	bool		    local;	/* local context needed */
 	enum audit_state    state, current_state;
 	unsigned int	    serial;     /* serial number for record */
 	int		    major;      /* syscall number */
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index eecc7b2e29a7..df26d0aa5e6d 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -920,11 +920,12 @@ static inline void audit_free_aux(struct audit_context *context)
 	}
 }
 
-static inline struct audit_context *audit_alloc_context(enum audit_state state)
+static inline struct audit_context *audit_alloc_context(enum audit_state state,
+							gfp_t gfpflags)
 {
 	struct audit_context *context;
 
-	context = kzalloc(sizeof(*context), GFP_KERNEL);
+	context = kzalloc(sizeof(*context), gfpflags);
 	if (!context)
 		return NULL;
 	context->state = state;
@@ -962,7 +963,8 @@ int audit_alloc_syscall(struct task_struct *tsk)
 		return 0;
 	}
 
-	if (!(context = audit_alloc_context(state))) {
+	context = audit_alloc_context(state, GFP_KERNEL);
+	if (!context) {
 		kfree(key);
 		audit_log_lost("out of memory in audit_alloc_syscall");
 		return -ENOMEM;
@@ -974,8 +976,26 @@ int audit_alloc_syscall(struct task_struct *tsk)
 	return 0;
 }
 
-static inline void audit_free_context(struct audit_context *context)
+struct audit_context *audit_alloc_local(gfp_t gfpflags)
 {
+	struct audit_context *context;
+
+	context = audit_alloc_context(AUDIT_RECORD_CONTEXT, gfpflags);
+	if (!context) {
+		audit_log_lost("out of memory in audit_alloc_local");
+		return NULL;
+	}
+	context->serial = audit_serial();
+	ktime_get_coarse_real_ts64(&context->ctime);
+	context->local = true;
+	return context;
+}
+EXPORT_SYMBOL(audit_alloc_local);
+
+void audit_free_context(struct audit_context *context)
+{
+	if (!context)
+		return;
 	audit_free_module(context);
 	audit_free_names(context);
 	unroll_tree_refs(context, NULL, 0);
@@ -986,6 +1006,7 @@ static inline void audit_free_context(struct audit_context *context)
 	audit_proctitle_free(context);
 	kfree(context);
 }
+EXPORT_SYMBOL(audit_free_context);
 
 static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 				 kuid_t auid, kuid_t uid, unsigned int sessionid,
@@ -2223,7 +2244,7 @@ EXPORT_SYMBOL_GPL(__audit_inode_child);
 int auditsc_get_stamp(struct audit_context *ctx,
 		       struct timespec64 *t, unsigned int *serial)
 {
-	if (!ctx->in_syscall)
+	if (!ctx->in_syscall && !ctx->local)
 		return 0;
 	if (!ctx->serial)
 		ctx->serial = audit_serial();
-- 
2.18.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


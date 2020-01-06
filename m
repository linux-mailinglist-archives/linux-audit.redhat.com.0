Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACA01317DE
	for <lists+linux-audit@lfdr.de>; Mon,  6 Jan 2020 19:57:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578337022;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=vXAund4ySCqxB29TiKUp64i94+uqsrdqpg6ro36VhKM=;
	b=NZb73fthiqEv5EshqOvUaK3qeOwQDuXaqtzMW1X7L8Ks4MEAKl0Ibn8HE/cokMVzFOo4kR
	76AuP1KxevVVggvdgHMUkpvXAfaximQB3Un7bykPlTT4fqOQihG38JKvJ5o590//fHhMG9
	whwWjzKswVi0HMYocoWw+/JH/hoe5hE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-wZesL-vOOBaDB-rbGXOSjw-1; Mon, 06 Jan 2020 13:56:23 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D4508BE425;
	Mon,  6 Jan 2020 18:56:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBC6D619E1;
	Mon,  6 Jan 2020 18:56:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2E2281C78;
	Mon,  6 Jan 2020 18:56:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006IuF2R027247 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 13:56:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 11A555DA70; Mon,  6 Jan 2020 18:56:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-34.phx2.redhat.com [10.3.112.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 023965D9E1;
	Mon,  6 Jan 2020 18:56:11 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak25 v2 8/9] netfilter: add audit operation field
Date: Mon,  6 Jan 2020 13:54:09 -0500
Message-Id: <6768f7c7d9804216853e6e9c59e44f8a10f46b99.1577830902.git.rgb@redhat.com>
In-Reply-To: <cover.1577830902.git.rgb@redhat.com>
References: <cover.1577830902.git.rgb@redhat.com>
In-Reply-To: <cover.1577830902.git.rgb@redhat.com>
References: <cover.1577830902.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, fw@strlen.de, ebiederm@xmission.com,
	twoerner@redhat.com, eparis@parisplace.org, tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: wZesL-vOOBaDB-rbGXOSjw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add the operation performed (register or replace) to the NETFILTER_CFG
record.

Here is the sample record:
      type=NETFILTER_CFG msg=audit(1494981627.248:9764): family=7 table=broute entries=0 op=replace

See: https://github.com/linux-audit/audit-kernel/issues/25
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 include/linux/audit.h           | 8 ++++----
 kernel/auditsc.c                | 7 ++++---
 net/bridge/netfilter/ebtables.c | 4 ++--
 net/netfilter/x_tables.c        | 3 ++-
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 96cabb095eed..5eab4d898c26 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -379,7 +379,7 @@ extern int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
 extern void __audit_fanotify(unsigned int response);
 extern void __audit_tk_injoffset(struct timespec64 offset);
 extern void __audit_ntp_log(const struct audit_ntp_data *ad);
-extern void __audit_nf_cfg(const char *name, u8 af, int nentries);
+extern void __audit_nf_cfg(const char *name, u8 af, int nentries, int op);
 
 static inline void audit_ipc_obj(struct kern_ipc_perm *ipcp)
 {
@@ -515,10 +515,10 @@ static inline void audit_ntp_log(const struct audit_ntp_data *ad)
 		__audit_ntp_log(ad);
 }
 
-static inline void audit_nf_cfg(const char *name, u8 af, int nentries)
+static inline void audit_nf_cfg(const char *name, u8 af, int nentries, int op)
 {
 	if (!audit_dummy_context())
-		__audit_nf_cfg(name, af, nentries);
+		__audit_nf_cfg(name, af, nentries, op);
 }
 
 extern int audit_n_rules;
@@ -654,7 +654,7 @@ static inline void audit_ntp_log(const struct audit_ntp_data *ad)
 static inline void audit_ptrace(struct task_struct *t)
 { }
 
-static inline void audit_nf_cfg(const char *name, u8 af, int nentries)
+static inline void audit_nf_cfg(const char *name, u8 af, int nentries, int op)
 { }
 
 #define audit_n_rules 0
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 4e1df4233cd3..999ac184246b 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2545,7 +2545,7 @@ void __audit_ntp_log(const struct audit_ntp_data *ad)
 	audit_log_ntp_val(ad, "adjust",	AUDIT_NTP_ADJUST);
 }
 
-void __audit_nf_cfg(const char *name, u8 af, int nentries)
+void __audit_nf_cfg(const char *name, u8 af, int nentries, int op)
 {
 	struct audit_buffer *ab;
 	struct audit_context *context = audit_context();
@@ -2555,8 +2555,9 @@ void __audit_nf_cfg(const char *name, u8 af, int nentries)
 	ab = audit_log_start(context, GFP_KERNEL, AUDIT_NETFILTER_CFG);
 	if (!ab)
 		return;	/* audit_panic or being filtered */
-	audit_log_format(ab, "table=%s family=%u entries=%u",
-			 name, af, nentries);
+	audit_log_format(ab, "table=%s family=%u entries=%u op=%s",
+			 name, af, nentries,
+			 op ? "replace" : "register");
 	audit_log_end(ab);
 }
 EXPORT_SYMBOL_GPL(__audit_nf_cfg);
diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtables.c
index 58126547b175..baff2f05af43 100644
--- a/net/bridge/netfilter/ebtables.c
+++ b/net/bridge/netfilter/ebtables.c
@@ -1049,7 +1049,7 @@ static int do_replace_finish(struct net *net, struct ebt_replace *repl,
 	vfree(counterstmp);
 
 	if (audit_enabled)
-		audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries);
+		audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries, 1);
 	return ret;
 
 free_unlock:
@@ -1220,7 +1220,7 @@ int ebt_register_table(struct net *net, const struct ebt_table *input_table,
 	}
 
 	if (audit_enabled)
-		audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries);
+		audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries, 0);
 	return ret;
 free_unlock:
 	mutex_unlock(&ebt_mutex);
diff --git a/net/netfilter/x_tables.c b/net/netfilter/x_tables.c
index c0416ae52f7f..4ae4f7bf8946 100644
--- a/net/netfilter/x_tables.c
+++ b/net/netfilter/x_tables.c
@@ -1402,7 +1402,8 @@ struct xt_table_info *xt_replace_table(struct xt_table *table,
 	}
 
 	if (audit_enabled)
-		audit_nf_cfg(table->name, table->af, private->number);
+		audit_nf_cfg(table->name, table->af, private->number,
+			     private->number);
 
 	return private;
 }
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


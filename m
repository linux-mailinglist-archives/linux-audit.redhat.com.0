Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CAAA71317D7
	for <lists+linux-audit@lfdr.de>; Mon,  6 Jan 2020 19:55:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578336934;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=mmyZbKaD0m3WqNsKvNVGa8V8lJZKqp9vJ+0UfhWjp18=;
	b=fuCF7TJiRU78n8aVn3TUPAZGceoyuOF1fGeoIvzfj1GeuoTXMAlPk57AdvFvCx/BJ3LHT7
	uzrX7Tvel3+8xLGN+dkM7RmDIICi1YDk7vI2SCpPXwSJw1KbtE+DZWusSLP5EPQz1w+a6V
	kMUX2NodFTGn475RyDXObBuq8NJlP+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-D_S9FaMWM1uAC7eDXtYWlA-1; Mon, 06 Jan 2020 13:55:33 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC6AD1883537;
	Mon,  6 Jan 2020 18:55:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B29F27C37D;
	Mon,  6 Jan 2020 18:55:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C7CF81C76;
	Mon,  6 Jan 2020 18:55:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006ItOc8027042 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 13:55:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2382C5DA70; Mon,  6 Jan 2020 18:55:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-34.phx2.redhat.com [10.3.112.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 890FD5DA81;
	Mon,  6 Jan 2020 18:54:59 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak25 v2 4/9] audit: record nfcfg params
Date: Mon,  6 Jan 2020 13:54:05 -0500
Message-Id: <b1b2e6f917816c4ae85b53d7f93c10c3d1df4a53.1577830902.git.rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: D_S9FaMWM1uAC7eDXtYWlA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Record the auditable parameters of any non-empty netfilter table
configuration change.

See: https://github.com/linux-audit/audit-kernel/issues/25
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 include/linux/audit.h | 11 +++++++++++
 kernel/auditsc.c      | 16 ++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index f9ceae57ca8d..96cabb095eed 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -379,6 +379,7 @@ extern int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
 extern void __audit_fanotify(unsigned int response);
 extern void __audit_tk_injoffset(struct timespec64 offset);
 extern void __audit_ntp_log(const struct audit_ntp_data *ad);
+extern void __audit_nf_cfg(const char *name, u8 af, int nentries);
 
 static inline void audit_ipc_obj(struct kern_ipc_perm *ipcp)
 {
@@ -514,6 +515,12 @@ static inline void audit_ntp_log(const struct audit_ntp_data *ad)
 		__audit_ntp_log(ad);
 }
 
+static inline void audit_nf_cfg(const char *name, u8 af, int nentries)
+{
+	if (!audit_dummy_context())
+		__audit_nf_cfg(name, af, nentries);
+}
+
 extern int audit_n_rules;
 extern int audit_signals;
 #else /* CONFIG_AUDITSYSCALL */
@@ -646,6 +653,10 @@ static inline void audit_ntp_log(const struct audit_ntp_data *ad)
 
 static inline void audit_ptrace(struct task_struct *t)
 { }
+
+static inline void audit_nf_cfg(const char *name, u8 af, int nentries)
+{ }
+
 #define audit_n_rules 0
 #define audit_signals 0
 #endif /* CONFIG_AUDITSYSCALL */
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 4effe01ebbe2..4e1df4233cd3 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2545,6 +2545,22 @@ void __audit_ntp_log(const struct audit_ntp_data *ad)
 	audit_log_ntp_val(ad, "adjust",	AUDIT_NTP_ADJUST);
 }
 
+void __audit_nf_cfg(const char *name, u8 af, int nentries)
+{
+	struct audit_buffer *ab;
+	struct audit_context *context = audit_context();
+
+	if (!nentries)
+		return;
+	ab = audit_log_start(context, GFP_KERNEL, AUDIT_NETFILTER_CFG);
+	if (!ab)
+		return;	/* audit_panic or being filtered */
+	audit_log_format(ab, "table=%s family=%u entries=%u",
+			 name, af, nentries);
+	audit_log_end(ab);
+}
+EXPORT_SYMBOL_GPL(__audit_nf_cfg);
+
 static void audit_log_task(struct audit_buffer *ab)
 {
 	kuid_t auid, uid;
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


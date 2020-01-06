Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 593821317DC
	for <lists+linux-audit@lfdr.de>; Mon,  6 Jan 2020 19:56:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578336991;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=52QGoUEAs3TrikmaTfDTPywQ8sdrWkZcqvTBuni13TE=;
	b=J4hsWwV/lZH1tAoFQd5M9/zc0qLVFPcgmjh88kMJhzlW6hTonx2U5/k80LtD1dWJOhXNDn
	IYMKlW8kGntvIkyG30GdiscgbP418JTOUzgqvNZ7R5vGaHIjQCfj4OOT14BlEVPv7tV8vX
	S+Pt1J28YnsJrDtZwYfEUpK7OJ9T4AQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-tnuGXiGaOGCG0Lk4OD858A-1; Mon, 06 Jan 2020 13:56:29 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAA031800D53;
	Mon,  6 Jan 2020 18:56:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A51BC60CC0;
	Mon,  6 Jan 2020 18:56:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67C381803C32;
	Mon,  6 Jan 2020 18:56:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006IuKYA027274 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 13:56:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CC4945DA2C; Mon,  6 Jan 2020 18:56:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-34.phx2.redhat.com [10.3.112.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7B165D9E1;
	Mon,  6 Jan 2020 18:56:15 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak25 v2 9/9] netfilter: audit table unregister actions
Date: Mon,  6 Jan 2020 13:54:10 -0500
Message-Id: <65974a7254dffe53b5084bedfd60c95a29a41e08.1577830902.git.rgb@redhat.com>
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
X-MC-Unique: tnuGXiGaOGCG0Lk4OD858A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Audit the action of unregistering ebtables and x_tables.

See: https://github.com/linux-audit/audit-kernel/issues/44
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 kernel/auditsc.c                | 3 ++-
 net/bridge/netfilter/ebtables.c | 3 +++
 net/netfilter/x_tables.c        | 4 +++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 999ac184246b..2644130a9e66 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2557,7 +2557,8 @@ void __audit_nf_cfg(const char *name, u8 af, int nentries, int op)
 		return;	/* audit_panic or being filtered */
 	audit_log_format(ab, "table=%s family=%u entries=%u op=%s",
 			 name, af, nentries,
-			 op ? "replace" : "register");
+			 op == 1 ? "replace" :
+				   (op ? "unregister" : "register"));
 	audit_log_end(ab);
 }
 EXPORT_SYMBOL_GPL(__audit_nf_cfg);
diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtables.c
index baff2f05af43..3dd4eb5b13fd 100644
--- a/net/bridge/netfilter/ebtables.c
+++ b/net/bridge/netfilter/ebtables.c
@@ -1126,6 +1126,9 @@ static void __ebt_unregister_table(struct net *net, struct ebt_table *table)
 	mutex_lock(&ebt_mutex);
 	list_del(&table->list);
 	mutex_unlock(&ebt_mutex);
+	if (audit_enabled)
+		audit_nf_cfg(table->name, AF_BRIDGE, table->private->nentries,
+			     2);
 	EBT_ENTRY_ITERATE(table->private->entries, table->private->entries_size,
 			  ebt_cleanup_entry, net, NULL);
 	if (table->private->nentries)
diff --git a/net/netfilter/x_tables.c b/net/netfilter/x_tables.c
index 4ae4f7bf8946..e4852a0cb62f 100644
--- a/net/netfilter/x_tables.c
+++ b/net/netfilter/x_tables.c
@@ -1403,7 +1403,7 @@ struct xt_table_info *xt_replace_table(struct xt_table *table,
 
 	if (audit_enabled)
 		audit_nf_cfg(table->name, table->af, private->number,
-			     private->number);
+			     !!private->number);
 
 	return private;
 }
@@ -1466,6 +1466,8 @@ void *xt_unregister_table(struct xt_table *table)
 	private = table->private;
 	list_del(&table->list);
 	mutex_unlock(&xt[table->af].mutex);
+	if (audit_enabled)
+		audit_nf_cfg(table->name, table->af, private->number, 2);
 	kfree(table);
 
 	return private;
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


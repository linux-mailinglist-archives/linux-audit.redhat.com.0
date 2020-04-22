Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE5F1B4F82
	for <lists+linux-audit@lfdr.de>; Wed, 22 Apr 2020 23:41:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587591692;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=D7txWTMMb6Oj7aUDYjsgdvrscYQHd9gPTQxIPdR68Lk=;
	b=iOOG+8M6SmIWnVZPZfvIU4kfxbsdOyGLPkCVK2xOS85jJtFGz3BE3ZoOxZY1k37k4Jz+Fq
	4mQUwKgfm13NwBs8wYsKCCnF7o6NJiIRF5087hIjRkPuDIlNaIhC2ZoUrbc8Wg2S+u5KLl
	x0uxfvnNmg1bGO2m620Ye6G5lhF/s5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-DTZsUfPJO2O505mWFgQlAA-1; Wed, 22 Apr 2020 17:41:30 -0400
X-MC-Unique: DTZsUfPJO2O505mWFgQlAA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CA2DDBA9;
	Wed, 22 Apr 2020 21:41:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5640C5C290;
	Wed, 22 Apr 2020 21:41:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 134DA1809541;
	Wed, 22 Apr 2020 21:41:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03MLeVkl009683 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 17:40:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 374FE5D716; Wed, 22 Apr 2020 21:40:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F90B5D710;
	Wed, 22 Apr 2020 21:40:16 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak25 v4 2/3] netfilter: add audit table unregister actions
Date: Wed, 22 Apr 2020 17:39:29 -0400
Message-Id: <e75f9c91a251278979182f0181d3595d3bb3b2b8.1587500467.git.rgb@redhat.com>
In-Reply-To: <cover.1587500467.git.rgb@redhat.com>
References: <cover.1587500467.git.rgb@redhat.com>
In-Reply-To: <cover.1587500467.git.rgb@redhat.com>
References: <cover.1587500467.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Audit the action of unregistering ebtables and x_tables.

See: https://github.com/linux-audit/audit-kernel/issues/44
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 include/linux/audit.h           | 1 +
 kernel/auditsc.c                | 5 +++--
 net/bridge/netfilter/ebtables.c | 2 ++
 net/netfilter/x_tables.c        | 2 ++
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 5c7f07a9776d..1a2351508211 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -97,6 +97,7 @@ struct audit_ntp_data {
 enum audit_nfcfgop {
 	AUDIT_XT_OP_REGISTER,
 	AUDIT_XT_OP_REPLACE,
+	AUDIT_XT_OP_UNREGISTER,
 };
 
 extern int is_audit_feature_set(int which);
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 705beac0ce29..d281c18d1771 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -136,8 +136,9 @@ struct audit_nfcfgop_tab {
 };
 
 const struct audit_nfcfgop_tab audit_nfcfgs[] = {
-	{ AUDIT_XT_OP_REGISTER,	"register"	},
-	{ AUDIT_XT_OP_REPLACE,	"replace"	},
+	{ AUDIT_XT_OP_REGISTER,		"register"	},
+	{ AUDIT_XT_OP_REPLACE,		"replace"	},
+	{ AUDIT_XT_OP_UNREGISTER,	"unregister"	},
 };
 
 static int audit_match_perm(struct audit_context *ctx, int mask)
diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtables.c
index 0a148e68b6e1..4778db5601b0 100644
--- a/net/bridge/netfilter/ebtables.c
+++ b/net/bridge/netfilter/ebtables.c
@@ -1124,6 +1124,8 @@ static void __ebt_unregister_table(struct net *net, struct ebt_table *table)
 	mutex_lock(&ebt_mutex);
 	list_del(&table->list);
 	mutex_unlock(&ebt_mutex);
+	audit_log_nfcfg(table->name, AF_BRIDGE, table->private->nentries,
+			AUDIT_XT_OP_UNREGISTER);
 	EBT_ENTRY_ITERATE(table->private->entries, table->private->entries_size,
 			  ebt_cleanup_entry, net, NULL);
 	if (table->private->nentries)
diff --git a/net/netfilter/x_tables.c b/net/netfilter/x_tables.c
index 8f8c5dbf603d..99a468be4a59 100644
--- a/net/netfilter/x_tables.c
+++ b/net/netfilter/x_tables.c
@@ -1472,6 +1472,8 @@ void *xt_unregister_table(struct xt_table *table)
 	private = table->private;
 	list_del(&table->list);
 	mutex_unlock(&xt[table->af].mutex);
+	audit_log_nfcfg(table->name, table->af, private->number,
+			AUDIT_XT_OP_UNREGISTER);
 	kfree(table);
 
 	return private;
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id DABA8189064
	for <lists+linux-audit@lfdr.de>; Tue, 17 Mar 2020 22:31:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584480702;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=qPP8LJg3J7CPibopiE95uq8eWe2fAaF97jOe+X3ztkQ=;
	b=jJ3ksKBJfsEN9EEkrxCq9XLqSgxrvGXgU3gayq2JLhi+HXJ8+NnLMpE/PiJzmSMFi5IXq4
	siAKZI0bNmlu91LiG0HMs86BP5aJv0EDRyC8s9FRWBuPI4B7tqT0+5p3fBJ0Dh1DVVuFN5
	gCLcxE458voS1LXcgFdxISmnkzHo4CE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-39ssiAHYMOeCLuK-58cvLg-1; Tue, 17 Mar 2020 17:31:40 -0400
X-MC-Unique: 39ssiAHYMOeCLuK-58cvLg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F06B218C35A1;
	Tue, 17 Mar 2020 21:31:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB3057E32A;
	Tue, 17 Mar 2020 21:31:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74D9E18089CD;
	Tue, 17 Mar 2020 21:31:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02HLVXPt019392 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Mar 2020 17:31:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3760819756; Tue, 17 Mar 2020 21:31:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.36.110.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C0DA19C58;
	Tue, 17 Mar 2020 21:31:21 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak25 v3 2/3] netfilter: add audit table unregister actions
Date: Tue, 17 Mar 2020 17:30:23 -0400
Message-Id: <1715b217352ea7c920e97308cef59306ab63dd88.1584480281.git.rgb@redhat.com>
In-Reply-To: <cover.1584480281.git.rgb@redhat.com>
References: <cover.1584480281.git.rgb@redhat.com>
In-Reply-To: <cover.1584480281.git.rgb@redhat.com>
References: <cover.1584480281.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
index f4aed2b9be8d..17427c41cc29 100644
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
index f4e342125dd9..dbb056feccb9 100644
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
index 55f9409c3ee0..b3a2e6ea516c 100644
--- a/net/bridge/netfilter/ebtables.c
+++ b/net/bridge/netfilter/ebtables.c
@@ -1124,6 +1124,8 @@ static void __ebt_unregister_table(struct net *net, struct ebt_table *table)
 	mutex_lock(&ebt_mutex);
 	list_del(&table->list);
 	mutex_unlock(&ebt_mutex);
+	audit_log_nfcfg(table->name, AF_BRIDGE, table->private->nentries,
+		        AUDIT_XT_OP_UNREGISTER);
 	EBT_ENTRY_ITERATE(table->private->entries, table->private->entries_size,
 			  ebt_cleanup_entry, net, NULL);
 	if (table->private->nentries)
diff --git a/net/netfilter/x_tables.c b/net/netfilter/x_tables.c
index db5cbcf43748..e43720a7783b 100644
--- a/net/netfilter/x_tables.c
+++ b/net/netfilter/x_tables.c
@@ -1472,6 +1472,8 @@ void *xt_unregister_table(struct xt_table *table)
 	private = table->private;
 	list_del(&table->list);
 	mutex_unlock(&xt[table->af].mutex);
+	audit_log_nfcfg(table->name, table->af, private->number,
+		        AUDIT_XT_OP_UNREGISTER);
 	kfree(table);
 
 	return private;
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


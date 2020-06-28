Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5246B20C58F
	for <lists+linux-audit@lfdr.de>; Sun, 28 Jun 2020 05:25:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593314736;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yEH1PZPClEK2EIMYYmJ8uqWeoeVJz0nzrf087hINc9o=;
	b=bLfSPheIfCTdUdzyyk1fzP9zECOMEIWmv4VTnCIYcO83DhlmRf74pVsDqjp/gu2WKWVD9U
	M4OzuNaDOmMegUg2Ak7h6E8jPiiMnCXLbsDRVj08BGJG9eQBlfbRnuLZ5S3N3ecaYEZiN4
	mBTgtknqjSerqQLBwshwcp6Va4loGtM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490--ihqV6bXP7OTRbcEX1vtlg-1; Sat, 27 Jun 2020 23:25:33 -0400
X-MC-Unique: -ihqV6bXP7OTRbcEX1vtlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E468A1883607;
	Sun, 28 Jun 2020 03:25:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 759C790342;
	Sun, 28 Jun 2020 03:25:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE6C2833DC;
	Sun, 28 Jun 2020 03:25:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05S3OwMU024379 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 23:24:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF5C85D9E7; Sun, 28 Jun 2020 03:24:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D83D5D9CD;
	Sun, 28 Jun 2020 03:24:49 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak124 v3fix] audit: add gfp parameter to audit_log_nfcfg
Date: Sat, 27 Jun 2020 23:24:19 -0400
Message-Id: <3eda864fb69977252a061c8c3ccd2d8fcd1f3a9b.1593278952.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, fw@strlen.de, twoerner@redhat.com,
	eparis@parisplace.org, tgraf@infradead.org, dan.carpenter@oracle.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fixed an inconsistent use of GFP flags in nft_obj_notify() that used
GFP_KERNEL when a GFP flag was passed in to that function.  Given this
allocated memory was then used in audit_log_nfcfg() it led to an audit
of all other GFP allocations in net/netfilter/nf_tables_api.c and a
modification of audit_log_nfcfg() to accept a GFP parameter.

Reported-by: Dan Carptenter <dan.carpenter@oracle.com>
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
Passes audit-testsuite.

 include/linux/audit.h           |  8 ++++----
 kernel/auditsc.c                |  4 ++--
 net/bridge/netfilter/ebtables.c |  6 +++---
 net/netfilter/nf_tables_api.c   | 33 +++++++++++++++++++++------------
 net/netfilter/x_tables.c        |  5 +++--
 5 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 604ede630580..d93739f7a35a 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -404,7 +404,7 @@ extern int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
 extern void __audit_tk_injoffset(struct timespec64 offset);
 extern void __audit_ntp_log(const struct audit_ntp_data *ad);
 extern void __audit_log_nfcfg(const char *name, u8 af, unsigned int nentries,
-			      enum audit_nfcfgop op);
+			      enum audit_nfcfgop op, gfp_t gfp);
 
 static inline void audit_ipc_obj(struct kern_ipc_perm *ipcp)
 {
@@ -542,10 +542,10 @@ static inline void audit_ntp_log(const struct audit_ntp_data *ad)
 
 static inline void audit_log_nfcfg(const char *name, u8 af,
 				   unsigned int nentries,
-				   enum audit_nfcfgop op)
+				   enum audit_nfcfgop op, gfp_t gfp)
 {
 	if (audit_enabled)
-		__audit_log_nfcfg(name, af, nentries, op);
+		__audit_log_nfcfg(name, af, nentries, op, gfp);
 }
 
 extern int audit_n_rules;
@@ -683,7 +683,7 @@ static inline void audit_ptrace(struct task_struct *t)
 
 static inline void audit_log_nfcfg(const char *name, u8 af,
 				   unsigned int nentries,
-				   enum audit_nfcfgop op)
+				   enum audit_nfcfgop op, gfp_t gfp)
 { }
 
 #define audit_n_rules 0
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 3a9100e95fda..eae1a599ffe3 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2572,12 +2572,12 @@ void __audit_ntp_log(const struct audit_ntp_data *ad)
 }
 
 void __audit_log_nfcfg(const char *name, u8 af, unsigned int nentries,
-		       enum audit_nfcfgop op)
+		       enum audit_nfcfgop op, gfp_t gfp)
 {
 	struct audit_buffer *ab;
 	char comm[sizeof(current->comm)];
 
-	ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_NETFILTER_CFG);
+	ab = audit_log_start(audit_context(), gfp, AUDIT_NETFILTER_CFG);
 	if (!ab)
 		return;
 	audit_log_format(ab, "table=%s family=%u entries=%u op=%s",
diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtables.c
index c83ffe912163..b13b49b9f75c 100644
--- a/net/bridge/netfilter/ebtables.c
+++ b/net/bridge/netfilter/ebtables.c
@@ -1047,7 +1047,7 @@ static int do_replace_finish(struct net *net, struct ebt_replace *repl,
 	vfree(counterstmp);
 
 	audit_log_nfcfg(repl->name, AF_BRIDGE, repl->nentries,
-			AUDIT_XT_OP_REPLACE);
+			AUDIT_XT_OP_REPLACE, GFP_KERNEL);
 	return ret;
 
 free_unlock:
@@ -1123,7 +1123,7 @@ static void __ebt_unregister_table(struct net *net, struct ebt_table *table)
 	list_del(&table->list);
 	mutex_unlock(&ebt_mutex);
 	audit_log_nfcfg(table->name, AF_BRIDGE, table->private->nentries,
-			AUDIT_XT_OP_UNREGISTER);
+			AUDIT_XT_OP_UNREGISTER, GFP_KERNEL);
 	EBT_ENTRY_ITERATE(table->private->entries, table->private->entries_size,
 			  ebt_cleanup_entry, net, NULL);
 	if (table->private->nentries)
@@ -1218,7 +1218,7 @@ int ebt_register_table(struct net *net, const struct ebt_table *input_table,
 	}
 
 	audit_log_nfcfg(repl->name, AF_BRIDGE, repl->nentries,
-			AUDIT_XT_OP_REGISTER);
+			AUDIT_XT_OP_REGISTER, GFP_KERNEL);
 	return ret;
 free_unlock:
 	mutex_unlock(&ebt_mutex);
diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
index 164700273947..f7ff91479647 100644
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ -702,7 +702,8 @@ static void nf_tables_table_notify(const struct nft_ctx *ctx, int event)
 			ctx->table->use,
 			event == NFT_MSG_NEWTABLE ?
 				AUDIT_NFT_OP_TABLE_REGISTER :
-				AUDIT_NFT_OP_TABLE_UNREGISTER);
+				AUDIT_NFT_OP_TABLE_UNREGISTER,
+			GFP_KERNEL);
 	kfree(buf);
 
 	if (!ctx->report &&
@@ -1448,7 +1449,8 @@ static void nf_tables_chain_notify(const struct nft_ctx *ctx, int event)
 			ctx->chain->use,
 			event == NFT_MSG_NEWCHAIN ?
 				AUDIT_NFT_OP_CHAIN_REGISTER :
-				AUDIT_NFT_OP_CHAIN_UNREGISTER);
+				AUDIT_NFT_OP_CHAIN_UNREGISTER,
+			GFP_KERNEL);
 	kfree(buf);
 
 	if (!ctx->report &&
@@ -2724,7 +2726,8 @@ static void nf_tables_rule_notify(const struct nft_ctx *ctx,
 			rule->handle,
 			event == NFT_MSG_NEWRULE ?
 				AUDIT_NFT_OP_RULE_REGISTER :
-				AUDIT_NFT_OP_RULE_UNREGISTER);
+				AUDIT_NFT_OP_RULE_UNREGISTER,
+			GFP_KERNEL);
 	kfree(buf);
 
 	if (!ctx->report &&
@@ -3737,7 +3740,8 @@ static void nf_tables_set_notify(const struct nft_ctx *ctx,
 			set->field_count,
 			event == NFT_MSG_NEWSET ?
 				AUDIT_NFT_OP_SET_REGISTER :
-				AUDIT_NFT_OP_SET_UNREGISTER);
+				AUDIT_NFT_OP_SET_UNREGISTER,
+			gfp_flags);
 	kfree(buf);
 
 	if (!ctx->report &&
@@ -4864,7 +4868,8 @@ static void nf_tables_setelem_notify(const struct nft_ctx *ctx,
 			set->handle,
 			event == NFT_MSG_NEWSETELEM ?
 				AUDIT_NFT_OP_SETELEM_REGISTER :
-				AUDIT_NFT_OP_SETELEM_UNREGISTER);
+				AUDIT_NFT_OP_SETELEM_UNREGISTER,
+			GFP_KERNEL);
 	kfree(buf);
 
 	if (!ctx->report && !nfnetlink_has_listeners(net, NFNLGRP_NFTABLES))
@@ -5956,7 +5961,8 @@ static int nf_tables_dump_obj(struct sk_buff *skb, struct netlink_callback *cb)
 				audit_log_nfcfg(buf,
 						family,
 						obj->handle,
-						AUDIT_NFT_OP_OBJ_RESET);
+						AUDIT_NFT_OP_OBJ_RESET,
+						GFP_KERNEL);
 				kfree(buf);
 			}
 
@@ -6071,13 +6077,14 @@ static int nf_tables_getobj(struct net *net, struct sock *nlsk,
 		reset = true;
 
 	if (reset) {
-		char *buf = kasprintf(GFP_KERNEL, "%s:%llu;?:0",
+		char *buf = kasprintf(GFP_ATOMIC, "%s:%llu;?:0",
 				      table->name, table->handle);
 
 		audit_log_nfcfg(buf,
 				family,
 				obj->handle,
-				AUDIT_NFT_OP_OBJ_RESET);
+				AUDIT_NFT_OP_OBJ_RESET,
+				GFP_KERNEL);
 		kfree(buf);
 	}
 
@@ -6156,7 +6163,7 @@ void nft_obj_notify(struct net *net, const struct nft_table *table,
 {
 	struct sk_buff *skb;
 	int err;
-	char *buf = kasprintf(GFP_KERNEL, "%s:%llu;?:0",
+	char *buf = kasprintf(gfp, "%s:%llu;?:0",
 			      table->name, table->handle);
 
 	audit_log_nfcfg(buf,
@@ -6164,7 +6171,8 @@ void nft_obj_notify(struct net *net, const struct nft_table *table,
 			obj->handle,
 			event == NFT_MSG_NEWOBJ ?
 				AUDIT_NFT_OP_OBJ_REGISTER :
-				AUDIT_NFT_OP_OBJ_UNREGISTER);
+				AUDIT_NFT_OP_OBJ_UNREGISTER,
+			GFP_KERNEL);
 	kfree(buf);
 
 	if (!report &&
@@ -6954,7 +6962,8 @@ static void nf_tables_flowtable_notify(struct nft_ctx *ctx,
 			flowtable->hooknum,
 			event == NFT_MSG_NEWFLOWTABLE ?
 				AUDIT_NFT_OP_FLOWTABLE_REGISTER :
-				AUDIT_NFT_OP_FLOWTABLE_UNREGISTER);
+				AUDIT_NFT_OP_FLOWTABLE_UNREGISTER,
+			GFP_KERNEL);
 	kfree(buf);
 
 	if (ctx->report &&
@@ -7078,7 +7087,7 @@ static void nf_tables_gen_notify(struct net *net, struct sk_buff *skb,
 	int err;
 
 	audit_log_nfcfg("?:0;?:0", 0, net->nft.base_seq,
-			AUDIT_NFT_OP_GEN_REGISTER);
+			AUDIT_NFT_OP_GEN_REGISTER, GFP_KERNEL);
 
 	if (nlmsg_report(nlh) &&
 	    !nfnetlink_has_listeners(net, NFNLGRP_NFTABLES))
diff --git a/net/netfilter/x_tables.c b/net/netfilter/x_tables.c
index 99a468be4a59..9ad8f3ff66f5 100644
--- a/net/netfilter/x_tables.c
+++ b/net/netfilter/x_tables.c
@@ -1410,7 +1410,8 @@ struct xt_table_info *
 
 	audit_log_nfcfg(table->name, table->af, private->number,
 			!private->number ? AUDIT_XT_OP_REGISTER :
-					   AUDIT_XT_OP_REPLACE);
+					   AUDIT_XT_OP_REPLACE,
+			GFP_KERNEL);
 	return private;
 }
 EXPORT_SYMBOL_GPL(xt_replace_table);
@@ -1473,7 +1474,7 @@ void *xt_unregister_table(struct xt_table *table)
 	list_del(&table->list);
 	mutex_unlock(&xt[table->af].mutex);
 	audit_log_nfcfg(table->name, table->af, private->number,
-			AUDIT_XT_OP_UNREGISTER);
+			AUDIT_XT_OP_UNREGISTER, GFP_KERNEL);
 	kfree(table);
 
 	return private;
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 84C4E1E4492
	for <lists+linux-audit@lfdr.de>; Wed, 27 May 2020 15:54:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590587659;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RDre7p7EQnW9dfvrwn4Q+BAgjoWS/kwNBTskgblo/zU=;
	b=NKKwNKxc8Wh7fTPsrusCnJuWUP9yTv+0PC63Kwl+05RNuJI3crz+LkjoFRPBOLYel7Kvv+
	N3AgswXaA5pIhS6wrM6irk2VNhu1zpQCnn00isHCF8atiAj3pwM+5BpmvHAaEmW4/yHfvG
	MbaaQNk3/A2v9KkWuDWOQKav4VSsyLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-RnuOMqzZM_SIuT_Q1gO96g-1; Wed, 27 May 2020 09:54:17 -0400
X-MC-Unique: RnuOMqzZM_SIuT_Q1gO96g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C5B981E22B;
	Wed, 27 May 2020 13:54:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C0A85C1C5;
	Wed, 27 May 2020 13:54:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DDF971809541;
	Wed, 27 May 2020 13:54:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04RDs3iZ017971 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 09:54:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 185B9100238D; Wed, 27 May 2020 13:54:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 920CB1001268;
	Wed, 27 May 2020 13:53:54 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak124 v1] audit: log nftables configuration change events
Date: Wed, 27 May 2020 09:53:31 -0400
Message-Id: <d92a718b54269f426acc18f28e561031da66d3ca.1590579994.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, fw@strlen.de, twoerner@redhat.com,
	eparis@parisplace.org, tgraf@infradead.org
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

iptables, ip6tables, arptables and ebtables table registration,
replacement and unregistration configuration events are logged for the
native (legacy) iptables setsockopt api, but not for the
nftables netlink api which is used by the nft-variant of iptables in
addition to nftables itself.

Add calls to log the configuration actions in the nftables netlink api.

This uses the same NETFILTER_CFG record format.

For further information please see issue
https://github.com/linux-audit/audit-kernel/issues/124

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
This is an RFC patch.
Note: I have questions about the "entries" count.  Is there a more
appropriate or relevant item to report here?
Note: It might make sense to differentiate in the op= field that this
was a legacy call vs an nft call.  At the moment, legacy calls overlap
with nft table calls, which are similar calls.

 include/linux/audit.h         |  7 +++++++
 kernel/auditsc.c              | 12 +++++++++---
 net/netfilter/nf_tables_api.c | 14 ++++++++++++++
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 3fcd9ee49734..b10f54103a82 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -12,6 +12,7 @@
 #include <linux/sched.h>
 #include <linux/ptrace.h>
 #include <uapi/linux/audit.h>
+#include <uapi/linux/netfilter/nf_tables.h>
 
 #define AUDIT_INO_UNSET ((unsigned long)-1)
 #define AUDIT_DEV_UNSET ((dev_t)-1)
@@ -98,6 +99,12 @@ enum audit_nfcfgop {
 	AUDIT_XT_OP_REGISTER,
 	AUDIT_XT_OP_REPLACE,
 	AUDIT_XT_OP_UNREGISTER,
+	AUDIT_XT_OP_CHAIN_REGISTER	= NFT_MSG_NEWCHAIN,
+	AUDIT_XT_OP_CHAIN_NOOP		= NFT_MSG_GETCHAIN,
+	AUDIT_XT_OP_CHAIN_UNREGISTER	= NFT_MSG_DELCHAIN,
+	AUDIT_XT_OP_RULE_REGISTER	= NFT_MSG_NEWRULE,
+	AUDIT_XT_OP_RULE_NOOP		= NFT_MSG_GETRULE,
+	AUDIT_XT_OP_RULE_UNREGISTER	= NFT_MSG_DELRULE,
 };
 
 extern int is_audit_feature_set(int which);
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 468a23390457..eedce8fa4067 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -136,9 +136,15 @@ struct audit_nfcfgop_tab {
 };
 
 static const struct audit_nfcfgop_tab audit_nfcfgs[] = {
-	{ AUDIT_XT_OP_REGISTER,		"register"	},
-	{ AUDIT_XT_OP_REPLACE,		"replace"	},
-	{ AUDIT_XT_OP_UNREGISTER,	"unregister"	},
+	{ AUDIT_XT_OP_REGISTER,		"register"		},
+	{ AUDIT_XT_OP_REPLACE,		"replace"		},
+	{ AUDIT_XT_OP_UNREGISTER,	"unregister"		},
+	{ AUDIT_XT_OP_CHAIN_REGISTER,	"register_chain"	},
+	{ AUDIT_XT_OP_CHAIN_NOOP,	"noop_chain"		},
+	{ AUDIT_XT_OP_CHAIN_UNREGISTER,	"unregister_chain"	},
+	{ AUDIT_XT_OP_RULE_REGISTER,	"register_rule"		},
+	{ AUDIT_XT_OP_RULE_NOOP,	"noop_rule"		},
+	{ AUDIT_XT_OP_RULE_UNREGISTER,	"unregister_rule"	},
 };
 
 static int audit_match_perm(struct audit_context *ctx, int mask)
diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
index 4471393da6d8..c8dc954685f2 100644
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ -12,6 +12,7 @@
 #include <linux/netlink.h>
 #include <linux/vmalloc.h>
 #include <linux/rhashtable.h>
+#include <linux/audit.h>
 #include <linux/netfilter.h>
 #include <linux/netfilter/nfnetlink.h>
 #include <linux/netfilter/nf_tables.h>
@@ -7344,6 +7345,19 @@ static int nf_tables_commit(struct net *net, struct sk_buff *skb)
 	list_for_each_entry_safe(trans, next, &net->nft.commit_list, list) {
 		switch (trans->msg_type) {
 		case NFT_MSG_NEWTABLE:
+		case NFT_MSG_DELTABLE:
+		case NFT_MSG_NEWCHAIN:
+		case NFT_MSG_DELCHAIN:
+		case NFT_MSG_NEWRULE:
+		case NFT_MSG_DELRULE:
+			audit_log_nfcfg(trans->ctx.table->name,
+					trans->ctx.family,
+					atomic_read(&trans->ctx.table->chains_ht.ht.nelems),
+					trans->msg_type);
+			break;
+		}
+		switch (trans->msg_type) {
+		case NFT_MSG_NEWTABLE:
 			if (nft_trans_table_update(trans)) {
 				if (!nft_trans_table_enable(trans)) {
 					nf_tables_table_disable(net,
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


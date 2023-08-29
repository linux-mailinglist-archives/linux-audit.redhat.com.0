Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8270778CBFE
	for <lists+linux-audit@lfdr.de>; Tue, 29 Aug 2023 20:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693333473;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NBBbDB80mjj9zVere9CflJTGWYLU2Ao4QXwCW9xUUfo=;
	b=ghAQX1V46taSyV1hNfpq9rMi939F56mirr9te0L+2M/fWGfM6Ik3B+xgq3Cz+DjkK+92Qu
	NCYW2xXLh51HdMyzBETzSEAkaak2TK246dnusv0tHclv9DtPwbQntktaUEEI9l4iLpaH5X
	1HNlRgX6IAVtLZRw7G1Cinc509dgv3E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-R27vl70wPCCznGTqulhR7g-1; Tue, 29 Aug 2023 14:24:30 -0400
X-MC-Unique: R27vl70wPCCznGTqulhR7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2FE080602D;
	Tue, 29 Aug 2023 18:24:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F535140E950;
	Tue, 29 Aug 2023 18:24:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 130921946A6C;
	Tue, 29 Aug 2023 18:24:20 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DBCF019465A0 for <linux-audit@listman.corp.redhat.com>;
 Tue, 29 Aug 2023 18:04:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BD0304021C9; Tue, 29 Aug 2023 18:04:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5AB6401051
 for <linux-audit@redhat.com>; Tue, 29 Aug 2023 18:04:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B036185A792
 for <linux-audit@redhat.com>; Tue, 29 Aug 2023 18:04:35 +0000 (UTC)
Received: from orbyte.nwl.cc (orbyte.nwl.cc [151.80.46.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-260-dkBd3BmWPHy41RnkXdPitQ-1; Tue,
 29 Aug 2023 14:04:33 -0400
X-MC-Unique: dkBd3BmWPHy41RnkXdPitQ-1
Received: from localhost ([::1] helo=xic)
 by orbyte.nwl.cc with esmtp (Exim 4.94.2)
 (envelope-from <phil@nwl.cc>)
 id 1qb2n3-000467-IQ; Tue, 29 Aug 2023 19:46:09 +0200
From: Phil Sutter <phil@nwl.cc>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [nf PATCH 2/2] netfilter: nf_tables: Audit log rule reset
Date: Tue, 29 Aug 2023 19:51:58 +0200
Message-ID: <20230829175158.20202-2-phil@nwl.cc>
In-Reply-To: <20230829175158.20202-1-phil@nwl.cc>
References: <20230829175158.20202-1-phil@nwl.cc>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:24:19 +0000
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
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com,
 netfilter-devel@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: nwl.cc
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Resetting rules' stateful data happens outside of the transaction logic,
so 'get' and 'dump' handlers have to emit audit log entries themselves.

Cc: Richard Guy Briggs <rgb@redhat.com>
Fixes: 8daa8fde3fc3f ("netfilter: nf_tables: Introduce NFT_MSG_GETRULE_RESET")
Signed-off-by: Phil Sutter <phil@nwl.cc>
---
 include/linux/audit.h         |  1 +
 kernel/auditsc.c              |  1 +
 net/netfilter/nf_tables_api.c | 18 ++++++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 192bf03aacc52..51b1b7054a233 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -118,6 +118,7 @@ enum audit_nfcfgop {
 	AUDIT_NFT_OP_FLOWTABLE_REGISTER,
 	AUDIT_NFT_OP_FLOWTABLE_UNREGISTER,
 	AUDIT_NFT_OP_SETELEM_RESET,
+	AUDIT_NFT_OP_RULE_RESET,
 	AUDIT_NFT_OP_INVALID,
 };
 
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 38481e3181975..fc0c7c03eeabe 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -144,6 +144,7 @@ static const struct audit_nfcfgop_tab audit_nfcfgs[] = {
 	{ AUDIT_NFT_OP_FLOWTABLE_REGISTER,	"nft_register_flowtable"   },
 	{ AUDIT_NFT_OP_FLOWTABLE_UNREGISTER,	"nft_unregister_flowtable" },
 	{ AUDIT_NFT_OP_SETELEM_RESET,		"nft_reset_setelem"        },
+	{ AUDIT_NFT_OP_RULE_RESET,		"nft_reset_rule"           },
 	{ AUDIT_NFT_OP_INVALID,			"nft_invalid"		   },
 };
 
diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
index a1218ea4e0c3d..2aa7b9a55cca4 100644
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ -3432,6 +3432,18 @@ static void nf_tables_rule_notify(const struct nft_ctx *ctx,
 	nfnetlink_set_err(ctx->net, ctx->portid, NFNLGRP_NFTABLES, -ENOBUFS);
 }
 
+static void audit_log_rule_reset(const struct nft_table *table,
+				 unsigned int base_seq,
+				 unsigned int nentries)
+{
+	char *buf = kasprintf(GFP_ATOMIC, "%s:%u",
+			      table->name, base_seq);
+
+	audit_log_nfcfg(buf, table->family, nentries,
+			AUDIT_NFT_OP_RULE_RESET, GFP_ATOMIC);
+	kfree(buf);
+}
+
 struct nft_rule_dump_ctx {
 	char *table;
 	char *chain;
@@ -3538,6 +3550,9 @@ static int nf_tables_dump_rules(struct sk_buff *skb,
 done:
 	rcu_read_unlock();
 
+	if (reset && idx > cb->args[0])
+		audit_log_rule_reset(table, cb->seq, idx - cb->args[0]);
+
 	cb->args[0] = idx;
 	return skb->len;
 }
@@ -3645,6 +3660,9 @@ static int nf_tables_getrule(struct sk_buff *skb, const struct nfnl_info *info,
 	if (err < 0)
 		goto err_fill_rule_info;
 
+	if (reset)
+		audit_log_rule_reset(table, nft_pernet(net)->base_seq, 1);
+
 	return nfnetlink_unicast(skb2, net, NETLINK_CB(skb).portid);
 
 err_fill_rule_info:
-- 
2.41.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


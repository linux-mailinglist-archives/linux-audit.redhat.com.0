Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DFA78CBFF
	for <lists+linux-audit@lfdr.de>; Tue, 29 Aug 2023 20:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693333473;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bzVufygy1pifqeGUWjbLRpN3k2n2dA9DzHh1CGU+cjo=;
	b=ST+vLykab0vtaLJrN0LtPJjeSBOSqSds70RgmeMoH7W4LyPOr+6Z+zofBRtW0oSKelrxvB
	GYoiMXtAASQEe4yBOQIsmV+qkw5W5MkYc0ElPnyPp2i32y9pJnZuUr5s3z1/CfcHPNSrxa
	kZKbHW3SQq8S4Z95SVufLvDTlOiOe34=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-aoRQOOk-PWmmwa47k0mmfA-1; Tue, 29 Aug 2023 14:24:30 -0400
X-MC-Unique: aoRQOOk-PWmmwa47k0mmfA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A319D2808B20;
	Tue, 29 Aug 2023 18:24:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE41A492C14;
	Tue, 29 Aug 2023 18:24:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 34B8A19452C8;
	Tue, 29 Aug 2023 18:24:20 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A107D19465A0 for <linux-audit@listman.corp.redhat.com>;
 Tue, 29 Aug 2023 18:04:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 82CD0402D90; Tue, 29 Aug 2023 18:04:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BC46401051
 for <linux-audit@redhat.com>; Tue, 29 Aug 2023 18:04:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6036B185A78F
 for <linux-audit@redhat.com>; Tue, 29 Aug 2023 18:04:39 +0000 (UTC)
Received: from orbyte.nwl.cc (orbyte.nwl.cc [151.80.46.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-277-HEYOGXziM-WbfIu_cFzEWw-1; Tue,
 29 Aug 2023 14:04:37 -0400
X-MC-Unique: HEYOGXziM-WbfIu_cFzEWw-1
Received: from localhost ([::1] helo=xic)
 by orbyte.nwl.cc with esmtp (Exim 4.94.2)
 (envelope-from <phil@nwl.cc>)
 id 1qb2n3-000463-75; Tue, 29 Aug 2023 19:46:09 +0200
From: Phil Sutter <phil@nwl.cc>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [nf PATCH 1/2] netfilter: nf_tables: Audit log setelem reset
Date: Tue, 29 Aug 2023 19:51:57 +0200
Message-ID: <20230829175158.20202-1-phil@nwl.cc>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: nwl.cc
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since set element reset is not integrated into nf_tables' transaction
logic, an explicit log call is needed, similar to NFT_MSG_GETOBJ_RESET
handling.

For the sake of simplicity, catchall element reset will always generate
a dedicated log entry. This relieves nf_tables_dump_set() from having to
adjust the logged element count depending on whether a catchall element
was found or not.

Cc: Richard Guy Briggs <rgb@redhat.com>
Fixes: 079cd633219d7 ("netfilter: nf_tables: Introduce NFT_MSG_GETSETELEM_RESET")
Signed-off-by: Phil Sutter <phil@nwl.cc>
---
 include/linux/audit.h         |  1 +
 kernel/auditsc.c              |  1 +
 net/netfilter/nf_tables_api.c | 31 ++++++++++++++++++++++++++++---
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 6a3a9e122bb5e..192bf03aacc52 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -117,6 +117,7 @@ enum audit_nfcfgop {
 	AUDIT_NFT_OP_OBJ_RESET,
 	AUDIT_NFT_OP_FLOWTABLE_REGISTER,
 	AUDIT_NFT_OP_FLOWTABLE_UNREGISTER,
+	AUDIT_NFT_OP_SETELEM_RESET,
 	AUDIT_NFT_OP_INVALID,
 };
 
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index addeed3df15d3..38481e3181975 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -143,6 +143,7 @@ static const struct audit_nfcfgop_tab audit_nfcfgs[] = {
 	{ AUDIT_NFT_OP_OBJ_RESET,		"nft_reset_obj"		   },
 	{ AUDIT_NFT_OP_FLOWTABLE_REGISTER,	"nft_register_flowtable"   },
 	{ AUDIT_NFT_OP_FLOWTABLE_UNREGISTER,	"nft_unregister_flowtable" },
+	{ AUDIT_NFT_OP_SETELEM_RESET,		"nft_reset_setelem"        },
 	{ AUDIT_NFT_OP_INVALID,			"nft_invalid"		   },
 };
 
diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
index 1ddbdca4e47d6..a1218ea4e0c3d 100644
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ -102,6 +102,7 @@ static const u8 nft2audit_op[NFT_MSG_MAX] = { // enum nf_tables_msg_types
 	[NFT_MSG_NEWFLOWTABLE]	= AUDIT_NFT_OP_FLOWTABLE_REGISTER,
 	[NFT_MSG_GETFLOWTABLE]	= AUDIT_NFT_OP_INVALID,
 	[NFT_MSG_DELFLOWTABLE]	= AUDIT_NFT_OP_FLOWTABLE_UNREGISTER,
+	[NFT_MSG_GETSETELEM_RESET] = AUDIT_NFT_OP_SETELEM_RESET,
 };
 
 static void nft_validate_state_update(struct nft_table *table, u8 new_validate_state)
@@ -5661,13 +5662,25 @@ static int nf_tables_dump_setelem(const struct nft_ctx *ctx,
 	return nf_tables_fill_setelem(args->skb, set, elem, args->reset);
 }
 
+static void audit_log_nft_set_reset(const struct nft_table *table,
+				    unsigned int base_seq,
+				    unsigned int nentries)
+{
+	char *buf = kasprintf(GFP_ATOMIC, "%s:%u", table->name, base_seq);
+
+	audit_log_nfcfg(buf, table->family, nentries,
+			AUDIT_NFT_OP_SETELEM_RESET, GFP_ATOMIC);
+	kfree(buf);
+}
+
 struct nft_set_dump_ctx {
 	const struct nft_set	*set;
 	struct nft_ctx		ctx;
 };
 
 static int nft_set_catchall_dump(struct net *net, struct sk_buff *skb,
-				 const struct nft_set *set, bool reset)
+				 const struct nft_set *set, bool reset,
+				 unsigned int base_seq)
 {
 	struct nft_set_elem_catchall *catchall;
 	u8 genmask = nft_genmask_cur(net);
@@ -5683,6 +5696,8 @@ static int nft_set_catchall_dump(struct net *net, struct sk_buff *skb,
 
 		elem.priv = catchall->elem;
 		ret = nf_tables_fill_setelem(skb, set, &elem, reset);
+		if (reset && !ret)
+			audit_log_nft_set_reset(set->table, base_seq, 1);
 		break;
 	}
 
@@ -5762,12 +5777,17 @@ static int nf_tables_dump_set(struct sk_buff *skb, struct netlink_callback *cb)
 	set->ops->walk(&dump_ctx->ctx, set, &args.iter);
 
 	if (!args.iter.err && args.iter.count == cb->args[0])
-		args.iter.err = nft_set_catchall_dump(net, skb, set, reset);
+		args.iter.err = nft_set_catchall_dump(net, skb, set,
+						      reset, cb->seq);
 	rcu_read_unlock();
 
 	nla_nest_end(skb, nest);
 	nlmsg_end(skb, nlh);
 
+	if (reset && args.iter.count > args.iter.skip)
+		audit_log_nft_set_reset(table, cb->seq,
+					args.iter.count - args.iter.skip);
+
 	if (args.iter.err && args.iter.err != -EMSGSIZE)
 		return args.iter.err;
 	if (args.iter.count == cb->args[0])
@@ -5992,13 +6012,13 @@ static int nf_tables_getsetelem(struct sk_buff *skb,
 	struct netlink_ext_ack *extack = info->extack;
 	u8 genmask = nft_genmask_cur(info->net);
 	u8 family = info->nfmsg->nfgen_family;
+	int rem, err = 0, nelems = 0;
 	struct net *net = info->net;
 	struct nft_table *table;
 	struct nft_set *set;
 	struct nlattr *attr;
 	struct nft_ctx ctx;
 	bool reset = false;
-	int rem, err = 0;
 
 	table = nft_table_lookup(net, nla[NFTA_SET_ELEM_LIST_TABLE], family,
 				 genmask, 0);
@@ -6041,8 +6061,13 @@ static int nf_tables_getsetelem(struct sk_buff *skb,
 			NL_SET_BAD_ATTR(extack, attr);
 			break;
 		}
+		nelems++;
 	}
 
+	if (reset)
+		audit_log_nft_set_reset(table, nft_pernet(net)->base_seq,
+					nelems);
+
 	return err;
 }
 
-- 
2.41.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


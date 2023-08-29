Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B7A78CC53
	for <lists+linux-audit@lfdr.de>; Tue, 29 Aug 2023 20:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693334700;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZvU3bmgtwIIbmdc56k8J74ajnyiqjfFo9BBAyG6svCQ=;
	b=BIThrevEoAP3XrMozM9J7LydoyHZe+U7lb61hCTNXgCo9A4zUm1vB5q0izwNDJ4BPugHyR
	V+BupkHJIWP3dgELbHO2knXRgq6XguPWe7Cyfw5w5tB4D7U7yY6bFYLN13buqgh6aMjQic
	hyh6nBwFS0OouF+RlxirrI/pI0QnPp4=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-qWWKqmG8NaOAQIq6iAgAww-1; Tue, 29 Aug 2023 14:44:57 -0400
X-MC-Unique: qWWKqmG8NaOAQIq6iAgAww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F6173C1392D;
	Tue, 29 Aug 2023 18:44:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C52B40C2063;
	Tue, 29 Aug 2023 18:44:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7CCBC1946A45;
	Tue, 29 Aug 2023 18:44:53 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8054C1946594 for <linux-audit@listman.corp.redhat.com>;
 Tue, 29 Aug 2023 18:31:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6977F63F6C; Tue, 29 Aug 2023 18:31:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6252D1678B
 for <linux-audit@redhat.com>; Tue, 29 Aug 2023 18:31:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 362CF101A53C
 for <linux-audit@redhat.com>; Tue, 29 Aug 2023 18:31:05 +0000 (UTC)
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-278-DkopbDcPOjKEOTFHMOeTWw-1; Tue,
 29 Aug 2023 14:23:22 -0400
X-MC-Unique: DkopbDcPOjKEOTFHMOeTWw-1
Received: from [78.30.34.192] (port=38596 helo=gnumonks.org)
 by ganesha.gnumonks.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <pablo@gnumonks.org>)
 id 1qb33I-00FkzH-Gj; Tue, 29 Aug 2023 20:02:59 +0200
Date: Tue, 29 Aug 2023 20:02:55 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Phil Sutter <phil@nwl.cc>
Subject: Re: [nf PATCH 2/2] netfilter: nf_tables: Audit log rule reset
Message-ID: <ZO4yz9ZgrgyzDIWs@calendula>
References: <20230829175158.20202-1-phil@nwl.cc>
 <20230829175158.20202-2-phil@nwl.cc>
MIME-Version: 1.0
In-Reply-To: <20230829175158.20202-2-phil@nwl.cc>
X-Spam-Score: -1.8 (-)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:44:52 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: netfilter.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 29, 2023 at 07:51:58PM +0200, Phil Sutter wrote:
> Resetting rules' stateful data happens outside of the transaction logic,
> so 'get' and 'dump' handlers have to emit audit log entries themselves.
> 
> Cc: Richard Guy Briggs <rgb@redhat.com>
> Fixes: 8daa8fde3fc3f ("netfilter: nf_tables: Introduce NFT_MSG_GETRULE_RESET")
> Signed-off-by: Phil Sutter <phil@nwl.cc>
> ---
>  include/linux/audit.h         |  1 +
>  kernel/auditsc.c              |  1 +
>  net/netfilter/nf_tables_api.c | 18 ++++++++++++++++++
>  3 files changed, 20 insertions(+)
> 
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index 192bf03aacc52..51b1b7054a233 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -118,6 +118,7 @@ enum audit_nfcfgop {
>  	AUDIT_NFT_OP_FLOWTABLE_REGISTER,
>  	AUDIT_NFT_OP_FLOWTABLE_UNREGISTER,
>  	AUDIT_NFT_OP_SETELEM_RESET,
> +	AUDIT_NFT_OP_RULE_RESET,
>  	AUDIT_NFT_OP_INVALID,
>  };
>  
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 38481e3181975..fc0c7c03eeabe 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -144,6 +144,7 @@ static const struct audit_nfcfgop_tab audit_nfcfgs[] = {
>  	{ AUDIT_NFT_OP_FLOWTABLE_REGISTER,	"nft_register_flowtable"   },
>  	{ AUDIT_NFT_OP_FLOWTABLE_UNREGISTER,	"nft_unregister_flowtable" },
>  	{ AUDIT_NFT_OP_SETELEM_RESET,		"nft_reset_setelem"        },
> +	{ AUDIT_NFT_OP_RULE_RESET,		"nft_reset_rule"           },
>  	{ AUDIT_NFT_OP_INVALID,			"nft_invalid"		   },
>  };
>  
> diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
> index a1218ea4e0c3d..2aa7b9a55cca4 100644
> --- a/net/netfilter/nf_tables_api.c
> +++ b/net/netfilter/nf_tables_api.c
> @@ -3432,6 +3432,18 @@ static void nf_tables_rule_notify(const struct nft_ctx *ctx,
>  	nfnetlink_set_err(ctx->net, ctx->portid, NFNLGRP_NFTABLES, -ENOBUFS);
>  }
>  
> +static void audit_log_rule_reset(const struct nft_table *table,
> +				 unsigned int base_seq,
> +				 unsigned int nentries)
> +{
> +	char *buf = kasprintf(GFP_ATOMIC, "%s:%u",
> +			      table->name, base_seq);

No check for NULL.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


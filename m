Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 87D4320739D
	for <lists+linux-audit@lfdr.de>; Wed, 24 Jun 2020 14:44:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593002640;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8ql+kqtEeAYJt4ttrqglWIZI4rB3iNXrgwpLEJ2gzlw=;
	b=KlO4EL4iCiWLPqlXydSCCmRn7cs59VL+kxsdDrWZ/ufBM0IQqsGq8Awx+oD7Ui1290Ujho
	mC1bb73kqkTJr0gCtaH0Rbt5fti7OnkndYejvu2GjJSkRrrWFIiJoQXmfmGo7UWxib9w5l
	z8VGi8lNtqlHYYAjK7GeYM9+q5NpYzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-T8xHD7pdMbWHxcPqX7V0EA-1; Wed, 24 Jun 2020 08:43:57 -0400
X-MC-Unique: T8xHD7pdMbWHxcPqX7V0EA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F24A2CCC;
	Wed, 24 Jun 2020 12:43:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F64A1017CCB;
	Wed, 24 Jun 2020 12:43:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E44FC1809554;
	Wed, 24 Jun 2020 12:43:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05OA9Qtt018561 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 06:09:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 459A7DBF29; Wed, 24 Jun 2020 10:09:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4028CBA140
	for <linux-audit@redhat.com>; Wed, 24 Jun 2020 10:09:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DC65108C26B
	for <linux-audit@redhat.com>; Wed, 24 Jun 2020 10:09:24 +0000 (UTC)
Received: from mail.us.es (correo.us.es [193.147.175.20]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-176-eyCTs-XTOEqoUtG42V9Mpg-1;
	Wed, 24 Jun 2020 06:09:19 -0400
X-MC-Unique: eyCTs-XTOEqoUtG42V9Mpg-1
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
	by mail.us.es (Postfix) with ESMTP id 1FBCC1C022F
	for <linux-audit@redhat.com>; Wed, 24 Jun 2020 12:03:53 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
	by antivirus1-rhel7.int (Postfix) with ESMTP id 0E812DA84B
	for <linux-audit@redhat.com>; Wed, 24 Jun 2020 12:03:53 +0200 (CEST)
Received: by antivirus1-rhel7.int (Postfix, from userid 99)
	id 0C5A5DA844; Wed, 24 Jun 2020 12:03:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on antivirus1-rhel7.int
X-Spam-Level: 
X-Spam-Status: No, score=-108.2 required=7.5 tests=ALL_TRUSTED,BAYES_50,
	SMTPAUTH_US2,USER_IN_WHITELIST autolearn=disabled version=3.4.1
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
	by antivirus1-rhel7.int (Postfix) with ESMTP id 13876DA850;
	Wed, 24 Jun 2020 12:03:47 +0200 (CEST)
Received: from 192.168.1.97 (192.168.1.97)
	by antivirus1-rhel7.int (F-Secure/fsigk_smtp/550/antivirus1-rhel7.int); 
	Wed, 24 Jun 2020 12:03:47 +0200 (CEST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/antivirus1-rhel7.int)
Received: from us.es (unknown [90.77.255.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: 1984lsi)
	by entrada.int (Postfix) with ESMTPSA id CE5A742EF42D;
	Wed, 24 Jun 2020 12:03:46 +0200 (CEST)
Date: Wed, 24 Jun 2020 12:03:46 +0200
X-SMTPAUTHUS: auth mail.us.es
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20200624100346.GA11986@salvia>
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 24 Jun 2020 08:43:47 -0400
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jun 04, 2020 at 09:20:49AM -0400, Richard Guy Briggs wrote:
> iptables, ip6tables, arptables and ebtables table registration,
> replacement and unregistration configuration events are logged for the
> native (legacy) iptables setsockopt api, but not for the
> nftables netlink api which is used by the nft-variant of iptables in
> addition to nftables itself.
> 
> Add calls to log the configuration actions in the nftables netlink api.
> 
> This uses the same NETFILTER_CFG record format but overloads the table
> field.
> 
>   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.878:162) : table=?:0;?:0 family=unspecified entries=2 op=nft_register_gen pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
>   ...
>   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.878:162) : table=firewalld:1;?:0 family=inet entries=0 op=nft_register_table pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
>   ...
>   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.911:163) : table=firewalld:1;filter_FORWARD:85 family=inet entries=8 op=nft_register_chain pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
>   ...
>   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.911:163) : table=firewalld:1;filter_FORWARD:85 family=inet entries=101 op=nft_register_rule pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
>   ...
>   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.911:163) : table=firewalld:1;__set0:87 family=inet entries=87 op=nft_register_setelem pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
>   ...
>   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.911:163) : table=firewalld:1;__set0:87 family=inet entries=0 op=nft_register_set pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
> 
> For further information please see issue
> https://github.com/linux-audit/audit-kernel/issues/124
> 
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> Changelog:
> v3:
> - inline message type rather than table
> 
> v2:
> - differentiate between xtables and nftables
> - add set, setelem, obj, flowtable, gen
> - use nentries field as appropriate per type
> - overload the "tables" field with table handle and chain/set/flowtable
> 
>  include/linux/audit.h         |  18 ++++++++
>  kernel/auditsc.c              |  24 ++++++++--
>  net/netfilter/nf_tables_api.c | 103 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 142 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index 3fcd9ee49734..604ede630580 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -12,6 +12,7 @@
>  #include <linux/sched.h>
>  #include <linux/ptrace.h>
>  #include <uapi/linux/audit.h>
> +#include <uapi/linux/netfilter/nf_tables.h>
>  
>  #define AUDIT_INO_UNSET ((unsigned long)-1)
>  #define AUDIT_DEV_UNSET ((dev_t)-1)
> @@ -98,6 +99,23 @@ enum audit_nfcfgop {
>  	AUDIT_XT_OP_REGISTER,
>  	AUDIT_XT_OP_REPLACE,
>  	AUDIT_XT_OP_UNREGISTER,
> +	AUDIT_NFT_OP_TABLE_REGISTER,
> +	AUDIT_NFT_OP_TABLE_UNREGISTER,
> +	AUDIT_NFT_OP_CHAIN_REGISTER,
> +	AUDIT_NFT_OP_CHAIN_UNREGISTER,
> +	AUDIT_NFT_OP_RULE_REGISTER,
> +	AUDIT_NFT_OP_RULE_UNREGISTER,
> +	AUDIT_NFT_OP_SET_REGISTER,
> +	AUDIT_NFT_OP_SET_UNREGISTER,
> +	AUDIT_NFT_OP_SETELEM_REGISTER,
> +	AUDIT_NFT_OP_SETELEM_UNREGISTER,
> +	AUDIT_NFT_OP_GEN_REGISTER,
> +	AUDIT_NFT_OP_OBJ_REGISTER,
> +	AUDIT_NFT_OP_OBJ_UNREGISTER,
> +	AUDIT_NFT_OP_OBJ_RESET,
> +	AUDIT_NFT_OP_FLOWTABLE_REGISTER,
> +	AUDIT_NFT_OP_FLOWTABLE_UNREGISTER,
> +	AUDIT_NFT_OP_INVALID,
>  };
>  
>  extern int is_audit_feature_set(int which);
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 468a23390457..3a9100e95fda 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -75,6 +75,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/fsnotify_backend.h>
>  #include <uapi/linux/limits.h>
> +#include <uapi/linux/netfilter/nf_tables.h>
>  
>  #include "audit.h"
>  
> @@ -136,9 +137,26 @@ struct audit_nfcfgop_tab {
>  };
>  
>  static const struct audit_nfcfgop_tab audit_nfcfgs[] = {
> -	{ AUDIT_XT_OP_REGISTER,		"register"	},
> -	{ AUDIT_XT_OP_REPLACE,		"replace"	},
> -	{ AUDIT_XT_OP_UNREGISTER,	"unregister"	},
> +	{ AUDIT_XT_OP_REGISTER,			"xt_register"		   },
> +	{ AUDIT_XT_OP_REPLACE,			"xt_replace"		   },
> +	{ AUDIT_XT_OP_UNREGISTER,		"xt_unregister"		   },
> +	{ AUDIT_NFT_OP_TABLE_REGISTER,		"nft_register_table"	   },
> +	{ AUDIT_NFT_OP_TABLE_UNREGISTER,	"nft_unregister_table"	   },
> +	{ AUDIT_NFT_OP_CHAIN_REGISTER,		"nft_register_chain"	   },
> +	{ AUDIT_NFT_OP_CHAIN_UNREGISTER,	"nft_unregister_chain"	   },
> +	{ AUDIT_NFT_OP_RULE_REGISTER,		"nft_register_rule"	   },
> +	{ AUDIT_NFT_OP_RULE_UNREGISTER,		"nft_unregister_rule"	   },
> +	{ AUDIT_NFT_OP_SET_REGISTER,		"nft_register_set"	   },
> +	{ AUDIT_NFT_OP_SET_UNREGISTER,		"nft_unregister_set"	   },
> +	{ AUDIT_NFT_OP_SETELEM_REGISTER,	"nft_register_setelem"	   },
> +	{ AUDIT_NFT_OP_SETELEM_UNREGISTER,	"nft_unregister_setelem"   },
> +	{ AUDIT_NFT_OP_GEN_REGISTER,		"nft_register_gen"	   },
> +	{ AUDIT_NFT_OP_OBJ_REGISTER,		"nft_register_obj"	   },
> +	{ AUDIT_NFT_OP_OBJ_UNREGISTER,		"nft_unregister_obj"	   },
> +	{ AUDIT_NFT_OP_OBJ_RESET,		"nft_reset_obj"		   },
> +	{ AUDIT_NFT_OP_FLOWTABLE_REGISTER,	"nft_register_flowtable"   },
> +	{ AUDIT_NFT_OP_FLOWTABLE_UNREGISTER,	"nft_unregister_flowtable" },
> +	{ AUDIT_NFT_OP_INVALID,			"nft_invalid"		   },
>  };
>  
>  static int audit_match_perm(struct audit_context *ctx, int mask)
> diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
> index 3558e76e2733..b9e7440cc87d 100644
> --- a/net/netfilter/nf_tables_api.c
> +++ b/net/netfilter/nf_tables_api.c
> @@ -12,6 +12,7 @@
>  #include <linux/netlink.h>
>  #include <linux/vmalloc.h>
>  #include <linux/rhashtable.h>
> +#include <linux/audit.h>
>  #include <linux/netfilter.h>
>  #include <linux/netfilter/nfnetlink.h>
>  #include <linux/netfilter/nf_tables.h>
> @@ -693,6 +694,16 @@ static void nf_tables_table_notify(const struct nft_ctx *ctx, int event)
>  {
>  	struct sk_buff *skb;
>  	int err;
> +	char *buf = kasprintf(GFP_KERNEL, "%s:%llu;?:0",
> +			      ctx->table->name, ctx->table->handle);
> +
> +	audit_log_nfcfg(buf,
> +			ctx->family,
> +			ctx->table->use,
> +			event == NFT_MSG_NEWTABLE ?
> +				AUDIT_NFT_OP_TABLE_REGISTER :
> +				AUDIT_NFT_OP_TABLE_UNREGISTER);
> +	kfree(buf);

As a follow up: Would you wrap this code into a function?

        nft_table_audit()

Same thing for other pieces of code below.

Thanks.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


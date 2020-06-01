Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F2EFE1EA797
	for <lists+linux-audit@lfdr.de>; Mon,  1 Jun 2020 18:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591027880;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QeRFrGf+BuhKIsZsDr+2301b04f4UaWu1ZuAzu+tosg=;
	b=HAypTjix7iVocV4ZEV01QXoeo7GrAs7HWgNrvvXrGWakrpF114O7tk1gxXCdm1x3Q8m/9c
	JwzYj/9j/xqk7xoeCdeKkjAOJRCLXhe0dsJ6V05amNZvEZ1lHeJLOaWItiHfKi/Jc/IWOf
	nxlOL9BmAZsb7p5tGIL6mPnZQiWFhL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-XNC_KuydNZ-LlenjAEn30g-1; Mon, 01 Jun 2020 12:11:17 -0400
X-MC-Unique: XNC_KuydNZ-LlenjAEn30g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C0D8107ACCD;
	Mon,  1 Jun 2020 16:11:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B50F7E7F8;
	Mon,  1 Jun 2020 16:11:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E09A61809543;
	Mon,  1 Jun 2020 16:11:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 051GB22H000384 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 12:11:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D41E2026E04; Mon,  1 Jun 2020 16:11:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 033782026D67
	for <linux-audit@redhat.com>; Mon,  1 Jun 2020 16:10:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D4D282883A
	for <linux-audit@redhat.com>; Mon,  1 Jun 2020 16:10:59 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-512-w4eT9P65O9a6S5K-J0Zz_Q-1; Mon, 01 Jun 2020 12:10:56 -0400
X-MC-Unique: w4eT9P65O9a6S5K-J0Zz_Q-1
Received: by mail-ed1-f66.google.com with SMTP id q13so7699408edi.3
	for <linux-audit@redhat.com>; Mon, 01 Jun 2020 09:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Dn6K/A6SOW5qp++Ne9R7n/L/wKzu+p7tdfVTCOgRLg4=;
	b=APXdWKqYyl/4yiAjVmxWif0/bIQ2itK3RBtI9YGlWPUkUPEsrlqFW//GU697duJ9Os
	0UqVRBylKFrc2WB9Clxn/lU71nrG0vj7uozu1Itzp8bfxApKubtsAhsnoeLaE/DqgzoJ
	Hd8gujpZBRdKE0Xfap3ygdnnInDrK4N40z9Et5gkG94KlNp6pwqHhAuaCuT7Met08jNJ
	gSYdJyQlv7vq4cRos3NoMnW5aLiBzTIb3iQzVjaBADKe9U4BmS8SnzoFAXCshJPOXuJJ
	UIYQJPx6rXP2QsG3ifKTPjWVrdAOdX6ei0kN7lcaUIJCypXz5m5LCtANYO8LmFzdUDRD
	S11Q==
X-Gm-Message-State: AOAM531S0LIDqxn/PqZ5gSO3rTWzFWbOx4Zz+eVcVA32NGSWZZ4CmvtB
	K2TIH5yw0ZOKlEricNtKxKIf3l99COTbXZdYWV94
X-Google-Smtp-Source: ABdhPJw0YGU7YpCPl4+mz0a5HpLGEK8yte+ZULn6acU99QRLVVFth/COQs0HMh94/jcRdM+Bwg0d73vVeRaenEekmkU=
X-Received: by 2002:aa7:de08:: with SMTP id h8mr21832614edv.164.1591027855515; 
	Mon, 01 Jun 2020 09:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <d45d23ba6d58b1513c641dfb24f009cbc1b7aad6.1590716354.git.rgb@redhat.com>
In-Reply-To: <d45d23ba6d58b1513c641dfb24f009cbc1b7aad6.1590716354.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 1 Jun 2020 12:10:44 -0400
Message-ID: <CAHC9VhTuUdc565fPU=P1sXEM8hFm5P+ESm3Bv=kyebb19EsQuQ@mail.gmail.com>
Subject: Re: [PATCH ghak124 v2] audit: log nftables configuration change events
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	Eric Paris <eparis@parisplace.org>, tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 28, 2020 at 9:44 PM Richard Guy Briggs <rgb@redhat.com> wrote:
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
> v2:
> - differentiate between xtables and nftables
> - add set, setelem, obj, flowtable, gen
> - use nentries field as appropriate per type
> - overload the "tables" field with table handle and chain/set/flowtable
>
>  include/linux/audit.h         | 52 +++++++++++++++++++++++++
>  kernel/auditsc.c              | 24 ++++++++++--
>  net/netfilter/nf_tables_api.c | 89 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 162 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index 3fcd9ee49734..d79866a38505 100644
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
> @@ -98,6 +99,57 @@ enum audit_nfcfgop {
>         AUDIT_XT_OP_REGISTER,
>         AUDIT_XT_OP_REPLACE,
>         AUDIT_XT_OP_UNREGISTER,
> +       AUDIT_NFT_OP_TABLE_REGISTER,
> +       AUDIT_NFT_OP_TABLE_UNREGISTER,
> +       AUDIT_NFT_OP_CHAIN_REGISTER,
> +       AUDIT_NFT_OP_CHAIN_UNREGISTER,
> +       AUDIT_NFT_OP_RULE_REGISTER,
> +       AUDIT_NFT_OP_RULE_UNREGISTER,
> +       AUDIT_NFT_OP_SET_REGISTER,
> +       AUDIT_NFT_OP_SET_UNREGISTER,
> +       AUDIT_NFT_OP_SETELEM_REGISTER,
> +       AUDIT_NFT_OP_SETELEM_UNREGISTER,
> +       AUDIT_NFT_OP_GEN_REGISTER,
> +       AUDIT_NFT_OP_OBJ_REGISTER,
> +       AUDIT_NFT_OP_OBJ_UNREGISTER,
> +       AUDIT_NFT_OP_OBJ_RESET,
> +       AUDIT_NFT_OP_FLOWTABLE_REGISTER,
> +       AUDIT_NFT_OP_FLOWTABLE_UNREGISTER,
> +       AUDIT_NFT_OP_INVALID,
> +};
> +
> +struct audit_nftcfgop_tab {
> +       enum nf_tables_msg_types        nftop;
> +       enum audit_nfcfgop              op;
> +};
> +
> +static const struct audit_nftcfgop_tab audit_nftcfgs[] = {
> +       { NFT_MSG_NEWTABLE,     AUDIT_NFT_OP_TABLE_REGISTER             },
> +       { NFT_MSG_GETTABLE,     AUDIT_NFT_OP_INVALID                    },
> +       { NFT_MSG_DELTABLE,     AUDIT_NFT_OP_TABLE_UNREGISTER           },
> +       { NFT_MSG_NEWCHAIN,     AUDIT_NFT_OP_CHAIN_REGISTER             },
> +       { NFT_MSG_GETCHAIN,     AUDIT_NFT_OP_INVALID                    },
> +       { NFT_MSG_DELCHAIN,     AUDIT_NFT_OP_CHAIN_UNREGISTER           },
> +       { NFT_MSG_NEWRULE,      AUDIT_NFT_OP_RULE_REGISTER              },
> +       { NFT_MSG_GETRULE,      AUDIT_NFT_OP_INVALID                    },
> +       { NFT_MSG_DELRULE,      AUDIT_NFT_OP_RULE_UNREGISTER            },
> +       { NFT_MSG_NEWSET,       AUDIT_NFT_OP_SET_REGISTER               },
> +       { NFT_MSG_GETSET,       AUDIT_NFT_OP_INVALID                    },
> +       { NFT_MSG_DELSET,       AUDIT_NFT_OP_SET_UNREGISTER             },
> +       { NFT_MSG_NEWSETELEM,   AUDIT_NFT_OP_SETELEM_REGISTER           },
> +       { NFT_MSG_GETSETELEM,   AUDIT_NFT_OP_INVALID                    },
> +       { NFT_MSG_DELSETELEM,   AUDIT_NFT_OP_SETELEM_UNREGISTER         },
> +       { NFT_MSG_NEWGEN,       AUDIT_NFT_OP_GEN_REGISTER               },
> +       { NFT_MSG_GETGEN,       AUDIT_NFT_OP_INVALID                    },
> +       { NFT_MSG_TRACE,        AUDIT_NFT_OP_INVALID                    },
> +       { NFT_MSG_NEWOBJ,       AUDIT_NFT_OP_OBJ_REGISTER               },
> +       { NFT_MSG_GETOBJ,       AUDIT_NFT_OP_INVALID                    },
> +       { NFT_MSG_DELOBJ,       AUDIT_NFT_OP_OBJ_UNREGISTER             },
> +       { NFT_MSG_GETOBJ_RESET, AUDIT_NFT_OP_OBJ_RESET                  },
> +       { NFT_MSG_NEWFLOWTABLE, AUDIT_NFT_OP_FLOWTABLE_REGISTER         },
> +       { NFT_MSG_GETFLOWTABLE, AUDIT_NFT_OP_INVALID                    },
> +       { NFT_MSG_DELFLOWTABLE, AUDIT_NFT_OP_FLOWTABLE_UNREGISTER       },
> +       { NFT_MSG_MAX,          AUDIT_NFT_OP_INVALID                    },
>  };

I didn't check every "op" defined above to match with the changes in
nf_tables_api.c, but is there a reason why we can't simply hardcode
the AUDIT_NFT_OP_* values in the audit_log_nfcfg() calls in
nf_tables_api.c?  If we can, let's do that.

If we can't do that, we need to add some build-time protection to
catch if NFT_MSG_MAX increases without this table being updated.

>  static int audit_match_perm(struct audit_context *ctx, int mask)
> diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
> index 4471393da6d8..7a386eca6e04 100644
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
> @@ -693,6 +694,14 @@ static void nf_tables_table_notify(const struct nft_ctx *ctx, int event)
>  {
>         struct sk_buff *skb;
>         int err;
> +       char *buf = kasprintf(GFP_KERNEL, "%s:%llu;?:0",
> +                             ctx->table->name, ctx->table->handle);
> +
> +       audit_log_nfcfg(buf,
> +                       ctx->family,
> +                       ctx->table->use,
> +                       audit_nftcfgs[event].op);

As an example, the below would work, yes?

audit_log_nfcfg(...,
 (event == NFT_MSG_NEWTABLE ?
  AUDIT_NFT_OP_TABLE_REGISTER :
  AUDIT_NFT_OP_TABLE_UNREGISTER)

> +       kfree(buf);
>
>         if (!ctx->report &&
>             !nfnetlink_has_listeners(ctx->net, NFNLGRP_NFTABLES))

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7074A1EB1F5
	for <lists+linux-audit@lfdr.de>; Tue,  2 Jun 2020 00:59:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591052354;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IeFpY4DQeU5G6OhOsJVeOduGYQpxYyw4euef+skAPlk=;
	b=F4rvvDExq2D+Qs7YLopPh/MuNfd6YFwBD+0zrJyvQQ7xTFReaq8ci4XV9b77rrUMpiQSQr
	awSdUPuh9kWh8vhA6LlceYvRlShdimpH+BwKQgwBzuZOSHIaaD4VM7WHEugGezz9p5MaOV
	R9k5tAZ8LxLSalMzUs7MLRoRTCfS58A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-GbtnFu3MNs-o6hJ95Wpcug-1; Mon, 01 Jun 2020 18:59:12 -0400
X-MC-Unique: GbtnFu3MNs-o6hJ95Wpcug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B28F9464;
	Mon,  1 Jun 2020 22:59:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C63FA1BCBE;
	Mon,  1 Jun 2020 22:59:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 352E81809543;
	Mon,  1 Jun 2020 22:58:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 051MwiQH032570 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 18:58:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 04DB45D9DD; Mon,  1 Jun 2020 22:58:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.54])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DE915D9C9;
	Mon,  1 Jun 2020 22:58:35 +0000 (UTC)
Date: Mon, 1 Jun 2020 18:58:33 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak124 v2] audit: log nftables configuration change events
Message-ID: <20200601225833.ut2wayc6xqefwveo@madcap2.tricolour.ca>
References: <d45d23ba6d58b1513c641dfb24f009cbc1b7aad6.1590716354.git.rgb@redhat.com>
	<CAHC9VhTuUdc565fPU=P1sXEM8hFm5P+ESm3Bv=kyebb19EsQuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTuUdc565fPU=P1sXEM8hFm5P+ESm3Bv=kyebb19EsQuQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-06-01 12:10, Paul Moore wrote:
> On Thu, May 28, 2020 at 9:44 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > iptables, ip6tables, arptables and ebtables table registration,
> > replacement and unregistration configuration events are logged for the
> > native (legacy) iptables setsockopt api, but not for the
> > nftables netlink api which is used by the nft-variant of iptables in
> > addition to nftables itself.
> >
> > Add calls to log the configuration actions in the nftables netlink api.
> >
> > This uses the same NETFILTER_CFG record format but overloads the table
> > field.
> >
> >   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.878:162) : table=?:0;?:0 family=unspecified entries=2 op=nft_register_gen pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
> >   ...
> >   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.878:162) : table=firewalld:1;?:0 family=inet entries=0 op=nft_register_table pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
> >   ...
> >   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.911:163) : table=firewalld:1;filter_FORWARD:85 family=inet entries=8 op=nft_register_chain pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
> >   ...
> >   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.911:163) : table=firewalld:1;filter_FORWARD:85 family=inet entries=101 op=nft_register_rule pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
> >   ...
> >   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.911:163) : table=firewalld:1;__set0:87 family=inet entries=87 op=nft_register_setelem pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
> >   ...
> >   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.911:163) : table=firewalld:1;__set0:87 family=inet entries=0 op=nft_register_set pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
> >
> > For further information please see issue
> > https://github.com/linux-audit/audit-kernel/issues/124
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> > Changelog:
> > v2:
> > - differentiate between xtables and nftables
> > - add set, setelem, obj, flowtable, gen
> > - use nentries field as appropriate per type
> > - overload the "tables" field with table handle and chain/set/flowtable
> >
> >  include/linux/audit.h         | 52 +++++++++++++++++++++++++
> >  kernel/auditsc.c              | 24 ++++++++++--
> >  net/netfilter/nf_tables_api.c | 89 +++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 162 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > index 3fcd9ee49734..d79866a38505 100644
> > --- a/include/linux/audit.h
> > +++ b/include/linux/audit.h
> > @@ -12,6 +12,7 @@
> >  #include <linux/sched.h>
> >  #include <linux/ptrace.h>
> >  #include <uapi/linux/audit.h>
> > +#include <uapi/linux/netfilter/nf_tables.h>
> >
> >  #define AUDIT_INO_UNSET ((unsigned long)-1)
> >  #define AUDIT_DEV_UNSET ((dev_t)-1)
> > @@ -98,6 +99,57 @@ enum audit_nfcfgop {
> >         AUDIT_XT_OP_REGISTER,
> >         AUDIT_XT_OP_REPLACE,
> >         AUDIT_XT_OP_UNREGISTER,
> > +       AUDIT_NFT_OP_TABLE_REGISTER,
> > +       AUDIT_NFT_OP_TABLE_UNREGISTER,
> > +       AUDIT_NFT_OP_CHAIN_REGISTER,
> > +       AUDIT_NFT_OP_CHAIN_UNREGISTER,
> > +       AUDIT_NFT_OP_RULE_REGISTER,
> > +       AUDIT_NFT_OP_RULE_UNREGISTER,
> > +       AUDIT_NFT_OP_SET_REGISTER,
> > +       AUDIT_NFT_OP_SET_UNREGISTER,
> > +       AUDIT_NFT_OP_SETELEM_REGISTER,
> > +       AUDIT_NFT_OP_SETELEM_UNREGISTER,
> > +       AUDIT_NFT_OP_GEN_REGISTER,
> > +       AUDIT_NFT_OP_OBJ_REGISTER,
> > +       AUDIT_NFT_OP_OBJ_UNREGISTER,
> > +       AUDIT_NFT_OP_OBJ_RESET,
> > +       AUDIT_NFT_OP_FLOWTABLE_REGISTER,
> > +       AUDIT_NFT_OP_FLOWTABLE_UNREGISTER,
> > +       AUDIT_NFT_OP_INVALID,
> > +};
> > +
> > +struct audit_nftcfgop_tab {
> > +       enum nf_tables_msg_types        nftop;
> > +       enum audit_nfcfgop              op;
> > +};
> > +
> > +static const struct audit_nftcfgop_tab audit_nftcfgs[] = {
> > +       { NFT_MSG_NEWTABLE,     AUDIT_NFT_OP_TABLE_REGISTER             },
> > +       { NFT_MSG_GETTABLE,     AUDIT_NFT_OP_INVALID                    },
> > +       { NFT_MSG_DELTABLE,     AUDIT_NFT_OP_TABLE_UNREGISTER           },
> > +       { NFT_MSG_NEWCHAIN,     AUDIT_NFT_OP_CHAIN_REGISTER             },
> > +       { NFT_MSG_GETCHAIN,     AUDIT_NFT_OP_INVALID                    },
> > +       { NFT_MSG_DELCHAIN,     AUDIT_NFT_OP_CHAIN_UNREGISTER           },
> > +       { NFT_MSG_NEWRULE,      AUDIT_NFT_OP_RULE_REGISTER              },
> > +       { NFT_MSG_GETRULE,      AUDIT_NFT_OP_INVALID                    },
> > +       { NFT_MSG_DELRULE,      AUDIT_NFT_OP_RULE_UNREGISTER            },
> > +       { NFT_MSG_NEWSET,       AUDIT_NFT_OP_SET_REGISTER               },
> > +       { NFT_MSG_GETSET,       AUDIT_NFT_OP_INVALID                    },
> > +       { NFT_MSG_DELSET,       AUDIT_NFT_OP_SET_UNREGISTER             },
> > +       { NFT_MSG_NEWSETELEM,   AUDIT_NFT_OP_SETELEM_REGISTER           },
> > +       { NFT_MSG_GETSETELEM,   AUDIT_NFT_OP_INVALID                    },
> > +       { NFT_MSG_DELSETELEM,   AUDIT_NFT_OP_SETELEM_UNREGISTER         },
> > +       { NFT_MSG_NEWGEN,       AUDIT_NFT_OP_GEN_REGISTER               },
> > +       { NFT_MSG_GETGEN,       AUDIT_NFT_OP_INVALID                    },
> > +       { NFT_MSG_TRACE,        AUDIT_NFT_OP_INVALID                    },
> > +       { NFT_MSG_NEWOBJ,       AUDIT_NFT_OP_OBJ_REGISTER               },
> > +       { NFT_MSG_GETOBJ,       AUDIT_NFT_OP_INVALID                    },
> > +       { NFT_MSG_DELOBJ,       AUDIT_NFT_OP_OBJ_UNREGISTER             },
> > +       { NFT_MSG_GETOBJ_RESET, AUDIT_NFT_OP_OBJ_RESET                  },
> > +       { NFT_MSG_NEWFLOWTABLE, AUDIT_NFT_OP_FLOWTABLE_REGISTER         },
> > +       { NFT_MSG_GETFLOWTABLE, AUDIT_NFT_OP_INVALID                    },
> > +       { NFT_MSG_DELFLOWTABLE, AUDIT_NFT_OP_FLOWTABLE_UNREGISTER       },
> > +       { NFT_MSG_MAX,          AUDIT_NFT_OP_INVALID                    },
> >  };
> 
> I didn't check every "op" defined above to match with the changes in
> nf_tables_api.c, but is there a reason why we can't simply hardcode
> the AUDIT_NFT_OP_* values in the audit_log_nfcfg() calls in
> nf_tables_api.c?  If we can, let's do that.

Yes, to distinguish between x/ebtables and nftables.  The first three
overlap (as suggested by the first comment in the changelog above).

> If we can't do that, we need to add some build-time protection to
> catch if NFT_MSG_MAX increases without this table being updated.

I would have liked to do that, but it would then have meant making a new
function name, say audit_log_nftcfg vs the original audit_log_nfcfg so
that the overlapping values could be translated appropriately with the
correct prefix.

Well, considering the buildbot error, I had to restructure it so that
the table was moved from include/linux/audit.h to
net/netfilter/nf_tables_api.c where it would be a bit more evident.

At first I thought the bot was complaining about the first field not
being used, but it turned out it was ptrace that was including it and
not using it.

> >  static int audit_match_perm(struct audit_context *ctx, int mask)
> > diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
> > index 4471393da6d8..7a386eca6e04 100644
> > --- a/net/netfilter/nf_tables_api.c
> > +++ b/net/netfilter/nf_tables_api.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/netlink.h>
> >  #include <linux/vmalloc.h>
> >  #include <linux/rhashtable.h>
> > +#include <linux/audit.h>
> >  #include <linux/netfilter.h>
> >  #include <linux/netfilter/nfnetlink.h>
> >  #include <linux/netfilter/nf_tables.h>
> > @@ -693,6 +694,14 @@ static void nf_tables_table_notify(const struct nft_ctx *ctx, int event)
> >  {
> >         struct sk_buff *skb;
> >         int err;
> > +       char *buf = kasprintf(GFP_KERNEL, "%s:%llu;?:0",
> > +                             ctx->table->name, ctx->table->handle);
> > +
> > +       audit_log_nfcfg(buf,
> > +                       ctx->family,
> > +                       ctx->table->use,
> > +                       audit_nftcfgs[event].op);
> 
> As an example, the below would work, yes?
> 
> audit_log_nfcfg(...,
>  (event == NFT_MSG_NEWTABLE ?
>   AUDIT_NFT_OP_TABLE_REGISTER :
>   AUDIT_NFT_OP_TABLE_UNREGISTER)

Ok, I see what you are getting at now...  Yes, it could be done this
way, but it seems noisier to me.

> > +       kfree(buf);
> >
> >         if (!ctx->report &&
> >             !nfnetlink_has_listeners(ctx->net, NFNLGRP_NFTABLES))
> 
> paul moore

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


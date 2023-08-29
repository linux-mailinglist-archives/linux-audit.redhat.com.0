Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EB778CCAE
	for <lists+linux-audit@lfdr.de>; Tue, 29 Aug 2023 21:11:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693336291;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cL/p4UHCkpZAqqZM6R4gTScMXtUw0hI+9+nvF+br7F4=;
	b=RfGvVzycXi8tjPyhMeDvmZL2r36kAd+8MCCBIfqF/ppt+CbHRh9/gHXcGqu1q5TI+B3gop
	b8Wjw4lpekUU6Owboym8N5uYSJB0c+8zFBUw4qBMx/pONXpgY4EbuHEpRDKvheyB71gjWA
	UBWvYu4V6xlRwZT3DLsOt1k8UB33jkw=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-NmU6OT-jNQqjJN765qKvjQ-1; Tue, 29 Aug 2023 15:11:26 -0400
X-MC-Unique: NmU6OT-jNQqjJN765qKvjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACF4138149A7;
	Tue, 29 Aug 2023 19:11:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A59440C6F4E;
	Tue, 29 Aug 2023 19:11:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 787CF1946A47;
	Tue, 29 Aug 2023 19:11:22 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D35FD1946594 for <linux-audit@listman.corp.redhat.com>;
 Tue, 29 Aug 2023 19:04:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A333A2026D68; Tue, 29 Aug 2023 19:04:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BD6A2026D4B
 for <linux-audit@redhat.com>; Tue, 29 Aug 2023 19:04:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FAB985D184
 for <linux-audit@redhat.com>; Tue, 29 Aug 2023 19:04:35 +0000 (UTC)
Received: from orbyte.nwl.cc (orbyte.nwl.cc [151.80.46.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-548--p9rAo3UOam8J5BLegJK2A-1; Tue,
 29 Aug 2023 15:04:33 -0400
X-MC-Unique: -p9rAo3UOam8J5BLegJK2A-1
Received: from n0-1 by orbyte.nwl.cc with local (Exim 4.94.2)
 (envelope-from <n0-1@orbyte.nwl.cc>)
 id 1qb3c0-0004nu-Cv; Tue, 29 Aug 2023 20:38:48 +0200
Date: Tue, 29 Aug 2023 20:38:48 +0200
From: Phil Sutter <phil@nwl.cc>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nf PATCH 1/2] netfilter: nf_tables: Audit log setelem reset
Message-ID: <ZO47OErdLysNiMsA@orbyte.nwl.cc>
Mail-Followup-To: Phil Sutter <phil@nwl.cc>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 netfilter-devel@vger.kernel.org, linux-audit@redhat.com,
 Richard Guy Briggs <rgb@redhat.com>
References: <20230829175158.20202-1-phil@nwl.cc> <ZO4ytkCaWgprr4ba@calendula>
MIME-Version: 1.0
In-Reply-To: <ZO4ytkCaWgprr4ba@calendula>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Tue, 29 Aug 2023 19:11:21 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: nwl.cc
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 29, 2023 at 08:02:30PM +0200, Pablo Neira Ayuso wrote:
> On Tue, Aug 29, 2023 at 07:51:57PM +0200, Phil Sutter wrote:
> > Since set element reset is not integrated into nf_tables' transaction
> > logic, an explicit log call is needed, similar to NFT_MSG_GETOBJ_RESET
> > handling.
> > 
> > For the sake of simplicity, catchall element reset will always generate
> > a dedicated log entry. This relieves nf_tables_dump_set() from having to
> > adjust the logged element count depending on whether a catchall element
> > was found or not.
> > 
> > Cc: Richard Guy Briggs <rgb@redhat.com>
> > Fixes: 079cd633219d7 ("netfilter: nf_tables: Introduce NFT_MSG_GETSETELEM_RESET")
> > Signed-off-by: Phil Sutter <phil@nwl.cc>
> > ---
> >  include/linux/audit.h         |  1 +
> >  kernel/auditsc.c              |  1 +
> >  net/netfilter/nf_tables_api.c | 31 ++++++++++++++++++++++++++++---
> >  3 files changed, 30 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > index 6a3a9e122bb5e..192bf03aacc52 100644
> > --- a/include/linux/audit.h
> > +++ b/include/linux/audit.h
> > @@ -117,6 +117,7 @@ enum audit_nfcfgop {
> >  	AUDIT_NFT_OP_OBJ_RESET,
> >  	AUDIT_NFT_OP_FLOWTABLE_REGISTER,
> >  	AUDIT_NFT_OP_FLOWTABLE_UNREGISTER,
> > +	AUDIT_NFT_OP_SETELEM_RESET,
> >  	AUDIT_NFT_OP_INVALID,
> >  };
> >  
> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index addeed3df15d3..38481e3181975 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -143,6 +143,7 @@ static const struct audit_nfcfgop_tab audit_nfcfgs[] = {
> >  	{ AUDIT_NFT_OP_OBJ_RESET,		"nft_reset_obj"		   },
> >  	{ AUDIT_NFT_OP_FLOWTABLE_REGISTER,	"nft_register_flowtable"   },
> >  	{ AUDIT_NFT_OP_FLOWTABLE_UNREGISTER,	"nft_unregister_flowtable" },
> > +	{ AUDIT_NFT_OP_SETELEM_RESET,		"nft_reset_setelem"        },
> >  	{ AUDIT_NFT_OP_INVALID,			"nft_invalid"		   },
> >  };
> >  
> > diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
> > index 1ddbdca4e47d6..a1218ea4e0c3d 100644
> > --- a/net/netfilter/nf_tables_api.c
> > +++ b/net/netfilter/nf_tables_api.c
> > @@ -102,6 +102,7 @@ static const u8 nft2audit_op[NFT_MSG_MAX] = { // enum nf_tables_msg_types
> >  	[NFT_MSG_NEWFLOWTABLE]	= AUDIT_NFT_OP_FLOWTABLE_REGISTER,
> >  	[NFT_MSG_GETFLOWTABLE]	= AUDIT_NFT_OP_INVALID,
> >  	[NFT_MSG_DELFLOWTABLE]	= AUDIT_NFT_OP_FLOWTABLE_UNREGISTER,
> > +	[NFT_MSG_GETSETELEM_RESET] = AUDIT_NFT_OP_SETELEM_RESET,
> >  };
> >  
> >  static void nft_validate_state_update(struct nft_table *table, u8 new_validate_state)
> > @@ -5661,13 +5662,25 @@ static int nf_tables_dump_setelem(const struct nft_ctx *ctx,
> >  	return nf_tables_fill_setelem(args->skb, set, elem, args->reset);
> >  }
> >  
> > +static void audit_log_nft_set_reset(const struct nft_table *table,
> > +				    unsigned int base_seq,
> > +				    unsigned int nentries)
> > +{
> > +	char *buf = kasprintf(GFP_ATOMIC, "%s:%u", table->name, base_seq);
> 
> No check for NULL?
> 
> I can see we have more like this in the tree.

Well, I merely copy-pasted that bit. (No excuse, I know.) The pointer is
passed on to audit_log_format() as a string argument and will end at
vsnprintf(), which detects and sanitizes NULL string args.

Cheers, Phil


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


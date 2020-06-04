Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7910D1F03CC
	for <lists+linux-audit@lfdr.de>; Sat,  6 Jun 2020 02:21:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402910;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TQXLPij/DH+qNrVnIv68lA4ajM2SNaW3LRzwOmW4SIg=;
	b=YrAAbjmgqmfG0CwDTCuDKBt1Pl2/tslLuSa0jYDRbkOl3oHV8xClKzBjQqkoM4pmDmGuwA
	g77fxsRcVbyXD2co/M5xwgIoFPm0kHpEBHnyjnVqUtvs1FygfI6oZU9SUnjlA2aD19oJKR
	D2aQoIclJdb49CMpuAD1qGZq+WYdCsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-E7v6hBPEMOqyh6lUe7whrQ-1; Fri, 05 Jun 2020 20:21:48 -0400
X-MC-Unique: E7v6hBPEMOqyh6lUe7whrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87E041404;
	Sat,  6 Jun 2020 00:21:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66A2460C47;
	Sat,  6 Jun 2020 00:21:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D3DC104857;
	Sat,  6 Jun 2020 00:21:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 054Iq7nJ003119 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 4 Jun 2020 14:52:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DFAF5D9E4; Thu,  4 Jun 2020 18:52:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-112-220.phx2.redhat.com [10.3.112.220])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 170915D9D3;
	Thu,  4 Jun 2020 18:51:56 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Date: Thu, 04 Jun 2020 14:51:54 -0400
Message-ID: <2190308.cDvYnDs5iT@x2>
Organization: Red Hat
In-Reply-To: <20200604175756.d3x5fy4k4urilgbp@madcap2.tricolour.ca>
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
	<530434533.t1QJnzVmUA@x2>
	<20200604175756.d3x5fy4k4urilgbp@madcap2.tricolour.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, June 4, 2020 1:57:56 PM EDT Richard Guy Briggs wrote:
> > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > index 468a23390457..3a9100e95fda 100644
> > > --- a/kernel/auditsc.c
> > > +++ b/kernel/auditsc.c
> > > @@ -75,6 +75,7 @@
> > > #include <linux/uaccess.h>
> > > #include <linux/fsnotify_backend.h>
> > > #include <uapi/linux/limits.h>
> > > +#include <uapi/linux/netfilter/nf_tables.h>
> > > 
> > > #include "audit.h"
> > > 
> > > @@ -136,9 +137,26 @@ struct audit_nfcfgop_tab {
> > > };
> > > 
> > > static const struct audit_nfcfgop_tab audit_nfcfgs[] = {
> > > -       { AUDIT_XT_OP_REGISTER,         "register"      },
> > > -       { AUDIT_XT_OP_REPLACE,          "replace"       },
> > > -       { AUDIT_XT_OP_UNREGISTER,       "unregister"    },
> > > +       { AUDIT_XT_OP_REGISTER,                 "xt_register"
> > 
> > },
> > 
> > > +       { AUDIT_XT_OP_REPLACE,                  "xt_replace"           
> > >    }, +       { AUDIT_XT_OP_UNREGISTER,               "xt_unregister" 
> > >           }, +       { AUDIT_NFT_OP_TABLE_REGISTER,         
> > > "nft_register_table"> 
> > },
> > 
> > > +       { AUDIT_NFT_OP_TABLE_UNREGISTER,        "nft_unregister_table" 
> > >    }, +       { AUDIT_NFT_OP_CHAIN_REGISTER,         
> > > "nft_register_chain"> 
> > },
> > 
> > > +       { AUDIT_NFT_OP_CHAIN_UNREGISTER,        "nft_unregister_chain" 
> > >    }, +       { AUDIT_NFT_OP_RULE_REGISTER,          
> > > "nft_register_rule"> 
> > },
> > 
> > > +       { AUDIT_NFT_OP_RULE_UNREGISTER,         "nft_unregister_rule"
> > 
> > },
> > 
> > > +       { AUDIT_NFT_OP_SET_REGISTER,            "nft_register_set"
> > 
> > },
> > 
> > > +       { AUDIT_NFT_OP_SET_UNREGISTER,          "nft_unregister_set"
> > 
> > },
> > 
> > > +       { AUDIT_NFT_OP_SETELEM_REGISTER,        "nft_register_setelem" 
> > >    }, +       { AUDIT_NFT_OP_SETELEM_UNREGISTER,     
> > > "nft_unregister_setelem"   }, +       { AUDIT_NFT_OP_GEN_REGISTER,    
> > >        "nft_register_gen"         }, +       {
> > > AUDIT_NFT_OP_OBJ_REGISTER,            "nft_register_obj"         }, + 
> > >      { AUDIT_NFT_OP_OBJ_UNREGISTER,          "nft_unregister_obj"     
> > >  }, +       { AUDIT_NFT_OP_OBJ_RESET,               "nft_reset_obj"   
> > >         }, +       { AUDIT_NFT_OP_FLOWTABLE_REGISTER,     
> > > "nft_register_flowtable"   }, +       {
> > > AUDIT_NFT_OP_FLOWTABLE_UNREGISTER,    "nft_unregister_flowtable" }, + 
> > >      { AUDIT_NFT_OP_INVALID,                 "nft_invalid"
> > 
> > },
> > 
> > > };
> > 
> > I still don't like the event format because it doesn't give complete
> > subject information. However, I thought I'd comment on this string
> > table. Usually it's sufficient to log the number and then have the
> > string table in user space which looks it up during interpretation.
> 
> That is a good idea that would help reduce kernel cycles and netlink
> bandwidth, but the format was set in 2011 so it is a bit late to change
> that now:
>         fbabf31e4d48 ("netfilter: create audit records for x_tables
> replaces")

Nothing searches/interprets that field name. So, you can redefine it by 
renaming it. Or just go with what you have. My preference is push that to 
user space. But not a showstopper "as is".

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


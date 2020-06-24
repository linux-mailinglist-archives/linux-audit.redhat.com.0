Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCB120746D
	for <lists+linux-audit@lfdr.de>; Wed, 24 Jun 2020 15:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593005204;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MXLf31WtVssTHeaRziXM2AfmTdmJpq1fUEs09Rdy5Eo=;
	b=RrdOS/pql8zFjVmLapMk7PNwebA401ejZCz1k/P6oa0ldp9Rz8bw1tAsISA4rrk881SoUc
	J+VMt45t7TYd4m/DSXMvCMnW03/5dW1OzAmC8PKw1DSwl9C5nz1TprQkPlDhPUF2OUzWUu
	PG9fPMQIdXkEEsgH12FYITmnKwssQCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-M4XswgW-OsKPFN9z54P7kQ-1; Wed, 24 Jun 2020 09:26:42 -0400
X-MC-Unique: M4XswgW-OsKPFN9z54P7kQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B217804004;
	Wed, 24 Jun 2020 13:26:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C95061A913;
	Wed, 24 Jun 2020 13:26:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 287601809547;
	Wed, 24 Jun 2020 13:26:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05ODQTII012882 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 09:26:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 20F646106A; Wed, 24 Jun 2020 13:26:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CF5060C80;
	Wed, 24 Jun 2020 13:26:15 +0000 (UTC)
Date: Wed, 24 Jun 2020 09:26:12 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20200624132612.fj36hwgom7qryvn7@madcap2.tricolour.ca>
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
	<20200624100346.GA11986@salvia>
	<20200624123423.r2gypsdii6xgiywy@madcap2.tricolour.ca>
	<20200624130304.GA549@salvia>
MIME-Version: 1.0
In-Reply-To: <20200624130304.GA549@salvia>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-06-24 15:03, Pablo Neira Ayuso wrote:
> On Wed, Jun 24, 2020 at 08:34:23AM -0400, Richard Guy Briggs wrote:
> > On 2020-06-24 12:03, Pablo Neira Ayuso wrote:
> > > On Thu, Jun 04, 2020 at 09:20:49AM -0400, Richard Guy Briggs wrote:
> [...]
> > > > diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
> > > > index 3558e76e2733..b9e7440cc87d 100644
> > > > --- a/net/netfilter/nf_tables_api.c
> > > > +++ b/net/netfilter/nf_tables_api.c
> > > > @@ -12,6 +12,7 @@
> > > >  #include <linux/netlink.h>
> > > >  #include <linux/vmalloc.h>
> > > >  #include <linux/rhashtable.h>
> > > > +#include <linux/audit.h>
> > > >  #include <linux/netfilter.h>
> > > >  #include <linux/netfilter/nfnetlink.h>
> > > >  #include <linux/netfilter/nf_tables.h>
> > > > @@ -693,6 +694,16 @@ static void nf_tables_table_notify(const struct nft_ctx *ctx, int event)
> > > >  {
> > > >  	struct sk_buff *skb;
> > > >  	int err;
> > > > +	char *buf = kasprintf(GFP_KERNEL, "%s:%llu;?:0",
> > > > +			      ctx->table->name, ctx->table->handle);
> > > > +
> > > > +	audit_log_nfcfg(buf,
> > > > +			ctx->family,
> > > > +			ctx->table->use,
> > > > +			event == NFT_MSG_NEWTABLE ?
> > > > +				AUDIT_NFT_OP_TABLE_REGISTER :
> > > > +				AUDIT_NFT_OP_TABLE_UNREGISTER);
> > > > +	kfree(buf);
> > > 
> > > As a follow up: Would you wrap this code into a function?
> > > 
> > >         nft_table_audit()
> > > 
> > > Same thing for other pieces of code below.
> > 
> > If I'm guessing right, you are asking for a supplementary follow-up
> > cleanup patch to this one (or are you nacking this patch)?
> 
> No nack, it's just that I'd prefer to see this wrapped in a function.
> I think your patch is already in the audit tree.
> 
> > Also, I gather you would like to see the kasprintf and kfree hidden in
> > nft_table_audit(), handing this function at least 8 parameters?  This
> > sounds pretty messy given the format of the table field.
> 
> I think you can pass ctx and the specific object, e.g. table, in most
> cases? There is also event and the gfp_flags. That counts 4 here, but
> maybe I'm overlooking something.

Since every event is sufficiently different, it isn't as simple as
passing ctx, unfortunately, and the table field I've overloaded with 4
bits of information for tracking the chain as well, some of which are ?
that would need an in-band representation (such as -1? that might
already be valid).  So 4 right there, family, nentries, event, gfp for 8.

I did try in the first patch to make it just one call keyed on event,
but there was enough variety of information available for each message
type that it became necessary to break it out.

> Thanks.

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


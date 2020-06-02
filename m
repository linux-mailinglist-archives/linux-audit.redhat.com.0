Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 686C31EBA85
	for <lists+linux-audit@lfdr.de>; Tue,  2 Jun 2020 13:34:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591097693;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rzPS1fJkCG2GWOXXJwBK+f9d5nHHznPGt1f11L2Jr/8=;
	b=HuRcElKOiklJCTDBdxbhtpUoP3efsPJqWZGD3ZRK+1mJlxlhYOCi1vF/M++ms4hssIlJM9
	/DmbjPD1cRIvYDUFHLhQAC+bBj+LqCuooMlsUiwunX2rjKKMcAdF8EYq+HezDLrWxU18BE
	qubaEzJdW73kGnvqRrsZar4S7dyf3z0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-oorZIbK7PtG-1aw-Obmx9Q-1; Tue, 02 Jun 2020 07:34:51 -0400
X-MC-Unique: oorZIbK7PtG-1aw-Obmx9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFFFD835B40;
	Tue,  2 Jun 2020 11:34:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD3377A8C1;
	Tue,  2 Jun 2020 11:34:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0497E97017;
	Tue,  2 Jun 2020 11:34:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052BYSnQ029608 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 07:34:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 201B4D0208; Tue,  2 Jun 2020 11:34:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.54])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 402B4579A3;
	Tue,  2 Jun 2020 11:34:19 +0000 (UTC)
Date: Tue, 2 Jun 2020 07:34:17 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak124 v2] audit: log nftables configuration change events
Message-ID: <20200602113417.kfrmwm57snkaiv3y@madcap2.tricolour.ca>
References: <d45d23ba6d58b1513c641dfb24f009cbc1b7aad6.1590716354.git.rgb@redhat.com>
	<CAHC9VhTuUdc565fPU=P1sXEM8hFm5P+ESm3Bv=kyebb19EsQuQ@mail.gmail.com>
	<20200601225833.ut2wayc6xqefwveo@madcap2.tricolour.ca>
	<CAHC9VhRnM78=F7_qd8bi=4cfo=bZj_K9YFe1KM2nYRqJiLbsRQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRnM78=F7_qd8bi=4cfo=bZj_K9YFe1KM2nYRqJiLbsRQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Content-Disposition: inline

On 2020-06-01 20:12, Paul Moore wrote:
> On Mon, Jun 1, 2020 at 6:58 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-06-01 12:10, Paul Moore wrote:
> > > On Thu, May 28, 2020 at 9:44 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> 
> ...
> 
> > > > diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
> > > > index 4471393da6d8..7a386eca6e04 100644
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
> > > > @@ -693,6 +694,14 @@ static void nf_tables_table_notify(const struct nft_ctx *ctx, int event)
> > > >  {
> > > >         struct sk_buff *skb;
> > > >         int err;
> > > > +       char *buf = kasprintf(GFP_KERNEL, "%s:%llu;?:0",
> > > > +                             ctx->table->name, ctx->table->handle);
> > > > +
> > > > +       audit_log_nfcfg(buf,
> > > > +                       ctx->family,
> > > > +                       ctx->table->use,
> > > > +                       audit_nftcfgs[event].op);
> > >
> > > As an example, the below would work, yes?
> > >
> > > audit_log_nfcfg(...,
> > >  (event == NFT_MSG_NEWTABLE ?
> > >   AUDIT_NFT_OP_TABLE_REGISTER :
> > >   AUDIT_NFT_OP_TABLE_UNREGISTER)
> >
> > Ok, I see what you are getting at now...  Yes, it could be done this
> > way, but it seems noisier to me.
> 
> I'll admit it is not as clean, but it doesn't hide the mapping between
> the netfilter operation and the audit operation which hopefully makes
> it clear to those modifying the netfilter/nf_tables/etc. code that
> there is an audit impact.  I'm basically trying to make sure the code
> is as robust as possible in the face of subsystem changes beyond the
> audit subsystem.

Yup, I agree, a compile time check to make sure they aren't out of sync.

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


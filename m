Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E193320755E
	for <lists+linux-audit@lfdr.de>; Wed, 24 Jun 2020 16:13:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593007996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p71m8y7BrAa4R/FJYng6faeTgCwvF8kufDEGZmnkXXU=;
	b=Cak1PRwbXYbBDW4GYukFi3LIm/KifhC1ffBzyF99RJ+yKPmNcLvhud6aBN7FsQZjVY9RJC
	TRNumM+VnEHmDT+fytBGSf4M+jYcwhw6dQoM/aSHtCBmlUdLpbDZNt6lphHQcrytSMxz6n
	cJviUzCuv52uZlbxe2kGd9FtIUORsIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-1rnRnigqMlq5-ROphNKScA-1; Wed, 24 Jun 2020 10:13:10 -0400
X-MC-Unique: 1rnRnigqMlq5-ROphNKScA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75A1C107B0F0;
	Wed, 24 Jun 2020 14:13:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B89435D9DC;
	Wed, 24 Jun 2020 14:13:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE41687580;
	Wed, 24 Jun 2020 14:13:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05OD3IC1009330 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 09:03:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ECF01217B43D; Wed, 24 Jun 2020 13:03:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E74A5217B43A
	for <linux-audit@redhat.com>; Wed, 24 Jun 2020 13:03:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D34D800883
	for <linux-audit@redhat.com>; Wed, 24 Jun 2020 13:03:11 +0000 (UTC)
Received: from mail.us.es (correo.us.es [193.147.175.20]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-22-kBH9o-tzNs2RPszT00tI-Q-1;
	Wed, 24 Jun 2020 09:03:09 -0400
X-MC-Unique: kBH9o-tzNs2RPszT00tI-Q-1
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
	by mail.us.es (Postfix) with ESMTP id A6D041C4430
	for <linux-audit@redhat.com>; Wed, 24 Jun 2020 15:03:07 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
	by antivirus1-rhel7.int (Postfix) with ESMTP id 97E3ADA84B
	for <linux-audit@redhat.com>; Wed, 24 Jun 2020 15:03:07 +0200 (CEST)
Received: by antivirus1-rhel7.int (Postfix, from userid 99)
	id 86A3ADA852; Wed, 24 Jun 2020 15:03:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on antivirus1-rhel7.int
X-Spam-Level: 
X-Spam-Status: No, score=-108.2 required=7.5 tests=ALL_TRUSTED,BAYES_50,
	SMTPAUTH_US2,USER_IN_WHITELIST autolearn=disabled version=3.4.1
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
	by antivirus1-rhel7.int (Postfix) with ESMTP id 483A8DA73D;
	Wed, 24 Jun 2020 15:03:05 +0200 (CEST)
Received: from 192.168.1.97 (192.168.1.97)
	by antivirus1-rhel7.int (F-Secure/fsigk_smtp/550/antivirus1-rhel7.int); 
	Wed, 24 Jun 2020 15:03:05 +0200 (CEST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/antivirus1-rhel7.int)
Received: from us.es (unknown [90.77.255.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: 1984lsi)
	by entrada.int (Postfix) with ESMTPSA id 10BDD42EF42B;
	Wed, 24 Jun 2020 15:03:05 +0200 (CEST)
Date: Wed, 24 Jun 2020 15:03:04 +0200
X-SMTPAUTHUS: auth mail.us.es
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20200624130304.GA549@salvia>
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
	<20200624100346.GA11986@salvia>
	<20200624123423.r2gypsdii6xgiywy@madcap2.tricolour.ca>
MIME-Version: 1.0
In-Reply-To: <20200624123423.r2gypsdii6xgiywy@madcap2.tricolour.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 24 Jun 2020 10:12:55 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jun 24, 2020 at 08:34:23AM -0400, Richard Guy Briggs wrote:
> On 2020-06-24 12:03, Pablo Neira Ayuso wrote:
> > On Thu, Jun 04, 2020 at 09:20:49AM -0400, Richard Guy Briggs wrote:
[...]
> > > diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
> > > index 3558e76e2733..b9e7440cc87d 100644
> > > --- a/net/netfilter/nf_tables_api.c
> > > +++ b/net/netfilter/nf_tables_api.c
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/netlink.h>
> > >  #include <linux/vmalloc.h>
> > >  #include <linux/rhashtable.h>
> > > +#include <linux/audit.h>
> > >  #include <linux/netfilter.h>
> > >  #include <linux/netfilter/nfnetlink.h>
> > >  #include <linux/netfilter/nf_tables.h>
> > > @@ -693,6 +694,16 @@ static void nf_tables_table_notify(const struct nft_ctx *ctx, int event)
> > >  {
> > >  	struct sk_buff *skb;
> > >  	int err;
> > > +	char *buf = kasprintf(GFP_KERNEL, "%s:%llu;?:0",
> > > +			      ctx->table->name, ctx->table->handle);
> > > +
> > > +	audit_log_nfcfg(buf,
> > > +			ctx->family,
> > > +			ctx->table->use,
> > > +			event == NFT_MSG_NEWTABLE ?
> > > +				AUDIT_NFT_OP_TABLE_REGISTER :
> > > +				AUDIT_NFT_OP_TABLE_UNREGISTER);
> > > +	kfree(buf);
> > 
> > As a follow up: Would you wrap this code into a function?
> > 
> >         nft_table_audit()
> > 
> > Same thing for other pieces of code below.
> 
> If I'm guessing right, you are asking for a supplementary follow-up
> cleanup patch to this one (or are you nacking this patch)?

No nack, it's just that I'd prefer to see this wrapped in a function.
I think your patch is already in the audit tree.

> Also, I gather you would like to see the kasprintf and kfree hidden in
> nft_table_audit(), handing this function at least 8 parameters?  This
> sounds pretty messy given the format of the table field.

I think you can pass ctx and the specific object, e.g. table, in most
cases? There is also event and the gfp_flags. That counts 4 here, but
maybe I'm overlooking something.

Thanks.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C07B51EB297
	for <lists+linux-audit@lfdr.de>; Tue,  2 Jun 2020 02:13:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591056818;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0wVXrTMkk2BhWSarZ4Dw9Pz0ydU+PVw9D2jvRlndZMg=;
	b=EJ+xUO/cNqDWnfrUeRKQAv717lE7VmjMBeG7izvmFx9L5y6Dri+wgeT6nXyBPbVsJHsAJV
	vktkR+3fqDLulwfiwNkZsktkZ6eTmkCPPqPW4LA3WYMCpmiTFPQBJhwmIkeeOYUCq7XqY2
	vAFCOtu3sxdcbemCvnFgxF+/5YG6/v4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-uyLFFQ79MBaXV055SAH7Zg-1; Mon, 01 Jun 2020 20:13:36 -0400
X-MC-Unique: uyLFFQ79MBaXV055SAH7Zg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94BCE107ACCD;
	Tue,  2 Jun 2020 00:13:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6CF67F0A6;
	Tue,  2 Jun 2020 00:13:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 008A493902;
	Tue,  2 Jun 2020 00:13:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0520DBWF007641 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 20:13:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 613DC951D5; Tue,  2 Jun 2020 00:13:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E01A82881
	for <linux-audit@redhat.com>; Tue,  2 Jun 2020 00:13:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FE858007B1
	for <linux-audit@redhat.com>; Tue,  2 Jun 2020 00:13:08 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-229-Zs8bUXRGOnOhHNTOlq-Aew-1; Mon, 01 Jun 2020 20:13:06 -0400
X-MC-Unique: Zs8bUXRGOnOhHNTOlq-Aew-1
Received: by mail-ej1-f67.google.com with SMTP id z5so10986959ejb.3
	for <linux-audit@redhat.com>; Mon, 01 Jun 2020 17:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qqqITfqOQD5z9QhmRX7NCWEf7tf1iSMF39hGZx9DvEM=;
	b=amvOK/8tKIQ6EZGb3FpF25SCmrUp9FKGSjxxuDvIDA6Q0fa2aZuex0yqU8ZmTbuEjV
	f0q7a/HL1Ow2NSEX/HTiLGWG/5BDEbG0ep8iFw1jUeqTemtiG3ZyJgeoSabhRiF9vj/Y
	GheyWllowhxfAhb61F24nU/8HBQzT0lmrGkAVX5GqBGqVHpQ15O5AkbTZR182PSBwybt
	wc/axWuWreAhkakfzZNr5vGaf7AhsqBIPcx3DW25KX9sBTJYPzDjqWcsGJFPvD70GgRS
	BZkhg5JrcPO4ZNEQuErHF3q3/9GD7JpheeAOA9pghP8GHrfSfQTAJomdoLPgFyDUcgrG
	XoCQ==
X-Gm-Message-State: AOAM532j4svnjqkhiKLrHO0cUl8r8hwa7thCAoaQFY8V6E5i+pdK2jFC
	Jcg6Drox/yKVRIGChP/MyKofaHdVNs4bsivDaYa/
X-Google-Smtp-Source: ABdhPJyjo/1xbhembiHYk1bpR6ZYlE+1/8DP46ro6Yi5JVwnRrrFOIjFDqCwcirqjmh5xeb51EgkGN0Phf0wn44S90Y=
X-Received: by 2002:a17:906:e257:: with SMTP id
	gq23mr2187872ejb.398.1591056784766; 
	Mon, 01 Jun 2020 17:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <d45d23ba6d58b1513c641dfb24f009cbc1b7aad6.1590716354.git.rgb@redhat.com>
	<CAHC9VhTuUdc565fPU=P1sXEM8hFm5P+ESm3Bv=kyebb19EsQuQ@mail.gmail.com>
	<20200601225833.ut2wayc6xqefwveo@madcap2.tricolour.ca>
In-Reply-To: <20200601225833.ut2wayc6xqefwveo@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 1 Jun 2020 20:12:52 -0400
Message-ID: <CAHC9VhRnM78=F7_qd8bi=4cfo=bZj_K9YFe1KM2nYRqJiLbsRQ@mail.gmail.com>
Subject: Re: [PATCH ghak124 v2] audit: log nftables configuration change events
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

On Mon, Jun 1, 2020 at 6:58 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-06-01 12:10, Paul Moore wrote:
> > On Thu, May 28, 2020 at 9:44 PM Richard Guy Briggs <rgb@redhat.com> wrote:

...

> > > diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
> > > index 4471393da6d8..7a386eca6e04 100644
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
> > > @@ -693,6 +694,14 @@ static void nf_tables_table_notify(const struct nft_ctx *ctx, int event)
> > >  {
> > >         struct sk_buff *skb;
> > >         int err;
> > > +       char *buf = kasprintf(GFP_KERNEL, "%s:%llu;?:0",
> > > +                             ctx->table->name, ctx->table->handle);
> > > +
> > > +       audit_log_nfcfg(buf,
> > > +                       ctx->family,
> > > +                       ctx->table->use,
> > > +                       audit_nftcfgs[event].op);
> >
> > As an example, the below would work, yes?
> >
> > audit_log_nfcfg(...,
> >  (event == NFT_MSG_NEWTABLE ?
> >   AUDIT_NFT_OP_TABLE_REGISTER :
> >   AUDIT_NFT_OP_TABLE_UNREGISTER)
>
> Ok, I see what you are getting at now...  Yes, it could be done this
> way, but it seems noisier to me.

I'll admit it is not as clean, but it doesn't hide the mapping between
the netfilter operation and the audit operation which hopefully makes
it clear to those modifying the netfilter/nf_tables/etc. code that
there is an audit impact.  I'm basically trying to make sure the code
is as robust as possible in the face of subsystem changes beyond the
audit subsystem.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


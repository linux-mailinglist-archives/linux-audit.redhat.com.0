Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AC30731E320
	for <lists+linux-audit@lfdr.de>; Thu, 18 Feb 2021 00:42:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613605344;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eOkwQXqF3GyIckFqqUzfrQxcaExzmGWU2bKwkcjNWIE=;
	b=AmUIy+liwtOdaDPo4Vhl8K9XrAWVy7jMvHDhDsmV7QjFqZkH0wmb36U4A0QwLaxC2l2Cs8
	GmECuez+6PT+q2+9Y6K0FuqBR+9ndzGX4YnYGaqudyjO/5zetkpXCix5jmWCAKtHWMQ8A0
	xMlTY+d/x2y/65wqeHLrHxRAKOCiIA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-0j1bYL5mN4mM8Citozn3kA-1; Wed, 17 Feb 2021 18:42:22 -0500
X-MC-Unique: 0j1bYL5mN4mM8Citozn3kA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0584107ACF9;
	Wed, 17 Feb 2021 23:42:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B26110023AC;
	Wed, 17 Feb 2021 23:42:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D880B18095CB;
	Wed, 17 Feb 2021 23:42:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HNfgd6021679 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 18:41:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 905676B8D4; Wed, 17 Feb 2021 23:41:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DC8F648A2;
	Wed, 17 Feb 2021 23:41:34 +0000 (UTC)
Date: Wed, 17 Feb 2021 18:41:31 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Florian Westphal <fw@strlen.de>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20210217234131.GN3141668@madcap2.tricolour.ca>
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
	<20210211151606.GX3158@orbyte.nwl.cc>
	<CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
	<20210211202628.GP2015948@madcap2.tricolour.ca>
	<20210211220930.GC2766@breakpoint.cc>
MIME-Version: 1.0
In-Reply-To: <20210211220930.GC2766@breakpoint.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Phil Sutter <phil@nwl.cc>, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	Eric Paris <eparis@parisplace.org>, tgraf@infradead.org
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2021-02-11 23:09, Florian Westphal wrote:
> Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > I personally would notify once per transaction. This is easy and quick.
> > 
> > This was the goal.  iptables was atomic.  nftables appears to no longer
> > be so.  If I have this wrong, please show how that works.
> 
> nftables transactions are atomic, either the entire batch takes effect or not
> at all.
> 
> The audit_log_nfcfg() calls got added to the the nft monitor infra which
> is designed to allow userspace to follow the entire content of the
> transaction log.
> 
> So, if its just a 'something was changed' event that is needed all of
> them can be removed. ATM the audit_log_nfcfg() looks like this:
> 
>         /* step 3. Start new generation, rules_gen_X now in use. */
>         net->nft.gencursor = nft_gencursor_next(net);
> 
>         list_for_each_entry_safe(trans, next, &net->nft.commit_list, list) {
>                 switch (trans->msg_type) {
>                 case NFT_MSG_NEWTABLE:
> 			audit_log_nfcfg();
> 			...
> 		case NFT_MSG_...
> 			audit_log_nfcfg();
> 	..
> 	       	}
> 
> which gives an audit_log for every single change in the batch.
> 
> So, if just a summary is needed a single audit_log_nfcfg()
> after 'step 3' and outside of the list_for_each_entry_safe() is all
> that is needed.

Ok, so it should not matter if it is before or after that
list_for_each_entry_safe(), which could be used to collect that summary.

> If a summary is wanted as well one could fe. count the number of
> transaction types in the batch, e.g. table adds, chain adds, rule
> adds etc. and then log a summary count instead.

The current fields are "table", "family", "entries", "op".

Could one batch change more than one table?  (I think it could?)

It appears it can change more than one family.
"family" is currently a single integer, so that might need to be changed
to a list, or something to indicate multi-family.

A batch can certainly change more than one chain, but that was already a
bonus.

"entries" would be the obvious place for the summary count.

Listing all the ops seems a bit onerous.  Is there a hierarchy to the
ops and if so, are they in that order in a batch or in nf_tables_commit()?
It seems I'd need to filter out the NFT_MSG_GET_* ops.


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
https://listman.redhat.com/mailman/listinfo/linux-audit


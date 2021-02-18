Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 889D631EB00
	for <lists+linux-audit@lfdr.de>; Thu, 18 Feb 2021 15:37:00 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-hioeYRVNOzi6w7eHUY_7pA-1; Thu, 18 Feb 2021 09:36:57 -0500
X-MC-Unique: hioeYRVNOzi6w7eHUY_7pA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E377E79EC3;
	Thu, 18 Feb 2021 14:36:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 345BA10016F9;
	Thu, 18 Feb 2021 14:36:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67E5718095CC;
	Thu, 18 Feb 2021 14:36:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11IDfG3w024523 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Feb 2021 08:41:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B09A111E5B6; Thu, 18 Feb 2021 13:41:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB4BA11E5B4
	for <linux-audit@redhat.com>; Thu, 18 Feb 2021 13:41:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9376E186E120
	for <linux-audit@redhat.com>; Thu, 18 Feb 2021 13:41:13 +0000 (UTC)
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc
	[193.142.43.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-337-LswdWCkLOhGLS7VQK5XHbw-1; Thu, 18 Feb 2021 08:41:09 -0500
X-MC-Unique: LswdWCkLOhGLS7VQK5XHbw-1
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1lCjYI-0006xj-Uv; Thu, 18 Feb 2021 14:41:07 +0100
Date: Thu, 18 Feb 2021 14:41:06 +0100
From: Florian Westphal <fw@strlen.de>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20210218134106.GC22944@breakpoint.cc>
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
	<20210211151606.GX3158@orbyte.nwl.cc>
	<CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
	<20210211202628.GP2015948@madcap2.tricolour.ca>
	<20210211220930.GC2766@breakpoint.cc>
	<20210217234131.GN3141668@madcap2.tricolour.ca>
	<20210218082207.GJ2766@breakpoint.cc>
	<20210218124211.GO3141668@madcap2.tricolour.ca>
	<20210218125248.GB22944@breakpoint.cc>
	<20210218132843.GP3141668@madcap2.tricolour.ca>
MIME-Version: 1.0
In-Reply-To: <20210218132843.GP3141668@madcap2.tricolour.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 18 Feb 2021 09:32:33 -0500
Cc: Phil Sutter <phil@nwl.cc>, Florian Westphal <fw@strlen.de>,
	LKML <linux-kernel@vger.kernel.org>,
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

Richard Guy Briggs <rgb@redhat.com> wrote:
> Ok, can I get one more clarification on this "hierarchy"?  Is it roughly
> in the order they appear in nf_tables_commit() after step 3?  It appears
> it might be mostly already.  If it isn't already, would it be reasonable
> to re-order them?  Would you suggest a different order?

For audit purposes I think enum nf_tables_msg_types is already in the
most relevant order, the lower numbers being more imporant.

So e.g. NEWTABLE would be more interesting than DELRULE, if both
are in same batch.

> > > such that it would be desirable to filter them out
> > > to reduce noise in that single log line if it is attempted to list all
> > > the change ops?  It almost sounds like it would be better to do one
> > > audit log line for each table for each family, and possibly for each op
> > > to avoid the need to change userspace.  This would already be a
> > > significant improvement picking the highest ranking op.
> > 
> > I think i understand what you'd like to do.  Yes, that would reduce
> > the log output a lot.
> 
> Would the generation change id be useful outside the kernel?

Yes, we already announce it to interested parties via nfnetlink.

> What
> exactly does it look like?

Its just a u64 counter that gets incremented whenever there is a change.

> I don't quite understand the genmask purpose.

Thats an implementation detail only.  When we process a transaction,
changes to the ruleset are being made but they should not have any
effect until the entire transaction is processed.

So there are two 'generations' at any time:
1. The active ruleset
2. The future ruleset

2) is what is being changed/modified.

When the transaction completes, then the future ruleset becomes
the active ruleset.  If the transaction has to be aborted, the
pending changes are reverted and the genid/genmasks are not changed.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


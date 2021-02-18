Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DF50431F19C
	for <lists+linux-audit@lfdr.de>; Thu, 18 Feb 2021 22:21:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613683292;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WpalXOtzEifaVyQniQk86ZG2iblvPS3xF4fYk5SPra4=;
	b=b5nUlQ+XTr+n15oVOr8qnL3iuNrqSlTWBhwoQfyZvscKG5dXHR2zQgPa9JFLYE3uPXPScp
	vs2MhC+WP+ZRCBsLJSTrIenUMc4UqH9pECveVtpsYp74eZmODft7acckhWu0mWMEtLecfY
	cuGnz8ZOnFh0RaDh5HI2Us7lULkF/ek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-Imo47ZnVORuF17Bs9uyXJg-1; Thu, 18 Feb 2021 16:21:30 -0500
X-MC-Unique: Imo47ZnVORuF17Bs9uyXJg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C4ACEC1A2;
	Thu, 18 Feb 2021 21:21:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95F4B18F0A;
	Thu, 18 Feb 2021 21:21:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA00118095CB;
	Thu, 18 Feb 2021 21:21:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11ILKFGc010860 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Feb 2021 16:20:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 727885D9C6; Thu, 18 Feb 2021 21:20:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CFD85D9C2;
	Thu, 18 Feb 2021 21:20:03 +0000 (UTC)
Date: Thu, 18 Feb 2021 16:20:01 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Florian Westphal <fw@strlen.de>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20210218212001.GQ3141668@madcap2.tricolour.ca>
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
	<20210211151606.GX3158@orbyte.nwl.cc>
	<CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
	<20210211202628.GP2015948@madcap2.tricolour.ca>
	<20210211220930.GC2766@breakpoint.cc>
	<20210217234131.GN3141668@madcap2.tricolour.ca>
	<20210218082207.GJ2766@breakpoint.cc>
	<20210218124211.GO3141668@madcap2.tricolour.ca>
	<20210218125248.GB22944@breakpoint.cc>
MIME-Version: 1.0
In-Reply-To: <20210218125248.GB22944@breakpoint.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2021-02-18 13:52, Florian Westphal wrote:
> Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2021-02-18 09:22, Florian Westphal wrote:
> > > > It seems I'd need to filter out the NFT_MSG_GET_* ops.
> > > 
> > > No need, the GET ops do not cause changes and will not trigger a
> > > generation id change.
> > 
> > Ah, so it could trigger on generation change.  Would GET ops be included
> > in any other change
> 
> No, GET ops are standalone, they cannot be part of a transaction.
> If you look at
> 
> static const struct nfnl_callback nf_tables_cb[NFT_MSG_MAX] = {
> 
> array in nf_tables_api.c, then those ops with a '.call_batch' can
> appear in transaction (i.e., can cause modification).
> 
> The other ones (.call_rcu) are read-only.
> 
> If they appear in a batch tehy will be ignored, if the batch consists of
> such non-modifying ops only then nf_tables_commit() returns early
> because the transaction list is empty (nothing to do/change).

Ok, one little inconvenient question: what about GETOBJ_RESET?  That
looks like a hybrid that modifies kernel table counters and reports
synchronously.  That could be a special case call in
nf_tables_dump_obj() and nf_tables_getobj().  Will that cause a storm
per commit?

> > such that it would be desirable to filter them out
> > to reduce noise in that single log line if it is attempted to list all
> > the change ops?  It almost sounds like it would be better to do one
> > audit log line for each table for each family, and possibly for each op
> > to avoid the need to change userspace.  This would already be a
> > significant improvement picking the highest ranking op.
> 
> I think i understand what you'd like to do.  Yes, that would reduce
> the log output a lot.

Coded, testing...

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


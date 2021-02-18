Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A51FE31E9E5
	for <lists+linux-audit@lfdr.de>; Thu, 18 Feb 2021 13:43:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613652184;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Bj3YXOE/f7vj3uBJorzXQfCkYDzB5pmoDG9hWmPqzS8=;
	b=Yj4Bhw10sKiYzZtdL9ktcvdDsBZ/RlN7uwSOCHvR2KGsNk+BycDyRfci9qs5X+C5JxAaEe
	ib4oH1il4AYA13xhbJnHQR45laaldrWUWmsjoq05ZP1L+XIDJsrG4Fpo0NX9eb9+PVy0xZ
	J5qsPTEoAin6Oalc9Ca7+5r2yo6AofQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42--pppAh6bM06lRZ4nU4v7mQ-1; Thu, 18 Feb 2021 07:43:02 -0500
X-MC-Unique: -pppAh6bM06lRZ4nU4v7mQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C9E980196E;
	Thu, 18 Feb 2021 12:42:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 214365D9C2;
	Thu, 18 Feb 2021 12:42:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9967A18095CB;
	Thu, 18 Feb 2021 12:42:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11ICgLx9016051 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Feb 2021 07:42:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E54A319D80; Thu, 18 Feb 2021 12:42:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4DB019D61;
	Thu, 18 Feb 2021 12:42:13 +0000 (UTC)
Date: Thu, 18 Feb 2021 07:42:11 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Florian Westphal <fw@strlen.de>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20210218124211.GO3141668@madcap2.tricolour.ca>
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
	<20210211151606.GX3158@orbyte.nwl.cc>
	<CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
	<20210211202628.GP2015948@madcap2.tricolour.ca>
	<20210211220930.GC2766@breakpoint.cc>
	<20210217234131.GN3141668@madcap2.tricolour.ca>
	<20210218082207.GJ2766@breakpoint.cc>
MIME-Version: 1.0
In-Reply-To: <20210218082207.GJ2766@breakpoint.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2021-02-18 09:22, Florian Westphal wrote:
> Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2021-02-11 23:09, Florian Westphal wrote:
> > > So, if just a summary is needed a single audit_log_nfcfg()
> > > after 'step 3' and outside of the list_for_each_entry_safe() is all
> > > that is needed.
> > 
> > Ok, so it should not matter if it is before or after that
> > list_for_each_entry_safe(), which could be used to collect that summary.
> 
> Right, it won't matter.
> 
> > > If a summary is wanted as well one could fe. count the number of
> > > transaction types in the batch, e.g. table adds, chain adds, rule
> > > adds etc. and then log a summary count instead.
> > 
> > The current fields are "table", "family", "entries", "op".
> > 
> > Could one batch change more than one table?  (I think it could?)
> 
> Yes.

Ok, listing all tables involved in one commit with deduplication will be
a bit of a nuisance.

> > It appears it can change more than one family.
> > "family" is currently a single integer, so that might need to be changed
> > to a list, or something to indicate multi-family.
> 
> Yes, it can also affect different families.
> 
> > Listing all the ops seems a bit onerous.  Is there a hierarchy to the
> > ops and if so, are they in that order in a batch or in nf_tables_commit()?
> 
> No.  There is a hierarchy, e.g. you can't add a chain without first
> adding a table, BUT in case the table was already created by an earlier
> transaction it can also be stand-alone.

Ok, so there could be a stand-alone chain mod with one table, then a
table add of a different one with a "higher ranking" op...

> > It seems I'd need to filter out the NFT_MSG_GET_* ops.
> 
> No need, the GET ops do not cause changes and will not trigger a
> generation id change.

Ah, so it could trigger on generation change.  Would GET ops be included
in any other change, such that it would be desirable to filter them out
to reduce noise in that single log line if it is attempted to list all
the change ops?  It almost sounds like it would be better to do one
audit log line for each table for each family, and possibly for each op
to avoid the need to change userspace.  This would already be a
significant improvement picking the highest ranking op.

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


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9D431FF61
	for <lists+linux-audit@lfdr.de>; Fri, 19 Feb 2021 20:26:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613762767;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8QEfH/o6+QI19rFD25KAesLSol4SwhTmJBTKw2kBoY4=;
	b=DE3QGWXucsEVmWn4ZeVI0c2gYAjD5RwwhQv9sv+0Ns8Xtp065lsVwYnWiPsi5LOOcG4She
	wu3WEQOltsKAKaQHUl1lz65flT8FLgKsZiMI6ciS9WhqkzENx9nyL0SMNKMYG/mto52maA
	33Vx6a1g3wjwr0QTO0U0W9NG9uo3pQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-NH42marbN9mgE3lg9wAEtQ-1; Fri, 19 Feb 2021 14:26:01 -0500
X-MC-Unique: NH42marbN9mgE3lg9wAEtQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9207A8799EC;
	Fri, 19 Feb 2021 19:25:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1844D10016F5;
	Fri, 19 Feb 2021 19:25:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF8F818095CB;
	Fri, 19 Feb 2021 19:25:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11JJPMtq002028 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 19 Feb 2021 14:25:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 829E66E520; Fri, 19 Feb 2021 19:25:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 096186A035;
	Fri, 19 Feb 2021 19:25:14 +0000 (UTC)
Date: Fri, 19 Feb 2021 14:25:12 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Florian Westphal <fw@strlen.de>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20210219192512.GR3141668@madcap2.tricolour.ca>
References: <CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
	<20210211202628.GP2015948@madcap2.tricolour.ca>
	<20210211220930.GC2766@breakpoint.cc>
	<20210217234131.GN3141668@madcap2.tricolour.ca>
	<20210218082207.GJ2766@breakpoint.cc>
	<20210218124211.GO3141668@madcap2.tricolour.ca>
	<20210218125248.GB22944@breakpoint.cc>
	<20210218212001.GQ3141668@madcap2.tricolour.ca>
	<20210218224200.GF22944@breakpoint.cc>
	<20210219062651.GR2015948@madcap2.tricolour.ca>
MIME-Version: 1.0
In-Reply-To: <20210219062651.GR2015948@madcap2.tricolour.ca>
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

On 2021-02-19 01:26, Richard Guy Briggs wrote:
> On 2021-02-18 23:42, Florian Westphal wrote:
> > Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > If they appear in a batch tehy will be ignored, if the batch consists of
> > > > such non-modifying ops only then nf_tables_commit() returns early
> > > > because the transaction list is empty (nothing to do/change).
> > > 
> > > Ok, one little inconvenient question: what about GETOBJ_RESET?  That
> > > looks like a hybrid that modifies kernel table counters and reports
> > > synchronously.  That could be a special case call in
> > > nf_tables_dump_obj() and nf_tables_getobj().  Will that cause a storm
> > > per commit?
> > 
> > No, since they can't be part of a commit (they don't implement the
> > 'call_batch' function).
> 
> Ok, good, so they should be safe (but still needs the gfp param to
> audit_log_nfcfg() for atomic alloc in that obj reset callback).

I just noticed that nft_quota_obj_eval() misses logging NFT_MSG_NEWOBJ
in nf_tables_commit(), so that looks like it should be added.

> - RGB

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


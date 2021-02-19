Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DF25031F514
	for <lists+linux-audit@lfdr.de>; Fri, 19 Feb 2021 07:27:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613716063;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3eg5CbncRbC/nMgnK+TI1cY1VWMVbYSJnnrkmY1kuNU=;
	b=HbRXIGkJk5P/Dwx8gOQH72qb6yaJ5pF6Uew5P/ILhb3CniaKgIlZG6l/iqoapEyQSP9Jdi
	qI/hYYdhk/xwGTQtJnzQh3XN8/uq6xcE5uJWaRLptAO7cOTz621u9u7EEpRXhirYkE1pct
	12Li2VhI2y/YtnKT89Mv9eXfWfGFJ00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-rf_Q2cEaM_KlugU076k3uw-1; Fri, 19 Feb 2021 01:27:42 -0500
X-MC-Unique: rf_Q2cEaM_KlugU076k3uw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EC161E561;
	Fri, 19 Feb 2021 06:27:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F05B50DDE;
	Fri, 19 Feb 2021 06:27:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A49284EE4D;
	Fri, 19 Feb 2021 06:27:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11J6R2Zj005504 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 19 Feb 2021 01:27:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 223945D9D2; Fri, 19 Feb 2021 06:27:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABEC45D9C2;
	Fri, 19 Feb 2021 06:26:53 +0000 (UTC)
Date: Fri, 19 Feb 2021 01:26:51 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Florian Westphal <fw@strlen.de>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20210219062651.GR2015948@madcap2.tricolour.ca>
References: <20210211151606.GX3158@orbyte.nwl.cc>
	<CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
	<20210211202628.GP2015948@madcap2.tricolour.ca>
	<20210211220930.GC2766@breakpoint.cc>
	<20210217234131.GN3141668@madcap2.tricolour.ca>
	<20210218082207.GJ2766@breakpoint.cc>
	<20210218124211.GO3141668@madcap2.tricolour.ca>
	<20210218125248.GB22944@breakpoint.cc>
	<20210218212001.GQ3141668@madcap2.tricolour.ca>
	<20210218224200.GF22944@breakpoint.cc>
MIME-Version: 1.0
In-Reply-To: <20210218224200.GF22944@breakpoint.cc>
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

On 2021-02-18 23:42, Florian Westphal wrote:
> Richard Guy Briggs <rgb@redhat.com> wrote:
> > > If they appear in a batch tehy will be ignored, if the batch consists of
> > > such non-modifying ops only then nf_tables_commit() returns early
> > > because the transaction list is empty (nothing to do/change).
> > 
> > Ok, one little inconvenient question: what about GETOBJ_RESET?  That
> > looks like a hybrid that modifies kernel table counters and reports
> > synchronously.  That could be a special case call in
> > nf_tables_dump_obj() and nf_tables_getobj().  Will that cause a storm
> > per commit?
> 
> No, since they can't be part of a commit (they don't implement the
> 'call_batch' function).

Ok, good, so they should be safe (but still needs the gfp param to
audit_log_nfcfg() for atomic alloc in that obj reset callback).

> I'm not sure GETOBJ_RESET should be reported in the first place:
> RESET only affects expr internal state, and that state changes all the time
> anyway in response to network traffic.

We report audit lost messages reset as a config change since it affects
the view that an admin has about a system.  An unaccounted for reset
could mislead an administrator into thinking things are alright when
some messages were lost and there was nothing to show for it.  I could
see similar situations with network entity counters.

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


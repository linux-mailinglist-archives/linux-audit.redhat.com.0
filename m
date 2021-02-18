Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3103631F288
	for <lists+linux-audit@lfdr.de>; Thu, 18 Feb 2021 23:51:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-05uc8UdgPJS5XGmFsnQqzw-1; Thu, 18 Feb 2021 17:51:41 -0500
X-MC-Unique: 05uc8UdgPJS5XGmFsnQqzw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47BAE1005501;
	Thu, 18 Feb 2021 22:51:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D42C18F0A;
	Thu, 18 Feb 2021 22:51:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB6B818095CB;
	Thu, 18 Feb 2021 22:51:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11IMgDsP019483 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Feb 2021 17:42:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 45A3C2166B2D; Thu, 18 Feb 2021 22:42:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF70721121A3
	for <linux-audit@redhat.com>; Thu, 18 Feb 2021 22:42:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AA5185A59D
	for <linux-audit@redhat.com>; Thu, 18 Feb 2021 22:42:10 +0000 (UTC)
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc
	[193.142.43.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-510-lO8094hdOgCpbDEcfjZoCQ-1; Thu, 18 Feb 2021 17:42:05 -0500
X-MC-Unique: lO8094hdOgCpbDEcfjZoCQ-1
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1lCrzk-0000sB-40; Thu, 18 Feb 2021 23:42:00 +0100
Date: Thu, 18 Feb 2021 23:42:00 +0100
From: Florian Westphal <fw@strlen.de>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20210218224200.GF22944@breakpoint.cc>
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
	<20210211151606.GX3158@orbyte.nwl.cc>
	<CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
	<20210211202628.GP2015948@madcap2.tricolour.ca>
	<20210211220930.GC2766@breakpoint.cc>
	<20210217234131.GN3141668@madcap2.tricolour.ca>
	<20210218082207.GJ2766@breakpoint.cc>
	<20210218124211.GO3141668@madcap2.tricolour.ca>
	<20210218125248.GB22944@breakpoint.cc>
	<20210218212001.GQ3141668@madcap2.tricolour.ca>
MIME-Version: 1.0
In-Reply-To: <20210218212001.GQ3141668@madcap2.tricolour.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 18 Feb 2021 17:51:06 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Richard Guy Briggs <rgb@redhat.com> wrote:
> > If they appear in a batch tehy will be ignored, if the batch consists of
> > such non-modifying ops only then nf_tables_commit() returns early
> > because the transaction list is empty (nothing to do/change).
> 
> Ok, one little inconvenient question: what about GETOBJ_RESET?  That
> looks like a hybrid that modifies kernel table counters and reports
> synchronously.  That could be a special case call in
> nf_tables_dump_obj() and nf_tables_getobj().  Will that cause a storm
> per commit?

No, since they can't be part of a commit (they don't implement the
'call_batch' function).

I'm not sure GETOBJ_RESET should be reported in the first place:
RESET only affects expr internal state, and that state changes all the time
anyway in response to network traffic.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


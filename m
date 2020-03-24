Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 3E600191B9E
	for <lists+linux-audit@lfdr.de>; Tue, 24 Mar 2020 22:02:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585083760;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=E6nYUJwxm9m5DqCTJ6DZy0no+kFUx+Gi6H6c+PfMw58=;
	b=KnkVPO+BFinwj6m88KUCXgRjIInfwtJ7BQS+IIwYP7NUYzcEG5aCOCBj7Tej6fNCOatKO5
	hc1b5qnAaJOQp7ayaIvmIshHdrrtz80+e4/1Br5Mhe8BzuAgIr1bur1vc6iEbxj8LLJpBV
	AZAYU6ud1ct4qcGVOCvgaKM+Ft4XDxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-cKGtxDIfMPCxxcak09wLag-1; Tue, 24 Mar 2020 17:02:38 -0400
X-MC-Unique: cKGtxDIfMPCxxcak09wLag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79DF4107ACC4;
	Tue, 24 Mar 2020 21:02:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D0C261069;
	Tue, 24 Mar 2020 21:02:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5170E18034EA;
	Tue, 24 Mar 2020 21:02:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02OL28aH006464 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 17:02:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C814E194BB; Tue, 24 Mar 2020 21:02:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.11])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FADC19925;
	Tue, 24 Mar 2020 21:01:54 +0000 (UTC)
Date: Tue, 24 Mar 2020 17:01:52 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
Message-ID: <20200324210152.5uydf3zqi3dwshfu@madcap2.tricolour.ca>
References: <20200312193037.2tb5f53yeisfq4ta@madcap2.tricolour.ca>
	<CAHC9VhQoVOzy_b9W6h+kmizKr1rPkC4cy5aYoKT2i0ZgsceNDg@mail.gmail.com>
	<20200313185900.y44yvrfm4zxa5lfk@madcap2.tricolour.ca>
	<CAHC9VhR2zCCE5bjH75rSwfLC7TJGFj4RBnrtcOoUiqVp9q5TaA@mail.gmail.com>
	<20200318212630.mw2geg4ykhnbtr3k@madcap2.tricolour.ca>
	<CAHC9VhRYvGAru3aOMwWKCCWDktS+2pGr+=vV4SjHW_0yewD98A@mail.gmail.com>
	<20200318215550.es4stkjwnefrfen2@madcap2.tricolour.ca>
	<CAHC9VhSdDDP7Ec-w61NhGxZG5ZiekmrBCAg=Y=VJvEZcgQh46g@mail.gmail.com>
	<20200319220249.jyr6xmwvflya5mks@madcap2.tricolour.ca>
	<CAHC9VhR84aN72yNB_j61zZgrQV1y6yvrBLNY7jp7BqQiEDL+cw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhR84aN72yNB_j61zZgrQV1y6yvrBLNY7jp7BqQiEDL+cw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	ebiederm@xmission.com, simo@redhat.com, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-03-23 20:16, Paul Moore wrote:
> On Thu, Mar 19, 2020 at 6:03 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-03-18 18:06, Paul Moore wrote:
> 
> ...
> 
> > > I hope we can do better than string manipulations in the kernel.  I'd
> > > much rather defer generating the ACID list (if possible), than
> > > generating a list only to keep copying and editing it as the record is
> > > sent.
> >
> > At the moment we are stuck with a string-only format.
> 
> Yes, we are.  That is another topic, and another set of changes I've
> been deferring so as to not disrupt the audit container ID work.
> 
> I was thinking of what we do inside the kernel between when the record
> triggering event happens and when we actually emit the record to
> userspace.  Perhaps we collect the ACID information while the event is
> occurring, but we defer generating the record until later when we have
> a better understanding of what should be included in the ACID list.
> It is somewhat similar (but obviously different) to what we do for
> PATH records (we collect the pathname info when the path is being
> resolved).

Ok, now I understand your concern.

In the case of NETFILTER_PKT records, the CONTAINER_ID record is the
only other possible record and they are generated at the same time with
a local context.

In the case of any event involving a syscall, that CONTAINER_ID record
is generated at the time of the rest of the event record generation at
syscall exit.

The others are only generated when needed, such as the sig2 reply.

We generally just store the contobj pointer until we actually generate
the CONTAINER_ID (or CONTAINER_OP) record.

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


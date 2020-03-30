Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 09D62197D73
	for <lists+linux-audit@lfdr.de>; Mon, 30 Mar 2020 15:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576081;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PjOkNdreN6DXo1iLyoBtp0mIExgYVwF/gXncY7C7vQI=;
	b=LmaUvR9GFeKw2n0cfxbVvUzHP9ti2puqiHI6zvr8B81SCaR1ace+PcWBf+O9OjUa1qY/pV
	AiPoM9cZfJQkc8jI1Ew61lq9515cgQvAekeY6v1kF0DDotIlSeJOGFryiN+nLtVOCQS7as
	Aag79DynzwOuu2ebqMRWjbQKz4ikjOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-yeFw0xSrN5qe-1G1D7uaNw-1; Mon, 30 Mar 2020 09:47:59 -0400
X-MC-Unique: yeFw0xSrN5qe-1G1D7uaNw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43A53149C5;
	Mon, 30 Mar 2020 13:47:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE7635C1B5;
	Mon, 30 Mar 2020 13:47:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE8FA944CA;
	Mon, 30 Mar 2020 13:47:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDlJa3020801 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:47:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A749148; Mon, 30 Mar 2020 13:47:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6512097B1B;
	Mon, 30 Mar 2020 13:47:08 +0000 (UTC)
Date: Mon, 30 Mar 2020 09:47:05 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
Message-ID: <20200330134705.jlrkoiqpgjh3rvoh@madcap2.tricolour.ca>
References: <20200313185900.y44yvrfm4zxa5lfk@madcap2.tricolour.ca>
	<CAHC9VhR2zCCE5bjH75rSwfLC7TJGFj4RBnrtcOoUiqVp9q5TaA@mail.gmail.com>
	<20200318212630.mw2geg4ykhnbtr3k@madcap2.tricolour.ca>
	<CAHC9VhRYvGAru3aOMwWKCCWDktS+2pGr+=vV4SjHW_0yewD98A@mail.gmail.com>
	<20200318215550.es4stkjwnefrfen2@madcap2.tricolour.ca>
	<CAHC9VhSdDDP7Ec-w61NhGxZG5ZiekmrBCAg=Y=VJvEZcgQh46g@mail.gmail.com>
	<20200319220249.jyr6xmwvflya5mks@madcap2.tricolour.ca>
	<CAHC9VhR84aN72yNB_j61zZgrQV1y6yvrBLNY7jp7BqQiEDL+cw@mail.gmail.com>
	<20200324210152.5uydf3zqi3dwshfu@madcap2.tricolour.ca>
	<CAHC9VhTQUnVhoN3JXTAQ7ti+nNLfGNVXhT6D-GYJRSpJHCwDRg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTQUnVhoN3JXTAQ7ti+nNLfGNVXhT6D-GYJRSpJHCwDRg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-03-28 23:11, Paul Moore wrote:
> On Tue, Mar 24, 2020 at 5:02 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-03-23 20:16, Paul Moore wrote:
> > > On Thu, Mar 19, 2020 at 6:03 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > On 2020-03-18 18:06, Paul Moore wrote:
> > >
> > > ...
> > >
> > > > > I hope we can do better than string manipulations in the kernel.  I'd
> > > > > much rather defer generating the ACID list (if possible), than
> > > > > generating a list only to keep copying and editing it as the record is
> > > > > sent.
> > > >
> > > > At the moment we are stuck with a string-only format.
> > >
> > > Yes, we are.  That is another topic, and another set of changes I've
> > > been deferring so as to not disrupt the audit container ID work.
> > >
> > > I was thinking of what we do inside the kernel between when the record
> > > triggering event happens and when we actually emit the record to
> > > userspace.  Perhaps we collect the ACID information while the event is
> > > occurring, but we defer generating the record until later when we have
> > > a better understanding of what should be included in the ACID list.
> > > It is somewhat similar (but obviously different) to what we do for
> > > PATH records (we collect the pathname info when the path is being
> > > resolved).
> >
> > Ok, now I understand your concern.
> >
> > In the case of NETFILTER_PKT records, the CONTAINER_ID record is the
> > only other possible record and they are generated at the same time with
> > a local context.
> >
> > In the case of any event involving a syscall, that CONTAINER_ID record
> > is generated at the time of the rest of the event record generation at
> > syscall exit.
> >
> > The others are only generated when needed, such as the sig2 reply.
> >
> > We generally just store the contobj pointer until we actually generate
> > the CONTAINER_ID (or CONTAINER_OP) record.
> 
> Perhaps I'm remembering your latest spin of these patches incorrectly,
> but there is still a big gap between when the record is generated and
> when it is sent up to the audit daemon.  Most importantly in that gap
> is the whole big queue/multicast/unicast mess.

So you suggest generating that record on the fly once it reaches the end
of the audit_queue just before being sent?  That sounds...  disruptive.
Each audit daemon is going to have its own queues, so by the time it
ends up in a particular queue, we'll already know its scope and would
have the right list of contids to print in that record.

I don't see the point in deferring the generation of the contid list
beyond the point of submitting that record to the relevant audit_queue.

> You don't need to show me code, but I would like to see some sort of
> plan for dealing with multiple nested audit daemons.  Basically I just
> want to make sure we aren't painting ourselves into a corner with this
> approach; and if for some horrible reason we are, I at least want us
> to be aware of what we are getting ourselves into.

It wouldn't be significantly different from what we have, but as would
have to happen for *all* records generated to a particular auditd/queue
it would have to take the scope of that auditd into account, getting
references to PIDs right for that PID namespace, along with other
similar scope views including contid list range.

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


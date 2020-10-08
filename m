Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BAF72287487
	for <lists+linux-audit@lfdr.de>; Thu,  8 Oct 2020 14:50:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602161420;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IG0e/CEmAZJMzSvlYz7YK1xYvySzSmDxLBtyj5yTN8g=;
	b=Rdoph5K0PKzKb7HawgJCiCF/hccnVdsoSUjjo1v80IEs/qH0Me4RelHpJQeufoFoAErFPI
	+6mvtGpL4TwJemRjKgjzGbpuNyxXzFeSTdnEklHuLMm5447Y3BYl/DMi4sUwqLeS0GfII0
	4Hrz4+ai2p4xOHjgwqQqWzQH5b+xaBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-T3LfSLzfPhKfWzhUNYxGYw-1; Thu, 08 Oct 2020 08:50:18 -0400
X-MC-Unique: T3LfSLzfPhKfWzhUNYxGYw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA42981EE65;
	Thu,  8 Oct 2020 12:50:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6EAD7664D;
	Thu,  8 Oct 2020 12:50:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D3EF57A00B;
	Thu,  8 Oct 2020 12:50:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 098CnrxA005768 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 8 Oct 2020 08:49:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8375119930; Thu,  8 Oct 2020 12:49:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35F3719C4F;
	Thu,  8 Oct 2020 12:49:47 +0000 (UTC)
Date: Thu, 8 Oct 2020 08:49:44 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: Identifying thread/process termination
Message-ID: <20201008124944.GE2882178@madcap2.tricolour.ca>
References: <CAPErmPdDACGemKqTrUk4xKNBwnoj6FEeWbsvmk7jS0TjOyaOqg@mail.gmail.com>
	<5549003.MhkbZ0Pkbq@x2>
	<CAHC9VhThN4R7jsukKrmjVG=6Rm07jWwjcNQ5CS4v6JzMh+NQbg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhThN4R7jsukKrmjVG=6Rm07jWwjcNQ5CS4v6JzMh+NQbg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-10-07 21:27, Paul Moore wrote:
> On Tue, Oct 6, 2020 at 4:20 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > On Monday, October 5, 2020 3:07:12 PM EDT Natan Yellin wrote:
> > > I've been tracking all process terminations using a rule for the exit and
> > > exit_group syscalls. However, by looking at the audit events for exit it is
> > > impossible to differentiate between the death of different threads in the
> > > same thread group. Is there an alternative way to track this?
> >
> > I don't think the audit system was ever designed to distinguish between
> > threads. But there is a general need to determine the exit of a process
> > rather than a thread.
> >
> > Paul, Richard, Do you have any thoughts?
> 
> Almost everywhere in the kernel we record the TGID for the "pid="
> values and not the actual task/thread ID.  That decision was made
> before my heavy involvement with audit, but my guess is that most
> audit users are focused more on security relevant events at the
> process level, not the thread level.  After all, there isn't really
> much in the way of significant boundaries between threads.
> 
> To get the information you are looking for, I think we would need to
> add an additional task/thread ID to the relevant records and that
> would be *very* messy.

I would say that adding a thread ID rather than changing any existing
fields would be the safe way to go, but adds overhead and information to
wade through.

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


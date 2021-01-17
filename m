Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5C84B2F9567
	for <lists+linux-audit@lfdr.de>; Sun, 17 Jan 2021 22:13:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610918015;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GbjgaA29EQlQeKc/R+cUPZj9cNWzDTVHFR0aX4FSvUA=;
	b=M3BQ/yK5Fk2B8lV5h350JgfWhG0bdB3Hq6Y0Ix5xj8/JDYkahOwbkYnPFh2v96+JaYZcZA
	To7DsqNQQ533QV5Dbamjf3rioh9tRsFXy5rZ/BE8tSdnaPUnz236tXBVDcgvXMXePC7MxP
	4LSP8sY205Pm7tREE6MFTCOkZmhDTaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-T6GQjujnMDGQUiZXeb3kGw-1; Sun, 17 Jan 2021 16:13:32 -0500
X-MC-Unique: T6GQjujnMDGQUiZXeb3kGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D64E610054FF;
	Sun, 17 Jan 2021 21:13:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02BC11002388;
	Sun, 17 Jan 2021 21:13:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F73D180954D;
	Sun, 17 Jan 2021 21:13:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10HLCeti030413 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 17 Jan 2021 16:12:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2798160C15; Sun, 17 Jan 2021 21:12:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-60.rdu2.redhat.com [10.10.113.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7E8560BE2;
	Sun, 17 Jan 2021 21:12:32 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: burn@swtf.dyndns.org, linux-audit@redhat.com
Subject: Re: Occasional delayed output of events
Date: Sun, 17 Jan 2021 16:12:32 -0500
Message-ID: <5445873.DvuYhMxLoT@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhT_moHEPvkQpN6YmPYrk9KGRwsEocvkTREdjV=qtmCtFg@mail.gmail.com>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<bdcc07550a210ac539863ab182b6cc2dabf473e8.camel@iinet.net.au>
	<CAHC9VhT_moHEPvkQpN6YmPYrk9KGRwsEocvkTREdjV=qtmCtFg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, Linux Audit <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sunday, January 17, 2021 9:07:08 AM EST Paul Moore wrote:
> On Fri, Jan 15, 2021 at 9:43 PM Burn Alting <burn.alting@iinet.net.au> 
wrote:
> > On Fri, 2021-01-15 at 19:35 -0500, Richard Guy Briggs wrote:
> >> Or we go back to userspace code looking for the EOE record?  This
> >> doesn't help if they arrive out of order.  Do we number the records in
> >> the kernel?  N of M...
> > 
> > I like the N of M concept but there would be a LOT of change - especially
> > for all the non-kernel event sources. The EOE would be the most
> > seamless, but at a cost. My preference is to allow the 2 second 'timer'
> > to be configurable.
>
> Agree with Burn, numbering the records coming up from the kernel is
> going to be a real nightmare, and not something to consider lightly.
> Especially when it sounds like we don't yet have a root cause for the
> issue.

A very long time ago, we had numbered records. But it was decided that 
there's no real point in it and we'd rather just save disk space.

I know that the kernel does not serialize the events headed for user space. 
But I'm curious how an event gets stuck and others can jump ahead while one 
that's already inflight can get hung for 4 seconds before it's next record 
goes out?

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


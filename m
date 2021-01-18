Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EE5C52FA339
	for <lists+linux-audit@lfdr.de>; Mon, 18 Jan 2021 15:38:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610980719;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TXQZdRQmNp6i/sU7YAwfwrmXYlywbzhGLkHaPLyv8go=;
	b=MljgZSoA9z5zmMFqXHh+IkDBNxiQGU+eU9bPpL6thq+ihvnQRU8xxvMvNf+uhX83/+EYa4
	82FLXYlxeHMPaQJoz8mP/rRhtpdP534kPLzIhTjJtXQ64Vd2NfSjv0hfzzXFK5E97CNaDy
	XvcEH8uw6pExtrshdlNzx7hazZejlHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-Czy3VMVRPlSrI6QAMS8bBA-1; Mon, 18 Jan 2021 09:38:38 -0500
X-MC-Unique: Czy3VMVRPlSrI6QAMS8bBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8439814503;
	Mon, 18 Jan 2021 14:38:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6898210023AD;
	Mon, 18 Jan 2021 14:38:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB09518095C7;
	Mon, 18 Jan 2021 14:38:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10IEVqln028664 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 18 Jan 2021 09:31:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B7DD41F471; Mon, 18 Jan 2021 14:31:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-115-68.rdu2.redhat.com [10.10.115.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29B8B17F6D;
	Mon, 18 Jan 2021 14:31:51 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: burn@swtf.dyndns.org, linux-audit@redhat.com,
	Paul Moore <paul@paul-moore.com>
Subject: Re: Occasional delayed output of events
Date: Mon, 18 Jan 2021 09:31:51 -0500
Message-ID: <3095712.44csPzL39Z@x2>
Organization: Red Hat
In-Reply-To: <17715c36170.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<5445873.DvuYhMxLoT@x2>
	<17715c36170.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On Monday, January 18, 2021 8:54:30 AM EST Paul Moore wrote:
> >>> I like the N of M concept but there would be a LOT of change -
> >>> especially
> >>> for all the non-kernel event sources. The EOE would be the most
> >>> seamless, but at a cost. My preference is to allow the 2 second 'timer'
> >>> to be configurable.
> >> 
> >> Agree with Burn, numbering the records coming up from the kernel is
> >> going to be a real nightmare, and not something to consider lightly.
> >> Especially when it sounds like we don't yet have a root cause for the
> >> issue.
> > 
> > A very long time ago, we had numbered records. But it was decided that
> > there's no real point in it and we'd rather just save disk space.
> 
> With the current kernel code, adding numbered records is not something to
> take lightly.

That's why I'm saying we had it and it was removed. I could imagine that if 
you had auditing of the kill syscall enabled and a whole process group was 
being killed, you could have hundreds of records that need numbering. No good 
way to know in advance how many records make up the event.

> > I know that the kernel does not serialize the events headed for user
> > space. But I'm curious how an event gets stuck and others can jump ahead
> > while one that's already inflight can get hung for 4 seconds before it's
> > next record goes out?
> 
> Have you determined that the problem is the kernel? 

I assume so because the kernel adds the timestamp and choses what hits the 
socket next. Auditd does no ordering of events. It just looks up the text 
event ID, some minor translation if the enriched format is being used, and 
writes it to disk. It can handle well over 100k records per second.

> Initially it was looking like it was a userspace issue, is that no longer
> the general thought?

I don't see how user space could cause this. Even if auditd was slow, it 
shouldn't take 4 seconds to write to disk and then come back to read another 
record. And even it did, why would the newest record go out before completing 
one that's in progress? Something in the kernel chooses what's next. I 
suspect that might need looking at.

> Also, is there a reliable reproducer yet?

I don't know of one. But, I suppose we could modify ausearch to look for 
examples of this.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


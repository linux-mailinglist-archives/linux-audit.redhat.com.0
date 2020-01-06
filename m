Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B617713133A
	for <lists+linux-audit@lfdr.de>; Mon,  6 Jan 2020 14:52:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578318762;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k0IYGBSz2SyV2nisoWkJn4uWitKi5B3jp1UewX/5Grg=;
	b=Tju/NogHNg7NL4DZnRjddBQyHEoOd4lRVro8mHFpl7TG1NTDtKO8aGEU5KOIvYnGf/rjg3
	WflN5i4bkchX10wmF63A6Yn5EG7Gqp2PoIzY4Slil6HKa55AHBRM94T1HYieYcw5oGuqTI
	WP6bMDhcJAnufnmHuLzX2mxQYEYsBQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-KVEbYgIvP6Chqj7qL4hAaw-1; Mon, 06 Jan 2020 08:52:40 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1954F8F0400;
	Mon,  6 Jan 2020 13:52:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50C5D10016EB;
	Mon,  6 Jan 2020 13:52:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6873A81C6D;
	Mon,  6 Jan 2020 13:52:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006DqFSI007684 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 08:52:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8270360F82; Mon,  6 Jan 2020 13:52:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-242.phx2.redhat.com [10.3.116.242])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA42160E1C;
	Mon,  6 Jan 2020 13:52:12 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
Subject: Re: USER_MGMT  event
Date: Mon, 06 Jan 2020 08:52:12 -0500
Message-ID: <3529393.oyAdU6xjk6@x2>
Organization: Red Hat
In-Reply-To: <5F4EE10832231F4F921A255C1D95429825ABCF@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D954298252E49@DEERLM99EX7MSX.ww931.my-it-solutions.net>
	<1686247.kkT0hDcqUl@x2>
	<5F4EE10832231F4F921A255C1D95429825ABCF@DEERLM99EX7MSX.ww931.my-it-solutions.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-MC-Unique: KVEbYgIvP6Chqj7qL4hAaw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, January 6, 2020 4:44:07 AM EST MAUPERTUIS, PHILIPPE wrote:
> On Monday, December 30, 2019 12:29:13 PM EST MAUPERTUIS, PHILIPPE wrote:
> > On a RHEL8 server, when playing around with usermod and  chsh, I noticed
> > that usermod -c 'root@xxx' root generates a user_mgmt event
> > But chsh -s /usr/bin/tlog-rec-session root didn't.
> > Is that the expected behavior ?
> 
> It depends. Did you get any event at all? There is a chance that you just
> have mismatching events.
> 
> > I was expecting an event for both.
> 
> There should be an event for both.
> 
> > Should I open a ticket at redhat for this ?
> 
> Let's see what the answer is for the above.

Based on the logs provided, I'd say that opening a ticket is the right thing 
to do.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


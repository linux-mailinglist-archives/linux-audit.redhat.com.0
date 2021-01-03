Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0E53E2E8CF5
	for <lists+linux-audit@lfdr.de>; Sun,  3 Jan 2021 16:41:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609688510;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MSbB4ltrynVNrxDduzYblTq15m2d+yM87Ur97kn+Dp8=;
	b=BxPLXWYHahkW7Oqv+eETy9o9n2YZgcQhdN4u8gSUG+H9n59LElc9LAt3NRX8008kq+fHpR
	sjIIeKPWBre6/zvQj50RgiQeQPw9pXEVvRs+aCZ+tQvt1YfiV9CAP+hdK2GPAMZEWXpfRQ
	D7oM5hM+B4Jc7DZQbCFxKSjwa0QlAGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-5oSXtXL0Mwqtx0Ud0n4MGQ-1; Sun, 03 Jan 2021 10:41:48 -0500
X-MC-Unique: 5oSXtXL0Mwqtx0Ud0n4MGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14D3959;
	Sun,  3 Jan 2021 15:41:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 080B1648A1;
	Sun,  3 Jan 2021 15:41:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0EB5A4BB7B;
	Sun,  3 Jan 2021 15:41:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 103Ff8aL025341 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 3 Jan 2021 10:41:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D83E55D9D5; Sun,  3 Jan 2021 15:41:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-86.rdu2.redhat.com [10.10.113.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EB3C5D9D3;
	Sun,  3 Jan 2021 15:41:04 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux Audit <linux-audit@redhat.com>
Subject: Re: Occasional delayed output of events
Date: Sun, 03 Jan 2021 10:41:02 -0500
Message-ID: <5426593.DvuYhMxLoT@x2>
Organization: Red Hat
In-Reply-To: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, January 1, 2021 4:22:33 PM EST Burn Alting wrote:
> Sometimes, events recorded in /var/log/audit/audit.log appear some seconds
> past co- located events which results in auparse:au_check_events() marking
> these events complete before they are. An example of this can be seen
> below with the offending event id 44609.
>
> This has been plaguing me for a year or two and this morning was the first
> time I still had access to the raw audit.log files (I monitor a lot of
> event types and the log files roll over fairly quickly).
> The example below is from a fully patched Centos 7 but I have also seen
> this on a patched Fedora 32.
> 
> Has this been seen before? Do we need to re-evaluate how auparse
> 'completes' an event (ie 2 seconds is too quick).

I have never seen this. But on the way to disk, auditd only does light 
processing of the event.  If the format is enriched, it looks things up on a 
record by record basis. It does not collect events until they are complete - 
it dumps it to disk as soon as it can tack on the extra information.

So, the question would be, does this delay happen on the way to disk? Or is 
this an artifact of post processing the logs with an auparse based utility? 
Can this be observed repeatedly on the same raw logs? If so, then maybe 
auparse does have some issue. But if this is a post processing issue, then 
the wall clock doesn't matter because this event should have collected up 
together.

I'd say this merits some investigation.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


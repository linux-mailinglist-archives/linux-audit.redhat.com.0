Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id AB14E13048D
	for <lists+linux-audit@lfdr.de>; Sat,  4 Jan 2020 22:12:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578172327;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y1TuENcg0fgH305dTAtneP7dOIZEj/OK8q7BKaPUGdM=;
	b=AcaHGbByK/BXgQAbG3eWVmvykfEU5ZRHfsMAVrL7WPZx6j35nuuAqdfZinYlOg3rboNLOS
	oMEfppqX6r/2LFlprFSD+qWHT7OIX7RXTyfMGncyJT+P7Kxz3sEVnXGypE/g0ZXexybhyr
	b9/Y4JfUdgVKwDFqxzR/xJI15+epO60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-9Qh36Ej9P5CeenCq909xMA-1; Sat, 04 Jan 2020 16:12:04 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19E75800D41;
	Sat,  4 Jan 2020 21:12:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F99E7DB27;
	Sat,  4 Jan 2020 21:11:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E3101809567;
	Sat,  4 Jan 2020 21:11:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 004LBqGS002437 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 4 Jan 2020 16:11:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 678457BA49; Sat,  4 Jan 2020 21:11:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-96.phx2.redhat.com [10.3.116.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28F3575750;
	Sat,  4 Jan 2020 21:11:49 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: USER_MGMT  event
Date: Sat, 04 Jan 2020 16:11:49 -0500
Message-ID: <1686247.kkT0hDcqUl@x2>
Organization: Red Hat
In-Reply-To: <5F4EE10832231F4F921A255C1D954298252E49@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D954298252E49@DEERLM99EX7MSX.ww931.my-it-solutions.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
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
X-MC-Unique: 9Qh36Ej9P5CeenCq909xMA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, December 30, 2019 12:29:13 PM EST MAUPERTUIS, PHILIPPE wrote:
> On a RHEL8 server, when playing around with usermod and  chsh, I noticed
> that usermod -c 'root@xxx' root generates a user_mgmt event
> But
> chsh -s /usr/bin/tlog-rec-session root didn't.
> Is that the expected behavior ?

It depends. Did you get any event at all? There is a chance that you just 
have mismatching events. 

> I was expecting an event for both.

There should be an event for both.

> Should I open a ticket at redhat for this ?

Let's see what the answer is for the above. But potentially yes. And if there 
is any change we'll be sure to get this into upstream shadow-utils so its 
uniform across all distros.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


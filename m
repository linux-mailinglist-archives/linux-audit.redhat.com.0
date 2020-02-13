Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3238915C8F0
	for <lists+linux-audit@lfdr.de>; Thu, 13 Feb 2020 17:55:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581612949;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gKkkUF7vBBAbU2R6JITXvokr7wPk88zTdKo7nE6ee+w=;
	b=aIKHdz0zTLwYABvh9KLkSJha8SU7ocA6e2vl9QsZlGBMk+bdQOTuQ4eFz6+vuK1QrD/On0
	GAYHcbzl2aXrFKQ31Q7lJADOdYdd+6Y3ZFrfbedluUd08gw9p90K0QZT4vGg+ImeUr69N9
	/5TWAT4h+C/eg5LhiIRE4YgSCiBuBlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-BxHQpndUOlSjnCJaN-56UQ-1; Thu, 13 Feb 2020 11:55:43 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4CE31800D6B;
	Thu, 13 Feb 2020 16:55:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 226798AC39;
	Thu, 13 Feb 2020 16:55:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88E611809567;
	Thu, 13 Feb 2020 16:55:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01DGtRso019715 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 11:55:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 819C990090; Thu, 13 Feb 2020 16:55:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-29.phx2.redhat.com [10.3.117.29])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29F4F9008F;
	Thu, 13 Feb 2020 16:55:24 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
Subject: Re: Auditing a program use but not what it is doing
Date: Thu, 13 Feb 2020 11:55:22 -0500
Message-ID: <14125267.1EXI0Z5HcE@x2>
Organization: Red Hat
In-Reply-To: <5F4EE10832231F4F921A255C1D9542982A0EB6@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D95429829F549@DEERLM99EX7MSX.ww931.my-it-solutions.net>
	<4711138.QvFmgxA1yv@x2>
	<5F4EE10832231F4F921A255C1D9542982A0EB6@DEERLM99EX7MSX.ww931.my-it-solutions.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: BxHQpndUOlSjnCJaN-56UQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, February 13, 2020 11:35:46 AM EST MAUPERTUIS, PHILIPPE wrote:
> > Objet : Re: Auditing a program use but not what it is doing
> > 
> > On Wednesday, February 12, 2020 5:01:37 AM EST MAUPERTUIS, PHILIPPE
> > 
> > wrote:
> > > Like many, we are using aide and clamav.
> > > I woud like to have an audit record when these program are run but no
> > > records for what they are doing. I mean, I want to know that clamscan
> > > or
> > > aide has been launched but not that it checks say /etc/passwd whatever
> > > rules could be in place for /etc/passwd
> > 
> > Then all you need to do is place a watch on them.
> > 
> > -a always,exit -F path=path-to-aide -F perm=x -F key=something-ran
> 
> Just to be sure to understand how it works :
> If we have two rules in that order :
> -a always,exit -F arch=b64 -F exe=/sbin/aide -F perm=x  -F key=aide_run

The exe option is to audit syscalls by a specific application. For example,
you might want to use it to see what IP address and application connects to.

-a always,exit -F arch=b64 -S connect,recvfrom -F auid>=1000 -F auid!=-1 -F exe=/usr/bin/bash

To place a _watch_ on a file, you use the path option with permission of
executable. The rule above should be:

-a always,exit -F path=/usr/sbin/aide -F perm=x  -F key=aide_run

There should be other examples like this in the shipped rules.

> -a always,exit -F path=/etc/passwd -F perm=wa -F key=10.2.5.c-accounts

This will create an event whenever an application writes to or changes
permissions of passwd. Try running adduser or chmod it.

> When running aide :
> -  the first rule produces a message
> - the second rule  is ignored

It would only trigger on a write/permission change.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


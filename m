Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A985CB0F74
	for <lists+linux-audit@lfdr.de>; Thu, 12 Sep 2019 15:02:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF3F33D95A;
	Thu, 12 Sep 2019 13:02:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1B57410E;
	Thu, 12 Sep 2019 13:02:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB23C180221F;
	Thu, 12 Sep 2019 13:02:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8CCti8V010305 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 12 Sep 2019 08:55:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5DD233DE0; Thu, 12 Sep 2019 12:55:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-79.phx2.redhat.com [10.3.117.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 495D0410E;
	Thu, 12 Sep 2019 12:55:41 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Giovanni Panepinto <gpanepinto@fastmail.fm>
Subject: Re: When is EOE generated?
Date: Thu, 12 Sep 2019 08:55:40 -0400
Message-ID: <2241113.VGNmPeWy4c@x2>
Organization: Red Hat
In-Reply-To: <a66ead37-2959-448a-a688-838f58798ce5@www.fastmail.com>
References: <bd4b2f99-89a0-4d59-aeb9-a97be31b0445@www.fastmail.com>
	<15531009.1YdTc8d0Yq@x2>
	<a66ead37-2959-448a-a688-838f58798ce5@www.fastmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, linux-audit@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Thu, 12 Sep 2019 13:02:19 +0000 (UTC)

On Wednesday, September 11, 2019 8:59:32 PM EDT Giovanni Panepinto wrote:
> Thanks for the response Steve.
> 
> What exact criteria the deamon uses when it strips EOE?

Is it going to disk? If so, its stripped.

> Is it purely based on the size of the event or remaining disk space or?
> 
> That leads me to the next question, can I force it to log EOE regardless?

You can always modify the audit daemon's source code.  Just remove the "if" 
statement here:

https://github.com/linux-audit/audit-userspace/blob/master/src/auditd.c#L283

so that it always calls handle_event() which write it to disk. But that leads 
me to the question of why would you need to do that? Is auparse not working 
for you?

-Steve

> > On Tuesday, September 10, 2019 11:55:58 PM EDT Giovanni Panepinto wrote:
> > > According to
> > > https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/
> > > 6/h
> > > tml/security_guide/sec-audit_record_types , the record EOE gets
> > > generated
> > > to represent "the end of a multi-record event."
> > > 
> > > In my audit logs, I can see that for some events, EOE doesn't get
> > > generated.
> > 
> > <snip>
> > 
> > > So my question is, what defines a multi-record event? And why is EOE
> > > not
> > > generated when I create a file under /usr/local/bin?
> > 
> > The EOE record is stripped by the audit daemon to save disk space. The
> > audit libraries and utilities use heuristics to determine the end of an
> > event. So, if you are parsing events with auparse, it will figure out
> > the end of the event and group all related records for you. The EOE
> > record is passes along to the real time interface just in case it helps
> > to mark an event complete before the heuristics determine it is
> > complete.
> > 
> > -Steve




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

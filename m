Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5043A241E0
	for <lists+linux-audit@lfdr.de>; Mon, 20 May 2019 22:13:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9C397EBDC;
	Mon, 20 May 2019 20:13:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B0361001E6C;
	Mon, 20 May 2019 20:12:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 770C94EA6C;
	Mon, 20 May 2019 20:12:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4KKCHGW025145 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 May 2019 16:12:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 217FC1001E6C; Mon, 20 May 2019 20:12:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-122-201.rdu2.redhat.com [10.10.122.201])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDFEE1001DD9;
	Mon, 20 May 2019 20:12:14 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Lenny Bruzenak <lenny@magitekltd.com>
Subject: Re: useradd question
Date: Mon, 20 May 2019 16:12:14 -0400
Message-ID: <2529210.r6ccOtJCrL@x2>
Organization: Red Hat
In-Reply-To: <75873a5b-255c-9b31-1b0e-6a1552021ab1@magitekltd.com>
References: <d3d7fc57-c368-9d01-aae5-cb5469cd2334@magitekltd.com>
	<2786293.P8e7BSF5A5@x2>
	<75873a5b-255c-9b31-1b0e-6a1552021ab1@magitekltd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Mon, 20 May 2019 20:13:10 +0000 (UTC)

On Monday, May 20, 2019 4:05:55 PM EDT Lenny Bruzenak wrote:
> On 5/20/19 2:59 PM, Steve Grubb wrote:
> > So...I went digging through the source code of useradd.c. In main is this
> > 
> > comment:
> >         /*
> >         
> >          * Do the hard stuff:
> >          * - open the files,
> >          * - create the user entries,
> >          * - create the home directory,
> >          * - create user mail spool,
> >          * - flush nscd caches for passwd and group services,
> >          * - then close and update the files.
> >          */
> > 
> > If you dig around, you'll see in the above process it calls usr_update().
> > This is where the audit event is. The very next function call is
> > close_files. This is where it actually writes to the files where it
> > would be visible to auditd. So, it looks like auditing in shadow-utils
> > is busted.
> > 
> > I also see where its calling pam_tally2 which is deprecated for years. It
> > should be calling faillock. I'll chat with upstream maintainers.
> > 
> > -Steve
> 
> Thank you Steve, much appreciated! If they are able to provide a patch,
> would you mind asking them to send me a link and I'll test it ASAP?

Sure. But I think this is an architectural issue and won't be a quick fix. 
Also, I think this race is limited to useradd and groupadd. For everything 
else, the mapping should be on disk and visible.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

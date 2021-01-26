Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 59B2F3030F4
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 01:21:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611620472;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4sEGsNK0o/sBhY0ysV3zxmF5EhUAicSV5EZ2XHnPFcI=;
	b=ihW2hF+Mazb7QBQXLrOP1a1wMJ86vBGIbI0SFs87y2s+TxG3ZEDm+SxgaZ3gJksk85cK/x
	DIAg4UZ4tTM/fwSihz4sqc2F05waEtk5Ri6+6ooeQWo1CUue+NLuqxeHsvlKqND07QmV5i
	2Hai2Lk7i5+3P2fgM5wW2sTuxHRy4v0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-aklYn_0QOKabpQv2248tAg-1; Mon, 25 Jan 2021 19:21:09 -0500
X-MC-Unique: aklYn_0QOKabpQv2248tAg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2643080A5C1;
	Tue, 26 Jan 2021 00:21:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E56DD5D9DB;
	Tue, 26 Jan 2021 00:21:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6FF54BB7B;
	Tue, 26 Jan 2021 00:21:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10Q0KeQU013735 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 19:20:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 930DA100AE43; Tue, 26 Jan 2021 00:20:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-75.rdu2.redhat.com [10.10.117.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B717810016FA;
	Tue, 26 Jan 2021 00:20:34 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: burn@swtf.dyndns.org
Subject: Re: Occasional delayed output of events
Date: Mon, 25 Jan 2021 19:20:33 -0500
Message-ID: <3094935.aeNJFYEL58@x2>
Organization: Red Hat
In-Reply-To: <702bbf002465236ec84ff4f90b9e159ccc3f327d.camel@iinet.net.au>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<11685937.O9o76ZdvQC@x2>
	<702bbf002465236ec84ff4f90b9e159ccc3f327d.camel@iinet.net.au>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, January 25, 2021 7:11:45 PM EST Burn Alting wrote:
> On Mon, 2021-01-25 at 18:53 -0500, Steve Grubb wrote:
> > On Saturday, January 23, 2021 5:55:44 PM EST Burn Alting wrote:
> > > > > How is the following for a way forward.
> > > > > a. I will author a patch to the user space code to correctly parse
> > > > > this
> > > > > condition and submit it on the weekend. It will be via a new
> > > > > configuration item to auditd.conf just in case placing a fixed
> > > > > extended timeout (15-20 secs) affects memory usage for users of the
> > > > > auparse library. This solves the initial problem of
> > > > > ausearch/auparse
> > > > > failing to parse generated audit.b. I am happy to instrument what
> > > > > ever
> > > > > is recommended on my hosts at home (vm's and bare metal) to provide
> > > > > more information, should we want to 'explain' the occurrence, given
> > > > > I
> > > > > see this every week or two and report back.
> > > > 
> > > > Seems reasonable to me.
> > > 
> > > I can implement the 'end_of_event_timeout' change either as
> > > i. a command line argument to ausearch/aureport (say --eoetmo secs) and
> > > a
> > > new pair of library functions within the  auparse() stable (say
> > > auparse_set_eoe_timeout() and auparse_get_eoe_timeout())
> > > or
> > > ii. a configuration item in /etc/audit/auditd.conf, or
> > > 
> > > 
> > > Which is your preference? Mine is i. as this is a user space processing
> > > change, not a demon change.
> > 
> > To be honest, I'm not entirely sure what we're seeing. I run some tests
> > today on my system. It's seeing issues also. I'd still like to treat the
> > root cause of this. But we do need to change the default. That I what
> > I'm trying to figure out.
> > 
> > Back to your question, I'm wondering if we should do both? A changeable
> > default in auditd.conf and an override on the command line.
> 
> So far, all items in /etc/audit/auditd.conf appear to only affect the
> daemon. Is this the right location to start adding non-daemon
> configuration items? (I accept there is no other place).

ausearch/report/auparse all read the auditd.conf to find the canonical 
location for where the logs are supposed to be. So, they already read this 
file. I'd rather keep it there than make yet another config. The only drawback 
it that it might again confuse people that auditd really doesn't do anything 
with the records but just some light processing.

-Steve

> Happy to do both, if required.
> 
> > -Steve




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5422E304A93
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 21:50:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611694235;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PEBAfFWJMh9SkRZdaSvFrVu4mdG13UFC7lPjiZXks9U=;
	b=iOVeLX8knl2cO3oZaPzbR9FtRKAcIQe7bXtpBMjKYShh7dck9ucuniUvKvfnTm/CwLumv7
	mWm+OerLwanrX6WNxH0vh3Y0M5CbiAg6iVPqbN1R4wlYR9NUJow1cIQIw1BHD11RuNqtmh
	bWVwLacdxXBJRV2+3VOwBSrmhIcMrzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-O7UW7HyRPvCSp4tJQ7--3A-1; Tue, 26 Jan 2021 15:50:32 -0500
X-MC-Unique: O7UW7HyRPvCSp4tJQ7--3A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 770B49CC0D;
	Tue, 26 Jan 2021 20:50:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B90C010013C0;
	Tue, 26 Jan 2021 20:50:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F5654BB7B;
	Tue, 26 Jan 2021 20:50:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QKgep1001192 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 15:42:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B3EFB648A1; Tue, 26 Jan 2021 20:42:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-57.rdu2.redhat.com [10.10.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF4306E515;
	Tue, 26 Jan 2021 20:42:34 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: burn@swtf.dyndns.org
Subject: Re: Occasional delayed output of events
Date: Tue, 26 Jan 2021 15:42:34 -0500
Message-ID: <5679566.lOV4Wx5bFT@x2>
Organization: Red Hat
In-Reply-To: <c878d2aa65ba99579c800a67c54dccea24b9b03d.camel@iinet.net.au>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<01a61bf10b409134ec57c2d419a33623f16010a9.camel@iinet.net.au>
	<c878d2aa65ba99579c800a67c54dccea24b9b03d.camel@iinet.net.au>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On Tuesday, January 26, 2021 6:53:31 AM EST Burn Alting wrote:
> On Tue, 2021-01-26 at 11:29 +1100, Burn Alting wrote:
> > On Mon, 2021-01-25 at 19:20 -0500, Steve Grubb wrote:
> > > On Monday, January 25, 2021 7:11:45 PM EST Burn Alting wrote:
> > > > On Mon, 2021-01-25 at 18:53 -0500, Steve Grubb wrote:
> > > > > On Saturday, January 23, 2021 5:55:44 PM EST Burn Alting wrote:
> > > > > > > > How is the following for a way forward.a. I will author a
> > > > > > > > patch to the
> > > > > > > > user space code to correctly parsethiscondition and submit it
> > > > > > > > on the
> > > > > > > > weekend. It will be via a newconfiguration item to
> > > > > > > > auditd.conf just in
> > > > > > > > case placing a fixedextended timeout (15-20 secs) affects
> > > > > > > > memory usage
> > > > > > > > for users of theauparse library. This solves the initial
> > > > > > > > problem
> > > > > > > > ofausearch/auparsefailing to parse generated audit.b. I am
> > > > > > > > happy to
> > > > > > > > instrument whateveris recommended on my hosts at home (vm's
> > > > > > > > and bare
> > > > > > > > metal) to providemore information, should we want to
> > > > > > > > 'explain' the
> > > > > > > > occurrence, givenIsee this every week or two and report back.
> > > > > > > 
> > > > > > > Seems reasonable to me.
> > > > > > 
> > > > > > I can implement the 'end_of_event_timeout' change either asi. a
> > > > > > command
> > > > > > line argument to ausearch/aureport (say --eoetmo secs) andanew
> > > > > > pair of
> > > > > > library functions within the  auparse() stable
> > > > > > (sayauparse_set_eoe_timeout() and auparse_get_eoe_timeout())orii.
> > > > > > a
> > > > > > configuration item in /etc/audit/auditd.conf, or
> > > > > > 
> > > > > > Which is your preference? Mine is i. as this is a user space
> > > > > > processingchange, not a demon change.
> > > > > 
> > > > > To be honest, I'm not entirely sure what we're seeing. I run some
> > > > > teststoday on my system. It's seeing issues also. I'd still like
> > > > > to treat theroot cause of this. But we do need to change the
> > > > > default. That I whatI'm trying to figure out.
> > > > > Back to your question, I'm wondering if we should do both? A
> > > > > changeabledefault in auditd.conf and an override on the command
> > > > > line.
> > > > 
> > > > So far, all items in /etc/audit/auditd.conf appear to only affect
> > > > thedaemon. Is this the right location to start adding
> > > > non-daemonconfiguration items? (I accept there is no other place).
> > > 
> > > ausearch/report/auparse all read the auditd.conf to find the canonical
> > > location for where the logs are supposed to be. So, they already read
> > > this file. I'd rather keep it there than make yet another config. The
> > > only drawback it that it might again confuse people that auditd really
> > > doesn't do anything with the records but just some light processing.
> > 
> > OK. I will put it in /etc/audit/auditd.conf
> 
> One question with this solution. If the user does not have read permission
> to /etc/audit/auditd.conf, then any change cannot take effect. The default
> mode for this file is 640 to root, so a non-root user could never change
> the timeout.

Right, but since they cannot access the logs, it's not a problem in general.  
But if they so happen to have a local copy of logs, then the command line 
override should allow them to correct this. I am also reviewing things to see 
if a better default can be picked.

> Should I also add - a command line argument to ausearch/aureport (say --
> eoetmo secs) and, - a pair of new auparse() functions -
> auparse_set_eoe_timeout() and  auparse_get_eoe_timeout()
> so that non root users can make use of the new configuration item.

Yes, that is what I meant by doing both. We have default in auditd.conf that 
works for everyone with direct audit access. We have a commandline option for 
overriding the auditd.conf value.

Although, I don't know why we would want to get the eoe_timeout value? I 
can't imagine a use for it right now. 

As for ausearch/report, let's just make a long option --eoe-timeout

-Steve

> Also, do you want the default timeout to be 2 seconds or should I make it
> higher.

I'm likely to adjust it, but I'm still looking to see what is happening. Just 
go with the 2 second default for now.

Thanks,
-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


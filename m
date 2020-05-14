Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 180861D34C9
	for <lists+linux-audit@lfdr.de>; Thu, 14 May 2020 17:16:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589469377;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K1dDwAd0Z8oAGmpSkeYrcn5Sm7Sd1MI2xPjTThNAASs=;
	b=CnW7r7WPK1Lgsij1exvK4tUJEuhuPet+gxl1uSQwe4sTr7WMrvvM1rTcEfqNWFkBrghOwT
	cV5KnbFOzKWuo03EWs2R63DsUBNNGYF9NGzjyflGvmnnEISdTMy45SKwj/cI342jTj4Rd4
	0hNT5n5M+0WqBLtARpWNXH35M7t+QHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-40Sg9-Q4PgK7WKXADJ6yzg-1; Thu, 14 May 2020 11:16:13 -0400
X-MC-Unique: 40Sg9-Q4PgK7WKXADJ6yzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2582218FF660;
	Thu, 14 May 2020 15:16:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD6975D714;
	Thu, 14 May 2020 15:16:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6AB684CAB0;
	Thu, 14 May 2020 15:16:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EFECre011205 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 11:14:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE7CA261DD; Thu, 14 May 2020 15:14:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 389639323;
	Thu, 14 May 2020 15:14:05 +0000 (UTC)
Date: Thu, 14 May 2020 11:14:02 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: reactive audit proposal
Message-ID: <20200514151402.jglpgcsmiiikuw2t@madcap2.tricolour.ca>
References: <6360160.ZmnOHIC0Qm@x2>
	<c84089d7d299313a051a0be60697872981fd95a2.camel@iinet.net.au>
	<20200514133221.2kcvd2vpiueji2tb@madcap2.tricolour.ca>
	<2714655.amcdOopNT1@x2>
MIME-Version: 1.0
In-Reply-To: <2714655.amcdOopNT1@x2>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-05-14 10:47, Steve Grubb wrote:
> Hello,
> 
> Answering both emails at once.
> 
> On Thursday, May 14, 2020 9:32:21 AM EDT Richard Guy Briggs wrote:
> > On 2020-05-14 18:55, Burn Alting wrote:
> > > I also endorse such a change.
> > > There is a significant gap in recoding removable media activity (see
> > > https://bugzilla.redhat.com/show_bug.cgi?id=967241) and the on_mount
> > > could go a reasonable  way to address this, including making use of the
> > > NETLUNK_KOBJECT_UEVENTnetlink group or  /sys/block polling to assist with
> > > device discovery.
> 
> libudev has a function that looks up device from a path. I was planning to use that.
> 
> > > Secondly, being able to react to a login/logout event also opens up
> > > interesting opportunity for targetedevent generation.
> > > That said, I believe that Juro Hlista did some work on this back around
> > > 2010. He did this via a plugin. His solutionwas a little more generic.
> > > Should we be looking at that as a solution as well?
> 
> I really don't know that code. It was done as a summer research project for
> a thesis. I do not know if it is production ready, supportable, or
> sustainable. While it may be more general, I remember the code base being
> large. Large means complicated. I'd rather narrow the scope and have a small
> amount of code that serves a single purpose.
> 
> > > One element I do
> > > remember from hiswork, was that there was a potential gap in the time to
> > > react to a trigger firing and the result was that one was notguaranteed
> > > to implement the new rules immediately. I assume to treat this gap, the
> > > rules could be preloaded and the 'trigger' action could just move the
> > > 'dormant' rules, already in core, to the 'active' list.
> 
> I was going to make them memory resident so that searching them is fast.
> Watching for mount changes will probably be faster that the general system
> because it does not depend on a mount syscall rule to trickle down and then
> react. 
> 
> In the user case, we would watch for the login event. It should be
> able to react before the whole pam cycle finishes. Although we would want to
> monitor the progress of pam so that we don't place a rule when the session
> never starts due to pam_time voting no. And we'll have to handle a login and
> cron jobs differently.
>  
> > I was going to say, this one feels like there are a set of rules that
> > should just be present from the get-go and not dynamic.  If we already
> > know what we are looking for (monitor a specific user, or monitor a
> > specific device) then just add those rules to the permenent set.
> 
> OK, lets give that a try
> 
> # auditctl -a always,exit -F dir=/run/media/sgrubb/sandisk/ -F perm=rx -F key=usb-drive
> Error sending add rule data request (No such file or directory)
> 
> We can't. Also, every single rule we add slows down the system.

True on both counts.  However, that is also true of the device
monitoring list to a lesser degree...

GHAK12 ( https://github.com/linux-audit/audit-kernel/issues/12 ) may
help with this and the idea has been discussed previously to find a way
to overcome this current limitation of kaudit.

> -Steve
> 
> > This makes it easier to lock things down too.
> > 
> > > Burn
> > > 
> > > On Wed, 2020-05-13 at 14:03 -0400, Steve Grubb wrote:
> > > > On Wednesday, May 13, 2020 1:17:02 PM EDT Joe Wulf wrote:
> > > > > What you propose is a sound enhancement.I have no preference for the
> > > > > choice between incorporate this in the auditdaemon versus a
> > > > > plugin.What would be the effort to switch from one to theother if
> > > > > later on you should find the first choice wasn't as optimal?
> > > > 
> > > > Well, the main idea for a plugin is not to stop processing events. Busy
> > > > systems need to keep focused on unloading the kernel backlog.
> > > > 
> > > > > I wonder about the case where a system is booted with new media
> > > > > alreadyattached.> > 
> > > > During initialization, it runs through the mount table just as if the
> > > > mount table was changed. So, it has the opportunity to apply rules
> > > > during init. I'm borrowing code from fapolicyd which has this nicely
> > > > solved. (It's one of my other projects.) -Steve
> > 
> > - RGB

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


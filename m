Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5527B1D3156
	for <lists+linux-audit@lfdr.de>; Thu, 14 May 2020 15:32:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589463169;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wqZ9CL1uTzCg3XIkW8aoG0EN9+24JAPlGsN0EEOo7MA=;
	b=dVCqT9gA7yCy84xdIEE+nRzfl419TIO7Xd9lbnEo9JGnQMVtM/7F7jk+oeRXtxgessn3HH
	u7W/SBjyDAJmy2i3VXk/vslczBRMY9Rd7Jvs9RDsDbZKJF8Qxu+pgVVfIEZX7TUaiMvg59
	fzLIQ/n3m6999pnivKkPHLo1klzwpfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-Fiict2ZHPDiGhdcxgsZLiw-1; Thu, 14 May 2020 09:32:47 -0400
X-MC-Unique: Fiict2ZHPDiGhdcxgsZLiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 271C680058A;
	Thu, 14 May 2020 13:32:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D9965C1D3;
	Thu, 14 May 2020 13:32:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5F1184E987;
	Thu, 14 May 2020 13:32:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EDWT8a001175 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 09:32:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 46C105C1D3; Thu, 14 May 2020 13:32:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F20C5C1D6;
	Thu, 14 May 2020 13:32:25 +0000 (UTC)
Date: Thu, 14 May 2020 09:32:21 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: burn@swtf.dyndns.org
Subject: Re: reactive audit proposal
Message-ID: <20200514133221.2kcvd2vpiueji2tb@madcap2.tricolour.ca>
References: <6360160.ZmnOHIC0Qm@x2>
	<2037581034.269445.1589390222295@mail.yahoo.com>
	<7295083.E8dtrJcxLY@x2>
	<c84089d7d299313a051a0be60697872981fd95a2.camel@iinet.net.au>
MIME-Version: 1.0
In-Reply-To: <c84089d7d299313a051a0be60697872981fd95a2.camel@iinet.net.au>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-05-14 18:55, Burn Alting wrote:
> I also endorse such a change. 
> There is a significant gap in recoding removable media activity (see 
> https://bugzilla.redhat.com/show_bug.cgi?id=967241) and the on_mount could go a
> reasonable  way to address this, including making use of the
> NETLUNK_KOBJECT_UEVENTnetlink group or  /sys/block polling to assist with device
> discovery.
> Secondly, being able to react to a login/logout event also opens up interesting
> opportunity for targetedevent generation.
> That said, I believe that Juro Hlista did some work on this back around 2010. He did
> this via a plugin. His solutionwas a little more generic. Should we be looking at
> that as a solution as well? One element I do remember from hiswork, was that there
> was a potential gap in the time to react to a trigger firing and the result was that
> one was notguaranteed to implement the new rules immediately. I assume to treat this
> gap, the rules could be preloaded and the 'trigger' action could just move the
> 'dormant' rules, already in core, to the 'active' list.

I was going to say, this one feels like there are a set of rules that
should just be present from the get-go and not dynamic.  If we already
know what we are looking for (monitor a specific user, or monitor a
specific device) then just add those rules to the permenent set.

This makes it easier to lock things down too.

> Burn
> On Wed, 2020-05-13 at 14:03 -0400, Steve Grubb wrote:
> > On Wednesday, May 13, 2020 1:17:02 PM EDT Joe Wulf wrote:
> > > What you propose is a sound enhancement.I have no preference for the choice
> > > between incorporate this in the auditdaemon versus a plugin.What would be the
> > > effort to switch from one to theother if later on you should find the first
> > > choice wasn't as optimal?
> > 
> > Well, the main idea for a plugin is not to stop processing events. Busy systems
> > need to keep focused on unloading the kernel backlog. 
> > > I wonder about the case where a system is booted with new media alreadyattached.
> > 
> > During initialization, it runs through the mount table just as if the mount table
> > was changed. So, it has the opportunity to apply rules during init. I'm borrowing
> > code from fapolicyd which has this nicely solved. (It's one of my other projects.)
> > -Steve

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


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 85FC531A63F
	for <lists+linux-audit@lfdr.de>; Fri, 12 Feb 2021 21:55:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613163320;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S4BchhtpYUFoKbJ6bGeXOc31vPAV/HAaJ5MZ4vkJsKs=;
	b=De9k9AfUFZnXPmoMmz1scEW1beAiYlmDVW5lUU4JhLa1Cdr67Ts86lM6A8zpvppd4s6qc8
	ZTUycgoRagvHS3B1IuZfoePnlZVzGlX7righPHXxzcGZpqV8FKi6WfTYJkevdOspMwArwR
	QF+jc2IbLsPcwFAiqy3fm2d++enqfNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-UGSLjF9kNTG7bc1Xpfyw7w-1; Fri, 12 Feb 2021 15:55:18 -0500
X-MC-Unique: UGSLjF9kNTG7bc1Xpfyw7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C4B41885784;
	Fri, 12 Feb 2021 20:55:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1D046B8E5;
	Fri, 12 Feb 2021 20:55:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59D703805;
	Fri, 12 Feb 2021 20:55:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11CKspTB031587 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 12 Feb 2021 15:54:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5D7996F7E4; Fri, 12 Feb 2021 20:54:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E27E419811;
	Fri, 12 Feb 2021 20:54:42 +0000 (UTC)
Date: Fri, 12 Feb 2021 15:54:40 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Phil Sutter <phil@nwl.cc>, Steve Grubb <sgrubb@redhat.com>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>,
	Ondrej Mosnacek <omosnace@redhat.com>, fw@strlen.de,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20210212205440.GM3141668@madcap2.tricolour.ca>
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
	<20210211151606.GX3158@orbyte.nwl.cc>
	<CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
	<4087569.ejJDZkT8p0@x2> <20210212121112.GA3158@orbyte.nwl.cc>
MIME-Version: 1.0
In-Reply-To: <20210212121112.GA3158@orbyte.nwl.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2021-02-12 13:11, Phil Sutter wrote:
> Hi,
> 
> On Thu, Feb 11, 2021 at 04:02:55PM -0500, Steve Grubb wrote:
> > On Thursday, February 11, 2021 11:29:34 AM EST Paul Moore wrote:
> > > > If I'm not mistaken, iptables emits a single audit log per table, ipset
> > > > doesn't support audit at all. So I wonder how much audit logging is
> > > > required at all (for certification or whatever reason). How much
> > > > granularity is desired?
> >  
> >   <snip> 
> > 
> > > I believe the netfilter auditing was mostly a nice-to-have bit of
> > > functionality to help add to the completeness of the audit logs, but I
> > > could very easily be mistaken.  Richard put together those patches, he
> > > can probably provide the background/motivation for the effort.
> > 
> > There are certifications which levy requirements on information flow control. 
> > The firewall can decide if information should flow or be blocked. Information 
> > flow decisions need to be auditable - which we have with the audit target. 
> 
> In nftables, this is realized via 'log level audit' statement.
> Functionality should by all means be identical to that of xtables' AUDIT
> target.
> 
> > That then swings in requirements on the configuration of the information flow 
> > policy.
> > 
> > The requirements state a need to audit any management activity - meaning the 
> > creation, modification, and/or deletion of a "firewall ruleset". Because it 
> > talks constantly about a ruleset and then individual rules, I suspect only 1 
> > summary event is needed to say something happened, who did it, and the 
> > outcome. This would be in line with how selinux is treated: we have 1 summary 
> > event for loading/modifying/unloading selinux policy.
> 
> So the central element are firewall rules for audit purposes and
> NETFILTER_CFG notifications merely serve asserting changes to those
> rules are noticed by the auditing system. Looking at xtables again, this
> seems coherent: Any change causes the whole table blob to be replaced
> (while others stay in place). So table replace/create is the most common
> place for a change notification. In nftables, the most common one is
> generation dump - all tables are treated as elements of the same
> ruleset, not individually like in xtables.
> 
> Richard, assuming the above is correct, are you fine with reducing
> nftables auditing to a single notification per transaction then? I guess
> Florian sufficiently illustrated how this would be implemented.

Yes, that should be possible.

> > Hope this helps...
> 
> It does, thanks a lot for the information!
> 
> Thanks, Phil

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


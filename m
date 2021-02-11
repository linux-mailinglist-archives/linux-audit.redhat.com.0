Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5C577319469
	for <lists+linux-audit@lfdr.de>; Thu, 11 Feb 2021 21:27:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613075252;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=chuevBOHjcGjaw3jPNXfND0WcCPlKqgoOgxGBbVAnaQ=;
	b=Pu+3n5kWJfL140C+NmtizyFVT5+o+Vp6TbfQgvtXsNYVfeoV69k9sO7htUaQuswe7Rk0ZD
	ZGRcVMAF9d5Xc+86UaK2h6vm1eAlumrkZaCJpaWxX9kpkk7iOYRm/3Ufzkv9DOYMlQImJC
	9TGO+VtYTifPUwtjTVWqJohFns5YIyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-RORBNOhSMxa393BGi1a5Kg-1; Thu, 11 Feb 2021 15:27:29 -0500
X-MC-Unique: RORBNOhSMxa393BGi1a5Kg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD937801979;
	Thu, 11 Feb 2021 20:27:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBFD56E505;
	Thu, 11 Feb 2021 20:27:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D022F4EA32;
	Thu, 11 Feb 2021 20:27:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11BKQdcA021788 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 11 Feb 2021 15:26:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E3476648A1; Thu, 11 Feb 2021 20:26:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 595AC6F998;
	Thu, 11 Feb 2021 20:26:31 +0000 (UTC)
Date: Thu, 11 Feb 2021 15:26:28 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20210211202628.GP2015948@madcap2.tricolour.ca>
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
	<20210211151606.GX3158@orbyte.nwl.cc>
	<CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Phil Sutter <phil@nwl.cc>, fw@strlen.de,
	LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	Eric Paris <eparis@parisplace.org>, tgraf@infradead.org
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

On 2021-02-11 11:29, Paul Moore wrote:
> On Thu, Feb 11, 2021 at 10:16 AM Phil Sutter <phil@nwl.cc> wrote:
> > Hi,
> >
> > On Thu, Jun 04, 2020 at 09:20:49AM -0400, Richard Guy Briggs wrote:
> > > iptables, ip6tables, arptables and ebtables table registration,
> > > replacement and unregistration configuration events are logged for the
> > > native (legacy) iptables setsockopt api, but not for the
> > > nftables netlink api which is used by the nft-variant of iptables in
> > > addition to nftables itself.
> > >
> > > Add calls to log the configuration actions in the nftables netlink api.
> >
> > As discussed offline already, these audit notifications are pretty hefty
> > performance-wise. In an internal report, 300% restore time of a ruleset
> > containing 70k set elements is measured.
> 
> If you're going to reference offline/off-list discussions in a post to
> a public list, perhaps the original discussion shouldn't have been
> off-list ;)  If you don't involve us in the discussion, we have to
> waste a lot of time getting caught up.

Here's part of that discussion:
	https://bugzilla.redhat.com/show_bug.cgi?id=1918013

> > If I'm not mistaken, iptables emits a single audit log per table, ipset
> > doesn't support audit at all. So I wonder how much audit logging is
> > required at all (for certification or whatever reason). How much
> > granularity is desired?
> 
> That's a question for the people who track these certification
> requirements, which is thankfully not me at the moment.  Unless
> somebody else wants to speak up, Steve Grubb is probably the only
> person who tracks that sort of stuff and comments here.
> 
> I believe the netfilter auditing was mostly a nice-to-have bit of
> functionality to help add to the completeness of the audit logs, but I
> could very easily be mistaken.  Richard put together those patches, he
> can probably provide the background/motivation for the effort.

It was added because an audit test that normally produced records from
iptables on one distro stopped producing any records on another.
Investigation led to the fact that on the first it was using
iptables-legacy API and on the other it was using iptables-nft API.

> > I personally would notify once per transaction. This is easy and quick.

This was the goal.  iptables was atomic.  nftables appears to no longer
be so.  If I have this wrong, please show how that works.

> > Once per table or chain should be acceptable, as well. At the very
> > least, we should not have to notify once per each element. This is the
> > last resort of fast ruleset adjustments. If we lose it, people are
> > better off with ipset IMHO.
> >
> > Unlike nft monitor, auditd is not designed to be disabled "at will". So
> > turning it off for performance-critical workloads is no option.

If it were to be disabled "at will" it would defeat the purpose of
audit.  Those records can already be filtered, or audit can be disabled,
but let us look at rationalizing the current nftables records first.

> Patches are always welcome, but it might be wise to get to the bottom
> of the certification requirements first.
> 
> -- 
> paul moore
> www.paul-moore.com
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit

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


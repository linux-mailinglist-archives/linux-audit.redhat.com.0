Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 6792618A6F9
	for <lists+linux-audit@lfdr.de>; Wed, 18 Mar 2020 22:27:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584566868;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JWsFXXQ/euNVPsJqQvhShYY3UfEMVOWRzI1ASjknQCI=;
	b=hiqK/9EmjNYSDkn5IMyWOyysgPRkBa9j6KYCpb+PftDnub4wzGD42gh6kKMY5jGKtT86SN
	qP6jrOhI0xn3y1cBpHY/+ZSyJuEeAfgQHAFsOXYPPwtIiT/SnneYzUWHjcamYinQubsxJI
	6JR/WizRVsE3/FsCDsMcrHgIlhy5cqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-oU6dY_u6PKCrLTzJnNCqhA-1; Wed, 18 Mar 2020 17:27:46 -0400
X-MC-Unique: oU6dY_u6PKCrLTzJnNCqhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72FFD9A3B1;
	Wed, 18 Mar 2020 21:26:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA38C5C21B;
	Wed, 18 Mar 2020 21:26:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A5B4860FE;
	Wed, 18 Mar 2020 21:26:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ILQq3O006838 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Mar 2020 17:26:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10F5660C18; Wed, 18 Mar 2020 21:26:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.36.110.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66A7560BF1;
	Wed, 18 Mar 2020 21:26:36 +0000 (UTC)
Date: Wed, 18 Mar 2020 17:26:30 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
Message-ID: <20200318212630.mw2geg4ykhnbtr3k@madcap2.tricolour.ca>
References: <cover.1577736799.git.rgb@redhat.com>
	<20200204231454.oxa7pyvuxbj466fj@madcap2.tricolour.ca>
	<CAHC9VhQquokw+7UOU=G0SsD35UdgmfysVKCGCE87JVaoTkbisg@mail.gmail.com>
	<3142237.YMNxv0uec1@x2>
	<CAHC9VhTiCHQbp2SwK0Xb1QgpUZxOQ26JKKPsVGT0ZvMqx28oPQ@mail.gmail.com>
	<CAHC9VhS09b_fM19tn7pHZzxfyxcHnK+PJx80Z9Z1hn8-==4oLA@mail.gmail.com>
	<20200312193037.2tb5f53yeisfq4ta@madcap2.tricolour.ca>
	<CAHC9VhQoVOzy_b9W6h+kmizKr1rPkC4cy5aYoKT2i0ZgsceNDg@mail.gmail.com>
	<20200313185900.y44yvrfm4zxa5lfk@madcap2.tricolour.ca>
	<CAHC9VhR2zCCE5bjH75rSwfLC7TJGFj4RBnrtcOoUiqVp9q5TaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhR2zCCE5bjH75rSwfLC7TJGFj4RBnrtcOoUiqVp9q5TaA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	ebiederm@xmission.com, simo@redhat.com, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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

On 2020-03-18 16:56, Paul Moore wrote:
> On Fri, Mar 13, 2020 at 2:59 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-03-13 12:29, Paul Moore wrote:
> > > On Thu, Mar 12, 2020 at 3:30 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > On 2020-02-13 16:44, Paul Moore wrote:
> > > > > This is a bit of a thread-hijack, and for that I apologize, but
> > > > > another thought crossed my mind while thinking about this issue
> > > > > further ... Once we support multiple auditd instances, including the
> > > > > necessary record routing and duplication/multiple-sends (the host
> > > > > always sees *everything*), we will likely need to find a way to "trim"
> > > > > the audit container ID (ACID) lists we send in the records.  The
> > > > > auditd instance running on the host/initns will always see everything,
> > > > > so it will want the full container ACID list; however an auditd
> > > > > instance running inside a container really should only see the ACIDs
> > > > > of any child containers.
> > > >
> > > > Agreed.  This should be easy to check and limit, preventing an auditd
> > > > from seeing any contid that is a parent of its own contid.
> > > >
> > > > > For example, imagine a system where the host has containers 1 and 2,
> > > > > each running an auditd instance.  Inside container 1 there are
> > > > > containers A and B.  Inside container 2 there are containers Y and Z.
> > > > > If an audit event is generated in container Z, I would expect the
> > > > > host's auditd to see a ACID list of "1,Z" but container 1's auditd
> > > > > should only see an ACID list of "Z".  The auditd running in container
> > > > > 2 should not see the record at all (that will be relatively
> > > > > straightforward).  Does that make sense?  Do we have the record
> > > > > formats properly designed to handle this without too much problem (I'm
> > > > > not entirely sure we do)?
> > > >
> > > > I completely agree and I believe we have record formats that are able to
> > > > handle this already.
> > >
> > > I'm not convinced we do.  What about the cases where we have a field
> > > with a list of audit container IDs?  How do we handle that?
> >
> > I don't understand the problem.  (I think you crossed your 1/2 vs
> > A/B/Y/Z in your example.) ...
> 
> It looks like I did, sorry about that.
> 
> > ... Clarifying the example above, if as you
> > suggest an event happens in container Z, the hosts's auditd would report
> >         Z,^2
> > and the auditd in container 2 would report
> >         Z,^2
> > but if there were another auditd running in container Z it would report
> >         Z
> > while the auditd in container 1 or A/B would see nothing.
> 
> Yes.  My concern is how do we handle this to minimize duplicating and
> rewriting the records?  It isn't so much about the format, although
> the format is a side effect.

Are you talking about caching, or about divulging more information than
necessary or even information leaks?  Or even noticing that records that
need to be generated to two audit daemons share the same contid field
values and should be generated at the same time or information shared
between them?  I'd see any of these as optimizations that don't affect
the api.

> paul moore

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


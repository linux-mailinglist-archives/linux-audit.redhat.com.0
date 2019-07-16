Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9936ABFF
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jul 2019 17:37:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 934A181F0E;
	Tue, 16 Jul 2019 15:37:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5BA85B681;
	Tue, 16 Jul 2019 15:37:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE2A91800207;
	Tue, 16 Jul 2019 15:37:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GFbNHT020635 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 11:37:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 103AF1001B04; Tue, 16 Jul 2019 15:37:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-14.phx2.redhat.com [10.3.112.14])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E553110021B2;
	Tue, 16 Jul 2019 15:37:08 +0000 (UTC)
Date: Tue, 16 Jul 2019 11:37:05 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
Message-ID: <20190716153705.xx7dwrhliny5amut@madcap2.tricolour.ca>
References: <20190529153427.GB8959@cisco>
	<CAHC9VhSF3AjErX37+eeusJ7+XRw8yuPsmqBTRwc9EVoRBh_3Tw@mail.gmail.com>
	<20190529222835.GD8959@cisco>
	<CAHC9VhRS66VGtug3fq3RTGHDvfGmBJG6yRJ+iMxm3cxnNF-zJw@mail.gmail.com>
	<20190530170913.GA16722@mail.hallyn.com>
	<CAHC9VhThLiQzGYRUWmSuVfOC6QCDmA75BDB7Eg7V8HX4x7ymQg@mail.gmail.com>
	<20190530212900.GC5739@cisco>
	<CAHC9VhT5HPt9rCJoDutdvA3r1Y1GOHfpXe2eJ54atNC1=Vd8LA@mail.gmail.com>
	<20190708181237.5poheliito7zpvmc@madcap2.tricolour.ca>
	<CAHC9VhT0V+xi_6nAR5TsM2vs34LbgMeO=-W+MS_kqiXRRzneZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhT0V+xi_6nAR5TsM2vs34LbgMeO=-W+MS_kqiXRRzneZQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Tycho Andersen <tycho@tycho.ws>, nhorman@tuxdriver.com,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, "Serge E. Hallyn" <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 16 Jul 2019 15:37:44 +0000 (UTC)

On 2019-07-15 17:09, Paul Moore wrote:
> On Mon, Jul 8, 2019 at 2:12 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2019-05-30 19:26, Paul Moore wrote:
> 
> ...
> 
> > > I like the creativity, but I worry that at some point these
> > > limitations are going to be raised (limits have a funny way of doing
> > > that over time) and we will be in trouble.  I say "trouble" because I
> > > want to be able to quickly do an audit container ID comparison and
> > > we're going to pay a penalty for these larger values (we'll need this
> > > when we add multiple auditd support and the requisite record routing).
> > >
> > > Thinking about this makes me also realize we probably need to think a
> > > bit longer about audit container ID conflicts between orchestrators.
> > > Right now we just take the value that is given to us by the
> > > orchestrator, but if we want to allow multiple container orchestrators
> > > to work without some form of cooperation in userspace (I think we have
> > > to assume the orchestrators will not talk to each other) we likely
> > > need to have some way to block reuse of an audit container ID.  We
> > > would either need to prevent the orchestrator from explicitly setting
> > > an audit container ID to a currently in use value, or instead generate
> > > the audit container ID in the kernel upon an event triggered by the
> > > orchestrator (e.g. a write to a /proc file).  I suspect we should
> > > start looking at the idr code, I think we will need to make use of it.
> >
> > To address this, I'd suggest that it is enforced to only allow the
> > setting of descendants and to maintain a master list of audit container
> > identifiers (with a hash table if necessary later) that includes the
> > container owner.
> 
> We're discussing the audit container ID management policy elsewhere in
> this thread so I won't comment on that here, but I did want to say
> that we will likely need something better than a simple list of audit
> container IDs from the start.  It's common for systems to have
> thousands of containers now (or multiple thousands), which tells me
> that a list is a poor choice.  You mentioned a hash table, so I would
> suggest starting with that over the list for the initial patchset.

I saw that as an internal incremental improvement that did not affect
the API, so I wanted to keep things a bit simpler (as you've requested
in the past) to get this going, and add that enhancement later.

I'll start working on it now.  The hash table would simply point to
lists anyways unless you can recommend a better approach.

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

Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7835A302CE
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 21:31:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 71C57C0AD2A5;
	Thu, 30 May 2019 19:31:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87D51611A1;
	Thu, 30 May 2019 19:30:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24C4F18433A1;
	Thu, 30 May 2019 19:30:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UJU6MX026659 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 15:30:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5786B1752B; Thu, 30 May 2019 19:30:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 504F45C64A
	for <linux-audit@redhat.com>; Thu, 30 May 2019 19:30:03 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07C4C85538
	for <linux-audit@redhat.com>; Thu, 30 May 2019 19:29:47 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id o13so7204374lji.5
	for <linux-audit@redhat.com>; Thu, 30 May 2019 12:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iVk/NFNgHVBFx7MhewVcDHKeuh0/y8uv27n+wctjBBw=;
	b=iUJd3oa19CugyfCed6zmPxPNuarTP/1imCFXfhjAKXmDQBo5jZe7ZBR5RJOq+hx6br
	tfQzOOPQSqboRyGxFLT3oSfQ+JEgq29U2q60jo8Rr2CFQTVVxATpRL8XEc0KJdCPnkC0
	SbiJiRSFkAq8oO5wi8mEi96cPVRUr9w8MIZ/OWqOCcFnsB6CPb5tpIu+P0Ghso3X245/
	NCySiboUIcKL8ug8JS2mDcOFFPLquJEQpPTys/6K9z3FovVwTZAdFmLqlzNlKDrXytw1
	cQv+DRz6iJnKKRbUgD8k65be4+HNaacB+tw7zitbPLmamQffqA0s+u7+l5fj7cD+yxkk
	BtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iVk/NFNgHVBFx7MhewVcDHKeuh0/y8uv27n+wctjBBw=;
	b=m+hc8SYIJL/wIU723a/8AC2+eqhVUONwDRRwXZMKWCs4+6Ivk0uL/ervbuEEchg9FC
	cgZITcZJ+CiFasvqxsBPPghoQhufxPqRxNp5/F6ytUUCzqM/N0Ah0qAmtzMwBSLJCUlJ
	9fKSLw5/i9406ydSDNgi8kf7RkDQgbZIcLvjagfrG+JgLGX69fwlS9ph+zJB+I3k51OV
	RxfoiN4KCjaSo3l90qGVVB/PIndejD0/aNnwm0w/KOHTTMgt5EL31+UbgjWZ+BfH3xZ4
	ndrv2GfVeNjGY0viandkJ8xt+Sr2eJbOJNH0iF6T6Vu+l2X3ghwTEPQ4Y1Es9CsYjor9
	hKzQ==
X-Gm-Message-State: APjAAAUbAyPslAbFTPXJP69YkPNIkp9Z83U+V2NpF8yJdcqocDO5M4tW
	fgdzfF+BXL8RdptBSP/Gam91qah3zaSky9n1LM1+
X-Google-Smtp-Source: APXvYqy4oT9/ncpEwgceU+Uxm1SPfMQyT6tfoJxHZH5OZOJlX84DZdkuPn8yylZ7C5804jX66KJvTV8Txj+BX2224oo=
X-Received: by 2002:a2e:9bc5:: with SMTP id w5mr3279775ljj.87.1559244585165;
	Thu, 30 May 2019 12:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<9edad39c40671fb53f28d76862304cc2647029c6.1554732921.git.rgb@redhat.com>
	<20190529145742.GA8959@cisco>
	<CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
	<20190529153427.GB8959@cisco>
	<CAHC9VhSF3AjErX37+eeusJ7+XRw8yuPsmqBTRwc9EVoRBh_3Tw@mail.gmail.com>
	<20190529222835.GD8959@cisco>
	<CAHC9VhRS66VGtug3fq3RTGHDvfGmBJG6yRJ+iMxm3cxnNF-zJw@mail.gmail.com>
	<20190530170913.GA16722@mail.hallyn.com>
In-Reply-To: <20190530170913.GA16722@mail.hallyn.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 May 2019 15:29:32 -0400
Message-ID: <CAHC9VhThLiQzGYRUWmSuVfOC6QCDmA75BDB7Eg7V8HX4x7ymQg@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
To: "Serge E. Hallyn" <serge@hallyn.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 30 May 2019 19:29:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Thu, 30 May 2019 19:29:47 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.317  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2) 209.85.208.193
	mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: Tycho Andersen <tycho@tycho.ws>, nhorman@tuxdriver.com,
	Richard Guy Briggs <rgb@redhat.com>, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 30 May 2019 19:31:22 +0000 (UTC)

On Thu, May 30, 2019 at 1:09 PM Serge E. Hallyn <serge@hallyn.com> wrote:
> On Wed, May 29, 2019 at 06:39:48PM -0400, Paul Moore wrote:
> > On Wed, May 29, 2019 at 6:28 PM Tycho Andersen <tycho@tycho.ws> wrote:
> > > On Wed, May 29, 2019 at 12:03:58PM -0400, Paul Moore wrote:
> > > > On Wed, May 29, 2019 at 11:34 AM Tycho Andersen <tycho@tycho.ws> wrote:
> > > > > On Wed, May 29, 2019 at 11:29:05AM -0400, Paul Moore wrote:
> > > > > > On Wed, May 29, 2019 at 10:57 AM Tycho Andersen <tycho@tycho.ws> wrote:
> > > > > > > On Mon, Apr 08, 2019 at 11:39:09PM -0400, Richard Guy Briggs wrote:

...

> > > > > > The current thinking
> > > > > > is that you would only change the audit container ID from one
> > > > > > set/inherited value to another if you were nesting containers, in
> > > > > > which case the nested container orchestrator would need to be granted
> > > > > > CAP_AUDIT_CONTROL (which everyone to date seems to agree is a workable
> > > > > > compromise).
> > >
> > > won't work in user namespaced containers, because they will never be
> > > capable(CAP_AUDIT_CONTROL); so I don't think this will work for
> > > nesting as is. But maybe nobody cares :)
> >
> > That's fun :)
> >
> > To be honest, I've never been a big fan of supporting nested
> > containers from an audit perspective, so I'm not really too upset
> > about this.  The k8s/cri-o folks seem okay with this, or at least I
> > haven't heard any objections; lxc folks, what do you have to say?
>
> I actually thought the answer to this (when last I looked, "some time" ago)
> was that userspace should track an audit message saying "task X in
> container Y is changing its auditid to Z", and then decide to also track Z.
> This should be doable, but a lot of extra work in userspace.
>
> Per-userns containerids would also work.  So task X1 is in containerid
> 1 on the host and creates a new task Y in new userns;  it continues to
> be reported in init_user_ns as containerid 1 forever;  but in its own
> userns it can request to be known as some other containerid.  Audit
> socks would be per-userns, allowing root in a container to watch for
> audit events in its own (and descendent) namespaces.
>
> But again I'm sure we've gone over all this in the last few years.
>
> I suppose we can look at this as a "first step", and talk about
> making it user-ns-nestable later.  But agreed it's not useful in a
> lot of situations as is.

[REMINDER: It is an "*audit* container ID" and not a general
"container ID" ;)  Smiley aside, I'm not kidding about that part.]

I'm not interested in supporting/merging something that isn't useful;
if this doesn't work for your use case then we need to figure out what
would work.  It sounds like nested containers are much more common in
the lxc world, can you elaborate a bit more on this?

As far as the possible solutions you mention above, I'm not sure I
like the per-userns audit container IDs, I'd much rather just emit the
necessary tracking information via the audit record stream and let the
log analysis tools figure it out.  However, the bigger question is how
to limit (re)setting the audit container ID when you are in a non-init
userns.  For reasons already mentioned, using capable() is a non
starter for everything but the initial userns, and using ns_capable()
is equally poor as it essentially allows any userns the ability to
munge it's audit container ID (obviously not good).  It appears we
need a different method for controlling access to the audit container
ID.

Punting this to a LSM hook is an obvious thing to do, and something we
might want to do anyway, but currently audit doesn't rely on the LSM
for proper/safe operation and I'm not sure I want to change that now.

The next obvious thing is to create some sort of access control knob
in audit itself.  Perhaps an auditctl operation that would allow the
administrator to specify which containers, via their corresponding
audit container IDs, are allowed to change their audit container ID?
The permission granting would need to be done in the init userns, but
it would allow containers with a non-init userns the ability to change
their audit container ID.  We would probably still want a
ns_capable(CAP_AUDIT_CONTROL) restriction in this case.

Does anyone else have any other ideas?

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

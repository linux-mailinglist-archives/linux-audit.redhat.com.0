Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 751DE30574
	for <lists+linux-audit@lfdr.de>; Fri, 31 May 2019 01:28:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FACB8553B;
	Thu, 30 May 2019 23:27:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EA015D9E1;
	Thu, 30 May 2019 23:27:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D731154D3C;
	Thu, 30 May 2019 23:27:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UNRBQj008610 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 19:27:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA9D46061B; Thu, 30 May 2019 23:27:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3F2564026
	for <linux-audit@redhat.com>; Thu, 30 May 2019 23:27:09 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40B0B368E0
	for <linux-audit@redhat.com>; Thu, 30 May 2019 23:27:07 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id h19so7745548ljj.4
	for <linux-audit@redhat.com>; Thu, 30 May 2019 16:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0yVW5j/diaIQvY1yMq0bFKbS6dKMLujpejPsf0pKXzk=;
	b=PDYHHACOR7Nb4rkc+hTNYNd9Z9ljJBGEUsdJtZ3zYXhuFJn2Au8AvhNiTIMJ/6T/Fn
	c/D22cn2dH4cMZHNwFt4opSG7JIOnznRdCb3xLIBZVcKRgJTPmIQ7+CeSiiIMgNEDZVf
	xzN/juwui1M2GF3roXcCcidTOA6eecFUtKm7I9zkiECCwi3D9V8bX9tUd/meku2kKmQd
	4veGjMVnDw03FlfPZ2S7igYflq3MT8QzuXPu9Q9ft9Ji/G0FGdkBfVhAB1hrXEfVmHjw
	Ko2YdU2Icxzjbwyj4jfiTc62HZBkxNv7p9sqA4vMZb7uVVMOj1OKkS+IPDKVOcw8epCZ
	/n1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0yVW5j/diaIQvY1yMq0bFKbS6dKMLujpejPsf0pKXzk=;
	b=AbDzctTEnWeVOaRdhv33pZEvPDaqLEPVJXoNBDDQv+1aGhIhDiW+RdeY5WKbuTC+ga
	EyOc9Juyp1T94xcERn6LnIp3+nXPVl27ktfxQmcdeeLWVB43JIV5l1fIRzuFk8/HNFlS
	wpoF1iGyLuBotav+UiooKS7TVVW9/42PU0Z79bS5Fgh6NJyH0p/epAS8yZ9ic4OcEl3+
	WlcKFrpTF6LYNyu08uud/Nyz0PKbEA28AVLmOWNSzQ9BVv2580dBbiTcGhP2EPCte5o7
	92rGshRQfw9nCeDWSrd+o4kXAdo0M9PNrbY8i7wLcHnAerowTBZsuDjyZoOmuWfkoj6e
	sTZw==
X-Gm-Message-State: APjAAAWewoshtAw6kr5fJ6WI1qpNU4mJYKWVviKYRXDv+GrSEEjm+qPU
	YbR+8ZcGUn0r6Hhd3tAgSwmzlkc2hz2DtTWFDgrS
X-Google-Smtp-Source: APXvYqxQwMfwBHtKTZVpaUy34rEeZb9cxTXpFPOa8NAHPaaUw+HLvxk3mMmLvtbklMJfIdjsY0xCdhx+76lF45SIdcE=
X-Received: by 2002:a2e:9a97:: with SMTP id p23mr3811340lji.160.1559258825495; 
	Thu, 30 May 2019 16:27:05 -0700 (PDT)
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
	<CAHC9VhThLiQzGYRUWmSuVfOC6QCDmA75BDB7Eg7V8HX4x7ymQg@mail.gmail.com>
	<20190530212900.GC5739@cisco>
In-Reply-To: <20190530212900.GC5739@cisco>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 May 2019 19:26:54 -0400
Message-ID: <CAHC9VhT5HPt9rCJoDutdvA3r1Y1GOHfpXe2eJ54atNC1=Vd8LA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
To: Tycho Andersen <tycho@tycho.ws>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 30 May 2019 23:27:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Thu, 30 May 2019 23:27:07 +0000 (UTC) for IP:'209.85.208.195'
	DOMAIN:'mail-lj1-f195.google.com'
	HELO:'mail-lj1-f195.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.332  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.195 mail-lj1-f195.google.com 209.85.208.195
	mail-lj1-f195.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 30 May 2019 23:28:01 +0000 (UTC)

On Thu, May 30, 2019 at 5:29 PM Tycho Andersen <tycho@tycho.ws> wrote:
> On Thu, May 30, 2019 at 03:29:32PM -0400, Paul Moore wrote:
> >
> > [REMINDER: It is an "*audit* container ID" and not a general
> > "container ID" ;)  Smiley aside, I'm not kidding about that part.]
>
> This sort of seems like a distinction without a difference; presumably
> audit is going to want to differentiate between everything that people
> in userspace call a container. So you'll have to support all this
> insanity anyway, even if it's "not a container ID".

That's not quite right.  Audit doesn't care about what a container is,
or is not, it also doesn't care if the "audit container ID" actually
matches the ID used by the container engine in userspace and I think
that is a very important line to draw.  Audit is simply given a value
which it calls the "audit container ID", it ensures that the value is
inherited appropriately (e.g. children inherit their parent's audit
container ID), and it uses the value in audit records to provide some
additional context for log analysis.  The distinction isn't limited to
the value itself, but also to how it is used; it is an "audit
container ID" and not a "container ID" because this value is
exclusively for use by the audit subsystem.  We are very intentionally
not adding a generic container ID to the kernel.  If the kernel does
ever grow a general purpose container ID we will be one of the first
ones in line to make use of it, but we are not going to be the ones to
generically add containers to the kernel.  Enough people already hate
audit ;)

> > I'm not interested in supporting/merging something that isn't useful;
> > if this doesn't work for your use case then we need to figure out what
> > would work.  It sounds like nested containers are much more common in
> > the lxc world, can you elaborate a bit more on this?
> >
> > As far as the possible solutions you mention above, I'm not sure I
> > like the per-userns audit container IDs, I'd much rather just emit the
> > necessary tracking information via the audit record stream and let the
> > log analysis tools figure it out.  However, the bigger question is how
> > to limit (re)setting the audit container ID when you are in a non-init
> > userns.  For reasons already mentioned, using capable() is a non
> > starter for everything but the initial userns, and using ns_capable()
> > is equally poor as it essentially allows any userns the ability to
> > munge it's audit container ID (obviously not good).  It appears we
> > need a different method for controlling access to the audit container
> > ID.
>
> One option would be to make it a string, and have it be append only.
> That should be safe with no checks.
>
> I know there was a long thread about what type to make this thing. I
> think you could accomplish the append-only-ness with a u64 if you had
> some rule about only allowing setting lower order bits than those that
> are already set. With 4 bits for simplicity:
>
> 1100         # initial container id
> 1100 -> 1011 # not allowed
> 1100 -> 1101 # allowed, but now 1101 is set in stone since there are
>              # no lower order bits left
>
> There are probably fancier ways to do it if you actually understand
> math :)

 ;)

> Since userns nesting is limited to 32 levels (right now, IIRC), and
> you have 64 bits, this might be reasonable. You could just teach
> container engines to use the first say N bits for themselves, with a 1
> bit for the barrier at the end.

I like the creativity, but I worry that at some point these
limitations are going to be raised (limits have a funny way of doing
that over time) and we will be in trouble.  I say "trouble" because I
want to be able to quickly do an audit container ID comparison and
we're going to pay a penalty for these larger values (we'll need this
when we add multiple auditd support and the requisite record routing).

Thinking about this makes me also realize we probably need to think a
bit longer about audit container ID conflicts between orchestrators.
Right now we just take the value that is given to us by the
orchestrator, but if we want to allow multiple container orchestrators
to work without some form of cooperation in userspace (I think we have
to assume the orchestrators will not talk to each other) we likely
need to have some way to block reuse of an audit container ID.  We
would either need to prevent the orchestrator from explicitly setting
an audit container ID to a currently in use value, or instead generate
the audit container ID in the kernel upon an event triggered by the
orchestrator (e.g. a write to a /proc file).  I suspect we should
start looking at the idr code, I think we will need to make use of it.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

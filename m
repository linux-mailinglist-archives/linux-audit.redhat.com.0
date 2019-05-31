Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9F630E59
	for <lists+linux-audit@lfdr.de>; Fri, 31 May 2019 14:47:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA6F43082E10;
	Fri, 31 May 2019 12:46:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA73080DA0;
	Fri, 31 May 2019 12:46:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C1971806B15;
	Fri, 31 May 2019 12:46:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4VCjEG9019936 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 31 May 2019 08:45:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0D8DA53C3A; Fri, 31 May 2019 12:45:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 065456FC3B
	for <linux-audit@redhat.com>; Fri, 31 May 2019 12:45:10 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD4B3CA36F
	for <linux-audit@redhat.com>; Fri, 31 May 2019 12:44:58 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id e13so9439815ljl.11
	for <linux-audit@redhat.com>; Fri, 31 May 2019 05:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZXDOKwkAEMBmiYSeMHCXxPtDvLwnxyJqoeUB0a+jAg8=;
	b=Oh5evWeBS0FQ5+SDSVIYDoDosmFdUraAVQSeP13wAG0FfkUCyvKQpzKYfoQx/Fc9jG
	lSaXqIOqwzoUzI3o8vBwZqtrK4OfHuaXvwJgEezHSUYUzDIRs8JkI5NH1zlR4cxWyQme
	Jfit8Diw2UqqiuTc+FH74c11TZCrrrdmpj/o5+9/QDcaiVnDEyYq21nnWSIA465u/MU4
	+qSUnOUm6rmASeEsGsXm0RP0/aMO/Wsm45X36MGxa7H5G8PkA5ZCJKY5x4qvxmWuxnO8
	Qn1PWZvVAf7u20A+XXfB5qKWG2QcdBuOAtm661NoEzPCdGshFZqYQtHFr/60ieylKxGT
	GHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZXDOKwkAEMBmiYSeMHCXxPtDvLwnxyJqoeUB0a+jAg8=;
	b=KoQSx13kQLfVqEiSWWH1CYfC1D39kJFuxvXz/9c9zJzN++KpAmawqJajs8N0e/I8Ox
	PSCYfynCICYqViC51TvTAUtYYB+8BxOgJ/n4+y4kiZs3QBhg+YlVOy/bqUCvsQEDaDXY
	Ci2rYgzkVI2GaJzfla5vn+0dovNR4T2C/UX1zdfwcmbMcPCjYrvL7Tu7tsOAU1quSmF+
	hHP6EafMAKmHZTpw4lL2I3Td5Y6Svhjg2/RyBZMd4cfo/q5qq1ck2vE+tthydPcohDhF
	xfj9xUmRSU0OmlRjNmNRIuNtsT9LNBXJ2FebQSThV9wm4hLFh0h8FlMgpYc/kq3s1v5o
	uzJw==
X-Gm-Message-State: APjAAAUXOgcGo5lwDQAIYNJcvgP9saaZYfXRJYS1vSWgcXGtWxovx05t
	xAonx7UiqPj58eqDxWPXtT+kEcojdH5DLYx6qfNk
X-Google-Smtp-Source: APXvYqwRVVnGpDVdSGCj6R4r22cAjZvnCnlNYusSiD/sCSGkEdAyXXFr+krFA2m6K8I0tlJghON4fRG9yXZG4071sxQ=
X-Received: by 2002:a2e:3e14:: with SMTP id l20mr5891599lja.40.1559306696964; 
	Fri, 31 May 2019 05:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190529145742.GA8959@cisco>
	<CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
	<20190529153427.GB8959@cisco>
	<CAHC9VhSF3AjErX37+eeusJ7+XRw8yuPsmqBTRwc9EVoRBh_3Tw@mail.gmail.com>
	<20190529222835.GD8959@cisco>
	<CAHC9VhRS66VGtug3fq3RTGHDvfGmBJG6yRJ+iMxm3cxnNF-zJw@mail.gmail.com>
	<20190530170913.GA16722@mail.hallyn.com>
	<CAHC9VhThLiQzGYRUWmSuVfOC6QCDmA75BDB7Eg7V8HX4x7ymQg@mail.gmail.com>
	<20190530212900.GC5739@cisco>
	<CAHC9VhT5HPt9rCJoDutdvA3r1Y1GOHfpXe2eJ54atNC1=Vd8LA@mail.gmail.com>
	<20190531002058.tsddah4edcazkuzs@madcap2.tricolour.ca>
In-Reply-To: <20190531002058.tsddah4edcazkuzs@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 31 May 2019 08:44:45 -0400
Message-ID: <CAHC9VhTrM1op_EH=YAn9pU8dMOr=jB-Ph4SxFeqGFskwLmFnCA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 31 May 2019 12:45:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Fri, 31 May 2019 12:45:04 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com'
	HELO:'mail-lj1-f194.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.365  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 31 May 2019 12:47:21 +0000 (UTC)

On Thu, May 30, 2019 at 8:21 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-05-30 19:26, Paul Moore wrote:
> > On Thu, May 30, 2019 at 5:29 PM Tycho Andersen <tycho@tycho.ws> wrote:
> > > On Thu, May 30, 2019 at 03:29:32PM -0400, Paul Moore wrote:
> > > >
> > > > [REMINDER: It is an "*audit* container ID" and not a general
> > > > "container ID" ;)  Smiley aside, I'm not kidding about that part.]
> > >
> > > This sort of seems like a distinction without a difference; presumably
> > > audit is going to want to differentiate between everything that people
> > > in userspace call a container. So you'll have to support all this
> > > insanity anyway, even if it's "not a container ID".
> >
> > That's not quite right.  Audit doesn't care about what a container is,
> > or is not, it also doesn't care if the "audit container ID" actually
> > matches the ID used by the container engine in userspace and I think
> > that is a very important line to draw.  Audit is simply given a value
> > which it calls the "audit container ID", it ensures that the value is
> > inherited appropriately (e.g. children inherit their parent's audit
> > container ID), and it uses the value in audit records to provide some
> > additional context for log analysis.  The distinction isn't limited to
> > the value itself, but also to how it is used; it is an "audit
> > container ID" and not a "container ID" because this value is
> > exclusively for use by the audit subsystem.  We are very intentionally
> > not adding a generic container ID to the kernel.  If the kernel does
> > ever grow a general purpose container ID we will be one of the first
> > ones in line to make use of it, but we are not going to be the ones to
> > generically add containers to the kernel.  Enough people already hate
> > audit ;)
> >
> > > > I'm not interested in supporting/merging something that isn't useful;
> > > > if this doesn't work for your use case then we need to figure out what
> > > > would work.  It sounds like nested containers are much more common in
> > > > the lxc world, can you elaborate a bit more on this?
> > > >
> > > > As far as the possible solutions you mention above, I'm not sure I
> > > > like the per-userns audit container IDs, I'd much rather just emit the
> > > > necessary tracking information via the audit record stream and let the
> > > > log analysis tools figure it out.  However, the bigger question is how
> > > > to limit (re)setting the audit container ID when you are in a non-init
> > > > userns.  For reasons already mentioned, using capable() is a non
> > > > starter for everything but the initial userns, and using ns_capable()
> > > > is equally poor as it essentially allows any userns the ability to
> > > > munge it's audit container ID (obviously not good).  It appears we
> > > > need a different method for controlling access to the audit container
> > > > ID.
> > >
> > > One option would be to make it a string, and have it be append only.
> > > That should be safe with no checks.
> > >
> > > I know there was a long thread about what type to make this thing. I
> > > think you could accomplish the append-only-ness with a u64 if you had
> > > some rule about only allowing setting lower order bits than those that
> > > are already set. With 4 bits for simplicity:
> > >
> > > 1100         # initial container id
> > > 1100 -> 1011 # not allowed
> > > 1100 -> 1101 # allowed, but now 1101 is set in stone since there are
> > >              # no lower order bits left
> > >
> > > There are probably fancier ways to do it if you actually understand
> > > math :)
> >
> >  ;)
> >
> > > Since userns nesting is limited to 32 levels (right now, IIRC), and
> > > you have 64 bits, this might be reasonable. You could just teach
> > > container engines to use the first say N bits for themselves, with a 1
> > > bit for the barrier at the end.
> >
> > I like the creativity, but I worry that at some point these
> > limitations are going to be raised (limits have a funny way of doing
> > that over time) and we will be in trouble.  I say "trouble" because I
> > want to be able to quickly do an audit container ID comparison and
> > we're going to pay a penalty for these larger values (we'll need this
> > when we add multiple auditd support and the requisite record routing).
> >
> > Thinking about this makes me also realize we probably need to think a
> > bit longer about audit container ID conflicts between orchestrators.
> > Right now we just take the value that is given to us by the
> > orchestrator, but if we want to allow multiple container orchestrators
> > to work without some form of cooperation in userspace (I think we have
> > to assume the orchestrators will not talk to each other) we likely
> > need to have some way to block reuse of an audit container ID.  We
> > would either need to prevent the orchestrator from explicitly setting
> > an audit container ID to a currently in use value, or instead generate
> > the audit container ID in the kernel upon an event triggered by the
> > orchestrator (e.g. a write to a /proc file).  I suspect we should
> > start looking at the idr code, I think we will need to make use of it.
>
> My first reaction to using the IDR code is that once an idr is given up,
> it can be reused.  I suppose we request IDRs and then never give them up
> to avoid reuse...

I'm not sure we ever what to guarantee that an audit container ID
won't be reused during the lifetime of the system, it is a discrete
integer after all.  What I think we do want to guarantee is that we
won't allow an unintentional audit container ID collision between
different orchestrators; if a single orchestrator wants to reuse an
audit container ID then that is its choice.

> I already had some ideas of preventing an existing ID from being reused,

Cool.  I only made the idr suggestion since it is used for PIDs and
solves a very similar problem.

> but that makes the practice of some container engines injecting
> processes into existing containers difficult if not impossible.

Yes, we'll need some provision to indicate which orchestrator
"controls" that particular audit container ID, and allow that
orchestrator to reuse that particular audit container ID (until all
those containers disappear and the audit container ID is given back to
the pool).

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

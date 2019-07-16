Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD766AC79
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jul 2019 18:08:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29FAC308FFB1;
	Tue, 16 Jul 2019 16:08:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38853611DE;
	Tue, 16 Jul 2019 16:08:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D86C21972E;
	Tue, 16 Jul 2019 16:08:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GG8YqL028590 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 12:08:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D3ECB5C231; Tue, 16 Jul 2019 16:08:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF1845C554
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 16:08:32 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D483F309264C
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 16:08:29 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id i21so20540047ljj.3
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 09:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/PtK1riFgjOIHlhJQFDyC4q5ySxhAO8yRuQks2dZNfk=;
	b=Qwsq8LGcu+4f6+GbfIyFs2u6MHmOVpuck5n/OWKzIuI5zY2IEMHVb2BlOPpRjweGnr
	9i8WS3lTXJvrmNA3uKxRy/kBzYt9LaiqRshEtKmQEJUbp5IcyCsprGyn+/Hostoq0Akp
	fBp77TXTneOqutrYEP4nt1/3Z35g24lfztChoxSwOTJHnvFJU0e4D6mkSR+WiqY5947O
	nUfntsUfvTqtO5CBerTxsjINgBIZoRysGAHtdFIJX2J3zv5YHlQOcJYFs3td5L4fR8Lk
	d0sWfz0Mu/72Rs/IxvY5zxIgaImboim9OQzpxpGSwCOla8rOm2uf6o8KvI1dmBTbh+OU
	4jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/PtK1riFgjOIHlhJQFDyC4q5ySxhAO8yRuQks2dZNfk=;
	b=ic/jBaKFyh+WrDO5b+dyMTYwJm0UuvQIwuKdecKi8W6I6o1iWBSgmNMl2LNhZfzWe4
	Gx2EQKeQ5j5MI50QJsqb7SFgbTsQYdQXLvSnKUXboi/APsltHlGB1T/KrbxqCWTVaVkx
	yTwyqCOb6CA75dI/5Vj8eO4gvDDyGzeFYIf+wJzYxTk2Y312VZFPT768j7rIJnd3b8q2
	dMvEaTwHudGYilrZilqIQEvfG+SiNhxDSCJ47TjmwlQztyFPjHGXa9UbgJmFYc7RU5Ag
	Qg24TFqm0QQ+tLXR0NeTfv5cpDElYTSUuxqHX/b6Ys4ji03UbtIK8x0uFvgDrBoJMVLt
	e+0w==
X-Gm-Message-State: APjAAAXsCKo/A/TTcRtvZQmYJqZMJwIGqQMeYG0lvJ0QQo1oEG/KODDX
	lEXvCGvtLhDyPeppkLIbNxcXQqZw9e7NNe80dQ==
X-Google-Smtp-Source: APXvYqyKryFIQegG0hjOTB9NgCpoMoahL1Zn87LGMl/BlFDzO2b4dUJIotzjf0uK56x3MSXiQ8vlXsbNOXtxYHU7vwc=
X-Received: by 2002:a2e:9dc1:: with SMTP id x1mr18159218ljj.0.1563293308121;
	Tue, 16 Jul 2019 09:08:28 -0700 (PDT)
MIME-Version: 1.0
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
	<20190716153705.xx7dwrhliny5amut@madcap2.tricolour.ca>
In-Reply-To: <20190716153705.xx7dwrhliny5amut@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 16 Jul 2019 12:08:16 -0400
Message-ID: <CAHC9VhTaLqCo8rmAaySJQB+Pf-580=3mvX1rPmtEeb9o5Uy9Qg@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 16 Jul 2019 16:08:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Tue, 16 Jul 2019 16:08:30 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 16 Jul 2019 16:08:43 +0000 (UTC)

On Tue, Jul 16, 2019 at 11:37 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-07-15 17:09, Paul Moore wrote:
> > On Mon, Jul 8, 2019 at 2:12 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2019-05-30 19:26, Paul Moore wrote:
> >
> > ...
> >
> > > > I like the creativity, but I worry that at some point these
> > > > limitations are going to be raised (limits have a funny way of doing
> > > > that over time) and we will be in trouble.  I say "trouble" because I
> > > > want to be able to quickly do an audit container ID comparison and
> > > > we're going to pay a penalty for these larger values (we'll need this
> > > > when we add multiple auditd support and the requisite record routing).
> > > >
> > > > Thinking about this makes me also realize we probably need to think a
> > > > bit longer about audit container ID conflicts between orchestrators.
> > > > Right now we just take the value that is given to us by the
> > > > orchestrator, but if we want to allow multiple container orchestrators
> > > > to work without some form of cooperation in userspace (I think we have
> > > > to assume the orchestrators will not talk to each other) we likely
> > > > need to have some way to block reuse of an audit container ID.  We
> > > > would either need to prevent the orchestrator from explicitly setting
> > > > an audit container ID to a currently in use value, or instead generate
> > > > the audit container ID in the kernel upon an event triggered by the
> > > > orchestrator (e.g. a write to a /proc file).  I suspect we should
> > > > start looking at the idr code, I think we will need to make use of it.
> > >
> > > To address this, I'd suggest that it is enforced to only allow the
> > > setting of descendants and to maintain a master list of audit container
> > > identifiers (with a hash table if necessary later) that includes the
> > > container owner.
> >
> > We're discussing the audit container ID management policy elsewhere in
> > this thread so I won't comment on that here, but I did want to say
> > that we will likely need something better than a simple list of audit
> > container IDs from the start.  It's common for systems to have
> > thousands of containers now (or multiple thousands), which tells me
> > that a list is a poor choice.  You mentioned a hash table, so I would
> > suggest starting with that over the list for the initial patchset.
>
> I saw that as an internal incremental improvement that did not affect
> the API, so I wanted to keep things a bit simpler (as you've requested
> in the past) to get this going, and add that enhancement later.

In general a simple approach is a good way to start when the
problem/use-case is not very well understood; in other words, don't
spend a lot of time/effort optimizing something you don't yet
understand.  In this case we know that people want to deploy a *lot*
of containers on a single system so we should design the data
structures appropriately.  A list is simply not a good fit here, I
believe/hope you know that too.

> I'll start working on it now.  The hash table would simply point to
> lists anyways unless you can recommend a better approach.

I assume when you say "point to lists" you are talking about using
lists for the hash buckets?  If so, yes that should be fine at this
point.  In general if the per-bucket lists become a bottleneck we can
look at the size of the table (or make it tunable) or even use a
different approach entirely.  Ultimately the data store is an
implementation detail private to the audit subsystem in the kernel so
we should be able to change it as necessary without breaking anything.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

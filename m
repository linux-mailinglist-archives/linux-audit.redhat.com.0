Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DFC4D1B4BA2
	for <lists+linux-audit@lfdr.de>; Wed, 22 Apr 2020 19:25:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587576300;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9nnzCnoXUmM+cE8bWM4hUeZJY2UDYhD1ZgtAIuebZCw=;
	b=YxG759G/8K/BN15rSdgcM9bKjBSoNeHthgw3Sc3bD+OKqx660rHjJePup0QRKD6l0pKdbh
	kxHtgaYIaYxFh79ntiKXGolSpoUS74zuRbPxOjeNTS/bzp4RN5iCfr+4QVtgmnA1HdJGGr
	dAFxPxLRmlMzK4fMLgEc6SrcYnXyt0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-u2HO-NHyNjK1gIsOu4__hg-1; Wed, 22 Apr 2020 13:24:58 -0400
X-MC-Unique: u2HO-NHyNjK1gIsOu4__hg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32982190B2A3;
	Wed, 22 Apr 2020 17:24:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D882560C88;
	Wed, 22 Apr 2020 17:24:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 05E671809541;
	Wed, 22 Apr 2020 17:24:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03MHOSsp025397 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 13:24:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D55FD11321; Wed, 22 Apr 2020 17:24:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0D8D10C17
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 17:24:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3758080CDAE
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 17:24:26 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-181-SU6LUvfLNfu3qNt5kfaYHQ-1; Wed, 22 Apr 2020 13:24:23 -0400
X-MC-Unique: SU6LUvfLNfu3qNt5kfaYHQ-1
Received: by mail-ed1-f65.google.com with SMTP id p16so2094585edm.10
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 10:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=APNUHzLUzqMTjpD++gENW9cK47rOtpcZ7nOkDc65bfc=;
	b=cby9qmAiBiC+ALdhUL98gY16/eEFnnM2shRIFFo2R1RMmLOWZICFCU9d7DxJBtYH1h
	SY9PmMForOdYMvYCGDfvZpGTi9ZTQV9WrMpmhcS6gbiRoRC1W1Tmw+QYRfmT2Rs0vzf8
	lVpvDPAhHFzMvOuRIVNlZAGfdJg5LCSiKZkccItefR3S87zeNnv8gpvzBz1Niv+wQIT8
	oyMt1oah/ozJ6XfK3JIfyFDKiXg5czEJ8Is3RZACdoL0T35Qqp3xiyAVHGTOa4b8Iglg
	XQOL+Qw5XHUgj3X3ZoGKc8obOFf53l0oSJObvrcHvhusDg3+JXzoo83zTjRnOp2oiOXt
	xmAA==
X-Gm-Message-State: AGi0PubwbDXCYwrTwcM4g7RTrhvDfhRDYZeBNHY0qCFOOvKTSRhEyeud
	nOqGvsGzRegceoi+9Cb7ztohl2T6aHwDdHV6HBN+
X-Google-Smtp-Source: APiQypIMvd7pFypaVAqurmo05vROlLEFVqAJCW3HhL11RtC5L7kaKf1j+c3e9Byi2T3gVtDbCY5W8CN8v1dmSnAPJR0=
X-Received: by 2002:a05:6402:1adc:: with SMTP id
	ba28mr11965299edb.12.1587576262305; 
	Wed, 22 Apr 2020 10:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200318215550.es4stkjwnefrfen2@madcap2.tricolour.ca>
	<CAHC9VhSdDDP7Ec-w61NhGxZG5ZiekmrBCAg=Y=VJvEZcgQh46g@mail.gmail.com>
	<20200319220249.jyr6xmwvflya5mks@madcap2.tricolour.ca>
	<CAHC9VhR84aN72yNB_j61zZgrQV1y6yvrBLNY7jp7BqQiEDL+cw@mail.gmail.com>
	<20200324210152.5uydf3zqi3dwshfu@madcap2.tricolour.ca>
	<CAHC9VhTQUnVhoN3JXTAQ7ti+nNLfGNVXhT6D-GYJRSpJHCwDRg@mail.gmail.com>
	<20200330134705.jlrkoiqpgjh3rvoh@madcap2.tricolour.ca>
	<CAHC9VhQTsEMcYAF1CSHrrVn07DR450W9j6sFVfKAQZ0VpheOfw@mail.gmail.com>
	<20200330162156.mzh2tsnovngudlx2@madcap2.tricolour.ca>
	<CAHC9VhTRzZXJ6yUFL+xZWHNWZFTyiizBK12ntrcSwmgmySbkWw@mail.gmail.com>
	<20200330174937.xalrsiev7q3yxsx2@madcap2.tricolour.ca>
	<CAHC9VhR_bKSHDn2WAUgkquu+COwZUanc0RV3GRjMDvpoJ5krjQ@mail.gmail.com>
	<871ronf9x2.fsf@x220.int.ebiederm.org>
	<CAHC9VhR3gbmj5+5MY-whLtStKqDEHgvMRigU9hW0X1kpxF91ag@mail.gmail.com>
	<871rol7nw3.fsf@x220.int.ebiederm.org>
In-Reply-To: <871rol7nw3.fsf@x220.int.ebiederm.org>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Apr 2020 13:24:10 -0400
Message-ID: <CAHC9VhQvhja=vUEbT3uJgQqpj-480HZzWV7b5oc2GWtzFN1qJw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: "Eric W. Biederman" <ebiederm@xmission.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03MHOSsp025397
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 17, 2020 at 6:26 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
> Paul Moore <paul@paul-moore.com> writes:
> > On Thu, Apr 16, 2020 at 4:36 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
> >> Paul Moore <paul@paul-moore.com> writes:
> >> > On Mon, Mar 30, 2020 at 1:49 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >> >> On 2020-03-30 13:34, Paul Moore wrote:
> >> >> > On Mon, Mar 30, 2020 at 12:22 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >> >> > > On 2020-03-30 10:26, Paul Moore wrote:
> >> >> > > > On Mon, Mar 30, 2020 at 9:47 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> >> >> > > > > On 2020-03-28 23:11, Paul Moore wrote:
> >> >> > > > > > On Tue, Mar 24, 2020 at 5:02 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >> >> > > > > > > On 2020-03-23 20:16, Paul Moore wrote:
> >> >> > > > > > > > On Thu, Mar 19, 2020 at 6:03 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >> >> > > > > > > > > On 2020-03-18 18:06, Paul Moore wrote:
> >> >
> >> > ...
> >> >
> >> >> > > Well, every time a record gets generated, *any* record gets generated,
> >> >> > > we'll need to check for which audit daemons this record is in scope and
> >> >> > > generate a different one for each depending on the content and whether
> >> >> > > or not the content is influenced by the scope.
> >> >> >
> >> >> > That's the problem right there - we don't want to have to generate a
> >> >> > unique record for *each* auditd on *every* record.  That is a recipe
> >> >> > for disaster.
> >> >> >
> >> >> > Solving this for all of the known audit records is not something we
> >> >> > need to worry about in depth at the moment (although giving it some
> >> >> > casual thought is not a bad thing), but solving this for the audit
> >> >> > container ID information *is* something we need to worry about right
> >> >> > now.
> >> >>
> >> >> If you think that a different nested contid value string per daemon is
> >> >> not acceptable, then we are back to issuing a record that has only *one*
> >> >> contid listed without any nesting information.  This brings us back to
> >> >> the original problem of keeping *all* audit log history since the boot
> >> >> of the machine to be able to track the nesting of any particular contid.
> >> >
> >> > I'm not ruling anything out, except for the "let's just completely
> >> > regenerate every record for each auditd instance".
> >>
> >> Paul I am a bit confused about what you are referring to when you say
> >> regenerate every record.
> >>
> >> Are you saying that you don't want to repeat the sequence:
> >>         audit_log_start(...);
> >>         audit_log_format(...);
> >>         audit_log_end(...);
> >> for every nested audit daemon?
> >
> > If it can be avoided yes.  Audit performance is already not-awesome,
> > this would make it even worse.
>
> As far as I can see not repeating sequences like that is fundamental
> for making this work at all.  Just because only the audit subsystem
> should know about one or multiple audit daemons.  Nothing else should
> care.

Yes, exactly, this has been mentioned in the past.  Both the
performance hit and the code complication in the caller are things we
must avoid.

> >> Or are you saying that you would like to literraly want to send the same
> >> skb to each of the nested audit daemons?
> >
> > Ideally we would reuse the generated audit messages as much as
> > possible.  Less work is better.  That's really my main concern here,
> > let's make sure we aren't going to totally tank performance when we
> > have a bunch of nested audit daemons.
>
> So I think there are two parts of this answer.  Assuming we are talking
> about nesting audit daemons in containers we will have different
> rulesets and I expect most of the events for a nested audit daemon won't
> be of interest to the outer audit daemon.

Yes, this is another thing that Richard and I have discussed in the
past.  We will basically need to create per-daemon queues, rules,
tracking state, etc.; that is easy enough.  What will be slightly more
tricky is the part where we apply the filters to the individual
records and decide if that record is valid/desired for a given daemon.
I think it can be done without too much pain, and any changes to the
callers, but it will require a bit of work to make sure it is done
well and that records are needlessly duplicated in the kernel.

> Beyond that it should be very straight forward to keep a pointer and
> leave the buffer as a scatter gather list until audit_log_end
> and translate pids, and rewrite ACIDs attributes in audit_log_end
> when we build the final packet.  Either through collaboration with
> audit_log_format or a special audit_log command that carefully sets
> up the handful of things that need that information.

In order to maximize record re-use I think we will want to hold off on
assembling the final packet until it is sent to the daemons in the
kauditd thread.  We'll also likely need to create special
audit_log_XXX functions to capture fields which we know will need
translation, e.g. ACID information.  (the reason for the new
audit_log_XXX functions would be to mark the new sg element and ensure
the buffer is handled correctly)

Regardless of the details, I think the scatter gather approach is the
key here - that seems like the best design idea I've seen thus far.
It enables us to replace portions of the record as needed ... and
possibly use the existing skb cow stuff ... it has been a while, but
does the skb cow functions handle scatter gather skbs or do they need
to be linear?

> Hmm.  I am seeing that we send skbs to kauditd and then kauditd
> sends those skbs to userspace.  I presume that is primary so that
> sending messages to userspace does not block the process being audited.
> Plus a little bit so that the retry logic will work.

Long story short, it's a poor design.  I'm not sure who came up with
it, but I have about a 1000 questions that are variations on "why did
this seem like a good idea?".

I expect the audit_buffer definition to change significantly during
the nested auditd work.

> I think the naive implementation would be to simply have 1 kauditd
> per auditd (strictly and audit context/namespace).  Although that can be
> optimized if that is a problem.
>
> Beyond that I think we would need to look at profiles to really
> understand where the bottlenecks are.

Agreed.  This is a hidden implementation detail that doesn't affect
the userspace API or the in-kernel callers.  The first approach can be
simple and we can complicate it as needed in future versions.

> > I'm open to any ideas people may have.  We have a problem, let's solve
> > it.
>
> It definitely makes sense to look ahead to having audit daemons running
> in containers, but in the grand scheme of things that is a nice to have.
> Probably something we will and should get to, but we have lived a long
> time without auditd running in containers so I expect we can live a
> while longer.

It looks like you are confusing my concern.  I'm not pushing Richard
to implement support for this in the current patchset, I'm pushing
Richard to consider the design aspect of having multiple audit daemons
so that we don't code ourselves into a corner with the audit record
changes he is proposing.  The audit record format is part of the
kernel/userspace API and as a result requires great care when
modifying/extending/etc.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


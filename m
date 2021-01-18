Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E447A2FABA4
	for <lists+linux-audit@lfdr.de>; Mon, 18 Jan 2021 21:37:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-NFRCQe6SM9uRvhVRwC0fVg-1; Mon, 18 Jan 2021 15:37:15 -0500
X-MC-Unique: NFRCQe6SM9uRvhVRwC0fVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E2B7107ACE4;
	Mon, 18 Jan 2021 20:37:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 526391876A;
	Mon, 18 Jan 2021 20:37:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1FA55180954D;
	Mon, 18 Jan 2021 20:37:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10IKanku003986 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 18 Jan 2021 15:36:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 993942166B28; Mon, 18 Jan 2021 20:36:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 942602166B29
	for <linux-audit@redhat.com>; Mon, 18 Jan 2021 20:36:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02ACD8039DD
	for <linux-audit@redhat.com>; Mon, 18 Jan 2021 20:36:47 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
	[209.85.218.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-455-SA3nVyZuOpWJ51zwmg3SCw-1; Mon, 18 Jan 2021 15:36:44 -0500
X-MC-Unique: SA3nVyZuOpWJ51zwmg3SCw-1
Received: by mail-ej1-f44.google.com with SMTP id rv9so6686460ejb.13
	for <linux-audit@redhat.com>; Mon, 18 Jan 2021 12:36:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f5T5Ek8ylJCouNW2qCuiFTAxzYm9uNnzMDh9ZOIqOfU=;
	b=VO3anEiasolJve8WwCTqPPToEkwxKjsDCQpVYm3P3D+rqEsZjjuUcoYqTGIJR1Vg+g
	5eudGzW785cT2lh6RtiRxindBi1qECB2JDVoL7KaN09EUVEdVy0KIEaeMeZU1eAg/pWQ
	rkuFKRWbSPTTR1mcluFjVpBqO/jzEsW1jGGzC1aHJmqiGdhCvseO8CWpCLcqasO/0wSL
	2zUoVuIrigIAchlpLVl/LwFyyI+EC2RXohu+C1IRP4PoLeH46/Qa8qw8WLR87tB1EHCf
	rG3uY0OR8LGRhDRdFNt4mvfBy7nXrbWHN7ia8YbYWdcPsv0Fm9bTiIG7pswrQlYxlQFZ
	/nyg==
X-Gm-Message-State: AOAM532YdTK7LWmsmrb3sDiCS7ORlxpHTXhFGjw6altzgRafx8g5uUZz
	xrTJRvK03NDX2QwBcGf5MfJatiDRhlxq8XesKmCXXPcyFA==
X-Google-Smtp-Source: ABdhPJxw2RoIBxvao3OogtiF1uxzApP85uTndRBH6VzcDYay0M/RS9BSKxK5l9pvTW+aAw8xggyujTwCSnY5NxpB73Q=
X-Received: by 2002:a17:907:c01:: with SMTP id
	ga1mr890314ejc.488.1611002202776; 
	Mon, 18 Jan 2021 12:36:42 -0800 (PST)
MIME-Version: 1.0
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<5445873.DvuYhMxLoT@x2>
	<17715c36170.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
	<3095712.44csPzL39Z@x2>
In-Reply-To: <3095712.44csPzL39Z@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 18 Jan 2021 15:36:31 -0500
Message-ID: <CAHC9VhT_yd=zEusQga507jA43S_stCb2kAmd_sN6fLNcdLDdWg@mail.gmail.com>
Subject: Re: Occasional delayed output of events
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, Linux Audit <linux-audit@redhat.com>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 18, 2021 at 9:31 AM Steve Grubb <sgrubb@redhat.com> wrote:
> On Monday, January 18, 2021 8:54:30 AM EST Paul Moore wrote:
> > >>> I like the N of M concept but there would be a LOT of change -
> > >>> especially
> > >>> for all the non-kernel event sources. The EOE would be the most
> > >>> seamless, but at a cost. My preference is to allow the 2 second 'timer'
> > >>> to be configurable.
> > >>
> > >> Agree with Burn, numbering the records coming up from the kernel is
> > >> going to be a real nightmare, and not something to consider lightly.
> > >> Especially when it sounds like we don't yet have a root cause for the
> > >> issue.
> > >
> > > A very long time ago, we had numbered records. But it was decided that
> > > there's no real point in it and we'd rather just save disk space.
> >
> > With the current kernel code, adding numbered records is not something to
> > take lightly.
>
> That's why I'm saying we had it and it was removed. I could imagine that if
> you had auditing of the kill syscall enabled and a whole process group was
> being killed, you could have hundreds of records that need numbering. No good
> way to know in advance how many records make up the event.

You only mentioned disk space concerns so it wasn't clear to me that
you were in agreement about this being a bad idea.  Regardless, I'm
glad to see we are on the same page about this.

> > > I know that the kernel does not serialize the events headed for user
> > > space. But I'm curious how an event gets stuck and others can jump ahead
> > > while one that's already inflight can get hung for 4 seconds before it's
> > > next record goes out?
> >
> > Have you determined that the problem is the kernel?
>
> I assume so because the kernel adds the timestamp and choses what hits the
> socket next. Auditd does no ordering of events. It just looks up the text
> event ID, some minor translation if the enriched format is being used, and
> writes it to disk. It can handle well over 100k records per second.

Feel free to insert the old joke about assumptions.

I guess I was hoping for a bit more understanding of the problem and
perhaps some actual data indicating the kernel was the source of the
problem.  Conjecture based on how things are supposed to work can be
misleading.

> > Initially it was looking like it was a userspace issue, is that no longer
> > the general thought?
>
> I don't see how user space could cause this. Even if auditd was slow, it
> shouldn't take 4 seconds to write to disk and then come back to read another
> record. And even it did, why would the newest record go out before completing
> one that's in progress? Something in the kernel chooses what's next. I
> suspect that might need looking at.

See above.

> > Also, is there a reliable reproducer yet?
>
> I don't know of one. But, I suppose we could modify ausearch to look for
> examples of this.

The kernel queuing is a rather complicated affair due to the need to
gracefully handle auditd failing, fallbacks to the console, and
multicast groups all while handling extreme pressure (e.g. auditing
*every* syscall) and not destroying the responsiveness of the system
(we actually can still make forward progress if you are auditing
*every* syscall).  With that complexity comes a number of corner
cases, and I imagine there are a few cases where the system is under
extreme pressure and/or the auditd daemon is dead and/or starved from
CPU time.  As I know Richard is reading this, to be clear I'm talking
about the hold/retry queues and the UNICAST_RETRIES case.  The severe
delays you are talking about in this thread seem severe, but perhaps
if the system is under enough pressure to cause the ordering issues in
the first place such a delay is to be expected.

Anyway, my test setup isn't likely able to reproduce such a scenario
without some significant tweaks, so perhaps those of you who have seen
this problem (Burn, and anyone else?) could shed some light into the
state of the system when the ordering problem occurred.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 848042F89FC
	for <lists+linux-audit@lfdr.de>; Sat, 16 Jan 2021 01:36:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610757392;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=833OE+rW02YFow1VIJGO86Ve1UTliiJsR2ls2L0BpiU=;
	b=gL6vA2gAgazFvfIPCdmWVjdtkoWXJ93vi4YagNHOwWplqhc+KOAH4kXHrnbxau5xqag+/t
	LERgOGI4sibNgz4Hu/XRwZwwkyuV7H5mBmDfK61z+8BX3NwH/ZxM+gYR9J1KpP+yOXSKjn
	4S1djFct/o+EL379xhgN+hXHqXufuFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-c-TH61zpMa2tulghVMs9cA-1; Fri, 15 Jan 2021 19:36:30 -0500
X-MC-Unique: c-TH61zpMa2tulghVMs9cA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC39E100559A;
	Sat, 16 Jan 2021 00:36:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9753D60BF3;
	Sat, 16 Jan 2021 00:36:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8C9518095C9;
	Sat, 16 Jan 2021 00:36:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10G0a8Te016683 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 15 Jan 2021 19:36:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 30EEA17195; Sat, 16 Jan 2021 00:36:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67BC65C73F;
	Sat, 16 Jan 2021 00:36:01 +0000 (UTC)
Date: Fri, 15 Jan 2021 19:35:58 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: burn@swtf.dyndns.org
Subject: Re: Occasional delayed output of events
Message-ID: <20210116003558.GK2015948@madcap2.tricolour.ca>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<5426593.DvuYhMxLoT@x2>
	<1340951117184f479e4f5dc75766fba91ed2c085.camel@iinet.net.au>
	<2756596.e9J7NaK4W3@x2>
	<8368b5c67757f2de8f664bc2eef5f5ca153a0c87.camel@iinet.net.au>
	<b54cbdc20be119eff5c33074df8bed671ae5571f.camel@iinet.net.au>
	<c42f4c5bb88a390e9bf36b026bee0d48a169cf9d.camel@iinet.net.au>
MIME-Version: 1.0
In-Reply-To: <c42f4c5bb88a390e9bf36b026bee0d48a169cf9d.camel@iinet.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: Linux Audit <linux-audit@redhat.com>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2021-01-16 09:18, Burn Alting wrote:
> On Sun, 2021-01-10 at 15:39 +1100, Burn Alting wrote:
> > On Tue, 2021-01-05 at 07:12 +1100, Burn Alting wrote:
> > > On Mon, 2021-01-04 at 09:46 -0500, Steve Grubb wrote:
> > > > On Monday, January 4, 2021 2:55:25 AM EST Burn Alting wrote:
> > > > > On Sun, 2021-01-03 at 10:41 -0500, Steve Grubb wrote:
> > > > > > On Friday, January 1, 2021 4:22:33 PM EST Burn Alting wrote:
> > > > > > > Sometimes, events recorded in /var/log/audit/audit.log appear
> > > > > > > someseconds past co- located events which results
> > > > > > > inauparse:au_check_events() marking  these events complete before
> > > > > > > theyare. An example of this can be seen below with the offending event
> > > > > > > id44609.
> > > > > > > This has been plaguing me for a year or two and this morning was
> > > > > > > thefirst time I still had access to the raw audit.log files (I monitor a
> > > > > > > lotof event types and the log files roll over fairly quickly).The
> > > > > > > example below is from a fully patched Centos 7 but I have also seenthis
> > > > > > > on a patched Fedora 32.
> > > > > > > Has this been seen before? Do we need to re-evaluate how
> > > > > > > auparse'completes' an event (ie 2 seconds is too quick).
> > > > > > 
> > > > > > I have never seen this. But on the way to disk, auditd only does
> > > > > > lightprocessing of the event.  If the format is enriched, it looks things
> > > > > > upon a record by record basis. It does not collect events until they
> > > > > > arecomplete - it dumps it to disk as soon as it can tack on the
> > > > > > extrainformation.
> > > > > > So, the question would be, does this delay happen on the way to disk? Oris
> > > > > > this an artifact of post processing the logs with an auparse basedutility?
> > > > > > Can this be observed repeatedly on the same raw logs? If so,then maybe
> > > > > > auparse does have some issue. But if this is a postprocessing issue, then
> > > > > > the wall clock doesn't matter because this eventshould have collected up
> > > > > > together.
> > > > > > I'd say this merits some investigation.
> > > > > 
> > > > > OK. I think this needs to be addressed on two fronts. There may be
> > > > > more.A.  Within post processing ... a 2 second timeout is not sufficient.
> > > > > Iwould suggest we modify auparse.c:au_check_events() to i) perform theevent
> > > > > type checks first, then  ii) increase the timeout of 2 seconds to be a
> > > > > larger value based onempirical tests.
> > > > 
> > > > In the post processing, there are 2 use cases. The first is events that are on
> > > > disk. In this usage, the 2 second timeout does not come into effect because
> > > > the events are run through probably within nanoseconds or microseconds at the
> > > > worst. The only time it would come into effect is if the terminating record is
> > > > missing.
> > > 
> > > In this first case, the 2 second timeout is on the event's time, not the
> > > 'processing time'.  See ausearch-lol.c:check_events() and
> > > auparse.c:au_get_ready_event().
> > > And I use the checkpointing code to avoid the incomplete event issue.
> > > 
> > > In my case, I have not lost records, it's just that an event has arrived on disk
> > > with an event time more than 2 seconds after the previously written event.
> > > Basically,
> > > a. The event was delayed getting to auditd and we look to the kernel for a
> > > solution.
> > > b. The event arrived at a reasonable point in time at auditd and for some reason
> > > auditd delayed it's printing (by the way I tend to use RAW log format, not
> > > enriched.
> > > 
> > > In either case, I believe ausearch-lol.c:check_events() and
> > > auparse.c:au_get_ready_event() do need to be changed as we have complete events
> > > written by auditd
> > > which these two routines fail to process properly.
> > > 
> > Changing the two second timeout in ausearch-lol.c:check_events() and, one assumes
> > in  auparse.c:au_get_ready_event() (but I have not tested the auparse code) fixes
> > the processing  of the delayed event.
> > Changing the value to say 10 seconds fixes my example use case, but given the
> > kernel or auditd could emit an event with a larger delay, should this be a
> > configuration item in /etc/audit/auditd.conf?
> > 
> > I have raised both a bugzilla report (
> > https://bugzilla.redhat.com/show_bug.cgi?id=1914603) and Issue (
> > https://github.com/linux-audit/audit-userspace/issues/148)
> > 
> > How do you want me to proceed ... a simple change to 10 seconds or a more
> > versatile configuration item in auditd.conf?
> > I can perform either and issue a PR if so required.
> 
> What do people think ... I would point out this currently occurs in both audit-
> 2.8.5-4.el7.x86_64 and audit-3.0-0.17.20191104git1c2f876.el8.x86_64 and a just
> compiled checkout of the audit-userspace code audit-3.0-1.fc33.x86_64.
> I have found examples (under audit-3.0-0.17.20191104git1c2f876.el8.x86_64) that I
> need a 15 second delay.
> I accept there may be an issue in the kernel but if it is not simple (I only see
> this occasionally), then we need a fix in the userspace. Since I have found varied
> times required, do I go down the path of a big value OR a configuration item in
> /etc/audit/auditd.conf?

Or we go back to userspace code looking for the EOE record?  This
doesn't help if they arrive out of order.  Do we number the records in
the kernel?  N of M...

> > > > The other use case is realtime processing as an audispd plugin. In this use
> > > > case the wall clock could matter because records could potentially get lost
> > > > due to overflows or another plugin taking too long. This is the use case where
> > > > the wall clock matters. And again, it matters when records get lost or delayed
> > > > in transit. As long as everything is flowing, it should not factor into event
> > > > processing.
> > > > > B. I will build a temporary auditd daemon to perform some empirical
> > > > > testingto see how long events can reside within the daemon. I may need
> > > > > someadvice on this. I assume that the code that sets the timestamp is
> > > > > insrc/auditd.c:send_audit_event().
> > > > 
> > > > This is only for audit daemon's internal events. For all "real" events, it's
> > > > set in the kernel.
> > > 
> > > If that is the case and the kernel is establishing the timestamp, then either
> > > the kernel has delayed the eventsarrival at the daemon or the daemon has delayed
> > > it's writing.
> > > > > If so, I will see if I can put orchestration debug code in to monitor
> > > > > anevent's 'time in daemon' until this point. I will then report on this.
> > > > > I believe given that AUDIT_PROCTITLE and AUDIT_EOE is fairly widespread,then
> > > > > the testing switch in A. will not be a big issue (time cost wise). Itwill
> > > > > also mean that if we over compensate the timeout that would causeadditional
> > > > > memory cost in auparse() then this is mittigated.
> > > > 
> > > > I'd suggest breaking up the event completion tests so that an exact collection
> > > > termination reason code could be associated to the event.
> > > > > With respect to 'There may be more' fronts. Are there other points in
> > > > > the'audit ecosystem' that makes use of the '2 second timeout'.
> > > > 
> > > > Ausearch/report has its own special copy of the event collection logic. It
> > > > should be nearly identical to what auparse does.
> > > 
> > > They appear identical  ... ausearch-lol.c:check_events() and
> > > auparse.c:au_get_ready_event().
> > > > > I will start work on this, this coming weekend if the above makes sense.
> > > > 
> > > > One other thought, the current shipping code is audit-3.0, doing a diff
> > > > between it and audit-2.8.5 for the auparse directory does show some
> > > > differences in event collection/grouping/next_event. A lot of the differences
> > > > are cosmetic to fix extra whitespace or indentation. But if you skip all that,
> > > > there are some real changes that probably were because of bug reports. For
> > > > example,
> > > 
> > > I will go through these, although this occurs on my Centos 7's (audit-2.8.5-
> > > 4.el7.x86_64) as well as my 8's (audit-3.0-0.17.20191104git1c2f876.el8.x86_64).
> > > > @@ -259,15 +260,6 @@ static event_list_t *au_get_ready_event(        if
> > > > (lowest && lowest->status == EBS_COMPLETE) {                lowest->status =
> > > > EBS_EMPTY;                au->au_ready--;-               // Try to consolidate
> > > > the array so that we iterate-               // over a smaller portion next
> > > > time-               if (lowest == &lol->array[lol->maxi])
> > > > {-                       au_lolnode *ptr =
> > > > lowest;-                       while (ptr->status == EBS_EMPTY && lol->maxi >
> > > > 0) {-                               lol->maxi
> > > > --;-                               ptr = &lol->array[lol
> > > > ->maxi];-                       }-               }                return
> > > > lowest->l;        }
> > > > and
> > > > @@ -1536,6 +1550,13 @@ static int
> > > > au_auparse_next_event(auparse                aup_list_create(l);              
> > > >   aup_list_set_event(l, &e);                aup_list_append(l, au->cur_buf,
> > > > au->list_idx, au-
> > > > > line_number);
> > > > +               // Eat standalone EOE - main event was already marked
> > > > complete+               if (l->head->type == AUDIT_EOE)
> > > > {+                       au->cur_buf =
> > > > NULL;+                       aup_list_clear(l);+                       free(l)
> > > > ;+                       continue;+               }                if
> > > > (au_lol_append(au->au_lo, l) == NULL) {                        free((char
> > > > *)e.host); #ifdef LOL_EVENTS_DEBUG01
> > > > I don't know if those have an effect on what you are seeing. But that is the
> > > > only substantial changes that I can see.
> > > > -Steve
> > 
> > Burn

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


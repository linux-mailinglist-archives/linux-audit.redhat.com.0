Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 220342F8ACE
	for <lists+linux-audit@lfdr.de>; Sat, 16 Jan 2021 03:43:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-zfpGcROKPV6GHofb7OyoTw-1; Fri, 15 Jan 2021 21:43:51 -0500
X-MC-Unique: zfpGcROKPV6GHofb7OyoTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD6A1806664;
	Sat, 16 Jan 2021 02:43:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6F5C10023AF;
	Sat, 16 Jan 2021 02:43:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7189E4BB7B;
	Sat, 16 Jan 2021 02:43:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10G2hI9B026288 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 15 Jan 2021 21:43:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9255A10848D; Sat, 16 Jan 2021 02:43:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C2DFF49D8
	for <linux-audit@redhat.com>; Sat, 16 Jan 2021 02:43:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D40688039DD
	for <linux-audit@redhat.com>; Sat, 16 Jan 2021 02:43:09 +0000 (UTC)
Received: from icp-osb-irony-out3.external.iinet.net.au
	(icp-osb-irony-out3.external.iinet.net.au [203.59.1.153]) by
	relay.mimecast.com with ESMTP id us-mta-149-UTGJE7gtNSa1icA2Vohz2g-1;
	Fri, 15 Jan 2021 21:43:05 -0500
X-MC-Unique: UTGJE7gtNSa1icA2Vohz2g-1
X-SMTP-MATCH: 1
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DNDACtUQJg/1enWttfAxwBAQEBAQE?=
	=?us-ascii?q?HAQESAQEEBAEBR4FIgXyBJVdihD+JBIYzghYDOE2DH4psi1GBXAsBAQEBAQE?=
	=?us-ascii?q?BAQEsCQECBAEBhEQEAgKBbiY4EwIQAQEBBQEBAQEBBgMBhlIMhXQBBSMELxA?=
	=?us-ascii?q?TEAsICAgcDgICVwYTG4JASwGCVQEBLhCvan8zhEABgQYTghcGgQ2BQ4E4hmY?=
	=?us-ascii?q?PAYY+NYFNP4ERNoIuNT6CXQICF4FnJoJRgmAEgj4GARQXBFwTGAkRBgJjLAE?=
	=?us-ascii?q?XAREOARcoPwiPI4NQiHqKb5ETLAeCeoEXBQuGUYE2hn6LOyKEWp4OhiIYmHm?=
	=?us-ascii?q?RNDkahj+BejMaH4IWGIEPCUcZDVaOcAEIAYJChEuGITAwAjUCBgoBAQMJWQE?=
	=?us-ascii?q?Big0sghoBAQ?=
X-IPAS-Result: =?us-ascii?q?A2DNDACtUQJg/1enWttfAxwBAQEBAQEHAQESAQEEBAEBR?=
	=?us-ascii?q?4FIgXyBJVdihD+JBIYzghYDOE2DH4psi1GBXAsBAQEBAQEBAQEsCQECBAEBh?=
	=?us-ascii?q?EQEAgKBbiY4EwIQAQEBBQEBAQEBBgMBhlIMhXQBBSMELxATEAsICAgcDgICV?=
	=?us-ascii?q?wYTG4JASwGCVQEBLhCvan8zhEABgQYTghcGgQ2BQ4E4hmYPAYY+NYFNP4ERN?=
	=?us-ascii?q?oIuNT6CXQICF4FnJoJRgmAEgj4GARQXBFwTGAkRBgJjLAEXAREOARcoPwiPI?=
	=?us-ascii?q?4NQiHqKb5ETLAeCeoEXBQuGUYE2hn6LOyKEWp4OhiIYmHmRNDkahj+BejMaH?=
	=?us-ascii?q?4IWGIEPCUcZDVaOcAEIAYJChEuGITAwAjUCBgoBAQMJWQEBig0sghoBAQ?=
X-IronPort-AV: E=Sophos;i="5.79,351,1602518400"; 
	d="scan'208,217";a="306393244"
Received: from 219-90-167-87.ip.adam.com.au (HELO swtf.swtf.dyndns.org)
	([219.90.167.87]) by icp-osb-irony-out3.iinet.net.au with ESMTP;
	16 Jan 2021 10:42:33 +0800
Message-ID: <bdcc07550a210ac539863ab182b6cc2dabf473e8.camel@iinet.net.au>
Subject: Re: Occasional delayed output of events
From: Burn Alting <burn.alting@iinet.net.au>
To: Richard Guy Briggs <rgb@redhat.com>
Date: Sat, 16 Jan 2021 13:42:23 +1100
In-Reply-To: <20210116003558.GK2015948@madcap2.tricolour.ca>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<5426593.DvuYhMxLoT@x2>
	<1340951117184f479e4f5dc75766fba91ed2c085.camel@iinet.net.au>
	<2756596.e9J7NaK4W3@x2>
	<8368b5c67757f2de8f664bc2eef5f5ca153a0c87.camel@iinet.net.au>
	<b54cbdc20be119eff5c33074df8bed671ae5571f.camel@iinet.net.au>
	<c42f4c5bb88a390e9bf36b026bee0d48a169cf9d.camel@iinet.net.au>
	<20210116003558.GK2015948@madcap2.tricolour.ca>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: Linux Audit <linux-audit@redhat.com>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: burn@swtf.dyndns.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============5281264501009348059=="

--===============5281264501009348059==
Content-Type: multipart/alternative; boundary="=-s+m+A4P5WzV/gY6hiofq"

--=-s+m+A4P5WzV/gY6hiofq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-01-15 at 19:35 -0500, Richard Guy Briggs wrote:
> On 2021-01-16 09:18, Burn Alting wrote:
> > On Sun, 2021-01-10 at 15:39 +1100, Burn Alting wrote:
> > > On Tue, 2021-01-05 at 07:12 +1100, Burn Alting wrote:
> > > > On Mon, 2021-01-04 at 09:46 -0500, Steve Grubb wrote:
> > > > > On Monday, January 4, 2021 2:55:25 AM EST Burn Alting wrote:
> > > > > > On Sun, 2021-01-03 at 10:41 -0500, Steve Grubb wrote:
> > > > > > > On Friday, January 1, 2021 4:22:33 PM EST Burn Alting wrote:
> > > > > > > > Sometimes, events recorded in /var/log/audit/audit.log
> > > > > > > > appearsomeseconds past co- located events which
> > > > > > > > resultsinauparse:au_check_events() marking  these events complete
> > > > > > > > beforetheyare. An example of this can be seen below with the
> > > > > > > > offending eventid44609.This has been plaguing me for a year or two
> > > > > > > > and this morning wasthefirst time I still had access to the raw
> > > > > > > > audit.log files (I monitor alotof event types and the log files roll
> > > > > > > > over fairly quickly).Theexample below is from a fully patched Centos
> > > > > > > > 7 but I have also seenthison a patched Fedora 32.Has this been seen
> > > > > > > > before? Do we need to re-evaluate howauparse'completes' an event (ie
> > > > > > > > 2 seconds is too quick).
> > > > > > > 
> > > > > > > I have never seen this. But on the way to disk, auditd only
> > > > > > > doeslightprocessing of the event.  If the format is enriched, it looks
> > > > > > > thingsupon a record by record basis. It does not collect events until
> > > > > > > theyarecomplete - it dumps it to disk as soon as it can tack on
> > > > > > > theextrainformation.So, the question would be, does this delay happen
> > > > > > > on the way to disk? Oristhis an artifact of post processing the logs
> > > > > > > with an auparse basedutility?Can this be observed repeatedly on the
> > > > > > > same raw logs? If so,then maybeauparse does have some issue. But if
> > > > > > > this is a postprocessing issue, thenthe wall clock doesn't matter
> > > > > > > because this eventshould have collected uptogether.I'd say this merits
> > > > > > > some investigation.
> > > > > > 
> > > > > > OK. I think this needs to be addressed on two fronts. There may
> > > > > > bemore.A.  Within post processing ... a 2 second timeout is not
> > > > > > sufficient.Iwould suggest we modify auparse.c:au_check_events() to i)
> > > > > > perform theeventtype checks first, then  ii) increase the timeout of 2
> > > > > > seconds to be alarger value based onempirical tests.
> > > > > 
> > > > > In the post processing, there are 2 use cases. The first is events that
> > > > > are ondisk. In this usage, the 2 second timeout does not come into effect
> > > > > becausethe events are run through probably within nanoseconds or
> > > > > microseconds at theworst. The only time it would come into effect is if
> > > > > the terminating record ismissing.
> > > > 
> > > > In this first case, the 2 second timeout is on the event's time, not
> > > > the'processing time'.  See ausearch-lol.c:check_events()
> > > > andauparse.c:au_get_ready_event().And I use the checkpointing code to avoid
> > > > the incomplete event issue.
> > > > In my case, I have not lost records, it's just that an event has arrived on
> > > > diskwith an event time more than 2 seconds after the previously written
> > > > event.Basically,a. The event was delayed getting to auditd and we look to
> > > > the kernel for asolution.b. The event arrived at a reasonable point in time
> > > > at auditd and for some reasonauditd delayed it's printing (by the way I tend
> > > > to use RAW log format, notenriched.
> > > > In either case, I believe ausearch-lol.c:check_events()
> > > > andauparse.c:au_get_ready_event() do need to be changed as we have complete
> > > > eventswritten by auditdwhich these two routines fail to process properly.
> > > Changing the two second timeout in ausearch-lol.c:check_events() and, one
> > > assumesin  auparse.c:au_get_ready_event() (but I have not tested the auparse
> > > code) fixesthe processing  of the delayed event.Changing the value to say 10
> > > seconds fixes my example use case, but given thekernel or auditd could emit an
> > > event with a larger delay, should this be aconfiguration item in
> > > /etc/audit/auditd.conf?
> > > I have raised both a bugzilla report (
> > > https://bugzilla.redhat.com/show_bug.cgi?id=1914603) and Issue (
> > > https://github.com/linux-audit/audit-userspace/issues/148)
> > > How do you want me to proceed ... a simple change to 10 seconds or a
> > > moreversatile configuration item in auditd.conf?I can perform either and issue
> > > a PR if so required.
> > 
> > What do people think ... I would point out this currently occurs in both audit-
> > 2.8.5-4.el7.x86_64 and audit-3.0-0.17.20191104git1c2f876.el8.x86_64 and a
> > justcompiled checkout of the audit-userspace code audit-3.0-1.fc33.x86_64.I have
> > found examples (under audit-3.0-0.17.20191104git1c2f876.el8.x86_64) that Ineed a
> > 15 second delay.I accept there may be an issue in the kernel but if it is not
> > simple (I only seethis occasionally), then we need a fix in the userspace. Since
> > I have found variedtimes required, do I go down the path of a big value OR a
> > configuration item in/etc/audit/auditd.conf?
> 
> Or we go back to userspace code looking for the EOE record?  Thisdoesn't help if
> they arrive out of order.  Do we number the records inthe kernel?  N of M...

I like the N of M concept but there would be a LOT of change - especially for all
the non-kernel event sources. The EOE would be the most seamless, but at a cost.My
preference is to allow the 2 second 'timer' to be configurable.
> > > > > The other use case is realtime processing as an audispd plugin. In this
> > > > > usecase the wall clock could matter because records could potentially get
> > > > > lostdue to overflows or another plugin taking too long. This is the use
> > > > > case wherethe wall clock matters. And again, it matters when records get
> > > > > lost or delayedin transit. As long as everything is flowing, it should not
> > > > > factor into eventprocessing.
> > > > > > B. I will build a temporary auditd daemon to perform some
> > > > > > empiricaltestingto see how long events can reside within the daemon. I
> > > > > > may needsomeadvice on this. I assume that the code that sets the
> > > > > > timestamp isinsrc/auditd.c:send_audit_event().
> > > > > 
> > > > > This is only for audit daemon's internal events. For all "real" events,
> > > > > it'sset in the kernel.
> > > > 
> > > > If that is the case and the kernel is establishing the timestamp, then
> > > > eitherthe kernel has delayed the eventsarrival at the daemon or the daemon
> > > > has delayedit's writing.
> > > > > > If so, I will see if I can put orchestration debug code in to
> > > > > > monitoranevent's 'time in daemon' until this point. I will then report
> > > > > > on this.I believe given that AUDIT_PROCTITLE and AUDIT_EOE is fairly
> > > > > > widespread,thenthe testing switch in A. will not be a big issue (time
> > > > > > cost wise). Itwillalso mean that if we over compensate the timeout that
> > > > > > would causeadditionalmemory cost in auparse() then this is mittigated.
> > > > > 
> > > > > I'd suggest breaking up the event completion tests so that an exact
> > > > > collectiontermination reason code could be associated to the event.
> > > > > > With respect to 'There may be more' fronts. Are there other points
> > > > > > inthe'audit ecosystem' that makes use of the '2 second timeout'.
> > > > > 
> > > > > Ausearch/report has its own special copy of the event collection logic.
> > > > > Itshould be nearly identical to what auparse does.
> > > > 
> > > > They appear identical  ... ausearch-lol.c:check_events()
> > > > andauparse.c:au_get_ready_event().
> > > > > > I will start work on this, this coming weekend if the above makes sense.
> > > > > 
> > > > > One other thought, the current shipping code is audit-3.0, doing a
> > > > > diffbetween it and audit-2.8.5 for the auparse directory does show
> > > > > somedifferences in event collection/grouping/next_event. A lot of the
> > > > > differencesare cosmetic to fix extra whitespace or indentation. But if you
> > > > > skip all that,there are some real changes that probably were because of
> > > > > bug reports. Forexample,
> > > > 
> > > > I will go through these, although this occurs on my Centos 7's (audit-2.8.5-
> > > > 4.el7.x86_64) as well as my 8's (audit-3.0-
> > > > 0.17.20191104git1c2f876.el8.x86_64).
> > > > > @@ -259,15 +260,6 @@ static event_list_t
> > > > > *au_get_ready_event(        if(lowest && lowest->status == EBS_COMPLETE)
> > > > > {                lowest->status =EBS_EMPTY;                au->au_ready
> > > > > --;-               // Try to consolidatethe array so that we
> > > > > iterate-               // over a smaller portion
> > > > > nexttime-               if (lowest == &lol->array[lol
> > > > > ->maxi]){-                       au_lolnode *ptr
> > > > > =lowest;-                       while (ptr->status == EBS_EMPTY && lol-
> > > > > >maxi >0) {-                               lol->maxi
> > > > > --;-                               ptr = &lol->array[lol
> > > > > ->maxi];-                       }-               }                returnlo
> > > > > west->l;        }and@@ -1536,6 +1550,13 @@ static
> > > > > intau_auparse_next_event(auparse                aup_list_create(l);       
> > > > >          aup_list_set_event(l, &e);                aup_list_append(l, au-
> > > > > >cur_buf,au->list_idx, au-
> > > > > > line_number);
> > > > > +               // Eat standalone EOE - main event was already
> > > > > markedcomplete+               if (l->head->type ==
> > > > > AUDIT_EOE){+                       au->cur_buf
> > > > > =NULL;+                       aup_list_clear(l);+                       fr
> > > > > ee(l);+                       continue;+               }                if
> > > > > (au_lol_append(au->au_lo, l) == NULL)
> > > > > {                        free((char*)e.host); #ifdef LOL_EVENTS_DEBUG01I
> > > > > don't know if those have an effect on what you are seeing. But that is
> > > > > theonly substantial changes that I can see.-Steve
> > > 
> > > Burn
> 
> - RGB
> --Richard Guy Briggs <rgb@redhat.com>Sr. S/W Engineer, Kernel Security, Base
> Operating SystemsRemote, Ottawa, Red Hat CanadaIRC: rgb, SunRaycerVoice:
> +1.647.777.2635, Internal: (81) 32635

--=-s+m+A4P5WzV/gY6hiofq
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Fri, 2021-01-15 at 19:35 -0500, Richard Guy Briggs wrote:</div>=
<blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729f=
cf solid;padding-left:1ex"><pre>On 2021-01-16 09:18, Burn Alting wrote:</pr=
e><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #72=
9fcf solid;padding-left:1ex"><pre>On Sun, 2021-01-10 at 15:39 +1100, Burn A=
lting wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bor=
der-left:2px #729fcf solid;padding-left:1ex"><pre>On Tue, 2021-01-05 at 07:=
12 +1100, Burn Alting wrote:</pre><blockquote type=3D"cite" style=3D"margin=
:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>On Mon, 2=
021-01-04 at 09:46 -0500, Steve Grubb wrote:</pre><blockquote type=3D"cite"=
 style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex=
"><pre>On Monday, January 4, 2021 2:55:25 AM EST Burn Alting wrote:</pre><b=
lockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf=
 solid;padding-left:1ex"><pre>On Sun, 2021-01-03 at 10:41 -0500, Steve Grub=
b wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-=
left:2px #729fcf solid;padding-left:1ex"><pre>On Friday, January 1, 2021 4:=
22:33 PM EST Burn Alting wrote:</pre><blockquote type=3D"cite" style=3D"mar=
gin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>Someti=
mes, events recorded in /var/log/audit/audit.log appear</pre><pre>somesecon=
ds past co- located events which results</pre><pre>inauparse:au_check_event=
s() marking  these events complete before</pre><pre>theyare. An example of =
this can be seen below with the offending event</pre><pre>id44609.</pre><pr=
e>This has been plaguing me for a year or two and this morning was</pre><pr=
e>thefirst time I still had access to the raw audit.log files (I monitor a<=
/pre><pre>lotof event types and the log files roll over fairly quickly).The=
</pre><pre>example below is from a fully patched Centos 7 but I have also s=
eenthis</pre><pre>on a patched Fedora 32.</pre><pre>Has this been seen befo=
re? Do we need to re-evaluate how</pre><pre>auparse'completes' an event (ie=
 2 seconds is too quick).</pre></blockquote><pre><br></pre><pre>I have neve=
r seen this. But on the way to disk, auditd only does</pre><pre>lightproces=
sing of the event.  If the format is enriched, it looks things</pre><pre>up=
on a record by record basis. It does not collect events until they</pre><pr=
e>arecomplete - it dumps it to disk as soon as it can tack on the</pre><pre=
>extrainformation.</pre><pre>So, the question would be, does this delay hap=
pen on the way to disk? Oris</pre><pre>this an artifact of post processing =
the logs with an auparse basedutility?</pre><pre>Can this be observed repea=
tedly on the same raw logs? If so,then maybe</pre><pre>auparse does have so=
me issue. But if this is a postprocessing issue, then</pre><pre>the wall cl=
ock doesn't matter because this eventshould have collected up</pre><pre>tog=
ether.</pre><pre>I'd say this merits some investigation.</pre></blockquote>=
<pre><br></pre><pre>OK. I think this needs to be addressed on two fronts. T=
here may be</pre><pre>more.A.  Within post processing ... a 2 second timeou=
t is not sufficient.</pre><pre>Iwould suggest we modify auparse.c:au_check_=
events() to i) perform theevent</pre><pre>type checks first, then  ii) incr=
ease the timeout of 2 seconds to be a</pre><pre>larger value based onempiri=
cal tests.</pre></blockquote><pre><br></pre><pre>In the post processing, th=
ere are 2 use cases. The first is events that are on</pre><pre>disk. In thi=
s usage, the 2 second timeout does not come into effect because</pre><pre>t=
he events are run through probably within nanoseconds or microseconds at th=
e</pre><pre>worst. The only time it would come into effect is if the termin=
ating record is</pre><pre>missing.</pre></blockquote><pre><br></pre><pre>In=
 this first case, the 2 second timeout is on the event's time, not the</pre=
><pre>'processing time'.  See ausearch-lol.c:check_events() and</pre><pre>a=
uparse.c:au_get_ready_event().</pre><pre>And I use the checkpointing code t=
o avoid the incomplete event issue.</pre><pre><br></pre><pre>In my case, I =
have not lost records, it's just that an event has arrived on disk</pre><pr=
e>with an event time more than 2 seconds after the previously written event=
.</pre><pre>Basically,</pre><pre>a. The event was delayed getting to auditd=
 and we look to the kernel for a</pre><pre>solution.</pre><pre>b. The event=
 arrived at a reasonable point in time at auditd and for some reason</pre><=
pre>auditd delayed it's printing (by the way I tend to use RAW log format, =
not</pre><pre>enriched.</pre><pre><br></pre><pre>In either case, I believe =
ausearch-lol.c:check_events() and</pre><pre>auparse.c:au_get_ready_event() =
do need to be changed as we have complete events</pre><pre>written by audit=
d</pre><pre>which these two routines fail to process properly.</pre><pre><b=
r></pre></blockquote><pre>Changing the two second timeout in ausearch-lol.c=
:check_events() and, one assumes</pre><pre>in  auparse.c:au_get_ready_event=
() (but I have not tested the auparse code) fixes</pre><pre>the processing =
 of the delayed event.</pre><pre>Changing the value to say 10 seconds fixes=
 my example use case, but given the</pre><pre>kernel or auditd could emit a=
n event with a larger delay, should this be a</pre><pre>configuration item =
in /etc/audit/auditd.conf?</pre><pre><br></pre><pre>I have raised both a bu=
gzilla report (</pre><a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=
=3D1914603"><pre>https://bugzilla.redhat.com/show_bug.cgi?id=3D1914603</pre=
></a><pre>) and Issue (</pre><a href=3D"https://github.com/linux-audit/audi=
t-userspace/issues/148"><pre>https://github.com/linux-audit/audit-userspace=
/issues/148</pre></a><pre>)</pre><pre><br></pre><pre>How do you want me to =
proceed ... a simple change to 10 seconds or a more</pre><pre>versatile con=
figuration item in auditd.conf?</pre><pre>I can perform either and issue a =
PR if so required.</pre></blockquote><pre><br></pre><pre>What do people thi=
nk ... I would point out this currently occurs in both audit-</pre><pre>2.8=
.5-4.el7.x86_64 and audit-3.0-0.17.20191104git1c2f876.el8.x86_64 and a just=
</pre><pre>compiled checkout of the audit-userspace code audit-3.0-1.fc33.x=
86_64.</pre><pre>I have found examples (under audit-3.0-0.17.20191104git1c2=
f876.el8.x86_64) that I</pre><pre>need a 15 second delay.</pre><pre>I accep=
t there may be an issue in the kernel but if it is not simple (I only see</=
pre><pre>this occasionally), then we need a fix in the userspace. Since I h=
ave found varied</pre><pre>times required, do I go down the path of a big v=
alue OR a configuration item in</pre><pre>/etc/audit/auditd.conf?</pre></bl=
ockquote><pre><br></pre><pre>Or we go back to userspace code looking for th=
e EOE record?  This</pre><pre>doesn't help if they arrive out of order.  Do=
 we number the records in</pre><pre>the kernel?  N of M...</pre></blockquot=
e><div><br></div><div>I like the N of M concept but there would be a LOT of=
 change - especially for all the non-kernel event sources. The EOE would be=
 the most seamless, but at a cost.</div><div>My preference is to allow the =
2 second 'timer' to be configurable.</div><div><br></div><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><pre><br></pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .=
8ex; border-left:2px #729fcf solid;padding-left:1ex"><blockquote type=3D"ci=
te" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:=
1ex"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px =
#729fcf solid;padding-left:1ex"><blockquote type=3D"cite" style=3D"margin:0=
 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>The other u=
se case is realtime processing as an audispd plugin. In this use</pre><pre>=
case the wall clock could matter because records could potentially get lost=
</pre><pre>due to overflows or another plugin taking too long. This is the =
use case where</pre><pre>the wall clock matters. And again, it matters when=
 records get lost or delayed</pre><pre>in transit. As long as everything is=
 flowing, it should not factor into event</pre><pre>processing.</pre><block=
quote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf sol=
id;padding-left:1ex"><pre>B. I will build a temporary auditd daemon to perf=
orm some empirical</pre><pre>testingto see how long events can reside withi=
n the daemon. I may need</pre><pre>someadvice on this. I assume that the co=
de that sets the timestamp is</pre><pre>insrc/auditd.c:send_audit_event().<=
/pre></blockquote><pre><br></pre><pre>This is only for audit daemon's inter=
nal events. For all "real" events, it's</pre><pre>set in the kernel.</pre><=
/blockquote><pre><br></pre><pre>If that is the case and the kernel is estab=
lishing the timestamp, then either</pre><pre>the kernel has delayed the eve=
ntsarrival at the daemon or the daemon has delayed</pre><pre>it's writing.<=
/pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px =
#729fcf solid;padding-left:1ex"><blockquote type=3D"cite" style=3D"margin:0=
 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>If so, I wi=
ll see if I can put orchestration debug code in to monitor</pre><pre>aneven=
t's 'time in daemon' until this point. I will then report on this.</pre><pr=
e>I believe given that AUDIT_PROCTITLE and AUDIT_EOE is fairly widespread,t=
hen</pre><pre>the testing switch in A. will not be a big issue (time cost w=
ise). Itwill</pre><pre>also mean that if we over compensate the timeout tha=
t would causeadditional</pre><pre>memory cost in auparse() then this is mit=
tigated.</pre></blockquote><pre><br></pre><pre>I'd suggest breaking up the =
event completion tests so that an exact collection</pre><pre>termination re=
ason code could be associated to the event.</pre><blockquote type=3D"cite" =
style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"=
><pre>With respect to 'There may be more' fronts. Are there other points in=
</pre><pre>the'audit ecosystem' that makes use of the '2 second timeout'.</=
pre></blockquote><pre><br></pre><pre>Ausearch/report has its own special co=
py of the event collection logic. It</pre><pre>should be nearly identical t=
o what auparse does.</pre></blockquote><pre><br></pre><pre>They appear iden=
tical  ... ausearch-lol.c:check_events() and</pre><pre>auparse.c:au_get_rea=
dy_event().</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bord=
er-left:2px #729fcf solid;padding-left:1ex"><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre=
>I will start work on this, this coming weekend if the above makes sense.</=
pre></blockquote><pre><br></pre><pre>One other thought, the current shippin=
g code is audit-3.0, doing a diff</pre><pre>between it and audit-2.8.5 for =
the auparse directory does show some</pre><pre>differences in event collect=
ion/grouping/next_event. A lot of the differences</pre><pre>are cosmetic to=
 fix extra whitespace or indentation. But if you skip all that,</pre><pre>t=
here are some real changes that probably were because of bug reports. For</=
pre><pre>example,</pre></blockquote><pre><br></pre><pre>I will go through t=
hese, although this occurs on my Centos 7's (audit-2.8.5-</pre><pre>4.el7.x=
86_64) as well as my 8's (audit-3.0-0.17.20191104git1c2f876.el8.x86_64).</p=
re><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #7=
29fcf solid;padding-left:1ex"><pre>@@ -259,15 +260,6 @@ static event_list_t=
 *au_get_ready_event(        if</pre><pre>(lowest &amp;&amp; lowest-&gt;sta=
tus =3D=3D EBS_COMPLETE) {                lowest-&gt;status =3D</pre><pre>E=
BS_EMPTY;                au-&gt;au_ready--;-               // Try to consol=
idate</pre><pre>the array so that we iterate-               // over a small=
er portion next</pre><pre>time-               if (lowest =3D=3D &amp;lol-&g=
t;array[lol-&gt;maxi])</pre><pre>{-                       au_lolnode *ptr =
=3D</pre><pre>lowest;-                       while (ptr-&gt;status =3D=3D E=
BS_EMPTY &amp;&amp; lol-&gt;maxi &gt;</pre><pre>0) {-                      =
         lol-&gt;maxi</pre><pre>--;-                               ptr =3D =
&amp;lol-&gt;array[lol</pre><pre>-&gt;maxi];-                       }-     =
          }                return</pre><pre>lowest-&gt;l;        }</pre><pr=
e>and</pre><pre>@@ -1536,6 +1550,13 @@ static int</pre><pre>au_auparse_next=
_event(auparse                aup_list_create(l);              </pre><pre> =
 aup_list_set_event(l, &amp;e);                aup_list_append(l, au-&gt;cu=
r_buf,</pre><pre>au-&gt;list_idx, au-</pre><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre=
>line_number);</pre></blockquote><pre>+               // Eat standalone EOE=
 - main event was already marked</pre><pre>complete+               if (l-&g=
t;head-&gt;type =3D=3D AUDIT_EOE)</pre><pre>{+                       au-&gt=
;cur_buf =3D</pre><pre>NULL;+                       aup_list_clear(l);+    =
                   free(l)</pre><pre>;+                       continue;+   =
            }                if</pre><pre>(au_lol_append(au-&gt;au_lo, l) =
=3D=3D NULL) {                        free((char</pre><pre>*)e.host); #ifde=
f LOL_EVENTS_DEBUG01</pre><pre>I don't know if those have an effect on what=
 you are seeing. But that is the</pre><pre>only substantial changes that I =
can see.</pre><pre>-Steve</pre></blockquote></blockquote><pre><br></pre><pr=
e>Burn</pre></blockquote></blockquote><pre><br></pre><pre>- RGB</pre><pre><=
br></pre><pre>--</pre><pre>Richard Guy Briggs &lt;</pre><a href=3D"mailto:r=
gb@redhat.com"><pre>rgb@redhat.com</pre></a><pre>&gt;</pre><pre>Sr. S/W Eng=
ineer, Kernel Security, Base Operating Systems</pre><pre>Remote, Ottawa, Re=
d Hat Canada</pre><pre>IRC: rgb, SunRaycer</pre><pre>Voice: +1.647.777.2635=
, Internal: (81) 32635</pre><pre><br></pre></blockquote></body></html>

--=-s+m+A4P5WzV/gY6hiofq--

--===============5281264501009348059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============5281264501009348059==--


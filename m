Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 265982F884D
	for <lists+linux-audit@lfdr.de>; Fri, 15 Jan 2021 23:19:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-eqQm6LL4OHeN1Fl6OJDgnA-1; Fri, 15 Jan 2021 17:19:16 -0500
X-MC-Unique: eqQm6LL4OHeN1Fl6OJDgnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08261107ACF7;
	Fri, 15 Jan 2021 22:19:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89445707B6;
	Fri, 15 Jan 2021 22:19:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84B6C4A7C6;
	Fri, 15 Jan 2021 22:19:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10FMIqg5005334 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 15 Jan 2021 17:18:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CC4502026D25; Fri, 15 Jan 2021 22:18:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5E552026D47
	for <linux-audit@redhat.com>; Fri, 15 Jan 2021 22:18:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F34D6185A794
	for <linux-audit@redhat.com>; Fri, 15 Jan 2021 22:18:49 +0000 (UTC)
Received: from icp-osb-irony-out8.external.iinet.net.au
	(icp-osb-irony-out8.external.iinet.net.au [203.59.1.225]) by
	relay.mimecast.com with ESMTP id us-mta-257-fgOctGT1PZWVSEZurgDc6Q-1;
	Fri, 15 Jan 2021 17:18:46 -0500
X-MC-Unique: fgOctGT1PZWVSEZurgDc6Q-1
X-SMTP-MATCH: 1
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CjCABjEwJg/1enWttiHAEBAQEBAQc?=
	=?us-ascii?q?BARIBAQQEAQFHgUiBfIElV2KEP4kEhjIBghYDOE2DH4psi1GBTAMNCwEBAQE?=
	=?us-ascii?q?BAQEBASEBCgkBAgQBAYREBAICgW4mOBMCEAEBAQUBAQEBAQYDAYZSDIVzAQE?=
	=?us-ascii?q?BAQIBAQEhBC8YGwsIBgIIHA4CAicwBgESG4JASwGCVQEBDx8Qrm12fzOEQAG?=
	=?us-ascii?q?BBhOCEQaBDYE9BoE4hnUBgkyDcjWBTT+BETaCLjU+gl0BAQIXhF6CYASBVAZ?=
	=?us-ascii?q?kBgEUFwRcExgJEQYCOVYBFwERDgEXb48jg1CIeopvkRMsB4J6gRcFC4ZRgTa?=
	=?us-ascii?q?SOSKiaIYiGI1fixqRNDkahj+BejMaH1SBQhiBD1AZDVaOcAEIAYJCilcVMDA?=
	=?us-ascii?q?CNQIGCgEBAwlZAQGJeyyCGgEB?=
X-IPAS-Result: =?us-ascii?q?A2CjCABjEwJg/1enWttiHAEBAQEBAQcBARIBAQQEAQFHg?=
	=?us-ascii?q?UiBfIElV2KEP4kEhjIBghYDOE2DH4psi1GBTAMNCwEBAQEBAQEBASEBCgkBA?=
	=?us-ascii?q?gQBAYREBAICgW4mOBMCEAEBAQUBAQEBAQYDAYZSDIVzAQEBAQIBAQEhBC8YG?=
	=?us-ascii?q?wsIBgIIHA4CAicwBgESG4JASwGCVQEBDx8Qrm12fzOEQAGBBhOCEQaBDYE9B?=
	=?us-ascii?q?oE4hnUBgkyDcjWBTT+BETaCLjU+gl0BAQIXhF6CYASBVAZkBgEUFwRcExgJE?=
	=?us-ascii?q?QYCOVYBFwERDgEXb48jg1CIeopvkRMsB4J6gRcFC4ZRgTaSOSKiaIYiGI1fi?=
	=?us-ascii?q?xqRNDkahj+BejMaH1SBQhiBD1AZDVaOcAEIAYJCilcVMDACNQIGCgEBAwlZA?=
	=?us-ascii?q?QGJeyyCGgEB?=
X-IronPort-AV: E=Sophos;i="5.79,350,1602518400"; 
	d="scan'208,217";a="343701849"
Received: from 219-90-167-87.ip.adam.com.au (HELO swtf.swtf.dyndns.org)
	([219.90.167.87]) by icp-osb-irony-out8.iinet.net.au with ESMTP;
	16 Jan 2021 06:18:36 +0800
Message-ID: <c42f4c5bb88a390e9bf36b026bee0d48a169cf9d.camel@iinet.net.au>
Subject: Re: Occasional delayed output of events
From: Burn Alting <burn.alting@iinet.net.au>
To: Steve Grubb <sgrubb@redhat.com>, Linux Audit <linux-audit@redhat.com>
Date: Sat, 16 Jan 2021 09:18:35 +1100
In-Reply-To: <b54cbdc20be119eff5c33074df8bed671ae5571f.camel@iinet.net.au>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<5426593.DvuYhMxLoT@x2>
	<1340951117184f479e4f5dc75766fba91ed2c085.camel@iinet.net.au>
	<2756596.e9J7NaK4W3@x2>
	<8368b5c67757f2de8f664bc2eef5f5ca153a0c87.camel@iinet.net.au>
	<b54cbdc20be119eff5c33074df8bed671ae5571f.camel@iinet.net.au>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============7279972573250251059=="

--===============7279972573250251059==
Content-Type: multipart/alternative; boundary="=-PoGI7bJsnXtzgg9hwSrB"

--=-PoGI7bJsnXtzgg9hwSrB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-01-10 at 15:39 +1100, Burn Alting wrote:
> On Tue, 2021-01-05 at 07:12 +1100, Burn Alting wrote:
> > On Mon, 2021-01-04 at 09:46 -0500, Steve Grubb wrote:
> > > On Monday, January 4, 2021 2:55:25 AM EST Burn Alting wrote:
> > > > On Sun, 2021-01-03 at 10:41 -0500, Steve Grubb wrote:
> > > > > On Friday, January 1, 2021 4:22:33 PM EST Burn Alting wrote:
> > > > > > Sometimes, events recorded in /var/log/audit/audit.log appear
> > > > > > someseconds past co- located events which results
> > > > > > inauparse:au_check_events() marking  these events complete before
> > > > > > theyare. An example of this can be seen below with the offending event
> > > > > > id44609.
> > > > > > This has been plaguing me for a year or two and this morning was
> > > > > > thefirst time I still had access to the raw audit.log files (I monitor a
> > > > > > lotof event types and the log files roll over fairly quickly).The
> > > > > > example below is from a fully patched Centos 7 but I have also seenthis
> > > > > > on a patched Fedora 32.
> > > > > > Has this been seen before? Do we need to re-evaluate how
> > > > > > auparse'completes' an event (ie 2 seconds is too quick).
> > > > > 
> > > > > I have never seen this. But on the way to disk, auditd only does
> > > > > lightprocessing of the event.  If the format is enriched, it looks things
> > > > > upon a record by record basis. It does not collect events until they
> > > > > arecomplete - it dumps it to disk as soon as it can tack on the
> > > > > extrainformation.
> > > > > So, the question would be, does this delay happen on the way to disk? Oris
> > > > > this an artifact of post processing the logs with an auparse basedutility?
> > > > > Can this be observed repeatedly on the same raw logs? If so,then maybe
> > > > > auparse does have some issue. But if this is a postprocessing issue, then
> > > > > the wall clock doesn't matter because this eventshould have collected up
> > > > > together.
> > > > > I'd say this merits some investigation.
> > > > 
> > > > OK. I think this needs to be addressed on two fronts. There may be
> > > > more.A.  Within post processing ... a 2 second timeout is not sufficient.
> > > > Iwould suggest we modify auparse.c:au_check_events() to i) perform theevent
> > > > type checks first, then  ii) increase the timeout of 2 seconds to be a
> > > > larger value based onempirical tests.
> > > 
> > > In the post processing, there are 2 use cases. The first is events that are on
> > > disk. In this usage, the 2 second timeout does not come into effect because
> > > the events are run through probably within nanoseconds or microseconds at the
> > > worst. The only time it would come into effect is if the terminating record is
> > > missing.
> > 
> > In this first case, the 2 second timeout is on the event's time, not the
> > 'processing time'.  See ausearch-lol.c:check_events() and
> > auparse.c:au_get_ready_event().
> > And I use the checkpointing code to avoid the incomplete event issue.
> > 
> > In my case, I have not lost records, it's just that an event has arrived on disk
> > with an event time more than 2 seconds after the previously written event.
> > Basically,
> > a. The event was delayed getting to auditd and we look to the kernel for a
> > solution.
> > b. The event arrived at a reasonable point in time at auditd and for some reason
> > auditd delayed it's printing (by the way I tend to use RAW log format, not
> > enriched.
> > 
> > In either case, I believe ausearch-lol.c:check_events() and
> > auparse.c:au_get_ready_event() do need to be changed as we have complete events
> > written by auditd
> > which these two routines fail to process properly.
> > 
> Changing the two second timeout in ausearch-lol.c:check_events() and, one assumes
> in  auparse.c:au_get_ready_event() (but I have not tested the auparse code) fixes
> the processing  of the delayed event.
> Changing the value to say 10 seconds fixes my example use case, but given the
> kernel or auditd could emit an event with a larger delay, should this be a
> configuration item in /etc/audit/auditd.conf?
> 
> I have raised both a bugzilla report (
> https://bugzilla.redhat.com/show_bug.cgi?id=1914603) and Issue (
> https://github.com/linux-audit/audit-userspace/issues/148)
> 
> How do you want me to proceed ... a simple change to 10 seconds or a more
> versatile configuration item in auditd.conf?
> I can perform either and issue a PR if so required.

What do people think ... I would point out this currently occurs in both audit-
2.8.5-4.el7.x86_64 and audit-3.0-0.17.20191104git1c2f876.el8.x86_64 and a just
compiled checkout of the audit-userspace code audit-3.0-1.fc33.x86_64.
I have found examples (under audit-3.0-0.17.20191104git1c2f876.el8.x86_64) that I
need a 15 second delay.
I accept there may be an issue in the kernel but if it is not simple (I only see
this occasionally), then we need a fix in the userspace. Since I have found varied
times required, do I go down the path of a big value OR a configuration item in
/etc/audit/auditd.conf?
>  
> > > The other use case is realtime processing as an audispd plugin. In this use
> > > case the wall clock could matter because records could potentially get lost
> > > due to overflows or another plugin taking too long. This is the use case where
> > > the wall clock matters. And again, it matters when records get lost or delayed
> > > in transit. As long as everything is flowing, it should not factor into event
> > > processing.
> > > > B. I will build a temporary auditd daemon to perform some empirical
> > > > testingto see how long events can reside within the daemon. I may need
> > > > someadvice on this. I assume that the code that sets the timestamp is
> > > > insrc/auditd.c:send_audit_event().
> > > 
> > > This is only for audit daemon's internal events. For all "real" events, it's
> > > set in the kernel.
> > 
> > If that is the case and the kernel is establishing the timestamp, then either
> > the kernel has delayed the eventsarrival at the daemon or the daemon has delayed
> > it's writing.
> > > > If so, I will see if I can put orchestration debug code in to monitor
> > > > anevent's 'time in daemon' until this point. I will then report on this.
> > > > I believe given that AUDIT_PROCTITLE and AUDIT_EOE is fairly widespread,then
> > > > the testing switch in A. will not be a big issue (time cost wise). Itwill
> > > > also mean that if we over compensate the timeout that would causeadditional
> > > > memory cost in auparse() then this is mittigated.
> > > 
> > > I'd suggest breaking up the event completion tests so that an exact collection
> > > termination reason code could be associated to the event.
> > > > With respect to 'There may be more' fronts. Are there other points in
> > > > the'audit ecosystem' that makes use of the '2 second timeout'.
> > > 
> > > Ausearch/report has its own special copy of the event collection logic. It
> > > should be nearly identical to what auparse does.
> > 
> > They appear identical  ... ausearch-lol.c:check_events() and
> > auparse.c:au_get_ready_event().
> > > > I will start work on this, this coming weekend if the above makes sense.
> > > 
> > > One other thought, the current shipping code is audit-3.0, doing a diff
> > > between it and audit-2.8.5 for the auparse directory does show some
> > > differences in event collection/grouping/next_event. A lot of the differences
> > > are cosmetic to fix extra whitespace or indentation. But if you skip all that,
> > > there are some real changes that probably were because of bug reports. For
> > > example,
> > 
> > I will go through these, although this occurs on my Centos 7's (audit-2.8.5-
> > 4.el7.x86_64) as well as my 8's (audit-3.0-0.17.20191104git1c2f876.el8.x86_64).
> > > @@ -259,15 +260,6 @@ static event_list_t *au_get_ready_event(        if
> > > (lowest && lowest->status == EBS_COMPLETE) {                lowest->status =
> > > EBS_EMPTY;                au->au_ready--;-               // Try to consolidate
> > > the array so that we iterate-               // over a smaller portion next
> > > time-               if (lowest == &lol->array[lol->maxi])
> > > {-                       au_lolnode *ptr =
> > > lowest;-                       while (ptr->status == EBS_EMPTY && lol->maxi >
> > > 0) {-                               lol->maxi
> > > --;-                               ptr = &lol->array[lol
> > > ->maxi];-                       }-               }                return
> > > lowest->l;        }
> > > and
> > > @@ -1536,6 +1550,13 @@ static int
> > > au_auparse_next_event(auparse                aup_list_create(l);              
> > >   aup_list_set_event(l, &e);                aup_list_append(l, au->cur_buf,
> > > au->list_idx, au-
> > > > line_number);
> > > +               // Eat standalone EOE - main event was already marked
> > > complete+               if (l->head->type == AUDIT_EOE)
> > > {+                       au->cur_buf =
> > > NULL;+                       aup_list_clear(l);+                       free(l)
> > > ;+                       continue;+               }                if
> > > (au_lol_append(au->au_lo, l) == NULL) {                        free((char
> > > *)e.host); #ifdef LOL_EVENTS_DEBUG01
> > > I don't know if those have an effect on what you are seeing. But that is the
> > > only substantial changes that I can see.
> > > -Steve
> 
> Burn
> 
> --Linux-audit mailing listLinux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit

--=-PoGI7bJsnXtzgg9hwSrB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Sun, 2021-01-10 at 15:39 +1100, Burn Alting wrote:</div><blockq=
uote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf soli=
d;padding-left:1ex"><div>On Tue, 2021-01-05 at 07:12 +1100, Burn Alting wro=
te:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:=
2px #729fcf solid;padding-left:1ex"><div>On Mon, 2021-01-04 at 09:46 -0500,=
 Steve Grubb wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8=
ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>On Monday, January=
 4, 2021 2:55:25 AM EST Burn Alting wrote:</pre><blockquote type=3D"cite" s=
tyle=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">=
<pre>On Sun, 2021-01-03 at 10:41 -0500, Steve Grubb wrote:</pre><blockquote=
 type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;pa=
dding-left:1ex"><pre>On Friday, January 1, 2021 4:22:33 PM EST Burn Alting =
wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-le=
ft:2px #729fcf solid;padding-left:1ex"><pre>Sometimes, events recorded in /=
var/log/audit/audit.log appear some</pre><pre>seconds past co- located even=
ts which results in</pre><pre>auparse:au_check_events() marking  these even=
ts complete before they</pre><pre>are. An example of this can be seen below=
 with the offending event id</pre><pre>44609.</pre><br><pre>This has been p=
laguing me for a year or two and this morning was the</pre><pre>first time =
I still had access to the raw audit.log files (I monitor a lot</pre><pre>of=
 event types and the log files roll over fairly quickly).</pre><pre>The exa=
mple below is from a fully patched Centos 7 but I have also seen</pre><pre>=
this on a patched Fedora 32.</pre><br><pre>Has this been seen before? Do we=
 need to re-evaluate how auparse</pre><pre>'completes' an event (ie 2 secon=
ds is too quick).</pre></blockquote><br><pre>I have never seen this. But on=
 the way to disk, auditd only does light</pre><pre>processing of the event.=
  If the format is enriched, it looks things up</pre><pre>on a record by re=
cord basis. It does not collect events until they are</pre><pre>complete - =
it dumps it to disk as soon as it can tack on the extra</pre><pre>informati=
on.</pre><br><pre>So, the question would be, does this delay happen on the =
way to disk? Or</pre><pre>is this an artifact of post processing the logs w=
ith an auparse based</pre><pre>utility? Can this be observed repeatedly on =
the same raw logs? If so,</pre><pre>then maybe auparse does have some issue=
. But if this is a post</pre><pre>processing issue, then the wall clock doe=
sn't matter because this event</pre><pre>should have collected up together.=
</pre><br><pre>I'd say this merits some investigation.</pre></blockquote><b=
r><pre>OK. I think this needs to be addressed on two fronts. There may be m=
ore.</pre><pre>A.  Within post processing ... a 2 second timeout is not suf=
ficient. I</pre><pre>would suggest we modify auparse.c:au_check_events() to=
 i) perform the</pre><pre>event type checks first, then</pre><pre>  ii) inc=
rease the timeout of 2 seconds to be a larger value based on</pre><pre>empi=
rical tests.</pre></blockquote><br><pre>In the post processing, there are 2=
 use cases. The first is events that are on </pre><pre>disk. In this usage,=
 the 2 second timeout does not come into effect because </pre><pre>the even=
ts are run through probably within nanoseconds or microseconds at the </pre=
><pre>worst. The only time it would come into effect is if the terminating =
record </pre><pre>is missing.</pre></blockquote><div><br></div><div>In this=
 first case, the 2 second timeout is on the event's time, not the 'processi=
ng time'.  See ausearch-lol.c:check_events() and auparse.c:au_get_ready_eve=
nt().</div><div>And I use the checkpointing code to avoid the incomplete ev=
ent issue.</div><div><br></div><div>In my case, I have not lost records, it=
's just that an event has arrived on disk with an event time more than 2 se=
conds after the previously written event.</div><div>Basically,</div><div>a.=
 The event was delayed getting to auditd and we look to the kernel for a so=
lution.</div><div>b. The event arrived at a reasonable point in time at aud=
itd and for some reason auditd delayed it's printing (by the way I tend to =
use RAW log format, not enriched.</div><div><br></div><div>In either case, =
I believe ausearch-lol.c:check_events() and auparse.c:au_get_ready_event() =
do need to be changed as we have complete events written by auditd</div><di=
v>which these two routines fail to process properly.</div><div><br></div></=
blockquote><div>Changing the two second timeout in ausearch-lol.c:check_eve=
nts() and, one assumes in  auparse.c:au_get_ready_event() (but I have not t=
ested the auparse code) fixes the processing  of the delayed event.</div><d=
iv>Changing the value to say 10 seconds fixes my example use case, but give=
n the kernel or auditd could emit an event with a larger delay, should this=
 be a configuration item in /etc/audit/auditd.conf?</div><div><br></div><di=
v>I have raised both a bugzilla report (<a href=3D"https://bugzilla.redhat.=
com/show_bug.cgi?id=3D1914603">https://bugzilla.redhat.com/show_bug.cgi?id=
=3D1914603</a>) and Issue (<a href=3D"https://github.com/linux-audit/audit-=
userspace/issues/148">https://github.com/linux-audit/audit-userspace/issues=
/148</a>)</div><div><br></div><div>How do you want me to proceed ... a simp=
le change to 10 seconds or a more versatile configuration item in auditd.co=
nf?</div><div>I can perform either and issue a PR if so required.</div></bl=
ockquote><div><br></div><div>What do people think ... I would point out thi=
s currently occurs in both audit-2.8.5-4.el7.x86_64 and audit-3.0-0.17.2019=
1104git1c2f876.el8.x86_64 and a just compiled checkout of the audit-userspa=
ce code audit-3.0-1.fc33.x86_64.</div><div><br></div><div>I have found exam=
ples (under audit-3.0-0.17.20191104git1c2f876.el8.x86_64) that I need a 15 =
second delay.</div><div><br></div><div>I accept there may be an issue in th=
e kernel but if it is not simple (I only see this occasionally), then we ne=
ed a fix in the userspace. Since I have found varied times required, do I g=
o down the path of a big value OR a configuration item in /etc/audit/auditd=
.conf?</div><div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 =
.8ex; border-left:2px #729fcf solid;padding-left:1ex"><div> </div><blockquo=
te type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;=
padding-left:1ex"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bor=
der-left:2px #729fcf solid;padding-left:1ex"><br><pre>The other use case is=
 realtime processing as an audispd plugin. In this use </pre><pre>case the =
wall clock could matter because records could potentially get lost </pre><p=
re>due to overflows or another plugin taking too long. This is the use case=
 where </pre><pre>the wall clock matters. And again, it matters when record=
s get lost or </pre><pre>delayed in transit. As long as everything is flowi=
ng, it should not factor </pre><pre>into event processing.</pre><br><blockq=
uote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf soli=
d;padding-left:1ex"><pre>B. I will build a temporary auditd daemon to perfo=
rm some empirical testing</pre><pre>to see how long events can reside withi=
n the daemon. I may need some</pre><pre>advice on this. I assume that the c=
ode that sets the timestamp is in</pre><pre>src/auditd.c:send_audit_event()=
.</pre></blockquote><br><pre>This is only for audit daemon's internal event=
s. For all "real" events, it's </pre><pre>set in the kernel.</pre></blockqu=
ote><div><br></div><div>If that is the case and the kernel is establishing =
the timestamp, then either the kernel has delayed the events</div><div>arri=
val at the daemon or the daemon has delayed it's writing.</div><div><br></d=
iv><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #7=
29fcf solid;padding-left:1ex"><br><blockquote type=3D"cite" style=3D"margin=
:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>If so, I =
will see if I can put orchestration debug code in to monitor an</pre><pre>e=
vent's 'time in daemon' until this point. I will then report on this.</pre>=
<br><pre>I believe given that AUDIT_PROCTITLE and AUDIT_EOE is fairly wides=
pread,</pre><pre>then the testing switch in A. will not be a big issue (tim=
e cost wise). It</pre><pre>will also mean that if we over compensate the ti=
meout that would cause</pre><pre>additional memory cost in auparse() then t=
his is mittigated.</pre></blockquote><br><pre>I'd suggest breaking up the e=
vent completion tests so that an exact </pre><pre>collection termination re=
ason code could be associated to the event.</pre><br><blockquote type=3D"ci=
te" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:=
1ex"><pre>With respect to 'There may be more' fronts. Are there other point=
s in the</pre><pre>'audit ecosystem' that makes use of the '2 second timeou=
t'.</pre></blockquote><br><pre>Ausearch/report has its own special copy of =
the event collection logic. It </pre><pre>should be nearly identical to wha=
t auparse does.</pre></blockquote><div><br></div><div>They appear identical=
  ... ausearch-lol.c:check_events() and auparse.c:au_get_ready_event().</di=
v><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #72=
9fcf solid;padding-left:1ex"><br><blockquote type=3D"cite" style=3D"margin:=
0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>I will sta=
rt work on this, this coming weekend if the above makes sense.</pre></block=
quote><br><pre>One other thought, the current shipping code is audit-3.0, d=
oing a diff </pre><pre>between it and audit-2.8.5 for the auparse directory=
 does show some </pre><pre>differences in event collection/grouping/next_ev=
ent. A lot of the differences </pre><pre>are cosmetic to fix extra whitespa=
ce or indentation. But if you skip all that, </pre><pre>there are some real=
 changes that probably were because of bug reports. For </pre><pre>example,=
</pre></blockquote><br><pre>I will go through these, although this occurs o=
n my Centos 7's (audit-2.8.5-4.el7.x86_64) as well as my 8's (audit-3.0-0.1=
7.20191104git1c2f876.el8.x86_64).</pre><br><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><br>=
<pre>@@ -259,15 +260,6 @@ static event_list_t *au_get_ready_event(</pre><pr=
e>        if (lowest &amp;&amp; lowest-&gt;status =3D=3D EBS_COMPLETE) {</p=
re><pre>                lowest-&gt;status =3D EBS_EMPTY;</pre><pre>        =
        au-&gt;au_ready--;</pre><pre>-               // Try to consolidate =
the array so that we iterate</pre><pre>-               // over a smaller po=
rtion next time</pre><pre>-               if (lowest =3D=3D &amp;lol-&gt;ar=
ray[lol-&gt;maxi]) {</pre><pre>-                       au_lolnode *ptr =3D =
lowest;</pre><pre>-                       while (ptr-&gt;status =3D=3D EBS_=
EMPTY &amp;&amp; lol-&gt;maxi &gt; 0) {</pre><pre>-                        =
       lol-&gt;maxi--;</pre><pre>-                               ptr =3D &a=
mp;lol-&gt;array[lol-&gt;maxi];</pre><pre>-                       }</pre><p=
re>-               }</pre><pre>                return lowest-&gt;l;</pre><p=
re>        }</pre><br><pre>and</pre><br><pre>@@ -1536,6 +1550,13 @@ static =
int au_auparse_next_event(auparse</pre><pre>                aup_list_create=
(l);</pre><pre>                aup_list_set_event(l, &amp;e);</pre><pre>   =
             aup_list_append(l, au-&gt;cur_buf, au-&gt;list_idx, au-</pre><=
blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fc=
f solid;padding-left:1ex"><pre>line_number);</pre></blockquote><pre>+      =
         // Eat standalone EOE - main event was already marked </pre><pre>c=
omplete</pre><pre>+               if (l-&gt;head-&gt;type =3D=3D AUDIT_EOE)=
 {</pre><pre>+                       au-&gt;cur_buf =3D NULL;</pre><pre>+  =
                     aup_list_clear(l);</pre><pre>+                       f=
ree(l);</pre><pre>+                       continue;</pre><pre>+            =
   }</pre><pre>                if (au_lol_append(au-&gt;au_lo, l) =3D=3D NU=
LL) {</pre><pre>                        free((char *)e.host);</pre><pre> #i=
fdef LOL_EVENTS_DEBUG01</pre><br><pre>I don't know if those have an effect =
on what you are seeing. But that is the </pre><pre>only substantial changes=
 that I can see.</pre><br><pre>-Steve</pre></blockquote></blockquote><div><=
br></div><div>Burn</div>
<pre>--</pre><pre>Linux-audit mailing list</pre><a href=3D"mailto:Linux-aud=
it@redhat.com"><pre>Linux-audit@redhat.com</pre></a><pre><br></pre><a href=
=3D"https://www.redhat.com/mailman/listinfo/linux-audit"><pre>https://www.r=
edhat.com/mailman/listinfo/linux-audit</pre></a></blockquote></body></html>

--=-PoGI7bJsnXtzgg9hwSrB--

--===============7279972573250251059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============7279972573250251059==--


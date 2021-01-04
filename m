Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CFE5A2E9EAE
	for <lists+linux-audit@lfdr.de>; Mon,  4 Jan 2021 21:13:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-orvQLunwPvWBb9Ggq1c1-Q-1; Mon, 04 Jan 2021 15:13:49 -0500
X-MC-Unique: orvQLunwPvWBb9Ggq1c1-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96CDBE76A;
	Mon,  4 Jan 2021 20:13:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D59745D9C6;
	Mon,  4 Jan 2021 20:13:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67106180954D;
	Mon,  4 Jan 2021 20:13:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 104KDUpQ030686 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 15:13:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F36F4111286C; Mon,  4 Jan 2021 20:13:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF8B2111286A
	for <linux-audit@redhat.com>; Mon,  4 Jan 2021 20:13:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CDF6185A7BC
	for <linux-audit@redhat.com>; Mon,  4 Jan 2021 20:13:27 +0000 (UTC)
Received: from icp-osb-irony-out4.external.iinet.net.au
	(icp-osb-irony-out4.external.iinet.net.au [203.59.1.220]) by
	relay.mimecast.com with ESMTP id us-mta-107-HOYpHB-IOy6stSt8LJMsAQ-1;
	Mon, 04 Jan 2021 15:13:23 -0500
X-MC-Unique: HOYpHB-IOy6stSt8LJMsAQ-1
X-SMTP-MATCH: 1
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BoAwCfdfNf/1enWttiGwEBAQEBAQE?=
	=?us-ascii?q?BBQEBARIBAQEDAwEBAUeBSIF8gXyFIIkEhhaCFQM4TYMfimiLT4FcCwEBAQE?=
	=?us-ascii?q?BAQEBATUBAgQBAYREBAICgXAmOBMCEAEBAQUBAQEBAQYDAYZehXMBAQEBAgE?=
	=?us-ascii?q?jBC8zCwgGChwOAgJXBgEtgkBLglYBAQ8frjt2fzOFRhOCFAaBDYFCgTiJN4N?=
	=?us-ascii?q?yNYFNP4ERNoIuNT6HVoJgBIFUBmQHFBcEXBMhEQaBEQEYEQ4BgQaPFINPiHO?=
	=?us-ascii?q?Ka5ERLAeCeYEXBQuGT5NiIqJQhh0YjVacOTkahj2BejMaH4IWGIEQTxkNVo5?=
	=?us-ascii?q?wAQgBjRkVMGcCBgoBAQMJWQEBinksghoBAQ?=
X-IPAS-Result: =?us-ascii?q?A2BoAwCfdfNf/1enWttiGwEBAQEBAQEBBQEBARIBAQEDA?=
	=?us-ascii?q?wEBAUeBSIF8gXyFIIkEhhaCFQM4TYMfimiLT4FcCwEBAQEBAQEBATUBAgQBA?=
	=?us-ascii?q?YREBAICgXAmOBMCEAEBAQUBAQEBAQYDAYZehXMBAQEBAgEjBC8zCwgGChwOA?=
	=?us-ascii?q?gJXBgEtgkBLglYBAQ8frjt2fzOFRhOCFAaBDYFCgTiJN4NyNYFNP4ERNoIuN?=
	=?us-ascii?q?T6HVoJgBIFUBmQHFBcEXBMhEQaBEQEYEQ4BgQaPFINPiHOKa5ERLAeCeYEXB?=
	=?us-ascii?q?QuGT5NiIqJQhh0YjVacOTkahj2BejMaH4IWGIEQTxkNVo5wAQgBjRkVMGcCB?=
	=?us-ascii?q?goBAQMJWQEBinksghoBAQ?=
X-IronPort-AV: E=Sophos;i="5.78,474,1599494400"; 
	d="scan'208,217";a="286836158"
Received: from 219-90-167-87.ip.adam.com.au (HELO swtf.swtf.dyndns.org)
	([219.90.167.87]) by icp-osb-irony-out4.iinet.net.au with ESMTP;
	05 Jan 2021 04:13:01 +0800
Message-ID: <8368b5c67757f2de8f664bc2eef5f5ca153a0c87.camel@iinet.net.au>
Subject: Re: Occasional delayed output of events
From: Burn Alting <burn.alting@iinet.net.au>
To: Steve Grubb <sgrubb@redhat.com>, Linux Audit <linux-audit@redhat.com>
Date: Tue, 05 Jan 2021 07:12:51 +1100
In-Reply-To: <2756596.e9J7NaK4W3@x2>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<5426593.DvuYhMxLoT@x2>
	<1340951117184f479e4f5dc75766fba91ed2c085.camel@iinet.net.au>
	<2756596.e9J7NaK4W3@x2>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6760371851207658487=="

--===============6760371851207658487==
Content-Type: multipart/alternative; boundary="=-nGQ6u4avYmk3vF/Y2htB"

--=-nGQ6u4avYmk3vF/Y2htB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-01-04 at 09:46 -0500, Steve Grubb wrote:
> On Monday, January 4, 2021 2:55:25 AM EST Burn Alting wrote:
> > On Sun, 2021-01-03 at 10:41 -0500, Steve Grubb wrote:
> > > On Friday, January 1, 2021 4:22:33 PM EST Burn Alting wrote:
> > > > Sometimes, events recorded in /var/log/audit/audit.log appear some
> > > > seconds past co- located events which results in
> > > > auparse:au_check_events() marking  these events complete before they
> > > > are. An example of this can be seen below with the offending event id
> > > > 44609.
> > > > 
> > > > This has been plaguing me for a year or two and this morning was the
> > > > first time I still had access to the raw audit.log files (I monitor a lot
> > > > of event types and the log files roll over fairly quickly).
> > > > The example below is from a fully patched Centos 7 but I have also seen
> > > > this on a patched Fedora 32.
> > > > 
> > > > Has this been seen before? Do we need to re-evaluate how auparse
> > > > 'completes' an event (ie 2 seconds is too quick).
> > > 
> > > I have never seen this. But on the way to disk, auditd only does light
> > > processing of the event.  If the format is enriched, it looks things up
> > > on a record by record basis. It does not collect events until they are
> > > complete - it dumps it to disk as soon as it can tack on the extra
> > > information.
> > > 
> > > So, the question would be, does this delay happen on the way to disk? Or
> > > is this an artifact of post processing the logs with an auparse based
> > > utility? Can this be observed repeatedly on the same raw logs? If so,
> > > then maybe auparse does have some issue. But if this is a post
> > > processing issue, then the wall clock doesn't matter because this event
> > > should have collected up together.
> > > 
> > > I'd say this merits some investigation.
> > 
> > OK. I think this needs to be addressed on two fronts. There may be more.
> > A.  Within post processing ... a 2 second timeout is not sufficient. I
> > would suggest we modify auparse.c:au_check_events() to i) perform the
> > event type checks first, then
> >   ii) increase the timeout of 2 seconds to be a larger value based on
> > empirical tests.
> 
> In the post processing, there are 2 use cases. The first is events that are on 
> disk. In this usage, the 2 second timeout does not come into effect because 
> the events are run through probably within nanoseconds or microseconds at the 
> worst. The only time it would come into effect is if the terminating record 
> is missing.

In this first case, the 2 second timeout is on the event's time, not the 'processing
time'.  See ausearch-lol.c:check_events() and auparse.c:au_get_ready_event().
And I use the checkpointing code to avoid the incomplete event issue.

In my case, I have not lost records, it's just that an event has arrived on disk
with an event time more than 2 seconds after the previously written event.
Basically,
a. The event was delayed getting to auditd and we look to the kernel for a solution.
b. The event arrived at a reasonable point in time at auditd and for some reason
auditd delayed it's printing (by the way I tend to use RAW log format, not enriched.

In either case, I believe ausearch-lol.c:check_events() and
auparse.c:au_get_ready_event() do need to be changed as we have complete events
written by auditd
which these two routines fail to process properly.

> 
> The other use case is realtime processing as an audispd plugin. In this use 
> case the wall clock could matter because records could potentially get lost 
> due to overflows or another plugin taking too long. This is the use case where 
> the wall clock matters. And again, it matters when records get lost or 
> delayed in transit. As long as everything is flowing, it should not factor 
> into event processing.
> 
> > B. I will build a temporary auditd daemon to perform some empirical testing
> > to see how long events can reside within the daemon. I may need some
> > advice on this. I assume that the code that sets the timestamp is in
> > src/auditd.c:send_audit_event().
> 
> This is only for audit daemon's internal events. For all "real" events, it's 
> set in the kernel.

If that is the case and the kernel is establishing the timestamp, then either the
kernel has delayed the events
arrival at the daemon or the daemon has delayed it's writing.

> 
> > If so, I will see if I can put orchestration debug code in to monitor an
> > event's 'time in daemon' until this point. I will then report on this.
> > 
> > I believe given that AUDIT_PROCTITLE and AUDIT_EOE is fairly widespread,
> > then the testing switch in A. will not be a big issue (time cost wise). It
> > will also mean that if we over compensate the timeout that would cause
> > additional memory cost in auparse() then this is mittigated.
> 
> I'd suggest breaking up the event completion tests so that an exact 
> collection termination reason code could be associated to the event.
> 
> > With respect to 'There may be more' fronts. Are there other points in the
> > 'audit ecosystem' that makes use of the '2 second timeout'.
> 
> Ausearch/report has its own special copy of the event collection logic. It 
> should be nearly identical to what auparse does.

They appear identical  ... ausearch-lol.c:check_events() and
auparse.c:au_get_ready_event().
> 
> > I will start work on this, this coming weekend if the above makes sense.
> 
> One other thought, the current shipping code is audit-3.0, doing a diff 
> between it and audit-2.8.5 for the auparse directory does show some 
> differences in event collection/grouping/next_event. A lot of the differences 
> are cosmetic to fix extra whitespace or indentation. But if you skip all that, 
> there are some real changes that probably were because of bug reports. For 
> example,

I will go through these, although this occurs on my Centos 7's (audit-2.8.5-4.el7.x86_64) as well as my 8's (audit-3.0-0.17.20191104git1c2f876.el8.x86_64).

> 
> @@ -259,15 +260,6 @@ static event_list_t *au_get_ready_event(
>         if (lowest && lowest->status == EBS_COMPLETE) {
>                 lowest->status = EBS_EMPTY;
>                 au->au_ready--;
> -               // Try to consolidate the array so that we iterate
> -               // over a smaller portion next time
> -               if (lowest == &lol->array[lol->maxi]) {
> -                       au_lolnode *ptr = lowest;
> -                       while (ptr->status == EBS_EMPTY && lol->maxi > 0) {
> -                               lol->maxi--;
> -                               ptr = &lol->array[lol->maxi];
> -                       }
> -               }
>                 return lowest->l;
>         }
> 
> and
> 
> @@ -1536,6 +1550,13 @@ static int au_auparse_next_event(auparse
>                 aup_list_create(l);
>                 aup_list_set_event(l, &e);
>                 aup_list_append(l, au->cur_buf, au->list_idx, au-
> > line_number);
> +               // Eat standalone EOE - main event was already marked 
> complete
> +               if (l->head->type == AUDIT_EOE) {
> +                       au->cur_buf = NULL;
> +                       aup_list_clear(l);
> +                       free(l);
> +                       continue;
> +               }
>                 if (au_lol_append(au->au_lo, l) == NULL) {
>                         free((char *)e.host);
>  #ifdef LOL_EVENTS_DEBUG01
> 
> I don't know if those have an effect on what you are seeing. But that is the 
> only substantial changes that I can see.
> 
> -Steve
> 
> 

--=-nGQ6u4avYmk3vF/Y2htB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Mon, 2021-01-04 at 09:46 -0500, Steve Grubb wrote:</div><blockq=
uote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf soli=
d;padding-left:1ex"><pre>On Monday, January 4, 2021 2:55:25 AM EST Burn Alt=
ing wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; borde=
r-left:2px #729fcf solid;padding-left:1ex"><pre>On Sun, 2021-01-03 at 10:41=
 -0500, Steve Grubb wrote:</pre><blockquote type=3D"cite" style=3D"margin:0=
 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>On Friday, =
January 1, 2021 4:22:33 PM EST Burn Alting wrote:</pre><blockquote type=3D"=
cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-lef=
t:1ex"><pre>Sometimes, events recorded in /var/log/audit/audit.log appear s=
ome</pre><pre>seconds past co- located events which results in</pre><pre>au=
parse:au_check_events() marking  these events complete before they</pre><pr=
e>are. An example of this can be seen below with the offending event id</pr=
e><pre>44609.</pre><pre><br></pre><pre>This has been plaguing me for a year=
 or two and this morning was the</pre><pre>first time I still had access to=
 the raw audit.log files (I monitor a lot</pre><pre>of event types and the =
log files roll over fairly quickly).</pre><pre>The example below is from a =
fully patched Centos 7 but I have also seen</pre><pre>this on a patched Fed=
ora 32.</pre><pre><br></pre><pre>Has this been seen before? Do we need to r=
e-evaluate how auparse</pre><pre>'completes' an event (ie 2 seconds is too =
quick).</pre></blockquote><pre><br></pre><pre>I have never seen this. But o=
n the way to disk, auditd only does light</pre><pre>processing of the event=
.  If the format is enriched, it looks things up</pre><pre>on a record by r=
ecord basis. It does not collect events until they are</pre><pre>complete -=
 it dumps it to disk as soon as it can tack on the extra</pre><pre>informat=
ion.</pre><pre><br></pre><pre>So, the question would be, does this delay ha=
ppen on the way to disk? Or</pre><pre>is this an artifact of post processin=
g the logs with an auparse based</pre><pre>utility? Can this be observed re=
peatedly on the same raw logs? If so,</pre><pre>then maybe auparse does hav=
e some issue. But if this is a post</pre><pre>processing issue, then the wa=
ll clock doesn't matter because this event</pre><pre>should have collected =
up together.</pre><pre><br></pre><pre>I'd say this merits some investigatio=
n.</pre></blockquote><pre><br></pre><pre>OK. I think this needs to be addre=
ssed on two fronts. There may be more.</pre><pre>A.  Within post processing=
 ... a 2 second timeout is not sufficient. I</pre><pre>would suggest we mod=
ify auparse.c:au_check_events() to i) perform the</pre><pre>event type chec=
ks first, then</pre><pre>  ii) increase the timeout of 2 seconds to be a la=
rger value based on</pre><pre>empirical tests.</pre></blockquote><pre><br><=
/pre><pre>In the post processing, there are 2 use cases. The first is event=
s that are on </pre><pre>disk. In this usage, the 2 second timeout does not=
 come into effect because </pre><pre>the events are run through probably wi=
thin nanoseconds or microseconds at the </pre><pre>worst. The only time it =
would come into effect is if the terminating record </pre><pre>is missing.<=
/pre></blockquote><div><br></div><div>In this first case, the 2 second time=
out is on the event's time, not the 'processing time'.  See ausearch-lol.c:=
check_events() and auparse.c:au_get_ready_event().</div><div>And I use the =
checkpointing code to avoid the incomplete event issue.</div><div><br></div=
><div>In my case, I have not lost records, it's just that an event has arri=
ved on disk with an event time more than 2 seconds after the previously wri=
tten event.</div><div>Basically,</div><div>a. The event was delayed getting=
 to auditd and we look to the kernel for a solution.</div><div>b. The event=
 arrived at a reasonable point in time at auditd and for some reason auditd=
 delayed it's printing (by the way I tend to use RAW log format, not enrich=
ed.</div><div><br></div><div>In either case, I believe ausearch-lol.c:check=
_events() and auparse.c:au_get_ready_event() do need to be changed as we ha=
ve complete events written by auditd</div><div>which these two routines fai=
l to process properly.</div><div><br></div><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre=
><br></pre><pre>The other use case is realtime processing as an audispd plu=
gin. In this use </pre><pre>case the wall clock could matter because record=
s could potentially get lost </pre><pre>due to overflows or another plugin =
taking too long. This is the use case where </pre><pre>the wall clock matte=
rs. And again, it matters when records get lost or </pre><pre>delayed in tr=
ansit. As long as everything is flowing, it should not factor </pre><pre>in=
to event processing.</pre><pre><br></pre><blockquote type=3D"cite" style=3D=
"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>B.=
 I will build a temporary auditd daemon to perform some empirical testing</=
pre><pre>to see how long events can reside within the daemon. I may need so=
me</pre><pre>advice on this. I assume that the code that sets the timestamp=
 is in</pre><pre>src/auditd.c:send_audit_event().</pre></blockquote><pre><b=
r></pre><pre>This is only for audit daemon's internal events. For all "real=
" events, it's </pre><pre>set in the kernel.</pre></blockquote><div><br></d=
iv><div>If that is the case and the kernel is establishing the timestamp, t=
hen either the kernel has delayed the events</div><div>arrival at the daemo=
n or the daemon has delayed it's writing.</div><div><br></div><blockquote t=
ype=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padd=
ing-left:1ex"><pre><br></pre><blockquote type=3D"cite" style=3D"margin:0 0 =
0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>If so, I will =
see if I can put orchestration debug code in to monitor an</pre><pre>event'=
s 'time in daemon' until this point. I will then report on this.</pre><pre>=
<br></pre><pre>I believe given that AUDIT_PROCTITLE and AUDIT_EOE is fairly=
 widespread,</pre><pre>then the testing switch in A. will not be a big issu=
e (time cost wise). It</pre><pre>will also mean that if we over compensate =
the timeout that would cause</pre><pre>additional memory cost in auparse() =
then this is mittigated.</pre></blockquote><pre><br></pre><pre>I'd suggest =
breaking up the event completion tests so that an exact </pre><pre>collecti=
on termination reason code could be associated to the event.</pre><pre><br>=
</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px=
 #729fcf solid;padding-left:1ex"><pre>With respect to 'There may be more' f=
ronts. Are there other points in the</pre><pre>'audit ecosystem' that makes=
 use of the '2 second timeout'.</pre></blockquote><pre><br></pre><pre>Ausea=
rch/report has its own special copy of the event collection logic. It </pre=
><pre>should be nearly identical to what auparse does.</pre></blockquote><d=
iv><br></div><div>They appear identical  ... ausearch-lol.c:check_events() =
and auparse.c:au_get_ready_event().</div><blockquote type=3D"cite" style=3D=
"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre><b=
r></pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2=
px #729fcf solid;padding-left:1ex"><pre>I will start work on this, this com=
ing weekend if the above makes sense.</pre></blockquote><pre><br></pre><pre=
>One other thought, the current shipping code is audit-3.0, doing a diff </=
pre><pre>between it and audit-2.8.5 for the auparse directory does show som=
e </pre><pre>differences in event collection/grouping/next_event. A lot of =
the differences </pre><pre>are cosmetic to fix extra whitespace or indentat=
ion. But if you skip all that, </pre><pre>there are some real changes that =
probably were because of bug reports. For </pre><pre>example,</pre></blockq=
uote><pre><br></pre><pre>I will go through these, although this occurs on m=
y Centos 7's (audit-2.8.5-4.el7.x86_64) as well as my 8's (audit-3.0-0.17.2=
0191104git1c2f876.el8.x86_64).</pre><pre><br></pre><blockquote type=3D"cite=
" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1e=
x"><pre><br></pre><pre>@@ -259,15 +260,6 @@ static event_list_t *au_get_rea=
dy_event(</pre><pre>        if (lowest &amp;&amp; lowest-&gt;status =3D=3D =
EBS_COMPLETE) {</pre><pre>                lowest-&gt;status =3D EBS_EMPTY;<=
/pre><pre>                au-&gt;au_ready--;</pre><pre>-               // T=
ry to consolidate the array so that we iterate</pre><pre>-               //=
 over a smaller portion next time</pre><pre>-               if (lowest =3D=
=3D &amp;lol-&gt;array[lol-&gt;maxi]) {</pre><pre>-                       a=
u_lolnode *ptr =3D lowest;</pre><pre>-                       while (ptr-&gt=
;status =3D=3D EBS_EMPTY &amp;&amp; lol-&gt;maxi &gt; 0) {</pre><pre>-     =
                          lol-&gt;maxi--;</pre><pre>-                      =
         ptr =3D &amp;lol-&gt;array[lol-&gt;maxi];</pre><pre>-             =
          }</pre><pre>-               }</pre><pre>                return lo=
west-&gt;l;</pre><pre>        }</pre><pre><br></pre><pre>and</pre><pre><br>=
</pre><pre>@@ -1536,6 +1550,13 @@ static int au_auparse_next_event(auparse<=
/pre><pre>                aup_list_create(l);</pre><pre>                aup=
_list_set_event(l, &amp;e);</pre><pre>                aup_list_append(l, au=
-&gt;cur_buf, au-&gt;list_idx, au-</pre><blockquote type=3D"cite" style=3D"=
margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>lin=
e_number);</pre></blockquote><pre>+               // Eat standalone EOE - m=
ain event was already marked </pre><pre>complete</pre><pre>+               =
if (l-&gt;head-&gt;type =3D=3D AUDIT_EOE) {</pre><pre>+                    =
   au-&gt;cur_buf =3D NULL;</pre><pre>+                       aup_list_clea=
r(l);</pre><pre>+                       free(l);</pre><pre>+               =
        continue;</pre><pre>+               }</pre><pre>                if =
(au_lol_append(au-&gt;au_lo, l) =3D=3D NULL) {</pre><pre>                  =
      free((char *)e.host);</pre><pre> #ifdef LOL_EVENTS_DEBUG01</pre><pre>=
<br></pre><pre>I don't know if those have an effect on what you are seeing.=
 But that is the </pre><pre>only substantial changes that I can see.</pre><=
pre><br></pre><pre>-Steve</pre><pre><br></pre><pre><br></pre></blockquote><=
/body></html>

--=-nGQ6u4avYmk3vF/Y2htB--

--===============6760371851207658487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============6760371851207658487==--


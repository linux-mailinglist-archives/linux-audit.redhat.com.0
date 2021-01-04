Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D30102E9157
	for <lists+linux-audit@lfdr.de>; Mon,  4 Jan 2021 08:57:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-FplSthQSOuKtRr-2URjddw-1; Mon, 04 Jan 2021 02:57:04 -0500
X-MC-Unique: FplSthQSOuKtRr-2URjddw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E9DE15720;
	Mon,  4 Jan 2021 07:56:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 668ED5D9D3;
	Mon,  4 Jan 2021 07:56:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9492180954D;
	Mon,  4 Jan 2021 07:56:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1047uc2e018138 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 02:56:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EAE572026D11; Mon,  4 Jan 2021 07:56:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5F162026D47
	for <linux-audit@redhat.com>; Mon,  4 Jan 2021 07:56:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB6FE101A560
	for <linux-audit@redhat.com>; Mon,  4 Jan 2021 07:56:35 +0000 (UTC)
Received: from icp-osb-irony-out4.external.iinet.net.au
	(icp-osb-irony-out4.external.iinet.net.au [203.59.1.220]) by
	relay.mimecast.com with ESMTP id us-mta-97-mWhXbVV_PVGeBAXXXkbIhw-1;
	Mon, 04 Jan 2021 02:56:32 -0500
X-MC-Unique: mWhXbVV_PVGeBAXXXkbIhw-1
X-SMTP-MATCH: 1
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AUCgC7yfJf/1enWttiHAEBAQEBAQc?=
	=?us-ascii?q?BARIBAQQEAQFHgUiBfIF8hSCJBIYVghUDOINsljeBXAsBAQEBAQEBAQE1AQI?=
	=?us-ascii?q?EAQGERAQCAoFwJjgTAhABAQEFAQEBAQEGAwGGXoV0AQUjMzMLCAYKHA4CAlc?=
	=?us-ascii?q?GAYJtS4JWAQEusBKBMoVGE4IQBoENgUKBOIk3g3I1gU0/gUeCLjU+h1aCYAS?=
	=?us-ascii?q?BVAZ/dzQRBoESKQ6BB5JjiHOKa5ERLAeCeYEXBQuGT5NiIqJQhh0YjVacOYc?=
	=?us-ascii?q?QgXozGh+CFhiBEE8ZDVaOcAEIAY0uMGcCBgoBAQMJWQEBinksghoBAQ?=
X-IPAS-Result: =?us-ascii?q?A2AUCgC7yfJf/1enWttiHAEBAQEBAQcBARIBAQQEAQFHg?=
	=?us-ascii?q?UiBfIF8hSCJBIYVghUDOINsljeBXAsBAQEBAQEBAQE1AQIEAQGERAQCAoFwJ?=
	=?us-ascii?q?jgTAhABAQEFAQEBAQEGAwGGXoV0AQUjMzMLCAYKHA4CAlcGAYJtS4JWAQEus?=
	=?us-ascii?q?BKBMoVGE4IQBoENgUKBOIk3g3I1gU0/gUeCLjU+h1aCYASBVAZ/dzQRBoESK?=
	=?us-ascii?q?Q6BB5JjiHOKa5ERLAeCeYEXBQuGT5NiIqJQhh0YjVacOYcQgXozGh+CFhiBE?=
	=?us-ascii?q?E8ZDVaOcAEIAY0uMGcCBgoBAQMJWQEBinksghoBAQ?=
X-IronPort-AV: E=Sophos;i="5.78,473,1599494400"; 
	d="scan'208,217";a="286800459"
Received: from 219-90-167-87.ip.adam.com.au (HELO swtf.swtf.dyndns.org)
	([219.90.167.87]) by icp-osb-irony-out4.iinet.net.au with ESMTP;
	04 Jan 2021 15:55:45 +0800
Message-ID: <1340951117184f479e4f5dc75766fba91ed2c085.camel@iinet.net.au>
Subject: Re: Occasional delayed output of events
From: Burn Alting <burn.alting@iinet.net.au>
To: Steve Grubb <sgrubb@redhat.com>, Linux Audit <linux-audit@redhat.com>
Date: Mon, 04 Jan 2021 18:55:25 +1100
In-Reply-To: <5426593.DvuYhMxLoT@x2>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<5426593.DvuYhMxLoT@x2>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============8323029703331272199=="

--===============8323029703331272199==
Content-Type: multipart/alternative; boundary="=-O4TszlkkvPyOe8mZZtui"

--=-O4TszlkkvPyOe8mZZtui
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-01-03 at 10:41 -0500, Steve Grubb wrote:
> On Friday, January 1, 2021 4:22:33 PM EST Burn Alting wrote:
> > Sometimes, events recorded in /var/log/audit/audit.log appear some seconds
> > past co- located events which results in auparse:au_check_events() marking
> > these events complete before they are. An example of this can be seen
> > below with the offending event id 44609.
> > 
> > This has been plaguing me for a year or two and this morning was the first
> > time I still had access to the raw audit.log files (I monitor a lot of
> > event types and the log files roll over fairly quickly).
> > The example below is from a fully patched Centos 7 but I have also seen
> > this on a patched Fedora 32.
> > 
> > Has this been seen before? Do we need to re-evaluate how auparse
> > 'completes' an event (ie 2 seconds is too quick).
> 
> I have never seen this. But on the way to disk, auditd only does light 
> processing of the event.  If the format is enriched, it looks things up on a 
> record by record basis. It does not collect events until they are complete - 
> it dumps it to disk as soon as it can tack on the extra information.
> 
> So, the question would be, does this delay happen on the way to disk? Or is 
> this an artifact of post processing the logs with an auparse based utility? 
> Can this be observed repeatedly on the same raw logs? If so, then maybe 
> auparse does have some issue. But if this is a post processing issue, then 
> the wall clock doesn't matter because this event should have collected up 
> together.
> 
> I'd say this merits some investigation.

OK. I think this needs to be addressed on two fronts. There may be more.
A.  Within post processing ... a 2 second timeout is not sufficient. I would suggest we modify auparse.c:au_check_events() to
  i) perform the event type checks first, then
  ii) increase the timeout of 2 seconds to be a larger value based on empirical tests.

B. I will build a temporary auditd daemon to perform some empirical testing to see how long events can reside within the daemon. I may need some advice on this.
I assume that the code that sets the timestamp is in src/auditd.c:send_audit_event(). If so, I will see if I can put orchestration debug code in to monitor an event's
'time in daemon' until this point. I will then report on this.

I believe given that AUDIT_PROCTITLE and AUDIT_EOE is fairly widespread, then the testing switch in A. will not be a big issue (time cost wise). It will also mean that if we
over compensate the timeout that would cause additional memory cost in auparse() then this is mittigated.

With respect to 'There may be more' fronts. Are there other points in the 'audit ecosystem' that makes use of the '2 second timeout'.

I will start work on this, this coming weekend if the above makes sense.

Regards
Burn


--=-O4TszlkkvPyOe8mZZtui
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Sun, 2021-01-03 at 10:41 -0500, Steve Grubb wrote:</div><blockq=
uote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf soli=
d;padding-left:1ex"><pre>On Friday, January 1, 2021 4:22:33 PM EST Burn Alt=
ing wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; borde=
r-left:2px #729fcf solid;padding-left:1ex"><pre>Sometimes, events recorded =
in /var/log/audit/audit.log appear some seconds</pre><pre>past co- located =
events which results in auparse:au_check_events() marking</pre><pre>these e=
vents complete before they are. An example of this can be seen</pre><pre>be=
low with the offending event id 44609.</pre><pre><br></pre><pre>This has be=
en plaguing me for a year or two and this morning was the first</pre><pre>t=
ime I still had access to the raw audit.log files (I monitor a lot of</pre>=
<pre>event types and the log files roll over fairly quickly).</pre><pre>The=
 example below is from a fully patched Centos 7 but I have also seen</pre><=
pre>this on a patched Fedora 32.</pre><pre><br></pre><pre>Has this been see=
n before? Do we need to re-evaluate how auparse</pre><pre>'completes' an ev=
ent (ie 2 seconds is too quick).</pre></blockquote><pre><br></pre><pre>I ha=
ve never seen this. But on the way to disk, auditd only does light </pre><p=
re>processing of the event.  If the format is enriched, it looks things up =
on a </pre><pre>record by record basis. It does not collect events until th=
ey are complete - </pre><pre>it dumps it to disk as soon as it can tack on =
the extra information.</pre><pre><br></pre><pre>So, the question would be, =
does this delay happen on the way to disk? Or is </pre><pre>this an artifac=
t of post processing the logs with an auparse based utility? </pre><pre>Can=
 this be observed repeatedly on the same raw logs? If so, then maybe </pre>=
<pre>auparse does have some issue. But if this is a post processing issue, =
then </pre><pre>the wall clock doesn't matter because this event should hav=
e collected up </pre><pre>together.</pre><pre><br></pre><pre>I'd say this m=
erits some investigation.</pre></blockquote><pre><br></pre><pre>OK. I think=
 this needs to be addressed on two fronts. There may be more.</pre><pre>A.&=
nbsp; Within post processing ... a 2 second timeout is not sufficient. I wo=
uld suggest we modify auparse.c:au_check_events() to</pre><pre>  i) perform=
 the event type checks first, then</pre><pre>  ii) increase the timeout of =
2 seconds to be a larger value based on empirical tests.</pre><pre><br></pr=
e><pre>B. I will build a temporary auditd daemon to perform some empirical =
testing to see how long events can reside within the daemon. I may need som=
e advice on this.</pre><pre>I assume that the code that sets the timestamp =
is in src/auditd.c:send_audit_event(). If so, I will see if I can put orche=
stration debug code in to monitor an event's</pre><pre>'time in daemon' unt=
il this point. I will then report on this.</pre><pre><br></pre><pre>I belie=
ve given that AUDIT_PROCTITLE and AUDIT_EOE is fairly widespread, then the =
testing switch in A. will not be a big issue (time cost wise). It will also=
 mean that if we</pre><pre>over compensate the timeout that would cause add=
itional memory cost in auparse() then this is mittigated.</pre><pre><br></p=
re><pre>With respect to 'There may be more' fronts. Are there other points =
in the 'audit ecosystem' that makes use of the '2 second timeout'.</pre><pr=
e><br></pre><pre>I will start work on this, this coming weekend if the abov=
e makes sense.</pre><pre><br></pre><pre>Regards</pre><pre>Burn</pre><pre><b=
r></pre></body></html>

--=-O4TszlkkvPyOe8mZZtui--

--===============8323029703331272199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============8323029703331272199==--


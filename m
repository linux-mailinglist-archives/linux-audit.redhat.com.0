Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8A32FCB07
	for <lists+linux-audit@lfdr.de>; Wed, 20 Jan 2021 07:39:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-HUV3SSlTPjKJIKiO2_phRQ-1; Wed, 20 Jan 2021 01:39:32 -0500
X-MC-Unique: HUV3SSlTPjKJIKiO2_phRQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB911E744;
	Wed, 20 Jan 2021 06:39:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFB5F5C1BD;
	Wed, 20 Jan 2021 06:39:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89333180954D;
	Wed, 20 Jan 2021 06:39:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10K6cpd3026171 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 Jan 2021 01:38:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3B8BA2026D11; Wed, 20 Jan 2021 06:38:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 360002026D5D
	for <linux-audit@redhat.com>; Wed, 20 Jan 2021 06:38:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24695811E84
	for <linux-audit@redhat.com>; Wed, 20 Jan 2021 06:38:49 +0000 (UTC)
Received: from icp-osb-irony-out4.external.iinet.net.au
	(icp-osb-irony-out4.external.iinet.net.au [203.59.1.220]) by
	relay.mimecast.com with ESMTP id us-mta-108-ayfo_6I0OhGpVADeWGtssQ-1;
	Wed, 20 Jan 2021 01:38:43 -0500
X-MC-Unique: ayfo_6I0OhGpVADeWGtssQ-1
X-SMTP-MATCH: 1
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AGAQCEzwdg/3zSRWpiGgEBAQEBAQE?=
	=?us-ascii?q?BAQEDAQEBARIBAQEBAgIBAQEBR4FIgXyBfGKEQIkEhjaCFgM4g2yWPYFcCwE?=
	=?us-ascii?q?BAQEBAQEBATUBAgQBAYREBAICgXQmOBMCEAEBAQUBAQEBAQYDAYZehXQBBSM?=
	=?us-ascii?q?zIxALCAYKHA4CAlcGARKCW0uCVgEBLq9wgTKFRxOCIQaBDYFDgTiGdgGCToN?=
	=?us-ascii?q?yNYFNP4FHgi41PodXgmAEgU9vB4FQBkBiFREBWAKTIYh7inGREywHgnqBFwU?=
	=?us-ascii?q?LhlGINYs7IqJqhiIYjWGjZoF6MxofghYYgQ9QGQ2OLReBAgEJjS4wMDcCBgo?=
	=?us-ascii?q?BAQMJWQEBi0cBAQ?=
X-IPAS-Result: =?us-ascii?q?A2AGAQCEzwdg/3zSRWpiGgEBAQEBAQEBAQEDAQEBARIBA?=
	=?us-ascii?q?QEBAgIBAQEBR4FIgXyBfGKEQIkEhjaCFgM4g2yWPYFcCwEBAQEBAQEBATUBA?=
	=?us-ascii?q?gQBAYREBAICgXQmOBMCEAEBAQUBAQEBAQYDAYZehXQBBSMzIxALCAYKHA4CA?=
	=?us-ascii?q?lcGARKCW0uCVgEBLq9wgTKFRxOCIQaBDYFDgTiGdgGCToNyNYFNP4FHgi41P?=
	=?us-ascii?q?odXgmAEgU9vB4FQBkBiFREBWAKTIYh7inGREywHgnqBFwULhlGINYs7IqJqh?=
	=?us-ascii?q?iIYjWGjZoF6MxofghYYgQ9QGQ2OLReBAgEJjS4wMDcCBgoBAQMJWQEBi0cBA?=
	=?us-ascii?q?Q?=
X-IronPort-AV: E=Sophos;i="5.79,360,1602518400"; 
	d="scan'208,217";a="288402583"
Received: from 106-69-210-124.dyn.iinet.net.au (HELO swtf.swtf.dyndns.org)
	([106.69.210.124]) by icp-osb-irony-out4.iinet.net.au with ESMTP;
	20 Jan 2021 14:38:27 +0800
Message-ID: <ebcdc0bc829e126c9fb9747b2457c5211527c8b1.camel@iinet.net.au>
Subject: Re: Occasional delayed output of events
From: Burn Alting <burn.alting@iinet.net.au>
To: Steve Grubb <sgrubb@redhat.com>, Paul Moore <paul@paul-moore.com>
Date: Wed, 20 Jan 2021 17:38:26 +1100
In-Reply-To: <805552026.0ifERbkFSE@x2>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<9fd0d1b4585214eb3ed8db6da066b571563f19bc.camel@iinet.net.au>
	<CAHC9VhQzr94BdBY3voNEMxzBPM-KS3h1V=epCMMsknfu6Q5vag@mail.gmail.com>
	<805552026.0ifERbkFSE@x2>
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
Cc: Richard Guy Briggs <rgb@redhat.com>, Linux Audit <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============5056032989924201784=="

--===============5056032989924201784==
Content-Type: multipart/alternative; boundary="=-dpbaFNmXTNIiAcqPw2Am"

--=-dpbaFNmXTNIiAcqPw2Am
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

All,
How is the following for a way forward.
a. I will author a patch to the user space code to correctly parse this condition
and submit it on the weekend. It will be via a new configuration item to auditd.conf
just in case placing a fixed extended timeout (15-20 secs) affects memory usage for
users of the auparse library. This solves the initial problem of ausearch/auparse
failing to parse generated audit.b. I am happy to instrument what ever is
recommended on my hosts at home (vm's and bare metal) to provide more information,
should we want to 'explain' the occurrence, given I see this every week or two and
report back.
On Tue, 2021-01-19 at 16:51 -0500, Steve Grubb wrote:
> On Tuesday, January 19, 2021 3:26:04 PM EST Paul Moore wrote:
> > On Tue, Jan 19, 2021 at 2:38 PM Burn Alting <burn.alting@iinet.net.au> 
> wrote:
> > > All systems use chrony (current NTP daemon). One is a VM (on top of KVM)and
> > > the other a bare metal deployment. Does the above explain my seconddata set
> > > (in the issue) from a bare metal Centos 8 host? Perhaps Lenny'scomments bare
> > > investigation. Either way, I will offer a patch to theuser space code to,
> > > based on a configuration value, manage correctlysuch activity.
> > ...
> > > msg=audit(1609920994.483:1787848):msg=audit(1609920994.483:1787848):msg=audit(
> > > 1609920994.483:1787848):msg=audit(1609920994.483:1787848):msg=audit(1609920994
> > > .483:1787848):msg=audit(1609920994.484:1787849):msg=audit(1609920994.484:17878
> > > 49):msg=audit(1609921000.636:1787850):msg=audit(1609921000.636:1787850):msg=au
> > > dit(1609921000.636:1787850):msg=audit(1609921008.456:1787851):msg=audit(160992
> > > 1008.456:1787851):msg=audit(1609921008.456:1787851):msg=audit(1609921008.456:1
> > > 787851):msg=audit(1609921008.456:1787851):msg=audit(1609921008.456:1787851):ms
> > > g=audit(1609920994.484:1787849):msg=audit(1609920994.484:1787849):msg=audit(16
> > > 09920994.484:1787849):msg=audit(1609921010.837:1787852):msg=audit(1609921010.8
> > > 37:1787852):msg=audit(1609921010.837:1787852):
> > > msg=audit(1609921010.837:1787852):
> > Looking at the extracted snippet above where event 1787849 is out of
> > order we see the following timestamps:
> > > msg=audit(1609920994.483:1787848):msg=audit(1609920994.484:1787849):msg=audit(
> > > 1609921000.636:1787850):msg=audit(1609921008.456:1787851):
> > > msg=audit(1609921010.837:1787852):
> > 
> > ... which looks correct in as much that the time doesn't appear to gobackwards
> > between events.  As I said before, I'm not sure how Steve'suserspace works so
> > the time may be a red herring.
> 
> It only handles one record at a time. No chance to mix things up.
> The github issue says that 30-stig.rules is being used. If the system time changed
> with chrony, I would expect syscall events with adjtimex. But the only ones given
> are execve.
> -Steve
> > Barring some weird condition where auditd disconnects and quicklyreconnects to
> > the kernel, and/or dies and is replaced quickly, I'm notseeing anything obvious
> > in the kernel which would cause this.  I'm notsaying there isn't anything there,
> > just that it isn't obvious to me atthe moment :)
> 
> 
> 

--=-dpbaFNmXTNIiAcqPw2Am
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>All,</div><div><br></div><div>How is the following for a way forwa=
rd.</div><div><br></div><div>a. I will author a patch to the user space cod=
e to correctly parse this condition and submit it on the weekend. It will b=
e via a new configuration item to auditd.conf just in case placing a fixed =
extended timeout (15-20 secs) affects memory usage for users of the auparse=
 library. This solves the initial problem of ausearch/auparse failing to pa=
rse generated audit.</div><div>b. I am happy to instrument what ever is rec=
ommended on my hosts at home (vm's and bare metal) to provide more informat=
ion, should we want to 'explain' the occurrence, given I see this every wee=
k or two and report back.</div><div><br></div><div>On Tue, 2021-01-19 at 16=
:51 -0500, Steve Grubb wrote:</div><blockquote type=3D"cite" style=3D"margi=
n:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>On Tuesd=
ay, January 19, 2021 3:26:04 PM EST Paul Moore wrote:</pre><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><pre>On Tue, Jan 19, 2021 at 2:38 PM Burn Alting &lt;</pre><a hr=
ef=3D"mailto:burn.alting@iinet.net.au"><pre>burn.alting@iinet.net.au</pre><=
/a><pre>&gt; </pre></blockquote><pre>wrote:</pre><blockquote type=3D"cite" =
style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"=
><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729=
fcf solid;padding-left:1ex"><pre>All systems use chrony (current NTP daemon=
). One is a VM (on top of KVM)</pre><pre>and the other a bare metal deploym=
ent. Does the above explain my second</pre><pre>data set (in the issue) fro=
m a bare metal Centos 8 host? Perhaps Lenny's</pre><pre>comments bare inves=
tigation. Either way, I will offer a patch to the</pre><pre>user space code=
 to, based on a configuration value, manage correctly</pre><pre>such activi=
ty.</pre></blockquote><pre>...</pre><pre><br></pre><blockquote type=3D"cite=
" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1e=
x"><pre>msg=3Daudit(1609920994.483:1787848):</pre><pre>msg=3Daudit(16099209=
94.483:1787848):</pre><pre>msg=3Daudit(1609920994.483:1787848):</pre><pre>m=
sg=3Daudit(1609920994.483:1787848):</pre><pre>msg=3Daudit(1609920994.483:17=
87848):</pre><pre>msg=3Daudit(1609920994.484:1787849):</pre><pre>msg=3Daudi=
t(1609920994.484:1787849):</pre><pre>msg=3Daudit(1609921000.636:1787850):</=
pre><pre>msg=3Daudit(1609921000.636:1787850):</pre><pre>msg=3Daudit(1609921=
000.636:1787850):</pre><pre>msg=3Daudit(1609921008.456:1787851):</pre><pre>=
msg=3Daudit(1609921008.456:1787851):</pre><pre>msg=3Daudit(1609921008.456:1=
787851):</pre><pre>msg=3Daudit(1609921008.456:1787851):</pre><pre>msg=3Daud=
it(1609921008.456:1787851):</pre><pre>msg=3Daudit(1609921008.456:1787851):<=
/pre><pre>msg=3Daudit(1609920994.484:1787849):</pre><pre>msg=3Daudit(160992=
0994.484:1787849):</pre><pre>msg=3Daudit(1609920994.484:1787849):</pre><pre=
>msg=3Daudit(1609921010.837:1787852):</pre><pre>msg=3Daudit(1609921010.837:=
1787852):</pre><pre>msg=3Daudit(1609921010.837:1787852):</pre></blockquote>=
<pre><br></pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border=
-left:2px #729fcf solid;padding-left:1ex"><pre>msg=3Daudit(1609921010.837:1=
787852):</pre></blockquote><pre>Looking at the extracted snippet above wher=
e event 1787849 is out of</pre><pre><br></pre><pre>order we see the followi=
ng timestamps:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; b=
order-left:2px #729fcf solid;padding-left:1ex"><pre>msg=3Daudit(1609920994.=
483:1787848):</pre><pre>msg=3Daudit(1609920994.484:1787849):</pre><pre>msg=
=3Daudit(1609921000.636:1787850):</pre><pre>msg=3Daudit(1609921008.456:1787=
851):</pre></blockquote><pre><br></pre><blockquote type=3D"cite" style=3D"m=
argin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>msg=
=3Daudit(1609921010.837:1787852):</pre></blockquote><pre><br></pre><pre>...=
 which looks correct in as much that the time doesn't appear to go</pre><pr=
e>backwards between events.  As I said before, I'm not sure how Steve's</pr=
e><pre>userspace works so the time may be a red herring.</pre></blockquote>=
<pre><br></pre><pre>It only handles one record at a time. No chance to mix =
things up.</pre><pre><br></pre><pre>The github issue says that 30-stig.rule=
s is being used. If the system time </pre><pre>changed with chrony, I would=
 expect syscall events with adjtimex. But the </pre><pre>only ones given ar=
e execve.</pre><pre><br></pre><pre>-Steve</pre><pre><br></pre><blockquote t=
ype=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padd=
ing-left:1ex"><pre>Barring some weird condition where auditd disconnects an=
d quickly</pre><pre>reconnects to the kernel, and/or dies and is replaced q=
uickly, I'm not</pre><pre>seeing anything obvious in the kernel which would=
 cause this.  I'm not</pre><pre>saying there isn't anything there, just tha=
t it isn't obvious to me at</pre><pre>the moment :)</pre></blockquote><pre>=
<br></pre><pre><br></pre><pre><br></pre><pre><br></pre></blockquote></body>=
</html>

--=-dpbaFNmXTNIiAcqPw2Am--

--===============5056032989924201784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============5056032989924201784==--


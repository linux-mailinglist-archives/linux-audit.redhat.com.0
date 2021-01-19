Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 692C82FC01F
	for <lists+linux-audit@lfdr.de>; Tue, 19 Jan 2021 20:38:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-xH_KKWx_M_mU9mLtD9t09g-1; Tue, 19 Jan 2021 14:38:48 -0500
X-MC-Unique: xH_KKWx_M_mU9mLtD9t09g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 149B4107ACFE;
	Tue, 19 Jan 2021 19:38:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D68160D06;
	Tue, 19 Jan 2021 19:38:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CC0C4BB7B;
	Tue, 19 Jan 2021 19:38:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JJcHXA020591 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 14:38:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AA060A9E7C; Tue, 19 Jan 2021 19:38:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A44E2951D8
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 19:38:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4852B187504B
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 19:38:15 +0000 (UTC)
Received: from icp-osb-irony-out9.external.iinet.net.au
	(icp-osb-irony-out9.external.iinet.net.au [203.59.1.226]) by
	relay.mimecast.com with ESMTP id us-mta-372-0z1umiEfOlKqPLfD66ER2A-1;
	Tue, 19 Jan 2021 14:38:09 -0500
X-MC-Unique: 0z1umiEfOlKqPLfD66ER2A-1
X-SMTP-MATCH: 1
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CBCQDXMwdg/3zSRWpfAxwBAQEBAQE?=
	=?us-ascii?q?HAQESAQEEBAEBR4FIgXYGgSVXYoQ/iQSGNYIWAziDbJY9gVwLAQEBAQEBAQE?=
	=?us-ascii?q?BLAkBAgQBAYREBAICgXQmOBMCEAEBAQUBAQEBAQYDAYZSDIVzAQEBAQIBIzM?=
	=?us-ascii?q?jBQsLCBAcDgICVwYTgltLAYJVAQEPHxCuVXaBMoRAAYEGE4IUBoENgUOBOIZ?=
	=?us-ascii?q?2AYZANYFNP4FHgi41PoJdAoIAJoJSgmAEgU8OYYEHNhoGAj4RD0ofAUUSCY9?=
	=?us-ascii?q?1gyWIe5wELAeCeoEXBQuGUYE3hn6LOyKEWp4QhiIYmH2YSYF6MxofghYYgQ8?=
	=?us-ascii?q?JRxkNkEWBTYpsMDA3AgYKAQEDCVkBAYlALYIXAQE?=
X-IPAS-Result: =?us-ascii?q?A2CBCQDXMwdg/3zSRWpfAxwBAQEBAQEHAQESAQEEBAEBR?=
	=?us-ascii?q?4FIgXYGgSVXYoQ/iQSGNYIWAziDbJY9gVwLAQEBAQEBAQEBLAkBAgQBAYREB?=
	=?us-ascii?q?AICgXQmOBMCEAEBAQUBAQEBAQYDAYZSDIVzAQEBAQIBIzMjBQsLCBAcDgICV?=
	=?us-ascii?q?wYTgltLAYJVAQEPHxCuVXaBMoRAAYEGE4IUBoENgUOBOIZ2AYZANYFNP4FHg?=
	=?us-ascii?q?i41PoJdAoIAJoJSgmAEgU8OYYEHNhoGAj4RD0ofAUUSCY91gyWIe5wELAeCe?=
	=?us-ascii?q?oEXBQuGUYE3hn6LOyKEWp4QhiIYmH2YSYF6MxofghYYgQ8JRxkNkEWBTYpsM?=
	=?us-ascii?q?DA3AgYKAQEDCVkBAYlALYIXAQE?=
X-IronPort-AV: E=Sophos;i="5.79,359,1602518400"; 
	d="scan'208,217";a="298674438"
Received: from 106-69-210-124.dyn.iinet.net.au (HELO swtf.swtf.dyndns.org)
	([106.69.210.124]) by icp-osb-irony-out9.iinet.net.au with ESMTP;
	20 Jan 2021 03:38:04 +0800
Message-ID: <9fd0d1b4585214eb3ed8db6da066b571563f19bc.camel@iinet.net.au>
Subject: Re: Occasional delayed output of events
From: Burn Alting <burn.alting@iinet.net.au>
To: Paul Moore <paul@paul-moore.com>
Date: Wed, 20 Jan 2021 06:38:03 +1100
In-Reply-To: <CAHC9VhRNcFappgO1eb40wbtjtzZe1b5RRV6ogN563QTOubwvOA@mail.gmail.com>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<5445873.DvuYhMxLoT@x2>
	<17715c36170.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
	<3095712.44csPzL39Z@x2>
	<CAHC9VhT_yd=zEusQga507jA43S_stCb2kAmd_sN6fLNcdLDdWg@mail.gmail.com>
	<9a7ed1203fa7ec67000aa68281a215354c2ed5f5.camel@iinet.net.au>
	<CAHC9VhRNcFappgO1eb40wbtjtzZe1b5RRV6ogN563QTOubwvOA@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6426578247450943780=="

--===============6426578247450943780==
Content-Type: multipart/alternative; boundary="=-GKbhvLPS8Mn6mgPn0Jy1"

--=-GKbhvLPS8Mn6mgPn0Jy1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-01-19 at 14:11 -0500, Paul Moore wrote:
> On Tue, Jan 19, 2021 at 3:18 AM Burn Alting <burn.alting@iinet.net.au> wrote:
> > I tend to have a rigorous auditing posture (see the rules loaded in 
> > https://github.com/linux-audit/audit-userspace/issues/148) which is not normal
> > for most. Perhaps, Paul, you have hit the nail on the head by stating that this
> > 'severe delay' is not that unreasonable given my rules posture and we just need
> > to 'deal with it' in user space.We still get the event data, I just need to
> > adjust the user space tools to deal with this occurrence.As for what the system
> > is doing, in my home case it's a Centos 7 VM running a tomcat service which only
> > gets busy every 20 minutes and the other is a HPE Z800 running Centos 8 with 4-5 
> > VM's mostly dormant. I can put any code in these hosts to assist in
> > 'validating'/testing the delay. Advise and I will run.
> 
> I took a (slightly) closer look at the queuing code just now and thecorner case I
> suspected doesn't look very promising here.  On failureto send a record to
> userspace, the record is put back at the front ofthe queue to preserve ordering so
> the kernel *should* still emitrecords in order even when auditd is under pressure,
> dead, or in theprocess of a restart.  Also, in this case the kernel kicks the
> auditdconnection, disconnecting auditd's netlink socket; I imagine thatwould be a
> notable event on your systems.
> However, looking at the timestamps in the audit events you posted, Inoticed
> something a little odd.  If I align the timestamps a bitbetter let's see if it
> jumps out at you guys ...
> type=XXX msg=audit(1609519900.159:44606): ...type=XXX
> msg=audit(1609519900.161:44607): ...type=XXX msg=audit(1609519900.163:44608):
> ...type=XXX msg=audit(1609519896.829:44609): ...type=XXX
> msg=audit(1609519900.170:44610): ...
> Let me guess Burn, you're running NTP/PTP :)  I'm not sure how auditdhandles
> things like this, but it looks like there was a small negativetime correction
> between events which caused the odd scenario whereevent N+1 actually occurred
> before event N according to the wallclock.  In other words, your system is time
> traveling ;)
. All systems use chrony (current NTP daemon). One is a VM (on top of KVM) and the
other a bare metal deployment. Does the above explain my second data set (in the
issue)  from a bare metal Centos 8 host?Perhaps Lenny's comments bare investigation.
Either way, I will offer a patch to the user space code to, based on a configuration
value, manage correctly such activity.
msg=audit(1609920994.481:1787844):msg=audit(1609920994.481:1787844):msg=audit(160992
0994.481:1787844):msg=audit(1609920994.481:1787844):msg=audit(1609920994.481:1787845
):msg=audit(1609920994.481:1787845):msg=audit(1609920994.481:1787845):msg=audit(1609
920994.481:1787845):msg=audit(1609920994.481:1787845):msg=audit(1609920994.481:17878
45):msg=audit(1609920994.481:1787845):msg=audit(1609920994.481:1787846):msg=audit(16
09920994.481:1787846):msg=audit(1609920994.481:1787846):msg=audit(1609920994.481:178
7846):msg=audit(1609920994.481:1787846):msg=audit(1609920994.482:1787847):msg=audit(
1609920994.482:1787847):msg=audit(1609920994.482:1787847):msg=audit(1609920994.482:1
787847):msg=audit(1609920994.482:1787847):msg=audit(1609920994.483:1787848):msg=audi
t(1609920994.483:1787848):msg=audit(1609920994.483:1787848):msg=audit(1609920994.483
:1787848):msg=audit(1609920994.483:1787848):msg=audit(1609920994.484:1787849):msg=au
dit(1609920994.484:1787849):msg=audit(1609921000.636:1787850):msg=audit(1609921000.6
36:1787850):msg=audit(1609921000.636:1787850):msg=audit(1609921008.456:1787851):msg=
audit(1609921008.456:1787851):msg=audit(1609921008.456:1787851):msg=audit(1609921008
.456:1787851):msg=audit(1609921008.456:1787851):msg=audit(1609921008.456:1787851):ms
g=audit(1609920994.484:1787849):msg=audit(1609920994.484:1787849):msg=audit(16099209
94.484:1787849):msg=audit(1609921010.837:1787852):msg=audit(1609921010.837:1787852):
msg=audit(1609921010.837:1787852):msg=audit(1609921010.837:1787852):msg=audit(160992
1010.837:1787853):msg=audit(1609921010.837:1787853):msg=audit(1609921010.837:1787853
):msg=audit(1609921010.837:1787853):msg=audit(1609921010.837:1787853):msg=audit(1609
921010.837:1787853):msg=audit(1609921010.837:1787853):msg=audit(1609921010.838:17878
54):msg=audit(1609921010.838:1787854):msg=audit(1609921010.838:1787854):msg=audit(16
09921010.838:1787854):msg=audit(1609921010.838:1787854):msg=audit(1609921010.839:178
7855):msg=audit(1609921010.839:1787855):msg=audit(1609921010.839:1787855):msg=audit(
1609921010.839:1787855):msg=audit(1609921010.839:1787855):msg=audit(1609921010.840:1
787856):msg=audit(1609921010.840:1787856):msg=audit(1609921010.840:1787856):msg=audi
t(1609921010.840:1787856):msg=audit(1609921010.840:1787856):msg=audit(1609921010.841
:1787857):msg=audit(1609921010.841:1787857):msg=audit(1609921010.841:1787857):msg=au
dit(1609921010.841:1787857):msg=audit(1609921010.841:1787857):


--=-GKbhvLPS8Mn6mgPn0Jy1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Tue, 2021-01-19 at 14:11 -0500, Paul Moore wrote:</div><blockqu=
ote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid=
;padding-left:1ex"><pre>On Tue, Jan 19, 2021 at 3:18 AM Burn Alting &lt;</p=
re><a href=3D"mailto:burn.alting@iinet.net.au"><pre>burn.alting@iinet.net.a=
u</pre></a><pre>&gt; wrote:</pre><blockquote type=3D"cite" style=3D"margin:=
0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>I tend to =
have a rigorous auditing posture (see the rules loaded in </pre><a href=3D"=
https://github.com/linux-audit/audit-userspace/issues/148"><pre>https://git=
hub.com/linux-audit/audit-userspace/issues/148</pre></a><pre>) which is not=
 normal for most. Perhaps, Paul, you have hit the nail on the head by stati=
ng that this 'severe delay' is not that unreasonable given my rules posture=
 and we just need to 'deal with it' in user space.</pre><pre>We still get t=
he event data, I just need to adjust the user space tools to deal with this=
 occurrence.</pre><pre>As for what the system is doing, in my home case it'=
s a Centos 7 VM running a tomcat service which only gets busy every 20 minu=
tes and the other is a HPE Z800 running Centos 8 with 4-5 VM's mostly dorma=
nt. I can put any code in these hosts to assist in 'validating'/testing the=
 delay. Advise and I will run.</pre></blockquote><pre><br></pre><pre>I took=
 a (slightly) closer look at the queuing code just now and the</pre><pre>co=
rner case I suspected doesn't look very promising here.  On failure</pre><p=
re>to send a record to userspace, the record is put back at the front of</p=
re><pre>the queue to preserve ordering so the kernel *should* still emit</p=
re><pre>records in order even when auditd is under pressure, dead, or in th=
e</pre><pre>process of a restart.  Also, in this case the kernel kicks the =
auditd</pre><pre>connection, disconnecting auditd's netlink socket; I imagi=
ne that</pre><pre>would be a notable event on your systems.</pre><pre><br><=
/pre><pre>However, looking at the timestamps in the audit events you posted=
, I</pre><pre>noticed something a little odd.  If I align the timestamps a =
bit</pre><pre>better let's see if it jumps out at you guys ...</pre><pre><b=
r></pre><pre>type=3DXXX msg=3Daudit(1609519900.159:44606): ...</pre><pre>ty=
pe=3DXXX msg=3Daudit(1609519900.161:44607): ...</pre><pre>type=3DXXX msg=3D=
audit(1609519900.163:44608): ...</pre><pre>type=3DXXX msg=3Daudit(160951989=
6.829:44609): ...</pre><pre>type=3DXXX msg=3Daudit(1609519900.170:44610): .=
..</pre><pre><br></pre><pre>Let me guess Burn, you're running NTP/PTP :)  I=
'm not sure how auditd</pre><pre>handles things like this, but it looks lik=
e there was a small negative</pre><pre>time correction between events which=
 caused the odd scenario where</pre><pre>event N+1 actually occurred before=
 event N according to the wall</pre><pre>clock.  In other words, your syste=
m is time traveling ;)</pre></blockquote><div>. </div><div>All systems use =
chrony (current NTP daemon). One is a VM (on top of KVM) and the other a ba=
re metal deployment. Does the above explain my second data set (in the issu=
e)  from a bare metal Centos 8 host?</div><div>Perhaps Lenny's comments bar=
e investigation. Either way, I will offer a patch to the user space code to=
, based on a configuration value, manage correctly such activity.</div><div=
><br></div><div>msg=3Daudit(1609920994.481:1787844):</div><div>msg=3Daudit(=
1609920994.481:1787844):</div><div>msg=3Daudit(1609920994.481:1787844):</di=
v><div>msg=3Daudit(1609920994.481:1787844):</div><div>msg=3Daudit(160992099=
4.481:1787845):</div><div>msg=3Daudit(1609920994.481:1787845):</div><div>ms=
g=3Daudit(1609920994.481:1787845):</div><div>msg=3Daudit(1609920994.481:178=
7845):</div><div>msg=3Daudit(1609920994.481:1787845):</div><div>msg=3Daudit=
(1609920994.481:1787845):</div><div>msg=3Daudit(1609920994.481:1787845):</d=
iv><div>msg=3Daudit(1609920994.481:1787846):</div><div>msg=3Daudit(16099209=
94.481:1787846):</div><div>msg=3Daudit(1609920994.481:1787846):</div><div>m=
sg=3Daudit(1609920994.481:1787846):</div><div>msg=3Daudit(1609920994.481:17=
87846):</div><div>msg=3Daudit(1609920994.482:1787847):</div><div>msg=3Daudi=
t(1609920994.482:1787847):</div><div>msg=3Daudit(1609920994.482:1787847):</=
div><div>msg=3Daudit(1609920994.482:1787847):</div><div>msg=3Daudit(1609920=
994.482:1787847):</div><div>msg=3Daudit(1609920994.483:1787848):</div><div>=
msg=3Daudit(1609920994.483:1787848):</div><div>msg=3Daudit(1609920994.483:1=
787848):</div><div>msg=3Daudit(1609920994.483:1787848):</div><div>msg=3Daud=
it(1609920994.483:1787848):</div><div>msg=3Daudit(1609920994.484:1787849):<=
/div><div>msg=3Daudit(1609920994.484:1787849):</div><div>msg=3Daudit(160992=
1000.636:1787850):</div><div>msg=3Daudit(1609921000.636:1787850):</div><div=
>msg=3Daudit(1609921000.636:1787850):</div><div>msg=3Daudit(1609921008.456:=
1787851):</div><div>msg=3Daudit(1609921008.456:1787851):</div><div>msg=3Dau=
dit(1609921008.456:1787851):</div><div>msg=3Daudit(1609921008.456:1787851):=
</div><div>msg=3Daudit(1609921008.456:1787851):</div><div>msg=3Daudit(16099=
21008.456:1787851):</div><div>msg=3Daudit(1609920994.484:1787849):</div><di=
v>msg=3Daudit(1609920994.484:1787849):</div><div>msg=3Daudit(1609920994.484=
:1787849):</div><div>msg=3Daudit(1609921010.837:1787852):</div><div>msg=3Da=
udit(1609921010.837:1787852):</div><div>msg=3Daudit(1609921010.837:1787852)=
:</div><div>msg=3Daudit(1609921010.837:1787852):</div><div>msg=3Daudit(1609=
921010.837:1787853):</div><div>msg=3Daudit(1609921010.837:1787853):</div><d=
iv>msg=3Daudit(1609921010.837:1787853):</div><div>msg=3Daudit(1609921010.83=
7:1787853):</div><div>msg=3Daudit(1609921010.837:1787853):</div><div>msg=3D=
audit(1609921010.837:1787853):</div><div>msg=3Daudit(1609921010.837:1787853=
):</div><div>msg=3Daudit(1609921010.838:1787854):</div><div>msg=3Daudit(160=
9921010.838:1787854):</div><div>msg=3Daudit(1609921010.838:1787854):</div><=
div>msg=3Daudit(1609921010.838:1787854):</div><div>msg=3Daudit(1609921010.8=
38:1787854):</div><div>msg=3Daudit(1609921010.839:1787855):</div><div>msg=
=3Daudit(1609921010.839:1787855):</div><div>msg=3Daudit(1609921010.839:1787=
855):</div><div>msg=3Daudit(1609921010.839:1787855):</div><div>msg=3Daudit(=
1609921010.839:1787855):</div><div>msg=3Daudit(1609921010.840:1787856):</di=
v><div>msg=3Daudit(1609921010.840:1787856):</div><div>msg=3Daudit(160992101=
0.840:1787856):</div><div>msg=3Daudit(1609921010.840:1787856):</div><div>ms=
g=3Daudit(1609921010.840:1787856):</div><div>msg=3Daudit(1609921010.841:178=
7857):</div><div>msg=3Daudit(1609921010.841:1787857):</div><div>msg=3Daudit=
(1609921010.841:1787857):</div><div>msg=3Daudit(1609921010.841:1787857):</d=
iv><div>msg=3Daudit(1609921010.841:1787857):</div><div><br></div><div></div=
><div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; borde=
r-left:2px #729fcf solid;padding-left:1ex"><pre><br></pre></blockquote></bo=
dy></html>

--=-GKbhvLPS8Mn6mgPn0Jy1--

--===============6426578247450943780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============6426578247450943780==--


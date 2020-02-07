Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 496DF1557F2
	for <lists+linux-audit@lfdr.de>; Fri,  7 Feb 2020 13:44:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581079484;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=yOHV5p9wGksinZnC8G6IG79ie9UVLLsrZeSVH/zOqNs=;
	b=coBFq8SmBBY8XyT2N+vGZZx1fTo8PuI6IfKsAqC0/y5w1TutLB8+xpj2HZ0tRk6nh0N35Z
	DG/dPa271e3meaxeT4tdk5UCgyW3gGLwTW+6I83WWSfUgJgt+Q3lVMuDJLnYRxxCZ+EzpI
	BroOHDoMEaLsq7JhsJr/Y2llo14XOI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-A7QQd_s1PmuvBe1Tx96kFg-1; Fri, 07 Feb 2020 07:44:40 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50F371088382;
	Fri,  7 Feb 2020 12:44:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 174D67FB60;
	Fri,  7 Feb 2020 12:44:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B857C18089CD;
	Fri,  7 Feb 2020 12:44:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017CiKMM000438 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 07:44:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1221B11233A; Fri,  7 Feb 2020 12:44:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DCBAB9767
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 12:44:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E42580387E
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 12:44:18 +0000 (UTC)
IronPort-SDR: NdzlDwZKE4cwNhMIizj/h8jpqDnFpPiRF6EQQ+HmRXqKOhnIHs+3UKmtx+aAUM5wOIMwg95BbT
	BMIyubfCAZOe30qCn7bF2f3iyCqCTGwSej5a5y6goZIGVps0NSf6uFFouyZazvekEIbBWLPCQe
	NnbSVrEsEKQp7G5gqnDV2M9eTAykzcG7eo0usHksybF3DBgXVJTpSdKSA5j1+QWmgY9wGNceIj
	y20b8aELZucjNQ2a6JA7dWJcltGXXdT+rRezNdABQxi64OLEVuKn7VMJn/e+EWKVhcNI0jcQUC
	DgWKIrpnlqvJstMsnfDJ27GI
X-IronPort-AV: E=Sophos;i="5.70,413,1574118000"; d="scan'208,217";a="50637626"
X-MGA-submission: =?us-ascii?q?MDHhq2n44xCulAzKoZzzNsV8sfCtyWSVV800iW?=
	=?us-ascii?q?X8+VtJYQiV87goKARQ+LtLizgVmN+ekcMOPG8+2Xj00qKoCBmua2+hKg?=
	=?us-ascii?q?9vBSWzq4WgNNb+mgcRd7c5TifkQ/uxzBSjxGYNqqrMFA6S8z+EirurAv?=
	=?us-ascii?q?3t?=
Received: from smarthost5.atos.net (smtppost.atos.net [193.56.114.176])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-267-JlHMHZOwMcq-2SEbYS6osw-1; Fri, 07 Feb 2020 07:44:15 -0500
Received: from unknown (HELO DEFTHW99ETUMSX.ww931.my-it-solutions.net)
	([10.86.142.49])
	by smarthost5.atos.net with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	07 Feb 2020 13:44:14 +0100
Received: from DEERLM99EX7MSX.ww931.my-it-solutions.net ([169.254.9.55]) by
	DEFTHW99ETUMSX.ww931.my-it-solutions.net ([10.86.142.49]) with mapi id
	14.03.0468.000; Fri, 7 Feb 2020 13:44:13 +0100
From: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
To: Burn Alting <burn.alting@iinet.net.au>, Steve Grubb <sgrubb@redhat.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Re: ausearch on the fly
Thread-Topic: ausearch on the fly
Thread-Index: AdW3OU/dw1JpOtpPSVSmBrkse/xbnwAKUbQACYqtMEAABbzpAAAEA26y
Date: Fri, 7 Feb 2020 12:44:12 +0000
Message-ID: <uoevvso2qbma3lpo7nmskg99.1581079142127@email.lge.com>
References: <5F4EE10832231F4F921A255C1D9542982304BF@DEERLM99EX7MSX.ww931.my-it-solutions.net>
	<1765069.Uqzcf1Iu7r@x2>
	<5F4EE10832231F4F921A255C1D95429829AF30@DEERLM99EX7MSX.ww931.my-it-solutions.net>,
	<7ad9a4ee6fe595d5688d15a3acee1c3ad1872188.camel@iinet.net.au>
In-Reply-To: <7ad9a4ee6fe595d5688d15a3acee1c3ad1872188.camel@iinet.net.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-MC-Unique: JlHMHZOwMcq-2SEbYS6osw-1
X-MC-Unique: A7QQd_s1PmuvBe1Tx96kFg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============1337296996115723336=="

--===============1337296996115723336==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_uoevvso2qbma3lpo7nmskg991581079142127emaillgecom_"

--_000_uoevvso2qbma3lpo7nmskg991581079142127emaillgecom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi,
I should have been more precise in my question.
I want to run this ausearch on the central log server, not on the original =
server.
Very likely i need to specify the input file in that.
And this input file would need to be rotated outside auditd
Philippe

Envoy=E9 depuis mon mobile Orange

------ Message d'origine------
De: Burn Alting
Date: ven. 7 f=E9vr. 2020 12:49
=C0: MAUPERTUIS, PHILIPPE;Steve Grubb;linux-audit@redhat.com;
Cc:
Objet :Re: ausearch on the fly

Philippe,

On Fri, 2020-02-07 at 08:13 +0000, MAUPERTUIS, PHILIPPE wrote:


On Friday, December 20, 2019 8:33:11 AM EST MAUPERTUIS, PHILIPPE wrote:


We are centralizing  the audit logs with rsyslog.

The SIEM behind the central log server is unable to process the raw logs.

We would like to push the ausearch  result in CSV format in real time or

near real time. Is there a way to have ausearch working from a pipe and

and waiting when no logs are received



I think that I've seen others who setup a cron job and use the checkpointin=
g

feature so that they do not miss anything. You can pipe its output into

logger. You probably also want to cut the first line which has the column

headers.


ausearch --start today --checkpoint /root/last-ausearch .chpt --format csv =
|

tail -n +2 | logger


On a central log server the input file can grow very big and very fast.

Probably logrotate is needed to keep it in check.

What happen to the checkpointing feature when the file is rotated ?

How not to miss the last events from the old file and get the new events fr=
om the new file ?

The above performs a checkpoint on the local machine and then sends it's ou=
tput to the local syslog service via the logger program. Ausearch
is independent of the syslog service. The checkpoint function of ausearch t=
akes into account the audit.log log file roll-over feature built into audit=
d so,
providing your auditd log file rotation is set appropriately, checkpoint wo=
rks no matter how many audit.log files are in the audit log directory.
For information, a 9 file 32MB per log file configuration works well for a =
very heavy processing host where exec's are logged. Further, if the generat=
ion of logs
is such that the checkpoint does miss logs, then the checkpoint documentati=
on shows one how to address this. If this is noted, then include the size o=
f or number
of local log files.



Also, the latest syslog plugin can now do interpretation. I think its in

alpha-9 which dates back to Nov 04, 2019.


It really shouldn't be hard to copy and paste the code from ausearch into t=
he

syslog plugin to log directly in that format. I wonder if anyone else would

find that useful?





--

Linux-audit mailing list

<mailto:Linux-audit@redhat.com>

Linux-audit@redhat.com


<https://www.redhat.com/mailman/listinfo/linux-audit>

https://www.redhat.com/mailman/listinfo/linux-audit



equensWorldline is a registered trade mark and trading name owned by the Wo=
rldline Group through its holding company.
This e-mail and the documents attached are confidential and intended solely=
 for the addressee. If you receive this e-mail in error, you are not author=
ized to copy, disclose, use or retain it. Please notify the sender immediat=
ely and delete this email from your systems. As emails may be intercepted, =
amended or lost, they are not secure. EquensWorldline and the Worldline Gro=
up therefore can accept no liability for any errors or their content. Altho=
ugh equensWorldline and the Worldline Group endeavours to maintain a virus-=
free network, we do not warrant that this transmission is virus-free and ca=
n accept no liability for any damages resulting from any virus transmitted.=
 The risks are deemed to be accepted by everyone who communicates with eque=
nsWorldline and the Worldline Group by email

--_000_uoevvso2qbma3lpo7nmskg991581079142127emaillgecom_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body style=3D"text-align:left; direction:ltr">
<div style=3D"font-size:10pt">
<div dir=3D"auto">Hi,</div>
<div dir=3D"auto">I should have been more precise in my question.</div>
<div dir=3D"auto">I want to run this ausearch on the central log server, no=
t on the original server.&nbsp;</div>
<div dir=3D"auto">Very likely i need to specify the input file in that.</di=
v>
<div dir=3D"auto">And this input file would need to be rotated outside audi=
td</div>
<div dir=3D"auto">Philippe</div>
<div dir=3D"auto"><br>
</div>
<div>
<div dir=3D"auto"><i>Envoy=E9 depuis mon mobile Orange</i></div>
</div>
</div>
<div style=3D"font-size:10pt">
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">------ Message d'origine------</div>
<div dir=3D"auto"><b>De: </b>Burn Alting</div>
<div dir=3D"auto"><b>Date: </b>ven. 7 f=E9vr. 2020 12:49</div>
<div dir=3D"auto"><b>=C0: </b>MAUPERTUIS, PHILIPPE;Steve Grubb;linux-audit@=
redhat.com;</div>
<div dir=3D"auto"><b>Cc: </b></div>
<div dir=3D"auto"><b>Objet :</b>Re: ausearch on the fly</div>
<div dir=3D"auto"><br>
</div>
</div>
<div>
<div>Philippe,</div>
<div><br>
</div>
<div>On Fri, 2020-02-07 at 08:13 &#43;0000, MAUPERTUIS, PHILIPPE wrote:</di=
v>
<blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729f=
cf solid; padding-left:1ex">
<blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729f=
cf solid; padding-left:1ex">
<pre><br></pre>
<pre>On Friday, December 20, 2019 8:33:11 AM EST MAUPERTUIS, PHILIPPE wrote=
:</pre>
<blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729f=
cf solid; padding-left:1ex">
<pre><br></pre>
<pre>We are centralizing  the audit logs with rsyslog.</pre>
<pre>The SIEM behind the central log server is unable to process the raw lo=
gs.</pre>
<pre>We would like to push the ausearch  result in CSV format in real time =
or</pre>
<pre>near real time. Is there a way to have ausearch working from a pipe an=
d</pre>
<pre>and waiting when no logs are received</pre>
</blockquote>
<pre><br></pre>
<pre><br></pre>
<pre>I think that I've seen others who setup a cron job and use the checkpo=
inting</pre>
<pre>feature so that they do not miss anything. You can pipe its output int=
o</pre>
<pre>logger. You probably also want to cut the first line which has the col=
umn</pre>
<pre>headers.</pre>
<pre><br></pre>
<pre>ausearch --start today --checkpoint /root/last-ausearch .chpt --format=
 csv |</pre>
<pre>tail -n &#43;2 | logger</pre>
</blockquote>
<pre><br></pre>
<pre>On a central log server the input file can grow very big and very fast=
.</pre>
<pre>Probably logrotate is needed to keep it in check.</pre>
<pre>What happen to the checkpointing feature when the file is rotated ?</p=
re>
<pre>How not to miss the last events from the old file and get the new even=
ts from the new file ?</pre>
</blockquote>
<div><br>
</div>
<div>The above performs a checkpoint on the local machine and then sends it=
's output to the local syslog service via the logger program. Ausearch</div=
>
<div>is independent of the syslog service. The checkpoint function of ausea=
rch takes into account the audit.log log file roll-over feature built into =
auditd so,</div>
<div>providing your auditd log file rotation is set appropriately, checkpoi=
nt works no matter how many audit.log files are in the audit log directory.=
</div>
<div>For information, a 9 file 32MB per log file configuration works well f=
or a very heavy processing host where exec's are logged. Further, if the ge=
neration of logs</div>
<div>is such that the checkpoint does miss logs, then the checkpoint docume=
ntation shows one how to address this. If this is noted, then include the s=
ize of or number</div>
<div>of local log files. </div>
<blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729f=
cf solid; padding-left:1ex">
<blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729f=
cf solid; padding-left:1ex">
<pre><br></pre>
<pre><br></pre>
<pre>Also, the latest syslog plugin can now do interpretation. I think its =
in</pre>
<pre>alpha-9 which dates back to Nov 04, 2019.</pre>
<pre><br></pre>
<pre>It really shouldn't be hard to copy and paste the code from ausearch i=
nto the</pre>
<pre>syslog plugin to log directly in that format. I wonder if anyone else =
would</pre>
<pre>find that useful?</pre>
<pre><br></pre>
</blockquote>
<pre><br></pre>
<pre><br></pre>
<pre><br></pre>
<pre>--</pre>
<pre>Linux-audit mailing list</pre>
<a href=3D"mailto:Linux-audit@redhat.com">
<pre>Linux-audit@redhat.com</pre>
</a>
<pre><br></pre>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-audit">
<pre>https://www.redhat.com/mailman/listinfo/linux-audit</pre>
</a>
<pre><br></pre>
<pre><br></pre>
</blockquote>
</div>
<p>equensWorldline is a registered trade mark and trading name owned by the=
 Worldline Group through its holding company.<br>
This e-mail and the documents attached are confidential and intended solely=
 for the addressee. If you receive this e-mail in error, you are not author=
ized to copy, disclose, use or retain it. Please notify the sender immediat=
ely and delete this email from your
 systems. As emails may be intercepted, amended or lost, they are not secur=
e. EquensWorldline and the Worldline Group therefore can accept no liabilit=
y for any errors or their content. Although equensWorldline and the Worldli=
ne Group endeavours to maintain
 a virus-free network, we do not warrant that this transmission is virus-fr=
ee and can accept no liability for any damages resulting from any virus tra=
nsmitted. The risks are deemed to be accepted by everyone who communicates =
with equensWorldline and the Worldline
 Group by email<br>
</p>
</body>
</html>

--_000_uoevvso2qbma3lpo7nmskg991581079142127emaillgecom_--

--===============1337296996115723336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============1337296996115723336==--


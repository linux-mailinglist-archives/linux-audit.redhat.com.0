Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 23D65155724
	for <lists+linux-audit@lfdr.de>; Fri,  7 Feb 2020 12:50:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581076199;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=777ZuXfZjsYHRC3E1m666749yecuPicdd3KYDp0jhAc=;
	b=PV/67bsPhppX2Jm4dGn+Wt2QiCv2krYnI70qj+w/E6TbzvLKa7y+FmYJLvSFoGg1Todjcj
	0DEJWu1RFaQ8ftyEKryELdhbWDULbsIWqQE7vlKtE3Y2b3vVsFKEry2gH7LuzBhE4qMern
	Ih8bxFu7XCBVImabKC3PXjZCkP5bz0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-Ts4_AOfvMXe1LN7Lq2iS6g-1; Fri, 07 Feb 2020 06:49:55 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A9DE8010EF;
	Fri,  7 Feb 2020 11:49:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 423A7863AB;
	Fri,  7 Feb 2020 11:49:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B35A2866B9;
	Fri,  7 Feb 2020 11:49:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017BnSF6031407 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 06:49:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C0C5F2166B2A; Fri,  7 Feb 2020 11:49:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCB4B2166B27
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 11:49:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73A8B803ADE
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 11:49:26 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2ACBQA4Tj1e/9vbLXlmHAEBAQEBBwE?=
	=?us-ascii?q?BEQEEBAEBgXuDFVQhEiqEFYkDhhUBghCZVAyBUwgJAQEBAQEBAQEBIAEKCQE?=
	=?us-ascii?q?CAQGEOgQCAoJnOBMCEAEBAQQBAQEBAQUDAW2Ea0wMhWcBAQEDAQEhMxgbCwg?=
	=?us-ascii?q?QFQcOAgInMAYBEoMngkoBAS4Qrj6BMoU6EYJUBoEMgTgGgTiMMoFMP4ERNoJ?=
	=?us-ascii?q?dPoJkAYEfL1eCUYJeBI4RgkaGZ4h3jzYHgj14BIVLj38bmwuOYoEAnDQigVg?=
	=?us-ascii?q?zGh9UgUIYgRJQGA2SEIpnMDCBBgEBjGpfAQE?=
X-IPAS-Result: =?us-ascii?q?A2ACBQA4Tj1e/9vbLXlmHAEBAQEBBwEBEQEEBAEBgXuDF?=
	=?us-ascii?q?VQhEiqEFYkDhhUBghCZVAyBUwgJAQEBAQEBAQEBIAEKCQECAQGEOgQCAoJnO?=
	=?us-ascii?q?BMCEAEBAQQBAQEBAQUDAW2Ea0wMhWcBAQEDAQEhMxgbCwgQFQcOAgInMAYBE?=
	=?us-ascii?q?oMngkoBAS4Qrj6BMoU6EYJUBoEMgTgGgTiMMoFMP4ERNoJdPoJkAYEfL1eCU?=
	=?us-ascii?q?YJeBI4RgkaGZ4h3jzYHgj14BIVLj38bmwuOYoEAnDQigVgzGh9UgUIYgRJQG?=
	=?us-ascii?q?A2SEIpnMDCBBgEBjGpfAQE?=
X-IronPort-AV: E=Sophos;i="5.70,413,1574092800"; 
	d="scan'208,217";a="270983372"
Received: from icp-osb-irony-out2.external.iinet.net.au
	(icp-osb-irony-out2.external.iinet.net.au [203.59.1.155]) by
	relay.mimecast.com with ESMTP id us-mta-38-Gwzwq-zhMa6WoX_1s-S--g-1;
	Fri, 07 Feb 2020 06:49:22 -0500
Received: from ppp121-45-219-219.bras1.cbr2.internode.on.net (HELO
	swtf.swtf.dyndns.org) ([121.45.219.219])
	by icp-osb-irony-out2.iinet.net.au with ESMTP;
	07 Feb 2020 19:49:19 +0800
Message-ID: <7ad9a4ee6fe595d5688d15a3acee1c3ad1872188.camel@iinet.net.au>
Subject: Re: ausearch on the fly
From: Burn Alting <burn.alting@iinet.net.au>
To: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>, Steve
	Grubb <sgrubb@redhat.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
Date: Fri, 07 Feb 2020 22:49:18 +1100
In-Reply-To: <5F4EE10832231F4F921A255C1D95429829AF30@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D9542982304BF@DEERLM99EX7MSX.ww931.my-it-solutions.net>
	<1765069.Uqzcf1Iu7r@x2>
	<5F4EE10832231F4F921A255C1D95429829AF30@DEERLM99EX7MSX.ww931.my-it-solutions.net>
Mime-Version: 1.0
X-MC-Unique: Gwzwq-zhMa6WoX_1s-S--g-1
X-MC-Unique: Ts4_AOfvMXe1LN7Lq2iS6g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0157177692574228274=="

--===============0157177692574228274==
Content-Type: multipart/alternative; boundary="=-ldIilp0Md3+p4f2xBpdO"

--=-ldIilp0Md3+p4f2xBpdO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Philippe,
On Fri, 2020-02-07 at 08:13 +0000, MAUPERTUIS, PHILIPPE wrote:
> > On Friday, December 20, 2019 8:33:11 AM EST MAUPERTUIS, PHILIPPE wrote:
> > > We are centralizing  the audit logs with rsyslog.The SIEM behind the =
central
> > > log server is unable to process the raw logs.We would like to push th=
e
> > > ausearch  result in CSV format in real time ornear real time. Is ther=
e a way
> > > to have ausearch working from a pipe andand waiting when no logs are =
received
> >=20
> > I think that I've seen others who setup a cron job and use the
> > checkpointingfeature so that they do not miss anything. You can pipe it=
s output
> > intologger. You probably also want to cut the first line which has the
> > columnheaders.
> > ausearch --start today --checkpoint /root/last-ausearch .chpt --format =
csv |tail
> > -n +2 | logger
>=20
> On a central log server the input file can grow very big and very fast.Pr=
obably
> logrotate is needed to keep it in check.What happen to the checkpointing =
feature
> when the file is rotated ?How not to miss the last events from the old fi=
le and
> get the new events from the new file ?

The above performs a checkpoint on the local machine and then sends it's ou=
tput to
the local syslog service via the logger program. Ausearchis independent of =
the
syslog service. The checkpoint function of ausearch takes into account the =
audit.log
log file roll-over feature built into auditd so,providing your auditd log f=
ile
rotation is set appropriately, checkpoint works no matter how many audit.lo=
g files
are in the audit log directory.For information, a 9 file 32MB per log file
configuration works well for a very heavy processing host where exec's are =
logged.
Further, if the generation of logsis such that the checkpoint does miss log=
s, then
the checkpoint documentation shows one how to address this. If this is note=
d, then
include the size of or numberof local log files.=20
> > Also, the latest syslog plugin can now do interpretation. I think its i=
nalpha-9
> > which dates back to Nov 04, 2019.
> > It really shouldn't be hard to copy and paste the code from ausearch in=
to
> > thesyslog plugin to log directly in that format. I wonder if anyone els=
e
> > wouldfind that useful?
>=20
>=20
> --Linux-audit mailing listLinux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit
>=20

--=-ldIilp0Md3+p4f2xBpdO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>Philippe,</div><div><br></div><div>On Fri, 2020-02-07 at 08:13 +00=
00, MAUPERTUIS, PHILIPPE wrote:</div><blockquote type=3D"cite" style=3D"mar=
gin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><blockquote=
 type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;pa=
dding-left:1ex"><pre><br></pre><pre>On Friday, December 20, 2019 8:33:11 AM=
 EST MAUPERTUIS, PHILIPPE wrote:</pre><blockquote type=3D"cite" style=3D"ma=
rgin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre><br><=
/pre><pre>We are centralizing  the audit logs with rsyslog.</pre><pre>The S=
IEM behind the central log server is unable to process the raw logs.</pre><=
pre>We would like to push the ausearch  result in CSV format in real time o=
r</pre><pre>near real time. Is there a way to have ausearch working from a =
pipe and</pre><pre>and waiting when no logs are received</pre></blockquote>=
<pre><br></pre><pre><br></pre><pre>I think that I've seen others who setup =
a cron job and use the checkpointing</pre><pre>feature so that they do not =
miss anything. You can pipe its output into</pre><pre>logger. You probably =
also want to cut the first line which has the column</pre><pre>headers.</pr=
e><pre><br></pre><pre>ausearch --start today --checkpoint /root/last-ausear=
ch .chpt --format csv |</pre><pre>tail -n +2 | logger</pre></blockquote><pr=
e><br></pre><pre>On a central log server the input file can grow very big a=
nd very fast.</pre><pre>Probably logrotate is needed to keep it in check.</=
pre><pre>What happen to the checkpointing feature when the file is rotated =
?</pre><pre>How not to miss the last events from the old file and get the n=
ew events from the new file ?</pre></blockquote><div><br></div><div>The abo=
ve performs a checkpoint on the local machine and then sends it's output to=
 the local syslog service via the logger program. Ausearch</div><div>is ind=
ependent of the syslog service. The checkpoint function of ausearch takes i=
nto account the audit.log log file roll-over feature built into auditd so,<=
/div><div>providing your auditd log file rotation is set appropriately, che=
ckpoint works no matter how many audit.log files are in the audit log direc=
tory.</div><div>For information, a 9 file 32MB per log file configuration w=
orks well for a very heavy processing host where exec's are logged. Further=
, if the generation of logs</div><div>is such that the checkpoint does miss=
 logs, then the checkpoint documentation shows one how to address this. If =
this is noted, then include the size of or number</div><div>of local log fi=
les. </div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-lef=
t:2px #729fcf solid;padding-left:1ex"><blockquote type=3D"cite" style=3D"ma=
rgin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre><br><=
/pre><pre><br></pre><pre>Also, the latest syslog plugin can now do interpre=
tation. I think its in</pre><pre>alpha-9 which dates back to Nov 04, 2019.<=
/pre><pre><br></pre><pre>It really shouldn't be hard to copy and paste the =
code from ausearch into the</pre><pre>syslog plugin to log directly in that=
 format. I wonder if anyone else would</pre><pre>find that useful?</pre><pr=
e><br></pre></blockquote><pre><br></pre><pre><br></pre><pre><br></pre><pre>=
--</pre><pre>Linux-audit mailing list</pre><a href=3D"mailto:Linux-audit@re=
dhat.com"><pre>Linux-audit@redhat.com</pre></a><pre><br></pre><a href=3D"ht=
tps://www.redhat.com/mailman/listinfo/linux-audit"><pre>https://www.redhat.=
com/mailman/listinfo/linux-audit</pre></a><pre><br></pre><pre><br></pre></b=
lockquote></body></html>

--=-ldIilp0Md3+p4f2xBpdO--

--===============0157177692574228274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============0157177692574228274==--


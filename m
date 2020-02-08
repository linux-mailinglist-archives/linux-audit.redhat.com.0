Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFA11561F1
	for <lists+linux-audit@lfdr.de>; Sat,  8 Feb 2020 01:40:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581122404;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PcPkJOnQIT95vKMv7BJH0kMp0JH8oYusmyUK+Ewx4Pg=;
	b=DG0H7j4z1hXJeb8gvxFLnlAjMpRpdWrRxQSXCMXgM8E4lfvN5dZPV3oyOuerawetHjDZ3V
	C8PwquJRknt6ml09N1jbhQ1F6nX7TkP3sHHfT3Gm6VzQT8gMvzKJrCELdwmHI4tfLNSsMW
	BVDayz7ZDL+GaCg5bj8ozYgdUSsLasM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-9mq0b_fyN1mG_jzsMpBn9A-1; Fri, 07 Feb 2020 19:40:01 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EE878010EF;
	Sat,  8 Feb 2020 00:39:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E3AF60BEC;
	Sat,  8 Feb 2020 00:39:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 504D718089CD;
	Sat,  8 Feb 2020 00:39:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0180dTNb030977 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 19:39:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C4E29203DE70; Sat,  8 Feb 2020 00:39:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE560205EB04
	for <linux-audit@redhat.com>; Sat,  8 Feb 2020 00:39:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B73EB802064
	for <linux-audit@redhat.com>; Sat,  8 Feb 2020 00:39:27 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AUHwAZAj5e/9vbLXlmHQEBAQkBEQU?=
	=?us-ascii?q?FAYF7AoEjgmUShD+JA4YSAYIQmUEfgVsJAQEBAQEBAQEBNAECAQGEOgQCAoJ?=
	=?us-ascii?q?nOgQNAhABAQEEAQEBAQEFAwFthGtYhWcBBSMzMwsEBBAcDgICVwYBhgMBAS6?=
	=?us-ascii?q?uc4EyhToRglMGgQyBPoE4AYwxgUw/gUeCKDU+hDODKIJeBJBXnxsHgj14BIV?=
	=?us-ascii?q?MkAQbmw+OZJ05CBcqgS4zGh+CFhiBE08YDZx3MIE2AQGNYAEB?=
X-IPAS-Result: =?us-ascii?q?A2AUHwAZAj5e/9vbLXlmHQEBAQkBEQUFAYF7AoEjgmUSh?=
	=?us-ascii?q?D+JA4YSAYIQmUEfgVsJAQEBAQEBAQEBNAECAQGEOgQCAoJnOgQNAhABAQEEA?=
	=?us-ascii?q?QEBAQEFAwFthGtYhWcBBSMzMwsEBBAcDgICVwYBhgMBAS6uc4EyhToRglMGg?=
	=?us-ascii?q?QyBPoE4AYwxgUw/gUeCKDU+hDODKIJeBJBXnxsHgj14BIVMkAQbmw+OZJ05C?=
	=?us-ascii?q?BcqgS4zGh+CFhiBE08YDZx3MIE2AQGNYAEB?=
X-IronPort-AV: E=Sophos;i="5.70,415,1574092800"; 
	d="scan'208,217";a="296309959"
Received: from icp-osb-irony-out5.external.iinet.net.au
	(icp-osb-irony-out5.external.iinet.net.au [203.59.1.221]) by
	relay.mimecast.com with ESMTP id us-mta-278-oQY7SdLCPCqz9LnxLpz1Tg-1;
	Fri, 07 Feb 2020 19:39:24 -0500
Received: from ppp121-45-219-219.bras1.cbr2.internode.on.net (HELO
	swtf.swtf.dyndns.org) ([121.45.219.219])
	by icp-osb-irony-out5.iinet.net.au with ESMTP;
	08 Feb 2020 08:39:20 +0800
Message-ID: <c7f208cb31d6614d01dfa92152b7e86756888fee.camel@iinet.net.au>
Subject: Re: ausearch on the fly
From: Burn Alting <burn.alting@iinet.net.au>
To: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>, Steve
	Grubb <sgrubb@redhat.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
Date: Sat, 08 Feb 2020 11:39:19 +1100
In-Reply-To: <uoevvso2qbma3lpo7nmskg99.1581079142127@email.lge.com>
References: <5F4EE10832231F4F921A255C1D9542982304BF@DEERLM99EX7MSX.ww931.my-it-solutions.net>
	<1765069.Uqzcf1Iu7r@x2>
	<5F4EE10832231F4F921A255C1D95429829AF30@DEERLM99EX7MSX.ww931.my-it-solutions.net>
	,<7ad9a4ee6fe595d5688d15a3acee1c3ad1872188.camel@iinet.net.au>
	<uoevvso2qbma3lpo7nmskg99.1581079142127@email.lge.com>
Mime-Version: 1.0
X-MC-Unique: oQY7SdLCPCqz9LnxLpz1Tg-1
X-MC-Unique: 9mq0b_fyN1mG_jzsMpBn9A-1
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============9157362118173939068=="

--===============9157362118173939068==
Content-Type: multipart/alternative; boundary="=-El/FbgDwRBjo//aVSPCh"

--=-El/FbgDwRBjo//aVSPCh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Phillipe,

To close this off, yes, you will need to investigate making use of the --in=
put
option.  You
may also want to consider having a central syslog directory structure that =
allows
you to simulate the local directory structure (/var/log/audit)
by having a revolving set of audit.log, audit.log.1, etc files and age them=
 off to
your raw archive once you have processed them.

My preference is to enrich the logs via ausearch on the local host as this =
mitigates
a number of risks (lost logs as per this discussion, local uids)
and then send the results to a central log management capability.=20

Regards
Burn

On Fri, 2020-02-07 at 12:44 +0000, MAUPERTUIS, PHILIPPE wrote:
> Hi,
> I should have been more precise in my question.
> I want to run this ausearch on the central log server, not on the origina=
l
> server.=20
> Very likely i need to specify the input file in that.
> And this input file would need to be rotated outside auditd
> Philippe
>=20
>=20
>=20
>=20
> Envoy=C3=A9 depuis mon mobile Orange
>=20
>=20
>=20
>=20
>=20

Snip

--=-El/FbgDwRBjo//aVSPCh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body style=3D"text-align:left; direction:ltr;"><div>Phillipe,</div><div><b=
r></div><div>To close this off, yes, you will need to investigate making us=
e of the --input option.&nbsp; You</div><div>may also want to consider havi=
ng a central syslog directory structure that allows you to simulate the loc=
al directory structure (/var/log/audit)</div><div>by having a revolving set=
 of audit.log, audit.log.1, etc files and age them off to your raw archive =
once you have processed them.</div><div><br></div><div>My preference is to =
enrich the logs via ausearch on the local host as this mitigates a number o=
f risks (lost logs as per this discussion, local uids)</div><div>and then s=
end the results to a central log management capability. </div><div><br></di=
v><div>Regards</div><div>Burn</div><div><br></div><div>On Fri, 2020-02-07 a=
t 12:44 +0000, MAUPERTUIS, PHILIPPE wrote:</div><blockquote type=3D"cite" s=
tyle=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">
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
<div dir=3D"auto"><i>Envoy=C3=A9 depuis mon mobile Orange</i></div>
</div>
</div>
<div style=3D"font-size:10pt">
<div dir=3D"auto"><br></div></div></blockquote><div><br></div><div>Snip</di=
v></body></html>

--=-El/FbgDwRBjo//aVSPCh--

--===============9157362118173939068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============9157362118173939068==--


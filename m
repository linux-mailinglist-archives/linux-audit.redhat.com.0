Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 655462E85B4
	for <lists+linux-audit@lfdr.de>; Fri,  1 Jan 2021 22:26:30 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-6G3e4oOuOh-Q_ox9OKcCow-1; Fri, 01 Jan 2021 16:26:27 -0500
X-MC-Unique: 6G3e4oOuOh-Q_ox9OKcCow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAAC1800D55;
	Fri,  1 Jan 2021 21:26:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF00A6085A;
	Fri,  1 Jan 2021 21:26:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D8874A7C6;
	Fri,  1 Jan 2021 21:26:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 101LPlXu001181 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 1 Jan 2021 16:25:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 983E19D486; Fri,  1 Jan 2021 21:25:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9244A51E1
	for <linux-audit@redhat.com>; Fri,  1 Jan 2021 21:25:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E8C0811E76
	for <linux-audit@redhat.com>; Fri,  1 Jan 2021 21:25:45 +0000 (UTC)
Received: from icp-osb-irony-out2.external.iinet.net.au
	(icp-osb-irony-out2.external.iinet.net.au [203.59.1.155]) by
	relay.mimecast.com with ESMTP id us-mta-417-yiwPbYQKPU6qadWa5VuoDQ-1;
	Fri, 01 Jan 2021 16:25:41 -0500
X-MC-Unique: yiwPbYQKPU6qadWa5VuoDQ-1
X-SMTP-MATCH: 1
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AQEQBske9f/1enWttigRCDRIF8hSB?=
	=?us-ascii?q?xiBOGGIJQg2yWN4FcCwEBAQEBAQEBARwZAQIEAQGERASBdCY4EwIQAQEBBQE?=
	=?us-ascii?q?BAQEBBgMBhl6GHTNGLA4CX4JuS4JWAQEurkGBMoVGE4IdBoENgUKBOI1egU0?=
	=?us-ascii?q?/gUeCNgGIQIJgBIJZd5V+iHObfCwHgnkEgRMFC4ZPk2IiolCGHRiqD4cQgXo?=
	=?us-ascii?q?zGh+CFhiBEE8ZDVaOcAEIAY0uMGcCBgoBAQMJWQEBjT8BAQ?=
X-IPAS-Result: =?us-ascii?q?A2AQEQBske9f/1enWttigRCDRIF8hSBxiBOGGIJQg2yWN?=
	=?us-ascii?q?4FcCwEBAQEBAQEBARwZAQIEAQGERASBdCY4EwIQAQEBBQEBAQEBBgMBhl6GH?=
	=?us-ascii?q?TNGLA4CX4JuS4JWAQEurkGBMoVGE4IdBoENgUKBOI1egU0/gUeCNgGIQIJgB?=
	=?us-ascii?q?IJZd5V+iHObfCwHgnkEgRMFC4ZPk2IiolCGHRiqD4cQgXozGh+CFhiBEE8ZD?=
	=?us-ascii?q?VaOcAEIAY0uMGcCBgoBAQMJWQEBjT8BAQ?=
X-IronPort-AV: E=Sophos;i="5.78,468,1599494400"; 
	d="scan'208,217";a="332656297"
Received: from 219-90-167-87.ip.adam.com.au (HELO swtf.swtf.dyndns.org)
	([219.90.167.87]) by icp-osb-irony-out2.iinet.net.au with ESMTP;
	02 Jan 2021 05:22:34 +0800
Message-ID: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
Subject: Occasional delayed output of events
From: Burn Alting <burn.alting@iinet.net.au>
To: Linux Audit <linux-audit@redhat.com>
Date: Sat, 02 Jan 2021 08:22:33 +1100
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
Content-Type: multipart/mixed; boundary="===============8950353093969438611=="

--===============8950353093969438611==
Content-Type: multipart/alternative; boundary="=-y9qBf5Se0b2aDXmOcn+r"

--=-y9qBf5Se0b2aDXmOcn+r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

All,

Sometimes, events recorded in /var/log/audit/audit.log appear some seconds past co-
located events which results in auparse:au_check_events() marking these events
complete before they are. An example of this can be seen below with the offending
event id 44609.
This has been plaguing me for a year or two and this morning was the first time I
still had access to the raw audit.log files (I monitor a lot of event types and the
log files roll over fairly quickly). 
The example below is from a fully patched Centos 7 but I have also seen this on a
patched Fedora 32.

Has this been seen before? Do we need to re-evaluate how auparse 'completes' an
event (ie 2 seconds is too quick).

type=SYSCALL msg=audit(1609519896.824:44603):
type=EXECVE msg=audit(1609519896.824:44603):
type=CWD msg=audit(1609519896.824:44603):
type=PATH msg=audit(1609519896.824:44603):
type=PATH msg=audit(1609519896.824:44603):
type=PROCTITLE msg=audit(1609519896.824:44603):
type=SYSCALL msg=audit(1609519896.826:44604):
type=EXECVE msg=audit(1609519896.826:44604):
type=CWD msg=audit(1609519896.826:44604):
type=PATH msg=audit(1609519896.826:44604):
type=PATH msg=audit(1609519896.826:44604):
type=PROCTITLE msg=audit(1609519896.826:44604):
type=SYSCALL msg=audit(1609519801.338:44605):
type=EXECVE msg=audit(1609519801.338:44605):
type=CWD msg=audit(1609519801.338:44605):
type=PATH msg=audit(1609519801.338:44605):
type=PATH msg=audit(1609519801.338:44605):
type=PROCTITLE msg=audit(1609519801.338:44605):
type=SYSCALL msg=audit(1609519900.159:44606):
type=EXECVE msg=audit(1609519900.159:44606):
type=CWD msg=audit(1609519900.159:44606):
type=PATH msg=audit(1609519900.159:44606):
type=PATH msg=audit(1609519900.159:44606):
type=PROCTITLE msg=audit(1609519900.159:44606):
type=SYSCALL msg=audit(1609519900.161:44607):
type=EXECVE msg=audit(1609519900.161:44607):
type=CWD msg=audit(1609519900.161:44607):
type=PATH msg=audit(1609519900.161:44607):
type=PATH msg=audit(1609519900.161:44607):
type=PROCTITLE msg=audit(1609519900.161:44607):
type=SYSCALL msg=audit(1609519896.829:44609):
type=EXECVE msg=audit(1609519896.829:44609):
type=CWD msg=audit(1609519896.829:44609):
type=SYSCALL msg=audit(1609519900.163:44608):
type=PATH msg=audit(1609519896.829:44609):
type=EXECVE msg=audit(1609519900.163:44608):
type=CWD msg=audit(1609519900.163:44608):
type=PATH msg=audit(1609519896.829:44609):
type=PROCTITLE msg=audit(1609519896.829:44609):
type=PATH msg=audit(1609519900.163:44608):
type=PATH msg=audit(1609519900.163:44608):
type=PROCTITLE msg=audit(1609519900.163:44608):
type=CRED_DISP msg=audit(1609519900.170:44610):
type=SYSCALL msg=audit(1609519900.170:44611):
type=EXECVE msg=audit(1609519900.170:44611):
type=CWD msg=audit(1609519900.170:44611):
type=PATH msg=audit(1609519900.170:44611):
type=PATH msg=audit(1609519900.170:44611):
type=PROCTITLE msg=audit(1609519900.170:44611):

which results in an ausearch -i output sequence of
----
type=PROCTITLE msg=audit(02/01/21 03:51:36.826:44604)
type=PATH msg=audit(02/01/21 03:51:36.826:44604)
type=PATH msg=audit(02/01/21 03:51:36.826:44604)
type=CWD msg=audit(02/01/21 03:51:36.826:44604)
type=EXECVE msg=audit(02/01/21 03:51:36.826:44604)
type=SYSCALL msg=audit(02/01/21 03:51:36.826:44604)
----
type=CWD msg=audit(02/01/21 03:51:36.829:44609)
type=EXECVE msg=audit(02/01/21 03:51:36.829:44609)
type=SYSCALL msg=audit(02/01/21 03:51:36.829:44609)
----
type=PROCTITLE msg=audit(02/01/21 03:51:36.829:44609)
type=PATH msg=audit(02/01/21 03:51:36.829:44609)
type=PATH msg=audit(02/01/21 03:51:36.829:44609)
----
type=PROCTITLE msg=audit(02/01/21 03:51:40.159:44606)
type=PATH msg=audit(02/01/21 03:51:40.159:44606)
type=PATH msg=audit(02/01/21 03:51:40.159:44606)
type=CWD msg=audit(02/01/21 03:51:40.159:44606)
type=EXECVE msg=audit(02/01/21 03:51:40.159:44606)
type=SYSCALL msg=audit(02/01/21 03:51:40.159:44606)
----
type=PROCTITLE msg=audit(02/01/21 03:51:40.161:44607)
type=PATH msg=audit(02/01/21 03:51:40.161:44607)
type=PATH msg=audit(02/01/21 03:51:40.161:44607)
type=CWD msg=audit(02/01/21 03:51:40.161:44607)
type=EXECVE msg=audit(02/01/21 03:51:40.161:44607)
type=SYSCALL msg=audit(02/01/21 03:51:40.161:44607)
----
type=PROCTITLE msg=audit(02/01/21 03:51:40.163:44608)
type=PATH msg=audit(02/01/21 03:51:40.163:44608)
type=PATH msg=audit(02/01/21 03:51:40.163:44608)
type=CWD msg=audit(02/01/21 03:51:40.163:44608)
type=EXECVE msg=audit(02/01/21 03:51:40.163:44608)
type=SYSCALL msg=audit(02/01/21 03:51:40.163:44608)
----
type=CRED_DISP msg=audit(02/01/21 03:51:40.170:44610)


Regards
Burn

--=-y9qBf5Se0b2aDXmOcn+r
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>All,</div><div><br></div><div>Sometimes, events recorded in /var/l=
og/audit/audit.log appear some seconds past co-located events which results=
 in auparse:au_check_events() marking these events complete before they are=
. An example of this can be seen below with the offending event id 44609.</=
div><div>This has been plaguing me for a year or two and this morning was t=
he first time I still had access to the raw audit.log files (I monitor a lo=
t of event types and the log files roll over fairly quickly). </div><div>Th=
e example below is from a fully patched Centos 7 but I have also seen this =
on a patched Fedora 32.</div><div><br></div><div>Has this been seen before?=
 Do we need to re-evaluate how auparse 'completes' an event (ie 2 seconds i=
s too quick).</div><div><br></div><div>type=3DSYSCALL msg=3Daudit(160951989=
6.824:44603):</div><div>type=3DEXECVE msg=3Daudit(1609519896.824:44603):</d=
iv><div>type=3DCWD msg=3Daudit(1609519896.824:44603):</div><div>type=3DPATH=
 msg=3Daudit(1609519896.824:44603):</div><div>type=3DPATH msg=3Daudit(16095=
19896.824:44603):</div><div>type=3DPROCTITLE msg=3Daudit(1609519896.824:446=
03):</div><div>type=3DSYSCALL msg=3Daudit(1609519896.826:44604):</div><div>=
type=3DEXECVE msg=3Daudit(1609519896.826:44604):</div><div>type=3DCWD msg=
=3Daudit(1609519896.826:44604):</div><div>type=3DPATH msg=3Daudit(160951989=
6.826:44604):</div><div>type=3DPATH msg=3Daudit(1609519896.826:44604):</div=
><div>type=3DPROCTITLE msg=3Daudit(1609519896.826:44604):</div><div>type=3D=
SYSCALL msg=3Daudit(1609519801.338:44605):</div><div>type=3DEXECVE msg=3Dau=
dit(1609519801.338:44605):</div><div>type=3DCWD msg=3Daudit(1609519801.338:=
44605):</div><div>type=3DPATH msg=3Daudit(1609519801.338:44605):</div><div>=
type=3DPATH msg=3Daudit(1609519801.338:44605):</div><div>type=3DPROCTITLE m=
sg=3Daudit(1609519801.338:44605):</div><div>type=3DSYSCALL msg=3Daudit(1609=
519900.159:44606):</div><div>type=3DEXECVE msg=3Daudit(1609519900.159:44606=
):</div><div>type=3DCWD msg=3Daudit(1609519900.159:44606):</div><div>type=
=3DPATH msg=3Daudit(1609519900.159:44606):</div><div>type=3DPATH msg=3Daudi=
t(1609519900.159:44606):</div><div>type=3DPROCTITLE msg=3Daudit(1609519900.=
159:44606):</div><div>type=3DSYSCALL msg=3Daudit(1609519900.161:44607):</di=
v><div>type=3DEXECVE msg=3Daudit(1609519900.161:44607):</div><div>type=3DCW=
D msg=3Daudit(1609519900.161:44607):</div><div>type=3DPATH msg=3Daudit(1609=
519900.161:44607):</div><div>type=3DPATH msg=3Daudit(1609519900.161:44607):=
</div><div>type=3DPROCTITLE msg=3Daudit(1609519900.161:44607):</div><div>ty=
pe=3DSYSCALL msg=3Daudit(1609519896.829:44609):</div><div>type=3DEXECVE msg=
=3Daudit(1609519896.829:44609):</div><div>type=3DCWD msg=3Daudit(1609519896=
.829:44609):</div><div>type=3DSYSCALL msg=3Daudit(1609519900.163:44608):</d=
iv><div>type=3DPATH msg=3Daudit(1609519896.829:44609):</div><div>type=3DEXE=
CVE msg=3Daudit(1609519900.163:44608):</div><div>type=3DCWD msg=3Daudit(160=
9519900.163:44608):</div><div>type=3DPATH msg=3Daudit(1609519896.829:44609)=
:</div><div>type=3DPROCTITLE msg=3Daudit(1609519896.829:44609):</div><div>t=
ype=3DPATH msg=3Daudit(1609519900.163:44608):</div><div>type=3DPATH msg=3Da=
udit(1609519900.163:44608):</div><div>type=3DPROCTITLE msg=3Daudit(16095199=
00.163:44608):</div><div>type=3DCRED_DISP msg=3Daudit(1609519900.170:44610)=
:</div><div>type=3DSYSCALL msg=3Daudit(1609519900.170:44611):</div><div>typ=
e=3DEXECVE msg=3Daudit(1609519900.170:44611):</div><div>type=3DCWD msg=3Dau=
dit(1609519900.170:44611):</div><div>type=3DPATH msg=3Daudit(1609519900.170=
:44611):</div><div>type=3DPATH msg=3Daudit(1609519900.170:44611):</div><div=
>type=3DPROCTITLE msg=3Daudit(1609519900.170:44611):</div><div></div><div><=
br></div><div>which results in an ausearch -i output sequence of</div><div>=
----</div><div>type=3DPROCTITLE msg=3Daudit(02/01/21 03:51:36.826:44604)</d=
iv><div>type=3DPATH msg=3Daudit(02/01/21 03:51:36.826:44604)</div><div>type=
=3DPATH msg=3Daudit(02/01/21 03:51:36.826:44604)</div><div>type=3DCWD msg=
=3Daudit(02/01/21 03:51:36.826:44604)</div><div>type=3DEXECVE msg=3Daudit(0=
2/01/21 03:51:36.826:44604)</div><div>type=3DSYSCALL msg=3Daudit(02/01/21 0=
3:51:36.826:44604)</div><div>----</div><div>type=3DCWD msg=3Daudit(02/01/21=
 03:51:36.829:44609)</div><div>type=3DEXECVE msg=3Daudit(02/01/21 03:51:36.=
829:44609)</div><div>type=3DSYSCALL msg=3Daudit(02/01/21 03:51:36.829:44609=
)</div><div>----</div><div>type=3DPROCTITLE msg=3Daudit(02/01/21 03:51:36.8=
29:44609)</div><div>type=3DPATH msg=3Daudit(02/01/21 03:51:36.829:44609)</d=
iv><div>type=3DPATH msg=3Daudit(02/01/21 03:51:36.829:44609)</div><div>----=
</div><div>type=3DPROCTITLE msg=3Daudit(02/01/21 03:51:40.159:44606)</div><=
div>type=3DPATH msg=3Daudit(02/01/21 03:51:40.159:44606)</div><div>type=3DP=
ATH msg=3Daudit(02/01/21 03:51:40.159:44606)</div><div>type=3DCWD msg=3Daud=
it(02/01/21 03:51:40.159:44606)</div><div>type=3DEXECVE msg=3Daudit(02/01/2=
1 03:51:40.159:44606)</div><div>type=3DSYSCALL msg=3Daudit(02/01/21 03:51:4=
0.159:44606)</div><div>----</div><div>type=3DPROCTITLE msg=3Daudit(02/01/21=
 03:51:40.161:44607)</div><div>type=3DPATH msg=3Daudit(02/01/21 03:51:40.16=
1:44607)</div><div>type=3DPATH msg=3Daudit(02/01/21 03:51:40.161:44607)</di=
v><div>type=3DCWD msg=3Daudit(02/01/21 03:51:40.161:44607)</div><div>type=
=3DEXECVE msg=3Daudit(02/01/21 03:51:40.161:44607)</div><div>type=3DSYSCALL=
 msg=3Daudit(02/01/21 03:51:40.161:44607)</div><div>----</div><div>type=3DP=
ROCTITLE msg=3Daudit(02/01/21 03:51:40.163:44608)</div><div>type=3DPATH msg=
=3Daudit(02/01/21 03:51:40.163:44608)</div><div>type=3DPATH msg=3Daudit(02/=
01/21 03:51:40.163:44608)</div><div>type=3DCWD msg=3Daudit(02/01/21 03:51:4=
0.163:44608)</div><div>type=3DEXECVE msg=3Daudit(02/01/21 03:51:40.163:4460=
8)</div><div>type=3DSYSCALL msg=3Daudit(02/01/21 03:51:40.163:44608)</div><=
div>----</div><div>type=3DCRED_DISP msg=3Daudit(02/01/21 03:51:40.170:44610=
)</div><div><br></div><div><br></div><div>Regards</div><div>Burn</div><div>=
</div></body></html>

--=-y9qBf5Se0b2aDXmOcn+r--

--===============8950353093969438611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============8950353093969438611==--


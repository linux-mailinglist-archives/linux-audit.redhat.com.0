Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 824863018C2
	for <lists+linux-audit@lfdr.de>; Sat, 23 Jan 2021 23:56:58 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-elTFsbGiPZ-LVv0YIv05aw-1; Sat, 23 Jan 2021 17:56:54 -0500
X-MC-Unique: elTFsbGiPZ-LVv0YIv05aw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9621B806663;
	Sat, 23 Jan 2021 22:56:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8B551002391;
	Sat, 23 Jan 2021 22:56:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4083F4A7C6;
	Sat, 23 Jan 2021 22:56:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10NMu1q0006773 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 23 Jan 2021 17:56:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 047692166B2F; Sat, 23 Jan 2021 22:56:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F34752166B27
	for <linux-audit@redhat.com>; Sat, 23 Jan 2021 22:55:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 575FC858EEC
	for <linux-audit@redhat.com>; Sat, 23 Jan 2021 22:55:57 +0000 (UTC)
Received: from icp-osb-irony-out6.external.iinet.net.au
	(icp-osb-irony-out6.external.iinet.net.au [203.59.1.106]) by
	relay.mimecast.com with ESMTP id us-mta-510-BioiZFX2OzCQiIbMXKOUng-1;
	Sat, 23 Jan 2021 17:55:53 -0500
X-MC-Unique: BioiZFX2OzCQiIbMXKOUng-1
X-SMTP-MATCH: 1
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DYBgAaqAxg/3zSRWpiHAEBAQEBAQc?=
	=?us-ascii?q?BARIBAQQEAQFHgUiBI4JVYoRAiQSGPoIWAziDbINKkneBXAsBAQEBAQEBAQE?=
	=?us-ascii?q?1AQIEAQGERAQCAoF5JjgTAhABAQEFAQEBAQEGAwGGXoVzAQEBAQIBIzMjBQs?=
	=?us-ascii?q?LBAQGChwOAgJXBhODJoJWAQEPH7IgdoEyhUcTgh8GgQ2BRIE4hnsBhkI1gU0?=
	=?us-ascii?q?/gUeCYz6HV4JgBII+BoJ+FRFaApMmiH6Kc5ETLAeCeoEYBQuGUZN2IqJ4hiU?=
	=?us-ascii?q?YsU2BejMaH4IWGIEPUBkNnH4wMDcCBgoBAQMJWQEBizoBAQ?=
X-IPAS-Result: =?us-ascii?q?A2DYBgAaqAxg/3zSRWpiHAEBAQEBAQcBARIBAQQEAQFHg?=
	=?us-ascii?q?UiBI4JVYoRAiQSGPoIWAziDbINKkneBXAsBAQEBAQEBAQE1AQIEAQGERAQCA?=
	=?us-ascii?q?oF5JjgTAhABAQEFAQEBAQEGAwGGXoVzAQEBAQIBIzMjBQsLBAQGChwOAgJXB?=
	=?us-ascii?q?hODJoJWAQEPH7IgdoEyhUcTgh8GgQ2BRIE4hnsBhkI1gU0/gUeCYz6HV4JgB?=
	=?us-ascii?q?II+BoJ+FRFaApMmiH6Kc5ETLAeCeoEYBQuGUZN2IqJ4hiUYsU2BejMaH4IWG?=
	=?us-ascii?q?IEPUBkNnH4wMDcCBgoBAQMJWQEBizoBAQ?=
X-IronPort-AV: E=Sophos;i="5.79,370,1602518400"; 
	d="scan'208,217";a="287200281"
Received: from 106-69-210-124.dyn.iinet.net.au (HELO swtf.swtf.dyndns.org)
	([106.69.210.124]) by icp-osb-irony-out6.iinet.net.au with ESMTP;
	24 Jan 2021 06:55:45 +0800
Message-ID: <6484d9c52b66405ecbe76096fd5e896e5626b216.camel@iinet.net.au>
Subject: Re: Occasional delayed output of events
From: Burn Alting <burn.alting@iinet.net.au>
To: Steve Grubb <sgrubb@redhat.com>
Date: Sun, 24 Jan 2021 09:55:44 +1100
In-Reply-To: <CAHC9VhT9N6Ztpt3pwE0CMaHyKrwoOWLZuB3vTnq_mpxnkgvfPQ@mail.gmail.com>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<9fd0d1b4585214eb3ed8db6da066b571563f19bc.camel@iinet.net.au>
	<CAHC9VhQzr94BdBY3voNEMxzBPM-KS3h1V=epCMMsknfu6Q5vag@mail.gmail.com>
	<805552026.0ifERbkFSE@x2>
	<ebcdc0bc829e126c9fb9747b2457c5211527c8b1.camel@iinet.net.au>
	<CAHC9VhT9N6Ztpt3pwE0CMaHyKrwoOWLZuB3vTnq_mpxnkgvfPQ@mail.gmail.com>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0038870022161255856=="

--===============0038870022161255856==
Content-Type: multipart/alternative; boundary="=-/gQVGpP18u+VmppAEHFz"

--=-/gQVGpP18u+VmppAEHFz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-01-20 at 17:50 -0500, Paul Moore wrote:
> On Wed, Jan 20, 2021 at 1:38 AM Burn Alting <burn.alting@iinet.net.au> wrote:
> > All,
> > How is the following for a way forward.
> > a. I will author a patch to the user space code to correctly parse this
> > condition and submit it on the weekend. It will be via a new configuration item
> > to auditd.conf just in case placing a fixed extended timeout (15-20 secs)
> > affects memory usage for users of the auparse library. This solves the initial
> > problem of ausearch/auparse failing to parse generated audit.b. I am happy to
> > instrument what ever is recommended on my hosts at home (vm's and bare metal) to
> > provide more information, should we want to 'explain' the occurrence, given I
> > see this every week or two and report back.
> 
> Seems reasonable to me.
Steve,
I can implement the 'end_of_event_timeout' change either as
i. a command line argument to ausearch/aureport (say --eoetmo secs) and a new pair
of library functions within the  auparse() stable (say auparse_set_eoe_timeout() and
auparse_get_eoe_timeout())
or
ii. a configuration item in /etc/audit/auditd.conf, or


Which is your preference? Mine is i. as this is a user space processing change, not
a demon change.



--=-/gQVGpP18u+VmppAEHFz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Wed, 2021-01-20 at 17:50 -0500, Paul Moore wrote:</div><blockqu=
ote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid=
;padding-left:1ex"><pre>On Wed, Jan 20, 2021 at 1:38 AM Burn Alting &lt;</p=
re><a href=3D"mailto:burn.alting@iinet.net.au"><pre>burn.alting@iinet.net.a=
u</pre></a><pre>&gt; wrote:</pre><blockquote type=3D"cite" style=3D"margin:=
0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>All,</pre>=
<pre><br></pre><pre>How is the following for a way forward.</pre><pre><br><=
/pre><pre>a. I will author a patch to the user space code to correctly pars=
e this condition and submit it on the weekend. It will be via a new configu=
ration item to auditd.conf just in case placing a fixed extended timeout (1=
5-20 secs) affects memory usage for users of the auparse library. This solv=
es the initial problem of ausearch/auparse failing to parse generated audit=
.</pre><pre>b. I am happy to instrument what ever is recommended on my host=
s at home (vm's and bare metal) to provide more information, should we want=
 to 'explain' the occurrence, given I see this every week or two and report=
 back.</pre></blockquote><pre><br></pre><pre>Seems reasonable to me.</pre><=
pre><br></pre></blockquote><pre>Steve,</pre><pre><br></pre><pre><div style=
=3D"font-family: Cantarell; font-size: 12px;">I can implement the 'end_of_e=
vent_timeout' change either as</div><div style=3D"font-family: Cantarell; f=
ont-size: 12px;"><br></div><div style=3D"font-family: Cantarell; font-size:=
 12px;">i. a command line argument to ausearch/aureport (say --eoetmo secs)=
 and a new pair of library functions within the  auparse() stable (say aupa=
rse_set_eoe_timeout() and auparse_get_eoe_timeout())</div><div style=3D"fon=
t-family: Cantarell; font-size: 12px;">or</div><div style=3D"font-family: C=
antarell; font-size: 12px;"><div>ii. a configuration item in /etc/audit/aud=
itd.conf, or</div><div><br></div></div><div style=3D"font-family: Cantarell=
; font-size: 12px;">Which is your preference? Mine is i. as this is a user =
space processing change, not a demon change.</div><div style=3D"font-family=
: Cantarell; font-size: 12px;"><br></div></pre></body></html>

--=-/gQVGpP18u+VmppAEHFz--

--===============0038870022161255856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============0038870022161255856==--


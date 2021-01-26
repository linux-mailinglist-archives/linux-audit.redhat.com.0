Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DEC253030EC
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 01:12:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-tt7dPeD-O2q0_Xchmp2CpA-1; Mon, 25 Jan 2021 19:12:36 -0500
X-MC-Unique: tt7dPeD-O2q0_Xchmp2CpA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27A76802B47;
	Tue, 26 Jan 2021 00:12:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78E4260C47;
	Tue, 26 Jan 2021 00:12:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A4E84A7C6;
	Tue, 26 Jan 2021 00:12:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10Q0C5Eq013140 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 19:12:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 641367D4E3; Tue, 26 Jan 2021 00:12:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E32A7C4E
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 00:12:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EBB582DFE1
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 00:12:03 +0000 (UTC)
Received: from icp-osb-irony-out8.external.iinet.net.au
	(icp-osb-irony-out8.external.iinet.net.au [203.59.1.225]) by
	relay.mimecast.com with ESMTP id us-mta-407-5gh0zg5LNBGtWfueyvqyDw-1;
	Mon, 25 Jan 2021 19:11:57 -0500
X-MC-Unique: 5gh0zg5LNBGtWfueyvqyDw-1
X-SMTP-MATCH: 1
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DLBgDnXQ9g/3zSRWpiHAEBAQEBAQc?=
	=?us-ascii?q?BARIBAQQEAQFHgUiDeIUiiQSGP4IWAziDbJZBgVwLAQEBAQEBAQEBNQECBAE?=
	=?us-ascii?q?BhEQEAgKBeSY4EwIQAQEBBQEBAQEBBgMBhl6FdAEFIzMjEAsEBAYKHA4CAlc?=
	=?us-ascii?q?GgzmCVgEBLrJPgTKFRxOCJAaBDYFEgTiGewGGQjWBTT+BR4JjPodXgmAEgj4?=
	=?us-ascii?q?GgV2BIRUEDRlBApAsgnqIfopzkRMsB4J6gRgFC4ZRk3YioniGJRixTYF6Mxo?=
	=?us-ascii?q?fghYYgRBPGQ2cfjBnAgYKAQEDCVkBAYs6AQE?=
X-IPAS-Result: =?us-ascii?q?A2DLBgDnXQ9g/3zSRWpiHAEBAQEBAQcBARIBAQQEAQFHg?=
	=?us-ascii?q?UiDeIUiiQSGP4IWAziDbJZBgVwLAQEBAQEBAQEBNQECBAEBhEQEAgKBeSY4E?=
	=?us-ascii?q?wIQAQEBBQEBAQEBBgMBhl6FdAEFIzMjEAsEBAYKHA4CAlcGgzmCVgEBLrJPg?=
	=?us-ascii?q?TKFRxOCJAaBDYFEgTiGewGGQjWBTT+BR4JjPodXgmAEgj4GgV2BIRUEDRlBA?=
	=?us-ascii?q?pAsgnqIfopzkRMsB4J6gRgFC4ZRk3YioniGJRixTYF6MxofghYYgRBPGQ2cf?=
	=?us-ascii?q?jBnAgYKAQEDCVkBAYs6AQE?=
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; 
	d="scan'208,217";a="344782267"
Received: from 106-69-210-124.dyn.iinet.net.au (HELO swtf.swtf.dyndns.org)
	([106.69.210.124]) by icp-osb-irony-out8.iinet.net.au with ESMTP;
	26 Jan 2021 08:11:48 +0800
Message-ID: <702bbf002465236ec84ff4f90b9e159ccc3f327d.camel@iinet.net.au>
Subject: Re: Occasional delayed output of events
From: Burn Alting <burn.alting@iinet.net.au>
To: Steve Grubb <sgrubb@redhat.com>
Date: Tue, 26 Jan 2021 11:11:45 +1100
In-Reply-To: <11685937.O9o76ZdvQC@x2>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<CAHC9VhT9N6Ztpt3pwE0CMaHyKrwoOWLZuB3vTnq_mpxnkgvfPQ@mail.gmail.com>
	<6484d9c52b66405ecbe76096fd5e896e5626b216.camel@iinet.net.au>
	<11685937.O9o76ZdvQC@x2>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============2469345156917520552=="

--===============2469345156917520552==
Content-Type: multipart/alternative; boundary="=-11QS7PlRodL4IsKkLriq"

--=-11QS7PlRodL4IsKkLriq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-01-25 at 18:53 -0500, Steve Grubb wrote:
> On Saturday, January 23, 2021 5:55:44 PM EST Burn Alting wrote:
> > > > How is the following for a way forward.
> > > > a. I will author a patch to the user space code to correctly parse this
> > > > condition and submit it on the weekend. It will be via a new
> > > > configuration item to auditd.conf just in case placing a fixed
> > > > extended timeout (15-20 secs) affects memory usage for users of the
> > > > auparse library. This solves the initial problem of ausearch/auparse
> > > > failing to parse generated audit.b. I am happy to instrument what ever
> > > > is recommended on my hosts at home (vm's and bare metal) to provide
> > > > more information, should we want to 'explain' the occurrence, given I
> > > > see this every week or two and report back.
> > > 
> > > Seems reasonable to me.
> > 
> > I can implement the 'end_of_event_timeout' change either as
> > i. a command line argument to ausearch/aureport (say --eoetmo secs) and a
> > new pair of library functions within the  auparse() stable (say
> > auparse_set_eoe_timeout() and auparse_get_eoe_timeout())
> > or
> > ii. a configuration item in /etc/audit/auditd.conf, or
> > 
> > 
> > Which is your preference? Mine is i. as this is a user space processing
> > change, not a demon change.
> 
> To be honest, I'm not entirely sure what we're seeing. I run some tests today 
> on my system. It's seeing issues also. I'd still like to treat the root cause 
> of this. But we do need to change the default. That I what I'm trying to 
> figure out.
> 
> Back to your question, I'm wondering if we should do both? A changeable 
> default in auditd.conf and an override on the command line.

So far, all items in /etc/audit/auditd.conf appear to only affect the daemon. Is
this the right location to start adding non-daemon configuration items? (I accept
there is no other place).

Happy to do both, if required.

> -Steve
> 
> 

--=-11QS7PlRodL4IsKkLriq
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Mon, 2021-01-25 at 18:53 -0500, Steve Grubb wrote:</div><blockq=
uote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf soli=
d;padding-left:1ex"><pre>On Saturday, January 23, 2021 5:55:44 PM EST Burn =
Alting wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bo=
rder-left:2px #729fcf solid;padding-left:1ex"><blockquote type=3D"cite" sty=
le=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><b=
lockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf=
 solid;padding-left:1ex"><pre>How is the following for a way forward.</pre>=
<pre>a. I will author a patch to the user space code to correctly parse thi=
s</pre><pre>condition and submit it on the weekend. It will be via a new</p=
re><pre>configuration item to auditd.conf just in case placing a fixed</pre=
><pre>extended timeout (15-20 secs) affects memory usage for users of the</=
pre><pre>auparse library. This solves the initial problem of ausearch/aupar=
se</pre><pre>failing to parse generated audit.b. I am happy to instrument w=
hat ever</pre><pre>is recommended on my hosts at home (vm's and bare metal)=
 to provide</pre><pre>more information, should we want to 'explain' the occ=
urrence, given I</pre><pre>see this every week or two and report back.</pre=
></blockquote><pre><br></pre><pre>Seems reasonable to me.</pre></blockquote=
><pre><br></pre><pre>I can implement the 'end_of_event_timeout' change eith=
er as</pre><pre>i. a command line argument to ausearch/aureport (say --eoet=
mo secs) and a</pre><pre>new pair of library functions within the  auparse(=
) stable (say</pre><pre>auparse_set_eoe_timeout() and auparse_get_eoe_timeo=
ut())</pre><pre>or</pre><pre>ii. a configuration item in /etc/audit/auditd.=
conf, or</pre><pre><br></pre><pre><br></pre><pre>Which is your preference? =
Mine is i. as this is a user space processing</pre><pre>change, not a demon=
 change.</pre></blockquote><pre><br></pre><pre>To be honest, I'm not entire=
ly sure what we're seeing. I run some tests today </pre><pre>on my system. =
It's seeing issues also. I'd still like to treat the root cause </pre><pre>=
of this. But we do need to change the default. That I what I'm trying to </=
pre><pre>figure out.</pre><pre><br></pre><pre>Back to your question, I'm wo=
ndering if we should do both? A changeable </pre><pre>default in auditd.con=
f and an override on the command line.</pre></blockquote><div><br></div><di=
v>So far, all items in /etc/audit/auditd.conf appear to only affect the dae=
mon. Is this the right location to start adding non-daemon configuration it=
ems? (I accept there is no other place).</div><div><br></div><div>Happy to =
do both, if required.</div><div><br></div><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre=
>-Steve</pre><pre><br></pre><pre><br></pre></blockquote></body></html>

--=-11QS7PlRodL4IsKkLriq--

--===============2469345156917520552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============2469345156917520552==--


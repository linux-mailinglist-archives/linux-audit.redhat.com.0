Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CACE8303C53
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 13:00:10 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-FIH2Fj7ZP7mJn8aVR8UbSA-1; Tue, 26 Jan 2021 07:00:07 -0500
X-MC-Unique: FIH2Fj7ZP7mJn8aVR8UbSA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15C0F801AB4;
	Tue, 26 Jan 2021 12:00:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27E0A5C26D;
	Tue, 26 Jan 2021 12:00:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF67B180954D;
	Tue, 26 Jan 2021 11:59:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QBrjmF022530 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 06:53:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 78AC4110F739; Tue, 26 Jan 2021 11:53:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7409F110F738
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 11:53:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 059671875049
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 11:53:42 +0000 (UTC)
Received: from icp-osb-irony-out3.external.iinet.net.au
	(icp-osb-irony-out3.external.iinet.net.au [203.59.1.153]) by
	relay.mimecast.com with ESMTP id us-mta-225-RJr167-jNh6aymD6cmqLBQ-1;
	Tue, 26 Jan 2021 06:53:36 -0500
X-MC-Unique: RJr167-jNh6aymD6cmqLBQ-1
X-SMTP-MATCH: 1
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DiBgCyARBg/3zSRWpiHAEBAQEBAQc?=
	=?us-ascii?q?BARIBAQQEAQFHgUiDdASFIokEhj2CFgM4g2yWQYFcCwEBAQEBAQEBATUBAgQ?=
	=?us-ascii?q?BAYREBAICgXkmOBMCEAEBAQUBAQEBAQYDAYZehXQBBSMzIxALCAYKHA4CAlc?=
	=?us-ascii?q?GLoMLglYBAS6yUoEyhUcTgiMGgQ2BRIE4hnsBhkI1gU0/gUeCYz6ECINPgmA?=
	=?us-ascii?q?Egj4GgQ9OgSEVBA0CWAKQLIJ6iH6Kc5ETLAeCeoEYBQuGUZN2IoMrkBqPM4Y?=
	=?us-ascii?q?lGKpphmSBejMaH4IWGIEQTxkNnH4wZwIGCgEBAwlZAQGLOgEB?=
X-IPAS-Result: =?us-ascii?q?A2DiBgCyARBg/3zSRWpiHAEBAQEBAQcBARIBAQQEAQFHg?=
	=?us-ascii?q?UiDdASFIokEhj2CFgM4g2yWQYFcCwEBAQEBAQEBATUBAgQBAYREBAICgXkmO?=
	=?us-ascii?q?BMCEAEBAQUBAQEBAQYDAYZehXQBBSMzIxALCAYKHA4CAlcGLoMLglYBAS6yU?=
	=?us-ascii?q?oEyhUcTgiMGgQ2BRIE4hnsBhkI1gU0/gUeCYz6ECINPgmAEgj4GgQ9OgSEVB?=
	=?us-ascii?q?A0CWAKQLIJ6iH6Kc5ETLAeCeoEYBQuGUZN2IoMrkBqPM4YlGKpphmSBejMaH?=
	=?us-ascii?q?4IWGIEQTxkNnH4wZwIGCgEBAwlZAQGLOgEB?=
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; 
	d="scan'208,217";a="307857507"
Received: from 106-69-210-124.dyn.iinet.net.au (HELO swtf.swtf.dyndns.org)
	([106.69.210.124]) by icp-osb-irony-out3.iinet.net.au with ESMTP;
	26 Jan 2021 19:53:32 +0800
Message-ID: <c878d2aa65ba99579c800a67c54dccea24b9b03d.camel@iinet.net.au>
Subject: Re: Occasional delayed output of events
From: Burn Alting <burn.alting@iinet.net.au>
To: Steve Grubb <sgrubb@redhat.com>
Date: Tue, 26 Jan 2021 22:53:31 +1100
In-Reply-To: <01a61bf10b409134ec57c2d419a33623f16010a9.camel@iinet.net.au>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<11685937.O9o76ZdvQC@x2>
	<702bbf002465236ec84ff4f90b9e159ccc3f327d.camel@iinet.net.au>
	<3094935.aeNJFYEL58@x2>
	<01a61bf10b409134ec57c2d419a33623f16010a9.camel@iinet.net.au>
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
Content-Type: multipart/mixed; boundary="===============8019951481000652889=="

--===============8019951481000652889==
Content-Type: multipart/alternative; boundary="=-lJdnFKNg4TS1kMSotyIV"

--=-lJdnFKNg4TS1kMSotyIV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-01-26 at 11:29 +1100, Burn Alting wrote:
> On Mon, 2021-01-25 at 19:20 -0500, Steve Grubb wrote:
> > On Monday, January 25, 2021 7:11:45 PM EST Burn Alting wrote:
> > > On Mon, 2021-01-25 at 18:53 -0500, Steve Grubb wrote:
> > > > On Saturday, January 23, 2021 5:55:44 PM EST Burn Alting wrote:
> > > > > > > How is the following for a way forward.a. I will author a patch to the
> > > > > > > user space code to correctly parsethiscondition and submit it on the
> > > > > > > weekend. It will be via a newconfiguration item to auditd.conf just in
> > > > > > > case placing a fixedextended timeout (15-20 secs) affects memory usage
> > > > > > > for users of theauparse library. This solves the initial problem
> > > > > > > ofausearch/auparsefailing to parse generated audit.b. I am happy to
> > > > > > > instrument whateveris recommended on my hosts at home (vm's and bare
> > > > > > > metal) to providemore information, should we want to 'explain' the
> > > > > > > occurrence, givenIsee this every week or two and report back.
> > > > > > 
> > > > > > Seems reasonable to me.
> > > > > 
> > > > > I can implement the 'end_of_event_timeout' change either asi. a command
> > > > > line argument to ausearch/aureport (say --eoetmo secs) andanew pair of
> > > > > library functions within the  auparse() stable
> > > > > (sayauparse_set_eoe_timeout() and auparse_get_eoe_timeout())orii. a
> > > > > configuration item in /etc/audit/auditd.conf, or
> > > > > 
> > > > > Which is your preference? Mine is i. as this is a user space
> > > > > processingchange, not a demon change.
> > > > 
> > > > To be honest, I'm not entirely sure what we're seeing. I run some teststoday
> > > > on my system. It's seeing issues also. I'd still like to treat theroot cause
> > > > of this. But we do need to change the default. That I whatI'm trying to
> > > > figure out.
> > > > Back to your question, I'm wondering if we should do both? A
> > > > changeabledefault in auditd.conf and an override on the command line.
> > > 
> > > So far, all items in /etc/audit/auditd.conf appear to only affect thedaemon.
> > > Is this the right location to start adding non-daemonconfiguration items? (I
> > > accept there is no other place).
> > 
> > ausearch/report/auparse all read the auditd.conf to find the canonical location
> > for where the logs are supposed to be. So, they already read this file. I'd
> > rather keep it there than make yet another config. The only drawback it that it
> > might again confuse people that auditd really doesn't do anything with the
> > records but just some light processing.
> 
> OK. I will put it in /etc/audit/auditd.conf

One question with this solution. If the user does not have read permission to
/etc/audit/auditd.conf, then any change cannot take effect. The default mode for
this file is 640 to root, so a non-root user could never change the timeout.

Should I also add
- a command line argument to ausearch/aureport (say --eoetmo secs) and,
- a pair of new auparse() functions - auparse_set_eoe_timeout() and
auparse_get_eoe_timeout()
so that non root users can make use of the new configuration item.

Also, do you want the default timeout to be 2 seconds or should I make it higher.



--=-lJdnFKNg4TS1kMSotyIV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Tue, 2021-01-26 at 11:29 +1100, Burn Alting wrote:</div><blockq=
uote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf soli=
d;padding-left:1ex"><div>On Mon, 2021-01-25 at 19:20 -0500, Steve Grubb wro=
te:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:=
2px #729fcf solid;padding-left:1ex"><pre>On Monday, January 25, 2021 7:11:4=
5 PM EST Burn Alting wrote:</pre><blockquote type=3D"cite" style=3D"margin:=
0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>On Mon, 20=
21-01-25 at 18:53 -0500, Steve Grubb wrote:</pre><blockquote type=3D"cite" =
style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"=
><pre>On Saturday, January 23, 2021 5:55:44 PM EST Burn Alting wrote:</pre>=
<blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729f=
cf solid;padding-left:1ex"><blockquote type=3D"cite" style=3D"margin:0 0 0 =
.8ex; border-left:2px #729fcf solid;padding-left:1ex"><blockquote type=3D"c=
ite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left=
:1ex"><pre>How is the following for a way forward.</pre><pre>a. I will auth=
or a patch to the user space code to correctly parse</pre><pre>this</pre><p=
re>condition and submit it on the weekend. It will be via a new</pre><pre>c=
onfiguration item to auditd.conf just in case placing a fixed</pre><pre>ext=
ended timeout (15-20 secs) affects memory usage for users of the</pre><pre>=
auparse library. This solves the initial problem of</pre><pre>ausearch/aupa=
rse</pre><pre>failing to parse generated audit.b. I am happy to instrument =
what</pre><pre>ever</pre><pre>is recommended on my hosts at home (vm's and =
bare metal) to provide</pre><pre>more information, should we want to 'expla=
in' the occurrence, given</pre><pre>I</pre><pre>see this every week or two =
and report back.</pre></blockquote><br><pre>Seems reasonable to me.</pre></=
blockquote><br><pre>I can implement the 'end_of_event_timeout' change eithe=
r as</pre><pre>i. a command line argument to ausearch/aureport (say --eoetm=
o secs) and</pre><pre>a</pre><pre>new pair of library functions within the =
 auparse() stable (say</pre><pre>auparse_set_eoe_timeout() and auparse_get_=
eoe_timeout())</pre><pre>or</pre><pre>ii. a configuration item in /etc/audi=
t/auditd.conf, or</pre><br><br><pre>Which is your preference? Mine is i. as=
 this is a user space processing</pre><pre>change, not a demon change.</pre=
></blockquote><br><pre>To be honest, I'm not entirely sure what we're seein=
g. I run some tests</pre><pre>today on my system. It's seeing issues also. =
I'd still like to treat the</pre><pre>root cause of this. But we do need to=
 change the default. That I what</pre><pre>I'm trying to figure out.</pre><=
br><pre>Back to your question, I'm wondering if we should do both? A change=
able</pre><pre>default in auditd.conf and an override on the command line.<=
/pre></blockquote><br><pre>So far, all items in /etc/audit/auditd.conf appe=
ar to only affect the</pre><pre>daemon. Is this the right location to start=
 adding non-daemon</pre><pre>configuration items? (I accept there is no oth=
er place).</pre></blockquote><br><pre>ausearch/report/auparse all read the =
auditd.conf to find the canonical </pre><pre>location for where the logs ar=
e supposed to be. So, they already read this </pre><pre>file. I'd rather ke=
ep it there than make yet another config. The only drawback </pre><pre>it t=
hat it might again confuse people that auditd really doesn't do anything </=
pre><pre>with the records but just some light processing.</pre></blockquote=
><br><pre>OK. I will put it in /etc/audit/auditd.conf</pre></blockquote><di=
v><br></div><div>One question with this solution. If the user does not have=
 read permission to /etc/audit/auditd.conf, then any change cannot take eff=
ect. The default mode for this file is 640 to root, so a non-root user coul=
d never change the timeout.</div><div><br></div><div>Should I also add</div=
><div>- a command line argument to ausearch/aureport (say --eoetmo secs) an=
d,</div><div>- a pair of new auparse() functions - auparse_set_eoe_timeout(=
) and auparse_get_eoe_timeout()</div><div>so that non root users can make u=
se of the new configuration item.</div><div><br></div><div>Also, do you wan=
t the default timeout to be 2 seconds or should I make it higher.</div><div=
><br></div></body></html>

--=-lJdnFKNg4TS1kMSotyIV--

--===============8019951481000652889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============8019951481000652889==--


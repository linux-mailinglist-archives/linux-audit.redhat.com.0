Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3DF3030F8
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 01:31:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-YpG0FA_5PI2AlzTBFopKSg-1; Mon, 25 Jan 2021 19:31:37 -0500
X-MC-Unique: YpG0FA_5PI2AlzTBFopKSg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F8FA8144E1;
	Tue, 26 Jan 2021 00:31:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D97AB6F452;
	Tue, 26 Jan 2021 00:31:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB7B24BB7B;
	Tue, 26 Jan 2021 00:31:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10Q0U5lR014591 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 19:30:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0E50F175AE; Tue, 26 Jan 2021 00:30:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06D1D6D9D8
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 00:30:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1294101A53F
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 00:30:02 +0000 (UTC)
Received: from icp-osb-irony-out8.external.iinet.net.au
	(icp-osb-irony-out8.external.iinet.net.au [203.59.1.225]) by
	relay.mimecast.com with ESMTP id us-mta-169-gUxBa80oPrmGQZzWznaXiQ-1;
	Mon, 25 Jan 2021 19:29:59 -0500
X-MC-Unique: gUxBa80oPrmGQZzWznaXiQ-1
X-SMTP-MATCH: 1
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DKBgA9YQ9g/3zSRWpiHAEBAQEBAQc?=
	=?us-ascii?q?BARIBAQQEAQFHgUiDeIUiiQSGP4IWAziDbJZBgVwLAQEBAQEBAQEBNQECBAE?=
	=?us-ascii?q?BhEQEAgKBeSY4EwIQAQEBBQEBAQEBBgMBhl6FdAEFIzMjEAsIBgocDgICVwa?=
	=?us-ascii?q?DOYJWAQEuslGBMoVHE4IlBoENgUSBOIZ7AYZCNYFNP4FHgmM+hAiDT4JgBII?=
	=?us-ascii?q?+BoEPToEhFQQNAhdBApAsgnqIfopzkRMsB4J6gRgFC4ZRk3YigyuQGo8zhiU?=
	=?us-ascii?q?YqmmGZIF6MxofghYYgRBPGQ2cfjBnAgYKAQEDCVkBAYs6AQE?=
X-IPAS-Result: =?us-ascii?q?A2DKBgA9YQ9g/3zSRWpiHAEBAQEBAQcBARIBAQQEAQFHg?=
	=?us-ascii?q?UiDeIUiiQSGP4IWAziDbJZBgVwLAQEBAQEBAQEBNQECBAEBhEQEAgKBeSY4E?=
	=?us-ascii?q?wIQAQEBBQEBAQEBBgMBhl6FdAEFIzMjEAsIBgocDgICVwaDOYJWAQEuslGBM?=
	=?us-ascii?q?oVHE4IlBoENgUSBOIZ7AYZCNYFNP4FHgmM+hAiDT4JgBII+BoEPToEhFQQNA?=
	=?us-ascii?q?hdBApAsgnqIfopzkRMsB4J6gRgFC4ZRk3YigyuQGo8zhiUYqmmGZIF6Mxofg?=
	=?us-ascii?q?hYYgRBPGQ2cfjBnAgYKAQEDCVkBAYs6AQE?=
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; 
	d="scan'208,217";a="344784278"
Received: from 106-69-210-124.dyn.iinet.net.au (HELO swtf.swtf.dyndns.org)
	([106.69.210.124]) by icp-osb-irony-out8.iinet.net.au with ESMTP;
	26 Jan 2021 08:29:54 +0800
Message-ID: <01a61bf10b409134ec57c2d419a33623f16010a9.camel@iinet.net.au>
Subject: Re: Occasional delayed output of events
From: Burn Alting <burn.alting@iinet.net.au>
To: Steve Grubb <sgrubb@redhat.com>
Date: Tue, 26 Jan 2021 11:29:53 +1100
In-Reply-To: <3094935.aeNJFYEL58@x2>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<11685937.O9o76ZdvQC@x2>
	<702bbf002465236ec84ff4f90b9e159ccc3f327d.camel@iinet.net.au>
	<3094935.aeNJFYEL58@x2>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============3710764599737658121=="

--===============3710764599737658121==
Content-Type: multipart/alternative; boundary="=-1c0mgWFtJoEkRwa2sDgQ"

--=-1c0mgWFtJoEkRwa2sDgQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-01-25 at 19:20 -0500, Steve Grubb wrote:
> On Monday, January 25, 2021 7:11:45 PM EST Burn Alting wrote:
> > On Mon, 2021-01-25 at 18:53 -0500, Steve Grubb wrote:
> > > On Saturday, January 23, 2021 5:55:44 PM EST Burn Alting wrote:
> > > > > > How is the following for a way forward.
> > > > > > a. I will author a patch to the user space code to correctly parse
> > > > > > this
> > > > > > condition and submit it on the weekend. It will be via a new
> > > > > > configuration item to auditd.conf just in case placing a fixed
> > > > > > extended timeout (15-20 secs) affects memory usage for users of the
> > > > > > auparse library. This solves the initial problem of
> > > > > > ausearch/auparse
> > > > > > failing to parse generated audit.b. I am happy to instrument what
> > > > > > ever
> > > > > > is recommended on my hosts at home (vm's and bare metal) to provide
> > > > > > more information, should we want to 'explain' the occurrence, given
> > > > > > I
> > > > > > see this every week or two and report back.
> > > > > 
> > > > > Seems reasonable to me.
> > > > 
> > > > I can implement the 'end_of_event_timeout' change either as
> > > > i. a command line argument to ausearch/aureport (say --eoetmo secs) and
> > > > a
> > > > new pair of library functions within the  auparse() stable (say
> > > > auparse_set_eoe_timeout() and auparse_get_eoe_timeout())
> > > > or
> > > > ii. a configuration item in /etc/audit/auditd.conf, or
> > > > 
> > > > 
> > > > Which is your preference? Mine is i. as this is a user space processing
> > > > change, not a demon change.
> > > 
> > > To be honest, I'm not entirely sure what we're seeing. I run some tests
> > > today on my system. It's seeing issues also. I'd still like to treat the
> > > root cause of this. But we do need to change the default. That I what
> > > I'm trying to figure out.
> > > 
> > > Back to your question, I'm wondering if we should do both? A changeable
> > > default in auditd.conf and an override on the command line.
> > 
> > So far, all items in /etc/audit/auditd.conf appear to only affect the
> > daemon. Is this the right location to start adding non-daemon
> > configuration items? (I accept there is no other place).
> 
> ausearch/report/auparse all read the auditd.conf to find the canonical 
> location for where the logs are supposed to be. So, they already read this 
> file. I'd rather keep it there than make yet another config. The only drawback 
> it that it might again confuse people that auditd really doesn't do anything 
> with the records but just some light processing.

OK. I will put it in /etc/audit/auditd.conf


> -Steve
> 
> > Happy to do both, if required.
> > 
> > > -Steve
> 
> 
> 
> 

--=-1c0mgWFtJoEkRwa2sDgQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Mon, 2021-01-25 at 19:20 -0500, Steve Grubb wrote:</div><blockq=
uote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf soli=
d;padding-left:1ex"><pre>On Monday, January 25, 2021 7:11:45 PM EST Burn Al=
ting wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bord=
er-left:2px #729fcf solid;padding-left:1ex"><pre>On Mon, 2021-01-25 at 18:5=
3 -0500, Steve Grubb wrote:</pre><blockquote type=3D"cite" style=3D"margin:=
0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>On Saturda=
y, January 23, 2021 5:55:44 PM EST Burn Alting wrote:</pre><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-lef=
t:2px #729fcf solid;padding-left:1ex"><blockquote type=3D"cite" style=3D"ma=
rgin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>How i=
s the following for a way forward.</pre><pre>a. I will author a patch to th=
e user space code to correctly parse</pre><pre>this</pre><pre>condition and=
 submit it on the weekend. It will be via a new</pre><pre>configuration ite=
m to auditd.conf just in case placing a fixed</pre><pre>extended timeout (1=
5-20 secs) affects memory usage for users of the</pre><pre>auparse library.=
 This solves the initial problem of</pre><pre>ausearch/auparse</pre><pre>fa=
iling to parse generated audit.b. I am happy to instrument what</pre><pre>e=
ver</pre><pre>is recommended on my hosts at home (vm's and bare metal) to p=
rovide</pre><pre>more information, should we want to 'explain' the occurren=
ce, given</pre><pre>I</pre><pre>see this every week or two and report back.=
</pre></blockquote><pre><br></pre><pre>Seems reasonable to me.</pre></block=
quote><pre><br></pre><pre>I can implement the 'end_of_event_timeout' change=
 either as</pre><pre>i. a command line argument to ausearch/aureport (say -=
-eoetmo secs) and</pre><pre>a</pre><pre>new pair of library functions withi=
n the  auparse() stable (say</pre><pre>auparse_set_eoe_timeout() and aupars=
e_get_eoe_timeout())</pre><pre>or</pre><pre>ii. a configuration item in /et=
c/audit/auditd.conf, or</pre><pre><br></pre><pre><br></pre><pre>Which is yo=
ur preference? Mine is i. as this is a user space processing</pre><pre>chan=
ge, not a demon change.</pre></blockquote><pre><br></pre><pre>To be honest,=
 I'm not entirely sure what we're seeing. I run some tests</pre><pre>today =
on my system. It's seeing issues also. I'd still like to treat the</pre><pr=
e>root cause of this. But we do need to change the default. That I what</pr=
e><pre>I'm trying to figure out.</pre><pre><br></pre><pre>Back to your ques=
tion, I'm wondering if we should do both? A changeable</pre><pre>default in=
 auditd.conf and an override on the command line.</pre></blockquote><pre><b=
r></pre><pre>So far, all items in /etc/audit/auditd.conf appear to only aff=
ect the</pre><pre>daemon. Is this the right location to start adding non-da=
emon</pre><pre>configuration items? (I accept there is no other place).</pr=
e></blockquote><pre><br></pre><pre>ausearch/report/auparse all read the aud=
itd.conf to find the canonical </pre><pre>location for where the logs are s=
upposed to be. So, they already read this </pre><pre>file. I'd rather keep =
it there than make yet another config. The only drawback </pre><pre>it that=
 it might again confuse people that auditd really doesn't do anything </pre=
><pre>with the records but just some light processing.</pre></blockquote><p=
re><br></pre><pre>OK. I will put it in /etc/audit/auditd.conf</pre><pre><br=
></pre><pre><br></pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex;=
 border-left:2px #729fcf solid;padding-left:1ex"><pre>-Steve</pre><pre><br>=
</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px=
 #729fcf solid;padding-left:1ex"><pre>Happy to do both, if required.</pre><=
pre><br></pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-=
left:2px #729fcf solid;padding-left:1ex"><pre>-Steve</pre></blockquote></bl=
ockquote><pre><br></pre><pre><br></pre><pre><br></pre><pre><br></pre></bloc=
kquote></body></html>

--=-1c0mgWFtJoEkRwa2sDgQ--

--===============3710764599737658121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============3710764599737658121==--


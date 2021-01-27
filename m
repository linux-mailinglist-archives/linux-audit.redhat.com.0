Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A09EB305B08
	for <lists+linux-audit@lfdr.de>; Wed, 27 Jan 2021 13:18:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-IlnhpeApMjuYgWxakGn0rA-1; Wed, 27 Jan 2021 07:18:06 -0500
X-MC-Unique: IlnhpeApMjuYgWxakGn0rA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A20E1005D4E;
	Wed, 27 Jan 2021 12:18:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F55A60C05;
	Wed, 27 Jan 2021 12:17:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5BF971809CA0;
	Wed, 27 Jan 2021 12:17:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RCD7aT009553 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 07:13:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 92ED5B27A4; Wed, 27 Jan 2021 12:13:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D7D8B17C9
	for <linux-audit@redhat.com>; Wed, 27 Jan 2021 12:13:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FBA6800883
	for <linux-audit@redhat.com>; Wed, 27 Jan 2021 12:13:05 +0000 (UTC)
Received: from icp-osb-irony-out2.external.iinet.net.au
	(icp-osb-irony-out2.external.iinet.net.au [203.59.1.155]) by
	relay.mimecast.com with ESMTP id us-mta-246-OUVPrU4KNkKpbKEJu3aWrw-1;
	Wed, 27 Jan 2021 07:13:01 -0500
X-MC-Unique: OUVPrU4KNkKpbKEJu3aWrw-1
X-SMTP-MATCH: 1
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BSCAA5WBFg/3zSRWpiHAEBAQEBAQc?=
	=?us-ascii?q?BARIBAQQEAQFHgUiDeIUiiQSGPoIWAziDbJZDgVwLAQEBAQEBAQEBNQECBAE?=
	=?us-ascii?q?BhEQEAgKBdSY4EwIQAQEBBQEBAQEBBgMBhl6FcwEBAQECASMzIxALCAYKHA4?=
	=?us-ascii?q?CAlcGLoMLglYBAQ8fsW12gTKFRxOCFQaBDYFEgTiGewGGQjWBTT+BR4JjPoQ?=
	=?us-ascii?q?Ig0+CYASCQAYyJzZNAYENFRkNAlkCkyiIf4p0kRQsB4J5gRgFC4ZSk3gigyy?=
	=?us-ascii?q?QG48zhigYqkEuhmSBejMaH4IWGIEQTxkNnH4wZwIGCgEBAwlZAQGLOgEB?=
X-IPAS-Result: =?us-ascii?q?A2BSCAA5WBFg/3zSRWpiHAEBAQEBAQcBARIBAQQEAQFHg?=
	=?us-ascii?q?UiDeIUiiQSGPoIWAziDbJZDgVwLAQEBAQEBAQEBNQECBAEBhEQEAgKBdSY4E?=
	=?us-ascii?q?wIQAQEBBQEBAQEBBgMBhl6FcwEBAQECASMzIxALCAYKHA4CAlcGLoMLglYBA?=
	=?us-ascii?q?Q8fsW12gTKFRxOCFQaBDYFEgTiGewGGQjWBTT+BR4JjPoQIg0+CYASCQAYyJ?=
	=?us-ascii?q?zZNAYENFRkNAlkCkyiIf4p0kRQsB4J5gRgFC4ZSk3gigyyQG48zhigYqkEuh?=
	=?us-ascii?q?mSBejMaH4IWGIEQTxkNnH4wZwIGCgEBAwlZAQGLOgEB?=
X-IronPort-AV: E=Sophos;i="5.79,379,1602518400"; 
	d="scan'208,217";a="336456318"
Received: from 106-69-210-124.dyn.iinet.net.au (HELO swtf.swtf.dyndns.org)
	([106.69.210.124]) by icp-osb-irony-out2.iinet.net.au with ESMTP;
	27 Jan 2021 20:12:58 +0800
Message-ID: <959667f6a72d84d57faa575a00d6eddd71e0e271.camel@iinet.net.au>
Subject: Re: Occasional delayed output of events
From: Burn Alting <burn.alting@iinet.net.au>
To: Steve Grubb <sgrubb@redhat.com>
Date: Wed, 27 Jan 2021 23:12:57 +1100
In-Reply-To: <5679566.lOV4Wx5bFT@x2>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<01a61bf10b409134ec57c2d419a33623f16010a9.camel@iinet.net.au>
	<c878d2aa65ba99579c800a67c54dccea24b9b03d.camel@iinet.net.au>
	<5679566.lOV4Wx5bFT@x2>
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
Content-Type: multipart/mixed; boundary="===============0404618904409565936=="

--===============0404618904409565936==
Content-Type: multipart/alternative; boundary="=-N1Ax6gAPv6dJWaA2hzqo"

--=-N1Ax6gAPv6dJWaA2hzqo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-01-26 at 15:42 -0500, Steve Grubb wrote:
> On Tuesday, January 26, 2021 6:53:31 AM EST Burn Alting wrote:
> > On Tue, 2021-01-26 at 11:29 +1100, Burn Alting wrote:
> > > On Mon, 2021-01-25 at 19:20 -0500, Steve Grubb wrote:
> > > > On Monday, January 25, 2021 7:11:45 PM EST Burn Alting wrote:
> > > > > On Mon, 2021-01-25 at 18:53 -0500, Steve Grubb wrote:
> > > > > > On Saturday, January 23, 2021 5:55:44 PM EST Burn Alting wrote:
> > > > > > > > > How is the following for a way forward.a. I will author a
> > > > > > > > > patch to the
> > > > > > > > > user space code to correctly parsethiscondition and submit it
> > > > > > > > > on the
> > > > > > > > > weekend. It will be via a newconfiguration item to
> > > > > > > > > auditd.conf just in
> > > > > > > > > case placing a fixedextended timeout (15-20 secs) affects
> > > > > > > > > memory usage
> > > > > > > > > for users of theauparse library. This solves the initial
> > > > > > > > > problem
> > > > > > > > > ofausearch/auparsefailing to parse generated audit.b. I am
> > > > > > > > > happy to
> > > > > > > > > instrument whateveris recommended on my hosts at home (vm's
> > > > > > > > > and bare
> > > > > > > > > metal) to providemore information, should we want to
> > > > > > > > > 'explain' the
> > > > > > > > > occurrence, givenIsee this every week or two and report back.
> > > > > > > > 
> > > > > > > > Seems reasonable to me.
> > > > > > > 
> > > > > > > I can implement the 'end_of_event_timeout' change either asi. a
> > > > > > > command
> > > > > > > line argument to ausearch/aureport (say --eoetmo secs) andanew
> > > > > > > pair of
> > > > > > > library functions within the  auparse() stable
> > > > > > > (sayauparse_set_eoe_timeout() and auparse_get_eoe_timeout())orii.
> > > > > > > a
> > > > > > > configuration item in /etc/audit/auditd.conf, or
> > > > > > > 
> > > > > > > Which is your preference? Mine is i. as this is a user space
> > > > > > > processingchange, not a demon change.
> > > > > > 
> > > > > > To be honest, I'm not entirely sure what we're seeing. I run some
> > > > > > teststoday on my system. It's seeing issues also. I'd still like
> > > > > > to treat theroot cause of this. But we do need to change the
> > > > > > default. That I whatI'm trying to figure out.
> > > > > > Back to your question, I'm wondering if we should do both? A
> > > > > > changeabledefault in auditd.conf and an override on the command
> > > > > > line.
> > > > > 
> > > > > So far, all items in /etc/audit/auditd.conf appear to only affect
> > > > > thedaemon. Is this the right location to start adding
> > > > > non-daemonconfiguration items? (I accept there is no other place).
> > > > 
> > > > ausearch/report/auparse all read the auditd.conf to find the canonical
> > > > location for where the logs are supposed to be. So, they already read
> > > > this file. I'd rather keep it there than make yet another config. The
> > > > only drawback it that it might again confuse people that auditd really
> > > > doesn't do anything with the records but just some light processing.
> > > 
> > > OK. I will put it in /etc/audit/auditd.conf
> > 
> > One question with this solution. If the user does not have read permission
> > to /etc/audit/auditd.conf, then any change cannot take effect. The default
> > mode for this file is 640 to root, so a non-root user could never change
> > the timeout.
> 
> Right, but since they cannot access the logs, it's not a problem in general.  
> But if they so happen to have a local copy of logs, then the command line 
> override should allow them to correct this. I am also reviewing things to see 
> if a better default can be picked.
> 
> > Should I also add - a command line argument to ausearch/aureport (say --
> > eoetmo secs) and, - a pair of new auparse() functions -
> > auparse_set_eoe_timeout() and  auparse_get_eoe_timeout()
> > so that non root users can make use of the new configuration item.
> 
> Yes, that is what I meant by doing both. We have default in auditd.conf that 
> works for everyone with direct audit access. We have a commandline option for 
> overriding the auditd.conf value.
> 
> Although, I don't know why we would want to get the eoe_timeout value? I 
> can't imagine a use for it right now. 
> 
> As for ausearch/report, let's just make a long option --eoe-timeout
> 
> -Steve
> 
> > Also, do you want the default timeout to be 2 seconds or should I make it
> > higher.
> 
> I'm likely to adjust it, but I'm still looking to see what is happening. Just 
> go with the 2 second default for now.

Issued PR just now.

> 
> Thanks,
> -Steve
> 
> 

--=-N1Ax6gAPv6dJWaA2hzqo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Tue, 2021-01-26 at 15:42 -0500, Steve Grubb wrote:</div><blockq=
uote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf soli=
d;padding-left:1ex"><pre>On Tuesday, January 26, 2021 6:53:31 AM EST Burn A=
lting wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bor=
der-left:2px #729fcf solid;padding-left:1ex"><pre>On Tue, 2021-01-26 at 11:=
29 +1100, Burn Alting wrote:</pre><blockquote type=3D"cite" style=3D"margin=
:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>On Mon, 2=
021-01-25 at 19:20 -0500, Steve Grubb wrote:</pre><blockquote type=3D"cite"=
 style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex=
"><pre>On Monday, January 25, 2021 7:11:45 PM EST Burn Alting wrote:</pre><=
blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fc=
f solid;padding-left:1ex"><pre>On Mon, 2021-01-25 at 18:53 -0500, Steve Gru=
bb wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border=
-left:2px #729fcf solid;padding-left:1ex"><pre>On Saturday, January 23, 202=
1 5:55:44 PM EST Burn Alting wrote:</pre><blockquote type=3D"cite" style=3D=
"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><blockq=
uote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf soli=
d;padding-left:1ex"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; b=
order-left:2px #729fcf solid;padding-left:1ex"><pre>How is the following fo=
r a way forward.a. I will author a</pre><pre>patch to the</pre><pre>user sp=
ace code to correctly parsethiscondition and submit it</pre><pre>on the</pr=
e><pre>weekend. It will be via a newconfiguration item to</pre><pre>auditd.=
conf just in</pre><pre>case placing a fixedextended timeout (15-20 secs) af=
fects</pre><pre>memory usage</pre><pre>for users of theauparse library. Thi=
s solves the initial</pre><pre>problem</pre><pre>ofausearch/auparsefailing =
to parse generated audit.b. I am</pre><pre>happy to</pre><pre>instrument wh=
ateveris recommended on my hosts at home (vm's</pre><pre>and bare</pre><pre=
>metal) to providemore information, should we want to</pre><pre>'explain' t=
he</pre><pre>occurrence, givenIsee this every week or two and report back.<=
/pre></blockquote><pre><br></pre><pre>Seems reasonable to me.</pre></blockq=
uote><pre><br></pre><pre>I can implement the 'end_of_event_timeout' change =
either asi. a</pre><pre>command</pre><pre>line argument to ausearch/aurepor=
t (say --eoetmo secs) andanew</pre><pre>pair of</pre><pre>library functions=
 within the  auparse() stable</pre><pre>(sayauparse_set_eoe_timeout() and a=
uparse_get_eoe_timeout())orii.</pre><pre>a</pre><pre>configuration item in =
/etc/audit/auditd.conf, or</pre><pre><br></pre><pre>Which is your preferenc=
e? Mine is i. as this is a user space</pre><pre>processingchange, not a dem=
on change.</pre></blockquote><pre><br></pre><pre>To be honest, I'm not enti=
rely sure what we're seeing. I run some</pre><pre>teststoday on my system. =
It's seeing issues also. I'd still like</pre><pre>to treat theroot cause of=
 this. But we do need to change the</pre><pre>default. That I whatI'm tryin=
g to figure out.</pre><pre>Back to your question, I'm wondering if we shoul=
d do both? A</pre><pre>changeabledefault in auditd.conf and an override on =
the command</pre><pre>line.</pre></blockquote><pre><br></pre><pre>So far, a=
ll items in /etc/audit/auditd.conf appear to only affect</pre><pre>thedaemo=
n. Is this the right location to start adding</pre><pre>non-daemonconfigura=
tion items? (I accept there is no other place).</pre></blockquote><pre><br>=
</pre><pre>ausearch/report/auparse all read the auditd.conf to find the can=
onical</pre><pre>location for where the logs are supposed to be. So, they a=
lready read</pre><pre>this file. I'd rather keep it there than make yet ano=
ther config. The</pre><pre>only drawback it that it might again confuse peo=
ple that auditd really</pre><pre>doesn't do anything with the records but j=
ust some light processing.</pre></blockquote><pre><br></pre><pre>OK. I will=
 put it in /etc/audit/auditd.conf</pre></blockquote><pre><br></pre><pre>One=
 question with this solution. If the user does not have read permission</pr=
e><pre>to /etc/audit/auditd.conf, then any change cannot take effect. The d=
efault</pre><pre>mode for this file is 640 to root, so a non-root user coul=
d never change</pre><pre>the timeout.</pre></blockquote><pre><br></pre><pre=
>Right, but since they cannot access the logs, it's not a problem in genera=
l.  </pre><pre>But if they so happen to have a local copy of logs, then the=
 command line </pre><pre>override should allow them to correct this. I am a=
lso reviewing things to see </pre><pre>if a better default can be picked.</=
pre><pre><br></pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bo=
rder-left:2px #729fcf solid;padding-left:1ex"><pre>Should I also add - a co=
mmand line argument to ausearch/aureport (say --</pre><pre>eoetmo secs) and=
, - a pair of new auparse() functions -</pre><pre>auparse_set_eoe_timeout()=
 and  auparse_get_eoe_timeout()</pre><pre>so that non root users can make u=
se of the new configuration item.</pre></blockquote><pre><br></pre><pre>Yes=
, that is what I meant by doing both. We have default in auditd.conf that <=
/pre><pre>works for everyone with direct audit access. We have a commandlin=
e option for </pre><pre>overriding the auditd.conf value.</pre><pre><br></p=
re><pre>Although, I don't know why we would want to get the eoe_timeout val=
ue? I </pre><pre>can't imagine a use for it right now. </pre><pre><br></pre=
><pre>As for ausearch/report, let's just make a long option --eoe-timeout</=
pre><pre><br></pre><pre>-Steve</pre><pre><br></pre><blockquote type=3D"cite=
" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1e=
x"><pre>Also, do you want the default timeout to be 2 seconds or should I m=
ake it</pre><pre>higher.</pre></blockquote><pre><br></pre><pre>I'm likely t=
o adjust it, but I'm still looking to see what is happening. Just </pre><pr=
e>go with the 2 second default for now.</pre></blockquote><div><br></div><d=
iv>Issued PR just now.</div><div><br></div><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre=
><br></pre><pre>Thanks,</pre><pre>-Steve</pre><pre><br></pre><pre><br></pre=
></blockquote></body></html>

--=-N1Ax6gAPv6dJWaA2hzqo--

--===============0404618904409565936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============0404618904409565936==--


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0D17D2FB3E6
	for <lists+linux-audit@lfdr.de>; Tue, 19 Jan 2021 09:20:48 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-LXWGruE7NdSceURIrzl4Ow-1; Tue, 19 Jan 2021 03:20:44 -0500
X-MC-Unique: LXWGruE7NdSceURIrzl4Ow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85F7B94D187;
	Tue, 19 Jan 2021 08:20:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0D825272D;
	Tue, 19 Jan 2021 08:19:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2ADCB4BB7B;
	Tue, 19 Jan 2021 08:19:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J8J65v006816 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 03:19:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5944F2026D11; Tue, 19 Jan 2021 08:19:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 539B22026D12
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 08:19:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F953858EEC
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 08:19:02 +0000 (UTC)
Received: from icp-osb-irony-out9.external.iinet.net.au
	(icp-osb-irony-out9.external.iinet.net.au [203.59.1.226]) by
	relay.mimecast.com with ESMTP id us-mta-464-ykEJCCLXMlGyWD3WJK-o6A-1;
	Tue, 19 Jan 2021 03:18:56 -0500
X-MC-Unique: ykEJCCLXMlGyWD3WJK-o6A-1
X-SMTP-MATCH: 1
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2A2DQDVlAZg/3zSRWpiHQEBAQEJARI?=
	=?us-ascii?q?BBQUBR4FIgXYGgSVXYoQ/iQSGNoIWAziDbJYxDIFcCwEBAQEBAQEBASwJAQI?=
	=?us-ascii?q?EAQGERAQCAoFyJjgTAhABAQEFAQEBAQEGAwGGUgyFcwEBAQECASMzIwULCwg?=
	=?us-ascii?q?QHA4CAlcGARKCW0sBglUBAQ8fEK4tdoEyhEABgQYTgh4GgQ2BPQaBOIZ2AYJ?=
	=?us-ascii?q?Og3I1gU0/gUeCYz6CXQKBRYMzgmAEgV0IAVgGgQYZCAoGIAJPFD0IHwFXCSY?=
	=?us-ascii?q?Cj0ILgyWIe4pxkRMsB4J6gRcFC4ZRgTeSOSKDKpAQjzCGIhiNYYscmEmBejM?=
	=?us-ascii?q?aH4IWGIEPUBkNgUqMYxeDTopsMDA3AgYKAQEDCVkBAYlOLYIXAQE?=
X-IPAS-Result: =?us-ascii?q?A2A2DQDVlAZg/3zSRWpiHQEBAQEJARIBBQUBR4FIgXYGg?=
	=?us-ascii?q?SVXYoQ/iQSGNoIWAziDbJYxDIFcCwEBAQEBAQEBASwJAQIEAQGERAQCAoFyJ?=
	=?us-ascii?q?jgTAhABAQEFAQEBAQEGAwGGUgyFcwEBAQECASMzIwULCwgQHA4CAlcGARKCW?=
	=?us-ascii?q?0sBglUBAQ8fEK4tdoEyhEABgQYTgh4GgQ2BPQaBOIZ2AYJOg3I1gU0/gUeCY?=
	=?us-ascii?q?z6CXQKBRYMzgmAEgV0IAVgGgQYZCAoGIAJPFD0IHwFXCSYCj0ILgyWIe4pxk?=
	=?us-ascii?q?RMsB4J6gRcFC4ZRgTeSOSKDKpAQjzCGIhiNYYscmEmBejMaH4IWGIEPUBkNg?=
	=?us-ascii?q?UqMYxeDTopsMDA3AgYKAQEDCVkBAYlOLYIXAQE?=
X-IronPort-AV: E=Sophos;i="5.79,358,1602518400"; 
	d="scan'208,217";a="298621503"
Received: from 106-69-210-124.dyn.iinet.net.au (HELO swtf.swtf.dyndns.org)
	([106.69.210.124]) by icp-osb-irony-out9.iinet.net.au with ESMTP;
	19 Jan 2021 16:18:52 +0800
Message-ID: <9a7ed1203fa7ec67000aa68281a215354c2ed5f5.camel@iinet.net.au>
Subject: Re: Occasional delayed output of events
From: Burn Alting <burn.alting@iinet.net.au>
To: Paul Moore <paul@paul-moore.com>, Steve Grubb <sgrubb@redhat.com>
Date: Tue, 19 Jan 2021 19:18:51 +1100
In-Reply-To: <CAHC9VhT_yd=zEusQga507jA43S_stCb2kAmd_sN6fLNcdLDdWg@mail.gmail.com>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<5445873.DvuYhMxLoT@x2>
	<17715c36170.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
	<3095712.44csPzL39Z@x2>
	<CAHC9VhT_yd=zEusQga507jA43S_stCb2kAmd_sN6fLNcdLDdWg@mail.gmail.com>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Content-Type: multipart/mixed; boundary="===============6047398537258989037=="

--===============6047398537258989037==
Content-Type: multipart/alternative; boundary="=-7aBpHuT6KhTsK6hVQg9S"

--=-7aBpHuT6KhTsK6hVQg9S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-01-18 at 15:36 -0500, Paul Moore wrote:
> On Mon, Jan 18, 2021 at 9:31 AM Steve Grubb <sgrubb@redhat.com> wrote:
> > On Monday, January 18, 2021 8:54:30 AM EST Paul Moore wrote:
> > > > > > I like the N of M concept but there would be a LOT of change
> > > > > > -especiallyfor all the non-kernel event sources. The EOE would be the
> > > > > > mostseamless, but at a cost. My preference is to allow the 2 second
> > > > > > 'timer'to be configurable.
> > > > > 
> > > > > Agree with Burn, numbering the records coming up from the kernel isgoing
> > > > > to be a real nightmare, and not something to consider lightly.Especially
> > > > > when it sounds like we don't yet have a root cause for theissue.
> > > > 
> > > > A very long time ago, we had numbered records. But it was decided
> > > > thatthere's no real point in it and we'd rather just save disk space.
> > > 
> > > With the current kernel code, adding numbered records is not something totake
> > > lightly.
> > 
> > That's why I'm saying we had it and it was removed. I could imagine that ifyou
> > had auditing of the kill syscall enabled and a whole process group wasbeing
> > killed, you could have hundreds of records that need numbering. No goodway to
> > know in advance how many records make up the event.
> 
> You only mentioned disk space concerns so it wasn't clear to me thatyou were in
> agreement about this being a bad idea.  Regardless, I'mglad to see we are on the
> same page about this.
> > > > I know that the kernel does not serialize the events headed for userspace.
> > > > But I'm curious how an event gets stuck and others can jump aheadwhile one
> > > > that's already inflight can get hung for 4 seconds before it'snext record
> > > > goes out?
> > > 
> > > Have you determined that the problem is the kernel?
> > 
> > I assume so because the kernel adds the timestamp and choses what hits thesocket
> > next. Auditd does no ordering of events. It just looks up the textevent ID, some
> > minor translation if the enriched format is being used, andwrites it to disk. It
> > can handle well over 100k records per second.
> 
> Feel free to insert the old joke about assumptions.
> I guess I was hoping for a bit more understanding of the problem andperhaps some
> actual data indicating the kernel was the source of theproblem.  Conjecture based
> on how things are supposed to work can bemisleading.
> > > Initially it was looking like it was a userspace issue, is that no longerthe
> > > general thought?
> > 
> > I don't see how user space could cause this. Even if auditd was slow,
> > itshouldn't take 4 seconds to write to disk and then come back to read
> > anotherrecord. And even it did, why would the newest record go out before
> > completingone that's in progress? Something in the kernel chooses what's next.
> > Isuspect that might need looking at.
> 
> See above.
> > > Also, is there a reliable reproducer yet?
> > 
> > I don't know of one. But, I suppose we could modify ausearch to look forexamples
> > of this.
> 
> The kernel queuing is a rather complicated affair due to the need togracefully
> handle auditd failing, fallbacks to the console, andmulticast groups all while
> handling extreme pressure (e.g. auditing*every* syscall) and not destroying the
> responsiveness of the system(we actually can still make forward progress if you
> are auditing*every* syscall).  With that complexity comes a number of cornercases,
> and I imagine there are a few cases where the system is underextreme pressure
> and/or the auditd daemon is dead and/or starved fromCPU time.  As I know Richard
> is reading this, to be clear I'm talkingabout the hold/retry queues and the
> UNICAST_RETRIES case.  The severedelays you are talking about in this thread seem
> severe, but perhapsif the system is under enough pressure to cause the ordering
> issues inthe first place such a delay is to be expected.
> Anyway, my test setup isn't likely able to reproduce such a scenariowithout some
> significant tweaks, so perhaps those of you who have seenthis problem (Burn, and
> anyone else?) could shed some light into thestate of the system when the ordering
> problem occurred.

I tend to have a rigorous auditing posture (see the rules loaded in 
https://github.com/linux-audit/audit-userspace/issues/148) which is not normal for
most. Perhaps, Paul, you have hit the nail on the head by stating that this 'severe
delay' is not that unreasonable given my rules posture and we just need to 'deal
with it' in user space.We still get the event data, I just need to adjust the user
space tools to deal with this occurrence.
As for what the system is doing, in my home case it's a Centos 7 VM running a tomcat
service which only gets busy every 20 minutes and the other is a HPE Z800 running
Centos 8 with 4-5 VM's mostly dormant. I can put any code in these hosts to assist
in 'validating'/testing the delay. Advise and I will run.

--=-7aBpHuT6KhTsK6hVQg9S
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Mon, 2021-01-18 at 15:36 -0500, Paul Moore wrote:</div><blockqu=
ote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid=
;padding-left:1ex"><pre>On Mon, Jan 18, 2021 at 9:31 AM Steve Grubb &lt;</p=
re><a href=3D"mailto:sgrubb@redhat.com"><pre>sgrubb@redhat.com</pre></a><pr=
e>&gt; wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bo=
rder-left:2px #729fcf solid;padding-left:1ex"><pre>On Monday, January 18, 2=
021 8:54:30 AM EST Paul Moore wrote:</pre><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><blo=
ckquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf s=
olid;padding-left:1ex"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex=
; border-left:2px #729fcf solid;padding-left:1ex"><blockquote type=3D"cite"=
 style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex=
"><pre>I like the N of M concept but there would be a LOT of change -</pre>=
<pre>especially</pre><pre>for all the non-kernel event sources. The EOE wou=
ld be the most</pre><pre>seamless, but at a cost. My preference is to allow=
 the 2 second 'timer'</pre><pre>to be configurable.</pre></blockquote><pre>=
<br></pre><pre>Agree with Burn, numbering the records coming up from the ke=
rnel is</pre><pre>going to be a real nightmare, and not something to consid=
er lightly.</pre><pre>Especially when it sounds like we don't yet have a ro=
ot cause for the</pre><pre>issue.</pre></blockquote><pre><br></pre><pre>A v=
ery long time ago, we had numbered records. But it was decided that</pre><p=
re>there's no real point in it and we'd rather just save disk space.</pre><=
/blockquote><pre><br></pre><pre>With the current kernel code, adding number=
ed records is not something to</pre><pre>take lightly.</pre></blockquote><p=
re><br></pre><pre>That's why I'm saying we had it and it was removed. I cou=
ld imagine that if</pre><pre>you had auditing of the kill syscall enabled a=
nd a whole process group was</pre><pre>being killed, you could have hundred=
s of records that need numbering. No good</pre><pre>way to know in advance =
how many records make up the event.</pre></blockquote><pre><br></pre><pre>Y=
ou only mentioned disk space concerns so it wasn't clear to me that</pre><p=
re>you were in agreement about this being a bad idea.  Regardless, I'm</pre=
><pre>glad to see we are on the same page about this.</pre><pre><br></pre><=
blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fc=
f solid;padding-left:1ex"><blockquote type=3D"cite" style=3D"margin:0 0 0 .=
8ex; border-left:2px #729fcf solid;padding-left:1ex"><blockquote type=3D"ci=
te" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:=
1ex"><pre>I know that the kernel does not serialize the events headed for u=
ser</pre><pre>space. But I'm curious how an event gets stuck and others can=
 jump ahead</pre><pre>while one that's already inflight can get hung for 4 =
seconds before it's</pre><pre>next record goes out?</pre></blockquote><pre>=
<br></pre><pre>Have you determined that the problem is the kernel?</pre></b=
lockquote><pre><br></pre><pre>I assume so because the kernel adds the times=
tamp and choses what hits the</pre><pre>socket next. Auditd does no orderin=
g of events. It just looks up the text</pre><pre>event ID, some minor trans=
lation if the enriched format is being used, and</pre><pre>writes it to dis=
k. It can handle well over 100k records per second.</pre></blockquote><pre>=
<br></pre><pre>Feel free to insert the old joke about assumptions.</pre><pr=
e><br></pre><pre>I guess I was hoping for a bit more understanding of the p=
roblem and</pre><pre>perhaps some actual data indicating the kernel was the=
 source of the</pre><pre>problem.  Conjecture based on how things are suppo=
sed to work can be</pre><pre>misleading.</pre><pre><br></pre><blockquote ty=
pe=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;paddi=
ng-left:1ex"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-l=
eft:2px #729fcf solid;padding-left:1ex"><pre>Initially it was looking like =
it was a userspace issue, is that no longer</pre><pre>the general thought?<=
/pre></blockquote><pre><br></pre><pre>I don't see how user space could caus=
e this. Even if auditd was slow, it</pre><pre>shouldn't take 4 seconds to w=
rite to disk and then come back to read another</pre><pre>record. And even =
it did, why would the newest record go out before completing</pre><pre>one =
that's in progress? Something in the kernel chooses what's next. I</pre><pr=
e>suspect that might need looking at.</pre></blockquote><pre><br></pre><pre=
>See above.</pre><pre><br></pre><blockquote type=3D"cite" style=3D"margin:0=
 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><pre>Also, is there a reliable reproducer yet?</pre></blockquote=
><pre><br></pre><pre>I don't know of one. But, I suppose we could modify au=
search to look for</pre><pre>examples of this.</pre></blockquote><pre><br><=
/pre><pre>The kernel queuing is a rather complicated affair due to the need=
 to</pre><pre>gracefully handle auditd failing, fallbacks to the console, a=
nd</pre><pre>multicast groups all while handling extreme pressure (e.g. aud=
iting</pre><pre>*every* syscall) and not destroying the responsiveness of t=
he system</pre><pre>(we actually can still make forward progress if you are=
 auditing</pre><pre>*every* syscall).  With that complexity comes a number =
of corner</pre><pre>cases, and I imagine there are a few cases where the sy=
stem is under</pre><pre>extreme pressure and/or the auditd daemon is dead a=
nd/or starved from</pre><pre>CPU time.  As I know Richard is reading this, =
to be clear I'm talking</pre><pre>about the hold/retry queues and the UNICA=
ST_RETRIES case.  The severe</pre><pre>delays you are talking about in this=
 thread seem severe, but perhaps</pre><pre>if the system is under enough pr=
essure to cause the ordering issues in</pre><pre>the first place such a del=
ay is to be expected.</pre><pre><br></pre><pre>Anyway, my test setup isn't =
likely able to reproduce such a scenario</pre><pre>without some significant=
 tweaks, so perhaps those of you who have seen</pre><pre>this problem (Burn=
, and anyone else?) could shed some light into the</pre><pre>state of the s=
ystem when the ordering problem occurred.</pre></blockquote><div><br></div>=
<div>I tend to have a rigorous auditing posture (see the rules loaded in <a=
 href=3D"https://github.com/linux-audit/audit-userspace/issues/148">https:/=
/github.com/linux-audit/audit-userspace/issues/148</a>) which is not normal=
 for most. Perhaps, Paul, you have hit the nail on the head by stating that=
 this 'severe delay' is not that unreasonable given my rules posture and we=
 just need to 'deal with it' in user space.</div><div>We still get the even=
t data, I just need to adjust the user space tools to deal with this occurr=
ence.</div><div>
As for what the system is doing, in my home case it's a Centos 7 VM running=
 a tomcat service which only gets busy every 20 minutes and the other is a =
HPE Z800 running Centos 8 with 4-5 VM's mostly dormant. I can put any code =
in these hosts to assist in 'validating'/testing the delay. Advise and I wi=
ll run.</div><div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0=
 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre><br></pre></blo=
ckquote></body></html>

--=-7aBpHuT6KhTsK6hVQg9S--

--===============6047398537258989037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============6047398537258989037==--


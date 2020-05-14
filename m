Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id AEB5E1D2AD0
	for <lists+linux-audit@lfdr.de>; Thu, 14 May 2020 10:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589446780;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Cuy1mpnYgO+W5s+G0rk4U38Cdw0jnPftzVzutAD8SfQ=;
	b=YrhRVm7zEwyem/2usfwDT5yNGOlAFFsoXXO6Qq93YuTYLv93XY6STC64akUM0rEvoVfVR1
	I2RS72mwb4RR3r7qGRZKH7qKZeGlcvUIi9pT5KhHN1j8feLM/2uBuoOddGoQOoy1M43fK4
	upmFGrTY/WEWUud1cReNeH9E4BP1FTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-LfSIAJb7OtWfStoFFM1_yA-1; Thu, 14 May 2020 04:59:38 -0400
X-MC-Unique: LfSIAJb7OtWfStoFFM1_yA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4529D800053;
	Thu, 14 May 2020 08:59:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18C7D7836E;
	Thu, 14 May 2020 08:59:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 42DDC4E982;
	Thu, 14 May 2020 08:59:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04E8wQpC007901 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 04:58:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F36C92156A49; Thu, 14 May 2020 08:58:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5AA12156A4D
	for <linux-audit@redhat.com>; Thu, 14 May 2020 08:58:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFAA0811E7A
	for <linux-audit@redhat.com>; Thu, 14 May 2020 08:58:23 +0000 (UTC)
Received: from icp-osb-irony-out8.external.iinet.net.au
	(icp-osb-irony-out8.external.iinet.net.au [203.59.1.225]) by
	relay.mimecast.com with ESMTP id us-mta-483-eSIBHc5aPNC2bDzSify_9g-1;
	Thu, 14 May 2020 04:58:20 -0400
X-MC-Unique: eSIBHc5aPNC2bDzSify_9g-1
X-SMTP-MATCH: 1
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DRAAAdBr1e/6MI1stmGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQEBAQEBARIBAQEBAQEBAQEBAQGCB4F9L28FTyESLIQlgV2HJIV0AYI?=
	=?us-ascii?q?QmgWBUwgLAQEBAQEBAQEBIAEKCQECBAEBgw6BMAQCAoIOJzgTAhABAQEFAQE?=
	=?us-ascii?q?BAQEFAwFthQpMDIVyAQEBAwEBITMYGwsIBgocDgICJzAGARIbgkBMgksBAS4?=
	=?us-ascii?q?QsWeBMoVAEoJZBoENgToGgTgBjFCBTD+BR4IlNT6CZwEDGoRdgmAEkVaHTol?=
	=?us-ascii?q?GkBQHglB/BIYIgRKKQ4VUHZ1JkCyJX5VqIoFWMxofVIFCGIEPUBgNkBwwF4E?=
	=?us-ascii?q?DAQKCSYpoMjACNQIGCAEBAwlZAQGOaQEB?=
X-IPAS-Result: =?us-ascii?q?A2DRAAAdBr1e/6MI1stmGQEBAQEBAQEBAQEBAQEBAQEBA?=
	=?us-ascii?q?RIBAQEBAQEBAQEBAQGCB4F9L28FTyESLIQlgV2HJIV0AYIQmgWBUwgLAQEBA?=
	=?us-ascii?q?QEBAQEBIAEKCQECBAEBgw6BMAQCAoIOJzgTAhABAQEFAQEBAQEFAwFthQpMD?=
	=?us-ascii?q?IVyAQEBAwEBITMYGwsIBgocDgICJzAGARIbgkBMgksBAS4QsWeBMoVAEoJZB?=
	=?us-ascii?q?oENgToGgTgBjFCBTD+BR4IlNT6CZwEDGoRdgmAEkVaHTolGkBQHglB/BIYIg?=
	=?us-ascii?q?RKKQ4VUHZ1JkCyJX5VqIoFWMxofVIFCGIEPUBgNkBwwF4EDAQKCSYpoMjACN?=
	=?us-ascii?q?QIGCAEBAwlZAQGOaQEB?=
X-IronPort-AV: E=Sophos;i="5.73,390,1583164800"; 
	d="scan'208,217";a="301709733"
Received: from 203-214-8-163.dyn.iinet.net.au (HELO swtf.swtf.dyndns.org)
	([203.214.8.163]) by icp-osb-irony-out8.iinet.net.au with ESMTP;
	14 May 2020 16:55:12 +0800
Message-ID: <c84089d7d299313a051a0be60697872981fd95a2.camel@iinet.net.au>
Subject: Re: reactive audit proposal
From: Burn Alting <burn.alting@iinet.net.au>
To: Steve Grubb <sgrubb@redhat.com>, linux-audit@redhat.com
Date: Thu, 14 May 2020 18:55:06 +1000
In-Reply-To: <7295083.E8dtrJcxLY@x2>
References: <6360160.ZmnOHIC0Qm@x2>
	<2037581034.269445.1589390222295@mail.yahoo.com>
	<7295083.E8dtrJcxLY@x2>
Mime-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============7045188619312559010=="

--===============7045188619312559010==
Content-Type: multipart/alternative; boundary="=-1GLcZKBVLn3xGp5znb1m"

--=-1GLcZKBVLn3xGp5znb1m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I also endorse such a change. 
There is a significant gap in recoding removable media activity (see 
https://bugzilla.redhat.com/show_bug.cgi?id=967241) and the on_mount could go a
reasonable  way to address this, including making use of the
NETLUNK_KOBJECT_UEVENTnetlink group or  /sys/block polling to assist with device
discovery.
Secondly, being able to react to a login/logout event also opens up interesting
opportunity for targetedevent generation.
That said, I believe that Juro Hlista did some work on this back around 2010. He did
this via a plugin. His solutionwas a little more generic. Should we be looking at
that as a solution as well? One element I do remember from hiswork, was that there
was a potential gap in the time to react to a trigger firing and the result was that
one was notguaranteed to implement the new rules immediately. I assume to treat this
gap, the rules could be preloaded and the 'trigger' action could just move the
'dormant' rules, already in core, to the 'active' list.
Burn
On Wed, 2020-05-13 at 14:03 -0400, Steve Grubb wrote:
> On Wednesday, May 13, 2020 1:17:02 PM EDT Joe Wulf wrote:
> > What you propose is a sound enhancement.I have no preference for the choice
> > between incorporate this in the auditdaemon versus a plugin.What would be the
> > effort to switch from one to theother if later on you should find the first
> > choice wasn't as optimal?
> 
> Well, the main idea for a plugin is not to stop processing events. Busy systems
> need to keep focused on unloading the kernel backlog. 
> > I wonder about the case where a system is booted with new media alreadyattached.
> 
> During initialization, it runs through the mount table just as if the mount table
> was changed. So, it has the opportunity to apply rules during init. I'm borrowing
> code from fapolicyd which has this nicely solved. (It's one of my other projects.)
> -Steve
> 
> 
> --Linux-audit mailing listLinux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit
> 

--=-1GLcZKBVLn3xGp5znb1m
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>I also endorse such a change.&nbsp;</div><div><br></div><div>There=
 is a significant gap in recoding removable media activity&nbsp;(see <a hre=
f=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D967241">https://bugzilla=
.redhat.com/show_bug.cgi?id=3D967241</a>)&nbsp;</div><div>and the on_mount =
could go a reasonable&nbsp; way to address this, including making use of th=
e NETLUNK_KOBJECT_UEVENT</div><div>netlink group or&nbsp; /sys/block pollin=
g to assist with device discovery.</div><div><br></div><div>Secondly, being=
 able to react to a login/logout event also opens up interesting opportunit=
y for targeted</div><div>event generation.</div><div><br></div><div>That sa=
id, I believe that Juro Hlista did some work on this back around 2010. He d=
id this via a plugin. His solution</div><div>was a little more generic. Sho=
uld we be looking at that as a solution as well? One element I do remember =
from his</div><div>work, was that there was a potential gap in the time to =
react to a trigger firing and the result was that one was not</div><div>gua=
ranteed to implement the new rules immediately. I assume to treat this gap,=
 the rules could be preloaded and&nbsp;</div><div>the 'trigger' action coul=
d just move the 'dormant' rules, already in core, to the 'active' list.</di=
v><div><br></div><div>Burn</div><div><br></div><div>On Wed, 2020-05-13 at 1=
4:03 -0400, Steve Grubb wrote:</div><blockquote type=3D"cite" style=3D"marg=
in:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>On Wedn=
esday, May 13, 2020 1:17:02 PM EDT Joe Wulf wrote:</pre><blockquote type=3D=
"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-le=
ft:1ex"><pre><br></pre><pre>What you propose is a sound enhancement.</pre><=
pre>I have no preference for the choice between incorporate this in the aud=
it</pre><pre>daemon versus a plugin.What would be the effort to switch from=
 one to the</pre><pre>other if later on you should find the first choice wa=
sn't as optimal?</pre></blockquote><pre><br></pre><pre><br></pre><pre>Well,=
 the main idea for a plugin is not to stop processing events. Busy </pre><p=
re>systems need to keep focused on unloading the kernel backlog.</pre><pre>=
 </pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2p=
x #729fcf solid;padding-left:1ex"><pre><br></pre><pre>I wonder about the ca=
se where a system is booted with new media already</pre><pre>attached.</pre=
></blockquote><pre><br></pre><pre><br></pre><pre>During initialization, it =
runs through the mount table just as if the mount </pre><pre>table was chan=
ged. So, it has the opportunity to apply rules during init. I'm </pre><pre>=
borrowing code from fapolicyd which has this nicely solved. (It's one of my=
 </pre><pre>other projects.)</pre><pre><br></pre><pre>-Steve</pre><pre><br>=
</pre><pre><br></pre><pre><br></pre><pre>--</pre><pre>Linux-audit mailing l=
ist</pre><a href=3D"mailto:Linux-audit@redhat.com"><pre>Linux-audit@redhat.=
com</pre></a><pre><br></pre><a href=3D"https://www.redhat.com/mailman/listi=
nfo/linux-audit"><pre>https://www.redhat.com/mailman/listinfo/linux-audit</=
pre></a><pre><br></pre><pre><br></pre></blockquote></body></html>

--=-1GLcZKBVLn3xGp5znb1m--

--===============7045188619312559010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============7045188619312559010==--


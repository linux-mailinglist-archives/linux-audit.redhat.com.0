Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AC1682FAB92
	for <lists+linux-audit@lfdr.de>; Mon, 18 Jan 2021 21:36:21 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-CbVEqH3FOz6uRt9uRsbvOg-1; Mon, 18 Jan 2021 15:36:17 -0500
X-MC-Unique: CbVEqH3FOz6uRt9uRsbvOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62013107ACE4;
	Mon, 18 Jan 2021 20:36:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B74471962F;
	Mon, 18 Jan 2021 20:36:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5BF6F180954D;
	Mon, 18 Jan 2021 20:36:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10IKZcl5003889 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 18 Jan 2021 15:35:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 590AE1131A; Mon, 18 Jan 2021 20:35:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53C831DB38
	for <linux-audit@redhat.com>; Mon, 18 Jan 2021 20:35:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0829E858281
	for <linux-audit@redhat.com>; Mon, 18 Jan 2021 20:35:36 +0000 (UTC)
Received: from icp-osb-irony-out2.external.iinet.net.au
	(icp-osb-irony-out2.external.iinet.net.au [203.59.1.155]) by
	relay.mimecast.com with ESMTP id us-mta-590-ZU5NZICMPtSSLq_XsiXocQ-1;
	Mon, 18 Jan 2021 15:35:32 -0500
X-MC-Unique: ZU5NZICMPtSSLq_XsiXocQ-1
X-SMTP-MATCH: 1
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BsCQDE8AVg/1enWttiHAEBAQEBAQc?=
	=?us-ascii?q?BARIBAQQEAQFHgUiBfIElV4UhiQSGNIIWAziDbJYxDIFcCwEBAQEBAQEBASw?=
	=?us-ascii?q?JAQIEAQGERAQCAoFxJjgTAhABAQEFAQEBAQEGAwGGUgyFdAEFIzMjEAsIBgo?=
	=?us-ascii?q?cDgICVwYBgm1LAYJVAQEuEK8cgTKEQAGBBhOCFAaBDYE9BoE4hnYBgk6DcjW?=
	=?us-ascii?q?BTT+BR4JjPoJdAoFFgzOCYASBTxZfgQwbCAggAoEgCB8BVzGPQoMwiHuKcZE?=
	=?us-ascii?q?TLAeCeoEXBQuGUYE3kjkigyqQEI8whiIYjWGLHJhJgXozGh+CFhiBEE8ZDYF?=
	=?us-ascii?q?KjGMXg06KbDBnAgYKAQEDCVkBAYxFAQE?=
X-IPAS-Result: =?us-ascii?q?A2BsCQDE8AVg/1enWttiHAEBAQEBAQcBARIBAQQEAQFHg?=
	=?us-ascii?q?UiBfIElV4UhiQSGNIIWAziDbJYxDIFcCwEBAQEBAQEBASwJAQIEAQGERAQCA?=
	=?us-ascii?q?oFxJjgTAhABAQEFAQEBAQEGAwGGUgyFdAEFIzMjEAsIBgocDgICVwYBgm1LA?=
	=?us-ascii?q?YJVAQEuEK8cgTKEQAGBBhOCFAaBDYE9BoE4hnYBgk6DcjWBTT+BR4JjPoJdA?=
	=?us-ascii?q?oFFgzOCYASBTxZfgQwbCAggAoEgCB8BVzGPQoMwiHuKcZETLAeCeoEXBQuGU?=
	=?us-ascii?q?YE3kjkigyqQEI8whiIYjWGLHJhJgXozGh+CFhiBEE8ZDYFKjGMXg06KbDBnA?=
	=?us-ascii?q?gYKAQEDCVkBAYxFAQE?=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; 
	d="scan'208,217";a="335192734"
Received: from 219-90-167-87.ip.adam.com.au (HELO swtf.swtf.dyndns.org)
	([219.90.167.87]) by icp-osb-irony-out2.iinet.net.au with ESMTP;
	19 Jan 2021 04:34:49 +0800
Message-ID: <d6bef114749a81897089e2923e0b536784721de0.camel@iinet.net.au>
Subject: Re: Occasional delayed output of events
From: Burn Alting <burn.alting@iinet.net.au>
To: Steve Grubb <sgrubb@redhat.com>, linux-audit@redhat.com, Paul Moore
	<paul@paul-moore.com>
Date: Tue, 19 Jan 2021 07:34:43 +1100
In-Reply-To: <3095712.44csPzL39Z@x2>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<5445873.DvuYhMxLoT@x2>
	<17715c36170.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
	<3095712.44csPzL39Z@x2>
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
Cc: Richard Guy Briggs <rgb@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============4741447312380271423=="

--===============4741447312380271423==
Content-Type: multipart/alternative; boundary="=-cwI/o3B3scLpX6fWQjq/"

--=-cwI/o3B3scLpX6fWQjq/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-01-18 at 09:31 -0500, Steve Grubb wrote:
> On Monday, January 18, 2021 8:54:30 AM EST Paul Moore wrote:
> > > > > I like the N of M concept but there would be a LOT of change -
> > > > > especially
> > > > > for all the non-kernel event sources. The EOE would be the most
> > > > > seamless, but at a cost. My preference is to allow the 2 second 'timer'
> > > > > to be configurable.
> > > > 
> > > > Agree with Burn, numbering the records coming up from the kernel is
> > > > going to be a real nightmare, and not something to consider lightly.
> > > > Especially when it sounds like we don't yet have a root cause for the
> > > > issue.
> > > 
> > > A very long time ago, we had numbered records. But it was decided that
> > > there's no real point in it and we'd rather just save disk space.
> > 
> > With the current kernel code, adding numbered records is not something to
> > take lightly.
> 
> That's why I'm saying we had it and it was removed. I could imagine that if 
> you had auditing of the kill syscall enabled and a whole process group was 
> being killed, you could have hundreds of records that need numbering. No good 
> way to know in advance how many records make up the event.
> 
> > > I know that the kernel does not serialize the events headed for user
> > > space. But I'm curious how an event gets stuck and others can jump ahead
> > > while one that's already inflight can get hung for 4 seconds before it's
> > > next record goes out?
> > 
> > Have you determined that the problem is the kernel? 
> 
> I assume so because the kernel adds the timestamp and choses what hits the 
> socket next. Auditd does no ordering of events. It just looks up the text 
> event ID, some minor translation if the enriched format is being used, and 
> writes it to disk. It can handle well over 100k records per second.
> 
> > Initially it was looking like it was a userspace issue, is that no longer
> > the general thought?
> 
> I don't see how user space could cause this. Even if auditd was slow, it 
> shouldn't take 4 seconds to write to disk and then come back to read another 
> record. And even it did, why would the newest record go out before completing 
> one that's in progress? Something in the kernel chooses what's next. I 
> suspect that might need looking at.
> 
> > Also, is there a reliable reproducer yet?
> 
> I don't know of one. But, I suppose we could modify ausearch to look for 
> examples of this.

Happy to run this where I can. I have also added the auditd.conf and audit.rules
files to my github issue (https://github.com/linux-audit/audit-userspace/issues/148)
that makes this activity more likely to occur if that helps.

Also, to meet the issue of existing ausearch and the auparse library failing to
process audit.log files with such issues, are we happy for a configuration item in
auditd.conf?

> 
> -Steve
> 
> 

--=-cwI/o3B3scLpX6fWQjq/
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Mon, 2021-01-18 at 09:31 -0500, Steve Grubb wrote:</div><blockq=
uote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf soli=
d;padding-left:1ex"><pre>On Monday, January 18, 2021 8:54:30 AM EST Paul Mo=
ore wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; borde=
r-left:2px #729fcf solid;padding-left:1ex"><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><blo=
ckquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf s=
olid;padding-left:1ex"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex=
; border-left:2px #729fcf solid;padding-left:1ex"><pre>I like the N of M co=
ncept but there would be a LOT of change -</pre><pre>especially</pre><pre>f=
or all the non-kernel event sources. The EOE would be the most</pre><pre>se=
amless, but at a cost. My preference is to allow the 2 second 'timer'</pre>=
<pre>to be configurable.</pre></blockquote><pre><br></pre><pre>Agree with B=
urn, numbering the records coming up from the kernel is</pre><pre>going to =
be a real nightmare, and not something to consider lightly.</pre><pre>Espec=
ially when it sounds like we don't yet have a root cause for the</pre><pre>=
issue.</pre></blockquote><pre><br></pre><pre>A very long time ago, we had n=
umbered records. But it was decided that</pre><pre>there's no real point in=
 it and we'd rather just save disk space.</pre></blockquote><pre><br></pre>=
<pre>With the current kernel code, adding numbered records is not something=
 to</pre><pre>take lightly.</pre></blockquote><pre><br></pre><pre>That's wh=
y I'm saying we had it and it was removed. I could imagine that if </pre><p=
re>you had auditing of the kill syscall enabled and a whole process group w=
as </pre><pre>being killed, you could have hundreds of records that need nu=
mbering. No good </pre><pre>way to know in advance how many records make up=
 the event.</pre><pre><br></pre><blockquote type=3D"cite" style=3D"margin:0=
 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><pre>I know that the kernel does not serialize the events headed=
 for user</pre><pre>space. But I'm curious how an event gets stuck and othe=
rs can jump ahead</pre><pre>while one that's already inflight can get hung =
for 4 seconds before it's</pre><pre>next record goes out?</pre></blockquote=
><pre><br></pre><pre>Have you determined that the problem is the kernel? </=
pre></blockquote><pre><br></pre><pre>I assume so because the kernel adds th=
e timestamp and choses what hits the </pre><pre>socket next. Auditd does no=
 ordering of events. It just looks up the text </pre><pre>event ID, some mi=
nor translation if the enriched format is being used, and </pre><pre>writes=
 it to disk. It can handle well over 100k records per second.</pre><pre><br=
></pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2p=
x #729fcf solid;padding-left:1ex"><pre>Initially it was looking like it was=
 a userspace issue, is that no longer</pre><pre>the general thought?</pre><=
/blockquote><pre><br></pre><pre>I don't see how user space could cause this=
. Even if auditd was slow, it </pre><pre>shouldn't take 4 seconds to write =
to disk and then come back to read another </pre><pre>record. And even it d=
id, why would the newest record go out before completing </pre><pre>one tha=
t's in progress? Something in the kernel chooses what's next. I </pre><pre>=
suspect that might need looking at.</pre><pre><br></pre><blockquote type=3D=
"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-le=
ft:1ex"><pre>Also, is there a reliable reproducer yet?</pre></blockquote><p=
re><br></pre><pre>I don't know of one. But, I suppose we could modify ausea=
rch to look for </pre><pre>examples of this.</pre></blockquote><div><br></d=
iv><div>Happy to run this where I can. I have also added the auditd.conf an=
d audit.rules files to my github issue (<a href=3D"https://github.com/linux=
-audit/audit-userspace/issues/148">https://github.com/linux-audit/audit-use=
rspace/issues/148</a>) that makes this activity more likely to occur if tha=
t helps.</div><div><br></div><div>Also, to meet the issue of existing ausea=
rch and the auparse library failing to process audit.log files with such is=
sues, are we happy for a configuration item in auditd.conf?</div><div><br><=
/div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px =
#729fcf solid;padding-left:1ex"><pre><br></pre><pre>-Steve</pre><pre><br></=
pre><pre><br></pre></blockquote></body></html>

--=-cwI/o3B3scLpX6fWQjq/--

--===============4741447312380271423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============4741447312380271423==--


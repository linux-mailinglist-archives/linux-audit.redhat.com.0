Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 12642EC2C9
	for <lists+linux-audit@lfdr.de>; Fri,  1 Nov 2019 13:37:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572611870;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lhw/Z42XB0bvvrZYpg2wYTd363ADpEtogsm55DsLxj4=;
	b=e+ZCMYcpd+x8FZpC5bfIMlJuJDXafTHy6t2APhj8+kvX20t75vuTQtM0aH1uwluTcTMU8G
	ZiqWdgxwP8xqgDIwcdujMSJH3yh48Q6nh/R7K0lIa56hEE1TRRUtHmhkcgp/kJApOlXs1r
	u0VBUC3EMAvXEAUU9C1IQQs8Xq+MHkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-xL-t7f41NiG60OGboDPXcg-1; Fri, 01 Nov 2019 08:37:48 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F152C800683;
	Fri,  1 Nov 2019 12:37:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5A6E1FE04;
	Fri,  1 Nov 2019 12:37:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C76C518089C8;
	Fri,  1 Nov 2019 12:37:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA112XvF025843 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 31 Oct 2019 21:02:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF3355C1C3; Fri,  1 Nov 2019 01:02:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7CAE5C1B5
	for <linux-audit@redhat.com>; Fri,  1 Nov 2019 01:02:30 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246])
	by mx1.redhat.com (Postfix) with ESMTP id 1DF1085537
	for <linux-audit@redhat.com>; Fri,  1 Nov 2019 01:02:30 +0000 (UTC)
Received: from dimstar.local.net (n122-110-44-45.sun2.vic.optusnet.com.au
	[122.110.44.45])
	by mail104.syd.optusnet.com.au (Postfix) with SMTP id CBC1D43E976
	for <linux-audit@redhat.com>; Fri,  1 Nov 2019 12:02:25 +1100 (AEDT)
Received: (qmail 23327 invoked by uid 501); 1 Nov 2019 01:02:25 -0000
Date: Fri, 1 Nov 2019 12:02:25 +1100
From: Duncan Roe <duncan_roe@optusnet.com.au>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH ghak90 V7 20/21] audit: add capcontid to set contid
	outside init_user_ns
Message-ID: <20191101010225.GC18955@dimstar.local.net>
Mail-Followup-To: Steve Grubb <sgrubb@redhat.com>,
	Richard Guy Briggs <rgb@redhat.com>,
	Paul Moore <paul@paul-moore.com>,
	containers@lists.linux-foundation.org, linux-api@vger.kernel.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	linux-fsdevel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
	omosnace@redhat.com, dhowells@redhat.com, simo@redhat.com,
	Eric Paris <eparis@parisplace.org>, Serge Hallyn <serge@hallyn.com>,
	ebiederm@xmission.com, nhorman@tuxdriver.com,
	Dan Walsh <dwalsh@redhat.com>, mpatel@redhat.com
References: <cover.1568834524.git.rgb@redhat.com>
	<CAHC9VhRDoX9du4XbCnBtBzsNPMGOsb-TKM1CC+sCL7HP=FuTRQ@mail.gmail.com>
	<20191030220320.tnwkaj5gbzchcn7j@madcap2.tricolour.ca>
	<3677995.NTHC7m0fHc@x2>
MIME-Version: 1.0
In-Reply-To: <3677995.NTHC7m0fHc@x2>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.2 cv=P6RKvmIu c=1 sm=1 tr=0
	a=4DzML1vCOQ6Odsy8BUtSXQ==:117 a=4DzML1vCOQ6Odsy8BUtSXQ==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=MeAgGD-zjQ4A:10
	a=wokOCyRbhw6_iYDWPRUA:9 a=CjuIK1q_8ugA:10
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 01 Nov 2019 01:02:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Fri, 01 Nov 2019 01:02:30 +0000 (UTC) for IP:'211.29.132.246'
	DOMAIN:'mail104.syd.optusnet.com.au'
	HELO:'mail104.syd.optusnet.com.au'
	FROM:'dunc@dimstar.local.net' RCPT:''
X-RedHat-Spam-Score: 0.3  (HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS, SPF_NONE,
	SUBJ_OBFU_PUNCT_FEW) 211.29.132.246 mail104.syd.optusnet.com.au
	211.29.132.246 mail104.syd.optusnet.com.au
	<dunc@dimstar.local.net>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:37:20 -0400
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: xL-t7f41NiG60OGboDPXcg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Oct 31, 2019 at 10:50:57AM -0400, Steve Grubb wrote:
> Hello,
>
> TLDR;  I see a lot of benefit to switching away from procfs for setting a=
uid &
> sessionid.
>
> On Wednesday, October 30, 2019 6:03:20 PM EDT Richard Guy Briggs wrote:
> > > Also, for the record, removing the audit loginuid from procfs is not
> > > something to take lightly, if at all; like it or not, it's part of th=
e
> > > kernel API.
>
> It can also be used by tools to iterate processes related to one user or
> session. I use this in my Intrusion Prevention System which will land in
> audit user space at some point in the future.
>
>
> > Oh, I'm quite aware of how important this change is and it was discusse=
d
> > with Steve Grubb who saw the concern and value of considering such a
> > disruptive change.
>
> Actually, I advocated for syscall. I think the gist of Eric's idea was th=
at /
> proc is the intersection of many nasty problems. By relying on it, you ca=
n't
> simplify the API to reduce the complexity. Almost no program actually nee=
ds
                                             ^^^^^^ ^^ ^^^^^^^ ^^^^^^^^ ^^^=
^^
> access to /proc. ps does. But almost everything else is happy without it.=
 For
> ^^^^^^ ^^ ^^^^^^ ^^ ^^^^^

Eh?? *top* needs /proc/ps, as do most of the programs in package procps-ng.
Then there's lsof, pgrep (which doesn't fail but can't find anything) and e=
ven
lilo (for Slackware ;)

> example, when you setup chroot jails, you may have to add /dev/random or =
/
> dev/null, but almost never /proc. What does force you to add /proc is any
> entry point daemon like sshd because it needs to set the loginuid. If we
> switch away from /proc, then sshd or crond will no longer /require/ procf=
s to
> be available which again simplifies the system design.
>
>
> > Removing proc support for auid/ses would be a
> > long-term deprecation if accepted.
>
> It might need to just be turned into readonly for a while. But then again=
,
> perhaps auid and session should be part of /proc/<pid>/status? Maybe this=
 can
> be done independently and ahead of the container work so there is a migra=
tion
> path for things that read auid or session. TBH, maybe this should have be=
en
> done from the beginning.
>
> -Steve
>
Cheers ... Duncan.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EFE90EC561
	for <lists+linux-audit@lfdr.de>; Fri,  1 Nov 2019 16:10:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572621004;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zPybxiGeF4JDQmQYf/Cl2WBzgJtgp7k2CuRLyWT1FAI=;
	b=NVGkZYweUTiY5Wwn8v0Ne5La16kTDL5cps6F9kLL7/tAoNbuFTAqTYVuq21nNnSUXAfaqc
	0WOb2SxHrKfWnJOUVIAZaQAMTmbr8wMC9ei+K6MjbY5s9rDZDGNjqi6gCOczIUe9TcjUY7
	yi3iMzh9VjRW6LF4Yu7vFYUNzZq0UyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-Epo3dTUvOK2T9gPRLwyaPQ-1; Fri, 01 Nov 2019 11:10:02 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A91A5800C80;
	Fri,  1 Nov 2019 15:09:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 250971001281;
	Fri,  1 Nov 2019 15:09:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13FD24BB78;
	Fri,  1 Nov 2019 15:09:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA1F9kaH014812 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 1 Nov 2019 11:09:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6A6161000232; Fri,  1 Nov 2019 15:09:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B445810016E8;
	Fri,  1 Nov 2019 15:09:30 +0000 (UTC)
Date: Fri, 1 Nov 2019 11:09:27 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH ghak90 V7 20/21] audit: add capcontid to set contid
	outside init_user_ns
Message-ID: <20191101150927.c5sf3n5ezfg2eano@madcap2.tricolour.ca>
References: <cover.1568834524.git.rgb@redhat.com>
	<CAHC9VhRDoX9du4XbCnBtBzsNPMGOsb-TKM1CC+sCL7HP=FuTRQ@mail.gmail.com>
	<20191030220320.tnwkaj5gbzchcn7j@madcap2.tricolour.ca>
	<3677995.NTHC7m0fHc@x2>
MIME-Version: 1.0
In-Reply-To: <3677995.NTHC7m0fHc@x2>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Epo3dTUvOK2T9gPRLwyaPQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 2019-10-31 10:50, Steve Grubb wrote:
> Hello,
>=20
> TLDR;  I see a lot of benefit to switching away from procfs for setting a=
uid &=20
> sessionid.
>=20
> On Wednesday, October 30, 2019 6:03:20 PM EDT Richard Guy Briggs wrote:
> > > Also, for the record, removing the audit loginuid from procfs is not
> > > something to take lightly, if at all; like it or not, it's part of th=
e
> > > kernel API.
>=20
> It can also be used by tools to iterate processes related to one user or=
=20
> session. I use this in my Intrusion Prevention System which will land in=
=20
> audit user space at some point in the future.
>=20
> > Oh, I'm quite aware of how important this change is and it was discusse=
d
> > with Steve Grubb who saw the concern and value of considering such a
> > disruptive change.
>=20
> Actually, I advocated for syscall. I think the gist of Eric's idea was th=
at /
> proc is the intersection of many nasty problems. By relying on it, you ca=
n't=20
> simplify the API to reduce the complexity. Almost no program actually nee=
ds=20
> access to /proc. ps does. But almost everything else is happy without it.=
 For=20
> example, when you setup chroot jails, you may have to add /dev/random or =
/
> dev/null, but almost never /proc. What does force you to add /proc is any=
=20
> entry point daemon like sshd because it needs to set the loginuid. If we=
=20
> switch away from /proc, then sshd or crond will no longer /require/ procf=
s to=20
> be available which again simplifies the system design.
>=20
> > Removing proc support for auid/ses would be a
> > long-term deprecation if accepted.
>=20
> It might need to just be turned into readonly for a while. But then again=
,=20
> perhaps auid and session should be part of /proc/<pid>/status? Maybe this=
 can=20
> be done independently and ahead of the container work so there is a migra=
tion=20
> path for things that read auid or session. TBH, maybe this should have be=
en=20
> done from the beginning.

How about making loginuid/contid/capcontid writable only via netlink but
still provide the /proc interface for reading?  Deprecation of proc can
be left as a decision for later.  This way sshd/crond/getty don't need
/proc, but the info is still there for tools that want to read it.

> -Steve

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


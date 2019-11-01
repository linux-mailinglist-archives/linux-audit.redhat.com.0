Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 625A4EC576
	for <lists+linux-audit@lfdr.de>; Fri,  1 Nov 2019 16:14:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572621248;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3VnrbfknUXl+DCKgb8cQagMaFZritmxq1jVIr+wHfeY=;
	b=Ig58tfPuxInE10dExt0dwmryW+9+UW7GmRIzr5ugZuqoFufqF3UnxBJBT/+J4UG2EasXHR
	z8becap+SSZcgM1d/Yuhu5Hk628EALaHoKrNZRL2B2IcWJPHO5iWt7aMl6sfR6C1lz9UGq
	51+tE/3qntGk3Ktz4OUABilmTZxIySg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-Mazu3xq0PHaGq-ceKnOS9Q-1; Fri, 01 Nov 2019 11:14:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7418B1005509;
	Fri,  1 Nov 2019 15:14:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A14A5C28E;
	Fri,  1 Nov 2019 15:14:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BCEFC18034E9;
	Fri,  1 Nov 2019 15:13:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA1FDuVR015523 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 1 Nov 2019 11:13:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A79C95D70D; Fri,  1 Nov 2019 15:13:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-239.phx2.redhat.com [10.3.116.239])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 766295D6B7;
	Fri,  1 Nov 2019 15:13:47 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak90 V7 20/21] audit: add capcontid to set contid
	outside init_user_ns
Date: Fri, 01 Nov 2019 11:13:45 -0400
Message-ID: <1592218.lpl3eoh2c6@x2>
Organization: Red Hat
In-Reply-To: <20191101150927.c5sf3n5ezfg2eano@madcap2.tricolour.ca>
References: <cover.1568834524.git.rgb@redhat.com> <3677995.NTHC7m0fHc@x2>
	<20191101150927.c5sf3n5ezfg2eano@madcap2.tricolour.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Mazu3xq0PHaGq-ceKnOS9Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Friday, November 1, 2019 11:09:27 AM EDT Richard Guy Briggs wrote:
> On 2019-10-31 10:50, Steve Grubb wrote:
> > Hello,
> >=20
> > TLDR;  I see a lot of benefit to switching away from procfs for setting
> > auid & sessionid.
> >=20
> > On Wednesday, October 30, 2019 6:03:20 PM EDT Richard Guy Briggs wrote:
> > > > Also, for the record, removing the audit loginuid from procfs is no=
t
> > > > something to take lightly, if at all; like it or not, it's part of
> > > > the
> > > > kernel API.
> >=20
> > It can also be used by tools to iterate processes related to one user o=
r
> > session. I use this in my Intrusion Prevention System which will land i=
n
> > audit user space at some point in the future.
> >=20
> > > Oh, I'm quite aware of how important this change is and it was
> > > discussed
> > > with Steve Grubb who saw the concern and value of considering such a
> > > disruptive change.
> >=20
> > Actually, I advocated for syscall. I think the gist of Eric's idea was
> > that / proc is the intersection of many nasty problems. By relying on
> > it, you can't simplify the API to reduce the complexity. Almost no
> > program actually needs access to /proc. ps does. But almost everything
> > else is happy without it. For example, when you setup chroot jails, you
> > may have to add /dev/random or / dev/null, but almost never /proc. What
> > does force you to add /proc is any entry point daemon like sshd because
> > it needs to set the loginuid. If we switch away from /proc, then sshd o=
r
> > crond will no longer /require/ procfs to be available which again
> > simplifies the system design.
> >=20
> > > Removing proc support for auid/ses would be a
> > > long-term deprecation if accepted.
> >=20
> > It might need to just be turned into readonly for a while. But then
> > again,
> > perhaps auid and session should be part of /proc/<pid>/status? Maybe th=
is
> > can be done independently and ahead of the container work so there is a
> > migration path for things that read auid or session. TBH, maybe this
> > should have been done from the beginning.
>=20
> How about making loginuid/contid/capcontid writable only via netlink but
> still provide the /proc interface for reading?  Deprecation of proc can
> be left as a decision for later.  This way sshd/crond/getty don't need
> /proc, but the info is still there for tools that want to read it.

This also sounds good to me. But I still think loginuid and audit sessionid=
=20
should get written in /proc/<pid>/status so that all process information is=
=20
consolidated in one place.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E42ACEB329
	for <lists+linux-audit@lfdr.de>; Thu, 31 Oct 2019 15:51:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572533493;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N+uGtgognEO9bXH7HP1NA5TU+r/Eib2z/OA8PTrUYo0=;
	b=QOjWxadjTL5/AqG+DdHwTvCBxaIOHNAQYlxcN/yXRDooCnqjHIZ4H1+bRFDAJo2WyCzvXz
	08jyXognmJuRq4VJhl/xHfCQTInaQ3tzxLKOe+kJ6CLXjbveq4I20wWTD4zpf3WIvJvAw7
	RMBc0bwlFcF2+RK7pdpP40KRYvOyxzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-8gjZscgGMCOyK9Xukm1Z9g-1; Thu, 31 Oct 2019 10:51:31 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B6D41005502;
	Thu, 31 Oct 2019 14:51:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1D7C60878;
	Thu, 31 Oct 2019 14:51:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17A8D4BB65;
	Thu, 31 Oct 2019 14:51:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9VEpD6M019010 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 31 Oct 2019 10:51:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1136B608AC; Thu, 31 Oct 2019 14:51:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-13.phx2.redhat.com [10.3.117.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B3E160878;
	Thu, 31 Oct 2019 14:50:58 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak90 V7 20/21] audit: add capcontid to set contid
	outside init_user_ns
Date: Thu, 31 Oct 2019 10:50:57 -0400
Message-ID: <3677995.NTHC7m0fHc@x2>
Organization: Red Hat
In-Reply-To: <20191030220320.tnwkaj5gbzchcn7j@madcap2.tricolour.ca>
References: <cover.1568834524.git.rgb@redhat.com>
	<CAHC9VhRDoX9du4XbCnBtBzsNPMGOsb-TKM1CC+sCL7HP=FuTRQ@mail.gmail.com>
	<20191030220320.tnwkaj5gbzchcn7j@madcap2.tricolour.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 8gjZscgGMCOyK9Xukm1Z9g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hello,

TLDR;  I see a lot of benefit to switching away from procfs for setting aui=
d &=20
sessionid.

On Wednesday, October 30, 2019 6:03:20 PM EDT Richard Guy Briggs wrote:
> > Also, for the record, removing the audit loginuid from procfs is not
> > something to take lightly, if at all; like it or not, it's part of the
> > kernel API.

It can also be used by tools to iterate processes related to one user or=20
session. I use this in my Intrusion Prevention System which will land in=20
audit user space at some point in the future.


> Oh, I'm quite aware of how important this change is and it was discussed
> with Steve Grubb who saw the concern and value of considering such a
> disruptive change.

Actually, I advocated for syscall. I think the gist of Eric's idea was that=
 /
proc is the intersection of many nasty problems. By relying on it, you can'=
t=20
simplify the API to reduce the complexity. Almost no program actually needs=
=20
access to /proc. ps does. But almost everything else is happy without it. F=
or=20
example, when you setup chroot jails, you may have to add /dev/random or /
dev/null, but almost never /proc. What does force you to add /proc is any=
=20
entry point daemon like sshd because it needs to set the loginuid. If we=20
switch away from /proc, then sshd or crond will no longer /require/ procfs =
to=20
be available which again simplifies the system design.


> Removing proc support for auid/ses would be a
> long-term deprecation if accepted.

It might need to just be turned into readonly for a while. But then again,=
=20
perhaps auid and session should be part of /proc/<pid>/status? Maybe this c=
an=20
be done independently and ahead of the container work so there is a migrati=
on=20
path for things that read auid or session. TBH, maybe this should have been=
=20
done from the beginning.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


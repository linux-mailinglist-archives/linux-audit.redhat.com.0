Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id AB83FF5A08
	for <lists+linux-audit@lfdr.de>; Fri,  8 Nov 2019 22:39:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573249169;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9t0+MCxJCvTKhXpI7HSZkcFyc8oauGU3XC+FPeTwdko=;
	b=e917Z6xmcbCHns1sr2ZQueSCPWqd/W3f6/5Q1s85QMmf4SD8J0FlLk52qr0BqFVb/x/HAI
	ylb8H4J2CfH8ZmJsZY1eDDVI3VspbvyCUHJT6gSKr1j8yz23mKZWjRy3swCIOUcfCX1BmW
	S6kYUdM7HpHZ3qEs5U2tN1mrTQ7l8rE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-nhnvMnasPiGhnIuHwhsW5Q-1; Fri, 08 Nov 2019 16:39:26 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82BF51800D9C;
	Fri,  8 Nov 2019 21:39:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF4025C298;
	Fri,  8 Nov 2019 21:39:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5312918034E9;
	Fri,  8 Nov 2019 21:39:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8LdAfH006829 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 16:39:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1BC00600CA; Fri,  8 Nov 2019 21:39:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from ivy-bridge (ovpn-116-31.ams2.redhat.com [10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C2BA600C9;
	Fri,  8 Nov 2019 21:39:06 +0000 (UTC)
Date: Fri, 8 Nov 2019 22:39:05 +0100
From: Steve Grubb <sgrubb@redhat.com>
To: "John T Olson" <jtolson@us.ibm.com>
Subject: Re: Not seeing access denied audit messages in restricted
	subdirectories
Message-ID: <20191108223905.773a79d3@ivy-bridge>
In-Reply-To: <OF3C0EFCFA.EE160C73-ON002584AC.006EBA93-072584AC.0071860C@notes.na.collabserv.com>
References: <OF3C0EFCFA.EE160C73-ON002584AC.006EBA93-072584AC.0071860C@notes.na.collabserv.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-MC-Unique: nhnvMnasPiGhnIuHwhsW5Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Fri, 8 Nov 2019 13:39:58 -0700
"John T Olson" <jtolson@us.ibm.com> wrote:

> Greetings,
>=20
> I have the following 2 audit rules set up:
>=20
> -a always,exit -F arch=3Db64 -S all -F exit=3D-EACCES -F dir=3D/gpfs/fs1
> -a always,exit -F arch=3Db64 -S all -F exit=3D-EPERM -F dir=3D/gpfs/fs1
>=20
> I have a directory structure like the following:
>=20
> (13:15:26) zippleback-vm1:~ # ls -la /gpfs/fs1/test/
> total 257
> drwx------.  3 root root   4096 Nov  7 12:46 .
> drwxr-xr-x. 15 root root 262144 Nov  7 12:50 ..
> drwx------.  2 root root   4096 Nov  7 12:46 test2
>=20
> Essentially, directory "/gpfs/fs1/test/" is owned by root and has
> permissions 700.  The subdirectory underneath it (with
> path /gpfs/fs1/test/test2) is also owned by root and has permissions
> 700.
>=20
> When I have a non-root user attempt to list the contents of directory
> "/gpfs/fs1/test/" I receive an audit message for the denied access.
> However, when the non-root user attempts to list the contents of the
> subdirectory (/gpfs/fs1/test/test2), there is no audit message
> generated. Does anyone know why this is and how I get audit messages
> in both cases?

Yes, the reason is because the path did not resolve so audit never saw
it. This has been this way for quite some time. In the past, it was
said because the path never resolved, a PATH record with all attributes
could not be generated. I have mentioned to kernel maintainers, that
the path is available as a syscall argument. While a full PATH record
cannot be generated with file attributes, an abbreviated one could be
generated. So, far...no one has saw this as a big enough problem to
fix. Personally, I think it should be fixed.

-Steve

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


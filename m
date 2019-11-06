Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 52110F1BA6
	for <lists+linux-audit@lfdr.de>; Wed,  6 Nov 2019 17:50:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573059032;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Eu3X+7yxSu4GTaYp9+XCe3OkiLjKM3aiz5RQjdYnsSQ=;
	b=M80azVArhcfoUo+g0aoTshzRxV01DRaEAjg+mxLBEg4LYyeEkCutxJ9yRTYqRwrGBIiMcv
	AwJN/nBZ2ZAe4CbRzrRIR8O+59ojjm9o/91RvCEgXfmH8QR9BWqkJRYGE4cZ5J7pTqd9d5
	47lcSF5x7Q0g75v9r4vAI3d4tN9FpWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-BftLD6OZNYGJA6ivq6p18g-1; Wed, 06 Nov 2019 11:50:30 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 791948017DD;
	Wed,  6 Nov 2019 16:50:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAC2E1001B35;
	Wed,  6 Nov 2019 16:50:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99DD54BB65;
	Wed,  6 Nov 2019 16:50:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA6Go0ol012930 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 6 Nov 2019 11:50:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7BA8D5D713; Wed,  6 Nov 2019 16:50:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-62.phx2.redhat.com [10.3.117.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 195C25D70D;
	Wed,  6 Nov 2019 16:49:57 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: RHEL 8  audit rules
Date: Wed, 06 Nov 2019 11:49:56 -0500
Message-ID: <11239651.W6AYHMhLza@x2>
Organization: Red Hat
In-Reply-To: <5F4EE10832231F4F921A255C1D95429819F47E@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D95429819F47E@DEERLM99EX7MSX.ww931.my-it-solutions.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
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
X-MC-Unique: BftLD6OZNYGJA6ivq6p18g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Wednesday, November 6, 2019 4:39:54 AM EST MAUPERTUIS, PHILIPPE wrote:
> The rules proposed in /usr/share/doc/audit/rules/ contain 32 bits stuff.
> For example :
> ## 10.2.5.b All elevation of privileges is logged
> -a always,exit -F arch=3Db64 -S setuid -F a0=3D0 -F exe=3D/usr/bin/su -F
> key=3D10.2.5.b-elevated-privs-session -a always,exit -F arch=3Db32 -S set=
uid
> -F a0=3D0 -F exe=3D/usr/bin/su -F key=3D10.2.5.b-elevated-privs-session
>=20
> Is it still necessary for RHEL 8 ?

For RHEL8 itself, no. But the 32 bit ABI is available for legacy programs.

> Would the 21-no32bit.rules be enough ?

If you know for certain that no 32 bit apps will ever be used, then yes. An=
d=20
then you can also delete all 32 bit rules to improve performance.

This gives me an idea that perhaps the sample rules could be split up into =
32=20
and 64 bit so that we can improve system performance ever so slightly.

> Can we run any 32 bits binary on rhel 8 ?

Yep. And that also means that a malicious python program can call the 32bit=
=20
ABI in an attempt at avoiding detection.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


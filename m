Return-Path: <linux-audit-bounces@listman.redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by mail.lfdr.de (Postfix) with ESMTP id 0055A31D061
	for <lists+linux-audit@lfdr.de>; Tue, 16 Feb 2021 19:47:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613501236;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FwLvyW2/gtLqqxdmp4U/jbtV4GbQ7VulA0PComBmebo=;
	b=RAnIvgUdbKU6Qd5rfToccWIhIe9XESNITy3hbHAcClNptE+u0Wz10H8Panuk4yo8vIk8EM
	cS8/LBSLRnMpYpB7Z5Z05TO94+4xXuQq6sujuzdfU+ol8VYafycEelT/M7lkJPOBIY7WZ5
	zLZqZWVXIBzSCjlQVVD+7jPBEkJ/JkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-ughQEgCWNoK-5CdqxSIaeQ-1; Tue, 16 Feb 2021 13:47:11 -0500
X-MC-Unique: ughQEgCWNoK-5CdqxSIaeQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3968F1E565;
	Tue, 16 Feb 2021 18:47:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F29DD6F45E;
	Tue, 16 Feb 2021 18:47:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DDAB50033;
	Tue, 16 Feb 2021 18:47:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11GIk0RJ022187 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 13:46:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8DACC10023AB; Tue, 16 Feb 2021 18:46:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-192.rdu2.redhat.com [10.10.113.192])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D4DD10023AD;
	Tue, 16 Feb 2021 18:45:56 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com, Alan Evangelista <alan.vitor@gmail.com>
Subject: Re: Building user-space audit
Date: Tue, 16 Feb 2021 13:45:56 -0500
Message-ID: <1849894.PYKUYFuaPT@x2>
Organization: Red Hat
In-Reply-To: <CAKz+TUs86e8Rh=DmSGOjK+KEjP6TLAhGoe3MdhN6xwBT3eWrLQ@mail.gmail.com>
References: <CAKz+TUs86e8Rh=DmSGOjK+KEjP6TLAhGoe3MdhN6xwBT3eWrLQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@listman.redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.listman.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@listman.redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@listman.redhat.com>
List-Help: <mailto:linux-audit-request@listman.redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@listman.redhat.com?subject=subscribe>
Sender: linux-audit-bounces@listman.redhat.com
Errors-To: linux-audit-bounces@listman.redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hello,

On Saturday, February 13, 2021 12:26:45 PM EST Alan Evangelista wrote:
> I'm trying to build the user-space part of the Linux Auditing Framework i=
n
> https://github.com/linux-audit/audit-userspace. First, the README tells m=
e
> to "see the README-install file" for building instructions and there is n=
o
> such file.

All of that needs replacing.

> Second, I tried the standard build procedure using autotools:
>=20
> aclocal; autoconf; automake; ./configure; make

There is an autogen file which should automate the steps to get to the=20
configure line.

> ./configure fails with the following error message:
>=20
> configure: error: zos remote support was requested but the openldap libra=
ry
> was not found

You have to disable-zos-remote to get rid of that.

> - Is there any out-of-the-box way to build a *minimal* auditd for the
> x86_64 platform or I'd need to remove non-essential features such as zos
> remote support manually (in this case, removing it from configure.ac) ?

A minimal config looks like this:

./configure --sbindir=3D/sbin --libdir=3D/usr/lib64  --with-python=3Dno \
           --with-python3=3Dno  --disable-listener \
           --with-libcap-ng=3Dyes  --disable-zos-remote \
           --enable-systemd


> - If there is not, where are the build dependencies documented?

They are stated in the audit.spec file. But for a minimal config would have=
=20
these dependencies:

BuildRequires: libcap-ng-devel
BuildRequires: kernel-headers >=3D 2.6.29
BuildRequires: systemd

-Steve


--
Linux-audit mailing list
Linux-audit@listman.redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


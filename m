Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B3EE2102F68
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 23:34:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574202860;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HLK9tv5N30MW1S7HIFoXz0SEjNmIL898ow3OFaswGb4=;
	b=he0SpjEAuxSNFl1ypuwBAIwPhaMCOxmRRP95L56ZFuv7uJg+nEWDwOUQEZoJtAWls3XV6B
	XeoSIvC03rMr72gaFsC/piwJh093Zjjiud4l7tAOT7olAwlZCgpIIzO5ZES59dYaWLgdX6
	6qAh3XX4AyJv30TfY238sM6oJqZs1B0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-jG8oEt6lOL-2ewKjWqeD4w-1; Tue, 19 Nov 2019 17:34:18 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFAD8911E8;
	Tue, 19 Nov 2019 22:34:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DB5E25273;
	Tue, 19 Nov 2019 22:34:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 472DD4BB65;
	Tue, 19 Nov 2019 22:34:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJMY9H9009417 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 17:34:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 501F146E8C; Tue, 19 Nov 2019 22:34:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from ivy-bridge (ovpn-116-82.ams2.redhat.com [10.36.116.82])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A64185D6B7;
	Tue, 19 Nov 2019 22:34:05 +0000 (UTC)
Date: Tue, 19 Nov 2019 23:34:12 +0100
From: Steve Grubb <sgrubb@redhat.com>
To: Tim Galyean <tgalyean@splunk.com>
Subject: Re: Auditd SYSCALL argument decoding
Message-ID: <20191119233412.436030c1@ivy-bridge>
In-Reply-To: <2B96DB9C-982F-4B8D-94A9-AC08073A55E3@splunk.com>
References: <2B96DB9C-982F-4B8D-94A9-AC08073A55E3@splunk.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-MC-Unique: jG8oEt6lOL-2ewKjWqeD4w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Tue, 19 Nov 2019 17:24:21 +0000
Tim Galyean <tgalyean@splunk.com> wrote:

> Hello,
>=20
> As I understand it, long values recorded by auditd are stored as hex
> encoded strings. However, when I attempt to decode arguments such as
> a0 or a1 in SYSCALL events, they are decoded into special characters
> instead of ASCII. Are these values encoded differently than PROCTITLE
> events?
>=20
> Below is an example log line:
>=20
> type=3DSYSCALL msg=3Daudit(1574182099.559:2002): arch=3Dc000003e syscall=
=3D59
> success=3Dyes exit=3D0 a0=3D55df330a3c10 a1=3D55df330a3c78 a2=3D55df330a3=
c90
> a3=3D0 items=3D3 ppid=3D29664 pid=3D29678 auid=3D1171 uid=3D0 gid=3D0 eui=
d=3D0 suid=3D0
> fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D170 comm=3D"apt-=
check"
> exe=3D"/usr/bin/python3.5" key=3D"rootcmd"
>=20
> In this example, I am looking to decode a0, a1, and a2. Yes, it seems
> that ausearch can decode these values. However, I am looking to
> decode them via Splunk.

Please have auparse decode them. This is well maintained and accurate.
Sometimes they point to memory. Sometimes they have meaning. All of
this is encoded in the auparse library. Let me know if you have any
issues decoding anything via libauparse.

> What format are these strings encoded in and is there a way to
> decode these values in any other way other than by using ausearch?

Libauparse is what ausearch uses. It has all knowledge encoded within
it. It detangles intertwined events as well as normal events.

-Steve

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


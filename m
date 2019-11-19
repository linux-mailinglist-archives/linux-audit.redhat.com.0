Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F0504102F49
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 23:27:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574202437;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kjTmCf8KdF9uAoMaBC83GEieKUxtvnQ3zkCJqaeNjaQ=;
	b=E8Pab5SaG/6a3P9wFdbAWnpWnGxjoVAa5wPR2Y+6LUvKXFU95/xIk7wBQUOEFcRRUQGGIF
	5SfeY3acsQ1R3QNS2cnK1uYakG0ft2Lac3TmDejmHcXeXW+3BRht9lxJIEH80cXl1uCJOO
	yo6Jk/Aq4rFrU44/QwvhXRXUE1gH4JY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-RhALlkV_PbOS8oLDXumrlw-1; Tue, 19 Nov 2019 17:27:15 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20785800EBE;
	Tue, 19 Nov 2019 22:27:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2913D1FF;
	Tue, 19 Nov 2019 22:27:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6CA0B4BB65;
	Tue, 19 Nov 2019 22:27:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJMR2O0009057 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 17:27:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 784B346E92; Tue, 19 Nov 2019 22:27:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-14.phx2.redhat.com [10.3.112.14])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E62215D6B7;
	Tue, 19 Nov 2019 22:26:56 +0000 (UTC)
Date: Tue, 19 Nov 2019 17:26:53 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Tim Galyean <tgalyean@splunk.com>
Subject: Re: Auditd SYSCALL argument decoding
Message-ID: <20191119222653.akgvfahcjfcjvtgf@madcap2.tricolour.ca>
References: <2B96DB9C-982F-4B8D-94A9-AC08073A55E3@splunk.com>
MIME-Version: 1.0
In-Reply-To: <2B96DB9C-982F-4B8D-94A9-AC08073A55E3@splunk.com>
User-Agent: NeoMutt/20180716
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: RhALlkV_PbOS8oLDXumrlw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 2019-11-19 17:24, Tim Galyean wrote:
> Hello,
>=20
> As I understand it, long values recorded by auditd are stored as hex enco=
ded strings. However, when I attempt to decode arguments such as a0 or a1 i=
n SYSCALL events, they are decoded into special characters instead of ASCII=
. Are these values encoded differently than PROCTITLE events?

They are unsigned long long integers printed in hexadecimal, which is
the pointer size on 64-bit architectures.  These are pointers to the
memory location containing the string, so we don't actually have the
string value.

> Below is an example log line:
>=20
> type=3DSYSCALL msg=3Daudit(1574182099.559:2002): arch=3Dc000003e syscall=
=3D59 success=3Dyes exit=3D0 a0=3D55df330a3c10 a1=3D55df330a3c78 a2=3D55df3=
30a3c90 a3=3D0 items=3D3 ppid=3D29664 pid=3D29678 auid=3D1171 uid=3D0 gid=
=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) s=
es=3D170 comm=3D"apt-check" exe=3D"/usr/bin/python3.5" key=3D"rootcmd"
>=20
> In this example, I am looking to decode a0, a1, and a2. Yes, it seems tha=
t ausearch can decode these values. However, I am looking to decode them vi=
a Splunk. What format are these strings encoded in and is there a way to de=
code these values in any other way other than by using ausearch?

My understanding is that ausearch does not have access to the original
strings to decode them.  The kernel does have access to the full string
at the time of the generation of the message, but does not include it in
the record format due to the lack of knowledge of every syscall format
to know which ones to decode and due to netlink bandwidth and disk
storage limits.

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


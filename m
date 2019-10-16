Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 42553D9A45
	for <lists+linux-audit@lfdr.de>; Wed, 16 Oct 2019 21:37:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C72DD2D6A3E;
	Wed, 16 Oct 2019 19:37:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E20919C6A;
	Wed, 16 Oct 2019 19:37:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE9CD4EE50;
	Wed, 16 Oct 2019 19:37:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9GJaxd0014360 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 16 Oct 2019 15:36:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7800A1001B0B; Wed, 16 Oct 2019 19:36:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71CEF1001B11
	for <linux-audit@redhat.com>; Wed, 16 Oct 2019 19:36:56 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC6BE89F303
	for <linux-audit@redhat.com>; Wed, 16 Oct 2019 19:36:55 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id r4so22246991edy.4
	for <linux-audit@redhat.com>; Wed, 16 Oct 2019 12:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cs-stonybrook-edu.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=mzu2+LyfVoa/0ZDwhoAP14GLRnQgzpvFi8tqA9DCDEs=;
	b=SjOXe98OoAdTwAbQncuKLPASwONmFP9yeGUFbQilUgo50UOLqsUVwaFWoiG9w8lEJq
	gBuM1Bs0PyiC+QmPbdMRu3pRoxVlbDaTSryOeocAEgamjeKucg1zSGf+WG0FVGKUS1Iu
	6X7JnjZLMKShTWaRrBUJUvNRgqG1JCAaFzeiwWZPOiO/p+qc3kXgf5x5KcrfpJ2NCUBO
	ubvGh5xa67ELfu1hqpYnwq7JO5NBJ/j4XC8wdIcVQFJFaQF4In/3ID06rguvOVhjf3Vx
	qcPmzyskj2v7PfmEHALONo0iJSztyVhaiTwcRMpiT4n6M6ta3we6Kp4NQRjhr9NaFHu6
	drKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=mzu2+LyfVoa/0ZDwhoAP14GLRnQgzpvFi8tqA9DCDEs=;
	b=IUM9tA77McjYPq8UKlMfxhP65cvpJAuCl/FIJTsenU78YQJSPXKTXKeN35xTxJckMb
	plFsrMyf9ZFyYm+l0v9rz/JhL6Hwz0nE3MpYnLJnnjYArMaUh3u9VG3TZOLPK9lodFCM
	okD3GGFEvvTYACqW6nPSLT52NAS0xg+ZZ62cgccTVWjqHWdIX5Tvat8luThuwQtj2Ik/
	A2MgnOO7nPdqznXYNjs2RNlbGhZgXCdZcMet2gT128WtSOWhonYDLBDASKG0xIRJO1zx
	c7D1nFVAlRtlYhMvYbCLhmcNyhslrYs9+k7+x7+XmRy7PDiPM1zqS+sOfZ8queaV5Lm8
	flrw==
X-Gm-Message-State: APjAAAV6+Dv3tYeqzrhy6sYHmLzoj4c5YYLORsPH/WX2e8itc7ItxU76
	B3+smbvre2+XmfNhSCUH/ZfVtpCeTIcByn1BoE3LuEmtOfE=
X-Google-Smtp-Source: APXvYqwJB/z+K9+bAxAA1Eihh1fil01KXsQ+6soxxEq18+K2zeM7wx4VwiDSd6jp9lwsFIFZpmg08+Uvhv2XydAZP6o=
X-Received: by 2002:aa7:cfd4:: with SMTP id r20mr40717846edy.268.1571254614298;
	Wed, 16 Oct 2019 12:36:54 -0700 (PDT)
MIME-Version: 1.0
From: Ankitha Kundhuru <akundhuru@cs.stonybrook.edu>
Date: Wed, 16 Oct 2019 15:36:43 -0400
Message-ID: <CAG-5c_ERofGJWMKv0SZiSZvsRdLYLboBP4anZYOChpvL-=Wq+Q@mail.gmail.com>
Subject: New field seen in audit.log
To: linux-audit@redhat.com, Steve Grubb <sgrubb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Wed, 16 Oct 2019 19:36:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Wed, 16 Oct 2019 19:36:56 +0000 (UTC) for IP:'209.85.208.47'
	DOMAIN:'mail-ed1-f47.google.com' HELO:'mail-ed1-f47.google.com'
	FROM:'akundhuru@cs.stonybrook.edu' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.208.47 mail-ed1-f47.google.com 209.85.208.47
	mail-ed1-f47.google.com <akundhuru@cs.stonybrook.edu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
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
Content-Type: multipart/mixed; boundary="===============7370293131445665024=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 16 Oct 2019 19:37:58 +0000 (UTC)

--===============7370293131445665024==
Content-Type: multipart/alternative; boundary="000000000000232cd205950c390b"

--000000000000232cd205950c390b
Content-Type: text/plain; charset="UTF-8"

Hi All,

I found a new word "per" in some of the records of my audit.log.
Any idea of why this happened and what it means ?

type=SYSCALL msg=audit(1571245536.351:43593): arch=c000003e syscall=3
*per=40000* success=yes exit=0 a0=5 a1=5 a2=556213b6d6bc a3=7f483b98bcc0
items=0 ppid=2653 pid=2655 auid=1000 uid=1000 gid=1000 euid=1000 suid=1000
fsuid=1000 egid=1000 sgid=1000 fsgid=1000 tty=pts1 ses=3 comm="gdb"
exe="/usr/bin/gdb" key=(null)

Thank you :)

Thanks & Regards,
Ankitha Kundhuru

--000000000000232cd205950c390b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>I found a new word &quot;per&qu=
ot; in some of the records of my audit.log.</div><div>Any idea of why this=
=C2=A0happened and what it means ?</div><div><br></div><div>type=3DSYSCALL =
msg=3Daudit(1571245536.351:43593): arch=3Dc000003e syscall=3D3 <font color=
=3D"#0000ff"><b>per=3D40000</b></font> success=3Dyes exit=3D0 a0=3D5 a1=3D5=
 a2=3D556213b6d6bc a3=3D7f483b98bcc0 items=3D0 ppid=3D2653 pid=3D2655 auid=
=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=3D1000 egid=3D1=
000 sgid=3D1000 fsgid=3D1000 tty=3Dpts1 ses=3D3 comm=3D&quot;gdb&quot; exe=
=3D&quot;/usr/bin/gdb&quot; key=3D(null)</div><div><br></div><div>Thank you=
 :)</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signat=
ure" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Thanks &amp; Regar=
ds,<div>Ankitha Kundhuru</div></div></div></div></div></div>

--000000000000232cd205950c390b--


--===============7370293131445665024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============7370293131445665024==--


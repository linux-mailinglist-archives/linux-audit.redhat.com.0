Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F70A7619
	for <lists+linux-audit@lfdr.de>; Tue,  3 Sep 2019 23:20:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 248047F761;
	Tue,  3 Sep 2019 21:20:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE8C31001956;
	Tue,  3 Sep 2019 21:20:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D7AA1802217;
	Tue,  3 Sep 2019 21:20:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83LFmCJ027450 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 17:15:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B563A60127; Tue,  3 Sep 2019 21:15:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFC99600C1
	for <linux-audit@redhat.com>; Tue,  3 Sep 2019 21:15:46 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC12B8553A
	for <linux-audit@redhat.com>; Tue,  3 Sep 2019 21:15:44 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id y91so8218874ede.9
	for <linux-audit@redhat.com>; Tue, 03 Sep 2019 14:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cs-stonybrook-edu.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=ZZ81oyYqMMwxkjkj8DuQf8vNaDETBGuLY1JryOA12dA=;
	b=UnLF9fEiU9J8prWEw5f+lWGnP/A72YLNHeUSPfhsp6w4WIScYA/ioiYosky+ulgglR
	jYVSeB/TM1FhdPRQYR+zqCd/Ta6BLqLr74xREboxEzc70V9oDAXMnyEbN93NAARblaCS
	wSnA/QMGNs5+2FhjtlL2Clj6uNdiMfJZmIEDjFqyxZUsPvVaeO+IxIb50MGPsDfofPIa
	d+ttggK/Fo6Gb29PQPBhDLh3JRAIZNocPbKJ9S00H24gGwYq3HnAHX7sntF4b91S2kAx
	8Lg+feX1O5r3ddovkVQ51xpUqp29tWbr/O72ljSEYsIyDczwxL8M4by87V2CJFvzcJHg
	0jkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ZZ81oyYqMMwxkjkj8DuQf8vNaDETBGuLY1JryOA12dA=;
	b=jgO9t7/SeTBftgCC+u337suDcWNwo3a19xSoArbPbtfYp0RijuLcgJZguVAfugp/N9
	l07PNkCSvq2WKr2HWf2jKKsahQF9opCaRkb2Qr72H2X9yjz1n0hEVIKzpuMx/P1cGmFL
	TRsCVD9Om4klsHMHhdsDXuLcLQmKPKo4g/aaYjnqD0LX92EOb1zbOTTx9l2K2Kdmbc8S
	pY7pp4WOWGHh1s7MUipQVvY62R3+Ol0h6C4YeeDtxwzIhFFpYgQy9oOzOLqvHdtpoaaA
	fKOFkieW+vZBKZt+f+f8WtO3qHgjSCXJL9to5y4TyAOv9Hg+gljxgVLslZijzvqsA4xR
	Z+Hg==
X-Gm-Message-State: APjAAAUih/FNbPRafIptUmBeuO0U/LEq2WbPL0/Xf2Q8paLMTInqpDSK
	ivwweT1AoJnffykJDP6OWK+w4VpQSWpQTUCEAT1T37s3
X-Google-Smtp-Source: APXvYqwmaW+sHje5pI5a/57rybM0E6GewpFQxL4ABVCiQwY+Mb1oaHcSRY0McE2YKlLz4MhNDfL3U+9PQFjg8GPGZ8g=
X-Received: by 2002:a50:ace2:: with SMTP id x89mr38070203edc.268.1567545343576;
	Tue, 03 Sep 2019 14:15:43 -0700 (PDT)
MIME-Version: 1.0
From: Ankitha Kundhuru <akundhuru@cs.stonybrook.edu>
Date: Tue, 3 Sep 2019 17:15:29 -0400
Message-ID: <CAG-5c_G5ULcbh_TEZEefm0VM8XeDW=OJoLBVRq+1=VO-BtMczA@mail.gmail.com>
Subject: Help with audit syscall event output
To: linux-audit@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 03 Sep 2019 21:15:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Tue, 03 Sep 2019 21:15:45 +0000 (UTC) for IP:'209.85.208.52'
	DOMAIN:'mail-ed1-f52.google.com' HELO:'mail-ed1-f52.google.com'
	FROM:'akundhuru@cs.stonybrook.edu' RCPT:''
X-RedHat-Spam-Score: 0  (DKIM_SIGNED, DKIM_VALID, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.208.52 mail-ed1-f52.google.com 209.85.208.52
	mail-ed1-f52.google.com <akundhuru@cs.stonybrook.edu>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 03 Sep 2019 17:20:16 -0400
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
Content-Type: multipart/mixed; boundary="===============2955120312350900205=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Tue, 03 Sep 2019 21:20:36 +0000 (UTC)

--===============2955120312350900205==
Content-Type: multipart/alternative; boundary="0000000000005f9ec20591ac979c"

--0000000000005f9ec20591ac979c
Content-Type: text/plain; charset="UTF-8"

Hi All,

Any help is greatly appreciated.

My piece of code can read audit.log file and process it.But when I enable
good number of syscalls, disk gets filled really quick (15GB for half a day
usage)
I wanted to know if there is a way to directly get the events from
userspace audit daemon instead of writing it to a file. Plan is that my
application should process the events as soon as they are created.
Suggest me if a way exist.

Thanks in advance.

Thanks & Regards,
Ankitha Kundhuru

--0000000000005f9ec20591ac979c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>Any help is greatly=C2=A0apprec=
iated.</div><div><br></div><div>My piece of code can read audit.log file an=
d process it.But when I enable good number of syscalls, disk gets filled re=
ally quick (15GB for half a day usage)</div><div>I wanted to know if there =
is a way to directly get the events from userspace audit daemon instead of =
writing it to a file. Plan is that my application should process the events=
 as soon as they are created.</div><div>Suggest me if a way exist.</div><di=
v><br></div><div>Thanks in advance.</div><div><br clear=3D"all"><div><div d=
ir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><di=
v dir=3D"ltr">Thanks &amp; Regards,<div>Ankitha Kundhuru</div></div></div><=
/div></div></div>

--0000000000005f9ec20591ac979c--


--===============2955120312350900205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============2955120312350900205==--


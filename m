Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF212E213
	for <lists+linux-audit@lfdr.de>; Wed, 29 May 2019 18:12:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FCAB3001757;
	Wed, 29 May 2019 16:12:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A7A91972E;
	Wed, 29 May 2019 16:12:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 39E821806B14;
	Wed, 29 May 2019 16:12:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TG6PIe006276 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 12:06:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D560010027CA; Wed, 29 May 2019 16:06:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDCFE1017E2F
	for <linux-audit@redhat.com>; Wed, 29 May 2019 16:06:23 +0000 (UTC)
Received: from omr1.cc.vt.edu (outbound.smtp.vt.edu [198.82.183.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D18A0C0AF054
	for <linux-audit@redhat.com>; Wed, 29 May 2019 16:05:59 +0000 (UTC)
Received: from mr5.cc.vt.edu (mr5.cc.vt.edu
	[IPv6:2607:b400:92:8400:0:72:232:758b])
	by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id x4TG5wfG014819
	for <linux-audit@redhat.com>; Wed, 29 May 2019 12:05:59 -0400
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197])
	by mr5.cc.vt.edu (8.14.7/8.14.7) with ESMTP id x4TG5rLB028025
	for <linux-audit@redhat.com>; Wed, 29 May 2019 12:05:58 -0400
Received: by mail-qk1-f197.google.com with SMTP id k13so2295949qkj.4
	for <linux-audit@redhat.com>; Wed, 29 May 2019 09:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
	:mime-version:content-transfer-encoding:date:message-id;
	bh=S3lgdSVDLFvbX2ggdKJVoVcCWG40J5qN00UGNVcLd+Y=;
	b=aAUok/NUUbOvbSdNkHrfnPrlEnr3aK7A7ivC2g9v0wWR1CXA4eB0XLUFNuj3gE5m36
	rYRjevIZaw1znghAl8zUrs31QFQM//vh3jtvVoUXgDJmZAaNGtUpDeDgN1jBC/2g9DvC
	x+m21o5o9EWZTzJnkwnb5Uc2Cq4w7wUmkXuwdiZjaeEBAXlZU0UfxxxD4byqRHCf2IP+
	jPcgnIZfRDqfpK6j+0IkJsn1bGxlX2rMWFVchnk2le7cUH5RbK1eE7RP/cLwzBVKDawl
	Rm0Os72bRrI7LVqgyqtU4amMLWKWaB9cMU9VAZafF9zxlOcMkbZm4UwK/x1/ldJjOk5g
	pHSw==
X-Gm-Message-State: APjAAAWs4D54bQgJDvtXRKQeCHe0yxK99j1gdyUisnGzMW3M6yfGBLGe
	UVZYGuaLzDDqUzacjp44eQVDuCTorD5n3o3p8rL7eZ9r/DlrvRq4OGotWcb1QIGi2b9VBVOqbZn
	IvjUu/1HH8wU6kHCpqnIv1WzHytg=
X-Received: by 2002:aed:3e0f:: with SMTP id l15mr10689552qtf.251.1559145952461;
	Wed, 29 May 2019 09:05:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzhSvFx8mWK83YexEw981KMTUgLml1EkyByucX2UKKLw3cWTVDAREeUAbMnX1g5y7ZlrswnwA==
X-Received: by 2002:aed:3e0f:: with SMTP id l15mr10689510qtf.251.1559145952050;
	Wed, 29 May 2019 09:05:52 -0700 (PDT)
Received: from turing-police ([2601:5c0:c001:4341::936])
	by smtp.gmail.com with ESMTPSA id
	n124sm7147130qkf.31.2019.05.29.09.05.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 May 2019 09:05:50 -0700 (PDT)
From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks"
	<Valdis.Kletnieks@vt.edu>
To: Amer Hwitat <amer.server.two@gmail.com>
Subject: Re: Linux (RHEL 7.6 with OSP 14) Bugs
In-Reply-To: <CAA8pqxH01arUOZW0fAnZv9_P+v4A3Z_M073OD_C9wXbH2sms9A@mail.gmail.com>
References: <CAA8pqxH01arUOZW0fAnZv9_P+v4A3Z_M073OD_C9wXbH2sms9A@mail.gmail.com>
Mime-Version: 1.0
Date: Wed, 29 May 2019 12:05:49 -0400
Message-ID: <24236.1559145949@turing-police>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.32]); Wed, 29 May 2019 16:06:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Wed, 29 May 2019 16:06:05 +0000 (UTC) for IP:'198.82.183.121'
	DOMAIN:'outbound.smtp.vt.edu' HELO:'omr1.cc.vt.edu'
	FROM:'valdis@vt.edu' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 198.82.183.121 outbound.smtp.vt.edu
	198.82.183.121 outbound.smtp.vt.edu <valdis@vt.edu>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Content-Type: multipart/mixed; boundary="===============0875476612381184958=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 29 May 2019 16:12:41 +0000 (UTC)

--===============0875476612381184958==
Content-Type: multipart/signed; boundary="==_Exmh_1559145948_2892P";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--==_Exmh_1559145948_2892P
Content-Type: text/plain; charset=us-ascii

On Sat, 18 May 2019 19:50:27 +0300, Amer Hwitat said:

I have no idea why you sent this to the linux-audit list, as it doesn't seem to
involve the kernel audit subsystem in any way.

> I have the following Bugs that crashed my VM, I reported it to RH, they
> didn't answer, and banned my developer account, the Bug is when you disable
> the network on RHEL with OSP 14 installed all in one, it crashes the
> system, I had a 12GB RAM, with 8 CPUs on the VM, and I found out that this
> crash report pissed off someone in RH, because they called me, and said
> what do you want from me!!, what I need is a Simple reply, is this a bug or
> not.

It's probably a bug. Given that you mention 'RabbitMQ heartbeats'
and the problem happens when you yank the network out from under
RabbitMQ, it's probably a RabbitMQ bug failing to deal gracefully with
the removal of a network device from the configuration.

And no, you probably won't be able to get help from RedHat. Having said that,
it's unclear why your developer account got closed, unless there's more to the
story than you're telling.  Were you insisting that RedHat fix a bug in (probably)
RabbitMQ, which isn't a RedHat product?

Note in your screenshot:

"A kernel problem occurred, but your kernel has been tainetd (flags:GL)
Explanation: Kernel maintainers are unable to diagnose tained reports"

The L flag is saying that there was a kernel lockup detected before the panic
happened, which means that when the NMI caused the panic the kernel was already
screwed up. There's a good chance that kcrash was unable to capture useful
data. You need to be lookng at the cause of the softlockup, not the panic.

More troublesome is the G flag, which indicates that proprietary modules have
been loaded. Since source is unavailable, there's no way to debug it without
the assistance of whoever produced the proprietary module.

If you don't already know what module did it, 'dmesg | grep taint' should
reveal the culprit.

Take it up with whoever produced the module Good luck.

--==_Exmh_1559145948_2892P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBXO6t2wdmEQWDXROgAQKHLA/+NQczJmoQ+H1zlqU/oUi9SXesQirhQ5Lu
ak33e2IuREly3I14v0d9deCpfPvbZZaOVZilw5rVVjdOavDVIWL2LO/U5ZyKIksH
LV+QpdcYmVe1wHPbsBS28zGEhyWX/0uMHwejOWFaKcwBuLdF/WgBwRRUmS6+6IZ5
ZGahvOByVQDTZsmKTK8WHhvD+3nZE5QMeNADdI7p5AgmP7/Ye0vh2Sixg0DhZb3a
cRDDFXpr5s7DEdqEl73r8v8G4T6FtYP/HIyB5BcueVjOY6CnxpiNFBEGjtcJGxJd
j5wnhcyWWeN4TzlLcLlhT8ecapwxAq6mB8qxFNDaoZEvtvyE7LqoaD+4/D8BnjTB
avN8J6YW98Qd0JtPaIMZHwfopWv1cDQqrJ4zmuHwOinCIN2RJGihRDNVHnBUEJDZ
lHJwuXBJcOua1/bXH+/AVIbEoU6OX1CkTVl3lKhsX1XqUqrmgALfisnh1lWR3FLN
Hxg2IIOJdTt8F419cghvxRzSP2Zn1Erm8uMHqKIJhcmQ1uaoLSRWyM8/CbG+uZvB
BvmUrN0Z7JOJzbih1Yuzq6Nh9r7B2t2paeIRE9PDepIYFjVbuSiSpVOxhRVQCcTp
Hf48BSol+PZ4McY9wEsdNlCI/EZ/BF6d6BAgIWz+jL7lH9wguEoJFHsdbC9zr1UQ
dpHwJMYUJcw=
=Mqm3
-----END PGP SIGNATURE-----

--==_Exmh_1559145948_2892P--


--===============0875476612381184958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============0875476612381184958==--


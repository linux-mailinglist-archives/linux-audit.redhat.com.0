Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E934C20949
	for <lists+linux-audit@lfdr.de>; Thu, 16 May 2019 16:13:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5AFAE30C0DC8;
	Thu, 16 May 2019 14:13:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CD0510027C4;
	Thu, 16 May 2019 14:13:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1C6E1806B11;
	Thu, 16 May 2019 14:12:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4GEBsNh017456 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 16 May 2019 10:11:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E0F2E60BE5; Thu, 16 May 2019 14:11:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7F9360BE0;
	Thu, 16 May 2019 14:11:54 +0000 (UTC)
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91E43C065127;
	Thu, 16 May 2019 14:11:49 +0000 (UTC)
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
	by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 454YJN0fTJz1XLDR3;
	Thu, 16 May 2019 16:11:48 +0200 (CEST)
Received: from si0vm2082.rbesz01.com (unknown [10.58.172.176])
	by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 454YJN0VZ8z1CC;
	Thu, 16 May 2019 16:11:48 +0200 (CEST)
X-AuditID: 0a3aad16-e7dff70000003dc7-9b-5cdd6fa33530
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by si0vm2082.rbesz01.com (SMG Outbound) with SMTP id
	A2.81.15815.3AF6DDC5; Thu, 16 May 2019 16:11:47 +0200 (CEST)
Received: from FE-MBX2054.de.bosch.com (fe-mbx2054.de.bosch.com [10.3.231.148])
	by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 454YJM5kY1znqk;
	Thu, 16 May 2019 16:11:47 +0200 (CEST)
Received: from FE-MBX2054.de.bosch.com (10.3.231.148) by
	FE-MBX2054.de.bosch.com (10.3.231.148) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1713.5; Thu, 16 May 2019 16:11:47 +0200
Received: from FE-MBX2054.de.bosch.com ([fe80::25e4:a4ce:3b4c:cbe0]) by
	FE-MBX2054.de.bosch.com ([fe80::25e4:a4ce:3b4c:cbe0%7]) with mapi id
	15.01.1713.006; Thu, 16 May 2019 16:11:47 +0200
From: "Wolff Felix (ETAS-SEC/ECT-Be)" <Felix.Wolff@escrypt.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: AW: Error starting auditd
Thread-Topic: Error starting auditd
Thread-Index: AdUL06nypkIiZtCPQWyH1I2gnFnVGgACsRwAAASmRaA=
Date: Thu, 16 May 2019 14:11:47 +0000
Message-ID: <349996a1e9564695a2a281c9396b4f80@escrypt.com>
References: <3dc64aea26e94e68818b81289f1a713b@escrypt.com>
	<20190516135644.nt3l4l4xwmrkhizl@madcap2.tricolour.ca>
In-Reply-To: <20190516135644.nt3l4l4xwmrkhizl@madcap2.tricolour.ca>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.254.95]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA22TfUwTdxjH+2uP8qNy5Hr02sciyTjGcL5Axbl17jXZP7qXuD+WTJduUMZJ
	G2lLei0RlyzQyUQScUrVDsdkgI5NDQUXcaO8lcVM4hC1JairL2CMdDh0OO0fi+7OK7Z/7J/L
	8/s+z+d5nt/37rCCPoj12Gp3cU67uYJVqgjV2uPZK9sdEZOh+/5LxuHf+pGxu24g9U35urmB
	sPJ99JHq1TKuwlrFOQtfL1FZbtbFlJU7yK1fRr5Q1qCLqgaUhoF6Afr6TygbkArTlE8OE3MX
	kHQIIKj3NsUzcwg8jaEU6TCEhLIZQuSV1BvQ9O1IihhrqHzYs3uPUowV1BqovfIYiXEmxcLU
	/hmFVJMLEzum5FK8From76Y2IIwJKg+uhZaKMinIx/v8qWJMUzz4BmafoGnUW1DbMvqkJaKy
	we8/p5BG6aDn1sMU6ToUdAQkHSgGZqYfxfVnIHRnjJDqC2Bynze+5nI48t2fCmmuGs58fZP4
	Cumak9o2JyHNSUhzEtKKiB8Rw1sNVbYig7GowFnK8dsMqwo+ddh6kPSitKfQ4dHNQURhxKaT
	ntKIiU4xV/HVtiBag+UsQ34c/MNEZ5Q6yqotZt5S7HRXcDyrJ5eMv22iM5/KvLvUZuV5q8Me
	RIAVrIb0z10x0WSZuXob53RIWBBlYYLVkeV4g4mmys0ubgvHVXLOhewrGLNAauzCDmonV85t
	3WytcC2k2WwSyWQyWpucSR4rx2lBtBqnC7MDNqEFyVeabby1PI4vlnB6QU2go2g9Hmq70aLA
	Zx4KT5qwO+ycXkfOi4tQYr3FbX+6h34J2T4tXI1JSiR6RdEkEpzMJFtFOF34KxIbAJklmqaO
	iwmoqENgqF8xNG6vBl/oEILbd/+Rw/gvvQTMft+mFD6XQBoEjsYWwVX/TAZ0jkYz4OdgLANi
	4VY1DF34XQ2n7o/T0Bm4R4PPe0cDZ9t3MhCbbWTg0sAgI2oMRHtPaGFwvmkxxI559fDTofks
	qJ/qYMGz73Yu3AhP5IHvfNdz8Di6Ox+OeUNL4fKRoedh8J5nmYA9Wh4V3JUL7r5svSy66zK7
	/sfduJq4nL4G7dr04ul/D3QcIHqKXdenV7xXKDtvtdTvyvGcHv4w3Oneu/MD5q/1Y5/lXNXm
	b7pW3O0uujT7bJMuZ3jq4CdbakduPTD0ne1b1FLTdvLdjXtH6vya63RJ1Q8bA4cLtxtzV5zc
	3/vahsjqvPFzWZM5XSNH3zGGIw2tLdoHY8bPL5b8LVvZ/w1L8BbzqmUKJ2/+D5cY3I2uBAAA
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Thu, 16 May 2019 14:11:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Thu, 16 May 2019 14:11:53 +0000 (UTC) for IP:'139.15.230.186'
	DOMAIN:'de-out1.bosch-org.com' HELO:'de-out1.bosch-org.com'
	FROM:'Felix.Wolff@escrypt.com' RCPT:''
X-RedHat-Spam-Score: -2.302  (RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_PASS) 139.15.230.186 de-out1.bosch-org.com
	139.15.230.186 de-out1.bosch-org.com <Felix.Wolff@escrypt.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x4GEBsNh017456
X-loop: linux-audit@redhat.com
Cc: "Linux-audit@redhat.com" <Linux-audit@redhat.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 16 May 2019 14:13:18 +0000 (UTC)

Good hint, thanks! Running `dmesg | grep audit_pid` revealed the pid of the=
 already running process!



-----Urspr=FCngliche Nachricht-----
Von: Richard Guy Briggs <rgb@redhat.com> =

Gesendet: Donnerstag, 16. Mai 2019 15:57
An: Wolff Felix (ETAS-SEC/ECT-Be) <Felix.Wolff@escrypt.com>
Cc: Linux-audit@redhat.com
Betreff: Re: Error starting auditd

On 2019-05-16 10:47, Wolff Felix (ETAS-SEC/ECT-Be) wrote:
> Hello,

Hi Felix,

> I am currently porting auditd to a new platform. When starting it using `=
auditd -f`, I get the following error:
> =

> "Error setting audit daemon pid (File exists)"
> =

> It occurs during the call to `audit_set_pid(fd, getpid(), WAIT_YES);` in =
auditd.c. If I understand correctly, this call registers auditd with the ke=
rnel, is that correct? fd looks like a valid file descriptor, at least its =
>0. Especially the "file exists" part confuses me. In which direction can I=
 investigate that error?

It appears you already have a process/task that is registered with the kern=
el for this purpose and it is still alive and healthy.  On a normal system =
I would say it is likely auditd that was started by the system.
On yours, are you sure you haven't got a previous one already at least part=
ly running?

The line responsible in the kernel is here:
	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ke=
rnel/audit.c#n1262

> Thank you and greets,
> Felix

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems Remote, Ottawa, R=
ed Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

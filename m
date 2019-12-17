Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F0EB6123343
	for <lists+linux-audit@lfdr.de>; Tue, 17 Dec 2019 18:16:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576603005;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MZn7I9WbWfhNTyr37q81ujTRL54ZZUWzZHHNeB/cEyc=;
	b=HiCJGjSqIlpwq8e3eUGpYUseHSTxRxcsF/FEjeQ1D1U112dH9fFWfQGZrcgSn2/4FglGst
	75C4BEWczFSbsiq27gBB2evuNovLkE0ArixpDQ9PGKWiOHwD+ZfekLUADVgByOD9xtnLAi
	o40b6+y0741zA5GQ3jTGjIhCWLOla+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-9JKnisI8Pi-fMOJ1CZH3wg-1; Tue, 17 Dec 2019 12:16:43 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5608E800596;
	Tue, 17 Dec 2019 17:16:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F04517C839;
	Tue, 17 Dec 2019 17:16:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E35DC104905;
	Tue, 17 Dec 2019 17:16:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBHHGPhh031329 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Dec 2019 12:16:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 894D42026D69; Tue, 17 Dec 2019 17:16:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82F45215AB18
	for <linux-audit@redhat.com>; Tue, 17 Dec 2019 17:16:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75058800561
	for <linux-audit@redhat.com>; Tue, 17 Dec 2019 17:16:23 +0000 (UTC)
IronPort-SDR: 5DPBjl8f6Ai070mg/xvarr/6v/LgYdAJmayDkwn1swnJEZXKDx1Td41L597Foy4cqym8Mw+ls3
	y4FyFl2QBuAitVEGjzqtmak2Ar2LUGYTDMniw4PRTFYOz1LSd3w0HX/Y4Fxa/3y+6c51SpBZS6
	q5P84tJqnx8EWeUYzyy9UG3ZMGViv1cUkmZtx/VZnb4xBnRUhzYKoGmrw7jGtIPljRLycfxFHd
	1wOFZuuxndmuaeUjUIhQSlSUg9cm+eJt+7PvXVwvDtEwLPShxSbGi6fAR6ryq66cxIfo+lZAop
	oPG571kFn+MDsPfmJuU0PTEK
X-IronPort-AV: E=Sophos;i="5.69,326,1571695200"; d="scan'208";a="16033651"
X-MGA-submission: =?us-ascii?q?MDFIu2BeOWpdbHj4uhs/WK4VMM+J6PoOcWFvMy?=
	=?us-ascii?q?Ry7/Z4fGXRNXpRoE/bnWbNwXAdG3HBqn3sNCut49bVJDst30qANXgg61?=
	=?us-ascii?q?1Pl1moMUgaBT/OBFFxf084o4AVyR17XTDDpJHm2pznMpABd5CjAMlNnz?=
	=?us-ascii?q?X4?=
Received: from smarthost4.atos.net (smtppost.atos.net [193.56.114.177])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-20-O_njRsJuMzeDIrKN6q4Dzw-1; Tue, 17 Dec 2019 12:16:19 -0500
Received: from unknown (HELO DEFTHW99ETQMSX.ww931.my-it-solutions.net)
	([10.86.142.98])
	by smarthost4.atos.net with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	17 Dec 2019 18:16:17 +0100
Received: from DEERLM99EX7MSX.ww931.my-it-solutions.net ([169.254.9.235]) by
	DEFTHW99ETQMSX.ww931.my-it-solutions.net ([10.86.142.98]) with mapi id
	14.03.0468.000; Tue, 17 Dec 2019 18:16:14 +0100
From: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
To: Steve Grubb <sgrubb@redhat.com>, "linux-audit@redhat.com"
	<linux-audit@redhat.com>
Subject: RE: Matching SSHD information in audit logs
Thread-Topic: Matching SSHD information in audit logs
Thread-Index: AQHVtOV13PlsP4nH70erLKQkhh+u/Ke+ib9Q
Date: Tue, 17 Dec 2019 17:16:14 +0000
Message-ID: <5F4EE10832231F4F921A255C1D95429822D170@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D95429822CB57@DEERLM99EX7MSX.ww931.my-it-solutions.net>
	<2177815.HFh0nK17a1@x2>
In-Reply-To: <2177815.HFh0nK17a1@x2>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.86.142.14]
MIME-Version: 1.0
X-MC-Unique: O_njRsJuMzeDIrKN6q4Dzw-1
X-MC-Unique: 9JKnisI8Pi-fMOJ1CZH3wg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBHHGPhh031329
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable



> -----Message d'origine-----
> De : Steve Grubb [mailto:sgrubb@redhat.com]
> Envoy=E9 : mardi 17 d=E9cembre 2019 15:21
> =C0 : linux-audit@redhat.com
> Cc : MAUPERTUIS, PHILIPPE
> Objet : Re: Matching SSHD information in audit logs
>
> On Tuesday, December 17, 2019 5:57:53 AM EST MAUPERTUIS, PHILIPPE
> wrote:
> > Hi,
> > When setting the SSHD log level to verbose as recommended by the CIS, I
> get
> > the following in the secure log : Dec 17 11:32:29 myserver sshd[8456]:
> > Connection from xx.xx.xx.xx port 44090 on xx.xx.xx.xx port 22 Dec 17
> > 11:32:30 myserver sshd[8456]: Accepted key RSA SHA256: qhpzQKKbwaX8
> found
> > at /usr/bin/sss_ssh_authorizedkeys:1 Dec 17 11:32:30 myserver
> sshd[8456]:
> > Postponed publickey for myuser from xx.xx.xx.xx port 44090 ssh2
> [preauth]
> > Dec 17 11:32:30 myserver sshd[8456]: Accepted key RSA SHA256:
> qhpzQKKbwaX8
> > found at /usr/bin/sss_ssh_authorizedkeys:1 Dec 17 11:32:30 myserver
> > sshd[8456]: Accepted publickey for myuser from xx.xx.xx.xx port 44090
> > ssh2: RSA SHA256: qhpzQKKbwaX8 Dec 17 11:32:30 myserver sshd[8456]:
> > pam_unix(sshd:session): session opened for user myuser by (uid=3D0) Dec=
 17
> > 11:32:31 myserver sshd[8456]: User child is on pid 8460
> > Dec 17 11:32:31 myserver sshd[8460]: Starting session: shell on pts/4 f=
or
> > myuser from xx.xx.xx.xx port 44090 id 0
> >
> > What are the corresponding events in audit ?
>
> I don't think anyone has ever tried to map between syslog and audit. I al=
so
> think that CIS maybe doesn't understand audit and how it works. For quite
> some time, there has been a requirement to log any key lifecycle in the a=
udit
> logs. This means that the DH key exchange and the session keys get logged
> when they are created and when they are destroyed. Also, pam logs the
> session
> beginning and end. And sshd logs any keys that it accepts. So, I think th=
e
> information is there if one wanted or needed to map between them. But it
> should be unnecessary. I'm not sure what CIS is looking for in syslog.
> Because if there is something important in syslog that is not in the audi=
t
> logs, I'd like to know what it is.
>
>
> > My main concern is with the bold line which indicates how the public ke=
y
> > was granted
>
> That should also be in the audit logs.
I find in the audit log which key has been accepted but not that it has bee=
n accepted due to /usr/bin/sss_ssh_authorizedkeys (and not a local authoriz=
ed_keys file).
In the USER_AUTH message I can see a field grantors=3Dauth-key but I don't =
know how to interpret it.
I had a look at https://github.com/linux-audit/audit-documentation/blob/mas=
ter/specs/fields/field-dictionary.csv but grantor is not mentioned there
I didn't other fields as well :
>From SOFTWARE_UPDATE the fields sw, sw_type, key_enforce are not listed.
The page https://github.com/linux-audit/audit-documentation/blob/master/spe=
cs/messages/message-dictionary.csv doesn't mention the type SOFTWARE_UPDATE
Maybe I am looking at the wrong place, Where should I look ?
>
>
> > Could you point me to a documentation showing which events a ssh login
> > would generate ?
>
> To my knowledge, there is no document that singles out what a sshd login
> should look like. There are documents that explain what the record type a=
re.
> And you should be able to isolate them by ausearch -x sshd.
>
What I missed was this ausearch -x sshd which gives me the events

> -Steve
>
Philippe
equensWorldline is a registered trade mark and trading name owned by the Wo=
rldline Group through its holding company.
This e-mail and the documents attached are confidential and intended solely=
 for the addressee. If you receive this e-mail in error, you are not author=
ized to copy, disclose, use or retain it. Please notify the sender immediat=
ely and delete this email from your systems. As emails may be intercepted, =
amended or lost, they are not secure. EquensWorldline and the Worldline Gro=
up therefore can accept no liability for any errors or their content. Altho=
ugh equensWorldline and the Worldline Group endeavours to maintain a virus-=
free network, we do not warrant that this transmission is virus-free and ca=
n accept no liability for any damages resulting from any virus transmitted.=
 The risks are deemed to be accepted by everyone who communicates with eque=
nsWorldline and the Worldline Group by email


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


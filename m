Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 64A1D1282B1
	for <lists+linux-audit@lfdr.de>; Fri, 20 Dec 2019 20:26:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576870016;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Hr+Wp7NMgfFtvLLzJHWxhrVcdOBM5XdimBMyn5iupDg=;
	b=WwHIat2jAzXEkW6ff65IGnt/WZi91r8yEa481StHb7fog2legbJsjtgHkYll3ULE6qrRpZ
	IK9Zu5m/a7El/HlmKTRy72NZZ4JsVzjfJ1tIevtlLgyyB4IkM1SAl5UYAeBItiOA4GIwQf
	pXQLb9RUtoVOuJxDKZxtlVYPxl0Ej2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-S3jwyk-hOpCSZtPt_hz4Xw-1; Fri, 20 Dec 2019 14:26:53 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B7B6801A20;
	Fri, 20 Dec 2019 19:26:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C0B16057A;
	Fri, 20 Dec 2019 19:26:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1EAA9252EB;
	Fri, 20 Dec 2019 19:26:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBKJQK6g009775 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 20 Dec 2019 14:26:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9E9BD16C2FA; Fri, 20 Dec 2019 19:26:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99D0216C8FA
	for <linux-audit@redhat.com>; Fri, 20 Dec 2019 19:26:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A704E10163DE
	for <linux-audit@redhat.com>; Fri, 20 Dec 2019 19:26:18 +0000 (UTC)
IronPort-SDR: QSO/gsfx9Xd2t1gaZUXzv5oqKE8+yYzBYvD6YsAz/D5O92Kczhdy/lSIHV5ROHDhy+DiLARQLc
	gZ3bFHPWah/9w5w5LXX8rNtzVsTH+tRVxixOS/jmAKFtfXIbjBOuXdeDB2rnrztma7HCMVg+4z
	W7Nv+L+eeelY0PiczGR0guHWWVEphYdQHz2nPq6945I0HYHDy7GGhEwhUQJpnY9S00Mp1/X48v
	oXHE+NUJ9JDT3bJv51JLvNXGmmJMex/8nq5Hp11nCnDRcDTSsQtFnZkRX+KyuLYuZx+0ust4ZT
	OkkB9IsFy3kwIh4rgd6r3Se3
X-IronPort-AV: E=Sophos;i="5.69,336,1571695200"; d="scan'208";a="23231529"
X-MGA-submission: =?us-ascii?q?MDHxu2Uzx9Qug/WbTjmyceGxjFm6YR+iWf4xHz?=
	=?us-ascii?q?0XaskoT7ZbDyJ1y/VtuxjWtUzio1BdGHYmvF1/RnEOGhor1JhPDO98eK?=
	=?us-ascii?q?wj7TtENoRYK8TgQ+N177suee9VcBaOdRbitf5c+ERXmTwBEIKzBKrNcN?=
	=?us-ascii?q?Ib?=
Received: from smarthost6.atos.net (smtppost.atos.net [193.56.114.177])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-171-OSXE_QdIMJuxIn2zZaUknw-1; Fri, 20 Dec 2019 14:26:15 -0500
Received: from unknown (HELO DEERLM99ETVMSX.ww931.my-it-solutions.net)
	([10.86.142.97])
	by smarthost6.atos.net with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	20 Dec 2019 20:26:13 +0100
Received: from DEERLM99EX7MSX.ww931.my-it-solutions.net ([169.254.9.235]) by
	DEERLM99ETVMSX.ww931.my-it-solutions.net ([10.86.142.97]) with mapi id
	14.03.0468.000; Fri, 20 Dec 2019 20:26:10 +0100
From: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
To: Steve Grubb <sgrubb@redhat.com>, "linux-audit@redhat.com"
	<linux-audit@redhat.com>
Subject: RE: ausearch on the fly
Thread-Topic: ausearch on the fly
Thread-Index: AdW3OU/dw1JpOtpPSVSmBrkse/xbnwAKUbQAAAIrRcA=
Date: Fri, 20 Dec 2019 19:26:08 +0000
Message-ID: <5F4EE10832231F4F921A255C1D954298230A39@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D9542982304BF@DEERLM99EX7MSX.ww931.my-it-solutions.net>
	<1765069.Uqzcf1Iu7r@x2>
In-Reply-To: <1765069.Uqzcf1Iu7r@x2>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.86.142.14]
MIME-Version: 1.0
X-MC-Unique: OSXE_QdIMJuxIn2zZaUknw-1
X-MC-Unique: S3jwyk-hOpCSZtPt_hz4Xw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBKJQK6g009775
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Thank you steve,
I will have a look at it.
Philippe

-----Message d'origine-----
De : Steve Grubb [mailto:sgrubb@redhat.com]
Envoy=E9 : vendredi 20 d=E9cembre 2019 20:24
=C0 : linux-audit@redhat.com
Cc : MAUPERTUIS, PHILIPPE
Objet : Re: ausearch on the fly

On Friday, December 20, 2019 8:33:11 AM EST MAUPERTUIS, PHILIPPE wrote:
> We are centralizing  the audit logs with rsyslog.
> The SIEM behind the central log server is unable to process the raw logs.
> We would like to push the ausearch  result in CSV format in real time or
> near real time. Is there a way to have ausearch working from a pipe and
> and waiting when no logs are received

I think that I've seen others who setup a cron job and use the checkpointin=
g
feature so that they do not miss anything. You can pipe its output into
logger. You probably also want to cut the first line which has the column
headers.

ausearch --start today --checkpoint /root/last-ausearch .chpt --format csv =
| tail -n +2 | logger

Also, the latest syslog plugin can now do interpretation. I think its in
alpha-9 which dates back to Nov 04, 2019.

It really shouldn't be hard to copy and paste the code from ausearch into t=
he
syslog plugin to log directly in that format. I wonder if anyone else would
find that useful?

-Steve


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


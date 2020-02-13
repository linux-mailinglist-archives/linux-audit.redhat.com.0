Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id AFA6B15C862
	for <lists+linux-audit@lfdr.de>; Thu, 13 Feb 2020 17:38:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581611888;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c3JEwqTqnVb8kKQ+6YiTxZsci3OlrDHg8KjzjsBpo+I=;
	b=KLYZScK1eu08HoGQ9fEiph/rAYC2geghiX54ZKZHnkVnXAbVUHXtAvIYwwIRe3zPSaGyI7
	6EMXtUpB6Zxe4bclN5JEWvtjsStMPRyCTbQOkFTC3ZvwqpfupoH8x9JA+Ht7W8AWvnGzd+
	ROa1DCNqFIMQ4NTEyXTFu1/rRMrJPGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-e_Z4VXx9OhGnszHOum_7qw-1; Thu, 13 Feb 2020 11:36:21 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A95E51B2C984;
	Thu, 13 Feb 2020 16:36:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FBEC5DA7B;
	Thu, 13 Feb 2020 16:36:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CD8D18089CD;
	Thu, 13 Feb 2020 16:36:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01DGZvk8018451 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 11:35:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 48BDF11D2BE; Thu, 13 Feb 2020 16:35:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41DCF11E1CA
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 16:35:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE8A1867B02
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 16:35:54 +0000 (UTC)
IronPort-SDR: ZoVIXMDHL3zUu1SaMI5KkkTCQDU/pVHXeN89VpsbGwwleqRTzGLbqCaCcY1+GhL+B7Qua5nRE1
	3xcwprXjOLl7EGJjv8d0AmmHXzbbqQaLGUMCXZRBUwlACyd/Lf7gIUucjzoWoK8ZQw3KdEEqVV
	hGUA5uffcOP281n5Fg4QB4FKYClVthD2aHHvgEpjFzMG5v7Nanov6yn2qL9X6lh4zwR3xEwSRV
	86AEpvXb4Kr3AOtoqdsAkSNr8naT+x+MWrrJ0MVrbNTMicK1LcqmcUIrhWDOA3mRlncpjOCVvS
	k1BKnJ0hdnzNSc4ZAEADvJFl
X-IronPort-AV: E=Sophos;i="5.70,437,1574118000"; d="scan'208";a="29861786"
X-MGA-submission: =?us-ascii?q?MDGX16UPBxD7TtKeKREvUVxdpYAd+mk1Ogt2A+?=
	=?us-ascii?q?DwYJX5kmRuYkeNs/RRxMNVxnB0atDFo7gz8wEcIH2cQACW/Yfs1echZV?=
	=?us-ascii?q?ggjY8u98kJpiubDIKrX/uXgA7xTOvXAsZ6UyJXtoZAxp1qTDTgHuoo6G?=
	=?us-ascii?q?DT?=
Received: from smarthost2.atos.net (smtppost.atos.net [193.56.114.177])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-296-ynE431rAMGCeik_YcrJO-w-1; Thu, 13 Feb 2020 11:35:52 -0500
Received: from unknown (HELO DEFTHW99ETUMSX.ww931.my-it-solutions.net)
	([10.86.142.49])
	by smarthost2.atos.net with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	13 Feb 2020 17:35:51 +0100
Received: from DEERLM99EX7MSX.ww931.my-it-solutions.net ([169.254.9.55]) by
	DEFTHW99ETUMSX.ww931.my-it-solutions.net ([10.86.142.49]) with mapi id
	14.03.0468.000; Thu, 13 Feb 2020 17:35:50 +0100
From: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
To: Steve Grubb <sgrubb@redhat.com>, "linux-audit@redhat.com"
	<linux-audit@redhat.com>
Subject: RE: Auditing a program use but not what it is doing
Thread-Topic: Auditing a program use but not what it is doing
Thread-Index: AdXhiqoeSTGFK5x4RRWvKdfot+3FKwAGL8wAADlKzYA=
Date: Thu, 13 Feb 2020 16:35:46 +0000
Message-ID: <5F4EE10832231F4F921A255C1D9542982A0EB6@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D95429829F549@DEERLM99EX7MSX.ww931.my-it-solutions.net>
	<4711138.QvFmgxA1yv@x2>
In-Reply-To: <4711138.QvFmgxA1yv@x2>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.86.142.14]
MIME-Version: 1.0
X-MC-Unique: ynE431rAMGCeik_YcrJO-w-1
X-MC-Unique: e_Z4VXx9OhGnszHOum_7qw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01DGZvk8018451
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Objet : Re: Auditing a program use but not what it is doing
>
> On Wednesday, February 12, 2020 5:01:37 AM EST MAUPERTUIS, PHILIPPE
> wrote:
> > Like many, we are using aide and clamav.
> > I woud like to have an audit record when these program are run but no
> > records for what they are doing. I mean, I want to know that clamscan or
> > aide has been launched but not that it checks say /etc/passwd whatever
> > rules could be in place for /etc/passwd
>
> Then all you need to do is place a watch on them.
>
> -a always,exit -F path=path-to-aide -F perm=x -F key=something-ran
Just to be sure to understand how it works :
If we have two rules in that order :
-a always,exit -F arch=b64 -F exe=/sbin/aide -F perm=x  -F key=aide_run
-a always,exit -F path=/etc/passwd -F perm=wa -F key=10.2.5.c-accounts
When running aide :
-  the first rule produces a message
- the second rule  is ignored

Philippe

equensWorldline is a registered trade mark and trading name owned by the Worldline Group through its holding company.
This e-mail and the documents attached are confidential and intended solely for the addressee. If you receive this e-mail in error, you are not authorized to copy, disclose, use or retain it. Please notify the sender immediately and delete this email from your systems. As emails may be intercepted, amended or lost, they are not secure. EquensWorldline and the Worldline Group therefore can accept no liability for any errors or their content. Although equensWorldline and the Worldline Group endeavours to maintain a virus-free network, we do not warrant that this transmission is virus-free and can accept no liability for any damages resulting from any virus transmitted. The risks are deemed to be accepted by everyone who communicates with equensWorldline and the Worldline Group by email


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


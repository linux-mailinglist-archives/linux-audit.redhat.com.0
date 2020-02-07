Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D030A155395
	for <lists+linux-audit@lfdr.de>; Fri,  7 Feb 2020 09:14:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581063247;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zRGBPQj2Id1/YPXZikjpI2mSZumWWiuJmplRI1h4U7U=;
	b=NrjJBVmvnF908oXhAEZ+qQkLCweZMIFJtLq1Qg+SxLA3j19Y1QPqlwxtciFYSm6iKnQyhb
	UpxYEgJREWND2m79rd8geeHGEHCb/H5ngBGIQDqdyaxbWCYnQUME3s/80wgikBASEYflJr
	+MtEuoH14qjNFF4S9W/kiwJ+CsjKMlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-b8eo8UL9PPSA8aXNGrdARA-1; Fri, 07 Feb 2020 03:14:05 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DE8C8048ED;
	Fri,  7 Feb 2020 08:13:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7E5E5C299;
	Fri,  7 Feb 2020 08:13:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C489866A2;
	Fri,  7 Feb 2020 08:13:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0178DVwh025098 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 03:13:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0C9142166B2A; Fri,  7 Feb 2020 08:13:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 085902166B27
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 08:13:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFEAB803888
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 08:13:28 +0000 (UTC)
IronPort-SDR: H4l5UKllvMRZdWRvPJOjMXI0qucSXQN+Ndz+bEwjuzwvAaZrPbkIa8Br/cpF2iL2bd6AqXTPyW
	9QL3pC2MUGQWNRd/je2/x6O6fdUM72AoR2FAdy3bHB2GVuK/ZiSb45EsfRUaqU1g8WqcAx0jAK
	1sl2mjP0M5lyRvC5ntrM37ZWF930HXX3WoNDqYRfRI2PgiZrEXkVr55sqA5V+XrOF3pVrDj4f4
	sOEMnNBL0dWrjiOzIfx2VwIhqHDdgX/KMVuC9eJWSc5afZCndU1t2UcQgm0eC7NeIgigTQIPtH
	UJamUJXITC5xl9sL7t+GRNiF
X-IronPort-AV: E=Sophos;i="5.70,412,1574118000"; d="scan'208";a="39078441"
X-MGA-submission: =?us-ascii?q?MDEDRbJoYHbNJjEMnA6beKktQusKLrELK4WQPa?=
	=?us-ascii?q?iOW/BeuwEwbL1hM0Uw/G1tOE+UFm8SHScxCGy045YWOmtwtmjwuahHMq?=
	=?us-ascii?q?c8FRyB5FM87L+LEKRmo0BTIIBPoUJwos9g8X9ltrRTjjuVrU2fYUOFG0?=
	=?us-ascii?q?IA?=
Received: from smarthost6.atos.net (smtppost.atos.net [193.56.114.177])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-169-gHv7uSIIP3qDWVJto6jaQw-1; Fri, 07 Feb 2020 03:13:25 -0500
Received: from unknown (HELO DEFTHW99ETZMSX.ww931.my-it-solutions.net)
	([10.86.142.54])
	by smarthost6.atos.net with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	07 Feb 2020 09:13:24 +0100
Received: from DEERLM99EX7MSX.ww931.my-it-solutions.net ([169.254.9.55]) by
	DEFTHW99ETZMSX.ww931.my-it-solutions.net ([10.86.142.54]) with mapi id
	14.03.0468.000; Fri, 7 Feb 2020 09:13:23 +0100
From: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
To: Steve Grubb <sgrubb@redhat.com>, "linux-audit@redhat.com"
	<linux-audit@redhat.com>
Subject: RE: ausearch on the fly
Thread-Topic: ausearch on the fly
Thread-Index: AdW3OU/dw1JpOtpPSVSmBrkse/xbnwAKUbQACYqtMEA=
Date: Fri, 7 Feb 2020 08:13:23 +0000
Message-ID: <5F4EE10832231F4F921A255C1D95429829AF30@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D9542982304BF@DEERLM99EX7MSX.ww931.my-it-solutions.net>
	<1765069.Uqzcf1Iu7r@x2>
In-Reply-To: <1765069.Uqzcf1Iu7r@x2>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.86.142.14]
MIME-Version: 1.0
X-MC-Unique: gHv7uSIIP3qDWVJto6jaQw-1
X-MC-Unique: b8eo8UL9PPSA8aXNGrdARA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0178DVwh025098
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> On Friday, December 20, 2019 8:33:11 AM EST MAUPERTUIS, PHILIPPE wrote:
> > We are centralizing  the audit logs with rsyslog.
> > The SIEM behind the central log server is unable to process the raw logs.
> > We would like to push the ausearch  result in CSV format in real time or
> > near real time. Is there a way to have ausearch working from a pipe and
> > and waiting when no logs are received
>
> I think that I've seen others who setup a cron job and use the checkpointing
> feature so that they do not miss anything. You can pipe its output into
> logger. You probably also want to cut the first line which has the column
> headers.
>
> ausearch --start today --checkpoint /root/last-ausearch .chpt --format csv |
> tail -n +2 | logger
On a central log server the input file can grow very big and very fast.
Probably logrotate is needed to keep it in check.
What happen to the checkpointing feature when the file is rotated ?
How not to miss the last events from the old file and get the new events from the new file ?

>
> Also, the latest syslog plugin can now do interpretation. I think its in
> alpha-9 which dates back to Nov 04, 2019.
>
> It really shouldn't be hard to copy and paste the code from ausearch into the
> syslog plugin to log directly in that format. I wonder if anyone else would
> find that useful?
>
It would be very useful indeed

Philippe

equensWorldline is a registered trade mark and trading name owned by the Worldline Group through its holding company.
This e-mail and the documents attached are confidential and intended solely for the addressee. If you receive this e-mail in error, you are not authorized to copy, disclose, use or retain it. Please notify the sender immediately and delete this email from your systems. As emails may be intercepted, amended or lost, they are not secure. EquensWorldline and the Worldline Group therefore can accept no liability for any errors or their content. Although equensWorldline and the Worldline Group endeavours to maintain a virus-free network, we do not warrant that this transmission is virus-free and can accept no liability for any damages resulting from any virus transmitted. The risks are deemed to be accepted by everyone who communicates with equensWorldline and the Worldline Group by email


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


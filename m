Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA1837761
	for <lists+linux-audit@lfdr.de>; Thu,  6 Jun 2019 17:05:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CF7737F46;
	Thu,  6 Jun 2019 15:04:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28AB87D674;
	Thu,  6 Jun 2019 15:04:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE5291843660;
	Thu,  6 Jun 2019 15:03:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x56F2bV4032296 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 6 Jun 2019 11:02:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60F9068718; Thu,  6 Jun 2019 15:02:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57B4A68730;
	Thu,  6 Jun 2019 15:02:34 +0000 (UTC)
Received: from xspv0103.northgrum.com (xspv0103.northgrum.com [134.223.120.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3218A3B64;
	Thu,  6 Jun 2019 15:02:26 +0000 (UTC)
Received: from XHTVAG11.northgrum.com (unknown [134.223.82.80]) by
	xspv0103.northgrum.com with smtp
	id 55b8_00e6_890489c0_1b35_41a9_9744_a47e0a085f1f;
	Thu, 06 Jun 2019 10:02:25 -0500
From: "Boyce, Kevin P [US] (AS)" <Kevin.Boyce@ngc.com>
To: Steve Grubb <sgrubb@redhat.com>, "linux-audit@redhat.com"
	<linux-audit@redhat.com>
Subject: RE: EXT :Re: Auditd Troubleshooting
Thread-Topic: EXT :Re: Auditd Troubleshooting
Thread-Index: AdUca5TUPGx5icj/RaOU+NsvQU/M/QALaouAAAju9sA=
Date: Thu, 6 Jun 2019 15:01:33 +0000
Message-ID: <d2ec4e75b9384f488e852b24cf3db56b@XCGVAG30.northgrum.com>
References: <16ca40d7967a4a0198d1d2799c939349@XCGVAG30.northgrum.com>
	<2858763.hD381QzqKc@x2>
In-Reply-To: <2858763.hD381QzqKc@x2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [134.223.82.20]
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Thu, 06 Jun 2019 15:02:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Thu, 06 Jun 2019 15:02:27 +0000 (UTC) for IP:'134.223.120.78'
	DOMAIN:'xspv0103.northgrum.com' HELO:'xspv0103.northgrum.com'
	FROM:'Kevin.Boyce@ngc.com' RCPT:''
X-RedHat-Spam-Score: -5  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 134.223.120.78 xspv0103.northgrum.com
	134.223.120.78 xspv0103.northgrum.com <Kevin.Boyce@ngc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x56F2bV4032296
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 06 Jun 2019 15:05:12 +0000 (UTC)

Thanks Steve.  I thought you may have implemented this already!

Kevin

-----Original Message-----
From: Steve Grubb <sgrubb@redhat.com> 
Sent: Thursday, June 06, 2019 9:54 AM
To: linux-audit@redhat.com
Cc: Boyce, Kevin P [US] (AS) <Kevin.Boyce@ngc.com>
Subject: EXT :Re: Auditd Troubleshooting

On Thursday, June 6, 2019 9:31:41 AM EDT Boyce, Kevin P [US] (AS) wrote:
> Dear List,
> 
> It would be really great if there were an audit rule hit counter like 
> many firewalls have when IP traffic passes through a filter rule.
> 
> This would be beneficial for finding rules that might not be working 
> the as intended (to fix user implementation problems).
> 
> I'm thinking it would be a switch option on auditctl -l (maybe -h for 
> hitcount).  This would list each rule that the kernel has, and how 
> many times since auditd started that an event matched the rule.
> 
> Is this within the realm of feasibility?  Does this function exist 
> maybe elsewhere in the audit suite (like aureport)?

Assuming that you put a key on each rule, you can get this functionality like
this:

aureport --start boot --key --summary

And in cases where you have multiple rules with the same key, then add a number at the end like: time1, time2, time3, etc. Ausearch by default does partial word matching. So you can still run "ausearch -k time" and it will find all of them regardless of the number at the end.

-Steve




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

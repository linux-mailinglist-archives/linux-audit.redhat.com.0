Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 557837B54A
	for <lists+linux-audit@lfdr.de>; Tue, 30 Jul 2019 23:52:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 461E259465;
	Tue, 30 Jul 2019 21:52:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46CCD1001281;
	Tue, 30 Jul 2019 21:52:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ABDA941F53;
	Tue, 30 Jul 2019 21:52:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6ULqWaX024151 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 30 Jul 2019 17:52:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CD97B1000323; Tue, 30 Jul 2019 21:52:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C79541000321
	for <linux-audit@redhat.com>; Tue, 30 Jul 2019 21:52:30 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C933E30B9BF7
	for <linux-audit@redhat.com>; Tue, 30 Jul 2019 21:52:29 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id t8so47707350qkt.1
	for <linux-audit@redhat.com>; Tue, 30 Jul 2019 14:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=magitekltd-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=fNXyCy2FPh8P9oI0WbW17FW12uWE9QIjtgiRU1q2eFc=;
	b=XsiKPA3TktCzoYyBn1Usnsvvu6H/3bxwv2ox/OR382sxdvgfL8rWXBJkKmF6nwR9MF
	2bx+6sbq0WLyYoxcwoLT16Q9qYHs8idbJ8NzhqY9hSUvZl+C2ZOGoWBiLeNtl+aRcuPl
	Dalfat2KcULErKKT2lqcdMBoOF3bCldB057PTRZ7lnuK8VJ7o2VHAHmrEHZ3ffC7KNEd
	Q7knEJRY/7SGVBehCeaU5w4OCWvpUKWHjePtMTty5DSxfpeKs5W868RLhc4CubQM7Hkt
	zxua5pDnHlBygxZx4NVbYcIuPll7jr1sADSz+fxkRQW56FwPr3Kgf7FVkTTSFx2AvNmG
	TwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=fNXyCy2FPh8P9oI0WbW17FW12uWE9QIjtgiRU1q2eFc=;
	b=QppIwdeEWPDJka9j45dF84NXuv+g6sa0NT0Wg9B288W2gw2G99xmDZWBvQ1aq14yg3
	aeUGK5h3rV8cqoZPACq+DyhcDxblF+kUXQEMrQ/zB1U+N3IRVAwx5+0KwEaSMjnAaRTd
	DRz0SNnF1Aofy2+CRuSbHI0yU9ubMFdLSxPzcELrXjtROgSumagRSuRr2+Om2Yab7C5v
	LpPuKzwyxpIfkCYVd4ZAmk1S0CgFvEAM30Hv06/wNWckkb0HC5BnpoDHr3/+l0/p6DFT
	YCgOushOEvQ5bVzsJLbtQKPkXVlElzNhCbxcMO8dYjIpOGHQ+rAX3Y+8xJA7ijfsFgUh
	TDGQ==
X-Gm-Message-State: APjAAAXGSBUPSgi8bbCpDNUS6DmJkcpk1gIi+WAW3h0AEHXZLcNPsEIh
	C5aBH0QomFMRZMsk/bpzCPzY1GzL
X-Google-Smtp-Source: APXvYqxijyOura7iVUW8J9czuKDnMnTzSatZujLsL3/m05TUir/xHF31FDHIsuBdtmtZWHdiq4ht/w==
X-Received: by 2002:ae9:dfc3:: with SMTP id
	t186mr74507012qkf.461.1564523548911; 
	Tue, 30 Jul 2019 14:52:28 -0700 (PDT)
Received: from [10.31.1.58] ([12.96.208.220]) by smtp.gmail.com with ESMTPSA id
	g35sm35984265qtg.92.2019.07.30.14.52.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jul 2019 14:52:28 -0700 (PDT)
Subject: Re: boot parameter question
To: Richard Guy Briggs <rgb@redhat.com>
References: <e8fbd095-9983-528e-dc8e-602280b414d8@magitekltd.com>
	<20190729223249.wvzvqmjwzxeg4p54@madcap2.tricolour.ca>
	<f30a6c9e-e203-9e29-139a-dda3aa0e73f9@magitekltd.com>
	<20190730213613.deuqgp433ieumuge@madcap2.tricolour.ca>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <a5522d49-6871-d10c-789a-afb53f19c030@magitekltd.com>
Date: Tue, 30 Jul 2019 15:52:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190730213613.deuqgp433ieumuge@madcap2.tricolour.ca>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 30 Jul 2019 21:52:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Tue, 30 Jul 2019 21:52:29 +0000 (UTC) for IP:'209.85.222.195'
	DOMAIN:'mail-qk1-f195.google.com'
	HELO:'mail-qk1-f195.google.com' FROM:'lenny@magitekltd.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.222.195 mail-qk1-f195.google.com 209.85.222.195
	mail-qk1-f195.google.com <lenny@magitekltd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: "Linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Tue, 30 Jul 2019 21:52:42 +0000 (UTC)

On 7/30/19 3:36 PM, Richard Guy Briggs wrote:

> On 2019-07-30 15:06, Lenny Bruzenak wrote:
>> On 7/29/19 4:32 PM, Richard Guy Briggs wrote:
>>> It is being ignored because that kernel command line extension to the
>>> original feature was never backported to RHEL7.
>> That would definitely do it.
>>
>>> In hindsight, that would have been pretty useful without causing much
>>> risk.  Normally feature backport is driven by customer demand.  There
>>> was a bit of pushback when it was first introduced upstream, but this is
>>> exactly the scenario I envisioned where it would be most useful.  It is
>>> possible to compile your own kernel and change the default value, but
>>> that's obviously a hurdle for most.
>> It would definitely have been useful, some might say even necessary,
>> given the audit event startup noise occurring with systemd.
> Yes, this was yet another difficulty that arose with the change to
> systemd from rhel6 to rhel7.  The intent was to solve it first in fedora
> when it switched to systemd to address this since the number of startup
> messages jumped from manageable within the default backlog size to
> almost double.  There are also other improvements upstream that remove
> some of the doubt about exactly how many log messages were lost.
>
>> Wow. Thanks Richard, I appreciate the answer on this.
> It is all there in fedora and RHEL8, so that is one possible route.  It
> is a bit late in the RHEL7 life cycle to commit to it, but not
> impossible...


Thanks Richard and I do appreciate the insight.

For some it might be possible to switch OS baselines effortlessly,
others (including my group) it isn't.

I'm surprised other RHEL 7 consumers are not squawking; I wonder if they
do not appreciate what they are not seeing? Or perhaps they are not
starting as many services early in the boot sequence and therefore
getting that one?

For people who care, I'd say that examining the stats ("auditctl -s")
after startup would be worthwhile to see if they are losing events. Even
if on fedora or RHEL8, I guess if the default is still 64 they could
also be dropping relevant events they might want.

I know this isn't a new thing, and I should have been more diligent
myself, just saying.

LCB

-- 
Lenny Bruzenak
MagitekLTD

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

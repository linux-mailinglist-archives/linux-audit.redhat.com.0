Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5707B4C2
	for <lists+linux-audit@lfdr.de>; Tue, 30 Jul 2019 23:06:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 009633086268;
	Tue, 30 Jul 2019 21:06:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84CED5D9C5;
	Tue, 30 Jul 2019 21:06:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7948218089C8;
	Tue, 30 Jul 2019 21:06:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6UL6XaZ013686 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 30 Jul 2019 17:06:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B92645D6A7; Tue, 30 Jul 2019 21:06:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B283D5D6B2
	for <linux-audit@redhat.com>; Tue, 30 Jul 2019 21:06:31 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 69BC15AFF8
	for <linux-audit@redhat.com>; Tue, 30 Jul 2019 21:06:30 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d17so64291618qtj.8
	for <linux-audit@redhat.com>; Tue, 30 Jul 2019 14:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=magitekltd-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=+82kA24T6Obk/e2RTEDEp50uj/GRFdn25k02kp+e0HU=;
	b=C3HNm3jP4JEebr/+p8e84MkqARoTYPU5MO/rximV/gtkwblYA6n8gDPe5kQqj+dWdC
	7sey4+wKFlcllW7NjoT6vu6sfg2XNp0l5ggELVjCMy0MDMXZ+CzixZcL6DnpLja0AIzY
	+1l3KJpj1CYPffvr6+Byhb2dAtcfeFAMdILtH15q9lBcZGuiEX1QqEyUKEC/RT3jLkIx
	u1jPcsJk0jwGVlOb0XKB1sU4cy1EJ7yy57iuuxwije6acf96yCegcZOCjZD0sbaV4NFM
	QVvZdwDL5PEIW3Q0ZWQhdSkiPPPL3o8xxcNStMNizWdbGW6IhA7GsR19sxtqqZnC4yOk
	hOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=+82kA24T6Obk/e2RTEDEp50uj/GRFdn25k02kp+e0HU=;
	b=Ip/zNHxgX/twYIA2x5ain/TU2ciZpof/5eaZ8zyx9QvIlchjYj9bHKFyZ7rhrhcgf2
	GtWnh+ZMMeJKj9P42cJIGq8Vjw24sEzuNoS2+4/ceHwBHkIklQIEG3BMzxi23GucFBoJ
	2wgL4NkCebwi3olIHMRSOfWzQt8pqTAUb4YjcoeZspUqAfW8AcZYsC/LX/KahIxjQcdR
	SGsFjV5IGwtSVlU4bNnQDxljjuc/ZYtr6PGcFmcYb7R9OLCZACZCpJ3WQ0Dj0n3Kby4j
	B71jcsH0xKppI8MOvtulpCTeA9XSFaw2e95aZzVhrIUyMQoajATYR56Rl7R9MvUilkF6
	Kuvg==
X-Gm-Message-State: APjAAAVwxHomSUAIRrG/B4J9ZfFGlbVpGq/M/Cj6/rKU4x9At9mjzZyQ
	mp7kx8eGoCxJiZpfB+ykqgfApOaE
X-Google-Smtp-Source: APXvYqxmdP4uCDk6av0gZ3OBuqNU48m14mwX9KFqTz8of9huQ7BOBS7ZW0vzsUdXiXeeP+d42joGDg==
X-Received: by 2002:ac8:18f0:: with SMTP id o45mr82023748qtk.273.1564520789567;
	Tue, 30 Jul 2019 14:06:29 -0700 (PDT)
Received: from [10.31.1.58] ([12.96.208.220]) by smtp.gmail.com with ESMTPSA id
	l6sm26905613qkc.89.2019.07.30.14.06.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jul 2019 14:06:28 -0700 (PDT)
Subject: Re: boot parameter question
To: Richard Guy Briggs <rgb@redhat.com>
References: <e8fbd095-9983-528e-dc8e-602280b414d8@magitekltd.com>
	<20190729223249.wvzvqmjwzxeg4p54@madcap2.tricolour.ca>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <f30a6c9e-e203-9e29-139a-dda3aa0e73f9@magitekltd.com>
Date: Tue, 30 Jul 2019 15:06:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190729223249.wvzvqmjwzxeg4p54@madcap2.tricolour.ca>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 30 Jul 2019 21:06:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Tue, 30 Jul 2019 21:06:30 +0000 (UTC) for IP:'209.85.160.193'
	DOMAIN:'mail-qt1-f193.google.com'
	HELO:'mail-qt1-f193.google.com' FROM:'lenny@magitekltd.com' RCPT:''
X-RedHat-Spam-Score: 0.004  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_NONE) 209.85.160.193 mail-qt1-f193.google.com 209.85.160.193
	mail-qt1-f193.google.com <lenny@magitekltd.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 30 Jul 2019 21:06:49 +0000 (UTC)

On 7/29/19 4:32 PM, Richard Guy Briggs wrote:

> It is being ignored because that kernel command line extension to the
> original feature was never backported to RHEL7.

That would definitely do it.

>
> In hindsight, that would have been pretty useful without causing much
> risk.  Normally feature backport is driven by customer demand.  There
> was a bit of pushback when it was first introduced upstream, but this is
> exactly the scenario I envisioned where it would be most useful.  It is
> possible to compile your own kernel and change the default value, but
> that's obviously a hurdle for most.

It would definitely have been useful, some might say even necessary,
given the audit event startup noise occurring with systemd.

Wow. Thanks Richard, I appreciate the answer on this.

LCB

-- 
Lenny Bruzenak
MagitekLTD

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

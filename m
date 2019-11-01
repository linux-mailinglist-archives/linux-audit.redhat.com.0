Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id F3A92EC4B9
	for <lists+linux-audit@lfdr.de>; Fri,  1 Nov 2019 15:29:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572618581;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gOkdttnrKwa11MkJH3OK4VSrpBVe9DIrSgzjdRx9H5Y=;
	b=bBAT6C4hBZiH7RJRa/gAunvEl2t4DK2EI1Gql/ua1Yw28qvTYJe3+nhT/UuCXc5pWhTjv2
	zH8FxLFI3Nth/2Xq+0JxPBLiaNPwrSvyXwDvRStjeRP1L/Kr8LhnfMYXrUvVo1q+LlMZPd
	9BMDibVlglMVdfXQFGgruUAjKkyYfso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-iWDFT2skP8mG4JiBlWzpdA-1; Fri, 01 Nov 2019 10:29:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1A231800D67;
	Fri,  1 Nov 2019 14:29:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8A605D6A7;
	Fri,  1 Nov 2019 14:29:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2EB118034E9;
	Fri,  1 Nov 2019 14:29:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA1EQlpl011728 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 1 Nov 2019 10:26:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2EF00600F8; Fri,  1 Nov 2019 14:26:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28CB0600D1
	for <linux-audit@redhat.com>; Fri,  1 Nov 2019 14:26:44 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 41889307D93A
	for <linux-audit@redhat.com>; Fri,  1 Nov 2019 14:26:44 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id c184so7214918pfb.0
	for <linux-audit@redhat.com>; Fri, 01 Nov 2019 07:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Xt6DJJYiMH5SDzj4lvVbYJw4NZG1IEk8rRmd8ic00EM=;
	b=P9MTy91Opi9LxWkWNlxwUmHXgf7jtxv+iQKcCEoHiAPmqV0XCo63HPxFr4A5JsoM7+
	S2d1E3q0XfoCDjotSRfeu/AakDInROnePF+zE5gnKjuYzd3DTwmZ9XG4fvsYdMpExx9L
	1Iz6AV0C9352wRs/SlUbCadfhJeEQZndbfFsqO4SugI+2sIv3gA/2tBkiaJuMRI+LTe9
	4+Ca6APiLy8FVq9udaFAFhvXt+3LMOiyQ7t9cmxFa06vGbq+NP1sJpMz+T/o+0Ip9Mxu
	1uhLkiRjTNq1vvoUUxdFFTdx3Y7nZPHBbPNLbugu9vpKVBqtI/2DY6tFva4bHx1cWJtO
	5l5Q==
X-Gm-Message-State: APjAAAUw+7VfFqkwTXEPKAZJO0PZQdhPm4/E8XWs9MdbTWJ7QyR+0ci2
	mKsFpBnBFMM9Z5hzgbUmoHVP6Vm4y2E=
X-Google-Smtp-Source: APXvYqw1IeAc542pKVGrVvPmKetO95z5kF7q3fuhM2zrBQLRpt5YksKdl9Vsdkuli9KOb6adUCLOpg==
X-Received: by 2002:a63:e009:: with SMTP id e9mr6323745pgh.222.1572618403514; 
	Fri, 01 Nov 2019 07:26:43 -0700 (PDT)
Received: from [192.168.1.151] ([47.187.53.142])
	by smtp.gmail.com with ESMTPSA id g9sm8216400pjl.20.2019.11.01.07.26.42
	for <linux-audit@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2019 07:26:42 -0700 (PDT)
Subject: Re: [PATCH] audit: set context->dummy even when audit is off
To: linux-audit@redhat.com
References: <CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<CAHC9VhRwRSGa5JSL0=cXxG-oOg9jUve9OEYyTCqTxzr=aMdGxg@mail.gmail.com>
	<B63048C4-3158-453B-859A-C5574AACDC36@fb.com> <3063279.ZKBa9cPvsK@x2>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <f54be09d-297b-108a-533e-324a04fd1f6d@magitekltd.com>
Date: Fri, 1 Nov 2019 09:26:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3063279.ZKBa9cPvsK@x2>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 01 Nov 2019 14:26:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Fri, 01 Nov 2019 14:26:44 +0000 (UTC) for IP:'209.85.210.178'
	DOMAIN:'mail-pf1-f178.google.com'
	HELO:'mail-pf1-f178.google.com' FROM:'lenny@magitekltd.com' RCPT:''
X-RedHat-Spam-Score: 0.004  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_NONE) 209.85.210.178 mail-pf1-f178.google.com 209.85.210.178
	mail-pf1-f178.google.com <lenny@magitekltd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: iWDFT2skP8mG4JiBlWzpdA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/1/19 9:16 AM, Steve Grubb wrote:

> This is the root of the problem. Journald should never turn on audit since it 
> has no idea if auditd even has rules to load. What if the end user does not 
> want auditing? By blindly enabling audit without knowing if its wanted, it 
> causes a system performance hit even with no rules loaded. It would be best 
> if journald leaves audit alone. If it wants to listen on the multicast 
> socket, so be it. It should just listen and not try to alter the system.

+1 for me, except I would also question why it would even listen, as to
me it seems that implies storage.

If that's true, I would want to be able to disable it as I do not want
audit events stored elsewhere as well.

Thx,

LCB

-- 
Lenny Bruzenak
MagitekLTD

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


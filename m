Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CB5B6287784
	for <lists+linux-audit@lfdr.de>; Thu,  8 Oct 2020 17:33:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-zekmuq5nN26TQXbEUpS_Jw-1; Thu, 08 Oct 2020 11:33:47 -0400
X-MC-Unique: zekmuq5nN26TQXbEUpS_Jw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 624451021202;
	Thu,  8 Oct 2020 15:33:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48ED15C221;
	Thu,  8 Oct 2020 15:33:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2755F1832FC1;
	Thu,  8 Oct 2020 15:33:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 098FXKVM024511 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 8 Oct 2020 11:33:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 263202166BA0; Thu,  8 Oct 2020 15:33:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 213002166B28
	for <linux-audit@redhat.com>; Thu,  8 Oct 2020 15:33:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B69D7858294
	for <linux-audit@redhat.com>; Thu,  8 Oct 2020 15:33:17 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-353-OAtjJCveO5-HfcUvM4N6Uw-1; Thu, 08 Oct 2020 11:33:15 -0400
X-MC-Unique: OAtjJCveO5-HfcUvM4N6Uw-1
Received: by mail-pf1-f172.google.com with SMTP id x22so4263510pfo.12
	for <linux-audit@redhat.com>; Thu, 08 Oct 2020 08:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=3yXKZN+b+UlvfYlgn8yStw73bEclQCuzLHbsv4D06p4=;
	b=KvaFQX/NF1AJOkWiaNMmonbtvsPTvJUhS+CPBZv1QJbhewTAYKaIhUoAEmoZeW9SQA
	dO1RKKYI4Opcnofut6p8iUoxgMop0tzTMCQfWIgxMmSC33fgwIuMiCLlVaPXXzvz+CrA
	MKnBYjKIKiYOLb8KOtad8/VHPyaEnIRitadNn8mBhAZsBqYNU0Jjx2h0jJfMaNZOxna6
	zVKTKKWqhcwiga+bDgMF6W7fPv6w2s+CJ8ApWXFzpYuuSWl6m1Z6VZQHJhgXcksLnDan
	amTkELgbLbka6jBj2UXfD43L86xaPJjRL1XWUf+qmQ4zMek64Lp5m/0pfDeq7wIOTzTq
	RjTQ==
X-Gm-Message-State: AOAM533n1mWDXFnaG1dKurAUSSdTdztlG1e/fe3nqE0TXpi2WD6PwaHc
	2LhQSS7kBcTGvKVSCWmqWL/ML2prnIJmIXZH
X-Google-Smtp-Source: ABdhPJwT8GEq2Azjl3gKauN/xwyjfrQpMn9+RmkQra3kdUNMBY3xH+5rzMPtHAdBCs6W0XT9GVoXJQ==
X-Received: by 2002:a65:6658:: with SMTP id z24mr7896780pgv.367.1602171193533; 
	Thu, 08 Oct 2020 08:33:13 -0700 (PDT)
Received: from [192.168.0.143] ([216.158.248.233])
	by smtp.gmail.com with ESMTPSA id
	l82sm3018885pfd.102.2020.10.08.08.33.11 for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 08 Oct 2020 08:33:12 -0700 (PDT)
Subject: Re: Identifying thread/process termination
To: linux-audit@redhat.com
References: <CAPErmPdDACGemKqTrUk4xKNBwnoj6FEeWbsvmk7jS0TjOyaOqg@mail.gmail.com>
	<5549003.MhkbZ0Pkbq@x2>
	<CAHC9VhThN4R7jsukKrmjVG=6Rm07jWwjcNQ5CS4v6JzMh+NQbg@mail.gmail.com>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <1c3736b4-c72e-fc87-90af-3d336a8a6c64@magitekltd.com>
Date: Thu, 8 Oct 2020 09:33:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhThN4R7jsukKrmjVG=6Rm07jWwjcNQ5CS4v6JzMh+NQbg@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 10/7/20 7:27 PM, Paul Moore wrote:

> Almost everywhere in the kernel we record the TGID for the "pid="
> values and not the actual task/thread ID.  That decision was made
> before my heavy involvement with audit, but my guess is that most
> audit users are focused more on security relevant events at the
> process level, not the thread level.  After all, there isn't really
> much in the way of significant boundaries between threads.

That's right, Paul. The process (exe/comm) is the discriminator from a 
security perspective.

LCB

-- 
Lenny Bruzenak
MagitekLTD

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A5AA0E4797
	for <lists+linux-audit@lfdr.de>; Fri, 25 Oct 2019 11:43:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571996581;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tcwZ0iHtEhRJnYSCkLExS9hmWJm7bbxlMz6PAV2CAKg=;
	b=ikR319UHpsLSXnXz5QomMZh7KnS18wzfQyc+/+8t83H9/MmUaa+7K5xWuEh43R5ZKJivR8
	P6S/m4y0CwuhDpmZkzCALj6BRKUCf31XWTG2PO0cnnOCSLaSl7diSBfpqXO/0d3JT8CuVm
	G7rnjoAVHxJbTMLxoe1ERiqC5mS0UOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-l4KivyyCNzO9Sg4YZ8z6nw-1; Fri, 25 Oct 2019 05:42:57 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 898B2801E6F;
	Fri, 25 Oct 2019 09:42:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 412B4450A;
	Fri, 25 Oct 2019 09:42:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F19F31800B74;
	Fri, 25 Oct 2019 09:42:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9O3d8MF005833 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 23 Oct 2019 23:39:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B7BD35D70D; Thu, 24 Oct 2019 03:39:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2E2A5D6D0
	for <linux-audit@redhat.com>; Thu, 24 Oct 2019 03:39:06 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0158F646C7
	for <linux-audit@redhat.com>; Thu, 24 Oct 2019 03:39:05 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id k7so11162592pll.1
	for <linux-audit@redhat.com>; Wed, 23 Oct 2019 20:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=W8sgLGjMxM6EuY1mpsS+9Tn33OqsmcrGz0uhv99VAHA=;
	b=cB+JD3FZwtYgrE/B8lvHpTuCjrny3VUD1j+KNMuEovso9SNThAS0nVT7SX2q01Ci3G
	U4dr7LOBzXBiGuCvnoS22TV7Ml6r1yfULzvdvTPyLlBB4abmO68aYqIjud0QgUqZkJy3
	2ENs9ein6OymNYwo2LMT+9kY+tZQ13BNp4jI2t/Utid+Ma4EIukQ8KXk/QTJfobkkrqL
	/WoCnR9jnmfsx/6f4Nq6279+Qb2QMwbxrqLVkq0fGBL07PbY9CeD6eEq77RqIq7HfQPv
	w63x3aGvD+q9MsLI/AvRNrx1cOV2a87kHzTomQmVtVXzffa41K2N+Q7EwdQvVmwIQp6t
	1PTQ==
X-Gm-Message-State: APjAAAX4QFaX8dDsF7I4cZh79Z9M+9q+Alh6YhcQZEHXXuyUZqs1fabz
	tQhG+72N21PDTXvby6pd50ehLg==
X-Google-Smtp-Source: APXvYqzjuWYGP5CVydefv3aAYM4Zf7GeakbWEIFeuKC0sgKLKckuazE4qo+gNK3oOsra0rup9w7uiQ==
X-Received: by 2002:a17:902:968f:: with SMTP id
	n15mr13304176plp.191.1571888344349; 
	Wed, 23 Oct 2019 20:39:04 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.79])
	by smtp.gmail.com with ESMTPSA id
	b17sm9759144pfr.17.2019.10.23.20.39.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Oct 2019 20:39:03 -0700 (PDT)
Subject: Re: [Kgdb-bugreport] [PATCH] kernel: convert switch/case fallthrough
	comments to fallthrough;
To: Joe Perches <joe@perches.com>, Daniel Thompson <daniel.thompson@linaro.org>
References: <f31b38b9ad515a138edaecf85701b1e3db064114.camel@perches.com>
	<20191021090909.yjyed4qodjjcioqc@holly.lan>
	<bff0a1c4fc69b83c763ffbce42a0152e1573499a.camel@perches.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <2808c960-6178-17b8-23d7-a6945987a658@kernel.dk>
Date: Wed, 23 Oct 2019 21:39:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bff0a1c4fc69b83c763ffbce42a0152e1573499a.camel@perches.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.71]);
	Thu, 24 Oct 2019 03:39:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Thu, 24 Oct 2019 03:39:05 +0000 (UTC) for IP:'209.85.214.195'
	DOMAIN:'mail-pl1-f195.google.com'
	HELO:'mail-pl1-f195.google.com' FROM:'axboe@kernel.dk' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.214.195 mail-pl1-f195.google.com 209.85.214.195
	mail-pl1-f195.google.com <axboe@kernel.dk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 25 Oct 2019 05:42:32 -0400
Cc: linux-pm@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: l4KivyyCNzO9Sg4YZ8z6nw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/23/19 12:49 PM, Joe Perches wrote:
> On Mon, 2019-10-21 at 10:09 +0100, Daniel Thompson wrote:
>> On Fri, Oct 18, 2019 at 09:35:08AM -0700, Joe Perches wrote:
>>> Use the new pseudo keyword "fallthrough;" and not the
>>> various /* fallthrough */ style comments.
>>>
>>> Signed-off-by: Joe Perches <joe@perches.com>
>>> ---
>>>
>>> This is a single patch for the kernel/ source tree,
>>> which would otherwise be sent through as separate
>>> patches to 19 maintainer sections.
>>
>> For the kernel/debug/ files:
>>
>> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
>>
>> Will you be putting this in an immutable branch once you've collected
>> enough acks?
> 
> No, I expect Linus will either run the script
> or apply this patch one day.

Please coordinate and get something like this run/applied a few days
before -rc1 to cause the least amount of needless merge issues.

-- 
Jens Axboe

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


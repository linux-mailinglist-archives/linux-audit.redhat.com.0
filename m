Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CF8412FA234
	for <lists+linux-audit@lfdr.de>; Mon, 18 Jan 2021 14:55:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-O6DG5B2IOICpgarpL5I_NQ-1; Mon, 18 Jan 2021 08:55:10 -0500
X-MC-Unique: O6DG5B2IOICpgarpL5I_NQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65A04180A092;
	Mon, 18 Jan 2021 13:55:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E317E19D9F;
	Mon, 18 Jan 2021 13:55:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 855B44A7C7;
	Mon, 18 Jan 2021 13:55:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10IDscxo020500 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 18 Jan 2021 08:54:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8DF6D100403A; Mon, 18 Jan 2021 13:54:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A5891004051
	for <linux-audit@redhat.com>; Mon, 18 Jan 2021 13:54:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A718187504F
	for <linux-audit@redhat.com>; Mon, 18 Jan 2021 13:54:35 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-99-GzpfvQkJOnC187eYQ-K95g-1; Mon, 18 Jan 2021 08:54:33 -0500
X-MC-Unique: GzpfvQkJOnC187eYQ-K95g-1
Received: by mail-io1-f45.google.com with SMTP id x21so14656207iog.10
	for <linux-audit@redhat.com>; Mon, 18 Jan 2021 05:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
	:references:user-agent:subject:mime-version
	:content-transfer-encoding;
	bh=4v/XZrFPxnldLwR2vbJmhIQYmI6Ey50e0AbBeiYnUSc=;
	b=L3vW/4EMSIyknURqtUlNTUaaEgmwxcnt180mqofQIP0SKE7VzLlSJWhpnDLANVKGzo
	8V1wVinilSQv45ats6HYLmhLux/7FK86Hc6OnDaW+KGZR7TAvmG+cSqnWw00WqZ564T2
	7ZChZbvTyqNj3e/2SiIWWZ4Xz7X5WdyTALBvpB/6oPkoVpG2u1oERj53ewQTLAZhWgAI
	TTtbb/03kORU97Ge2WU4qsuaI4oRcmo/a4oCs8fTe4A6XYngw15oDLiLFtI9oDfJOiZw
	7iegdR47/127hCK7gsKPbLuVMotpTW2rqVvlK8n+/nBFAARjzWfbxei6bLno299pXHrV
	hnCw==
X-Gm-Message-State: AOAM533NYS02gu33GDZ1n00JHzmsbmHuttPhBUG5vNG5lm8cP4O3+b0h
	1lamJIv8LJabKGSIsToqYY60
X-Google-Smtp-Source: ABdhPJxbM+AqoalPvOhR+xyKE5ygXtFbFOl4lAY+5lDaOFoBl5fNcXejpdR6WWTVZtPQLLVFFOosTA==
X-Received: by 2002:a5d:940d:: with SMTP id v13mr2709243ion.193.1610978072505; 
	Mon, 18 Jan 2021 05:54:32 -0800 (PST)
Received: from [192.168.7.212] ([151.203.60.33])
	by smtp.gmail.com with ESMTPSA id s10sm7666767iob.4.2021.01.18.05.54.30
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Jan 2021 05:54:31 -0800 (PST)
From: Paul Moore <paul@paul-moore.com>
To: Steve Grubb <sgrubb@redhat.com>, <burn@swtf.dyndns.org>,
	<linux-audit@redhat.com>
Date: Mon, 18 Jan 2021 08:54:30 -0500
Message-ID: <17715c36170.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <5445873.DvuYhMxLoT@x2>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<bdcc07550a210ac539863ab182b6cc2dabf473e8.camel@iinet.net.au>
	<CAHC9VhT_moHEPvkQpN6YmPYrk9KGRwsEocvkTREdjV=qtmCtFg@mail.gmail.com>
	<5445873.DvuYhMxLoT@x2>
User-Agent: AquaMail/1.27.2-1730 (build: 102700009)
Subject: Re: Occasional delayed output of events
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10IDscxo020500
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, Linux Audit <linux-audit@redhat.com>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On January 17, 2021 4:12:44 PM Steve Grubb <sgrubb@redhat.com> wrote:

> On Sunday, January 17, 2021 9:07:08 AM EST Paul Moore wrote:
>> On Fri, Jan 15, 2021 at 9:43 PM Burn Alting <burn.alting@iinet.net.au>
> wrote:
>>> On Fri, 2021-01-15 at 19:35 -0500, Richard Guy Briggs wrote:
>>>> Or we go back to userspace code looking for the EOE record?  This
>>>> doesn't help if they arrive out of order.  Do we number the records in
>>>> the kernel?  N of M...
>>>
>>> I like the N of M concept but there would be a LOT of change - especially
>>> for all the non-kernel event sources. The EOE would be the most
>>> seamless, but at a cost. My preference is to allow the 2 second 'timer'
>>> to be configurable.
>>
>> Agree with Burn, numbering the records coming up from the kernel is
>> going to be a real nightmare, and not something to consider lightly.
>> Especially when it sounds like we don't yet have a root cause for the
>> issue.
>
> A very long time ago, we had numbered records. But it was decided that
> there's no real point in it and we'd rather just save disk space.

With the current kernel code, adding numbered records is not something to take lightly.

> I know that the kernel does not serialize the events headed for user space.
> But I'm curious how an event gets stuck and others can jump ahead while one
> that's already inflight can get hung for 4 seconds before it's next record
> goes out?

Have you determined that the problem is the kernel? Initially it was looking like it was a userspace issue, is that no longer the general thought? Also, is there a reliable reproducer yet?

--
paul moore
www.paul-moore.com




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


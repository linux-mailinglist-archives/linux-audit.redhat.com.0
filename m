Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E6DC62D1BDC
	for <lists+linux-audit@lfdr.de>; Mon,  7 Dec 2020 22:18:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-jdAHNJHfMOKrWX7-10xOtw-1; Mon, 07 Dec 2020 16:18:05 -0500
X-MC-Unique: jdAHNJHfMOKrWX7-10xOtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCDC48144E1;
	Mon,  7 Dec 2020 21:17:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA81319C59;
	Mon,  7 Dec 2020 21:17:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72C0B4A7C6;
	Mon,  7 Dec 2020 21:17:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B7LHuhX024840 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 16:17:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 37C8482877; Mon,  7 Dec 2020 21:17:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31DB77D56A
	for <linux-audit@redhat.com>; Mon,  7 Dec 2020 21:17:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C33888007D9
	for <linux-audit@redhat.com>; Mon,  7 Dec 2020 21:17:53 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-278-WrINRjizMzqsNn7uV4r4hA-1; Mon, 07 Dec 2020 16:17:49 -0500
X-MC-Unique: WrINRjizMzqsNn7uV4r4hA-1
Received: by mail-ej1-f67.google.com with SMTP id lt17so21641837ejb.3
	for <linux-audit@redhat.com>; Mon, 07 Dec 2020 13:17:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EM9ekr6j7Ag3YTG3TfsZcMYajqGswiqkG3PLi8nQlPI=;
	b=jnauWxv5wEMW15t/2aVAy/ntW5wk1n3g1Ydi769PX+ob705hP1R3Udmg7Ck8pfWLOL
	t0ZPI0i4WsRlVWvdkkkz8IQL34dHhyd9P9y6qndc5Uuo3UAWoI8HdZ7FeFm/kPSu3WF6
	QOvvp1i/bh/jo3xr2/OeIYrqFKK5RVcxwR2/1HyiZMwuSQFujLGPXSTNuflZL2lr6Efk
	tyi/YoNf95YA6kgB4eUcMpOxZJJpDZbxwy3EpkG71jHD/g2h5tvrOsU0mZJ9l+zX8I18
	/ppc+pvvKzW2IX+u9DgtBaakhD7O8BU0V/a2sDjHGRQRe3OcUAuyB1m/Rx0S6ObAq3qm
	NMdA==
X-Gm-Message-State: AOAM531ALxZxrkOZcJBn2nJdlrWzXHbNUY2J2IGpfM686eOzQF9AwOam
	EJ9bIu4MmWv7+Hwxqdv9V8UMEDBi31da5m/+oadC
X-Google-Smtp-Source: ABdhPJx68sROb15ygO3/7x9umaeWjJTBJAyo3VVejB2xeoJFD5uvlSPZYTjTK+8GSa+nDt+bCGd1WYfWSepdt4qk34k=
X-Received: by 2002:a17:907:700c:: with SMTP id
	wr12mr20226395ejb.398.1607375868010; 
	Mon, 07 Dec 2020 13:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20200701213244.GA1817@linux-kernel-dev> <20883376.EfDdHjke4D@x2>
	<CAHC9VhQyMD3XiP91u__SwOH-toAa=YBaCrwtvE8dVRVdh-wA0g@mail.gmail.com>
	<5413598.DvuYhMxLoT@x2>
	<CAHC9VhSF7BynebKq0o0Dec7qB5D0CNWLt9uj=Ky_72W0C-BJcg@mail.gmail.com>
	<CAK50otVNjgLM+_Sn4-i2tz0GGNOcW2fK-YHHayZWZhks4XNmUg@mail.gmail.com>
In-Reply-To: <CAK50otVNjgLM+_Sn4-i2tz0GGNOcW2fK-YHHayZWZhks4XNmUg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 7 Dec 2020 16:17:37 -0500
Message-ID: <CAHC9VhRWHW5T03DtqvthP80YHX_=9uvuOyytCAqoGKaZxLGo2w@mail.gmail.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
To: Max Englander <max.englander@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com
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

On Mon, Dec 7, 2020 at 4:13 PM Max Englander <max.englander@gmail.com> wrote:
> It sounds like there's a decision to be made around whether or not to use
> the bitmap feature flags which I probably am probably not in a position to
> help decide. However, I'm more than happy to fix my userspace PR so
> that it does not rely on the feature flag space using the approach Paul
> outlined, in spite of the drawbacks, if that ends up being the decision.

As mentioned several times in the past, I'm not merging a patch which
allocates a bitmap entry for this feature.

> Separately, since there is tension between these two approaches
> (structure size and bitmap), I wonder if Paul/Steve you would be open
> to a third way.
>
> For example, I can imagine adding additional bitmap
> spaces (FEATURE_BITMAP_2, FEATURE_BITMAP_3, etc.).
> Alternately, I can imagine each feature being assigned a unique u64
> ID, and user space programs querying the kernel to see whether a
> a particular feature is enabled.

This isn't attractive to me at this point in time.  NACK.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


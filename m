Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA751FA3D0
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jun 2020 00:58:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592261926;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n3um/at/XLe9IEuLolLTDyUmhq/+qULrlinWQO1mcbs=;
	b=YswjEeno8mp2fpe4vj2khtDA0TAypVMgDoqCpInKs5gYeLCM6dDgIo5j0wEhniDEcnJA6c
	rfJWqACU9Bm7OcoBkCvWUrAd7z7OEY75Hl8eifWrVKW5O9Mpo4sSF1Q5U3QI0Gv6Eepsri
	AtL/QbfkH4Q3HnkK1DudqlBX5qRkx2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-6nfr0HQGNuGBGjc5g8vNVw-1; Mon, 15 Jun 2020 18:58:44 -0400
X-MC-Unique: 6nfr0HQGNuGBGjc5g8vNVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AF3710059A4;
	Mon, 15 Jun 2020 22:58:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7649A19C71;
	Mon, 15 Jun 2020 22:58:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0ABBB1809542;
	Mon, 15 Jun 2020 22:58:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05FMwU04010431 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 15 Jun 2020 18:58:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3F8910031E6; Mon, 15 Jun 2020 22:58:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C006D10F2719
	for <linux-audit@redhat.com>; Mon, 15 Jun 2020 22:58:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA4FA858EFE
	for <linux-audit@redhat.com>; Mon, 15 Jun 2020 22:58:27 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-236-6tvRETBDPAKStZlC5UL6IA-1; Mon, 15 Jun 2020 18:58:25 -0400
X-MC-Unique: 6tvRETBDPAKStZlC5UL6IA-1
Received: by mail-ej1-f65.google.com with SMTP id y13so19315881eju.2
	for <linux-audit@redhat.com>; Mon, 15 Jun 2020 15:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=immT4WkLnda6YfNKYGwHA9yJDk2kiBhS/pGbh2mQjPk=;
	b=NR3Da4+4VSiG+KXLxo5Ow7WTqC7lHaZyupFyc7PwHLKosGJYjhThCvxVIuH0/oGflI
	9McGlf5uop1vOny1DFaRnQns9AFfC8nDXx0AHtRHOwtEVrhryP2St7H90OHd4qsvHA6h
	S3EZHxtUfQO7IUC3qeDJUnlbOcMPQbEwfKUz6eecwcIiuUTWjacLCsq76QBWt2uUKBhL
	vedtXsPpXZ22jNzSdrWNyJbH1hDo5eEw8uSwnM2HJkNgM/0uWqfryDiZEcBeaJ8LNGvz
	uoXlFOmvroiYjwM9yiJcvbNQXaJ1Md4M+4sYB9d8WoXsPsDN0LidQOCzPBa0IeMeD1A2
	FZkA==
X-Gm-Message-State: AOAM533kYinkBeVzROq3xPdiYp0UmEKy4RTm/dPx8RWl0cmruy37kEQ+
	jwHtl+62E4osBjksWVSwnPE1Y5Tlb4Wdsqal02Einag=
X-Google-Smtp-Source: ABdhPJz59Qp09HBaGGrVxVf2joidqjdaTot5Cni90eRr1tEiWW7ztppOOClTAF7v0Wc9hS6nXdg99/Q7znc2zKHsCjk=
X-Received: by 2002:a17:906:ecef:: with SMTP id
	qt15mr77860ejb.91.1592261904302; 
	Mon, 15 Jun 2020 15:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200611000400.3771-1-nramas@linux.microsoft.com>
	<1591989920.11061.90.camel@linux.ibm.com>
	<42482562-d74c-2678-069f-1d8ef4feffac@linux.microsoft.com>
	<8800031.dr63W5FlUW@x2>
In-Reply-To: <8800031.dr63W5FlUW@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 15 Jun 2020 18:58:13 -0400
Message-ID: <CAHC9VhT6JSLBD-JMfQbn9eUsUg=juznRz41DTOaia-=WhrAAuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] integrity: Add errno field in audit message
To: Steve Grubb <sgrubb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: rgb@redhat.com, linux-kernel@vger.kernel.org,
	Mimi Zohar <zohar@linux.ibm.com>,
	Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
	linux-audit@redhat.com, linux-integrity@vger.kernel.org
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 15, 2020 at 6:23 PM Steve Grubb <sgrubb@redhat.com> wrote:
> On Friday, June 12, 2020 3:50:14 PM EDT Lakshmi Ramasubramanian wrote:
> > On 6/12/20 12:25 PM, Mimi Zohar wrote:
> > > The idea is a good idea, but you're assuming that "result" is always
> > > errno.  That was probably true originally, but isn't now.  For
> > > example, ima_appraise_measurement() calls xattr_verify(), which
> > > compares the security.ima hash with the calculated file hash.  On
> > > failure, it returns the result of memcmp().  Each and every code path
> > > will need to be checked.
> >
> > Good catch Mimi.
> >
> > Instead of "errno" should we just use "result" and log the value given
> > in the result parameter?
>
> That would likely collide with another field of the same name which is the
> operation's results. If it really is errno, the name is fine. It's generic
> enough that it can be reused on other events if that mattered.

Steve, what is the historical reason why we have both "res" and
"result" for indicating a boolean success/fail?  I'm just curious how
we ended up this way, and who may still be using "result".

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


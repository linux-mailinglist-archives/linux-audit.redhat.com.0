Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 10D562FC0F0
	for <lists+linux-audit@lfdr.de>; Tue, 19 Jan 2021 21:27:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-kC2jDejKOZKqTxSApMVuSg-1; Tue, 19 Jan 2021 15:27:02 -0500
X-MC-Unique: kC2jDejKOZKqTxSApMVuSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 113AC180A09E;
	Tue, 19 Jan 2021 20:26:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04D3D18770;
	Tue, 19 Jan 2021 20:26:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2FECC1809C9F;
	Tue, 19 Jan 2021 20:26:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JKQNdB027298 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 15:26:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 40588110F0DE; Tue, 19 Jan 2021 20:26:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C815110F0DD
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 20:26:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D62E6800183
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 20:26:20 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-528-KEn_KjkgMZy6HLfmbYoJHQ-1; Tue, 19 Jan 2021 15:26:16 -0500
X-MC-Unique: KEn_KjkgMZy6HLfmbYoJHQ-1
Received: by mail-ed1-f50.google.com with SMTP id bx12so9109757edb.8
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 12:26:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C/kR//ir8WUl4WtalqEnpIc9RiHpiuE+uhr5PlwAWsE=;
	b=PI577UDZs/Tn/WKW+EfP9ueUQ/n4XwH7Pn1gF/yjQq+ilHEsrFH6Yd2DU87PNGAbiw
	6nn/JDQV5xX2NQSUhZ4edPZMFIf3+cjz+/QdfCipkYU/346wdKQHok8Tqp0zggzP3v+k
	643NiGxUAz8McAzGhV7lloJq70qKsN79mD6wuNhX9hJBuhvx1jYVX8j6d8MvMQmCodBt
	3I0PhVbWSi707+0EOv5CMoYhfulMx9hMtXSnGQ9dxVCsrquDmqUkUWDSgFdbrgw0v9oE
	FaGEBQyh0HaNAhb/KPuu30l9VMgbtRuUDVJygbRWRGbcUhDWoe7wGgm2e5L1Twc2kvcg
	rKYA==
X-Gm-Message-State: AOAM532zvOtro35zMfTjqpi0K24kWZiOr3aKVCXmwJAFSzPK7nvLLmP5
	EzOv540YYdE00n6tXuUgusCDN2G+tZx8JKzn78AK
X-Google-Smtp-Source: ABdhPJz/+/mbqN6GZH2nSawxH++aJFskWRIOEfiTMjvNBcD5kBfZSXRfvplwx/rzlSWGQgH6O6dhN8qCjeYn7Yo8/aQ=
X-Received: by 2002:a05:6402:4389:: with SMTP id
	o9mr4875627edc.164.1611087975371; 
	Tue, 19 Jan 2021 12:26:15 -0800 (PST)
MIME-Version: 1.0
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<5445873.DvuYhMxLoT@x2>
	<17715c36170.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
	<3095712.44csPzL39Z@x2>
	<CAHC9VhT_yd=zEusQga507jA43S_stCb2kAmd_sN6fLNcdLDdWg@mail.gmail.com>
	<9a7ed1203fa7ec67000aa68281a215354c2ed5f5.camel@iinet.net.au>
	<CAHC9VhRNcFappgO1eb40wbtjtzZe1b5RRV6ogN563QTOubwvOA@mail.gmail.com>
	<9fd0d1b4585214eb3ed8db6da066b571563f19bc.camel@iinet.net.au>
In-Reply-To: <9fd0d1b4585214eb3ed8db6da066b571563f19bc.camel@iinet.net.au>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 19 Jan 2021 15:26:04 -0500
Message-ID: <CAHC9VhQzr94BdBY3voNEMxzBPM-KS3h1V=epCMMsknfu6Q5vag@mail.gmail.com>
Subject: Re: Occasional delayed output of events
To: burn@swtf.dyndns.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 19, 2021 at 2:38 PM Burn Alting <burn.alting@iinet.net.au> wrote:
> All systems use chrony (current NTP daemon). One is a VM (on top of KVM) and the other a bare metal deployment. Does the above explain my second data set (in the issue) from a bare metal Centos 8 host?
> Perhaps Lenny's comments bare investigation. Either way, I will offer a patch to the user space code to, based on a configuration value, manage correctly such activity.

...

> msg=audit(1609920994.483:1787848):
> msg=audit(1609920994.483:1787848):
> msg=audit(1609920994.483:1787848):
> msg=audit(1609920994.483:1787848):
> msg=audit(1609920994.483:1787848):
> msg=audit(1609920994.484:1787849):
> msg=audit(1609920994.484:1787849):
> msg=audit(1609921000.636:1787850):
> msg=audit(1609921000.636:1787850):
> msg=audit(1609921000.636:1787850):
> msg=audit(1609921008.456:1787851):
> msg=audit(1609921008.456:1787851):
> msg=audit(1609921008.456:1787851):
> msg=audit(1609921008.456:1787851):
> msg=audit(1609921008.456:1787851):
> msg=audit(1609921008.456:1787851):
> msg=audit(1609920994.484:1787849):
> msg=audit(1609920994.484:1787849):
> msg=audit(1609920994.484:1787849):
> msg=audit(1609921010.837:1787852):
> msg=audit(1609921010.837:1787852):
> msg=audit(1609921010.837:1787852):
> msg=audit(1609921010.837:1787852):

Looking at the extracted snippet above where event 1787849 is out of
order we see the following timestamps:

> msg=audit(1609920994.483:1787848):
> msg=audit(1609920994.484:1787849):
> msg=audit(1609921000.636:1787850):
> msg=audit(1609921008.456:1787851):
> msg=audit(1609921010.837:1787852):

... which looks correct in as much that the time doesn't appear to go
backwards between events.  As I said before, I'm not sure how Steve's
userspace works so the time may be a red herring.

Barring some weird condition where auditd disconnects and quickly
reconnects to the kernel, and/or dies and is replaced quickly, I'm not
seeing anything obvious in the kernel which would cause this.  I'm not
saying there isn't anything there, just that it isn't obvious to me at
the moment :)

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


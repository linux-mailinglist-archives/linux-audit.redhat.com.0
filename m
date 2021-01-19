Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F06EA2FBFBF
	for <lists+linux-audit@lfdr.de>; Tue, 19 Jan 2021 20:11:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-iufNXN1BOWmIWCtl9WIpSQ-1; Tue, 19 Jan 2021 14:11:56 -0500
X-MC-Unique: iufNXN1BOWmIWCtl9WIpSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7CF38030B1;
	Tue, 19 Jan 2021 19:11:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9754E1B47C;
	Tue, 19 Jan 2021 19:11:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8FE2D180954D;
	Tue, 19 Jan 2021 19:11:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JJBPhl018717 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 14:11:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EB1552011544; Tue, 19 Jan 2021 19:11:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4C962011540
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 19:11:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8949101A562
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 19:11:20 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
	[209.85.218.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-157-7CuY1x1dMLmrKDMFdls-og-1; Tue, 19 Jan 2021 14:11:18 -0500
X-MC-Unique: 7CuY1x1dMLmrKDMFdls-og-1
Received: by mail-ej1-f48.google.com with SMTP id g3so10710836ejb.6
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 11:11:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PcYj8LxEwncNo3ccALT9NjjqqexLKYcsSiYulL9QM0k=;
	b=gU8oCgNuT62U8tNjBhQ6j/WdwlwPWS3H6Kp14ZflOSBCmbB0DFiZ+kxldrx33j+C03
	EnJ6yv90FIzRCMQDf07T10Lq6f9ACoFs+GuHtaiCId3qr8ePEdlFXToGCaRhSOa/GbJF
	J4G1BsO3GO5sfOZKkwj8KjQXxZImJRPnbJXMWJxAtxda0Kz84ZbOau5TsHgLwQUgtFzn
	W7gqizr/78j3Y6YI6Dkr7UNl49MZkv+ebFbRVK1sAFaR77dSwx0AXtsKBj6YUJo/m3bX
	HRM3b5gy3bIl5ZMbQ6lUfbCE+IsgtCHAyVN1DyIIP0TgvMokmUVBWAfaIbqctPfK1Aew
	4Nog==
X-Gm-Message-State: AOAM531av5xbOYVkTJpwSEIRZI1JlYIH3mZ6slV8EVt0gBc543TNKwQE
	KwmQleBsJ1PrcvgK5qL4HfMcl330IffFROADP78N
X-Google-Smtp-Source: ABdhPJxI0G1IrrqQ60gT7bmnkux20yvEF8bDjYaA4zp9QmE7rleu+UnyBIPwBSjqYsd8RZpaKGSCBVnRSyvxZRz77G8=
X-Received: by 2002:a17:906:11d6:: with SMTP id
	o22mr4012645eja.106.1611083476959; 
	Tue, 19 Jan 2021 11:11:16 -0800 (PST)
MIME-Version: 1.0
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<5445873.DvuYhMxLoT@x2>
	<17715c36170.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
	<3095712.44csPzL39Z@x2>
	<CAHC9VhT_yd=zEusQga507jA43S_stCb2kAmd_sN6fLNcdLDdWg@mail.gmail.com>
	<9a7ed1203fa7ec67000aa68281a215354c2ed5f5.camel@iinet.net.au>
In-Reply-To: <9a7ed1203fa7ec67000aa68281a215354c2ed5f5.camel@iinet.net.au>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 19 Jan 2021 14:11:05 -0500
Message-ID: <CAHC9VhRNcFappgO1eb40wbtjtzZe1b5RRV6ogN563QTOubwvOA@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10JJBPhl018717
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

On Tue, Jan 19, 2021 at 3:18 AM Burn Alting <burn.alting@iinet.net.au> wrote:
> I tend to have a rigorous auditing posture (see the rules loaded in https://github.com/linux-audit/audit-userspace/issues/148) which is not normal for most. Perhaps, Paul, you have hit the nail on the head by stating that this 'severe delay' is not that unreasonable given my rules posture and we just need to 'deal with it' in user space.
> We still get the event data, I just need to adjust the user space tools to deal with this occurrence.
> As for what the system is doing, in my home case it's a Centos 7 VM running a tomcat service which only gets busy every 20 minutes and the other is a HPE Z800 running Centos 8 with 4-5 VM's mostly dormant. I can put any code in these hosts to assist in 'validating'/testing the delay. Advise and I will run.

I took a (slightly) closer look at the queuing code just now and the
corner case I suspected doesn't look very promising here.  On failure
to send a record to userspace, the record is put back at the front of
the queue to preserve ordering so the kernel *should* still emit
records in order even when auditd is under pressure, dead, or in the
process of a restart.  Also, in this case the kernel kicks the auditd
connection, disconnecting auditd's netlink socket; I imagine that
would be a notable event on your systems.

However, looking at the timestamps in the audit events you posted, I
noticed something a little odd.  If I align the timestamps a bit
better let's see if it jumps out at you guys ...

type=XXX msg=audit(1609519900.159:44606): ...
type=XXX msg=audit(1609519900.161:44607): ...
type=XXX msg=audit(1609519900.163:44608): ...
type=XXX msg=audit(1609519896.829:44609): ...
type=XXX msg=audit(1609519900.170:44610): ...

Let me guess Burn, you're running NTP/PTP :)  I'm not sure how auditd
handles things like this, but it looks like there was a small negative
time correction between events which caused the odd scenario where
event N+1 actually occurred before event N according to the wall
clock.  In other words, your system is time traveling ;)

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


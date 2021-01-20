Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC5E2FDCBC
	for <lists+linux-audit@lfdr.de>; Wed, 20 Jan 2021 23:51:28 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-gefxxS7OPmyqoRAQ9LjMbw-1; Wed, 20 Jan 2021 17:51:25 -0500
X-MC-Unique: gefxxS7OPmyqoRAQ9LjMbw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27F1B107ACE3;
	Wed, 20 Jan 2021 22:51:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8120648A3;
	Wed, 20 Jan 2021 22:51:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 211024BB7B;
	Wed, 20 Jan 2021 22:51:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10KMofs1011267 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 Jan 2021 17:50:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 633642166B31; Wed, 20 Jan 2021 22:50:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E7302166B2F
	for <linux-audit@redhat.com>; Wed, 20 Jan 2021 22:50:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AF55101A560
	for <linux-audit@redhat.com>; Wed, 20 Jan 2021 22:50:38 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-465-w0AmixeZO5C8Tni906e0kg-1; Wed, 20 Jan 2021 17:50:35 -0500
X-MC-Unique: w0AmixeZO5C8Tni906e0kg-1
Received: by mail-ed1-f54.google.com with SMTP id n6so218638edt.10
	for <linux-audit@redhat.com>; Wed, 20 Jan 2021 14:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=m//PTnFnxMNLps0ySwbpiUsiIr8FMgX6fCmdjtZdiGQ=;
	b=E9O4inf7/3idxBEevRa4G7srik6X7tvWdDcLaIpQDDY9JxQzbDGD3G0Aa+/qANrD6+
	H++svZXmY8tFn0UHUU60cGxFq1YSW2RF6SHlE+PCzQu0gLpVY8cd0es22brTubkmRUkg
	TOtqoDmiEYpSy8vk1uiXzrB937UVBCnYUml4AHhJQ4eZuDhViRQgrwIPrrg3aKA/6Sb5
	wflvF0ZxginPHknlTPvZQIRXWbVnT7hfFH/k1dnqk4x0cmbftBjFhUJKHKP8eDbDO3Ld
	R0ofeA+7N3uDeuoHA3rLxll7vv3Au890x66ngKh2jUzUedcpGYIXOSkxFv1EmmoGCGKj
	DEQg==
X-Gm-Message-State: AOAM531zF46nVN/4p72lnakcePk4gGzmNEy/Z134rcSDuIZ3AH2p34qH
	RhGL5vBIFu/fl+dPX39enEdTXrnjW6uJA+fVEFzw
X-Google-Smtp-Source: ABdhPJwySWs0Pf3Mui8HdnVd0Q5h7s0WgG8Kdr1RiBPCH4BuGP3lioFgj2LOe+w1kMkRnzTPjCGxq1tN44B7xEODyoY=
X-Received: by 2002:a05:6402:4389:: with SMTP id
	o9mr9071291edc.164.1611183034328; 
	Wed, 20 Jan 2021 14:50:34 -0800 (PST)
MIME-Version: 1.0
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<9fd0d1b4585214eb3ed8db6da066b571563f19bc.camel@iinet.net.au>
	<CAHC9VhQzr94BdBY3voNEMxzBPM-KS3h1V=epCMMsknfu6Q5vag@mail.gmail.com>
	<805552026.0ifERbkFSE@x2>
	<ebcdc0bc829e126c9fb9747b2457c5211527c8b1.camel@iinet.net.au>
In-Reply-To: <ebcdc0bc829e126c9fb9747b2457c5211527c8b1.camel@iinet.net.au>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 20 Jan 2021 17:50:23 -0500
Message-ID: <CAHC9VhT9N6Ztpt3pwE0CMaHyKrwoOWLZuB3vTnq_mpxnkgvfPQ@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10KMofs1011267
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 20, 2021 at 1:38 AM Burn Alting <burn.alting@iinet.net.au> wrote:
> All,
>
> How is the following for a way forward.
>
> a. I will author a patch to the user space code to correctly parse this condition and submit it on the weekend. It will be via a new configuration item to auditd.conf just in case placing a fixed extended timeout (15-20 secs) affects memory usage for users of the auparse library. This solves the initial problem of ausearch/auparse failing to parse generated audit.
> b. I am happy to instrument what ever is recommended on my hosts at home (vm's and bare metal) to provide more information, should we want to 'explain' the occurrence, given I see this every week or two and report back.

Seems reasonable to me.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


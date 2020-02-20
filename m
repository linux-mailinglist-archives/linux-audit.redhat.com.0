Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8014E166B29
	for <lists+linux-audit@lfdr.de>; Fri, 21 Feb 2020 00:48:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582242533;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Cxp7JzF+FItNrtLLPtMoXph4B+6PfQcAsg6/Nhu6YjY=;
	b=CGZqqEMbGGr+xsd6gLJXnS7/qGJcND1lrEFbYXYh9QmC9H2LMaRDhNNquem/7vceCJ0HQB
	vRWziH2W1u90Pz4BTJ8ugN2FlA9ogprxXdpCOPfguW6C9LiBgjXrYGPI4tXB9wleCv5PCo
	VcxxZG1yqrCrNc3au1Lmi82V8yNNW1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20--9XGHihXOWyOPi5uGLZhzw-1; Thu, 20 Feb 2020 18:48:51 -0500
X-MC-Unique: -9XGHihXOWyOPi5uGLZhzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7955EDBF3;
	Thu, 20 Feb 2020 23:48:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9413F38E;
	Thu, 20 Feb 2020 23:48:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B538635AF2;
	Thu, 20 Feb 2020 23:48:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KNmdol023256 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 18:48:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 85A9A103F28F; Thu, 20 Feb 2020 23:48:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8119D1054FCF
	for <linux-audit@redhat.com>; Thu, 20 Feb 2020 23:48:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E306D800298
	for <linux-audit@redhat.com>; Thu, 20 Feb 2020 23:48:36 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-228-0FtHKxeGOA27_AeLSy4_qw-1; Thu, 20 Feb 2020 18:48:34 -0500
Received: by mail-ed1-f46.google.com with SMTP id p3so141373edx.7
	for <linux-audit@redhat.com>; Thu, 20 Feb 2020 15:48:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+j7SYSejXhGWCCXDVQJdin3oCoVKaQ+6eO/GQPNJww8=;
	b=R3hCldSfuqBa4YSroaCLktSk1Ixwf+5mgarPwlKmFma6PuWgNRE2xXM0GP1Dynl3L2
	Hg9UjzvsBCjWZzo6rE1Yax9EO7mwVGHpmPvLmqSqgO9ACkfcHIrXFZF5xKmKr61oIxIs
	+/MFBU3B8wxe9LSMxhc2u7Vj2mhIfpRrfZTXmiAfpuZyYrD+lCufhai7Aa7bovmvNVt/
	ZCxUT1FI11VsoIiZbDM0OZDsvmv1zGy9MT+fL9ZATaqO/Vfw1FPyfMHuVDaCFCojMNwh
	m6in6Ricq2vpxf7NOcVj7wiqBlZqNZn8UZ5y7s03oLzEWPWyVz4XMKs4doEUkT7EpPnV
	evqg==
X-Gm-Message-State: APjAAAX/qZrJSfXoZQC8BV/iayD0XqN5+rPZQXH/v4jsb2wNPCtbK1sy
	jjWC9QsaWZF3qidopJa6IHm5D22Vi67xbFhfFb+ZJBfYuA==
X-Google-Smtp-Source: APXvYqzMQZJ62cM51D3O+rQu7FNxPrcKt3Njlmi9B7XgJlDkGRAcfcMsyFP/L1R+Q9G9qmenSoVCa6pwlaZ8/hiqEvA=
X-Received: by 2002:a50:ec1a:: with SMTP id g26mr29885689edr.164.1582242512799;
	Thu, 20 Feb 2020 15:48:32 -0800 (PST)
MIME-Version: 1.0
References: <CAM5ObREwVjihySamgkSGOxBK8Rwe0jgra5+Ec5ZHK5J5XzD_Ow@mail.gmail.com>
In-Reply-To: <CAM5ObREwVjihySamgkSGOxBK8Rwe0jgra5+Ec5ZHK5J5XzD_Ow@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 20 Feb 2020 18:48:21 -0500
Message-ID: <CAHC9VhSAp+zSBAttcndK-zkj1bQbGhyJm5diK+64ELR3sU5k5Q@mail.gmail.com>
Subject: Re: Question about excluding rules
To: Moshe Rechtman <mrechtma@redhat.com>
X-MC-Unique: 0FtHKxeGOA27_AeLSy4_qw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01KNmdol023256
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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

On Thu, Feb 20, 2020 at 6:37 PM Moshe Rechtman <mrechtma@redhat.com> wrote:
> Hello Experts,
>
> We have a big customer that facing the following issue on RHEL 6.2.
> As per customer request I've configured the following rules ...

A few things: 1) please try to stick to only plaintext email on this
list (no html mail) 2) this mailing list is for the discussion and
development of the Linux audit subsystem in the upstream (or close to
upstream) code.  If you are looking for RHEL, or any other enterprise
Linux distro, support please use the appropriate support channels.

Thank you.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


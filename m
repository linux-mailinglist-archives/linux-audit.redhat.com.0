Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 58E112568C3
	for <lists+linux-audit@lfdr.de>; Sat, 29 Aug 2020 17:43:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-NdXGKCJ7NlaqcfAQ34VZuw-1; Sat, 29 Aug 2020 11:43:27 -0400
X-MC-Unique: NdXGKCJ7NlaqcfAQ34VZuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEF61801FDB;
	Sat, 29 Aug 2020 15:43:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F19E119C59;
	Sat, 29 Aug 2020 15:43:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8DDE183D020;
	Sat, 29 Aug 2020 15:43:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07TFgmES000533 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 29 Aug 2020 11:42:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F8EC11301DC; Sat, 29 Aug 2020 15:42:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B26E11301DB
	for <linux-audit@redhat.com>; Sat, 29 Aug 2020 15:42:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D731A811E78
	for <linux-audit@redhat.com>; Sat, 29 Aug 2020 15:42:44 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
	[209.85.218.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-556-o33VGVuEPwqdk4DevVgFrg-1; Sat, 29 Aug 2020 11:42:42 -0400
X-MC-Unique: o33VGVuEPwqdk4DevVgFrg-1
Received: by mail-ej1-f49.google.com with SMTP id h4so1463805ejj.0
	for <linux-audit@redhat.com>; Sat, 29 Aug 2020 08:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=t/HR1Nv7PeR+YcUsXB5KPLw7XspoOGpMZ36WWY8poWM=;
	b=OLCrrs1/S5tOtNJHz8BrJ3Wv49lEgrcmfgDGeU1/HtGAnwFi8VfkdAWZtB3bs9ERDN
	1YU+dyOlhuAhvuVoGbbfZCj/qwq7yD8HcPZyFQXL9di1ne0CyfaGkWEPbosH2EKfX+bJ
	h5pw5cTNkqqR4kriuqGLZRJK5dncpE/DsXjqJLavdaHpPoKobYk5RVxwHj1ZQUo9KQxh
	/LObMik8BSOBDWALg2QyRnnVexgCdQvGZrHesgXX+wTxI0wWajtEnpux65Y9Mr58if5a
	1q6n/ITuFnaibb9pcfIPz8iqxpjbXD8L7BF/TVS7WeOU0+1HKq1+hIKWPpe3dNFaHoVP
	pJ8g==
X-Gm-Message-State: AOAM531uFDQKbGAMocIlc8S59iU6x8MMzpWySCSIUAtzSBgBeshAw7pv
	gAsVUw5jKipbPbkzjoB1hT5mhllXbgazTSRttGOW5+2/jPRq
X-Google-Smtp-Source: ABdhPJyK/m+imuoIif2/h8YCnv6WcViwrpCPv2fJms0iXQ07uOXk835jUH+OzJr0x/c+/7rC1TwuDWj6iHnueTR5lrM=
X-Received: by 2002:a17:906:f955:: with SMTP id
	ld21mr3868018ejb.398.1598715760838; 
	Sat, 29 Aug 2020 08:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <B257B8BE-4B7F-42BE-BD84-155406FF3FC3@illinois.edu>
In-Reply-To: <B257B8BE-4B7F-42BE-BD84-155406FF3FC3@illinois.edu>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 29 Aug 2020 11:42:29 -0400
Message-ID: <CAHC9VhQzeC7VuZ_sscosyHh4mHvo1fBA6OCMBDjsz2S9z-_SUw@mail.gmail.com>
Subject: Re: [RFC] Tamper Evident Logging on Linux Audit
To: "Paccagnella, Riccardo" <rp8@illinois.edu>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07TFgmES000533
X-loop: linux-audit@redhat.com
Cc: "rgb@redhat.com" <rgb@redhat.com>, "Dave \(Jing\) Tian" <daveti@purdue.edu>,
	"Liao, Kevin" <kliao6@illinois.edu>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>, "Bates,
	Adam" <batesa@illinois.edu>
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 27, 2020 at 12:25 PM Paccagnella, Riccardo <rp8@illinois.edu> wrote:
>
> Dear Linux Audit Team,
>   My team and I would like to share with you some recent research results that we hope will be interesting to you. In a nutshell, we designed a kernel-based tamper-evident logging system and implemented a proof of concept of it on top of Linux Audit. Would you be interested in the possibility of incorporating our system in the upstream version of Linux Audit? We envision a small extension to Linux Audit that would allow users to enable integrity protection for the logs if desired. For reference, this is our paper and this is our proof-of-concept implementation.
>
> Thanks very much in advance and best regards,
> Riccardo

Hi Riccardo,

Often it helps to discuss new features in the context of a patch
submission; it helps remove ambiguity and is an easy way to offer
feedback.  It would appear that you already have patches so I would
suggest you prepare those for posting on-list, complete with an
in-depth commit description, so we can discuss further.

If you are unfamiliar with submitting Linux kernel patches, the link
below may be helpful:

* https://www.kernel.org/doc/html/latest/process/submitting-patches.html

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 98F7B21E4C0
	for <lists+linux-audit@lfdr.de>; Tue, 14 Jul 2020 02:47:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-Lgls2nSEO-6FeFwz0hThag-1; Mon, 13 Jul 2020 20:47:29 -0400
X-MC-Unique: Lgls2nSEO-6FeFwz0hThag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03979100CCC4;
	Tue, 14 Jul 2020 00:47:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B80FA72E41;
	Tue, 14 Jul 2020 00:47:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 727ED94EF6;
	Tue, 14 Jul 2020 00:47:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06E0lKTB025024 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 20:47:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9D256B552E; Tue, 14 Jul 2020 00:47:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0406B5523
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 00:47:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A4EC18056A6
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 00:47:17 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-330-HC93t2KYMpOdc976QpGeQg-1; Mon, 13 Jul 2020 20:47:14 -0400
X-MC-Unique: HC93t2KYMpOdc976QpGeQg-1
Received: by mail-ed1-f68.google.com with SMTP id d18so15399402edv.6
	for <linux-audit@redhat.com>; Mon, 13 Jul 2020 17:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NApkBqGPghhNNCL9d5Xy0Wu7d2361Sf1mZY9qYYrYqY=;
	b=WaC/Plicdppq5ynO9pNj8R0OC7845rQrmzOC5jihiEyJdou54fsS+EgUGZkcJzV7dV
	fkPh/WNfbkZMTB3lr67I+trDWJ5rax18irdfVE740H6eqG5VvzJQyKX+KtkZKLjp/X/I
	aBpTU4Nn0usyL+F/QnlVvf2Ak4s9nwpHUufSvXN1jwTO9iCG9zwpDKD42YCUrRO5245a
	5XRzTM9wmO5SFulQ88rLQiRq5L5NrSDR0UFUN1M8geOKitcm9rPSy/oeUounDY1eoA0r
	L+DIUW0skI9CWTtIQDjfizH4BExCfWcZw9dy58qEO6mMb1vO9tg4V26kBpeTxBaBKoKK
	zrGA==
X-Gm-Message-State: AOAM5300V8x9J6DOZsZtOiiYXHEFjywZJpkNkdvaaB2IJjmdEt4qkJvp
	k1OywkkDAA0dbrKNF6dE1roz9dwKHMzt1Gxec3Lf
X-Google-Smtp-Source: ABdhPJymxf4qP5bzJo33NRGSZLbIPn+LiJx7hgZUiYftvPWAKUpAhFINb1c350FC7EO1clc6MqEks5UJB5X7jLIyycA=
X-Received: by 2002:a05:6402:204e:: with SMTP id
	bc14mr2064716edb.128.1594687633258; 
	Mon, 13 Jul 2020 17:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <b62d4388b488dedfa2758f32e6d1e5414179b4f2.1593796497.git.rgb@redhat.com>
	<CAHC9VhReURKRe63t7mudKpkW0aVNpCmF=UWHSof1uvRkmZ8HTQ@mail.gmail.com>
	<20200713174014.mjsdugomgjtl3kgz@madcap2.tricolour.ca>
	<9ec00f40-e7e9-950e-4ed9-48533a9ee223@schaufler-ca.com>
	<20200713200214.qh3vnhcjozpnqf2l@madcap2.tricolour.ca>
	<e2a183b2-35f4-8493-c485-8bf86e5866e9@schaufler-ca.com>
	<CAHC9VhQUiqkeygtEWAa=j8Dxysh_jSWhf33CYo7i2Tij26FH2w@mail.gmail.com>
	<199a98fc-93ee-53fa-a5aa-4d79d26d1a91@schaufler-ca.com>
In-Reply-To: <199a98fc-93ee-53fa-a5aa-4d79d26d1a91@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 13 Jul 2020 20:47:02 -0400
Message-ID: <CAHC9VhT5SNX+bR3ctAfqhvtPOaV2dreVmTHuFm+dmCSM9Qm9ZA@mail.gmail.com>
Subject: Re: [PATCH ghak122 v1] audit: store event sockaddr in case of no rules
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, Eric Paris <eparis@parisplace.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 13, 2020 at 8:28 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 7/13/2020 5:11 PM, Paul Moore wrote:
> > On Mon, Jul 13, 2020 at 7:09 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> ... but it does appear that I could switch to using your audit_alloc_local().
> > In my opinion, linking the audit container ID and LSM stacking
> > patchsets would seem like a very big mistake, especially since the
> > consolidation you are describing could be done after the fact without
> > any disruption to the kernel/userspace interface.  I would strongly
> > encourage both patchsets to remain self-contained if at all possible
> > so as to not jeopardize each other.
>
> Whatever helps the review/ack process best works for me. I will leave
> audit_stamp_context() as is unless there is other feedback that leads
> it to be changed.

Thanks, I think that is the best path forward for both patchsets.
If/when both patchsets land in the kernel I'm happy to revisit this.


-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


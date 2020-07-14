Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C43C321E504
	for <lists+linux-audit@lfdr.de>; Tue, 14 Jul 2020 03:20:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-Dm7eaIyaMsKjaYyKTEbJfQ-1; Mon, 13 Jul 2020 21:19:57 -0400
X-MC-Unique: Dm7eaIyaMsKjaYyKTEbJfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77236800FED;
	Tue, 14 Jul 2020 01:19:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4FFC1001B0B;
	Tue, 14 Jul 2020 01:19:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A442D94EF6;
	Tue, 14 Jul 2020 01:19:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06E1JfgO030568 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 21:19:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 323011004C42; Tue, 14 Jul 2020 01:19:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DFD01007BA9
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 01:19:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 112CD800658
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 01:19:39 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-370-Vtd_ioz9PDCSOrGMv2z_XA-1; Mon, 13 Jul 2020 21:19:36 -0400
X-MC-Unique: Vtd_ioz9PDCSOrGMv2z_XA-1
Received: by mail-ej1-f65.google.com with SMTP id dp18so19617592ejc.8
	for <linux-audit@redhat.com>; Mon, 13 Jul 2020 18:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OUeD8OgXVWt3joKe/i1sE63xXmDC3G4/TklifdoRVpg=;
	b=HQbTn3Ku9ETHcrIXoy4ECLOwxgZBwJUrDgRkRvfIXgFQHEh8WXUdlhlOjCwdPhnb7A
	bSb7qjdF9+pRG6i4uw8B53tK0zP45+fNtIRjXje3FXSx3nftikhhajVjxdd/mvs4OBfD
	mk3NOsAqOUtLECFm2KeNhp7dgvCMDCPsW6Vpdns+a6TTpAsuGZLWfxE05WRqiJW0Di1j
	fz6+Po1nA4dxf3lER/28avQr6KHkrE/M4cJiSADb7ugztUNCHUS0KnFrNPeqv1mdosVh
	G74WF7jO7G15do2iwzaAFvRFCWlAdzIMJjwGGT8DzkU710OWVReMR3luh8JkR+D9prcF
	fN9w==
X-Gm-Message-State: AOAM530jlI3GHPbN5LRwRPFX4nsneN9t36MHh4I3wAWg9mfhwKGC3Udn
	2kWHzcgUsLhi/e4XHs5j9Udxs41Y7XDr5VH3cpjuRm8=
X-Google-Smtp-Source: ABdhPJxSe2tor08x2TxIkBT75gU2XPC41YWvitXvXZTa53/+cfxu1z2s7Z6iZKugfTdGet9AzjAcY4sEIp9FW8lvA10=
X-Received: by 2002:a17:906:aac9:: with SMTP id
	kt9mr2192725ejb.488.1594689575210; 
	Mon, 13 Jul 2020 18:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <b62d4388b488dedfa2758f32e6d1e5414179b4f2.1593796497.git.rgb@redhat.com>
	<CAHC9VhReURKRe63t7mudKpkW0aVNpCmF=UWHSof1uvRkmZ8HTQ@mail.gmail.com>
	<20200713174014.mjsdugomgjtl3kgz@madcap2.tricolour.ca>
	<9ec00f40-e7e9-950e-4ed9-48533a9ee223@schaufler-ca.com>
	<20200713200214.qh3vnhcjozpnqf2l@madcap2.tricolour.ca>
	<e2a183b2-35f4-8493-c485-8bf86e5866e9@schaufler-ca.com>
	<CAHC9VhQUiqkeygtEWAa=j8Dxysh_jSWhf33CYo7i2Tij26FH2w@mail.gmail.com>
	<20200714010814.rbmpsbmyvyj5tab4@madcap2.tricolour.ca>
In-Reply-To: <20200714010814.rbmpsbmyvyj5tab4@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 13 Jul 2020 21:19:24 -0400
Message-ID: <CAHC9VhQB6m_TtsQEnpanfaAd_mH3wp4jg-UByTjvdyUinw5Y9g@mail.gmail.com>
Subject: Re: [PATCH ghak122 v1] audit: store event sockaddr in case of no rules
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 13, 2020 at 9:08 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-07-13 20:11, Paul Moore wrote:
> > On Mon, Jul 13, 2020 at 7:09 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> > > ... but it does appear that I could switch to using your audit_alloc_local().
> >
> > In my opinion, linking the audit container ID and LSM stacking
> > patchsets would seem like a very big mistake, especially since the
> > consolidation you are describing could be done after the fact without
> > any disruption to the kernel/userspace interface.  I would strongly
> > encourage both patchsets to remain self-contained if at all possible
> > so as to not jeopardize each other.
>
> I see no need to link them.  The audit_alloc_local() patch could stand
> on its own to be used by either patchset and doesn't need to be included
> in the contid patchset.  There is no mention of contid in it.  Patches 8
> and 11 depend on it so as long as it is already upstream that's fine.

Let me be clear, please don't do this.  I really dislike that we need
audit_alloc_local(), but we do because computers are awful things and
audit is perhaps even more awful.

Someday I'll make my peace with audit_alloc_local(), and/or it will
become something more useful through consolidation, but now is not the
time to push on this issue considering where the audit container ID
patchset is at.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


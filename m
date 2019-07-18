Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A4C6D09E
	for <lists+linux-audit@lfdr.de>; Thu, 18 Jul 2019 17:01:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64CCBC0703C5;
	Thu, 18 Jul 2019 15:01:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84DA060566;
	Thu, 18 Jul 2019 15:01:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C8A71800207;
	Thu, 18 Jul 2019 15:01:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6IF1PEs018628 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Jul 2019 11:01:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0679F60559; Thu, 18 Jul 2019 15:01:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE23C60576;
	Thu, 18 Jul 2019 15:01:15 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 499AE3CA06;
	Thu, 18 Jul 2019 15:01:14 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id e20so21573178iob.9;
	Thu, 18 Jul 2019 08:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OBmUwDWJtxKaQ2kK4Trm9YwZFgLnP5TQrP9kx19PbaI=;
	b=oxNtKWumWz1UN+oF8bN/ei+aEsBc5aWyv4Ru8sOxXpS16PAbGY5ugEcUmbAwIWcO5x
	NBf4eQe64L/EfsolWnf0v6N5PleSw3e6CqLFTCXv31RumxNEGXr/FElWuQY0MIaEZeI/
	9EHcINljXQV+/2cJEQBEMC8CIbcy2TprDxsQpacpHNaGx55OLpdMknh5fKkITENY1d04
	v2clDeqgHM6C84jhF54I0so0JlrdvkQuQVOjdtcwWV125KUUNwiXy7mgy9FqlU94kmTT
	trIjdSQyGJ5HEKxH/APKYSsqbok/ir1iOTdI9F5S8sPgmuTfLqX4UxbhhV24Iiq0yh2A
	tsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OBmUwDWJtxKaQ2kK4Trm9YwZFgLnP5TQrP9kx19PbaI=;
	b=Zptf1kAB5NSdUDZrpkGwWbseIIqxlqlNc68thbAsyp0wbVGfSNuOlE/TRpULBIwo95
	iFmpgKnAc02RMNRHgrOrbEFbsmV90iTvtGWubRDJsZiiyR+Jdsa8A5bhIMHAoYjy93gB
	IuQsqAeCx4qA2HvSIZ79o3QSnutqCgbB0xnksblFEiBhSRreuWGyWAzdXCD5FdvVog9/
	92BBmHKbWjBVj3SPX32Y5EzXcqXaJ6jzzEm9BD84vWRwTA0AENd8pGWJiizrhD+4kgJq
	FVQ3eW0JsYZELPuTl/QvcCo5q+A7sR1DxH1a+nRYntyrmExFhNaU79nHT6ka4N0FqekM
	MaQw==
X-Gm-Message-State: APjAAAXEnIi+/R/KhwXfPe2KKLZZuCyFYgHYe40nXhh0dpV60l/yaXUM
	94EvHCLoOtWK+W0r/iRE+EroKb34UrZwbwP9fRU=
X-Google-Smtp-Source: APXvYqz+GK8QHgGGMsBzhjzqQAyXoW1X5OplWauMURAoTz/329460v+kUxeIGu53rLR+mk7V/lxMvEqGma7qyF0+ohA=
X-Received: by 2002:a5e:c70c:: with SMTP id f12mr45640884iop.293.1563462073437;
	Thu, 18 Jul 2019 08:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<c993f63a-7c2d-c6c8-cfa6-3cfba410770d@schaufler-ca.com>
	<CAHC9VhSTwvueKcK2yhckwayh9YGou7gt2Gny36DOTaNkrck+Mg@mail.gmail.com>
	<2477603.130G60v5SE@x2>
	<d1a237d3-4b72-48b0-27d6-fb168354ad31@schaufler-ca.com>
	<CAHC9VhTQLihNQ1iGjJB=LAn=C6BQokFsjsRcj8O_O9AjqQ7HBg@mail.gmail.com>
In-Reply-To: <CAHC9VhTQLihNQ1iGjJB=LAn=C6BQokFsjsRcj8O_O9AjqQ7HBg@mail.gmail.com>
From: William Roberts <bill.c.roberts@gmail.com>
Date: Thu, 18 Jul 2019 10:01:01 -0500
Message-ID: <CAFftDdrX2Y9Lr7Wi7jvrADTYNup6djc+1EFMHjFJzO0VSJ_Yeg@mail.gmail.com>
Subject: Re: Preferred subj= with multiple LSMs
To: Paul Moore <paul@paul-moore.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 18 Jul 2019 15:01:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Thu, 18 Jul 2019 15:01:14 +0000 (UTC) for IP:'209.85.166.41'
	DOMAIN:'mail-io1-f41.google.com' HELO:'mail-io1-f41.google.com'
	FROM:'bill.c.roberts@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.41 mail-io1-f41.google.com 209.85.166.41
	mail-io1-f41.google.com <bill.c.roberts@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 18 Jul 2019 15:01:48 +0000 (UTC)

<snip>

> > >>>> the following (something between option #2 and #3):
> > >>>>   subj1_lsm=smack subj1=<smack_label> subj2_lsm=selinux
> > >>>>
> > >>>> subj2=<selinux_label> ...
> > >>> If it's not a subj= field why use the indirection?
> > >>>
> > >>>         subj_smack=<smack_label> subj_selinux=<selinux_label>

FWIW +1 on this approach.

<snip>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 51DBA1B5CFB
	for <lists+linux-audit@lfdr.de>; Thu, 23 Apr 2020 15:53:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587649990;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tC3nTB1O5SA3cbqSfDoGpYm4WIrgAaBsfQko5H1qzkM=;
	b=JOrYazwkwVUl0RTF0QNl6WZjg1+Vs1LxkHrZzkfxRE8GMPUGfch65PcLJraVpPqo7a0Cj/
	zUscQhrLzlBsGZBPNBlOmV4+Rs6v3htAXdWbB1rm3Qi4l3T4Iy+sVgUIieUsFnTLXVuNTf
	umabERXtw3P3NAIKUi9svi5Q6FQY+is=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-_0au22RpMo6IhRYlRtOnkg-1; Thu, 23 Apr 2020 09:53:08 -0400
X-MC-Unique: _0au22RpMo6IhRYlRtOnkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 577BA46B;
	Thu, 23 Apr 2020 13:53:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A621B5D706;
	Thu, 23 Apr 2020 13:52:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF7C01809542;
	Thu, 23 Apr 2020 13:52:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03NDqcdK004192 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Apr 2020 09:52:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0B8EB5C1C8; Thu, 23 Apr 2020 13:52:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast02.extmail.prod.ext.phx2.redhat.com [10.5.110.51])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05BA05C1BD
	for <linux-audit@redhat.com>; Thu, 23 Apr 2020 13:52:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2988A107ACCA
	for <linux-audit@redhat.com>; Thu, 23 Apr 2020 13:52:35 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
	[209.85.218.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-380-ALSylojJPnSeSCCC8kas3w-1; Thu, 23 Apr 2020 09:50:24 -0400
X-MC-Unique: ALSylojJPnSeSCCC8kas3w-1
Received: by mail-ej1-f43.google.com with SMTP id re23so4753424ejb.4
	for <linux-audit@redhat.com>; Thu, 23 Apr 2020 06:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XbLAaiUQmIozWxqcI0ik9TtpFAO3oAawXG77Db9uHds=;
	b=TQESt3j+vMZmDe34dmi6ktAkZAaObft/zuyS1mjHaZFdI/SR+COX8gajCczllE7yyo
	s4+oFc9kNWTg2er8ZtNZgqjr8alT0Eok1y/EU311TNEiS4ob8KMGXWc3+UZ1ZAJ4ftbv
	0mEnh2Z2J7LXtA8zz/16ttt0KvbcCklkcqhN5HlmYQBv1s8ZTwq6D7jYghPALvchU7Gb
	vARYUO1e86m34QvpuE2QW2m+PPYHv0gSPcZEZ+yyG5KDo4lJ4vDVBIhQKrXTEwPPFb8Z
	3mQcJcf5lJNiExYMBe4skDiB05hXlfnSqB9uhVkN14lwjBpRAfaISfKUpUkltoOu2v6w
	Nm4Q==
X-Gm-Message-State: AGi0PuYRTHHnGeRMCLDH85BeSV9iLSlnJcBSpGrsKZVlWB1K+Al4JbO3
	PNY7871i9thACmls5Osjp4yXHFRfeVyyLe6PCzF5
X-Google-Smtp-Source: APiQypKcxhnzaNMZL9kHmnqWBnLw6IfIVugZBok4T3oHHjV2+bjXkyVZDcNZZSTr87lGzloQPVNw351FQFzZVEIKmuA=
X-Received: by 2002:a17:906:d7a2:: with SMTP id
	pk2mr2876227ejb.272.1587649823327; 
	Thu, 23 Apr 2020 06:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200414092740.2fdf0f78@xantho>
	<20200415155355.qudqepcvvler55xs@madcap2.tricolour.ca>
	<20200416120612.GA52165@gardel-login>
	<CAHC9VhTxW5S9Nv8Z_3eTNDHiu9SmDsHvBG_7abH+Db1the19UQ@mail.gmail.com>
	<20200423073021.GA62700@gardel-login>
In-Reply-To: <20200423073021.GA62700@gardel-login>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 23 Apr 2020 09:50:12 -0400
Message-ID: <CAHC9VhSu=cbr_f3fyX_wdBdt_+xHwBBjOJojrk-iNgwhhBCg7w@mail.gmail.com>
Subject: Re: multicast listeners and audit events to kmsg
To: Lennart Poettering <lennart@poettering.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03NDqcdK004192
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 23, 2020 at 3:30 AM Lennart Poettering
<lennart@poettering.net> wrote:
> On Mi, 22.04.20 17:59, Paul Moore (paul@paul-moore.com) wrote:
> > > In systemd we just think that audit information is pretty interesting
> > > even if you don't want to buy into the whole government regulation
> > > stuff, even if you don't want the auditd to run, and the full audit
> > > package installed. i.e. we want to collect the data as one of our
> > > various data streams, as a secondary consumer of it, and leave it to
> > > the audit package itself to do everything else and be the primary
> > > consumer of it.
> > >
> > > Using the multicast group is our way of saying: "we don't want to own
> > > the audit stream, you can keep it; we just want to have a look
> > > too".
> >
> > The problem is that on systems without a running audit daemon there is
> > no one to "own" the audit stream so it floods the kmsg, spills onto
> > the console, and everyone's feet get wet.  Are we going to blame the
> > source of the stream, or the person who turned on the tap in the first
> > place and caused the mess?
>
> It's not a question of blaming anyone. We are just looking for a nice
> way so that we can get the mcast stuff without the kmsg stuff. it can
> totally be something we toggle explicitly, i have no problem with
> that.
>
> > If systemd enables the audit stream, and doesn't want the stream to
> > flood kmsg, it needs to make sure that the stream is directed to a
> > suitable sink, be it auditd or some other daemon.
>
> This sounds as if journald should start using the unicast stream. This
> basically means auditd is out of the game, and cannot be added in
> anymore, because the unicast stream is then owned by journald. It
> wouldn't be sufficient to just install the audit package to get
> classic audit working anymore. You'd have to reconfigure everything.
>
> I mean, we try to be non-intrusive, not step into your territory too
> much, not replace auditd, not kick auditd out of the game. But you are
> basically telling us to do just that?

My recommendation is that if you are going to enable audit you should
also ensure that auditd is running; that is what I'm telling you.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


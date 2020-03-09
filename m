Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DC53817ECE8
	for <lists+linux-audit@lfdr.de>; Tue, 10 Mar 2020 00:55:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583798149;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3bFEMOIf4EJQhPPMoaSbscrFMR7A9ySGnwDX23nc3rM=;
	b=XJE9/9diwf4qqS7x5N1KsP3dLmVFrlruKmoWAC5eZQWLHh2KSiCK1waQ5VdQN1HYnCBZ+B
	5L+JU8E85zYant65uvwCzn5BQEVAz/SEFbNknyVeXT1ZnfjObq5Or5QVzSFc3TwjF4J33m
	++fVQSmyB8bo3z6G1pZ6wuy8WrgSflk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-bF6dc662P_-Mbulydi9W1w-1; Mon, 09 Mar 2020 19:55:46 -0400
X-MC-Unique: bF6dc662P_-Mbulydi9W1w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9382913E2;
	Mon,  9 Mar 2020 23:55:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0E985C28F;
	Mon,  9 Mar 2020 23:55:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFB8386A00;
	Mon,  9 Mar 2020 23:55:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 029NtQ0h001736 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 9 Mar 2020 19:55:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C390AF98F; Mon,  9 Mar 2020 23:55:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77B87D1D0D
	for <linux-audit@redhat.com>; Mon,  9 Mar 2020 23:55:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99952800307
	for <linux-audit@redhat.com>; Mon,  9 Mar 2020 23:55:24 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-230-WFpepPmBMje6D7FpFH8wLg-1; Mon, 09 Mar 2020 19:55:21 -0400
X-MC-Unique: WFpepPmBMje6D7FpFH8wLg-1
Received: by mail-ed1-f66.google.com with SMTP id ca19so5114700edb.13
	for <linux-audit@redhat.com>; Mon, 09 Mar 2020 16:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ATqnQFBKPT1p02ELSnKePY0l7WbFZ/CxC65rj6GAtS4=;
	b=h+gtxJebIAjMVysrTSd9MMcsZjuauBWZUlikyo0kjjmrXpuWlbCCtJRWvxYFQmGro0
	RMHeTIeXLssUvRq1Tx7TIJaAeqaZspa3+JiMuBr0vDsfpC3EgbpLCepoG3LNCq3lHA0t
	6KD013RD6xLQm/9jeGk63ceWBvdUshXgxPnK+uJa2rTeRZ1P766a/AMwnjWgMlCfIW2W
	G1OIrNoOPW7MmSr6QhRYRooiudPg5bgoameMHlsW9or56A0SlJutPE9S2j3a+Kp06CQq
	OvWQ8T1x2G1I771HiF1npF95YMxmRB44a/5D66SXln5SMFV3O8bqF5Ln0MVaGRy4m552
	eihg==
X-Gm-Message-State: ANhLgQ2c6szpkp/mloH9hT0vYoXGRX+7ucmdGyB/iaV/Lb2A2SUGThJB
	isUn75RsmyKwdo8xw/8H+BXEhWkW2smeEBlW2WxN
X-Google-Smtp-Source: ADFU+vvnIEUY2LquWLpQEiyPqq4E2JonnD7e9IvoOIGc2cvHJUi1zup/+MFTXAnNNmaIGMUuiFN3E+NqOXjIAw3CZ6g=
X-Received: by 2002:aa7:c50e:: with SMTP id o14mr12184408edq.164.1583798120055;
	Mon, 09 Mar 2020 16:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <e75e80e820f215d2311941e083580827f6c1dbb6.1582059594.git.rgb@redhat.com>
	<CAHC9VhTXFg_w8xJChPZZFY=HMpF722p-_NYy=06xjSkLFSCzbg@mail.gmail.com>
	<20200309203107.lzhshn6uzknhmosu@madcap2.tricolour.ca>
In-Reply-To: <20200309203107.lzhshn6uzknhmosu@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Mar 2020 19:55:09 -0400
Message-ID: <CAHC9VhS9o7wmBEfvF=+=cfUzvfcTs9Hu15KcLJjW+92KxBxQ3g@mail.gmail.com>
Subject: Re: [PATCH ghak120] audit: trigger accompanying records when no rules
	present
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 029NtQ0h001736
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, Eric Paris <eparis@parisplace.org>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 9, 2020 at 4:31 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-02-27 20:02, Paul Moore wrote:
> > On Tue, Feb 18, 2020 at 4:01 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > When there are no audit rules registered, mandatory records (config,
> > > etc.) are missing their accompanying records (syscall, proctitle, etc.).
> > >
> > > This is due to audit context dummy set on syscall entry based on absence
> > > of rules that signals that no other records are to be printed.
> > >
> > > Clear the dummy bit in auditsc_set_stamp() when the first record of an
> > > event is generated.
> > >
> > > Please see upstream github issue
> > > https://github.com/linux-audit/audit-kernel/issues/120
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  kernel/auditsc.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > index 4effe01ebbe2..31195d122344 100644
> > > --- a/kernel/auditsc.c
> > > +++ b/kernel/auditsc.c
> > > @@ -2176,6 +2176,8 @@ int auditsc_get_stamp(struct audit_context *ctx,
> > >         t->tv_sec  = ctx->ctime.tv_sec;
> > >         t->tv_nsec = ctx->ctime.tv_nsec;
> > >         *serial    = ctx->serial;
> > > +       if (ctx->dummy)
> > > +               ctx->dummy = 0;
> >
> > Two comments:
> >
> > * Why even bother checking to see if ctx->dummy is true?  If it is
> > true you set it to false/0; if it is already false you leave it alone.
> > Either way ctx->dummy is going to be set to false when you are past
> > these two lines, might as well just always set ctx->dummy to false/0.
>
> Ok, no problem.
>
> > * Why are you setting ->dummy to false in auditsc_get_stamp() and not
> > someplace a bit more obvious like audit_log_start()?  Is it because
> > auditsc_get_stamp() only gets called once per event?  I'm willing to
> > take the "hit" of one extra assignment in audit_log_start() to keep
> > this in a more obvious place and not buried in auditsc_get_stamp().
>
> It is because the context is only available when syscall logging is
> enabled (which is on most platforms and hopefully eventually all) and
> makes for cleaner code and lack of need to check existance of the
> context.

At the very least let's create some sort of accessor function for
dummy then, hiding this in auditsc_get_stamp() seems very wrong to me.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 914AA17F71C
	for <lists+linux-audit@lfdr.de>; Tue, 10 Mar 2020 13:08:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583842133;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1XRx4P/N4ptYp6aEhMxym2k+ObPqx7x1nT4NKzRMH5w=;
	b=Wg/kj3hQ1sx4lhewd8bhUhgi2sZIbFX92Nn71oQ8RP8+LfDLxiicuFAFOdqXsGPbOGsPOB
	C+Jld9hkM8wr0iuxVu2q5yLvOFFbBNqKKXD3epDIglY9KTtNLs3VJg7GOePegAgAkRbes9
	jWEJ36syM4J0GMIjzxRr0nIb4CW4kFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-BiVu6e4dP7eG3A_zPmXTfg-1; Tue, 10 Mar 2020 08:08:51 -0400
X-MC-Unique: BiVu6e4dP7eG3A_zPmXTfg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33FCF13F9;
	Tue, 10 Mar 2020 12:08:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 411D419C58;
	Tue, 10 Mar 2020 12:08:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31CA486A06;
	Tue, 10 Mar 2020 12:08:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02AC8Rhj026110 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 10 Mar 2020 08:08:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B8CFE2028CD4; Tue, 10 Mar 2020 12:08:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B10342028CD6
	for <linux-audit@redhat.com>; Tue, 10 Mar 2020 12:08:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C371101A55D
	for <linux-audit@redhat.com>; Tue, 10 Mar 2020 12:08:25 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-477-QU03KAIrPOejaLVeWH3iCA-1; Tue, 10 Mar 2020 08:08:22 -0400
X-MC-Unique: QU03KAIrPOejaLVeWH3iCA-1
Received: by mail-ed1-f65.google.com with SMTP id a13so16016338edh.3
	for <linux-audit@redhat.com>; Tue, 10 Mar 2020 05:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=He80gN+PoQea1vofurK2Qjmrv3YqUU2ZePh0yVQWrzo=;
	b=ZRAwOGWyj/qXPZ72o5tND7IgTJZy6/Jj/bXOb5WekLkjNFx+T3FGVjXC2I8RaSSwU8
	5e+x/7EMG9gkPHMaSPHGAy9jCHEgBkMSM+Q7Qomj5obqwAF2h8jw11F+8oMQAaDp6l2W
	FCvrm+/jDsd1kCN27sOgwEYTsljefxIARQeCnhTn/E5BKCwd/BNGM3M6GlfOy85QVUTx
	GJpWWHKFsUSdjpOYbyq1QCffXtzEelJITyP8craWKR70Pfc/kqlgiI7Rp/IGCLRXQKY0
	nqNAuLkMMmwzt+Vu1qlL45UXCSmrf+7G/PRt0DL/Oxka1ZKa41PXmOMC6JQugdgguUVd
	nKmg==
X-Gm-Message-State: ANhLgQ1fkW5c0xu85LptEWMnuvvtD1EmgriOHtHnB6YynNv4Is9cZwX3
	7/zZdh3svj0wwOP/ZJL/Fm6IMpsyi8Eqp1aRhUzOFhs=
X-Google-Smtp-Source: ADFU+vu+XJ6RuvL6RFbYQ8x+3M18Y184Yr8DMbLsYkxeLPPLMtPjry1x82KS1y+J9d/vPeI9OncTJ5s/PsJnQLMQLWM=
X-Received: by 2002:a17:906:7fc9:: with SMTP id
	r9mr18335708ejs.77.1583842101112; 
	Tue, 10 Mar 2020 05:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <e75e80e820f215d2311941e083580827f6c1dbb6.1582059594.git.rgb@redhat.com>
	<CAHC9VhTXFg_w8xJChPZZFY=HMpF722p-_NYy=06xjSkLFSCzbg@mail.gmail.com>
	<20200309203107.lzhshn6uzknhmosu@madcap2.tricolour.ca>
	<CAHC9VhS9o7wmBEfvF=+=cfUzvfcTs9Hu15KcLJjW+92KxBxQ3g@mail.gmail.com>
	<20200310005858.m4s23fl3huwevyp5@madcap2.tricolour.ca>
In-Reply-To: <20200310005858.m4s23fl3huwevyp5@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 10 Mar 2020 08:08:10 -0400
Message-ID: <CAHC9VhSz1puQ5oQCnO5-Vq8GUsJh2BvbSmpoY_RqLLPQKd6udA@mail.gmail.com>
Subject: Re: [PATCH ghak120] audit: trigger accompanying records when no rules
	present
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02AC8Rhj026110
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 9, 2020 at 8:59 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> On 2020-03-09 19:55, Paul Moore wrote:
> > On Mon, Mar 9, 2020 at 4:31 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-02-27 20:02, Paul Moore wrote:
> > > > On Tue, Feb 18, 2020 at 4:01 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > >
> > > > > When there are no audit rules registered, mandatory records (config,
> > > > > etc.) are missing their accompanying records (syscall, proctitle, etc.).
> > > > >
> > > > > This is due to audit context dummy set on syscall entry based on absence
> > > > > of rules that signals that no other records are to be printed.
> > > > >
> > > > > Clear the dummy bit in auditsc_set_stamp() when the first record of an
> > > > > event is generated.
> > > > >
> > > > > Please see upstream github issue
> > > > > https://github.com/linux-audit/audit-kernel/issues/120
> > > > >
> > > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > > > ---
> > > > >  kernel/auditsc.c | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > > > index 4effe01ebbe2..31195d122344 100644
> > > > > --- a/kernel/auditsc.c
> > > > > +++ b/kernel/auditsc.c
> > > > > @@ -2176,6 +2176,8 @@ int auditsc_get_stamp(struct audit_context *ctx,
> > > > >         t->tv_sec  = ctx->ctime.tv_sec;
> > > > >         t->tv_nsec = ctx->ctime.tv_nsec;
> > > > >         *serial    = ctx->serial;
> > > > > +       if (ctx->dummy)
> > > > > +               ctx->dummy = 0;
> > > >
> > > > Two comments:
> > > >
> > > > * Why even bother checking to see if ctx->dummy is true?  If it is
> > > > true you set it to false/0; if it is already false you leave it alone.
> > > > Either way ctx->dummy is going to be set to false when you are past
> > > > these two lines, might as well just always set ctx->dummy to false/0.
> > >
> > > Ok, no problem.
> > >
> > > > * Why are you setting ->dummy to false in auditsc_get_stamp() and not
> > > > someplace a bit more obvious like audit_log_start()?  Is it because
> > > > auditsc_get_stamp() only gets called once per event?  I'm willing to
> > > > take the "hit" of one extra assignment in audit_log_start() to keep
> > > > this in a more obvious place and not buried in auditsc_get_stamp().
> > >
> > > It is because the context is only available when syscall logging is
> > > enabled (which is on most platforms and hopefully eventually all) and
> > > makes for cleaner code and lack of need to check existance of the
> > > context.
> >
> > At the very least let's create some sort of accessor function for
> > dummy then, hiding this in auditsc_get_stamp() seems very wrong to me.
>
> Ok.  Anything else?

I'm not sure how many more words we can spill over a two line patch :)

Work up the v2, post it, and we can go from there.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


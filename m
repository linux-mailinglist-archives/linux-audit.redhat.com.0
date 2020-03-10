Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 202BF17ED82
	for <lists+linux-audit@lfdr.de>; Tue, 10 Mar 2020 01:59:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583801964;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UcRyIOHp3luKkfH7lluSjrFBy4wu23jBcoB7PDAaCRw=;
	b=i+EKSk+4eIVd4V7G6T4ai3I3Xle0UzZfQ9/bxqnONIBvR+4AONo8Ht62ydHIKdI4hrid1p
	LPqQC9CTPDtXArQVG3oSre4L+SNgJzhjEbZp8z8LyWrfmlanEJ+uFvbUgeNx81VhorPJuH
	+w1V1K9+OCWxYC/MJPjSfHHS9hCGw6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-XJ1iwjg-OFWn1XhEMqQvrw-1; Mon, 09 Mar 2020 20:59:21 -0400
X-MC-Unique: XJ1iwjg-OFWn1XhEMqQvrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C0CF8010EA;
	Tue, 10 Mar 2020 00:59:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A6E91001B0B;
	Tue, 10 Mar 2020 00:59:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B31684493;
	Tue, 10 Mar 2020 00:59:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02A0x9RB003912 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 9 Mar 2020 20:59:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 51F185DA2C; Tue, 10 Mar 2020 00:59:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.rdu2.redhat.com
	[10.10.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B709B5D9CA;
	Tue, 10 Mar 2020 00:59:01 +0000 (UTC)
Date: Mon, 9 Mar 2020 20:58:58 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak120] audit: trigger accompanying records when no
	rules present
Message-ID: <20200310005858.m4s23fl3huwevyp5@madcap2.tricolour.ca>
References: <e75e80e820f215d2311941e083580827f6c1dbb6.1582059594.git.rgb@redhat.com>
	<CAHC9VhTXFg_w8xJChPZZFY=HMpF722p-_NYy=06xjSkLFSCzbg@mail.gmail.com>
	<20200309203107.lzhshn6uzknhmosu@madcap2.tricolour.ca>
	<CAHC9VhS9o7wmBEfvF=+=cfUzvfcTs9Hu15KcLJjW+92KxBxQ3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhS9o7wmBEfvF=+=cfUzvfcTs9Hu15KcLJjW+92KxBxQ3g@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-03-09 19:55, Paul Moore wrote:
> On Mon, Mar 9, 2020 at 4:31 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-02-27 20:02, Paul Moore wrote:
> > > On Tue, Feb 18, 2020 at 4:01 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > >
> > > > When there are no audit rules registered, mandatory records (config,
> > > > etc.) are missing their accompanying records (syscall, proctitle, etc.).
> > > >
> > > > This is due to audit context dummy set on syscall entry based on absence
> > > > of rules that signals that no other records are to be printed.
> > > >
> > > > Clear the dummy bit in auditsc_set_stamp() when the first record of an
> > > > event is generated.
> > > >
> > > > Please see upstream github issue
> > > > https://github.com/linux-audit/audit-kernel/issues/120
> > > >
> > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > > ---
> > > >  kernel/auditsc.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > > index 4effe01ebbe2..31195d122344 100644
> > > > --- a/kernel/auditsc.c
> > > > +++ b/kernel/auditsc.c
> > > > @@ -2176,6 +2176,8 @@ int auditsc_get_stamp(struct audit_context *ctx,
> > > >         t->tv_sec  = ctx->ctime.tv_sec;
> > > >         t->tv_nsec = ctx->ctime.tv_nsec;
> > > >         *serial    = ctx->serial;
> > > > +       if (ctx->dummy)
> > > > +               ctx->dummy = 0;
> > >
> > > Two comments:
> > >
> > > * Why even bother checking to see if ctx->dummy is true?  If it is
> > > true you set it to false/0; if it is already false you leave it alone.
> > > Either way ctx->dummy is going to be set to false when you are past
> > > these two lines, might as well just always set ctx->dummy to false/0.
> >
> > Ok, no problem.
> >
> > > * Why are you setting ->dummy to false in auditsc_get_stamp() and not
> > > someplace a bit more obvious like audit_log_start()?  Is it because
> > > auditsc_get_stamp() only gets called once per event?  I'm willing to
> > > take the "hit" of one extra assignment in audit_log_start() to keep
> > > this in a more obvious place and not buried in auditsc_get_stamp().
> >
> > It is because the context is only available when syscall logging is
> > enabled (which is on most platforms and hopefully eventually all) and
> > makes for cleaner code and lack of need to check existance of the
> > context.
> 
> At the very least let's create some sort of accessor function for
> dummy then, hiding this in auditsc_get_stamp() seems very wrong to me.

Ok.  Anything else?

I also found useless context and dummy checks in audit_log_proctitle
and removed them since it can't be called if the context doesn't exist.

> paul moore

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


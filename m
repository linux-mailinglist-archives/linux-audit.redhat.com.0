Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCB36912CF
	for <lists+linux-audit@lfdr.de>; Thu,  9 Feb 2023 22:53:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675979609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U4JgBpCXmTkkISJeIiFdX5JoUXlpILg5RjXkN5JZRDc=;
	b=G98t/mijCFogFx3PCoA6qhen/0TfA+hVDWl1BVfGaPB8Qf4du9ox4VCMr8ViAzMgFNLlaD
	rRObJXszq5aSYQWjCh8dhBPMj1YEe9OLUuxfjySJ8xvOFLTsK1rx+xc8XCmZ0eNzZaGi7l
	xlb36SwF8T890z492bNezrB5mRBidjE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-rkts7gqRMWOhNdANS3zv8A-1; Thu, 09 Feb 2023 16:53:26 -0500
X-MC-Unique: rkts7gqRMWOhNdANS3zv8A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7401085C70B;
	Thu,  9 Feb 2023 21:53:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EFD102026D4B;
	Thu,  9 Feb 2023 21:53:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 00D9B19465A0;
	Thu,  9 Feb 2023 21:53:18 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C31471946589 for <linux-audit@listman.corp.redhat.com>;
 Thu,  9 Feb 2023 21:53:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5DCD81415126; Thu,  9 Feb 2023 21:53:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.22.50.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECB16140EBF6;
 Thu,  9 Feb 2023 21:53:14 +0000 (UTC)
Date: Thu, 9 Feb 2023 16:53:12 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v2] io_uring,audit: don't log IORING_OP_MADVISE
Message-ID: <Y+VrSLZKZoAGikUS@madcap2.tricolour.ca>
References: <b5dfdcd541115c86dbc774aa9dd502c964849c5f.1675282642.git.rgb@redhat.com>
 <CAHC9VhS0rPfkwUT1WMfqsTF-qYXdbbhHAfVPs=d3ZQVgbXBHnw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhS0rPfkwUT1WMfqsTF-qYXdbbhHAfVPs=d3ZQVgbXBHnw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Christian Brauner <brauner@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-02-01 16:18, Paul Moore wrote:
> On Wed, Feb 1, 2023 at 3:34 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > fadvise and madvise both provide hints for caching or access pattern for
> > file and memory respectively.  Skip them.
> 
> You forgot to update the first sentence in the commit description :/

I didn't forget.  I updated that sentence to reflect the fact that the
two should be treated similarly rather than differently.

> I'm still looking for some type of statement that you've done some
> homework on the IORING_OP_MADVISE case to ensure that it doesn't end
> up calling into the LSM, see my previous emails on this.  I need more
> than "Steve told me to do this".
> 
> I basically just want to see that some care and thought has gone into
> this patch to verify it is correct and good.

Steve suggested I look into a number of iouring ops.  I looked at the
description code and agreed that it wasn't necessary to audit madvise.
The rationale for fadvise was detemined to have been conflated with
fallocate and subsequently dropped.  Steve also suggested a number of
others and after investigation I decided that their current state was
correct.  *getxattr you've advised against, so it was dropped.  It
appears fewer modifications were necessary than originally suspected.

> > Fixes: 5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_uring")
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> > changelog
> > v2:
> > - drop *GETXATTR patch
> > - drop FADVISE hunk
> >
> >  io_uring/opdef.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/io_uring/opdef.c b/io_uring/opdef.c
> > index 3aa0d65c50e3..d3f36c633ceb 100644
> > --- a/io_uring/opdef.c
> > +++ b/io_uring/opdef.c
> > @@ -312,6 +312,7 @@ const struct io_op_def io_op_defs[] = {
> >                 .issue                  = io_fadvise,
> >         },
> >         [IORING_OP_MADVISE] = {
> > +               .audit_skip             = 1,
> >                 .name                   = "MADVISE",
> >                 .prep                   = io_madvise_prep,
> >                 .issue                  = io_madvise,
> > --
> > 2.27.0
> 
> -- 
> paul-moore.com
> 

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
https://listman.redhat.com/mailman/listinfo/linux-audit


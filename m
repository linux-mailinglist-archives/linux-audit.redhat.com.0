Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A02267F185
	for <lists+linux-audit@lfdr.de>; Fri, 27 Jan 2023 23:55:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674860116;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aLlJPzQ5Uxa8SH0PEfrF0f/ReUrK+s+KJaQcc9ByDQk=;
	b=gI7gHOVhHbCr+zL9C5RmpVlLNebfYFYVAydwx06KBO0JRWJPW2HPmcX2XJls6f9RoN408m
	c/lqQ1COhShfZTUKHoGmLqaBFUFT+u6ttOBfR+16seQ8d+l+qnKS8xvNZIYtI+QeKjPzRk
	gMnCw+8j3n8SS8UGBZRWmNuBIA4P/mg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-jjN__zPUNHqGdnKMbQLHgQ-1; Fri, 27 Jan 2023 17:55:14 -0500
X-MC-Unique: jjN__zPUNHqGdnKMbQLHgQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39D89802C15;
	Fri, 27 Jan 2023 22:55:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 046D8492C14;
	Fri, 27 Jan 2023 22:55:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 919A419465A3;
	Fri, 27 Jan 2023 22:55:11 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B1624194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 22:55:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 938F318EC2; Fri, 27 Jan 2023 22:55:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F05D318EC1;
 Fri, 27 Jan 2023 22:55:07 +0000 (UTC)
Date: Fri, 27 Jan 2023 17:55:05 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v1 1/2] io_uring,audit: audit IORING_OP_FADVISE but not
 IORING_OP_MADVISE
Message-ID: <Y9RWSZJt7NruCPZ+@madcap2.tricolour.ca>
References: <cover.1674682056.git.rgb@redhat.com>
 <68eb0c2dd50bca1af91203669f7f1f8312331f38.1674682056.git.rgb@redhat.com>
 <CAHC9VhSZNGs+SQU7WCD+ObMcwv-=1ZkBts8oHn40qWsQ=n0pXA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSZNGs+SQU7WCD+ObMcwv-=1ZkBts8oHn40qWsQ=n0pXA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Pavel Begunkov <asml.silence@gmail.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-01-27 17:35, Paul Moore wrote:
> On Fri, Jan 27, 2023 at 12:24 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > Since FADVISE can truncate files and MADVISE operates on memory, reverse
> > the audit_skip tags.
> >
> > Fixes: 5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_uring")
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  io_uring/opdef.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/io_uring/opdef.c b/io_uring/opdef.c
> > index 3aa0d65c50e3..a2bf53b4a38a 100644
> > --- a/io_uring/opdef.c
> > +++ b/io_uring/opdef.c
> > @@ -306,12 +306,12 @@ const struct io_op_def io_op_defs[] = {
> >         },
> >         [IORING_OP_FADVISE] = {
> >                 .needs_file             = 1,
> > -               .audit_skip             = 1,
> >                 .name                   = "FADVISE",
> >                 .prep                   = io_fadvise_prep,
> >                 .issue                  = io_fadvise,
> >         },
> 
> I've never used posix_fadvise() or the associated fadvise64*()
> syscalls, but from quickly reading the manpages and the
> generic_fadvise() function in the kernel I'm missing where the fadvise
> family of functions could be used to truncate a file, can you show me
> where this happens?  The closest I can see is the manipulation of the
> page cache, but that shouldn't actually modify the file ... right?

I don't know.  I was going on the advice of Steve Grubb.  I'm looking
for feedback, validation, correction, here.

> >         [IORING_OP_MADVISE] = {
> > +               .audit_skip             = 1,
> >                 .name                   = "MADVISE",
> >                 .prep                   = io_madvise_prep,
> >                 .issue                  = io_madvise,
> 
> I *think* this should be okay, what testing/verification have you done
> on this?  One of the things I like to check is to see if any LSMs
> might perform an access check and/or generate an audit record on an
> operation, if there is a case where that could happen we should setup
> audit properly.  I did a very quick check of do_madvise() and nothing
> jumped out at me, but I would be interested in knowing what testing or
> verification you did here.

No testing other than build/boot/audit-testsuite.  You had a test you
had developed that went through several iterations?

> paul-moore.com

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


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A3467F201
	for <lists+linux-audit@lfdr.de>; Sat, 28 Jan 2023 00:06:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674860770;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vRSeefmqjkNraEcSH8y5wa1FpXU3Ypqahca3qWHBQ94=;
	b=EsjV72+7Rqktvro8Hn8KNA+c6QOLjgo12okDGAOLEmojc4InKvNCfNS57NUWz2tHVonnXp
	pDfMsKh0ty/Pd/wetEjWR3q5qBnAW3MRAJZMs4CTbRk5BdgcDUxxo+vwzHVnami134PqE7
	IvKa836b5nH6P/nqpIaJjIUv4vAefk8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-oeyOPXEIOmy8veR3p6vGzg-1; Fri, 27 Jan 2023 18:06:07 -0500
X-MC-Unique: oeyOPXEIOmy8veR3p6vGzg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68C662802E32;
	Fri, 27 Jan 2023 23:06:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F59E492C14;
	Fri, 27 Jan 2023 23:06:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7C1F919465A3;
	Fri, 27 Jan 2023 23:06:04 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E4D72194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 23:06:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8F1832166B2A; Fri, 27 Jan 2023 23:06:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87DF82166B26
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 23:06:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67DDD85C1AE
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 23:06:02 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-19-H7z81aVzPYixz6w02eAkGQ-1; Fri, 27 Jan 2023 18:06:00 -0500
X-MC-Unique: H7z81aVzPYixz6w02eAkGQ-1
Received: by mail-pj1-f45.google.com with SMTP id 88so6001302pjo.3
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 15:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1SPNH/LuDCM3wOe70lK0cYgps5LwNXpnI8bzZ3//AbM=;
 b=XxI8vJs3tmfI3w1Kym9Ks+dcpY4okMW1K5RhcfzvbUkq+hUiDedKqHLpqdxwEeQNTR
 JSR6Mme5R9Di0SoDiqromAUKmJ5biXXpTkMaS4F1onMulk6jeYsL2vM9Ry7RpjQ0799p
 2mIBNLUKWHeP85/QV2wmiOaLTI5WQic5Zxk6ut1zEt0mOxxJohu9C78pqN9LqMMTaO3z
 VdgjrRl8jzp62r4DGCkrQtPW1vo79Bk8YmaqIG1XGgaWDQTKZQW5iW9qZffiz0mn21IS
 6+diibRRq65RfCk0bUFqpYbTeumgid3fdraGrZ8Cf89AzxfkaMfNExs/ioR1Yz5lpeyU
 3GlQ==
X-Gm-Message-State: AFqh2krE68GLnKkuO2zsH6SWkzJ+NPsl6wgB8VzIIZ+6pYaJr5XDF7ZD
 HBvbGFG4XfUCHmVhkSnLSELC4fEHpl4FzSq6tQQ9
X-Google-Smtp-Source: AMrXdXtoibC4sO4UJhtHedLXn5EFBmLz6kt4lH87+Hx2zFU5xSqW1t6YpxwqhFQuareAum3b2p5DvXjIZlBbat9W5SI=
X-Received: by 2002:a17:902:c404:b0:194:954c:fb8 with SMTP id
 k4-20020a170902c40400b00194954c0fb8mr4841408plk.20.1674860759548; Fri, 27 Jan
 2023 15:05:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674682056.git.rgb@redhat.com>
 <68eb0c2dd50bca1af91203669f7f1f8312331f38.1674682056.git.rgb@redhat.com>
 <CAHC9VhSZNGs+SQU7WCD+ObMcwv-=1ZkBts8oHn40qWsQ=n0pXA@mail.gmail.com>
 <Y9RWSZJt7NruCPZ+@madcap2.tricolour.ca>
In-Reply-To: <Y9RWSZJt7NruCPZ+@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 27 Jan 2023 18:05:48 -0500
Message-ID: <CAHC9VhS_xpiiiweR_mtKzNanDx_m9tkvhN5dy7FuQm-tuMK6iA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] io_uring,
 audit: audit IORING_OP_FADVISE but not IORING_OP_MADVISE
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 27, 2023 at 5:55 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2023-01-27 17:35, Paul Moore wrote:
> > On Fri, Jan 27, 2023 at 12:24 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > Since FADVISE can truncate files and MADVISE operates on memory, reverse
> > > the audit_skip tags.
> > >
> > > Fixes: 5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_uring")
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  io_uring/opdef.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/io_uring/opdef.c b/io_uring/opdef.c
> > > index 3aa0d65c50e3..a2bf53b4a38a 100644
> > > --- a/io_uring/opdef.c
> > > +++ b/io_uring/opdef.c
> > > @@ -306,12 +306,12 @@ const struct io_op_def io_op_defs[] = {
> > >         },
> > >         [IORING_OP_FADVISE] = {
> > >                 .needs_file             = 1,
> > > -               .audit_skip             = 1,
> > >                 .name                   = "FADVISE",
> > >                 .prep                   = io_fadvise_prep,
> > >                 .issue                  = io_fadvise,
> > >         },
> >
> > I've never used posix_fadvise() or the associated fadvise64*()
> > syscalls, but from quickly reading the manpages and the
> > generic_fadvise() function in the kernel I'm missing where the fadvise
> > family of functions could be used to truncate a file, can you show me
> > where this happens?  The closest I can see is the manipulation of the
> > page cache, but that shouldn't actually modify the file ... right?
>
> I don't know.  I was going on the advice of Steve Grubb.  I'm looking
> for feedback, validation, correction, here.

Keep in mind it's your name on the patch, not Steve's, and I would
hope that you should be able to stand up and vouch for your own patch.
Something to keep in mind for the future.

As it stands, I think the audit_skip line should stay for
IORING_OP_FADVISE, if you feel otherwise please provide more
explanation as to why auditing is necessary for this operation.

> > >         [IORING_OP_MADVISE] = {
> > > +               .audit_skip             = 1,
> > >                 .name                   = "MADVISE",
> > >                 .prep                   = io_madvise_prep,
> > >                 .issue                  = io_madvise,
> >
> > I *think* this should be okay, what testing/verification have you done
> > on this?  One of the things I like to check is to see if any LSMs
> > might perform an access check and/or generate an audit record on an
> > operation, if there is a case where that could happen we should setup
> > audit properly.  I did a very quick check of do_madvise() and nothing
> > jumped out at me, but I would be interested in knowing what testing or
> > verification you did here.
>
> No testing other than build/boot/audit-testsuite.  You had a test you
> had developed that went through several iterations?

There is an io_uring test in the audit-testsuite that verifies basic
audit record generation, it is not exhaustive.

Patch 2/2 is a no-go from a security perspective (we want to see those
records), and I think skipping on IORING_OP_FADVISE is the correct
thing to do.  It may be that skipping on IORING_OP_MADVISE is the
correct thing, but given that it doesn't appear a lot of in-depth
investigation has gone into these patches I would really like to see
some more reasoning on this before we change the current behavior.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


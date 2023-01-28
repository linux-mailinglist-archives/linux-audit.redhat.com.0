Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DDD67F9AB
	for <lists+linux-audit@lfdr.de>; Sat, 28 Jan 2023 17:50:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674924604;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ThpVgbu0rHwn/iAbNPq60XSgn83M1RFeRYkrTleoP+w=;
	b=R3tbtlRDym/nh9TusmVoIutREIA+LdMr8fKfqZPZ8/JGs4jDnXLWGflRF406bCBDPaep0W
	HFJMMA2ezhvHrP6fppZBQNiItr7YaD0em2CPsSTSpzNd2f1dAffQJz4RJ3/ItWmbvviyn5
	6ORZympUMOQqC0bEwz5jEIEabSNzIt8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-i8rU5HviMimnoMN6VyUV3g-1; Sat, 28 Jan 2023 11:49:00 -0500
X-MC-Unique: i8rU5HviMimnoMN6VyUV3g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 311518588E4;
	Sat, 28 Jan 2023 16:48:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14DE42026D4B;
	Sat, 28 Jan 2023 16:48:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A5C101946597;
	Sat, 28 Jan 2023 16:48:57 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DF0E71946587 for <linux-audit@listman.corp.redhat.com>;
 Sat, 28 Jan 2023 16:48:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CFAF814171C0; Sat, 28 Jan 2023 16:48:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.8.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C5D514171BE;
 Sat, 28 Jan 2023 16:48:56 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Jens Axboe <axboe@kernel.dk>, Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v1 1/2] io_uring,audit: audit IORING_OP_FADVISE but not
 IORING_OP_MADVISE
Date: Sat, 28 Jan 2023 11:48:55 -0500
Message-ID: <5911706.lOV4Wx5bFT@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhSfG6Oddk3qeFYiwkE5orRKs_PCLAD+F0yK-fRx27UTwg@mail.gmail.com>
References: <cover.1674682056.git.rgb@redhat.com>
 <6d3f76ae-9f86-a96e-d540-cfd45475e288@kernel.dk>
 <CAHC9VhSfG6Oddk3qeFYiwkE5orRKs_PCLAD+F0yK-fRx27UTwg@mail.gmail.com>
MIME-Version: 1.0
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
Cc: Christian Brauner <brauner@kernel.org>, Richard Guy Briggs <rgb@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Pavel Begunkov <asml.silence@gmail.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, January 27, 2023 5:57:30 PM EST Paul Moore wrote:
> On Fri, Jan 27, 2023 at 5:45 PM Jens Axboe <axboe@kernel.dk> wrote:
> > On 1/27/23 3:35?PM, Paul Moore wrote:
> > > On Fri, Jan 27, 2023 at 12:24 PM Richard Guy Briggs <rgb@redhat.com> 
wrote:
> > >> Since FADVISE can truncate files and MADVISE operates on memory,
> > >> reverse
> > >> the audit_skip tags.
> > >> 
> > >> Fixes: 5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit
> > >> support to io_uring") Signed-off-by: Richard Guy Briggs
> > >> <rgb@redhat.com>
> > >> ---
> > >> 
> > >>  io_uring/opdef.c | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >> 
> > >> diff --git a/io_uring/opdef.c b/io_uring/opdef.c
> > >> index 3aa0d65c50e3..a2bf53b4a38a 100644
> > >> --- a/io_uring/opdef.c
> > >> +++ b/io_uring/opdef.c
> > >> @@ -306,12 +306,12 @@ const struct io_op_def io_op_defs[] = {
> > >> 
> > >>         },
> > >>         [IORING_OP_FADVISE] = {
> > >>         
> > >>                 .needs_file             = 1,
> > >> 
> > >> -               .audit_skip             = 1,
> > >> 
> > >>                 .name                   = "FADVISE",
> > >>                 .prep                   = io_fadvise_prep,
> > >>                 .issue                  = io_fadvise,
> > >>         
> > >>         },
> > > 
> > > I've never used posix_fadvise() or the associated fadvise64*()
> > > syscalls, but from quickly reading the manpages and the
> > > generic_fadvise() function in the kernel I'm missing where the fadvise
> > > family of functions could be used to truncate a file, can you show me
> > > where this happens?  The closest I can see is the manipulation of the
> > > page cache, but that shouldn't actually modify the file ... right?
> > 
> > Yeah, honestly not sure where that came from. Maybe it's being mixed up
> > with fallocate?
> 
> That was my thought too when I was looking at it.

Oh. Yeah. fallocate is the one that truncates. fadvise can be skipped.

-Steve

> > All fadvise (or madvise, for that matter) does is
> > provide hints on the caching or access pattern. On second thought, both
> > of these should be able to set audit_skip as far as I can tell.
> 
> Agreed on the fadvise side, and probably the madvise side too,
> although the latter has more options/code to sift through so I'm
> curious to hear what analysis Richard has done on that one.




--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


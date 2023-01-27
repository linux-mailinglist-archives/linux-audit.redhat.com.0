Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B29B67F1EF
	for <lists+linux-audit@lfdr.de>; Sat, 28 Jan 2023 00:03:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674860598;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FmzriAvj04dIO/cEhDW5ipO1p3LepzDDt/u89U4epA0=;
	b=iJr53zQ2eSIswUyo+XMnKWToLxUBVCLzqgrrc/vKA7AJegzPmS52FUu3hCeELZFHZuFwQH
	SFaHsbDZe8NfaS/H7JzlpY185oZF62ay99uyIaoRoGeslzkphNguwVLPGxVtyFx8JGiNOw
	o/jxv9htEW3zhgFp0ePutnT3sM4vWKM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-oxrderN5OlOL7Y66-fK4PQ-1; Fri, 27 Jan 2023 18:03:17 -0500
X-MC-Unique: oxrderN5OlOL7Y66-fK4PQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A640181E3F0;
	Fri, 27 Jan 2023 23:03:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60B372166B26;
	Fri, 27 Jan 2023 23:03:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0EE6219465A3;
	Fri, 27 Jan 2023 23:03:14 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BD63C194658D for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 23:02:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F212E1121318; Fri, 27 Jan 2023 23:02:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70FA21121314;
 Fri, 27 Jan 2023 23:02:46 +0000 (UTC)
Date: Fri, 27 Jan 2023 18:02:44 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v1 1/2] io_uring,audit: audit IORING_OP_FADVISE but not
 IORING_OP_MADVISE
Message-ID: <Y9RYFHucRL5TrsDh@madcap2.tricolour.ca>
References: <cover.1674682056.git.rgb@redhat.com>
 <68eb0c2dd50bca1af91203669f7f1f8312331f38.1674682056.git.rgb@redhat.com>
 <CAHC9VhSZNGs+SQU7WCD+ObMcwv-=1ZkBts8oHn40qWsQ=n0pXA@mail.gmail.com>
 <6d3f76ae-9f86-a96e-d540-cfd45475e288@kernel.dk>
MIME-Version: 1.0
In-Reply-To: <6d3f76ae-9f86-a96e-d540-cfd45475e288@kernel.dk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
 Pavel Begunkov <asml.silence@gmail.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-01-27 15:45, Jens Axboe wrote:
> On 1/27/23 3:35?PM, Paul Moore wrote:
> > On Fri, Jan 27, 2023 at 12:24 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >>
> >> Since FADVISE can truncate files and MADVISE operates on memory, reverse
> >> the audit_skip tags.
> >>
> >> Fixes: 5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_uring")
> >> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> >> ---
> >>  io_uring/opdef.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/io_uring/opdef.c b/io_uring/opdef.c
> >> index 3aa0d65c50e3..a2bf53b4a38a 100644
> >> --- a/io_uring/opdef.c
> >> +++ b/io_uring/opdef.c
> >> @@ -306,12 +306,12 @@ const struct io_op_def io_op_defs[] = {
> >>         },
> >>         [IORING_OP_FADVISE] = {
> >>                 .needs_file             = 1,
> >> -               .audit_skip             = 1,
> >>                 .name                   = "FADVISE",
> >>                 .prep                   = io_fadvise_prep,
> >>                 .issue                  = io_fadvise,
> >>         },
> > 
> > I've never used posix_fadvise() or the associated fadvise64*()
> > syscalls, but from quickly reading the manpages and the
> > generic_fadvise() function in the kernel I'm missing where the fadvise
> > family of functions could be used to truncate a file, can you show me
> > where this happens?  The closest I can see is the manipulation of the
> > page cache, but that shouldn't actually modify the file ... right?
> 
> Yeah, honestly not sure where that came from. Maybe it's being mixed up
> with fallocate? All fadvise (or madvise, for that matter) does is
> provide hints on the caching or access pattern. On second thought, both
> of these should be able to set audit_skip as far as I can tell.

That was one suspicion I had.  If this is the case, I'd agree both could
be skipped.

> Jens Axboe

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


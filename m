Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A71C67F18E
	for <lists+linux-audit@lfdr.de>; Fri, 27 Jan 2023 23:57:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674860275;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yioa6Q0IIwXJhOEfi/TQVgq3UmND/u/jh44+F/yYt8w=;
	b=h4Ai5BA9DHcSjpd6ZnNOpkGLuvGmV+KEZ84WVo+wf6Ox9vjXtS5+nTDuwWeY3NWWhf3eV0
	xrXIE/VPGq6D8NlmDe13gYwMSXsVu/W40FJ3wTgCIbWicOzTuYfAeaGEdpvVyXmUTM1Q5w
	KdpWTiyiKwQjriiA0ZAKOoMjXNUg+SE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-KOV1QImxMm2jlGKdxS-gSg-1; Fri, 27 Jan 2023 17:57:49 -0500
X-MC-Unique: KOV1QImxMm2jlGKdxS-gSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28473802C15;
	Fri, 27 Jan 2023 22:57:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C654914171C1;
	Fri, 27 Jan 2023 22:57:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6E4E419465A3;
	Fri, 27 Jan 2023 22:57:46 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4604F194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 22:57:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 08838492B02; Fri, 27 Jan 2023 22:57:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01105492B01
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 22:57:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D81B63806703
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 22:57:44 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-411-fswO1KjrN1K82Fu2uytN9g-1; Fri, 27 Jan 2023 17:57:43 -0500
X-MC-Unique: fswO1KjrN1K82Fu2uytN9g-1
Received: by mail-pj1-f50.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso10076112pjj.1
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 14:57:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uB+yn62SNGaWhnX+fqEdSTvlJtnDndypAJXkN5qE33U=;
 b=lUtAqcXOiyHZP/Oul/yBahhoxQpAnBEcnAp0Anhw1QXYyoYzPUMHJ6jZvLPs10D9+K
 PyB0WeV6RJNsnM+fuKhx0JLn1mgYKizPNvXNLstJV3JcnlPtr0uergAWo4Z0hcx86gcP
 ZDlg6JgrM7uKkND+/7vuU9IjrDSl0H35WHYqd6/Pn5xT8gaEfofteunei3NSdZO4kszj
 uD4DKgfMoT9xUXKVCmVHynqqiEzrB8W4JodDOoXBjdqBJKCjAEGA6X0XjQP9MlTWaug7
 9kc9jAbukofniryaUg9LB1oQGjCyEqSeSB2M02CnMT8IzJbPBV37k38DBVNe/Lvmvv9V
 x3mg==
X-Gm-Message-State: AFqh2koZVktFvtXwX1k3qBkQza4+65ep+TfiyBnnHhyKCBHlH+7yavIy
 MgIYUNQyCbbuyb9B1WbbFD4CYMzNpgrwF4Gvt/lG
X-Google-Smtp-Source: AMrXdXvBKpJ1Zh1gYfC1P8Jx+VUDzIcL3XGdMGBkNJZMGwWSnIhw3xeRWsJ5AA7DB//+NWwRLAK8EKPx7NzFn5qakDM=
X-Received: by 2002:a17:90b:3903:b0:225:de08:b714 with SMTP id
 ob3-20020a17090b390300b00225de08b714mr5014603pjb.193.1674860261791; Fri, 27
 Jan 2023 14:57:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674682056.git.rgb@redhat.com>
 <68eb0c2dd50bca1af91203669f7f1f8312331f38.1674682056.git.rgb@redhat.com>
 <CAHC9VhSZNGs+SQU7WCD+ObMcwv-=1ZkBts8oHn40qWsQ=n0pXA@mail.gmail.com>
 <6d3f76ae-9f86-a96e-d540-cfd45475e288@kernel.dk>
In-Reply-To: <6d3f76ae-9f86-a96e-d540-cfd45475e288@kernel.dk>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 27 Jan 2023 17:57:30 -0500
Message-ID: <CAHC9VhSfG6Oddk3qeFYiwkE5orRKs_PCLAD+F0yK-fRx27UTwg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] io_uring,
 audit: audit IORING_OP_FADVISE but not IORING_OP_MADVISE
To: Jens Axboe <axboe@kernel.dk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 27, 2023 at 5:45 PM Jens Axboe <axboe@kernel.dk> wrote:
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
> with fallocate?

That was my thought too when I was looking at it.

> All fadvise (or madvise, for that matter) does is
> provide hints on the caching or access pattern. On second thought, both
> of these should be able to set audit_skip as far as I can tell.

Agreed on the fadvise side, and probably the madvise side too,
although the latter has more options/code to sift through so I'm
curious to hear what analysis Richard has done on that one.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


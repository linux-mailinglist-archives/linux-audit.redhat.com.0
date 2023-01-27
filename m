Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADEA67F132
	for <lists+linux-audit@lfdr.de>; Fri, 27 Jan 2023 23:36:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674858980;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KI3HWKmv/I5RU31DSCYUAKQA7+wbAfZ1O8whtJtFlHI=;
	b=Ge20YfVJxR7YMx3fkqbUNHUkGiHcaPMKZwBIfA1EBGDj8KT8RcKcCZ99+tW8Ke1vozIwM4
	lU2JpXY88Qjc/uVNiGdQcZkNbTYsdCMtEJbZDZCpGhDIeHPSlWP4qVhKegyzH3Zuoq8x2y
	psNtGa3lWmevaAWucpsRLj7uU4UZAy4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-OgXrRledPzWlrTre8klgEg-1; Fri, 27 Jan 2023 17:36:18 -0500
X-MC-Unique: OgXrRledPzWlrTre8klgEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD2031C05EBB;
	Fri, 27 Jan 2023 22:36:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 924482166B29;
	Fri, 27 Jan 2023 22:36:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A9AB319465A3;
	Fri, 27 Jan 2023 22:36:09 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6C711194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 22:36:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F29F92166B29; Fri, 27 Jan 2023 22:36:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC1AF2166B26
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 22:36:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCD36811E9C
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 22:36:07 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-219-ktJrDQhxNAeNnRqi1zQ2Og-1; Fri, 27 Jan 2023 17:36:05 -0500
X-MC-Unique: ktJrDQhxNAeNnRqi1zQ2Og-1
Received: by mail-pl1-f170.google.com with SMTP id g23so6370797plq.12
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 14:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hg9InPQN4tioHiMOdnKqvlrPm/hTugTIRh5hdEkItHk=;
 b=aK5E4tTNv1mO4VOd56UOkNO5RnrkXzVgitIPyttD52jucSXOKPM02ZukdblYjELbyS
 uXe1cM1Oj9OfWeM7oJcF5mNjyeI/OENoGXUzOh9WD99zxmkVe7u8WV9+eNbMuKE7SfYz
 eszoYYB4l+822tlOeluULa6rKcCqpOhjcXyWy9FX0NOWkHLH5Z7LNCLNZGjQbwgOLH5O
 rF0RUck4M7jLAhxcpnARIkKqj/xwUKz6zqjYhCarYp/tUEyWWAfTNS/Ie5uhh7da6M8N
 GVDcOH6YfbuL6D31eiTjHeyzKlPJuPd9pKHEUlxI0LIE9A0eb8GczeEYGtOFK4+GLhnu
 VHLw==
X-Gm-Message-State: AFqh2koM6T8MW4+YMLBFYdBXZ1U3bHtWBi/Yz1Ao8/pvvkHZNIagJN6q
 cC3U1HyqRw4rM7WGbCo1PFdG8ZvPxmDk7Z98ks+Q
X-Google-Smtp-Source: AMrXdXvzWbZmDFbaDAfHsJMk2b5d62SU6fcAEF0ZvE0if6bNDtDttm18NnlrjsNl8TDbMsKuTJp/ByVLd+bOX8i8ai4=
X-Received: by 2002:a17:90a:5b0c:b0:223:fa07:7bfb with SMTP id
 o12-20020a17090a5b0c00b00223fa077bfbmr5371755pji.38.1674858963877; Fri, 27
 Jan 2023 14:36:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674682056.git.rgb@redhat.com>
 <68eb0c2dd50bca1af91203669f7f1f8312331f38.1674682056.git.rgb@redhat.com>
In-Reply-To: <68eb0c2dd50bca1af91203669f7f1f8312331f38.1674682056.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 27 Jan 2023 17:35:52 -0500
Message-ID: <CAHC9VhSZNGs+SQU7WCD+ObMcwv-=1ZkBts8oHn40qWsQ=n0pXA@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 27, 2023 at 12:24 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Since FADVISE can truncate files and MADVISE operates on memory, reverse
> the audit_skip tags.
>
> Fixes: 5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_uring")
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  io_uring/opdef.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/io_uring/opdef.c b/io_uring/opdef.c
> index 3aa0d65c50e3..a2bf53b4a38a 100644
> --- a/io_uring/opdef.c
> +++ b/io_uring/opdef.c
> @@ -306,12 +306,12 @@ const struct io_op_def io_op_defs[] = {
>         },
>         [IORING_OP_FADVISE] = {
>                 .needs_file             = 1,
> -               .audit_skip             = 1,
>                 .name                   = "FADVISE",
>                 .prep                   = io_fadvise_prep,
>                 .issue                  = io_fadvise,
>         },

I've never used posix_fadvise() or the associated fadvise64*()
syscalls, but from quickly reading the manpages and the
generic_fadvise() function in the kernel I'm missing where the fadvise
family of functions could be used to truncate a file, can you show me
where this happens?  The closest I can see is the manipulation of the
page cache, but that shouldn't actually modify the file ... right?

>         [IORING_OP_MADVISE] = {
> +               .audit_skip             = 1,
>                 .name                   = "MADVISE",
>                 .prep                   = io_madvise_prep,
>                 .issue                  = io_madvise,

I *think* this should be okay, what testing/verification have you done
on this?  One of the things I like to check is to see if any LSMs
might perform an access check and/or generate an audit record on an
operation, if there is a case where that could happen we should setup
audit properly.  I did a very quick check of do_madvise() and nothing
jumped out at me, but I would be interested in knowing what testing or
verification you did here.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


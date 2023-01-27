Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAFD67F151
	for <lists+linux-audit@lfdr.de>; Fri, 27 Jan 2023 23:44:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674859443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FG9bU9HA9GG/FLNqtu2bytAQS/P0oeSr7AGokDeq5/U=;
	b=R2FRm1mdVTV9nxRP5A+IfwEvS1MbjNDN/boil3IcOeXT0PJQgDwWY3y4S8tgsij3DxXnEa
	azQEs5NToPFUNZFweNDJvDSbRuWVL89/ZKnho1SeiWIlrW8hYHd+GWc4v6is9e+H63ZWtP
	1DhRBSlZtY4dBbqM03Gh8OYomQietqg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-nl6gnE3_MB6A4Ge9mEoFzA-1; Fri, 27 Jan 2023 17:43:59 -0500
X-MC-Unique: nl6gnE3_MB6A4Ge9mEoFzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B69D529AA3B3;
	Fri, 27 Jan 2023 22:43:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3352040C2064;
	Fri, 27 Jan 2023 22:43:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9A42C19465A3;
	Fri, 27 Jan 2023 22:43:46 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 22E1A194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 22:43:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EEAC41121318; Fri, 27 Jan 2023 22:43:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E62781121315
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 22:43:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C77723C025C9
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 22:43:15 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-574-YnwpcSRQM322YYV4qJ4IcQ-1; Fri, 27 Jan 2023 17:43:14 -0500
X-MC-Unique: YnwpcSRQM322YYV4qJ4IcQ-1
Received: by mail-pj1-f45.google.com with SMTP id j5so5942424pjn.5
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 14:43:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WmZkqsaxGsxQVAXbyc3t7DBRwM/9VryKi+3Pr7qmZDM=;
 b=TCKK351AI5hiT5wQ1nNLlLHiobegHrl0R56r2i1GGKiKz4+mwmOkgEB+IqSOybyt96
 R2SEE296vv/bmokQ9Hv8J2iVo94kEaI4wwOX9J3sK1MSLLYB/P8IGkrmrZtjB+W1yaz8
 msrjgZIBOWXL6fy3W4o0tMR01HfVoAxBNKD0yk5qZC6PlENacvl5QqOjsq0e9JizQQNa
 /SsLQPBEiqZwmjPfEGgrD9agMU0XfgWDnakH35sXKDqzPS6/O3iz7+CHvI/p1PRDV+ds
 GxBLFBNdIly7ij7rSCLI95FsJdWhlV2rlQhQhzq71DJbnDCY3vO5pfn3E03RxPbZK+8V
 ahGw==
X-Gm-Message-State: AFqh2kqhWUf60jA/7eolmAHzneaKzj9Ubr7w2LLneCLkEZ/DB/dBCOmX
 dSC22b8uUYBa3rUcR32GND29eh4j2WFjsWW7/mNI
X-Google-Smtp-Source: AMrXdXustphmqNFUVCzyCLlM6K9y5ETwjauqRlKHwVZFt4XVnBeuiN5gqhYBOfGFydEDeSZxy4iglGTbZndDf10aDKs=
X-Received: by 2002:a17:90a:5b0c:b0:223:fa07:7bfb with SMTP id
 o12-20020a17090a5b0c00b00223fa077bfbmr5374291pji.38.1674859393131; Fri, 27
 Jan 2023 14:43:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674682056.git.rgb@redhat.com>
 <f602429ce0f419c2abc3ae5a0e705e1368ac5650.1674682056.git.rgb@redhat.com>
In-Reply-To: <f602429ce0f419c2abc3ae5a0e705e1368ac5650.1674682056.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 27 Jan 2023 17:43:02 -0500
Message-ID: <CAHC9VhQiy9vP7BdQk+SXG7gQKAqOAqbYtU+c9R0_ym0h4bgG7g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] io_uring,audit: do not log IORING_OP_*GETXATTR
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Pavel Begunkov <asml.silence@gmail.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 27, 2023 at 12:24 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Getting XATTRs is not particularly interesting security-wise.
>
> Suggested-by: Steve Grubb <sgrubb@redhat.com>
> Fixes: a56834e0fafe ("io_uring: add fgetxattr and getxattr support")
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  io_uring/opdef.c | 2 ++
>  1 file changed, 2 insertions(+)

Depending on your security policy, fetching file data, including
xattrs, can be interesting from a security perspective.  As an
example, look at the SELinux file/getattr permission.

https://github.com/SELinuxProject/selinux-notebook/blob/main/src/object_classes_permissions.md#common-file-permissions

> diff --git a/io_uring/opdef.c b/io_uring/opdef.c
> index a2bf53b4a38a..f6bfe2cf078c 100644
> --- a/io_uring/opdef.c
> +++ b/io_uring/opdef.c
> @@ -462,12 +462,14 @@ const struct io_op_def io_op_defs[] = {
>         },
>         [IORING_OP_FGETXATTR] = {
>                 .needs_file = 1,
> +               .audit_skip             = 1,
>                 .name                   = "FGETXATTR",
>                 .prep                   = io_fgetxattr_prep,
>                 .issue                  = io_fgetxattr,
>                 .cleanup                = io_xattr_cleanup,
>         },
>         [IORING_OP_GETXATTR] = {
> +               .audit_skip             = 1,
>                 .name                   = "GETXATTR",
>                 .prep                   = io_getxattr_prep,
>                 .issue                  = io_getxattr,
> --
> 2.27.0

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


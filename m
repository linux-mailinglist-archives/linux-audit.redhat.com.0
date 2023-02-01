Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C605687070
	for <lists+linux-audit@lfdr.de>; Wed,  1 Feb 2023 22:19:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675286387;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RxZSVuJHCdLtCk7DP93jlpL5FdvxilqYyQnIRT7RxVQ=;
	b=RVo5PLqlP8NuJ+03Gf8sHrTh08qGTlxrCFOYuTdKNS5wvFdnWbTt5n9DjW319RCUoH79xA
	hCGuvB2OMBlBKM1zL2y+BmnoKlOSo5q5U/tyQal1cQiq8q1yandaRwR9yiQZmC5HK9ndW1
	2FBkwpFQ7mqLKocy6JErZB5uzBHYMAY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-9eIlwgmDMFOIz9Y-dx5N5Q-1; Wed, 01 Feb 2023 16:19:44 -0500
X-MC-Unique: 9eIlwgmDMFOIz9Y-dx5N5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EB97100DEA2;
	Wed,  1 Feb 2023 21:19:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7175B2166B3A;
	Wed,  1 Feb 2023 21:19:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B4D2F19465B8;
	Wed,  1 Feb 2023 21:19:34 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 69130194658F for <linux-audit@listman.corp.redhat.com>;
 Wed,  1 Feb 2023 21:19:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 795C6404BEC0; Wed,  1 Feb 2023 21:19:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7194B404BEC4
 for <linux-audit@redhat.com>; Wed,  1 Feb 2023 21:19:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 328011064A65
 for <linux-audit@redhat.com>; Wed,  1 Feb 2023 21:19:09 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-21hRqydAOb-xxedkLQvsdw-1; Wed, 01 Feb 2023 16:19:02 -0500
X-MC-Unique: 21hRqydAOb-xxedkLQvsdw-1
Received: by mail-pf1-f174.google.com with SMTP id z3so13537620pfb.2
 for <linux-audit@redhat.com>; Wed, 01 Feb 2023 13:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F3Si1tu8Y5DMEWT7C6ejyq5oRsygCb4wYMBHPF2K2lA=;
 b=I6jaeSS7Wb/JcJcnIVXlYdXXwqZiJElHJiqPno8Y/h7eMWKtwoEmGkNnokpEMn9E2+
 sZ7OEeD7SwOzuxmbJcPWdo2uKPiiWTXPyv3JclCyT1sm+XLGokV2JUjRrldfM8Ge7ZVI
 lW8mTzYx5m+VaFBtf8h2NLwpVHIDAG7olS2Khpq38CbM9FCgU1nl1YmHUb+9MLxoxLTf
 LbBBXdVsk7v62stl+agOHCjXjR8ARONRxgZNhenrtVQlzdr4DZmSZmblDUDiAJykaD4e
 xPwoaFYC8ZaQqKkdP/Ik7Im3/wFzCsltdmqd1G0PHP6F/Rw1RnanrY3x1BXUxcKn+lR1
 3WDg==
X-Gm-Message-State: AO0yUKW/rfw3iIcGFnatpW3Prk2EW8ZpE3hjCMn84ek8CMUIMbxmch6W
 p9GI6YU3cWCvnoZKQcKguL1z49dw7/b1hiaSgy/n
X-Google-Smtp-Source: AK7set8KFiT3geprutCvgeL1UVJzcV0oWaLCKtVMWA4z7XEEhBP6lnqjZbY8983tNJa3ZMbsaFJBUBd95GbvabSseFU=
X-Received: by 2002:a05:6a00:bd1:b0:593:b491:40ba with SMTP id
 x17-20020a056a000bd100b00593b49140bamr914989pfu.7.1675286337234; Wed, 01 Feb
 2023 13:18:57 -0800 (PST)
MIME-Version: 1.0
References: <b5dfdcd541115c86dbc774aa9dd502c964849c5f.1675282642.git.rgb@redhat.com>
In-Reply-To: <b5dfdcd541115c86dbc774aa9dd502c964849c5f.1675282642.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 1 Feb 2023 16:18:46 -0500
Message-ID: <CAHC9VhS0rPfkwUT1WMfqsTF-qYXdbbhHAfVPs=d3ZQVgbXBHnw@mail.gmail.com>
Subject: Re: [PATCH v2] io_uring,audit: don't log IORING_OP_MADVISE
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 1, 2023 at 3:34 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> fadvise and madvise both provide hints for caching or access pattern for
> file and memory respectively.  Skip them.

You forgot to update the first sentence in the commit description :/

I'm still looking for some type of statement that you've done some
homework on the IORING_OP_MADVISE case to ensure that it doesn't end
up calling into the LSM, see my previous emails on this.  I need more
than "Steve told me to do this".

I basically just want to see that some care and thought has gone into
this patch to verify it is correct and good.

> Fixes: 5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_uring")
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> changelog
> v2:
> - drop *GETXATTR patch
> - drop FADVISE hunk
>
>  io_uring/opdef.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/io_uring/opdef.c b/io_uring/opdef.c
> index 3aa0d65c50e3..d3f36c633ceb 100644
> --- a/io_uring/opdef.c
> +++ b/io_uring/opdef.c
> @@ -312,6 +312,7 @@ const struct io_op_def io_op_defs[] = {
>                 .issue                  = io_fadvise,
>         },
>         [IORING_OP_MADVISE] = {
> +               .audit_skip             = 1,
>                 .name                   = "MADVISE",
>                 .prep                   = io_madvise_prep,
>                 .issue                  = io_madvise,
> --
> 2.27.0

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


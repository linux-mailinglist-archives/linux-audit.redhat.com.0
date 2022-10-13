Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CD65FE5D0
	for <lists+linux-audit@lfdr.de>; Fri, 14 Oct 2022 01:12:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665702752;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8o4zE/b4TwCfLh3+UdQhQyXkGINHxxfAgI9MnxJZG1U=;
	b=LEhbRGvGKfCjsycoSm6XnxSxPMBZq/29iBI0GNfuzDBJDeR+hLyavEPSUXOfe/9nKsZohg
	CD8MwSWh6TYHk5kOhqUyU1coV7lLXBG7RGHiuELWgHBUyMnFS6WaE/x5FQ9vToUHBkaBdS
	j0cn7zkHrOd7R2AA/6gzCW/+bhuKZ4s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-4y0LPX8qPDKsVO8H3t7FMw-1; Thu, 13 Oct 2022 19:12:31 -0400
X-MC-Unique: 4y0LPX8qPDKsVO8H3t7FMw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ED33811E81;
	Thu, 13 Oct 2022 23:12:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B95AA1111C60;
	Thu, 13 Oct 2022 23:12:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E742119465A2;
	Thu, 13 Oct 2022 23:12:11 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C3F151946587 for <linux-audit@listman.corp.redhat.com>;
 Thu, 13 Oct 2022 23:12:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 39D8D145BA58; Thu, 13 Oct 2022 23:12:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31CD1145BA4E
 for <linux-audit@redhat.com>; Thu, 13 Oct 2022 23:12:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23C14858F17
 for <linux-audit@redhat.com>; Thu, 13 Oct 2022 23:12:09 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-202-zqcME9KKOZOx0Zuh8ViGwA-1; Thu, 13 Oct 2022 19:12:02 -0400
X-MC-Unique: zqcME9KKOZOx0Zuh8ViGwA-1
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-358bf076f1fso31303547b3.9
 for <linux-audit@redhat.com>; Thu, 13 Oct 2022 16:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oRapBg1ifNHo1rNSZIfOYVmhwzlN9nPaATTK2xd999E=;
 b=enG4SJcGFZKhYx3w8RyMAobtQ91g7uxJP7i/jS+N+KUaebfKMEb3vua+o0UmDts2jR
 L3N14PcxYcZMQoeiceD6PfNFwvV0pUgBvQ7oNRbzDqzCgGjHeW+ry7BBsdVUGNLzMkrc
 7hGqu6p7OZ4RcyM7F0wqxNAiMxEfgf079+HItH/Ecxha8h75IobjLnsfWLYEPwZMsZnX
 xbkGJ1XSR/FxBhb0Z3ao9VQsplcgfMSeDMv9mNSPSEbhJN3N7ayHFSYxDnvzG3Hdvr0E
 qA8fIiV1i4lR274e/ywQPJFmQsNsEHD+O6VFnfq5f+vRBi5ReQTKQYChcQIbKPLyAwYf
 wNDw==
X-Gm-Message-State: ACrzQf0HwrkkBEVb/G83oyc6Gu95krEtCPIsm+tg71HnvV/pgCHhBhg1
 hX326NNzT+N1VaR+DKmfrsHuvsYSTUdhYthFo/A3
X-Google-Smtp-Source: AMsMyM6F9MFNMVgJrPw5tCXRJlu6M5uRf+UE0Zr7N7ecstochrV906GL/9PRGmPakJxlfhI6ugY+Kq4lEPffEwGxmXg=
X-Received: by 2002:a81:4e97:0:b0:358:3053:f3cd with SMTP id
 c145-20020a814e97000000b003583053f3cdmr2149129ywb.482.1665702721581; Thu, 13
 Oct 2022 16:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220927225944.2254360-4-ankur.a.arora@oracle.com>
 <20221007004943.2910736-1-ankur.a.arora@oracle.com>
In-Reply-To: <20221007004943.2910736-1-ankur.a.arora@oracle.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 13 Oct 2022 19:11:50 -0400
Message-ID: <CAHC9VhSnWZ1ovEeajasBPQA0-_AgNW21K2Ycpc3wvSHw5uQZ9Q@mail.gmail.com>
Subject: Re: [PATCH v2] audit: unify audit_filter_{uring(), inode_name(),
 syscall()}
To: Ankur Arora <ankur.a.arora@oracle.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
Cc: konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, eparis@redhat.com,
 linux-audit@redhat.com, boris.ostrovsky@oracle.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 6, 2022 at 8:49 PM Ankur Arora <ankur.a.arora@oracle.com> wrote:
>
> audit_filter_uring(), audit_filter_inode_name() are substantially
> similar to audit_filter_syscall(). Move the core logic to
> __audit_filter_op() which can be parametrized for all three.
>
> On a Skylakex system, getpid() latency (all results aggregated
> across 12 boot cycles):
>
>          Min     Mean    Median   Max      pstdev
>          (ns)    (ns)    (ns)     (ns)
>
>  -    196.63   207.86  206.60  230.98      (+- 3.92%)
>  +    183.73   196.95  192.31  232.49      (+- 6.04%)
>
> Performance counter stats for 'bin/getpid' (3 runs) go from:
>     cycles               805.58  (  +-  4.11% )
>     instructions        1654.11  (  +-   .05% )
>     IPC                    2.06  (  +-  3.39% )
>     branches             430.02  (  +-   .05% )
>     branch-misses          1.55  (  +-  7.09% )
>     L1-dcache-loads      440.01  (  +-   .09% )
>     L1-dcache-load-misses  9.05  (  +- 74.03% )
> to:
>     cycles               765.37  (  +-  6.66% )
>     instructions        1677.07  (  +-  0.04% )
>     IPC                    2.20  (  +-  5.90% )
>     branches             431.10  (  +-  0.04% )
>     branch-misses          1.60  (  +- 11.25% )
>     L1-dcache-loads      521.04  (  +-  0.05% )
>     L1-dcache-load-misses  6.92  (  +- 77.60% )
>
> (Both aggregated over 12 boot cycles.)
>
> The increased L1-dcache-loads are due to some intermediate values now
> coming from the stack.
>
> The improvement in cycles is due to a slightly denser loop (the list
> parameter in the list_for_each_entry_rcu() exit check now comes from
> a register rather than a constant as before.)
>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
>  kernel/auditsc.c | 76 +++++++++++++++++++++++++-----------------------
>  1 file changed, 39 insertions(+), 37 deletions(-)

Thanks, this looks good to me.  I'll queue this up for when the merge
window closes.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


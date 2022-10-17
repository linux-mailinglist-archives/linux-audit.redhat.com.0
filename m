Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BDD601637
	for <lists+linux-audit@lfdr.de>; Mon, 17 Oct 2022 20:26:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666031184;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J8h9jYhrgAVGxH7B26Nehva9ZwBGs1os8CLQWGeD6h0=;
	b=F0GJKYhCd2N4Yz8yf3F3XGOtWygxfHWzyz9VYzj+1eq1/sICdpCTRSKIvva8p1bGlmBI3m
	O4CCfk5STuG/BzQNMxArUYrE0rYz1Ng0IJnCDUt0VAak1j90LUa73IOOeqnp/StW5JrpWL
	FnBFJe95HKing4t1mggQTzGHc6596Qc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-mG6YmUFfOlaLVdOv9cPQCw-1; Mon, 17 Oct 2022 14:26:21 -0400
X-MC-Unique: mG6YmUFfOlaLVdOv9cPQCw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F30E88B7A7;
	Mon, 17 Oct 2022 18:26:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 249C749AFD;
	Mon, 17 Oct 2022 18:26:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BADE419465A3;
	Mon, 17 Oct 2022 18:26:18 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9DA71194658F for <linux-audit@listman.corp.redhat.com>;
 Mon, 17 Oct 2022 18:26:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 80F001121315; Mon, 17 Oct 2022 18:26:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79C1B1121314
 for <linux-audit@redhat.com>; Mon, 17 Oct 2022 18:26:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B13D38173CD
 for <linux-audit@redhat.com>; Mon, 17 Oct 2022 18:26:17 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-49-Q0toYmR4OxG7CLyIsjt_5w-1; Mon, 17 Oct 2022 14:26:15 -0400
X-MC-Unique: Q0toYmR4OxG7CLyIsjt_5w-1
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-333a4a5d495so115647547b3.10
 for <linux-audit@redhat.com>; Mon, 17 Oct 2022 11:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5U1OyyooDcBLibqlBc/BrkxXaQuYm21e5GaBzzXBOAE=;
 b=V+eMkLancBfdaK8g5tIs7Ifj+5E8yHN377tVd/5Cuhg6oyJTlZvt9VpBCan6spFpma
 /CnORYrf3obo1EOhkGY4fG0sdyNqy1n2fNq+S0+wEaeL+hzLtx8XjFFAAILluRyWvalB
 tjC2C//K31nGDShu3L+84f1TBpEbDk2eVct3uss1su60eJDkDfNFMF8jVS4nmKsR0hjL
 v3BbjEhaWycohrWrjhVX7XQ7Ce12btHsC0m6pNXxpQ8gNBnInx+CK3xDaaweQh8zHAE9
 sl7f4T2RuyxD2RRBCki60U1bqyngmxnb9WmA3bUeFRKJViIHNMO0V9h9/p9B1mwUO3Ay
 O5OQ==
X-Gm-Message-State: ACrzQf3SMgWxopxCRXtTxXqFeejfTbu8vHWfMlay4ah+FcsfpC3HEVDM
 RC8bOh5FFFz9LtZjJGloAqLK6+DdlZBPDNZZ9yuz
X-Google-Smtp-Source: AMsMyM53sbm2ZVhZE5BhtALEppiY3ukUEoy4iOiE0oRNTFzlvPg60lej8JBWylEJRiwRvPqgxc6Ycn/DtzQRaYlIeQ8=
X-Received: by 2002:a81:a141:0:b0:35f:a727:f27 with SMTP id
 y62-20020a81a141000000b0035fa7270f27mr10634101ywg.205.1666031175121; Mon, 17
 Oct 2022 11:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220927225944.2254360-4-ankur.a.arora@oracle.com>
 <20221007004943.2910736-1-ankur.a.arora@oracle.com>
 <CAHC9VhSnWZ1ovEeajasBPQA0-_AgNW21K2Ycpc3wvSHw5uQZ9Q@mail.gmail.com>
In-Reply-To: <CAHC9VhSnWZ1ovEeajasBPQA0-_AgNW21K2Ycpc3wvSHw5uQZ9Q@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 17 Oct 2022 14:26:04 -0400
Message-ID: <CAHC9VhR3Zv7tBhoeyK3b0Rh=KPBaorHjVAJ4uF6MJqitoQB9XQ@mail.gmail.com>
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
Cc: konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, eparis@redhat.com,
 linux-audit@redhat.com, boris.ostrovsky@oracle.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 13, 2022 at 7:11 PM Paul Moore <paul@paul-moore.com> wrote:
> On Thu, Oct 6, 2022 at 8:49 PM Ankur Arora <ankur.a.arora@oracle.com> wrote:
> >
> > audit_filter_uring(), audit_filter_inode_name() are substantially
> > similar to audit_filter_syscall(). Move the core logic to
> > __audit_filter_op() which can be parametrized for all three.
> >
> > On a Skylakex system, getpid() latency (all results aggregated
> > across 12 boot cycles):
> >
> >          Min     Mean    Median   Max      pstdev
> >          (ns)    (ns)    (ns)     (ns)
> >
> >  -    196.63   207.86  206.60  230.98      (+- 3.92%)
> >  +    183.73   196.95  192.31  232.49      (+- 6.04%)
> >
> > Performance counter stats for 'bin/getpid' (3 runs) go from:
> >     cycles               805.58  (  +-  4.11% )
> >     instructions        1654.11  (  +-   .05% )
> >     IPC                    2.06  (  +-  3.39% )
> >     branches             430.02  (  +-   .05% )
> >     branch-misses          1.55  (  +-  7.09% )
> >     L1-dcache-loads      440.01  (  +-   .09% )
> >     L1-dcache-load-misses  9.05  (  +- 74.03% )
> > to:
> >     cycles               765.37  (  +-  6.66% )
> >     instructions        1677.07  (  +-  0.04% )
> >     IPC                    2.20  (  +-  5.90% )
> >     branches             431.10  (  +-  0.04% )
> >     branch-misses          1.60  (  +- 11.25% )
> >     L1-dcache-loads      521.04  (  +-  0.05% )
> >     L1-dcache-load-misses  6.92  (  +- 77.60% )
> >
> > (Both aggregated over 12 boot cycles.)
> >
> > The increased L1-dcache-loads are due to some intermediate values now
> > coming from the stack.
> >
> > The improvement in cycles is due to a slightly denser loop (the list
> > parameter in the list_for_each_entry_rcu() exit check now comes from
> > a register rather than a constant as before.)
> >
> > Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> > ---
> >  kernel/auditsc.c | 76 +++++++++++++++++++++++++-----------------------
> >  1 file changed, 39 insertions(+), 37 deletions(-)
>
> Thanks, this looks good to me.  I'll queue this up for when the merge
> window closes.

This is also merged into audit/next, thanks!

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


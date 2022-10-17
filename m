Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF55601633
	for <lists+linux-audit@lfdr.de>; Mon, 17 Oct 2022 20:24:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666031062;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1boa5jCB1H9P+3RuNULQqO3xHNCTcOkoGTGxGs4YKe4=;
	b=WeFkVIQgXpuvW5Lk0HqhlRoQDi632R1sT9y1/oISgTsc3Q1pqwLPwKDz667JIHUJSjxc8l
	b9LRK1R7kfI32xWBeWbjbqRnP428TuC35SRhp2Zzsu0ccGhHMlQYMd6TSqVGwFlEcr5Ojp
	SrLTwoA41ZNH1NyHNDGfP/Di/7iR0uo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-LN8p_lN6NEKKwsAcbCVkSg-1; Mon, 17 Oct 2022 14:24:21 -0400
X-MC-Unique: LN8p_lN6NEKKwsAcbCVkSg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C28D31010361;
	Mon, 17 Oct 2022 18:24:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5865492B04;
	Mon, 17 Oct 2022 18:24:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6D9DA19465A3;
	Mon, 17 Oct 2022 18:24:08 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CCBB8194658F for <linux-audit@listman.corp.redhat.com>;
 Mon, 17 Oct 2022 18:24:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 965F31468223; Mon, 17 Oct 2022 18:24:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E0E11468210
 for <linux-audit@redhat.com>; Mon, 17 Oct 2022 18:24:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73E8B82DFD8
 for <linux-audit@redhat.com>; Mon, 17 Oct 2022 18:24:07 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-650-e0zl0D3fOWu1JgA-HRO9AQ-1; Mon, 17 Oct 2022 14:24:06 -0400
X-MC-Unique: e0zl0D3fOWu1JgA-HRO9AQ-1
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-3560e81aa1dso115661887b3.2
 for <linux-audit@redhat.com>; Mon, 17 Oct 2022 11:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JkUI5JssnCLk+wBNiz00ckkGRif8NZmGGTgkXS2hWkQ=;
 b=0Nz5+SwyegMNjnYpjdK6m3N6oftuwBpzsY6HyAATFcehb7l2K8fg/QkmYufWwMtSYP
 ophH0BlySuEVgHiCmAei+8rcd07g/HK54bHM3fLiBiNnWoQBUf7ISsTp4CcPqYE668/Y
 nqc+Sdbo52N74yY2L6+Ar4DjuuTY4N2q0f3FVCyRMWmpMVyreKX6hFQP9VTbCHV+Fm2k
 Vl1Rp0qDO/nBQ3hNbUT5E2y3pFS8c1M2Zf9p85yYe7VzU1Z2GfekVDQWNid8FZFw7ZOP
 rF7k+nNgLX+FEWfxvRIw6hxzYaW/D9FO62R4WEaz4ii3rdNY65xQ8AUbK8xvKSlGlhjr
 PNFw==
X-Gm-Message-State: ACrzQf0TxqLdkQhpd+Dp6Y0GNvpfcjsxAEKRmXQjda4xrx4JDnWSLztu
 7k0TPwXizLrOja9LAwV6wc0f/x8Vc2UsIkbgN17j
X-Google-Smtp-Source: AMsMyM4fhE0gIaR2IZvhXus6XhO+02VAVMEO7i7RT2XMKKg1YosP0uGFCSiMSTY8dDG9aX9RimKMVmqCwT2wbrHSSGE=
X-Received: by 2002:a0d:ebc1:0:b0:360:5a77:4d78 with SMTP id
 u184-20020a0debc1000000b003605a774d78mr10235224ywe.336.1666031045245; Mon, 17
 Oct 2022 11:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220927225944.2254360-1-ankur.a.arora@oracle.com>
 <20220927225944.2254360-2-ankur.a.arora@oracle.com>
 <CAHC9VhRZzU5-+65AFOK826rA0xo-nbgRK_pP05Q_zjvAQvLnRw@mail.gmail.com>
In-Reply-To: <CAHC9VhRZzU5-+65AFOK826rA0xo-nbgRK_pP05Q_zjvAQvLnRw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 17 Oct 2022 14:23:54 -0400
Message-ID: <CAHC9VhSf-HxoakRE3EU7VMpp7=6X=dvO+bRVnq0gg-mfrn5utA@mail.gmail.com>
Subject: Re: [PATCH 1/3] audit: cache ctx->major in audit_filter_syscall()
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
Cc: boris.ostrovsky@oracle.com, linux-audit@redhat.com,
 linux-kernel@vger.kernel.org, eparis@redhat.com, konrad.wilk@oracle.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 28, 2022 at 6:03 PM Paul Moore <paul@paul-moore.com> wrote:
> On Tue, Sep 27, 2022 at 6:59 PM Ankur Arora <ankur.a.arora@oracle.com> wrote:
> >
> > ctx->major contains the current syscall number. This is, of course, a
> > constant for the duration of the syscall. Unfortunately, GCC's alias
> > analysis cannot prove that it is not modified via a pointer in the
> > audit_filter_syscall() loop, and so always loads it from memory.
> >
> > ...
> >
> > Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> > ---
> >  kernel/auditsc.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> This looks pretty trivial to me, but it's too late in the current -rc
> cycle for this to be merged, I'll queue it up for after the upcoming
> merge window closes.  Thanks.

I just merged this into audit/next, thanks again!

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8A265F487
	for <lists+linux-audit@lfdr.de>; Thu,  5 Jan 2023 20:32:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672947178;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iWf3zNjpJAU5ZS9TCu3JhhBd4dU8plx0EirbCBIMcjM=;
	b=T5/fcPrxoXC2Kxf6JMu804Tml8V4+IKRGYnxK+ujf2NT5NaF6Fk7R0HnmzMrw1FKAWdqDn
	3B3WFZhUJBgf/It/4ueHFUsSvsH1VGk0KjZL01ikiVOOjvWW5FubJrwWPMItYZEcGM1Q2J
	aHB9pMNhMCqrpKW8P/4s72S6PCNzz8Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-6bKdv7aRPXi1hVny6hRfyg-1; Thu, 05 Jan 2023 14:32:54 -0500
X-MC-Unique: 6bKdv7aRPXi1hVny6hRfyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5411E1871D94;
	Thu,  5 Jan 2023 19:32:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D6DA01415303;
	Thu,  5 Jan 2023 19:32:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 282DA19465A3;
	Thu,  5 Jan 2023 19:32:47 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 61BD81946589 for <linux-audit@listman.corp.redhat.com>;
 Thu,  5 Jan 2023 19:32:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2329D1121315; Thu,  5 Jan 2023 19:32:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B6DB1121314
 for <linux-audit@redhat.com>; Thu,  5 Jan 2023 19:32:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDDD938149BF
 for <linux-audit@redhat.com>; Thu,  5 Jan 2023 19:32:45 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-222-YwciFQOpNzGat6fHrI2QFg-1; Thu, 05 Jan 2023 14:32:44 -0500
X-MC-Unique: YwciFQOpNzGat6fHrI2QFg-1
Received: by mail-pj1-f43.google.com with SMTP id
 c8-20020a17090a4d0800b00225c3614161so2967286pjg.5
 for <linux-audit@redhat.com>; Thu, 05 Jan 2023 11:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hgT6KL2iqc+bu88VGjNL1CZrnHCUz0OGQyldHxlczow=;
 b=XT2hlLQ1M/thQsKqknJyNPbiLbBKoS2xvDUA8cvkZGe3iOEovYqkKX/jaIe/Zy+i5E
 Et6mW4owMjfKLgJVoePupnKs7v8wCQnIHJaioNhc+ONulRw3nTR9jJtacQuXB4vXuJOP
 QnR5ae2QfHFQSU+g/REbQftbpyhnHpjIhFkgHDyEurOwksmsVZaM0KdrK7xnavii0h30
 BxUA4okZosDmy2+NaaLoESkFA50+ey863RXxWHUBk2uHWPvJ/p8MF5OAwERn+kDZF9Eu
 UOl+8PQimZYPnD466b+dji5VX/+KxmIh8sEDw+gVUhlcy8SckomtWg4Gx7QVHN1oMYGG
 qK7A==
X-Gm-Message-State: AFqh2kqL0eeFuJLrrL6F1dsqf3+dlyMqAl6B+Yu3q3D7KL1YHDk4H97r
 bzWv4LxlB+u5Z7YpPZqBtZnsf0GS7xAyWJzkC6m5Xzw98FhA
X-Google-Smtp-Source: AMrXdXvRWkMGKCGtRpx/KMCcvvymtZbEmf1iXITkszpgpvsJFO2OTwNgd41uCvMfO+ZLYNVcTwKTekxXWp/ttwUGHB8=
X-Received: by 2002:a17:902:968a:b0:192:7a00:c790 with SMTP id
 n10-20020a170902968a00b001927a00c790mr2733681plp.12.1672947162952; Thu, 05
 Jan 2023 11:32:42 -0800 (PST)
MIME-Version: 1.0
References: <CACKMdf=43CJmauoVnyzemsGtJoR5g=yDUUojJ3P1qsbKrrNMXQ@mail.gmail.com>
 <CAHC9VhQ10FeuFYqhC31YCmU9BB67go3RoMOsYn+SWA5TsWKy9w@mail.gmail.com>
 <5654293.DvuYhMxLoT@x2>
In-Reply-To: <5654293.DvuYhMxLoT@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Jan 2023 14:32:31 -0500
Message-ID: <CAHC9VhTdznAV=ZbUbJM5EPs7_VVAL2KU1i7T=mQaUiq+TiL1=g@mail.gmail.com>
Subject: Re: New bug in Audit
To: Steve Grubb <sgrubb@redhat.com>
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
Cc: linux-audit@redhat.com, Ariel Silver <arielsilver77@gmail.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 5, 2023 at 11:32 AM Steve Grubb <sgrubb@redhat.com> wrote:
> On Thursday, January 5, 2023 10:41:49 AM EST Paul Moore wrote:
> > On Thu, Jan 5, 2023 at 8:38 AM Ariel Silver <arielsilver77@gmail.com>
> wrote:
> > > I found the following bug:
> > >
> > > OS version = Red Hat Enterprise Linux release 8.6 (Ootpa)
> > > Kernel version = 4.18.0-425.3.1.el8.x86_64
> > > auditctl version = 3.0.7
> >
> > This mailing list is focused on the development and support of
> > upstream Linux Kernels and Steve's audit userspace, we don't really
> > provide support for paid distributions.  If you are seeing problems
> > with the upstream Linux Kernel or tools, please report them here, but
> > issues with distribution kernels and/or tools should be sent to the
> > distribution for support/assistance.
>
> Paul, we take bug reports and help requests from anyone. Often, distributions
> are how we first hear of problems.

Steve, re-read what I wrote.

This mailing list is *focused* on upstream work and support, and while
it does not preclude talking about distro specific bugs, I believe
there are better avenues for those discussions (e.g. see the RHBZ link
I provided in my response) as upstream isn't really going to be able
to provide adequate help for someone experiencing problems with a
distro kernel which has a number of patches and backports.

If you have a problem with this approach, perhaps we should move
upstream development to an audit mailing list on vger.kernel.org and
leave this list for RH specific issues?

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF47660853
	for <lists+linux-audit@lfdr.de>; Fri,  6 Jan 2023 21:33:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673037220;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SVj6704eCOXr5DLyklL4Up7sEjbEfMf3xSdDQhS0afs=;
	b=ZhSfAFQ9kWmYvFeTrE4lMyY93QuQq0SjI2CLB6YyCtSXtS9lZPHIsBWQh5+1mEtUIPbLUz
	R1oB9UMCuyQd1wAVmlXb9RoEdLr/F39k1Im4UHR4chZ+u1tply3wV51AF7Tg/+cHLuFbIK
	ohKXw8076PRZ1PAj+ZK5uDXXUlEynsE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-QbAuSWmrOu6-uRVEYOE_4A-1; Fri, 06 Jan 2023 15:33:39 -0500
X-MC-Unique: QbAuSWmrOu6-uRVEYOE_4A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB49518E5340;
	Fri,  6 Jan 2023 20:33:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 205B9492C1B;
	Fri,  6 Jan 2023 20:33:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8805B19459CC;
	Fri,  6 Jan 2023 20:33:33 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9FEC21946586 for <linux-audit@listman.corp.redhat.com>;
 Fri,  6 Jan 2023 20:33:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 711967AE5; Fri,  6 Jan 2023 20:33:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68E8651FF
 for <linux-audit@redhat.com>; Fri,  6 Jan 2023 20:33:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 472B51C05158
 for <linux-audit@redhat.com>; Fri,  6 Jan 2023 20:33:32 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-459-aWoD6keRNfuu9cElfFL03w-1; Fri, 06 Jan 2023 15:33:30 -0500
X-MC-Unique: aWoD6keRNfuu9cElfFL03w-1
Received: by mail-pf1-f178.google.com with SMTP id y5so1917735pfe.2
 for <linux-audit@redhat.com>; Fri, 06 Jan 2023 12:33:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UdHj6gRiMr5Jdk6roXJwROPW2Mr6qXz3USkqhrYW4bU=;
 b=ITyjSU9EBqTa/Rrmm7Ew+7eUGmJpw+ZUqTkDg+sIN5Y19zLqjoLYoXTmXa16EKfYh5
 j2u0TOk97hJ3r96llZcUqXVgf3OSXGer2PIgnDfF/g5HzAQLEij9C7i3ejMz1fnLYN5G
 Qd9Qn3l9CEIlnTR/xQz0EQBkR0TyOj1pri65f7FTJ3+FytjyiF/wVhJIApiisKZXZ2xy
 SwPp8cW3pML0mMNIUFbgUxmq6LlgygAna5jHNrqmJhXJHgOTWSszwRKzJjSGpvBZEyyf
 JvZkR1GbwxsepDLgOjiNL+3AhokGu8+IjlmoF5lL36ZihA3UD7i39SnMfc8w3+wVXRyz
 Pyjg==
X-Gm-Message-State: AFqh2kpYFJ5Z37TtmsS3rugmtIld/LoAxCEmvykPtGHiIvvmfYOT8DkQ
 dlLUBUcOnMX1ppFRQ8Q06T7D+mDQTg0cVM/vdzFo
X-Google-Smtp-Source: AMrXdXsBOG6gsywhZ+ABL5ji2WcBXMiqcnPGJe9OyPXtqoXuomJaHZ6As6ALlBdBHcto+irRpnd3IoMdUqk2F4iCn9M=
X-Received: by 2002:a63:db51:0:b0:477:96e2:9065 with SMTP id
 x17-20020a63db51000000b0047796e29065mr3292449pgi.533.1673037209397; Fri, 06
 Jan 2023 12:33:29 -0800 (PST)
MIME-Version: 1.0
References: <CACKMdf=43CJmauoVnyzemsGtJoR5g=yDUUojJ3P1qsbKrrNMXQ@mail.gmail.com>
 <CAHC9VhQ10FeuFYqhC31YCmU9BB67go3RoMOsYn+SWA5TsWKy9w@mail.gmail.com>
 <5654293.DvuYhMxLoT@x2>
 <CAHC9VhTdznAV=ZbUbJM5EPs7_VVAL2KU1i7T=mQaUiq+TiL1=g@mail.gmail.com>
In-Reply-To: <CAHC9VhTdznAV=ZbUbJM5EPs7_VVAL2KU1i7T=mQaUiq+TiL1=g@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Jan 2023 15:33:18 -0500
Message-ID: <CAHC9VhQH28r_fOCaW+=_65M2SBNpVnQqcvxKt28Zc1+YEqwjBQ@mail.gmail.com>
Subject: Re: New bug in Audit
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 5, 2023 at 2:32 PM Paul Moore <paul@paul-moore.com> wrote:
> On Thu, Jan 5, 2023 at 11:32 AM Steve Grubb <sgrubb@redhat.com> wrote:
> > On Thursday, January 5, 2023 10:41:49 AM EST Paul Moore wrote:
> > > On Thu, Jan 5, 2023 at 8:38 AM Ariel Silver <arielsilver77@gmail.com>
> > wrote:
> > > > I found the following bug:
> > > >
> > > > OS version = Red Hat Enterprise Linux release 8.6 (Ootpa)
> > > > Kernel version = 4.18.0-425.3.1.el8.x86_64
> > > > auditctl version = 3.0.7
> > >
> > > This mailing list is focused on the development and support of
> > > upstream Linux Kernels and Steve's audit userspace, we don't really
> > > provide support for paid distributions.  If you are seeing problems
> > > with the upstream Linux Kernel or tools, please report them here, but
> > > issues with distribution kernels and/or tools should be sent to the
> > > distribution for support/assistance.
> >
> > Paul, we take bug reports and help requests from anyone. Often, distributions
> > are how we first hear of problems.
>
> Steve, re-read what I wrote.
>
> This mailing list is *focused* on upstream work and support, and while
> it does not preclude talking about distro specific bugs, I believe
> there are better avenues for those discussions (e.g. see the RHBZ link
> I provided in my response) as upstream isn't really going to be able
> to provide adequate help for someone experiencing problems with a
> distro kernel which has a number of patches and backports.
>
> If you have a problem with this approach, perhaps we should move
> upstream development to an audit mailing list on vger.kernel.org and
> leave this list for RH specific issues?

Steve, I realize it's only been ~24hrs, but should I assume you are
okay with that (the upstream focused approach)?

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


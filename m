Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B81F466293D
	for <lists+linux-audit@lfdr.de>; Mon,  9 Jan 2023 16:03:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673276592;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pO9hKRN/JcvaWx8dh1EebHACq3ANQJxT7+u8oktFU80=;
	b=IIXu6dvYwuRXIGIZuTi5l2uN/hDQA70nbphM5w2ZpAzBM4KBd8Y995Ctu+G4gslAkodOJ9
	kGRIViRrk1GYdSIslrDX5V0BxzLGvF23Am2RAnL8+Vh5BwhCyy+TOdKgBzhOu6UqBsC2in
	DCxVldjQjfj6feAV8l35mMZFwmuqEHM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-2FI1SSM1PdC3ZNdsdJSGsQ-1; Mon, 09 Jan 2023 10:03:08 -0500
X-MC-Unique: 2FI1SSM1PdC3ZNdsdJSGsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A691685A588;
	Mon,  9 Jan 2023 15:02:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A09C32026D2B;
	Mon,  9 Jan 2023 15:02:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E36BB1949738;
	Mon,  9 Jan 2023 15:02:37 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AE5C01946587 for <linux-audit@listman.corp.redhat.com>;
 Mon,  9 Jan 2023 15:02:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 995924014CE2; Mon,  9 Jan 2023 15:02:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F97140C1141
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 15:02:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7336B18E0921
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 15:02:36 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-161-Zb7UXgjeNBGnSuvOWwQw0A-1; Mon, 09 Jan 2023 10:02:33 -0500
X-MC-Unique: Zb7UXgjeNBGnSuvOWwQw0A-1
Received: by mail-pl1-f175.google.com with SMTP id d9so9777950pll.9
 for <linux-audit@redhat.com>; Mon, 09 Jan 2023 07:02:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/6Ha6OG46ymFw8PY+SpkgDpwESeWcHhimG/370Ya3AE=;
 b=cOTz/mbgpTtTdW3G/n7qRzKjt7B1eTq/eybHyFWrYkukapQ3qYUD0CPoBRY7zZq9oR
 EcISsbDs27kte/SMhuLaF481wAVm+G87z3ltNwWi9ghAjsfrNkgrrCGT67Pdvkftq5cH
 o3cPdG+VCLNlIJhcRgGN/EJBFxXKRKHgc9Skoa/kypPEI5tVkVfg9uTJdMyvhKcTYDwl
 BNVlut4yKQEIsB9nnntvR9aLYCR3dstTUkpWEBzHInwRuB6f1+wk93lUSMWq223VFZ9Y
 EfJDhuLIva603W8TIia5GvUT2zF1NCY2V/ELPgQ2CgedfG+2hhl0gCM+9GsoRBIFOMFO
 xS2Q==
X-Gm-Message-State: AFqh2kr7mvKHV92HDg93TycPvOrv/S+esE+tS7yz4ai8JckVavkhSFGU
 7GUFpPg92/x6VqKb8uZ3MbkAkjxIFTTRbs2/BXTP4BrgbfqMCko=
X-Google-Smtp-Source: AMrXdXu6+cjneFeN9EjmN/4VssB9uWFsWW5TVaMSFXYR09mtEnm29vwQ+unzRqv60LuyD410y4buj2UmQDj9KPap5SE=
X-Received: by 2002:a17:90b:2352:b0:226:b6e7:aedb with SMTP id
 ms18-20020a17090b235200b00226b6e7aedbmr1950126pjb.69.1673276552563; Mon, 09
 Jan 2023 07:02:32 -0800 (PST)
MIME-Version: 1.0
References: <CACKMdf=43CJmauoVnyzemsGtJoR5g=yDUUojJ3P1qsbKrrNMXQ@mail.gmail.com>
 <CAHC9VhQ10FeuFYqhC31YCmU9BB67go3RoMOsYn+SWA5TsWKy9w@mail.gmail.com>
 <5654293.DvuYhMxLoT@x2>
 <CAHC9VhTdznAV=ZbUbJM5EPs7_VVAL2KU1i7T=mQaUiq+TiL1=g@mail.gmail.com>
 <CAHC9VhQH28r_fOCaW+=_65M2SBNpVnQqcvxKt28Zc1+YEqwjBQ@mail.gmail.com>
 <CACKMdfkhwyU4=DYVd5AHo+AQb50nyrDg3tTO7H615GogNCcv=A@mail.gmail.com>
In-Reply-To: <CACKMdfkhwyU4=DYVd5AHo+AQb50nyrDg3tTO7H615GogNCcv=A@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Jan 2023 10:02:21 -0500
Message-ID: <CAHC9VhQn+uFEd0q-zBpgt9q7WPDd-5FdG1i_p+B1dBcf+d=NuQ@mail.gmail.com>
Subject: Re: New bug in Audit
To: Ariel Silver <arielsilver77@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 9, 2023 at 3:30 AM Ariel Silver <arielsilver77@gmail.com> wrote:
>
> Hey guys and thank you for the quick reply, Much appreciated!
>
> As Richard and Steve mentioned the commit: https://github.com/linux-audit/audit-kernel/commit/1b2263a807ca651f94517b1b22dc5f13e494984d
> Fixed this issue.

A quick note for anyone looking to backport, the actual commit in the
upstream Linux Kernel is d4fefa4801a1 ("audit: move audit_return_fixup
before the filters").  Looking at the commit ID posted above and the
note in the commit about the manual merge, it looks like the 1b22
commit had a munged subject line that was fixed in d4fe.

> Any timeframe to when we can get a new version of auditd with that fix?
> Or should I count on redhat to release an update to the kernel ?
>
> Any update will be good.

This is one of those reasons why you really need to contact RH
directly via their bugzilla and/or a support representative; those of
us who work on the upstream Linux Kernel do not have visibility into
RH's kernel release process.  I maintain the Linux Kernel's audit
subsystem and I don't currently work for RH, and haven't for over four
years ;)

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


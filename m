Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 96FC32F4C6F
	for <lists+linux-audit@lfdr.de>; Wed, 13 Jan 2021 14:48:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-9N0WK4jbOqq8cnH9syMCsQ-1; Wed, 13 Jan 2021 08:48:43 -0500
X-MC-Unique: 9N0WK4jbOqq8cnH9syMCsQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB80A8066E7;
	Wed, 13 Jan 2021 13:48:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AD375C8A7;
	Wed, 13 Jan 2021 13:48:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C13B180954D;
	Wed, 13 Jan 2021 13:48:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10DDmDFj007140 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 13 Jan 2021 08:48:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 730C5D0192; Wed, 13 Jan 2021 13:48:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DC0CD016B
	for <linux-audit@redhat.com>; Wed, 13 Jan 2021 13:48:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 386C0800296
	for <linux-audit@redhat.com>; Wed, 13 Jan 2021 13:48:11 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-142-y0KYMIK9N46xnRG1UqP3WA-1; Wed, 13 Jan 2021 08:48:09 -0500
X-MC-Unique: y0KYMIK9N46xnRG1UqP3WA-1
Received: by mail-ed1-f52.google.com with SMTP id r5so1941780eda.12
	for <linux-audit@redhat.com>; Wed, 13 Jan 2021 05:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qw6VQNbr/MnGxv6QaGRimh6NhRF2uRUV4EBku2j8OE8=;
	b=gC/hSfU0sbJpxXUa09lHoqJ9uNiPhtAkOPWBl/zVdGUe0V39gACy+WHhgyisQERqBK
	LFF/OUYjocQexYPbKYR6MLOgcZMY0KkBIOCKq/CPVfAdI7MuIpbpMr+S6G+p+agPpPyW
	Db6ll7YgTVR7jEdrXtQdHAtwuB013CrVMDtH+L6ZJ5MVvKVv2pSc2P3uSj2nn/25fxvS
	74zZArM7jhSqJ0HxX1o+ez9H2bf9jjE9QDtoinGIlQWNXeehSPahv31IWsw8OJQxLp2g
	Tc3biOgaD2V03/zZQ6smqgLKzo3d4rWf9pT0DAoD+uO6mxsk4XO6Q9/uIwMBd/TPY6mL
	yO9Q==
X-Gm-Message-State: AOAM533WhbvU+4iDYP+IGhToRfU/4vTBV5GfGdCPnFQ6ZOSWp0DUhhoc
	2T91aUO+TvesG0X2oo61xbWDVMU7S8jRVAdpn22x
X-Google-Smtp-Source: ABdhPJwB4tmGNdMbAc1D65UZyTgVVNUEtW4KR+KikSXTmEkqME3Uj+9zKG0LG7DEXXVH92c+5/i2cXRJl3qFCKZrFV4=
X-Received: by 2002:a05:6402:1bcd:: with SMTP id
	ch13mr629052edb.31.1610545687667; 
	Wed, 13 Jan 2021 05:48:07 -0800 (PST)
MIME-Version: 1.0
References: <202101132038409309743@zte.com.cn>
In-Reply-To: <202101132038409309743@zte.com.cn>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 13 Jan 2021 08:47:56 -0500
Message-ID: <CAHC9VhSB0UvbQZbCa4hTHgnx23+9FR-P+ytXw547c7YjSH0rMw@mail.gmail.com>
Subject: Re: [RFC, v1,
	1/1] audit: speed up syscall rule match while exiting syscall
To: yang.yang29@zte.com.cn
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 13, 2021 at 7:39 AM <yang.yang29@zte.com.cn> wrote:
> From 82ebcf43481be21ee3e32ec1749b42f651737880 Mon Sep 17 00:00:00 2001
> From: Yang Yang <yang.yang29@zte.com.cn>
> Date: Wed, 13 Jan 2021 20:18:04 +0800
> Subject: [PATCH] [RFC,v1,1/1] speed up syscall rule match while exiting syscall
>  If user add any syscall rule, in all syscalls, audit_filter_syscall()
>  traverses struct list_head audit_filter_list to find out whether current
>  syscall match one rule. This takes o(n), which is not necessary, specially
>  for user who add a very few syscall rules. On the other hand, user may not
>  much care about rule add/delete speed. So do o(n) calculate at rule changing,
>  and ease the burden of audit_filter_syscall().
>
>  Define audit_syscall[NR_syscalls], every element stands for one syscall.
>  audit_filter_syscall() checks audit_syscall[NR_syscalls].
>  audit_syscall[n] == 0 indicates no rule audit syscall n, do a quick exit.
>  audit_syscall[n] > 0 indicates at least one rule audit syscall n.
>  audit_syscall[n] update when syscall rule changes.
>
> Signed-off-by: Yang Yang <yang.yang29@zte.com.cn>
> ---
>  include/linux/audit.h |  2 ++
>  kernel/audit.c        |  2 ++
>  kernel/auditfilter.c  | 16 ++++++++++++++++
>  kernel/auditsc.c      |  9 ++++++++-
>  4 files changed, 28 insertions(+), 1 deletion(-)

Before we go too far into a review of this patch, please provide some
performance measurements using a variety of rule counts, both common
and extreme, so that we can better judge the benefits of this patch.
The measurements should include both the rule add/delete time deltas
as well as the impact on the syscall invocations.  If non-obvious,
please also include how you performed the measurements and captured
the data.

These are good things to include in the commit description when
submitting patches focused on improving performance.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


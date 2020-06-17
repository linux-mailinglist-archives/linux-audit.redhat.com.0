Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6C07A1FD4CF
	for <lists+linux-audit@lfdr.de>; Wed, 17 Jun 2020 20:48:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592419686;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=THpPpX5rOh6H+lrOf2S4B7aoL4fNdrHgf6CTYCrrTSE=;
	b=VvwgwCp+yJo/eGthWETc4B19r8sACYhyu5WCtCivutxJoOMIAX0ShgmHYFUlbq0rT5StvE
	wlszw2MraH/HzqhK3AVGQzDeFJZ0AFGAUri3+SColSkfreUqSGQW4sy6VpBt1w1/R9DjxI
	0ubGdBLr4vVZY/NReGVbXXZft6uI1Fw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-6iE3or_ZPNu36c0M5oGynA-1; Wed, 17 Jun 2020 14:48:03 -0400
X-MC-Unique: 6iE3or_ZPNu36c0M5oGynA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E05C5420FF;
	Wed, 17 Jun 2020 18:47:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2E185D9DA;
	Wed, 17 Jun 2020 18:47:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77653833CA;
	Wed, 17 Jun 2020 18:47:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05HIlbwq013025 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 14:47:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 491462028E91; Wed, 17 Jun 2020 18:47:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43E202026DFD
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 18:47:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD96E1859162
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 18:47:34 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-287-accMTix3MPGF3pqV_jK-iw-1; Wed, 17 Jun 2020 14:47:32 -0400
X-MC-Unique: accMTix3MPGF3pqV_jK-iw-1
Received: by mail-ej1-f66.google.com with SMTP id gl26so3600613ejb.11
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 11:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=by/BjzK7W1YnBH4ShdR0OKZR3ptIFU7vyPIwPS9Z6bk=;
	b=pk8GPm8FLWvRtudFANZB6Ud42psi4mnBJJnNTWSlBmgpmJHUS1OYLGxqQKATBXKD8A
	kxDomS11r3ncmM1RzBvGEuOdB6L4VazwHsg7O+ID+Yp99ksEU3qwiWooCMWZdJQqd0yL
	WLCFHLP+3gZmuutxBuOCAGa4aJxKGzk09IppmJuMKcMfG5CcTvPBmwITCmvmkZuzq1cg
	WoPac0LZAmm9bphgjESXA//eiKWRRveyzM550Dbux6r7KyiQrFVPL+h4apw/54SK/u6z
	KpQmFuiMjWb/XNDgWFxUi5/Rxg0q9gpdmL1pEdhyWdRTM3xJ9dna3WaxJbM/HFicCeUZ
	pq4w==
X-Gm-Message-State: AOAM530saC7NZFjRnweKEht7qK38d3LryJL6uASmWdSCPrzmzdo7kSnK
	5mW1QySB9ukUQz8eFncK4gH7sNMnavcy04nYEohLiPI=
X-Google-Smtp-Source: ABdhPJzaz1lLKgUCfDInCKC1vBGkoPMarFSsLTPrPP3u9LidWUGRzzkOxgfsE+u83y12o0gGxtq94PYP0tGSpB5PGHc=
X-Received: by 2002:a17:906:2b81:: with SMTP id
	m1mr501591ejg.488.1592419650629; 
	Wed, 17 Jun 2020 11:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200616045855.GA1699@linux-kernel-dev>
In-Reply-To: <20200616045855.GA1699@linux-kernel-dev>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 17 Jun 2020 14:47:19 -0400
Message-ID: <CAHC9VhSotFw2i7HzWrHUyc6VSbwTpv8ZBeP58H_mzi6bd=Uouw@mail.gmail.com>
Subject: Re: [PATCH] audit: optionally print warning after waiting to enqueue
	record
To: Max Englander <max.englander@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 16, 2020 at 12:58 AM Max Englander <max.englander@gmail.com> wrote:
>
> In environments where security is prioritized, users may set
> --backlog_wait_time to a high value in order to reduce the likelihood
> that any audit event is lost, even though doing so may result in
> unpredictable performance if the kernel schedules a timeout when the
> backlog limit is exceeded. For these users, the next best thing to
> predictable performance is the ability to quickly detect and react to
> degraded performance. This patch proposes to aid the detection of kernel
> audit subsystem pauses through the following changes:
>
> Add a variable named audit_backlog_warn_time. Enforce the value of this
> variable to be no less than zero, and no more than the value of
> audit_backlog_wait_time.
>
> If audit_backlog_warn_time is greater than zero and if the total time
> spent waiting to enqueue an audit record is greater than or equal to
> audit_backlog_warn_time, then print a warning with the total time
> spent waiting.
>
> An example configuration:
>
>         auditctl --backlog_warn_time 50
>
> An example warning message:
>
>         audit: sleep_time=52 >= audit_backlog_warn_time=50
>
> Tested on Ubuntu 18.04.04 using complementary changes to the audit
> userspace: https://github.com/linux-audit/audit-userspace/pull/131.
>
> Signed-off-by: Max Englander <max.englander@gmail.com>
> ---
>  include/uapi/linux/audit.h |  7 ++++++-
>  kernel/audit.c             | 35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+), 1 deletion(-)

If an admin is prioritizing security, aka don't loose any audit
records, and there is a concern over variable system latency due to an
audit queue backlog, why not simply disable the backlog limit?

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


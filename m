Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 682CD275A01
	for <lists+linux-audit@lfdr.de>; Wed, 23 Sep 2020 16:30:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-Yu86v82_PAaABitAnTzF-A-1; Wed, 23 Sep 2020 10:30:21 -0400
X-MC-Unique: Yu86v82_PAaABitAnTzF-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCE091091062;
	Wed, 23 Sep 2020 14:30:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93DA155764;
	Wed, 23 Sep 2020 14:30:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65A7B183D040;
	Wed, 23 Sep 2020 14:30:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08NETw74021585 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 10:29:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AD1882026F94; Wed, 23 Sep 2020 14:29:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8E5F2028DC0
	for <linux-audit@redhat.com>; Wed, 23 Sep 2020 14:29:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47C3780121D
	for <linux-audit@redhat.com>; Wed, 23 Sep 2020 14:29:56 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-103-MWioICrYODOHI6qU47ShIQ-1; Wed, 23 Sep 2020 10:29:54 -0400
X-MC-Unique: MWioICrYODOHI6qU47ShIQ-1
Received: by mail-ej1-f68.google.com with SMTP id o8so28026057ejb.10
	for <linux-audit@redhat.com>; Wed, 23 Sep 2020 07:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BvWaZAOmCSJi5EjRj+9rGgqiUccGff1Wvin8E59j7sU=;
	b=UNb0JLYown9FzgnX+c+lzS1RxA4omBikAeV7XW+NyVIbWSYZJHAK54VqX1DRrVdulK
	yWXjNQjxwwq1DffuzOyc7DuyEKu0rQHpCHKga57PX1KdoX3L7HeRsTdeb2Hzoy/MCbJS
	dpiPjFWbmgJyx07kBYrwlAZeIgFeTOlLcfI4USOUWt7W1EzWqE7096gQs0ZoTVAIGznu
	3A0O2MYwMBGP9F1EtWUxEtWPOeK/iTUvihAQ9YVsMu4aYuQTn9le69KVyNZwB3+/V70W
	WxUcK20KKCItyWV+KS3OxEga2wSkHFX15RdsLIiCzvIuoP8Dg1q/g1plt+hbg4gzgPqu
	PDSg==
X-Gm-Message-State: AOAM533/kh4dyb0erM5Y21lxVu2UHEycOo75HjoyHxXalfo5x3j83hkA
	LI4ItWgqO2Ewiko1EAVd3oA8mHA6K5SVOE7GPEEt
X-Google-Smtp-Source: ABdhPJxGSIKF2KiIFwdCnNZD5Z23c3TbbdA9P88SF9tmr7khUww94uVt7KXHwj5PRDeMEki4gV+UN/8Hw3VdJKdHg3k=
X-Received: by 2002:a17:906:2301:: with SMTP id
	l1mr10188672eja.488.1600871392179; 
	Wed, 23 Sep 2020 07:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <7081a5b9c7d2e8085c49cec2fa72fcbb0b25e0d7.1600778472.git.rgb@redhat.com>
In-Reply-To: <7081a5b9c7d2e8085c49cec2fa72fcbb0b25e0d7.1600778472.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 23 Sep 2020 10:29:41 -0400
Message-ID: <CAHC9VhSPk2RiMsnjTKw02_+_1Kagm06m+-r=ooNruT+fuuixYQ@mail.gmail.com>
Subject: Re: [PATCH ghak120 V5] audit: trigger accompanying records when no
	rules present
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: Linux Security Module list <linux-security-module@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 22, 2020 at 8:45 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> When there are no audit rules registered, mandatory records (config,
> etc.) are missing their accompanying records (syscall, proctitle, etc.).
>
> This is due to audit context dummy set on syscall entry based on absence
> of rules that signals that no other records are to be printed.  Clear the dummy
> bit if any record is generated, open coding this in audit_log_start().
>
> The proctitle context and dummy checks are pointless since the
> proctitle record will not be printed if no syscall records are printed.
>
> The fds array is reset to -1 after the first syscall to indicate it
> isn't valid any more, but was never set to -1 when the context was
> allocated to indicate it wasn't yet valid.
>
> Check ctx->pwd in audit_log_name().
>
> The audit_inode* functions can be called without going through
> getname_flags() or getname_kernel() that sets audit_names and cwd, so
> set the cwd in audit_alloc_name() if it has not already been done so due to
> audit_names being valid and purge all other audit_getcwd() calls.
>
> Revert the LSM dump_common_audit_data() LSM_AUDIT_DATA_* cases from the
> ghak96 patch since they are no longer necessary due to cwd coverage in
> audit_alloc_name().
>
> Thanks to bauen1 <j2468h@googlemail.com> for reporting LSM situations in
> which context->cwd is not valid, inadvertantly fixed by the ghak96 patch.
>
> Please see upstream github issue
> https://github.com/linux-audit/audit-kernel/issues/120
> This is also related to upstream github issue
> https://github.com/linux-audit/audit-kernel/issues/96
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> Chagelog:
> v5:
> - open code audit_clear_dummy() in audit_log_start()
> - fix check for ctx->pwd in audit_log_name()
> - open code _audit_getcwd() contents in audit_alloc_name()
> - ditch all *audit_getcwd() calls
>
> v4:
> - resubmit after revert
>
> v3:
> - initialize fds[0] to -1
> - init cwd for ghak96 LSM_AUDIT_DATA_NET:AF_UNIX case
> - init cwd for audit_inode{,_child}
>
> v2:
> - unconditionally clear dummy
> - create audit_clear_dummy accessor function
> - remove proctitle context and dummy checks
>
>  include/linux/audit.h |  8 --------
>  kernel/audit.c        |  3 +++
>  kernel/auditsc.c      | 27 +++++++--------------------
>  security/lsm_audit.c  |  5 -----
>  4 files changed, 10 insertions(+), 33 deletions(-)

I've gone over this revision a couple of times now and it looks okay,
but past experience is whispering in my ear that perhaps this is
better to wait on this for the next cycle so it gets a full set of
-rcX releases.  Thoughts?

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


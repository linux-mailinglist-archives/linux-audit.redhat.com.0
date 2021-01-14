Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0007F2F643A
	for <lists+linux-audit@lfdr.de>; Thu, 14 Jan 2021 16:23:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7--8Qg46iZOlq_MS_eYP6ZqA-1; Thu, 14 Jan 2021 10:23:09 -0500
X-MC-Unique: -8Qg46iZOlq_MS_eYP6ZqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21945806665;
	Thu, 14 Jan 2021 15:23:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C136719C48;
	Thu, 14 Jan 2021 15:22:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E85CF180954D;
	Thu, 14 Jan 2021 15:22:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10EFMil8000815 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 14 Jan 2021 10:22:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DB0922028CD8; Thu, 14 Jan 2021 15:22:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0C86200E216
	for <linux-audit@redhat.com>; Thu, 14 Jan 2021 15:22:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96588811E85
	for <linux-audit@redhat.com>; Thu, 14 Jan 2021 15:22:42 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-279-tsWWlvXZOtm5jxsnphMZ3A-1; Thu, 14 Jan 2021 10:22:40 -0500
X-MC-Unique: tsWWlvXZOtm5jxsnphMZ3A-1
Received: by mail-ed1-f53.google.com with SMTP id g1so5450973edu.4
	for <linux-audit@redhat.com>; Thu, 14 Jan 2021 07:22:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iDiw0Eb4xl1qF//Pb3TXsca/MjYdq3TONkBKPeZe8Cg=;
	b=m7NpAwUMnjAKUsKAxFHaBL7aR1DecRS24qhELCuRcHXv0bu8g3sqbXMXxhC1ahXwHx
	OhVqd6EgX7qtaM/WBU7kOdDzbsvlpEuWdglPBa5HjREI1n+3id/tQp733FzoAV4DyRNQ
	qS9chxkXXI4Jn80AqtJ7ud/0f3vgq6uomN6G6Q0mFkhw2nshxMHR5nqdatMNSm94d33w
	ddjuk+kGYilXtH6KTPIwKQ496KYafJL9pP7B/iVzVEK7Xr46d3heuQ7xSrW/eAdceNmE
	qQQP27W8w8AmASYybSFVujpZOdccsyEWdkYfT4agjLc6Iz1r6j5Gf00h5LUDLI1Uia0R
	Q3dQ==
X-Gm-Message-State: AOAM533NjqwtIBqap4ExrhjWVD16b3H3MneBHNyr4trS81rres1X8XM5
	pgyKSYUPxMsiLZXxVSuYu7BXh+opLNuTusYEx8s4
X-Google-Smtp-Source: ABdhPJyV59NKAh4E0zWqslpwmhaYLEMm7IumyRUG73CvA8pRa2E1iYwW6LGLMXN4mlGlo02BPrpz342U6rsnokOLYq8=
X-Received: by 2002:a05:6402:ca1:: with SMTP id
	cn1mr6088321edb.128.1610637758780; 
	Thu, 14 Jan 2021 07:22:38 -0800 (PST)
MIME-Version: 1.0
References: <202101142125016321850@zte.com.cn>
In-Reply-To: <202101142125016321850@zte.com.cn>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 14 Jan 2021 10:22:27 -0500
Message-ID: <CAHC9VhS=FWMWeTmLHtpVOrjL=j-89cjH+rYktcUZd8rj_fSc=w@mail.gmail.com>
Subject: Re: Fw:Re:[RFC,v1,1/1] audit: speed up syscall rule match while
	exiting syscall
To: yang.yang29@zte.com.cn
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 14, 2021 at 8:25 AM <yang.yang29@zte.com.cn> wrote:
>
> Performance measurements:
> 1.Environment
> CPU: Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz
> Linux kernel version: 5.11-rc3
> Audit version: 2.8.4
>
> 2.Result
> 2.1 Syscall invocations
> Test method:
>     Run command "top" with no-load.
>     Add rule likes "auditctl -a always,exit -F arch=b64 -S chmod -F auid=[number]" which doesn't hit audit.
>     User command "perf record -Rg -t [top's pid] sleep 900" to get audit_filter_syscall()'s execute time ratio.

Thanks for providing some performance numbers so quickly, a few
comments and thoughts below ...

> audit_filter_syscall() ratio with 100 rules:
>     before this patch: 15.29%.
>     after this patch: 0.88%, reduce 14.41%.
> audit_filter_syscall() ratio with CIS[1] rules:
>     before this patch: 2.25%.
>     after this patch: 1.93%%, reduce 0.32%.
> audit_filter_syscall() ratio with 10 rules:
>     before this patch: 0.94%.
>     after this patch: 1.02%, increase 0.08%.
> audit_filter_syscall() ratio with 1 rule:
>     before this patch: 0.20%.
>     after this patch: 0.88%, increase 0.68%.

If we assume the CIS rules to be a reasonable common case (I'm not
sure if that is correct or not, but we'll skip that discussion for
now), we see an performance improvement of 0.32% correct, yes?  We
also see a performance regression with small number of syscall rules
that equalizes above ten rules, yes?

On your system can you provide some absolute numbers?  For example,
what does 0.32% equate to in terms of wall clock time for a given
syscall invocation?

> Analyse:
>     With 1 rule, after this patch performance is worse, because mutex_lock()/mutex_unlock(). But user just add one rule seems unusual.
>     With more rule, after this patch performance is improved.Typical likes CIS benchmark.
>
> 2.2 Rule change
> Test method:
>     Use ktime_get_real_ts64() before and after audit_add_rule()/audit_del_rule() to calculate time.
>      Add/delete rule by command "auditctl". Each test 10times and get average.

In this case I'm less concerned about micro benchmarks, and more
interested in the wall clock time difference when running auditctl to
add/remove rules.  The difference here in the micro benchmark is not
trivial, but with a delta of 4~5us it is possible that it is a
small(er) percentage when compared to the total time spent executing
auditctl.

> audit_add_rule() time:
>     before this patch: 3120ns.
>     after this patch: 7783ns, increase 149%.
> audit_del_rule() time:
>     before this patch: 3510ns.
>     after this patch: 8519ns, increase 143%.
>
> Analyse:
>     After this patch, rule change time obviously increase. But rule change may not happen very often.
>
> [1] CIS is a Linux Benchmarks for security purpose.
> https://www.cisecurity.org/benchmark/distribution_independent_linux/

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


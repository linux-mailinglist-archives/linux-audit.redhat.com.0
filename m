Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8193C3009D9
	for <lists+linux-audit@lfdr.de>; Fri, 22 Jan 2021 18:32:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567--z0mkE-sPkWLf1sNz33oEw-1; Fri, 22 Jan 2021 12:32:16 -0500
X-MC-Unique: -z0mkE-sPkWLf1sNz33oEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2634184214C;
	Fri, 22 Jan 2021 17:32:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1F1B5C230;
	Fri, 22 Jan 2021 17:32:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A70FC4BB7B;
	Fri, 22 Jan 2021 17:32:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10MHVfRT011878 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 22 Jan 2021 12:31:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 63EEB2166B2F; Fri, 22 Jan 2021 17:31:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EF662166B2B
	for <linux-audit@redhat.com>; Fri, 22 Jan 2021 17:31:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0510485828A
	for <linux-audit@redhat.com>; Fri, 22 Jan 2021 17:31:39 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-230-huC2aRUfMG-jF0HehiUiEg-1; Fri, 22 Jan 2021 12:31:36 -0500
X-MC-Unique: huC2aRUfMG-jF0HehiUiEg-1
Received: by mail-ed1-f41.google.com with SMTP id c2so7193483edr.11
	for <linux-audit@redhat.com>; Fri, 22 Jan 2021 09:31:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ED60FKhK96gry/rcTB0tBDnaMgHxP/KjvgwSiQKPbwI=;
	b=U5QcnP8GDUrbS9WWxfltDJRJo6DAju6Ro7E8WdB1bIV7/NBY1kkzksB4DkVJ4spRly
	yU8KkvNIIyK0hqr0GCXDAcJNATycamUFwQfDLSP9+hRRwlC2hlbsZdEj9+KypRohVtO5
	ny3dIsef0tMM1Etf2Xf/wxuIx4sUDjD4FHzaQde+erw+p63zv4byCLJ3H15US2GyS26Z
	EPSB/YD7wmL1ZOoaU6+CKYV6nI3hyWRQuoPC2o6bKKHej+o68dDd9xp1ZTESSh+ls3NT
	InDFDEN4RXEpVmx0Nq51/2edv9/KJizLQgpk0KX+rRFB1Tcaq7m7u7I8PJUD6FyHhhIu
	eTHA==
X-Gm-Message-State: AOAM533B9ZzqoJEHseV1j3ktGjJBE18b9oJa8vp2uVLr4nOPra99mcnk
	IBDRYYwmU80vETCT+A9kuLnEjxj7uPIdPbNHKC9K
X-Google-Smtp-Source: ABdhPJzZ2xbtnN29pvDRZOKvuQdspEPAK6EgCyF9t5NDUH8h5QSRcpwg4Uzy2BwRqyvnTNve4UYWqCcM6nUhPmFSG90=
X-Received: by 2002:a05:6402:4389:: with SMTP id
	o9mr4120649edc.164.1611336695427; 
	Fri, 22 Jan 2021 09:31:35 -0800 (PST)
MIME-Version: 1.0
References: <202101212225030936472@zte.com.cn>
In-Reply-To: <202101212225030936472@zte.com.cn>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 22 Jan 2021 12:31:24 -0500
Message-ID: <CAHC9VhSawMHjRsEuHCDhSq2JEpLxvQZ1u1tEg=cy4y9Ays4ogg@mail.gmail.com>
Subject: Re: Fw:Re:Fw:Re:[RFC, v1,
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

On Thu, Jan 21, 2021 at 9:25 AM <yang.yang29@zte.com.cn> wrote:
>
> Thanks for reply, I have sent a new patch with better performance.
> The v1 patch uses mutex() is not necessary.
>
> Performance measurements:
> 1.Environment
> CPU: Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz
> Linux kernel version: 5.11-rc3
> Audit version: 2.8.4

...

> 2.2 Syscall absolute time
> Test method:
> Use ktime_get_real_ts64() in do_syscall_64() to calculate time.
> Run command "chmod 777 /etc/fstab" with chown rules. Each test 10times and get average.
>
> do_syscall_64() time with 100 rules:
> before this patch: 7604ns
> after this patch: 5244ns, reduce 2360ns.
>
> do_syscall_64() time with CIS rules:
> before this patch: 6710ns
> after this patch: 7293ns, increase 583ns.
>
> do_syscall_64() time with 10 rules:
> before this patch: 5382ns
> after this patch: 5171ns, reduce 211ns.
>
> do_syscall_64() time with 1 rule:
> before this patch: 5361ns
> after this patch: 5375ns, increase 14ns.
>
> do_syscall_64() time with no rules:
> before this patch: 4735ns
> after this patch: 4804ns, increase 69ns.
>
> Analyse:
> With a few rules, performance is close.
> With 100 rules, performance is better, but with CIS rules performance regress. Maybe relevant to certain syscall.

These numbers aren't particularly good in my opinion, the negative
impact of the change to a small number of rules and to the CIS ruleset
is not a good thing.  It also should be said that you are increasing
the memory footprint, even if it is relatively small.

However, if we take a step back and look at the motivation for this
work I wonder if there are some things we can do to improve the
per-syscall rule processing performance.  On thing that jumped out
just now was this code in __audit_syscall_exit():

void __audit_syscall_exit(int success, long return_code)
{

  /* ... */

  /*
   * we need to fix up the return code in the audit logs if the
   * actual return codes are later going to be fixed up by the
   * arch specific signal handlers ... */
  if (unlikely(return_code <= -ERESTARTSYS) &&
      (return_code >= -ERESTART_RESTARTBLOCK) &&
      (return_code != -ENOIOCTLCMD))
    context->return_code = -EINTR;
  else
    context->return_code  = return_code;

  audit_filter_syscall(current, context,
    &audit_filter_list[AUDIT_FILTER_EXIT]);
  audit_filter_inodes(current, context);
  if (context->current_state == AUDIT_RECORD_CONTEXT)
    audit_log_exit();
  }

... in the snippet above the audit_filter_inodes() function/rules are
given priority over the syscall rules in
audit_filter_syscall(AUDIT_FILTER_EXIT), so why not first execute
audit_filter_inodes() and only execute
audit_filter_syscall(AUDIT_FILTER_EXIT) if necessary?  It may be that
I'm missing something on this quick look at the code, but I think it
is worth investigating.  It's also possible there are other similar
improvements to made.

There is similar code in __audit_free() but that should be less
performance critical.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


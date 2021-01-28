Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 29DE6306B43
	for <lists+linux-audit@lfdr.de>; Thu, 28 Jan 2021 03:52:58 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-zFETxX2INe-FlLAOKb62_Q-1; Wed, 27 Jan 2021 21:52:55 -0500
X-MC-Unique: zFETxX2INe-FlLAOKb62_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A062806674;
	Thu, 28 Jan 2021 02:52:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 419FE19C71;
	Thu, 28 Jan 2021 02:52:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DDBA71809C9F;
	Thu, 28 Jan 2021 02:52:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10S2q6OP018136 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 21:52:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 17C392026D49; Thu, 28 Jan 2021 02:52:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12C232026D48
	for <linux-audit@redhat.com>; Thu, 28 Jan 2021 02:52:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE01B800BFF
	for <linux-audit@redhat.com>; Thu, 28 Jan 2021 02:52:02 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-436-eHeVx_RfNDGAj7BINFTXOw-1; Wed, 27 Jan 2021 21:52:00 -0500
X-MC-Unique: eHeVx_RfNDGAj7BINFTXOw-1
Received: by mail-ed1-f43.google.com with SMTP id c6so4928364ede.0
	for <linux-audit@redhat.com>; Wed, 27 Jan 2021 18:51:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SpQaqfgxd7HJasSj0lTbCtNGSUTspubqoBTb1LMXVRM=;
	b=V8zHu8ajRgXhc0XTOqyGijyyfP2VDhYF6kuMEPJp5WYwNdznASGz3IH3LirDWJ6Vbw
	NJsCGLa6ua6RoracqDe/E4iN14Ql4GEwmOv7VG4yvaIA243jSHhTyEMm/rF0cOneSzlQ
	86m7vPv2EoC93F+pKzDIoK2TueksHpQpOXnO3CYmPzy9WJX2VfnDX4qcgqMa5xmX1Jrn
	qZTvZRBIpN0E5M49NyYB4endRKFw2cTfMSEFgmao0wEuyjSfxWqjI2k0ZVdkJFADfVeV
	QE4CzPZEcO0kMgDebkYhJQsKqo9VT4MqGVouz53JVfMUzjjCai/PmCrFxUblbHcLPaKe
	WMEg==
X-Gm-Message-State: AOAM533guImRjU4hfteZVX/6Vw/Cf0uNj6+mxmwQ+XAZaYZRSzZpCm+U
	+ye9YhtJxY6sRuaKICziy12eduJE1vV5zcOH0ueO
X-Google-Smtp-Source: ABdhPJyNf5vAnk4XFxWjzPoVjPvkYX+ygHKOJ+fk+XCk8eH+ZWou3fZkEEhhHv/CtO2hTnpY5zc82GD11WjV3xXgQMg=
X-Received: by 2002:a05:6402:1bcd:: with SMTP id
	ch13mr11572381edb.31.1611802318522; 
	Wed, 27 Jan 2021 18:51:58 -0800 (PST)
MIME-Version: 1.0
References: <202101242104019221924@zte.com.cn>
In-Reply-To: <202101242104019221924@zte.com.cn>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 27 Jan 2021 21:51:47 -0500
Message-ID: <CAHC9VhQR2+Zz8pzaCp4YJ-r8Tk-RBOuUhXNU=VJaWOw3sbeN+w@mail.gmail.com>
Subject: Re: [RFC,v3,1/1] audit: speed up syscall rule filtering
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

On Sun, Jan 24, 2021 at 8:04 AM <yang.yang29@zte.com.cn> wrote:
>
> From 85b3eccf7f12b091b78cc5ba8abfaf759cf0334e Mon Sep 17 00:00:00 2001
> From: Yang Yang <yang.yang29@zte.com.cn>
> Date: Sun, 24 Jan 2021 20:40:50 +0800
> Subject: [PATCH] audit: speed up syscall rule filtering
> audit_filter_syscall() traverses struct list_head audit_filter_list to find
> out whether current syscall match one rule. This takes o(n), which is not
> necessary, specially for user who add a very few syscall rules. On the other
> hand, user may not much care about rule add/delete speed. So do o(n)
> calculates when rule changes, and ease the burden of audit_filter_syscall().
>
> Define audit_rule_syscall_mask[NR_syscalls], every element stands for
> one syscall.audit_rule_syscall_mask[n] == 0 indicates no rule cares about
> syscall n, so we can avoid unnecessary calling audit_filter_syscall().
> audit_rule_syscall_mask[n] > 0 indicates at least one rule cares about
> syscall n, then calls audit_filter_syscall(). Update
> audit_rule_syscall_mask[n] when syscall rule changes.
>
> Signed-off-by: Yang Yang <yang.yang29@zte.com.cn>
> ---
>  include/linux/audit.h |  3 +++
>  kernel/auditfilter.c  |  4 ++++
>  kernel/auditsc.c      | 36 ++++++++++++++++++++++++++++++++----
>  3 files changed, 39 insertions(+), 4 deletions(-)

...

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index ce8c9e2..1b8ff4e 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -1627,8 +1653,9 @@ void __audit_free(struct task_struct *tsk)
>                 context->return_valid = AUDITSC_INVALID;
>                 context->return_code = 0;
>
> -               audit_filter_syscall(tsk, context,
> -                                    &audit_filter_list[AUDIT_FILTER_EXIT]);
> +               if (unlikely(audit_rule_syscall_mask[context->major]))
> +                       audit_filter_syscall(tsk, context,
> +                                            &audit_filter_list[AUDIT_FILTER_EXIT]);
>                 audit_filter_inodes(tsk, context);
>                 if (context->current_state == AUDIT_RECORD_CONTEXT)
>                         audit_log_exit();
> @@ -1735,8 +1762,9 @@ void __audit_syscall_exit(int success, long return_code)
>                 else
>                         context->return_code  = return_code;
>
> -               audit_filter_syscall(current, context,
> -                                    &audit_filter_list[AUDIT_FILTER_EXIT]);
> +               if (unlikely(audit_rule_syscall_mask[context->major]))
> +                       audit_filter_syscall(current, context,
> +                                            &audit_filter_list[AUDIT_FILTER_EXIT]);
>                 audit_filter_inodes(current, context);
>                 if (context->current_state == AUDIT_RECORD_CONTEXT)
>                         audit_log_exit();

Looking at this revision I believe I may not have been as clear as I
should have been with my last suggestion.  Let me try to do better
here.

Thus far I'm not very happy with the audit_rule_syscall_mask[]
additions; it looks both wasteful and inelegant to me at the moment.
I would much rather see if we can improve the existing code by fixing
inefficiencies in how we handle the rule filtering.  This is why my
previous comments suggested looking at the audit_filter_syscall() and
audit_filter_inodes() calls in __audit_free() and
__audit_syscall_exit(), the latter of course being more important due
to its frequency.

In both cases an audit_filter_inode() AUDIT_RECORD_CONTEXT decision
takes precedence over any audit_filter_syscall() decision due to the
code being structured as so:

  audit_filter_syscall(...);
  audit_filter_inodes(...);
  if (state == AUDIT_RECORD_CONTEXT)
    audit_log_exit();

... my suggestion is to investigate what performance benefits might be
had by leveraging this precedence, for example:

  audit_filter_inodes(...);
  if (state != AUDIT_RECORD_CONTEXT)
    audit_filter_syscall(...);
  if (state == AUDIT_RECORD_CONTEXT)
    audit_log_exit();

... of course I would expect the performance to be roughly the same
when there is no matching rule, but I think there would be a
performance when in those cases where a watched inode triggers an
audit rule.

Beyond that, there is probably work we could do to combine some
aspects of audit_filter_syscall() and audit_filter_inodes() to
eliminate some redundancy, e.g. reduce the number of audit_in_mask()
calls.  Actually looking a bit closer there are a number of
improvements that could likely be made, some might have some
performance impacts.

Let me know if you are going to pursue the suggestion above about
reordering the audit_filter_*() functions as I'll hold off on the
other changes.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


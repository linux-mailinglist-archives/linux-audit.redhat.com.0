Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2D00D214D70
	for <lists+linux-audit@lfdr.de>; Sun,  5 Jul 2020 17:11:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-xYLBLtYDMYy0U1Em_nlPJg-1; Sun, 05 Jul 2020 11:11:26 -0400
X-MC-Unique: xYLBLtYDMYy0U1Em_nlPJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD30F8015F5;
	Sun,  5 Jul 2020 15:11:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADCB510013DB;
	Sun,  5 Jul 2020 15:11:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 836481809547;
	Sun,  5 Jul 2020 15:11:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 065FBIZ3028451 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 5 Jul 2020 11:11:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E2B6C2166B28; Sun,  5 Jul 2020 15:11:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D11652166B27
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:11:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6A5E85A33D
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:11:15 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-230-ZL0ex6eQNCuSr3wV_gW1Mw-1; Sun, 05 Jul 2020 11:11:13 -0400
X-MC-Unique: ZL0ex6eQNCuSr3wV_gW1Mw-1
Received: by mail-ej1-f66.google.com with SMTP id lx13so21103389ejb.4
	for <linux-audit@redhat.com>; Sun, 05 Jul 2020 08:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NjVTfMdZw6XwQbxDon7o4vpETM5NGTk+/7UWsjNsjd4=;
	b=J+YBnIMu9SwAk3ykQ0PvlxipwKluq9wdVyuCpp3YfPvkkgFlq4jtHTg85FM9QjO3OJ
	pG2a9V0sDKALaPwWsKoDs0GxUdU9gB5ooBx4iCuFHgWhIGStGsQmiDnf7mzhr4F62esi
	xSbpKmV7jX/mU0Xzm43TMnUdkqKfdq8TyhDOwgZNPXo+n2KLK0aU9Ka+IzMgg+o9W+Dh
	cdl8onFR6HRJES46OE0TxfR2IPL+vWSSuPBfUhhje1sshcTWlobUbCWvcpgk4s3NlXOi
	2i5r2DLVt5kN2m+IGWiqXvsqIpWq5ldlxdnF3OD9OHG6zzeiN8NcdqwoS+G+uerjixXz
	cdFg==
X-Gm-Message-State: AOAM531dwa6uBeR9m1nyslSJS+6PHpb/AW4U/jQObR8iZZhomec/CWXb
	XE39QaaxLVqRgHdy1UNhG2dCAHold76yv1CnxSBW
X-Google-Smtp-Source: ABdhPJxZNVMN4RChXVrByWzKcFP6o6O2BuhllrOjeEE1M/lyej09V/IMzWRWLsJY9AP/xCOr9AZ8/Zf2tA+G6mTWN/A=
X-Received: by 2002:a17:906:1403:: with SMTP id
	p3mr31517140ejc.106.1593961872347; 
	Sun, 05 Jul 2020 08:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<21e6c4e1ac179c8dcf35803e603899ccfc69300a.1593198710.git.rgb@redhat.com>
In-Reply-To: <21e6c4e1ac179c8dcf35803e603899ccfc69300a.1593198710.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 5 Jul 2020 11:11:00 -0400
Message-ID: <CAHC9VhTEkhZqkH24hPEZgMtWcYy9qKhZdoiegDLhGefa_bxmuw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 07/13] audit: add support for non-syscall
	auxiliary records
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 27, 2020 at 9:22 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Standalone audit records have the timestamp and serial number generated
> on the fly and as such are unique, making them standalone.  This new
> function audit_alloc_local() generates a local audit context that will
> be used only for a standalone record and its auxiliary record(s).  The
> context is discarded immediately after the local associated records are
> produced.

We've had some good discussions on the list about why we can't reuse
the "in_syscall" field and need to add a "local" field, I think it
would be good to address that here in the commit description.

> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> Acked-by: Serge Hallyn <serge@hallyn.com>
> Acked-by: Neil Horman <nhorman@tuxdriver.com>
> Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  include/linux/audit.h |  8 ++++++++
>  kernel/audit.h        |  1 +
>  kernel/auditsc.c      | 33 ++++++++++++++++++++++++++++-----
>  3 files changed, 37 insertions(+), 5 deletions(-)

...

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 9e79645e5c0e..935eb3d2cde9 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -908,11 +908,13 @@ static inline void audit_free_aux(struct audit_context *context)
>         }
>  }
>
> -static inline struct audit_context *audit_alloc_context(enum audit_state state)
> +static inline struct audit_context *audit_alloc_context(enum audit_state state,
> +                                                       gfp_t gfpflags)
>  {
>         struct audit_context *context;
>
> -       context = kzalloc(sizeof(*context), GFP_KERNEL);
> +       /* We can be called in atomic context via audit_tg() */

At this point I think it's clear we need a respin so I'm not going to
preface all of my nitpick comments as such, although this definitely
would qualify ...

I don't believe audit_tg() doesn't exist yet, likely coming later in
this patchset, so please remove this comment as it doesn't make sense
in this context.

To be frank, don't re-add the comment later in the patchset either.
Comments like these tend to be fragile and don't really add any great
insight.  The audit_tg() function can, and most likely will, be
modified at some point in the future such that the comment above no
longer applies, and there is a reasonable chance that when it does the
above comment will not be updated.  Further, anyone modifying the
audit_alloc_context() is going to look at the callers (rather they
*should* look at the callers) and will notice the no-sleep
requirements.

> @@ -960,8 +963,27 @@ int audit_alloc_syscall(struct task_struct *tsk)
>         return 0;
>  }
>
> -static inline void audit_free_context(struct audit_context *context)
> +struct audit_context *audit_alloc_local(gfp_t gfpflags)
>  {
> +       struct audit_context *context = NULL;
> +
> +       context = audit_alloc_context(AUDIT_RECORD_CONTEXT, gfpflags);
> +       if (!context) {
> +               audit_log_lost("out of memory in audit_alloc_local");
> +               goto out;

You might as well just return NULL here, no need to jump and then return NULL.


> +       }
> +       context->serial = audit_serial();
> +       ktime_get_coarse_real_ts64(&context->ctime);
> +       context->local = true;
> +out:
> +       return context;
> +}
> +EXPORT_SYMBOL(audit_alloc_local);

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


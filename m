Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E601B2ADAE9
	for <lists+linux-audit@lfdr.de>; Tue, 10 Nov 2020 16:52:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605023546;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=crpYz77n/iGZUXc3M3JaTRhoyFZEl5kztqmZ5Dk7Ykw=;
	b=CVwIf6zMK6qqZiW2zfDCDzxVQGd5tjXaiBjk5uqMARU3MCek628NccTKNvuhQUqvpr8czi
	q1DW1IHpKXmA5o+QGsJ4ye/waQUgbxXijEUlpbtQJxvJvHJeW9AQqk0F27FVKxQji9hX8H
	+sysyocBh0flGursUI+watTESp7vfHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-NscL3P18MV25XloKeErPNA-1; Tue, 10 Nov 2020 10:52:19 -0500
X-MC-Unique: NscL3P18MV25XloKeErPNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD4A91018F6F;
	Tue, 10 Nov 2020 15:52:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C2A510013D0;
	Tue, 10 Nov 2020 15:52:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5FBB358100;
	Tue, 10 Nov 2020 15:52:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AAFNKd4023034 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 10 Nov 2020 10:23:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E315A3A3; Tue, 10 Nov 2020 15:23:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 819781972B;
	Tue, 10 Nov 2020 15:23:12 +0000 (UTC)
Date: Tue, 10 Nov 2020 10:23:10 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Alex Shi <alex.shi@linux.alibaba.com>
Subject: Re: [PATCH] audit: remove unused macros
Message-ID: <20201110152310.GB55411@madcap2.tricolour.ca>
References: <1604651482-9780-1-git-send-email-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1604651482-9780-1-git-send-email-alex.shi@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-11-06 16:31, Alex Shi wrote:
> Some unused macros could cause gcc warning:
> kernel/audit.c:68:0: warning: macro "AUDIT_UNINITIALIZED" is not used
> [-Wunused-macros]
> kernel/auditsc.c:104:0: warning: macro "AUDIT_AUX_IPCPERM" is not used
> [-Wunused-macros]
> kernel/auditsc.c:82:0: warning: macro "AUDITSC_INVALID" is not used
> [-Wunused-macros]
> 
> remove them to tame gcc.
> 
> Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
> Cc: Paul Moore <paul@paul-moore.com> 
> Cc: Eric Paris <eparis@redhat.com> 
> Cc: linux-audit@redhat.com 
> Cc: linux-kernel@vger.kernel.org 
> ---
>  kernel/audit.c   | 1 -
>  kernel/auditsc.c | 3 ---
>  2 files changed, 4 deletions(-)
> 
> diff --git a/kernel/audit.c b/kernel/audit.c
> index ac0aeaa99937..dfac1e0ca887 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -65,7 +65,6 @@
>  /* No auditing will take place until audit_initialized == AUDIT_INITIALIZED.
>   * (Initialization happens after skb_init is called.) */
>  #define AUDIT_DISABLED		-1
> -#define AUDIT_UNINITIALIZED	0
>  #define AUDIT_INITIALIZED	1
>  static int	audit_initialized;

This one is part of a set, so it feels like it should stay, but the code
is structured in such a way that it is not necessary.

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 183d79cc2e12..eeb4930d499f 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -80,7 +80,6 @@
>  #include "audit.h"
>  
>  /* flags stating the success for a syscall */
> -#define AUDITSC_INVALID 0
>  #define AUDITSC_SUCCESS 1
>  #define AUDITSC_FAILURE 2

Same here, but this one should really be fixed by using
AUDITSC_INVALID as the value assigned to context->return_valid in
__audit_free() to avoid using magic numbers.  Similarly, the compared
values in audit_filter_rules() under the AUDIT_EXIT and AUDIT_SUCCESS
cases should be "ctx->return_valid != AUDITSC_INVALID" rather than just
"ctx->return_valid".  Same in audit_log_exit().

> @@ -102,8 +101,6 @@ struct audit_aux_data {
>  	int			type;
>  };
>  
> -#define AUDIT_AUX_IPCPERM	0
> -

Hmmm, this one looks like it was orphaned 15 years ago a couple of
months after it was introduced due to this commit:
c04049939f88 Steve Grubb <sgrubb@redhat.com> 2005-05-13
    ("AUDIT: Add message types to audit records")

Introduced here:
8e633c3fb2a2 David Woodhouse <dwmw2@shinybook.infradead.org> 2005-03-01 
    ("Audit IPC object owner/permission changes.")

I agree, remove it.

>  /* Number of target pids per aux struct. */
>  #define AUDIT_AUX_PIDS	16
>  
> -- 
> 1.8.3.1
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


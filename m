Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 588662AF1D5
	for <lists+linux-audit@lfdr.de>; Wed, 11 Nov 2020 14:18:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605100709;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mVPReULArAOS+z5nj433kmhkl8xVb1eqbxmiQB0xcXI=;
	b=M05D18D8Tq6b73q66Be9gcbBfzMhoUeTOgTTWV5m4yQVjPSQEwy9AqaklhyIMD2KBBO2iN
	Wnml8OcgRrEgsiOZ3U+rhUOcN1w8VHpNX4vKR339eft9Rg7csCnn4Jheke4Rb/3x/RL29b
	/6whCwlJ4KFGJmmpFwi9bYsr/TXnkTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-T03_eO6xOKmNPUxpLWojOw-1; Wed, 11 Nov 2020 08:18:27 -0500
X-MC-Unique: T03_eO6xOKmNPUxpLWojOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEB4B100746C;
	Wed, 11 Nov 2020 13:18:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 372DF380;
	Wed, 11 Nov 2020 13:18:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A65B183D020;
	Wed, 11 Nov 2020 13:18:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ABDI9Vw006616 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 11 Nov 2020 08:18:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7DB901002391; Wed, 11 Nov 2020 13:18:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 517051002C2B;
	Wed, 11 Nov 2020 13:18:02 +0000 (UTC)
Date: Wed, 11 Nov 2020 08:17:59 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Alex Shi <alex.shi@linux.alibaba.com>
Subject: Re: [PATCH] audit: remove unused macros
Message-ID: <20201111131759.GD55072@madcap2.tricolour.ca>
References: <1604651482-9780-1-git-send-email-alex.shi@linux.alibaba.com>
	<20201110152310.GB55411@madcap2.tricolour.ca>
	<CAHC9VhQiQoZh8in+zoYa5hbTN_yL-=mt7nTQFN9GAyQZ+tz-Ww@mail.gmail.com>
	<20201111030359.GB55072@madcap2.tricolour.ca>
	<bae6d2fa-64d9-623b-6729-3827d745ed7a@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <bae6d2fa-64d9-623b-6729-3827d745ed7a@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-11-11 14:19, Alex Shi wrote:
> Thanks for comments!
> So here is the v2 according to your suggestion!
> 
> From 033425b6072ff4cee05d6bbffc97cd6a4c13166c Mon Sep 17 00:00:00 2001
> From: Alex Shi <alex.shi@linux.alibaba.com>
> Date: Fri, 6 Nov 2020 16:31:22 +0800
> Subject: [PATCH v2] kernel/audit: fix macros warning
> 
> Some unused macros could cause gcc warning:
> kernel/audit.c:68:0: warning: macro "AUDIT_UNINITIALIZED" is not used
> [-Wunused-macros]
> kernel/auditsc.c:104:0: warning: macro "AUDIT_AUX_IPCPERM" is not used
> [-Wunused-macros]
> kernel/auditsc.c:82:0: warning: macro "AUDITSC_INVALID" is not used
> [-Wunused-macros]
> 
> AUDIT_UNINITIALIZED and AUDITSC_INVALID are still meaningful and could
> be used in code.

"and should be incorporated"

> Just remove AUDIT_AUX_IPCPERM.
> 
> Thanks comments from Richard Guy Briggs and Paul Moore.
> 
> Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: Eric Paris <eparis@redhat.com>
> Cc: linux-audit@redhat.com
> Cc: linux-kernel@vger.kernel.org
> ---
>  kernel/audit.c   |  2 +-
>  kernel/auditsc.c | 10 ++++------
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/kernel/audit.c b/kernel/audit.c
> index ac0aeaa99937..e22f22bdc000 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -67,7 +67,7 @@
>  #define AUDIT_DISABLED		-1
>  #define AUDIT_UNINITIALIZED	0
>  #define AUDIT_INITIALIZED	1
> -static int	audit_initialized;
> +static int	audit_initialized = AUDIT_UNINITIALIZED;
>  
>  u32		audit_enabled = AUDIT_OFF;
>  bool		audit_ever_enabled = !!AUDIT_OFF;
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 183d79cc2e12..ea0ed81ddee0 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -102,8 +102,6 @@ struct audit_aux_data {
>  	int			type;
>  };
>  
> -#define AUDIT_AUX_IPCPERM	0
> -
>  /* Number of target pids per aux struct. */
>  #define AUDIT_AUX_PIDS	16
>  
> @@ -552,11 +550,11 @@ static int audit_filter_rules(struct task_struct *tsk,
>  			break;
>  
>  		case AUDIT_EXIT:
> -			if (ctx && ctx->return_valid)
> +			if (ctx && ctx->return_valid != AUDITSC_INVALID)
>  				result = audit_comparator(ctx->return_code, f->op, f->val);
>  			break;
>  		case AUDIT_SUCCESS:
> -			if (ctx && ctx->return_valid) {
> +			if (ctx && ctx->return_valid != AUDITSC_INVALID) {
>  				if (f->val)
>  					result = audit_comparator(ctx->return_valid, f->op, AUDITSC_SUCCESS);
>  				else
> @@ -1488,7 +1486,7 @@ static void audit_log_exit(void)
>  			 context->arch, context->major);
>  	if (context->personality != PER_LINUX)
>  		audit_log_format(ab, " per=%lx", context->personality);
> -	if (context->return_valid)
> +	if (context->return_valid != AUDITSC_INVALID)
>  		audit_log_format(ab, " success=%s exit=%ld",
>  				 (context->return_valid==AUDITSC_SUCCESS)?"yes":"no",
>  				 context->return_code);
> @@ -1625,7 +1623,7 @@ void __audit_free(struct task_struct *tsk)
>  	 * need to log via audit_log_exit().
>  	 */
>  	if (tsk == current && !context->dummy && context->in_syscall) {
> -		context->return_valid = 0;
> +		context->return_valid = AUDITSC_INVALID;
>  		context->return_code = 0;
>  
>  		audit_filter_syscall(tsk, context,

This all looks good, but I don't see the initialization of
context->return_valid in audit_alloc_context() that was mentioned for
completeness.

> -- 
> 1.8.3.1
> 

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


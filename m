Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 078E930476A
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 20:05:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611687903;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yWdwZL7/28S+6rSESEc1iJOeVNGCbY2WdE5+RNWlyzY=;
	b=SsTjn5ktLeGYc5LUC0EEY5UaOUsXEk56YujUAzO048LyGeV+y5CuT0t4Fc8d0/HUKjaJod
	ELTe8ns89oe6D+UHsTDo98YtMJzlK4yTjuEmzVztX3WOI6OwbuFU6U0bhSCUPZf20CvJwK
	dtEb42z/TZj/JeybKqRSHWg9eqDqOR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-FIk7jvu_NZ2L0tf8832GSg-1; Tue, 26 Jan 2021 14:05:00 -0500
X-MC-Unique: FIk7jvu_NZ2L0tf8832GSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01EB3B8101;
	Tue, 26 Jan 2021 19:04:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F09645F9A6;
	Tue, 26 Jan 2021 19:04:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47FA6180954D;
	Tue, 26 Jan 2021 19:04:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QJ4TgY013876 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 14:04:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F20A55D766; Tue, 26 Jan 2021 19:04:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CDA15D760;
	Tue, 26 Jan 2021 19:04:20 +0000 (UTC)
Date: Tue, 26 Jan 2021 14:04:18 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: menglong8.dong@gmail.com
Subject: Re: [PATCH] audit: Make audit_filter_syscall() return void
Message-ID: <20210126190418.GM2015948@madcap2.tricolour.ca>
References: <20210126131151.10418-1-yang.yang29@zte.com.cn>
MIME-Version: 1.0
In-Reply-To: <20210126131151.10418-1-yang.yang29@zte.com.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: Yang Yang <yang.yang29@zte.com.cn>, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2021-01-26 05:11, menglong8.dong@gmail.com wrote:
> From: Yang Yang <yang.yang29@zte.com.cn>
> 
> No invoker users the return value of audit_filter_syscall().
> So make it return void.

That was my oversight when ripping out the AUDIT_FILTER_ENTRY list:
5260ecc2e048 <rgb@redhat.com> 2018-02-14 ("audit: deprecate the AUDIT_FILTER_ENTRY filter")

Might as well also amend the function comment block to remove the
reference to syscall entry since that is no longer relevant.

> Signed-off-by: Yang Yang <yang.yang29@zte.com.cn>

Reviewed-by: Richard Guy Briggs <rgb@redhat.com>

> ---
>  kernel/auditsc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index ce8c9e2279ba..c8e16b9c0f21 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -804,7 +804,7 @@ static int audit_in_mask(const struct audit_krule *rule, unsigned long val)
>   * also not high enough that we already know we have to write an audit
>   * record (i.e., the state is AUDIT_SETUP_CONTEXT or AUDIT_BUILD_CONTEXT).
>   */
> -static enum audit_state audit_filter_syscall(struct task_struct *tsk,
> +static void audit_filter_syscall(struct task_struct *tsk,
>  					     struct audit_context *ctx,
>  					     struct list_head *list)
>  {
> @@ -812,7 +812,7 @@ static enum audit_state audit_filter_syscall(struct task_struct *tsk,
>  	enum audit_state state;
>  
>  	if (auditd_test_task(tsk))
> -		return AUDIT_DISABLED;
> +		return;
>  
>  	rcu_read_lock();
>  	list_for_each_entry_rcu(e, list, list) {
> @@ -821,11 +821,11 @@ static enum audit_state audit_filter_syscall(struct task_struct *tsk,
>  				       &state, false)) {
>  			rcu_read_unlock();
>  			ctx->current_state = state;
> -			return state;
> +			return;
>  		}
>  	}
>  	rcu_read_unlock();
> -	return AUDIT_BUILD_CONTEXT;
> +	return;
>  }
>  
>  /*
> -- 
> 2.25.1
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


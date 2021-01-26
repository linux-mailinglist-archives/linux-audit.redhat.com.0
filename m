Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C7F40304A06
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 21:23:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611692620;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oS0XSESY6AjbrKEcn9uMXt5rO9cKtLo4QE1IAMLnEV8=;
	b=LmS9fDSPWY9/J5IQlRMkvKaEl2LGDxJm3f1Z5QLjNw8l/g2y9ds4YFGomyOoSSrjAuo9Ym
	T5WQqVk0QC7+XPfPr8UJ6yfMqQsa+pbdMjfzFMLOUUoU5eewyIIgM9KWkFIOLc2wA+yu7G
	/HfzGApWPZLP4A/iyV8CqCDUIjlH/8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-Xg80Elb5NyqtS80Mp_jJ7g-1; Tue, 26 Jan 2021 15:23:39 -0500
X-MC-Unique: Xg80Elb5NyqtS80Mp_jJ7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 962D319251AB;
	Tue, 26 Jan 2021 20:23:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD56D60871;
	Tue, 26 Jan 2021 20:23:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A2B24A7C6;
	Tue, 26 Jan 2021 20:23:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QKN137030393 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 15:23:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 279085D9DE; Tue, 26 Jan 2021 20:23:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A0C35D9C2;
	Tue, 26 Jan 2021 20:22:47 +0000 (UTC)
Date: Tue, 26 Jan 2021 15:22:45 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v24 21/25] audit: add support for non-syscall auxiliary
	records
Message-ID: <20210126202245.GN1762914@madcap2.tricolour.ca>
References: <20210126164108.1958-1-casey@schaufler-ca.com>
	<20210126164108.1958-22-casey@schaufler-ca.com>
	<20210126184246.GM1762914@madcap2.tricolour.ca>
	<e9140e2a-a6ca-9d51-9db4-a0ec0dfd56cc@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <e9140e2a-a6ca-9d51-9db4-a0ec0dfd56cc@schaufler-ca.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org, jmorris@namei.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, sds@tycho.nsa.gov
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2021-01-26 10:58, Casey Schaufler wrote:
> On 1/26/2021 10:42 AM, Richard Guy Briggs wrote:
> > On 2021-01-26 08:41, Casey Schaufler wrote:
> >> Standalone audit records have the timestamp and serial number generated
> >> on the fly and as such are unique, making them standalone.  This new
> >> function audit_alloc_local() generates a local audit context that will
> >> be used only for a standalone record and its auxiliary record(s).  The
> >> context is discarded immediately after the local associated records are
> >> produced.
> >>
> >> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> >> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> >> Cc: linux-audit@redhat.com
> >> To: Richard Guy Briggs <rgb@redhat.com>
> > This has been minorly bothering me for several revisions...  Is there a
> > way for the development/authorship to be accurately reflected
> > if/when this patch is merged before the contid patch set?
> 
> I don't know the right way to do that because I had to pull
> some of what was in the original patch out. Any way you would
> like it done is fine with me.

Other than diff context, it appears to be identical to the patch in the
v9 contid patchset (with one tiny cut/paste below, I don't know how it
compiles...).  There are minor updates to bring it up to v11.

> >> ---
> >>  include/linux/audit.h |  8 ++++++++
> >>  kernel/audit.h        |  1 +
> >>  kernel/auditsc.c      | 33 ++++++++++++++++++++++++++++-----
> >>  3 files changed, 37 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/include/linux/audit.h b/include/linux/audit.h
> >> index 418a485af114..97cd7471e572 100644
> >> --- a/include/linux/audit.h
> >> +++ b/include/linux/audit.h
> >> @@ -289,6 +289,8 @@ static inline int audit_signal_info(int sig, struct task_struct *t)
> >>  				/* Public API */
> >>  extern int  audit_alloc(struct task_struct *task);
> >>  extern void __audit_free(struct task_struct *task);
> >> +extern struct audit_context *audit_alloc_local(gfp_t gfpflags);
> >> +extern void audit_free_context(struct audit_context *context);
> >>  extern void __audit_syscall_entry(int major, unsigned long a0, unsigned long a1,
> >>  				  unsigned long a2, unsigned long a3);
> >>  extern void __audit_syscall_exit(int ret_success, long ret_value);
> >> @@ -552,6 +554,12 @@ static inline void audit_log_nfcfg(const char *name, u8 af,
> >>  extern int audit_n_rules;
> >>  extern int audit_signals;
> >>  #else /* CONFIG_AUDITSYSCALL */
> >> ++static inline struct audit_context *audit_alloc_local(gfp_t gfpflags)

This extra "+" that ends up at the beginning of the line looks
unintentional and I'd have expected the compiler to complain.

> >> +{
> >> +	return NULL;
> >> +}
> >> +static inline void audit_free_context(struct audit_context *context)
> >> +{ }
> >>  static inline int audit_alloc(struct task_struct *task)
> >>  {
> >>  	return 0;
> >> diff --git a/kernel/audit.h b/kernel/audit.h
> >> index ce41886807bb..3f2285e1c6e0 100644
> >> --- a/kernel/audit.h
> >> +++ b/kernel/audit.h
> >> @@ -99,6 +99,7 @@ struct audit_proctitle {
> >>  struct audit_context {
> >>  	int		    dummy;	/* must be the first element */
> >>  	int		    in_syscall;	/* 1 if task is in a syscall */
> >> +	bool		    local;	/* local context needed */
> >>  	enum audit_state    state, current_state;
> >>  	unsigned int	    serial;     /* serial number for record */
> >>  	int		    major;      /* syscall number */
> >> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> >> index de2b2ecb3aea..479b3933d788 100644
> >> --- a/kernel/auditsc.c
> >> +++ b/kernel/auditsc.c
> >> @@ -927,11 +927,13 @@ static inline void audit_free_aux(struct audit_context *context)
> >>  	}
> >>  }
> >>  
> >> -static inline struct audit_context *audit_alloc_context(enum audit_state state)
> >> +static inline struct audit_context *audit_alloc_context(enum audit_state state,
> >> +							gfp_t gfpflags)
> >>  {
> >>  	struct audit_context *context;
> >>  
> >> -	context = kzalloc(sizeof(*context), GFP_KERNEL);
> >> +	/* We can be called in atomic context via audit_tg() */
> >> +	context = kzalloc(sizeof(*context), gfpflags);
> >>  	if (!context)
> >>  		return NULL;
> >>  	context->state = state;
> >> @@ -967,7 +969,8 @@ int audit_alloc(struct task_struct *tsk)
> >>  		return 0;
> >>  	}
> >>  
> >> -	if (!(context = audit_alloc_context(state))) {
> >> +	context = audit_alloc_context(state, GFP_KERNEL);
> >> +	if (!context) {
> >>  		kfree(key);
> >>  		audit_log_lost("out of memory in audit_alloc");
> >>  		return -ENOMEM;
> >> @@ -979,8 +982,27 @@ int audit_alloc(struct task_struct *tsk)
> >>  	return 0;
> >>  }
> >>  
> >> -static inline void audit_free_context(struct audit_context *context)
> >> +struct audit_context *audit_alloc_local(gfp_t gfpflags)
> >>  {
> >> +	struct audit_context *context = NULL;
> >> +
> >> +	context = audit_alloc_context(AUDIT_RECORD_CONTEXT, gfpflags);
> >> +	if (!context) {
> >> +		audit_log_lost("out of memory in audit_alloc_local");
> >> +		goto out;
> >> +	}
> >> +	context->serial = audit_serial();
> >> +	ktime_get_coarse_real_ts64(&context->ctime);
> >> +	context->local = true;
> >> +out:
> >> +	return context;
> >> +}
> >> +EXPORT_SYMBOL(audit_alloc_local);
> >> +
> >> +void audit_free_context(struct audit_context *context)
> >> +{
> >> +	if (!context)
> >> +		return;
> >>  	audit_free_module(context);
> >>  	audit_free_names(context);
> >>  	unroll_tree_refs(context, NULL, 0);
> >> @@ -991,6 +1013,7 @@ static inline void audit_free_context(struct audit_context *context)
> >>  	audit_proctitle_free(context);
> >>  	kfree(context);
> >>  }
> >> +EXPORT_SYMBOL(audit_free_context);
> >>  
> >>  static int audit_log_pid_context(struct audit_context *context, pid_t pid,
> >>  				 kuid_t auid, kuid_t uid,
> >> @@ -2214,7 +2237,7 @@ EXPORT_SYMBOL_GPL(__audit_inode_child);
> >>  int auditsc_get_stamp(struct audit_context *ctx,
> >>  		       struct timespec64 *t, unsigned int *serial)
> >>  {
> >> -	if (!ctx->in_syscall)
> >> +	if (!ctx->in_syscall && !ctx->local)
> >>  		return 0;
> >>  	if (!ctx->serial)
> >>  		ctx->serial = audit_serial();
> >> -- 
> >> 2.25.4
> >>
> > - RGB

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


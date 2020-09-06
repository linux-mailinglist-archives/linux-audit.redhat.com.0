Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id F0D5425EF24
	for <lists+linux-audit@lfdr.de>; Sun,  6 Sep 2020 18:33:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-mwJbLjP-Mu2fiprZbectBA-1; Sun, 06 Sep 2020 12:33:00 -0400
X-MC-Unique: mwJbLjP-Mu2fiprZbectBA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C75C610059AC;
	Sun,  6 Sep 2020 16:32:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1F7B7E191;
	Sun,  6 Sep 2020 16:32:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D3E2972FB;
	Sun,  6 Sep 2020 16:32:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 086GWQRW012767 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 6 Sep 2020 12:32:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CFB9B202450E; Sun,  6 Sep 2020 16:32:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C980B200A799
	for <linux-audit@redhat.com>; Sun,  6 Sep 2020 16:32:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B4F8185A78B
	for <linux-audit@redhat.com>; Sun,  6 Sep 2020 16:32:24 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-232-xtMiru-WOlCHejbWK9NKCA-1; Sun, 06 Sep 2020 12:32:22 -0400
X-MC-Unique: xtMiru-WOlCHejbWK9NKCA-1
Received: by mail-ed1-f68.google.com with SMTP id c8so10361094edv.5
	for <linux-audit@redhat.com>; Sun, 06 Sep 2020 09:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F8tC2QXpOtOzE45Xjl3tUVikGMUOC2Eduj5EJAiJGFs=;
	b=CMpUK9yRsSMOd4MDLtHU9HKsZ4BCtFnQZmc1cW7H4M6PBm/H65Srmwv8biJBSgO2HW
	kN8H+HAJHSqGcosZwhm6VY1MbTqxKVOcrxbD61hYcnlRgEVit/lHxDcHAbffFJ89DYCz
	zWOZAtw1IaJbq6J2LB+Ry3amS6msPwfJVc3+mu1YP7dzG0pG7YS2zrxlA+TBc0f28JfN
	gE/0AXmAtn4rmQTuUDfITD6iUwg24q+DeSc3arApSx5eo07+PDPlM6myhbShTw8H+TG+
	2deE7EAhrgJZiFVT4wFFcueKLudjAdsK2jkxG5S1w/bYKJlFo8lD/u1EI9jHDqnF+QMo
	SW4Q==
X-Gm-Message-State: AOAM532V9p7iuZ3t2WT1RocQHUMwFupmC45sH+9vDuFDbFZ3m6TAOvS9
	pL0oXVYS/V50p/kGAIQ1CYw0ikNpoNAMp7rhCYC2
X-Google-Smtp-Source: ABdhPJxA2P0MiIO4fTvXotn6GhscbUi8Qbr5zuEbipYxjJsWhM1nbn7UTn7R01spZPsVUiNmW6RUjNXznAyv95ea3/c=
X-Received: by 2002:aa7:de8f:: with SMTP id j15mr17517368edv.135.1599409940338;
	Sun, 06 Sep 2020 09:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-21-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-21-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 6 Sep 2020 12:32:09 -0400
Message-ID: <CAHC9VhThrFdTuy=+LWxBtUgtOsst6UpxK49V6DO6VSTh8zu9wA@mail.gmail.com>
Subject: Re: [PATCH v20 20/23] Audit: Add new record for multiple process LSM
	attributes
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, Stephen Smalley <sds@tycho.nsa.gov>
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
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2020 at 11:23 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Create a new audit record type to contain the subject information
> when there are multiple security modules that require such data.
> This record is linked with the same timestamp and serial number.
> The record is produced only in cases where there is more than one
> security module with a process "context".
>
> Before this change the only audit events that required multiple
> records were syscall events. Several non-syscall events include
> subject contexts, so the use of audit_context data has been expanded
> as necessary.
>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Cc: linux-audit@redhat.com
> ---
>  drivers/android/binder.c                |  2 +-
>  include/linux/audit.h                   | 13 +++-
>  include/linux/security.h                | 18 ++++-
>  include/net/netlabel.h                  |  2 +-
>  include/net/scm.h                       |  3 +-
>  include/net/xfrm.h                      |  4 +-
>  include/uapi/linux/audit.h              |  1 +
>  kernel/audit.c                          | 89 ++++++++++++++++++-------
>  kernel/auditfilter.c                    |  2 +-
>  kernel/auditsc.c                        | 87 ++++++++++++++++++++++--
>  net/ipv4/ip_sockglue.c                  |  2 +-
>  net/netfilter/nf_conntrack_netlink.c    |  4 +-
>  net/netfilter/nf_conntrack_standalone.c |  2 +-
>  net/netfilter/nfnetlink_queue.c         |  2 +-
>  net/netlabel/netlabel_unlabeled.c       | 16 ++---
>  net/netlabel/netlabel_user.c            | 12 ++--
>  net/netlabel/netlabel_user.h            |  6 +-
>  security/integrity/integrity_audit.c    |  2 +-
>  security/security.c                     | 73 +++++++++++++++-----
>  security/smack/smackfs.c                |  3 +-
>  20 files changed, 259 insertions(+), 84 deletions(-)

Regardless of the code, the audit folks generally ask for an example
of the new audit record in the commit description; it make it easier
for the people not familiar with the kernel to review the record
format/information.

I've also been requiring that a test is added to the audit test suite
for new features added to the kernel.  I recognize this is a big ask
for something like this, but it is something we have been doing for
several years now and I think the benefits far outweigh the costs.

* https://github.com/linux-audit/audit-testsuite

> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index ba1cd38d601b..fe027df0d9a8 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -186,7 +186,9 @@ extern void             audit_log_path_denied(int type,
>                                                   const char *operation);
>  extern void                audit_log_lost(const char *message);
>
> -extern int audit_log_task_context(struct audit_buffer *ab);
> +extern void audit_log_lsm(struct lsmblob *blob, bool exiting);
> +extern int audit_log_task_context(struct audit_buffer *ab,
> +                                 struct lsmblob *blob);

The audit functions tend to get abused, and this is mostly due to a
rather poor design, so I'd prefer to see audit_log_task_context()
remain with just a single argument: the audit buffer.  I believe this
covers the vast majority of the cases and should remain the preferred
option for callers.  This should help shrink the patch and focus it a
bit more.

For the handful of callers that do need to specify a separate task
context, you can create a __audit_log_task_context(ab, blob) that
allows the caller to specify the blob (and obviously you can write
audit_log_task_context() as a one line wrapper around this function).

> diff --git a/include/net/xfrm.h b/include/net/xfrm.h
> index 2737d24ec244..9e8cac6228b4 100644
> --- a/include/net/xfrm.h
> +++ b/include/net/xfrm.h
> @@ -675,11 +675,13 @@ static inline struct audit_buffer *xfrm_audit_start(const char *op)
>
>         if (audit_enabled == AUDIT_OFF)
>                 return NULL;
> +       audit_stamp_context(audit_context());
>         audit_buf = audit_log_start(audit_context(), GFP_ATOMIC,
>                                     AUDIT_MAC_IPSEC_EVENT);

Is audit_stamp_context() necessary here?  Generally if the first
argument to audit_log_start() is not NULL then you shouldn't need to
create a "local" audit context.

I wonder if you might be getting mixed up in testing by not having
audit properly enabled (see link below)?  Make sure you don't have any
audit disable rules loaded into the kernel, and you can even add
"audit=1" to the kernel command line.

https://github.com/linux-audit/audit-documentation/wiki/HOWTO-Fedora-Enable-Auditing

>         if (audit_buf == NULL)
>                 return NULL;
>         audit_log_format(audit_buf, "op=%s", op);
> +       audit_log_lsm(NULL, false);
>         return audit_buf;
>  }

...

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 594b42fc88ff..0e7831c9f321 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -1070,13 +1071,31 @@ static void audit_log_common_recv_msg(struct audit_context *context,
>                 return;
>         audit_log_format(*ab, "pid=%d uid=%u ", pid, uid);
>         audit_log_session_info(*ab);
> -       audit_log_task_context(*ab);
> +       audit_log_task_context(*ab, NULL);
>  }
>
>  static inline void audit_log_user_recv_msg(struct audit_buffer **ab,
>                                            u16 msg_type)
>  {
> -       audit_log_common_recv_msg(NULL, ab, msg_type);
> +       struct audit_context *context;
> +
> +       if (!lsm_multiple_contexts()) {
> +               audit_log_common_recv_msg(NULL, ab, msg_type);
> +               return;
> +       }
> +
> +       context = audit_context();
> +       if (context) {
> +               if (!context->in_syscall)
> +                       audit_stamp_context(context);
> +               audit_log_common_recv_msg(context, ab, msg_type);
> +               return;
> +       }
> +
> +       audit_alloc(current);
> +       context = audit_context();
> +
> +       audit_log_common_recv_msg(context, ab, msg_type);
>  }

Hmm.  Take a look at Richard's patch for adding the audit container ID
record to audit user records, it should give you a better idea of how
to approach this.  The above changes in audit_log_user_recv_msg() are
not really what we want.

https://lore.kernel.org/linux-audit/4a5019ed3cfab416aeb6549b791ac6d8cc9fb8b7.1593198710.git.rgb@redhat.com

> @@ -1869,6 +1889,10 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
>         }
>
>         audit_get_stamp(ab->ctx, &t, &serial);
> +       if (type == AUDIT_MAC_TASK_CONTEXTS && ab->ctx->serial == 0) {
> +               audit_stamp_context(ab->ctx);
> +               audit_get_stamp(ab->ctx, &t, &serial);
> +       }
>         audit_log_format(ab, "audit(%llu.%03lu:%u): ",
>                          (unsigned long long)t.tv_sec, t.tv_nsec/1000000, serial);

Can you walk me through what you are trying to do here?  This doesn't
seem right to me, but I'm sure you put it here for a reason.

> @@ -2126,30 +2150,47 @@ void audit_log_key(struct audit_buffer *ab, char *key)
>                 audit_log_format(ab, "(null)");
>  }
>
> -int audit_log_task_context(struct audit_buffer *ab)
> +int audit_log_task_context(struct audit_buffer *ab, struct lsmblob *blob)
>  {
> +       int i;
>         int error;
> -       struct lsmblob blob;
> -       struct lsmcontext context;
> +       struct lsmblob localblob;
> +       struct lsmcontext lsmdata;
>
> -       security_task_getsecid(current, &blob);
> -       if (!lsmblob_is_set(&blob))
> +       /*
> +        * If there is more than one security module that has a
> +        * subject "context" it's necessary to put the subject data
> +        * into a separate record to maintain compatibility.
> +        */
> +       if (lsm_multiple_contexts()) {
> +               audit_log_format(ab, " subj=?");
>                 return 0;
> +       }
>
> -       error = security_secid_to_secctx(&blob, &context);
> -       if (error) {
> -               if (error != -EINVAL)
> -                       goto error_path;
> -               return 0;
> +       if (blob == NULL) {
> +               security_task_getsecid(current, &localblob);

Why is localblob necessary?  You know blob is NULL here, just use it
directly and skip the assignment later in this code block.

> +               if (!lsmblob_is_set(&localblob)) {
> +                       audit_log_format(ab, " subj=?");
> +                       return 0;
> +               }
> +               blob = &localblob;
>         }
>
> -       audit_log_format(ab, " subj=%s", context.context);
> -       security_release_secctx(&context);
> -       return 0;
> +       for (i = 0; i < LSMBLOB_ENTRIES; i++) {
> +               if (blob->secid[i] == 0)
> +                       continue;
> +               error = security_secid_to_secctx(blob, &lsmdata, i);
> +               if (error && error != -EINVAL) {
> +                       audit_panic("error in audit_log_task_context");
> +                       return error;
> +               }
>
> -error_path:
> -       audit_panic("error in audit_log_task_context");
> -       return error;
> +               audit_log_format(ab, " subj=%s", lsmdata.context);
> +               security_release_secctx(&lsmdata);
> +               break;
> +       }
> +
> +       return 0;
>  }
>  EXPORT_SYMBOL(audit_log_task_context);

...

> @@ -2279,6 +2320,7 @@ static void audit_log_set_loginuid(kuid_t koldloginuid, kuid_t kloginuid,
>         if (!audit_enabled)
>                 return;
>
> +       audit_stamp_context(audit_context());
>         ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_LOGIN);
>         if (!ab)
>                 return;

Similar to above, I'm not sure audit_stamp_context() is what we want here.

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 4af5861bcb9a..cf5dbd0e3a3d 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -962,10 +962,12 @@ int audit_alloc(struct task_struct *tsk)
>                 return 0; /* Return if not auditing. */
>
>         state = audit_filter_task(tsk, &key);
> -       if (state == AUDIT_DISABLED) {
> +       if (!lsm_multiple_contexts() && state == AUDIT_DISABLED) {
>                 clear_tsk_thread_flag(tsk, TIF_SYSCALL_AUDIT);
>                 return 0;
>         }
> +       if (state == AUDIT_DISABLED)
> +               clear_tsk_thread_flag(tsk, TIF_SYSCALL_AUDIT);

Hmmm.  I think we've hit critical mass on the amount of hacks in the
audit subsystem for this code ... Let's back up a bit and start with
some basic requirements (correct me if I'm wrong on any of these):

1. This patch only deals with LSM process/task/subject contexts.
2. Multiple LSMs may, or may not exist; audit logs and behavior should
remain unchanged in the single LSM case.
3. If multiple LSMs are present, the subject field in existing records
should take the form of "subj=?" and a new audit record is created
containing fields of the format "subj_<LSM>=<context>".

Assuming all of that is true, why not simply keep the basic logic in
audit_log_task_context(), but also stash a lsmblob struct in the
audit_context for later use by audit_log_exit()?  Stashing of the
lsmblob would really only be necessary to handle the few cases where
the current task is not the proper subject.

> @@ -1483,6 +1486,52 @@ static void audit_log_proctitle(void)
>         audit_log_end(ab);
>  }
>
> +void audit_log_lsm(struct lsmblob *blob, bool exiting)
> +{
> +       struct audit_context *context = audit_context();
> +       struct lsmcontext lsmdata;
> +       struct audit_buffer *ab;
> +       struct lsmblob localblob;
> +       bool sep = false;
> +       int error;
> +       int i;
> +
> +       if (!lsm_multiple_contexts())
> +               return;
> +
> +       if (context && context->in_syscall && !exiting)
> +               return;

I think the "!lsm_multiple_contexts()" and "!exiting" checks fit well
with my comments about generating the AUDIT_MAC_TASK_CONTEXT record in
audit_log_exit.  This code needs a rethink.

> +       ab = audit_log_start(context, GFP_ATOMIC, AUDIT_MAC_TASK_CONTEXTS);
> +       if (!ab)
> +               return; /* audit_panic or being filtered */
> +
> +       if (blob == NULL) {
> +               security_task_getsecid(current, &localblob);
> +               if (!lsmblob_is_set(&localblob))
> +                       return;
> +               blob = &localblob;
> +       }
> +
> +       for (i = 0; i < LSMBLOB_ENTRIES; i++) {
> +               if (blob->secid[i] == 0)
> +                       continue;
> +               error = security_secid_to_secctx(blob, &lsmdata, i);
> +               if (error && error != -EINVAL) {
> +                       audit_panic("error in audit_log_lsm");
> +                       return; fits well with a
> +               }
> +
> +               audit_log_format(ab, "%ssubj_%s=%s", sep ? " " : "",
> +                                security_lsm_slot_name(i), lsmdata.context);
> +               sep = true;
> +
> +               security_release_secctx(&lsmdata);
> +       }
> +
> +       audit_log_end(ab);
> +}

...

> @@ -2217,6 +2267,21 @@ void __audit_inode_child(struct inode *parent,
>  }
>  EXPORT_SYMBOL_GPL(__audit_inode_child);
>
> +/**
> + * audit_stamp_context - set the timestamp+serial in an audit context
> + * @ctx: audit_context to set
> + */
> +void audit_stamp_context(struct audit_context *ctx)
> +{
> +       /* ctx will be NULL unless lsm_multiple_contexts() is true */
> +       if (!ctx)
> +               return;
> +
> +       ktime_get_coarse_real_ts64(&ctx->ctime);
> +       ctx->serial = audit_serial();
> +       ctx->current_state = AUDIT_BUILD_CONTEXT;
> +}

Based on previous discussions and what I *think* you are trying to do
in this patchset, I believe Richard's audit_alloc_local()
implementation (link below) is a better and cleaner solution.  His
latest revisions needs some minor tweaks (see my feeback), but I think
you could probably work with him to pull that single patch into your
patchset.

To be clear, I'm talking about just that one patch; I'm a firm
believer that tying the LSM stacking and audit container ID patches
beyond this would be a disaster.  I can deal with any merge conflicts
that arise whenever the different patchsets land.

* Richard's audit_alloc_local() patch (07/13 of the latest audit
container ID patchset)
https://lore.kernel.org/linux-audit/21e6c4e1ac179c8dcf35803e603899ccfc69300a.1593198710.git.rgb@redhat.com

> diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
> index 951ba0639d20..4e9064754b5f 100644
> --- a/net/netlabel/netlabel_user.c
> +++ b/net/netlabel/netlabel_user.c
> @@ -84,12 +84,12 @@ struct audit_buffer *netlbl_audit_start_common(int type,
>                                                struct netlbl_audit *audit_info)
>  {
>         struct audit_buffer *audit_buf;
> -       struct lsmcontext context;
> -       struct lsmblob blob;
>
>         if (audit_enabled == AUDIT_OFF)
>                 return NULL;
>
> +       audit_stamp_context(audit_context());

Another one.

>         audit_buf = audit_log_start(audit_context(), GFP_ATOMIC, type);
>         if (audit_buf == NULL)
>                 return NULL;

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


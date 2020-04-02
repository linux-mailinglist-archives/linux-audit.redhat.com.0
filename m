Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6E019C2A2
	for <lists+linux-audit@lfdr.de>; Thu,  2 Apr 2020 15:29:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585834139;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=562Th8+kpjuXcWS1TtxhHcJGpuSt/JhxPCoxIA/qMiA=;
	b=BAQPQTRLOZkLlEiHDReck8/tsKLt7qJNM5Tz1YaXX2nnaDg74ckS8FMUhNkD6fIEG8Mx5u
	xe+/GTS4efnKSrekyREuGOzRXbZDWfKkQUG9o529uHyQdoP0FhvIHd5G7DfgfqBlyPvcL3
	XayiydIH57uvZCh0htTCi+Fzc+rN1Cc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-5LXZPZYtOCG9aKK_ErH42Q-1; Thu, 02 Apr 2020 09:28:57 -0400
X-MC-Unique: 5LXZPZYtOCG9aKK_ErH42Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D016E8017FB;
	Thu,  2 Apr 2020 13:28:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D2595C57B;
	Thu,  2 Apr 2020 13:28:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F184944D2;
	Thu,  2 Apr 2020 13:28:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 032CusPs025436 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 2 Apr 2020 08:56:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9A6FB1005E36; Thu,  2 Apr 2020 12:56:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96A2A1005E35
	for <linux-audit@redhat.com>; Thu,  2 Apr 2020 12:56:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FAAD8007A4
	for <linux-audit@redhat.com>; Thu,  2 Apr 2020 12:56:52 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-369-XdLyHv8tNCG819BHA--aJw-1; Thu, 02 Apr 2020 08:56:49 -0400
X-MC-Unique: XdLyHv8tNCG819BHA--aJw-1
Received: by mail-ed1-f67.google.com with SMTP id cf14so3899795edb.13
	for <linux-audit@redhat.com>; Thu, 02 Apr 2020 05:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Kqap/nho/VO53wl1Vvcx8z2BRfU3VDatECjPDe+uq9o=;
	b=XXLXmVY7fc/5SqQlYp/z2PPJxM8MRY7w3lcb0X9hJ4hzBAfvml+FtA6n3FTellhAMj
	RHMNNFjgkYRIcCTNJ5AHK0QKl7wOgq2P7TWpAsUFsJ3KUJHd6Zac3VYuLAs6wQczeqz7
	UmSzrUTqH/LycAAh3FuJvUsoUmSIji7jsWM0wxcq8S7j3hIbQR9GNJwyZFv2ZzbYa8O/
	qFChajd+qyhs2y8C3YcuQNnKma5Wkqky4PzBWkF/QTRhk/7JFwbrA5WlF0jJm8TdZwyn
	vribe2GeGQW5UykeqfK9ltq3YxMmFuk5U6rfeL6UBCE3smQY5HD3jVqXm7/mjy+fVXyK
	FABA==
X-Gm-Message-State: AGi0PuYk4SZ/HlRPEbiBqmnjYgp1Mz2SdnoIKaXSqnqQsWFaIZ80Yp5a
	A5u6Y4RWel7ObGhMAAl0Wye+e+QGcV5uQmVeDlfn
X-Google-Smtp-Source: APiQypLVYVm4b4T8DRqBziIjHudBd14857uA+siaIatX8UbnCBqo/2HtxpahLb9nbo8P4Et/bV6FLvts7uscuxu9uyA=
X-Received: by 2002:a17:906:583:: with SMTP id 3mr3007633ejn.308.1585832207648;
	Thu, 02 Apr 2020 05:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200402055640.6677-1-frextrite@gmail.com>
	<20200402055640.6677-3-frextrite@gmail.com>
In-Reply-To: <20200402055640.6677-3-frextrite@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 2 Apr 2020 08:56:36 -0400
Message-ID: <CAHC9VhTUKepKiGZgAaWDADyTPnnM5unbM65T7jXZ3p8MFTNUuQ@mail.gmail.com>
Subject: Re: [PATCH 3/3 RESEND] auditsc: Do not use RCU primitive to read from
	cred pointer
To: Amol Grover <frextrite@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 032CusPs025436
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 02 Apr 2020 09:28:10 -0400
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	David Howells <dhowells@redhat.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	James Morris <jamorris@linux.microsoft.com>,
	Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
	Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Paul E . McKenney" <paulmck@kernel.org>, Jann Horn <jannh@google.com>,
	Steven Rostedt <rostedt@goodmis.org>, Shakeel Butt <shakeelb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, linux-kernel@vger.kernel.org,
	linux-audit@redhat.com, "Eric W . Biederman" <ebiederm@xmission.com>,
	Andrew Morton <akpm@linux-foundation.org>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 2, 2020 at 1:57 AM Amol Grover <frextrite@gmail.com> wrote:
> task_struct::cred is only used task-synchronously and does
> not require any RCU locks, hence, rcu_dereference_check is
> not required to read from it.
>
> Suggested-by: Jann Horn <jannh@google.com>
> Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>  kernel/auditsc.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)

This is the exact same patch I ACK'd back in February, yes?

https://lore.kernel.org/linux-audit/CAHC9VhQCbg1V290bYEZM+izDPRpr=XYXakohnDaMphkBBFgUaA@mail.gmail.com

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 4effe01ebbe2..d3510513cdd1 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -430,24 +430,19 @@ static int audit_field_compare(struct task_struct *tsk,
>  /* Determine if any context name data matches a rule's watch data */
>  /* Compare a task_struct with an audit_rule.  Return 1 on match, 0
>   * otherwise.
> - *
> - * If task_creation is true, this is an explicit indication that we are
> - * filtering a task rule at task creation time.  This and tsk == current are
> - * the only situations where tsk->cred may be accessed without an rcu read lock.
>   */
>  static int audit_filter_rules(struct task_struct *tsk,
>                               struct audit_krule *rule,
>                               struct audit_context *ctx,
>                               struct audit_names *name,
> -                             enum audit_state *state,
> -                             bool task_creation)
> +                             enum audit_state *state)
>  {
>         const struct cred *cred;
>         int i, need_sid = 1;
>         u32 sid;
>         unsigned int sessionid;
>
> -       cred = rcu_dereference_check(tsk->cred, tsk == current || task_creation);
> +       cred = tsk->cred;
>
>         for (i = 0; i < rule->field_count; i++) {
>                 struct audit_field *f = &rule->fields[i];
> @@ -745,7 +740,7 @@ static enum audit_state audit_filter_task(struct task_struct *tsk, char **key)
>         rcu_read_lock();
>         list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_TASK], list) {
>                 if (audit_filter_rules(tsk, &e->rule, NULL, NULL,
> -                                      &state, true)) {
> +                                      &state)) {
>                         if (state == AUDIT_RECORD_CONTEXT)
>                                 *key = kstrdup(e->rule.filterkey, GFP_ATOMIC);
>                         rcu_read_unlock();
> @@ -791,7 +786,7 @@ static enum audit_state audit_filter_syscall(struct task_struct *tsk,
>         list_for_each_entry_rcu(e, list, list) {
>                 if (audit_in_mask(&e->rule, ctx->major) &&
>                     audit_filter_rules(tsk, &e->rule, ctx, NULL,
> -                                      &state, false)) {
> +                                      &state)) {
>                         rcu_read_unlock();
>                         ctx->current_state = state;
>                         return state;
> @@ -815,7 +810,7 @@ static int audit_filter_inode_name(struct task_struct *tsk,
>
>         list_for_each_entry_rcu(e, list, list) {
>                 if (audit_in_mask(&e->rule, ctx->major) &&
> -                   audit_filter_rules(tsk, &e->rule, ctx, n, &state, false)) {
> +                   audit_filter_rules(tsk, &e->rule, ctx, n, &state)) {
>                         ctx->current_state = state;
>                         return 1;
>                 }
> --
> 2.24.1

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


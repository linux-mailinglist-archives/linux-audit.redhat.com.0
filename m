Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 59302159320
	for <lists+linux-audit@lfdr.de>; Tue, 11 Feb 2020 16:26:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581434810;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UNhkD4CW0IQ8tC/tzO7v/np/otMmwySem7skoIyN2zo=;
	b=bm7WWeWWKpSGlvKPOY4Rnjp0Yg5cUbjM+pYACJ9RuO9nB30+1N81yUG6kwxB7M09IVEvSu
	udA/ofrWdhbDFPPcQtmAQxPwiccJuAFJde8UeKm75/O+SFie8HikskyfHRiRlaXC3suSBQ
	MlMkPyoW4s0zLhQretVShNJ6ezXpMSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-GnV0HnwANlmLn3fsYIoYWA-1; Tue, 11 Feb 2020 10:26:48 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 566711005502;
	Tue, 11 Feb 2020 15:26:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C78095C1B2;
	Tue, 11 Feb 2020 15:26:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC4028B2A1;
	Tue, 11 Feb 2020 15:26:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01BFJPgq005438 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 10:19:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0A5FE206320C; Tue, 11 Feb 2020 15:19:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05A362026D67
	for <linux-audit@redhat.com>; Tue, 11 Feb 2020 15:19:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9EE88EB47F
	for <linux-audit@redhat.com>; Tue, 11 Feb 2020 15:19:22 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-253-XaXFN6taMSOnylPJfG1e2g-1; Tue, 11 Feb 2020 10:19:17 -0500
Received: by mail-ed1-f66.google.com with SMTP id s3so77373edy.4
	for <linux-audit@redhat.com>; Tue, 11 Feb 2020 07:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=16SLjLXO8g+qbOwDjgyf7x2FsF2pVisv4jB570F5ilM=;
	b=EPexvnC64FCI5YGcS9WI0woN1aiAfuAOX/LZ7MGzRge33KyvRuPBCwuSjaYzVEVhFF
	180qNHZ+gqraY5jBNxkmUFg7s6mQkF7AfwSowIfuNNEwQ/x7oH5xT1e5gs49Phci6o/v
	RZqvDS2duSf7whMWJPqADCdwf17hVjWX++6Sx4wjCTq/g9r9NlUSJXSF2Ig6ShSwRaoM
	jYaSOOE0sC2RPqnbfJ5BGm6FwIFwCoGHX2IQOBHL3vBzTgKN1ct6f65beEhjVmabxidG
	VeGMbQ184lhg8/jOdi8yIYHULI4ysmyGq3rKBrfI6AT/Xh13h2ZRvMooD/q9V+HtoH0Y
	r5tg==
X-Gm-Message-State: APjAAAUEY+nd96fVwY+IF564Hlcen/KdoRNsYVKcl4HknRMAzrcKPSFu
	m0wkY5v6hKzNqZs3oSMJrwhYJrDEc6LAmQABvoEW
X-Google-Smtp-Source: APXvYqzvp0A3Md5np85OTOmVafrLccWiHt/aia4W8UTcrgVN+vogKxSKhOx0HDUUmxQaBGGAeCjSoxcBxitiPjBXBS8=
X-Received: by 2002:a05:6402:61a:: with SMTP id
	n26mr5926242edv.135.1581434355583; 
	Tue, 11 Feb 2020 07:19:15 -0800 (PST)
MIME-Version: 1.0
References: <20200207180504.4200-1-frextrite@gmail.com>
	<20200207180504.4200-3-frextrite@gmail.com>
In-Reply-To: <20200207180504.4200-3-frextrite@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 11 Feb 2020 10:19:04 -0500
Message-ID: <CAHC9VhQCbg1V290bYEZM+izDPRpr=XYXakohnDaMphkBBFgUaA@mail.gmail.com>
Subject: Re: [PATCH 3/3] auditsc: Do not use RCU primitive to read from cred
	pointer
To: Amol Grover <frextrite@gmail.com>
X-MC-Unique: XaXFN6taMSOnylPJfG1e2g-1
X-MC-Unique: GnV0HnwANlmLn3fsYIoYWA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01BFJPgq005438
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 11 Feb 2020 10:24:10 -0500
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

On Fri, Feb 7, 2020 at 1:08 PM Amol Grover <frextrite@gmail.com> wrote:
>
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

Considering the other changes in this patchset this change seems
reasonable to me.  I'm assuming you were intending this patchset to go
in via some tree other than audit?

Acked-by: Paul Moore <paul@paul-moore.com>

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
>


-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


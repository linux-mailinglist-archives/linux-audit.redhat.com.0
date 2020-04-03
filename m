Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 841C119DEB7
	for <lists+linux-audit@lfdr.de>; Fri,  3 Apr 2020 21:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585943102;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W2w2zX0DJUJczAjM4kn567YuGzlWqRC5ZUjizdR8no0=;
	b=GK1Zg3TNo8/xfkxcgzdTVX/m40TpkyYvmxjHSzGD4pPjG3keRB7Sw6cjqSeP9J/DIEGY9f
	qF+z1s4gm+qYA2n5LDV5seiY89HFJvb1Qhx2LkH96OfO4cfQrnLSzRbIHwONfBoUPzXVE7
	jbeD8W+VPSgGQqWmcEBTf9AuuxXh3to=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-qNZI_Dd2PkqrO1Z9kcSBzQ-1; Fri, 03 Apr 2020 15:45:00 -0400
X-MC-Unique: qNZI_Dd2PkqrO1Z9kcSBzQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E9B4107ACCD;
	Fri,  3 Apr 2020 19:44:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 081705C28F;
	Fri,  3 Apr 2020 19:44:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D3E6618089CD;
	Fri,  3 Apr 2020 19:44:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0337uZJD000417 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 03:56:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 93C692028CD3; Fri,  3 Apr 2020 07:56:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E7B62028DCC
	for <linux-audit@redhat.com>; Fri,  3 Apr 2020 07:56:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1FE08FF67A
	for <linux-audit@redhat.com>; Fri,  3 Apr 2020 07:56:32 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-118-t4CEMMnKMr-Jo3medvwe8A-1; Fri, 03 Apr 2020 03:56:24 -0400
X-MC-Unique: t4CEMMnKMr-Jo3medvwe8A-1
Received: by mail-pg1-f194.google.com with SMTP id k5so3156879pga.2;
	Fri, 03 Apr 2020 00:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=jGFgJcnAZcYkOmTi2e6KUvl6de/EYQat/43QjCkuwX0=;
	b=LvzgxmlVRbKZegVtTig1slfve2qb8AmtjPJYeH2ecA9ANngt12G24JITALtl6hpHVw
	Ds9HNSfcbgW6BaV7wRe15mQqM042KoFJX8W5AMHxZAwFx/B7kuEoogGdI0LlnJhLzoc/
	YpkB1R9IO+DCzDE8OOPC2aVa10u4FrIjBB9xb1Zw5HM2nSbqHac18pJU8Nzupxcv4CaA
	L3NU8rHpUfpQ6/zsKvOiCJSZyqZZP51l8LEfaijmsHM7wUjzVrQHVBXcCQkaesv4Jdd4
	YfhiXAVrGtzUigAXw6hNlOkcDC71gld68s0lZuFZgOk/pKltF47428DmBWVjvsFRMOMh
	X86A==
X-Gm-Message-State: AGi0PubQTFIsobMri6feEygn62KPPY3kLPTDfsUz25BMcI0vgeJu1ju2
	r5y2oW9xATsHgQEmS8gL9eQ=
X-Google-Smtp-Source: APiQypKtNPH46VRnJiamU928TrLfF1ef1udk+bsqM/kxdW3Cx6y1GHNcPLh23zVq5txnbater8/vkQ==
X-Received: by 2002:aa7:999e:: with SMTP id k30mr7018349pfh.235.1585900582356; 
	Fri, 03 Apr 2020 00:56:22 -0700 (PDT)
Received: from workstation-portable ([103.87.56.98])
	by smtp.gmail.com with ESMTPSA id
	g75sm5146054pje.37.2020.04.03.00.56.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 03 Apr 2020 00:56:21 -0700 (PDT)
Date: Fri, 3 Apr 2020 13:26:13 +0530
From: Amol Grover <frextrite@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH 3/3 RESEND] auditsc: Do not use RCU primitive to read
	from cred pointer
Message-ID: <20200403075613.GA2788@workstation-portable>
References: <20200402055640.6677-1-frextrite@gmail.com>
	<20200402055640.6677-3-frextrite@gmail.com>
	<CAHC9VhTUKepKiGZgAaWDADyTPnnM5unbM65T7jXZ3p8MFTNUuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTUKepKiGZgAaWDADyTPnnM5unbM65T7jXZ3p8MFTNUuQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0337uZJD000417
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 03 Apr 2020 15:44:31 -0400
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
Content-Disposition: inline

On Thu, Apr 02, 2020 at 08:56:36AM -0400, Paul Moore wrote:
> On Thu, Apr 2, 2020 at 1:57 AM Amol Grover <frextrite@gmail.com> wrote:
> > task_struct::cred is only used task-synchronously and does
> > not require any RCU locks, hence, rcu_dereference_check is
> > not required to read from it.
> >
> > Suggested-by: Jann Horn <jannh@google.com>
> > Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > ---
> >  kernel/auditsc.c | 15 +++++----------
> >  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> This is the exact same patch I ACK'd back in February, yes?
> 
> https://lore.kernel.org/linux-audit/CAHC9VhQCbg1V290bYEZM+izDPRpr=XYXakohnDaMphkBBFgUaA@mail.gmail.com
> 

Hi Paul,

That's correct. I've resend the series out of the fear that the first 2
patches might've gotten lost as it's been almost a month since I last
sent them. Could you please ack this again, and if you don't mind could
you please go through the other 2 patches and ack them aswell?

Thanks
Amol

> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index 4effe01ebbe2..d3510513cdd1 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -430,24 +430,19 @@ static int audit_field_compare(struct task_struct *tsk,
> >  /* Determine if any context name data matches a rule's watch data */
> >  /* Compare a task_struct with an audit_rule.  Return 1 on match, 0
> >   * otherwise.
> > - *
> > - * If task_creation is true, this is an explicit indication that we are
> > - * filtering a task rule at task creation time.  This and tsk == current are
> > - * the only situations where tsk->cred may be accessed without an rcu read lock.
> >   */
> >  static int audit_filter_rules(struct task_struct *tsk,
> >                               struct audit_krule *rule,
> >                               struct audit_context *ctx,
> >                               struct audit_names *name,
> > -                             enum audit_state *state,
> > -                             bool task_creation)
> > +                             enum audit_state *state)
> >  {
> >         const struct cred *cred;
> >         int i, need_sid = 1;
> >         u32 sid;
> >         unsigned int sessionid;
> >
> > -       cred = rcu_dereference_check(tsk->cred, tsk == current || task_creation);
> > +       cred = tsk->cred;
> >
> >         for (i = 0; i < rule->field_count; i++) {
> >                 struct audit_field *f = &rule->fields[i];
> > @@ -745,7 +740,7 @@ static enum audit_state audit_filter_task(struct task_struct *tsk, char **key)
> >         rcu_read_lock();
> >         list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_TASK], list) {
> >                 if (audit_filter_rules(tsk, &e->rule, NULL, NULL,
> > -                                      &state, true)) {
> > +                                      &state)) {
> >                         if (state == AUDIT_RECORD_CONTEXT)
> >                                 *key = kstrdup(e->rule.filterkey, GFP_ATOMIC);
> >                         rcu_read_unlock();
> > @@ -791,7 +786,7 @@ static enum audit_state audit_filter_syscall(struct task_struct *tsk,
> >         list_for_each_entry_rcu(e, list, list) {
> >                 if (audit_in_mask(&e->rule, ctx->major) &&
> >                     audit_filter_rules(tsk, &e->rule, ctx, NULL,
> > -                                      &state, false)) {
> > +                                      &state)) {
> >                         rcu_read_unlock();
> >                         ctx->current_state = state;
> >                         return state;
> > @@ -815,7 +810,7 @@ static int audit_filter_inode_name(struct task_struct *tsk,
> >
> >         list_for_each_entry_rcu(e, list, list) {
> >                 if (audit_in_mask(&e->rule, ctx->major) &&
> > -                   audit_filter_rules(tsk, &e->rule, ctx, n, &state, false)) {
> > +                   audit_filter_rules(tsk, &e->rule, ctx, n, &state)) {
> >                         ctx->current_state = state;
> >                         return 1;
> >                 }
> > --
> > 2.24.1
> 
> -- 
> paul moore
> www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB5015BF2A
	for <lists+linux-audit@lfdr.de>; Thu, 13 Feb 2020 14:23:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581600215;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T786iLpMUohzOKUvFWtGbUaQkV1XC6L20VH2UCxy4mg=;
	b=JrsUXFlRySWjQnbB948NnVffeGpY3P7nt71pOYhKXxJ9nmzUkD5GBc0Sz38o30hMjtgxuh
	BzknQfLxO6XeTk8OuOLYgfRV46hl0fP5bw1UKFHFCGmRIn+VGFyQrwzTu4ajBk8aTM4su1
	UIRZiuyfaScdTrB2UCAw48NiutuZGp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-MMpjnvjuN1mQN6JGoNCc9g-1; Thu, 13 Feb 2020 08:23:32 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4BC0477;
	Thu, 13 Feb 2020 13:23:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C56018AC27;
	Thu, 13 Feb 2020 13:23:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6745D182B00F;
	Thu, 13 Feb 2020 13:23:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01D8C1RM018893 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 03:12:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 660612166B2B; Thu, 13 Feb 2020 08:12:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61EE92166B2A
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 08:11:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A379811AAE
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 08:11:59 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-342-NgqGxHK3OIe14Ea-F05K9A-1; Thu, 13 Feb 2020 03:11:55 -0500
Received: by mail-pj1-f68.google.com with SMTP id fa20so2046309pjb.1;
	Thu, 13 Feb 2020 00:11:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=XnRL/6GCJnnLqnsq4zYt0l8kyVXrVP3xw1YFsqQnEx4=;
	b=nfSxF3++7aOnu7ZtfZ4nPmOI0gRyf+xtQC4mcyK+i43Cu6vAq2gdsoI7M9Yu7aiPof
	auFOK1gjKNAY9Ef5VMxQcfgakwOn3SZ/FGO9HOh+QpZs6eVZUtXR4/Xwe5I41gyupuLr
	sk6nPOUgI0QmtklkIHwuZ8cCfV2Bcu98pj65JCyEucO8mzyMFEDXBPe/uCE2y6DhMFTK
	swdFowx12yRHdtpHlNPcSaF2pluoH+NKlFKAxrZS4iud/NqIDuZfdgnkJIJCIe8LHIxG
	mFY61KPjDX8H919A6XMwPOV1wYk8UbhygsEp+5BROo/lArbEhb9kpscEDrexlB4hEMH1
	V+9A==
X-Gm-Message-State: APjAAAXTAksul5S4uDhhRyomzNqR9UzyYLZ6TrE2E/XpsjNDcj105S76
	x23Xwracegqr/5cLlH5DrJc=
X-Google-Smtp-Source: APXvYqzfz/PE2mNdtJw+e11/Z3yxDbjoO6rLO+S8IVtkypnf1/CSYFZ6seYri1fPVJTKNtoS2bbH3g==
X-Received: by 2002:a17:902:6bcb:: with SMTP id
	m11mr28523894plt.10.1581581513257; 
	Thu, 13 Feb 2020 00:11:53 -0800 (PST)
Received: from workstation-portable ([103.211.17.23])
	by smtp.gmail.com with ESMTPSA id
	o16sm1681844pgl.58.2020.02.13.00.11.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 00:11:52 -0800 (PST)
Date: Thu, 13 Feb 2020 13:41:39 +0530
From: Amol Grover <frextrite@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH 3/3] auditsc: Do not use RCU primitive to read from cred
	pointer
Message-ID: <20200213081139.GB26550@workstation-portable>
References: <20200207180504.4200-1-frextrite@gmail.com>
	<20200207180504.4200-3-frextrite@gmail.com>
	<CAHC9VhQCbg1V290bYEZM+izDPRpr=XYXakohnDaMphkBBFgUaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQCbg1V290bYEZM+izDPRpr=XYXakohnDaMphkBBFgUaA@mail.gmail.com>
X-MC-Unique: NgqGxHK3OIe14Ea-F05K9A-1
X-MC-Unique: MMpjnvjuN1mQN6JGoNCc9g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01D8C1RM018893
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 13 Feb 2020 08:23:04 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Feb 11, 2020 at 10:19:04AM -0500, Paul Moore wrote:
> On Fri, Feb 7, 2020 at 1:08 PM Amol Grover <frextrite@gmail.com> wrote:
> >
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
> Considering the other changes in this patchset this change seems
> reasonable to me.  I'm assuming you were intending this patchset to go
> in via some tree other than audit?
> 

Yes, that's correct. Thank you for the ack!

> Acked-by: Paul Moore <paul@paul-moore.com>
> 
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
> >
> 
> 
> -- 
> paul moore
> www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


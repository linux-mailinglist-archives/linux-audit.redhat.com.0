Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B26A019E04C
	for <lists+linux-audit@lfdr.de>; Fri,  3 Apr 2020 23:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585949409;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ua7n2527W3h3zC4V+o5qhlULM2Fh1v9vd5TzmhjU/j8=;
	b=HN1B4u+AzvCckpR1/Kn3V2aPVRF/Pw7GpULMOc4lP5GkVwlvx1BMGBj9IgtTvAKcS1nAAa
	U45eTw7Ekb86lMe06Y6QFV8rwHQWXMX7j4ol0z9GYvPrULcxyejcSc2CsHGGrXiCr62Kq8
	VwBaaMcun5s2ZrCnMBof7d1SVP/nq6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-Pkqbf6lnMp6H2AOKU0nB0Q-1; Fri, 03 Apr 2020 17:30:07 -0400
X-MC-Unique: Pkqbf6lnMp6H2AOKU0nB0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DF0C107ACCC;
	Fri,  3 Apr 2020 21:30:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24A78101D480;
	Fri,  3 Apr 2020 21:29:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B99F4E455;
	Fri,  3 Apr 2020 21:29:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 033LLsFP018232 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 17:21:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A301926DF8; Fri,  3 Apr 2020 21:21:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 363DD26DF1;
	Fri,  3 Apr 2020 21:21:41 +0000 (UTC)
Date: Fri, 3 Apr 2020 17:21:38 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Amol Grover <frextrite@gmail.com>
Subject: Re: [PATCH 3/3 RESEND] auditsc: Do not use RCU primitive to read
	from cred pointer
Message-ID: <20200403212138.kr72jr57ppzsv6rm@madcap2.tricolour.ca>
References: <20200402055640.6677-1-frextrite@gmail.com>
	<20200402055640.6677-3-frextrite@gmail.com>
	<CAHC9VhTUKepKiGZgAaWDADyTPnnM5unbM65T7jXZ3p8MFTNUuQ@mail.gmail.com>
	<20200403075613.GA2788@workstation-portable>
MIME-Version: 1.0
In-Reply-To: <20200403075613.GA2788@workstation-portable>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 03 Apr 2020 17:29:38 -0400
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Ben Segall <bsegall@google.com>, Joel Fernandes <joel@joelfernandes.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	James Morris <jamorris@linux.microsoft.com>,
	Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
	Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Paul E . McKenney" <paulmck@kernel.org>, Jann Horn <jannh@google.com>,
	Steven Rostedt <rostedt@goodmis.org>, Shakeel Butt <shakeelb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	David Howells <dhowells@redhat.com>,
	linux-kernel@vger.kernel.org, linux-audit@redhat.com,
	"Eric W . Biederman" <ebiederm@xmission.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-04-03 13:26, Amol Grover wrote:
> On Thu, Apr 02, 2020 at 08:56:36AM -0400, Paul Moore wrote:
> > On Thu, Apr 2, 2020 at 1:57 AM Amol Grover <frextrite@gmail.com> wrote:
> > > task_struct::cred is only used task-synchronously and does
> > > not require any RCU locks, hence, rcu_dereference_check is
> > > not required to read from it.
> > >
> > > Suggested-by: Jann Horn <jannh@google.com>
> > > Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > ---
> > >  kernel/auditsc.c | 15 +++++----------
> > >  1 file changed, 5 insertions(+), 10 deletions(-)
> > 
> > This is the exact same patch I ACK'd back in February, yes?
> > 
> > https://lore.kernel.org/linux-audit/CAHC9VhQCbg1V290bYEZM+izDPRpr=XYXakohnDaMphkBBFgUaA@mail.gmail.com
> > 
> 
> Hi Paul,
> 
> That's correct. I've resend the series out of the fear that the first 2
> patches might've gotten lost as it's been almost a month since I last
> sent them. Could you please ack this again, and if you don't mind could
> you please go through the other 2 patches and ack them aswell?

Via who's tree are you expecting this will make it upstream?

> Thanks
> Amol
> 
> > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > index 4effe01ebbe2..d3510513cdd1 100644
> > > --- a/kernel/auditsc.c
> > > +++ b/kernel/auditsc.c
> > > @@ -430,24 +430,19 @@ static int audit_field_compare(struct task_struct *tsk,
> > >  /* Determine if any context name data matches a rule's watch data */
> > >  /* Compare a task_struct with an audit_rule.  Return 1 on match, 0
> > >   * otherwise.
> > > - *
> > > - * If task_creation is true, this is an explicit indication that we are
> > > - * filtering a task rule at task creation time.  This and tsk == current are
> > > - * the only situations where tsk->cred may be accessed without an rcu read lock.
> > >   */
> > >  static int audit_filter_rules(struct task_struct *tsk,
> > >                               struct audit_krule *rule,
> > >                               struct audit_context *ctx,
> > >                               struct audit_names *name,
> > > -                             enum audit_state *state,
> > > -                             bool task_creation)
> > > +                             enum audit_state *state)
> > >  {
> > >         const struct cred *cred;
> > >         int i, need_sid = 1;
> > >         u32 sid;
> > >         unsigned int sessionid;
> > >
> > > -       cred = rcu_dereference_check(tsk->cred, tsk == current || task_creation);
> > > +       cred = tsk->cred;
> > >
> > >         for (i = 0; i < rule->field_count; i++) {
> > >                 struct audit_field *f = &rule->fields[i];
> > > @@ -745,7 +740,7 @@ static enum audit_state audit_filter_task(struct task_struct *tsk, char **key)
> > >         rcu_read_lock();
> > >         list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_TASK], list) {
> > >                 if (audit_filter_rules(tsk, &e->rule, NULL, NULL,
> > > -                                      &state, true)) {
> > > +                                      &state)) {
> > >                         if (state == AUDIT_RECORD_CONTEXT)
> > >                                 *key = kstrdup(e->rule.filterkey, GFP_ATOMIC);
> > >                         rcu_read_unlock();
> > > @@ -791,7 +786,7 @@ static enum audit_state audit_filter_syscall(struct task_struct *tsk,
> > >         list_for_each_entry_rcu(e, list, list) {
> > >                 if (audit_in_mask(&e->rule, ctx->major) &&
> > >                     audit_filter_rules(tsk, &e->rule, ctx, NULL,
> > > -                                      &state, false)) {
> > > +                                      &state)) {
> > >                         rcu_read_unlock();
> > >                         ctx->current_state = state;
> > >                         return state;
> > > @@ -815,7 +810,7 @@ static int audit_filter_inode_name(struct task_struct *tsk,
> > >
> > >         list_for_each_entry_rcu(e, list, list) {
> > >                 if (audit_in_mask(&e->rule, ctx->major) &&
> > > -                   audit_filter_rules(tsk, &e->rule, ctx, n, &state, false)) {
> > > +                   audit_filter_rules(tsk, &e->rule, ctx, n, &state)) {
> > >                         ctx->current_state = state;
> > >                         return 1;
> > >                 }
> > > --
> > > 2.24.1
> > 
> > paul moore

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


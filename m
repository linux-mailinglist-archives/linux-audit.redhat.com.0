Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F0AC519C2A3
	for <lists+linux-audit@lfdr.de>; Thu,  2 Apr 2020 15:29:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585834141;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ImDeV8ChCNIsIC//JOZRqjxMb9scmdy5tvJDNDsihvs=;
	b=bqPHZtKYQaiGngul6j1YthNRnYZaWk1MnWWbpRtDwYDo/7KBSHJVOIdk0mUoKIvPgYMaI/
	xwk1ydVpzBH0OIjSxfZGvU1VURdsMvxSbifDigekAnqX+mHtqwXewWBMLSDLD69kA0DZuo
	241Jvzg+b0QooA/SqJ+lujkvlAfEq68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90--WgdEz-gPhi7mBqEYvUGDg-1; Thu, 02 Apr 2020 09:28:59 -0400
X-MC-Unique: -WgdEz-gPhi7mBqEYvUGDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BFEB192D787;
	Thu,  2 Apr 2020 13:28:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EFAA60BF1;
	Thu,  2 Apr 2020 13:28:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 453BC18089CF;
	Thu,  2 Apr 2020 13:28:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0325vbJa032118 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 2 Apr 2020 01:57:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6B97710054E4; Thu,  2 Apr 2020 05:57:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 671CF10054E9
	for <linux-audit@redhat.com>; Thu,  2 Apr 2020 05:57:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C71698F843B
	for <linux-audit@redhat.com>; Thu,  2 Apr 2020 05:57:36 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-339-vSgRgad7PrOtw8qKhkzqmQ-1; Thu, 02 Apr 2020 01:57:34 -0400
X-MC-Unique: vSgRgad7PrOtw8qKhkzqmQ-1
Received: by mail-pl1-f194.google.com with SMTP id h11so926078plr.11;
	Wed, 01 Apr 2020 22:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6dJnmRISnXhx/tid8L3bkFndKLLLawXzGhi1aYEmqBI=;
	b=TdzYV1izf8OG+uyiYkBOVnMsBL+3+4I5wTW5CJhMbBp12oEW9ulRmPxNEr/2Kb05hq
	67ju1paAjUHTOL/JW++oYSy+jzgDV7F3brP8IuKSqxfHzQxBmN+usBOetiU+rKQI8z6M
	aX6ySHNPQNuBJ/QXcM4riStz6rZoGcZTt2tQ+mghN1p2aZOKPE/2djOU/3mObnlIJv/n
	3hIiBX79EwEfHJEfIDywwVZAnwt4OQURAG+30pV0pS1oB4BrQPh/B14qTRJQ3z2STQau
	hCh6+NfX5V9NrTCgnJpw/NxZTo/uaahkoYBxEU0rxYWvTIIb0XmEuTMtlJGYh3qLvoaS
	ND8A==
X-Gm-Message-State: AGi0PubWAuPRaFnqV7km/G8+RzOtterjgoTWzOZWB9xvhGk3thc/wPER
	2cQNKRYZSqZlbUg0JgSC9cIDHF2KL3s=
X-Google-Smtp-Source: APiQypKKpM2RNoBega/Jw427Lig/OopGc2RCcaSq/EMKfefz7KImd2eIOeKFi0eJjpW3VBuddiq5SA==
X-Received: by 2002:a17:902:e788:: with SMTP id
	cp8mr1382631plb.343.1585807053025; 
	Wed, 01 Apr 2020 22:57:33 -0700 (PDT)
Received: from localhost.localdomain ([103.87.57.161])
	by smtp.googlemail.com with ESMTPSA id
	207sm2776058pgg.19.2020.04.01.22.57.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 01 Apr 2020 22:57:32 -0700 (PDT)
From: Amol Grover <frextrite@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, James Morris <jamorris@linux.microsoft.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>,
	David Howells <dhowells@redhat.com>, Shakeel Butt <shakeelb@google.com>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>
Subject: [PATCH 3/3 RESEND] auditsc: Do not use RCU primitive to read from
	cred pointer
Date: Thu,  2 Apr 2020 11:26:40 +0530
Message-Id: <20200402055640.6677-3-frextrite@gmail.com>
In-Reply-To: <20200402055640.6677-1-frextrite@gmail.com>
References: <20200402055640.6677-1-frextrite@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0325vbJa032118
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 02 Apr 2020 09:28:10 -0400
Cc: "Paul E . McKenney" <paulmck@kernel.org>, Amol Grover <frextrite@gmail.com>,
	linux-kernel@vger.kernel.org,
	Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
	linux-audit@redhat.com, Joel Fernandes <joel@joelfernandes.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

task_struct::cred is only used task-synchronously and does
not require any RCU locks, hence, rcu_dereference_check is
not required to read from it.

Suggested-by: Jann Horn <jannh@google.com>
Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 kernel/auditsc.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 4effe01ebbe2..d3510513cdd1 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -430,24 +430,19 @@ static int audit_field_compare(struct task_struct *tsk,
 /* Determine if any context name data matches a rule's watch data */
 /* Compare a task_struct with an audit_rule.  Return 1 on match, 0
  * otherwise.
- *
- * If task_creation is true, this is an explicit indication that we are
- * filtering a task rule at task creation time.  This and tsk == current are
- * the only situations where tsk->cred may be accessed without an rcu read lock.
  */
 static int audit_filter_rules(struct task_struct *tsk,
 			      struct audit_krule *rule,
 			      struct audit_context *ctx,
 			      struct audit_names *name,
-			      enum audit_state *state,
-			      bool task_creation)
+			      enum audit_state *state)
 {
 	const struct cred *cred;
 	int i, need_sid = 1;
 	u32 sid;
 	unsigned int sessionid;
 
-	cred = rcu_dereference_check(tsk->cred, tsk == current || task_creation);
+	cred = tsk->cred;
 
 	for (i = 0; i < rule->field_count; i++) {
 		struct audit_field *f = &rule->fields[i];
@@ -745,7 +740,7 @@ static enum audit_state audit_filter_task(struct task_struct *tsk, char **key)
 	rcu_read_lock();
 	list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_TASK], list) {
 		if (audit_filter_rules(tsk, &e->rule, NULL, NULL,
-				       &state, true)) {
+				       &state)) {
 			if (state == AUDIT_RECORD_CONTEXT)
 				*key = kstrdup(e->rule.filterkey, GFP_ATOMIC);
 			rcu_read_unlock();
@@ -791,7 +786,7 @@ static enum audit_state audit_filter_syscall(struct task_struct *tsk,
 	list_for_each_entry_rcu(e, list, list) {
 		if (audit_in_mask(&e->rule, ctx->major) &&
 		    audit_filter_rules(tsk, &e->rule, ctx, NULL,
-				       &state, false)) {
+				       &state)) {
 			rcu_read_unlock();
 			ctx->current_state = state;
 			return state;
@@ -815,7 +810,7 @@ static int audit_filter_inode_name(struct task_struct *tsk,
 
 	list_for_each_entry_rcu(e, list, list) {
 		if (audit_in_mask(&e->rule, ctx->major) &&
-		    audit_filter_rules(tsk, &e->rule, ctx, n, &state, false)) {
+		    audit_filter_rules(tsk, &e->rule, ctx, n, &state)) {
 			ctx->current_state = state;
 			return 1;
 		}
-- 
2.24.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


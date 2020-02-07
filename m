Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 02175155D6B
	for <lists+linux-audit@lfdr.de>; Fri,  7 Feb 2020 19:11:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581099089;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ImDeV8ChCNIsIC//JOZRqjxMb9scmdy5tvJDNDsihvs=;
	b=LwxSyLwpe0hhaqoZ7hPHqv6bhMhQEdOp5Tabc49gwjesrT0JQnFI+RhpsrxpI9h1oXIjM4
	2wKIoe+IcuQoo5tlNYDs0J7cFx19bAtr33DXHPMtg1MydMuxSSOaDAIPuv5gsarcVwzq7U
	DouED4lMxGtKZ00fYsvMpGWyjHtaDjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-Vk9P5eXbOBeP6duM5pmAeg-1; Fri, 07 Feb 2020 13:11:27 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEB7C1857341;
	Fri,  7 Feb 2020 18:11:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA13A87B1C;
	Fri,  7 Feb 2020 18:11:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8AFDB866C0;
	Fri,  7 Feb 2020 18:11:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017I8RlU013407 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 13:08:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 148C32049CB5; Fri,  7 Feb 2020 18:08:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F4F62049CBD
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 18:08:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C6348EFB33
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 18:08:24 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-78-Hw66hcpVNpeZ7jl45QU3Qw-1; Fri, 07 Feb 2020 13:08:20 -0500
Received: by mail-pj1-f67.google.com with SMTP id d5so1217946pjz.5;
	Fri, 07 Feb 2020 10:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6dJnmRISnXhx/tid8L3bkFndKLLLawXzGhi1aYEmqBI=;
	b=iG6BwJgBARyMag+Vb2WV1gP6XFOWQjvEJDRIZmdIyksdFLIC16zheWoWW3TFl1a4Hs
	pBm3Y6FKyNY6we9mSihVRVAebMCzRNXpn9xvSSDSyIQAV/0KmDs/lhQ+EzIY51g/WgIq
	7tGhR1GThCoyseB3sxWB8eCTf8/xYd0JdLmJsooSe11L1rvl1IzlZbYSY99h3y0zkhtb
	eJB8SKaTQQ1shfU/0HJMe+50iqwWZN5ch4Zkmze8wVWcaxc5wUCvWmwTtYdgPGi/JBkm
	lVZQbYoGsNOeXFIpkK5jRKPZWHm74Wxs5M1CfWncOifLS9DIVvsRQlcUhRZJX6HCeL9z
	v4Fw==
X-Gm-Message-State: APjAAAVCcCkQhN5m/4lM6tfwK1yqY3wbpKiSy8fpXnJLV/QyvxK8tg60
	DjJHo+BXjQUW9SMCocD592bBClCJiEdCEQ==
X-Google-Smtp-Source: APXvYqym2YQSzc5+DaUKX0EDmz+UD0MoeyQVJEc9evlzGvMkuEWZiJSglWMQzb2WBkKyVuAow9dRtw==
X-Received: by 2002:a17:902:a616:: with SMTP id
	u22mr10769740plq.173.1581098898305; 
	Fri, 07 Feb 2020 10:08:18 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.120])
	by smtp.googlemail.com with ESMTPSA id
	gx18sm3088795pjb.8.2020.02.07.10.08.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 10:08:17 -0800 (PST)
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
Subject: [PATCH 3/3] auditsc: Do not use RCU primitive to read from cred
	pointer
Date: Fri,  7 Feb 2020 23:35:05 +0530
Message-Id: <20200207180504.4200-3-frextrite@gmail.com>
In-Reply-To: <20200207180504.4200-1-frextrite@gmail.com>
References: <20200207180504.4200-1-frextrite@gmail.com>
MIME-Version: 1.0
X-MC-Unique: Hw66hcpVNpeZ7jl45QU3Qw-1
X-MC-Unique: Vk9P5eXbOBeP6duM5pmAeg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 017I8RlU013407
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 07 Feb 2020 13:10:51 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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


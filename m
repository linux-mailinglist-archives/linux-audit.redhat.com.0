Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E368B19C2A4
	for <lists+linux-audit@lfdr.de>; Thu,  2 Apr 2020 15:29:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585834142;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YupIPB718RG1CCkS4eNKhU7KuoKxQ4pX9sJddAAp3xs=;
	b=IC7/+NV7qcSll1K2FA6tYKz+NJ9PaNqgIUQAZtMJVhExQMNZw0GyGIzY2etiq9fsySExpP
	g+WO81eXge/68IIeRfbVg9CwOfUnXJng7QqaNN4il2zkKtQA430Mpk734cevQDZSC0ZQ84
	0dbZ/56Sb7Em0JiQIlnx6NiF7+3SLJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-p5dehsOWNkWQv1A5ZxO37A-1; Thu, 02 Apr 2020 09:28:59 -0400
X-MC-Unique: p5dehsOWNkWQv1A5ZxO37A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35B4610CE79F;
	Thu,  2 Apr 2020 13:28:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7574F1147C6;
	Thu,  2 Apr 2020 13:28:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7EE7918089CE;
	Thu,  2 Apr 2020 13:28:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0325vIWI032096 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 2 Apr 2020 01:57:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A5D362166B2C; Thu,  2 Apr 2020 05:57:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A205C2166B2B
	for <linux-audit@redhat.com>; Thu,  2 Apr 2020 05:57:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFAEC800297
	for <linux-audit@redhat.com>; Thu,  2 Apr 2020 05:57:15 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-310-MGVKmcHePxSPuRv5nmes1w-1; Thu, 02 Apr 2020 01:57:13 -0400
X-MC-Unique: MGVKmcHePxSPuRv5nmes1w-1
Received: by mail-pl1-f195.google.com with SMTP id s23so919250plq.13;
	Wed, 01 Apr 2020 22:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0v8qFG+lakbNwCs1dTA5aCEVT1bp7ahYq6NmZeNOrGQ=;
	b=ccG2qclCPA/jmK/pH0Mn+QFRjXDZQJ8qKgJih2m+APIUelFuD4oRh2KR73NChUk/81
	EoqjMPj4VN9lOxSECkASSC6+BdKO4mtrI2Dro7KM6MQKY3ktajW3VRlhwBt0BlG/szmQ
	iPgAaLpA+j4v8pc60qHOknxzoTuDBl/3iIP/AePK4GSYPWvooqBfW5MxZArHE5W6aBH0
	Xs6Iojrq1OP45RSCJXtlO3En3nvesyVZnJvkNY92Kpx8plLXdbsWZWw9g14v6DFJPrVh
	58hpYQQpXOVvhFAkvb9cUttPTo9LjR8A0qmy/frruX/gde/eMPYIwMLX8acG0sLzxbag
	zaAw==
X-Gm-Message-State: AGi0PuY5kMid/CO9ORB5+5cKwozSyRIWsCVHzUwXxT1QdNmPZeIWw8GE
	/CIZ3qhkDFYsQfmBmSAQv5UItwz0d2E=
X-Google-Smtp-Source: APiQypLJsNATH03qXt80StDeQlmOxYsyjU6euM+h1RDJeAOmpFoPbaurqtKpPF1ZmeSswUcufB1swQ==
X-Received: by 2002:a17:90a:fe18:: with SMTP id
	ck24mr2037363pjb.57.1585807031699; 
	Wed, 01 Apr 2020 22:57:11 -0700 (PDT)
Received: from localhost.localdomain ([103.87.57.161])
	by smtp.googlemail.com with ESMTPSA id
	207sm2776058pgg.19.2020.04.01.22.57.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 01 Apr 2020 22:57:11 -0700 (PDT)
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
Subject: [PATCH 1/3 RESEND] sched: Remove __rcu annotation from cred pointer
Date: Thu,  2 Apr 2020 11:26:38 +0530
Message-Id: <20200402055640.6677-1-frextrite@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0325vIWI032096
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

task_struct::cred (subjective credentials) is *always* used
task-synchronously, hence, does not require RCU semantics.

task_struct::real_cred (objective credentials) can be used in
RCU context and its __rcu annotation is retained.

However, task_struct::cred and task_struct::real_cred *may*
point to the same object, hence, the object pointed to by
task_struct::cred *may* have RCU delayed freeing.

Suggested-by: Jann Horn <jannh@google.com>
Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 include/linux/sched.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 716ad1d8d95e..39924e6e0cf2 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -879,8 +879,11 @@ struct task_struct {
 	/* Objective and real subjective task credentials (COW): */
 	const struct cred __rcu		*real_cred;
 
-	/* Effective (overridable) subjective task credentials (COW): */
-	const struct cred __rcu		*cred;
+	/*
+	 * Effective (overridable) subjective task credentials (COW)
+	 * which is used task-synchronously
+	 */
+	const struct cred		*cred;
 
 #ifdef CONFIG_KEYS
 	/* Cached requested key. */
-- 
2.24.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


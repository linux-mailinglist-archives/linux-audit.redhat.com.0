Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5082919C2A1
	for <lists+linux-audit@lfdr.de>; Thu,  2 Apr 2020 15:28:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585834138;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=im2GeVbnCW+4JpdnkymGiae3WTU/xa3t7Tp/fuKr5lg=;
	b=eF8K/+KY4yVuW0QGL5wYJBiTMqpSxwp0x+mOYp23RGpRCq6dQE16CkK3g1OPj7nGDowDUs
	6olEWBUxvxNF3er5JQBlRvdOgvEceJKs+nRSwRrfCIqDSx8s7i6wBSjRvxKEKO3jTH2E8o
	8WtV/eQ6HA6YyMkAc3OG9slAxsN79Po=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-5YsmA_gnPUWYF1iPrC9T2Q-1; Thu, 02 Apr 2020 09:28:56 -0400
X-MC-Unique: 5YsmA_gnPUWYF1iPrC9T2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB24B192D797;
	Thu,  2 Apr 2020 13:28:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB238101D489;
	Thu,  2 Apr 2020 13:28:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5BC27944DA;
	Thu,  2 Apr 2020 13:28:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0325vZlG032113 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 2 Apr 2020 01:57:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54B7D1000D9B; Thu,  2 Apr 2020 05:57:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DF3E1006B31
	for <linux-audit@redhat.com>; Thu,  2 Apr 2020 05:57:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED2688007B3
	for <linux-audit@redhat.com>; Thu,  2 Apr 2020 05:57:30 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-436-xUiGc0SiM4yCZNkSN9VQRA-1; Thu, 02 Apr 2020 01:57:28 -0400
X-MC-Unique: xUiGc0SiM4yCZNkSN9VQRA-1
Received: by mail-pj1-f67.google.com with SMTP id q16so2981021pje.1;
	Wed, 01 Apr 2020 22:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5zQQHlAdkKi/5/LHbljBLnmP/SWJe90/jtmz6ntc02A=;
	b=fXlO8cKi7V9Fw8Mf1TdZ+OGbYdzxbA7QjWJX/Kdp2mieoHTFJOAdAWU6M5mgnDp3b7
	oZplv+Oal75l+juktUi1R5Y0Qhr/Qx3sGq4lCXhD3hku0SdXdoC+C7Oix4I0hrVaNTUG
	GPOj673WOnwPTKM5C/FzujpvUF3ZPm+W+kr8wnRwSVjRSOA7kd92QwLPRD1NIlkvoNRZ
	NL413X8mm4Fnb8qAqOOavMiRTpXZPX7ceeMrAVxwzmfp1nOunKne24WJ+lcF3J4mHOsE
	eCQjH/HmL/KTwnGcLO7b+R2CSDwQEixsWbfIAnkHfIpbe2iC6Tc9buTFiek11iqCVUh+
	hK9A==
X-Gm-Message-State: AGi0PubfXykZlo6plfTC1hwmfAB3AN7tIx8UtW8J1mxF13PGooO4gNlJ
	zSaEHMEkB04mhQpgeCz9dNzCyycawo0=
X-Google-Smtp-Source: APiQypIk1wMcGt7vUXSVK1MJW9YRaCXHyaTjB6smeZ6u0GO8uNCLQSJJgk4xubTEKp/AI5wOSj0bHA==
X-Received: by 2002:a17:902:7581:: with SMTP id
	j1mr1461361pll.171.1585807046892; 
	Wed, 01 Apr 2020 22:57:26 -0700 (PDT)
Received: from localhost.localdomain ([103.87.57.161])
	by smtp.googlemail.com with ESMTPSA id
	207sm2776058pgg.19.2020.04.01.22.57.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 01 Apr 2020 22:57:26 -0700 (PDT)
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
Subject: [PATCH 2/3 RESEND] cred: Do not use RCU primitives to access cred
	pointer
Date: Thu,  2 Apr 2020 11:26:39 +0530
Message-Id: <20200402055640.6677-2-frextrite@gmail.com>
In-Reply-To: <20200402055640.6677-1-frextrite@gmail.com>
References: <20200402055640.6677-1-frextrite@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0325vZlG032113
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since task_struct::cred can only be used task-synchronously,
and is not visible to other threads under RCU context,
we do not require RCU primitives to read/write to it and incur
heavy barriers.

Suggested-by: Jann Horn <jannh@google.com>
Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 include/linux/cred.h | 5 ++---
 kernel/cred.c        | 6 +++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/include/linux/cred.h b/include/linux/cred.h
index 18639c069263..5973791e5fe4 100644
--- a/include/linux/cred.h
+++ b/include/linux/cred.h
@@ -291,11 +291,10 @@ static inline void put_cred(const struct cred *_cred)
 /**
  * current_cred - Access the current task's subjective credentials
  *
- * Access the subjective credentials of the current task.  RCU-safe,
- * since nobody else can modify it.
+ * Access the subjective credentials of the current task.
  */
 #define current_cred() \
-	rcu_dereference_protected(current->cred, 1)
+	(current->cred)
 
 /**
  * current_real_cred - Access the current task's objective credentials
diff --git a/kernel/cred.c b/kernel/cred.c
index 809a985b1793..3956c31d068d 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -485,7 +485,7 @@ int commit_creds(struct cred *new)
 	if (new->user != old->user)
 		atomic_inc(&new->user->processes);
 	rcu_assign_pointer(task->real_cred, new);
-	rcu_assign_pointer(task->cred, new);
+	task->cred = new;
 	if (new->user != old->user)
 		atomic_dec(&old->user->processes);
 	alter_cred_subscribers(old, -2);
@@ -562,7 +562,7 @@ const struct cred *override_creds(const struct cred *new)
 	 */
 	get_new_cred((struct cred *)new);
 	alter_cred_subscribers(new, 1);
-	rcu_assign_pointer(current->cred, new);
+	current->cred = new;
 	alter_cred_subscribers(old, -1);
 
 	kdebug("override_creds() = %p{%d,%d}", old,
@@ -590,7 +590,7 @@ void revert_creds(const struct cred *old)
 	validate_creds(old);
 	validate_creds(override);
 	alter_cred_subscribers(old, 1);
-	rcu_assign_pointer(current->cred, old);
+	current->cred = old;
 	alter_cred_subscribers(override, -1);
 	put_cred(override);
 }
-- 
2.24.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


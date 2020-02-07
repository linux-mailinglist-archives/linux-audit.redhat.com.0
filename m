Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6B512155D69
	for <lists+linux-audit@lfdr.de>; Fri,  7 Feb 2020 19:11:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581099088;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=im2GeVbnCW+4JpdnkymGiae3WTU/xa3t7Tp/fuKr5lg=;
	b=ZRjb+doVDCb3kE8ivePgTysClVF5o5LpgVa+oPwFzhd7LfmC1aNunJwVTyxMD9mlOu/arP
	8eeduPob0FajP27pKNIf/iBgO68tHJDtqw7KTDvoE2NCJn2WzEYSc8DlIjXeiDcnyGSMCo
	wuYnCRQ5uRS/KC7QA1JE46DSpUIvNHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-mqrBCmnePx6sdy6feQKq0A-1; Fri, 07 Feb 2020 13:11:26 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E926800E21;
	Fri,  7 Feb 2020 18:11:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3EEB5DA7E;
	Fri,  7 Feb 2020 18:11:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DEAD866BB;
	Fri,  7 Feb 2020 18:11:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017I8IgL013393 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 13:08:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 26ED62166B2A; Fri,  7 Feb 2020 18:08:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22E162166B27
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 18:08:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08E408EB45C
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 18:08:18 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-194-H7WQp7hLN3mhtRyE94flyQ-1; Fri, 07 Feb 2020 13:08:14 -0500
Received: by mail-pj1-f68.google.com with SMTP id n96so1226652pjc.3;
	Fri, 07 Feb 2020 10:08:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5zQQHlAdkKi/5/LHbljBLnmP/SWJe90/jtmz6ntc02A=;
	b=rwFSNe0FjNb94goYQ6dnoICGNH7OKw51ZSe3Bgyq65gyM5mrGxc8e55x25b7h/pGTo
	ksVRGbsvqswUr6+Urn6xZn3jOJPiW7k5zYfLsfvDangHu+zTCnuRbhr5VsAY3rO4G8HN
	2j59jUSD/PRUe6lNKMh2vTHyiE0vuZCLAeX92rZ6eUtpEbxeQDaR0dzYzSy2ct9WEI2M
	r8znqY2IcXBEpnEC4ocAZh8ERGZacx4jxwWDvcOyxgPNC4Cri2EB+43mkKgU0oFpX+zO
	gmEUoxYZJbZ4+CxXbxE+W0hy+dj/GZOSiMXN7NAfB0qgw6nRcVfW2ZrZy8qUX0r/zCD3
	5/ZA==
X-Gm-Message-State: APjAAAV5mo1FmTunmhHV9jCtQeVD4PtgIJzEasB2EptlCV92UsVtg466
	isphBxLTxrxX0b5F6Wkgi4AsLsItsIJ0MQ==
X-Google-Smtp-Source: APXvYqyEBPgz7pQYmv0XHHjqZAEVk/5ga6fBOfnavOBQradYIrMGl3pLWPJyoOOoQeOQEDoBAIeMEA==
X-Received: by 2002:a17:902:8a81:: with SMTP id
	p1mr10766574plo.284.1581098893117; 
	Fri, 07 Feb 2020 10:08:13 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.120])
	by smtp.googlemail.com with ESMTPSA id
	gx18sm3088795pjb.8.2020.02.07.10.08.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 10:08:12 -0800 (PST)
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
Subject: [PATCH 2/3] cred: Do not use RCU primitives to access cred pointer
Date: Fri,  7 Feb 2020 23:35:04 +0530
Message-Id: <20200207180504.4200-2-frextrite@gmail.com>
In-Reply-To: <20200207180504.4200-1-frextrite@gmail.com>
References: <20200207180504.4200-1-frextrite@gmail.com>
MIME-Version: 1.0
X-MC-Unique: H7WQp7hLN3mhtRyE94flyQ-1
X-MC-Unique: mqrBCmnePx6sdy6feQKq0A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 017I8IgL013393
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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


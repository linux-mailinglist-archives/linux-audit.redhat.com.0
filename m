Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D0757155D6A
	for <lists+linux-audit@lfdr.de>; Fri,  7 Feb 2020 19:11:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581099089;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YupIPB718RG1CCkS4eNKhU7KuoKxQ4pX9sJddAAp3xs=;
	b=O1ctAjfX1hXqdm44pQpVJpXgEFxW67HbZ2G2CP0DqrgPIxcjg6fVGulSZQc90Zz4Jl3nps
	jKA0m44dYuK8jfKYu6U6fstxwR2MhsQsGqUAl6jrqnfKdC0imDiKN9k6uKa6aqPEUA06/I
	x8aX8VIkBvLi7ZSK6q9LsX5HFWkkzQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-yx0iNFsRMRmM5oD_hz4qsA-1; Fri, 07 Feb 2020 13:11:26 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 604E8101FC62;
	Fri,  7 Feb 2020 18:11:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74C468E9EA;
	Fri,  7 Feb 2020 18:11:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 021CD18089CD;
	Fri,  7 Feb 2020 18:11:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017I8ErC013387 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 13:08:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 35C752166B27; Fri,  7 Feb 2020 18:08:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FB682166B2A
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 18:08:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B41FA8EFB41
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 18:08:11 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-79-gipZxngDNUWmKNKarDwrJw-1; Fri, 07 Feb 2020 13:08:09 -0500
Received: by mail-pg1-f193.google.com with SMTP id 6so182981pgk.0;
	Fri, 07 Feb 2020 10:08:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0v8qFG+lakbNwCs1dTA5aCEVT1bp7ahYq6NmZeNOrGQ=;
	b=E/onnJ4+V6zND9jqLqnr57QIniLQ8fuZPyECg1HEkRpFYOvp2/EvLA/890BsmerF3U
	TICcgoIAGcHZN0yP/MQA8u5QkVTVoVXYq5C5TUJWpTRF6a+AiJlB2O4rRUssB7ZGyYO5
	DU78NrZKdT7UjvxFF37/i3OT1w7GmjVanHKhFx2hd9J2ncztvCHL1C9xWzNIU1CA8IEp
	zmEuiG2jqjvgzER+21NHIplwhXTHe3xbLUlR2QB1IAcAw43uJz4ALxxVNa33bj5FOV9a
	92M3tMxd+B8f6qKtx9Jg01bukcA/o+/f5yPBXHn0HizuXzT57uqUsyHx4qBq6naqNXEK
	6H7w==
X-Gm-Message-State: APjAAAUWElqviJtI3j693AHmGV2cyU/lYAamyaNyQb4IdaMwzj5Okkf2
	rVV3OcxLON/6T1GwA5gWPXNagZJ1Au9WKw==
X-Google-Smtp-Source: APXvYqzaBM/+hmIPNy9bRy1dcY11rU8mCOKoOMHz1OaRc6/wqt8f9BoesHM+STBvRwQHi4+d72LfiQ==
X-Received: by 2002:aa7:979a:: with SMTP id o26mr105769pfp.257.1581098888027; 
	Fri, 07 Feb 2020 10:08:08 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.120])
	by smtp.googlemail.com with ESMTPSA id
	gx18sm3088795pjb.8.2020.02.07.10.08.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 10:08:07 -0800 (PST)
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
Subject: [PATCH 1/3] sched: Remove __rcu annotation from cred pointer
Date: Fri,  7 Feb 2020 23:35:03 +0530
Message-Id: <20200207180504.4200-1-frextrite@gmail.com>
MIME-Version: 1.0
X-MC-Unique: gipZxngDNUWmKNKarDwrJw-1
X-MC-Unique: yx0iNFsRMRmM5oD_hz4qsA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 017I8ErC013387
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


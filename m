Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 01A9F305E0F
	for <lists+linux-audit@lfdr.de>; Wed, 27 Jan 2021 15:20:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-x-_kM1jzNZq4pfZwRnvKZw-1; Wed, 27 Jan 2021 09:20:23 -0500
X-MC-Unique: x-_kM1jzNZq4pfZwRnvKZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29D04801AA3;
	Wed, 27 Jan 2021 14:20:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBC065D9C6;
	Wed, 27 Jan 2021 14:20:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16EE94BB7B;
	Wed, 27 Jan 2021 14:20:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10R2qDRj014841 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 21:52:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 21E00ADF7D; Wed, 27 Jan 2021 02:52:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C27FADF86
	for <linux-audit@redhat.com>; Wed, 27 Jan 2021 02:52:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E83748008A5
	for <linux-audit@redhat.com>; Wed, 27 Jan 2021 02:52:10 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-435-GhI-nZv6PriMXWBQ1mo7IQ-1; Tue, 26 Jan 2021 21:52:07 -0500
X-MC-Unique: GhI-nZv6PriMXWBQ1mo7IQ-1
Received: by mail-pj1-f68.google.com with SMTP id l18so430583pji.3;
	Tue, 26 Jan 2021 18:52:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6V+09PYy3UBnK+L5rrj+ECCvyFqSJJIBq/ZXEMb2bJM=;
	b=DL6qzoiIh5HJU1HKXnosbCpOMXQsrCx+UwuFaaJSfXfopUUitm/piHgDq5zIDGiQjh
	slpGVCsreNrIlQhP9oXStglNyFdwj4I74WujDtwOpwmYVb7MD+Z1SuZo2BFKVZHLcEAG
	4PrkRffVy/plHB1swtcpc/Veh5BVsc2NkgObnl9MG3pV0evRZre1Iw2bmBRYh4fAjeMT
	qhpGsrOQQsKGW7Qk+vDVreF1twCMPxLEdAa8ZrBFrZXzth86ExbkwKgDprFaBQE7gJVX
	+xIdN8NhBRY7hDx7i+hJ/Hdtc1kKmQz0DNyypdQoe7Xp1papOkATLK0UZQ8hSfYPn3PN
	Gg7w==
X-Gm-Message-State: AOAM533IWSCPncszFB8+zYVX7W/+Po7/+vB59M1ai8/8ykWrN6CSUTca
	TYL+JVxW4iJurFsL/atynkVKp8FSVKo=
X-Google-Smtp-Source: ABdhPJxG93aTh/GJHmqgHwPVDToiUD50bsK4nleE+bEmiDF3YI5EPUAQ3i9ngScJETfZAvBosksT2g==
X-Received: by 2002:a17:903:31ca:b029:e0:ee2:c076 with SMTP id
	v10-20020a17090331cab02900e00ee2c076mr7841800ple.58.1611715926642;
	Tue, 26 Jan 2021 18:52:06 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
	by smtp.gmail.com with ESMTPSA id h12sm346472pgs.7.2021.01.26.18.52.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Jan 2021 18:52:06 -0800 (PST)
From: menglong8.dong@gmail.com
X-Google-Original-From: yang.yang29@zte.com.cn
To: paul@paul-moore.com
Subject: [PATCH v2] audit: Make audit_filter_syscall() return void
Date: Tue, 26 Jan 2021 18:51:43 -0800
Message-Id: <20210127025144.24253-1-yang.yang29@zte.com.cn>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 27 Jan 2021 09:19:38 -0500
Cc: Yang Yang <yang.yang29@zte.com.cn>, Richard Guy Briggs <rgb@redhat.com>,
	linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Yang Yang <yang.yang29@zte.com.cn>

No invoker uses the return value of audit_filter_syscall().
So make it return void, and amend the comment of
audit_filter_syscall().

Changes since v1:
- amend the comment of audit_filter_syscall().

Signed-off-by: Yang Yang <yang.yang29@zte.com.cn>
Reviewed-by: Richard Guy Briggs <rgb@redhat.com>
---
 kernel/auditsc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index ce8c9e2279ba..434337ab6b2b 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -799,12 +799,12 @@ static int audit_in_mask(const struct audit_krule *rule, unsigned long val)
 	return rule->mask[word] & bit;
 }
 
-/* At syscall entry and exit time, this filter is called if the
- * audit_state is not low enough that auditing cannot take place, but is
- * also not high enough that we already know we have to write an audit
- * record (i.e., the state is AUDIT_SETUP_CONTEXT or AUDIT_BUILD_CONTEXT).
+/* At syscall exit time, this filter is called if the audit_state is
+ * not low enough that auditing cannot take place, but is also not
+ * high enough that we already know we have to write an audit record
+ * (i.e., the state is AUDIT_SETUP_CONTEXT or AUDIT_BUILD_CONTEXT).
  */
-static enum audit_state audit_filter_syscall(struct task_struct *tsk,
+static void audit_filter_syscall(struct task_struct *tsk,
 					     struct audit_context *ctx,
 					     struct list_head *list)
 {
@@ -812,7 +812,7 @@ static enum audit_state audit_filter_syscall(struct task_struct *tsk,
 	enum audit_state state;
 
 	if (auditd_test_task(tsk))
-		return AUDIT_DISABLED;
+		return;
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(e, list, list) {
@@ -821,11 +821,11 @@ static enum audit_state audit_filter_syscall(struct task_struct *tsk,
 				       &state, false)) {
 			rcu_read_unlock();
 			ctx->current_state = state;
-			return state;
+			return;
 		}
 	}
 	rcu_read_unlock();
-	return AUDIT_BUILD_CONTEXT;
+	return;
 }
 
 /*
-- 
2.25.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


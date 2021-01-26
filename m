Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 838763045DE
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 19:02:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-_akrKRUtNA6FOhtwW9O4ng-1; Tue, 26 Jan 2021 13:02:21 -0500
X-MC-Unique: _akrKRUtNA6FOhtwW9O4ng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66CBD59;
	Tue, 26 Jan 2021 18:02:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 212FC779D7;
	Tue, 26 Jan 2021 18:02:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 078BD180954D;
	Tue, 26 Jan 2021 18:02:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QDCLMW032716 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 08:12:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 46C662026D76; Tue, 26 Jan 2021 13:12:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41B192026D47
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 13:12:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69A3D805B2F
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 13:12:18 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-424-I0QrTQ6ROlKsC9IpfOR5Dg-1; Tue, 26 Jan 2021 08:12:15 -0500
X-MC-Unique: I0QrTQ6ROlKsC9IpfOR5Dg-1
Received: by mail-pj1-f65.google.com with SMTP id md11so1955135pjb.0;
	Tue, 26 Jan 2021 05:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4yz02GiswhidfSCxDhxsCfQ1U1OCeS05kp58XLLSkHI=;
	b=hOr1UZPeiy2o0IS2YPKcXFVQ3tgpyfGd/c4/QwlcfQIAPTvP3MK7JtgSgNToFxhbgB
	GXFZGxskERaeaKD5SeaPMUwrLYfLclCau3/XanQDll65Ne19hU1y2JIHDptpc3KxF4o4
	B/sbprzMrNipFIxpuyfzTzv32lgbR7WtlqLVDHysD6VqeEkOJLoRZbPzx+B5uB1cH0bt
	7DSajGbm9IaKJtquxChpL20fAiPQ54ysYZ1Z5tCU9rCJtDmp0mx+HCqNNs0aecm2QiXW
	YzvUv9juYgi3W0dPVLNjnvIhO5gVkTN9FaJ/JKbooNWWbQABAdKI41nNERUG4PxLyj4I
	rhdg==
X-Gm-Message-State: AOAM5314QAxN2Nzhq/I5B/jOnFnkHiaSxFglToe+62/1x0PdVE5CkX4k
	EMYWa5C1cJIeDKB1R3hdCEJXx1Vv3d8=
X-Google-Smtp-Source: ABdhPJzR8wLYLQsVYfj6qAZehYyx0M0CxHOpePj7UPFJ275CZUvDY46ClZK7fuw8mjexl0G/+t+Nkg==
X-Received: by 2002:a17:902:b692:b029:de:43aa:6537 with SMTP id
	c18-20020a170902b692b02900de43aa6537mr6137430pls.65.1611666734751;
	Tue, 26 Jan 2021 05:12:14 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
	by smtp.gmail.com with ESMTPSA id bt8sm2549205pjb.0.2021.01.26.05.12.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Jan 2021 05:12:14 -0800 (PST)
From: menglong8.dong@gmail.com
X-Google-Original-From: yang.yang29@zte.com.cn
To: paul@paul-moore.com
Subject: [PATCH] audit: Make audit_filter_syscall() return void
Date: Tue, 26 Jan 2021 05:11:51 -0800
Message-Id: <20210126131151.10418-1-yang.yang29@zte.com.cn>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 26 Jan 2021 12:56:39 -0500
Cc: Yang Yang <yang.yang29@zte.com.cn>, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Yang Yang <yang.yang29@zte.com.cn>

No invoker users the return value of audit_filter_syscall().
So make it return void.

Signed-off-by: Yang Yang <yang.yang29@zte.com.cn>
---
 kernel/auditsc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index ce8c9e2279ba..c8e16b9c0f21 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -804,7 +804,7 @@ static int audit_in_mask(const struct audit_krule *rule, unsigned long val)
  * also not high enough that we already know we have to write an audit
  * record (i.e., the state is AUDIT_SETUP_CONTEXT or AUDIT_BUILD_CONTEXT).
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


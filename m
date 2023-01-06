Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6316E6603A5
	for <lists+linux-audit@lfdr.de>; Fri,  6 Jan 2023 16:44:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673019881;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hUGJw4O0w+cAFSn/oby7WaPT13U1oCwTstXL5QLukgk=;
	b=EjNxVECQrzYo5Cj5ytcla4xN/ffcQhnm2BMeXYO/h2y3FPmyxfQbDUqE3nACCGHV55FdJX
	GubaLVxAdc1cRkXmv3JbbdD/Z/AEubc/t0bpXHcG17/0ZlGuPqTSJ4L0547kNB4sLgV5fo
	y9XOMzMR8eFdPiqe1/ieJ0mNL6jG4Zc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-korVWLxoOkut8J2gYLDbJw-1; Fri, 06 Jan 2023 10:44:39 -0500
X-MC-Unique: korVWLxoOkut8J2gYLDbJw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F0B285CBCB;
	Fri,  6 Jan 2023 15:44:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D90B1121314;
	Fri,  6 Jan 2023 15:44:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BAFD01947079;
	Fri,  6 Jan 2023 15:44:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AF326194706B for <linux-audit@listman.corp.redhat.com>;
 Fri,  6 Jan 2023 15:44:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 35AFC400E40A; Fri,  6 Jan 2023 15:44:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DDA940C945A
 for <linux-audit@redhat.com>; Fri,  6 Jan 2023 15:44:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFEF685CBE1
 for <linux-audit@redhat.com>; Fri,  6 Jan 2023 15:44:07 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-X7mWtyquPUuITz1hOqNWaA-1; Fri, 06 Jan 2023 10:44:03 -0500
X-MC-Unique: X7mWtyquPUuITz1hOqNWaA-1
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-4c186ff0506so27683357b3.6
 for <linux-audit@redhat.com>; Fri, 06 Jan 2023 07:44:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8YtDOALCm4j61oIDe5piCQL9JbkyPVTVUGZdht/Bzik=;
 b=FfVygBgLJGw8nto7Dzjj90pwW4QZn8FApUIJKykfeq9wEBrOfOY8dMtkoDiPAOc3IQ
 txJLS5fByIdUf529fj/krvog+rex/lGwqmNwAXZnks2zOAyEzRCCaHYB4agrCL4KwyBm
 YwRXAe1tR2K9LQvdAvkGwOVY+0GIDNm6jHcU/dE5DS/m1YbUNttFiF4N80mNQnuJUNb0
 WcXatc5ll8+TSiLZiM1ZgAsniGJWwgyVZvbKouZYf7SuwSshvDqB3SXTpCuo04B4x3Ys
 vP0VEsmsDSATYKtGLSUlHHbFN1kUJScIdYGcuqRKhoItHbkFK6YyCOUY7/1UAjNukF2y
 1EFw==
X-Gm-Message-State: AFqh2koQF6YUyf5Ft74wPVuhwei0suPUGbtwT2cb9EZr38P7YHkcoNCy
 lXwcaoklLAJolt+TK63G3j1SzqT/sFPZKP4=
X-Google-Smtp-Source: AMrXdXudGOJNnZV0xOrQj49/7/cL6W3q8iHq8Fpvr7yr6sQYlnvLQxoqwakTM93PjIK7EQjTCLQoXQ==
X-Received: by 2002:a05:7500:5708:b0:f0:2e10:4737 with SMTP id
 by8-20020a057500570800b000f02e104737mr521506gab.37.1673019841713; 
 Fri, 06 Jan 2023 07:44:01 -0800 (PST)
Received: from localhost (pool-108-26-161-203.bstnma.fios.verizon.net.
 [108.26.161.203]) by smtp.gmail.com with ESMTPSA id
 z9-20020ac87ca9000000b003a7e2aea23esm633021qtv.86.2023.01.06.07.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 07:44:00 -0800 (PST)
From: Paul Moore <paul@paul-moore.com>
To: linux-audit@redhat.com,
	bpf@vger.kernel.org
Subject: [PATCH v3 1/2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD
 and PERF_BPF_EVENT_PROG_UNLOAD
Date: Fri,  6 Jan 2023 10:43:59 -0500
Message-Id: <20230106154400.74211-1-paul@paul-moore.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Burn Alting <burn.alting@iinet.net.au>, Stanislav Fomichev <sdf@google.com>,
 Alexei Starovoitov <ast@kernel.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When changing the ebpf program put() routines to support being called
from within IRQ context the program ID was reset to zero prior to
calling the perf event and audit UNLOAD record generators, which
resulted in problems as the ebpf program ID was bogus (always zero).
This patch addresses this problem by removing an unnecessary call to
bpf_prog_free_id() in __bpf_prog_offload_destroy() and adjusting
__bpf_prog_put() to only call bpf_prog_free_id() after audit and perf
have finished their bpf program unload tasks in
bpf_prog_put_deferred().  For the record, no one can determine, or
remember, why it was necessary to free the program ID, and remove it
from the IDR, prior to executing bpf_prog_put_deferred();
regardless, both Stanislav and Alexei agree that the approach in this
patch should be safe.

It is worth noting that when moving the bpf_prog_free_id() call, the
do_idr_lock parameter was forced to true as the ebpf devs determined
this was the correct as the do_idr_lock should always be true.  The
do_idr_lock parameter will be removed in a follow-up patch, but it
was kept here to keep the patch small in an effort to ease any stable
backports.

I also modified the bpf_audit_prog() logic used to associate the
AUDIT_BPF record with other associated records, e.g. @ctx != NULL.
Instead of keying off the operation, it now keys off the execution
context, e.g. '!in_irg && !irqs_disabled()', which is much more
appropriate and should help better connect the UNLOAD operations with
the associated audit state (other audit records).

Cc: stable@vger.kernel.org
Fixes: d809e134be7a ("bpf: Prepare bpf_prog_put() to be called from irq context.")
Reported-by: Burn Alting <burn.alting@iinet.net.au>
Reported-by: Jiri Olsa <olsajiri@gmail.com>
Suggested-by: Stanislav Fomichev <sdf@google.com>
Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Signed-off-by: Paul Moore <paul@paul-moore.com>

---
* v3
- abandon most of the changes in v2
- move bpf_prog_free_id() after the audit/perf unload hooks
- remove bpf_prog_free_id() from __bpf_prog_offload_destroy()
- added stable tag
* v2
- change subj
- add mention of the perf regression
- drop the dedicated program audit ID
- add the bpf_prog::valid_id flag, bpf_prog_get_id() getter
- convert prog ID users to new ID getter
* v1
- subj was: "bpf: restore the ebpf audit UNLOAD id field"
- initial draft
---
 kernel/bpf/offload.c | 3 ---
 kernel/bpf/syscall.c | 6 ++----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/kernel/bpf/offload.c b/kernel/bpf/offload.c
index 13e4efc971e6..190d9f9dc987 100644
--- a/kernel/bpf/offload.c
+++ b/kernel/bpf/offload.c
@@ -216,9 +216,6 @@ static void __bpf_prog_offload_destroy(struct bpf_prog *prog)
 	if (offload->dev_state)
 		offload->offdev->ops->destroy(prog);
 
-	/* Make sure BPF_PROG_GET_NEXT_ID can't find this dead program */
-	bpf_prog_free_id(prog, true);
-
 	list_del_init(&offload->offloads);
 	kfree(offload);
 	prog->aux->offload = NULL;
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 64131f88c553..61bb19e81b9c 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -1972,7 +1972,7 @@ static void bpf_audit_prog(const struct bpf_prog *prog, unsigned int op)
 		return;
 	if (audit_enabled == AUDIT_OFF)
 		return;
-	if (op == BPF_AUDIT_LOAD)
+	if (!in_irq() && !irqs_disabled())
 		ctx = audit_context();
 	ab = audit_log_start(ctx, GFP_ATOMIC, AUDIT_BPF);
 	if (unlikely(!ab))
@@ -2067,6 +2067,7 @@ static void bpf_prog_put_deferred(struct work_struct *work)
 	prog = aux->prog;
 	perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_UNLOAD, 0);
 	bpf_audit_prog(prog, BPF_AUDIT_UNLOAD);
+	bpf_prog_free_id(prog, true);
 	__bpf_prog_put_noref(prog, true);
 }
 
@@ -2075,9 +2076,6 @@ static void __bpf_prog_put(struct bpf_prog *prog, bool do_idr_lock)
 	struct bpf_prog_aux *aux = prog->aux;
 
 	if (atomic64_dec_and_test(&aux->refcnt)) {
-		/* bpf_prog_free_id() must be called first */
-		bpf_prog_free_id(prog, do_idr_lock);
-
 		if (in_irq() || irqs_disabled()) {
 			INIT_WORK(&aux->work, bpf_prog_put_deferred);
 			schedule_work(&aux->work);
-- 
2.39.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


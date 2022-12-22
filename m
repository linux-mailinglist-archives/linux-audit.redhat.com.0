Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 31854653A04
	for <lists+linux-audit@lfdr.de>; Thu, 22 Dec 2022 01:13:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671668038;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L+SbCNHfUcIQNyxRw8FJteQy4ysKqKflEOtSQ2SOuEI=;
	b=GRLuCabUxBPg7rYjHy+YXq4g8y9WMSTZ88BQsbjVQGC5wIHcbxVkoN4Acqt/StCe8LDQh0
	LxXPQPjcj5bTa3IYUVP3hLKImeRF1zznm+5YI9lvYq/P3G09s+Q35hx8uPkdHABVQCtn8W
	mb0xLhnbq5+RBTJZtAR/98Q9X08+43g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-PM1J6l13M7ultSDEWBaLjw-1; Wed, 21 Dec 2022 19:13:56 -0500
X-MC-Unique: PM1J6l13M7ultSDEWBaLjw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE6CC3C02548;
	Thu, 22 Dec 2022 00:13:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43F3435458;
	Thu, 22 Dec 2022 00:13:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4B78D19465B1;
	Thu, 22 Dec 2022 00:13:49 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CEE6719465A8 for <linux-audit@listman.corp.redhat.com>;
 Thu, 22 Dec 2022 00:13:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B438A2166B26; Thu, 22 Dec 2022 00:13:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC5272166B29
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 00:13:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E4F01C0512D
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 00:13:47 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-xfnpuTkbNj6VDThtth2H-g-1; Wed, 21 Dec 2022 19:13:45 -0500
X-MC-Unique: xfnpuTkbNj6VDThtth2H-g-1
Received: by mail-qt1-f173.google.com with SMTP id a16so258705qtw.10
 for <linux-audit@redhat.com>; Wed, 21 Dec 2022 16:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oPzh2dbi9FRQxXaS+QFT/IvLSNioUpOLK0ga4/GiNMM=;
 b=c0/BB2+o/WMs1wGd5cqEWg2RJUXNZI3xz+ycAkN0WC8mrqvy6mRT883BlQ5N+U33TJ
 /a+rKc0ygXIxCnJNqpVPOSuLB3ir/mvPD6pCc4IBAReLisPYBYWM75WtPXE41Z0PJEpZ
 sOYfYiK73YTeSBO2T9VCRnigg3+ol1Uc9N9fuu3szbVM78+A63Z5ZXUvkLYmg5hpLPWp
 63yraibFvHYmGFsaIQShSNXs8309LJo9XVc9fAj904YbC7IgeAaJajkd0/9AlUfQOJeR
 ds709Ax5o8kEQC7l48s33B998XPKfHiEa/Uf7D04Vlsxx97/VBx1xzFqNzr/T1pORTVI
 kOHg==
X-Gm-Message-State: AFqh2koyjoqQ/DjhORSXNNsQkzwDaDERQTAvKrBg3yNPnivAwb9UkDYu
 qqaCqr4daIS4RYaTknN++DmGjhEGXpazyCA=
X-Google-Smtp-Source: AMrXdXtusb1TB1KZjoCKCo/VF/OzLXSSem8vfyVqgYxAlWc4hMDJeejvKL/XVKnVip6GovUHBocaNw==
X-Received: by 2002:ac8:749a:0:b0:3a8:2a89:d57d with SMTP id
 v26-20020ac8749a000000b003a82a89d57dmr4732033qtq.67.1671668024957; 
 Wed, 21 Dec 2022 16:13:44 -0800 (PST)
Received: from localhost (pool-108-26-161-203.bstnma.fios.verizon.net.
 [108.26.161.203]) by smtp.gmail.com with ESMTPSA id
 c3-20020ac80543000000b003a6a7a20575sm9962621qth.73.2022.12.21.16.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 16:13:44 -0800 (PST)
From: Paul Moore <paul@paul-moore.com>
To: linux-audit@redhat.com,
	bpf@vger.kernel.org
Subject: [PATCH] bpf: restore the ebpf audit UNLOAD id field
Date: Wed, 21 Dec 2022 19:13:43 -0500
Message-Id: <20221222001343.489117-1-paul@paul-moore.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: Burn Alting <burn.alting@iinet.net.au>, Alexei Starovoitov <ast@kernel.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When changing the ebpf program put() routines to support being called
from within IRQ context the program ID was reset to zero prior to
generating the audit UNLOAD record, which obviously rendered the ID
field bogus (always zero).  This patch resolves this by adding a new
field, bpf_prog_aux::id_audit, which is set when the ebpf program is
allocated an ID and never reset, ensuring a valid ID field,
regardless of the state of the original ID field, bpf_prox_aud::id.

I also modified the bpf_audit_prog() logic used to associate the
AUDIT_BPF record with other associated records, e.g. @ctx != NULL.
Instead of keying off the operation, it now keys off the execution
context, e.g. '!in_irg && !irqs_disabled()', which is much more
appropriate and should help better connect the UNLOAD operations with
the associated audit state (other audit records).

As an note to future bug hunters, I did briefly consider removing the
ID reset in bpf_prog_free_id(), as it would seem that once the
program is removed from the idr pool it can no longer be found by its
ID value, but commit ad8ad79f4f60 ("bpf: offload: free program id
when device disappears") seems to imply that it is beneficial to
reset the ID value.  Perhaps as a secondary indicator that the ebpf
program is unbound/orphaned.

Fixes: d809e134be7a ("bpf: Prepare bpf_prog_put() to be called from irq context.")
Reported-by: Burn Alting <burn.alting@iinet.net.au>
Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 include/linux/bpf.h  | 1 +
 kernel/bpf/syscall.c | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 9e7d46d16032..a22001ceb2c3 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1103,6 +1103,7 @@ struct bpf_prog_aux {
 	u32 max_tp_access;
 	u32 stack_depth;
 	u32 id;
+	u32 id_audit; /* preserves the id for use by audit */
 	u32 func_cnt; /* used by non-func prog as the number of func progs */
 	u32 func_idx; /* 0 for non-func prog, the index in func array for func prog */
 	u32 attach_btf_id; /* in-kernel BTF type id to attach to */
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 7b373a5e861f..3ec09f4dba18 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -1958,13 +1958,13 @@ static void bpf_audit_prog(const struct bpf_prog *prog, unsigned int op)
 		return;
 	if (audit_enabled == AUDIT_OFF)
 		return;
-	if (op == BPF_AUDIT_LOAD)
+	if (!in_irq() && !irqs_disabled())
 		ctx = audit_context();
 	ab = audit_log_start(ctx, GFP_ATOMIC, AUDIT_BPF);
 	if (unlikely(!ab))
 		return;
 	audit_log_format(ab, "prog-id=%u op=%s",
-			 prog->aux->id, bpf_audit_str[op]);
+			 prog->aux->id_audit, bpf_audit_str[op]);
 	audit_log_end(ab);
 }
 
@@ -1975,8 +1975,10 @@ static int bpf_prog_alloc_id(struct bpf_prog *prog)
 	idr_preload(GFP_KERNEL);
 	spin_lock_bh(&prog_idr_lock);
 	id = idr_alloc_cyclic(&prog_idr, prog, 1, INT_MAX, GFP_ATOMIC);
-	if (id > 0)
+	if (id > 0) {
 		prog->aux->id = id;
+		prog->aux->id_audit = id;
+	}
 	spin_unlock_bh(&prog_idr_lock);
 	idr_preload_end();
 
-- 
2.39.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6006553BD
	for <lists+linux-audit@lfdr.de>; Fri, 23 Dec 2022 19:56:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671821765;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=asiHuOkcbekxm31BZtphD1tarMMM2R55B6VI8uEw3FA=;
	b=O/1dcidpNZOs/XCfIIFFGsLbvYoVs1RshFUR7ZV/PUfMO2SYtZlTA+VGN6naFhAbyE7Uud
	D3PsUW582cdB2IXKrGKG3r5gL3FJW5B15lLIlr+5KZtci1CR6Fyh4HYEIHEsJfAqcb2sna
	hnuY32LjK4m+G8QnMpNAevF3ts7uZ7g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-EUrbQZOCNT-s_TaQnj9pnw-1; Fri, 23 Dec 2022 13:55:58 -0500
X-MC-Unique: EUrbQZOCNT-s_TaQnj9pnw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BC77101AA63;
	Fri, 23 Dec 2022 18:55:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09C452026D68;
	Fri, 23 Dec 2022 18:55:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2E6E71946A71;
	Fri, 23 Dec 2022 18:55:53 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8076C19465B1 for <linux-audit@listman.corp.redhat.com>;
 Fri, 23 Dec 2022 18:55:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 63792C15BAE; Fri, 23 Dec 2022 18:55:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BD04C15BA0
 for <linux-audit@redhat.com>; Fri, 23 Dec 2022 18:55:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 368682802E21
 for <linux-audit@redhat.com>; Fri, 23 Dec 2022 18:55:40 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-351-8jm3k5RPMXuhVSaa4HoaEQ-1; Fri, 23 Dec 2022 13:55:35 -0500
X-MC-Unique: 8jm3k5RPMXuhVSaa4HoaEQ-1
Received: by mail-qt1-f179.google.com with SMTP id jr11so4365783qtb.7
 for <linux-audit@redhat.com>; Fri, 23 Dec 2022 10:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lhhMHYaC67tFGFGcSbdKjULs2J3+Vd+1RKeEK+kH4Cc=;
 b=itYWBwQzT2IG38JZODIH43Lt37xgbpxCciGTUE0pxiBb4R0BVfglKTRZUoSpsecCh5
 BITxTnRvEGVFanI98hkbV9P1gc5ytMQdTUc0w4pZdIJIL8ECFJWNoLXl8/k0yKG+tkfg
 TyytJZrvg9ppTB/d0m7LyRiN0V9LdJAsvJamLh3xC6MfRNc/seesBywpxwPaaP217dcv
 N/Kf93pUOd9X7uaVSnQUOeaVT+tI8a7a/TaMWD7GBwu9gkp5CjeiyTq2mjmrp3NZoJMt
 FeZY3WgAw/ZkwjgCu8kzC3o8tEUpyrni2GtHiSAiAk9xMFIWfhycXUWA/613WiWbOQu9
 lhOw==
X-Gm-Message-State: AFqh2kpgCCpDOTXUW01dFIt25uq1J/2MGMGf5BeauNNa7CUW6zwhE6al
 PQsL6Lt+6WCia6nkn+LvZiKXTt//CncOFBk=
X-Google-Smtp-Source: AMrXdXu8cul6nGNvqFpetdDXyEX3mJ61V9n58IzDc+hHnff1D4ZmgroXFQTgbc8qqkB+rVWcDXxesw==
X-Received: by 2002:ac8:7354:0:b0:3a6:a699:3cd8 with SMTP id
 q20-20020ac87354000000b003a6a6993cd8mr12926355qtp.57.1671821734468; 
 Fri, 23 Dec 2022 10:55:34 -0800 (PST)
Received: from localhost (pool-108-26-161-203.bstnma.fios.verizon.net.
 [108.26.161.203]) by smtp.gmail.com with ESMTPSA id
 bm36-20020a05620a19a400b006fa4cac54a5sm2696550qkb.72.2022.12.23.10.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 10:55:32 -0800 (PST)
From: Paul Moore <paul@paul-moore.com>
To: linux-audit@redhat.com,
	bpf@vger.kernel.org
Subject: [PATCH v2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD and
 PERF_BPF_EVENT_PROG_UNLOAD
Date: Fri, 23 Dec 2022 13:55:31 -0500
Message-Id: <20221223185531.222689-1-paul@paul-moore.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Burn Alting <burn.alting@iinet.net.au>, Alexei Starovoitov <ast@kernel.org>,
 Stanislav Fomichev <sdf@google.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When changing the ebpf program put() routines to support being called
from within IRQ context the program ID was reset to zero prior to
calling the perf event and audit UNLOAD record generators, which
resulted in problems as the ebpf program ID was bogus (always zero).
This patch resolves this by adding a new flag, bpf_prog::valid_id, to
indicate when the bpf_prog_aux ID field is valid; it is set to true/1
in bpf_prog_alloc_id() and set to false/0 in bpf_prog_free_id().  In
order to help ensure that access to the bpf_prog_aux ID field takes
into account the new valid_id flag, the bpf_prog_aux ID field is
renamed to bpf_prog_aux::__id and a getter function,
bpf_prog_get_id(), was created and all users of bpf_prog_aux::id were
converted to the new caller.  Exceptions to this include some of the
internal ebpf functions and the xdp trace points, although the latter
still take into account the valid_id flag.

I also modified the bpf_audit_prog() logic used to associate the
AUDIT_BPF record with other associated records, e.g. @ctx != NULL.
Instead of keying off the operation, it now keys off the execution
context, e.g. '!in_irg && !irqs_disabled()', which is much more
appropriate and should help better connect the UNLOAD operations with
the associated audit state (other audit records).

Fixes: d809e134be7a ("bpf: Prepare bpf_prog_put() to be called from irq context.")
Reported-by: Burn Alting <burn.alting@iinet.net.au>
Reported-by: Jiri Olsa <olsajiri@gmail.com>
Signed-off-by: Paul Moore <paul@paul-moore.com>

--
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
 drivers/net/netdevsim/bpf.c  |  6 ++++--
 include/linux/bpf.h          | 11 +++++++++--
 include/linux/bpf_verifier.h |  2 +-
 include/trace/events/xdp.h   |  4 ++--
 kernel/bpf/arraymap.c        |  2 +-
 kernel/bpf/bpf_struct_ops.c  |  2 +-
 kernel/bpf/cgroup.c          |  2 +-
 kernel/bpf/core.c            |  2 +-
 kernel/bpf/cpumap.c          |  2 +-
 kernel/bpf/devmap.c          |  2 +-
 kernel/bpf/syscall.c         | 27 +++++++++++++++------------
 kernel/events/core.c         |  6 +++++-
 kernel/trace/bpf_trace.c     |  2 +-
 net/core/dev.c               |  2 +-
 net/core/filter.c            |  3 ++-
 net/core/rtnetlink.c         |  2 +-
 net/core/sock_map.c          |  2 +-
 net/ipv6/seg6_local.c        |  3 ++-
 net/sched/act_bpf.c          |  2 +-
 net/sched/cls_bpf.c          |  2 +-
 20 files changed, 52 insertions(+), 34 deletions(-)

diff --git a/drivers/net/netdevsim/bpf.c b/drivers/net/netdevsim/bpf.c
index 50854265864d..2795f03f5f34 100644
--- a/drivers/net/netdevsim/bpf.c
+++ b/drivers/net/netdevsim/bpf.c
@@ -109,7 +109,7 @@ nsim_bpf_offload(struct netdevsim *ns, struct bpf_prog *prog, bool oldprog)
 	     "bad offload state, expected offload %sto be active",
 	     oldprog ? "" : "not ");
 	ns->bpf_offloaded = prog;
-	ns->bpf_offloaded_id = prog ? prog->aux->id : 0;
+	ns->bpf_offloaded_id = prog ? bpf_prog_get_id(prog) : 0;
 	nsim_prog_set_loaded(prog, true);
 
 	return 0;
@@ -221,6 +221,7 @@ static int nsim_bpf_create_prog(struct nsim_dev *nsim_dev,
 	struct nsim_bpf_bound_prog *state;
 	char name[16];
 	int ret;
+	u32 id;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
@@ -239,7 +240,8 @@ static int nsim_bpf_create_prog(struct nsim_dev *nsim_dev,
 		return ret;
 	}
 
-	debugfs_create_u32("id", 0400, state->ddir, &prog->aux->id);
+	id = bpf_prog_get_id(prog);
+	debugfs_create_u32("id", 0400, state->ddir, &id);
 	debugfs_create_file("state", 0400, state->ddir,
 			    &state->state, &nsim_bpf_string_fops);
 	debugfs_create_bool("loaded", 0400, state->ddir, &state->is_loaded);
diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 9e7d46d16032..18e965bd7db9 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1102,7 +1102,7 @@ struct bpf_prog_aux {
 	u32 max_pkt_offset;
 	u32 max_tp_access;
 	u32 stack_depth;
-	u32 id;
+	u32 __id; /* access via bpf_prog_get_id() to check bpf_prog::valid_id */
 	u32 func_cnt; /* used by non-func prog as the number of func progs */
 	u32 func_idx; /* 0 for non-func prog, the index in func array for func prog */
 	u32 attach_btf_id; /* in-kernel BTF type id to attach to */
@@ -1197,7 +1197,8 @@ struct bpf_prog {
 				enforce_expected_attach_type:1, /* Enforce expected_attach_type checking at attach time */
 				call_get_stack:1, /* Do we call bpf_get_stack() or bpf_get_stackid() */
 				call_get_func_ip:1, /* Do we call get_func_ip() */
-				tstamp_type_access:1; /* Accessed __sk_buff->tstamp_type */
+				tstamp_type_access:1, /* Accessed __sk_buff->tstamp_type */
+				valid_id:1; /* Is bpf_prog::aux::__id valid? */
 	enum bpf_prog_type	type;		/* Type of BPF program */
 	enum bpf_attach_type	expected_attach_type; /* For some prog types */
 	u32			len;		/* Number of filter blocks */
@@ -1688,6 +1689,12 @@ void bpf_prog_inc(struct bpf_prog *prog);
 struct bpf_prog * __must_check bpf_prog_inc_not_zero(struct bpf_prog *prog);
 void bpf_prog_put(struct bpf_prog *prog);
 
+static inline u32 bpf_prog_get_id(const struct bpf_prog *prog)
+{
+	if (WARN(!prog->valid_id, "Attempting to use an invalid eBPF program"))
+		return 0;
+	return prog->aux->__id;
+}
 void bpf_prog_free_id(struct bpf_prog *prog, bool do_idr_lock);
 void bpf_map_free_id(struct bpf_map *map, bool do_idr_lock);
 
diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index 9e1e6965f407..525c02cc12ea 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -604,7 +604,7 @@ static inline u64 bpf_trampoline_compute_key(const struct bpf_prog *tgt_prog,
 					     struct btf *btf, u32 btf_id)
 {
 	if (tgt_prog)
-		return ((u64)tgt_prog->aux->id << 32) | btf_id;
+		return ((u64)bpf_prog_get_id(tgt_prog) << 32) | btf_id;
 	else
 		return ((u64)btf_obj_id(btf) << 32) | 0x80000000 | btf_id;
 }
diff --git a/include/trace/events/xdp.h b/include/trace/events/xdp.h
index c40fc97f9417..a1c3048872ea 100644
--- a/include/trace/events/xdp.h
+++ b/include/trace/events/xdp.h
@@ -39,7 +39,7 @@ TRACE_EVENT(xdp_exception,
 	),
 
 	TP_fast_assign(
-		__entry->prog_id	= xdp->aux->id;
+		__entry->prog_id	= (xdp->valid_id ? xdp->aux->__id : 0);
 		__entry->act		= act;
 		__entry->ifindex	= dev->ifindex;
 	),
@@ -120,7 +120,7 @@ DECLARE_EVENT_CLASS(xdp_redirect_template,
 			map_index = 0;
 		}
 
-		__entry->prog_id	= xdp->aux->id;
+		__entry->prog_id	= (xdp->valid_id ? xdp->aux->__id : 0);
 		__entry->act		= XDP_REDIRECT;
 		__entry->ifindex	= dev->ifindex;
 		__entry->err		= err;
diff --git a/kernel/bpf/arraymap.c b/kernel/bpf/arraymap.c
index 832b2659e96e..d19db5980b1b 100644
--- a/kernel/bpf/arraymap.c
+++ b/kernel/bpf/arraymap.c
@@ -905,7 +905,7 @@ static void prog_fd_array_put_ptr(void *ptr)
 
 static u32 prog_fd_array_sys_lookup_elem(void *ptr)
 {
-	return ((struct bpf_prog *)ptr)->aux->id;
+	return bpf_prog_get_id((struct bpf_prog *)ptr);
 }
 
 /* decrement refcnt of all bpf_progs that are stored in this map */
diff --git a/kernel/bpf/bpf_struct_ops.c b/kernel/bpf/bpf_struct_ops.c
index 84b2d9dba79a..6c20e6cd9442 100644
--- a/kernel/bpf/bpf_struct_ops.c
+++ b/kernel/bpf/bpf_struct_ops.c
@@ -488,7 +488,7 @@ static int bpf_struct_ops_map_update_elem(struct bpf_map *map, void *key,
 		image += err;
 
 		/* put prog_id to udata */
-		*(unsigned long *)(udata + moff) = prog->aux->id;
+		*(unsigned long *)(udata + moff) = bpf_prog_get_id(prog);
 	}
 
 	refcount_set(&kvalue->refcnt, 1);
diff --git a/kernel/bpf/cgroup.c b/kernel/bpf/cgroup.c
index bf2fdb33fb31..4a8d26f1d5d1 100644
--- a/kernel/bpf/cgroup.c
+++ b/kernel/bpf/cgroup.c
@@ -1091,7 +1091,7 @@ static int __cgroup_bpf_query(struct cgroup *cgrp, const union bpf_attr *attr,
 			i = 0;
 			hlist_for_each_entry(pl, progs, node) {
 				prog = prog_list_prog(pl);
-				id = prog->aux->id;
+				id = bpf_prog_get_id(prog);
 				if (copy_to_user(prog_ids + i, &id, sizeof(id)))
 					return -EFAULT;
 				if (++i == cnt)
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 25a54e04560e..ea3938ab6f5b 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -2293,7 +2293,7 @@ static bool bpf_prog_array_copy_core(struct bpf_prog_array *array,
 	for (item = array->items; item->prog; item++) {
 		if (item->prog == &dummy_bpf_prog.prog)
 			continue;
-		prog_ids[i] = item->prog->aux->id;
+		prog_ids[i] = bpf_prog_get_id(item->prog);
 		if (++i == request_cnt) {
 			item++;
 			break;
diff --git a/kernel/bpf/cpumap.c b/kernel/bpf/cpumap.c
index b5ba34ddd4b6..3f3423d03aea 100644
--- a/kernel/bpf/cpumap.c
+++ b/kernel/bpf/cpumap.c
@@ -413,7 +413,7 @@ static int __cpu_map_load_bpf_program(struct bpf_cpu_map_entry *rcpu,
 		return -EINVAL;
 	}
 
-	rcpu->value.bpf_prog.id = prog->aux->id;
+	rcpu->value.bpf_prog.id = bpf_prog_get_id(prog);
 	rcpu->prog = prog;
 
 	return 0;
diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
index f9a87dcc5535..d46309d4aa9e 100644
--- a/kernel/bpf/devmap.c
+++ b/kernel/bpf/devmap.c
@@ -868,7 +868,7 @@ static struct bpf_dtab_netdev *__dev_map_alloc_node(struct net *net,
 	dev->dtab = dtab;
 	if (prog) {
 		dev->xdp_prog = prog;
-		dev->val.bpf_prog.id = prog->aux->id;
+		dev->val.bpf_prog.id = bpf_prog_get_id(prog);
 	} else {
 		dev->xdp_prog = NULL;
 		dev->val.bpf_prog.id = 0;
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 7b373a5e861f..9e862ef792cb 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -1958,13 +1958,14 @@ static void bpf_audit_prog(const struct bpf_prog *prog, unsigned int op)
 		return;
 	if (audit_enabled == AUDIT_OFF)
 		return;
-	if (op == BPF_AUDIT_LOAD)
+	if (!in_irq() && !irqs_disabled())
 		ctx = audit_context();
 	ab = audit_log_start(ctx, GFP_ATOMIC, AUDIT_BPF);
 	if (unlikely(!ab))
 		return;
+	/* log the id regardless of bpf_prog::valid_id */
 	audit_log_format(ab, "prog-id=%u op=%s",
-			 prog->aux->id, bpf_audit_str[op]);
+			 prog->aux->__id, bpf_audit_str[op]);
 	audit_log_end(ab);
 }
 
@@ -1975,8 +1976,10 @@ static int bpf_prog_alloc_id(struct bpf_prog *prog)
 	idr_preload(GFP_KERNEL);
 	spin_lock_bh(&prog_idr_lock);
 	id = idr_alloc_cyclic(&prog_idr, prog, 1, INT_MAX, GFP_ATOMIC);
-	if (id > 0)
-		prog->aux->id = id;
+	if (id > 0) {
+		prog->aux->__id = id;
+		prog->valid_id = true;
+	}
 	spin_unlock_bh(&prog_idr_lock);
 	idr_preload_end();
 
@@ -1996,7 +1999,7 @@ void bpf_prog_free_id(struct bpf_prog *prog, bool do_idr_lock)
 	 * disappears - even if someone grabs an fd to them they are unusable,
 	 * simply waiting for refcnt to drop to be freed.
 	 */
-	if (!prog->aux->id)
+	if (!prog->valid_id)
 		return;
 
 	if (do_idr_lock)
@@ -2004,8 +2007,8 @@ void bpf_prog_free_id(struct bpf_prog *prog, bool do_idr_lock)
 	else
 		__acquire(&prog_idr_lock);
 
-	idr_remove(&prog_idr, prog->aux->id);
-	prog->aux->id = 0;
+	idr_remove(&prog_idr, prog->aux->__id);
+	prog->valid_id = false;
 
 	if (do_idr_lock)
 		spin_unlock_irqrestore(&prog_idr_lock, flags);
@@ -2154,7 +2157,7 @@ static void bpf_prog_show_fdinfo(struct seq_file *m, struct file *filp)
 		   prog->jited,
 		   prog_tag,
 		   prog->pages * 1ULL << PAGE_SHIFT,
-		   prog->aux->id,
+		   bpf_prog_get_id(prog),
 		   stats.nsecs,
 		   stats.cnt,
 		   stats.misses,
@@ -2786,7 +2789,7 @@ static void bpf_link_show_fdinfo(struct seq_file *m, struct file *filp)
 		   bpf_link_type_strs[link->type],
 		   link->id,
 		   prog_tag,
-		   prog->aux->id);
+		   bpf_prog_get_id(prog));
 	if (link->ops->show_fdinfo)
 		link->ops->show_fdinfo(link, m);
 }
@@ -3914,7 +3917,7 @@ static int bpf_prog_get_info_by_fd(struct file *file,
 		return -EFAULT;
 
 	info.type = prog->type;
-	info.id = prog->aux->id;
+	info.id = bpf_prog_get_id(prog);
 	info.load_time = prog->aux->load_time;
 	info.created_by_uid = from_kuid_munged(current_user_ns(),
 					       prog->aux->user->uid);
@@ -4261,7 +4264,7 @@ static int bpf_link_get_info_by_fd(struct file *file,
 
 	info.type = link->type;
 	info.id = link->id;
-	info.prog_id = link->prog->aux->id;
+	info.prog_id = bpf_prog_get_id(link->prog);
 
 	if (link->ops->fill_link_info) {
 		err = link->ops->fill_link_info(link, &info);
@@ -4426,7 +4429,7 @@ static int bpf_task_fd_query(const union bpf_attr *attr,
 			struct bpf_raw_event_map *btp = raw_tp->btp;
 
 			err = bpf_task_fd_query_copy(attr, uattr,
-						     raw_tp->link.prog->aux->id,
+						     bpf_prog_get_id(raw_tp->link.prog),
 						     BPF_FD_TYPE_RAW_TRACEPOINT,
 						     btp->tp->name, 0, 0);
 			goto put_file;
diff --git a/kernel/events/core.c b/kernel/events/core.c
index aefc1e08e015..c24e897d27f1 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -9001,7 +9001,11 @@ void perf_event_bpf_event(struct bpf_prog *prog,
 			},
 			.type = type,
 			.flags = flags,
-			.id = prog->aux->id,
+			/*
+			 * don't use bpf_prog_get_id() as the id may be marked
+			 * invalid on PERF_BPF_EVENT_PROG_UNLOAD events
+			 */
+			.id = prog->aux->__id,
 		},
 	};
 
diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index 49fb9ec8366d..7cd0eb83b137 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -2344,7 +2344,7 @@ int bpf_get_perf_event_info(const struct perf_event *event, u32 *prog_id,
 	if (prog->type == BPF_PROG_TYPE_PERF_EVENT)
 		return -EOPNOTSUPP;
 
-	*prog_id = prog->aux->id;
+	*prog_id = bpf_prog_get_id(prog);
 	flags = event->tp_event->flags;
 	is_tracepoint = flags & TRACE_EVENT_FL_TRACEPOINT;
 	is_syscall_tp = is_syscall_trace_event(event->tp_event);
diff --git a/net/core/dev.c b/net/core/dev.c
index fa53830d0683..0d39ef22cf4b 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -9068,7 +9068,7 @@ u32 dev_xdp_prog_id(struct net_device *dev, enum bpf_xdp_mode mode)
 {
 	struct bpf_prog *prog = dev_xdp_prog(dev, mode);
 
-	return prog ? prog->aux->id : 0;
+	return prog ? bpf_prog_get_id(prog) : 0;
 }
 
 static void dev_xdp_set_link(struct net_device *dev, enum bpf_xdp_mode mode,
diff --git a/net/core/filter.c b/net/core/filter.c
index bb0136e7a8e4..282ccfe34ced 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -8729,7 +8729,8 @@ void bpf_warn_invalid_xdp_action(struct net_device *dev, struct bpf_prog *prog,
 
 	pr_warn_once("%s XDP return value %u on prog %s (id %d) dev %s, expect packet loss!\n",
 		     act > act_max ? "Illegal" : "Driver unsupported",
-		     act, prog->aux->name, prog->aux->id, dev ? dev->name : "N/A");
+		     act, prog->aux->name, bpf_prog_get_id(prog),
+		     dev ? dev->name : "N/A");
 }
 EXPORT_SYMBOL_GPL(bpf_warn_invalid_xdp_action);
 
diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index 74864dc46a7e..1f7e36909541 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -1453,7 +1453,7 @@ static u32 rtnl_xdp_prog_skb(struct net_device *dev)
 	generic_xdp_prog = rtnl_dereference(dev->xdp_prog);
 	if (!generic_xdp_prog)
 		return 0;
-	return generic_xdp_prog->aux->id;
+	return bpf_prog_get_id(generic_xdp_prog);
 }
 
 static u32 rtnl_xdp_prog_drv(struct net_device *dev)
diff --git a/net/core/sock_map.c b/net/core/sock_map.c
index a660baedd9e7..550ec6cb3aee 100644
--- a/net/core/sock_map.c
+++ b/net/core/sock_map.c
@@ -1518,7 +1518,7 @@ int sock_map_bpf_prog_query(const union bpf_attr *attr,
 	/* we do not hold the refcnt, the bpf prog may be released
 	 * asynchronously and the id would be set to 0.
 	 */
-	id = data_race(prog->aux->id);
+	id = data_race(bpf_prog_get_id(prog));
 	if (id == 0)
 		prog_cnt = 0;
 
diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index 8370726ae7bf..440ce3aba802 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -1543,7 +1543,8 @@ static int put_nla_bpf(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 	if (!nest)
 		return -EMSGSIZE;
 
-	if (nla_put_u32(skb, SEG6_LOCAL_BPF_PROG, slwt->bpf.prog->aux->id))
+	if (nla_put_u32(skb, SEG6_LOCAL_BPF_PROG,
+			bpf_prog_get_id(slwt->bpf.prog)))
 		return -EMSGSIZE;
 
 	if (slwt->bpf.name &&
diff --git a/net/sched/act_bpf.c b/net/sched/act_bpf.c
index b79eee44e24e..604a29e482b0 100644
--- a/net/sched/act_bpf.c
+++ b/net/sched/act_bpf.c
@@ -121,7 +121,7 @@ static int tcf_bpf_dump_ebpf_info(const struct tcf_bpf *prog,
 	    nla_put_string(skb, TCA_ACT_BPF_NAME, prog->bpf_name))
 		return -EMSGSIZE;
 
-	if (nla_put_u32(skb, TCA_ACT_BPF_ID, prog->filter->aux->id))
+	if (nla_put_u32(skb, TCA_ACT_BPF_ID, bpf_prog_get_id(prog->filter)))
 		return -EMSGSIZE;
 
 	nla = nla_reserve(skb, TCA_ACT_BPF_TAG, sizeof(prog->filter->tag));
diff --git a/net/sched/cls_bpf.c b/net/sched/cls_bpf.c
index bc317b3eac12..eb5ac6be589e 100644
--- a/net/sched/cls_bpf.c
+++ b/net/sched/cls_bpf.c
@@ -565,7 +565,7 @@ static int cls_bpf_dump_ebpf_info(const struct cls_bpf_prog *prog,
 	    nla_put_string(skb, TCA_BPF_NAME, prog->bpf_name))
 		return -EMSGSIZE;
 
-	if (nla_put_u32(skb, TCA_BPF_ID, prog->filter->aux->id))
+	if (nla_put_u32(skb, TCA_BPF_ID, bpf_prog_get_id(prog->filter)))
 		return -EMSGSIZE;
 
 	nla = nla_reserve(skb, TCA_BPF_TAG, sizeof(prog->filter->tag));
-- 
2.39.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


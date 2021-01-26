Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9E88A304482
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 18:05:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-MrJCr0D5OEWNvUDZyUQ1xg-1; Tue, 26 Jan 2021 12:05:30 -0500
X-MC-Unique: MrJCr0D5OEWNvUDZyUQ1xg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A6A21006C92;
	Tue, 26 Jan 2021 17:05:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E644119C46;
	Tue, 26 Jan 2021 17:05:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4614180954D;
	Tue, 26 Jan 2021 17:05:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QH54qp030413 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 12:05:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 40C9D2026D48; Tue, 26 Jan 2021 17:05:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B9712026D47
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 17:05:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 650981875049
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 17:05:00 +0000 (UTC)
Received: from sonic314-26.consmr.mail.ne1.yahoo.com
	(sonic314-26.consmr.mail.ne1.yahoo.com [66.163.189.152]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-326-G8b5gh2VMVql98uClrJUWQ-1;
	Tue, 26 Jan 2021 12:04:57 -0500
X-MC-Unique: G8b5gh2VMVql98uClrJUWQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1611680696; bh=sEj/V/eDEHduIBwQzkS0y/gfSeVqHHw3tnxV5F0Mqav=;
	h=From:To:Subject:Date:From:Subject:Reply-To;
	b=rq+/A0I/A1OmXnz6wv8SjHwQcYC1jQfTKXcW1sggVa5gbca38VypTWY4XgYsGirlkrx5dn3p6RgfkqdymR+kzx4wEm3xXVaUmfeo3TiLs2Fmp/nSFqTUqZ+0A68TnnyvlguSTSJz+Vo7LZZ1/PqniWEk4/MbKufLYMAAHVU381cl0NIFkJMkVQBaEUrA01QFOFNIqqTN8xQxpRZkfjqJuk91bA9/iKdMGg/pEZ48i+XQxh3cgHzd9G5TZ+XSl/10Id6whSiCkAMO5J67gHRpqs+1lEbY0CuCVCQ29/xMJjAb5NZgJvQn+WJ1fhnuL+wQTQAhCAcRa+iizzO2QyuY0A==
X-YMail-OSG: D_8mL3EVM1mbhu0jczLqEnoNy5LJ6Q0SHNYnNlvaHLm9rwto_921ljSCGQEOYR9
	3tMMKG2AOu8BvOSHQLRD7.UyP.SMPHGBTc6bGH5tnswPruSCpjZCsR4vyP5buH3X7sdio0Ye2cql
	584O0c37R6RiyqkbM4NxcEiy1HkQvDidVxLICtfSgJfV0LZagK_f3a0dvMy0Bb2B1l7otwM7yL_k
	XLE8GZPBnSPCa0LbtWvB5up5ooBlDZ7i8bknYsDBcFYE9.5bNrRxu0fTaC790CRNF4khJR6vvSyl
	QYZYV73jjB2pjAcRmxvzB8h.fHP6iya0zagQ6LTkHdJicO99ZRDxbJIEXNX0.9GqTs53Kkvddap6
	Bzn_XXRBrqbAyTrUNoBO.5MVQVM728KXnFEKvaSIfrL3RgWRtBMq2mW38W6_UMKxhMGY.vn8eutD
	OODu_rpiP7E_GfrfC7GxVsljhP3Edpr8K60PaqCbjgKmgngRKrx9L8bWIIgIduATiyxbTQfnCdCQ
	_RwtXOFLpMNPsUFg61TrMEvnYUlRMrU4KyWSVYOSBxHYAGqKuRyQSZ0Es0Yj02CstG2rE6xqNeQz
	IKTX.CBgCphNDO2MY.mmqKmAbU8nkk._aBj0f5EyRxtQVZ4W607SRaLLoqI0zHqkDBiXtzWrRqqH
	h09u.XRswfQhqVOc2NHGTcgN5sTZqVhU9nqeRRudKVyrF9D.yf9htegqtRL6oyuFJlFW3uNioVbE
	sVmNdpxql3EBcBXFHt0W4IS2Yk8y6xI9bKp3wyIZmLVQhrp9_PJFaNL5D02FYuMRguR7GJqfNiim
	2CHdMEBB8LTN50aAfs09zUJHgZfi7Y1g0K3.TT8biZAy0SxitS15LeNZ7mNfeHczKtuHfqtD2nqm
	CN2HZ6dlIlnhyl913eYEgBIA7VwirYgzTgvW3SuxRf_f__vwyqHnmOViDBcYW6TUtCP.lRujrNj8
	53NGnG1IyD7DZyRGXAaGCywL.gYm8IZiraCXLpB8KInvditmgHZ47G.XbNeGDSJF6VwdDCJ9uxQa
	ppU2UvLSk.3hwhg_YDQUQ7DRlrIJBcqJwsl4oMFkX_yhXDffO7Cm.vaSpiFeMdeAvjnZsBXd4Pwz
	hPgFredi_9yMamNbUswKUYP38PyQ0mEH3.EjWJMDQ8LLdsY_trCP8N1jSD.yT6QlG0VebRTPNnwW
	n_qd8df_0KT8ns06ko19vrzi_T7aRXJyR0YrYYa.2LC6pNHsn5EXx9_.4aVhm.Ns7n8suKTnJbPQ
	oJgAFhf5xsgh7oVswxkUNxDv7FTNpaYJS84lyPs3HE8W4_O_.lI7MPewIavV4KKGvcYISqW1cpvK
	11mrOALHrEW_hPeDhj74BJXXhYJV.THDgG_YN7hZGrkc10QlCBsehBmirduLDdHlXEyG3.bxYCx4
	yNFbw3UDIAOXtWjWxko7KoWuMp5gFRerCPb4fWJkDAtb2WW4WvCzrrzTkF145IRYO8U9_U6eHaq.
	_Ci2gCBBSc0.XXgxENwT9NAlM3T1oWDyz00S0v_Q1KDh3tAdYCOew2bs4SgjnVfCxb32HVW9qzBa
	fSRJJ69UZzLdYWtAPSZYzNaW7oTMH4uWhXp9utCtSCMM9zB2xATXo9LfkEdsgAesKGNOpK0O4GAE
	_sLTkvV18rf0zwfaseCb7RFp75fo3zMlM38lzSEPENZNklX.k68Eu8GcGKiGNuKwwDGO4mrAnGx8
	RP3ipwgBWHeHj9IrMxZlGFbSjV4NLo.gFTECI5vjVaBX.w.kZfMmzSrDT.6K8gBSNK7ZWd9S57MI
	A556McMc2H91zcYbFtsNNbPkNK6Dm3HANEE3SjfZAqlOQ4OLHmk7oS2KwcCG_gksgVKxg7l5JHUw
	IavUN3eopSaSPUhL0dmXM.3m3vyFxE3KewXCA8qHvxcbxKnRt4SxoJ0ohAw8Vm28oejqB3QCSol7
	kIfWJOQxQOwPH2d2XBaMGvkTKo4fF57OTmBtG_auZk1s.vn2lriywxUMHjCVjyJPXaWeBNSl7OnF
	PrVjUqKscyEnzak1lYwLnkqF4DM8rMu3jsSUP9mBlfK_KZlV3ZLp_Kb4kgeqUocCZWqZeArBNxYK
	ZoF7AJQDGG4UBjtyP3OD4yTjD1_f82xXXWfyF2p9tI4Lf14r10D7qTZadqB0hZLNzBKoPVqr3FeY
	bvFiToeFxeUhIqDlTQCNWLY77w3vdBXuqwZM3_NeIH2odhaxLWkl7vs4K8mOR4hz31xys7a4hlTo
	zFjnw3_YZ_G5rzMSDOuysfyAzd53qTU_sVukR7f55ZPLDK5D4WCRKNeTxb4P7gYwN5.UnPK_HFhc
	HObnA8FTPXcST6ma5sCznbxusCZJ5wiHkP76yIkxJm9o6tKjouXAJpidTlZwKRyycFOXD2NVoxhD
	T40dIDGZRBVNRCIIUbfWAc9.a0dR2Re8ojcr3SF.Tt7CXfmm.s7IjcFWTAVmJC.j_btlDgDneZq4
	_ZpqWZc1ttsig8xn6MUJoVqRwcB87OO6cyKZJ82McIEPB2vvMU.5VY_tq9jOvdcX4oAbRezuFAUa
	Q9BO5ix2nD4Jc4XlJhI7uKtvZOWkp9GWaMkE.Y3_XbKhUm23PCAesYj4qknHdxx.QWbb2mJz2NEs
	jtlouPq905QMG_MeGJV_dwHeiax3MhJvU8TFqZD_v0is8sp8TY_j665LXZksGS6_WEYUJAtDYRo_
	xi2ei_T4eUwNtB15qmds8trTy2hQghOS5dO36ftCHIuyDABAGgz.6MsN42yWBbjYtp0PZ9P8HmtH
	UX.rgieSXlnrut_3YoI4j4qlCnLJH2hqGq2K7L_OOBZ_GbV0E3TvZJLNlz97z4ELzEm3pI4DxaRM
	VTTHWp73qkmRWFvT9o6lDS8ZD7jY42DUh_Gb3siV3KtNB1.FlC6MfNZEcNDZ9_2BjjDmGeZhQKve
	7qTMjNLKvf9MKSl4Ka9PvHwfJBPiJCgQU94MDZ3T4WIPbLLqsehnnGebphUQPoeMDBzq0B1pibzF
	TrI2F3LRoJ3zEa_jo1_Zi.Or4LEJOMO9P6VRII7CAV26NveNLqBjwC4JCwpzBJp5qD7xtP1MgReT
	OqO7bL1CLfjNjB0c4.3fEQyKshLTbtyPssshI7wYBKtErfuJg7NCpa0tXMuPA1f9xtpcdR5ZCYrq
	s_.zWVlC2zaCHx8trwTloMWZE4lgHJyiF3wbegQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 26 Jan 2021 17:04:56 +0000
Received: by smtp419.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 80a7e5fb8bfd1848cd008884d9f83c54; 
	Tue, 26 Jan 2021 17:04:52 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v24 21/25] audit: add support for non-syscall auxiliary records
Date: Tue, 26 Jan 2021 08:41:04 -0800
Message-Id: <20210126164108.1958-22-casey@schaufler-ca.com>
In-Reply-To: <20210126164108.1958-1-casey@schaufler-ca.com>
References: <20210126164108.1958-1-casey@schaufler-ca.com>
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
Cc: john.johansen@canonical.com, linux-kernel@vger.kernel.org,
	Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com,
	sds@tycho.nsa.gov
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Standalone audit records have the timestamp and serial number generated
on the fly and as such are unique, making them standalone.  This new
function audit_alloc_local() generates a local audit context that will
be used only for a standalone record and its auxiliary record(s).  The
context is discarded immediately after the local associated records are
produced.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc: linux-audit@redhat.com
To: Richard Guy Briggs <rgb@redhat.com>
---
 include/linux/audit.h |  8 ++++++++
 kernel/audit.h        |  1 +
 kernel/auditsc.c      | 33 ++++++++++++++++++++++++++++-----
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 418a485af114..97cd7471e572 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -289,6 +289,8 @@ static inline int audit_signal_info(int sig, struct task_struct *t)
 				/* Public API */
 extern int  audit_alloc(struct task_struct *task);
 extern void __audit_free(struct task_struct *task);
+extern struct audit_context *audit_alloc_local(gfp_t gfpflags);
+extern void audit_free_context(struct audit_context *context);
 extern void __audit_syscall_entry(int major, unsigned long a0, unsigned long a1,
 				  unsigned long a2, unsigned long a3);
 extern void __audit_syscall_exit(int ret_success, long ret_value);
@@ -552,6 +554,12 @@ static inline void audit_log_nfcfg(const char *name, u8 af,
 extern int audit_n_rules;
 extern int audit_signals;
 #else /* CONFIG_AUDITSYSCALL */
++static inline struct audit_context *audit_alloc_local(gfp_t gfpflags)
+{
+	return NULL;
+}
+static inline void audit_free_context(struct audit_context *context)
+{ }
 static inline int audit_alloc(struct task_struct *task)
 {
 	return 0;
diff --git a/kernel/audit.h b/kernel/audit.h
index ce41886807bb..3f2285e1c6e0 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -99,6 +99,7 @@ struct audit_proctitle {
 struct audit_context {
 	int		    dummy;	/* must be the first element */
 	int		    in_syscall;	/* 1 if task is in a syscall */
+	bool		    local;	/* local context needed */
 	enum audit_state    state, current_state;
 	unsigned int	    serial;     /* serial number for record */
 	int		    major;      /* syscall number */
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index de2b2ecb3aea..479b3933d788 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -927,11 +927,13 @@ static inline void audit_free_aux(struct audit_context *context)
 	}
 }
 
-static inline struct audit_context *audit_alloc_context(enum audit_state state)
+static inline struct audit_context *audit_alloc_context(enum audit_state state,
+							gfp_t gfpflags)
 {
 	struct audit_context *context;
 
-	context = kzalloc(sizeof(*context), GFP_KERNEL);
+	/* We can be called in atomic context via audit_tg() */
+	context = kzalloc(sizeof(*context), gfpflags);
 	if (!context)
 		return NULL;
 	context->state = state;
@@ -967,7 +969,8 @@ int audit_alloc(struct task_struct *tsk)
 		return 0;
 	}
 
-	if (!(context = audit_alloc_context(state))) {
+	context = audit_alloc_context(state, GFP_KERNEL);
+	if (!context) {
 		kfree(key);
 		audit_log_lost("out of memory in audit_alloc");
 		return -ENOMEM;
@@ -979,8 +982,27 @@ int audit_alloc(struct task_struct *tsk)
 	return 0;
 }
 
-static inline void audit_free_context(struct audit_context *context)
+struct audit_context *audit_alloc_local(gfp_t gfpflags)
 {
+	struct audit_context *context = NULL;
+
+	context = audit_alloc_context(AUDIT_RECORD_CONTEXT, gfpflags);
+	if (!context) {
+		audit_log_lost("out of memory in audit_alloc_local");
+		goto out;
+	}
+	context->serial = audit_serial();
+	ktime_get_coarse_real_ts64(&context->ctime);
+	context->local = true;
+out:
+	return context;
+}
+EXPORT_SYMBOL(audit_alloc_local);
+
+void audit_free_context(struct audit_context *context)
+{
+	if (!context)
+		return;
 	audit_free_module(context);
 	audit_free_names(context);
 	unroll_tree_refs(context, NULL, 0);
@@ -991,6 +1013,7 @@ static inline void audit_free_context(struct audit_context *context)
 	audit_proctitle_free(context);
 	kfree(context);
 }
+EXPORT_SYMBOL(audit_free_context);
 
 static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 				 kuid_t auid, kuid_t uid,
@@ -2214,7 +2237,7 @@ EXPORT_SYMBOL_GPL(__audit_inode_child);
 int auditsc_get_stamp(struct audit_context *ctx,
 		       struct timespec64 *t, unsigned int *serial)
 {
-	if (!ctx->in_syscall)
+	if (!ctx->in_syscall && !ctx->local)
 		return 0;
 	if (!ctx->serial)
 		ctx->serial = audit_serial();
-- 
2.25.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


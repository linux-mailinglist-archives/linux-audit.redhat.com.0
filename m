Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 28CE02A74D6
	for <lists+linux-audit@lfdr.de>; Thu,  5 Nov 2020 02:17:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-EzVjF0IzNYW6z1ntrK01Og-1; Wed, 04 Nov 2020 20:17:01 -0500
X-MC-Unique: EzVjF0IzNYW6z1ntrK01Og-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C21657039;
	Thu,  5 Nov 2020 01:16:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E412C73676;
	Thu,  5 Nov 2020 01:16:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B847A183D021;
	Thu,  5 Nov 2020 01:16:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A51BhZU030653 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 4 Nov 2020 20:11:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C6B8510031E7; Thu,  5 Nov 2020 01:11:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C28B0112C08A
	for <linux-audit@redhat.com>; Thu,  5 Nov 2020 01:11:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 653AA1021F73
	for <linux-audit@redhat.com>; Thu,  5 Nov 2020 01:11:40 +0000 (UTC)
Received: from sonic305-28.consmr.mail.ne1.yahoo.com
	(sonic305-28.consmr.mail.ne1.yahoo.com [66.163.185.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-182-y-rztz13PkKFwfg4MgfSpQ-1;
	Wed, 04 Nov 2020 20:11:38 -0500
X-MC-Unique: y-rztz13PkKFwfg4MgfSpQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1604538697; bh=WrMySl/4Avdvc4LMHdM5vwoxFMU7Hc4LG2K0jjbxB0b=;
	h=From:To:Subject:Date;
	b=TCEMptRd6hF+tm5yqqsuR5k8Lx3N2OYbYEWlmeRg6R3gJQE5ghKlQ9BT70xjQtoHqWFFX6GuNw84I1yg3c1LqDZYaZ6UYM8t7lh/9adcMjKsZ3UkPfimU4j6Wlk2D1PX2bohpb3yUxe+JZ/mdstIz4ErBifvIGkzCfpChpRQP8DBuVckQyAhbSLKinY96nIWwIWcPcaLf8+BsN59ORUkEAuwu2aBlnivdloYnfsSEZkCjJj/jEvjIJyzuz66JtmgFd1TD5s2i3QlrvPV15W0Gil2kRR7zt36cDL5RNuy973BZpWMYEYaRpkX0NVakPBGGKX1OUBpAoqmF8yxBHukiw==
X-YMail-OSG: Ls4m5Q4VM1mlrDHaF9b7hfxgyyN8yEoTcK1KuQkpGx7gcSE6Ks52Y9M_vyiVrqv
	AxfrzJUDW2KfheRLeFS2m8SH2rrJBgCwgtemucmxh0hTAXz_Fg_FLJ2.uRybYgYKn.1p.3F6FHyi
	6la_vnoBg6lKqd3Yp4APvvp6EM5GYRIqUKcUtGaPrjMuInYVj3ffqbWckVUNUWp7Ed7S3eXuQkOX
	w8J6MmSS0Av2GRlc6UwHxfsYTsTV6eYYu0eaXbTEI0GXzyjV.xx_etnBdgrglUGyxb2Dzdvb_WQZ
	Z40x1dpt4OQaDXwU.EtrcsjuGruMMMIsCXdiFvWakzAifrXVAsYG_yM6pVuz7vuonb5OUBf6KMhY
	d0EiMhOCoRiPi.KjG_L_eFAxtt0ITC8h52dUq3EmCwwqfRYRI3aym9ptCKmd3QyYi9HRXkUCc9Er
	7o_Kz4CZOaClv2ild.shl4l_Q9V9mAS91tgm87fv5wb0DQzfnvm5olnKR7KnossDYm28VVUfx0Ul
	cCvyvwEaX7FHjuGoEquCeUdOMZVACLAs891O5wiXmuT7_K0xu0MCfrhlbvMVvsjkvN8zGl0YsyFk
	uMJqvkuPzyNJ4.9rlAKWjbf8tKNfPTJnEVq3Nqrkh4B70ufHqfruWiTmg3zlPQz1jXuyUJXVStf2
	sWekGbEUp__fu1D2NCnrTzUxARJl0BsD3Clq.VRXJ6UbZW1litvxvfqn0LIt8KdhTS9J8Fx217s8
	F.JOdmTl1hAgOxN5TceaPaSGw1HLzz0SyYK9R7hbY.f9TCOMOQImquWk7OVTn5G6CFVz.J1tfRNZ
	TE1oKKdrpqSraGuA_sdh6c0hQwYEbDnfi_2KQ5uBFBikpt6itKyk0uK4Ffbo_npTrTODFu9l99YZ
	voVNHXUlpCF2vnBZMu1PDJwAFols4mzQItD6hhMPvFLyawnJNodep627tG5laNOtrxHb0qOa6rfZ
	IUHU7fQGBhJzxC1sui6F_QMm52KIYvV0kdocP0VSvhnzXGYEfo3jlS7_Pqjm9_MDMedCYV9SJIwf
	hGxXmzMPhoT40o93MIrHmgsOYot4q4QqnqsqgoEZ1q6GA9.YwiNredU0PuT0OjW92BdiC76RgQm1
	83KzBSN9xJeIYn0r1k3ualBJl6Nx71apZHFaAhFg_meOJiWa4V9fsuiNqVbnF_o55FnJpaunKLqQ
	X.OxzuC3m481E.XSpuyQn4Eqc5Krie6g6zFUYkiTF7hjow3EaDll_tSj9qHB5J8C8gvQZToY20Zr
	qzvtDS1i8S0xgHP9_KraKQidbKhJ0WrYk70xabN9ntDN1.jJ6GcgTd6qTD1gq28RTZBDQMcjFgjo
	Z7JG5mpSqJzwWJ956HV_FdjeqliodZAEWZaFkSmyq9_ukIKf1ZpE.Fa3P82vp7AckDd9DvtclQIc
	0sS5O5FGwxt9R.MV85rcLTCE28vYJpXVwSBb5OACazsXzg0Pmmid74oU19yJQGo1ZuGZ9kYnpDV.
	HELeFoEa6QNGODYekPDkOmxIbXzLTAFozcnRAlcwaUjAdySk9sLjMXg5X1Csqn6_1sbMLvTAEu3B
	0wdCJEtoZM17dznEyNnqQcGBbZK_ZzAzBAta_PbL6YYg9ZEq57B20lbeN6jICcD.DnOTy3aJ1GGb
	CnwevQMs05var11Nn56B_kIeYqHn8coGpzptZAoIjhaulr_.mLTJKG4Uw7fecahN6G9n521hMOpK
	5UsgcXYp1QS6EuXHE5x7Q3CLF7cjiU9NH8oh9eKkbKqXP4ebS.0Sb_DWfKuvX3hzD2u7VquBmypD
	mUqVZE8Gtoe_ADUfMjwzoxvgRRNYiMMO16GZdaGAfDnLxREAezM.cWajghwB3VmY14BBSC6Wvtvo
	JABuWEWaLuGWebpufuJz3NzobAm3KtcVecau2cjrZPdJsPgvbZTeCnoQltti4896mX_Z5v9igqYa
	AjTmA4UgH.zW2MmNyzGu5_rzf8kjZeIE4iBhcHMxuQ5wlORQdtn0jiAQ0AYj2akG69AkbB6FLrJo
	iwOnCz4zHQm6iu7Wz6i1CpY3JlWwZMMBlJh_.2cJT01HXySSjKKleV52PDBA8qTCRjTyuplMeGzj
	hYDj3T9HEoOrVeaNUZNTRFC0w.e5iijjVHR886hk478Xjkqe_6tPvnlLaSrP91sxozS9WgOsN4TP
	WPdVaLBc.0bqRXd6qGyXBwlJCgtxCkLF_lpf_mlOmArv6znn13EmaXtiaFg5GJDQtbM.dr_38X4O
	gY4ap03LJmpgs3PQnTtpHPSCYLyuhYCFtS5NhDOu47vBz2fr9YXKAoD1rBKr7NoWG78EhOBGsMZy
	ABts_zMgH5fv_94G5jmaC.WUquQyrpvyy2cZaJR59tM.XScYU19izykBEWTykOE0VmoO1ZRYtD0L
	9luAd6Cyy8NVuPkFz8RiCc29MZl4EYR_RH.u1A.dTEdscm5KxhCbew6Gt9sAdXFL1UyV2VT147DV
	LZrwM2uj1b_WHEbPwS2k6ENIEAiTIL0fV2VRCOK1_UatRnwvOjOFMfvWh1IkKCiWDvLYoa9ZimL8
	w815rpWp8KLPjJXjP3ek01Ay1.9nmQElbrDWyqwDzYI.CdCXDFM4b0LVoU4zFKY5ywdmUkxytu.5
	JBiUS6Lg4Dxq_BblM1KUAEjO0ZVQxamYTq5HDIV_8rf22cRl0HJPsbZxmsvgm2_HtQpfwav6DyqN
	8Qe7gVD.sQPSekH2HQ4K88Wq9TkusKbXF4idBA3oW2LyW6ajsyr7AZXscpm62ODHteUBqGv38zXi
	DBmaHyBu8EUjgnbgtGMrLE8UdTKcSPoFj_3UtIIndg3PfNLeCffoX9uqaUGahh_IQi.sVWrdfiYS
	k7Kt.ZQpd0lziDPJOvSsipTbakyWlxFV5VmfU8LIz1nXhnUkbXv1RRbENFIOYOu4VZOgRDSPFIQI
	w908nz3wZfHfkgTNxK3cKwR8C.Qzxq.jH.3MlZ_tUmwIPiY.58.eX.Zzg0eZsybXFXxThcWJLnSs
	eWgAE5hutZow7wW9_bjdOpm__88cdeegAosMC0d_qTvx2P4aXB5WZGHKbyCT6kx0arfiKtvqY.dH
	9Z.13QlGkPawB1QbwKaw2xzXIrXZ6cXraThc131XCZuHdhx5EE1RVIXB_FJc0qQoqRHV1LHxBPc1
	f6tUHHWXzoq2Wm9UYP4wCTyExxyU.uqWZ_AQD5FabUu1nuv5ppmQL4Wj.C3QC2R_7RkmD6XMq888
	8lcD30deKSVEtCCzIEYU8jgFoJ1aY5KtNZJuXvTo3sUpOCQmp70KkSDKWRI7l1ccwDboGXPyY.qe
	7xcnwC4ooiJ8ypyW6XdpTNyNcg.JCO1roqWEF1uvFgPznx5hA8UWkR8KHAtZ1g7K_ecdo99bQWU1
	0ZkYzMm8k1cyBr6NjvOtpBa2eNLvfgczi4QdhueH6gZVsGTRNg0kAYipAFpcw3cDuKQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic305.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 5 Nov 2020 01:11:37 +0000
Received: by smtp418.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 273868adc98c3945b9c71f22286fdd60; 
	Thu, 05 Nov 2020 01:11:33 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v22 19/23] audit: add support for non-syscall auxiliary records
Date: Wed,  4 Nov 2020 16:49:20 -0800
Message-Id: <20201105004924.11651-20-casey@schaufler-ca.com>
In-Reply-To: <20201105004924.11651-1-casey@schaufler-ca.com>
References: <20201105004924.11651-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
---
 include/linux/audit.h |  8 ++++++++
 kernel/audit.h        |  1 +
 kernel/auditsc.c      | 33 ++++++++++++++++++++++++++++-----
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index ba1cd38d601b..786d065a64ef 100644
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
@@ -558,6 +560,12 @@ static inline void audit_log_nfcfg(const char *name, u8 af,
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
index 4af5861bcb9a..5bfee5d0812d 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -929,11 +929,13 @@ static inline void audit_free_aux(struct audit_context *context)
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
@@ -2228,7 +2251,7 @@ EXPORT_SYMBOL_GPL(__audit_inode_child);
 int auditsc_get_stamp(struct audit_context *ctx,
 		       struct timespec64 *t, unsigned int *serial)
 {
-	if (!ctx->in_syscall)
+	if (!ctx->in_syscall && !ctx->local)
 		return 0;
 	if (!ctx->serial)
 		ctx->serial = audit_serial();
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


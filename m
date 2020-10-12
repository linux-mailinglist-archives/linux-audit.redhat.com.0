Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BFFEE28C2BD
	for <lists+linux-audit@lfdr.de>; Mon, 12 Oct 2020 22:40:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-Q4BmzkL-PZiPQMh5Lsm-CA-1; Mon, 12 Oct 2020 16:40:42 -0400
X-MC-Unique: Q4BmzkL-PZiPQMh5Lsm-CA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 401A21074651;
	Mon, 12 Oct 2020 20:40:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D82F175138;
	Mon, 12 Oct 2020 20:40:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9BFAF58109;
	Mon, 12 Oct 2020 20:40:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09CKeX7p020687 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 16:40:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A055B2166BDB; Mon, 12 Oct 2020 20:40:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A8832166BA4
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:40:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9156A80CDBF
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:40:30 +0000 (UTC)
Received: from sonic317-38.consmr.mail.ne1.yahoo.com
	(sonic317-38.consmr.mail.ne1.yahoo.com [66.163.184.49]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-596-R4mS2xXiMp6e9o9ZGNDN5g-1;
	Mon, 12 Oct 2020 16:40:28 -0400
X-MC-Unique: R4mS2xXiMp6e9o9ZGNDN5g-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1602535227; bh=M7+o1VT58A0GNL+dw0MaBA2cleuxSaSAXT5MOj4VcTX=;
	h=From:To:Subject:Date;
	b=RkQRW8DIcqYzi9eZKe24MMRzX/u5mfMR+fQMySZh173nkl/P3/vMikzxecq57rX+xAUspTkzWfVx9mJm7sYHhJNQA0lJ6fwdH7dBypb/pQ51+gL2zmXgtIsNZBMb+XNp969p3k1was8mF9tmrWZXQLOyVpqxn3MT2kBpLeahqkbu3LfdB3asl+H6jp6Gq1lOKHYm+qMLx1GFuxr4yOo/d2IpqEqNb6mrFm7nH7BR4p7NsZaNPNZLYMSXfnygkCgM5BjdmSTDQOZYcVQyjMl2FEZjb6VckqRV9YIsbeQk/8NeyJVAyKeWEmoDfOIcwxkoQ3hiJYO51xB/o2riZVOdIA==
X-YMail-OSG: y9k.J5IVM1mA.UcUOeH8DRN9xyLk4ThXSQQ3JnX6XrtiWiZNEBwEYN3rtOf22Nn
	3Xvj81jy2Drs77qe8jFCIITvn1OyqYKV9B5IHmaGWN0Asy1JfbjDjzftBLOBrFw2urALofgf3CIR
	c_5sJTGPRdtRObu8c5_CVhy_4BCvuLEtJ4Vf1MXp1EfD63uJiiu7CYrxM5Nvu9HWQ82RDjMuf3qk
	RGcHN5Hhtuz6TUREKHX54CWoEf2LglSezMehS43MiEm3MJM.YnEwGnf9QDIa0GU4tUmK27uEqiCd
	ho.xahWKSxwB_rhoNUisy8fTkSUHHVvdCc94nl_a.KhHXcYeloYUYBqqEOZ9v6TaKjdaT8HWT3Wq
	aJbvqhvim2NejE1OOhrfWD6AiSiaCN2HviH6y8TUiVqjbw7ORpB0_PUr6d5W8QdNKcIp_TgzBmVL
	l08Tq6o.lRgaJt6zApNiHg5iMq44RUEI8khGIVs3kZ7i0kKEHZFG.k992Hq9C7xDaOVwVUe06WBN
	jmwRVNgqVnPyKHDoKjG48uDRcRnq.KT3QFig2BHHnmi4VipKE8bSkL8CZO03JczyV4OgI7m.p5pt
	vCspj8TZZO5DuNb7CRRvE1ZX6Hp384kG3dWdaolqdjyz2sOJJSr4Cw5R3QEUjvU4RTMjjZ16yROC
	6u8m9nWLXo7eMBbBQCHId6d_zMK1cFJfrGUR5_7mlqrGdqMePrwjJTj81_VJd8n3Ec_klwHhwYTn
	DavGKmrwk3wgCNLiV2K9LyB5nzrMyS63nL2H2gn85n3Qc9Az.Tl9XSqQz0vZRMS7kLsPtksAysrD
	ps32d_1FHKKyj7rRq.mt8aZo4U4zEiU1Po5PF.uq77HfieW9rlhW2CMvrtu.h.qVX7IXCbWzPMNL
	cmWS8bXvoA9SqUJnELR1A2bp9JNJ4AoQL8Lb7EdK1HFujCC7Zt861p_JcIanLXi75peaB665PGtu
	vprFZQ_3gJIwh4QRy8.1NRk7quaLMG4fE2sF8zeDihh7yydAHfErZSKIbkZ8KJRBs8gBZIVFaBTY
	kwcr8smUk5GycIbqOdunkCiIfRVpY0.3CHyqglAshiDUIhS_XOnpcXST.zRb95AVhzaM9AlYzq.5
	mgWbLU7HtgvJxDql0uTQnAHvgRxZsWgazo2vnYpe93X.PWf81AEq25mwL91b.JMK9eekW2bM8tNd
	L_eGjNKft6_DU1BVWZbeaFp2Jdhtg3EGBlXb_BtJc80SGsx29TqZsc2BdjHOW9NMeoTxcN2gcxmv
	._cttIpIgxP_Zh2ifmipQNYhmyZWx3AGdpjyF66eMgrSMPN9S5N6h117hmTVbNcP9zQO1ved06dh
	UMR69e_YFte5XIUpOoG6zh3FURVg7uPEmP1Eue7gUN4mrnBfu500cyyn9Qgj7Or4tO6mv2eWogBA
	Fa7WK1J_j.UDO8whBSxXwDnEtHSw90r4QeZSJDK6e5GsftMeFmfmDiwdLb_7NCibXea2kLfJgH8f
	z6r0dTl8Vq22Rukd_cGpG1lgV9RIEPeUZNJqnyGBFPuQh9LTy1jzVNgBkQD5FOS3ZT087wxYJI0k
	2edDf9Zi5qmu.u0GcZNOATA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 12 Oct 2020 20:40:27 +0000
Received: by smtp412.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 584323082e603e317b583141f4b8e463; 
	Mon, 12 Oct 2020 20:40:25 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v21 19/23] audit: add support for non-syscall auxiliary records
Date: Mon, 12 Oct 2020 13:19:20 -0700
Message-Id: <20201012201924.71463-20-casey@schaufler-ca.com>
In-Reply-To: <20201012201924.71463-1-casey@schaufler-ca.com>
References: <20201012201924.71463-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-audit@redhat.com, sds@tycho.nsa.gov
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
index ec0cfa7364cc..79454f1180ce 100644
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


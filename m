Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C53F5ECDFD
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:11:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664309475;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dNW2J/mAMZ60HZDCJkNFCn8ZvpOOTUcxRgCeRQ5/BdY=;
	b=aXO8SJ3mROabWRY7Sr8BloiAVB9r+54BcuvBfQ6gh3FAjPP7Hb+0j0IGifvdUjJQ6flr6J
	p1kaOIXe1KBgAulVLcriW/Givhp3QctzX0HIMOVAti8oiCD/EXA3/EbBBEX+OxrJOdPUmc
	fK6q84S+FaPZN9J7e9+A9OUVMy5Smoc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-m5DWmhL0MS-FtHeFG8_XZg-1; Tue, 27 Sep 2022 16:11:11 -0400
X-MC-Unique: m5DWmhL0MS-FtHeFG8_XZg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3892101E14D;
	Tue, 27 Sep 2022 20:11:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BCFF17582;
	Tue, 27 Sep 2022 20:10:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8F2531946A48;
	Tue, 27 Sep 2022 20:10:56 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2DD601946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:10:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 084392027062; Tue, 27 Sep 2022 20:10:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 016CF2027061
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:10:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D36181C07580
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:10:54 +0000 (UTC)
Received: from sonic304-28.consmr.mail.ne1.yahoo.com
 (sonic304-28.consmr.mail.ne1.yahoo.com [66.163.191.154]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-620-i4tccweDPSWFBJl3m5rk3Q-1; Tue,
 27 Sep 2022 16:10:52 -0400
X-MC-Unique: i4tccweDPSWFBJl3m5rk3Q-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664309450; bh=Hlmjb4vdDFh6T9J5jNkowwKMAEWXqPydgbqZQLiAlt/=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=gC+kk4PBugx+teaE4/AD4fwjbvj+O2cjEF12bRMS5+j9iVHsb8FZjqHQtpt3Po3GjffD2+20VHX7I/gmyn+utSbL/US8d3PCGCZfvwqfd1ieZVBS/dcU3NjKeJnvPiQWrGihU1ljBtS1QsmYKqB1jGJEqAQQt+f85/hXKq0LC2gTzb5wOCHxH5xZLwDbJbCF2PLCQeEpYW5TtLpP2vOwNgGrBS0k2ozKICK+lAfBjnES06Jux7pKocXLHLDBvfWiaplaDSovYOu8P/s52unS4ABDnAMl7+dNOgBvqk3Yqzj7zP2fnfAdvOZoA71ff5opPqxgufSIQYZu59h9VATuRQ==
X-YMail-OSG: 0N2SD1YVM1knFXgVDtekHGh4.QgY5Ois3oIKVUBAZjmUwf.11uy.0sDVR982BXl
 e0L2ONY6bgcnRBKnq5SIDPUgZP0bRu7fIrLEq.osj0OdH8RAEudJ8qd7FT_eVcsK2f6FBpgE36LF
 mK4FDEO0HPtZJhrQAXcDNr3bhnCikJ3t9OSLGQxXK3yhFCiSJO_fFMIf31zsRFzItVPsAp4JVyfJ
 lJ1widtA.iz.LvTgjPekZ.3eda.Jdw4X8jhTYZfvQacFsEv0HQmO0RaZ7h86fYKbc.CyyJwuns95
 CuLs4RVMiY01dZZey_DQRBWTdg0ASY6DEKaDoMkkmPUqCcdaWrWA0pH3s8Ltjvhplj0dz42aF9BJ
 MHJ06zT5XjI41LUv5FYlSluF6nddsEAXUTrY.6IjkDxgQi4VsDaR_4C.im7EOMQqy7S0NveXWX0o
 A3ERhLm40TcofiKGCl4A01TddrAG9fwzSLJEo8LKggQ06n5h_b32fkJY3ZApn6kCyQIxXUPU7Clz
 75XfSvLhqpKN2GKHvaLGUNOhKfETvQDWg3mTDym2cwB53aOipBWtp39flRXPZnqucJJB.rZL5.LR
 1AGrqvdKZjG0yg5SIN5ixCJLMaYmTicZEVB8HUoYh4iHhKc5mOig96YNqEtZ4OZtjvzJQlbrTBH7
 jDK_LGM3CouU9bf_rkT4WMKHQMDPrtscdDq5sgY4UZDtx_ogiCKSbLUE6W5t_X_PRMGAEJzyf2ff
 kK.zZeIyLuuFuFQ6_O.vvZTo3qcFtWh24YpqurCImBA2TlK4pTv4O13A5Mu_J7Q4TSnRbYR5PPi4
 bK7ciTTQwiBJou2TqiYU_myJvQSpTEQbKv17Bsnv3fXzawCBvE5COCMyZrmtQS0aPAbzTo4J08Ex
 lcqT8e275AkAOQ7ZNj46iIl0MtHcq0ems3K8NXkfBWdwqciHFAnX5kSvw4z795GEres5xWY8jEzO
 sNuvqiGe256xdB08Ter6lGta_coAfaTrQ3zWyqvPxofLW9HI2hYwlYBr7ORUAoLi.G0L6JCIpcQO
 pOykByyRDPI_Yx2EgCWDbSELQpMkuVLPjtTSmVBDX47pvG7Wt_D0o3vh8MmR3QFImAhYwppY._Bl
 fWt8ukIv8LCrTnxovKuqPez3mFWm7r3EnVhJ7YOM.YfasF0E2U5EyfFOmoeHLKTS0EyPVljmuJCI
 6xz0UadTkRGmlYs0PlbCtTgRt1oG0BR8UF0yu7Aty1ixBiDOZea1HA8sJ_WBa31CXz7RgLffjH3N
 w30ndf5muuh7ovED9ZpAktcF6Gsdz09HhUNTlU4653SYa8ZZDabI2SxFjH..JYyNo6krxKrvonFF
 UPm0jGk3m5yGDCfg5k56Ktz7J5lhjiI6YAjJo08GHWncGxe_m8vcQyIchLywlPX4ZiMpGIAxleY3
 djLhji9BxjkXD9dg6d4e5VjtIe82WyMk3yhhAcFnR1h2VHIfVKPMY_dWOqtrmS7Vpfz.C0rSrru1
 6Z4yWdKmcxtWD69bqvMp3.hsGbVdd3BOhNbFQ2IvOOEV5MnR_6MYB1d_MBayQ7rByngNDeQjO86L
 y4_F.LjbpZxGd84vep9ut3DvpYEVtJwf4bpfFxCD0GGhRgaa4PK5KPFxCGvbXHgGemPsVCa49Om6
 YG98FG1TJA2vmF.GJT7mSThtNvuZ7sQrOSBMb1yoHBIu8Rgwo3CSOa3O6xDCXPM8eor9a0QSQ56S
 AUtUnEHP1Ai2QbKEFme3HunB8tiJ11VYejSPkhLGYxPIukIWosoqMHsa6nhsATcDCOsLmBP_cuMR
 AiSVhwI8CkBsPgEedyeOGR8XbI_dh214y9QWmKqPfExqMd1ShBgOZErpHOlsp9qcCExbVFV3Ll79
 QZ5RmimoBpZKXhlO5KPPQxtZAIcSVMoH.o7Lhpx.ZJXQUlgnIwQUVdIfvGGASGGpnXR2RG9QXHlw
 hiWNfXPGMCVf0EllI7pCVQZAbxUb2uNSLuqzNcXhVxdvKVen4HRYnYCb9K6Ig7gDiIwUYc84hNiI
 8xJvhIKma5eXfWNunmNSxfZMpSdxp2xhHs1luFdHsVqobFPrNr__ZEY.laDWOltL1ZA65wZDDHct
 qfxoZQcr_YfMcEGOoSo8vqazFhX3SDLt9.W2XhKxUZHoB6ehWQq7G509cAVLoefuoOETXOd5yapU
 0sZNhx5ocJa04plahH2ynG3YXy5b7KC_bYUB.CeKEV1SRb1tZyjVV8VnDvZWQSI_gQTRjV1X9S50
 jWUks60r1U4S_rHqnZXLCP45v9Zyky0aLmUyK95DqRExUYkWHtPPKOJxdZaql1JEIJdUv.2nqMmT
 BKxgFKGKZ9WIFpqArDDOCPCl13ZNv2eizopYO4j8k
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:10:50 +0000
Received: by hermes--production-gq1-7dfd88c84d-nvfk6 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 55a7229bea084bb6b28fa3beefd2f4cd; 
 Tue, 27 Sep 2022 20:10:45 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 30/39] Audit: Create audit_stamp structure
Date: Tue, 27 Sep 2022 12:54:12 -0700
Message-Id: <20220927195421.14713-31-casey@schaufler-ca.com>
In-Reply-To: <20220927195421.14713-1-casey@schaufler-ca.com>
References: <20220927195421.14713-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: john.johansen@canonical.com, selinux@vger.kernel.org, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace the timestamp and serial number pair used in audit records
with a structure containing the two elements.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Acked-by: Paul Moore <paul@paul-moore.com>
---
 kernel/audit.c   | 17 +++++++++--------
 kernel/audit.h   | 13 +++++++++----
 kernel/auditsc.c | 22 +++++++++-------------
 3 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index 98c5ace6f453..7facf6929f64 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1822,11 +1822,11 @@ unsigned int audit_serial(void)
 }
 
 static inline void audit_get_stamp(struct audit_context *ctx,
-				   struct timespec64 *t, unsigned int *serial)
+				   struct audit_stamp *stamp)
 {
-	if (!ctx || !auditsc_get_stamp(ctx, t, serial)) {
-		ktime_get_coarse_real_ts64(t);
-		*serial = audit_serial();
+	if (!ctx || !auditsc_get_stamp(ctx, stamp)) {
+		ktime_get_coarse_real_ts64(&stamp->ctime);
+		stamp->serial = audit_serial();
 	}
 }
 
@@ -1849,8 +1849,7 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
 				     int type)
 {
 	struct audit_buffer *ab;
-	struct timespec64 t;
-	unsigned int serial;
+	struct audit_stamp stamp;
 
 	if (audit_initialized != AUDIT_INITIALIZED)
 		return NULL;
@@ -1905,12 +1904,14 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
 		return NULL;
 	}
 
-	audit_get_stamp(ab->ctx, &t, &serial);
+	audit_get_stamp(ab->ctx, &stamp);
 	/* cancel dummy context to enable supporting records */
 	if (ctx)
 		ctx->dummy = 0;
 	audit_log_format(ab, "audit(%llu.%03lu:%u): ",
-			 (unsigned long long)t.tv_sec, t.tv_nsec/1000000, serial);
+			 (unsigned long long)stamp.ctime.tv_sec,
+			 stamp.ctime.tv_nsec/1000000,
+			 stamp.serial);
 
 	return ab;
 }
diff --git a/kernel/audit.h b/kernel/audit.h
index 4af63e7dde17..44cabf7ea660 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -99,6 +99,12 @@ struct audit_proctitle {
 	char	*value;	/* the cmdline field */
 };
 
+/* A timestamp/serial pair to identify an event */
+struct audit_stamp {
+	struct timespec64	ctime;	/* time of syscall entry */
+	unsigned int		serial;	/* serial number for record */
+};
+
 /* The per-task audit context. */
 struct audit_context {
 	int		    dummy;	/* must be the first element */
@@ -108,10 +114,9 @@ struct audit_context {
 		AUDIT_CTX_URING,	/* in use by io_uring */
 	} context;
 	enum audit_state    state, current_state;
-	unsigned int	    serial;     /* serial number for record */
+	struct audit_stamp  stamp;	/* event identifier */
 	int		    major;      /* syscall number */
 	int		    uring_op;   /* uring operation */
-	struct timespec64   ctime;      /* time of syscall entry */
 	unsigned long	    argv[4];    /* syscall arguments */
 	long		    return_code;/* syscall return code */
 	u64		    prio;
@@ -265,7 +270,7 @@ extern void audit_put_tty(struct tty_struct *tty);
 #ifdef CONFIG_AUDITSYSCALL
 extern unsigned int audit_serial(void);
 extern int auditsc_get_stamp(struct audit_context *ctx,
-			      struct timespec64 *t, unsigned int *serial);
+			     struct audit_stamp *stamp);
 
 extern void audit_put_watch(struct audit_watch *watch);
 extern void audit_get_watch(struct audit_watch *watch);
@@ -306,7 +311,7 @@ extern void audit_filter_inodes(struct task_struct *tsk,
 				struct audit_context *ctx);
 extern struct list_head *audit_killed_trees(void);
 #else /* CONFIG_AUDITSYSCALL */
-#define auditsc_get_stamp(c, t, s) 0
+#define auditsc_get_stamp(c, s) 0
 #define audit_put_watch(w) do { } while (0)
 #define audit_get_watch(w) do { } while (0)
 #define audit_to_watch(k, p, l, o) (-EINVAL)
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index e8f632736d2b..bc0621282a9a 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -992,10 +992,10 @@ static void audit_reset_context(struct audit_context *ctx)
 	 */
 
 	ctx->current_state = ctx->state;
-	ctx->serial = 0;
+	ctx->stamp.serial = 0;
 	ctx->major = 0;
 	ctx->uring_op = 0;
-	ctx->ctime = (struct timespec64){ .tv_sec = 0, .tv_nsec = 0 };
+	ctx->stamp.ctime = (struct timespec64){ .tv_sec = 0, .tv_nsec = 0 };
 	memset(ctx->argv, 0, sizeof(ctx->argv));
 	ctx->return_code = 0;
 	ctx->prio = (ctx->state == AUDIT_STATE_RECORD ? ~0ULL : 0);
@@ -1925,7 +1925,7 @@ void __audit_uring_entry(u8 op)
 
 	ctx->context = AUDIT_CTX_URING;
 	ctx->current_state = ctx->state;
-	ktime_get_coarse_real_ts64(&ctx->ctime);
+	ktime_get_coarse_real_ts64(&ctx->stamp.ctime);
 }
 
 /**
@@ -2047,7 +2047,7 @@ void __audit_syscall_entry(int major, unsigned long a1, unsigned long a2,
 	context->argv[3]    = a4;
 	context->context = AUDIT_CTX_SYSCALL;
 	context->current_state  = state;
-	ktime_get_coarse_real_ts64(&context->ctime);
+	ktime_get_coarse_real_ts64(&context->stamp.ctime);
 }
 
 /**
@@ -2516,21 +2516,17 @@ EXPORT_SYMBOL_GPL(__audit_inode_child);
 /**
  * auditsc_get_stamp - get local copies of audit_context values
  * @ctx: audit_context for the task
- * @t: timespec64 to store time recorded in the audit_context
- * @serial: serial value that is recorded in the audit_context
+ * @stamp: timestamp to record
  *
  * Also sets the context as auditable.
  */
-int auditsc_get_stamp(struct audit_context *ctx,
-		       struct timespec64 *t, unsigned int *serial)
+int auditsc_get_stamp(struct audit_context *ctx, struct audit_stamp *stamp)
 {
 	if (ctx->context == AUDIT_CTX_UNUSED)
 		return 0;
-	if (!ctx->serial)
-		ctx->serial = audit_serial();
-	t->tv_sec  = ctx->ctime.tv_sec;
-	t->tv_nsec = ctx->ctime.tv_nsec;
-	*serial    = ctx->serial;
+	if (!ctx->stamp.serial)
+		ctx->stamp.serial = audit_serial();
+	*stamp = ctx->stamp;
 	if (!ctx->prio) {
 		ctx->prio = 1;
 		ctx->current_state = AUDIT_STATE_RECORD;
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


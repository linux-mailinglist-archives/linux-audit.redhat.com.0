Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 987455ECD4E
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 21:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664308586;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GnDqg0FnMXIJpl8dwkKLo+0/scUM41z/XuM5ZYikXfU=;
	b=Tm23iZpxMriRLRNecyzksAtPRYp/p6vVtGz2WMULmmMcjLrt5Ylp3Q+vCKI0Tkf+klRCYY
	mavLvC2i05DcZ9VIv3kfWM5U7pj6FgoXKzw5EQdu4llTeNXs0YtXOKy66XvWbqhfpAAg4j
	tr42r7wfuihKtlBbzRvVBH39imeMaeU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-THSglVZ9Ptq78mE4suJg2A-1; Tue, 27 Sep 2022 15:56:22 -0400
X-MC-Unique: THSglVZ9Ptq78mE4suJg2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8370D3804529;
	Tue, 27 Sep 2022 19:56:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AA70C15BA4;
	Tue, 27 Sep 2022 19:56:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 429241946A4E;
	Tue, 27 Sep 2022 19:56:20 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F16D01946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 19:56:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D3C472166B2A; Tue, 27 Sep 2022 19:56:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC61F2166B26
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 19:56:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADD2F85A5B6
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 19:56:18 +0000 (UTC)
Received: from sonic306-27.consmr.mail.ne1.yahoo.com
 (sonic306-27.consmr.mail.ne1.yahoo.com [66.163.189.89]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-597-9J2QBUylMxOeV_a1selwzA-1; Tue,
 27 Sep 2022 15:56:16 -0400
X-MC-Unique: 9J2QBUylMxOeV_a1selwzA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664308574; bh=/mFV8nrKHKziknKHS+k/smuAaU9FD83Vp8CIDoIOUN4=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=bdKhOX5Bnc0LXZyfNW8G2jhIIpENO9ulI5txH6veCmV62xpvRfnNkTnMUPHiz/lyw0WSpgtkYjyGHxUehBHNYtjCFq+4sadyFoOx8TCQmEjPJu2XPjC/GbwpGArgdSYWgzA8ZwR5fLsQ7coAeEPtzXOzYJncKk++Pi4MG+HwzJyIXqdiEFnjgAbahOC0A564fZSZiQvsSmFsSwTptqh1koX1NrRbAWTLx5urIC60QYYrEQpvm8shXsqQmI61AlqAzV0ZgcVGJlRV3VTwTrNEbUxz6WZqFNqXkMNH3NYWdbEsLVBa9wXJYA4AIgV4oNHojraB3gAGggcdaVaTeSZwkQ==
X-YMail-OSG: _CwTIPUVM1kKMNXWVjVQXgYCmlIcGojkol9V_SpDI59Wiu_ZCWDPa1Pv3eP0PH9
 X5AsPvSQnlhkl3fmR6i6uRqBSxYw0STHwYkkRJUc5uuZxdffEbhL4ZY7CiXXwE5zzXu69q_kpB4W
 DXfVYUOhu6cf2RKLr0cRuQFBm4x71vVME6fywKNrz6jLpiP18n43Xwv7.B8dyUzcbO4EdXeKOJsp
 SdQ1ofGChnYMgkmtEns1k8411aKXqXd03v3AyQDRSz5s5K0HAbENYBynJg9rYK7YSyGTu3R5TzvV
 dnmKUREP4uo7L42LbOsM1gbfNOfuY9CxSaKo9Ta76cspvnafEfykVdI_7Vh8KQTGu7EjFV.hSJYt
 JD8EVxXvKF4cZUrxbu66JRrz1embXoQ7Ws15mO0sK6hLO.pX140ncrigyg_58x572Uv76_ysF1Nr
 jxF54aY01o9_zQLZjA6e._PAf321OUACxAb2jGShNLkpM1lpK9iMsfz348GbXpk8hoDe6_AHkW6C
 hDBZnGjUjOIUujeI0qiNgvtEbxDPt9o8svJw3l19Ekgzf7cy5FaZHo7X6iQDOtwqmZLSAtq0sxiV
 E.WT.usOXZgHNtRR_l2xu33CcEVOToYlOCNg8i_tFE.E55arQU05DN42.TN9D3A67vy8fg18cQmP
 rsNP34XF0DJ0fGsQjHUPpnViJRhip3b2.bDj7y8tMoV7UYHj4jNrH4u5JrQymccBMrAunAhMPCzX
 .oCy9qfm4g39uNkM8HAduVfi7f5HiPQdU5jO6vRpYg4teC858NBplRvbpwn_2R3c5blbowgQcBoo
 gu49Ln0l7lwJpv7QUySL2AenTS1DwAWjxRrEVxBUlbMj8gsbbTuLo87bS10eAs15eroU92WPdxRB
 b7jsYehSfqiePygLYrBaYzwNITdxD5pXeZIPeAdO6C1t8o5Szt.M1YNtazwkAM_nCxTaTsFUn48z
 gd0QM5ff7esW3BwF3JA8cE8phJvLRBRrbRn9Kb9hWP48dH7C.k55OiQCWzO5qOGxjv0SvONHKbZY
 63.DdEnT1rrPyixCdT1W8SCBsTT6ax8LAyGT.S02OLQaMGXpmh.TVAjQ_voIpxzuSuV3SZgL3WDB
 Ko4gdcdo.QrCFCSnFHrANycyFGzWgoqMdxuVn0GKHxWDLmHt7eetTpbj8GNDumtjSqO1pb8N8Yp0
 2ZH5Ukpmmz2QQS3uudfJhtkq5IAAJ8eHB_fdvsynw7kH.6dp5TVoJGj0l2y8ntKFW23DneEU8ami
 lMA6vTQLZb9i8KspuB1WJx7J_8NJcsYjMZCacB4RecejrLfNwjMSXeCb4tqn4h7U0UPJP3s_mSfe
 j197_XT9vtRL13IE9tdBcCgmlHday.9pKKxZgz63B7vV1jR2ps9vyqudy0EDkN9jhmmYlZEK_Ma.
 A6t.AzBit1SpvTEj1l_3drlpb5cugLVF0w9FsvXD5LhtcFJ9hhXU9ShA4kt.taIB9KJ2hr94NfhO
 Hehx7NfSIJw6yjN1CZ_DeSUDIiThPzGePmh0pCRS5CJltVRW0Hkcx_o8dG.63onmOWavDjYkh3Wx
 3C3VSeEprNmvsGIEmXgkMd_FF9gLFvlhryZghS6EUp8EkVKmAicpsSg_Uz3t_A8D1yU_1i8S5UZM
 ASuCCfxeGDvjVbtfqkA851Wfg8inxCBm_I7G3xY91.OnBdUcqds2D7NxJTVydzue4eJFehKSlOwQ
 805rZs7FIoNblk8jiPllrrjy4Zv5BLkq4cO6ySFRQOd9zwRbn5piUiMquCae3s1aRun32nemc2B0
 FOzmv_dPmqvUuCZSI5DRZMEVM0Yid01412hI5srtr_wk9mFG390eRqvgIwQsOuxLqavmbIOHxzqI
 0UybKpKh6bXUTf_CTiVP.cxRm.xIjD.vh4gF9ivDpB57vzR1cimWiUZz14ymFGgF8djoEcG70EfF
 JLn0vNH.GBczY3NgzgUZ29LQcCTcHcULiFcyYC2K7wQvoTV2LyzMQKxasnCovzuzOnO7ENMGFPQP
 wSXDjDqY_TLxsywShbgMpvftstxZGHNC1y6NbiYMab6W5QAuheFxMcubjsdgPGN3y8i9JDkWePRl
 1qiv33ZbSKipPEniSa4sD6Vuj4RKAhoTiKKry9VWEr7kdNZbsouHQDMpelTDXxrhuhXY82ScCNpM
 _uwZ7PnWD.xHLjnm_9GMfOy29jggbpoJLuw82b4xyiAdAQ8Q5R0WlwzIHEJUlPoRwCzyUt._1gbX
 MJGp7ZzMIo2pplaQTdDwIsWoTz.NkyVYNncmqHi.VH64Vq3nKjCWUxpQ-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 19:56:14 +0000
Received: by hermes--production-ne1-6dd4f99767-h2xxw (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID ed20d3b3c3bee07b1518207f2172ebcb; 
 Tue, 27 Sep 2022 19:56:10 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 04/39] LSM: Maintain a table of LSM attribute data
Date: Tue, 27 Sep 2022 12:53:46 -0700
Message-Id: <20220927195421.14713-5-casey@schaufler-ca.com>
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
Cc: john.johansen@canonical.com, selinux@vger.kernel.org, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As LSMs are registered add their lsm_id pointers to a table.
This will be used later for attribute reporting.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h | 17 +++++++++++++++++
 security/security.c      | 18 ++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/linux/security.h b/include/linux/security.h
index 7bd0c490703d..abdd151fc720 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -136,6 +136,23 @@ enum lockdown_reason {
 
 extern const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1];
 
+#define LSMID_ENTRIES ( \
+	1 + /* capabilities */ \
+	(IS_ENABLED(CONFIG_SECURITY_SELINUX) ? 1 : 0) + \
+	(IS_ENABLED(CONFIG_SECURITY_SMACK) ? 1 : 0) + \
+	(IS_ENABLED(CONFIG_SECURITY_TOMOYO) ? 1 : 0) + \
+	(IS_ENABLED(CONFIG_SECURITY_IMA) ? 1 : 0) + \
+	(IS_ENABLED(CONFIG_SECURITY_APPARMOR) ? 1 : 0) + \
+	(IS_ENABLED(CONFIG_SECURITY_YAMA) ? 1 : 0) + \
+	(IS_ENABLED(CONFIG_SECURITY_LOADPIN) ? 1 : 0) + \
+	(IS_ENABLED(CONFIG_SECURITY_SAFESETID) ? 1 : 0) + \
+	(IS_ENABLED(CONFIG_SECURITY_LOCKDOWN) ? 1 : 0) + \
+	(IS_ENABLED(CONFIG_BPF_LSM) ? 1 : 0) + \
+	(IS_ENABLED(CONFIG_SECURITY_LANDLOCK) ? 1 : 0))
+
+extern int lsm_id;
+extern struct lsm_id *lsm_idlist[];
+
 /* These functions are in security/commoncap.c */
 extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
 		       int cap, unsigned int opts);
diff --git a/security/security.c b/security/security.c
index ff7fda4ffa43..14f22d9c9d84 100644
--- a/security/security.c
+++ b/security/security.c
@@ -28,6 +28,7 @@
 #include <linux/backing-dev.h>
 #include <linux/string.h>
 #include <linux/msg.h>
+#include <uapi/linux/lsm.h>
 #include <net/flow.h>
 
 #define MAX_LSM_EVM_XATTR	2
@@ -318,6 +319,12 @@ static void __init lsm_early_task(struct task_struct *task);
 
 static int lsm_append(const char *new, char **result);
 
+/*
+ * Current index to use while initializing the lsm id list.
+ */
+int lsm_id __lsm_ro_after_init;
+struct lsm_id *lsm_idlist[LSMID_ENTRIES] __lsm_ro_after_init;
+
 static void __init ordered_lsm_init(void)
 {
 	struct lsm_info **lsm;
@@ -362,6 +369,7 @@ static void __init ordered_lsm_init(void)
 	for (lsm = ordered_lsms; *lsm; lsm++)
 		initialize_lsm(*lsm);
 
+	init_debug("lsm count            = %d\n", lsm_id);
 	kfree(ordered_lsms);
 }
 
@@ -483,6 +491,16 @@ void __init security_add_hooks(struct security_hook_list *hooks, int count,
 {
 	int i;
 
+	/*
+	 * A security module may call security_add_hooks() more
+	 * than once. Landlock is one such case.
+	 */
+	if (lsm_id == 0 || lsm_idlist[lsm_id - 1] != lsmid)
+		lsm_idlist[lsm_id++] = lsmid;
+
+	if (lsm_id > LSMID_ENTRIES)
+		panic("%s Too many LSMs registered.\n", __func__);
+
 	for (i = 0; i < count; i++) {
 		hooks[i].lsmid = lsmid;
 		hlist_add_tail_rcu(&hooks[i].list, hooks[i].head);
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


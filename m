Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D345ECE95
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:32:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664310743;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=51iCGR/wzGvRv0nCJX7qifDxwsqRvIE8z7hAfRXafUI=;
	b=YvFEUcs66Aun1svhfiW3kFjwG04fSFrAELor/20KEwVDpnkeQWkEQ0UJhlEF0JyUbucXD2
	INZgBGRlgMMuaHQhNCi4zY5rivyleqdhbo3YSQGX7aGXPblqaMg0FeYBRwQQSHozC5pa/k
	e9aAYL2YQN0QV4F3+5M4Em51qsY3IRg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-AGupWe5yNguRqVUz2luMFw-1; Tue, 27 Sep 2022 16:32:21 -0400
X-MC-Unique: AGupWe5yNguRqVUz2luMFw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD0EA101A528;
	Tue, 27 Sep 2022 20:32:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B066492B05;
	Tue, 27 Sep 2022 20:32:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 701F01946A48;
	Tue, 27 Sep 2022 20:32:16 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 154A41946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:32:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A283740C83EF; Tue, 27 Sep 2022 20:32:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A0A740C83ED
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:32:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E1AA811732
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:32:14 +0000 (UTC)
Received: from sonic302-28.consmr.mail.ne1.yahoo.com
 (sonic302-28.consmr.mail.ne1.yahoo.com [66.163.186.154]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-240-gHKK2kttN9qauUkWNhxqdw-1; Tue,
 27 Sep 2022 16:32:12 -0400
X-MC-Unique: gHKK2kttN9qauUkWNhxqdw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664310729; bh=wYIrusa36pRhmX8sInAgD2MXoN3vKfNp/D4nv5WUCcL=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=MqNU5UeVtySitQ7+csIka6lxuPL7i4WDBL9IF7bxAc5j4r2BxrVZQNHX/0Px4VnDevNUn2h5P1wzE7Bl9+ZbfBAKDBIJHfuTrccQ55swJcBPRM+KUyq31sj/BUBJuRxL2QeAAV4Ro5coOeair937W03JCKhaQ2eZzpGLxCxvcwAI4xp1oMFAggZy3SiWViD4iQhD90hX1Wa82wDVGRCPxEYC6Zg8L7Jrd0DwREfLyTg+G9gv+9Er1SClP5PT5WHfpdqyVoQAIpprEROabm2Ktdwd/59IiywRn7icmLW8xN0wHPMatkFSbCtBFChWGnUTxfdv8Jx6JPGksR7Wn4pqwA==
X-YMail-OSG: L6W9rKAVM1krJpUoOxJS5J6jN23gmZ7rwjqwdg7puGS8AFSBWMxucfkX56mU4ZT
 WKE2mdhowbxk00Uhy28dK0urLsvDT3QTxGIjveOzDXTbzOdegKbJWZWMhvpqSUc56NiEoTdsU2wG
 uvsHnB0BnIvtRFFuJSGezWrYiJ_lT1N.e1EtnOhghfK8LtHcQA2Ov6qOH2Cg8kibPaOMC5Lca9oL
 L2q87RYoF0X0chl.dZnaAxbO4rk9rG.f2lb4ub1CWMgp0CHzx8wZTpzdSunhYQ4io6YH6E1KFlNe
 deL5b.z4XYaNyMNQ_iXfLI0kJMLXSs6xRiqA.g_DfcNLJTZqFSd.7Hha7o6o7w78ZRXo6kl7kQKy
 kp8Yc.uAPB6zXnHi5vJCDu1ANiwcuHNNPvx5XxMQuLenaIZK3dSCQRLyx8yJ1iouk77xa_NyC7CD
 40YShaPQQqxx85nAcX9grmDONcVr10dVDMERg1wRKRS.KSHlRpH_D7sFtPnmcz6inNS8v.NjxHWN
 vLvZjlNxxes3Z33UHfvbqB92p.W6rGsdO6wLfzi9Otns_a2jIbjLQujvlDX5YK4BFk8Jgk6qKCWR
 7r37x.bYVPXMZTtA8d37H8etZKxz_rfSpcPh_wnu3hdtWyM7UldhzffGQmL7TmthtP03hWEUNROf
 YdXAWc3Tws1EAEuzvU4F5c1o_Jk2r9dk1DEyad_X_ruRlAgtGzROC6f_3YIru9DLTY5hWfcPAY6p
 W6qo9C3jO7UM8h7.1gUEYzCv2DCxYROk7zn1QsF2yWVe4CnuZiNXKWFX3XbxgJsBMTTuXgxjoZ13
 61vjrKrV8vQ0TRXI8qiXMvF_EGVPEWXbLrHXtxpHgDZbww4Es6hbq_H7oP2aGiaY6qlU_Amthhnc
 3Zaoqy2Ld_Djasf99erQJLwFHey2muVJYSBW1pHk0XY3P5hwFZBR53mi8WacZ0uddGYBMU1CzsJb
 e22eIQ1Ry3sKiwBzKvOJnVX4d07MP2D9dGRAg5kfSP6WOVrJ7xtoOHsorDQTXlSrni1rUN6KwkXE
 kPlngbhJ27w8n29OBipodX5s8Xdg0OcgRtALZvMENT7nibxmDN0HsRy6sVgzKmAxDXyrY0VBhjnS
 tdU3LwoJfR_4_fxjZKjuqLcU53lx9EqYfAjEeyiN44y8PpUv7DwnOFC7Ld2FIyUcFDmMl85ZNgiT
 kwrtaamviyuFmqfcH1TgmVQlkxDDnL8pK7WF9y6HNsTsQvI5xH47Pp_UsIDR1ZaFkIOAe064JYz7
 o2luYmHjJcarrngk6dRSD8UQxKghGQSLN9mh62xj7Ki0za5uwispquxB6dwkvSiz36RjFIn70ohR
 59uU1NvdYAtNghktaa364HryFX_ZZZ8ttNVXz4PAHkLkQNW78T.y2fqy8glYqtI3gu.Bvwvtpp8i
 CvMMNg7vgxoE8XlyE6OTMt8VHeH89QcIO.yvStU.HyzieG3xQJchTjJoqiKCFZV.GtL9Z_8pFzVY
 vi0btRPEw4R6Clrd4AMKsUiDAqQLwwXjRhX5AegyLzaW4cMfESJfEZN5x5tv4se._78qVEj9L7Q_
 DVUAHHrbWK5AXcLWl89hoyu4r0UWRTz9WgUNn7T4C6cvotf12SgmTdXV9VYj3c9G6u_64.DhUcbn
 5PUIjP5P.EK4vlGsz2g2V9mgW5RZi_RDMyGC5uv7lgtUc04jeIkSBlSG7ssqN568iT2nfF692b4I
 gi.VJqkpVPe27pQm2qFYeHqSoOnY4eO5vnNQYi28ocJhzFp7ndln6LzpES.eFxmZxlb.eg35ehkf
 0cBXEh9Up92sdI9PQUMOO8fJA7UHSoBU_zmtVsrIveHHnhQ4OiOSNMym1fpRGFaK4MoyLewIyGwQ
 FJ1Iup3aU6uLTQDsGg.JWBN3E0va0JRvxvxvaFdCDekGX6P_xWK2G_oL7q_PfoV5MaiVrxiBB13A
 5r0hZQ3ujkEZfX2QV.mE38XMCOC8q60DPykpkoSkjmLnR7UX.gjrVdHLtvWaGOi7z03tneG_pVMY
 cE_9e5agDLDrt8R._JM1YAKtAXCiG_mareErC03dZgGXkUoLmhyGbcbTlIbtGmufOS7su5_vJRIO
 igTiUoInL04P0ArQgO5g6zbHJtwJW75BElaSe8mMOhqX9LO18Qdicl47l1NT8_RbthTz.Dp3.nys
 UxGIICV2EEUS5ixS24T97i2Cm262wWuZ2eHxXnBZfXVc0mGhLlTGmCktSTth3UN.spj6TT0mGX1H
 i_mOMXR3npUR8BEvqpkpz2nRBeEJl5kkFBN1t2FV0gCZNlYAZW0DV.xbcotY-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:32:09 +0000
Received: by hermes--production-bf1-759bcdd488-hrxt2 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 8ccea4647f87bd204746bbf9e900b582; 
 Tue, 27 Sep 2022 20:32:05 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 39/39] LSM: Create lsm_module_list system call
Date: Tue, 27 Sep 2022 13:31:55 -0700
Message-Id: <20220927203155.15060-1-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Create a system call to report the list of Linux Security Modules
that are active on the system. The list is provided as an array
of LSM ID numbers.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 arch/x86/entry/syscalls/syscall_64.tbl |  1 +
 include/linux/syscalls.h               |  1 +
 include/uapi/asm-generic/unistd.h      |  5 ++-
 kernel/sys_ni.c                        |  1 +
 security/lsm_syscalls.c                | 50 ++++++++++++++++++++++++++
 5 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index 56d5c5202fd0..40b35e7069a7 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -373,6 +373,7 @@
 449	common	futex_waitv		sys_futex_waitv
 450	common	set_mempolicy_home_node	sys_set_mempolicy_home_node
 451	common	lsm_self_attr		sys_lsm_self_attr
+452	common	lsm_module_list		sys_lsm_module_list
 
 #
 # Due to a historical design error, certain syscalls are numbered differently
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 7f87ef8be546..e2e2a9e93e8c 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1057,6 +1057,7 @@ asmlinkage long sys_set_mempolicy_home_node(unsigned long start, unsigned long l
 					    unsigned long home_node,
 					    unsigned long flags);
 asmlinkage long sys_lsm_self_attr(struct lsm_ctx *ctx, size_t *size, int flags);
+asmlinkage long sys_lsm_module_list(unsigned int *ids, size_t *size, int flags);
 
 /*
  * Architecture-specific system calls
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index aa66718e1b48..090617a9a53a 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -889,8 +889,11 @@ __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
 #define __NR_lsm_self_attr 451
 __SYSCALL(__NR_lsm_self_attr, sys_lsm_self_attr)
 
+#define __NR_lsm_module_list 452
+__SYSCALL(__NR_lsm_module_list, sys_lsm_module_list)
+
 #undef __NR_syscalls
-#define __NR_syscalls 452
+#define __NR_syscalls 453
 
 /*
  * 32 bit systems traditionally used different
diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
index 0fdb0341251d..bde9e74a3473 100644
--- a/kernel/sys_ni.c
+++ b/kernel/sys_ni.c
@@ -264,6 +264,7 @@ COND_SYSCALL(mremap);
 
 /* security/lsm_syscalls.c */
 COND_SYSCALL(lsm_self_attr);
+COND_SYSCALL(lsm_module_list);
 
 /* security/keys/keyctl.c */
 COND_SYSCALL(add_key);
diff --git a/security/lsm_syscalls.c b/security/lsm_syscalls.c
index da0fab7065e2..41d9ef945ede 100644
--- a/security/lsm_syscalls.c
+++ b/security/lsm_syscalls.c
@@ -154,3 +154,53 @@ SYSCALL_DEFINE3(lsm_self_attr,
 	kfree(final);
 	return rc;
 }
+
+/**
+ * lsm_module_list - Return a list of the active security modules
+ * @ids: the LSM module ids
+ * @size: size of @ids, updated on return
+ * @flags: reserved for future use, must be zero
+ *
+ * Returns a list of the active LSM ids. On success this function
+ * returns the number of @ids array elements. This value may be zero
+ * if there are no LSMs active. If @size is insufficient to contain
+ * the return data -E2BIG is returned and @size is set to the minimum
+ * required size. In all other cases a negative value indicating the
+ * error is returned.
+ */
+SYSCALL_DEFINE3(lsm_module_list,
+	       unsigned int __user *, ids,
+	       size_t __user *, size,
+	       int, flags)
+{
+	unsigned int *interum;
+	size_t total_size = lsm_id * sizeof(*interum);
+	size_t usize;
+	int rc;
+	int i;
+
+	if (get_user(usize, size))
+		return -EFAULT;
+
+	if (usize < total_size) {
+		if (put_user(total_size, size) != 0)
+			return -EFAULT;
+		return -E2BIG;
+	}
+
+	interum = kzalloc(total_size, GFP_KERNEL);
+	if (interum == NULL)
+		return -ENOMEM;
+
+	for (i = 0; i < lsm_id; i++)
+		interum[i] = lsm_idlist[i]->id;
+
+	if (copy_to_user(ids, interum, total_size) != 0 ||
+	    put_user(total_size, size) != 0)
+		rc = -EFAULT;
+	else
+		rc = lsm_id;
+
+	kfree(interum);
+	return rc;
+}
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


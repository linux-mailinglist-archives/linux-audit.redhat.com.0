Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 449E22BB6B9
	for <lists+linux-audit@lfdr.de>; Fri, 20 Nov 2020 21:28:56 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-Gt2pfn6DP_SoCWVElfH01A-1; Fri, 20 Nov 2020 15:28:53 -0500
X-MC-Unique: Gt2pfn6DP_SoCWVElfH01A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA978814409;
	Fri, 20 Nov 2020 20:28:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C1F360853;
	Fri, 20 Nov 2020 20:28:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 634FF180954D;
	Fri, 20 Nov 2020 20:28:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKKSjRB032699 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 15:28:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 405FB2026D49; Fri, 20 Nov 2020 20:28:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AEC52026D47
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 20:28:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CAC6800157
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 20:28:42 +0000 (UTC)
Received: from sonic302-28.consmr.mail.ne1.yahoo.com
	(sonic302-28.consmr.mail.ne1.yahoo.com [66.163.186.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-197-vHp4cRnaP3W9RKzxjNYgOw-1;
	Fri, 20 Nov 2020 15:28:39 -0500
X-MC-Unique: vHp4cRnaP3W9RKzxjNYgOw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1605904119; bh=+QpW5Yb3nMG9cgfvmdLG1FCxT3cEdKuN9gQRoUGjMGM=;
	h=From:To:Subject:Date:From:Subject;
	b=qycj7XmW0KlTCw7RJwwsMGfErPKUjVqpJVQMlAE33IRvBKwTOf/Ivnjfn2fr/yaseZC/VrbC/KZBj/+Eb5UKvD4D1DL6/Oua8eIp1LpaDcn3hasutT19+c2V129txcF2Aq/qGb+rhOU2E369Hi/1tg6LnYpidSNLzRN4Yrtxob0Pth+0iCeXqdeid/Qo+yyTSMkGzBNHWKEjRLJ7oVMYJwcEqQM4QvLzbfAD95rsDLQD2YYB+r5EdCTSPcrruvul37LBACnAEnYWVypgwXNUM5TVYuuWrQuL85bHaG7MVssBVgPnJPWih/upd6hMK/BZ+T8CXViFXcJXhB5bYDYFkg==
X-YMail-OSG: DtQYuHAVM1niYZcA2zQHjC4PX03TnZa2iCdUXTb6ecfMPtoyX045ODEbxxhn6qx
	irIFMMd7jG7Oobf1CG2gNk6afZWvt3wxUBdeH9q70XaqzzgB6WDIVx4DlHtq9gCxvPw6b5UrjVbT
	fF7uFOf5uvGR8nR48WRNIkWLVOxjHxOFWkrnt4nI0Sy4PlFt49drr14.Tkr1i_EdiFiYXDvlJCAg
	j8kY2N.FlDGHdzxLkP5QeIIThvqKSX5mAAiegCksASuSjhyumw9bCfsO_1PuscTjR9blQBdi3UvP
	iN_BWock1HWIaWv2QPT3Za.WHmnITMyMM8XQbefImryzyliDY64A5K8z_UNHgkkR3DZ4wJPhqJnl
	C_M0HEywwhV50Im_lzJy2Zs7ajV9cdxsPFv14wA6qUMGa7.WhVloQRRlgDwIdynZzJp3Z3KxrNOl
	ui8UNADfn28Q.M569eSR4uWveP8hJbz1jbTomu9Y8IbnDC4c0dyUYBX2pjapa2U2yRqjYRbFth5F
	N_3tH3u1YoLnGuQRBNOch3VjB32O.QJf3JtdDTiLTo._KSnZ4DJaqAT8Je16ydhUvWUv18uLg.ol
	ADEipH_I2Ii0eSiteU3_RI0KRwK57Nnp6NhkASYHwmXgcbLd1V_1yTGxixXg39uKGD8PHeV1cJv4
	HK5ADrHPgq13lA4DLp57Zk.zA_KEETCHC_Ln9QAJvJBmPhIxB3tDaTszzSD2E7s1cj1SpJy2cnYH
	wBiCt3zClFccu59qywwxjpCfj8Uc4XqqQOah4sO41Zik3vaE1Pvr.YH8yXIFSPjxq2RN8HqCy46v
	Do6MVvrr.WNR0rccZJ8S27X06KpdgVhd.rRSHcsGKoPx.Yup2R90lQWU_EjX8baTW6B7BaubHHNY
	qBNSc3ElTdAV7MlDGCaDeBbDcaL8LQZBxg3f7YWsLn5Qjp59YCh.JLZFIIoQ1ex_RLjeQYwdq1DO
	dFIMOAUni00pGmfkJGZbQGUBTj55RSlH.KZYze4l0uasNBB9wiM6wrCgsL9wuZ7xeb5Z9bMhJkFJ
	sUdomothke_Fkyj_MBZSsIleBYgdi9eYvKymi2rEjJqUUBSl7TZm.zzjSoPh6UwpLKcbYt5XRG0d
	5k2zxhNiIM65rEqCrER4APZspiPs8T3n_PEou6ZLR_t4eOjlysc_oIbhuEhoE_mRXZn.jC3QEf3U
	tLeql2RAjLHuQvJCgbJS0u_VDBtiRvFfIp027qkTT59riI2DippK3r6tEOhyz4mfOSsa78yV5vRy
	LaDwC5D2Sgn62Lo7Nqe30eW7fovpQnNJ9VkMk2yXuoxUfq.bvfuznBKEdbRqlbjASXHbBMkRgfi5
	kkKU6cXeDnaAIqh.dqXbTv5DUBxJhhC0UCZx8QfEeYothd5FYbxqItRAYeseT3OUwaWXhhpbEkWo
	Hjcv9LkmUUmMGJKDDa5J2F0QTXqb2OPN0zGE9VQ2oJPKRufws5gzlA3Ev6WhdYbWkd36I_ibjiky
	_VofQIspiPLfDmFr4qn0v5R30_EqNyoW3gCAeQGWUhXkIXjqnD9zf1zKydPOruYUltt_ZFZm_qfW
	26rqccJRm_1zZcKVoF5LCGWh.8fB424egkATWZdqglaYWChRTDcsnc15WmzBI3FbbDI9udCk0JA4
	Own6yVfh2IdWtfDMSJcRN3YC7cTRbK8sKWX39uNJzdxKn_yTPyVe7k.nfQu321s32Xx4CRLojX_z
	8ChSWZlHT7tDEPX.m6IfnHYqj7Oe6vQ5ntaxWycmNkOVKrK8L.j7GsziYgu26WwTro_UWyW41_rs
	c6ua081ErjyxcL.NO37cFMePep2kXqBV5aIN2Jj1eca9.LD48tNRavbnVb2i8advG3Htvwy4h0r3
	CvR6LoCorZB2K25fHa4pk.7p6gOhqj08vr98Utb3XJA35u_mBZL3WrfsUg7W4tPDspihNccmw5qj
	6jDRUrsF7rk7p0_FZLc_pfpmRCVLTELFOKSLPlhaQP1GnCXh1iAnJDOTJGd5VjNBVM6dgLOuQ004
	luu_RYosYUlw1WoXN5NEx3XpDumamhxF79neGBfzbEMYYJ9H6KSSVOMmUZYc28NzpQXrHq9H4xiF
	h0GV5xJ8TL4OR2qWb5_93M2TakxTaDGcREUXJ8dlXqfmm9Y5s5zcBtg3oeePb7YOQClbd8euUxir
	I50Bs3u5LeAIVbzvPsuvAlAglcuhKvEB9vOH2H6qqjAABCV1q.ap6VPp4FiH1oP_5Y.PIVXF3SGG
	4iA0hVX1GFHwVLlETdX5ktgt2T0m4.THSpjMXtP5Bdvr7.01V.uC_h3IyeLnj3lHk2z_Ib8UbMLh
	.FouOGh1w8eabOKkdPZpa50HBzXN3uO1fSCEoFEzMwmHuW4aOBR7yk9KG4Uyn33wNofT_gzyxz8p
	sC6xuOHgCC_lp2PTA_WuKZV9zj2hf7xBvEOC68.TkFPW4OV4cUPCuxq1Zt3U.IaECvrfNTTAfid.
	R69mMst07JMAnOAsV8wLFRAXq64Lkz9vL0Wl6rinkm7ft3H4qdLkisSha0dVWH245kmWcbaeQzgU
	cX9nRUHyfLSV34RnIiNYXkcIZi.MkEVDHrjqHCj4HsgIrHDZ8LwwQv2DveR0G1hl_bvtNsIAr42y
	b.px6goX8gyBTD.ZqOIL5MRifODNlrPJkjgG8gHiTRXxWVr2gNqLg6V6Y7onYutnukxVaN4bj0zC
	2AJioyVhNap0b7SX7kcoRfsNp68AkK8vhLUAcwdXEvX3WBVL6vPsgMY.5is_tAlwcH04LcGA37w7
	8aKCBkmxc.Bh77axmvQrvFjYgx_QmoLj32k5hOCsd3c.cvPqgdrpWqfs8E6dackqhs08B33LWwkC
	K_im5Om0AX5IHK9Tt62BTAt1pIy0IifURmrVN1R0Qp1XCkSzk0UInUoYMX8wG11CPGZVcLOzNWL1
	RuDD38hOoRgFIROMpTjTnAoGGAIFTr5U3Tt53U.rKoS12stBtIXlfWR3KXmfNK3BrnBHBihtCszR
	y3UonCR0yEY5jbDTxiqBs9GO2EjbZFsHa7W63yNjlZZ9_icOmpkL.asE1qXcOCqN_MX0GBcVw7fE
	y9jD8iQpDnIz_EgYZRefMocfD7qNFxj8t_mPx2OOK5TTSIYXHglUN2QgX8s3nxWrLJYfhX5znsN5
	ENf_jYQMQ_DQn0NzoLh00_mC8fq4hXxyLVLI5fU4itgIQfw8YfrwviAkxyesoXU1B5bnOUe3Y2Yz
	djHFeqzefzk3ppdwfgUras3JcllJIHlgtqUgC6g3v3K486ejYBeUeyMqw.aUqiHm9BjtWKTvHcX2
	KBEFbbft7HFwaQMWigaXFs8lhEPNkoD63jNbbYu77hiiWzAxgsJB2.arTMJgD6IUIB4d9.hmwztZ
	F4Zlr7s9VUzSlNeM7G7cqbB3VvvrwPhPOP4wenw--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic302.consmr.mail.ne1.yahoo.com with HTTP;
	Fri, 20 Nov 2020 20:28:39 +0000
Received: by smtp402.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID c2caaea9b3698deaa58835e148f7483a; 
	Fri, 20 Nov 2020 20:28:34 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v23 12/23] LSM: Specify which LSM to display
Date: Fri, 20 Nov 2020 12:14:56 -0800
Message-Id: <20201120201507.11993-13-casey@schaufler-ca.com>
In-Reply-To: <20201120201507.11993-1-casey@schaufler-ca.com>
References: <20201120201507.11993-1-casey@schaufler-ca.com>
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
Cc: john.johansen@canonical.com, linux-doc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-audit@redhat.com,
	linux-api@vger.kernel.org, sds@tycho.nsa.gov
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

Create a new entry "interface_lsm" in the procfs attr directory for
controlling which LSM security information is displayed for a
process. A process can only read or write its own display value.

The name of an active LSM that supplies hooks for
human readable data may be written to "interface_lsm" to set the
value. The name of the LSM currently in use can be read from
"interface_lsm". At this point there can only be one LSM capable
of display active. A helper function lsm_task_ilsm() is
provided to get the interface lsm slot for a task_struct.

Setting the "interface_lsm" requires that all security modules using
setprocattr hooks allow the action. Each security module is
responsible for defining its policy.

AppArmor hook provided by John Johansen <john.johansen@canonical.com>
SELinux hook provided by Stephen Smalley <stephen.smalley.work@gmail.com>

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: John Johansen <john.johansen@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-api@vger.kernel.org
Cc: linux-doc@vger.kernel.org
---
 .../ABI/testing/procfs-attr-lsm_display       |  22 +++
 Documentation/security/lsm.rst                |  14 ++
 fs/proc/base.c                                |   1 +
 include/linux/lsm_hooks.h                     |  17 ++
 security/apparmor/include/apparmor.h          |   3 +-
 security/apparmor/lsm.c                       |  32 ++++
 security/security.c                           | 169 ++++++++++++++++--
 security/selinux/hooks.c                      |  11 ++
 security/selinux/include/classmap.h           |   2 +-
 security/smack/smack_lsm.c                    |   7 +
 10 files changed, 259 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/ABI/testing/procfs-attr-lsm_display

diff --git a/Documentation/ABI/testing/procfs-attr-lsm_display b/Documentation/ABI/testing/procfs-attr-lsm_display
new file mode 100644
index 000000000000..afa7c60a7892
--- /dev/null
+++ b/Documentation/ABI/testing/procfs-attr-lsm_display
@@ -0,0 +1,22 @@
+What:		/proc/*/attr/lsm_display
+Contact:	linux-security-module@vger.kernel.org,
+Description:	The name of the Linux security module (LSM) that will
+		provide information in the /proc/*/attr/current,
+		/proc/*/attr/prev and /proc/*/attr/exec interfaces.
+		The details of permissions required to read from
+		this interface are dependent on the LSMs active on the
+		system.
+		A process cannot write to this interface unless it
+		refers to itself.
+		The other details of permissions required to write to
+		this interface are dependent on the LSMs active on the
+		system.
+		The format of the data used by this interface is a
+		text string identifying the name of an LSM. The values
+		accepted are:
+			selinux		- the SELinux LSM
+			smack		- the Smack LSM
+			apparmor	- The AppArmor LSM
+		By convention the LSM names are lower case and do not
+		contain special characters. 
+Users:		LSM user-space
diff --git a/Documentation/security/lsm.rst b/Documentation/security/lsm.rst
index 6a2a2e973080..b77b4a540391 100644
--- a/Documentation/security/lsm.rst
+++ b/Documentation/security/lsm.rst
@@ -129,3 +129,17 @@ to identify it as the first security module to be registered.
 The capabilities security module does not use the general security
 blobs, unlike other modules. The reasons are historical and are
 based on overhead, complexity and performance concerns.
+
+LSM External Interfaces
+=======================
+
+The LSM infrastructure does not generally provide external interfaces.
+The individual security modules provide what external interfaces they
+require.
+
+The file ``/sys/kernel/security/lsm`` provides a comma
+separated list of the active security modules.
+
+The file ``/proc/pid/attr/interface_lsm`` contains the name of the security
+module for which the ``/proc/pid/attr/current`` interface will
+apply. This interface can be written to.
diff --git a/fs/proc/base.c b/fs/proc/base.c
index b362523a9829..214a0503589d 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -2808,6 +2808,7 @@ static const struct pid_entry attr_dir_stuff[] = {
 	ATTR(NULL, "fscreate",		0666),
 	ATTR(NULL, "keycreate",		0666),
 	ATTR(NULL, "sockcreate",	0666),
+	ATTR(NULL, "interface_lsm",	0666),
 #ifdef CONFIG_SECURITY_SMACK
 	DIR("smack",			0555,
 	    proc_smack_attr_dir_inode_ops, proc_smack_attr_dir_ops),
diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index fe9203f15993..e19393b2b8b7 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -1660,4 +1660,21 @@ static inline void security_delete_hooks(struct security_hook_list *hooks,
 
 extern int lsm_inode_alloc(struct inode *inode);
 
+/**
+ * lsm_task_ilsm - the "interface_lsm" for this task
+ * @task: The task to report on
+ *
+ * Returns the task's interface LSM slot.
+ */
+static inline int lsm_task_ilsm(struct task_struct *task)
+{
+#ifdef CONFIG_SECURITY
+	int *ilsm = task->security;
+
+	if (ilsm)
+		return *ilsm;
+#endif
+	return LSMBLOB_INVALID;
+}
+
 #endif /* ! __LINUX_LSM_HOOKS_H */
diff --git a/security/apparmor/include/apparmor.h b/security/apparmor/include/apparmor.h
index 1fbabdb565a8..b1622fcb4394 100644
--- a/security/apparmor/include/apparmor.h
+++ b/security/apparmor/include/apparmor.h
@@ -28,8 +28,9 @@
 #define AA_CLASS_SIGNAL		10
 #define AA_CLASS_NET		14
 #define AA_CLASS_LABEL		16
+#define AA_CLASS_DISPLAY_LSM	17
 
-#define AA_CLASS_LAST		AA_CLASS_LABEL
+#define AA_CLASS_LAST		AA_CLASS_DISPLAY_LSM
 
 /* Control parameters settable through module/boot flags */
 extern enum audit_mode aa_g_audit;
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 432915c1d427..0ef5d0b2dbdb 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -612,6 +612,25 @@ static int apparmor_getprocattr(struct task_struct *task, char *name,
 	return error;
 }
 
+
+static int profile_interface_lsm(struct aa_profile *profile,
+				 struct common_audit_data *sa)
+{
+	struct aa_perms perms = { };
+	unsigned int state;
+
+	state = PROFILE_MEDIATES(profile, AA_CLASS_DISPLAY_LSM);
+	if (state) {
+		aa_compute_perms(profile->policy.dfa, state, &perms);
+		aa_apply_modes_to_perms(profile, &perms);
+		aad(sa)->label = &profile->label;
+
+		return aa_check_perms(profile, &perms, AA_MAY_WRITE, sa, NULL);
+	}
+
+	return 0;
+}
+
 static int apparmor_setprocattr(const char *name, void *value,
 				size_t size)
 {
@@ -623,6 +642,19 @@ static int apparmor_setprocattr(const char *name, void *value,
 	if (size == 0)
 		return -EINVAL;
 
+	/* LSM infrastructure does actual setting of interface_lsm if allowed */
+	if (!strcmp(name, "interface_lsm")) {
+		struct aa_profile *profile;
+		struct aa_label *label;
+
+		aad(&sa)->info = "set interface lsm";
+		label = begin_current_label_crit_section();
+		error = fn_for_each_confined(label, profile,
+					profile_interface_lsm(profile, &sa));
+		end_current_label_crit_section(label);
+		return error;
+	}
+
 	/* AppArmor requires that the buffer must be null terminated atm */
 	if (args[size - 1] != '\0') {
 		/* null terminate */
diff --git a/security/security.c b/security/security.c
index 78aeb2ae7010..543d9b707fe5 100644
--- a/security/security.c
+++ b/security/security.c
@@ -76,7 +76,16 @@ static struct kmem_cache *lsm_file_cache;
 static struct kmem_cache *lsm_inode_cache;
 
 char *lsm_names;
-static struct lsm_blob_sizes blob_sizes __lsm_ro_after_init;
+
+/*
+ * The task blob includes the "interface_lsm" slot used for
+ * chosing which module presents contexts.
+ * Using a long to avoid potential alignment issues with
+ * module assigned task blobs.
+ */
+static struct lsm_blob_sizes blob_sizes __lsm_ro_after_init = {
+	.lbs_task = sizeof(long),
+};
 
 /* Boot-time LSM user choice */
 static __initdata const char *chosen_lsm_order;
@@ -471,8 +480,10 @@ static int lsm_append(const char *new, char **result)
 
 /*
  * Current index to use while initializing the lsmblob secid list.
+ * Pointers to the LSM id structures for local use.
  */
 static int lsm_slot __lsm_ro_after_init;
+static struct lsm_id *lsm_slotlist[LSMBLOB_ENTRIES];
 
 /**
  * security_add_hooks - Add a modules hooks to the hook lists.
@@ -492,6 +503,7 @@ void __init security_add_hooks(struct security_hook_list *hooks, int count,
 	if (lsmid->slot == LSMBLOB_NEEDED) {
 		if (lsm_slot >= LSMBLOB_ENTRIES)
 			panic("%s Too many LSMs registered.\n", __func__);
+		lsm_slotlist[lsm_slot] = lsmid;
 		lsmid->slot = lsm_slot++;
 		init_debug("%s assigned lsmblob slot %d\n", lsmid->lsm,
 			   lsmid->slot);
@@ -621,6 +633,8 @@ int lsm_inode_alloc(struct inode *inode)
  */
 static int lsm_task_alloc(struct task_struct *task)
 {
+	int *ilsm;
+
 	if (blob_sizes.lbs_task == 0) {
 		task->security = NULL;
 		return 0;
@@ -629,6 +643,15 @@ static int lsm_task_alloc(struct task_struct *task)
 	task->security = kzalloc(blob_sizes.lbs_task, GFP_KERNEL);
 	if (task->security == NULL)
 		return -ENOMEM;
+
+	/*
+	 * The start of the task blob contains the "interface" LSM slot number.
+	 * Start with it set to the invalid slot number, indicating that the
+	 * default first registered LSM be displayed.
+	 */
+	ilsm = task->security;
+	*ilsm = LSMBLOB_INVALID;
+
 	return 0;
 }
 
@@ -1629,14 +1652,26 @@ int security_file_open(struct file *file)
 
 int security_task_alloc(struct task_struct *task, unsigned long clone_flags)
 {
+	int *oilsm = current->security;
+	int *nilsm;
 	int rc = lsm_task_alloc(task);
 
-	if (rc)
+	if (unlikely(rc))
 		return rc;
+
 	rc = call_int_hook(task_alloc, 0, task, clone_flags);
-	if (unlikely(rc))
+	if (unlikely(rc)) {
 		security_task_free(task);
-	return rc;
+		return rc;
+	}
+
+	if (oilsm) {
+		nilsm = task->security;
+		if (nilsm)
+			*nilsm = *oilsm;
+	}
+
+	return 0;
 }
 
 void security_task_free(struct task_struct *task)
@@ -2054,23 +2089,110 @@ int security_getprocattr(struct task_struct *p, const char *lsm, char *name,
 				char **value)
 {
 	struct security_hook_list *hp;
+	int ilsm = lsm_task_ilsm(current);
+	int slot = 0;
+
+	if (!strcmp(name, "interface_lsm")) {
+		/*
+		 * lsm_slot will be 0 if there are no displaying modules.
+		 */
+		if (lsm_slot == 0)
+			return -EINVAL;
+
+		/*
+		 * Only allow getting the current process' interface_lsm.
+		 * There are too few reasons to get another process'
+		 * interface_lsm and too many LSM policy issues.
+		 */
+		if (current != p)
+			return -EINVAL;
+
+		ilsm = lsm_task_ilsm(p);
+		if (ilsm != LSMBLOB_INVALID)
+			slot = ilsm;
+		*value = kstrdup(lsm_slotlist[slot]->lsm, GFP_KERNEL);
+		if (*value)
+			return strlen(*value);
+		return -ENOMEM;
+	}
 
 	hlist_for_each_entry(hp, &security_hook_heads.getprocattr, list) {
 		if (lsm != NULL && strcmp(lsm, hp->lsmid->lsm))
 			continue;
+		if (lsm == NULL && ilsm != LSMBLOB_INVALID &&
+		    ilsm != hp->lsmid->slot)
+			continue;
 		return hp->hook.getprocattr(p, name, value);
 	}
 	return LSM_RET_DEFAULT(getprocattr);
 }
 
+/**
+ * security_setprocattr - Set process attributes via /proc
+ * @lsm: name of module involved, or NULL
+ * @name: name of the attribute
+ * @value: value to set the attribute to
+ * @size: size of the value
+ *
+ * Set the process attribute for the specified security module
+ * to the specified value. Note that this can only be used to set
+ * the process attributes for the current, or "self" process.
+ * The /proc code has already done this check.
+ *
+ * Returns 0 on success, an appropriate code otherwise.
+ */
 int security_setprocattr(const char *lsm, const char *name, void *value,
 			 size_t size)
 {
 	struct security_hook_list *hp;
+	char *termed;
+	char *copy;
+	int *ilsm = current->security;
+	int rc = -EINVAL;
+	int slot = 0;
+
+	if (!strcmp(name, "interface_lsm")) {
+		/*
+		 * Change the "interface_lsm" value only if all the security
+		 * modules that support setting a procattr allow it.
+		 * It is assumed that all such security modules will be
+		 * cooperative.
+		 */
+		if (size == 0)
+			return -EINVAL;
+
+		hlist_for_each_entry(hp, &security_hook_heads.setprocattr,
+				     list) {
+			rc = hp->hook.setprocattr(name, value, size);
+			if (rc < 0)
+				return rc;
+		}
+
+		rc = -EINVAL;
+
+		copy = kmemdup_nul(value, size, GFP_KERNEL);
+		if (copy == NULL)
+			return -ENOMEM;
+
+		termed = strsep(&copy, " \n");
+
+		for (slot = 0; slot < lsm_slot; slot++)
+			if (!strcmp(termed, lsm_slotlist[slot]->lsm)) {
+				*ilsm = lsm_slotlist[slot]->slot;
+				rc = size;
+				break;
+			}
+
+		kfree(termed);
+		return rc;
+	}
 
 	hlist_for_each_entry(hp, &security_hook_heads.setprocattr, list) {
 		if (lsm != NULL && strcmp(lsm, hp->lsmid->lsm))
 			continue;
+		if (lsm == NULL && *ilsm != LSMBLOB_INVALID &&
+		    *ilsm != hp->lsmid->slot)
+			continue;
 		return hp->hook.setprocattr(name, value, size);
 	}
 	return LSM_RET_DEFAULT(setprocattr);
@@ -2090,15 +2212,15 @@ EXPORT_SYMBOL(security_ismaclabel);
 int security_secid_to_secctx(struct lsmblob *blob, char **secdata, u32 *seclen)
 {
 	struct security_hook_list *hp;
-	int rc;
+	int ilsm = lsm_task_ilsm(current);
 
 	hlist_for_each_entry(hp, &security_hook_heads.secid_to_secctx, list) {
 		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
 			continue;
-		rc = hp->hook.secid_to_secctx(blob->secid[hp->lsmid->slot],
-					      secdata, seclen);
-		if (rc != LSM_RET_DEFAULT(secid_to_secctx))
-			return rc;
+		if (ilsm == LSMBLOB_INVALID || ilsm == hp->lsmid->slot)
+			return hp->hook.secid_to_secctx(
+					blob->secid[hp->lsmid->slot],
+					secdata, seclen);
 	}
 
 	return LSM_RET_DEFAULT(secid_to_secctx);
@@ -2109,16 +2231,15 @@ int security_secctx_to_secid(const char *secdata, u32 seclen,
 			     struct lsmblob *blob)
 {
 	struct security_hook_list *hp;
-	int rc;
+	int ilsm = lsm_task_ilsm(current);
 
 	lsmblob_init(blob, 0);
 	hlist_for_each_entry(hp, &security_hook_heads.secctx_to_secid, list) {
 		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
 			continue;
-		rc = hp->hook.secctx_to_secid(secdata, seclen,
-					      &blob->secid[hp->lsmid->slot]);
-		if (rc != 0)
-			return rc;
+		if (ilsm == LSMBLOB_INVALID || ilsm == hp->lsmid->slot)
+			return hp->hook.secctx_to_secid(secdata, seclen,
+						&blob->secid[hp->lsmid->slot]);
 	}
 	return 0;
 }
@@ -2126,7 +2247,14 @@ EXPORT_SYMBOL(security_secctx_to_secid);
 
 void security_release_secctx(char *secdata, u32 seclen)
 {
-	call_void_hook(release_secctx, secdata, seclen);
+	struct security_hook_list *hp;
+	int ilsm = lsm_task_ilsm(current);
+
+	hlist_for_each_entry(hp, &security_hook_heads.release_secctx, list)
+		if (ilsm == LSMBLOB_INVALID || ilsm == hp->lsmid->slot) {
+			hp->hook.release_secctx(secdata, seclen);
+			return;
+		}
 }
 EXPORT_SYMBOL(security_release_secctx);
 
@@ -2267,8 +2395,15 @@ EXPORT_SYMBOL(security_sock_rcv_skb);
 int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
 				      int __user *optlen, unsigned len)
 {
-	return call_int_hook(socket_getpeersec_stream, -ENOPROTOOPT, sock,
-				optval, optlen, len);
+	int ilsm = lsm_task_ilsm(current);
+	struct security_hook_list *hp;
+
+	hlist_for_each_entry(hp, &security_hook_heads.socket_getpeersec_stream,
+			     list)
+		if (ilsm == LSMBLOB_INVALID || ilsm == hp->lsmid->slot)
+			return hp->hook.socket_getpeersec_stream(sock, optval,
+								 optlen, len);
+	return -ENOPROTOOPT;
 }
 
 int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 52a50d7ca534..a37afbb159ab 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6334,6 +6334,17 @@ static int selinux_setprocattr(const char *name, void *value, size_t size)
 	/*
 	 * Basic control over ability to set these attributes at all.
 	 */
+
+	/*
+	 * For setting interface_lsm, we only perform a permission check;
+	 * the actual update to the interface_lsm value is handled by the
+	 * LSM framework.
+	 */
+	if (!strcmp(name, "interface_lsm"))
+		return avc_has_perm(&selinux_state,
+				    mysid, mysid, SECCLASS_PROCESS2,
+				    PROCESS2__SETDISPLAY, NULL);
+
 	if (!strcmp(name, "exec"))
 		error = avc_has_perm(&selinux_state,
 				     mysid, mysid, SECCLASS_PROCESS,
diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
index 40cebde62856..1858aa47b32a 100644
--- a/security/selinux/include/classmap.h
+++ b/security/selinux/include/classmap.h
@@ -53,7 +53,7 @@ struct security_class_mapping secclass_map[] = {
 	    "execmem", "execstack", "execheap", "setkeycreate",
 	    "setsockcreate", "getrlimit", NULL } },
 	{ "process2",
-	  { "nnp_transition", "nosuid_transition", NULL } },
+	  { "nnp_transition", "nosuid_transition", "setdisplay", NULL } },
 	{ "system",
 	  { "ipc_info", "syslog_read", "syslog_mod",
 	    "syslog_console", "module_request", "module_load", NULL } },
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index f96be93d1a75..3f96a7aaed6b 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -3509,6 +3509,13 @@ static int smack_setprocattr(const char *name, void *value, size_t size)
 	struct smack_known_list_elem *sklep;
 	int rc;
 
+	/*
+	 * Allow the /proc/.../attr/current and SO_PEERSEC "interface_lsm"
+	 * to be reset at will.
+	 */
+	if (strcmp(name, "interface_lsm") == 0)
+		return 0;
+
 	if (!smack_privileged(CAP_MAC_ADMIN) && list_empty(&tsp->smk_relabel))
 		return -EPERM;
 
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


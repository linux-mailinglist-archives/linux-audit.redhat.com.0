Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1682A2BB6AA
	for <lists+linux-audit@lfdr.de>; Fri, 20 Nov 2020 21:25:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-shYdm5S2MWmTNNvJ8asfeg-1; Fri, 20 Nov 2020 15:25:26 -0500
X-MC-Unique: shYdm5S2MWmTNNvJ8asfeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B288580047B;
	Fri, 20 Nov 2020 20:25:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91EF25D6BA;
	Fri, 20 Nov 2020 20:25:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 580DD180954D;
	Fri, 20 Nov 2020 20:25:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKKPI1u032125 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 15:25:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3CDF92166B2C; Fri, 20 Nov 2020 20:25:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 373E52166B28
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 20:25:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D838C811E84
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 20:25:15 +0000 (UTC)
Received: from sonic317-38.consmr.mail.ne1.yahoo.com
	(sonic317-38.consmr.mail.ne1.yahoo.com [66.163.184.49]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-65-1SgDK3q0MAm1kp1b3zfe-w-1;
	Fri, 20 Nov 2020 15:25:13 -0500
X-MC-Unique: 1SgDK3q0MAm1kp1b3zfe-w-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1605903913; bh=T177cc6gmedjQsnEeWMQbEBsJ88iH0N6Vbvr9SMRNVQ=;
	h=From:To:Subject:Date:From:Subject;
	b=dHfCD8RdHvfSigU0O1m1zNMwJt4d8Zc8neCZUBqu2rzLkCfwiaVczn1AmjqIVzPmozfwQxYgMR5J2R5TLO8tgIOvHLhlH0C+Y2nFyasdcPGPx0pC1c/YSMguiuReMZEn8OJf1irvPw/nq9tPE3Z5WiCeqZ/q8uobi4uEUynR77x2jj4rdcsGD6zk1jJsqfxt8OUf/Gwn7rmsa9AMYm1+dip+pdA/8n38tgcti3NByCnzKpABWFHbUEclBTlmaWX1kclLi5MYKvv2fD9UKBONYnf5ynA4O4MQ//Zra8BGlKESiKSp/G95fzaFETp6ESUT7nHV9Ko8jHrJuWwForTPzw==
X-YMail-OSG: rFKwizcVM1k0GQNDH8B3.beB8IcCI5XoEo28AdhLACD6QBfIVDUR8sLRRa4pyUL
	ljeTXnEmDqTegVl5AnjbWLHs1juvfx9SVh7DqB00tRd14JyYRZBE6W2IQBH7r6OrbbCl4WtRbuTC
	tpMYtEPVvXPChwFfmR0NWlsURI2CNUTGv2lFx94EObisydryh.kU6e199YUSTzo3y6xjFTipY5EF
	SFAsnKfG7MRwAsGQ06n.IjVPmZyTrH9rw9yMvJqrlgBJhUtWzPhIwX_25L6aQ8RhALBH3mPBXws1
	hjb235Nck8y_8g0iqrkE0jSwkYK5_c4ndYYZ2gt1puxoUKo.kJczEVyqHy5sm_mMizQPVkaSEbzt
	HPJ7NTwHgBJBgKl0qNRy5wqVz.iDHgRW.ohKDoPDkK6fgEYKxA5.ijt2vwBkxe6G7A3QL8SeZVI2
	EGIe2dX_zKzte6wIvCCutfl7ZOjeZKHs3RdQ2pab0luKZQnc6egjaw5BOBkIdi6OwudRRz9TrsMl
	TtjGxaohPxuAoFf8u3MgHyyFREM1V0EK2odqN7BdOhAS.bnUULFrQIBo1sf6SdE6XiTTp4OLMdS5
	p_zkf6xt1JoShSZOEao5eAQKjhD6T7vAIYIJ_bHgw_okwfHKXxUAc_G_eZi2bNsnhOTiprJ_DD45
	KPTW1Hz33QG.oNYjA5svYdmin52ymXifSfmQteQ7rDcewROg9z8wrG7lyF24uRcZSHRbTVi5axeL
	pY7DZpdN3mkpCKxfCYbg.hciPyJQ2yv4r02VnOFE4tyFuTo6vY7y8DpsBnhfncNbEXkhioutMxDH
	7Ggxj7yWw2Sm4ELVOjx0jiqpuqysbvlVPmIUf8aJ.Z2wm6ceKmKP7AekbbXBaH4Ab4SmfX2zE33e
	clNtRA1fUPWtwMlvGJVYu36DIayaxHZvYRBCWRKNjXd_b7Pmaj1kefPGud_.TzFnwGi86cXtbbPL
	F7W6NqJrmLhVZyA2jzY6FpKFsTkOHv9Tqn8dEnF6oVnkZyCsVT9XG7f._0yovx6Q9LLrjLTM49aR
	cGSPyNttjelnKak9ku6TO9VRQ4aU5wEPPxiD8XBopW3KaI9RKeAX00DGIXQYwljwL2UGj0qxFaVW
	UeR1ML_w5AD0kcIXpwdNQ4OSOiBeCh6gK625gDCVWhBfofbYDdO7J9oCzs119UyPyc7Q8tlTY5po
	7pOAYTY6FUcoSPPVSkqf.mdX8DvsnKxNpxTad7rC31faQKGEAUBT4_1_qgdeUgJnjg_.ELSQKLPk
	N6OI68obUUyL5bhyepaiUsWcTTeeEiIbcovTIax81cnRARoL1BgffAFvH158m1v.kZgABqBDvqAV
	4mGN1LEMYz468IHacWwTp21Ipp66UWGXfAjlEXKZP.9f9H94b9plTBhfZyY3WnhVHVOeS4O1xzM1
	kvOG19849Xc29_KI2tMOpuWqsPt9TLYc4JW7vEhweg1fR0BstxDnLt3EfUNdpGh7hG.NKGVjoWXC
	SjRxhtyT_zgu5UkBLhVDVnhVzTi3nagndR24DHM.Cn5B8OMma_30VDXlO0lx4JCqPobL6dqu9HBE
	vgYu9jQbTllaTTt92KENMTvQaxtRBexz2n8U5b.Q.Zod.wYwLwfTfb8Hwi6BcKI4oJuDOelpFKkJ
	R4CfuAojTNynKvtpFYYxJgPFtuMyqazk_F6mqc7z3iDM59_OpCUXEFkN.7vEffGo.DArPxdFMGTE
	OeYjnpcA_o_6AmBq.FYI..l7ZMi.qSyflSCkVkaSoQTVHxoJm5CQ4at5Ul67uuaIC4kSL4PUdqJ6
	lt0KgJZV7BcXEslNGD1UzSboj0sd7KXPOm66Ha.iomgzBeZP78.bj.64eoWdNNkwVC9CljdrcSoh
	VrVxARcb0avlIVgh87dSkC4hBjNkF3pYEWvKbJ9KN4rdr1pFa9xW4SAzolWDheqawQgXdSqHgXxa
	Wr_b97_egVB2iohe.gLedjk2Yh3bKrkbZEYprUrL4n8zDGVCx1685HzY_p1FvWgB0RObA9eYKAxU
	x1hh54VGofGpfW8ZIRyGZll.E.vbthNQOGpyqy_DkBKQEedfWz_8rnYAR71yDr1zNEYD563Jw4Xb
	BLuCsmRg.LpL.s5xGM09PFa5PjCAMR611zZcsdzOiB96j5xbdYMExlF9I5slZCttJSimK4PGLXfk
	w3F0KAw.rgpVXY_owV8FOuv1ANIBO9dTIZGkZf8aBtdh1rUb0EMnn7OvcY1LkXP3b9YF6xZvAYX4
	qzuhWurX4dLvBNDEp8GlFUfk5cvSJLNbV3GAIdJPZJz2k0D_VBZ_fOgYphzb_gjYaO5vHsSxjOUj
	rW4HWXo0RWTS8xdR0ry6p9Zp6CFcQEti3zIur25hMG9cNyP5h6pfmwmZ7XqGb1b8WpFCYNgrv0ZS
	KSGK3Tt_lx0IeLa8BImMBt1KFrnZ7uI0oP967j4q_0yvBXcouO_eN5LYDMH2nHz9o02ATKMUXwzs
	6dYLOi6ZkDTZolAkdD_.iGrgQMqSRfriQ5HdjtX2jDJLH9G2pSn2k4GFaizOfpMD.3muzwAGDXkf
	A.CQbspb.UfPg22Hulw8dZpM9H_2EGTFSCog51DayhplMNrtgzkxd47SoS5WvsgnU.SSN1.RzHKj
	02HC.NvpRdkzuaH3G0Mye3VNvmKBx2CB2g3pyuUvSv1k.zAI3OyDDkM3hR9f4_ZsXb1d6h2LN5LW
	ftXmgd2.yxhdcQvzXyWpBshAHa1zid38lJ.cuC3A1Bua3xOHLyqeau9IXAo0CE4zZC1idZN.qlr4
	UCF2pEytUyL7.N257J7FZDfw5xAVtw99iCMlFX30Qqnnvg9HUFWBqbozZJ6XJvvdCBwPW8UwwCwO
	HlEEBOFRFcAAxrm.EiX90bKCA93kOFz1NtEzCpMwUNkkzR5ngCAuQNWp1NZm.SCKV9EpJm39KhJD
	KA8fxp1lldrzDefwLhLclS7Gt7EH7K6kY0Xx.ZlSFxi9EQ.VAX4_4TfmVvYptviv6vEwndnwh8mV
	vfcSTs.AY7ZxqU9oRJpl8NZOwq6sZ2TxHDx5CrvyfnS7KB4hG9iZwjUQSI2I67mQ5YMZ1WJA51W2
	oGZ9h2w7ARaADirOnIV55Swwp4Jv10xgGtA2F_9H3QYY.t3Clb88PPb5kl9Ha8m6oi2PxFEDUXLI
	bdM5iwf7AcPHMyvbEIP6rimuHdLW9KemZwrkieyM2RoUVsbNHbz9uJ8ZFEMXgQFEow6TEo8qjGmZ
	KtnqJx45fZpt41B3NSJwrKCR_83Q_M3TMW.ZiydkwjbSYSEOHryTolYu2_Z.0xRwjVXIGkshz8T8
	Qv35piuOIgD6u4Z2T7EAcy9uxLutem3rinlELwVbDOP4l6GxwTFHgSEUrg4b76S1G6qdzd0yVZnO
	0mgSKVhaDRDxLd15a.U8Quo93v7hr5KwfvjmUY2JP9xC9ap784b7OtTSeTrUqPU8CNKvbCZlH.l2
	8jw--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.ne1.yahoo.com with HTTP;
	Fri, 20 Nov 2020 20:25:13 +0000
Received: by smtp419.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 75f68069faadaccdca8e0dfd07d5174a; 
	Fri, 20 Nov 2020 20:25:11 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v23 09/23] LSM: Use lsmblob in security_inode_getsecid
Date: Fri, 20 Nov 2020 12:14:53 -0800
Message-Id: <20201120201507.11993-10-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, linux-kernel@vger.kernel.org,
	linux-audit@redhat.com, linux-integrity@vger.kernel.org, sds@tycho.nsa.gov
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

Change the security_inode_getsecid() interface to fill in a
lsmblob structure instead of a u32 secid. This allows for its
callers to gather data from all registered LSMs. Data is provided
for IMA and audit.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc: linux-integrity@vger.kernel.org
Cc: linux-audit@redhat.com
---
 include/linux/security.h            |  7 ++++---
 kernel/auditsc.c                    |  6 +++++-
 security/integrity/ima/ima_policy.c |  4 +---
 security/security.c                 | 11 +++++++++--
 4 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 6b9e3571960d..a7968dde27c6 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -436,7 +436,7 @@ int security_inode_killpriv(struct dentry *dentry);
 int security_inode_getsecurity(struct inode *inode, const char *name, void **buffer, bool alloc);
 int security_inode_setsecurity(struct inode *inode, const char *name, const void *value, size_t size, int flags);
 int security_inode_listsecurity(struct inode *inode, char *buffer, size_t buffer_size);
-void security_inode_getsecid(struct inode *inode, u32 *secid);
+void security_inode_getsecid(struct inode *inode, struct lsmblob *blob);
 int security_inode_copy_up(struct dentry *src, struct cred **new);
 int security_inode_copy_up_xattr(const char *name);
 int security_kernfs_init_security(struct kernfs_node *kn_dir,
@@ -963,9 +963,10 @@ static inline int security_inode_listsecurity(struct inode *inode, char *buffer,
 	return 0;
 }
 
-static inline void security_inode_getsecid(struct inode *inode, u32 *secid)
+static inline void security_inode_getsecid(struct inode *inode,
+					   struct lsmblob *blob)
 {
-	*secid = 0;
+	lsmblob_init(blob, 0);
 }
 
 static inline int security_inode_copy_up(struct dentry *src, struct cred **new)
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 8916a13406c3..b58b0048702a 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1980,13 +1980,17 @@ static void audit_copy_inode(struct audit_names *name,
 			     const struct dentry *dentry,
 			     struct inode *inode, unsigned int flags)
 {
+	struct lsmblob blob;
+
 	name->ino   = inode->i_ino;
 	name->dev   = inode->i_sb->s_dev;
 	name->mode  = inode->i_mode;
 	name->uid   = inode->i_uid;
 	name->gid   = inode->i_gid;
 	name->rdev  = inode->i_rdev;
-	security_inode_getsecid(inode, &name->osid);
+	security_inode_getsecid(inode, &blob);
+	/* scaffolding until osid is updated */
+	name->osid = blob.secid[0];
 	if (flags & AUDIT_INODE_NOEVAL) {
 		name->fcap_ver = -1;
 		return;
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index 3e47cc9b7400..bbf9fa79740a 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -561,7 +561,6 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		return false;
 	for (i = 0; i < MAX_LSM_RULES; i++) {
 		int rc = 0;
-		u32 osid;
 		struct lsmblob lsmdata;
 
 		if (!ima_lsm_isset(rule->lsm[i].rules)) {
@@ -574,8 +573,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		case LSM_OBJ_USER:
 		case LSM_OBJ_ROLE:
 		case LSM_OBJ_TYPE:
-			security_inode_getsecid(inode, &osid);
-			lsmblob_init(&lsmdata, osid);
+			security_inode_getsecid(inode, &lsmdata);
 			rc = ima_filter_rule_match(&lsmdata, rule->lsm[i].type,
 						   Audit_equal,
 						   rule->lsm[i].rules);
diff --git a/security/security.c b/security/security.c
index 421ff85015da..f3f6caae392f 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1443,9 +1443,16 @@ int security_inode_listsecurity(struct inode *inode, char *buffer, size_t buffer
 }
 EXPORT_SYMBOL(security_inode_listsecurity);
 
-void security_inode_getsecid(struct inode *inode, u32 *secid)
+void security_inode_getsecid(struct inode *inode, struct lsmblob *blob)
 {
-	call_void_hook(inode_getsecid, inode, secid);
+	struct security_hook_list *hp;
+
+	lsmblob_init(blob, 0);
+	hlist_for_each_entry(hp, &security_hook_heads.inode_getsecid, list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		hp->hook.inode_getsecid(inode, &blob->secid[hp->lsmid->slot]);
+	}
 }
 
 int security_inode_copy_up(struct dentry *src, struct cred **new)
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


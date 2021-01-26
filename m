Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C9BBB304402
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 17:51:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-WL2rwr5cPeeBFcMEzdYUQg-1; Tue, 26 Jan 2021 11:51:49 -0500
X-MC-Unique: WL2rwr5cPeeBFcMEzdYUQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D731107ACF7;
	Tue, 26 Jan 2021 16:51:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3001B60C62;
	Tue, 26 Jan 2021 16:51:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1A02180954D;
	Tue, 26 Jan 2021 16:51:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QGpMrl028332 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 11:51:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 772B2110F75E; Tue, 26 Jan 2021 16:51:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7371410054C5
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 16:51:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A9561875040
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 16:51:19 +0000 (UTC)
Received: from sonic314-26.consmr.mail.ne1.yahoo.com
	(sonic314-26.consmr.mail.ne1.yahoo.com [66.163.189.152]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-12-DCWugcgSN0qNtk0MRMnZuw-1;
	Tue, 26 Jan 2021 11:51:15 -0500
X-MC-Unique: DCWugcgSN0qNtk0MRMnZuw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1611679875; bh=jv3e60nM/eaSuxZ5zQgnkXxJu9xB25/4MOjgGLuJwxg=;
	h=From:To:Subject:Date:From:Subject:Reply-To;
	b=tNcHL7UFPipSrvi5ZhEvDaq7Ubtw5oGRXl30jpnDdsQJYCjrtuBuuiutrcFToKXqzkXaDe6+2mtwH80EPH9xa8zmMEueC8FbaI2+IiWxpoRix5cB9haX7AMBCtc13ahd5vL1b3kE+FEtrsVlkGGr/6gi4EeVT3TrBfzTtpCy1jHCzEyPnXZH+ALwsWsIE5dr0VI8w8L15VenhC7zIeCjrtGfTm43PSlYlDHjyJpHB0ejl4vEgiJffFksY1YPISz6ysAnBrLqv8AVfFbjSB51Eh0vhQ96xk0F19zTab8ZQkYQt3285RvplHUqcKhQB1TMeDFjst1vR63AJlFGTFzKQA==
X-YMail-OSG: WhoWSeMVM1nAZdlIGlcybNdqVFEUJtcDXoq9vQxygvju97vuRBhgg2vxgIq0KlZ
	Jg5WJEN2BPPKfasH9qxP7iioP6xiQfer7_r0cUDsEM7ZJtNy49r0F3Ld1u_L7j1RXUKrktZ2NRzq
	ggdUjjYLEOgprPxF1Evwij5yi3jxAe2y55gGARmJTZPDCL5.eMZ_Oo6_Cu_7Psr0Ofc60HFY1Ug.
	0IB8aNryvqWhoak6Xl5QZ2PXupE9Nga2YbL1lpwZPEKsimZniTyd4HeraRz5PF4fDL3UI1MBwtmr
	82nWLobdRwDkG1yEgVzMt_pkGFH6ghmYypM89Z4E_fT.lp8Gs4jrRCh1kGsAa1oY5ip1Uu.KBfvb
	OUshJ5KQokurFNYAwXvG2xPR26Y2vwUDXN_PLFU2VmkCvJUQRG5v7mG85B4DJMBsYVL6q7Q53LmB
	pFMVrWAY95KV7IL4LyX_itcSVvj6ZvFV0R3Ff1BCpFnbppNI4G2fcmleWk7QcoGOSuAXNs.neCf0
	5a9e9nEaBfupuEOAcraN6M.kCO27Mf4NuH99GTk94MWbMmo2RJyLoIz8PszJbdNVZG2LGlC8KD4t
	UFQ7FLDQu8WbbN49rh.OzdNjvCcOqQGnN.hRhEqTvOyMpt3mTPMVzhP2syeRb6I5j6nT9uxxUCL1
	AzgaBWfXW7FZd3Fy1MgjzdeEgfGWNqKQrWIpdqVeC96abVXtX.3NvJS7IoXv2FeVac16PBCvBOs.
	jKeeUHxKHHD1mFHAS_vdnbRwI2tkgeJEL3oMk0Tkz6uUWBdMcKtCzsMmsr5pW0TVOMXvHvMS4mQN
	S4w.pzlbBkLgR6OQvvjlcq4d9HjyAKZTA0mWGv02qNDyDnjXMC5q44mMle.ZXuBurNQFvYt.vP4U
	1BCnwcQXQxVQ1NpSQw59OpUthYu3xUh9W6Rz_bM94s8LJGXW1zSqtI4evgZaH_shpgNskx22B9Bz
	YQpidUJ6mFEraRgNgHF9_bitv53Z57dmND2z.hEvXP7ZfyNy_v7wskBEfDQHsAXQT10RDL.6yw0I
	Hs.BffJPtGNZHLhVnoiLNVd2xfNL1zu3QX1E_BlScBEwLuCZLa65oCv50Sih9Fatc4JnTD8vJjhN
	XMYkAvUlWy64uis0qfu3JQaQEV_eNEK_4zRxml37NUJBup_aXo6zZTR65kVcgjVZPH7lzxX_QVy1
	oS3ps5_j2rFOd3P0wl1WxZGuWligMbnEf.0Xy4faHgmRr_IgryvoiyhIPFVFfetvdFs2ZsVdCiNI
	ibKSruLchJbtGq0dfmL.IAXkwRk34Ss6cLeqSDk70LuQ3abnwTQWr11VX7FdwkOv7.NdoGgBi0LK
	PDxE6jltdg2zbSroINPRqWaR.sShH6mXUT0fZusRsuCK9AxLB_553ScKHvr2HVzcX_sgEYM__CTr
	cgxF3C1VsRsV__jLXIjXTSOOofez1HFWCxBB7LWCFc5HIj655tnluxccSLwL051yQcWIZXvftlvV
	t00ytFSQY.FPplGaSTMZMyrVfNmRTOA9IZPQKuRS5I1TNhUKNAUXD3DZEPPDbU4vm6Dv6PwTtjmm
	TB9g0t3RI6Ir3jq0qlC1caHdbaUlvDPt4oQzxubk0ZeLSDXgPeezg9RH40JeQ23.i5vqnhew3taN
	.w5v3JbY2Y1nOSzbLe3Iq6J66Gd0_F1FK8ZOByoQXwmj81W1hDZSDXhn66w5D.DOagVPMA9wWBeh
	cVZLJNHdbvdLYifPP1GiQM.KXUWf99joYAcHTDhocrLedIQhs0yIPQ41bXg_t.9tyEM5EjMsl7z2
	b9DB3dhLPq4lmcMffUkkzOEiwZtZP5UVtl2x0v.2oQCPWFmrhjNwOiDcFovP2ylHMSWwIdohM5NH
	jHtTEYTGQ011OfgnKh72kzZCqw8Bnkn8jbt4DlDGeL77UZlWh9FDEObeQIl8OFsh3NTsQsaXix7G
	3Y4qhaP9ix5eneascKkBrq7oXEmd.76RMZT5ZqhJfN7wGO_li3SmIP5LX7Uytr0xuzE9zankrAxV
	YZCZmWRAQiy4WAg.ILssBlha4PXLvtP3W0AiYiNTMxjjN6RKqpmOdMOrXaX0pPvR.Atsf8OA4SWi
	AqTeoclva8aXckk_0ch_R9Pa2aqyVIFkGvYMM_cqLHTNTQbH2WbQ1J5qRivY1umAvuV3jZwuEmoX
	KmIaiFUimwx8XG0pOxQZsHeQVjVw1.qJ.OHTeIeE9zj_io0v3GUcWNmHPJ38wGVRaQdVSPDtE4wr
	WUKnyzjXzxLYHy1jExUL4Y4nbdUHDiS1Ay892ESFaXQehNOvm5l0u0UTQLQTW6jh6K.EkLhRfFMR
	9prWT.ztjjmK9ngkIB_rhtPnaR3UoJ_x.q0xLzodkw81oALhP_R7I_D7GWbD2.4A3T4TXGR_IzpV
	1Mvts29Mh.W_b7iaMUUOCxKs2N_Z174jJrn3ag4UjqBCjmU462opy9rEjqCxIHHkhHxwoCX_fZo.
	OXiyDCt4MBi.ZP2CJbtoZtsQQiRzQwyEti8WWIjk9VjQ0YobJACpaOOU1sdu6gTZ7ePyu0O8kNow
	V3Lig6G8U._dmftudzPyrpzVL_y8m7yutL8_cdGZ8D_zXpzbZm53LwBFm2Aomd5Weymgoa3ZLd3c
	mcUXjn5Cr.8LQrlYyqkfhkUP_6yTXLWADJ0v1NyHrkklSpvZHKGnh.2Ut1PUTccByBaNmxYyH5YM
	4kOBy4dza2rlZJMGs8GosTEX1vJ0jRRzeuWPAamGxU9QMq95CxWYkSS3mGH9C5PrcnuZnNdehQ8S
	BFPEsWs3JdQOjFNANdRoBuLRKu57seuWFpFgzPYC0bq5XjzOLWAqYA4iJsUdckX8kSCzoDZbvGqu
	ir8NIFkDetOHEW02R3WG_1M.nAtJx6JLkfl8E307J0TGQx4H2MpnyBN_3vmmN1qUDw9RgwMKyYzU
	4ZTzTYp7bf3vIC080.NpxW4qR2sPw32pyRhhioBvdGyUneo5n83HgKhGjMw8H6KCQp4GBGyeH6nr
	Bi10_577Jec6L.8tnatSACF_v5Y8y6LmIggkIkKA6OJnmIzH_QTMUDuyzGeT5ZkbZPlmiSMBU7Ot
	xxtwmlQkLmzoheSIfnPlqOFYhAUM-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 26 Jan 2021 16:51:15 +0000
Received: by smtp418.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 5b003f5feede445ab75d61c891f68aa8; 
	Tue, 26 Jan 2021 16:51:12 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v24 09/25] LSM: Use lsmblob in security_ipc_getsecid
Date: Tue, 26 Jan 2021 08:40:52 -0800
Message-Id: <20210126164108.1958-10-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, linux-kernel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There may be more than one LSM that provides IPC data
for auditing. Change security_ipc_getsecid() to fill in
a lsmblob structure instead of the u32 secid. The
audit data structure containing the secid will be updated
later, so there is a bit of scaffolding here.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc: linux-audit@redhat.com
---
 include/linux/security.h |  7 ++++---
 kernel/auditsc.c         |  7 ++++++-
 security/security.c      | 12 +++++++++---
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index f786d8833e7d..20a47bd3930b 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -504,7 +504,7 @@ int security_task_prctl(int option, unsigned long arg2, unsigned long arg3,
 			unsigned long arg4, unsigned long arg5);
 void security_task_to_inode(struct task_struct *p, struct inode *inode);
 int security_ipc_permission(struct kern_ipc_perm *ipcp, short flag);
-void security_ipc_getsecid(struct kern_ipc_perm *ipcp, u32 *secid);
+void security_ipc_getsecid(struct kern_ipc_perm *ipcp, struct lsmblob *blob);
 int security_msg_msg_alloc(struct msg_msg *msg);
 void security_msg_msg_free(struct msg_msg *msg);
 int security_msg_queue_alloc(struct kern_ipc_perm *msq);
@@ -1233,9 +1233,10 @@ static inline int security_ipc_permission(struct kern_ipc_perm *ipcp,
 	return 0;
 }
 
-static inline void security_ipc_getsecid(struct kern_ipc_perm *ipcp, u32 *secid)
+static inline void security_ipc_getsecid(struct kern_ipc_perm *ipcp,
+					 struct lsmblob *blob)
 {
-	*secid = 0;
+	lsmblob_init(blob, 0);
 }
 
 static inline int security_msg_msg_alloc(struct msg_msg *msg)
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 220b3a7ed326..b3ad40787740 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2327,11 +2327,16 @@ void __audit_mq_getsetattr(mqd_t mqdes, struct mq_attr *mqstat)
 void __audit_ipc_obj(struct kern_ipc_perm *ipcp)
 {
 	struct audit_context *context = audit_context();
+	struct lsmblob blob;
 	context->ipc.uid = ipcp->uid;
 	context->ipc.gid = ipcp->gid;
 	context->ipc.mode = ipcp->mode;
 	context->ipc.has_perm = 0;
-	security_ipc_getsecid(ipcp, &context->ipc.osid);
+	security_ipc_getsecid(ipcp, &blob);
+	/* context->ipc.osid will be changed to a lsmblob later in
+	 * the patch series. This will allow auditing of all the object
+	 * labels associated with the ipc object. */
+	context->ipc.osid = lsmblob_value(&blob);
 	context->type = AUDIT_IPC;
 }
 
diff --git a/security/security.c b/security/security.c
index 271584938404..197f69780783 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1928,10 +1928,16 @@ int security_ipc_permission(struct kern_ipc_perm *ipcp, short flag)
 	return call_int_hook(ipc_permission, 0, ipcp, flag);
 }
 
-void security_ipc_getsecid(struct kern_ipc_perm *ipcp, u32 *secid)
+void security_ipc_getsecid(struct kern_ipc_perm *ipcp, struct lsmblob *blob)
 {
-	*secid = 0;
-	call_void_hook(ipc_getsecid, ipcp, secid);
+	struct security_hook_list *hp;
+
+	lsmblob_init(blob, 0);
+	hlist_for_each_entry(hp, &security_hook_heads.ipc_getsecid, list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		hp->hook.ipc_getsecid(ipcp, &blob->secid[hp->lsmid->slot]);
+	}
 }
 
 int security_msg_msg_alloc(struct msg_msg *msg)
-- 
2.25.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


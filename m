Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 892C03043F5
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 17:45:24 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-0gJiVo6LNKS5hUl6UBgWSw-1; Tue, 26 Jan 2021 11:45:20 -0500
X-MC-Unique: 0gJiVo6LNKS5hUl6UBgWSw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA43E10054FF;
	Tue, 26 Jan 2021 16:45:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A4D06F816;
	Tue, 26 Jan 2021 16:45:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 403C95002D;
	Tue, 26 Jan 2021 16:45:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QGilfr025924 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 11:44:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5ABEA2026D48; Tue, 26 Jan 2021 16:44:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55A942026D47
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 16:44:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAD39805B03
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 16:44:43 +0000 (UTC)
Received: from sonic307-15.consmr.mail.ne1.yahoo.com
	(sonic307-15.consmr.mail.ne1.yahoo.com [66.163.190.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-342-aLL5m_TAM3muvHkFNb2NiA-1;
	Tue, 26 Jan 2021 11:44:41 -0500
X-MC-Unique: aLL5m_TAM3muvHkFNb2NiA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1611679480; bh=CUFzpGOela52Sct0XiztLDN8e8r9mDeDf1atR86eJMQ=;
	h=From:To:Subject:Date:From:Subject:Reply-To;
	b=ohcy56VYGa5DGvM2EMcvH6k6v0wgFt8dZg4qWw+IxWiQKUEaajHEe07Yy5vabjTJOX0qs0nP1Kl2QhU0Dt8HRfGEdZ15SVGIiiz1TqIErU3UwJ7/XZWCIn8ugjWiCpWXXcgxbPsIQ7Gj6UBu7kAmd9rx20KAuupvoVTDUrwmnM+LgHcQOxkX2FV/q0k8i0i9SypEDZGj0TyIXV09mwuGwdxguQKAoVJTXNpFfyOSGiCoIsFzODMNVST+xsckPJJuKp0Uuruqx+rsOAa1A0TJ2cBHd9vhfcGCBeFzV31/nBgJbeuNgps2sVnwTcaI8XpgGyG5Fdt7iui0TyzYYV+kbw==
X-YMail-OSG: NC79Fv0VM1lH9HNO2chcdPJNBBpM.6GyJ8GW_0Li_hNMjxLy19W6Y6UyOHU3_m3
	HYHiGBx38UTfa_Dqc1hS8H7X0UfopaUJsfTMTcLRyN5W_DZjU1O8TNdgBQzoVt3kedxJg4S1zXef
	YAUak0p0A5yyWuemHn6fS1Ek5bzOLlKW50pM2zXtAKIyxYqt28tYIztHxEA2X44OXF63T0uwPGy1
	DYqkjDrAEfAe2toUcx_fvxv8_qCB93nyU2LxZvcXfExlfHfxTAPdph61b.ZYhGw_AApy.gKj3bw6
	9PqNlGskzwuUuJwB9PMLZdAny0yJwKKWU4bHDN0n4iu9yu6t_N_v9qFqFSgrVKRYDs4DZ7gHoize
	UOGxIV0gnjBovHA5RlyZEBph.g7zbZcIyiKKQrxoWNI3uICSUz1fkpd9tG_.GuH7_m3x_P7zBw_G
	tCdyLSdlt90pG.liiXm3f8dzTK0oqofO3opG_CznEXud_ShwNbggH5OCMvrnrn0ekr3dn_IfOxkk
	8arBaN.wuR604LetDn9sA1l8SUVjzD3qFvChydwf4uyP9Fr4FzGJpnuC.TH.q1Uo6XFG.OAqfu4Z
	zOW9XTH7hijwkL29LE8LEH8Dbk2Z7jRC9dGrfeys8ROFuBKD0FVYj9DRwNpKTznH01INyzHudyGN
	K1m2ZIKRCdoJsLAHBlXxMud5VEZrNi6WjGD31pjD65wpNS_fBGYAnwK_ACkC89jmulQ_vdzGlEcK
	RYuCtlBowX9c.3oPVfgHnO_QMSZev16saqmtBdSPrZQF_dW1.PlsHSJvdngP5W.dzOLruhkP2DsQ
	DCj8Ob6CvClD_EJgP3ZYaH8nPqWeKj_7lvsWF0u_E5Ft2.yAGpZ6Nz4Dptgz5B8HM.vc7a1KQOhZ
	4z0DnhH_rhUghyhR8SMWeBU4Y8vbEDfQN6lsKohqdDHAxOWqOJkB1OIHCfmhGXxiUmdWC1c0d7x7
	Cg0VEaLvY997MUG4u8r2bP7voqQutrfUCmRzO8nm7l3L9gxN7JFWhwor9I53QWwzBvy_rV6qKwsd
	BXc02uzrfFwm4nVm.GJFfuEbMsfGIGVi2idD2_S4uUA3oAVaI3FHlStXnKmiuvCQpe_UF.UGzc7Q
	.88yQrmpXaJsd4ayY87EzdZa9q1Sj7xs8H8MUQ19A4Ab7E3kX4PCx8Tgd3BoHmSE7Mx33JbVXtrC
	Wd26b.e5OEtcU.kXzvPUPqHHW3637stwhuq.reoUZ6xnKnRW2kgygmxLN3MHC7ffKuyWaOk8M.tz
	X2duwed11aoVMU2BLndgm3rbkznhpkBoB7HOT0e84An0lhEOLxWg1t3emKnMOgGb0HHgn9XQxYbW
	uBxhGSfk7XSrnhCOsjhldLTZKAsji5JOIXkRgdIyPGDkPwV2bFd9yPsRMRMvJwLXa.gSZBnkKjQO
	ZHj37HtfU7I.DMUPHVKO.mDDTwbMIHi_jpey8JMYXQvX_NE_y.3DPxlWOFFj8gkjej4itur_N8TE
	SSEKYHUyeYcdxLXvwQKP8aPynCl_SaJl7h4gaufmUfEz.lhVdtf.aC70ZA_7pPtSMfx2Q0EPm9..
	d6WisVM9xQGcQ57HRwBIFzxrLAUG9nZ61WFDyEFQ8l3w7pfwoT6EwgbTD7vxcsSCgWANDliYAEnz
	e8peTIoo6g9XXOo78y6.9ebgR.g6J1B6MCD5pjjB.r65wO_m0cdwb.BZSQjl2eYcZNBkwHjsvEDm
	BsFBEVWEGAbX..8VjKSI74HqB9jeNvbcHY9Y46d5bWmxXQtBUt9jieaKkY0_wkQ.0e3GU7xaSdid
	4EA.fZpQhJNu.vRLpJtbATNrGDG7w7YskJoeyem1pr2t9FliNDA8953gvDKcGH12r.eJJ.ybK_4c
	AWjXEIlAzkFZWJf8BNcwoFnWKM_b44cH6KouOkrfDpxmifAS2JJwyKhaPEKRR1FCilVlTm.0jD8F
	XKbTVxE3HZyXpxU6YKOKTWHt79w4ynlZkP4I49vkwQyD.rvL.kVCjUyhurFR8girXVnYIfmS6Uj1
	rt9lJJXNd4uGf1q9LFK1VjK2F8flLhgkI.Im9CMP3e2ymUNxcKchBqaOTR37Qo7.YRhIe57tyb6l
	TgOGEL7Chw_1T2zsaQFA9c4oQkkG9vfW6pHcYTtoOBD.HtFgBJB_LaIEPqDayQ8cfxijZd6URzLz
	wbZBQ7N15j47GHqroyC0QUWkayfQdYgGab_QQSgzdAXG7mCTkrFR27vbPNmW2kGT9qVL9nrOdpBS
	fQExJCHay9OdJk8qHD8QCTaFhtrZMr1gHUQWeUS9tqADYO9h4InL6.o.zCMFfndQ3OCNixCRbVsc
	8moTfH65PhUDgmUqToyB1Xk.uQfYRwOb0It2uaFJezYmSUmC9sVcpUhn3iEfadyfNwrF_B22JGC1
	Ha5Qb7S1BB7J_3Ste5zmxd7GYdPDAUcMR9Yzh.jNph9TfdU0EMpK9zD9dcfraANqlpa5hjxFhsHK
	VcL3dJej2PAHMVg_wtps4ZGf1i7yAxoUPLCd_FSqchzqcSyrIZpks4WEj3AReNJhMARBDQHjHrg0
	dEIaRmanFFoeoNbwJ3PoLOMjX7.8t1qEReGHBhGqbf58MW8UBHiCiNyDm078_587xWaJiV27DyJ7
	9t4nZxJA9Y8v3bJ0o7qCt9zf4I5XNAZjA5lb0CyfbhuPTt1MUsInxkufbL6ftFRjL4b4sd0mSW7b
	MxNQCXo0hRh4vkO5fct_fDulMtXt7_LSZCr0_r4qaBkQhQosvky65DjTQJWtYslI3O6FGrEs0mJD
	J4j8r2EpK4UyWfq8BtvEiTMn3ctLoHNqn3TtiDsYPtHQPItcGqGgoEINUjkcr6bF4SDVBd_.ITSJ
	j6gWT8.0OU_NlOqN938J2NiRmpTraMkOtm7.YD77KCeO8RwUs8jvL.K3F6.OKD7iMAZIw2zOwdbH
	51X0VOu1xSV9LJm_lvhUDX7oy776hMARSdiRrT58wIzSMkheaBUSc2TnvskK7CwFkismwCb45rC1
	ZRIQy11vRjv2Zv7LmoSWuvyCJ2NM6P5vy5t_0189IntzXJr_1FzZepvJ3WKshCeSXMENtu4_10r1
	ehjNvSjWOkS5DbZzOGgWY4JFX_0yb6g--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic307.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 26 Jan 2021 16:44:40 +0000
Received: by smtp419.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 013cd3b533e951467ad2ef403e668437; 
	Tue, 26 Jan 2021 16:44:36 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v24 03/25] LSM: provide lsm name and id slot mappings
Date: Tue, 26 Jan 2021 08:40:46 -0800
Message-Id: <20210126164108.1958-4-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide interfaces to map LSM slot numbers and LSM names.
Update the LSM registration code to save this information.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h |  4 ++++
 security/security.c      | 45 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/include/linux/security.h b/include/linux/security.h
index 4a109092a8d7..a99a4307176f 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -192,6 +192,10 @@ static inline bool lsmblob_equal(struct lsmblob *bloba, struct lsmblob *blobb)
 	return !memcmp(bloba, blobb, sizeof(*bloba));
 }
 
+/* Map lsm names to blob slot numbers */
+extern int lsm_name_to_slot(char *name);
+extern const char *lsm_slot_to_name(int slot);
+
 /* These functions are in security/commoncap.c */
 extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
 		       int cap, unsigned int opts);
diff --git a/security/security.c b/security/security.c
index 39dce9eb3bcd..05ce02ae7c46 100644
--- a/security/security.c
+++ b/security/security.c
@@ -474,6 +474,50 @@ static int lsm_append(const char *new, char **result)
  * Current index to use while initializing the lsmblob secid list.
  */
 static int lsm_slot __lsm_ro_after_init;
+static struct lsm_id *lsm_slotlist[LSMBLOB_ENTRIES] __lsm_ro_after_init;
+
+/**
+ * lsm_name_to_slot - Report the slot number for a security module
+ * @name: name of the security module
+ *
+ * Look up the slot number for the named security module.
+ * Returns the slot number or LSMBLOB_INVALID if @name is not
+ * a registered security module name.
+ */
+int lsm_name_to_slot(char *name)
+{
+	int i;
+
+	for (i = 0; i < lsm_slot; i++)
+		if (strcmp(lsm_slotlist[i]->lsm, name) == 0)
+			return i;
+
+	return LSMBLOB_INVALID;
+}
+
+/**
+ * lsm_slot_to_name - Get the name of the security module in a slot
+ * @slot: index into the interface LSM slot list.
+ *
+ * Provide the name of the security module associated with
+ * a interface LSM slot.
+ *
+ * If @slot is LSMBLOB_INVALID return the value
+ * for slot 0 if it has been set, otherwise NULL.
+ *
+ * Returns a pointer to the name string or NULL.
+ */
+const char *lsm_slot_to_name(int slot)
+{
+	if (slot == LSMBLOB_INVALID)
+		slot = 0;
+	else if (slot >= LSMBLOB_ENTRIES || slot < 0)
+		return NULL;
+
+	if (lsm_slotlist[slot] == NULL)
+		return NULL;
+	return lsm_slotlist[slot]->lsm;
+}
 
 /**
  * security_add_hooks - Add a modules hooks to the hook lists.
@@ -493,6 +537,7 @@ void __init security_add_hooks(struct security_hook_list *hooks, int count,
 	if (lsmid->slot == LSMBLOB_NEEDED) {
 		if (lsm_slot >= LSMBLOB_ENTRIES)
 			panic("%s Too many LSMs registered.\n", __func__);
+		lsm_slotlist[lsm_slot] = lsmid;
 		lsmid->slot = lsm_slot++;
 		init_debug("%s assigned lsmblob slot %d\n", lsmid->lsm,
 			   lsmid->slot);
-- 
2.25.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1B303E3E5F
	for <lists+linux-audit@lfdr.de>; Thu, 24 Oct 2019 23:41:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571953294;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jnyHIhU9WvyYWEGqtnRcijTB+8CTP8f/RAAtaiFrhy4=;
	b=KLeLmso35ptF6B9mtAK2IfE9IlNYwLyzXiamjxW1mUbfSSa7o+J7e1qhzUsAcRE8FO+12x
	XqPs49ObUK4W67vFPQvi1MU1cM6W82dtckeD1ffWH9Ke+kaYDlu2W8TV46ISsrhNKiQMI2
	PiveeTgNgd5jvYxaG7iW3Jw3JIGphMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-OnQiey5uNmukSp4wAv_nlQ-1; Thu, 24 Oct 2019 17:41:30 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57923107AD33;
	Thu, 24 Oct 2019 21:41:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAB39608C1;
	Thu, 24 Oct 2019 21:41:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65ED318005A0;
	Thu, 24 Oct 2019 21:41:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9OLfKpf021021 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 17:41:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8414E5C1D4; Thu, 24 Oct 2019 21:41:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E68B5C1B5
	for <linux-audit@redhat.com>; Thu, 24 Oct 2019 21:41:18 +0000 (UTC)
Received: from sonic317-39.consmr.mail.ne1.yahoo.com
	(sonic317-39.consmr.mail.ne1.yahoo.com [66.163.184.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF7EC10C0922
	for <linux-audit@redhat.com>; Thu, 24 Oct 2019 21:41:16 +0000 (UTC)
X-YMail-OSG: T2jDlwkVM1k.h_mOSlNJK62PIWQlzzMvEBDbR_BQPZ7eFpOFm9B_mbBGml1IRhp
	hFj4oahWOHz_tPjZVr7NUhFDfCmJPrNsr3cjn7cQDRGXkIaivezjqU7lju4l3.vIHocqcsCmwE1i
	jTSE2gXmNqhCK9mXoFM93.LfjAxFbK.Obo9MuspOUS_vV73gKk_a5D0_rI6IxmpE3ggGpCAxjpAd
	4Y6FSrn85SuSRb.kVI8xZsWal6BEH8VSzu.G0H90ay.zav1KG_QiHjsJd.b9byhRiEXPiSvl6I4.
	9wUyTckWQHZEE.xbUq8yjV_ZjirxkdhtbAxEhWZd9l_mEO_h.VcGx4.UPt_rb6oVHqk8WGWDTnX9
	k8olK8w.04hV8HGt3dx5GquhPLpIazlIDKgWCjvkBFTxpqwyB5.Sn_eAzmevyLxsCgWeCEzgC6aP
	1lVnpmPBnBFhMJPKEnph8SjLmi4q3A4xsWUyBCYGp3152qrPqQ_U2RmrEKX9S2sd4xxkSmGI1SrH
	D.KbQoJtwHwZoHNk3.rsj8utaYyDLf1TslHSinuWrvbltwPaDsOBx0zyaHQeYJy52HQxNG_t6K01
	pAG3Cm2V5qm9uD5KmrVy8z6fcLDdIB25YDqJFJeUfvNkDhE93kwpu9YhdPby0IDag6Zsv96OdkAu
	eAEyQk9KJER3VBsJgT9zaztpmD6_.0Z8dqHHRibZy2xu2ClpEUehvkFm8lLZ1bvCD4H_5BrB5A_c
	PgBfSxjnx2J0tPYiHngiDyz6klTMgmy3zn84yCb0zNz62A5A6ZwBP6ADOWYblWcS3XSkBbQinJaP
	.IadFhpgYxx.h4kBT5XYes3KKVwb.N1tFShLg0e89S7ELQFl2C2pvs7lOUQiF34scza7.UU9A18Z
	dP_iPM36F0QRBD4dANJdocv.1nmyuyot8lHTixm0MD0omq4ywnebJa6lubRIDA2xXeNBTA7Mtbxw
	xltUJzozS_jIO4ZODvmhLVkL.ET7pP05W2z07ZMPXedVAG92afPA90tMtr1WIt9WQAou6ZgB6Mna
	eProU1lVpouNK1PhMTmC0wwrCty3zzrmWqUSYVieshxzPXJETpBn_3K9x.zaKi6nfqk1mOcQLtKv
	02PgY4AnBn0REsP4_HrHFNignHDWNxkSb0J.h7wM6NrKOM_lZfjSDQxkajg1Kg_EtyRCWjf4KYDt
	BoHrTMnU.kDpyS08nUuw5w5ULeza4PbxKlmbG9dq2MNAyFgjY7VgM51Gv9DR3_0NqFVQLCQl2QcX
	RivHpidUmQnztVDmo05ukLtMhGYrcWUPZUBGzJ1X33EcZwrxKRECk4uvLE9FMB6j37u18Lc28kA3
	PkXc3zfCG2vzl3BVrCW.TmnkS3Pa30_hmoq6hejW6buA.S32VbLMSV3ippFNfKJP.T27.x9zYiaJ
	ixEb4neQFHdSNVez0Sh5sAffjIEgto0XgbxCG
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 24 Oct 2019 21:41:16 +0000
Received: by smtp401.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 5e7ebe53215bff98a9542b5270b49f73; 
	Thu, 24 Oct 2019 21:41:11 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: linux-audit@redhat.com
Subject: [PATCH v10 22/25] Audit: Include object data for all security modules
Date: Thu, 24 Oct 2019 14:41:08 -0700
Message-Id: <20191024214108.7203-2-casey@schaufler-ca.com>
In-Reply-To: <20191024214108.7203-1-casey@schaufler-ca.com>
References: <20191024214108.7203-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.66]); Thu, 24 Oct 2019 21:41:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Thu, 24 Oct 2019 21:41:17 +0000 (UTC) for IP:'66.163.184.50'
	DOMAIN:'sonic317-39.consmr.mail.ne1.yahoo.com'
	HELO:'sonic317-39.consmr.mail.ne1.yahoo.com'
	FROM:'casey@schaufler-ca.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 66.163.184.50 sonic317-39.consmr.mail.ne1.yahoo.com
	66.163.184.50 sonic317-39.consmr.mail.ne1.yahoo.com
	<casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
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
X-MC-Unique: OnQiey5uNmukSp4wAv_nlQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

When there is more than one context displaying security
module extend what goes into the audit record by supplimenting
the "obj=3D" with an "obj_<lsm>=3D" for each such security
module.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 kernel/audit.h   |   4 +-
 kernel/auditsc.c | 110 ++++++++++++++++++++++++-----------------------
 2 files changed, 58 insertions(+), 56 deletions(-)

diff --git a/kernel/audit.h b/kernel/audit.h
index 29e29c6f4afb..af9a7d1fc069 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -91,7 +91,7 @@ struct audit_names {
 =09kuid_t=09=09=09uid;
 =09kgid_t=09=09=09gid;
 =09dev_t=09=09=09rdev;
-=09u32=09=09=09osid;
+=09struct lsmblob=09=09oblob;
 =09struct audit_cap_data=09fcap;
 =09unsigned int=09=09fcap_ver;
 =09unsigned char=09=09type;=09=09/* record type */
@@ -165,7 +165,7 @@ struct audit_context {
 =09=09=09kuid_t=09=09=09uid;
 =09=09=09kgid_t=09=09=09gid;
 =09=09=09umode_t=09=09=09mode;
-=09=09=09u32=09=09=09osid;
+=09=09=09struct lsmblob=09=09oblob;
 =09=09=09int=09=09=09has_perm;
 =09=09=09uid_t=09=09=09perm_uid;
 =09=09=09gid_t=09=09=09perm_gid;
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 46d7a58babd2..04367c3593e4 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -646,17 +646,15 @@ static int audit_filter_rules(struct task_struct *tsk=
,
 =09=09=09if (f->lsm_rule) {
 =09=09=09=09/* Find files that match */
 =09=09=09=09if (name) {
-=09=09=09=09=09lsmblob_init(&blob, name->osid);
 =09=09=09=09=09result =3D security_audit_rule_match(
-=09=09=09=09=09=09=09=09&blob,
+=09=09=09=09=09=09=09=09&name->oblob,
 =09=09=09=09=09=09=09=09f->type,
 =09=09=09=09=09=09=09=09f->op,
 =09=09=09=09=09=09=09=09f->lsm_rule);
 =09=09=09=09} else if (ctx) {
 =09=09=09=09=09list_for_each_entry(n, &ctx->names_list, list) {
-=09=09=09=09=09=09lsmblob_init(&blob, n->osid);
 =09=09=09=09=09=09if (security_audit_rule_match(
-=09=09=09=09=09=09=09=09&blob,
+=09=09=09=09=09=09=09=09&n->oblob,
 =09=09=09=09=09=09=09=09f->type,
 =09=09=09=09=09=09=09=09f->op,
 =09=09=09=09=09=09=09=09f->lsm_rule)) {
@@ -668,8 +666,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 =09=09=09=09/* Find ipc objects that match */
 =09=09=09=09if (!ctx || ctx->type !=3D AUDIT_IPC)
 =09=09=09=09=09break;
-=09=09=09=09lsmblob_init(&blob, ctx->ipc.osid);
-=09=09=09=09if (security_audit_rule_match(&blob,
+=09=09=09=09if (security_audit_rule_match(&ctx->ipc.oblob,
 =09=09=09=09=09=09=09      f->type, f->op,
 =09=09=09=09=09=09=09      f->lsm_rule))
 =09=09=09=09=09++result;
@@ -937,13 +934,57 @@ static inline void audit_free_context(struct audit_co=
ntext *context)
 =09kfree(context);
 }
=20
+static int audit_log_object_context(struct audit_buffer *ab,
+=09=09=09=09    struct lsmblob *blob)
+{
+=09struct lsmcontext context;
+=09const char *lsm;
+=09int i;
+
+=09/*
+=09 * None of the installed modules have object labels.
+=09 */
+=09if (security_lsm_slot_name(0) =3D=3D NULL)
+=09=09return 0;
+
+=09if (blob->secid[0] !=3D 0) {
+=09=09if (security_secid_to_secctx(blob, &context, 0)) {
+=09=09=09audit_log_format(ab, " obj=3D?");
+=09=09=09return 1;
+=09=09}
+=09=09audit_log_format(ab, " obj=3D%s", context.context);
+=09=09security_release_secctx(&context);
+=09}
+
+=09/*
+=09 * Don't do anything more unless there is more than one LSM
+=09 * with a security context to report.
+=09 */
+=09if (security_lsm_slot_name(1) =3D=3D NULL)
+=09=09return 0;
+
+=09for (i =3D 0; i < LSMBLOB_ENTRIES; i++) {
+=09=09lsm =3D security_lsm_slot_name(i);
+=09=09if (lsm =3D=3D NULL)
+=09=09=09break;
+=09=09if (blob->secid[i] =3D=3D 0)
+=09=09=09continue;
+=09=09if (security_secid_to_secctx(blob, &context, i)) {
+=09=09=09audit_log_format(ab, " obj_%s=3D?", lsm);
+=09=09=09continue;
+=09=09}
+=09=09audit_log_format(ab, " obj_%s=3D%s", lsm, context.context);
+=09=09security_release_secctx(&context);
+=09}
+=09return 0;
+}
+
 static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 =09=09=09=09 kuid_t auid, kuid_t uid,
 =09=09=09=09 unsigned int sessionid,
 =09=09=09=09 struct lsmblob *blob, char *comm)
 {
 =09struct audit_buffer *ab;
-=09struct lsmcontext lsmctx;
 =09int rc =3D 0;
=20
 =09ab =3D audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
@@ -953,15 +994,7 @@ static int audit_log_pid_context(struct audit_context =
*context, pid_t pid,
 =09audit_log_format(ab, "opid=3D%d oauid=3D%d ouid=3D%d oses=3D%d", pid,
 =09=09=09 from_kuid(&init_user_ns, auid),
 =09=09=09 from_kuid(&init_user_ns, uid), sessionid);
-=09if (lsmblob_is_set(blob)) {
-=09=09if (security_secid_to_secctx(blob, &lsmctx, LSMBLOB_FIRST)) {
-=09=09=09audit_log_format(ab, " obj=3D(none)");
-=09=09=09rc =3D 1;
-=09=09} else {
-=09=09=09audit_log_format(ab, " obj=3D%s", lsmctx.context);
-=09=09=09security_release_secctx(&lsmctx);
-=09=09}
-=09}
+=09rc =3D audit_log_object_context(ab, blob);
 =09audit_log_format(ab, " ocomm=3D");
 =09audit_log_untrustedstring(ab, comm);
 =09audit_log_end(ab);
@@ -1187,26 +1220,14 @@ static void show_special(struct audit_context *cont=
ext, int *call_panic)
 =09=09=09=09context->socketcall.args[i]);
 =09=09break; }
 =09case AUDIT_IPC: {
-=09=09u32 osid =3D context->ipc.osid;
+=09=09struct lsmblob *oblob =3D & context->ipc.oblob;
=20
 =09=09audit_log_format(ab, "ouid=3D%u ogid=3D%u mode=3D%#ho",
 =09=09=09=09 from_kuid(&init_user_ns, context->ipc.uid),
 =09=09=09=09 from_kgid(&init_user_ns, context->ipc.gid),
 =09=09=09=09 context->ipc.mode);
-=09=09if (osid) {
-=09=09=09struct lsmcontext lsmcxt;
-=09=09=09struct lsmblob blob;
-
-=09=09=09lsmblob_init(&blob, osid);
-=09=09=09if (security_secid_to_secctx(&blob, &lsmcxt,
-=09=09=09=09=09=09     LSMBLOB_FIRST)) {
-=09=09=09=09audit_log_format(ab, " osid=3D%u", osid);
-=09=09=09=09*call_panic =3D 1;
-=09=09=09} else {
-=09=09=09=09audit_log_format(ab, " obj=3D%s", lsmcxt.context);
-=09=09=09=09security_release_secctx(&lsmcxt);
-=09=09=09}
-=09=09}
+=09=09if (audit_log_object_context(ab, oblob))
+=09=09=09*call_panic =3D 1;
 =09=09if (context->ipc.has_perm) {
 =09=09=09audit_log_end(ab);
 =09=09=09ab =3D audit_log_start(context, GFP_KERNEL,
@@ -1347,20 +1368,8 @@ static void audit_log_name(struct audit_context *con=
text, struct audit_names *n,
 =09=09=09=09 from_kgid(&init_user_ns, n->gid),
 =09=09=09=09 MAJOR(n->rdev),
 =09=09=09=09 MINOR(n->rdev));
-=09if (n->osid !=3D 0) {
-=09=09struct lsmblob blob;
-=09=09struct lsmcontext lsmctx;
-
-=09=09lsmblob_init(&blob, n->osid);
-=09=09if (security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_FIRST)) {
-=09=09=09audit_log_format(ab, " osid=3D%u", n->osid);
-=09=09=09if (call_panic)
-=09=09=09=09*call_panic =3D 2;
-=09=09} else {
-=09=09=09audit_log_format(ab, " obj=3D%s", lsmctx.context);
-=09=09=09security_release_secctx(&lsmctx);
-=09=09}
-=09}
+=09if (audit_log_object_context(ab, &n->oblob) && call_panic)
+=09=09*call_panic =3D 2;
=20
 =09/* log the audit_names record type */
 =09switch (n->type) {
@@ -1908,17 +1917,13 @@ static inline int audit_copy_fcaps(struct audit_nam=
es *name,
 void audit_copy_inode(struct audit_names *name, const struct dentry *dentr=
y,
 =09=09      struct inode *inode, unsigned int flags)
 {
-=09struct lsmblob blob;
-
 =09name->ino   =3D inode->i_ino;
 =09name->dev   =3D inode->i_sb->s_dev;
 =09name->mode  =3D inode->i_mode;
 =09name->uid   =3D inode->i_uid;
 =09name->gid   =3D inode->i_gid;
 =09name->rdev  =3D inode->i_rdev;
-=09security_inode_getsecid(inode, &blob);
-=09/* scaffolding until osid is updated */
-=09name->osid =3D blob.secid[0];
+=09security_inode_getsecid(inode, &name->oblob);
 =09if (flags & AUDIT_INODE_NOEVAL) {
 =09=09name->fcap_ver =3D -1;
 =09=09return;
@@ -2268,14 +2273,11 @@ void __audit_mq_getsetattr(mqd_t mqdes, struct mq_a=
ttr *mqstat)
 void __audit_ipc_obj(struct kern_ipc_perm *ipcp)
 {
 =09struct audit_context *context =3D audit_context();
-=09struct lsmblob blob;
 =09context->ipc.uid =3D ipcp->uid;
 =09context->ipc.gid =3D ipcp->gid;
 =09context->ipc.mode =3D ipcp->mode;
 =09context->ipc.has_perm =3D 0;
-=09security_ipc_getsecid(ipcp, &blob);
-=09/* scaffolding on the [0] - change "osid" to a lsmblob */
-=09context->ipc.osid =3D blob.secid[0];
+=09security_ipc_getsecid(ipcp, &context->ipc.oblob);
 =09context->type =3D AUDIT_IPC;
 }
=20
--=20
2.20.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


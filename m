Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCEF102B6D
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 19:04:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574186671;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J4RySCaJpvRm0XRLfzFfP6snw+R/XbhO7md37i+CB/s=;
	b=Pl0+Iv9+LDtKB/eGZXG33PJJLkPeBa9QJmz/FWim1oFHUlwL+H7Lp9OHLQMn6/kHBmY09y
	jV25/Dwm4MohxIyiG1GxlUIo7pAS8aFlvrxFMS1hdzK1K4mZstx37ie+bvFLiIW87d3tdV
	cOxwlGgm4Be3C1WOQpWSnROI7ho1Se8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-TS1NaShROLiWy1MZ6MudyQ-1; Tue, 19 Nov 2019 13:04:27 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEA31107ACC4;
	Tue, 19 Nov 2019 18:04:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9BDC1037AA4;
	Tue, 19 Nov 2019 18:04:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 787EF4BB5C;
	Tue, 19 Nov 2019 18:04:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJI4G4a001281 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 13:04:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8074E17590; Tue, 19 Nov 2019 18:04:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7ABE7178BB
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:04:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EED98871F5
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:04:14 +0000 (UTC)
X-YMail-OSG: WaVDEvQVM1mKc9raneha_JNL9MF1vH9oSgrGRSmOxf6IrMPBfbBmLbeJHb5T2k4
	vecQjnWp0KAB3VnityduY7Z.ltL4G0hMneET9.IYYMzW7E45c49Fpbn0rBbvo7f6N4ajFTVJt7Ww
	kvGlpCz2Je0LGBFDl8O1S1yT4sB.DPEAEKYpJ316ouMRfxuEGggtE6TMNvAXemRCAmbOrtrjv_Ku
	YElgCtKdxL9xActK.88IV8tMJ8XQj9rrJXfwz6kDH_UYi3xYKerU2a1Vx58F8KbOm3wcFweG1AqK
	Fe4wat6NXyQeuTrMFVXwjk0s6NHJyGeuTPCEXYKK7mk6j9p9lqv0vAtWy.hwkErVzHD.6M9wnndR
	sM7UszySHN66tbvis8zQ9YrgTmGtD0ym3YOPp1fFud8bV8dP8l5tha1zBbPuOWCBC5f4hE2N.v5O
	a5YfLHGZXQeIM8MXfuI77fVDNoxd.qYvSn_zTEfu5Mccn1koKk6EUVlBleXQycMCpxnKuhfxEI6k
	lepk5oLZPwYJxYh_QzaFHmgQ4Ob9eNfRqUWwn17oHlGYAR6JahmhkBYVuX2.MK5.nAD6EGWscGqP
	wPgRIGHBQu0C95cvsbgpDtyl5yzxJl9..0d7iN.krMxdFiYoR4zyMx0m5P8JyIbE.ocx7enF3cHh
	Y5B2oDV.fKijuMT8PvrIJLOMZiiGF7aPAOrUlDfZxqOycblC9IsjXnURe92H2Tgou2BtIZoKszeY
	ppjfAvEXWe7xretom9145iW75d5flC9O8j_ZJ.zv9uYKnvGSYMiJQNQjT1MhqgIVx77ZwEy1WyrT
	bwvpRKCgLPJMjgL4FWltw98qokUhpAmGYeUc4WXT_7B7MzMxD2ksJEvfhZRoEdqh6D75z0y0XrJ0
	8cGWIHQdXoN7OYn5_29CCy6KyiJIRRSUYvo.tuDcKd.jwcpcHhkSBWV72Hhnn_zGU3PlU88rFnfZ
	nwIMMNxj_oxVBoAaRvngLLT76b9qP0WaxAGLsUfUZyPOc1cZLSvom4otoVCYYPPQB.9yEWtN2ld6
	h9GtQnArWD7UnONfcUlfdp.tFw8LoqAOIbXNY3dKourcCkYUblHm8Ysemwx2TNz2QoLO6xdqKSnw
	YpFDsKhxtJD.0XmFHp_yxkJ4FgeZwDEE4_fOA7aIUyzH2.v3LoJR7_Kc9Epzdf8TzxsSfGOj5Cz8
	0jKLDZYMxMv5LljuF5uk3mk.F_jgeLK.dOMDUMobGPqTk3PEItiIOEy003pl9043H3kLzou1URvC
	tHr6RTXpwHJLP34CDJ1i5a2r_r.mTHrPu16zO3372OrDqRjbazywyp3Z43GDVyHOJoIET4xvS9TS
	Z7wdhovrCMefHZme5ikOhkmgiSaW2wJgID2WFqjD0jeaDhL3SHO_drFRQjhNuaDiA2hRux8QpxLR
	pfPez6ROWf0NCFMdbUgX1s9BOt3Yk9o0jKEFt_E2BWQFWfVm7
Received: from sonic313-15.consmr.mail.ne1.yahoo.com
	(sonic313-15.consmr.mail.ne1.yahoo.com [66.163.185.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-216-LQ0hLhiWMbCdJBMcTmWjmw-1;
	Tue, 19 Nov 2019 13:04:11 -0500
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 19 Nov 2019 18:04:10 +0000
Received: by smtp405.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID cbade386d4ed07348d4fb8056a0439b3; 
	Tue, 19 Nov 2019 18:04:05 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: linux-audit@redhat.com
Subject: [PATCH v11 22/25] Audit: Include object data for all security modules
Date: Tue, 19 Nov 2019 10:03:14 -0800
Message-Id: <20191119180315.12254-11-casey@schaufler-ca.com>
In-Reply-To: <20191119180315.12254-1-casey@schaufler-ca.com>
References: <20191119180315.12254-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-MC-Unique: LQ0hLhiWMbCdJBMcTmWjmw-1
X-MC-Unique: TS1NaShROLiWy1MZ6MudyQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAJI4G4a001281
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index af9bc09e656c..c9f1e1641542 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -78,7 +78,7 @@ struct audit_names {
 =09kuid_t=09=09=09uid;
 =09kgid_t=09=09=09gid;
 =09dev_t=09=09=09rdev;
-=09u32=09=09=09osid;
+=09struct lsmblob=09=09oblob;
 =09struct audit_cap_data=09fcap;
 =09unsigned int=09=09fcap_ver;
 =09unsigned char=09=09type;=09=09/* record type */
@@ -152,7 +152,7 @@ struct audit_context {
 =09=09=09kuid_t=09=09=09uid;
 =09=09=09kgid_t=09=09=09gid;
 =09=09=09umode_t=09=09=09mode;
-=09=09=09u32=09=09=09osid;
+=09=09=09struct lsmblob=09=09oblob;
 =09=09=09int=09=09=09has_perm;
 =09=09=09uid_t=09=09=09perm_uid;
 =09=09=09gid_t=09=09=09perm_gid;
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index e0dd643e9b13..0c071947c2b3 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -659,17 +659,15 @@ static int audit_filter_rules(struct task_struct *tsk=
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
@@ -681,8 +679,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 =09=09=09=09/* Find ipc objects that match */
 =09=09=09=09if (!ctx || ctx->type !=3D AUDIT_IPC)
 =09=09=09=09=09break;
-=09=09=09=09lsmblob_init(&blob, ctx->ipc.osid);
-=09=09=09=09if (security_audit_rule_match(&blob,
+=09=09=09=09if (security_audit_rule_match(&ctx->ipc.oblob,
 =09=09=09=09=09=09=09      f->type, f->op,
 =09=09=09=09=09=09=09      f->lsm_rule))
 =09=09=09=09=09++result;
@@ -956,13 +953,57 @@ static inline void audit_free_context(struct audit_co=
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
@@ -972,15 +1013,7 @@ static int audit_log_pid_context(struct audit_context=
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
@@ -1207,26 +1240,14 @@ static void show_special(struct audit_context *cont=
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
@@ -1366,20 +1387,8 @@ static void audit_log_name(struct audit_context *con=
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
@@ -1929,17 +1938,13 @@ static void audit_copy_inode(struct audit_names *na=
me,
 =09=09=09     const struct dentry *dentry,
 =09=09=09     struct inode *inode, unsigned int flags)
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
@@ -2285,14 +2290,11 @@ void __audit_mq_getsetattr(mqd_t mqdes, struct mq_a=
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


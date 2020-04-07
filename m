Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EA06D1A03A7
	for <lists+linux-audit@lfdr.de>; Tue,  7 Apr 2020 02:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586219006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Pt3tPAVvTLBU5xFFEWpkjYbr2cmbMceqN2n/P+CfYzg=;
	b=Yk8Wd+qhN+AE5UJLim+EgsrRl/W1Eeg2+KWYvhpj/eHgB+urxF8oS6dNsVR24Wh90lbyF5
	m//CXAKbban9zjrGgxha/A15ijTaEmlXvGMeieEMq4hKljwNDoi+2sfzi6ce8nFHPQ1oQ4
	ZLc3Gn54FFg/aLHpgYiPdA3E3koifXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-FPW3HEoKNDixGmzyiJfeYg-1; Mon, 06 Apr 2020 20:23:24 -0400
X-MC-Unique: FPW3HEoKNDixGmzyiJfeYg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D12E8017FA;
	Tue,  7 Apr 2020 00:23:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 065E4DA103;
	Tue,  7 Apr 2020 00:23:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C16218089C8;
	Tue,  7 Apr 2020 00:23:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0370N3ZV026520 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 20:23:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 670102166B37; Tue,  7 Apr 2020 00:23:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61F1E2166B33
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:23:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D68F88FF663
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:23:00 +0000 (UTC)
Received: from sonic313-15.consmr.mail.ne1.yahoo.com
	(sonic313-15.consmr.mail.ne1.yahoo.com [66.163.185.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-47-wp5MN0A4OGelxg1yp8oFJQ-1;
	Mon, 06 Apr 2020 20:22:58 -0400
X-MC-Unique: wp5MN0A4OGelxg1yp8oFJQ-1
X-YMail-OSG: GCpqnqQVM1mIprFvyLYc7yHx_1u1ig7fy5uAmDSJY630AjJPe1.Z5EbVVWyaPif
	SH_dET8_vWTDiyDQmXndlFTsHu64xflK08n3uKkyFBLu3Y3GzUS9V.OQOpu5mODBrGjobHMDE68k
	KiGs.PcVMJGphg8gih_CJLlho81BS6.f3iVLSWwpZCkbj6TKmwioh54G6TFnXuB.5eKUULzCly2q
	gzhkYsRGYkGHCZ8l1yK1dxeQ9TIuh12afQDVtdiMCOxZBiWMDp2vlzYS.0ACOwm39e1wmtNluvAj
	PYAAX.I83D9mKSjtTxz8Is_062w3lx38ohoeqvbxfmzEzCdSe1w53ERFL2Oe.JVhOnFhgHBI7lWx
	jpMJccI1yXtFFZ.MCBX.IpB1OqWz.W5wjzPDaGhToS_d1k3DN9Fiz2ngWGDFc1TAYFpLA3rxbb6h
	OrqSquTdpjUogkXx1VXbk4ooQYWUaCTJznNRziKeoF7VndU1KvNbB0oovAOYeyvhrd4SGV23YnLf
	Ac6SqeO3rB_91EvBU4LY9r0cdmnb2J0DSmQf1b1MbPGgVkW.n2lFv78hmxwyiDtmOhnglZeq4bvx
	AFrJx5aeqMjbA64agAapKrQYpY8cu.Cnyn0U9JyCCizqnudyXbPXmzXoPTrJQAMXT_1IsppuKu_X
	HDmufzQ5vOoE0_rrlTi1s5XM7W7XJz1MghjQHVZtDP6IV1GjdDT1GLEsZxJGcCUAHdlGS1czSzfy
	SLdiI5s4Q.6xAWZeGDQhitvQkdvNk8D4x1SzRB0M_gFetfW3UlgQYqDXkB9_T31CtktZGT7Pq.c6
	BKZhyRg5Af8KuLr0.Yg3spZzpDkTK7ZvZg2ESfK_ktQQYl2ACj8V8gtgRzgxFhkCYygT7WrlG1fJ
	kJGmbWy.ENV46hJ1uWRu.l7bp.Pn4vUuqUrDDtmV0s5bcnryww_AtpRKcXVzT9JNe5nmnSbmWgXV
	Byn0hSJcaU99Ua1xzmEj4E.gDxnT6ujtK0.QQ0XkfTYl6Z2sH7JiifbL9fnDGbMm6Ps3Ea6CBd2Q
	E6ezmQXXw0WfW4Wzyj6zu3CwlKZQkBTP3GlrQb2t2P1Km_m9O6mjjbkjIYErbVp40ADaapyyfngK
	PBX50KwEVwQ3zpHmm2JXyKcy7u_ybvCUv6X4xErcE1w70QmVACzg8_QW2eCRnKOClVjUS1nC5lrq
	aiDmPC21oAUdK3BerVUTArZo87arpBkKU3u4VBVtNCeZjEMh7v.5U2_ruVdLZmdnaGzUxyF4rqdZ
	ZyGQ_2Y1EOMo5op68t3a_H.SmMhvu4EaFNlfQFxVnO1TJ70zGUbb6ZKPdPImFgSyWzty4FnpqhEj
	dYX_q44k5lu19Y2w2FGpyUSLIryvHo4DKIi2YoxX3350TRSvn7_pymLwErlbWodre4h4wXhhhHcv
	RffNCx3.CMOxjFLuJYCXkQjR042fMFy9.y9Vo0KZUsVwsOEDUcQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 7 Apr 2020 00:22:58 +0000
Received: by smtp432.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 1b2fba97d77f9ea95418fb25b4adff9b; 
	Tue, 07 Apr 2020 00:22:53 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v16 19/23] LSM: Verify LSM display sanity in binder
Date: Mon,  6 Apr 2020 17:01:55 -0700
Message-Id: <20200407000159.43602-20-casey@schaufler-ca.com>
In-Reply-To: <20200407000159.43602-1-casey@schaufler-ca.com>
References: <20200407000159.43602-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0370N3ZV026520
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, linux-audit@redhat.com, sds@tycho.nsa.gov
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Verify that the tasks on the ends of a binder transaction
use the same "display" security module. This prevents confusion
of security "contexts".

Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 security/security.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/security/security.c b/security/security.c
index 84f33bd4990a..b7c2ed1eee42 100644
--- a/security/security.c
+++ b/security/security.c
@@ -769,9 +769,38 @@ int security_binder_set_context_mgr(struct task_struct *mgr)
 	return call_int_hook(binder_set_context_mgr, 0, mgr);
 }
 
+/**
+ * security_binder_transaction - Binder driver transaction check
+ * @from: source of the transaction
+ * @to: destination of the transaction
+ *
+ * Verify that the tasks have the same LSM "display", then
+ * call the security module hooks.
+ *
+ * Returns -EINVAL if the displays don't match, or the
+ * result of the security module checks.
+ */
 int security_binder_transaction(struct task_struct *from,
 				struct task_struct *to)
 {
+	int from_display = lsm_task_display(from);
+	int to_display = lsm_task_display(to);
+
+	/*
+	 * If the display is LSMBLOB_INVALID the first module that has
+	 * an entry is used. This will be in the 0 slot.
+	 *
+	 * This is currently only required if the server has requested
+	 * peer contexts, but it would be unwieldly to have too much of
+	 * the binder driver detail here.
+	 */
+	if (from_display == LSMBLOB_INVALID)
+		from_display = 0;
+	if (to_display == LSMBLOB_INVALID)
+		to_display = 0;
+	if (from_display != to_display)
+		return -EINVAL;
+
 	return call_int_hook(binder_transaction, 0, from, to);
 }
 
-- 
2.24.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


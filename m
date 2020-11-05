Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 84ADB2A749A
	for <lists+linux-audit@lfdr.de>; Thu,  5 Nov 2020 02:10:42 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-DJX2ijTONTGHXgbITa9sKw-1; Wed, 04 Nov 2020 20:10:39 -0500
X-MC-Unique: DJX2ijTONTGHXgbITa9sKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FF5F184214D;
	Thu,  5 Nov 2020 01:10:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81B5A60BFA;
	Thu,  5 Nov 2020 01:10:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F658183D021;
	Thu,  5 Nov 2020 01:10:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A51AUAW030473 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 4 Nov 2020 20:10:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D09C42028E91; Thu,  5 Nov 2020 01:10:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBAA7206401B
	for <linux-audit@redhat.com>; Thu,  5 Nov 2020 01:10:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DD221021F60
	for <linux-audit@redhat.com>; Thu,  5 Nov 2020 01:10:28 +0000 (UTC)
Received: from sonic313-16.consmr.mail.ne1.yahoo.com
	(sonic313-16.consmr.mail.ne1.yahoo.com [66.163.185.39]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-553-xJtqtxMENLiwwRWxhlJ0gg-1;
	Wed, 04 Nov 2020 20:10:26 -0500
X-MC-Unique: xJtqtxMENLiwwRWxhlJ0gg-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1604538625; bh=rj7z0LJRoXFE0SUhho0f7Ghxg/nDRpm8ZPm/PLzu42T=;
	h=From:To:Subject:Date;
	b=k1k133Glcg7trLYLN8cAlQSrVThx1hzjwvtlFP/UV8QinqfcMKD+WxzXOlAwRulciPvpdZJd8YB9BRKgibI8ZaO9flte2hgl044bt44SmiiYfLenjYdf/ntDZvpYUiucZMW0ajGa5sl/oTGLY7ukMJcsmURabTdz+uXB5zwF4btE4kOyddSnXP2zxDJKldTd/4CCVU+1GOMom/pvW/Z1lGRL+1x74+1rymlbtxlGvD2XMc8dcxCvNdxbPCqkotF74mApQVNkUKKZf+GzO1rTFrOSrtz7UexGKx4GwFYB4dft3rguf7MnH6XtkS858+HrN9USDKHnvjp44M72ufaAVg==
X-YMail-OSG: IECdtoAVM1kw_pORLL3D9Lo6xYsaZz9JhKJiMsSwZ0DslY2Rl8NxsvWPUucCe3i
	_QFXUBRvQUSfKYGjWrW53s6U7eURxPXJg1QlpWjL0Hanwb_jo.5a7_keWlVMknOyV8IT5Vc3Rd_I
	rWbtMDhqtsZ2NKQY4x77Zt2drlFZ29ICQDGICut13Ot.Spzxu9RaJoie6Ut.hCHVVFHYzaJ6L0gR
	XtJn_GLn4Ex0aivsoFBsj86a_SV8E5fLzETxqSOlT5kMuaQmGgstR7qYVtg7zvHEZWzmlEv8FzO9
	7rcs2x9PxOCTcMn7EfHlHuo8JZ1Wyu1fyEv80Qwd_hNggR3W5BMXcZKRdAFUT2F65kySc_gtD39T
	jMn_ec2yvtPjuPnr7V.Zd3Dfp3nU6lUKbSgRi2GxZ.JcrN1uSTgjMHh_3ufInC67Jy_nFm36382j
	yBm1q18IydqtrHNPWpo0UVF8GY_lw1NQXHZd6bNWnL04wmD8I4_kuqdc2fn9N536CUp99t3NK6r4
	C3f.8W_VkHN1PyR4P3t1FunqAoPPwG0yUWMHrLd8WErsdfGaXT5V0sGAAzvtEu633TFVZYLWhqg7
	ODwxLWiZRI2TK7AJ0Z3QZ9clvWp7WHyD7ZyZxgpGzrS6DVEHo6TCPmI8RMB.wlts_KAVCGiBExIo
	27k7Lc8yxIpLSDI2nre7sMXQs9MY9y1zwyAtN67yeiT0BZBUAqTGjO.jcCQ1U3cS0VbDOKfwLyzd
	NcZA.sDRQYHfSD9Mf9VGLHYe0itSoWyfKOecKLKqgl1WAwNjzcrcol5nlup1d7NjdYyvw3uh5HDb
	Tz_pOBj5TrRuTsJXh1jNiB1n0qXs8JGsixSDaSqKipO1Y6Y9mLPEOp8CwhN3ZUUUSgDrR8xmbWo4
	ArAn3IoN5xLnWodkBGwG2hKI9r.Th9yX0yrjY.3bUvj0qmvseNCXZuXQJLb.n0vLUi1zk7SWsTje
	GfQZvF0ROP41idpq7A2eLQncNxYL98vPYaCTIVjEw6WlTqp02Tf9FY0vh1SD_Y5V5cx1GCdD9eAx
	d08jg.ymKoFs48s65THf01m95Ne88tymjNwHFO0bSmBqcNJlR5TVpOtzgGyu1pVY0FoVPiTOzc61
	AjLmxv92MkVr0g_J8tnKPerykpGg.hpVXTGIao9NJToYliTMO4TtyGfYLm__mkF1Tp0kO2yRAlQY
	8pTr1su6Xtpb1okG2i1bTxbB2R.CbsJhgcok2vCxA6HZoZahEmPP1rtIxfTVT8mxHzS_flBEKOjU
	pWRhlo0o_C6X0zQ2wcZ3ybaEbL9ZpHsUciAQH5DBFArEEC2zX1ekF7Dqdqi5YAXhgxmV4dI7smV2
	vbRK2atExV9mqSHlShxv6sOwMQfzZG6MZFvo1gsxQnzRtI_HX8NmFdNMwx1DJD3jSkurFJ_EsLKK
	OGrnsHRg6esQyvI8yX_OD4gSaPv3LioSiKLOJy3JffURhD3xw7j0Gv.ohNinpYLSpLxhx14L_k5m
	2TNQIrkOM4esFmjZz86pkq8c4JVgaX0ojGsAhqUGaHVAp_lHH8gBzIwPlfIA0nJ2NmqLYCngqWlM
	Op0ooOVUmljiFKJegFViX3Jwa5RpkYZ9PeR0.vejrx9R56M7ewTQYxXBv0EmcQzXK4ZVDpysLTpS
	W1Xmff9J155xkEKDtow6MNDjMdSxUiq6T.rUpRcqhHLJRYC6xjVEzJZjBzW6T.bu5y.GJampXK3H
	9xWhz1ShW2VxvsGwuOaN_LJpZViVRaIicXNHdShEyK68U_f2dWv__MoRVlHiliEeQPqlZVGaWjXm
	e.mnB6_vtJndHTHbOufP0tKCEnnFbKmwp53312xx72nWEN1HTdRJhZ5WqCppHvBeTvfbHsyCKoxS
	BAyd9SQKTPUgKU_XxRe3cX1x7M21oEGhJ4F7miCwUzUasUJVkLMeZAs9IQfKh2KVmUdEYrZs_QEE
	2KFPmTzQZ4RYu.mgmN0yurPZ4H_XL6rVmZRHI4sb9XOorifKAMgQpmtyn4Sk0BOWPnAc9TAqGuRV
	y6aDC8GNi6gu2FRsvjKFgDxBeQ1l.A_MjwgDvoqLaKPkLPVugFdfOcXGQMdjjq3VScqgE7dpAt1t
	RZWucUTRIVoVKLmRNWjt0yK8NFJcipFxDIMKcdwh1qlYMm0ycfk.bjVIpGX4gEhaRkJDLX92kdyF
	_d4V3AprtKU8stKhp7Yap6ZplOaCrr_yLcT0IvzNTrnp8nOr3HhVf99wG7y2x3To5DVGjjHRf7hs
	uLrmGSohr4EqYOqLRNv1rbMwWLBelEbmOrYEzvQa7qEW1L57KzUzpADgbhP7Tu0aa2OhkuryfbgJ
	TQjIY8hkwVG2.Idg03VMH548zG8Trmp4E_CJjlrO16zSOcqKlyWZN8YwIxOqfHl4H_QvFjI2gCvE
	KJj0uSZqlfPoIk4vYkQNSFdQzro8j83Q159K1R4ddLaygYt7w5F0yRORmjXFyVLi3DvXxrzU4AyS
	ZTSAMXVFAycGuibvXgf1bkOmTMkP0YXslzoOFuVyMxZjTD4q0Ob5TYkIRyGUzaHme_8d0qb6B.tv
	S_NzJgQtJG_pFUIBZxND5iGviH.zbNfVhQjExFXUIdmQqDKoaGxqS6bXb3EoaBCyVlswwsT81pRs
	cSgof3NFw4mLD4rpwZCniwxNMIcs2W_SppWAscTMPqZglq1Zly3LA8QMS3X5U98tVCB0LTlF.AF1
	FmTQcVrnh3.U.IKqFoCHgD5loees5jR7_of6BFb3nKYFLOQu6U9Cjixw9XZeYxauEnZfNqc2tOEB
	okvDQCrUhQuhw3WPfulnprfE6G0jiozbjy3HdgNjImImedE9xVJwCIqftqRvKBs28sm_fUSmkRKP
	Fn8BSsgAT2cNMg75gW46bjW8Q1I6C3Ng3VkpNnnK49BFaUiNL6lkgiH9mOuwwdk1XTZ.ZTjqiTgs
	rjeR77HqtP7T_EhSD65BtDDCJQrIZpWJ2p9cxngMgsri58VQLDMbxFjnWWJ0rRaJRBwyGiURu.OP
	FHwhQjPbUzCQ2PpKy2DG20KT.VhcCST8TvPwfh26aNEXuUGxQNtHVyCB1cl7304I7tMhcYOZjjZz
	rIOD06NPlsZ8xizsgUQmIy1IpejEQxYzuytZAXk36BA.IXmLdUb2d0KNzRfUTtdorA0SZG80dQw2
	ktjGamk8qQFtWyLvY.9jwxgE6.Lh4fgpzN9mkIF33jUMY6XDII8.o0hZvsZOJx4ns5DxUPx93.FR
	MoZ0l0Cj7jNfu9p.1RreX6Gke6C0gWz7ZkxFElr9hQiuXag5ayddW7EN1hWkKnAAK6Yy3Cegjp9U
	FDwRssgzwHeLufHMEy88NM8SpRhQd5n3AIWsuAHUAWR7p7OR7tBVcOqx347tYWjrlzlchz5sCz3h
	jSifp410-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 5 Nov 2020 01:10:25 +0000
Received: by smtp422.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 4b27f7017aa0de7d88a033876570fde1; 
	Thu, 05 Nov 2020 01:10:22 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v22 18/23] LSM: Verify LSM display sanity in binder
Date: Wed,  4 Nov 2020 16:49:19 -0800
Message-Id: <20201105004924.11651-19-casey@schaufler-ca.com>
In-Reply-To: <20201105004924.11651-1-casey@schaufler-ca.com>
References: <20201105004924.11651-1-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Verify that the tasks on the ends of a binder transaction
use the same "display" security module. This prevents confusion
of security "contexts".

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 security/security.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/security/security.c b/security/security.c
index 6c8debdfd629..c6b0f854c4a3 100644
--- a/security/security.c
+++ b/security/security.c
@@ -791,9 +791,38 @@ int security_binder_set_context_mgr(struct task_struct *mgr)
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


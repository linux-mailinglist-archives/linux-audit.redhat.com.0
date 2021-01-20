Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E79332FC5AC
	for <lists+linux-audit@lfdr.de>; Wed, 20 Jan 2021 01:24:01 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-bvQm6c6SNm-lyfoyPrvPXw-1; Tue, 19 Jan 2021 19:23:57 -0500
X-MC-Unique: bvQm6c6SNm-lyfoyPrvPXw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 383CEB8104;
	Wed, 20 Jan 2021 00:23:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60C8B3480C;
	Wed, 20 Jan 2021 00:23:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0702180954D;
	Wed, 20 Jan 2021 00:23:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10K0MLom020471 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 19:22:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D0F982026D11; Wed, 20 Jan 2021 00:22:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAFAF2026D16
	for <linux-audit@redhat.com>; Wed, 20 Jan 2021 00:22:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC7E9101A560
	for <linux-audit@redhat.com>; Wed, 20 Jan 2021 00:22:19 +0000 (UTC)
Received: from sonic307-10.consmr.mail.ne1.yahoo.com
	(sonic307-10.consmr.mail.ne1.yahoo.com [66.163.190.33]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-432-hC8yWw5UMvmHbjMRnwAmFg-1;
	Tue, 19 Jan 2021 19:22:16 -0500
X-MC-Unique: hC8yWw5UMvmHbjMRnwAmFg-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1611102135; bh=d6C8gjbYMEjgo2A9wOgyHZgok7e79dxcq0UQSxTcleq=;
	h=Date:From:To:Subject:From:Subject:Reply-To;
	b=XNowRTrkAfRtTNevojFdy8qXlNXe42p8FX/x/2upYQ0O/3FS4wvlh6KHUHN1DcgPrXpwvszjUC9EFNw1nnPHzBwZNZLPJnHYesZsEqzb0pEsGkROva5IlEi2g32jaLfd3/JCWLfXZZYB38oO4YFeRLJMVhAQK/Fk1jbKRJbRjqY+S+sn4hhDT0zBgMraTFTs17ZlD1qViYKQ2vb4qFE9QDfxLYwN5J4wSacdiXzilVJ/M0ejDgUY/kyjkviy6yBmik3o8TgyW14/8jdmIbiP2gXOaAQYK5kWyaf71iykbJXUJgP2wgiCfChD1Hd5dpJzW2vXVxPFd7UdioMiaEoaig==
X-YMail-OSG: ZBgyVt0VM1loVgtgXNxbIMQCPFKbaClNcR_0suKtoVNWwYOp_FpGfNeHfLcCSLH
	rxpFggXpPL8a5g7dxthcoDz.jGOaBcDs3oNPqxxBRnyWUBdIFV1xlR1pj2sEo3rKgX0kJPNhH.B2
	c3Z6nQzX2pF5Z.RmsCB0JMOzMbW3Ezm5m.BKvHcfnnXe3BLc1_d8uqe.lq87ojv9YVtYrOwCrJ_8
	zgkmlodEeo3W.pT78dM.nCx.DoOJkg5qU0ZVEeCPjJvSFHKA8MHHsqYlFnx0iEXEe9DrUoz.Y6Ky
	3WAeDX8.RSg6ZOnPt6lqT4BzTbtNkgmV4y1CijY1_rRjkERGaUIoI1SgpLBsNPktyR8aDX3Ey6zU
	LJPPrH5PsQjlPNJVkmjlbR9f5jJaUnKB6exzSpdn.lZMM8qYr8SmM1wnhV1OOWr3iLZAtG0o_J0I
	SJaywwqD2BM1qFUtFjNChfpQoZ86GOagAKLgfr94_XVXQCJiCd9WnN57z_yAomyDa6QVa2l1XxyH
	0wGHSxZ1GZ_frXTGixQ87.fgIY0THbbJgiecNl1gODrgiyPKzKjCXBAY6mkPGeijUZzUyD.odXEm
	Aku.2dJJx08.sejd7qpIluHQ6l1aRTGKqTH4kSusfBvi4isfk18OPVCLxxGm2o5KQ5KE_ei5jiCQ
	vQwWlgD4aa.R5cNda1FvuTN3JC0VF3BVhnDXc.roTQVYkGKBrzDhen2WyKVi9V85yUGQjOVj9Bvb
	SjQ4gNVnkZqPIekPGl4rRN7B3lLs.lYD0oA1VPGQeqDuIeCNuh7xCj5TzSKVdnpqw5yjysBhKbra
	jbc70eKAGvU6esyfG4tZOTTso8zIUjtofIBeC_.ZdlFdCCadA2Axxlh9uAwVPgBnMbLzBG.hoCko
	xt0sUZ2.8D2L_6YWglWybX2irP41QEu0J4athe4dXFOIvhVigRz5.9xBDxQftaUlN4sSozazBfN0
	iIjB5GL2.CgSnBsFLzq7oNaHPDExJ_8E7SeVJnSKLC14go3s2QhcoeGp9dxjEJ15bv.FsAHD81Pv
	MQcPhDwogbUVuiy0t1sspHiemoAJELU3f5t1VHzWsCQEVP8vbEqmpiEbiKr2r8dRTJiF6FKyJnQ3
	bsICCPoF3_YUryQYSgGogOT18O.TLC_eGu1Hf4_ibQb5VNZYFv0wwh02eP7LQFn77EpmP._Linqh
	r38sNWixiS_nE3t4NdWI7Ts.art6qoXX0k5X3hesSkWjjPZHqYNUD4j1fIi8SsT89l7RGrokld1h
	1FC0Ipg4I4v_1HzIKMq1FtIAv3jCA4oJYtc8He5ifCX_kMyCmh1wHxQmh64_U6YGygGtkbzOI1zJ
	0K5.51vaWqDOJ3AqOaVQi1lyjxDnghKzE.bqPyfdA0VBieO2Nw5UmF2vbDXz1aSF6pueVJLAiTCJ
	HE95sKF7oyCo9weZgZyrilX6I7FDd2OdIysLC_QCcW41cqpYtFqP2zWtWpaL7kE3YKZ.OzbE6lwR
	WNwh2CeXKxjSdXa5zvMF5AO.WkbSGGzfMNQgpSGSbGsb6wr_es5sKCHmJIGI8yLybzrRrm2E.vvT
	yBe6usGpCztQWtJnSOhi9J7z.XrbxuMGbz1akUfw_sDyC_d4ehoq05YjTu2juTin5VwXuyoURiCP
	B3d7d8za05XXLVEHQMIAjYXyXdqGJrSENTyLsR_e2ZwhBCaCgTJB1hzNTcEzZ5AcVpttv0Gfb.OY
	RgcBEtiWK218ezBOgNRhDOeBhcNK0W4VbsVSN6e1vXKh7Lvl9RYqlpikXqu.q7HA4EHDeXOmh2Qv
	._VaZ8jvtFoSIBToI7tPEzvRev5AIpiifXOgtG3tnnNitmA.vj7Fxh1vmvJerYHxifRsEQMiWv8v
	yOH.kArFxAq_p9s4wA6pgCrBo81YAKeeqHmnkfMjI2.i_FaZp.iCfjSjiYfuhRl4FkWT4qJvY3w1
	AgN9evonEWsEUjWW.dRl2IWwGq2Lf5x1bUYO5U4ccTc0F3hOIcBLtc.1Z4rDL9pRmj5DtMMgu5xi
	qAPM3OParqZ1CnLGFXUqZLQLtVhkoAgsf.vhLiHN1QTMMwkt8pWRcrZT4eYRBkDqTj6Y6Wft1yiu
	gnDortrSazaTBLhXl_FaRPCOVGv9th.cRGuWMAUfU50rKih70uOj00s.2hNS5FEP7FmE8dYxFgR_
	fU_if4IKZJaLQ4FKx2rL115JeuWSIjt4dh2xhYjzYQ_XCJKznPGLY6XywOHz9F6PnSjdd9Wk3OFp
	PxX0ETMiUSGLevhdhQRxKgyzqmudkku.GSTyCAW2WLjmMlxgbgrWCEERyYx_PDaE0_csDpFRKjPY
	.GNYh3CVS6xY4S_B6FLiGudWXX44PqDM5mY48QY_cUsiBGRMzS4ylUBdzfirASt9xEJtgo_g6b4k
	fXY1T7LRk9A0-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic307.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 20 Jan 2021 00:22:15 +0000
Date: Wed, 20 Jan 2021 00:22:11 +0000 (UTC)
From: Joe Wulf <joe_wulf@yahoo.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Message-ID: <316007965.1268500.1611102131083@mail.yahoo.com>
Subject: 2nd Round AuditRules Questions
MIME-Version: 1.0
References: <316007965.1268500.1611102131083.ref@mail.yahoo.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0353843118560220059=="

--===============0353843118560220059==
Content-Type: multipart/alternative; 
	boundary="----=_Part_1268499_19872719.1611102131082"

------=_Part_1268499_19872719.1611102131082
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

1.=C2=A0 The rules for monitoring '/etc/passwd', '/etc/shadow', '/etc/group=
', '/etc/gshadow' exist.=C2=A0 Shouldn't corresponding rules also exist for=
 the same four files which also have a dash/hyphen appended to them (i.e. '=
/etc/passwd-', etc...)?
2.=C2=A0 By adding 'audit=3D1' to grub kernel boot param's---can I then saf=
ely eliminate this piece from all audit rules:=C2=A0 '-F auid!=3D4294967295=
'?Conversely, what harm would it do to 'just leave it'?=C2=A0 It would, in =
some cases, satisfy certain vulnerability scanning tools seeking exact synt=
ax compliance, right?

Thank you.
R,-Joe Wulf




------=_Part_1268499_19872719.1611102131082
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp9dea18eeyahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div id=3D"ydp9dea18eeyiv3417228079"><div><div class=3D"ydp9dea18eeyiv34=
17228079ydpab62505dyahoo-style-wrap" style=3D"font-family:Helvetica Neue, H=
elvetica, Arial, sans-serif;font-size:16px;"><div dir=3D"ltr">1.&nbsp; The =
rules for monitoring '/etc/passwd', '/etc/shadow', '/etc/group', '/etc/gsha=
dow' exist.&nbsp; Shouldn't corresponding rules also exist for the same fou=
r files which also have a dash/hyphen appended to them (i.e. '/etc/passwd-'=
, etc...)?</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">2.&nbsp; By add=
ing 'audit=3D1' to grub kernel boot param's---can I then safely eliminate t=
his piece from all audit rules:&nbsp; <span>'-F auid!=3D4294967295'?</span>=
</div><div dir=3D"ltr"><span>Conversely, what harm would it do to 'just lea=
ve it'?&nbsp; It would, in some cases, satisfy certain vulnerability scanni=
ng tools seeking exact syntax compliance, right?<br></span></div><div dir=
=3D"ltr"><span><br></span></div><div dir=3D"ltr" data-setdir=3D"false"><spa=
n>Thank you.</span></div><div dir=3D"ltr" data-setdir=3D"false"><span><br><=
/span></div><div dir=3D"ltr" data-setdir=3D"false"><span>R,</span></div><di=
v dir=3D"ltr" data-setdir=3D"false"><span>-Joe Wulf</span><br></div><div><b=
r></div><div><br></div><div><br></div></div></div></div></div></body></html=
>
------=_Part_1268499_19872719.1611102131082--

--===============0353843118560220059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============0353843118560220059==--


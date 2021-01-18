Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 235C02F98BE
	for <lists+linux-audit@lfdr.de>; Mon, 18 Jan 2021 05:44:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-CMuGxkMxNg20HbmO8zCSPg-1; Sun, 17 Jan 2021 23:44:21 -0500
X-MC-Unique: CMuGxkMxNg20HbmO8zCSPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1732801817;
	Mon, 18 Jan 2021 04:44:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DECE5D9CD;
	Mon, 18 Jan 2021 04:44:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8559B4BB7B;
	Mon, 18 Jan 2021 04:44:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10I4hUaL000837 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 17 Jan 2021 23:43:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A35042166B2C; Mon, 18 Jan 2021 04:43:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D09A2166B29
	for <linux-audit@redhat.com>; Mon, 18 Jan 2021 04:43:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CB59101A560
	for <linux-audit@redhat.com>; Mon, 18 Jan 2021 04:43:27 +0000 (UTC)
Received: from sonic311-25.consmr.mail.ne1.yahoo.com
	(sonic311-25.consmr.mail.ne1.yahoo.com [66.163.188.206]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-299-eafYxby6M-enFzNId1eoFw-1;
	Sun, 17 Jan 2021 23:43:23 -0500
X-MC-Unique: eafYxby6M-enFzNId1eoFw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1610945002; bh=alsDkVc5Ca0mbfdzsTTjru+iEE42gAzlaXfHJurTMJj=;
	h=Date:From:To:Subject:From:Subject:Reply-To;
	b=cm/4+xui3q+hcYVO0qKFdFwIt/HZ5EeA9gPXFHAdfAUdlojWccM4hudfZo9eYIVV6E/7xdIf7OdeL2RZ0ZtAYyo7Ea3lQ5g+36nli3gvOs6VW0yZC769L7chMPDvc1DfG89Dex5Dar6MM3f7JnAJxPpanWYzkkoytc/x4AZ4pJ1MgaQgolj3r6DR8u/JrNx0mX2nW7grWX55JmoxVA29sVp7Jyhf72kK+skMW71PzE4FO8G+eW4TtZ6buvm/aREAt4YkJ0Pk9AV+y4Fe4HyNcqaegkdokMW1YK0xVlndkHd4YIaPSwWJwQF7OGHg07EuF9dGXjCjztJmDePE7spwog==
X-YMail-OSG: GeA0E9YVM1mM4ubJd_Bv86J0D0_5reDwsVX.WZxrww8Pnpm9g7EsBIu8fUA7Yjz
	Blw4EqT1tmzVbH.zmEGRoFbWes0iSn71AyTBteaSVemm6.cJyhIbg5eSVvnJ6Kl35DAwp11PviU.
	ow7BYwJI64cKPsfcUT8jLQsIO6MBdLxlLTcAwqEDZs4OqPIi8d8CHhap3Q._FSCzgSPt8QXL_L7u
	ZNLjIG7w6ORLoBJ2YuJg2wps0r1IQrCtXxDdQ1eGG2AvokovKb.noevf53D_iLVcWE_gDSduNaLk
	ysVlGFOCf.beoD6SJ4CjVx_YjHcZ3G4Gw8iIO3WNxgVmu6M2sJldG.8R7x.w9OfeMWpH.Vp9l8Eg
	mXVfjeN3qxVP7BcCdU.r9Gt7wmWcEu4zn5frAkAlyrw0OjGskB8UPNAeKtwvjV6kiV91fx7qbvSf
	DXRFNAKrzdfpIitgXkiE6hrIewAXrPmTMpaHYiOuxPPELhbdady6n_0UBUlQ5420mYA1OvWV5qxt
	0yeA27Z4ksQSp5TNpfFB_YZVxqc8JuuUHcOx6N06IHlYdeSFoDCXels9SwrtXFSq3UsEjoW3UoZ9
	Tr7bTrznZ4gIH8MdejgG6ITyCtRfHKazpOexfaM.75mALx_Gt8fv_JwuN4I5XS.moLikuABM3H0K
	akZXs.Djvxc1ObwkPkEz7rgIm6CB6BgrLgcrnKRBAWrXFev.lVfWakCT2rUARntx1YZeJzINNwKg
	8XlYgpsSDiJYVdUja.qgqV7eAQW62KYp_fH_hih0IBFlUp3IK8WTPIEyNunMB_giEqU8Ho.RCDDJ
	23fpjmSdZbkUWklLIeuM6fmOkI7mCyYNaej.ZzCqC62YUMuckQ9Llal44O_05qrlAKIz6vweLyxz
	Ozg0SKQXVoQuZvGzXkDCwXPZk3UORCiqAJITWav7sem8VOmFtKDwQcN0nlekizBSNriy6EeiiPUt
	Kmbfh24HvSh8Re3Iuwelx7M_R5eAZqsy3eSkDcBi7vG5b8r6gazIRatR3P4T18xyXsyv0lzV44z5
	WGf6i6aLtHW5wVsu7DD5ViKgQQDTljG561.TPbN4Gdj0u.3UczAcMa2ND_tx5bTaY3hv6T4h4hE8
	Q.9EvTawjAjlD.7UhA3uwcGv6zBbXs6RL7YI2saYXQfdmPjiB0wRM652TuFZcExBEiUOZ9u.eud2
	4Ft3CqiFSDwssV349dBAcrCN0bU95UKDaK8RJR0ZlF6WXpf69AyKPGLXPGJk8ymsp6E7CgX8qljn
	_HghqUtK747npZX79TFDSGFQufiayygCfrjVwSBXrEZYZax2qKmeoeYo0nChgMdQZtGORW2osoER
	iqA8zwlj.vAXd4P7XCYsJ.FqGaFUTNnZ8guCE_iXSefeIoC5w71S7l4hR68Soq03JScMOmkvdzqR
	DiqNDyZh6mY4fF7vYBbWFNWIsEmTVfnVm87BhN0OsPuMD43OOInLm0TONTg50RbQdkRpLRiopP8k
	zIOe4J_KAL0u3zaCFbyAjXndWBKR2NFK2Hx6sHzTgRuGhier59f0u9kBEy58SGklpxn5LClMNS17
	vzVKglvkMA4oEo3.TZ99gM0VfKZ7enAcA22DYhV9fFDVWcZuWyW3ZAXssQvgag5styK3egteuGPJ
	mQ1mzPSERopruWk9NsWsBqQ5x74Co_wHxx3.jq8aCKc9JYau4wuuNZoBNzmS6CVhF1Ddy9qOvhc0
	42zDNX29RU.cCTmDwn_eHpbMvBrzKTeKilsxAFWoXhGtEz0CF1jNriAngbC0UAH.YERsrArUEoEg
	B0DgEt4wfjhmH815eVqWgGYBvBIPP4Zsb2kH5WCJ4fCK3.CytlhXXK9wdmDuHySsmyQxgLO5P6Jz
	liA1zsOBG5UJ8NLWJY7H12p7i7.kZMeFUCSjbP0yhUyGnwfITkgrasBCHdy0AIT3X0wKluKp..0E
	svygiWhhzaDIasc64gWS4KMPVNFUVqymqMussY5nm2cPpHEyoYq3ubJZXPD.QvhO8Z_BTyUsk4Ju
	988XoRXXKI5jOqAwwzIK34ngyo8OqHQvOC9LVAL.BQCWWmDhgGM6SzukSWraPoabQ0Z05TxzTkSV
	mx.WHUPY8OOVHkq7MonJRDjjYQ_BqDR3S5ijK0nOe8MVHSGRt_YPMIyGBrECngvAuwwVoc4AN4xi
	pEW2LL8K1t_dEcM6mB2U4qW3IqwrBufmcd8GnKhyN23mGaZc3rj0G_j2raKl7OVQcDwG7.PRPp1Z
	sF8Tm9pMDHYXCXH5z3KldueSTZUjkqls9W5BAVMvbo4KPEi9hOlChatRKJMNOtasgJJPqxOpCv8C
	fHCI4A1MClbCuz6bwbAVzKll6CtIKPtRRC7.89sOksejQAjb7eZBgHVZtL4jXZ3affhCoeKt3uRK
	Q3Tobpu1_rUhxEDz8mMoUXLR8VA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic311.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 18 Jan 2021 04:43:22 +0000
Date: Mon, 18 Jan 2021 04:42:38 +0000 (UTC)
From: Joe Wulf <joe_wulf@yahoo.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Message-ID: <1824339272.504544.1610944958091@mail.yahoo.com>
Subject: Possible typo in 22-ignore-chrony.rules
MIME-Version: 1.0
References: <1824339272.504544.1610944958091.ref@mail.yahoo.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============8853998113073790203=="

--===============8853998113073790203==
Content-Type: multipart/alternative; 
	boundary="----=_Part_504543_1559317879.1610944958090"

------=_Part_504543_1559317879.1610944958090
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This snippit in both rules in that file (for both v2.8.5 and v3.0.0) "-F au=
id=3Dunset -Fuid=3Dchrony" for the second "-F" seems to be missing a space =
after the "-F".=C2=A0 Correct?
IRT to the comment in this rule file, "These rules suppress the time-change=
 event when chrony does time updates"; does that mean IF these two rules we=
re not included or commented-out, that the chrony time updates would 'log' =
events in the audit log?
How do these rules 'work' to suppress chrony time updates from being logged=
?
Thank you.
R,-Joe

------=_Part_504543_1559317879.1610944958090
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px;"><div dir=
=3D"ltr" data-setdir=3D"false">This snippit in both rules in that file (for=
 both v2.8.5 and v3.0.0) "<span>-F auid=3Dunset -Fuid=3Dchrony" for the sec=
ond "-F" seems to be missing a</span> space after the "-F".&nbsp; Correct?<=
/div><div dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data=
-setdir=3D"false">IRT to the comment in this rule file, "<span>These rules =
suppress the time-change event when chrony does time updates"; does that me=
an IF these two rules were not included or commented-out, that the chrony t=
ime updates would 'log' events in the audit log?</span></div><div dir=3D"lt=
r" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">H=
ow do these rules 'work' to suppress chrony time updates from being logged?=
</div><div dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" dat=
a-setdir=3D"false">Thank you.</div><div dir=3D"ltr" data-setdir=3D"false"><=
br></div><div dir=3D"ltr" data-setdir=3D"false">R,</div><div dir=3D"ltr" da=
ta-setdir=3D"false">-Joe<br></div></div></body></html>
------=_Part_504543_1559317879.1610944958090--

--===============8853998113073790203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============8853998113073790203==--


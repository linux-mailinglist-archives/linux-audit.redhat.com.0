Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDFB28E678
	for <lists+linux-audit@lfdr.de>; Wed, 14 Oct 2020 20:34:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-xFFFOOl_PYGgjconvjbtsw-1; Wed, 14 Oct 2020 14:34:52 -0400
X-MC-Unique: xFFFOOl_PYGgjconvjbtsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17ADB1062736;
	Wed, 14 Oct 2020 18:34:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D019B19C4F;
	Wed, 14 Oct 2020 18:34:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 75FD458100;
	Wed, 14 Oct 2020 18:34:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09EIYh8T010811 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 14:34:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1859310657BC; Wed, 14 Oct 2020 18:34:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1419B10547DB
	for <linux-audit@redhat.com>; Wed, 14 Oct 2020 18:34:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CED0C805F53
	for <linux-audit@redhat.com>; Wed, 14 Oct 2020 18:34:40 +0000 (UTC)
Received: from sonic314-21.consmr.mail.ne1.yahoo.com
	(sonic314-21.consmr.mail.ne1.yahoo.com [66.163.189.147]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-270-z31wIfg2MTa7XFT1ThNiTQ-1;
	Wed, 14 Oct 2020 14:34:37 -0400
X-MC-Unique: z31wIfg2MTa7XFT1ThNiTQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1602700477; bh=G2QRFxz+bj4bU2zqnGNUot6m8CQez7k8HU73IYnUG9N=;
	h=Date:From:To:Subject;
	b=AQT5QlX6qeDFUy0fcloThQaFzV23M2z93IEM8tCC3J1u5B1+p7n+Knx2K4ZpCCzMZ87bRoElF+cUNyzIiabpdMkLtzDObmf8yBhQ5ZThA9/EIK+7p6JJeorqqHw7/5IwtYwWJSse5vRMb1Q8SssCQT/ofbhwtn2Djlagz4/ZdBYuAVZ/ibXvkyVodDsKL8HDc/xBDRIJk4hL8aoeo0vWcohTSF5ZhsHnMuCoej3sg0slctmKEgRyYLw8jtQWm11CtCwXRHmiK4DAYBLlfsIh5xnVCNNnlJ261DVvEkZ6nA4nxPjnQycppaCF/xCUNu9mFNYcrQDbr8MSxYCfLqSsng==
X-YMail-OSG: m05rxtQVM1mzsKTUQhw2PQVsHieoDCAFkQ807apkZ49U8QcwQI3UQORnF35kTJL
	_yyJopTL1tDuWpMvSQxgcLS8TaG3YWBncE9yMm80QRQDy8yFzke3r6eC6.xobzlmUAxz1iOMEyk_
	bjziBQYwrmXDaaBfCpbGjZBM80D9wCPW34Gby6OJIIZbfB._SPNtAfKggxkXjncsrEW_ZKqnc.mE
	O2_W3sWTIjlaaDDTJqdi3kqiVdusBEq5eh9m_6eR23pShA_XdvBtfsJMmXRXPrsr73pXzG7l2.ub
	_8FQShEdw.eVxon5ZLu_9wYkTP8OqmtECpT95anib82EdctoMTFP2AYuTYAIZvIWLEfh2SiHHAqR
	Q.Aic765vei1_oSjeyAqn7yoWbHRgbAtQYKIEoFvA4SqN1VQe3Qb784oDFL0PdeIpyTuBLWVzCi4
	2l3e2dKWjhYp9u5ePCrCHQIK9QmTZJV_u0YRrm4RetDxZVWvqEo_ksz_TzRb1TRUaVQJKNSLW16m
	V1m0tg_g4Y3KSk8LTQm3Xp9Shee9qJxiitOZusP9sb8Lthq11NgcZhmSs0O3VTnknS.m3uj.4IAq
	zqcZZB2h8FEhzGMUgpgvHQjs15L8m3Wco7VLlTx9iVeaoKM3Xzmvlpszv1CbrwIsLoxD.9hlgqyR
	foMnUAfR9KSqLQK6uZoyI2O49Mpf_s3IJRh5ZL2IMWr.DrB8xVcmB4ZenRM7Eb3kdJjgAKB6jqad
	06YQZtOisjc9DywshfvFD6GIFqoFBKZcD2Ty1KJ2k8KnzOyXZcLvLm94Vj6T2KJvfs97c4mh62qY
	dUyNI98KdXP8poNGmmyxXqDGV73DCPexKiXyKZDApFtWoQDJgjO1wnK60X5JwWa76l99EfrmUdX8
	3Rd0.zZgWywPhiGmS.ehUifyqfj8uTiZG2jkrGlY0QpwMBEmY4wcWomSsm8pNGatfugpVeD6JVM3
	1F1Zd6vdrjZ_giVYvkW0xh4s_bFstsv0GsQnIWPIfPsVN3eM158ipbEjbZHVVxNKJ89My0GSC_WS
	sr5Vh5wYwbAWgeu22FAa9v4IaIswV6y0f3YFEvea_mJgeKI5zWNCDG2NnUiK5bAwm1F_DIKcfJq3
	8pgx779MPmGAL_D00xOJhhwq8z7WgEBIxT4WLoIYStBTRNG9tlbQ_.JVBb1Q.crdKb9mv.jRaY9H
	_rZLHqoOLl4UFEYFC659tj.snnkM.t3uytmkjskVgiTOh25w4RsIzjNZmO8qoBJwOSqNlk6_B1W_
	PN6i57RMhC1d5Od_QP1SMTeTW23T28h7ro5Lfos.bdEkCUrahZgyaNAhhnYehJErLQaN09wVC9CZ
	f5ueu6cgENNoyxACgZdhvKlwnNmSyIWoIh2P.NdA6fhbs26o.NzpcdglLNTe2Xr0LvG17ucCOm3E
	QqTCC_tUKYTVeijZiSwRHjR_fmOQevL6sKc98vqPNV4n.FeFbC2QDoHVxKmqfbSlgeCnXgWSh91S
	x8aeAVddlWJ0wJO6aOV8GSkcFe7TCSWImSLxYehV7RigHbVIXIcE5Frx_CMmpq7ETbbYn3594uKV
	R66hRiq9oA5rWvUs-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 14 Oct 2020 18:34:37 +0000
Date: Wed, 14 Oct 2020 18:34:30 +0000 (UTC)
From: Fabio Sbano <fsbano@yahoo.com>
To: sgrubb@redhat.com, Steve Grubb <sgrubb@redhat.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
Message-ID: <1168664034.664987.1602700470374@mail.yahoo.com>
In-Reply-To: <3344292.iIbC2pHGDl@x2>
References: <1025996531.618266.1602694304884.ref@mail.yahoo.com>
	<4281677.LvFx2qVVIh@x2>
	<1347666069.660171.1602699215591@mail.yahoo.com>
	<3344292.iIbC2pHGDl@x2>
Subject: Re: Auditd is not turning off the system on (RHEL7.+)
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
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: Fabio Sbano <fsbano@yahoo.com>
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
Content-Type: multipart/mixed; boundary="===============3246776182635308675=="

--===============3246776182635308675==
Content-Type: multipart/alternative; 
	boundary="----=_Part_664986_1443882939.1602700470372"

------=_Part_664986_1443882939.1602700470372
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Off Course,
I'll do it tonight

Regards,Fabio Sbano

Sent from Yahoo Mail on Android=20
=20
  On Wed, Oct 14, 2020 at 3:21 PM, Steve Grubb<sgrubb@redhat.com> wrote:   =
On Wednesday, October 14, 2020 2:13:35 PM EDT Fabio Sbano wrote:
> I'm using 7.x with latest update :-(
> Can i reopen the bug?

Sure. I think you'd probably want to add your AVC to give a hint.

-Steve

> ( I turned off selinux for the auditd to work the halt )
> Best Regards,Fabio Sbano
>=20
> Sent from Yahoo Mail on Android
>=20
>=C2=A0 On Wed, Oct 14, 2020 at 2:12 PM, Steve Grubb<sgrubb@redhat.com> wro=
te:=C2=A0=20
> Hello,
> On Wednesday, October 14, 2020 12:51:44 PM EDT Fabio Sbano wrote:
> > My /etc/audit/auditd.conf is configured as below but it is not turning
> > off
> > the system
> >=20
> > ## This file controls the configuration of the audit daemon#
> > local_events =3D yeswrite_logs =3D yeslog_file =3D
> > /var/log/audit/audit.loglog_group =3D rootlog_format =3D RAWflush =3D
> > INCREMENTAL_ASYNCfreq =3D 50max_log_file =3D 8num_logs =3D 5priority_bo=
ost =3D
> > 4disp_qos =3D lossydispatcher =3D /sbin/audispdname_format =3D NONE##na=
me =3D
> > mydomainmax_log_file_action =3D ROTATEspace_left =3D 75space_left_actio=
n =3D
> > SYSLOGverify_email =3D yesaction_mail_acct =3D rootadmin_space_left =3D
> > 50admin_space_left_action =3D haltdisk_full_action =3D
> > SUSPENDdisk_error_action =3D SUSPENDuse_libwrap =3D yes##tcp_listen_por=
t =3D
> > 60tcp_listen_queue =3D 5tcp_max_per_addr =3D 1##tcp_client_ports =3D
> > 1024-65535tcp_client_max_idle =3D 0enable_krb5 =3D nokrb5_principal =3D
> > auditd##krb5_key_file =3D /etc/audit/audit.keydistribute_network =3D no
>=20
> I believe this bz is relevant:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1780332
>=20
> If you update to the 7.9 release, it should work like it is supposed to.
>=20
> Best Regards,
> -Steve




 =20

------=_Part_664986_1443882939.1602700470372
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Off Course,<div id=3D"yMail_cursorElementTracker_1602700379964"><br></div><=
div id=3D"yMail_cursorElementTracker_1602700380097">I'll do it tonight<br><=
div id=3D"yMail_cursorElementTracker_1602700364012"><br></div><div id=3D"yM=
ail_cursorElementTracker_1602700365443">Regards,</div><div id=3D"yMail_curs=
orElementTracker_1602700374480">Fabio Sbano<br><br><div id=3D"ymail_android=
_signature"><a id=3D"ymail_android_signature_link" href=3D"https://go.oneli=
nk.me/107872968?pid=3DInProduct&amp;c=3DGlobal_Internal_YGrowth_AndroidEmai=
lSig__AndroidUsers&amp;af_wl=3Dym&amp;af_sub1=3DInternal&amp;af_sub2=3DGlob=
al_YGrowth&amp;af_sub3=3DEmailSignature">Sent from Yahoo Mail on Android</a=
></div> <br> <blockquote style=3D"margin: 0 0 20px 0;"> <div style=3D"font-=
family:Roboto, sans-serif; color:#6D00F6;"> <div>On Wed, Oct 14, 2020 at 3:=
21 PM, Steve Grubb</div><div>&lt;sgrubb@redhat.com&gt; wrote:</div> </div> =
<div style=3D"padding: 10px 0 0 20px; margin: 10px 0 0 0; border-left: 1px =
solid #6D00F6;"> On Wednesday, October 14, 2020 2:13:35 PM EDT Fabio Sbano =
wrote:<br clear=3D"none">&gt; I'm using 7.x with latest update :-(<br clear=
=3D"none">&gt; Can i reopen the bug?<br clear=3D"none"><br clear=3D"none">S=
ure. I think you'd probably want to add your AVC to give a hint.<br clear=
=3D"none"><br clear=3D"none">-Steve<div class=3D"yqt1149481007" id=3D"yqtfd=
75536"><br clear=3D"none"><br clear=3D"none">&gt; ( I turned off selinux fo=
r the auditd to work the halt )<br clear=3D"none">&gt; Best Regards,Fabio S=
bano<br clear=3D"none">&gt; <br clear=3D"none">&gt; Sent from Yahoo Mail on=
 Android<br clear=3D"none">&gt; <br clear=3D"none">&gt;&nbsp;  On Wed, Oct =
14, 2020 at 2:12 PM, Steve Grubb&lt;<a shape=3D"rect" ymailto=3D"mailto:sgr=
ubb@redhat.com" href=3D"mailto:sgrubb@redhat.com">sgrubb@redhat.com</a>&gt;=
 wrote:&nbsp; <br clear=3D"none">&gt; Hello,<br clear=3D"none">&gt; On Wedn=
esday, October 14, 2020 12:51:44 PM EDT Fabio Sbano wrote:<br clear=3D"none=
">&gt; &gt; My /etc/audit/auditd.conf is configured as below but it is not =
turning<br clear=3D"none">&gt; &gt; off<br clear=3D"none">&gt; &gt; the sys=
tem<br clear=3D"none">&gt; &gt; <br clear=3D"none">&gt; &gt; ## This file c=
ontrols the configuration of the audit daemon#<br clear=3D"none">&gt; &gt; =
local_events =3D yeswrite_logs =3D yeslog_file =3D<br clear=3D"none">&gt; &=
gt; /var/log/audit/audit.loglog_group =3D rootlog_format =3D RAWflush =3D<b=
r clear=3D"none">&gt; &gt; INCREMENTAL_ASYNCfreq =3D 50max_log_file =3D 8nu=
m_logs =3D 5priority_boost =3D<br clear=3D"none">&gt; &gt; 4disp_qos =3D lo=
ssydispatcher =3D /sbin/audispdname_format =3D NONE##name =3D<br clear=3D"n=
one">&gt; &gt; mydomainmax_log_file_action =3D ROTATEspace_left =3D 75space=
_left_action =3D<br clear=3D"none">&gt; &gt; SYSLOGverify_email =3D yesacti=
on_mail_acct =3D rootadmin_space_left =3D<br clear=3D"none">&gt; &gt; 50adm=
in_space_left_action =3D haltdisk_full_action =3D<br clear=3D"none">&gt; &g=
t; SUSPENDdisk_error_action =3D SUSPENDuse_libwrap =3D yes##tcp_listen_port=
 =3D<br clear=3D"none">&gt; &gt; 60tcp_listen_queue =3D 5tcp_max_per_addr =
=3D 1##tcp_client_ports =3D<br clear=3D"none">&gt; &gt; 1024-65535tcp_clien=
t_max_idle =3D 0enable_krb5 =3D nokrb5_principal =3D<br clear=3D"none">&gt;=
 &gt; auditd##krb5_key_file =3D /etc/audit/audit.keydistribute_network =3D =
no<br clear=3D"none">&gt; <br clear=3D"none">&gt; I believe this bz is rele=
vant:<br clear=3D"none">&gt; <a shape=3D"rect" href=3D"https://bugzilla.red=
hat.com/show_bug.cgi?id=3D1780332" target=3D"_blank">https://bugzilla.redha=
t.com/show_bug.cgi?id=3D1780332</a><br clear=3D"none">&gt; <br clear=3D"non=
e">&gt; If you update to the 7.9 release, it should work like it is suppose=
d to.<br clear=3D"none">&gt; <br clear=3D"none">&gt; Best Regards,<br clear=
=3D"none">&gt; -Steve<br clear=3D"none"><br clear=3D"none"><br clear=3D"non=
e"><br clear=3D"none"><br clear=3D"none"></div> </div> </blockquote></div><=
/div>
------=_Part_664986_1443882939.1602700470372--

--===============3246776182635308675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============3246776182635308675==--


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A959028F052
	for <lists+linux-audit@lfdr.de>; Thu, 15 Oct 2020 12:47:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-169bL9wlPQOQ_7JZxN-j5w-1; Thu, 15 Oct 2020 06:47:04 -0400
X-MC-Unique: 169bL9wlPQOQ_7JZxN-j5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0472580F05A;
	Thu, 15 Oct 2020 10:46:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB44210023A5;
	Thu, 15 Oct 2020 10:46:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7546F1826D36;
	Thu, 15 Oct 2020 10:46:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09FAkZwL004568 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 15 Oct 2020 06:46:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 949A32166B28; Thu, 15 Oct 2020 10:46:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EC412166BA0
	for <linux-audit@redhat.com>; Thu, 15 Oct 2020 10:46:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81FDE1021F81
	for <linux-audit@redhat.com>; Thu, 15 Oct 2020 10:46:32 +0000 (UTC)
Received: from sonic303-21.consmr.mail.ne1.yahoo.com
	(sonic303-21.consmr.mail.ne1.yahoo.com [66.163.188.147]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-360-HSVLVi8xPhSFuoRaYIxQ-w-1;
	Thu, 15 Oct 2020 06:46:29 -0400
X-MC-Unique: HSVLVi8xPhSFuoRaYIxQ-w-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1602758789; bh=qEPrwvGuVfAGLs++2jS1Z9B0VVemL+jWUCS1Q5/zYXs=;
	h=Date:From:To:Subject;
	b=gkp6pFQ3ijGip6rzpIpaKm7lXbKoyjXGc0hjxztVV2i+ahSUs9BJTgkfik6e1ucx1G71tuxuwO00mLQwGwb1uvfLri7zVEP083kHRk0N9x9y3MX/6dSWjyrJSXSCHB+Mx2lQEBjghEbpoNC3ebGTBGfmolUbdmLuqKCSEpA1jfcNTOWRn8XdiLy/SyyAnQzc425E63AubEBQ3cH+Eo1JJvEJSXkj4BCFN8OTuQ8JArapk+PSippiciLN7E+FYp8kBT06IBhegAFvxjZWLPmIBm8+CpLVklxjRoy0024mvr3cQCHrnrHiTZJUT2NtLW2o4ZyvGLc233vRpv8q2PbOVg==
X-YMail-OSG: dz5ftxYVM1kEkFl0U37vOIWk_dYDpXO974X05DIaG6xAW1TuCZ_gl9xkkH7twtP
	SX1r1n3g.9nzEJdZuvvKaJ85Cn0USDPm59uso4B7iVeWe6VNVRh1aycAh029SR59y9dVP2EzkkHv
	T4cOu9xunA.zcYy7uIG0_yTWIGBNw8pZOFPcWSV_JWlN_spTD_E3F1_NneI4u1Vy2f_WtlMtlpvd
	4qGgTpVgiGl4I9jmHMHlZqvUni6Kkk4NvoCeKlGvXg4KKgYQynb1472Iu.6b_W6sYQ2jSaYwX3R2
	673cgOFB6ktw7aANMYnlmZXC6NoC_gQdcthJ5kmPSuQCHQ3zlWU5xFqKH4B3ptqls3GBWZDloHwf
	.lnYXWvk3IO9HN931wO8iG.tXvZe_0cnKYDVMHuKHykXseLVzPzipSs5CxPnusmB6G4fwJtBhlpo
	Z3afr8bjrnP6QSAFZTzxamCno1teQTdsZaO1rrqHSbrXxmpxdE.ZyWMH7CBYUez_HWJByzs_6b1m
	Yqlue0DBIyaD6bo_pBZr2WRkwuj1zIJYJticIWZP2fM_69Crvq_7tjanjq.5XVBOjoCbch1MtcNt
	Z78TISS7KVUc2r6zBwCj.zKJHwIz0wEW5FFVaPYOix3ydZWljN.M1CcBOaaSdKZ4.3OCINZKtHXt
	WUOGroJUxZI_WVfXuzsVdXD5WBm.ymPTBfrX88KsN72Wanb9_sfk6xkCBqlzk_DRXHbaIuF7c9_m
	TOXfIN4.iP4rLJdrbuUYDPkKyAey53luSc98c.K1IUe1WsoyV.rSvfKZVR4vGbVqFEozxld1cC5Z
	Rop.Wtc8wkqR8kiFfE0rk6XWo673H0YFljaAEGl14zabjyv80WE5nHnN54So1NSpSAvMns8Ji432
	U2sxD5xIx5fjtWyTC9V20MgsGq694JPvT4F1a_JAHxmUC1iZWFb7.5lvpPkNIZ.QDF6y5ArGkVbi
	C4OMd0uiMns7Aj9U4V5qGNSDrau7YrzHUdtpD1D4v1xkPGTM4IiZxzKApi01bEXnRVxKGaOB.Xsi
	665FRcxkFOByY2U0A_wztpS0fbBiLLPQXENdOGYnLHrrtNKkGSN_ls3TUb1zV7UBmxtsqtzxifZM
	Q_XFmQU.qtz9qLhs4_BLfHpCkRTaJvCpDG3EKL8wyVZV9I1QtvJ3d532x4IoF7KjgZu1hGxxo_TM
	uDivRThN3ALnwiPeKh9el.5OAH0Ll6OOijGm5sRBWGDh1CijeVz2NDnOsBvOB4AVlL4e.NWotC0Y
	Sx5h1F7SDPFEhe9T2QlGtSZn9H3t6A8yH.0ejkwJOsGQIaY17V9dkvRYhgHo6FbttLhewxMfm7pi
	.mzJeJVdkxJ_x79Kl4.pYSAY5SraS_UHaVkU251hsN3zmYkKPPRD7C97h1PSP8YblhSmXyRBSAQb
	bpgeHLYazdNCfwuH5_LMWnmC6npwMJCKDft3bRmFGLigCegW1S7qDilAM4zZyy9qGC7qcJ.q_XJm
	91nY9Pg4-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic303.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 15 Oct 2020 10:46:29 +0000
Date: Thu, 15 Oct 2020 10:46:25 +0000 (UTC)
From: Fabio Sbano <fsbano@yahoo.com>
To: "sgrubb@redhat.com" <sgrubb@redhat.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
Message-ID: <66002331.902028.1602758785410@mail.yahoo.com>
In-Reply-To: <1168664034.664987.1602700470374@mail.yahoo.com>
References: <1025996531.618266.1602694304884.ref@mail.yahoo.com>
	<4281677.LvFx2qVVIh@x2>
	<1347666069.660171.1602699215591@mail.yahoo.com>
	<3344292.iIbC2pHGDl@x2>
	<1168664034.664987.1602700470374@mail.yahoo.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============1770140273273253678=="

--===============1770140273273253678==
Content-Type: multipart/alternative; 
	boundary="----=_Part_902027_304457939.1602758785408"

------=_Part_902027_304457939.1602758785408
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

  i am using redhat satellite and it was out of date with version 7.9I inst=
alled a new server with iso 7.9 and everything worked correctly
Sorry,Best Regards,Fabio Sbano
    Em quarta-feira, 14 de outubro de 2020 15:34:30 BRT, Fabio Sbano <fsban=
o@yahoo.com> escreveu: =20
=20
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
  
------=_Part_902027_304457939.1602758785408
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp113e60a5yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div></div>
        <div dir=3D"ltr" data-setdir=3D"false"> <div><div>i am using redhat=
 satellite and it was out of date with version 7.9</div><div>I installed a =
new server with iso 7.9 and everything worked correctly</div><div><br></div=
><div>Sorry,</div></div><div dir=3D"ltr" data-setdir=3D"false">Best Regards=
,</div><div dir=3D"ltr" data-setdir=3D"false">Fabio Sbano</div></div><div><=
br></div>
       =20
        </div><div id=3D"yahoo_quoted_3138857827" class=3D"yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    Em quarta-feira, 14 de outubro de 2020 15:34:30 BRT, Fa=
bio Sbano &lt;fsbano@yahoo.com&gt; escreveu:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div id=3D"yiv0803871557"><div>Off Course,<div id=3D"y=
iv0803871557yMail_cursorElementTracker_1602700379964"><br clear=3D"none"></=
div><div id=3D"yiv0803871557yMail_cursorElementTracker_1602700380097">I'll =
do it tonight<br clear=3D"none"><div id=3D"yiv0803871557yMail_cursorElement=
Tracker_1602700364012"><br clear=3D"none"></div><div id=3D"yiv0803871557yMa=
il_cursorElementTracker_1602700365443">Regards,</div><div id=3D"yiv08038715=
57yMail_cursorElementTracker_1602700374480">Fabio Sbano<br clear=3D"none"><=
br clear=3D"none"><div id=3D"yiv0803871557ymail_android_signature"><a rel=
=3D"nofollow" shape=3D"rect" id=3D"yiv0803871557ymail_android_signature_lin=
k" target=3D"_blank" href=3D"https://go.onelink.me/107872968?pid=3DInProduc=
t&amp;c=3DGlobal_Internal_YGrowth_AndroidEmailSig__AndroidUsers&amp;af_wl=
=3Dym&amp;af_sub1=3DInternal&amp;af_sub2=3DGlobal_YGrowth&amp;af_sub3=3DEma=
ilSignature">Sent from Yahoo Mail on Android</a></div> <br clear=3D"none"> =
<div class=3D"yiv0803871557yqt4955913032" id=3D"yiv0803871557yqt49370"><blo=
ckquote style=3D"margin:0 0 20px 0;"> <div style=3D"font-family:Roboto, san=
s-serif;color:#6D00F6;"> <div>On Wed, Oct 14, 2020 at 3:21 PM, Steve Grubb<=
/div><div>&lt;sgrubb@redhat.com&gt; wrote:</div> </div> <div style=3D"paddi=
ng:10px 0 0 20px;margin:10px 0 0 0;border-left:1px solid #6D00F6;"> On Wedn=
esday, October 14, 2020 2:13:35 PM EDT Fabio Sbano wrote:<br clear=3D"none"=
>&gt; I'm using 7.x with latest update :-(<br clear=3D"none">&gt; Can i reo=
pen the bug?<br clear=3D"none"><br clear=3D"none">Sure. I think you'd proba=
bly want to add your AVC to give a hint.<br clear=3D"none"><br clear=3D"non=
e">-Steve<div class=3D"yiv0803871557yqt1149481007" id=3D"yiv0803871557yqtfd=
75536"><br clear=3D"none"><br clear=3D"none">&gt; ( I turned off selinux fo=
r the auditd to work the halt )<br clear=3D"none">&gt; Best Regards,Fabio S=
bano<br clear=3D"none">&gt; <br clear=3D"none">&gt; Sent from Yahoo Mail on=
 Android<br clear=3D"none">&gt; <br clear=3D"none">&gt;&nbsp;  On Wed, Oct =
14, 2020 at 2:12 PM, Steve Grubb&lt;<a rel=3D"nofollow" shape=3D"rect" ymai=
lto=3D"mailto:sgrubb@redhat.com" target=3D"_blank" href=3D"mailto:sgrubb@re=
dhat.com">sgrubb@redhat.com</a>&gt; wrote:&nbsp; <br clear=3D"none">&gt; He=
llo,<br clear=3D"none">&gt; On Wednesday, October 14, 2020 12:51:44 PM EDT =
Fabio Sbano wrote:<br clear=3D"none">&gt; &gt; My /etc/audit/auditd.conf is=
 configured as below but it is not turning<br clear=3D"none">&gt; &gt; off<=
br clear=3D"none">&gt; &gt; the system<br clear=3D"none">&gt; &gt; <br clea=
r=3D"none">&gt; &gt; ## This file controls the configuration of the audit d=
aemon#<br clear=3D"none">&gt; &gt; local_events =3D yeswrite_logs =3D yeslo=
g_file =3D<br clear=3D"none">&gt; &gt; /var/log/audit/audit.loglog_group =
=3D rootlog_format =3D RAWflush =3D<br clear=3D"none">&gt; &gt; INCREMENTAL=
_ASYNCfreq =3D 50max_log_file =3D 8num_logs =3D 5priority_boost =3D<br clea=
r=3D"none">&gt; &gt; 4disp_qos =3D lossydispatcher =3D /sbin/audispdname_fo=
rmat =3D NONE##name =3D<br clear=3D"none">&gt; &gt; mydomainmax_log_file_ac=
tion =3D ROTATEspace_left =3D 75space_left_action =3D<br clear=3D"none">&gt=
; &gt; SYSLOGverify_email =3D yesaction_mail_acct =3D rootadmin_space_left =
=3D<br clear=3D"none">&gt; &gt; 50admin_space_left_action =3D haltdisk_full=
_action =3D<br clear=3D"none">&gt; &gt; SUSPENDdisk_error_action =3D SUSPEN=
Duse_libwrap =3D yes##tcp_listen_port =3D<br clear=3D"none">&gt; &gt; 60tcp=
_listen_queue =3D 5tcp_max_per_addr =3D 1##tcp_client_ports =3D<br clear=3D=
"none">&gt; &gt; 1024-65535tcp_client_max_idle =3D 0enable_krb5 =3D nokrb5_=
principal =3D<br clear=3D"none">&gt; &gt; auditd##krb5_key_file =3D /etc/au=
dit/audit.keydistribute_network =3D no<br clear=3D"none">&gt; <br clear=3D"=
none">&gt; I believe this bz is relevant:<br clear=3D"none">&gt; <a rel=3D"=
nofollow" shape=3D"rect" target=3D"_blank" href=3D"https://bugzilla.redhat.=
com/show_bug.cgi?id=3D1780332">https://bugzilla.redhat.com/show_bug.cgi?id=
=3D1780332</a><br clear=3D"none">&gt; <br clear=3D"none">&gt; If you update=
 to the 7.9 release, it should work like it is supposed to.<br clear=3D"non=
e">&gt; <br clear=3D"none">&gt; Best Regards,<br clear=3D"none">&gt; -Steve=
<br clear=3D"none"><br clear=3D"none"><br clear=3D"none"><br clear=3D"none"=
><br clear=3D"none"></div> </div> </blockquote></div></div></div></div></di=
v></div>
            </div>
        </div></body></html>
------=_Part_902027_304457939.1602758785408--

--===============1770140273273253678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============1770140273273253678==--


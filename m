Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4989F28E61B
	for <lists+linux-audit@lfdr.de>; Wed, 14 Oct 2020 20:14:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-NWSlmS5FMzOzXhbIy6kZMA-1; Wed, 14 Oct 2020 14:14:06 -0400
X-MC-Unique: NWSlmS5FMzOzXhbIy6kZMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09D50102123F;
	Wed, 14 Oct 2020 18:14:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BC785C1C2;
	Wed, 14 Oct 2020 18:13:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AABDB5810F;
	Wed, 14 Oct 2020 18:13:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09EIDm2S008647 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 14:13:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30A2C105486A; Wed, 14 Oct 2020 18:13:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C55D10657B2
	for <linux-audit@redhat.com>; Wed, 14 Oct 2020 18:13:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1C76805F5D
	for <linux-audit@redhat.com>; Wed, 14 Oct 2020 18:13:45 +0000 (UTC)
Received: from sonic303-22.consmr.mail.ne1.yahoo.com
	(sonic303-22.consmr.mail.ne1.yahoo.com [66.163.188.148]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-450-FGDc6MxINAaDz8fC-l4oMQ-1;
	Wed, 14 Oct 2020 14:13:42 -0400
X-MC-Unique: FGDc6MxINAaDz8fC-l4oMQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1602699222; bh=okVVUQ3PVBGJvSTY7zDrdPXmTla+nPMyJ1jeVsjlbuf=;
	h=Date:From:To:Subject;
	b=Igd4lLfJlOsGS3IRq5Ph71bkm+q2CUIfUHJn8KMS6wiMeWa1KtqHSRxjF2edLwjbCcL87ZAa56YkgpIqpNbXhnyMYrryZRfyBFKWe3Up/qDDONu5nEg1SQklL1mNKaVv3qpTV8Xu7MM8cjtH3eMnE/L71M6j8yyTPK4NfCeN/Uy85lTUPmEv39CzReyyiekWrPC/Dzr3tF4gDcCtfoL01W7LqlGDByGrsHZkOU5h6T/gIs7HZ3RakUG2phlH07E9KuAVj9XZu+iqYiISQ7D+ybpvgUCl9VTpZcs4UTmUzWV5JiGbMYKnz7/Qa1h36uRikAsweDqio8YPtsaif1edBA==
X-YMail-OSG: igP_lzIVM1nJ9mR3C.Q7MCwqwyf4ZC.hPydulP42VqEIivYb61twmXV76vYr9j8
	ngWGnnSaG6pAaKpiMkAnFyye0PBfjbJESeumSCIeZ_mSIONIUU6pvse9v5UeocHT05y7DHQfp8LO
	qG.Ge8fWdhd7ayOfEu.YGzhGq.e1z9K1zZ.uPcZ4jv3Xd7tKEsQSjeKMt_4pMCTrvYUvQLMjcIQ0
	JRCvVuMcIl0eii4Lr3F9qdsjXw0A5.WF5Kk9bQX21BKvcrVmEPQZI63TwNqeJ5UNYLNbVdGxmzy6
	xOtPA4FVH4.3b73kCMWeGk_vL.zWlkysQnDLhNSwearpUjPTVLNBVTtEn.IPHU_xSZuxNhbKxAd9
	tDFD1VaR9UzHAKceMbr3rruWP82rSC.5hRA1_.zJl5zUpdqgRPzUZDD0KPDMLbFNFEgYVpzbTfBl
	ax8Cd1XJGzWfnMZsTrBvTvZEL6hBhL1lf3A_gjMYWXItW5v.W3xbNBbTh3lY0L44rvb.psNKvwuE
	uWKUB1AJlqowPvEo8XR79yNTkDobnJ9RhwrVneIshJKJlmwo4Gc.0BDZF2nIr_E8wXsJYbkmHcO6
	nHggLs_aFi3Sj_iD.1.1XOiyHSQ9YnmQWXt4nMEjqLKOdkKmsq0MaAfeQNOSW_3bwSqVuaIsWM1S
	xZbew_w274z.qIhiTu8Uho_4ZUF2L7Zmh0kfH51KzEaNS_FW8K7ShrtJ1B3pXkHeeJM33PWLmPtO
	ZUAom8kbmHlBF4gPSNgbYnq2J3w2TG0qiwPSGnWwjREBPQ4iWrwcDKz.hVyHJAjOCyjHpfDI0Hm6
	eRWPN00YqtcDT76O6aagmkq9UL_NpRbmWw9hJCPcys2M53rY_a1Ht4a8JOnF.3u4KwM_FNZ6LVTk
	zsrMj5HmF_.QRfmuu6xhQsLJntDKDUWPL3rf2IOWEPas4hRpxrBx9z8JeUJQfylFWle1ZocdF0r9
	3E8gZ7Oqgzl6Cpnk15nCKIDvhvFzfBzaUONKIrCWosVZ8mTowSV5xydVKSI_znVWV5n9wIFt3.sj
	dz9tWnc8UP59OnN.ckQK99pupAzBpmyJjKaddAeHKNqRkmkOHWjjq_C7VNBtyrrZhyctqElL9l_i
	BuNkRbryLHUSKBng2DKFEpDcvX89h0aRsPd0yA7TkyM9jpispM6lKKwgifASz4l6D1dQwA84wNF2
	7neDwVK93DAxPdAQRXtZYlfSbZmohMgTiXSoHsBCd2RHxMMhp7WdjPtjPs5._eEA0OiBd4X.xOMS
	tMu2OtomZZU52NXBF5HP1qLQ4nKGMbtFlLVqGsKASWyB1zaV_VKseLOiIfg7Ny.LcLexcBKgk33p
	9vGjXqFFv.bTg_DFWK9Z2nsqCkygazkrzghUlVmYq.LFx_s12HmhAOpGNvU2mG956R8rTkFgdOKx
	.LYq4mhcSwuqZSN8D2omB.VOiTwxitMcyvptXI6CbD5mKOezLr.pq17dpQ4ZPOwoT_L8..0F8DXg
	.WBHzqJIxHeUqrdMP5C4JeITdE4PAuWQXWoOyGpCCnb.G5.icu8evuq_zYYOLcbKw.WKiiGliB_5
	t.jmZqbRouGE2I642AkcGOeabVav5qFhlypLX8IX6BNZiUOnNzxoHYOo-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic303.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 14 Oct 2020 18:13:42 +0000
Date: Wed, 14 Oct 2020 18:13:35 +0000 (UTC)
From: Fabio Sbano <fsbano@yahoo.com>
To: sgrubb@redhat.com, Steve Grubb <sgrubb@redhat.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
Message-ID: <1347666069.660171.1602699215591@mail.yahoo.com>
In-Reply-To: <4281677.LvFx2qVVIh@x2>
References: <1025996531.618266.1602694304884.ref@mail.yahoo.com>
	<1025996531.618266.1602694304884@mail.yahoo.com>
	<4281677.LvFx2qVVIh@x2>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============1808334297043966628=="

--===============1808334297043966628==
Content-Type: multipart/alternative; 
	boundary="----=_Part_660170_1163691776.1602699215590"

------=_Part_660170_1163691776.1602699215590
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I'm using 7.x with latest update :-(
Can i reopen the bug?
( I turned off selinux for the auditd to work the halt )
Best Regards,Fabio Sbano

Sent from Yahoo Mail on Android 
 
  On Wed, Oct 14, 2020 at 2:12 PM, Steve Grubb<sgrubb@redhat.com> wrote:   Hello,

On Wednesday, October 14, 2020 12:51:44 PM EDT Fabio Sbano wrote:
> My /etc/audit/auditd.conf is configured as below but it is not turning off
> the system
> 
> ## This file controls the configuration of the audit daemon#
> local_events = yeswrite_logs = yeslog_file =
> /var/log/audit/audit.loglog_group = rootlog_format = RAWflush =
> INCREMENTAL_ASYNCfreq = 50max_log_file = 8num_logs = 5priority_boost =
> 4disp_qos = lossydispatcher = /sbin/audispdname_format = NONE##name =
> mydomainmax_log_file_action = ROTATEspace_left = 75space_left_action =
> SYSLOGverify_email = yesaction_mail_acct = rootadmin_space_left =
> 50admin_space_left_action = haltdisk_full_action =
> SUSPENDdisk_error_action = SUSPENDuse_libwrap = yes##tcp_listen_port =
> 60tcp_listen_queue = 5tcp_max_per_addr = 1##tcp_client_ports =
> 1024-65535tcp_client_max_idle = 0enable_krb5 = nokrb5_principal =
> auditd##krb5_key_file = /etc/audit/audit.keydistribute_network = no
 
I believe this bz is relevant:
https://bugzilla.redhat.com/show_bug.cgi?id=1780332

If you update to the 7.9 release, it should work like it is supposed to.

Best Regards,
-Steve


  

------=_Part_660170_1163691776.1602699215590
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I'm using 7.x with latest update :-(<div id=3D"yMail_cursorElementTracker_1=
602699047480"><br></div><div id=3D"yMail_cursorElementTracker_1602699047656=
">Can i reopen the bug?</div><div id=3D"yMail_cursorElementTracker_16026990=
86627"><br></div><div id=3D"yMail_cursorElementTracker_1602699109520">( I t=
urned off selinux for the auditd to work the halt )</div><div id=3D"yMail_c=
ursorElementTracker_1602699101704"><br></div><div id=3D"yMail_cursorElement=
Tracker_1602699086800">Best Regards,</div><div id=3D"yMail_cursorElementTra=
cker_1602699096073">Fabio Sbano<br><br><div id=3D"ymail_android_signature">=
<a id=3D"ymail_android_signature_link" href=3D"https://go.onelink.me/107872=
968?pid=3DInProduct&amp;c=3DGlobal_Internal_YGrowth_AndroidEmailSig__Androi=
dUsers&amp;af_wl=3Dym&amp;af_sub1=3DInternal&amp;af_sub2=3DGlobal_YGrowth&a=
mp;af_sub3=3DEmailSignature">Sent from Yahoo Mail on Android</a></div> <br>=
 <blockquote style=3D"margin: 0 0 20px 0;"> <div style=3D"font-family:Robot=
o, sans-serif; color:#6D00F6;"> <div>On Wed, Oct 14, 2020 at 2:12 PM, Steve=
 Grubb</div><div>&lt;sgrubb@redhat.com&gt; wrote:</div> </div> <div style=
=3D"padding: 10px 0 0 20px; margin: 10px 0 0 0; border-left: 1px solid #6D0=
0F6;"> Hello,<br clear=3D"none"><br clear=3D"none">On Wednesday, October 14=
, 2020 12:51:44 PM EDT Fabio Sbano wrote:<br clear=3D"none">&gt; My /etc/au=
dit/auditd.conf is configured as below but it is not turning off<br clear=
=3D"none">&gt; the system<br clear=3D"none">&gt; <br clear=3D"none">&gt; ##=
 This file controls the configuration of the audit daemon#<br clear=3D"none=
">&gt; local_events =3D yeswrite_logs =3D yeslog_file =3D<br clear=3D"none"=
>&gt; /var/log/audit/audit.loglog_group =3D rootlog_format =3D RAWflush =3D=
<br clear=3D"none">&gt; INCREMENTAL_ASYNCfreq =3D 50max_log_file =3D 8num_l=
ogs =3D 5priority_boost =3D<br clear=3D"none">&gt; 4disp_qos =3D lossydispa=
tcher =3D /sbin/audispdname_format =3D NONE##name =3D<br clear=3D"none">&gt=
; mydomainmax_log_file_action =3D ROTATEspace_left =3D 75space_left_action =
=3D<br clear=3D"none">&gt; SYSLOGverify_email =3D yesaction_mail_acct =3D r=
ootadmin_space_left =3D<br clear=3D"none">&gt; 50admin_space_left_action =
=3D haltdisk_full_action =3D<br clear=3D"none">&gt; SUSPENDdisk_error_actio=
n =3D SUSPENDuse_libwrap =3D yes##tcp_listen_port =3D<br clear=3D"none">&gt=
; 60tcp_listen_queue =3D 5tcp_max_per_addr =3D 1##tcp_client_ports =3D<br c=
lear=3D"none">&gt; 1024-65535tcp_client_max_idle =3D 0enable_krb5 =3D nokrb=
5_principal =3D<br clear=3D"none">&gt; auditd##krb5_key_file =3D /etc/audit=
/audit.keydistribute_network =3D no<br clear=3D"none"> <br clear=3D"none">I=
 believe this bz is relevant:<br clear=3D"none"><a shape=3D"rect" href=3D"h=
ttps://bugzilla.redhat.com/show_bug.cgi?id=3D1780332" target=3D"_blank">htt=
ps://bugzilla.redhat.com/show_bug.cgi?id=3D1780332</a><br clear=3D"none"><b=
r clear=3D"none">If you update to the 7.9 release, it should work like it i=
s supposed to.<div class=3D"yqt6548723862" id=3D"yqtfd27656"><br clear=3D"n=
one"><br clear=3D"none">Best Regards,</div><br clear=3D"none">-Steve<div cl=
ass=3D"yqt6548723862" id=3D"yqtfd85026"><br clear=3D"none"><br clear=3D"non=
e"><br clear=3D"none"></div> </div> </blockquote></div>
------=_Part_660170_1163691776.1602699215590--

--===============1808334297043966628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============1808334297043966628==--


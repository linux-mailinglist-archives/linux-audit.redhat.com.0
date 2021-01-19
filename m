Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1E96F2FBE9F
	for <lists+linux-audit@lfdr.de>; Tue, 19 Jan 2021 19:13:16 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-GjLQf342PvWFSydeRafGwA-1; Tue, 19 Jan 2021 13:13:12 -0500
X-MC-Unique: GjLQf342PvWFSydeRafGwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77C1D190D340;
	Tue, 19 Jan 2021 18:13:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 511D65D9DD;
	Tue, 19 Jan 2021 18:13:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CAEF4A7C6;
	Tue, 19 Jan 2021 18:12:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JICWep013380 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 13:12:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 688CE110F0B4; Tue, 19 Jan 2021 18:12:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6380F110F0B2
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 18:12:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C714A1875050
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 18:12:29 +0000 (UTC)
Received: from sonic311-24.consmr.mail.ne1.yahoo.com
	(sonic311-24.consmr.mail.ne1.yahoo.com [66.163.188.205]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-21-b29XeT2_MO-rghYzd4WeSA-1;
	Tue, 19 Jan 2021 13:12:00 -0500
X-MC-Unique: b29XeT2_MO-rghYzd4WeSA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1611079920; bh=MJ5sT3V0jRLkSX3dxjSm15tHddvX68d9SFcPg1L6mNc=;
	h=Date:From:To:Subject:From:Subject:Reply-To;
	b=jhB7EBmPMaNAlH3RFzYOvFfl2F9dExDBjnNQXP2Etcy91wSSxidk+P7W1DM2lgCs8BVour6CoyAT+ebIDovLWQQbHHZn+LTa20AEy92686dXasLFzt0ep6gBq2/mNlBeoydbAWfar65RV5rEdYHvexHU8KxE9rceJa6gtCzfGuYkF83ZS1I0Oe+hjlBcvoj/P2thGoRNfiBVNq2KbVUOIngAG640/C3StA8X4RibFug5/9ujxem+g2i2M6udaxhraWEbHWbQA/DkuXSd+WlPFnByr4zfs0V5XF2p8ldWBTx3zH2LBnYIeLOCvvEu1gK0TxkDJhifoGCtH6YFCB3y6A==
X-YMail-OSG: oYefuLQVM1nZPqXJj0x4LxC09Tc16Vri1UMJIektU3Rm33Avc04d01pHvzlM1nI
	jEsbkf3h0ZKtUaw_L51F1EpgAP7YMlUe5qM7i12BI8MTmqoQrcul8LbD.q79QPisVginpaVlhodp
	Sd7RyxDIqZIXPIsSVC.olPTFENJwBqjKl2tMREhYkazPUjmLxawEi1.YexozqG_IbidCy7_AmgL3
	...VH8zHJhDEFIgx1u_BstToyrTCbX4TdJ15OpnYeXBxYlguW6bbKjM4HvJDFCN.QznKk6E1kJ6q
	8m84D58nOHIZHGPmdtShIFOT0TDDktSZupIwY0A_5EM9Jx9sTARmAytG1L9_CmCJvucg5k1y424g
	WUf0LjfWvDb0OIlrirD9Ea0sNYHL19gmlCfZ8mXwOQHEdz1_6_qQlSiKubzBZzYmFgGV8At54WUf
	vidcH0bLQs4kld59X9AzaQ69uujIAu3jJPqSG5ePdD0pgGf4ZvyEjnkDiyUH5lml3GGqnBuuJDYi
	1zPudvERe4UJ3rH1bnFR6PrfEXdumJMKA4qORvOi2ERb_pM_9pku20obbwi_SKSLu20S3XsaWB6v
	45RT0XKFexOR8NNVQLWVvzhNxNkanZdjDEEIIDphHpSrICo.oh2MEpZKFbt4bTZbdcCK_5IVklE4
	lrg9V1NfrAvQEj.25KNl.JpeFZm2Rh.3w3C5Ad1KDKyDQbjuJRooUxcrvHF6oeaMS1GiQQJMxYrM
	K8N0lCP8fj6fR3zi_k5FszD6LCpgR2ut.9hAo2IwKCmyJeD_OOrNSyE4a1EzRy98kMNeXzG89_55
	1vMte5Efmfh6OBKPukIFNfSZ0r43elbtfAbQ0okshG9gvpyOo9vEAgDTCyCGDr02OnJPoGuNUeWf
	9Io1JNFwWkJuEh_Jm5q4luZdAEoZ8kSFgNd5Oq9S0k.5ym1bQGktt_NyF4e2OYt7PH_YmhO4_kBB
	hECkOVaS4883sMfZisPoKtf8cBEn.9AlA22qIwjFgFyJD6hY5G6w8NyvQUdwXD5Gzj89BOX9cC_n
	Oq9m1rwWNpIjTnfDXwwej1H4zvr88wan3MUBRN3ie.mYlK.jx0Q5W0UzcOQSzyZDjTREOqVQtFjz
	MfANf0v82BB.C.a3bOz7dxY7RqnaGO2xWj4GhVgFpqX4rPXOl15RMndQHG4kQWgaXmjaMDUE4Y1D
	gSzelbIofE7D8xM.xHSWj3DN.AFOhOgiRNDWk6NOhjLNPKGuoMsaqy9kG4UQwQ96bs.23aTpKa44
	.JKZclUc3o3sMYwa0mml8OCixWy9b6ta.d0rHcj9QWtB1eVEbOQa0eoKgChs5NOMB2La2Sn4bBGh
	ND3xU1vKl30WNLnx6Ocl95DRpDKJmrZ8DC.UxZfgzntNmf8fyf570hvOceVjARwLsO.tZIVgx5zW
	32Hm9IaYERImn8HkadIuwWcApU0Yjwx_qF.1s7OzPjh.rQSvSV75Xgzg4dISlj3X40qe.vTyz6tq
	gBnhP1v48f75FZrEmwcXsN2j23CZ0rjJ6jSJjQu_qCE9avUv2YFCM92.k.NvO6XuAt7.UBf9Yx1d
	jRv7ClusQT974worRJDulTvOgZMjiA..TAq9xYolMBuvMp6eePfPamOlIEZlsWroySjpALiQNfaD
	D_Iw5Bs2BEuy_nYwXp.noSa_QoVZG0FBMl5QDOKx6tlNSbOXMcB6X1MG.OsWU1mfqLImyBqc7S7x
	vZltvpjjxhhrJgo7Gw5stYoBagum2Cn4SoKdSYo3HoLMxP5qogIaNhhOKLLPrabMocwGNtfIzCHB
	xUIz02X5v71CtNS2eibjjkToqAyMO1mMEb1rqoxufhEENQAl_NLow4_L3Vx3DGX_42QUqGjTxlgB
	HcaE1EvuhtozE97G_.Tpa9ms44crxKLTo0a1MDqp0FHan3IahjGwK83sSc4hBy3w5TzpJyYWEbTc
	5pHUGMuW.79ZUIDy63y1qkD49nlKMTh3F.eAexS1wKGGdzRZJjmMgcHY1OhZB0w4aGvS4W1XU5pk
	PN7eNQEnkpo_Kmt91I741P5zedTTTjE4uXYT6cqCz9mlgjZY5lPEe.tMSf5lliEr_SuP41rrWSB0
	YaABwE3_N0aPShWvLNH_AAWtO2UPa2oB_CYMHOkx90w_BJn6ycNKU.ZE7aZBrIQZEpZB48vDbHQR
	SRP07GSY8LJG8OpwPt7PoCYAhABPiJtalNDBCc3_n62yQRLh2oy7AppBFVls_xsU6AY0jvIxp3kr
	.BVeY9H4ZGkPti4781gZncanoIffV6FFi9VPVO2vUJhC9jakfQC1ebp.4RcCIDoLF76bekxZhqQa
	9amwoh91_3ycjbtAYinhu8FoLCEavMw7SVJTCQoi_MQQBGjrreHbeT8KP.8LKUqa0h8btVYhgqZg
	g1IMRoQ3dlNo7JYPMfkQI9hGwFRJjKiAya78N.e9U9b8cznW9_Jkvxe6zPTzpNaVyOhNVUFPZag4
	NTA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic311.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 19 Jan 2021 18:12:00 +0000
Date: Tue, 19 Jan 2021 18:11:56 +0000 (UTC)
From: Joe Wulf <joe_wulf@yahoo.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	Steve Grubb <sgrubb@redhat.com>
Message-ID: <2025971311.1108480.1611079916924@mail.yahoo.com>
In-Reply-To: <2759467.e9J7NaK4W3@x2>
References: <61239576.993577.1611062133080.ref@mail.yahoo.com>
	<61239576.993577.1611062133080@mail.yahoo.com>
	<2759467.e9J7NaK4W3@x2>
Subject: Re: AuditRule Questions
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
Content-Type: multipart/mixed; boundary="===============8361664409839520739=="

--===============8361664409839520739==
Content-Type: multipart/alternative; 
	boundary="----=_Part_1108479_1649260802.1611079916922"

------=_Part_1108479_1649260802.1611079916922
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 Steve,
On Tuesday, January 19, 2021, 11:57:03 AM EST, Steve Grubb <sgrubb@redhat.c=
om> wrote: =20
 > On Tuesday, January 19, 2021 8:15:33 AM EST Joe Wulf wrote:
> > 1. In audit rules 2.8.5 (front portion of the rules):> > > > ## Unsucce=
ssful file access (any other opens) This has to go last.> > -a always,exit =
-F arch=3Db32 -S> > open,creat,truncate,ftruncate,openat,open_by_handle_at =
-F exit=3D-EACCES-a> > always,exit -F arch=3Db64 -S> > open,creat,truncate,=
ftruncate,openat,open_by_handle_at -F exit=3D-EACCES-a> > always,exit -F ar=
ch=3Db32 -S> > open,creat,truncate,ftruncate,openat,open_by_handle_at -F ex=
it=3D-EPERM-a> > always,exit -F arch=3Db64 -S> > open,creat,truncate,ftrunc=
ate,openat,open_by_handle_at=C2=A0 -F exit=3D-EPERM> > Whereas in audit rul=
es 3.0, the same portion of the same rules looks like:> > -a always,exit -F=
 arch=3Db32 -S> > open,creat,truncate,ftruncate,openat,open_by_handle_at -F=
 exit=3D-EACCES-a> > always,exit -F arch=3Db32 -S> > open,creat,truncate,ft=
runcate,openat,open_by_handle_at -F exit=3D-EPERM-a> > always,exit -F arch=
=3Db64 -S> > open,truncate,ftruncate,creat,openat,open_by_handle_at -F exit=
=3D-EACCES-a> > always,exit -F arch=3Db64 -S> > open,truncate,ftruncate,cre=
at,openat,open_by_handle_at=C2=A0 -F exit=3D-EPERM> > > > The ordering of t=
he syscalls differs between the two, as well as the> > sequential order of =
the rules themselves. I better understand that the> > first audit-rule matc=
hed 'wins'.-=C2=A0 Please help me understand the reason> > for the change i=
n sequence, but also for the change in the order of the> > syscalls (i.e. b=
etween 2.8.5 and 3.0).> > There were several 3.0 alpha releases. I'm not su=
re which one you are calling > 3.0. Because I can't find an exact match. Ba=
sed on the text above, I do not > see the syscall ordering changed at all. =
The only thing that I see is in > 2.8.5 they are grouped by exit code where=
as 3.0 is grouped by arch. Since > this group of rules all have the same ke=
y, they are working as a team. That > means that what matters is the placem=
ent of this group of rules relative to > other groups of rules is what matt=
ers. In both cases a syscall can ever only > match one of them - the exit c=
ode either is or isn't EPERM, it either is or > isn't b32.>=20
> <snip>>=20
> -Steve
Steve,
Thank you for the wealth of feedback.=C2=A0 All very useful.=C2=A0 Thank yo=
u.
I pulled v3.0 of the audit rules out of RHEL 8.3.
In the sections I referenced, for v2.8.5 the syscalls for b64 are in the or=
der of:open,create,truncate,ftruncate .....
in v3.0, they are in the order of:open,truncate,ftruncate,create ....
Since, as you say above, the audit rule can only ever match one syscal.... =
I'm now understanding the actual order of the syscall's is no longer releva=
nt on such lines (from an auditing perspective)?
In general for a any given system being run and audited by either set of ru=
les, the end result I suspect would be the same.The challenge could come in=
 when certain vulnerability tools assess the system, and do so by seeking a=
n exact match of rule syntax.
Thank you.
R,-Joe Wulf
  
------=_Part_1108479_1649260802.1611079916922
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydpf450c62fyahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div>
        <div dir=3D"ltr" data-setdir=3D"false">Steve,</div><div dir=3D"ltr"=
 data-setdir=3D"false"><br></div>On Tuesday, January 19, 2021, 11:57:03 AM =
EST, Steve Grubb &lt;sgrubb@redhat.com&gt; wrote:
                </div></div><div id=3D"ydp6589adcayahoo_quoted_1471714199" =
class=3D"ydp6589adcayahoo_quoted"><div style=3D"font-family:'Helvetica Neue=
', Helvetica, Arial, sans-serif;font-size:13px;color:#26282a;">
               =20
                <div><br></div>
                <div><div dir=3D"ltr" data-setdir=3D"false">&gt; On Tuesday=
, January 19, 2021 8:15:33 AM EST Joe Wulf wrote:<br clear=3D"none"><div><s=
pan>&gt; </span>&gt; 1. In audit rules 2.8.5 (front portion of the rules):<=
/div><div><span>&gt; </span>&gt; </div><div><span>&gt; </span>&gt; ## Unsuc=
cessful file access (any other opens) This has to go last.</div><div><span>=
&gt; </span>&gt; -a always,exit -F arch=3Db32 -S</div><div><span>&gt; </spa=
n>&gt; open,creat,truncate,ftruncate,openat,open_by_handle_at -F exit=3D-EA=
CCES-a</div><div><span>&gt; </span>&gt; always,exit -F arch=3Db64 -S</div><=
div><span>&gt; </span>&gt; <u><b>open,creat,truncate,ftruncate,</b></u>open=
at,open_by_handle_at -F exit=3D-EACCES-a</div><div><span>&gt; </span>&gt; a=
lways,exit -F arch=3Db32 -S</div><div><span>&gt; </span>&gt; open,creat,tru=
ncate,ftruncate,openat,open_by_handle_at -F exit=3D-EPERM-a</div><div><span=
>&gt; </span>&gt; always,exit -F arch=3Db64 -S</div><div><span>&gt; </span>=
&gt; open,creat,truncate,ftruncate,openat,open_by_handle_at&nbsp; -F exit=
=3D-EPERM</div><div><span>&gt; </span>&gt; Whereas in audit rules 3.0, the =
same portion of the same rules looks like:</div><div><span>&gt; </span>&gt;=
 -a always,exit -F arch=3Db32 -S</div><div><span>&gt; </span>&gt; open,crea=
t,truncate,ftruncate,openat,open_by_handle_at -F exit=3D-EACCES-a</div><div=
><span>&gt; </span>&gt; always,exit -F arch=3Db32 -S</div><div><span>&gt; <=
/span>&gt; open,creat,truncate,ftruncate,openat,open_by_handle_at -F exit=
=3D-EPERM-a</div><div><span>&gt; </span>&gt; always,exit -F arch=3Db64 -S</=
div><div><span>&gt; </span>&gt; open,truncate,ftruncate,creat,openat,open_b=
y_handle_at -F exit=3D-EACCES-a</div><div><span>&gt; </span>&gt; always,exi=
t -F arch=3Db64 -S</div><div><span>&gt; </span>&gt; <u><b>open,truncate,ftr=
uncate,creat,openat,open_by_handle_at</b></u>&nbsp; -F exit=3D-EPERM</div><=
div><span>&gt; </span>&gt; </div><div><span>&gt; </span>&gt; The ordering o=
f the syscalls differs between the two, as well as the</div><div><span>&gt;=
 </span>&gt; sequential order of the rules themselves. I better understand =
that the</div><div><span>&gt; </span>&gt; first audit-rule matched 'wins'.-=
&nbsp; Please help me understand the reason</div><div><span>&gt; </span>&gt=
; for the change in sequence, but also for the change in the order of the</=
div><div><span>&gt; </span>&gt; syscalls (i.e. between 2.8.5 and 3.0).</div=
><div><span>&gt; </span></div><div><span>&gt; </span>There were several 3.0=
 alpha releases. I'm not sure which one you are calling </div><div><span>&g=
t; </span>3.0. Because I can't find an exact match. Based on the text above=
, I do not </div><div><span>&gt; </span>see the syscall ordering changed at=
 all. The only thing that I see is in </div><div><span>&gt; </span>2.8.5 th=
ey are grouped by exit code whereas 3.0 is grouped by arch. Since </div><di=
v><span>&gt; </span>this group of rules all have the same key, they are wor=
king as a team. That </div><div><span>&gt; </span>means that what matters i=
s the placement of this group of rules relative to </div><div><span>&gt; </=
span>other groups of rules is what matters. In both cases a syscall can eve=
r only </div><div><span>&gt; </span>match one of them - the exit code eithe=
r is or isn't EPERM, it either is or </div><div><span>&gt; </span>isn't b32=
.</div><div dir=3D"ltr" data-setdir=3D"false"><span><span>&gt; </span><br><=
/span></div><div><span>&gt; </span>&lt;snip&gt;</div><div dir=3D"ltr" data-=
setdir=3D"false"><span>&gt; </span><br></div><div><span>&gt; </span>-Steve<=
/div><div class=3D"ydp6589adcayqt2394887830" id=3D"ydp6589adcayqtfd15459" d=
ir=3D"ltr" data-setdir=3D"false"><br clear=3D"none"><div>Steve,</div><div><=
br></div><div><div dir=3D"ltr" data-setdir=3D"false">Thank you for the weal=
th of feedback.&nbsp; All very useful.&nbsp; Thank you.</div><div dir=3D"lt=
r" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">I=
 pulled v3.0 of the audit rules out of RHEL 8.3.</div><div dir=3D"ltr" data=
-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">In the s=
ections I referenced, for v2.8.5 the syscalls for b64 are in the order of:<=
/div><div dir=3D"ltr" data-setdir=3D"false"><u><b>open,create,truncate,ftru=
ncate</b></u> .....</div><div dir=3D"ltr" data-setdir=3D"false"><br></div><=
div dir=3D"ltr" data-setdir=3D"false">in v3.0, they are in the order of:</d=
iv><div dir=3D"ltr" data-setdir=3D"false"><u><b>open,truncate,ftruncate,cre=
ate</b></u> ....</div><div dir=3D"ltr" data-setdir=3D"false"><br></div>Sinc=
e,
 as you say above, the audit rule can only ever match one syscal.... I'm no=
w=20
understanding the actual order of the syscall's is no longer relevant on su=
ch lines (from an auditing perspective)?</div><div><br></div><div dir=3D"lt=
r" data-setdir=3D"false">In general for a any given system being run and au=
dited by either set of rules, the end result I suspect would be the same.</=
div><div dir=3D"ltr" data-setdir=3D"false">The challenge could come in when=
 certain vulnerability tools assess the system, and do so by seeking an exa=
ct match of rule syntax.</div><div dir=3D"ltr" data-setdir=3D"false"><br></=
div><div dir=3D"ltr" data-setdir=3D"false">Thank you.</div><div dir=3D"ltr"=
 data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">R,<=
/div><div dir=3D"ltr" data-setdir=3D"false">-Joe Wulf<br></div></div></div>=
</div>
            </div>
        </div></body></html>
------=_Part_1108479_1649260802.1611079916922--

--===============8361664409839520739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============8361664409839520739==--


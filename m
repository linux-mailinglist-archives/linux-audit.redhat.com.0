Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 47B142FB645
	for <lists+linux-audit@lfdr.de>; Tue, 19 Jan 2021 14:16:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-c58lhtkCMx2EEtcUQwpHTg-1; Tue, 19 Jan 2021 08:16:21 -0500
X-MC-Unique: c58lhtkCMx2EEtcUQwpHTg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA1788144F9;
	Tue, 19 Jan 2021 13:16:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA9CC5C8AA;
	Tue, 19 Jan 2021 13:16:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E729B1809C9F;
	Tue, 19 Jan 2021 13:16:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JDFe9S008680 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 08:15:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A60EE8A4D5; Tue, 19 Jan 2021 13:15:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BFB294620
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 13:15:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2567C811E84
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 13:15:38 +0000 (UTC)
Received: from sonic315-20.consmr.mail.ne1.yahoo.com
	(sonic315-20.consmr.mail.ne1.yahoo.com [66.163.190.146]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-283-DW0CyGHCOM6tOrSKbTu7cw-1;
	Tue, 19 Jan 2021 08:15:35 -0500
X-MC-Unique: DW0CyGHCOM6tOrSKbTu7cw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1611062134; bh=ND66DXlh/bbLw5z5przeWYJgZ0xSgPJGjOhRL8uarrG=;
	h=Date:From:To:Subject:From:Subject:Reply-To;
	b=Y2BC+jaRYUj3BtzVOYHJ0dOJ8/QnXlYz29dLJOINexu0+eD+09NHIgUCuOqJkFLpr929Z3mQTgjUTx82JVhQMW6eBqt4KdfaZAYAu5qrNKRJ9h1qttQM3/Z2HME+AE8qBdKBDSH4qUrzCURnZiUaumKaeWiXdUejSHWNRnPmQlEp2UXBZzZ6VlCq0dGFc0FxiBZ+GrVMxMgfkAPyTuwV0WlVUavzOblwgv1z7uN4kJvK7dRAtdGcsU3TyrW2j91tiQytaf2oIxlq9xXITYNxl7OWcx5EJPgWymoiGF2SZyY3rUnR5O+Rqwas3+ZeAl/Fq0gFNnGIk2jh/TNviCC+wA==
X-YMail-OSG: wbrlEH0VM1mvzRnI5L_z7qGBDzt_uRRLksEZiTSWM.1t.ABryuyJyiFzA_.bq5I
	xU4csWF5807Dra9MtsfJ2yGTRbvvZ4nFqpz_TzzDYwVFJEQe7uhDpnX8xhOvmNl7AJKh5jyG67Au
	a1QIhNOPI1hDChroFSrY.uCDotKvtWVbBVGn4v721K6APB2DYfhh5_skD_KL1.eKmMSb5W4aC1.s
	7W4Y0osxzyvNiLNxsJ9gZMRvTSDY1tsoBlMvskC_LJJYfpNl81WKp01E_dDVqx39x1rwqrkExkSN
	tqlROVYuhfpSglUio3MtUAzdhkQ55B7rX5xPHAC9oU8wEOlGM8IZ170_9O5bOCimWSw7SPpLYw3d
	0etkEwyt_ZbRR7xSICjwmwWbLBccm9pTr.drg2ycssro74wxQKc_aw4.1iEvADJr3CDflv6n5778
	soQ3eX2ZVSUJtkewbgrus4qA2VeEAyMY7DSzKrLNVGIIQlDxbkLCmoddEqVfek43xih4UklWOMJL
	Xg3nHKdBL.Rwdtg_hC2_i_qiRDVdM9LcvTfJRZNihM7uGeZjegQWdwtKyP8UM3Efliga9s8tTzZI
	V.fJi_v2T6HZTmmyHLxXZFiCk_JuWnJ_76HQDYmZC2mPhM3BzF00.7Ow2idhDTDWPa1rpxAenF_b
	aIF5LjY.xffH9C7uKSmD23KgCHah9xbsrkxih8vZ3qpAfOzlWbhSnmE1KDZ_3T1Vs2aRlWGOoKvf
	htHm9BwJ3ZUek3Y65veiL3cbUumJEsmmSaLLl0fho2RXHt8eQv1had9nvG0RcJ2HnVpRUsrKUOyG
	99HqzJvgsxYm7k27P0.2sSRkP0qUSggRowKav1PSI4cU5CmwkHAZl6mNuBJ8vIV2gxq3KpNIuA37
	PduB62RbrylFqDPY8lf97IAfei9Na4DOPPshZTIEUNYd_Yt_7UMh7G_P.899RIruOFPXc.0FpkBY
	ZbRUF5rPNbtW8_lSwp0k_qE1IUqRWbvz3jtl5JSGFgrPKzTqwJ8Zz0xi_BwG9N10dGj9mZOz.NJR
	sRyT7tIluuvZsGv83oa4ShPEVag5mV.Dw9WY58HBybS_axQ4zIl1EvYAn9UeZQXT4hbfuoqwoYjO
	mf_12aLRxWGmxFYyuS3Fq1iBldvmRBqtzgzqd4Gaww91izm6jeU5dl4LTGHuKDHlYp1xOwKt9AP5
	I9jbSigcGwkrPPymw3AdEPWNbeIqIj4l1Iu2QaO3AnIeJd.0EYtEgZjEEikNNdw.Qh7PyFERnwXw
	hIrsczBqZTbn5FNpQjPNLdUsKN9u5SUSDOTKkLABBnIhdoWpR5cyggW_DzCL1hCjM2SagMT0I21N
	c6EaJtmFQIAwVBiuFbUKhQmCMQD0nR.YO4ZNZ0r7vAiz8LJojZsP3S1ykh5cH.JlKz.TC5U6rBgh
	ryPnWtUdUbnc0R9iFPrMHyxxxhEi1HyuE5Y7X3dCVwWtbbMHu05TP_ngI8TByyFAOmVAessPpFGe
	42xNbxezdkIBB1PTuiB72vIH15o4vmrbneLZmpGdRROwEIcv4hAC.Y4VVj2V6uqrtgOP0HOG6erW
	1Mky8ldIM_TdPiWzFOB.vxp.OXitZ4Jwbed1a.uwZNbRDiN2zE3Aw7585VDQMNAEaXg5asraruA2
	B9WzVETT.Jp6ZAioHkEMD5lfwcRhkv_lXfAG7zIuazRVgiKO7dyxWAPHyuP6b0kyPuIaHT5AAEpl
	zzCWElxmbsqoRvTq6DQKu17V7ad8w.gbuyOiziJHQcLdAopvvuLbwEK7tgxyzqMAykxoC2D3KFNf
	OEPxlqEdBhXiB7ipI4r.W4xE_4TS0POmjTVcef1WPR8ExCsWIxE7eidiH.TzWmLoJXbZWCKT2P9_
	ecwFtP9dC.j7KMIg0fJ2IfK5NRor1w8CtQ4Pettkdx5.kHufxKERiOOTqNtM.NfVs4bI7BP5Tmi3
	V_9bW7IL04.Oq0g55sTeqdyX82Q7HMCijAnWh44rN.qWxiqa6UHrlLptsYVgdKw4eTDv7Y25NloN
	n_CHFs_Fr0UWJFZYU8BREXF5ZmZuusYzUej.zIS3V3FoFsqqO_5bON2op3NuZe4r2uXcxuOAX8mI
	WQlQTTtBqSmQjxpfnBRjc2z2idp0P.XWlsYXJxvrK4UCjVOFAFw7obyy4.8WhlBUgSt1NU_2y7bQ
	UZU58jK534X_eLxm79kl115gTMCsnFIk6qwvGXOVZh20GqzY.SihXh7Kkin2PXvpg_kUBoCx4v5x
	xNhSKSgWgr5Zj1egGm6vNwmK8RXrZ9W45IeUVLkWybIBTcV8PlTDKQJDlaAqkw3DLw_GvquYkJrL
	1lUAf8nWGJ.9Iox46sWVw0_BSxYaTtjBeayIHBo5Yj8v3ktZ93v.F9vsmjGxbDZqcZm7pOkja
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic315.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 19 Jan 2021 13:15:34 +0000
Date: Tue, 19 Jan 2021 13:15:33 +0000 (UTC)
From: Joe Wulf <joe_wulf@yahoo.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Message-ID: <61239576.993577.1611062133080@mail.yahoo.com>
Subject: AuditRule Questions
MIME-Version: 1.0
References: <61239576.993577.1611062133080.ref@mail.yahoo.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============3254624810712656270=="

--===============3254624810712656270==
Content-Type: multipart/alternative; 
	boundary="----=_Part_993576_1961242940.1611062133078"

------=_Part_993576_1961242940.1611062133078
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

1. In audit rules 2.8.5 (front portion of the rules):

## Unsuccessful file access (any other opens) This has to go last.
-a always,exit -F arch=3Db32 -S open,creat,truncate,ftruncate,openat,open_b=
y_handle_at=C2=A0-F exit=3D-EACCES-a always,exit -F arch=3Db64 -S open,crea=
t,truncate,ftruncate,openat,open_by_handle_at=C2=A0-F exit=3D-EACCES-a alwa=
ys,exit -F arch=3Db32 -S open,creat,truncate,ftruncate,openat,open_by_handl=
e_at=C2=A0-F exit=3D-EPERM-a always,exit -F arch=3Db64 -S open,creat,trunca=
te,ftruncate,openat,open_by_handle_at =C2=A0-F exit=3D-EPERM
Whereas in audit rules 3.0, the same portion of the same rules looks like:
-a always,exit -F arch=3Db32 -S open,creat,truncate,ftruncate,openat,open_b=
y_handle_at=C2=A0-F exit=3D-EACCES-a always,exit -F arch=3Db32 -S open,crea=
t,truncate,ftruncate,openat,open_by_handle_at=C2=A0-F exit=3D-EPERM-a alway=
s,exit -F arch=3Db64 -S open,truncate,ftruncate,creat,openat,open_by_handle=
_at=C2=A0-F exit=3D-EACCES-a always,exit -F arch=3Db64 -S open,truncate,ftr=
uncate,creat,openat,open_by_handle_at =C2=A0-F exit=3D-EPERM

The ordering of the syscalls differs between the two, as well as the sequen=
tial order of the rules themselves. I better understand that the first audi=
t-rule matched 'wins'.-=C2=A0 Please help me understand the reason for the =
change in sequence, but also for the change in the order of the syscalls (i=
.e. between 2.8.5 and 3.0).


2.=C2=A0 I notice there are many rules across the entire set (both 2.8.5 an=
d 3.0) that define their key with "-F key=3D<name>", and others simply with=
 "-k <name>".-=C2=A0 Why are their two methods for KEY naming, and does one=
 have a distinct meaning, or precedence, over the other?-=C2=A0 Are their s=
ome 'rule' types where '-k' is appropriate, whereas '-F key=3D" is not, thu=
s they are not truly 100% interchangeable?
-=C2=A0 If both methods ARE equivalent throughout ALL of the audit.rules co=
ntent, would it be reasonable to standardize on one method in v3.0.x of you=
r rules going forward?


3.=C2=A0 For a RHEL 7.x (and even 8.x) system where the hardware is x86_64 =
and there is no reasonable expectation to install or operate 'ANY' 32bit so=
ftware, is there any value, or system performance penalty, to totally elimi=
nating all 'b32' rules?


4.=C2=A0 On the grub/kernel commandline, I can add:=C2=A0 'audit=3D1' -and-=
 'audit_backlog_limit=3D####'.=C2=A0 I looked for solutions to address the =
issue I was having, and found one here:=C2=A0 https://access.redhat.com/sol=
utions/19327; I found another somewhat helpful reference here:=C2=A0 https:=
//blog.siphos.be/2015/05/audit-buffering-and-rate-limiting; though it doesn=
't make good recommendations for the kernel parameter sizing (if that is a =
good thing to do in RHEL 7/RHEL 8).
-=C2=A0 Is there good relevance in RHEL 7, or RHEL 8 to adding this option =
to the grub/kernel commandline?-=C2=A0 Is there an upper-limit in setting t=
he number?
 -=C2=A0 What is the correlation of this grub/kernel item, to the '-b ####'=
 rule in /etc/audit/rules.d/audit.rules?=C2=A0 Are they (or should they be =
treated as) mutually exclusive?
-=C2=A0 In the 2nd reference, what process do you suggest for me to determi=
ne optimal values for 'kernel.printk_ratelimit'=C2=A0 -and -=C2=A0 'kernel.=
printk_ratelimit_burst', as well as for grub/kernel 'audit_backlog_limit=3D=
####' and audit.rules '-b ####'?
-=C2=A0 This link also seems relevant to the sysctl param's valuations:=C2=
=A0 https://topic.alibabacloud.com/a/linux-system-log-__ratelimitn-callback=
s-suppressed_1_16_30164105.html-=C2=A0 Does values for 'kernel.printk_ratel=
imit =3D 1';=C2=A0=C2=A0 -and- =C2=A0 'kernel.printk_ratelimit_burst =3D 10=
24' seem reasonable?


Thank you.

R,-Joe

------=_Part_993576_1961242940.1611062133078
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp1daa47edyahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div id=3D"ydp1daa47edyiv0174219782"><div><div class=3D"ydp1daa47edyiv01=
74219782ydpcb0c3aa3yahoo-style-wrap" style=3D"font-family:Helvetica Neue, H=
elvetica, Arial, sans-serif;font-size:16px;"><div dir=3D"ltr">1. In audit r=
ules 2.8.5 (front portion of the rules):<br></div><div dir=3D"ltr"><blockqu=
ote><div dir=3D"ltr">## Unsuccessful file access (any other opens) This has=
 to go last.<br><div>-a always,exit -F arch=3Db32 -S open,creat,truncate,ft=
runcate,openat,open_by_handle_at<span>&nbsp;-F exit=3D-EACCES</span></div><=
div>-a always,exit -F arch=3Db64 -S open,creat,truncate,ftruncate,openat,op=
en_by_handle_at<span>&nbsp;-F exit=3D-EACCES</span></div><div>-a always,exi=
t -F arch=3Db32 -S open,creat,truncate,ftruncate,openat,open_by_handle_at<s=
pan>&nbsp;-F exit=3D-EPERM</span></div><div>-a always,exit -F arch=3Db64 -S=
 open,creat,truncate,ftruncate,openat,open_by_handle_at <span>&nbsp;-F exit=
=3D-EPERM</span></div></div></blockquote><div dir=3D"ltr">Whereas in audit =
rules 3.0, the same portion of the same rules looks like:</div><div dir=3D"=
ltr"><blockquote><div dir=3D"ltr"><div>-a always,exit -F arch=3Db32 -S open=
,creat,truncate,ftruncate,openat,open_by_handle_at<span>&nbsp;-F exit=3D-EA=
CCES</span></div><div>-a always,exit -F arch=3Db32 -S open,creat,truncate,f=
truncate,openat,open_by_handle_at<span>&nbsp;-F exit=3D-EPERM</span></div><=
div>-a always,exit -F arch=3Db64 -S open,truncate,ftruncate,creat,openat,op=
en_by_handle_at<span>&nbsp;-F exit=3D-EACCES</span></div><div>-a always,exi=
t -F arch=3Db64 -S open,truncate,ftruncate,creat,openat,open_by_handle_at <=
span>&nbsp;-F exit=3D-EPERM</span></div></div></blockquote><div dir=3D"ltr"=
><br></div><div dir=3D"ltr">The ordering of the syscalls differs between th=
e two, as well as the sequential order of the rules themselves. I better un=
derstand that the first audit-rule matched 'wins'.</div><div dir=3D"ltr">-&=
nbsp; Please help me understand the reason for the change in sequence, but =
also for the change in the order of the syscalls (i.e. between 2.8.5 and 3.=
0).<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr">2.&nbsp; I notice there are many rules across the entire set (both=
 2.8.5 and 3.0) that define their key with "-F key=3D&lt;name&gt;", and oth=
ers simply with "-k &lt;name&gt;".</div><div dir=3D"ltr">-&nbsp; Why are th=
eir two methods for KEY naming, and does one have a distinct meaning, or pr=
ecedence, over the other?</div><div dir=3D"ltr">-&nbsp; Are their some 'rul=
e' types where '-k' is appropriate, whereas '-F key=3D" is not, thus they a=
re not truly 100% interchangeable?<br></div><div dir=3D"ltr" data-setdir=3D=
"false">-&nbsp; If both methods ARE equivalent throughout ALL of the audit.=
rules content, would it be reasonable to standardize on one method in v3.0.=
x of your rules going forward?<br></div></div></div><div dir=3D"ltr"><br></=
div><div dir=3D"ltr"><br></div><div dir=3D"ltr">3.&nbsp; For a RHEL 7.x (an=
d even 8.x) system where the hardware is x86_64 and there is no reasonable =
expectation to install or operate 'ANY' 32bit software, is there any value,=
 or system performance penalty, to totally eliminating all 'b32' rules?<br>=
</div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr=
" data-setdir=3D"false">4.&nbsp; On the grub/kernel commandline, I can add:=
&nbsp; '<b>audit=3D1</b>' -and- '<b>audit_backlog_limit=3D####</b>'.&nbsp; =
I looked for solutions to address the issue I was having, and found one her=
e:&nbsp; <a href=3D"https://access.redhat.com/solutions/19327" rel=3D"nofol=
low" target=3D"_blank">https://access.redhat.com/solutions/19327</a>; I fou=
nd another somewhat helpful reference here:&nbsp; <a href=3D"https://blog.s=
iphos.be/2015/05/audit-buffering-and-rate-limiting;" rel=3D"nofollow" targe=
t=3D"_blank">https://blog.siphos.be/2015/05/audit-buffering-and-rate-limiti=
ng;</a> though it doesn't make good recommendations for the kernel paramete=
r sizing (if that is a good thing to do in RHEL 7/RHEL 8).<br></div><div di=
r=3D"ltr" data-setdir=3D"false">-&nbsp; Is there good relevance in RHEL 7, =
or RHEL 8 to adding this option to the grub/kernel commandline?</div><div d=
ir=3D"ltr" data-setdir=3D"false">-&nbsp; Is there an upper-limit in setting=
 the number?<br> </div><div dir=3D"ltr" data-setdir=3D"false">-&nbsp; What =
is the correlation of this grub/kernel item, to the '-b ####' rule in /etc/=
audit/rules.d/audit.rules?&nbsp; Are they (or should they be treated as) mu=
tually exclusive?<br></div><div dir=3D"ltr" data-setdir=3D"false">-&nbsp; I=
n the 2nd reference, what process do you suggest for me to determine optima=
l values for <code></code>'kernel.printk_ratelimit'&nbsp; -and -&nbsp; 'ker=
nel.printk_ratelimit_burst', as well as for grub/kernel 'audit_backlog_limi=
t=3D####' and audit.rules '-b ####'?<br></div><div dir=3D"ltr" data-setdir=
=3D"false">-&nbsp; This link also seems relevant to the sysctl param's valu=
ations:&nbsp; <a href=3D"https://topic.alibabacloud.com/a/linux-system-log-=
__ratelimitn-callbacks-suppressed_1_16_30164105.html" rel=3D"nofollow" targ=
et=3D"_blank">https://topic.alibabacloud.com/a/linux-system-log-__ratelimit=
n-callbacks-suppressed_1_16_30164105.html</a></div><div dir=3D"ltr" data-se=
tdir=3D"false">-&nbsp; Does values for 'kernel.printk_ratelimit =3D 1';&nbs=
p;&nbsp; -and- &nbsp; 'kernel.printk_ratelimit_burst =3D 1024' seem reasona=
ble?<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr" data-setdir=3D"fa=
lse"><br></div><div dir=3D"ltr" data-setdir=3D"false">Thank you.<br></div><=
br><div dir=3D"ltr">R,</div><div dir=3D"ltr">-Joe<br></div></div></div></di=
v></div></body></html>
------=_Part_993576_1961242940.1611062133078--

--===============3254624810712656270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============3254624810712656270==--


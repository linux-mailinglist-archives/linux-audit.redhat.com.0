Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 03198154AD8
	for <lists+linux-audit@lfdr.de>; Thu,  6 Feb 2020 19:13:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581012790;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ySnNPiIYlAhndOceV2tJqERxBh53jtnUFGwzeRLD2+k=;
	b=EXY73KtUNqRI1NUR3hjLTeQwwdy64YXT/gWC+UIwJJNB4YyJH1SxtcuEdK9KT+a4VSLgun
	IMej4sKt1jjwv9MhUGwJh2pofu7z5w04NOyksBJsXmRBFrQVOXZSFePSeTs7azDWeri5LW
	jPxRwmYAzWLgegYJjEzz+hYd3BHMC3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-Ag9P0Sg-OZeydq_rO9GikQ-1; Thu, 06 Feb 2020 13:13:07 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA1C1101FC68;
	Thu,  6 Feb 2020 18:13:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C31F5DA7C;
	Thu,  6 Feb 2020 18:12:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 660E78175D;
	Thu,  6 Feb 2020 18:12:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 016ICeJK004530 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 6 Feb 2020 13:12:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 335BC10F994; Thu,  6 Feb 2020 18:12:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F34910F989
	for <linux-audit@redhat.com>; Thu,  6 Feb 2020 18:12:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94CB618AE975
	for <linux-audit@redhat.com>; Thu,  6 Feb 2020 18:12:37 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1581012757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=QXQ7a7KohTAu43VI9Sju8l0R1J6NfcSHq8AO5lmGs+c=;
	b=O+K5zX38ez9ash9MvvAzNeneqbkEQcDKVKtBzRE1GlVrIcM1eGfdWSPz0vQkK0MV+U/6ds
	JD3JS0aWIjH+V3KfnmbC611QD4JHesu0A0UfZi76Gj5WBx22yMSFIxvPaL67EU8z8L8XQr
	E6vljVYDUmJCLwt/+eLkKxx3FiA4pEKSuQ+xkllUR9fzflw6JUivH9KrFk3xc9Y17Pb8J5
	Bvi6gekoK0Iik0fiL2S+ClsQKcyHOrmFulzynCGxgqGQCfEgsPmQCNeFOLHmDjqWnaQAh1
	9ntpQch89cITFe/dTzH19E6VrdvSCDHs1cV3oJHun6cZPn2Plt09QWdrFw0EfQ==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1581012757; a=rsa-sha256;
	cv=none;
	b=bb+bXDxHNp1usuFjfnbZfwB/TCFbhrmdh6b2TBxySvpr8ivN++GAL6nNWf+ysyg36x/Td0
	avTRirQeJTBBEoCpr4IKsqYZ7FJuNO1YWcsSl/esRcJnn5yVDa1al+3za5R5Dor5RSwgj/
	JghxAlLf/GJHdkt/4wQUnZV7OAlKsT3TyYT53+yfbLHXYNgvImQwR90jviIOqeb+IfP5rc
	dB6aXtUlkB7/d1OQ1PKSrtMmLZWLi+6PbE4NEjOJgkCmekW0y0VEp7btXdlC+XGwefn3DV
	0tt+HuElefHL+whW0eU6pZLIt6G9gd4QAVvBWCsEf0w/D+dO2/SfFt6LtoKksw==
ARC-Authentication-Results: i=1; relay.mimecast.com; dkim=none;
	spf=pass (relay.mimecast.com: domain of orion@nwra.com designates
	72.52.192.72 as permitted sender) smtp.mailfrom=orion@nwra.com
Received: from mail.nwra.com (mail.nwra.com [72.52.192.72]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-14-udBkFbVWNU20zGqL8EfdqA-1;
	Thu, 06 Feb 2020 13:12:34 -0500
X-MC-Unique: udBkFbVWNU20zGqL8EfdqA-1
X-MC-Unique: Ag9P0Sg-OZeydq_rO9GikQ-1
Received: from barry.cora.nwra.com (inferno.cora.nwra.com [204.134.157.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mail.nwra.com (Postfix) with ESMTPS id 508723403A9;
	Thu,  6 Feb 2020 10:12:33 -0800 (PST)
Subject: Re: Is auditing ftruncate useful?
To: Lenny Bruzenak <lenny@magitekltd.com>, linux-audit@redhat.com
References: <5599a207-7054-af2e-6d10-0421154168b8@nwra.com>
	<7f299e8c-6888-91eb-8feb-91e37fb87fd2@magitekltd.com>
From: Orion Poplawski <orion@nwra.com>
Organization: NWRA
Message-ID: <8010cdd2-468b-ac87-54f1-2846baf28d28@nwra.com>
Date: Thu, 6 Feb 2020 11:12:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7f299e8c-6888-91eb-8feb-91e37fb87fd2@magitekltd.com>
X-Mimecast-Spam-Score: 0
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
Content-Type: multipart/mixed; boundary="===============5222951438136253761=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14

This is a cryptographically signed message in MIME format.
--===============5222951438136253761==
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms080500050200020509000507"

This is a cryptographically signed message in MIME format.
--------------ms080500050200020509000507
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/6/20 8:37 AM, Lenny Bruzenak wrote:
> On 2/5/20 4:27 PM, Orion Poplawski wrote:
>=20
>> I would like to track file modifications made by a specific UID.=C2=A0 I=
 have:
>>
>> -a exit,never -F dir=3D/proc/
>> -a exit,never -F dir=3D/var/cache/
>> -a exit,never -F path=3D/etc/passwd -F exe=3D/usr/bin/kdeinit4
>> -a exit,never -F exe=3D/usr/libexec/gam_server
>> -a always,exit -F arch=3Db32 -S
>> open,truncate,ftruncate,creat,openat,open_by_handle_at -F uid=3DXXXXX -k
>> watched_users
>> -a always,exit -F arch=3Db64 -S
>> open,truncate,ftruncate,creat,openat,open_by_handle_at -F uid=3DXXXXX -k
>> watched_users
>>
>> but as near as I can tell, this is all that gets logged for ftruncate:
>>
>>
>> type=3DSYSCALL msg=3Daudit(1580944297.114:831002): arch=3Dc000003e sysca=
ll=3D77
>> success=3Dyes exit=3D0 a0=3D33 a1=3D28 a2=3D7f3417100018 a3=3D1 items=3D=
0 ppid=3D23746
>> pid=3D23816 auid=3DXXXXX uid=3DXXXXX gid=3DXXXXX euid=3DXXXXX suid=3DXXX=
XX fsuid=3DXXXXX
>> egid=3DXXXXX sgid=3DXXXXX fsgid=3DXXXXX tty=3D(none) ses=3D1 comm=3D5765=
6220436F6E74656E74
>> exe=3D"/usr/lib64/firefox/firefox"
>> subj=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=3D"watc=
hed_users"
>> type=3DPROCTITLE msg=3Daudit(1580944297.114:831002):
>> proctitle=3D2F7573722F6C696236342F66697265666F782F66697265666F78002D636F=
6E74656E7470726F63002D6368696C6449440031002D6973466F7242726F77736572002D707=
26566734C656E0031002D707265664D617053697A6500313833303834002D706172656E7442=
75696C644944003230323030313133313131393133002D
>>
>>
>> which does not appear to contain enough information to determine what fi=
le was
>> truncated.=C2=A0 Am I missing something?
>>
>> This is on EL7.
>>
> For starters, I'd interpret:
>=20
> # ausearch -i -k watched_users
>=20
> LCB
>=20

Doesn't seem much better:

type=3DPROCTITLE msg=3Daudit(02/06/2020 10:58:23.626:119631) : proctitle=3D=
/bin/bash
/usr/bin/thunderbird
type=3DSYSCALL msg=3Daudit(02/06/2020 10:58:23.626:119631) : arch=3Dx86_64
syscall=3Dftruncate success=3Dyes exit=3D0 a0=3D0x4a a1=3D0x28 a2=3D0x7f1e4=
1600018
a3=3D0xfffffe00 items=3D0 ppid=3D2451 pid=3D3561 auid=3DUSER uid=3DUSER gid=
=3DUSER euid=3DUSER
suid=3DUSER fsuid=3DUSER egid=3DUSER sgid=3DUSER fsgid=3DUSER tty=3D(none) =
ses=3D1
comm=3Dthunderbird exe=3D/usr/lib64/thunderbird/thunderbird
subj=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=3Dwatched_=
users

Why no PATH entry?  I have them for things like open:

type=3DPROCTITLE msg=3Daudit(02/06/2020 10:59:05.170:120649) : proctitle=3D=
kdeinit4:
konsole [kdeinit] -session 102311da
type=3DPATH msg=3Daudit(02/06/2020 10:59:05.170:120649) : item=3D0 name=3D/=
etc/passwd
inode=3D1323462 dev=3D08:07 mode=3Dfile,644 ouid=3Droot ogid=3Droot rdev=3D=
00:00
obj=3Dsystem_u:object_r:passwd_file_t:s0 objtype=3DNORMAL cap_fp=3Dnone cap=
_fi=3Dnone
cap_fe=3D0 cap_fver=3D0
type=3DCWD msg=3Daudit(02/06/2020 10:59:05.170:120649) :  cwd=3D/home/USER
type=3DSYSCALL msg=3Daudit(02/06/2020 10:59:05.170:120649) : arch=3Dx86_64
syscall=3Dopen success=3Dyes exit=3D26 a0=3D0x7fe1b291b552 a1=3DO_RDONLY|O_=
CLOEXEC
a2=3D0x1b6 a3=3D0x24 items=3D1 ppid=3D1 pid=3D3141 auid=3DUSER uid=3DUSER g=
id=3DUSER euid=3DUSER
suid=3DUSER fsuid=3DUSER egid=3DUSER sgid=3DUSER fsgid=3DUSER tty=3D(none) =
ses=3D1
comm=3Dkonsole exe=3D/usr/bin/kdeinit4
subj=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=3Dwatched_=
users

or even with other rules for fchown:

-a always,exit -F arch=3Db64 -S fchown -F auid>=3D1000 -F auid!=3Dunset -F =
key=3Dperm_mod

type=3DPROCTITLE msg=3Daudit(02/06/2020 10:59:30.562:59894) : proctitle=3Dk=
win
-session 106f726361000123384967700000029380000_1548775895_794186
type=3DPATH msg=3Daudit(02/06/2020 10:59:30.562:59894) : item=3D0 name=3D(n=
ull)
inode=3D595335 dev=3Dfd:01 mode=3Dfile,600 ouid=3DUSER ogid=3DUSER rdev=3D0=
0:00
obj=3Dunconfined_u:object_r:config_home_t:s0 objtype=3DNORMAL cap_fp=3Dnone
cap_fi=3Dnone cap_fe=3D0 cap_fver=3D0
type=3DSYSCALL msg=3Daudit(02/06/2020 10:59:30.562:59894) : arch=3Dx86_64
syscall=3Dfchown success=3Dyes exit=3D0 a0=3D0xd a1=3D0x584b a2=3D0x584b a3=
=3D0xc items=3D1
ppid=3D27089 pid=3D27152 auid=3DUSER uid=3DUSER gid=3DUSER euid=3DUSER suid=
=3DUSER
fsuid=3DUSER egid=3DUSER sgid=3DUSER fsgid=3DUSER tty=3D(none) ses=3D16 com=
m=3Dkwin
exe=3D/usr/bin/kwin subj=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.=
c1023
key=3Dperm_mod

There I only get an inode entry which I'll have to interpret - but that see=
ms
expected for syscalls that operate on file handles.

Thanks.

--=20
Orion Poplawski
Manager of NWRA Technical Systems          720-772-5637
NWRA, Boulder/CoRA Office             FAX: 303-415-9702
3380 Mitchell Lane                       orion@nwra.com
Boulder, CO 80301                 https://www.nwra.com/


--------------ms080500050200020509000507
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCCjYw
ggTpMIID0aADAgECAgRMDow4MA0GCSqGSIb3DQEBBQUAMIG0MRQwEgYDVQQKEwtFbnRydXN0Lm5l
dDFAMD4GA1UECxQ3d3d3LmVudHJ1c3QubmV0L0NQU18yMDQ4IGluY29ycC4gYnkgcmVmLiAobGlt
aXRzIGxpYWIuKTElMCMGA1UECxMcKGMpIDE5OTkgRW50cnVzdC5uZXQgTGltaXRlZDEzMDEGA1UE
AxMqRW50cnVzdC5uZXQgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgKDIwNDgpMB4XDTExMTExMTE1
MzgzNFoXDTIxMTExMjAwMTczNFowgaUxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1FbnRydXN0LCBJ
bmMuMTkwNwYDVQQLEzB3d3cuZW50cnVzdC5uZXQvQ1BTIGlzIGluY29ycG9yYXRlZCBieSByZWZl
cmVuY2UxHzAdBgNVBAsTFihjKSAyMDEwIEVudHJ1c3QsIEluYy4xIjAgBgNVBAMTGUVudHJ1c3Qg
Q2xhc3MgMiBDbGllbnQgQ0EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDEMo1C0J4Z
nVuQWhBMtRAAIbkHSN6uboDW/xRQBuh1r2tGjuelT63DjLD6e+AZkf3wY61xSfOoHB+rNBkgTktU
6QCTvnAIMd6JU6xXvCTvKo9C1PfqlSVdFHbSzacS+huytFxhQL1f3VebRFXYxYkZPGU9uejUpS3C
LNPqgzGiCDxeWa4SLioKjF7zszGuCq1+7LBJCfynLiIeaGQ0nRbjpj0DMUAW95T2Sxk0yZfmIpxI
3mSggwtYBZjEIkaJBf2jvvZJTGEDFqT4Cpkc4sDGfmkCMleQA68AlKG53M6v7/R8GM4wC8qH+NVf
H1lR2IsLuTjGWMJTfNom1NvyvZDNAgMBAAGjggEOMIIBCjAOBgNVHQ8BAf8EBAMCAQYwEgYDVR0T
AQH/BAgwBgEB/wIBADAzBggrBgEFBQcBAQQnMCUwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLmVu
dHJ1c3QubmV0MDIGA1UdHwQrMCkwJ6AloCOGIWh0dHA6Ly9jcmwuZW50cnVzdC5uZXQvMjA0OGNh
LmNybDA7BgNVHSAENDAyMDAGBFUdIAAwKDAmBggrBgEFBQcCARYaaHR0cDovL3d3dy5lbnRydXN0
Lm5ldC9ycGEwHQYDVR0OBBYEFAmRpbrp8i4qdd/Nfv53yvLea5skMB8GA1UdIwQYMBaAFFXkgdER
gL7YibkIozH5oSQJFrlwMA0GCSqGSIb3DQEBBQUAA4IBAQAKibWxMzkQsSwJee7zG22odkq0w3jj
5/8nYTTMSuzYgu4fY0rhfUV6REaqVsaATN/IdQmcYSHZPk3LoBr0kYolpXptG7lnGT8lM9RBH2E/
GCKTyD73w+kP51j0nh9O45/h1d83uvyx7YA2ZmaFJlditeJusIJq0KwjE9EXFUYJWXbOp3CniB5x
Jz4d3tnqnQiKfyuW8oubFH/KRXJPCi1bv865e+iMiEyP114JkKDnyPmAPq3BMrJGw/3NDAzlwv1P
CbeCIJK802SfBzFN9s81aTek70c/JSt7Dt+bO7JxPSfOlC57Jq1InwR/nxuHzHodsSCQFQiuAhHT
wwA9qOtHMIIFRTCCBC2gAwIBAgIQF5XJg+ffrZoAAAAATDX/LTANBgkqhkiG9w0BAQsFADCBpTEL
MAkGA1UEBhMCVVMxFjAUBgNVBAoTDUVudHJ1c3QsIEluYy4xOTA3BgNVBAsTMHd3dy5lbnRydXN0
Lm5ldC9DUFMgaXMgaW5jb3Jwb3JhdGVkIGJ5IHJlZmVyZW5jZTEfMB0GA1UECxMWKGMpIDIwMTAg
RW50cnVzdCwgSW5jLjEiMCAGA1UEAxMZRW50cnVzdCBDbGFzcyAyIENsaWVudCBDQTAeFw0xNzEy
MTUxNzE3MTBaFw0yMDEyMTUxNzQ3MDBaMIGTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGlu
Z3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEmMCQGA1UEChMdTm9ydGhXZXN0IFJlc2VhcmNoIEFzc29j
aWF0ZXMxNTAWBgNVBAMTD09yaW9uIFBvcGxhd3NraTAbBgkqhkiG9w0BCQEWDm9yaW9uQG53cmEu
Y29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAop24yyNf/vYlUdWtgHFHWcittcBF
eMIWS5GJxcDDYSjYfHUYhiEq8D4eMrktwirxZqnGTwMdN+RCqrnNZSR/YOsHSwpsW+9eOtAAlHMP
CbaPsS+X0xxZX3VRSdxXulwELCE6Saik1UMQ0MWHts1TwNuDrAXlvmoxCHgXSgcs4ukfNSOAs49O
l09tOt5xI5NACz2sDjAiwonIm2ccuqbc5zJZiL2YOVTzOq9Aa/i38tRldTYkJH80WgnpmMZTSgGL
ua8kwA/u4Lmax2VEcoRMw9zzmJav8gFNpQDbVnO3Ik2nlreJ/FX9+JmUa7zDn4FS0rT37ZJ7rOA3
N968CwBHAwIDAQABo4IBfzCCAXswDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMC
BggrBgEFBQcDBDBCBgNVHSAEOzA5MDcGC2CGSAGG+mwKAQQCMCgwJgYIKwYBBQUHAgEWGmh0dHA6
Ly93d3cuZW50cnVzdC5uZXQvcnBhMGoGCCsGAQUFBwEBBF4wXDAjBggrBgEFBQcwAYYXaHR0cDov
L29jc3AuZW50cnVzdC5uZXQwNQYIKwYBBQUHMAKGKWh0dHA6Ly9haWEuZW50cnVzdC5uZXQvMjA0
OGNsYXNzMnNoYTIuY2VyMDQGA1UdHwQtMCswKaAnoCWGI2h0dHA6Ly9jcmwuZW50cnVzdC5uZXQv
Y2xhc3MyY2EuY3JsMBkGA1UdEQQSMBCBDm9yaW9uQG53cmEuY29tMB8GA1UdIwQYMBaAFAmRpbrp
8i4qdd/Nfv53yvLea5skMB0GA1UdDgQWBBSU5GXZh96BMn8UDBnIwT0CYlbijTAJBgNVHRMEAjAA
MA0GCSqGSIb3DQEBCwUAA4IBAQAj5E9g5NtdnH5bR1qKtyUGL9Rd6BIZBrVIMoEkpXi6rRwhfeAV
2cU5T/Te94+pv5JkBQfJQAakeQM+VRvSHtODHTPot12IpX/Dm9oxhKXpWIveNjC/6Qbx+/E6iNvU
GTtTTtCfwwpmyzVpUnJUN0B9XSHy78+fjJkDUIv6byrBSC/zW0MxSd0HKtr2Do3FYZgEmFiEchDz
wJeTmpJiJN/IVk/gtfJXSYQFOA0QawovCSvGgZy/0fRY5y8h1MDWmVBRrHBRoL+ot9Q6nbhMyszv
EGIVYVvWleE3Zcpu0teQ5WDv7WYs6ZZexIkGhIIW65NWIa1rG+UYok993UqK2FGnMYIEXzCCBFsC
AQEwgbowgaUxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1FbnRydXN0LCBJbmMuMTkwNwYDVQQLEzB3
d3cuZW50cnVzdC5uZXQvQ1BTIGlzIGluY29ycG9yYXRlZCBieSByZWZlcmVuY2UxHzAdBgNVBAsT
FihjKSAyMDEwIEVudHJ1c3QsIEluYy4xIjAgBgNVBAMTGUVudHJ1c3QgQ2xhc3MgMiBDbGllbnQg
Q0ECEBeVyYPn362aAAAAAEw1/y0wDQYJYIZIAWUDBAIBBQCgggJ1MBgGCSqGSIb3DQEJAzELBgkq
hkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIwMDIwNjE4MTIzMlowLwYJKoZIhvcNAQkEMSIEIIu1
LoD3Dc3my86ALucMtoR09xY3uoKrSCfhhxoS+PXSMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwIC
AUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgcsGCSsGAQQBgjcQBDGBvTCBujCBpTELMAkGA1UE
BhMCVVMxFjAUBgNVBAoTDUVudHJ1c3QsIEluYy4xOTA3BgNVBAsTMHd3dy5lbnRydXN0Lm5ldC9D
UFMgaXMgaW5jb3Jwb3JhdGVkIGJ5IHJlZmVyZW5jZTEfMB0GA1UECxMWKGMpIDIwMTAgRW50cnVz
dCwgSW5jLjEiMCAGA1UEAxMZRW50cnVzdCBDbGFzcyAyIENsaWVudCBDQQIQF5XJg+ffrZoAAAAA
TDX/LTCBzQYLKoZIhvcNAQkQAgsxgb2ggbowgaUxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1FbnRy
dXN0LCBJbmMuMTkwNwYDVQQLEzB3d3cuZW50cnVzdC5uZXQvQ1BTIGlzIGluY29ycG9yYXRlZCBi
eSByZWZlcmVuY2UxHzAdBgNVBAsTFihjKSAyMDEwIEVudHJ1c3QsIEluYy4xIjAgBgNVBAMTGUVu
dHJ1c3QgQ2xhc3MgMiBDbGllbnQgQ0ECEBeVyYPn362aAAAAAEw1/y0wDQYJKoZIhvcNAQEBBQAE
ggEAP4vaG59m5mYuePC+BnO9Rp8q6s5AJAyibHiHseWpqkoSshNp9Rdtbdjg3ia/vCBwWp91SSWX
aGr85rqu2pBaX73sU1GxHgcNA1nfZydcHBvkNmrX9oFO6mrySATDVZy3/Uo0HJh8itpLqrq6fhJ6
gnN3IQ4lVgeOv2nK5S2WaYMs7Wqyukq6Evg6KrGPDBxcnHOv4vSQNAw9ijGYKn+25KAsPQcuzvpm
M5G3DOIyKw6pwq6IzVejXBb0rOCe97+0CaKGVb9qYT2jh3comJr3L0RrxaOHOeIzhmoEL6ZpDCIp
vKZaOkJMZoiYqoXIH7BvFiSXbqYV16lDw7m/DEyNVgAAAAAAAA==
--------------ms080500050200020509000507--


--===============5222951438136253761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============5222951438136253761==--


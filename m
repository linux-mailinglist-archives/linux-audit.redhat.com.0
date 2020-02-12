Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B3E3115B26B
	for <lists+linux-audit@lfdr.de>; Wed, 12 Feb 2020 22:00:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581541257;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=J/YzeoUWfbZBfezgONOSIagBuxTkBq825ZfLJjpI1L0=;
	b=DDVWa8mW0Bxy71Kf/BV0etOThTi6/lFTEKTKPCyxrnEYxWzU+SGf2LpiwWtS7Js4xn45yV
	53C6bEm1l1BDVTdcjrj6XRGi/mnX5ERf3RGxJpSzsXuq6qoTDwkbL0lewrtXhPFe8hpfsl
	pJ4/Es0rRAj14gj0s1l3oHZfZJorTe0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-271JAG1nOYC1UB-3EvfUfQ-1; Wed, 12 Feb 2020 16:00:54 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5950E10054E3;
	Wed, 12 Feb 2020 21:00:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BCFA38C;
	Wed, 12 Feb 2020 21:00:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 751A1866D4;
	Wed, 12 Feb 2020 21:00:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01CL0PYF015976 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 16:00:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 037292093CFB; Wed, 12 Feb 2020 21:00:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2C362093CFA
	for <linux-audit@redhat.com>; Wed, 12 Feb 2020 21:00:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CA108E3897
	for <linux-audit@redhat.com>; Wed, 12 Feb 2020 21:00:22 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1581541222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=b3JnHMqB7tkMT5CBcPQjhAkAqlB3GXq01PQpUrGNBEw=;
	b=ISpo+4D0US12kF1aGvJX2gjF+V2TPyMtYn2ptbvPaDk4H9dscubKdZUtYcd5Fb7RIXi0hK
	A/4/LkuF/3nEqjeKJSZUaDilBlvi5k2gYwSi7DD7h40ciQ5AXOlLfsp0GENMXDd72nxBVS
	kRF0P8X6CbW5XQLkbwXaub7l/pSV8QGxWkiRrImRYkNCk5GWeFuTIB+qQYXUy0FNVPx40f
	HjxoLal4WKIQPrDr33NBgqUZmwlsnT87n/ZENLZApQsz6nSzydJmjGP37eIbHzWziQ7mtM
	bySHpROuHBUmVBsBUpolAYaJyhIWmh4UdTULUK1iwPjS0+meMQDX3OpJgMP40Q==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1581541222; a=rsa-sha256;
	cv=none;
	b=BDTc7vUcgm8Z6XpJoYMH6rQ5V04Han1uDzZ0fgZdr7rEoKlRj+cYmkz6MRBUImMKZji5U8
	VmHKC83CqcBWiCY0mTbNBordlX0iy5W+PA3XZq8ehpEW0vTeqP2dR9zZylibkS7PuNHTIK
	tWKJCOlUeezz+79qCPfHSdPS4hwfOJlZa+v6GdgdmIvQtTgB+G7UMQ5aooh6b0mOnIEw2r
	Eau0YwuSMEeHxulyxzGerGw9bRthEA7so3T++rxsHlI7ul0W24FSwowPHSoUl0Sl/HkUe1
	L/ftbEETzuMxcGmqSUOuGjg9Vq9tNC9ts+Ub3ApZccj6W4ZEW3+yV0GOqmtJGQ==
ARC-Authentication-Results: i=1; relay.mimecast.com; dkim=none;
	spf=pass (relay.mimecast.com: domain of orion@nwra.com designates
	72.52.192.72 as permitted sender) smtp.mailfrom=orion@nwra.com
Received: from mail.nwra.com (mail.nwra.com [72.52.192.72]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-53-0zJZ9L2kPfi8HLR6sh_-JQ-1;
	Wed, 12 Feb 2020 16:00:19 -0500
X-MC-Unique: 0zJZ9L2kPfi8HLR6sh_-JQ-1
X-MC-Unique: 271JAG1nOYC1UB-3EvfUfQ-1
Received: from barry.cora.nwra.com (inferno.cora.nwra.com [204.134.157.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mail.nwra.com (Postfix) with ESMTPS id 2250B3403AF;
	Wed, 12 Feb 2020 13:00:18 -0800 (PST)
Subject: Re: Is auditing ftruncate useful?
To: Paul Moore <paul@paul-moore.com>
References: <5599a207-7054-af2e-6d10-0421154168b8@nwra.com>
	<8010cdd2-468b-ac87-54f1-2846baf28d28@nwra.com>
	<57c2b1a1-5406-4d77-9dc5-ad6c99b987a8@magitekltd.com>
	<1758232.KkKbY19U6n@x2>
	<17021a5a608.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
	<CAHC9VhRhCQook8wPcYTb6Xfr0v+fqszzHxuVGzZxmK5N1KPzcw@mail.gmail.com>
	<4b16e97a-49d7-d558-0d87-7cdff23888b5@nwra.com>
	<CAHC9VhR-hGOgOkpQaFEM=CFCETR7goOxfYjT52brgUpNibnkBg@mail.gmail.com>
From: Orion Poplawski <orion@nwra.com>
Organization: NWRA
Message-ID: <27e13d2d-cc87-ce5f-557f-88474ce1d29f@nwra.com>
Date: Wed, 12 Feb 2020 14:00:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAHC9VhR-hGOgOkpQaFEM=CFCETR7goOxfYjT52brgUpNibnkBg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
Content-Type: multipart/mixed; boundary="===============0389382517251315339=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

This is a cryptographically signed message in MIME format.
--===============0389382517251315339==
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms010701030209050402000704"

This is a cryptographically signed message in MIME format.
--------------ms010701030209050402000704
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/11/20 5:58 AM, Paul Moore wrote:
> On Mon, Feb 10, 2020 at 6:05 PM Orion Poplawski <orion@nwra.com> wrote:
>> On 2/10/20 3:54 PM, Paul Moore wrote:
>>> On Fri, Feb 7, 2020 at 4:56 PM Paul Moore <paul@paul-moore.com> wrote:

>>>
>>> Generally speaking the only syscalls which generate a PATH record are
>>> those syscalls which take a file pathname as an argument.  The reason
>>> why is that pathnames are notoriously transient and are only valid for
>>> the instant they actually resolve to a file; in fact it is possible
>>> that by the time an open(2) syscall returns the fd to the calling
>>> application, the file it opened may no longer be accessible at the
>>> pathname used to open the file.  It really is that crazy.
>>>
>>> In the case of ftruncate(2) we see that the syscall doesn't take a
>>> pathname argument, it takes an open file descriptor, this is why you
>>> don't see a PATH record.  If we compare it to a syscall which does
>>> take a pathname, e.g. chown(2), we will generate a PATH record.  Take
>>> the example below where we use the example program found in the
>>> chown(2) manpage:
>>>
>>> # touch /tmp/test
>>> # auditctl -w /tmp/test -k path_test
>>> # gcc -o chown_test -g chown_test.c
>>> # ./chown_test
>>> ./chown_test <owner> <file>
>>> # ./chown_test nobody /tmp/test
>>> # ausearch -i -k path_test
>>> ----
>>> type=3DCONFIG_CHANGE msg=3Daudit(02/10/2020 17:50:45.251:255) : auid=3D=
root ses=3D5 subj
>>> =3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 op=3Dadd_rule =
key=3Dpath_test
>>> list=3Dexit res=3Dyes
>>> ----
>>> type=3DPROCTITLE msg=3Daudit(02/10/2020 17:51:29.356:258) : proctitle=
=3D./chown_test n
>>> obody /tmp/test
>>> type=3DPATH msg=3Daudit(02/10/2020 17:51:29.356:258) : item=3D0 name=3D=
/tmp/test inode=3D7
>>> 0660 dev=3D00:21 mode=3Dfile,644 ouid=3Droot ogid=3Droot rdev=3D00:00 o=
bj=3Dunconfined_u:obj
>>> ect_r:user_tmp_t:s0 nametype=3DNORMAL cap_fp=3Dnone cap_fi=3Dnone cap_f=
e=3D0 cap_fver=3D0
>>> cap_frootid=3D0
>>> type=3DCWD msg=3Daudit(02/10/2020 17:51:29.356:258) : cwd=3D/root/tmp
>>> type=3DSYSCALL msg=3Daudit(02/10/2020 17:51:29.356:258) : arch=3Dx86_64=
 syscall=3Dchown
>>> success=3Dyes exit=3D0 a0=3D0x7ffc820c0603 a1=3Dnobody a2=3Dunset a3=3D=
0x40044e items=3D1 ppid
>>> =3D1678 pid=3D35451 auid=3Droot uid=3Droot gid=3Droot euid=3Droot suid=
=3Droot fsuid=3Droot egid=3D
>>> root sgid=3Droot fsgid=3Droot tty=3Dpts1 ses=3D5 comm=3Dchown_test exe=
=3D/root/tmp/chown_tes
>>> t subj=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=3Dpa=
th_test
>>>
>>> ... in the example above we see that we do have a PATH record, as expec=
ted.
>>>
>>
>> So, this is all reasonable.  But why do I get this with fchown which als=
o
>> takes a file descriptor?
>>
>> type=3DPROCTITLE msg=3Daudit(02/06/2020 10:59:30.562:59894) : proctitle=
=3Dkwin
>> -session 106f726361000123384967700000029380000_1548775895_794186
>> type=3DPATH msg=3Daudit(02/06/2020 10:59:30.562:59894) : item=3D0 name=
=3D(null)
>> inode=3D595335 dev=3Dfd:01 mode=3Dfile,600 ouid=3DUSER ogid=3DUSER rdev=
=3D00:00
>> obj=3Dunconfined_u:object_r:config_home_t:s0 objtype=3DNORMAL cap_fp=3Dn=
one
>> cap_fi=3Dnone cap_fe=3D0 cap_fver=3D0
>> type=3DSYSCALL msg=3Daudit(02/06/2020 10:59:30.562:59894) : arch=3Dx86_6=
4
>> syscall=3Dfchown success=3Dyes exit=3D0 a0=3D0xd a1=3D0x584b a2=3D0x584b=
 a3=3D0xc items=3D1
>> ppid=3D27089 pid=3D27152 auid=3DUSER uid=3DUSER gid=3DUSER euid=3DUSER s=
uid=3DUSER
>> fsuid=3DUSER egid=3DUSER sgid=3DUSER fsgid=3DUSER tty=3D(none) ses=3D16 =
comm=3Dkwin
>> exe=3D/usr/bin/kwin subj=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:=
c0.c1023
>> key=3Dperm_mod
>>
>> It's this disparity between fchown and ftruncate that caught my attentio=
n.
>=20
> First off, it is worth distinguishing between a PATH record with a
> valid pathname (the chown(2) case) and a PATH record with an
> invalid/NULL pathname (the fchown(2) case).  At this point you
> hopefully understand why those PATH records are different, and why
> they sometimes have a pathname, and why sometimes they do not.
>=20
> For syscalls which resolve pathnames the pathname information for the
> PATH records are collected as the pathname is resolved (the only time
> they are valid).  When the syscall is done, the resolved pathname
> information is turned into the PATH records you see.
>=20
> In the case of fchown(2) there is no pathname resolution, the kernel's
> fchown(2) implementation explicitly records the passed file descriptor
> for reasons that Casey mentioned: it's security relevant since you are
> changing the file's ownership.  The ftruncate(2) syscall isn't
> security relevant so there is no explicit attempt to record the file
> descriptor information.  This is why fchown(2) generates a pathless
> PATH record, and why ftruncate(2) does not.
>=20
> If you are still curious, I would suggest you take a look at the
> kernel code, all the answers are there, and we could always use
> another set of hands/eyes ;)

Thank you again for the detailed response.  I was working with RHEL7 stig
rules like:

https://www.stigviewer.com/stig/red_hat_enterprise_linux_7/2017-12-14/findi=
ng/V-72133

which seem to imply some security relevance for ftruncate, and then noticin=
g
that the ftruncate record didn't seem to provide any kind of useful
information at all.  But I can appreciate some cargo-cult like behavior in =
the
security implementation realm :).


--=20
Orion Poplawski
Manager of NWRA Technical Systems          720-772-5637
NWRA, Boulder/CoRA Office             FAX: 303-415-9702
3380 Mitchell Lane                       orion@nwra.com
Boulder, CO 80301                 https://www.nwra.com/


--------------ms010701030209050402000704
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
hkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIwMDIxMjIxMDAxN1owLwYJKoZIhvcNAQkEMSIEIOC6
qt7buQkhrvg6lMFP1Yi7qXudab9J41nOVZjs7WIVMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwIC
AUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgcsGCSsGAQQBgjcQBDGBvTCBujCBpTELMAkGA1UE
BhMCVVMxFjAUBgNVBAoTDUVudHJ1c3QsIEluYy4xOTA3BgNVBAsTMHd3dy5lbnRydXN0Lm5ldC9D
UFMgaXMgaW5jb3Jwb3JhdGVkIGJ5IHJlZmVyZW5jZTEfMB0GA1UECxMWKGMpIDIwMTAgRW50cnVz
dCwgSW5jLjEiMCAGA1UEAxMZRW50cnVzdCBDbGFzcyAyIENsaWVudCBDQQIQF5XJg+ffrZoAAAAA
TDX/LTCBzQYLKoZIhvcNAQkQAgsxgb2ggbowgaUxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1FbnRy
dXN0LCBJbmMuMTkwNwYDVQQLEzB3d3cuZW50cnVzdC5uZXQvQ1BTIGlzIGluY29ycG9yYXRlZCBi
eSByZWZlcmVuY2UxHzAdBgNVBAsTFihjKSAyMDEwIEVudHJ1c3QsIEluYy4xIjAgBgNVBAMTGUVu
dHJ1c3QgQ2xhc3MgMiBDbGllbnQgQ0ECEBeVyYPn362aAAAAAEw1/y0wDQYJKoZIhvcNAQEBBQAE
ggEACCEplAkOPhB6KdDEbUeys66W37icrJnFSFmKn5NKFTs1wO+Wq2PkMGRVFTUHc5nht8yRm17W
ZSVFBMfoutZdBJcB69G6CbBYcp5xuW+IXiRheH9/3HpeYKQY+EVgjxUMr+trxHUb1iAA5Vw1JDio
ZDp//fVq9yEV8Yug8oTZnNLCevhxxXJrtdvhfbPIhyj+zYstVZ7ckIrSAKWH3k2Sa3PGomlcdEK/
tj3klxSkrzW9USyULmqM9n+4H1Oy7zt7p7AsDqhsJJO673ZxtHoV5ER6mjYGdkDV/mW1pOwBlso2
zsxIsC3LSB9C2xcc3PyPS0l80IwUpCzKQ2xcBhdTlAAAAAAAAA==
--------------ms010701030209050402000704--


--===============0389382517251315339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============0389382517251315339==--


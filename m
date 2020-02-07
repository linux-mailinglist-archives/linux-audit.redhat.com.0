Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7AD15618B
	for <lists+linux-audit@lfdr.de>; Sat,  8 Feb 2020 00:19:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581117570;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qZ/lHuS0eYiT5wMPrSQGOgEZ6massgnXCimzBUTvuao=;
	b=GQQxH90gEj38N9LkivbTLHf1OTod8j87oho58iU1okYINtOd4Y9+RdSeCUqPodSZ4hHDAA
	Us8P4kHmPVGnJHjz4mkHcOQsqgyEGQZy214mqmdE9r6svEiXbGMD/qayKcUl5RBwrDjUuD
	iu7+gdSV2VuzvRfIxx0M64nY4BM+AMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-xd2MAQ50NkyNqzlrgEBqng-1; Fri, 07 Feb 2020 18:19:27 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACC4513FF;
	Fri,  7 Feb 2020 23:19:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA2BA1001B28;
	Fri,  7 Feb 2020 23:19:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56DF018089CD;
	Fri,  7 Feb 2020 23:19:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017NHf4Y027880 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 18:17:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CE03910F8E19; Fri,  7 Feb 2020 23:17:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C848110F1C11
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 23:17:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56378811D02
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 23:17:38 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1581117458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=neNbEVhq+7dFFPYdOvs172WNeCxYSDs5VCuPInLEq9o=;
	b=Y6q1sXGabkwyGpZaLWSEvKJtMvgQGiLGUePYfeJTro9tjU+OfCUd9AlQhW/qroZEPIEGxh
	/pXA/F2ZPFPU7FKhEl8gtRy7KIDiwV35rs4hWoEwyBk0r3zIxXYkGCQjPcTBUwv+KiYU9x
	zXmSWEBlGxkpZClVD6vVs3LP18YjSbrEJ8vC2vM7H5w/L5mYm1vDUnaWze7BW6bczVt04h
	+WveaXLZPD22wW8Svr4SwscQUuuDKA2jUySDpG9TPGVGavUfqb39nY/n2CKZFazA7yxzTM
	LUNRXdHDje/y1wOhVdSItVVPFju0UccaONJPT2uIzYG9BqZaQf/YkrTFblK6mA==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1581117458; a=rsa-sha256;
	cv=none;
	b=GrBdYYyUhFFDMiqajQLVmD8SVaqmzSW0D6pVJdhYsTQlA2zUYyohQLmVyYicNGP60WCTeJ
	j2YMzNaBvPSJvz1I/HAYPYU056pvpj31Gj/H7izyo+eOYDsWSWrLWgn+4YgJbPScde2E6U
	stxrY48arOm86HDIq4A3aoA7+2d6vaN/fFDWB2/ITfuLruEfpBiyun/UCklR4NH5gUKyaz
	5qzAufQnvKTlSl6i0Erzav5X0xqIAC7SpwLMITEFBbWZmyllJIb9NrVt63b6BvixTCqtlM
	x8clam/QtR/6ZuWQ5rYpkhyuydat8QH6wMLZAXHVBxfO0jW1Cb/qqBN5zMxHFw==
ARC-Authentication-Results: i=1; relay.mimecast.com; dkim=none;
	spf=pass (relay.mimecast.com: domain of orion@nwra.com designates
	72.52.192.72 as permitted sender) smtp.mailfrom=orion@nwra.com
Received: from mail.nwra.com (mail.nwra.com [72.52.192.72]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-99-Kc14H49pMlS5CjTicFlkig-1;
	Fri, 07 Feb 2020 18:17:33 -0500
X-MC-Unique: Kc14H49pMlS5CjTicFlkig-1
X-MC-Unique: xd2MAQ50NkyNqzlrgEBqng-1
Received: from barry.cora.nwra.com (inferno.cora.nwra.com [204.134.157.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mail.nwra.com (Postfix) with ESMTPS id 6A208340581;
	Fri,  7 Feb 2020 15:17:32 -0800 (PST)
Subject: Re: Is auditing ftruncate useful?
To: Paul Moore <paul@paul-moore.com>, Steve Grubb <sgrubb@redhat.com>,
	linux-audit@redhat.com
References: <5599a207-7054-af2e-6d10-0421154168b8@nwra.com>
	<8010cdd2-468b-ac87-54f1-2846baf28d28@nwra.com>
	<57c2b1a1-5406-4d77-9dc5-ad6c99b987a8@magitekltd.com>
	<1758232.KkKbY19U6n@x2>
	<17021a5a608.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
From: Orion Poplawski <orion@nwra.com>
Organization: NWRA
Message-ID: <4b1b8ba4-bf6a-8f8b-e388-255296152842@nwra.com>
Date: Fri, 7 Feb 2020 16:17:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <17021a5a608.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
X-Mimecast-Spam-Score: 0
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
Content-Type: multipart/mixed; boundary="===============5822244927371127546=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22

This is a cryptographically signed message in MIME format.
--===============5822244927371127546==
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms000703060608040709060304"

This is a cryptographically signed message in MIME format.
--------------ms000703060608040709060304
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/7/20 2:56 PM, Paul Moore wrote:
>=20
> On February 7, 2020 2:18:33 PM Steve Grubb <sgrubb@redhat.com> wrote:
>> On Thursday, February 6, 2020 1:33:19 PM EST Lenny Bruzenak wrote:
>>>> Doesn't seem much better:
>>>>
>>>> type=3DPROCTITLE msg=3Daudit(02/06/2020 10:58:23.626:119631) :
>>>> proctitle=3D/bin/bash /usr/bin/thunderbird
>>>> type=3DSYSCALL msg=3Daudit(02/06/2020 10:58:23.626:119631) : arch=3Dx8=
6_64
>>>> syscall=3Dftruncate success=3Dyes exit=3D0 a0=3D0x4a a1=3D0x28 a2=3D0x=
7f1e41600018
>>>> a3=3D0xfffffe00 items=3D0 ppid=3D2451 pid=3D3561 auid=3DUSER uid=3DUSE=
R gid=3DUSER
>>>> euid=3DUSER suid=3DUSER fsuid=3DUSER egid=3DUSER sgid=3DUSER fsgid=3DU=
SER tty=3D(none)
>>>> ses=3D1 comm=3Dthunderbird exe=3D/usr/lib64/thunderbird/thunderbird
>>>> subj=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
>>>> key=3Dwatched_users
>>>> Why no PATH entry?  I have them for things like open:
>>>
>>> The kernel guys can probably answer this accurately.
>>
>> I would have thought that they would have chimed in by now. Since they d=
idn't
>> you might want to file an issue on github. I think you found a problem t=
hat
>> someone should look into some day.
>=20
> One of them (me) is on vacation, and only dealing with emergencies as the=
y arise - this isn't one of those.  I'm not sure what Richard is doing, but=
 you'll get an answer when I'm back in "the office" if Richard doesn't comm=
ent first.
>=20
> That said, it's always okay to file a GH issue.
>=20
> --
> paul moore
> www.paul-moore.com

Thanks, filed here:

https://github.com/linux-audit/audit-kernel/issues/119

--=20
Orion Poplawski
Manager of NWRA Technical Systems          720-772-5637
NWRA, Boulder/CoRA Office             FAX: 303-415-9702
3380 Mitchell Lane                       orion@nwra.com
Boulder, CO 80301                 https://www.nwra.com/


--------------ms000703060608040709060304
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
hkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIwMDIwNzIzMTczMVowLwYJKoZIhvcNAQkEMSIEILm4
Uu5YPs/Bm/bi9vusQjL0Irxmx4EVCQly4tuiLicXMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwIC
AUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgcsGCSsGAQQBgjcQBDGBvTCBujCBpTELMAkGA1UE
BhMCVVMxFjAUBgNVBAoTDUVudHJ1c3QsIEluYy4xOTA3BgNVBAsTMHd3dy5lbnRydXN0Lm5ldC9D
UFMgaXMgaW5jb3Jwb3JhdGVkIGJ5IHJlZmVyZW5jZTEfMB0GA1UECxMWKGMpIDIwMTAgRW50cnVz
dCwgSW5jLjEiMCAGA1UEAxMZRW50cnVzdCBDbGFzcyAyIENsaWVudCBDQQIQF5XJg+ffrZoAAAAA
TDX/LTCBzQYLKoZIhvcNAQkQAgsxgb2ggbowgaUxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1FbnRy
dXN0LCBJbmMuMTkwNwYDVQQLEzB3d3cuZW50cnVzdC5uZXQvQ1BTIGlzIGluY29ycG9yYXRlZCBi
eSByZWZlcmVuY2UxHzAdBgNVBAsTFihjKSAyMDEwIEVudHJ1c3QsIEluYy4xIjAgBgNVBAMTGUVu
dHJ1c3QgQ2xhc3MgMiBDbGllbnQgQ0ECEBeVyYPn362aAAAAAEw1/y0wDQYJKoZIhvcNAQEBBQAE
ggEAamWsnzFy4Dc+aAepyGIicupPJTj2j1SX404BVf8IMHEYCILgjR1i+Yr3bORvkO67igvIt5Yw
DR5VN7FR6uPF9KNlcKWJnK8U9zwHDeX87K/KSriv7+/Xcdc00jDox9updTw9zIRYMqxersBt0iVe
jTt2li3QE0mDVr/r8KWUqlU/+f+HnJgEXYWJFCDkVi4zkYV9Jj8pWqXcuwNJ6iijcRHv3BpUYmad
tSZQWkMRYwbjflxSVMMiucRwVvZgAlHJujszb2mTO/ZXYkXs0STnB73rk/K5QhKwoWWfsJ8EzVTq
DgP/ai9ZoTunzxDLMQK1NzYhXLWCMMmiRNZlz96DrwAAAAAAAA==
--------------ms000703060608040709060304--


--===============5822244927371127546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============5822244927371127546==--


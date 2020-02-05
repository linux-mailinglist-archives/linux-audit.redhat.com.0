Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 31ABA1544E1
	for <lists+linux-audit@lfdr.de>; Thu,  6 Feb 2020 14:29:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580995758;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=5raCgUyFHZCYdl7lvG6gl9IS4yN9HOLrDYEwA+iCDuA=;
	b=YkDaYau3QVJRTT19pJZQZ/L0oVYhSj/BrcYGsFmQYL806GqedxaOGKkrMmXQGA2Bc2+R/F
	gDhjFKMevmac0+DOLdshqOcAedmxbqiWychU8WsURW+ViR/10CisuXuaSiev5hMmVucXSx
	U+Q3MXHEUcQtvyO0peoM8SnEcIQ/Zt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-qtVp-txrOPSC5JnvOLqPZw-1; Thu, 06 Feb 2020 08:29:14 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E84F6101FC6B;
	Thu,  6 Feb 2020 13:29:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C509790F7;
	Thu,  6 Feb 2020 13:29:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2109018095FF;
	Thu,  6 Feb 2020 13:29:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015NRvlN029163 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 18:27:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 19F602037E43; Wed,  5 Feb 2020 23:27:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1465520316F9
	for <linux-audit@redhat.com>; Wed,  5 Feb 2020 23:27:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9843F1017E42
	for <linux-audit@redhat.com>; Wed,  5 Feb 2020 23:27:54 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1580945274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=IMjcItWqAOXrOwr9BfzGvWPPZ2Efw/zhrC+hyKSDpzw=;
	b=N0IUG3HPCts2LNEK08MOPJ/7sOPHe//R2FZgGPigxGf34auxUu2s3+dcVyRJ3m4gaI7KiD
	z6qN+vgBVuQo+lkDgrKnAmQjl7qod8UfoHI9Tc1LqT3Wyp9Lx0CyM2dSbboclqmIGuRq1H
	KMrF/qBhRXL4PWMVCXHZwCCbx5/lZ1jmZaAC7xUKASr8Od87wlFfuc0QXANxFoxdEf45JD
	Kji5bznb016FTsHFMgFbUVa2LYDSSpAIWpuo3I3ELy3SC2aMffhxm7cW67V541IGvoMrdH
	fcXTP8rI5XYej1xrOrkxQtbQTEz8wTYz6vqICyPmIi4aBWQ3joj+9m7HBNMs6g==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1580945274; a=rsa-sha256;
	cv=none;
	b=kves9JazbDrKZgg74bnLi4Cvl8UoyX8RbbllHc2GFRMLWMMGFRqrL3ab+DuS57TdkZY8nt
	oLrzl6EIWEE+etdKPlZ0gjP6fAGH32lNJKckrJ+jn6edlPB0Qr+UogNKt7b4VcM3XI/aiB
	hpjQZc3pVP8Jq7pjWsOLX2kW2WofIy44OrYnK+YqeUXQr7obxUo5JihPLSXSx3yk33u6u7
	UmtROTNxXbDFrSaBJWDjzMLeZHWw38G10fW1FTHSABvOnUwpqGQ43OBVF7Z6+zrQ5leKm2
	w75KAvXKnpPBrx8gy0dgyoZIWwYtcWAS9uwVzCIAsCGht7/+YlaKAE0MYgzHPg==
ARC-Authentication-Results: i=1; relay.mimecast.com; dkim=none;
	spf=pass (relay.mimecast.com: domain of orion@nwra.com designates
	72.52.192.72 as permitted sender) smtp.mailfrom=orion@nwra.com
Received: from mail.nwra.com (mail.nwra.com [72.52.192.72]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-90-_58DRAi5Mv6Sj3IonGKn8Q-1;
	Wed, 05 Feb 2020 18:27:52 -0500
X-MC-Unique: _58DRAi5Mv6Sj3IonGKn8Q-1
X-MC-Unique: qtVp-txrOPSC5JnvOLqPZw-1
Received: from barry.cora.nwra.com (inferno.cora.nwra.com [204.134.157.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mail.nwra.com (Postfix) with ESMTPS id 839253403C5
	for <linux-audit@redhat.com>; Wed,  5 Feb 2020 15:27:51 -0800 (PST)
To: linux-audit@redhat.com
From: Orion Poplawski <orion@nwra.com>
Subject: Is auditing ftruncate useful?
Organization: NWRA
Message-ID: <5599a207-7054-af2e-6d10-0421154168b8@nwra.com>
Date: Wed, 5 Feb 2020 16:27:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:27:45 -0500
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
Content-Type: multipart/mixed; boundary="===============3950961760036046525=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15

This is a cryptographically signed message in MIME format.
--===============3950961760036046525==
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms020807090502030302080706"

This is a cryptographically signed message in MIME format.
--------------ms020807090502030302080706
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

I would like to track file modifications made by a specific UID.  I have:

-a exit,never -F dir=3D/proc/
-a exit,never -F dir=3D/var/cache/
-a exit,never -F path=3D/etc/passwd -F exe=3D/usr/bin/kdeinit4
-a exit,never -F exe=3D/usr/libexec/gam_server
-a always,exit -F arch=3Db32 -S
open,truncate,ftruncate,creat,openat,open_by_handle_at -F uid=3DXXXXX -k
watched_users
-a always,exit -F arch=3Db64 -S
open,truncate,ftruncate,creat,openat,open_by_handle_at -F uid=3DXXXXX -k
watched_users

but as near as I can tell, this is all that gets logged for ftruncate:


type=3DSYSCALL msg=3Daudit(1580944297.114:831002): arch=3Dc000003e syscall=
=3D77
success=3Dyes exit=3D0 a0=3D33 a1=3D28 a2=3D7f3417100018 a3=3D1 items=3D0 p=
pid=3D23746
pid=3D23816 auid=3DXXXXX uid=3DXXXXX gid=3DXXXXX euid=3DXXXXX suid=3DXXXXX =
fsuid=3DXXXXX
egid=3DXXXXX sgid=3DXXXXX fsgid=3DXXXXX tty=3D(none) ses=3D1 comm=3D5765622=
0436F6E74656E74
exe=3D"/usr/lib64/firefox/firefox"
subj=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=3D"watched=
_users"
type=3DPROCTITLE msg=3Daudit(1580944297.114:831002):
proctitle=3D2F7573722F6C696236342F66697265666F782F66697265666F78002D636F6E7=
4656E7470726F63002D6368696C6449440031002D6973466F7242726F77736572002D707265=
66734C656E0031002D707265664D617053697A6500313833303834002D706172656E7442756=
96C644944003230323030313133313131393133002D

which does not appear to contain enough information to determine what file =
was
truncated.  Am I missing something?

This is on EL7.

Thanks!

--=20
Orion Poplawski
Manager of NWRA Technical Systems          720-772-5637
NWRA, Boulder/CoRA Office             FAX: 303-415-9702
3380 Mitchell Lane                       orion@nwra.com
Boulder, CO 80301                 https://www.nwra.com/


--------------ms020807090502030302080706
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
hkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIwMDIwNTIzMjc1MFowLwYJKoZIhvcNAQkEMSIEIE+R
xQg/Ihl1qNaXAlfr+HGnD+yIFkFy25nVfgCiP93yMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwIC
AUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgcsGCSsGAQQBgjcQBDGBvTCBujCBpTELMAkGA1UE
BhMCVVMxFjAUBgNVBAoTDUVudHJ1c3QsIEluYy4xOTA3BgNVBAsTMHd3dy5lbnRydXN0Lm5ldC9D
UFMgaXMgaW5jb3Jwb3JhdGVkIGJ5IHJlZmVyZW5jZTEfMB0GA1UECxMWKGMpIDIwMTAgRW50cnVz
dCwgSW5jLjEiMCAGA1UEAxMZRW50cnVzdCBDbGFzcyAyIENsaWVudCBDQQIQF5XJg+ffrZoAAAAA
TDX/LTCBzQYLKoZIhvcNAQkQAgsxgb2ggbowgaUxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1FbnRy
dXN0LCBJbmMuMTkwNwYDVQQLEzB3d3cuZW50cnVzdC5uZXQvQ1BTIGlzIGluY29ycG9yYXRlZCBi
eSByZWZlcmVuY2UxHzAdBgNVBAsTFihjKSAyMDEwIEVudHJ1c3QsIEluYy4xIjAgBgNVBAMTGUVu
dHJ1c3QgQ2xhc3MgMiBDbGllbnQgQ0ECEBeVyYPn362aAAAAAEw1/y0wDQYJKoZIhvcNAQEBBQAE
ggEAEUvsm8IjqQYiQdl343WEenOAJjj1E47NqUkoz6Zz12+hxXZOWTR2aS2ohZalZgXR4GJiLl9+
02iQSPNAjn2Jj2Enc1geV+gC1a63H/7nrQ3tsQHX21Op5Jxm4IqX1q4opWhE68s8yrNokXLPTjRC
X/1KeN/BX2xRF/g4ufhwQSTKE2AhWJCUaz2t0Fe2DnZvoKIkfzrXs5kUD7PVOQ77szYHrqHUmcWL
YPRH22CtFOJEEtA6MiV8KM41mfKSEPbh/+3y7DGIKDXoaPWNLTBhV4xE+ujd44VhaPQgju9ICCGv
4yHjChT2VBUQfrfgaU7DMH/kh353fllrGDbXXaDCaQAAAAAAAA==
--------------ms020807090502030302080706--


--===============3950961760036046525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============3950961760036046525==--


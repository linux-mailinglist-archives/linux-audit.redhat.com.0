Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9EE1585EA
	for <lists+linux-audit@lfdr.de>; Tue, 11 Feb 2020 00:06:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581376010;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=yaSRLPYjeg95fzbeM2k2gVlkUexCInzJDJC4YrKkZEc=;
	b=TlATBCBRuALoINA2flGFkVDFB85RlMTbxz9LWxr6gZ5oV7QivQRnhZADuYB0Ae5YdW3U+l
	R6i/bqVAidW3tr3U1jjUWRqKXe51zjLu2PNxGDu/wZ0qvLWE51vnaClsDwsQS2KrevZ6sG
	zt3eREdp3lzw+/gVXFm3nwBdeeD67Hk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-8RkJYTfEPiGusBBp2erq1Q-1; Mon, 10 Feb 2020 18:06:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 530841005514;
	Mon, 10 Feb 2020 23:06:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BFAE5C1D4;
	Mon, 10 Feb 2020 23:06:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CC3E18089CD;
	Mon, 10 Feb 2020 23:06:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01AN6668014050 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 18:06:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 95CC5B3517; Mon, 10 Feb 2020 23:06:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9186AAF985
	for <linux-audit@redhat.com>; Mon, 10 Feb 2020 23:06:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AB4A8012C7
	for <linux-audit@redhat.com>; Mon, 10 Feb 2020 23:06:04 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1581375964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=G1Wj1A5RpCmhyljJLMX7oOZvb8BE+rMatePMwNdzm98=;
	b=fAqKj2VvrPnucJk9XXUg72mOFclvkjUlhOQuc5wtXYPNBQ3lVI9Xi5DRbAoaSgSexwTyOt
	JnYyD1HWbaF+8AK/g5MX0D/1Qv7IzNENnyX1TemuOdm+1fM4VgWjIoc1nXs3PzeGnkmo/L
	2JdknHY4kGH235st5H6aGVzb32MLDGNB/zCzr2rmnDVWxMopFJhbOAQLHXfEd623rEVP4U
	En/Xrr3EPO7hIVvePvTKA7256+u7uF+hBbOIwnqRN1E8/Zv+0B8hOhMnr15iJJimtNiE9z
	GxEouWuSd9claptmnx0I/1SPjFj79O3OCr36swkxvyt9/AIlFZQ6v4zZzeTdzg==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1581375964; a=rsa-sha256;
	cv=none;
	b=Tbt8ZmojEfMVZHr1Xi/SconvKYtVYLXrIC9tF0M0iYylA+yy1VajnpdAtzBDnlA+up1+pG
	h9tMvpMDtZpnHtIsaQZDXjiV00lmNnwponXwyiaHHsynVx0q0fq+/kVAYT0306MNI3eWLV
	OO9jJeZcXtOinqp+wwuOF6PrZLwUFzUDKjLXDRCohqQZ55mHZJQvCWtYDeFS4N6Jm/haWn
	gOUmX2VyIbleywSC04cViF6qf1YJIpJ376VwK0AE7vBCRwdEw+ZqACgUG1Qe51mtbflzFX
	jwcMbkJkWBAY/vLkFw4t4k1B2YF9qkXaGqXt/XHAPqt3qLTbIjnnTle/ToIO/Q==
ARC-Authentication-Results: i=1; relay.mimecast.com; dkim=none;
	spf=pass (relay.mimecast.com: domain of orion@nwra.com designates
	72.52.192.72 as permitted sender) smtp.mailfrom=orion@nwra.com
Received: from mail.nwra.com (mail.nwra.com [72.52.192.72]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-298-xt2eZqFtMVqkJNhdzhd9XQ-1;
	Mon, 10 Feb 2020 18:05:54 -0500
X-MC-Unique: xt2eZqFtMVqkJNhdzhd9XQ-1
X-MC-Unique: 8RkJYTfEPiGusBBp2erq1Q-1
Received: from barry.cora.nwra.com (inferno.cora.nwra.com [204.134.157.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mail.nwra.com (Postfix) with ESMTPS id C5EA834070D;
	Mon, 10 Feb 2020 15:05:52 -0800 (PST)
Subject: Re: Is auditing ftruncate useful?
To: Paul Moore <paul@paul-moore.com>, Steve Grubb <sgrubb@redhat.com>,
	linux-audit@redhat.com
References: <5599a207-7054-af2e-6d10-0421154168b8@nwra.com>
	<8010cdd2-468b-ac87-54f1-2846baf28d28@nwra.com>
	<57c2b1a1-5406-4d77-9dc5-ad6c99b987a8@magitekltd.com>
	<1758232.KkKbY19U6n@x2>
	<17021a5a608.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
	<CAHC9VhRhCQook8wPcYTb6Xfr0v+fqszzHxuVGzZxmK5N1KPzcw@mail.gmail.com>
From: Orion Poplawski <orion@nwra.com>
Organization: NWRA
Message-ID: <4b16e97a-49d7-d558-0d87-7cdff23888b5@nwra.com>
Date: Mon, 10 Feb 2020 16:05:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRhCQook8wPcYTb6Xfr0v+fqszzHxuVGzZxmK5N1KPzcw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2169443264685565456=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16

This is a cryptographically signed message in MIME format.
--===============2169443264685565456==
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms040708050006010400040209"

This is a cryptographically signed message in MIME format.
--------------ms040708050006010400040209
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/10/20 3:54 PM, Paul Moore wrote:
> On Fri, Feb 7, 2020 at 4:56 PM Paul Moore <paul@paul-moore.com> wrote:
>> On February 7, 2020 2:18:33 PM Steve Grubb <sgrubb@redhat.com> wrote:
>>> On Thursday, February 6, 2020 1:33:19 PM EST Lenny Bruzenak wrote:
>>>>> Doesn't seem much better:
>>>>>
>>>>> type=3DPROCTITLE msg=3Daudit(02/06/2020 10:58:23.626:119631) :
>>>>> proctitle=3D/bin/bash /usr/bin/thunderbird
>>>>> type=3DSYSCALL msg=3Daudit(02/06/2020 10:58:23.626:119631) : arch=3Dx=
86_64
>>>>> syscall=3Dftruncate success=3Dyes exit=3D0 a0=3D0x4a a1=3D0x28 a2=3D0=
x7f1e41600018
>>>>> a3=3D0xfffffe00 items=3D0 ppid=3D2451 pid=3D3561 auid=3DUSER uid=3DUS=
ER gid=3DUSER
>>>>> euid=3DUSER suid=3DUSER fsuid=3DUSER egid=3DUSER sgid=3DUSER fsgid=3D=
USER tty=3D(none)
>>>>> ses=3D1 comm=3Dthunderbird exe=3D/usr/lib64/thunderbird/thunderbird
>>>>> subj=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
>>>>> key=3Dwatched_users
>>>>> Why no PATH entry?  I have them for things like open:
>>>>
>>>> The kernel guys can probably answer this accurately.
>>>
>>> I would have thought that they would have chimed in by now. Since they =
didn't
>>> you might want to file an issue on github. I think you found a problem =
that
>>> someone should look into some day.
>>
>> One of them (me) is on vacation, and only dealing with emergencies as th=
ey arise - this isn't one of those.  I'm not sure what Richard is doing, bu=
t you'll get an answer when I'm back in "the office" if Richard doesn't com=
ment first.
>>
>> That said, it's always okay to file a GH issue.
>=20
> Generally speaking the only syscalls which generate a PATH record are
> those syscalls which take a file pathname as an argument.  The reason
> why is that pathnames are notoriously transient and are only valid for
> the instant they actually resolve to a file; in fact it is possible
> that by the time an open(2) syscall returns the fd to the calling
> application, the file it opened may no longer be accessible at the
> pathname used to open the file.  It really is that crazy.
>=20
> In the case of ftruncate(2) we see that the syscall doesn't take a
> pathname argument, it takes an open file descriptor, this is why you
> don't see a PATH record.  If we compare it to a syscall which does
> take a pathname, e.g. chown(2), we will generate a PATH record.  Take
> the example below where we use the example program found in the
> chown(2) manpage:
>=20
> # touch /tmp/test
> # auditctl -w /tmp/test -k path_test
> # gcc -o chown_test -g chown_test.c
> # ./chown_test
> ./chown_test <owner> <file>
> # ./chown_test nobody /tmp/test
> # ausearch -i -k path_test
> ----
> type=3DCONFIG_CHANGE msg=3Daudit(02/10/2020 17:50:45.251:255) : auid=3Dro=
ot ses=3D5 subj
> =3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 op=3Dadd_rule ke=
y=3Dpath_test
> list=3Dexit res=3Dyes
> ----
> type=3DPROCTITLE msg=3Daudit(02/10/2020 17:51:29.356:258) : proctitle=3D.=
/chown_test n
> obody /tmp/test
> type=3DPATH msg=3Daudit(02/10/2020 17:51:29.356:258) : item=3D0 name=3D/t=
mp/test inode=3D7
> 0660 dev=3D00:21 mode=3Dfile,644 ouid=3Droot ogid=3Droot rdev=3D00:00 obj=
=3Dunconfined_u:obj
> ect_r:user_tmp_t:s0 nametype=3DNORMAL cap_fp=3Dnone cap_fi=3Dnone cap_fe=
=3D0 cap_fver=3D0
> cap_frootid=3D0
> type=3DCWD msg=3Daudit(02/10/2020 17:51:29.356:258) : cwd=3D/root/tmp
> type=3DSYSCALL msg=3Daudit(02/10/2020 17:51:29.356:258) : arch=3Dx86_64 s=
yscall=3Dchown
> success=3Dyes exit=3D0 a0=3D0x7ffc820c0603 a1=3Dnobody a2=3Dunset a3=3D0x=
40044e items=3D1 ppid
> =3D1678 pid=3D35451 auid=3Droot uid=3Droot gid=3Droot euid=3Droot suid=3D=
root fsuid=3Droot egid=3D
> root sgid=3Droot fsgid=3Droot tty=3Dpts1 ses=3D5 comm=3Dchown_test exe=3D=
/root/tmp/chown_tes
> t subj=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=3Dpath=
_test
>=20
> ... in the example above we see that we do have a PATH record, as expecte=
d.
>=20

So, this is all reasonable.  But why do I get this with fchown which also
takes a file descriptor?

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

It's this disparity between fchown and ftruncate that caught my attention.

--=20
Orion Poplawski
Manager of NWRA Technical Systems          720-772-5637
NWRA, Boulder/CoRA Office             FAX: 303-415-9702
3380 Mitchell Lane                       orion@nwra.com
Boulder, CO 80301                 https://www.nwra.com/


--------------ms040708050006010400040209
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
hkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIwMDIxMDIzMDU1MVowLwYJKoZIhvcNAQkEMSIEIPNb
Ga3CHoiYtLPYPXpX6cQjwsPWVlXexAfXkdmq/SbOMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwIC
AUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgcsGCSsGAQQBgjcQBDGBvTCBujCBpTELMAkGA1UE
BhMCVVMxFjAUBgNVBAoTDUVudHJ1c3QsIEluYy4xOTA3BgNVBAsTMHd3dy5lbnRydXN0Lm5ldC9D
UFMgaXMgaW5jb3Jwb3JhdGVkIGJ5IHJlZmVyZW5jZTEfMB0GA1UECxMWKGMpIDIwMTAgRW50cnVz
dCwgSW5jLjEiMCAGA1UEAxMZRW50cnVzdCBDbGFzcyAyIENsaWVudCBDQQIQF5XJg+ffrZoAAAAA
TDX/LTCBzQYLKoZIhvcNAQkQAgsxgb2ggbowgaUxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1FbnRy
dXN0LCBJbmMuMTkwNwYDVQQLEzB3d3cuZW50cnVzdC5uZXQvQ1BTIGlzIGluY29ycG9yYXRlZCBi
eSByZWZlcmVuY2UxHzAdBgNVBAsTFihjKSAyMDEwIEVudHJ1c3QsIEluYy4xIjAgBgNVBAMTGUVu
dHJ1c3QgQ2xhc3MgMiBDbGllbnQgQ0ECEBeVyYPn362aAAAAAEw1/y0wDQYJKoZIhvcNAQEBBQAE
ggEAEh6GFnmB0EsZ03LQly8ApkEF9WJvB3OqNRreVdXDR/38yUbOXBBhmJf6hIzOp4xJ2gj3ypJX
pvbY1o/ecTPJh2e5Dir36Cdh6DsAJW3+DmEbR2DV06SNKpZ/7rkI5e3Aqk2WGuWTfTU9HljjgRPz
MZenmzZev+/BXXqUlbvfaClTX5RxWUx7u/2VgsKkT4aicwYrpW4NQNGm+c5TpUTDU47BjT6NC6V+
Ru9desOWRsL6eT+3vZqHHYCqQhJoh6NwFokUoNAKMyhZCOxZFzgQ614o3FTOMkb4fHIVMLcOt7Js
lZPoi0stWrjRi6dCZrDKUJe0Uv2E6E2i/WXld7BG+gAAAAAAAA==
--------------ms040708050006010400040209--


--===============2169443264685565456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============2169443264685565456==--


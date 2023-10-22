Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B9F7D211F
	for <lists+linux-audit@lfdr.de>; Sun, 22 Oct 2023 07:28:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697952481;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fqe9mzTGwbKcEO0U/sFOmD3dCOJuxFZvVRZ0dsM3F3M=;
	b=HxYPGIdkE/VoGHIMK43fVO+z1bBRgPwtxATjF8nYcnDqNA+dJadNqNfcJX30xACTv21naX
	ywRQna7cSAEFeiX7NJ6e7eyecNGUDgAsgi6lgPdTs7mjPUi67pCXPgh3Ta5rZkuHuzU8FH
	x/4JOim3ustUzirzJczCAUwFML3y2hw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-r-MjH9iqP6yznIl5ZGPLfA-1; Sun, 22 Oct 2023 01:27:51 -0400
X-MC-Unique: r-MjH9iqP6yznIl5ZGPLfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08380101B061;
	Sun, 22 Oct 2023 05:27:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE4E825C0;
	Sun, 22 Oct 2023 05:27:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AE95E1946594;
	Sun, 22 Oct 2023 05:27:36 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9A6261946587 for <linux-audit@listman.corp.redhat.com>;
 Sun, 22 Oct 2023 05:27:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 41554C1596D; Sun, 22 Oct 2023 05:27:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A4E0C15BB8
 for <linux-audit@redhat.com>; Sun, 22 Oct 2023 05:27:34 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A517857CFA
 for <linux-audit@redhat.com>; Sun, 22 Oct 2023 05:27:34 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-H0ojvYNnOsaveT4wkUX6SQ-1; Sun, 22 Oct 2023 01:27:21 -0400
X-MC-Unique: H0ojvYNnOsaveT4wkUX6SQ-1
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2c504a5e1deso35482291fa.2
 for <linux-audit@redhat.com>; Sat, 21 Oct 2023 22:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697952440; x=1698557240;
 h=content-transfer-encoding:in-reply-to:from:to:references
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kR3ZnRPnUcalTHs9UB6vfbNSBeE6dG0K6QWo64VSZUM=;
 b=V8g1zllCab94rcXWh/n237eKIusAtm6X7Ys1ciXg0wGXHqlMUpfcNmECoHsjJndiaW
 pfkmzpNMZvBzUlFWesZ/j2bHpcKLoNAeFENyCdNtcIsXLFKME14bbvst1GCG4KUiDTS8
 EEp9d2faQ6SdJomk1GOzQnA1dng1r7tKFZ5tZ0mI1mKu36KYzaw2xJz2cn886PjkZP87
 DjBzFCWQFCeLtFGGarcMiq6BMMDOh72M6CWM9Nu/Z3kAoSJjv+SKgckQM24xvFtVnE/2
 VS51dzv8UZ7I3kNTFqkwwoTOr7pCBNQDZBbIDfordM20/AUqOG997CIItWcMUX4SdKEL
 Gz9Q==
X-Gm-Message-State: AOJu0YyQ0LCiq1QSMg3egWcmui0FNqdg+jUmuzWO6RAqbsMppQAlJhxM
 rJOASuKyr/z4jZtgVHweLWKFhsnhHoE=
X-Google-Smtp-Source: AGHT+IFmDwY0awNFJIRuGvxiOt+KjFaG5e9zBxk25NLBNnOCptKbN37v2wLNVcEvmCah+kB8iCNMcA==
X-Received: by 2002:a2e:80ce:0:b0:2c4:fef7:c41e with SMTP id
 r14-20020a2e80ce000000b002c4fef7c41emr3627829ljg.0.1697952439692; 
 Sat, 21 Oct 2023 22:27:19 -0700 (PDT)
Received: from [100.64.16.101] ([188.254.110.10])
 by smtp.gmail.com with ESMTPSA id
 a36-20020a05651c212400b002bcbae4c21fsm1057152ljq.50.2023.10.21.22.27.19
 for <linux-audit@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Oct 2023 22:27:19 -0700 (PDT)
Message-ID: <d1d9dd09-3c95-4488-ba05-f2d655895a2c@gmail.com>
Date: Sun, 22 Oct 2023 08:27:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Couldn't get audit messages for 'listen' on kernel 4.19.0-6-686-pae
References: <0c22c924-2c1d-4a4f-a4f2-ea477999c8a4@kaspersky.com>
To: linux-audit@redhat.com
From: Rinat Gadelshin <rgadelsh@gmail.com>
In-Reply-To: <0c22c924-2c1d-4a4f-a4f2-ea477999c8a4@kaspersky.com>
X-Forwarded-Message-Id: <0c22c924-2c1d-4a4f-a4f2-ea477999c8a4@kaspersky.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, ru-RU
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGVsbG8gdGhlcmUhCgpJJ20gZmFjaW5nIGEgc3RyYW5nZSBwcm9ibGVtLgpJIGhhdmUgbm90IGJl
ZW4gYWJsZSB0byBnZXQgYXVkaXQgcmVwb3J0cyBmb3IgYW55ICJuZXR3b3JrIiBzeXNjYWxsCm9u
IG9uZSBvZiB0aGUgY29tcHV0ZXJzIGZyb20gbXkgdGVzdCBiZW5jaC4KSSBtZWFuICdjb25uZWN0
JywgJ2FjY2VwdDQnLCAnbGlzdGVuJywgJ2JpbmQnLCAnc29ja2V0Jy4KVGhlIGZvbGxvd2luZyBl
eGFtcGxlIHNob3dzIHRoYXQgYXVkaXRkIGNvdWxkbid0IGdldCB0aGVtIHRvbyAoJ2xpc3Rlbicg
CmF0IGxlYXN0KS4KQnV0IEkndmUgcmVjZWl2ZWQgYSByZXBvcnQgYWJvdXQgJ2V4ZWN2ZScgY2Fs
bGVkIGJ5IHRoZSBzYW1lIHByb2Nlc3MuCgpDb3VsZCB5b3UgdGVsbCBtZSB3aGF0IGNhbiBJIGRv
IGluIG9yZGVyIHRvIHJlY2VpdmUgYXVkaXQgbWVzc2FnZXMgZm9yIAp0aGUgc3lzY2FsbHMuCmZy
b20gdGhpcyB2ZXJzaW9uIG9mIHRoZSBrZXJuZWw/CgpBbnkgaGVscCB3aWxsIGJlIHdpbGwgYmUg
YXBwcmVjaWF0ZWQuCgoKcm9vdEBkZWIxMDEteDg2LTAwMDk6fiMgbmV0Y2F0IC12IC1sIC1wIDQy
NDIgJgpbMl0gMTM0ODEKcm9vdEBkZWIxMDEteDg2LTAwMDk6fiMgbGlzdGVuaW5nIG9uIFthbnld
IDQyNDIgLi4uCnJvb3RAZGViMTAxLXg4Ni0wMDA5On4jIGVjaG8gIlRlc3QiIHwgbmMgLXEgMCAx
MjcuMC4wLjEgNDI0Mgpjb25uZWN0IHRvIFsxMjcuMC4wLjFdIGZyb20gbG9jYWxob3N0IFsxMjcu
MC4wLjFdIDM2NjUwClRlc3QKcm9vdEBkZWIxMDEteDg2LTAwMDk6fiMgc2tpbGwgLXAgMTM0ODEK
WzJdK8KgIERvbmXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuZXRjYXQg
LXYgLWwgLXAgNDI0Mgpyb290QGRlYjEwMS14ODYtMDAwOTp+IyBhdXNlYXJjaCAtcCAxMzQ4MQot
LS0tCnRpbWUtPkZyaSBPY3QgMjAgMjI6MDA6NDIgMjAyMwp0eXBlPVBST0NUSVRMRSBtc2c9YXVk
aXQoMTY5NzgyODQ0Mi42MDM6MjY5Nyk6IApwcm9jdGl0bGU9NkU2NTc0NjM2MTc0MDAyRDc2MDAy
RDZDMDAyRDcwMDAzNDMyMzQzMgp0eXBlPVBBVEggbXNnPWF1ZGl0KDE2OTc4Mjg0NDIuNjAzOjI2
OTcpOiBpdGVtPTEgCm5hbWU9Ii9saWIvbGQtbGludXguc28uMiIgaW5vZGU9NjU1MzgyIGRldj1m
ZTowMCBtb2RlPTAxMDA3NTUgb3VpZD0wIApvZ2lkPTAgcmRldj0wMDowMCBuYW1ldHlwZT1OT1JN
QUwgY2FwX2ZwPTAwMDAwMDAwMDAwMDAwMDAgCmNhcF9maT0wMDAwMDAwMDAwMDAwMDAwIGNhcF9m
ZT0wIGNhcF9mdmVyPTAKdHlwZT1QQVRIIG1zZz1hdWRpdCgxNjk3ODI4NDQyLjYwMzoyNjk3KTog
aXRlbT0wIG5hbWU9Ii91c3IvYmluL25ldGNhdCIgCmlub2RlPTY2NDg4NyBkZXY9ZmU6MDAgbW9k
ZT0wMTAwNzU1IG91aWQ9MCBvZ2lkPTAgcmRldj0wMDowMCAKbmFtZXR5cGU9Tk9STUFMIGNhcF9m
cD0wMDAwMDAwMDAwMDAwMDAwIGNhcF9maT0wMDAwMDAwMDAwMDAwMDAwIGNhcF9mZT0wIApjYXBf
ZnZlcj0wCnR5cGU9Q1dEIG1zZz1hdWRpdCgxNjk3ODI4NDQyLjYwMzoyNjk3KTogY3dkPSIvcm9v
dCIKdHlwZT1FWEVDVkUgbXNnPWF1ZGl0KDE2OTc4Mjg0NDIuNjAzOjI2OTcpOiBhcmdjPTUgYTA9
Im5ldGNhdCIgYTE9Ii12IiAKYTI9Ii1sIiBhMz0iLXAiIGE0PSI0MjQyIgp0eXBlPVNZU0NBTEwg
bXNnPWF1ZGl0KDE2OTc4Mjg0NDIuNjAzOjI2OTcpOiBhcmNoPTQwMDAwMDAzIHN5c2NhbGw9MTEg
CnN1Y2Nlc3M9eWVzIGV4aXQ9MCBhMD1lMzY0MDAgYTE9ZDlkOWUwIGEyPWUzYTMxMCBhMz01ODQ5
ODggaXRlbXM9MiAKcHBpZD0xMjk2OCBwaWQ9MTM0ODEgYXVpZD0wIHVpZD0wIGdpZD0wIGV1aWQ9
MCBzdWlkPTAgZnN1aWQ9MCBlZ2lkPTAgCnNnaWQ9MCBmc2dpZD0wIHR0eT1wdHMxIHNlcz00IGNv
bW09Im5ldGNhdCIgCmV4ZT0iL3Vzci9iaW4vbmMudHJhZGl0aW9uYWwiIHN1Ymo9PXVuY29uZmlu
ZWQga2V5PShudWxsKQpyb290QGRlYjEwMS14ODYtMDAwOTp+IyBhdWRpdGN0bCAtbAotYSBhbHdh
eXMsZXhpdCAtRiBhcmNoPWIzMiAtUyBmb3JrLGV4ZWN2ZSxjbG9uZSx2Zm9yayxleGVjdmVhdAot
YSBhbHdheXMsZXhpdCAtRiBhcmNoPWIzMiAtUyBiaW5kLGNvbm5lY3QsbGlzdGVuLGFjY2VwdDQK
cm9vdEBkZWIxMDEteDg2LTAwMDk6fiMgYXVkaXRjdGwgLXMKZW5hYmxlZCAxCmZhaWx1cmUgMQpw
aWQgMTMzOTMKcmF0ZV9saW1pdCAwCmJhY2tsb2dfbGltaXQgODE5Mgpsb3N0IDAKYmFja2xvZyAw
CmJhY2tsb2dfd2FpdF90aW1lIDAKbG9naW51aWRfaW1tdXRhYmxlIDAgdW5sb2NrZWQKcm9vdEBk
ZWIxMDEteDg2LTAwMDk6fiMgdW5hbWUgLWEKTGludXggZGViMTAxLXg4Ni0wMDA5LmF2cC5ydS5s
b2NhbCA0LjE5LjAtNi02ODYtcGFlICMxIFNNUCBEZWJpYW4gCjQuMTkuNjctMitkZWIxMHUyICgy
MDE5LTExLTExKSBpNjg2IEdOVS9MaW51eApyb290QGRlYjEwMS14ODYtMDAwOTp+IyBjYXQgL2V0
Yy9kZWJpYW5fdmVyc2lvbgoxMC4xCnJvb3RAZGViMTAxLXg4Ni0wMDA5On4jCgoKUmVnYXJkcwpS
aW5hdAoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20K
aHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=


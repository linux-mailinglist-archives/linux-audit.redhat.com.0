Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1CF6FDD89
	for <lists+linux-audit@lfdr.de>; Wed, 10 May 2023 14:17:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683721020;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KUV7wVUAUltQpVWPYrh7nGpPfU92H9I9oKT7U25678Y=;
	b=GkXTPTS0z2SB1bRX5rnl2LwppstqLUtvcBVGJwQs/y69tY+52MVx7wZz/nn2Um8SfncgfD
	8pkOgLduFO8RSGf4y6YM/wZCEjLlPwxzvTjZ/vrGGVG7DszWPF4HoTPWQyllKtkoYni//i
	4e8He1gicO7QKVnWkrSeT1HLrfglucQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-JyUvvG-cNF6Hg10FTMShCw-1; Wed, 10 May 2023 08:16:58 -0400
X-MC-Unique: JyUvvG-cNF6Hg10FTMShCw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8BB3857DE4;
	Wed, 10 May 2023 12:16:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37B8C492C13;
	Wed, 10 May 2023 12:16:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AB00819451C3;
	Wed, 10 May 2023 12:16:39 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 534CA1946A45 for <linux-audit@listman.corp.redhat.com>;
 Wed, 10 May 2023 12:12:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 34A864078907; Wed, 10 May 2023 12:12:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CC604078906
 for <linux-audit@redhat.com>; Wed, 10 May 2023 12:12:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11A6F1857F30
 for <linux-audit@redhat.com>; Wed, 10 May 2023 12:12:56 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-ZElfIV3rPFmCrEo69-D_MQ-1; Wed, 10 May 2023 08:12:54 -0400
X-MC-Unique: ZElfIV3rPFmCrEo69-D_MQ-1
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ad9f2926adso24707881fa.1
 for <linux-audit@redhat.com>; Wed, 10 May 2023 05:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683720772; x=1686312772;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T0AZ2WR1sgJtd+4MNio4ClHfbROcFaWDkZ1fPB/VSB0=;
 b=j+S6b+G2w3PGP5xSYLyvciEy9sOu/tW3ernhvV0KcNND99u9LZGtfVwa5yHI+oLEmr
 cKOBoplrZFLZGpEP95Ut+K9BN2V1AmbBfzzRNkn46kBwd8MPViSdi+RE8H8pfm6NWVif
 ucwWr1MINVcMuIk3mNIMmdZoOM2k3l5TUxVRMSM+CzFMn431qGePgAxt0xwr3c9zvBTa
 RhA2Yc3pTYMrY6CoCQS52SmVtAhmFJjSccQSjl7tUGCvpfhRP13V5F6pCe0JbX8oCxLk
 ttyeUrplCI57RTKns5EV/EBU8TF1qCixFBsy8XZH8MjsPNNF+VPD0skl9tb6em+B3EIy
 Qm/g==
X-Gm-Message-State: AC+VfDz3HsX7zVv+naO7IFW7q1ib3tcTEbPpAX8frTt3x9jSJlLaPzs+
 9Foh1/NWfSmncVC1SdX2Q1I=
X-Google-Smtp-Source: ACHHUZ5pfkcrY6RsZ+cbJqucDC6oMiMwmqlMaoA3dGh1T0ycOK9MDch6w729yiRp0IHcCYv99FYxvA==
X-Received: by 2002:a2e:9916:0:b0:2ac:689e:241b with SMTP id
 v22-20020a2e9916000000b002ac689e241bmr2008919lji.47.1683720772413; 
 Wed, 10 May 2023 05:12:52 -0700 (PDT)
Received: from [192.168.0.31] ([94.242.171.95])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a2e2e0a000000b002ad9df0586bsm762382lju.132.2023.05.10.05.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 05:12:52 -0700 (PDT)
Message-ID: <dcb7759f-ffd9-b414-f68b-44707a879312@gmail.com>
Date: Wed, 10 May 2023 15:12:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Can AUDIT_LIST_RULES causes kthreadd-spam?
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Paul Moore <paul@paul-moore.com>
References: <ecd4bf68-3bf1-a1d8-4da5-5fbd28c51a6b@gmail.com>
 <CAHC9VhTXHLS7bsDJ8-dSp4dQSQRcKRLiTMRYJOJVCY11G5D85A@mail.gmail.com>
 <e5713a91-37b0-d32f-a0d2-eb668122c9e4@gmail.com>
 <9ae2c1df-1f20-a40b-35ed-1dc76b122a4f@I-love.SAKURA.ne.jp>
 <CAHC9VhTfxqrWaJrBccDY9LJR+Fggr__zufD-Wd=0VZwN5bBU6g@mail.gmail.com>
 <415a4871-4d84-a31f-5417-e850a98bbffd@I-love.SAKURA.ne.jp>
 <7c4caf66-a0ae-4999-172e-437d6cfc8ff3@gmail.com>
 <0e748195-d3ba-88c5-1b1e-5a9c447bea57@I-love.SAKURA.ne.jp>
From: Rinat Gadelshin <rgadelsh@gmail.com>
In-Reply-To: <0e748195-d3ba-88c5-1b1e-5a9c447bea57@I-love.SAKURA.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: audit@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, ru-RU
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

Ck9uIDA2LjA1LjIwMjMgMDk6NTAsIFRldHN1byBIYW5kYSB3cm90ZToKPiBPbiAyMDIzLzA1LzA2
IDc6MTIsIFJpbmF0IEdhZGVsc2hpbiB3cm90ZToKPj4gVGhlIG9ubHkgb25lIGBhdWRpdGN0bCAt
bGAgcmVxdWVzdCB3YXMgcGVyZm9ybWVkLgo+PiBJIHNlZSB0aGUgZm9sbG93aW5nIHJlc3BvbnNl
IGluIHN5c2xvZyBmb3IgdGhlIHJlcXVlc3Q6Cj4gVGhhbmtzIGZvciBydWxlcy4KPgo+IEkgdHJp
ZWQgImF1ZGl0Y3RsIC1sIiB3aXRoIHRoZXNlIHJ1bGVzLCBhbmQgSSBnb3Qgb25seQo+Cj4gICAg
YXVkaXQ6IFN0YXJ0ZWQgYXVkaXRfc2VuZF9saXN0X3RocmVhZAo+ICAgIGF1ZGl0OiBDYWxsaW5n
IG5ldGxpbmtfdW5pY2FzdCAocmVwZWF0ZWQgZm9yIDMyIHRpbWVzKQo+ICAgIGF1ZGl0OiBGaW5p
c2hlZCBhdWRpdF9zZW5kX2xpc3RfdGhyZWFkCj4KPiBhcyBvdXRwdXQ7IGF1ZGl0X3NlbmRfcmVw
bHlfdGhyZWFkIGlzIG5vdCBjYWxsZWQgaW4gbXkgZW52aXJvbm1lbnQuCj4KPiBUaGF0IGlzLCBm
b3Igc29tZSByZWFzb24gKG1heWJlIHNvbWUgcHJvY2VzcyBpcyBpbnRlcmZlcmluZyBlYWNoIG90
aGVyKQo+IGF1ZGl0X3NlbmRfcmVwbHlfdGhyZWFkIGlzIG5lZWRsZXNzbHkgY2FsbGVkIGluIHlv
dXIgZW52aXJvbm1lbnQ/Cj4gSW4gdGhhdCBjYXNlLCBmaXhpbmcgdGhlIGNhdXNlIG9mIGF1ZGl0
X3NlbmRfcmVwbHlfdGhyZWFkIGJlaW5nIGNhbGxlZAo+IGNvdWxkIHJlZHVjZSB0aGUgc3BhbS4K
Pgo+IFBsZWFzZSB0cnkgdG8gZmluZCB3aG8gaXMgY2FsbGluZyBhdWRpdF9zZW5kX3JlcGx5X3Ro
cmVhZCBmb3IgbWFueSB0aW1lcy4KPgo+IGRpZmYgLS1naXQgYS9rZXJuZWwvYXVkaXQuYyBiL2tl
cm5lbC9hdWRpdC5jCj4gaW5kZXggOWJjMGIwMzAxMTk4Li5iZjRmZWY3ZGE2OTIgMTAwNjQ0Cj4g
LS0tIGEva2VybmVsL2F1ZGl0LmMKPiArKysgYi9rZXJuZWwvYXVkaXQuYwo+IEBAIC0xMDA2LDYg
KzEwMTEsNyBAQCBzdGF0aWMgdm9pZCBhdWRpdF9zZW5kX3JlcGx5KHN0cnVjdCBza19idWZmICpy
ZXF1ZXN0X3NrYiwgaW50IHNlcSwgaW50IHR5cGUsIGludAo+ICAgCXRzayA9IGt0aHJlYWRfcnVu
KGF1ZGl0X3NlbmRfcmVwbHlfdGhyZWFkLCByZXBseSwgImF1ZGl0X3NlbmRfcmVwbHkiKTsKPiAg
IAlpZiAoSVNfRVJSKHRzaykpCj4gICAJCWdvdG8gZXJyOwo+ICsJZHVtcF9zdGFjaygpOwo+ICAg
Cj4gICAJcmV0dXJuOwoKSGkgVGV0c3VvLAoKSSd2ZSByZWJ1aWx0IHRoZSBrZXJuZWwgd2l0aCAn
ZHVtcCBzdGFjaygpJy4KCkkndmUgZ290IDcgY2FsbCBzdGFja3MgZm9yIHRoZSBzYW1lIHRlc3Qg
KGBhdWRpdGN0bCAtbGAgYW5kIHRoZSBzYW1lIAphdWRpdCBydWxlIGxpc3QpLCB0aGV5IGFyZSBh
bGwgc2ltaWxhciB0bzoKCk1heSAxMCAxNDo1MTo1MiBnYWRlbHNoaW4tcmktbmIga2VybmVsOiBb
IDkzODEuMDI1OTIyXSBhdWRpdDogU3RhcnRlZCAKYXVkaXRfc2VuZF9yZXBseV90aHJlYWQKTWF5
IDEwIDE0OjUxOjUyIGdhZGVsc2hpbi1yaS1uYiBrZXJuZWw6IFsgOTM4MS4wMjU5MjRdIEhhcmR3
YXJlIG5hbWU6IApMRU5PVk8gMjFBSDAwQlBVUy8yMUFIMDBCUFVTLCBCSU9TIE4zTUVUMTFXICgx
LjEwICkgMTIvMDcvMjAyMgpNYXkgMTAgMTQ6NTE6NTIgZ2FkZWxzaGluLXJpLW5iIGtlcm5lbDog
WyA5MzgxLjAyNTkyNl0gQ2FsbCBUcmFjZToKTWF5IDEwIDE0OjUxOjUyIGdhZGVsc2hpbi1yaS1u
YiBrZXJuZWw6IFsgOTM4MS4wMjU5MjhdwqAgPFRBU0s+Ck1heSAxMCAxNDo1MTo1MiBnYWRlbHNo
aW4tcmktbmIga2VybmVsOiBbIDkzODEuMDI1OTI5XSAKZHVtcF9zdGFja19sdmwrMHg0Yy8weDcw
Ck1heSAxMCAxNDo1MTo1MiBnYWRlbHNoaW4tcmktbmIga2VybmVsOiBbIDkzODEuMDI1OTM1XSBk
dW1wX3N0YWNrKzB4MTQvMHgyMApNYXkgMTAgMTQ6NTE6NTIgZ2FkZWxzaGluLXJpLW5iIGtlcm5l
bDogWyA5MzgxLjAyNTkzNl0gCmF1ZGl0X3NlbmRfcmVwbHkuY29uc3Rwcm9wLjArMHhjYy8weDEy
MApNYXkgMTAgMTQ6NTE6NTIgZ2FkZWxzaGluLXJpLW5iIGtlcm5lbDogWyA5MzgxLjAyNTkzOV0g
CmF1ZGl0X3JlY2VpdmVfbXNnKzB4MjZkLzB4MTA3MApNYXkgMTAgMTQ6NTE6NTIgZ2FkZWxzaGlu
LXJpLW5iIGtlcm5lbDogWyA5MzgxLjAyNTk0MF3CoCA/IApzdHJpbmdfbm9jaGVjaysweDRmLzB4
NjAKTWF5IDEwIDE0OjUxOjUyIGdhZGVsc2hpbi1yaS1uYiBrZXJuZWw6IFsgOTM4MS4wMjU5NDJd
wqAgPyBzdHJpbmcrMHg0ZS8weDYwCk1heSAxMCAxNDo1MTo1MiBnYWRlbHNoaW4tcmktbmIga2Vy
bmVsOiBbIDkzODEuMDI1OTQzXSAKYXVkaXRfcmVjZWl2ZSsweGI5LzB4MTgwCk1heSAxMCAxNDo1
MTo1MiBnYWRlbHNoaW4tcmktbmIga2VybmVsOiBbIDkzODEuMDI1OTQ0XcKgID8gCm5ldGxpbmtf
ZGVsaXZlcl90YXArMHg0OS8weDI1MApNYXkgMTAgMTQ6NTE6NTIgZ2FkZWxzaGluLXJpLW5iIGtl
cm5lbDogWyA5MzgxLjAyNTk0N10gCm5ldGxpbmtfdW5pY2FzdCsweDFiMi8weDI2MApNYXkgMTAg
MTQ6NTE6NTIgZ2FkZWxzaGluLXJpLW5iIGtlcm5lbDogWyA5MzgxLjAyNTk0OF0gCm5ldGxpbmtf
c2VuZG1zZysweDI1NC8weDRkMApNYXkgMTAgMTQ6NTE6NTIgZ2FkZWxzaGluLXJpLW5iIGtlcm5l
bDogWyA5MzgxLjAyNTk1MF0gCnNvY2tfc2VuZG1zZysweDlkLzB4YjAKTWF5IDEwIDE0OjUxOjUy
IGdhZGVsc2hpbi1yaS1uYiBrZXJuZWw6IFsgOTM4MS4wMjU5NTJdIApfX3N5c19zZW5kdG8rMHgx
MjIvMHgxYjAKTWF5IDEwIDE0OjUxOjUyIGdhZGVsc2hpbi1yaS1uYiBrZXJuZWw6IFsgOTM4MS4w
MjU5NTRdwqAgPyAKX19oYW5kbGVfbW1fZmF1bHQrMHhhYzAvMHhkMTAKTWF5IDEwIDE0OjUxOjUy
IGdhZGVsc2hpbi1yaS1uYiBrZXJuZWw6IFsgOTM4MS4wMjU5NTZdwqAgPyAKX19hdWRpdF9zeXNj
YWxsX2VudHJ5KzB4ZDIvMHgxNDAKTWF5IDEwIDE0OjUxOjUyIGdhZGVsc2hpbi1yaS1uYiBrZXJu
ZWw6IFsgOTM4MS4wMjU5NThdIApfX3g2NF9zeXNfc2VuZHRvKzB4MmQvMHg0MApNYXkgMTAgMTQ6
NTE6NTIgZ2FkZWxzaGluLXJpLW5iIGtlcm5lbDogWyA5MzgxLjAyNTk1OV0gCmRvX3N5c2NhbGxf
NjQrMHg1ZC8weDkwCk1heSAxMCAxNDo1MTo1MiBnYWRlbHNoaW4tcmktbmIga2VybmVsOiBbIDkz
ODEuMDI1OTYyXcKgID8gCmV4aXRfdG9fdXNlcl9tb2RlX3ByZXBhcmUrMHgzZC8weDE5MApNYXkg
MTAgMTQ6NTE6NTIgZ2FkZWxzaGluLXJpLW5iIGtlcm5lbDogWyA5MzgxLjAyNTk2NV3CoCA/IApk
b191c2VyX2FkZHJfZmF1bHQrMHgxYmMvMHg4YTAKTWF5IDEwIDE0OjUxOjUyIGdhZGVsc2hpbi1y
aS1uYiBrZXJuZWw6IFsgOTM4MS4wMjU5NjddwqAgPyAKaXJxZW50cnlfZXhpdF90b191c2VyX21v
ZGUrMHhkLzB4MjAKTWF5IDEwIDE0OjUxOjUyIGdhZGVsc2hpbi1yaS1uYiBrZXJuZWw6IFsgOTM4
MS4wMjU5NjldwqAgPyAKaXJxZW50cnlfZXhpdCsweDNmLzB4NTAKTWF5IDEwIDE0OjUxOjUyIGdh
ZGVsc2hpbi1yaS1uYiBrZXJuZWw6IFsgOTM4MS4wMjU5NzBdwqAgPyAKZXhjX3BhZ2VfZmF1bHQr
MHg4ZS8weDE5MApNYXkgMTAgMTQ6NTE6NTIgZ2FkZWxzaGluLXJpLW5iIGtlcm5lbDogWyA5Mzgx
LjAyNTk3MV0gCmVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDcyLzB4ZGMKTWF5IDEw
IDE0OjUxOjUyIGdhZGVsc2hpbi1yaS1uYiBrZXJuZWw6IFsgOTM4MS4wMjU5NzRdIFJJUDogCjAw
MzM6MHg3ZmU5N2FmMzY4YTQKTWF5IDEwIDE0OjUxOjUyIGdhZGVsc2hpbi1yaS1uYiBrZXJuZWw6
IFsgOTM4MS4wMjU5NzZdIENvZGU6IGMyIGY3IGZmIGZmIAo0NCA4YiA0YyAyNCAyYyA0YyA4YiA0
NCAyNCAyMCA4OSBjNSA0NCA4YiA1NCAyNCAyOCA0OCA4YiA1NCAyNCAxOCBiOCAyYyAKMDAgMDAg
MDAgNDggOGIgNzQgMjQgMTAgOGIgN2MgMjQgMDggMGYgMDUgPDQ4PiAzZCAwMCBmMCBmZiBmZiA3
NyAzMCA4OSAKZWYgNDggODkgNDQgMjQgMDggZTggZTggZjcgZmYgZmYgNDggOGIKTWF5IDEwIDE0
OjUxOjUyIGdhZGVsc2hpbi1yaS1uYiBrZXJuZWw6IFsgOTM4MS4wMjU5NzddIFJTUDogCjAwMmI6
MDAwMDdmZmRmYzc4YWY1MCBFRkxBR1M6IDAwMDAwMjkzIE9SSUdfUkFYOiAwMDAwMDAwMDAwMDAw
MDJjCk1heSAxMCAxNDo1MTo1MiBnYWRlbHNoaW4tcmktbmIga2VybmVsOiBbIDkzODEuMDI1OTc5
XSBSQVg6IApmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDdmZTkwOTAwYWVlMCBSQ1g6IDAwMDA3
ZmU5N2FmMzY4YTQKTWF5IDEwIDE0OjUxOjUyIGdhZGVsc2hpbi1yaS1uYiBrZXJuZWw6IFsgOTM4
MS4wMjU5ODBdIFJEWDogCjAwMDAwMDAwMDAwMDAwMTAgUlNJOiAwMDAwN2ZlOTA5MDBhZmY4IFJE
STogMDAwMDAwMDAwMDAwMDAwOApNYXkgMTAgMTQ6NTE6NTIgZ2FkZWxzaGluLXJpLW5iIGtlcm5l
bDogWyA5MzgxLjAyNTk4MV0gUkJQOiAKMDAwMDAwMDAwMDAwMDAwMCBSMDg6IDAwMDA3ZmZkZmM3
OGFmZDQgUjA5OiAwMDAwMDAwMDAwMDAwMDBjCk1heSAxMCAxNDo1MTo1MiBnYWRlbHNoaW4tcmkt
bmIga2VybmVsOiBbIDkzODEuMDI1OTgxXSBSMTA6IAowMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAw
MDAwMDAwMDAwMDI5MyBSMTI6IDAwMDA3ZmU5NDQ0NjE5MjAKTWF5IDEwIDE0OjUxOjUyIGdhZGVs
c2hpbi1yaS1uYiBrZXJuZWw6IFsgOTM4MS4wMjU5ODJdIFIxMzogCjAwMDA3ZmU5MDViMzFiZTAg
UjE0OiAwMDAwN2ZlOTA1YjMxYmYwIFIxNTogMDAwMDAwMDAwMDAwMDAwMApNYXkgMTAgMTQ6NTE6
NTIgZ2FkZWxzaGluLXJpLW5iIGtlcm5lbDogWyA5MzgxLjAyNTk4NF0gPC9UQVNLPgpNYXkgMTAg
MTQ6NTE6NTIgZ2FkZWxzaGluLXJpLW5iIGtlcm5lbDogWyA5MzgxLjAyNTk4OV0gYXVkaXQ6IEZp
bmlzaGVkIAphdWRpdF9zZW5kX3JlcGx5X3RocmVhZAoKCkFzIGZhciBhcyBJIGNhbiBzZWUsIGl0
J3MgdGhlIGV4aXQgb2YgYHNlbmR0b2Agc3lzY2FsbC4KSXQgc2VlbXMgdGhhdCB0aGUga2VybmVs
IGp1c3QgY3JlYXRlcyBhIG5ldyBrdGhyZWFkZCBmb3IgZWFjaCBzZW5kdG8gCnN5c2NhbGwuCkJ1
dCBJIHRoaW5rIHRoYXQgSSdtIHdyb25nIGFuZCBqdXN0IG1pc3Npbmcgc29tZXRoaW5nLgoKLS0K
TGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9s
aXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=


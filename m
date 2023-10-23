Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D1B7D376C
	for <lists+linux-audit@lfdr.de>; Mon, 23 Oct 2023 15:07:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698066425;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0Jcqi+JAFyf10wbvu34UCLEitxv0TCSlTkurpV0kMig=;
	b=izl9+pysn1uY8AMkNrZr84qhngn9MNq5OG8Pl3vEECaxn5pUt7sZbuUIHfP0aNVVufBUh9
	W9+JTFDCfS/5rnIqIJ5bdWXMX9yVQEaVpxlm4BAVD3vYVXcEkOTe0u19SqWLl79m9ZevGD
	V2cbqoAGFrhNTCzK3tRnb7j2hxv42JE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-JsKGgijeN1igrrzh0klKyQ-1; Mon, 23 Oct 2023 09:07:02 -0400
X-MC-Unique: JsKGgijeN1igrrzh0klKyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 670518021B1;
	Mon, 23 Oct 2023 13:06:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D91A2026D4C;
	Mon, 23 Oct 2023 13:06:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 21FC41946595;
	Mon, 23 Oct 2023 13:06:52 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F13F31946588 for <linux-audit@listman.corp.redhat.com>;
 Mon, 23 Oct 2023 13:06:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DA946492BE1; Mon, 23 Oct 2023 13:06:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2811492BD9
 for <linux-audit@redhat.com>; Mon, 23 Oct 2023 13:06:50 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF682811E88
 for <linux-audit@redhat.com>; Mon, 23 Oct 2023 13:06:50 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-WZesL7IBOD2SzlMGeJzfwQ-1; Mon, 23 Oct 2023 09:06:33 -0400
X-MC-Unique: WZesL7IBOD2SzlMGeJzfwQ-1
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-507c1936fd5so4874494e87.1
 for <linux-audit@redhat.com>; Mon, 23 Oct 2023 06:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698066378; x=1698671178;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xfaYyXf8MnouuCVZ2fOmzfqGAexYLpAEiGAuvmGHuxU=;
 b=vb5/hBIn5yYqQdJstixTCVPtD5psFl59lCPyb+jj3Z+eS/iQowx4p+cbRp4gRjgdQR
 ymU/eBznpxjw2oCn6KBwVOk90LB4ykXmLeu4M4BeqF72M8rEgZh1wH6SpTfxjbOubP/6
 V8QRoug6KP7GKmCTQog1cqQHD/O9oYaDjJOhGtH0dx8NgeT6GT3/W84B72nz1s6mebii
 5k14A2OO2GK3/v6667Cyli45ysC/njP5m8LgqKABiMHzF/aQV9d2zNRsBX5B96Xo7SnF
 ZNM8EMt8mxkk8I1al7f1jxEXLUSPm27Mdkl1833cMmMj+kuGds8OQPZimBSPjyJyVdB0
 7SkA==
X-Gm-Message-State: AOJu0Ywq9R3BYwX+drWayaYW8qXpe/ph/ZkEfbLQNdw/Bw6eAYoyZM4K
 LKir/G0l5svrniFtYbNbnuSU1oK8g60=
X-Google-Smtp-Source: AGHT+IFnDCZVf4cihUh+DmtSz9RpgAs78ClO4nW+kj6k5RR0pO5GIa9/iwXrqbM5OvVD7O+DP3bsow==
X-Received: by 2002:a05:6512:398a:b0:500:d96e:f6eb with SMTP id
 j10-20020a056512398a00b00500d96ef6ebmr4635928lfu.19.1698066378091; 
 Mon, 23 Oct 2023 06:06:18 -0700 (PDT)
Received: from [192.168.0.31] ([94.242.171.26])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a195f15000000b0050296ee046csm1707796lfb.69.2023.10.23.06.06.17
 for <linux-audit@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 06:06:17 -0700 (PDT)
Message-ID: <adc9e0a6-80fe-4e81-bd10-8bfe323645bc@gmail.com>
Date: Mon, 23 Oct 2023 16:06:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Couldn't get audit messages for 'listen' on kernel
 4.19.0-6-686-pae
From: Rinat Gadelshin <rgadelsh@gmail.com>
To: linux-audit@redhat.com
References: <0c22c924-2c1d-4a4f-a4f2-ea477999c8a4@kaspersky.com>
 <d1d9dd09-3c95-4488-ba05-f2d655895a2c@gmail.com>
In-Reply-To: <d1d9dd09-3c95-4488-ba05-f2d655895a2c@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, ru-RU
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGVsbG8gdGhlcmUhCgpGaXJzdCBvZiBhbGwsIEkgaGF2ZSB0byBhcG9sb2dpemUgZm9yIHR3byBp
ZGVudGljYWwgZW1haWxzIGFzIHRoZSAKYmVnaW5uaW5nIG9mIHRoZSBzdHJlYW0uClRoZSBmaXJz
dCBvbmUgd2FzIHNlbnQgKGJ5IG9jY2FzaW9uYWwpIGZyb20gbXkgd29yayBlbWFpbC4KSSd2ZSBy
ZWNlaXZlZCBub3RpZmljYXRpb24sIGZyb20gdGhlIG1haWwgYm90LCB0aGF0IEkgc2hvdWxkIHN1
YnNjcmliZSAKdG8gdGhlIG1haWwgbGlzdCAoZm9yIHRoZSB3b3JrIGVtYWlsKS4KQWZ0ZXIgdGhh
dCBJJ3ZlIHJlc2VudCB0aGUgc2Vjb25kIG9uZS4KCkxldCdzIHJldHVybiB0byB0aGUgcHJvYmxl
bS4KCkkndmUgZG9uZSBhIGZvbGxvd2luZyBleHBlcmltZW50OgoKYGF1ZGl0Y3RsIC1EYApgYXVk
aXRjdGwgLWEgYWx3YXlzLGV4aXQgLVMgYWxsYApgc3RyYWNlIG5ldGNhdCAtdiAtbCAtcCA0MjQy
IHwgdGVlIHN0cmFjZS5sb2dgICMgdGhlIHBpZCBvZiB0aGUgbmV0Y2F0IAp3YXMgNTM2CkN0cmwr
YwpgYXVzZWFyY2ggLXAgNTM2ID4gYXVkaXRkLnBpZC41MzYubG9nYApgZ3JlcCAic3lzY2FsbD0u
KnRyYWRpdGlvbmFsIiBhdWRpdGQucGlkLjUzNi5sb2cgfCBhd2sgJ3twcmludCAkNH0nIHwgCnNv
cnQgfCB1bmlxIC1jJwoKVGhlIGxhc3QgY29tbWFuZCBwcmludHMgdGhlIGZvbGxvd2luZyByZXN1
bHQ6CgogwqDCoMKgwqAgMTEgc3lzY2FsbD0xMDIKIMKgwqDCoMKgwqAgMSBzeXNjYWxsPTExCiDC
oMKgwqDCoMKgIDYgc3lzY2FsbD0xMjUKIMKgwqDCoMKgwqAgNiBzeXNjYWxsPTE0MAogwqDCoMKg
wqDCoCA2IHN5c2NhbGw9MTc0CiDCoMKgwqDCoMKgIDEgc3lzY2FsbD0xNzUKIMKgwqDCoMKgIDE0
IHN5c2NhbGw9MTkyCiDCoMKgwqDCoCAzMyBzeXNjYWxsPTE5NQogwqDCoMKgwqDCoCA5IHN5c2Nh
bGw9MTk3CiDCoMKgwqDCoMKgIDIgc3lzY2FsbD0yMAogwqDCoMKgwqDCoCAxIHN5c2NhbGw9MjQz
CiDCoMKgwqDCoMKgIDEgc3lzY2FsbD0yNwogwqDCoMKgwqAgNDEgc3lzY2FsbD0yOTUKIMKgwqDC
oMKgIDE0IHN5c2NhbGw9MwogwqDCoMKgwqDCoCA1IHN5c2NhbGw9MzMKIMKgwqDCoMKgwqAgMiBz
eXNjYWxsPTQKIMKgwqDCoMKgwqAgNSBzeXNjYWxsPTQ1CiDCoMKgwqDCoCAxMSBzeXNjYWxsPTYK
IMKgwqDCoMKgwqAgMyBzeXNjYWxsPTkxCgpTbyB0aGUgZm9sbG93aW5nIHN5c2NhbGxzIGFyZSBy
ZXBvcnRlZCAodGhlcmUgYXJlIG5vIGBzb2NrZXRgLCBgYmluZGAsIApgY29ubmVjdGAsIGBsaXN0
ZW5gKToKCiDCoMKgwqAgMyAocmVhZCkKIMKgwqDCoCA0ICh3cml0ZSkKIMKgwqDCoCA2IChjbG9z
ZSkKIMKgwqDCoCAxMSAoZXhlY3ZlKQogwqDCoMKgIDIwIChnZXRwaWQpCiDCoMKgwqAgMjcgKGFs
YXJtKQogwqDCoMKgIDMzIChhY2Nlc3MpCiDCoMKgwqAgNDUgKGJyaykKIMKgwqDCoCA5MSAobXVu
bWFwKQogwqAgMTAyIChzb2NrZXRjYWxsKQogwqAgMTI1wqAobXByb3RlY3QpCiDCoCAxNDDCoChf
bGxzZWVrKQogwqAgMTc0wqAocnRfc2lnYWN0aW9uKQogwqAgMTc1wqAocnRfc2lncHJvY21hc2sp
CiDCoCAxOTLCoChtbWFwMikKIMKgIDE5NcKgKHN0YXQ2NCkKIMKgIDE5N8KgKGZzdGF0NjQpCiDC
oCAyNDPCoChzZXRfdGhyZWFkX2FyZWEpCiDCoCAyOTXCoChvcGVuYXQpCgpCdXQgc3RyYWNlJ3Mg
bG9nIHNob3dzIHRoYXQgYHNvY2tldGAsIGBiaW5kYCwgYGNvbm5lY3RgIGFuZCBgbGlzdGVuYCAK
d2VyZSBjYWxsZWQ6CgogwqDCoMKgIGV4ZWN2ZSgiL3Vzci9iaW4vbmV0Y2F0IiwgWyJuZXRjYXQi
LCAiLXYiLCAiLWwiLCAiLXAiLCAiNDI0MiJdLCAKMHhiZjlmOGYwMCAvKiAyMiB2YXJzICovKSA9
IDAKIMKgwqDCoCAtLSBsaW5lIHNraXBwZWQgLS0KIMKgwqDCoCBzb2NrZXQoQUZfVU5JWCwgU09D
S19TVFJFQU18U09DS19DTE9FWEVDfFNPQ0tfTk9OQkxPQ0ssIDApID0gMwogwqDCoCDCoGNvbm5l
Y3QoMywge3NhX2ZhbWlseT1BRl9VTklYLCBzdW5fcGF0aD0iL3Zhci9ydW4vbnNjZC9zb2NrZXQi
fSwgCjExMCkgPSAtMSBFTk9FTlQgKE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkpCiDCoMKgIMKg
Y2xvc2UoMynCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA9IDAKIMKgwqDCoCAtLSBsaW5lIHNraXBwZWQgLS0KIMKgwqDCoCBzb2Nr
ZXQoQUZfVU5JWCwgU09DS19TVFJFQU18U09DS19DTE9FWEVDfFNPQ0tfTk9OQkxPQ0ssIDApID0g
MwogwqDCoCDCoGNvbm5lY3QoMywge3NhX2ZhbWlseT1BRl9VTklYLCBzdW5fcGF0aD0iL3Zhci9y
dW4vbnNjZC9zb2NrZXQifSwgCjExMCkgPSAtMSBFTk9FTlQgKE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkpCiDCoMKgIMKgY2xvc2UoMynCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9IDAKIMKgwqDCoCAtLSBsaW5lIHNraXBwZWQg
LS0KIMKgwqDCoCBzb2NrZXQoQUZfSU5FVCwgU09DS19TVFJFQU0sIElQUFJPVE9fVENQKSA9IDMK
IMKgwqAgwqBzZXRzb2Nrb3B0KDMsIFNPTF9TT0NLRVQsIFNPX1JFVVNFQUREUiwgWzFdLCA0KSA9
IDAKIMKgwqAgwqBzZXRzb2Nrb3B0KDMsIFNPTF9TT0NLRVQsIFNPX1JFVVNFUE9SVCwgWzFdLCA0
KSA9IDAKIMKgwqAgwqBiaW5kKDMsIHtzYV9mYW1pbHk9QUZfSU5FVCwgc2luX3BvcnQ9aHRvbnMo
NDI0MiksIApzaW5fYWRkcj1pbmV0X2FkZHIoIjAuMC4wLjAiKX0sIDE2KSA9IDAKIMKgwqAgwqBs
aXN0ZW4oMywgMSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPSAwCiDCoMKgIMKgZ2V0c29ja25hbWUoMywge3NhX2ZhbWlseT1BRl9JTkVULCBz
aW5fcG9ydD1odG9ucyg0MjQyKSwgCnNpbl9hZGRyPWluZXRfYWRkcigiMC4wLjAuMCIpfSwgWzE2
XSkgPSAwCiDCoMKgwqAgLS0gbGluZSBza2lwcGVkIC0tCgpQbGVhc2UsIGdpdmUgbWUgYSBjbHVl
ISBIb3cgY291bGQgaXQgYmU/CgpCZXN0IHJlZ2FyZHMKUmluYXQKCk9uIDIyLjEwLjIwMjMgMDg6
MjcsIFJpbmF0IEdhZGVsc2hpbiB3cm90ZToKPiBIZWxsbyB0aGVyZSEKPgo+IEknbSBmYWNpbmcg
YSBzdHJhbmdlIHByb2JsZW0uCj4gSSBoYXZlIG5vdCBiZWVuIGFibGUgdG8gZ2V0IGF1ZGl0IHJl
cG9ydHMgZm9yIGFueSAibmV0d29yayIgc3lzY2FsbAo+IG9uIG9uZSBvZiB0aGUgY29tcHV0ZXJz
IGZyb20gbXkgdGVzdCBiZW5jaC4KPiBJIG1lYW4gJ2Nvbm5lY3QnLCAnYWNjZXB0NCcsICdsaXN0
ZW4nLCAnYmluZCcsICdzb2NrZXQnLgo+IFRoZSBmb2xsb3dpbmcgZXhhbXBsZSBzaG93cyB0aGF0
IGF1ZGl0ZCBjb3VsZG4ndCBnZXQgdGhlbSB0b28gCj4gKCdsaXN0ZW4nIGF0IGxlYXN0KS4KPiBC
dXQgSSd2ZSByZWNlaXZlZCBhIHJlcG9ydCBhYm91dCAnZXhlY3ZlJyBjYWxsZWQgYnkgdGhlIHNh
bWUgcHJvY2Vzcy4KPgo+IENvdWxkIHlvdSB0ZWxsIG1lIHdoYXQgY2FuIEkgZG8gaW4gb3JkZXIg
dG8gcmVjZWl2ZSBhdWRpdCBtZXNzYWdlcyBmb3IgCj4gdGhlIHN5c2NhbGxzLgo+IGZyb20gdGhp
cyB2ZXJzaW9uIG9mIHRoZSBrZXJuZWw/Cj4KPiBBbnkgaGVscCB3aWxsIGJlIHdpbGwgYmUgYXBw
cmVjaWF0ZWQuCj4KPgo+IHJvb3RAZGViMTAxLXg4Ni0wMDA5On4jIG5ldGNhdCAtdiAtbCAtcCA0
MjQyICYKPiBbMl0gMTM0ODEKPiByb290QGRlYjEwMS14ODYtMDAwOTp+IyBsaXN0ZW5pbmcgb24g
W2FueV0gNDI0MiAuLi4KPiByb290QGRlYjEwMS14ODYtMDAwOTp+IyBlY2hvICJUZXN0IiB8IG5j
IC1xIDAgMTI3LjAuMC4xIDQyNDIKPiBjb25uZWN0IHRvIFsxMjcuMC4wLjFdIGZyb20gbG9jYWxo
b3N0IFsxMjcuMC4wLjFdIDM2NjUwCj4gVGVzdAo+IHJvb3RAZGViMTAxLXg4Ni0wMDA5On4jIHNr
aWxsIC1wIDEzNDgxCj4gWzJdK8KgIERvbmXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBuZXRjYXQgLXYgLWwgLXAgNDI0Mgo+IHJvb3RAZGViMTAxLXg4Ni0wMDA5On4jIGF1
c2VhcmNoIC1wIDEzNDgxCj4gLS0tLQo+IHRpbWUtPkZyaSBPY3QgMjAgMjI6MDA6NDIgMjAyMwo+
IHR5cGU9UFJPQ1RJVExFIG1zZz1hdWRpdCgxNjk3ODI4NDQyLjYwMzoyNjk3KTogCj4gcHJvY3Rp
dGxlPTZFNjU3NDYzNjE3NDAwMkQ3NjAwMkQ2QzAwMkQ3MDAwMzQzMjM0MzIKPiB0eXBlPVBBVEgg
bXNnPWF1ZGl0KDE2OTc4Mjg0NDIuNjAzOjI2OTcpOiBpdGVtPTEgCj4gbmFtZT0iL2xpYi9sZC1s
aW51eC5zby4yIiBpbm9kZT02NTUzODIgZGV2PWZlOjAwIG1vZGU9MDEwMDc1NSBvdWlkPTAgCj4g
b2dpZD0wIHJkZXY9MDA6MDAgbmFtZXR5cGU9Tk9STUFMIGNhcF9mcD0wMDAwMDAwMDAwMDAwMDAw
IAo+IGNhcF9maT0wMDAwMDAwMDAwMDAwMDAwIGNhcF9mZT0wIGNhcF9mdmVyPTAKPiB0eXBlPVBB
VEggbXNnPWF1ZGl0KDE2OTc4Mjg0NDIuNjAzOjI2OTcpOiBpdGVtPTAgCj4gbmFtZT0iL3Vzci9i
aW4vbmV0Y2F0IiBpbm9kZT02NjQ4ODcgZGV2PWZlOjAwIG1vZGU9MDEwMDc1NSBvdWlkPTAgCj4g
b2dpZD0wIHJkZXY9MDA6MDAgbmFtZXR5cGU9Tk9STUFMIGNhcF9mcD0wMDAwMDAwMDAwMDAwMDAw
IAo+IGNhcF9maT0wMDAwMDAwMDAwMDAwMDAwIGNhcF9mZT0wIGNhcF9mdmVyPTAKPiB0eXBlPUNX
RCBtc2c9YXVkaXQoMTY5NzgyODQ0Mi42MDM6MjY5Nyk6IGN3ZD0iL3Jvb3QiCj4gdHlwZT1FWEVD
VkUgbXNnPWF1ZGl0KDE2OTc4Mjg0NDIuNjAzOjI2OTcpOiBhcmdjPTUgYTA9Im5ldGNhdCIgYTE9
Ii12IiAKPiBhMj0iLWwiIGEzPSItcCIgYTQ9IjQyNDIiCj4gdHlwZT1TWVNDQUxMIG1zZz1hdWRp
dCgxNjk3ODI4NDQyLjYwMzoyNjk3KTogYXJjaD00MDAwMDAwMyBzeXNjYWxsPTExIAo+IHN1Y2Nl
c3M9eWVzIGV4aXQ9MCBhMD1lMzY0MDAgYTE9ZDlkOWUwIGEyPWUzYTMxMCBhMz01ODQ5ODggaXRl
bXM9MiAKPiBwcGlkPTEyOTY4IHBpZD0xMzQ4MSBhdWlkPTAgdWlkPTAgZ2lkPTAgZXVpZD0wIHN1
aWQ9MCBmc3VpZD0wIGVnaWQ9MCAKPiBzZ2lkPTAgZnNnaWQ9MCB0dHk9cHRzMSBzZXM9NCBjb21t
PSJuZXRjYXQiIAo+IGV4ZT0iL3Vzci9iaW4vbmMudHJhZGl0aW9uYWwiIHN1Ymo9PXVuY29uZmlu
ZWQga2V5PShudWxsKQo+IHJvb3RAZGViMTAxLXg4Ni0wMDA5On4jIGF1ZGl0Y3RsIC1sCj4gLWEg
YWx3YXlzLGV4aXQgLUYgYXJjaD1iMzIgLVMgZm9yayxleGVjdmUsY2xvbmUsdmZvcmssZXhlY3Zl
YXQKPiAtYSBhbHdheXMsZXhpdCAtRiBhcmNoPWIzMiAtUyBiaW5kLGNvbm5lY3QsbGlzdGVuLGFj
Y2VwdDQKPiByb290QGRlYjEwMS14ODYtMDAwOTp+IyBhdWRpdGN0bCAtcwo+IGVuYWJsZWQgMQo+
IGZhaWx1cmUgMQo+IHBpZCAxMzM5Mwo+IHJhdGVfbGltaXQgMAo+IGJhY2tsb2dfbGltaXQgODE5
Mgo+IGxvc3QgMAo+IGJhY2tsb2cgMAo+IGJhY2tsb2dfd2FpdF90aW1lIDAKPiBsb2dpbnVpZF9p
bW11dGFibGUgMCB1bmxvY2tlZAo+IHJvb3RAZGViMTAxLXg4Ni0wMDA5On4jIHVuYW1lIC1hCj4g
TGludXggZGViMTAxLXg4Ni0wMDA5LmF2cC5ydS5sb2NhbCA0LjE5LjAtNi02ODYtcGFlICMxIFNN
UCBEZWJpYW4gCj4gNC4xOS42Ny0yK2RlYjEwdTIgKDIwMTktMTEtMTEpIGk2ODYgR05VL0xpbnV4
Cj4gcm9vdEBkZWIxMDEteDg2LTAwMDk6fiMgY2F0IC9ldGMvZGViaWFuX3ZlcnNpb24KPiAxMC4x
Cj4gcm9vdEBkZWIxMDEteDg2LTAwMDk6fiMKPgo+Cj4gUmVnYXJkcwo+IFJpbmF0Cj4KCi0tCkxp
bnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vbGlz
dG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQK


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8A96A5DE3
	for <lists+linux-audit@lfdr.de>; Tue, 28 Feb 2023 18:03:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677603814;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n8BqTXjzJZBswNRYu0yfCtuUtMMbXzOwMJOCbgUACYM=;
	b=LfiN/n6tP6/FNcAsd5SVCdKADuNsUddedehjiq3mu+0mZSfNbP5zDvTjQmxJy4hptvFYci
	qAhFYW3v1yq9DSl9Jj7mylb+hrUm1GR2NE7VMIuuthXIPrOjTuCupdh45Xk0BYGodWhnxM
	9San4rRgMSkPVWrKzEgoXPW7Z0cecPg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-Fl8qPFW1NW2oL6aw3dRDqA-1; Tue, 28 Feb 2023 12:03:32 -0500
X-MC-Unique: Fl8qPFW1NW2oL6aw3dRDqA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC228887406;
	Tue, 28 Feb 2023 17:03:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82F7D492B12;
	Tue, 28 Feb 2023 17:03:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8AF0A19465A3;
	Tue, 28 Feb 2023 17:03:22 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8BEC3194658C for <linux-audit@listman.corp.redhat.com>;
 Tue, 28 Feb 2023 17:03:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 564E5C15BAE; Tue, 28 Feb 2023 17:03:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E084C15BAD
 for <linux-audit@redhat.com>; Tue, 28 Feb 2023 17:03:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15B2E2805582
 for <linux-audit@redhat.com>; Tue, 28 Feb 2023 17:03:20 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-iGBov_RxPkSWwXBE4JJOpA-1; Tue, 28 Feb 2023 12:03:17 -0500
X-MC-Unique: iGBov_RxPkSWwXBE4JJOpA-1
Received: by mail-il1-f171.google.com with SMTP id h10so6689708ila.11
 for <linux-audit@redhat.com>; Tue, 28 Feb 2023 09:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677603791;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eJDEfwP+BLa87edyN5jVZ8II+kwqrxxXIBu0T2ngUbM=;
 b=L4fnMxqrEdsf1IQO9EstzdiLD0GVxH0uJQS7v4DQnmY4ppVn67jVbFA3P5kF8WEHxS
 WU2eWZ3I561yNyUZ+IjmHE4KZbdra1xp1d6YBwEUPj+STYdIdOaYl77lQqT+dNbjAZha
 Kifyxn2m+L7YlqIoB+TMe8CJmNppc6MmXiyD6odAAHu+yUToHffcc7ucDlKrosFWPWPY
 07J8FCdXmT6AJOqf5DDolcIQJ5wqjrObk5tXkf2jdkN29xwxHB4/6iiP5gt+g5QV/RoR
 hlU2rs+SngckhlicrS/c8LILo56ID0mDWUHQlo19ss8k8sGZWBDZpr6/chvQMrRNyOeC
 oCWQ==
X-Gm-Message-State: AO0yUKVs+FTftX5wkaolwoudrBC58X8l43uTBw9T+dQg54+vG75uuIWO
 t18fUC4is1INoc9fH6gukJZeGX1YLNMPqeE/Z4I=
X-Google-Smtp-Source: AK7set/pXEV8OdojcczsDDerzjRSosBKWLeFggahIlIQU1un9sqIHOzdpuVPi4CdY5XwohSWiMNU5g==
X-Received: by 2002:a05:6e02:b2d:b0:316:e39f:2261 with SMTP id
 e13-20020a056e020b2d00b00316e39f2261mr3115472ilu.21.1677603791224; 
 Tue, 28 Feb 2023 09:03:11 -0800 (PST)
Received: from [192.168.0.143] ([206.85.149.8])
 by smtp.gmail.com with ESMTPSA id
 h24-20020a02b618000000b003c4e8efcd09sm3010571jam.32.2023.02.28.09.03.10
 for <linux-audit@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 09:03:10 -0800 (PST)
Message-ID: <d0c20f21-7064-e199-c052-5d049a681ecf@magitekltd.com>
Date: Tue, 28 Feb 2023 10:03:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Lenny Bruzenak <lenny@magitekltd.com>
Subject: Re: Key based rate limiter (audit_set_rate_limit)
To: linux-audit@redhat.com
References: <CAPoNrttQKG1uiUx=v6Cj8U0MnYMoU-ZP_Htmxn7F_Q7ZdUc9RA@mail.gmail.com>
 <CAHC9VhQAFgv5e3rvoaDTnQvQOoGawoAUfcRonayEwrvJu6znBg@mail.gmail.com>
 <CAPoNrtswDzsghShzAvf72xOQ-vWUj6DdkVPRWnBWp-qG9Xa8Vw@mail.gmail.com>
 <CAHC9VhSr3groyZpA34L3swqDoU8_WJWbWsHz7GDR0QqNpSjhyA@mail.gmail.com>
In-Reply-To: <CAHC9VhSr3groyZpA34L3swqDoU8_WJWbWsHz7GDR0QqNpSjhyA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gMi8yOC8yMyAwOTozMSwgUGF1bCBNb29yZSB3cm90ZToKCj4gT24gVHVlLCBGZWIgMjgsIDIw
MjMgYXQgMTA6MzXigK9BTSBBbnVyYWcgQWdnYXJ3YWwKPiA8YW51cmFnMTlhZ2dhcndhbEBnbWFp
bC5jb20+ICB3cm90ZToKPj4gSGVsbG8gUGF1bCwKPj4KPj4gVGhhbmsgeW91IGZvciB5b3VyIGlu
Zm9ybWF0aW9uLgo+Pgo+Pj4gSWYgeW91IGhhdmUgYSBwYXJ0aWN1bGFyIGF1ZGl0Cj4+PiBydWxl
IHdoaWNoIGlzIHRvbyB2ZXJib3NlICphbmQqIHlvdSBhcmUgd2lsbGluZyB0byBsb3NlIGF1ZGl0
IHJlY29yZHMKPj4+IGZyb20gdGhhdCBmaWx0ZXIgcnVsZSAod2hpY2ggaXMgd2hhdCB3b3VsZCBo
YXBwZW4gaWYgdGhleSB3ZXJlIHJhdGUKPj4+IGxpbWl0ZWQpLCB5b3UgbWlnaHQgd2FudCB0byBj
b25zaWRlciBtYWtpbmcgdGhhdCBhdWRpdCBmaWx0ZXIgcnVsZQo+Pj4gbW9yZSB0YXJnZXRlZCB0
byB0aGUgZXZlbnQgeW91IGFyZSBpbnRlcmVzdGVkIGluIGxvZ2dpbmcuICBHZW5lcmF0aW5nCj4+
PiBtb3JlIGF1ZGl0IHJlY29yZHMgdGhhbiB5b3Ugd2FudCB0byBzZWUgY2FuIGJlIGEgc2lnbiBv
ZiBhbiBvdmVybHkKPj4+IGdlbmVyYWwgYXVkaXQgcnVsZS4KPj4gSSBhZ3JlZSB0aGF0IGhhdmlu
ZyBydWxlcyB3aGljaCBhcmUgdG9vIHZlcmJvc2UgaXMgbm90IGEgdmVyeSBnb29kIGlkZWEuCj4+
Cj4+IEJlc2lkZSB0aGlzLCBpcyB0aGVyZSBhbnkgb3RoZXIgbWVjaGFuaXNtIHdoaWNoIHdlIGNh
biB1c2UgdG8gZ2V0IGEgc2ltaWxhciBlZmZlY3Q/Cj4gTm90aGluZyBjb21lcyBxdWlja2x5IHRv
IG1pbmQsIHBlcmhhcHMgb3RoZXJzIG9uIHRoZSBtYWlsaW5nIGxpc3QKPiBtaWdodCBoYXZlIHNv
bWUgaWRlYXMgLi4uID8KCk5vdCBtdWNoIGVsc2UgdG8gb2ZmZXIgYWJvdmUgd2hhdCBQYXVsIGFs
cmVhZHkgcmVwbGllZC4gTWF5YmUgaWYgd2Ugc2F3IAp5b3VyIHJ1bGUgd2UgY291bGQgb2ZmZXIg
bW9yZS4KCldoYXQgd2UgZG8gbm90IGtub3cgaXMgLSBkbyB5b3UgaGF2ZSBhbnkgZmlsdGVyaW5n
IGNyaXRlcmlhIGluIG1pbmQgbm90IApjb3ZlcmVkIGJ5IHRoZSBhdmFpbGFibGUgYXVkaXRjdGwg
ZXhjbHVzaW9ucyBvciBkbyB5b3UganVzdCB3YW50IHRvIAoic2FtcGxlIiByYW5kb21seT8KCklm
IHRoZSBsYXR0ZXIsIHdoeSBib3RoZXIgYXVkaXRpbmcgdGhpcyB3aXRoIGEgcnVsZSBhdCBhbGw/
IFlvdSBtaWdodCBiZSAKYWJsZSB0byByZW1vdmUgdGhlIHJ1bGUgY2F1c2luZyB0aGUgZXZlbnRz
IGFuZCBkbyBzb21ldGhpbmcgaW4gdXNlcnNwYWNlIAp0byBhdWRpdCBvbmx5IHdoYXQgeW91IHJl
YWxseSB3YW50LgoKV2l0aG91dCBhIGJpdCBtb3JlIGNvbnRleHQgb24gdGhlIGV2ZW50cywgcnVs
ZSBhbmQgaW50ZW50IGl0IGlzIGhhcmQgdG8gCnN1Z2dlc3QgYWx0ZXJuYXRpdmVzLiBCdXQgaW4g
Z2VuZXJhbCwgaXQgaXMgcHJlZmVyYWJsZSB0byBleGNsdWRlIGFzIAptdWNoIG5vaXNlIGFzIHBv
c3NpYmxlIGluIHlvdXIgY29sbGVjdGlvbiB0byBlbnN1cmUgeW91IGdldCBvbmx5IHdoYXQgaXMg
CnJlcXVpcmVkL2Rlc2lyZWQgaW4geW91ciBhdWRpdCBsb2dzLgoKTENCCgotLSAKTGVubnkgQnJ1
emVuYWsKTWFnaXRla0xURAoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0
QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hdWRpdAo=


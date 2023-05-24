Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F35370FE4F
	for <lists+linux-audit@lfdr.de>; Wed, 24 May 2023 21:12:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684955558;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sGBg1/BJKxr7ydSlStvXtqxL9w/gTCnGDD4EwO1EE5g=;
	b=jICDtD8kHgOTSSooR2OsxQVA6+FRe4gxiBiZorkYlMOFW4qhB0Yuk/r8zu0e6d9GOoUTs3
	h4jH94E03OhTdv2vtYaku4EsfxBF3NpuwgUpvCamOH52Y6fVi9Lwh2RJVITjhZxh2CIxsS
	YwwCMZ6lnoSCx2paFn9EQgRniPy5FfI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-cI1i0B0fNE-clEnGBzIXvQ-1; Wed, 24 May 2023 15:12:35 -0400
X-MC-Unique: cI1i0B0fNE-clEnGBzIXvQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80C62101A52C;
	Wed, 24 May 2023 19:12:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C1606400F17;
	Wed, 24 May 2023 19:12:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ABF1219465B9;
	Wed, 24 May 2023 19:12:23 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0401019465A0 for <linux-audit@listman.corp.redhat.com>;
 Wed, 24 May 2023 19:12:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AAE51400F17; Wed, 24 May 2023 19:12:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A37AA492B00
 for <linux-audit@redhat.com>; Wed, 24 May 2023 19:12:21 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 881DB38184E2
 for <linux-audit@redhat.com>; Wed, 24 May 2023 19:12:21 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-PLK-S8y5PeOJH7koc2NCAQ-1; Wed, 24 May 2023 15:12:19 -0400
X-MC-Unique: PLK-S8y5PeOJH7koc2NCAQ-1
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2af2f4e719eso16643351fa.2; 
 Wed, 24 May 2023 12:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684955538; x=1687547538;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pHfAQ+BQsGAj5xPd5WK7V8D10wuVyH5E1RHC5ui5qeQ=;
 b=kmIejvSjS7kFRLGpkWCWaZHTXTKWNBt7mtituUr5NYUZv45Ms63yhH7WfEfQp9vE9W
 ZMyuzHXhAaJ2I+7KZUmf4P5VWpVQ2H/UnkvJxeuHAKzclnkOeRGp1E+f3TVMx3Xato2s
 +Rp+01z5TA6MG7DPVuvq4l2kNG/Mz1chz8gPs0RJENHQ3Yx7XJSTiO7o7k3/HxWQqc0r
 ajSHkhiG/6/6FDB05T1l1bPbDKeyQLCDIKwb9oJ6cPl2BvEjysglnvmpMGXcOlEmzRG1
 e4W/If5soUGw+416Gm4ypSwnHUeTvYDJTR3VtEbfbTaP6dNxfx7i6kt3x9cJq0Wsmmuw
 p1ZA==
X-Gm-Message-State: AC+VfDwkUnYO1EJ7QvtAQKXPyL7ig06gRrYO7jGTivhwjYWNMcrficFu
 SpC+BUl5y7sEgnsEop/0cRnctq4TRbIjxpoh
X-Google-Smtp-Source: ACHHUZ63fd6g3YzXvBflhd64U+Y9RUI6EEaA9YkoWUwwE5Uvfkozl14FUSncbwc7QmitUBy7f6l9GQ==
X-Received: by 2002:a2e:b0d4:0:b0:2a8:a5b7:6057 with SMTP id
 g20-20020a2eb0d4000000b002a8a5b76057mr204015ljl.50.1684955537786; 
 Wed, 24 May 2023 12:12:17 -0700 (PDT)
Received: from [192.168.0.31] ([94.242.171.185])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a2e3807000000b002ad98ec6b10sm2189120lja.52.2023.05.24.12.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 12:12:17 -0700 (PDT)
Message-ID: <06f60953-b6a3-0e13-6dad-479a7258910e@gmail.com>
Date: Wed, 24 May 2023 22:12:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Auditd doesn't receive syscalls after installation for the
 current shell.
To: Paul Moore <paul@paul-moore.com>, Steve Grubb <sgrubb@redhat.com>
References: <b5e87a11-7605-6745-516a-8004569bbe5d@gmail.com>
 <2151809.irdbgypaU6@x2>
 <CAHC9VhThSLtni=JuStofi78=18SdH+VCUA4eGdOkbM9=J+wzLA@mail.gmail.com>
From: Rinat Gadelshin <rgadelsh@gmail.com>
In-Reply-To: <CAHC9VhThSLtni=JuStofi78=18SdH+VCUA4eGdOkbM9=J+wzLA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, ru-RU
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

Ck9uIDI0LjA1LjIwMjMgMTc6NTMsIFBhdWwgTW9vcmUgd3JvdGU6Cj4gT24gV2VkLCBNYXkgMjQs
IDIwMjMgYXQgMTA6NDbigK9BTSBTdGV2ZSBHcnViYiA8c2dydWJiQHJlZGhhdC5jb20+IHdyb3Rl
Ogo+PiBPbiBXZWRuZXNkYXksIE1heSAyNCwgMjAyMyA3OjM3OjI3IEFNIEVEVCBSaW5hdCBHYWRl
bHNoaW4gd3JvdGU6Cj4+PiBIZWxsbyB0aGVyZS4KPj4+Cj4+PiBJdCBzZWVtcyB0aGF0IHRoZSBr
ZXJuZWwgZG9lc24ndCBzZW5kIG1lc3NhZ2VzIGZvciBzeXNjYWxscyBvZiB0aGUgc2hlbGwKPj4+
IHByb2Nlc3MgZnJvbSB3aGljaCBhdWRpdGQgaXMgaW5zdGFsbGVkLgo+Pj4KPj4+IFJlcHJvZHVj
aW5nIHN0ZXBzIChwZXJmb3JtZWQgb24gVWJ1bnR1IDIyLjA0IHg4Nl82NCBvbiB2aXJ0dWFsIGJv
eCBieQo+Pj4gYHJvb3RgKToKPj4+Cj4+PiBzdGVwICMxOiAkIGFwdCBpbnN0YWxsIGF1ZGl0ZAo+
Pj4gc3RlcCAjMjogJCBhdWRpdGN0bCAtYSBhbHdheXMsZXhpdCAtRiBhcmNoPWI2NCAtUyBvcGVu
YXQscmVuYW1lYXQyLHVubGlua2F0Cj4+PiBzdGVwICMzOiAkIGVjaG8gdD5kZWxtZTtlY2hvIHQy
Pj5kZWxtZTtjYXQgZGVsbWU7bXYgZGVsbWUgZDttdiBkCj4+PiBkZWxtZTtybSBkZWxtZQo+Pj4g
c3RlcCAjNDogJCBzZXJ2aWNlIGF1ZGl0ZCBzdG9wCj4+PiBzdGVwICM1OiAkIGF1c2VhcmNoIC1m
IGRlbG1lCj4+Pgo+Pj4gVGhlcmUgYXJlIHN5c2NhbGxzIGZyb20gL3Vzci9iaW4vY2F0LCAvdXNy
L2Jpbi9tdiwgL3Vzci9iaW4vcm0gYnV0IHRoZXJlCj4+PiBhcmUgbm8gYW55IHN5c2NhbGxzIChv
cGVuYXQgZXhwZWN0ZWQpCj4+PiBmb3IgL3Vzci9iaW4vYmFzaCAoY3VycmVudCBzaGVsbCBwcm9j
ZXNzKSBmb3IgdGhlIGZpbGUuCj4+Pgo+Pj4gSWYgc3RlcCAjMyBpcyBwZXJmb3JtZWQgZnJvbSBh
bm90aGVyIHR0eSwgdGhlbiBvcGVuYXQgc3lzY2FsbHMKPj4+IChDUkVBVEUgZm9yIHRoZSBmaXJz
dCBlY2hvIGFuZCBOT1JNQUwgZm9yIHRoZSBzZWNvbmQgb25lKQo+Pj4gaXMgbG9nZ2VkIGZvciB0
aGUgL3Vzci9iaW4vYmFzaCBwcm9jZXNzLgo+Pj4KPj4+IGB1bmFtZSAtYWAgcmV0dXJuczogTGlu
dXggZ3Jpbi12Yi11YnVudHUtMjItMC00IDUuMTkuMC00MS1nZW5lcmljCj4+PiAjNDJ+MjIuMDQu
MDEtVWJ1bnR1IFNNUCBQUkVFTVBUX0RZTkFNSUMgVHVlIEFwciAxOCAxNzo0MDowMCBVVEMgMiB4
ODZfNjQKPj4+IHg4Nl82NCB4ODZfNjQgR05VL0xpbnV4Cj4+Pgo+Pj4gU2hvdWxkIEkgb3BlbiBh
biBpc3N1ZSBmb3IgdGhlIGNhc2UgYXQKPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1hdWRp
dC9hdWRpdC1rZXJuZWwgPwo+PiBBcmUgeW91IGJvb3Rpbmcgd2l0aCBhdWRpdD0xID8gSWYgbm90
LCB0aGUgaW5zdGFsbCBwcm9jZXNzIGFuZCBhbnkgYmVmb3JlIGl0Cj4+IGFyZSBub3QgYXVkaXRh
YmxlLiBZb3Ugd2lsbCBvbmx5IGdldCBldmVudHMgZm9yIHByb2Nlc3NlcyBzdGFydGVkIGFmdGVy
IGF1ZGl0Cj4+IGVuYWJsZWQgPSAxLgo+IEl0IGlzIGFsc28gd29ydGggbm90aW5nIHRoYXQgc29t
ZSBkaXN0cmlidXRpb25zIChJJ20gbm90IHN1cmUgaWYgdGhpcwo+IGFwcGxpZXMgdG8gVWJ1bnR1
KSBlZmZlY3RpdmVseSBsaW1pdCBhdWRpdGluZyB3aXRoIHRoZWlyIGRlZmF1bHQKPiBydW50aW1l
IGNvbmZpZ3VyYXRpb24sIHNlZSB0aGUgd2lraSBwYWdlIGJlbG93IGZvciBtb3JlIGluZm9ybWF0
aW9uOgo+Cj4gKiBodHRwczovL2dpdGh1Yi5jb20vbGludXgtYXVkaXQvYXVkaXQtZG9jdW1lbnRh
dGlvbi93aWtpL0hPV1RPLUZlZG9yYS1FbmFibGUtQXVkaXRpbmcKPgpTdGV2ZSwgUGF1bCwgdGhh
bmsgeW91IQpJdCBtYWtlIHRoZSBzaXR1YXRpb24gY29tcGxldGVseSBjbGVhciB0byBtZSA9KQoK
LS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6
Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=


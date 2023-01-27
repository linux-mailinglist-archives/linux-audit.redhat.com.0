Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEEF67F98A
	for <lists+linux-audit@lfdr.de>; Sat, 28 Jan 2023 17:24:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674923041;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Nyi0ed0WFdqkld6WGylXTt0H4MY5G/To62/bBvoMRzM=;
	b=WYZg7Sm2g+xXcHua90WcAfjOPNSncUJFVQ1BU4gy9lrny1Hltg5vITkStkCxG4pnvwW/LG
	/vaYppYGHaKQMZ9NtXvIBMdYuWDxJ6hVH0O611PrB/SbqjsmSW0PSpgBBEJyDBLFKuoLEz
	dQYeh09jCSv+o/uGkT4mx6GsImvWGOc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-LNJsqFNCP0yVv1dh-VPYEg-1; Sat, 28 Jan 2023 11:23:46 -0500
X-MC-Unique: LNJsqFNCP0yVv1dh-VPYEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11B4C1C05ECB;
	Sat, 28 Jan 2023 16:23:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32935422FE;
	Sat, 28 Jan 2023 16:23:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 06B2F19465B9;
	Sat, 28 Jan 2023 16:23:36 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 68D5B194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 23:03:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 341CCC15BAE; Fri, 27 Jan 2023 23:03:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D527C15BAD
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 23:03:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 110AA801779
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 23:03:50 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-uMdUUqz6MOW0niVK1v-FKA-1; Fri, 27 Jan 2023 18:03:48 -0500
X-MC-Unique: uMdUUqz6MOW0niVK1v-FKA-1
Received: by mail-pf1-f169.google.com with SMTP id 203so2991559pfx.6
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 15:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m2SRkdfehVqUlVEbPV1ol/qzmcbiChj1eXWjlHXA1fM=;
 b=TWqf9tyGEVg7ukqiYQSZtmTQjfS33XBt7CC4/HYsHLW4s8bG91WFoYzZkktDxCdiIA
 jjz6SQNU8bxE5vZ94vszO71RRUqe/DcFxsrq8jK4WZc4UZvEgc8tbfdqrr3c4Ir7HgF2
 aeEEC/aIjaa+PlqDwmO6dUTBOrh+1ZS7Lv6T1OHn9Pzxu7oKk6814Lti1wRYr+BjIEXv
 8nKO+nPUT0IzmRnnHwhWGghhCVdsESXibT789Q1HjeyyMMLtGSfBJzwMvdvuo8wP0uHj
 6w8LU2CN8Hh4Gf5ri3tcLzIMNow3eOFJPEjT8xmSiUIB1gqzSSqAB7u9V+hXSOzqwTGK
 UA/Q==
X-Gm-Message-State: AFqh2kpmSffT+HrI6HS1qukpuujAftNb8KDl4fOrJTZFe8xhLh067a1j
 SE11rKlVAK/T3/t0c69V54eOMQ==
X-Google-Smtp-Source: AMrXdXvyKThCnqjfhJIN0WxduTFibCfFlLqpnch3TBi9KvIRWTrTmraSgNE+8+meE778qDikDdlC2w==
X-Received: by 2002:a05:6a00:189a:b0:58d:e33b:d588 with SMTP id
 x26-20020a056a00189a00b0058de33bd588mr8670778pfh.2.1674860627043; 
 Fri, 27 Jan 2023 15:03:47 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0058bb8943c9asm3085751pfa.161.2023.01.27.15.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 15:03:46 -0800 (PST)
Message-ID: <68b599bb-2329-3125-1859-cf529fbeea00@kernel.dk>
Date: Fri, 27 Jan 2023 16:03:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/2] io_uring,audit: audit IORING_OP_FADVISE but not
 IORING_OP_MADVISE
To: Richard Guy Briggs <rgb@redhat.com>
References: <cover.1674682056.git.rgb@redhat.com>
 <68eb0c2dd50bca1af91203669f7f1f8312331f38.1674682056.git.rgb@redhat.com>
 <CAHC9VhSZNGs+SQU7WCD+ObMcwv-=1ZkBts8oHn40qWsQ=n0pXA@mail.gmail.com>
 <6d3f76ae-9f86-a96e-d540-cfd45475e288@kernel.dk>
 <Y9RYFHucRL5TrsDh@madcap2.tricolour.ca>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <Y9RYFHucRL5TrsDh@madcap2.tricolour.ca>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Sat, 28 Jan 2023 16:23:32 +0000
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
Cc: Christian Brauner <brauner@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMS8yNy8yMyA0OjAy4oCvUE0sIFJpY2hhcmQgR3V5IEJyaWdncyB3cm90ZToKPiBPbiAyMDIz
LTAxLTI3IDE1OjQ1LCBKZW5zIEF4Ym9lIHdyb3RlOgo+PiBPbiAxLzI3LzIzIDM6MzU/UE0sIFBh
dWwgTW9vcmUgd3JvdGU6Cj4+PiBPbiBGcmksIEphbiAyNywgMjAyMyBhdCAxMjoyNCBQTSBSaWNo
YXJkIEd1eSBCcmlnZ3MgPHJnYkByZWRoYXQuY29tPiB3cm90ZToKPj4+Pgo+Pj4+IFNpbmNlIEZB
RFZJU0UgY2FuIHRydW5jYXRlIGZpbGVzIGFuZCBNQURWSVNFIG9wZXJhdGVzIG9uIG1lbW9yeSwg
cmV2ZXJzZQo+Pj4+IHRoZSBhdWRpdF9za2lwIHRhZ3MuCj4+Pj4KPj4+PiBGaXhlczogNWJkMjE4
MmQ1OGU5ICgiYXVkaXQsaW9fdXJpbmcsaW8td3E6IGFkZCBzb21lIGJhc2ljIGF1ZGl0IHN1cHBv
cnQgdG8gaW9fdXJpbmciKQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgR3V5IEJyaWdncyA8
cmdiQHJlZGhhdC5jb20+Cj4+Pj4gLS0tCj4+Pj4gIGlvX3VyaW5nL29wZGVmLmMgfCAyICstCj4+
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4+Cj4+
Pj4gZGlmZiAtLWdpdCBhL2lvX3VyaW5nL29wZGVmLmMgYi9pb191cmluZy9vcGRlZi5jCj4+Pj4g
aW5kZXggM2FhMGQ2NWM1MGUzLi5hMmJmNTNiNGEzOGEgMTAwNjQ0Cj4+Pj4gLS0tIGEvaW9fdXJp
bmcvb3BkZWYuYwo+Pj4+ICsrKyBiL2lvX3VyaW5nL29wZGVmLmMKPj4+PiBAQCAtMzA2LDEyICsz
MDYsMTIgQEAgY29uc3Qgc3RydWN0IGlvX29wX2RlZiBpb19vcF9kZWZzW10gPSB7Cj4+Pj4gICAg
ICAgICB9LAo+Pj4+ICAgICAgICAgW0lPUklOR19PUF9GQURWSVNFXSA9IHsKPj4+PiAgICAgICAg
ICAgICAgICAgLm5lZWRzX2ZpbGUgICAgICAgICAgICAgPSAxLAo+Pj4+IC0gICAgICAgICAgICAg
ICAuYXVkaXRfc2tpcCAgICAgICAgICAgICA9IDEsCj4+Pj4gICAgICAgICAgICAgICAgIC5uYW1l
ICAgICAgICAgICAgICAgICAgID0gIkZBRFZJU0UiLAo+Pj4+ICAgICAgICAgICAgICAgICAucHJl
cCAgICAgICAgICAgICAgICAgICA9IGlvX2ZhZHZpc2VfcHJlcCwKPj4+PiAgICAgICAgICAgICAg
ICAgLmlzc3VlICAgICAgICAgICAgICAgICAgPSBpb19mYWR2aXNlLAo+Pj4+ICAgICAgICAgfSwK
Pj4+Cj4+PiBJJ3ZlIG5ldmVyIHVzZWQgcG9zaXhfZmFkdmlzZSgpIG9yIHRoZSBhc3NvY2lhdGVk
IGZhZHZpc2U2NCooKQo+Pj4gc3lzY2FsbHMsIGJ1dCBmcm9tIHF1aWNrbHkgcmVhZGluZyB0aGUg
bWFucGFnZXMgYW5kIHRoZQo+Pj4gZ2VuZXJpY19mYWR2aXNlKCkgZnVuY3Rpb24gaW4gdGhlIGtl
cm5lbCBJJ20gbWlzc2luZyB3aGVyZSB0aGUgZmFkdmlzZQo+Pj4gZmFtaWx5IG9mIGZ1bmN0aW9u
cyBjb3VsZCBiZSB1c2VkIHRvIHRydW5jYXRlIGEgZmlsZSwgY2FuIHlvdSBzaG93IG1lCj4+PiB3
aGVyZSB0aGlzIGhhcHBlbnM/ICBUaGUgY2xvc2VzdCBJIGNhbiBzZWUgaXMgdGhlIG1hbmlwdWxh
dGlvbiBvZiB0aGUKPj4+IHBhZ2UgY2FjaGUsIGJ1dCB0aGF0IHNob3VsZG4ndCBhY3R1YWxseSBt
b2RpZnkgdGhlIGZpbGUgLi4uIHJpZ2h0Pwo+Pgo+PiBZZWFoLCBob25lc3RseSBub3Qgc3VyZSB3
aGVyZSB0aGF0IGNhbWUgZnJvbS4gTWF5YmUgaXQncyBiZWluZyBtaXhlZCB1cAo+PiB3aXRoIGZh
bGxvY2F0ZT8gQWxsIGZhZHZpc2UgKG9yIG1hZHZpc2UsIGZvciB0aGF0IG1hdHRlcikgZG9lcyBp
cwo+PiBwcm92aWRlIGhpbnRzIG9uIHRoZSBjYWNoaW5nIG9yIGFjY2VzcyBwYXR0ZXJuLiBPbiBz
ZWNvbmQgdGhvdWdodCwgYm90aAo+PiBvZiB0aGVzZSBzaG91bGQgYmUgYWJsZSB0byBzZXQgYXVk
aXRfc2tpcCBhcyBmYXIgYXMgSSBjYW4gdGVsbC4KPiAKPiBUaGF0IHdhcyBvbmUgc3VzcGljaW9u
IEkgaGFkLiAgSWYgdGhpcyBpcyB0aGUgY2FzZSwgSSdkIGFncmVlIGJvdGggY291bGQKPiBiZSBz
a2lwcGVkLgoKSSdkIGJlIHN1cnByaXNlZCBpZiBTdGV2ZSBkaWRuJ3QgbWl4IHRoZW0gdXAuIE9u
Y2UgaGUgcmVzcG9uZHMsIGNhbiB5b3UKc2VuZCBhIHYyIHdpdGggdGhlIGNvcnJlY3Rpb24/Cgot
LSAKSmVucyBBeGJvZQoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEBy
ZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYXVkaXQK


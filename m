Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D566AAC8E
	for <lists+linux-audit@lfdr.de>; Sat,  4 Mar 2023 21:55:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677963341;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2C0lKcIzWK2hp0kqyMWilhZl3m1lQ6BB8FKsHL00o8E=;
	b=gz+YxBZ3m3G05bYRxf2fPrG3xn5jRkzsQw7xs5FYfcfT8nfMv7gTZBCpWRHhL9bSztFvIf
	YYVdDSOYLbPNw/DtVp4LES/QKbQzaZFAgAnU7ShMn7bcwZ6cQOwdJiZvB+RpvBDcZGvbyt
	F+h+x17G+Kbl5xCiZHQ9zTq7pFBe4bU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-jgWmMYPDNRiS_3hg0Bambw-1; Sat, 04 Mar 2023 15:55:40 -0500
X-MC-Unique: jgWmMYPDNRiS_3hg0Bambw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E79B85CBE0;
	Sat,  4 Mar 2023 20:55:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 35AE61410DDA;
	Sat,  4 Mar 2023 20:55:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 26527194973B;
	Sat,  4 Mar 2023 20:55:26 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 82E5219452CD for <linux-audit@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 19:07:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 743C6492B01; Thu,  2 Mar 2023 19:07:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CA2E492C3E
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 19:07:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A28B1C189A9
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 19:07:41 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-G59GPBo5O6WNabvO60w4Zg-1; Thu, 02 Mar 2023 14:07:39 -0500
X-MC-Unique: G59GPBo5O6WNabvO60w4Zg-1
Received: by mail-pj1-f50.google.com with SMTP id bo22so139391pjb.4
 for <linux-audit@redhat.com>; Thu, 02 Mar 2023 11:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677784058;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sXmdCYS8uUA/QelUv6yyIq1avb/Bwhi6mEnWSJfU5vs=;
 b=exco9lzs8lIIxf9dyvwMQpTCvkekznT7WTXxPcYAelvBiD/mu5tBw5Ablew/tnpJZb
 1EnTot5P1d36WNa3Z0KtSSV1Gg0dtcb3TKokSfTHanBIAMrr914t6b+uF5rolNz30cYL
 ogSVLdygIUOzOM5t4UUWRTlcY1SQ9v7fvASfW7Mjq/Nbg+6+KSnvF2TWdd4mN8f0mShT
 LQ4o/V1MNCW6OXERUj3s/wZWKZdsNLkDr0/rh/zOqder573oA5Wx+rJoaknMrYYOUAIy
 wIDiZPNgYpbx2LyM0qQzAIsYMgdTuTCKQ2x81oKMmIBpw71Ra7uIju+Esmwa+WYpdaeJ
 gv3A==
X-Gm-Message-State: AO0yUKVXmORTLvwn/nuvVptto5yPAy5JHi1IzeM2chwrK3t2Gntj6o5u
 1flUPNeiQgRP9F0BRWMVW4j6zoCdOxTRE5eORYz6
X-Google-Smtp-Source: AK7set/Db7WZZKl0taW3exwY3q/1lycmaTlq+aBJLdP6HP+tCJ31sSnx8gcIjQrgxrfxLNkQEq4WjDmVJRupdw5mfEM=
X-Received: by 2002:a17:90a:df8e:b0:234:87a7:f180 with SMTP id
 p14-20020a17090adf8e00b0023487a7f180mr4514483pjv.0.1677784058098; Thu, 02 Mar
 2023 11:07:38 -0800 (PST)
MIME-Version: 1.0
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-10-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1675119451-23180-10-git-send-email-wufan@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 2 Mar 2023 14:07:27 -0500
Message-ID: <CAHC9VhTiLafboxni2z01mxs=QNZFjgJ7EMJL33RWPpTqJKgfgA@mail.gmail.com>
Subject: Re: [RFC PATCH v9 09/16] block|security: add LSM blob to block_device
To: Fan Wu <wufan@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Sat, 04 Mar 2023 20:55:24 +0000
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, tytso@mit.edu,
 dm-devel@redhat.com, corbet@lwn.net, roberto.sassu@huawei.com,
 Deven Bowers <deven.desai@linux.microsoft.com>, linux-doc@vger.kernel.org,
 snitzer@kernel.org, jmorris@namei.org, zohar@linux.ibm.com,
 linux-kernel@vger.kernel.org, ebiggers@kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 eparis@redhat.com, linux-fscrypt@vger.kernel.org,
 linux-integrity@vger.kernel.org, agk@redhat.com, serge@hallyn.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBKYW4gMzAsIDIwMjMgYXQgNTo1OOKAr1BNIEZhbiBXdSA8d3VmYW5AbGludXgubWlj
cm9zb2Z0LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBEZXZlbiBCb3dlcnMgPGRldmVuLmRlc2FpQGxp
bnV4Lm1pY3Jvc29mdC5jb20+Cj4KPiBibG9ja19kZXZpY2Ugc3RydWN0dXJlcyBjYW4gaGF2ZSB2
YWx1YWJsZSBzZWN1cml0eSBwcm9wZXJ0aWVzLAo+IGJhc2VkIG9uIGhvdyB0aGV5IGFyZSBjcmVh
dGVkLCBhbmQgd2hhdCBzdWJzeXN0ZW0gbWFuYWdlcyB0aGVtLgo+Cj4gQnkgYWRkaW5nIExTTSBz
dG9yYWdlIHRvIHRoaXMgc3RydWN0dXJlLCB0aGlzIGRhdGEgY2FuIGJlIGFjY2Vzc2VkCj4gYXQg
dGhlIExTTSBsYXllci4KPgo+IFNpZ25lZC1vZmYtYnk6IERldmVuIEJvd2VycyA8ZGV2ZW4uZGVz
YWlAbGludXgubWljcm9zb2Z0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBGYW4gV3UgPHd1ZmFuQGxp
bnV4Lm1pY3Jvc29mdC5jb20+Cj4gUmV2aWV3ZWQtYnk6IENhc2V5IFNjaGF1ZmxlciA8Y2FzZXlA
c2NoYXVmbGVyLWNhLmNvbT4KCi4uLgoKPiAtLS0KPiAgYmxvY2svYmRldi5jICAgICAgICAgICAg
ICAgICAgfCAgNyArKysrCj4gIGluY2x1ZGUvbGludXgvYmxrX3R5cGVzLmggICAgIHwgIDMgKysK
PiAgaW5jbHVkZS9saW51eC9sc21faG9va19kZWZzLmggfCAgNSArKysKPiAgaW5jbHVkZS9saW51
eC9sc21faG9va3MuaCAgICAgfCAxMiArKysrKysKPiAgaW5jbHVkZS9saW51eC9zZWN1cml0eS5o
ICAgICAgfCAyMiArKysrKysrKysrKwo+ICBzZWN1cml0eS9zZWN1cml0eS5jICAgICAgICAgICB8
IDcwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDYgZmlsZXMgY2hhbmdl
ZCwgMTE5IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9ibG9jay9iZGV2LmMgYi9ibG9j
ay9iZGV2LmMKPiBpbmRleCBlZGMxMTBkOTBkZjQuLmY4ZGI1M2I0N2MwMCAxMDA2NDQKPiAtLS0g
YS9ibG9jay9iZGV2LmMKPiArKysgYi9ibG9jay9iZGV2LmMKPiBAQCAtMjQsNiArMjQsNyBAQAo+
ICAjaW5jbHVkZSA8bGludXgvcHNldWRvX2ZzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC91aW8uaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L25hbWVpLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zZWN1cml0eS5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvcGFydF9zdGF0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC91YWNj
ZXNzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zdGF0Lmg+Cj4gQEAgLTM5Niw2ICszOTcsMTEgQEAg
c3RhdGljIHN0cnVjdCBpbm9kZSAqYmRldl9hbGxvY19pbm9kZShzdHJ1Y3Qgc3VwZXJfYmxvY2sg
KnNiKQo+ICAgICAgICAgaWYgKCFlaSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4g
ICAgICAgICBtZW1zZXQoJmVpLT5iZGV2LCAwLCBzaXplb2YoZWktPmJkZXYpKTsKPiArCj4gKyAg
ICAgICBpZiAoc2VjdXJpdHlfYmRldl9hbGxvYygmZWktPmJkZXYpKSB7Cj4gKyAgICAgICAgICAg
ICAgIGttZW1fY2FjaGVfZnJlZShiZGV2X2NhY2hlcCwgZWkpOwo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gTlVMTDsKPiArICAgICAgIH0KPiAgICAgICAgIHJldHVybiAmZWktPnZmc19pbm9kZTsK
PiAgfQo+Cj4gQEAgLTQwNSw2ICs0MTEsNyBAQCBzdGF0aWMgdm9pZCBiZGV2X2ZyZWVfaW5vZGUo
c3RydWN0IGlub2RlICppbm9kZSkKPgo+ICAgICAgICAgZnJlZV9wZXJjcHUoYmRldi0+YmRfc3Rh
dHMpOwo+ICAgICAgICAga2ZyZWUoYmRldi0+YmRfbWV0YV9pbmZvKTsKPiArICAgICAgIHNlY3Vy
aXR5X2JkZXZfZnJlZShiZGV2KTsKPgo+ICAgICAgICAgaWYgKCFiZGV2X2lzX3BhcnRpdGlvbihi
ZGV2KSkgewo+ICAgICAgICAgICAgICAgICBpZiAoYmRldi0+YmRfZGlzayAmJiBiZGV2LT5iZF9k
aXNrLT5iZGkpCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYmxrX3R5cGVzLmggYi9pbmNs
dWRlL2xpbnV4L2Jsa190eXBlcy5oCj4gaW5kZXggOTliZTU5MGY5NTJmLi4xMzdhMDRmNDVjMTcg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9ibGtfdHlwZXMuaAo+ICsrKyBiL2luY2x1ZGUv
bGludXgvYmxrX3R5cGVzLmgKPiBAQCAtNjgsNiArNjgsOSBAQCBzdHJ1Y3QgYmxvY2tfZGV2aWNl
IHsKPiAgI2lmZGVmIENPTkZJR19GQUlMX01BS0VfUkVRVUVTVAo+ICAgICAgICAgYm9vbCAgICAg
ICAgICAgICAgICAgICAgYmRfbWFrZV9pdF9mYWlsOwo+ICAjZW5kaWYKPiArI2lmZGVmIENPTkZJ
R19TRUNVUklUWQo+ICsgICAgICAgdm9pZCAgICAgICAgICAgICAgICAgICAgKnNlY3VyaXR5Owo+
ICsjZW5kaWYKPiAgfSBfX3JhbmRvbWl6ZV9sYXlvdXQ7Cj4KPiAgI2RlZmluZSBiZGV2X3dob2xl
KF9iZGV2KSBcCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbHNtX2hvb2tfZGVmcy5oIGIv
aW5jbHVkZS9saW51eC9sc21faG9va19kZWZzLmgKPiBpbmRleCBlZDZjYjJhYzU1ZmEuLjFmNzkw
MjljOWUyOCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2xzbV9ob29rX2RlZnMuaAo+ICsr
KyBiL2luY2x1ZGUvbGludXgvbHNtX2hvb2tfZGVmcy5oCj4gQEAgLTQxNywzICs0MTcsOCBAQCBM
U01fSE9PSyhpbnQsIDAsIHVyaW5nX292ZXJyaWRlX2NyZWRzLCBjb25zdCBzdHJ1Y3QgY3JlZCAq
bmV3KQo+ICBMU01fSE9PSyhpbnQsIDAsIHVyaW5nX3NxcG9sbCwgdm9pZCkKPiAgTFNNX0hPT0so
aW50LCAwLCB1cmluZ19jbWQsIHN0cnVjdCBpb191cmluZ19jbWQgKmlvdWNtZCkKPiAgI2VuZGlm
IC8qIENPTkZJR19JT19VUklORyAqLwo+ICsKPiArTFNNX0hPT0soaW50LCAwLCBiZGV2X2FsbG9j
X3NlY3VyaXR5LCBzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2KQo+ICtMU01fSE9PSyh2b2lkLCBM
U01fUkVUX1ZPSUQsIGJkZXZfZnJlZV9zZWN1cml0eSwgc3RydWN0IGJsb2NrX2RldmljZSAqYmRl
dikKPiArTFNNX0hPT0soaW50LCAwLCBiZGV2X3NldHNlY3VyaXR5LCBzdHJ1Y3QgYmxvY2tfZGV2
aWNlICpiZGV2LCBjb25zdCBjaGFyICpuYW1lLAo+ICsgICAgICAgIGNvbnN0IHZvaWQgKnZhbHVl
LCBzaXplX3Qgc2l6ZSkKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9sc21faG9va3MuaCBi
L2luY2x1ZGUvbGludXgvbHNtX2hvb2tzLmgKPiBpbmRleCAwYTViYTgxZjczNjcuLmI2MjJjZWI1
N2Q4MyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2xzbV9ob29rcy5oCj4gKysrIGIvaW5j
bHVkZS9saW51eC9sc21faG9va3MuaAo+IEBAIC0xNjE4LDYgKzE2MTgsMTcgQEAKPiAgICogICAg
IEB3aGF0OiBrZXJuZWwgZmVhdHVyZSBiZWluZyBhY2Nlc3NlZC4KPiAgICogICAgIFJldHVybiAw
IGlmIHBlcm1pc3Npb24gaXMgZ3JhbnRlZC4KPiAgICoKPiArICogQGJkZXZfYWxsb2Nfc2VjdXJp
dHk6Cj4gKyAqICAgICBJbml0aWFsaXplIHRoZSBzZWN1cml0eSBmaWVsZCBpbnNpZGUgYSBibG9j
a19kZXZpY2Ugc3RydWN0dXJlLgo+ICsgKgo+ICsgKiBAYmRldl9mcmVlX3NlY3VyaXR5Ogo+ICsg
KiAgICAgQ2xlYW51cCB0aGUgc2VjdXJpdHkgaW5mb3JtYXRpb24gc3RvcmVkIGluc2lkZSBhIGJs
b2NrX2RldmljZSBzdHJ1Y3R1cmUuCj4gKyAqCj4gKyAqIEBiZGV2X3NldHNlY3VyaXR5Ogo+ICsg
KiAgICAgU2V0IGEgc2VjdXJpdHkgcHJvcGVydHkgYXNzb2NpYXRlZCB3aXRoIEBuYW1lIGZvciBA
YmRldiB3aXRoCj4gKyAqICAgICB2YWx1ZSBAdmFsdWUuIEBzaXplIGluZGljYXRlcyB0aGUgc2l6
ZSBvZiBAdmFsdWUgaW4gYnl0ZXMuCj4gKyAqICAgICBJZiBhIEBuYW1lIGlzIG5vdCBpbXBsZW1l
bnRlZCwgcmV0dXJuIC1FT1BOT1RTVVBQLgo+ICsgKgoKSnVzdCBhIGhlYWRzLXVwIHRoYXQgdGhl
IExTTSBob29rIGNvbW1lbnQgYmxvY2tzIGFyZSBtb3ZpbmcgdG8Kc2VjdXJpdHkvc2VjdXJpdHku
YyB2ZXJ5IHNvb24gbm93IChpZiB0aGV5IGFyZSBub3QgYWxyZWFkeSB0aGVyZSBieQp0aGUgdGlt
ZSB5b3UgcmVhZCB0aGlzKS4KCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXNlY3VyaXR5
LW1vZHVsZS8yMDIzMDIxNzAzMjYyNS42Nzg0NTctMS1wYXVsQHBhdWwtbW9vcmUuY29tCgo+IGRp
ZmYgLS1naXQgYS9zZWN1cml0eS9zZWN1cml0eS5jIGIvc2VjdXJpdHkvc2VjdXJpdHkuYwo+IGlu
ZGV4IGQxNTcxOTAwYThjNy4uNWM4MWRkM2IxMzUwIDEwMDY0NAo+IC0tLSBhL3NlY3VyaXR5L3Nl
Y3VyaXR5LmMKPiArKysgYi9zZWN1cml0eS9zZWN1cml0eS5jCj4gQEAgLTI3MDUsNiArMjczMCw1
MSBAQCBpbnQgc2VjdXJpdHlfbG9ja2VkX2Rvd24oZW51bSBsb2NrZG93bl9yZWFzb24gd2hhdCkK
PiAgfQo+ICBFWFBPUlRfU1lNQk9MKHNlY3VyaXR5X2xvY2tlZF9kb3duKTsKPgo+ICtpbnQgc2Vj
dXJpdHlfYmRldl9hbGxvYyhzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2KQo+ICt7Cj4gKyAgICAg
ICBpbnQgcmMgPSAwOwo+ICsKPiArICAgICAgIHJjID0gbHNtX2JkZXZfYWxsb2MoYmRldik7Cj4g
KyAgICAgICBpZiAodW5saWtlbHkocmMpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4g
Kwo+ICsgICAgICAgcmMgPSBjYWxsX2ludF9ob29rKGJkZXZfYWxsb2Nfc2VjdXJpdHksIDAsIGJk
ZXYpOwo+ICsgICAgICAgaWYgKHVubGlrZWx5KHJjKSkKPiArICAgICAgICAgICAgICAgc2VjdXJp
dHlfYmRldl9mcmVlKGJkZXYpOwo+ICsKPiArICAgICAgIHJldHVybiBMU01fUkVUX0RFRkFVTFQo
YmRldl9hbGxvY19zZWN1cml0eSk7Cj4gK30KPiArRVhQT1JUX1NZTUJPTChzZWN1cml0eV9iZGV2
X2FsbG9jKTsKPiArCj4gK3ZvaWQgc2VjdXJpdHlfYmRldl9mcmVlKHN0cnVjdCBibG9ja19kZXZp
Y2UgKmJkZXYpCj4gK3sKPiArICAgICAgIGlmICghYmRldi0+c2VjdXJpdHkpCj4gKyAgICAgICAg
ICAgICAgIHJldHVybjsKPiArCj4gKyAgICAgICBjYWxsX3ZvaWRfaG9vayhiZGV2X2ZyZWVfc2Vj
dXJpdHksIGJkZXYpOwo+ICsKPiArICAgICAgIGtmcmVlKGJkZXYtPnNlY3VyaXR5KTsKPiArICAg
ICAgIGJkZXYtPnNlY3VyaXR5ID0gTlVMTDsKPiArfQo+ICtFWFBPUlRfU1lNQk9MKHNlY3VyaXR5
X2JkZXZfZnJlZSk7Cj4gKwo+ICtpbnQgc2VjdXJpdHlfYmRldl9zZXRzZWN1cml0eShzdHJ1Y3Qg
YmxvY2tfZGV2aWNlICpiZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0
IGNoYXIgKm5hbWUsIGNvbnN0IHZvaWQgKnZhbHVlLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNpemVfdCBzaXplKQo+ICt7Cj4gKyAgICAgICBpbnQgcmMgPSAwOwo+ICsgICAgICAg
c3RydWN0IHNlY3VyaXR5X2hvb2tfbGlzdCAqcDsKPiArCj4gKyAgICAgICBobGlzdF9mb3JfZWFj
aF9lbnRyeShwLCAmc2VjdXJpdHlfaG9va19oZWFkcy5iZGV2X3NldHNlY3VyaXR5LCBsaXN0KSB7
Cj4gKyAgICAgICAgICAgICAgIHJjID0gcC0+aG9vay5iZGV2X3NldHNlY3VyaXR5KGJkZXYsIG5h
bWUsIHZhbHVlLCBzaXplKTsKPiArICAgICAgICAgICAgICAgaWYgKHJjICYmIHJjICE9IC1FT1BO
T1RTVVBQKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByYzsKPiArICAgICAgIH0K
PiArCj4gKyAgICAgICByZXR1cm4gTFNNX1JFVF9ERUZBVUxUKGJkZXZfc2V0c2VjdXJpdHkpOwo+
ICt9Cj4gK0VYUE9SVF9TWU1CT0woc2VjdXJpdHlfYmRldl9zZXRzZWN1cml0eSk7CgpJIHRoaW5r
IHdlIG5lZWQgdG8gc2VlIHRoZSBgc2VjdXJpdHlfYmRldl9zZXRzZWN1cml0eSgpYCBob29rIGFj
dHVhbGx5CnVzZWQgYnkgYSBjYWxsZXIgaW4gdGhpcyBwYXRjaC4KCj4gICNpZmRlZiBDT05GSUdf
UEVSRl9FVkVOVFMKPiAgaW50IHNlY3VyaXR5X3BlcmZfZXZlbnRfb3BlbihzdHJ1Y3QgcGVyZl9l
dmVudF9hdHRyICphdHRyLCBpbnQgdHlwZSkKPiAgewo+IC0tCj4gMi4zOS4wCgotLQpwYXVsLW1v
b3JlLmNvbQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5j
b20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRp
dAo=


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A52B6AAC90
	for <lists+linux-audit@lfdr.de>; Sat,  4 Mar 2023 21:56:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677963366;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FE9V7YEITuixkGE6b+ly1YTtc/AAvX6DTYxunDOskW4=;
	b=DJEDXGcefbBQv+JGeLxhM3h3RUhWKSSWA4jGDHTMnxTvDaVfR8eQFetLDKXInTWrQMd3oN
	Yrh8FU4rqPFAj/PLrKJuwhgchLlPw1/xWowL4U8NztKpyftUA4eR7YZk0kRs517yEOhOoC
	+ug5KSm+SIv9oUsMkrxUa3bbrMe1XBc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-kRdvxIjwNkO3Uc0zqahhiA-1; Sat, 04 Mar 2023 15:55:36 -0500
X-MC-Unique: kRdvxIjwNkO3Uc0zqahhiA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4179E29ABA05;
	Sat,  4 Mar 2023 20:55:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 958DF492C3E;
	Sat,  4 Mar 2023 20:55:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BE27E1943BC2;
	Sat,  4 Mar 2023 20:55:25 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E052719452CE for <linux-audit@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 19:03:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C53BE2026D76; Thu,  2 Mar 2023 19:03:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE2AE2026D4B
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 19:03:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99DF71871D94
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 19:03:25 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-cm6xVi7NOhOzFl3kuGanMw-1; Thu, 02 Mar 2023 14:03:24 -0500
X-MC-Unique: cm6xVi7NOhOzFl3kuGanMw-1
Received: by mail-pl1-f176.google.com with SMTP id p6so367433plf.0
 for <linux-audit@redhat.com>; Thu, 02 Mar 2023 11:03:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677783803;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FssevT39iJZR1q32L9Ldyz9vD4a6RNVi8ykMS5L1yW0=;
 b=GGzCadmKx2dcqLDmenZ6ry3I0o6j0QqdpRKlP+uvKsXCFdoqTu1czFEZ78LyvK3lr2
 qwg5Flv/EGrDuVIu9s5wCNXQu4DmOKyKVJpUTQ9O4HwQm0Kx5RvnC1IKwXUgxeIyLXxh
 wZ+tOFGTQq//cDWml/y3vvQJhpwDHUhFlOwcHFmc7ChEfbRpwIMmTobNF3B2JUX3LYKZ
 SRBVym/b/aHmdqRQvH1W47RXDSTJ1Tn10Qd5PrraYohHfePp4GMzLBno6NK0x7r49JsJ
 4gC/frYL4KtwR5kZ6ZMD135lkMOE+LbEt9wd6wHfDm39euCURnZoI4uTgWNDKCCHXvJn
 6SfA==
X-Gm-Message-State: AO0yUKUCJ1ilU+6uLYFJoczXtdcRupe9Tgwpaz8zQZvt61Y6G50bTLkl
 GwVS7ZpqqrOJbEIt/TtZE4+C+dwkmUBGKI2rK3CV2Iu2isVn
X-Google-Smtp-Source: AK7set+3/GrjQmGEOIf5XN+oR/tJPrT7DH51D3Ab0edP4F+WhT/BThkJbqjsZYFOdsjV/WC6bwO0qzp+XudiOKcSgMg=
X-Received: by 2002:a17:90b:3798:b0:237:7edd:2e08 with SMTP id
 mz24-20020a17090b379800b002377edd2e08mr4456582pjb.0.1677783802723; Thu, 02
 Mar 2023 11:03:22 -0800 (PST)
MIME-Version: 1.0
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-4-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1675119451-23180-4-git-send-email-wufan@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 2 Mar 2023 14:03:11 -0500
Message-ID: <CAHC9VhS_EbT7ze4oSHwHfus91VWQfdgGagf=5O7_h+XJ2o79PA@mail.gmail.com>
Subject: Re: [RFC PATCH v9 03/16] ipe: add evaluation loop and introduce
 'boot_verified' as a trust provider
To: Fan Wu <wufan@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBKYW4gMzAsIDIwMjMgYXQgNTo1OOKAr1BNIEZhbiBXdSA8d3VmYW5AbGludXgubWlj
cm9zb2Z0LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBEZXZlbiBCb3dlcnMgPGRldmVuLmRlc2FpQGxp
bnV4Lm1pY3Jvc29mdC5jb20+Cj4KPiBJUEUgbXVzdCBoYXZlIGEgY2VudHJhbGl6ZWQgZnVuY3Rp
b24gdG8gZXZhbHVhdGUgaW5jb21pbmcgY2FsbGVycwo+IGFnYWluc3QgSVBFJ3MgcG9saWN5LiBU
aGlzIGl0ZXJhdGlvbiBvZiB0aGUgcG9saWN5IGFnYWluc3QgdGhlIHJ1bGVzCj4gZm9yIHRoYXQg
c3BlY2lmaWMgY2FsbGVyIGlzIGtub3duIGFzIHRoZSBldmFsdWF0aW9uIGxvb3AuCj4KPiBJbiBh
ZGRpdGlvbiwgSVBFIGlzIGRlc2lnbmVkIHRvIHByb3ZpZGUgc3lzdGVtIGxldmVsIHRydXN0IGd1
YXJhbnRlZXMsCj4gdGhpcyB1c3VhbGx5IGltcGxpZXMgdGhhdCB0cnVzdCBzdGFydHMgZnJvbSBi
b290dXAgd2l0aCBhIGhhcmR3YXJlIHJvb3QKPiBvZiB0cnVzdCwgd2hpY2ggdmFsaWRhdGVzIHRo
ZSBib290bG9hZGVyLiBBZnRlciB0aGlzLCB0aGUgYm9vdGxvYWRlcgo+IHZlcmlmaWVzIHRoZSBr
ZXJuZWwgYW5kIHRoZSBpbml0cmFtZnMuCj4KPiBBcyB0aGVyZSdzIG5vIGN1cnJlbnRseSBzdXBw
b3J0ZWQgaW50ZWdyaXR5IG1ldGhvZCBmb3IgaW5pdHJhbWZzLCBhbmQKPiBpdCdzIHR5cGljYWxs
eSBhbHJlYWR5IHZlcmlmaWVkIGJ5IHRoZSBib290bG9hZGVyLCBpbnRyb2R1Y2UgYSBwcm9wZXJ0
eQo+IHRoYXQgY2F1c2VzIHRoZSBmaXJzdCBzdXBlcmJsb2NrIHRvIGhhdmUgYW4gZXhlY3V0aW9u
IHRvIGJlICJwaW5uZWQiLAo+IHdoaWNoIGlzIHR5cGljYWxseSBpbml0cmFtZnMuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBEZXZlbiBCb3dlcnMgPGRldmVuLmRlc2FpQGxpbnV4Lm1pY3Jvc29mdC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogRmFuIFd1IDx3dWZhbkBsaW51eC5taWNyb3NvZnQuY29tPgoKLi4u
Cgo+IC0tLQo+ICBzZWN1cml0eS9pcGUvTWFrZWZpbGUgICAgICAgIHwgICAxICsKPiAgc2VjdXJp
dHkvaXBlL2V2YWwuYyAgICAgICAgICB8IDE4MCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICBzZWN1cml0eS9pcGUvZXZhbC5oICAgICAgICAgIHwgIDI4ICsrKysrKwo+ICBz
ZWN1cml0eS9pcGUvaG9va3MuYyAgICAgICAgIHwgIDI1ICsrKysrCj4gIHNlY3VyaXR5L2lwZS9o
b29rcy5oICAgICAgICAgfCAgMTQgKysrCj4gIHNlY3VyaXR5L2lwZS9pcGUuYyAgICAgICAgICAg
fCAgIDEgKwo+ICBzZWN1cml0eS9pcGUvcG9saWN5LmMgICAgICAgIHwgIDIwICsrKysKPiAgc2Vj
dXJpdHkvaXBlL3BvbGljeS5oICAgICAgICB8ICAgMyArCj4gIHNlY3VyaXR5L2lwZS9wb2xpY3lf
cGFyc2VyLmMgfCAgIDggKy0KPiAgOSBmaWxlcyBjaGFuZ2VkLCAyNzkgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL2V2YWwuYwo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL2V2YWwuaAo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgc2VjdXJpdHkvaXBlL2hvb2tzLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5
L2lwZS9ob29rcy5oCj4KPiBkaWZmIC0tZ2l0IGEvc2VjdXJpdHkvaXBlL01ha2VmaWxlIGIvc2Vj
dXJpdHkvaXBlL01ha2VmaWxlCj4gaW5kZXggMTZiYmU4MDk5MWYxLi5kN2YyODcwZDdjMDkgMTAw
NjQ0Cj4gLS0tIGEvc2VjdXJpdHkvaXBlL01ha2VmaWxlCj4gKysrIGIvc2VjdXJpdHkvaXBlL01h
a2VmaWxlCj4gQEAgLTYsNiArNiw3IEBACj4gICMKPgo+ICBvYmotJChDT05GSUdfU0VDVVJJVFlf
SVBFKSArPSBcCj4gKyAgICAgICBldmFsLm8gXAo+ICAgICAgICAgaG9va3MubyBcCj4gICAgICAg
ICBpcGUubyBcCj4gICAgICAgICBwb2xpY3kubyBcCj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2lw
ZS9ldmFsLmMgYi9zZWN1cml0eS9pcGUvZXZhbC5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwMDAuLjQ4YjUxMDRhMzQ2Mwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9z
ZWN1cml0eS9pcGUvZXZhbC5jCj4gQEAgLTAsMCArMSwxODAgQEAKPiArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAKPiArLyoKPiArICogQ29weXJpZ2h0IChDKSBNaWNyb3NvZnQg
Q29ycG9yYXRpb24uIEFsbCByaWdodHMgcmVzZXJ2ZWQuCj4gKyAqLwo+ICsKPiArI2luY2x1ZGUg
ImlwZS5oIgo+ICsjaW5jbHVkZSAiZXZhbC5oIgo+ICsjaW5jbHVkZSAiaG9va3MuaCIKPiArI2lu
Y2x1ZGUgInBvbGljeS5oIgo+ICsKPiArI2luY2x1ZGUgPGxpbnV4L2ZzLmg+Cj4gKyNpbmNsdWRl
IDxsaW51eC90eXBlcy5oPgo+ICsjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICsjaW5jbHVkZSA8
bGludXgvZmlsZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KPiArI2luY2x1ZGUgPGxp
bnV4L3JjdXBkYXRlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zcGlubG9jay5oPgo+ICsKPiArc3Ry
dWN0IGlwZV9wb2xpY3kgX19yY3UgKmlwZV9hY3RpdmVfcG9saWN5Owo+ICsKPiArc3RhdGljIHN0
cnVjdCBzdXBlcl9ibG9jayAqcGlubmVkX3NiOwo+ICtzdGF0aWMgREVGSU5FX1NQSU5MT0NLKHBp
bl9sb2NrKTsKPiArI2RlZmluZSBGSUxFX1NVUEVSQkxPQ0soZikgKChmKS0+Zl9wYXRoLm1udC0+
bW50X3NiKQo+ICsKPiArLyoqCj4gKyAqIHBpbl9zYiAtIFBpbiB0aGUgdW5kZXJseWluZyBzdXBl
cmJsb2NrIG9mIEBmLCBtYXJraW5nIGl0IGFzIHRydXN0ZWQuCj4gKyAqIEBmOiBTdXBwbGllcyBh
IGZpbGUgc3RydWN0dXJlIHRvIHNvdXJjZSB0aGUgc3VwZXJfYmxvY2sgZnJvbS4KPiArICovCj4g
K3N0YXRpYyB2b2lkIHBpbl9zYihjb25zdCBzdHJ1Y3QgZmlsZSAqZikKPiArewo+ICsgICAgICAg
aWYgKCFmKQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKyAgICAgICBzcGluX2xvY2soJnBp
bl9sb2NrKTsKPiArICAgICAgIGlmIChwaW5uZWRfc2IpCj4gKyAgICAgICAgICAgICAgIGdvdG8g
b3V0Owo+ICsgICAgICAgcGlubmVkX3NiID0gRklMRV9TVVBFUkJMT0NLKGYpOwo+ICtvdXQ6Cj4g
KyAgICAgICBzcGluX3VubG9jaygmcGluX2xvY2spOwo+ICt9CgpTaW5jZSB5b3UgZG9uJ3QgYWN0
dWFsbHkgdXNlIEBmLCBqdXN0IHRoZSBzdXBlcl9ibG9jaywgeW91IG1pZ2h0CmNvbnNpZGVyIHBh
c3NpbmcgdGhlIHN1cGVyX2Jsb2NrIGFzIHRoZSBwYXJhbWV0ZXIgYW5kIG5vdCB0aGUKYXNzb2Np
YXRlZCBmaWxlLgoKSSdkIHByb2JhYmx5IGFsc28gZmxpcCB0aGUgaWYtdGhlbiB0byBhdm9pZCB0
aGUgJ2dvdG8nLCBmb3IgZXhhbXBsZToKCiAgc3RhdGljIHZvaWQgcGluX3NiKGNvbnN0IHN0cnVj
dCBzdXBlcl9ibG9jayAqc2IpCiAgewogICAgaWYgKCFzYikKICAgICAgcmV0dXJuOwogICAgc3Bp
bl9sb2NrKCZwaW5fbG9jayk7CiAgICBpZiAoIXBpbm5lZF9zYikKICAgICAgcGlubmVkX3NiID0g
c2I7CiAgICBzcGluX3VubG9jaygmcGluX2xvY2spOwogIH0KCkFsc28sIGRvIHdlIG5lZWQgdG8g
d29ycnkgYWJvdXQgdGhlIGluaXRyYW1mcycgYmVpbmcgdW5tb3VudGVkIGFuZCB0aGUKc3VwZXJf
YmxvY2sgZ29pbmcgYXdheT8KCj4gKy8qKgo+ICsgKiBmcm9tX3Bpbm5lZCAtIERldGVybWluZSB3
aGV0aGVyIEBmIGlzIHNvdXJjZSBmcm9tIHRoZSBwaW5uZWQgc3VwZXJfYmxvY2suCj4gKyAqIEBm
OiBTdXBwbGllcyBhIGZpbGUgc3RydWN0dXJlIHRvIGNoZWNrIGFnYWluc3QgdGhlIHBpbm5lZCBz
dXBlcl9ibG9jay4KPiArICoKPiArICogUmV0dXJuOgo+ICsgKiAqIHRydWUgICAgICAtIEBmIGlz
IHNvdXJjZWQgZnJvbSB0aGUgcGlubmVkIHN1cGVyX2Jsb2NrCj4gKyAqICogZmFsc2UgICAgIC0g
QGYgaXMgbm90IHNvdXJjZWQgZnJvbSB0aGUgcGlubmVkIHN1cGVyX2Jsb2NrCj4gKyAqLwo+ICtz
dGF0aWMgYm9vbCBmcm9tX3Bpbm5lZChjb25zdCBzdHJ1Y3QgZmlsZSAqZikKPiArewo+ICsgICAg
ICAgYm9vbCBydjsKPiArCj4gKyAgICAgICBpZiAoIWYpCj4gKyAgICAgICAgICAgICAgIHJldHVy
biBmYWxzZTsKPiArICAgICAgIHNwaW5fbG9jaygmcGluX2xvY2spOwo+ICsgICAgICAgcnYgPSAh
SVNfRVJSX09SX05VTEwocGlubmVkX3NiKSAmJiBwaW5uZWRfc2IgPT0gRklMRV9TVVBFUkJMT0NL
KGYpOwo+ICsgICAgICAgc3Bpbl91bmxvY2soJnBpbl9sb2NrKTsKPiArICAgICAgIHJldHVybiBy
djsKPiArfQo+ICsKPiArLyoqCj4gKyAqIGJ1aWxkX2V2YWxfY3R4IC0gQnVpbGQgYW4gZXZhbHVh
dGlvbiBjb250ZXh0Lgo+ICsgKiBAY3R4OiBTdXBwbGllcyBhIHBvaW50ZXIgdG8gdGhlIGNvbnRl
eHQgdG8gYmUgcG9wdWxkYXRlZC4KPiArICogQGZpbGU6IFN1cHBsaWVzIGEgcG9pbnRlciB0byB0
aGUgZmlsZSB0byBhc3NvY2lhdGVkIHdpdGggdGhlIGV2YWx1YXRpb24uCj4gKyAqIEBvcDogU3Vw
cGxpZXMgdGhlIElQRSBwb2xpY3kgb3BlcmF0aW9uIGFzc29jaWF0ZWQgd2l0aCB0aGUgZXZhbHVh
dGlvbi4KPiArICovCj4gK3ZvaWQgYnVpbGRfZXZhbF9jdHgoc3RydWN0IGlwZV9ldmFsX2N0eCAq
Y3R4LAo+ICsgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGZpbGUgKmZpbGUsCj4gKyAg
ICAgICAgICAgICAgICAgICBlbnVtIGlwZV9vcF90eXBlIG9wKQo+ICt7Cj4gKyAgICAgICBjdHgt
PmZpbGUgPSBmaWxlOwo+ICsgICAgICAgY3R4LT5vcCA9IG9wOwo+ICsgICAgICAgY3R4LT5mcm9t
X2luaXRfc2IgPSBmcm9tX3Bpbm5lZChmaWxlKTsKPiArfQoKSSB3YXMgYSBsaXR0bGUgY29uY2Vy
bmVkIGFib3V0IHRoZSBzcGlubG9jayBhcm91bmQgdGhlIHBpbm5lZApzdXBlcmJsb2NrIGJlaW5n
IGEgcG90ZW50aWFsIGlzc3VlIHNvIEkgd2FzIGNoZWNraW5nIHRoZSBjYWxsZXJzIG9mCmBidWls
ZF9ldmFsX2N0eCgpYCBhbmQgcmVhbGl6ZWQgdGhlcmUgYXJlIG5vIGNhbGxlcnMgaW4gdGhpcyBw
YXRjaCAuLi4KPyAgTWF5YmUgaXQgbWFrZXMgc2Vuc2UgZm9yIGBidWlsZF9ldmFsX2N0eCgpYCB0
byBiZSBpbiB0aGlzIHBhdGNoIGJ1dAppdCBzZWVtcyBhIGxpdHRsZSBvZGQuCgo+ICsvKioKPiAr
ICogZXZhbHVhdGVfcHJvcGVydHkgLSBBbmFseXplIEBjdHggYWdhaW5zdCBhIHByb3BlcnR5Lgo+
ICsgKiBAY3R4OiBTdXBwbGllcyBhIHBvaW50ZXIgdG8gdGhlIGNvbnRleHQgdG8gYmUgZXZhbHVh
dGVkLgo+ICsgKiBAcDogU3VwcGxpZXMgYSBwb2ludGVyIHRvIHRoZSBwcm9wZXJ0eSB0byBiZSBl
dmFsdWF0ZWQuCj4gKyAqCj4gKyAqIFJldHVybjoKPiArICogKiB0cnVlICAgICAgLSBUaGUgY3Vy
cmVudCBAY3R4IG1hdGNoIHRoZSBAcAo+ICsgKiAqIGZhbHNlICAgICAtIFRoZSBjdXJyZW50IEBj
dHggZG9lc24ndCBtYXRjaCB0aGUgQHAKPiArICovCj4gK3N0YXRpYyBib29sIGV2YWx1YXRlX3By
b3BlcnR5KGNvbnN0IHN0cnVjdCBpcGVfZXZhbF9jdHggKmNvbnN0IGN0eCwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaXBlX3Byb3AgKnApCj4gK3sKPiArICAgICAgIGJv
b2wgZXZhbCA9IGZhbHNlOwo+ICsKPiArICAgICAgIHN3aXRjaCAocC0+dHlwZSkgewo+ICsgICAg
ICAgY2FzZSBpcGVfcHJvcF9ib290X3ZlcmlmaWVkX2ZhbHNlOgo+ICsgICAgICAgICAgICAgICBl
dmFsID0gIWN0eC0+ZnJvbV9pbml0X3NiOwo+ICsgICAgICAgICAgICAgICBicmVhazsKPiArICAg
ICAgIGNhc2UgaXBlX3Byb3BfYm9vdF92ZXJpZmllZF90cnVlOgo+ICsgICAgICAgICAgICAgICBl
dmFsID0gY3R4LT5mcm9tX2luaXRfc2I7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAg
ICAgZGVmYXVsdDoKPiArICAgICAgICAgICAgICAgZXZhbCA9IGZhbHNlOwoKWW91IGRvbid0IG5l
ZWQgdG8gc2V0IEBldmFsIHRvIGZhbHNlIGJvdGggd2hlbiBpdCBpcyBkZWNsYXJlZCBvciBpbgp0
aGUgJ2RlZmF1bHQnIGNhc2UuCgpIb25lc3RseSwgeW91IGRvbid0IG5lZWQgQGV2YWwgYXQgYWxs
LCB5b3UgY2FuIHNpbXBseSByZXBsYWNlIGFsbCBvZgp0aGUgQGV2YWwgYXNzaWdubWVudCBzdGF0
ZW1lbnRzIHdpdGggcmV0dXJuIHN0YXRlbWVudHMuCgo+ICsgICAgICAgfQo+ICsKPiArICAgICAg
IHJldHVybiBldmFsOwo+ICt9Cj4gKwo+ICsvKioKPiArICogaXBlX2V2YWx1YXRlX2V2ZW50IC0g
QW5hbHl6ZSBAY3R4IGFnYWluc3QgdGhlIGN1cnJlbnQgYWN0aXZlIHBvbGljeS4KPiArICogQGN0
eDogU3VwcGxpZXMgYSBwb2ludGVyIHRvIHRoZSBjb250ZXh0IHRvIGJlIGV2YWx1YXRlZC4KPiAr
ICoKPiArICogVGhpcyBpcyB0aGUgbG9vcCB3aGVyZSBhbGwgcG9saWN5IGV2YWx1YXRpb24gaGFw
cGVucyBhZ2FpbnN0IElQRSBwb2xpY3kuCj4gKyAqCj4gKyAqIFJldHVybjoKPiArICogKiAwICAg
ICAgICAgLSBPSwo+ICsgKiAqIC1FQUNDRVMgICAtIEBjdHggZGlkIG5vdCBwYXNzIGV2YWx1YXRp
b24uCj4gKyAqICogITAgICAgICAgICAgICAgICAgLSBFcnJvcgo+ICsgKi8KPiAraW50IGlwZV9l
dmFsdWF0ZV9ldmVudChjb25zdCBzdHJ1Y3QgaXBlX2V2YWxfY3R4ICpjb25zdCBjdHgpCj4gK3sK
PiArICAgICAgIGludCByYyA9IDA7Cj4gKyAgICAgICBib29sIG1hdGNoID0gZmFsc2U7Cj4gKyAg
ICAgICBlbnVtIGlwZV9hY3Rpb25fdHlwZSBhY3Rpb247Cj4gKyAgICAgICBzdHJ1Y3QgaXBlX3Bv
bGljeSAqcG9sID0gTlVMTDsKPiArICAgICAgIGNvbnN0IHN0cnVjdCBpcGVfcnVsZSAqcnVsZSA9
IE5VTEw7Cj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgaXBlX29wX3RhYmxlICpydWxlcyA9IE5VTEw7
Cj4gKyAgICAgICBzdHJ1Y3QgaXBlX3Byb3AgKnByb3AgPSBOVUxMOwo+ICsKPiArICAgICAgIGlm
IChjdHgtPm9wID09IGlwZV9vcF9leGVjKQo+ICsgICAgICAgICAgICAgICBwaW5fc2IoY3R4LT5m
aWxlKTsKCklmIEkgdW5kZXJzdGFuZCB0aGluZ3MgY29ycmVjdGx5LCB0aGUgaW5pdHJhbWZzIGlz
IGRldGVybWluZWQgYnkgdGhlCmZpcnN0IHByb2Nlc3MgdG8gYmUgZXhlY3V0ZWQ/ICBJIHRoaW5r
IHRoYXQncyByZWFzb25hYmxlLCBidXQgSSdtCmJlZ2lubmluZyB0byB3b25kZXIgaWYgdGhhdCBw
aW5uZWQgc3VwZXJfYmxvY2sgc3BpbmxvY2sgaXMgZ29pbmcgdG8gYmUKYSBwcm9ibGVtLCBlc3Bl
Y2lhbGx5IGZvciBzb21ldGhpbmcgdGhhdCBpcyB3cml0dGVuIG9uY2UgKHR3aWNlIGlmIHlvdQpj
b25zaWRlciB0aGUgRVJSX1BUUigtRUlPKSBvbiB1bW91bnQpLCB5ZXQgcmVhZCBmb3IgZWFjaCBJ
UEUgcG9saWN5CmV2YWx1YXRpb24uCgpJJ20gb2theSBpZiB5b3Ugd2FudCB0byBrZWVwIHRoaXMg
YXMgYSBzcGlubG9jayBmb3Igbm93LCBidXQgdGhpcwpzZWVtcyBsaWtlIGEgZ29vZCBjYW5kaWRh
dGUgZm9yIFJDVSwgYW5kIHRoZSBjaGFuZ2Ugd291bGQgYmUgdHJpdmlhbApzaW5jZSBpdCBpcyBh
IHNpbmdsZSBwb2ludGVyLgoKPiArICAgICAgIHBvbCA9IGlwZV9nZXRfcG9saWN5X3JjdShpcGVf
YWN0aXZlX3BvbGljeSk7CgpJIGRvbid0IHRoaW5rIHlvdSBjYW4gc2FmZWx5IGRyb3AgdGhlIFJD
VSBsb2NrIGFuZCBsZWF2ZSB0aGUgUkNVCmNyaXRpY2FsIHNlY3Rpb24gd2hpbGUgeW91IGFyZSBz
dGlsbCB1c2luZyBAaXBlX2FjdGl2ZV9wb2xpY3kuICBJCnRoaW5rIHRoZSByaWdodCB0aGluZyB0
byBkbyBpcyB0byBnZXQgcmlkIG9mIGBpcGVfZ2V0X3BvbGljeV9yY3UoKWAKYW5kIHNpbXBseSBw
bGFjZSBmcm9tIGhlcmUgb24gZG93biBpbiBgaXBlX2V2YWx1YXRlX2V2ZW50KClgIGluIGEgUkNV
CmNyaXRpY2FsIHNlY3Rpb24uICBEb2luZyBzbyB3b3VsZCBlbnN1cmUgdGhhdCBAaXBlX2FjdGl2
ZV9wb2xpY3kgY291bGQKbm90IGJlIGZyZWUnZC9yZXBsYWNlZCBmcm9tIHVuZGVybmVhdGggeW91
IHdoaWxlIGV2YWx1YXRpbmcgYW4gZXZlbnQuCgo+ICsgICAgICAgaWYgKCFwb2wpCj4gKyAgICAg
ICAgICAgICAgIGdvdG8gb3V0Owo+ICsKPiArICAgICAgIGlmIChjdHgtPm9wID09IGlwZV9vcF9t
YXgpIHsKPiArICAgICAgICAgICAgICAgYWN0aW9uID0gcG9sLT5wYXJzZWQtPmdsb2JhbF9kZWZh
dWx0X2FjdGlvbjsKPiArICAgICAgICAgICAgICAgZ290byBldmFsOwo+ICsgICAgICAgfQo+ICsK
PiArICAgICAgIHJ1bGVzID0gJnBvbC0+cGFyc2VkLT5ydWxlc1tjdHgtPm9wXTsKPiArCj4gKyAg
ICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KHJ1bGUsICZydWxlcy0+cnVsZXMsIG5leHQpIHsKPiAr
ICAgICAgICAgICAgICAgbWF0Y2ggPSB0cnVlOwo+ICsKPiArICAgICAgICAgICAgICAgbGlzdF9m
b3JfZWFjaF9lbnRyeShwcm9wLCAmcnVsZS0+cHJvcHMsIG5leHQpCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgbWF0Y2ggPSBtYXRjaCAmJiBldmFsdWF0ZV9wcm9wZXJ0eShjdHgsIHByb3ApOwo+
ICsKPiArICAgICAgICAgICAgICAgaWYgKG1hdGNoKQo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGJyZWFrOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGlmIChtYXRjaCkKPiArICAgICAgICAg
ICAgICAgYWN0aW9uID0gcnVsZS0+YWN0aW9uOwo+ICsgICAgICAgZWxzZSBpZiAocnVsZXMtPmRl
ZmF1bHRfYWN0aW9uICE9IGlwZV9hY3Rpb25fbWF4KQo+ICsgICAgICAgICAgICAgICBhY3Rpb24g
PSBydWxlcy0+ZGVmYXVsdF9hY3Rpb247Cj4gKyAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAg
IGFjdGlvbiA9IHBvbC0+cGFyc2VkLT5nbG9iYWxfZGVmYXVsdF9hY3Rpb247Cj4gKwo+ICtldmFs
Ogo+ICsgICAgICAgaWYgKGFjdGlvbiA9PSBpcGVfYWN0aW9uX2RlbnkpCj4gKyAgICAgICAgICAg
ICAgIHJjID0gLUVBQ0NFUzsKPiArCj4gK291dDoKPiArICAgICAgIHJldHVybiByYzsKPiArfQo+
ICsKPiArLyoqCj4gKyAqIGlwZV9pbnZhbGlkYXRlX3Bpbm5lZF9zYiAtIGludmFsaWR0ZSB0aGUg
aXBlIHBpbm5lZCBzdXBlcl9ibG9jay4KPiArICogQG1udF9zYjogc3VwZXJfYmxvY2sgdG8gY2hl
Y2sgYWdhaW5zdCB0aGUgcGlubmVkIHN1cGVyX2Jsb2NrLgo+ICsgKgo+ICsgKiBUaGlzIGZ1bmN0
aW9uIGlzIGNhbGxlZCBhIHN1cGVyX2Jsb2NrIGxpa2UgdGhlIGluaXRyYW1mcydzIGlzIGZyZWVk
LAo+ICsgKiBpZiB0aGUgc3VwZXJfYmxvY2sgaXMgY3VycmVudGx5IHBpbm5lZCBieSBpcGUgaXQg
d2lsbCBiZSBpbnZhbGlkZWQsCj4gKyAqIHNvIGlwZSB3b24ndCBjb25zaWRlciB0aGUgYmxvY2sg
ZGV2aWNlIGlzIGJvb3QgdmVyaWZpZWQgYWZ0ZXJ3YXJkLgo+ICsgKi8KPiArdm9pZCBpcGVfaW52
YWxpZGF0ZV9waW5uZWRfc2IoY29uc3Qgc3RydWN0IHN1cGVyX2Jsb2NrICptbnRfc2IpCj4gK3sK
PiArICAgICAgIHNwaW5fbG9jaygmcGluX2xvY2spOwo+ICsKPiArICAgICAgIGlmICghSVNfRVJS
X09SX05VTEwocGlubmVkX3NiKSAmJiBtbnRfc2IgPT0gcGlubmVkX3NiKQo+ICsgICAgICAgICAg
ICAgICBwaW5uZWRfc2IgPSBFUlJfUFRSKC1FSU8pOwoKSSB0aGluayB5b3Ugb25seSBuZWVkIHRv
IGNoZWNrIGlmIEBwaW5uZWRfc2IgaXMgZXF1YWwgdG8gQG1udF9zYiwKdGhhdCdzIGFsbCB0aGF0
IHJlYWxseSBtYXR0ZXJzIGhlcmUuCgo+ICsgICAgICAgc3Bpbl91bmxvY2soJnBpbl9sb2NrKTsK
PiArfQo+IGRpZmYgLS1naXQgYS9zZWN1cml0eS9pcGUvZXZhbC5oIGIvc2VjdXJpdHkvaXBlL2V2
YWwuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi44ODc3OTc0
MzhiOWIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc2VjdXJpdHkvaXBlL2V2YWwuaAo+IEBAIC0w
LDAgKzEsMjggQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiAr
LyoKPiArICogQ29weXJpZ2h0IChDKSBNaWNyb3NvZnQgQ29ycG9yYXRpb24uIEFsbCByaWdodHMg
cmVzZXJ2ZWQuCj4gKyAqLwo+ICsKPiArI2lmbmRlZiBJUEVfRVZBTF9ICj4gKyNkZWZpbmUgSVBF
X0VWQUxfSAo+ICsKPiArI2luY2x1ZGUgPGxpbnV4L2ZpbGUuaD4KPiArI2luY2x1ZGUgPGxpbnV4
L3R5cGVzLmg+Cj4gKwo+ICsjaW5jbHVkZSAiaG9va3MuaCIKPiArI2luY2x1ZGUgInBvbGljeS5o
Igo+ICsKPiArZXh0ZXJuIHN0cnVjdCBpcGVfcG9saWN5IF9fcmN1ICppcGVfYWN0aXZlX3BvbGlj
eTsKPiArCj4gK3N0cnVjdCBpcGVfZXZhbF9jdHggewo+ICsgICAgICAgZW51bSBpcGVfb3BfdHlw
ZSBvcDsKPiArCj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgZmlsZSAqZmlsZTsKPiArICAgICAgIGJv
b2wgZnJvbV9pbml0X3NiOwo+ICt9Owo+ICsKPiArdm9pZCBidWlsZF9ldmFsX2N0eChzdHJ1Y3Qg
aXBlX2V2YWxfY3R4ICpjdHgsIGNvbnN0IHN0cnVjdCBmaWxlICpmaWxlLCBlbnVtIGlwZV9vcF90
eXBlIG9wKTsKPiAraW50IGlwZV9ldmFsdWF0ZV9ldmVudChjb25zdCBzdHJ1Y3QgaXBlX2V2YWxf
Y3R4ICpjb25zdCBjdHgpOwo+ICt2b2lkIGlwZV9pbnZhbGlkYXRlX3Bpbm5lZF9zYihjb25zdCBz
dHJ1Y3Qgc3VwZXJfYmxvY2sgKm1udF9zYik7Cj4gKwo+ICsjZW5kaWYgLyogSVBFX0VWQUxfSCAq
Lwo+IGRpZmYgLS1naXQgYS9zZWN1cml0eS9pcGUvaG9va3MuYyBiL3NlY3VyaXR5L2lwZS9ob29r
cy5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjMzNWI3NzNj
N2FlMQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9zZWN1cml0eS9pcGUvaG9va3MuYwo+IEBAIC0w
LDAgKzEsMjUgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArLyoK
PiArICogQ29weXJpZ2h0IChDKSBNaWNyb3NvZnQgQ29ycG9yYXRpb24uIEFsbCByaWdodHMgcmVz
ZXJ2ZWQuCj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgImlwZS5oIgo+ICsjaW5jbHVkZSAiaG9va3Mu
aCIKPiArI2luY2x1ZGUgImV2YWwuaCIKPiArCj4gKyNpbmNsdWRlIDxsaW51eC9mcy5oPgo+ICsj
aW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2JpbmZtdHMuaD4KPiAr
I2luY2x1ZGUgPGxpbnV4L21tYW4uaD4KPiArCj4gKy8qKgo+ICsgKiBpcGVfc2JfZnJlZV9zZWN1
cml0eSAtIGlwZSBzZWN1cml0eSBob29rIGZ1bmN0aW9uIGZvciBzdXBlcl9ibG9jay4KPiArICog
QG1udF9zYjogU3VwcGxpZXMgYSBwb2ludGVyIHRvIGEgc3VwZXJfYmxvY2sgaXMgYWJvdXQgdG8g
YmUgZnJlZWQuCj4gKyAqCj4gKyAqIElQRSBkb2VzIG5vdCBoYXZlIGFueSBzdHJ1Y3R1cmVzIHdp
dGggbW50X3NiLCBidXQgdXNlcyB0aGlzIGhvb2sgdG8KPiArICogaW52YWxpZGF0ZSBhIHBpbm5l
ZCBzdXBlcl9ibG9jay4KPiArICovCj4gK3ZvaWQgaXBlX3NiX2ZyZWVfc2VjdXJpdHkoc3RydWN0
IHN1cGVyX2Jsb2NrICptbnRfc2IpCj4gK3sKPiArICAgICAgIGlwZV9pbnZhbGlkYXRlX3Bpbm5l
ZF9zYihtbnRfc2IpOwo+ICt9Cj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2lwZS9ob29rcy5oIGIv
c2VjdXJpdHkvaXBlL2hvb2tzLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAwMC4uMzBmZTQ1NTM4OWJmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3NlY3VyaXR5L2lw
ZS9ob29rcy5oCj4gQEAgLTAsMCArMSwxNCBAQAo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMCAqLwo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKEMpIE1pY3Jvc29mdCBDb3Jwb3Jh
dGlvbi4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KPiArICovCj4gKyNpZm5kZWYgSVBFX0hPT0tTX0gK
PiArI2RlZmluZSBJUEVfSE9PS1NfSAo+ICsKPiArI2luY2x1ZGUgPGxpbnV4L2ZzLmg+Cj4gKyNp
bmNsdWRlIDxsaW51eC9iaW5mbXRzLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zZWN1cml0eS5oPgo+
ICsKPiArdm9pZCBpcGVfc2JfZnJlZV9zZWN1cml0eShzdHJ1Y3Qgc3VwZXJfYmxvY2sgKm1udF9z
Yik7Cj4gKwo+ICsjZW5kaWYgLyogSVBFX0hPT0tTX0ggKi8KPiBkaWZmIC0tZ2l0IGEvc2VjdXJp
dHkvaXBlL2lwZS5jIGIvc2VjdXJpdHkvaXBlL2lwZS5jCj4gaW5kZXggOWVkM2JmNGRjYzA0Li41
NTFjNmQ5MGFjMTEgMTAwNjQ0Cj4gLS0tIGEvc2VjdXJpdHkvaXBlL2lwZS5jCj4gKysrIGIvc2Vj
dXJpdHkvaXBlL2lwZS5jCj4gQEAgLTksNiArOSw3IEBAIHN0YXRpYyBzdHJ1Y3QgbHNtX2Jsb2Jf
c2l6ZXMgaXBlX2Jsb2JzIF9fbHNtX3JvX2FmdGVyX2luaXQgPSB7Cj4gIH07Cj4KPiAgc3RhdGlj
IHN0cnVjdCBzZWN1cml0eV9ob29rX2xpc3QgaXBlX2hvb2tzW10gX19sc21fcm9fYWZ0ZXJfaW5p
dCA9IHsKPiArICAgICAgIExTTV9IT09LX0lOSVQoc2JfZnJlZV9zZWN1cml0eSwgaXBlX3NiX2Zy
ZWVfc2VjdXJpdHkpLAo+ICB9Owo+Cj4gIC8qKgo+IGRpZmYgLS1naXQgYS9zZWN1cml0eS9pcGUv
cG9saWN5LmMgYi9zZWN1cml0eS9pcGUvcG9saWN5LmMKPiBpbmRleCBlNDQ2ZjRiODQxNTIuLjc3
MmQ4NzZiMTA4NyAxMDA2NDQKPiAtLS0gYS9zZWN1cml0eS9pcGUvcG9saWN5LmMKPiArKysgYi9z
ZWN1cml0eS9pcGUvcG9saWN5LmMKPiBAQCAtOTcsMyArOTcsMjMgQEAgc3RydWN0IGlwZV9wb2xp
Y3kgKmlwZV9uZXdfcG9saWN5KGNvbnN0IGNoYXIgKnRleHQsIHNpemVfdCB0ZXh0bGVuLAo+ICBl
cnI6Cj4gICAgICAgICByZXR1cm4gRVJSX1BUUihyYyk7Cj4gIH0KPiArCj4gKy8qKgo+ICsgKiBp
cGVfZ2V0X3BvbGljeV9yY3UgLSBEZXJlZmVyZW5jZSBhIHJjdS1wcm90ZWN0ZWQgcG9saWN5IHBv
aW50ZXIuCj4gKyAqCj4gKyAqIEBwOiByY3UtcHJvdGVjdGVkIHBvaW50ZXIgdG8gYSBwb2xpY3ku
Cj4gKyAqCj4gKyAqIE5vdCBzYWZlIHRvIGNhbGwgb24gSVNfRVJSLgo+ICsgKgo+ICsgKiBSZXR1
cm46IHRoZSB2YWx1ZSBvZiBAcAo+ICsgKi8KPiArc3RydWN0IGlwZV9wb2xpY3kgKmlwZV9nZXRf
cG9saWN5X3JjdShzdHJ1Y3QgaXBlX3BvbGljeSBfX3JjdSAqcCkKPiArewo+ICsgICAgICAgc3Ry
dWN0IGlwZV9wb2xpY3kgKnJ2ID0gTlVMTDsKPiArCj4gKyAgICAgICByY3VfcmVhZF9sb2NrKCk7
Cj4gKyAgICAgICBydiA9IHJjdV9kZXJlZmVyZW5jZShwKTsKPiArICAgICAgIHJjdV9yZWFkX3Vu
bG9jaygpOwo+ICsKPiArICAgICAgIHJldHVybiBydjsKPiArfQo+IGRpZmYgLS1naXQgYS9zZWN1
cml0eS9pcGUvcG9saWN5LmggYi9zZWN1cml0eS9pcGUvcG9saWN5LmgKPiBpbmRleCA2YWYyZDlh
ODExZWMuLjk2N2Q4MTZjZDVjZCAxMDA2NDQKPiAtLS0gYS9zZWN1cml0eS9pcGUvcG9saWN5LmgK
PiArKysgYi9zZWN1cml0eS9pcGUvcG9saWN5LmgKPiBAQCAtMjYsNiArMjYsOCBAQCBlbnVtIGlw
ZV9hY3Rpb25fdHlwZSB7Cj4gIH07Cj4KPiAgZW51bSBpcGVfcHJvcF90eXBlIHsKPiArICAgICAg
IGlwZV9wcm9wX2Jvb3RfdmVyaWZpZWRfZmFsc2UsCj4gKyAgICAgICBpcGVfcHJvcF9ib290X3Zl
cmlmaWVkX3RydWUsCj4gICAgICAgICBpcGVfcHJvcF9tYXgKPiAgfTsKPgo+IEBAIC03Myw1ICs3
NSw2IEBAIHN0cnVjdCBpcGVfcG9saWN5IHsKPiAgc3RydWN0IGlwZV9wb2xpY3kgKmlwZV9uZXdf
cG9saWN5KGNvbnN0IGNoYXIgKnRleHQsIHNpemVfdCB0ZXh0bGVuLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpwa2NzNywgc2l6ZV90IHBrY3M3bGVuKTsK
PiAgdm9pZCBpcGVfZnJlZV9wb2xpY3koc3RydWN0IGlwZV9wb2xpY3kgKnBvbCk7Cj4gK3N0cnVj
dCBpcGVfcG9saWN5ICppcGVfZ2V0X3BvbGljeV9yY3Uoc3RydWN0IGlwZV9wb2xpY3kgX19yY3Ug
KnApOwo+Cj4gICNlbmRpZiAvKiBJUEVfUE9MSUNZX0ggKi8KPiBkaWZmIC0tZ2l0IGEvc2VjdXJp
dHkvaXBlL3BvbGljeV9wYXJzZXIuYyBiL3NlY3VyaXR5L2lwZS9wb2xpY3lfcGFyc2VyLmMKPiBp
bmRleCBjN2JhMGU4NjUzNjYuLjdlZmFmYzQ4MmU0NiAxMDA2NDQKPiAtLS0gYS9zZWN1cml0eS9p
cGUvcG9saWN5X3BhcnNlci5jCj4gKysrIGIvc2VjdXJpdHkvaXBlL3BvbGljeV9wYXJzZXIuYwo+
IEBAIC0yNjUsNyArMjY1LDkgQEAgc3RhdGljIGVudW0gaXBlX2FjdGlvbl90eXBlIHBhcnNlX2Fj
dGlvbihjaGFyICp0KQo+ICB9Cj4KPiAgc3RhdGljIGNvbnN0IG1hdGNoX3RhYmxlX3QgcHJvcGVy
dHlfdG9rZW5zID0gewo+IC0gICAgICAge2lwZV9wcm9wX21heCwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgTlVMTH0KPiArICAgICAgIHtpcGVfcHJvcF9ib290X3ZlcmlmaWVkX2Zh
bHNlLCAgImJvb3RfdmVyaWZpZWQ9RkFMU0UifSwKPiArICAgICAgIHtpcGVfcHJvcF9ib290X3Zl
cmlmaWVkX3RydWUsICAgImJvb3RfdmVyaWZpZWQ9VFJVRSJ9LAo+ICsgICAgICAge2lwZV9wcm9w
X21heCwgICAgICAgICAgICAgICAgICBOVUxMfQo+ICB9Owo+Cj4gIC8qKgo+IEBAIC0yOTUsNiAr
Mjk3LDEwIEBAIGludCBwYXJzZV9wcm9wZXJ0eShjaGFyICp0LCBzdHJ1Y3QgaXBlX3J1bGUgKnIp
Cj4gICAgICAgICB0b2tlbiA9IG1hdGNoX3Rva2VuKHQsIHByb3BlcnR5X3Rva2VucywgYXJncyk7
Cj4KPiAgICAgICAgIHN3aXRjaCAodG9rZW4pIHsKPiArICAgICAgIGNhc2UgaXBlX3Byb3BfYm9v
dF92ZXJpZmllZF9mYWxzZToKPiArICAgICAgIGNhc2UgaXBlX3Byb3BfYm9vdF92ZXJpZmllZF90
cnVlOgo+ICsgICAgICAgICAgICAgICBwLT50eXBlID0gdG9rZW47Cj4gKyAgICAgICAgICAgICAg
IGJyZWFrOwo+ICAgICAgICAgY2FzZSBpcGVfcHJvcF9tYXg6Cj4gICAgICAgICBkZWZhdWx0Ogo+
ICAgICAgICAgICAgICAgICByYyA9IC1FQkFETVNHOwo+IC0tCj4gMi4zOS4wCgotLQpwYXVsLW1v
b3JlLmNvbQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5j
b20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRp
dAo=


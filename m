Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D104E6AAC8B
	for <lists+linux-audit@lfdr.de>; Sat,  4 Mar 2023 21:55:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677963338;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gihrVRX743D3pfg0uOxcmVz427el/9yMwMw68zlkbGg=;
	b=CDVh16uAf1+MiFntJ0WmAo24aygnea//t/O0SkSoMfWMiQVst856qBpwT1PTDmUzJFeI5W
	PEbqox8+mK+QW/S57dplqgD9InOKBleRg3VJG54zYdVhrMWDPGV/2EV1BI2iZVizFuv+rq
	tLexbYE7+5pdc+ZUWp8TjwqNUQ3rW6g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-Q5PYbQp3OVWXzWrV-5tK6w-1; Sat, 04 Mar 2023 15:55:36 -0500
X-MC-Unique: Q5PYbQp3OVWXzWrV-5tK6w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41A0C8027FD;
	Sat,  4 Mar 2023 20:55:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5713B492B00;
	Sat,  4 Mar 2023 20:55:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 965C81948659;
	Sat,  4 Mar 2023 20:55:25 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0048E19452CD for <linux-audit@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 19:01:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E780E2166B2B; Thu,  2 Mar 2023 19:01:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFFC42166B26
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 19:01:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0A6229DD98B
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 19:01:04 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-OiE4OgwsMjWLQA4ZlkweuQ-1; Thu, 02 Mar 2023 14:01:03 -0500
X-MC-Unique: OiE4OgwsMjWLQA4ZlkweuQ-1
Received: by mail-pg1-f175.google.com with SMTP id h31so68987pgl.6
 for <linux-audit@redhat.com>; Thu, 02 Mar 2023 11:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677783660;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sbKqTB1BWmST+UKS3o/pcnOIniBYA6/WBLEtc9haQn4=;
 b=rcFhUD0HpUt5rZjU+oK933g1zl1BLlLAwrubVXpG7CdoAnlzlwUCRJi/jMiAT9pBZe
 keIea+vwroY7lZHegIvfRabK3VUWLtDOOW4Mf3yxM0Hp/c+O68u1cOoJADbugNZ6Y9Q4
 amVsoRqOE+MFdUp6bNObAdPj2Puyy+cporrHkEogL3rAHuPZmODrP41+nQz5FopmZxE1
 8ip+s6Gw4zx4ayQWfVB+HS9vkkfE7fWkhWep2dw4mQzXIzJmdJ1XgPzcValMl/Dr0AqQ
 7BDYB6GgPums4gVPoYPNGrgjv6aHgBRVHhv/VKO1bucdNuyDFXkC5i089bN8rsP55337
 aoVw==
X-Gm-Message-State: AO0yUKXQ2mg7wxQnBbRKc+bW//gAdSmWRSv66Qwv6zac0jdiuQ2awc4o
 Vaxcy9IL7dkvAFBVOKn9Y8XqoaqS1t8aBwleLcu1
X-Google-Smtp-Source: AK7set/JqphcjYj9seuvS6xKNvURMu+S3V/LEScKzhxHP7SqFb0AhXhOojS1vVfFsCMHm+0xdSDtgJ0BLFb+6ahFIIw=
X-Received: by 2002:a63:2953:0:b0:503:91ff:8dd8 with SMTP id
 bu19-20020a632953000000b0050391ff8dd8mr2858904pgb.4.1677783659129; Thu, 02
 Mar 2023 11:00:59 -0800 (PST)
MIME-Version: 1.0
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-2-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1675119451-23180-2-git-send-email-wufan@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 2 Mar 2023 14:00:48 -0500
Message-ID: <CAHC9VhTtXC=HMUF8uak-29E__xLN2Kh_znn0xdRbm-GkgqBNiA@mail.gmail.com>
Subject: Re: [RFC PATCH v9 01/16] security: add ipe lsm
To: Fan Wu <wufan@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
bnV4Lm1pY3Jvc29mdC5jb20+Cj4KPiBJbnRlZ3JpdHkgUG9saWN5IEVuZm9yY2VtZW50IChJUEUp
IGlzIGFuIExTTSB0aGF0IHByb3ZpZGVzIGFuCj4gY29tcGxpbWVudGFyeSBhcHByb2FjaCB0byBN
YW5kYXRvcnkgQWNjZXNzIENvbnRyb2wgdGhhbiBleGlzdGluZyBMU01zCj4gdG9kYXkuCj4KPiBF
eGlzdGluZyBMU01zIGhhdmUgY2VudGVyZWQgYXJvdW5kIHRoZSBjb25jZXB0IG9mIGFjY2VzcyB0
byBhIHJlc291cmNlCj4gc2hvdWxkIGJlIGNvbnRyb2xsZWQgYnkgdGhlIGN1cnJlbnQgdXNlcidz
IGNyZWRlbnRpYWxzLiBJUEUncyBhcHByb2FjaCwKPiBpcyB0aGF0IGFjY2VzcyB0byBhIHJlc291
cmNlIHNob3VsZCBiZSBjb250cm9sbGVkIGJ5IHRoZSBzeXN0ZW0ncyB0cnVzdAo+IG9mIGEgY3Vy
cmVudCByZXNvdXJjZS4KPgo+IFRoZSBiYXNpcyBvZiB0aGlzIGFwcHJvYWNoIGlzIGRlZmluaW5n
IGEgZ2xvYmFsIHBvbGljeSB0byBzcGVjaWZ5IHdoaWNoCj4gcmVzb3VyY2UgY2FuIGJlIHRydXN0
ZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEZXZlbiBCb3dlcnMgPGRldmVuLmRlc2FpQGxpbnV4Lm1p
Y3Jvc29mdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRmFuIFd1IDx3dWZhbkBsaW51eC5taWNyb3Nv
ZnQuY29tPgoKLi4uCgo+IC0tLQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgfCAgNSArKysrKwo+
ICBzZWN1cml0eS9LY29uZmlnICAgICAgfCAxMSArKysrKystLS0tLQo+ICBzZWN1cml0eS9NYWtl
ZmlsZSAgICAgfCAgMSArCj4gIHNlY3VyaXR5L2lwZS9LY29uZmlnICB8IDE3ICsrKysrKysrKysr
KysrKysrCj4gIHNlY3VyaXR5L2lwZS9NYWtlZmlsZSB8IDEwICsrKysrKysrKysKPiAgc2VjdXJp
dHkvaXBlL2lwZS5jICAgIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICBzZWN1cml0eS9pcGUvaXBlLmggICAgfCAxMyArKysrKysrKysrKysrCj4gIDcgZmls
ZXMgY2hhbmdlZCwgOTIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9LY29uZmlnCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1
cml0eS9pcGUvTWFrZWZpbGUKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9pcGUu
Ywo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL2lwZS5oCj4KPiBkaWZmIC0tZ2l0
IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4IDhhNWMyNWMyMGQwMC4uNWUyN2U4
NDc2M2NjIDEwMDY0NAo+IC0tLSBhL01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBA
QCAtMTAyNzMsNiArMTAyNzMsMTEgQEAgVDogICAgIGdpdCBnaXQ6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvem9oYXIvbGludXgtaW50ZWdyaXR5LmdpdAo+ICBGOiAg
ICAgc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS8KPiAgRjogICAgIHNlY3VyaXR5L2ludGVncml0eS8K
Pgo+ICtJTlRFR1JJVFkgUE9MSUNZIEVORk9SQ0VNRU5UIChJUEUpCj4gK006ICAgICBGYW4gV3Ug
PHd1ZmFuQGxpbnV4Lm1pY3Jvc29mdC5jb20+Cj4gK1M6ICAgICBTdXBwb3J0ZWQKPiArRjogICAg
IHNlY3VyaXR5L2lwZS8KCllvdSBzaG91bGQgcHJvYmFibHkgYWRkIGEgbWFpbGluZyBsaXN0IChM
OikgYW5kIHNvdXJjZSB0cmVlIFVSTCAoVDopCnRvIHRoZSBJUEUgZW50cnkuICBZb3UgY2FuIHVz
ZSB0aGUgTFNNIG1haWxpbmcgbGlzdCB0byBzdGFydCBpZiB5b3UKbGlrZSwgdGhlcmUgYXJlIHNl
dmVyYWwgTFNNcyB0aGF0IGRvIHRoYXQgdG9kYXksIGUuZy4gU21hY2ssIExhbmRsb2NrLApldGMu
ICBBcyBmYXIgYXMgdGhlIHNvdXJjZSB0cmVlIGlzIGNvbmNlcm5lZCwgcHJvYmFibHkgdGhlIGVh
c2llc3QKb3B0aW9uIGlzIGEgc2ltcGxlIEdpdEh1YiByZXBvLCBidXQgdGhlcmUgYXJlIHBsZW50
eSBvZiBvdGhlciBjaG9pY2VzCnRvby4KCkJvdGggdGhlIG1haWxpbmcgbGlzdCBhbmQgdGhlIHNv
dXJjZSBVUkxzIGNhbiBhbHdheXMgYmUgdXBkYXRlZCBpbiB0aGUKZnV0dXJlIHNvIGRvbid0IHdv
cnJ5IHRvbyBtdWNoIGFib3V0IGJlaW5nIHN0dWNrIHdpdGggZWl0aGVyIGxvbmcKdGVybS4KCi0t
CnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRA
cmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWF1ZGl0Cg==


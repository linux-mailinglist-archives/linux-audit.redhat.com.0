Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CED2F6AAC8A
	for <lists+linux-audit@lfdr.de>; Sat,  4 Mar 2023 21:55:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677963338;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kJuXGsvY8T2uNxRb/nREGIUZqolg1qbXTx6p4uKW5Ps=;
	b=bz4w6DOuKRjrMO1VOUpB3B0aY7zqHIFVrzu+hstDno9CWnNfniAuJ2eStXLeqAq5FF7W6Z
	dzNRbQL1cO7ld1fzcwHWBWVavjwxcKMS0nQTI4yydyos3zgipuo5FsXLdz/F4Et2AtP9v2
	3fhPTj6zf4HkNi/6WDIozhYfgcXRtr4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-LwIZrXHvMzmqeki-R9wnCQ-1; Sat, 04 Mar 2023 15:55:36 -0500
X-MC-Unique: LwIZrXHvMzmqeki-R9wnCQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41A3185CBE0;
	Sat,  4 Mar 2023 20:55:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 133491121318;
	Sat,  4 Mar 2023 20:55:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 067211943BE5;
	Sat,  4 Mar 2023 20:55:26 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A828419452CD for <linux-audit@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 19:06:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7DAFA492B01; Thu,  2 Mar 2023 19:06:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76A30492C3E
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 19:06:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B6DD38221CB
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 19:06:22 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-4bOdEOpDMt-jCxsFLhIuRA-1; Thu, 02 Mar 2023 14:06:20 -0500
X-MC-Unique: 4bOdEOpDMt-jCxsFLhIuRA-1
Received: by mail-pf1-f174.google.com with SMTP id bd34so104590pfb.3
 for <linux-audit@redhat.com>; Thu, 02 Mar 2023 11:06:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677783979;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j5esfVLMIlaF9LP/rwwpmV4S1kF4WuSj7Z9THxqYwh0=;
 b=SR8gFKdv/HQtPnlw1rGmmnAMj+0m6qlWTwjxVOMUdXoPZxz0WG79dD3pfbq3vA3t9U
 PqhClyYrIcYjeUN7wbgFvOUDhZmnNCbwTYd5iDm8ki7WI2Yg7pj9CzZtv22lbizRg5Sy
 N61g+gRFCzGhoo+em49kJ5K2FVVvuMFzjDLOV1WVjddDJ8QYzwY5AT7Y1/su1g6BVHdp
 pnEGiYtRFtJuwAbFeUkphfm0Hbc7YwZUW052a7IS8uSCjHRoTvEL7tvF2YXx71xwRC54
 Ht07xf6EBEkk4ZUFQ2bItQ2dPVwvdoc207imYYrdZEr3QXNunUYzoz9aW1bS9ijB04rl
 3o2w==
X-Gm-Message-State: AO0yUKVGG4y9n+dduQgwOTHJni+7HwAJhcUz2w72UFqwHaGcl2F+j0dS
 0jHtjL5PNjgJNE+Yl/vqI51J39Ge9Ivk/5CKttIh
X-Google-Smtp-Source: AK7set8PWvLY+rxaVR0TcpyjbBjhxaI/Z6/f+upjt6eV1DGDo8C8lKrfXPzkHebf+bbYeLsHccZvtjxtnFnLroRq9ZY=
X-Received: by 2002:a63:8c1d:0:b0:503:2535:44c3 with SMTP id
 m29-20020a638c1d000000b00503253544c3mr3673307pgd.4.1677783979154; Thu, 02 Mar
 2023 11:06:19 -0800 (PST)
MIME-Version: 1.0
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-9-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1675119451-23180-9-git-send-email-wufan@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 2 Mar 2023 14:06:08 -0500
Message-ID: <CAHC9VhTh+z7O353Qc86kqF8URf0QfErG1qHPvzXCgH+6c-AJ4g@mail.gmail.com>
Subject: Re: [RFC PATCH v9 08/16] ipe: add permissive toggle
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBKYW4gMzAsIDIwMjMgYXQgNTo1OOKAr1BNIEZhbiBXdSA8d3VmYW5AbGludXgubWlj
cm9zb2Z0LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBEZXZlbiBCb3dlcnMgPGRldmVuLmRlc2FpQGxp
bnV4Lm1pY3Jvc29mdC5jb20+Cj4KPiBJUEUsIGxpa2UgU0VMaW51eCwgc3VwcG9ydHMgYSBwZXJt
aXNzaXZlIG1vZGUuIFRoaXMgbW9kZSBhbGxvd3MgcG9saWN5Cj4gYXV0aG9ycyB0byB0ZXN0IGFu
ZCBldmFsdWF0ZSBJUEUgcG9saWN5IHdpdGhvdXQgaXQgZWZmZWN0aW5nIHRoZWlyCj4gcHJvZ3Jh
bXMuIFdoZW4gdGhlIG1vZGUgaXMgY2hhbmdlZCwgYSAxNDA0IEFVRElUX01BQ19TVEFUVVMKPiBi
ZSByZXBvcnRlZC4KPgo+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgZm9sbG93aW5nIGF1ZGl0IHJlY29y
ZHM6Cj4KPiAgIGF1ZGl0OiBNQUNfU1RBVFVTIHBlcm1pc3NpdmU9MSBhdWlkPTQyOTQ5NjcyOTUg
c2VzPTQyOTQ5NjcyOTUgbHNtPWlwZQo+ICAgICByZXM9MQo+ICAgYXVkaXQ6IE1BQ19TVEFUVVMg
cGVybWlzc2l2ZT0wIGF1aWQ9NDI5NDk2NzI5NSBzZXM9NDI5NDk2NzI5NSBsc209aXBlCj4gICAg
IHJlcz0xCj4KPiBUaGVzZSByZWNvcmRzIGFyZSBlbWl0dGVkIHdpdGhpbiB0aGUgZm9sbG93aW5n
IGV2ZW50czoKPgo+ICAgYXVkaXQ6IE1BQ19TVEFUVVMgcGVybWlzc2l2ZT0xIGF1aWQ9NDI5NDk2
NzI5NSBzZXM9NDI5NDk2NzI5NSBsc209aXBlCj4gICAgIHJlcz0xCj4gICBhdWRpdFsxODVdOiBT
WVNDQUxMIGFyY2g9YzAwMDAwM2Ugc3lzY2FsbD0xIHN1Y2Nlc3M9eWVzIGV4aXQ9MiBhMD0xCj4g
ICAgIGExPTU2MzA4YmIzZWNjMCBhMj0yIGEzPTdmMjkwZmRjNTNlMCBpdGVtcz0wIHBwaWQ9MTgz
IHBpZD0xODUKPiAgICAgYXVpZD00Mjk0OTY3Mjk1IHVpZD0wIGdpZD0wIGV1aWQ9MCBzdWlkPTAg
ZnN1aWQ9MCBlZ2lkPTAgc2dpZD0wIGZzZ2lkPTAKPiAgICAgdHR5PXB0czAgc2VzPTQyOTQ5Njcy
OTUgY29tbT0iYmFzaCIgZXhlPSIvdXNyL2Jpbi9iYXNoIiBrZXk9KG51bGwpCj4gICBhdWRpdDog
UFJPQ1RJVExFIHByb2N0aXRsZT0iLWJhc2giCj4gICBhdWRpdDogTUFDX1NUQVRVUyBwZXJtaXNz
aXZlPTAgYXVpZD00Mjk0OTY3Mjk1IHNlcz00Mjk0OTY3Mjk1IGxzbT1pcGUKPiAgICAgcmVzPTEK
PiAgIGF1ZGl0WzE4NV06IFNZU0NBTEwgYXJjaD1jMDAwMDAzZSBzeXNjYWxsPTEgc3VjY2Vzcz15
ZXMgZXhpdD0yIGEwPTEKPiAgICAgYTE9NTYzMDhiYjNlY2MwIGEyPTIgYTM9N2YyOTBmZGM1M2Uw
IGl0ZW1zPTAgcHBpZD0xODMgcGlkPTE4NQo+ICAgICBhdWlkPTQyOTQ5NjcyOTUgdWlkPTAgZ2lk
PTAgZXVpZD0wIHN1aWQ9MCBmc3VpZD0wIGVnaWQ9MCBzZ2lkPTAgZnNnaWQ9MAo+ICAgICB0dHk9
cHRzMCBzZXM9NDI5NDk2NzI5NSBjb21tPSJiYXNoIiBleGU9Ii91c3IvYmluL2Jhc2giIGtleT0o
bnVsbCkKPiAgIGF1ZGl0OiBQUk9DVElUTEUgcHJvY3RpdGxlPSItYmFzaCIKPgo+ICAgSW1wbHlp
bmcgdXNlciB1c2VkIGJhc2ggdG8gdG9nZ2xlIHRoZSBzd2l0Y2guCj4KPiBTaWduZWQtb2ZmLWJ5
OiBEZXZlbiBCb3dlcnMgPGRldmVuLmRlc2FpQGxpbnV4Lm1pY3Jvc29mdC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogRmFuIFd1IDx3dWZhbkBsaW51eC5taWNyb3NvZnQuY29tPgoKLi4uCgo+IC0tLQo+
ICBzZWN1cml0eS9pcGUvYXVkaXQuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrCj4gIHNl
Y3VyaXR5L2lwZS9hdWRpdC5oIHwgIDEgKwo+ICBzZWN1cml0eS9pcGUvZXZhbC5jICB8ICA5ICsr
KysrKwo+ICBzZWN1cml0eS9pcGUvZXZhbC5oICB8ICAxICsKPiAgc2VjdXJpdHkvaXBlL2ZzLmMg
ICAgfCA2OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+ICA1
IGZpbGVzIGNoYW5nZWQsIDExNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL3NlY3VyaXR5L2lwZS9hdWRpdC5jIGIvc2VjdXJpdHkvaXBlL2F1ZGl0LmMKPiBp
bmRleCAyOTVlOWY5ZjUxNDYuLmZmNzQwMjZhNTk1ZiAxMDA2NDQKPiAtLS0gYS9zZWN1cml0eS9p
cGUvYXVkaXQuYwo+ICsrKyBiL3NlY3VyaXR5L2lwZS9hdWRpdC5jCj4gQEAgLTE5NCwzICsxOTQs
MzkgQEAgdm9pZCBpcGVfYXVkaXRfcG9saWN5X2xvYWQoY29uc3Qgc3RydWN0IGlwZV9wb2xpY3kg
KmNvbnN0IHApCj4KPiAgICAgICAgIGF1ZGl0X2xvZ19lbmQoYWIpOwo+ICB9Cj4gKwo+ICsvKioK
PiArICogaXBlX2F1ZGl0X2VuZm9yY2UgLSBBdWRpdCBhIGNoYW5nZSBpbiBJUEUncyBlbmZvcmNl
bWVudCBzdGF0ZS4KPiArICovCj4gK3ZvaWQgaXBlX2F1ZGl0X2VuZm9yY2Uodm9pZCkKPiArewo+
ICsgICAgICAgc3RydWN0IGF1ZGl0X2J1ZmZlciAqYWI7Cj4gKwo+ICsgICAgICAgYWIgPSBhdWRp
dF9sb2dfc3RhcnQoYXVkaXRfY29udGV4dCgpLCBHRlBfS0VSTkVMLCBBVURJVF9NQUNfU1RBVFVT
KTsKPiArICAgICAgIGlmICghYWIpCj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiArCj4gKyAg
ICAgICBhdWRpdF9sb2dfZm9ybWF0KGFiLCAicGVybWlzc2l2ZT0lZCIsICFSRUFEX09OQ0UoZW5m
b3JjZSkpOwo+ICsgICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBhdWlkPSV1IHNlcz0ldSBs
c209aXBlIHJlcz0xIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgZnJvbV9rdWlkKCZpbml0
X3VzZXJfbnMsIGF1ZGl0X2dldF9sb2dpbnVpZChjdXJyZW50KSksCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgIGF1ZGl0X2dldF9zZXNzaW9uaWQoY3VycmVudCkpOwo+ICsKPiArICAgICAgIGF1
ZGl0X2xvZ19lbmQoYWIpOwo+ICt9CgpTZWUgdGhlIGVhcmxpZXIgY29tbWVudHMgaW4gdGhlIHBh
dGNoc2V0IGFib3V0IGNvbnNpc3RlbnQgZm9ybWF0dGluZwpvZiBhIGdpdmVuIHJlY29yZCB0eXBl
LiAgVG8gdGhlIGJlc3Qgb2YgbXkga25vd2xlZGdlIG9ubHkgU0VMaW51eApjdXJyZW50bHkgdXNl
cyB0aGUgQVVESVRfTUFDX1NUQVRVUyByZWNvcmQgYW5kIGFuIGV4YW1wbGUgY2FuIGJlIGZvdW5k
CmluIGBzZWxfd3JpdGVfZW5mb3JjZSgpYC4gIFRoZSBnb29kIG5ld3MgaXMgdGhhdCBpdCBsb29r
cyBsaWtlIHRoYXQKZm9ybWF0IGNvdWxkIGJlIG1hZGUgdG8gd29yayBoZXJlIHdpdGhvdXQgdG9v
IG11Y2ggZnVzcy4KCj4gKy8qKgo+ICsgKiBlbWl0X2VuZm9yY2VtZW50IC0gRW1pdCB0aGUgZW5m
b3JjZW1lbnQgc3RhdGUgb2YgSVBFIHN0YXJ0ZWQgd2l0aC4KPiArICoKPiArICogUmV0dXJuOgo+
ICsgKiAwIC0gQWx3YXlzCj4gKyAqLwo+ICtzdGF0aWMgaW50IGVtaXRfZW5mb3JjZW1lbnQodm9p
ZCkKPiArewo+ICsgICAgICAgaWYgKCFpcGVfZW5hYmxlZCkKPiArICAgICAgICAgICAgICAgcmV0
dXJuIC1FT1BOT1RTVVBQOwo+ICsKPiArICAgICAgIGlwZV9hdWRpdF9lbmZvcmNlKCk7Cj4gKyAg
ICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiArbGF0ZV9pbml0Y2FsbChlbWl0X2VuZm9yY2VtZW50
KTsKCi0tCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgt
YXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWF1ZGl0Cg==


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 231136E53EE
	for <lists+linux-audit@lfdr.de>; Mon, 17 Apr 2023 23:34:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681767261;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Wd7tzx9W2PMyLdB99S0JNdO2l0rDHsEAD5CZEMBEAIs=;
	b=iGn5CBcFD50H7zuWFgTY1QltrQf86KlxlnT4iucmAe9fpiYtSO1Zlr8aULxOioTSTqy9CI
	scX5BiNt51INBQtpx5+WI+HaXcu3/8MKiT2BB8zS3kn+VvJgVDfpqQv12D5kfuIoJykBMX
	kllvSh0dZLNh5ZOOiiYGFgDUPsyp+lE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-uBqAYIvsPZC43bcUG4PZ1w-1; Mon, 17 Apr 2023 17:34:18 -0400
X-MC-Unique: uBqAYIvsPZC43bcUG4PZ1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EF963814973;
	Mon, 17 Apr 2023 21:34:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 07528C15BA0;
	Mon, 17 Apr 2023 21:34:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2E9A219465A0;
	Mon, 17 Apr 2023 21:34:09 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6F371194658C for <linux-audit@listman.corp.redhat.com>;
 Mon, 17 Apr 2023 21:31:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F32DB40C6E6F; Mon, 17 Apr 2023 21:31:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBA9640C6E6E
 for <linux-audit@redhat.com>; Mon, 17 Apr 2023 21:31:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D173F830F9E
 for <linux-audit@redhat.com>; Mon, 17 Apr 2023 21:31:24 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-wCn-8gdtNquxDWWfdO99Gw-1; Mon, 17 Apr 2023 17:31:23 -0400
X-MC-Unique: wCn-8gdtNquxDWWfdO99Gw-1
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-54c12009c30so540699727b3.9
 for <linux-audit@redhat.com>; Mon, 17 Apr 2023 14:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681767083; x=1684359083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BCzVu2UsKp7hdLDjLx5y43eqwBluLCZhJw8zkmfWK7s=;
 b=kxs4vABCmCwK+Zq9lNqSo8v1/XTw39+BWV19MIBofgphXLHVmPhRWnItLWEpVQmOX7
 vaEtj0gw6Pw7g347elQMbOyTlE5sGJ5nJpPTYQFgwOg7QqmjxFvEgTNjiH3UwfI4/Agk
 ctVwrilkBl6x5ntY7AjdY02E86viDa2L14hMbC8z0+FlWvQttX5alHvXm1lxuJbmRI1n
 L23hIUn8NNON7J2qx8h1Wh5FuwacWpNZEi/UW6bRFjWwwgZ+YEhiyse57YIsxJzw7RNy
 X9HtfneRkTyx8uM3wX52ecL5Z+hHaSPzU9UFvWF6x2Tjei1hB3TFzSa5HXYcDVSGe+UG
 c7Iw==
X-Gm-Message-State: AAQBX9fcrCntDWnyixmQD6tFWutHGVJL2NHd08RpeVu0pp6KPnW1KuXf
 ik1qyOxpojjJ/NDP5Rg5M4g4G4pVPLOjqEJm+O3h
X-Google-Smtp-Source: AKy350bgu9ZFLZmYkOlWaVpVvG9J/JdkBbU14XNGAtkoY2ENWGlUCNYD5NN6A3BCb0Ne4rd9gsfKQgsCVLB08+3wRKo=
X-Received: by 2002:a81:c649:0:b0:54f:2b65:a865 with SMTP id
 q9-20020a81c649000000b0054f2b65a865mr10208390ywj.8.1681767082657; Mon, 17 Apr
 2023 14:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-6-git-send-email-wufan@linux.microsoft.com>
 <CAHC9VhRa+NwKzLfQBmHfMgUp6_d5soQG7JBq-Vn=MUeUAt4tuQ@mail.gmail.com>
 <20230410191035.GB18827@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <CAHC9VhQDvWDshaZvJrHmjcwyHFxv9oYTN9bn0xiTtFZQRp+GPg@mail.gmail.com>
 <20230412233606.GA16658@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <CAHC9VhTs3Njfg=1baQ6=58rPLBmyB3cW0R-MfAaEcRF-jAaYBw@mail.gmail.com>
 <20230417180605.GA402@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <CAHC9VhSnKbhtgFxOAY7NYZyOkV4kEA0=mVsCyogLBSCJs0r_ig@mail.gmail.com>
 <20230417211826.GA6475@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <20230417211826.GA6475@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 17 Apr 2023 17:31:11 -0400
Message-ID: <CAHC9VhT9uTYrtEsXUvj5qaTpNL2ix762dE5AzUaSqzas8-frXA@mail.gmail.com>
Subject: Re: [RFC PATCH v9 05/16] ipe: add userspace interface
To: Fan Wu <wufan@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Mon, 17 Apr 2023 21:34:08 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBBcHIgMTcsIDIwMjMgYXQgNToxOOKAr1BNIEZhbiBXdSA8d3VmYW5AbGludXgubWlj
cm9zb2Z0LmNvbT4gd3JvdGU6Cj4gT24gTW9uLCBBcHIgMTcsIDIwMjMgYXQgMDQ6MTY6MjlQTSAt
MDQwMCwgUGF1bCBNb29yZSB3cm90ZToKPiA+IE9uIE1vbiwgQXByIDE3LCAyMDIzIGF0IDI6MDY/
Pz9QTSBGYW4gV3UgPHd1ZmFuQGxpbnV4Lm1pY3Jvc29mdC5jb20+IHdyb3RlOgo+ID4gPiBPbiBU
aHUsIEFwciAxMywgMjAyMyBhdCAwMjo0NTowN1BNIC0wNDAwLCBQYXVsIE1vb3JlIHdyb3RlOgo+
ID4gPiA+IE9uIFdlZCwgQXByIDEyLCAyMDIzIGF0IDc6MzY/Pz9QTSBGYW4gV3UgPHd1ZmFuQGxp
bnV4Lm1pY3Jvc29mdC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gT24gVHVlLCBBcHIgMTEsIDIwMjMg
YXQgMDU6NDU6NDFQTSAtMDQwMCwgUGF1bCBNb29yZSB3cm90ZToKPiA+ID4gPiA+ID4gT24gTW9u
LCBBcHIgMTAsIDIwMjMgYXQgMzoxMD8/P1BNIEZhbiBXdSA8d3VmYW5AbGludXgubWljcm9zb2Z0
LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24gVGh1LCBNYXIgMDIsIDIwMjMgYXQgMDI6MDQ6
NDJQTSAtMDUwMCwgUGF1bCBNb29yZSB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IE9uIE1vbiwgSmFu
IDMwLCAyMDIzIGF0IDU6NTg/Pz9QTSBGYW4gV3UgPHd1ZmFuQGxpbnV4Lm1pY3Jvc29mdC5jb20+
IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gLi4uCj4gPiA+ID4KPiA+ID4gPiA+ID4gSSBndWVzcyB0
aGlzIGRvZXMgbWFrZSBtZSB3b25kZXIgYWJvdXQga2VlcGluZyBhIG5vbi1hY3RpdmUgcG9saWN5
Cj4gPiA+ID4gPiA+IGxvYWRlZCBpbiB0aGUga2VybmVsLCB3aGF0IHB1cnBvc2UgZG9lcyB0aGF0
IHNlcnZlPwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBub24tYWN0aXZlIHBv
bGljeSBkb2Vzbid0IHNlcnZlIGFueXRoaW5nIHVubGVzcyBpdCBpcyBhY3RpdmF0ZWQuIFVzZXIg
Y2FuCj4gPiA+ID4gPiBldmVuIGRlbGV0ZSBhIHBvbGljeSBpZiB0aGF0IGlzIG5vIGxvbmdlciBu
ZWVkZWQuIE5vbi1hY3RpdmUgaXMganVzdCB0aGUgZGVmYXVsdAo+ID4gPiA+ID4gc3RhdGUgd2hl
biBhIG5ldyBwb2xpY3kgaXMgbG9hZGVkLgo+ID4gPiA+ID4KPiA+ID4gPiA+IElmIElQRSBzdXBw
b3J0cyBuYW1lc3BhY2UsIHRoZXJlIGlzIGFub3RoZXIgdXNlIGNhc2Ugd2hlcmUgZGlmZmVyZW50
IGNvbnRhaW5lcnMKPiA+ID4gPiA+IGNhbiBzZWxlY3QgZGlmZmVyZW50IHBvbGljaWVzIGFzIHRo
ZSBhY3RpdmUgcG9saWN5IGZyb20gYW1vbmcgbXVsdGlwbGUgbG9hZGVkCj4gPiA+ID4gPiBwb2xp
Y2llcy4gRGV2ZW4gaGFzIHByZXNlbnRlZCBhIGRlbW8gb2YgdGhpcyBkdXJpbmcgTFNTIDIwMjEu
IEJ1dCB0aGlzIGdvZXMKPiA+ID4gPiA+IGJleW9uZCB0aGUgc2NvcGUgb2YgdGhpcyB2ZXJzaW9u
Lgo+ID4gPiA+Cj4gPiA+ID4gRG8geW91IHBsYW4gdG8gYWRkIG5hbWVzcGFjZSBzdXBwb3J0IGF0
IHNvbWUgcG9pbnQgaW4gdGhlCj4gPiA+ID4gbm90LXRvby1kaXN0YW50IGZ1dHVyZT8gIElmIHNv
LCBJJ20gb2theSB3aXRoIGtlZXBpbmcgc3VwcG9ydCBmb3IKPiA+ID4gPiBtdWx0aXBsZSBwb2xp
Y2llcywgYnV0IGlmIHlvdSB0aGluayB5b3UncmUgb25seSBnb2luZyB0byBzdXBwb3J0IG9uZQo+
ID4gPiA+IGFjdGl2ZSBwb2xpY3kgYXQgYSB0aW1lLCBpdCBtaWdodCBiZSBiZXR0ZXIgdG8gcmVt
b3ZlIHN1cHBvcnQgZm9yCj4gPiA+ID4gbXVsdGlwbGUgKGluYWN0aXZlKSBwb2xpY2llcy4KPiA+
ID4gPgo+ID4gPiA+IC0tCj4gPiA+ID4gcGF1bC1tb29yZS5jb20KPiA+ID4KPiA+ID4gQW5vdGhl
ciBiZW5lZml0IG9mIGhhdmluZyBtdWx0aXBsZSBwb2xpY2llcyBpcyB0aGF0IGl0IHByb3ZpZGVz
IGlzb2xhdGlvbgo+ID4gPiBiZXR3ZWVuIGRpZmZlcmVudCBwb2xpY2llcy4gRm9yIGluc3RhbmNl
LCBpZiB3ZSBoYXZlIHR3byBwb2xpY2llcyBuYW1lZAo+ID4gPiAicG9saWN5X2EiIGFuZCAicG9s
aWN5X2IsIiB3ZSBjYW4gZW5zdXJlIHRoYXQgb25seSB0ZWFtIGEgY2FuIHVwZGF0ZSAicG9saWN5
X2EsIgo+ID4gPiBhbmQgb25seSB0ZWFtIGIgY2FuIHVwZGF0ZSAicG9saWN5X2IuIiBUaGlzIHdh
eSwgYm90aCB0ZWFtcyBjYW4gdXBkYXRlCj4gPiA+IHRoZWlyIHBvbGljeSB3aXRob3V0IGFmZmVj
dGluZyBvdGhlcnMuIEhvd2V2ZXIsIGlmIHRoZXJlIGlzIG9ubHkgb25lIHBvbGljeQo+ID4gPiBp
biB0aGUgc3lzdGVtLCBib3RoIHRlYW1zIHdpbGwgaGF2ZSB0byBvcGVyYXRlIG9uIHRoZSBzYW1l
IHBvbGljeSwgbWFraW5nIGl0Cj4gPiA+IGxlc3MgbWFuYWdlYWJsZS4KPiA+Cj4gPiBUaGF0IG9u
bHkgcmVhbGx5IG1hdHRlcnMgaWYgYm90aCBwb2xpY2llcyBhcmUgYWN0aXZlIGF0IHRoZSBzYW1l
IHRpbWU7Cj4gPiBpZiBvbmx5IG9uZSBwb2xpY3kgY2FuIGJlIGFjdGl2ZSBhdCBvbmUgcG9pbnQg
aW4gdGltZSB0aGUgb25seQo+ID4gcGVybWlzc2lvbiB0aGF0IG1hdHRlcnMgaXMgdGhlIG9uZSB3
aG8gY2FuIGxvYWQvYWN0aXZhdGUgYSBwb2xpY3kuCj4gPgo+ID4gQWxsb3dpbmcgZm9yIG11bHRp
cGxlIHBvbGljaWVzIGNvbXBsaWNhdGVzIHRoZSBjb2RlLiAgSWYgdGhlcmUgaXMKPiA+IGFub3Ro
ZXIgZmVhdHVyZSB0aGF0IHJlcXVpcmVzIG11bHRpcGxlIHBvbGljaWVzLCBlLmcuIElQRSBuYW1l
c3BhY2VzLAo+ID4gdGhlbiB0aGF0IGlzIG9rYXkuICBIb3dldmVyLCBpZiB0aGVyZSBpcyBubyBm
ZWF0dXJlIHdoaWNoIHJlcXVpcmVzCj4gPiBtdWx0aXBsZSBhY3RpdmUgcG9saWNpZXMsIHN1cHBv
cnRpbmcgbXVsdGlwbGUgbG9hZGVkIHBvbGljaWVzIG9ubHkKPiA+IGluY3JlYXNlcyB0aGUgcmlz
ayBvZiBhbiBleHBsb2l0YWJsZSBidWcgaW4gdGhlIElQRSBjb2RlLgo+ID4KPiA+ID4gQmVzaWRl
cywgcmVtb3ZpbmcgbXVsdGlwbGUgKGluYWN0aXZlKSBwb2xpY2llcyBzdXBwb3J0IHdpbGwKPiA+
ID4gcmVuZGVyIHRoZSBwb2xpY3lfbmFtZSBmaWVsZCBtZWFuaW5nbGVzcywgYW5kIHdlIHNob3Vs
ZCBvbmx5IGF1ZGl0IHRoZSBwb2xpY3kKPiA+ID4gaGFzaC4gSSBhbSBmaW5lIGlmIHdlIGRlY2lk
ZSB0byBnbyBmb3IgdGhlIHNpbmdsZSBwb2xpY3kgb3B0aW9uLgo+ID4KPiA+IE9uY2UgYWdhaW4s
IEkgdGhpbmsgaXQgY29tZXMgYmFjayB0bzogZG8geW91IHN0aWxsIHdhbnQgdG8gc3VwcG9ydCBJ
UEUKPiA+IG5hbWVzcGFjZXMgYXQgc29tZSBwb2ludCBpbiB0aGUgZnV0dXJlLCBhbmQgaWYgc28s
IHdoZW4gZG8geW91IGV4cGVjdAo+ID4gdG8gd29yayBvbiB0aGF0Pwo+Cj4gWWVzLCBhYnNvbHV0
ZWx5ISBXZSBkZWZpbml0ZWx5IGhhdmUgcGxhbnMgdG8gc3VwcG9ydCBuYW1lc3BhY2VzIGluIHRo
ZSBmdXR1cmUuCj4gSG93ZXZlciwgaXQncyB3b3J0aCBtZW50aW9uaW5nIHRoYXQgdGhlcmUgYXJl
IG90aGVyIHRhc2tzIHRoYXQgd2UgbWF5IG5lZWQKPiB0byBwcmlvcml0aXplIGR1ZSB0byB0aGVp
ciByZWxhdGl2ZWx5IGxvd2VyIGNvbXBsZXhpdHkuIEZvciBleGFtcGxlLCBiZWZvcmUKPiB3ZSBj
YW4gZnVsbHkgaW1wbGVtZW50IG5hbWVzcGFjZXMsIHdlIG5lZWQgdG8gYWRkcmVzcyBzb21lIG90
aGVyIGltcG9ydGFudAo+IGFzcGVjdHMgb2YgdGhlIHN5c3RlbSwgc3VjaCBhcyBhZGRpbmcgYSBw
b2xpY3kgbGFuZ3VhZ2UgZm9yIGludGVncml0eQo+IGVuZm9yY2VtZW50IG9uIGNvbmZpZ3VyYXRp
b24gZmlsZXMgYW5kIGRlZmluaW5nIHRydXN0ZWQgY2VydGlmaWNhdGVzCj4gdGhhdCBjYW4gc2ln
biB0aGUgcm9vdCBoYXNoLiBUaGVyZWZvcmUsIHRoZSB0aW1lbGluZSBmb3IgaW1wbGVtZW50aW5n
Cj4gbmFtZXNwYWNlcyB3aWxsIGRlcGVuZCBvbiB0aGUgY29tcGxldGlvbiB0aW1lIG9mIHRoZXNl
IHRhc2tzLgo+Cj4gSSB1bmRlcnN0YW5kIHlvdXIgY29uY2VybnMsIGFuZCB3ZSBjYW4gcHJvY2Vl
ZCB3aXRoIGEgc2luZ2xlIHBvbGljeSBkZXNpZ24KPiBmb3IgdGhlIGluaXRpYWwgdmVyc2lvbi4K
CkkgdGhpbmsgaXQncyBva2F5IHRvIHN0aWNrIHdpdGggdGhlIG11bHRpLXBvbGljeSBjb2RlIGZv
ciB0aGUgaW5pdGlhbApzdWJtaXNzaW9uLCB5b3UndmUgZ290IHRoZSBjb2RlIG5vdywgYW5kIGl0
J3MgdGVzdGVkLiAgSSBqdXN0IHdhbnRlZAp0byBtYWtlIHN1cmUgdGhlcmUgd2VyZSBwbGFucyB0
byBtYWtlIHVzZSBvZiBpdCBhdCBzb21lIHBvaW50LCBpZiBub3QKd2UgbWlnaHQgYXMgd2VsbCBk
cm9wIGl0IG5vdy4gIEhvd2V2ZXIsIGl0IHNvdW5kcyBsaWtlIHlvdSd2ZSBnb3QgYQpwbGFuIHRv
IHV0aWxpemUgdGhlIG11bHRpLXBvbGljeSBzdXBwb3J0IHNvIHRoYXQncyBmaW5lIHdpdGggbWUu
CgotLSAKcGF1bC1tb29yZS5jb20KCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1h
dWRpdEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYXVkaXQK


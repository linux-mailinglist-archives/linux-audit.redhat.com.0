Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2030E6E5188
	for <lists+linux-audit@lfdr.de>; Mon, 17 Apr 2023 22:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681762651;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NIsoeas5Nw3i69nfEMstEF2N4J8qSqA7XQDQ1fi5ftw=;
	b=AacKOdx9dV94HHg2ea0b1wfkHx7ZBw/fR9LgLO1GnHYWwFdLz+1qfPCqGEcPN7SNWll9f6
	cnH8LFR1eRPp9hlJL1g6Yr9GRqc3nQ6BixH4UZ8m60hlaSR3W6x3N2V2FgsFPyOcK8mEne
	+8JCmFNdYRRDSRL9irNWUkruQzUw5Rg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-32Ym9zd9N3yZXTH88JSrjQ-1; Mon, 17 Apr 2023 16:17:27 -0400
X-MC-Unique: 32Ym9zd9N3yZXTH88JSrjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 941723C1022F;
	Mon, 17 Apr 2023 20:17:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8986F2027064;
	Mon, 17 Apr 2023 20:17:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E8B7919465A0;
	Mon, 17 Apr 2023 20:17:07 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 038641946587 for <linux-audit@listman.corp.redhat.com>;
 Mon, 17 Apr 2023 20:16:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DA6D7C15E7F; Mon, 17 Apr 2023 20:16:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2C6BC15BA0
 for <linux-audit@redhat.com>; Mon, 17 Apr 2023 20:16:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2F931C0A585
 for <linux-audit@redhat.com>; Mon, 17 Apr 2023 20:16:42 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-8tHUWi6WNWOcYC2pA42_sw-1; Mon, 17 Apr 2023 16:16:41 -0400
X-MC-Unique: 8tHUWi6WNWOcYC2pA42_sw-1
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-54fe82d8bf5so117237327b3.3
 for <linux-audit@redhat.com>; Mon, 17 Apr 2023 13:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681762600; x=1684354600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mkFM4OddDI3MzXQTdAgqfF3VU3F/+LgzOjoA+7s8XA4=;
 b=BTk6C0L0i6RRWq0umulBPS9NeTsKanLzX0mDAte1EyfcRNseE1w59GTr/Z3UCrnsPd
 jdJkwsiO7M41tiFvRtwupTUjGN6GhZPa8VPyIyZ7iWkVYDVdX5pzIp+sZXzZ6zWH8jdD
 dQ7omt8tSydc+NQIRQsCYXk5bD/EOOPTJK5QSW4zS4b7EhIJSAJseFtIBHSJc0QX9tOs
 CK7qLzPqRMZiZ+UILYov0dmw6pYiup3phKIymu8kqhrxxmpDZDTUmLPdhfEAVjiqmsYK
 VftpmabnQiTigJ1sd7ZxsC5/c7UTVDNWJvSZOurMLyShSgJbfKxDAWzEL9eKx2PUjKGk
 IJGw==
X-Gm-Message-State: AAQBX9eZuA0xSl7i5/xBsm4MsHZOgyeNfd7sM2S5yx1v9iC7/wbCjTvG
 0ae5a5JnUIO+UzeJ++CzIYB1bfqIgdtnoPVVQKCB
X-Google-Smtp-Source: AKy350ZxQlOfbob70cyzh//3Qo4gX/RJVSVzb07xLMzIeYlrCU36AjFdx5P2s2Fo1lBjmj4URw4Qp0a1MdAC8VUyDYc=
X-Received: by 2002:a81:4524:0:b0:54f:aa4b:100c with SMTP id
 s36-20020a814524000000b0054faa4b100cmr9804160ywa.8.1681762600389; Mon, 17 Apr
 2023 13:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-6-git-send-email-wufan@linux.microsoft.com>
 <CAHC9VhRa+NwKzLfQBmHfMgUp6_d5soQG7JBq-Vn=MUeUAt4tuQ@mail.gmail.com>
 <20230410191035.GB18827@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <CAHC9VhQDvWDshaZvJrHmjcwyHFxv9oYTN9bn0xiTtFZQRp+GPg@mail.gmail.com>
 <20230412233606.GA16658@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <CAHC9VhTs3Njfg=1baQ6=58rPLBmyB3cW0R-MfAaEcRF-jAaYBw@mail.gmail.com>
 <20230417180605.GA402@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <20230417180605.GA402@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 17 Apr 2023 16:16:29 -0400
Message-ID: <CAHC9VhSnKbhtgFxOAY7NYZyOkV4kEA0=mVsCyogLBSCJs0r_ig@mail.gmail.com>
Subject: Re: [RFC PATCH v9 05/16] ipe: add userspace interface
To: Fan Wu <wufan@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Mon, 17 Apr 2023 20:17:06 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBBcHIgMTcsIDIwMjMgYXQgMjowNuKAr1BNIEZhbiBXdSA8d3VmYW5AbGludXgubWlj
cm9zb2Z0LmNvbT4gd3JvdGU6Cj4gT24gVGh1LCBBcHIgMTMsIDIwMjMgYXQgMDI6NDU6MDdQTSAt
MDQwMCwgUGF1bCBNb29yZSB3cm90ZToKPiA+IE9uIFdlZCwgQXByIDEyLCAyMDIzIGF0IDc6MzY/
Pz9QTSBGYW4gV3UgPHd1ZmFuQGxpbnV4Lm1pY3Jvc29mdC5jb20+IHdyb3RlOgo+ID4gPiBPbiBU
dWUsIEFwciAxMSwgMjAyMyBhdCAwNTo0NTo0MVBNIC0wNDAwLCBQYXVsIE1vb3JlIHdyb3RlOgo+
ID4gPiA+IE9uIE1vbiwgQXByIDEwLCAyMDIzIGF0IDM6MTA/Pz9QTSBGYW4gV3UgPHd1ZmFuQGxp
bnV4Lm1pY3Jvc29mdC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gT24gVGh1LCBNYXIgMDIsIDIwMjMg
YXQgMDI6MDQ6NDJQTSAtMDUwMCwgUGF1bCBNb29yZSB3cm90ZToKPiA+ID4gPiA+ID4gT24gTW9u
LCBKYW4gMzAsIDIwMjMgYXQgNTo1OD8/P1BNIEZhbiBXdSA8d3VmYW5AbGludXgubWljcm9zb2Z0
LmNvbT4gd3JvdGU6Cj4gPgo+ID4gLi4uCj4gPgo+ID4gPiA+IEkgZ3Vlc3MgdGhpcyBkb2VzIG1h
a2UgbWUgd29uZGVyIGFib3V0IGtlZXBpbmcgYSBub24tYWN0aXZlIHBvbGljeQo+ID4gPiA+IGxv
YWRlZCBpbiB0aGUga2VybmVsLCB3aGF0IHB1cnBvc2UgZG9lcyB0aGF0IHNlcnZlPwo+ID4gPiA+
Cj4gPiA+Cj4gPiA+IFRoZSBub24tYWN0aXZlIHBvbGljeSBkb2Vzbid0IHNlcnZlIGFueXRoaW5n
IHVubGVzcyBpdCBpcyBhY3RpdmF0ZWQuIFVzZXIgY2FuCj4gPiA+IGV2ZW4gZGVsZXRlIGEgcG9s
aWN5IGlmIHRoYXQgaXMgbm8gbG9uZ2VyIG5lZWRlZC4gTm9uLWFjdGl2ZSBpcyBqdXN0IHRoZSBk
ZWZhdWx0Cj4gPiA+IHN0YXRlIHdoZW4gYSBuZXcgcG9saWN5IGlzIGxvYWRlZC4KPiA+ID4KPiA+
ID4gSWYgSVBFIHN1cHBvcnRzIG5hbWVzcGFjZSwgdGhlcmUgaXMgYW5vdGhlciB1c2UgY2FzZSB3
aGVyZSBkaWZmZXJlbnQgY29udGFpbmVycwo+ID4gPiBjYW4gc2VsZWN0IGRpZmZlcmVudCBwb2xp
Y2llcyBhcyB0aGUgYWN0aXZlIHBvbGljeSBmcm9tIGFtb25nIG11bHRpcGxlIGxvYWRlZAo+ID4g
PiBwb2xpY2llcy4gRGV2ZW4gaGFzIHByZXNlbnRlZCBhIGRlbW8gb2YgdGhpcyBkdXJpbmcgTFNT
IDIwMjEuIEJ1dCB0aGlzIGdvZXMKPiA+ID4gYmV5b25kIHRoZSBzY29wZSBvZiB0aGlzIHZlcnNp
b24uCj4gPgo+ID4gRG8geW91IHBsYW4gdG8gYWRkIG5hbWVzcGFjZSBzdXBwb3J0IGF0IHNvbWUg
cG9pbnQgaW4gdGhlCj4gPiBub3QtdG9vLWRpc3RhbnQgZnV0dXJlPyAgSWYgc28sIEknbSBva2F5
IHdpdGgga2VlcGluZyBzdXBwb3J0IGZvcgo+ID4gbXVsdGlwbGUgcG9saWNpZXMsIGJ1dCBpZiB5
b3UgdGhpbmsgeW91J3JlIG9ubHkgZ29pbmcgdG8gc3VwcG9ydCBvbmUKPiA+IGFjdGl2ZSBwb2xp
Y3kgYXQgYSB0aW1lLCBpdCBtaWdodCBiZSBiZXR0ZXIgdG8gcmVtb3ZlIHN1cHBvcnQgZm9yCj4g
PiBtdWx0aXBsZSAoaW5hY3RpdmUpIHBvbGljaWVzLgo+ID4KPiA+IC0tCj4gPiBwYXVsLW1vb3Jl
LmNvbQo+Cj4gQW5vdGhlciBiZW5lZml0IG9mIGhhdmluZyBtdWx0aXBsZSBwb2xpY2llcyBpcyB0
aGF0IGl0IHByb3ZpZGVzIGlzb2xhdGlvbgo+IGJldHdlZW4gZGlmZmVyZW50IHBvbGljaWVzLiBG
b3IgaW5zdGFuY2UsIGlmIHdlIGhhdmUgdHdvIHBvbGljaWVzIG5hbWVkCj4gInBvbGljeV9hIiBh
bmQgInBvbGljeV9iLCIgd2UgY2FuIGVuc3VyZSB0aGF0IG9ubHkgdGVhbSBhIGNhbiB1cGRhdGUg
InBvbGljeV9hLCIKPiBhbmQgb25seSB0ZWFtIGIgY2FuIHVwZGF0ZSAicG9saWN5X2IuIiBUaGlz
IHdheSwgYm90aCB0ZWFtcyBjYW4gdXBkYXRlCj4gdGhlaXIgcG9saWN5IHdpdGhvdXQgYWZmZWN0
aW5nIG90aGVycy4gSG93ZXZlciwgaWYgdGhlcmUgaXMgb25seSBvbmUgcG9saWN5Cj4gaW4gdGhl
IHN5c3RlbSwgYm90aCB0ZWFtcyB3aWxsIGhhdmUgdG8gb3BlcmF0ZSBvbiB0aGUgc2FtZSBwb2xp
Y3ksIG1ha2luZyBpdAo+IGxlc3MgbWFuYWdlYWJsZS4KClRoYXQgb25seSByZWFsbHkgbWF0dGVy
cyBpZiBib3RoIHBvbGljaWVzIGFyZSBhY3RpdmUgYXQgdGhlIHNhbWUgdGltZTsKaWYgb25seSBv
bmUgcG9saWN5IGNhbiBiZSBhY3RpdmUgYXQgb25lIHBvaW50IGluIHRpbWUgdGhlIG9ubHkKcGVy
bWlzc2lvbiB0aGF0IG1hdHRlcnMgaXMgdGhlIG9uZSB3aG8gY2FuIGxvYWQvYWN0aXZhdGUgYSBw
b2xpY3kuCgpBbGxvd2luZyBmb3IgbXVsdGlwbGUgcG9saWNpZXMgY29tcGxpY2F0ZXMgdGhlIGNv
ZGUuICBJZiB0aGVyZSBpcwphbm90aGVyIGZlYXR1cmUgdGhhdCByZXF1aXJlcyBtdWx0aXBsZSBw
b2xpY2llcywgZS5nLiBJUEUgbmFtZXNwYWNlcywKdGhlbiB0aGF0IGlzIG9rYXkuICBIb3dldmVy
LCBpZiB0aGVyZSBpcyBubyBmZWF0dXJlIHdoaWNoIHJlcXVpcmVzCm11bHRpcGxlIGFjdGl2ZSBw
b2xpY2llcywgc3VwcG9ydGluZyBtdWx0aXBsZSBsb2FkZWQgcG9saWNpZXMgb25seQppbmNyZWFz
ZXMgdGhlIHJpc2sgb2YgYW4gZXhwbG9pdGFibGUgYnVnIGluIHRoZSBJUEUgY29kZS4KCj4gQmVz
aWRlcywgcmVtb3ZpbmcgbXVsdGlwbGUgKGluYWN0aXZlKSBwb2xpY2llcyBzdXBwb3J0IHdpbGwK
PiByZW5kZXIgdGhlIHBvbGljeV9uYW1lIGZpZWxkIG1lYW5pbmdsZXNzLCBhbmQgd2Ugc2hvdWxk
IG9ubHkgYXVkaXQgdGhlIHBvbGljeQo+IGhhc2guIEkgYW0gZmluZSBpZiB3ZSBkZWNpZGUgdG8g
Z28gZm9yIHRoZSBzaW5nbGUgcG9saWN5IG9wdGlvbi4KCk9uY2UgYWdhaW4sIEkgdGhpbmsgaXQg
Y29tZXMgYmFjayB0bzogZG8geW91IHN0aWxsIHdhbnQgdG8gc3VwcG9ydCBJUEUKbmFtZXNwYWNl
cyBhdCBzb21lIHBvaW50IGluIHRoZSBmdXR1cmUsIGFuZCBpZiBzbywgd2hlbiBkbyB5b3UgZXhw
ZWN0CnRvIHdvcmsgb24gdGhhdD8KCi0tIApwYXVsLW1vb3JlLmNvbQoKLS0KTGludXgtYXVkaXQg
bWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhh
dC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=


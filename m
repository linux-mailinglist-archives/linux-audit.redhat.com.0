Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6127F785B12
	for <lists+linux-audit@lfdr.de>; Wed, 23 Aug 2023 16:49:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692802177;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=r9JiAORbYRoFC7wEz7ryy7qpqWJW38njPXg6DLWIJUU=;
	b=R90sxaLsPbhH4Is9zR2TsnlouD66qSqtHpzLsuLpB4PAWrQDz8eWyKZVPP9XrPbR+zFQx+
	x7+Hp1rQy6aj0ab8oFFezYTaSvB2qWhYBDzm5iENndjHG2umTPfw2VRPExGJIJ4QODTYf2
	tr0YQg7pziFc9h401sOlVNUG5yoFn1o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-50F3JGP0NcGlIilf8hnBuA-1; Wed, 23 Aug 2023 10:49:33 -0400
X-MC-Unique: 50F3JGP0NcGlIilf8hnBuA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FFCC101CC99;
	Wed, 23 Aug 2023 14:49:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20096C15BAE;
	Wed, 23 Aug 2023 14:49:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CAF6A1946597;
	Wed, 23 Aug 2023 14:49:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 845611946589 for <linux-audit@listman.corp.redhat.com>;
 Wed, 23 Aug 2023 14:49:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 734E72166B27; Wed, 23 Aug 2023 14:49:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A8722166B26
 for <linux-audit@redhat.com>; Wed, 23 Aug 2023 14:49:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B3AD185A78B
 for <linux-audit@redhat.com>; Wed, 23 Aug 2023 14:49:05 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-mxPGaV0DMieT_-5UF-75-g-1; Wed, 23 Aug 2023 10:48:59 -0400
X-MC-Unique: mxPGaV0DMieT_-5UF-75-g-1
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-58cf42a32b9so63666997b3.2
 for <linux-audit@redhat.com>; Wed, 23 Aug 2023 07:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692802139; x=1693406939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V/+ivp6vJDmXpgPPA/3jYksCM8MKkjsRczn9dsLl71s=;
 b=DGiVHVkDagaZku9Bt8pl7AZFv6lHFEBzHoG8gg/XCG4UfrZLYTvEzvsP1L2uwADWm7
 UyuEd5aqUJ5yVCPubKFmk8K08NptgzpotMCJJ3ikeU7DS7hT4twTIVbOBd3v6BPGhwJM
 Ce1iPNUqcs6dgqp8BvWo7q83Gy+PebfC5HMucDeWr6XjV9rRtx7Y+NaLF2LsDYWQCWD3
 TPx+STt4m9xyacRr/P/rUXn/WtnsMapmuZ9GSN4AFItF686ME/DCCAheBO/0QlWojYs+
 Qxe94aEIvlHLbRHZtugT/q+8XKZIbUSCPlQeFJvxOu/EFeENEojGYFGtI94d3vfDuZJM
 m40Q==
X-Gm-Message-State: AOJu0YzrlP0//kG+EoFv2DShp3Gsh5uO0f7TjWe6sjKaPXwqigr7sZ53
 P0X7RwA4GkBJBzyDdmOYC2vpX1+mKnBLQLkVx+pD
X-Google-Smtp-Source: AGHT+IGWYAxc/rT9LekKb3CWpl8QjTcpXVvzoIlbFjFdm8dSrgnVA6ibXst0kmh0MuHZkbHN4COAoj6YsSWBvRhbLWQ=
X-Received: by 2002:a81:8782:0:b0:589:a9fc:ffcd with SMTP id
 x124-20020a818782000000b00589a9fcffcdmr12701700ywf.20.1692802138972; Wed, 23
 Aug 2023 07:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <CAHC9VhTLQjjQ0QMfBDHYCz9LOAuO=rJWSDEUqPsFE+dowFbN=Q@mail.gmail.com>
 <b06dbdd8-d2f6-b190-5635-948c0a966103@I-love.SAKURA.ne.jp>
 <CAHC9VhSz=3utr_CigGvkMEb6_avJUQq1Ak2smB7neSd76mzjFw@mail.gmail.com>
 <6957af54-16a2-4c28-56ff-dafe95f4e276@I-love.SAKURA.ne.jp>
 <CAHC9VhTj-PQ0qPTiphPLXyJx3bWeqgVS_GPCWNgjqFqBgH6Njg@mail.gmail.com>
 <b0b60fdc-4484-2265-7fdf-8367bf218d18@I-love.SAKURA.ne.jp>
 <CAHC9VhRaUxN=oEyKCOrfrGzJeXDGxv2EKbZH3qwAB6AhKcSfog@mail.gmail.com>
 <68a0ef90-b452-2096-3729-b5c208878ff9@I-love.SAKURA.ne.jp>
In-Reply-To: <68a0ef90-b452-2096-3729-b5c208878ff9@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 23 Aug 2023 10:48:47 -0400
Message-ID: <CAHC9VhTPgnzdn1tmEmufcbseN_Q1CyzxTEzfvZW7OCBTeAadmA@mail.gmail.com>
Subject: Re: [PATCH] audit: add task history record
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: audit@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 linux-audit@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBBdWcgMjMsIDIwMjMgYXQgMTA6MTjigK9BTSBUZXRzdW8gSGFuZGEKPHBlbmd1aW4t
a2VybmVsQGktbG92ZS5zYWt1cmEubmUuanA+IHdyb3RlOgo+IE9uIDIwMjMvMDgvMjIgMTozNSwg
UGF1bCBNb29yZSB3cm90ZToKPiA+PiAgICJhdWRpdGN0bCAtRCIgbXVzdCBub3QgY2xlYXIgcnVs
ZXMgZm9yIHRyYWNpbmcgZm9yaygpL2V4ZWN2ZSgpL2V4aXQoKQo+ID4+ICAgc3lzdGVtIGNhbGxz
LiBUaGlzIGlzIGltcG9zc2libGUgYmVjYXVzZSB0aGlzIGNoYW5nZSB3aWxsIGJyZWFrIHVzZXJz
cGFjZQo+ID4+ICAgcHJvZ3JhbXMgZXhwZWN0aW5nIHRoYXQgImF1ZGl0Y3RsIC1EIiBjbGVhcnMg
YWxsIHJ1bGVzLgo+ID4KPiA+IEl0J3MgYSBnb29kIHRoaW5nIHRoYXQgJ2F1ZHRpY3RsIC1kIC4u
LicgZXhpc3RzIHNvIHRoYXQgb25lIGNhbgo+ID4gc2VsZWN0aXZlbHkgZGVsZXRlIGF1ZGl0IHJ1
bGVzIGZyb20gdGhlIGtlcm5lbC4gIElmIHNvbWVvbmUgd2FudHMgdG8KPiA+IHByZXNlcnZlIHNw
ZWNpZmljIGF1ZGl0IHJ1bGVzLCB0aGF0IGlzIHRoZSB3YXkgdG8gZG8gaXQ7ICdhdWRpdGN0bCAt
RCcKPiA+IGlzIGEgdmVyeSBjb2Fyc2UgdG9vbCBhbmQgbm90IHNvbWV0aGluZyB0aGF0IGlzIGxp
a2VseSB2ZXJ5IHVzZWZ1bCBmb3IKPiA+IHVzZXJzIHdpdGggc3RyaWN0IGF1ZGl0aW5nIHJlcXVp
cmVtZW50cy4KPgo+IEluIG1vc3Qgc3lzdGVtcywgImF1ZGl0Y3RsIC1EIiBpcyB0aGUgZmlyc3Qg
Y29tbWFuZCBkb25lIHZpYSAvZXRjL2F1ZGl0L2F1ZGl0LnJ1bGVzIGZpbGUuCj4gWW91IGFyZSBh
c2tpbmcgYWxsIGFkbWluaXN0cmF0b3JzIHdobyB3YW50IHRvIGVtdWxhdGUgdGhpcyBwYXRjaCdz
IGZ1bmN0aW9uYWxpdHkgdXNpbmcKPiBhdWRpdGQgdG8gY3VzdG9taXplIHRoYXQgbGluZS4gV2Ug
Y2FuJ3QgYWZmb3JkIGFza2luZyBzdWNoIGFkbWluaXN0cmF0b3JzIHRvIGJlY29tZQo+IHNwZWNp
YWxpc3Qgb2Ygc3RyaWN0IGF1ZGl0aW5nIGNvbmZpZ3VyYXRpb25zLCBhcyB3ZWxsIGFzIHdlIGNh
bid0IGFmZm9yZCBhc2tpbmcKPiBldmVyeSBhZG1pbmlzdHJhdG9yIHRvIGJlY29tZSBzcGVjaWFs
aXN0IG9mIHN0cmljdCBTRUxpbnV4IHBvbGljeSBjb25maWd1cmF0aW9ucy4KCklmIGFuIGFkbWlu
aXN0cmF0b3IvdXNlciBuZWVkcyB0byBjb25maWd1cmUgdGhlIGF1ZGl0IHN1YnN5c3RlbSB0byBk
bwpzb21ldGhpbmcsIHJlbW92aW5nIG9uZSBsaW5lIGluIGEgY29uZmlndXJhdGlvbiBmaWxlIHNl
ZW1zIGxpa2UgYSB2ZXJ5CnJlYXNvbmFibGUgdGhpbmcgdG8gZG8uICBZb3UgY2FuIGV4cGVjdCB0
aGUgZGVmYXVsdCBjb25maWd1cmF0aW9uIG9mCmV2ZXJ5IExpbnV4IGRpc3RyaWJ1dGlvbiB0byBm
aXQgZXZlcnkgY29uY2VpdmFibGUgdXNlIGNhc2UuCgo+IExpa2UgU3RldmUgR3J1YmIgbWVudGlv
bnMsIHRlY2huaWNhbGx5IHBvc3NpYmxlIGFuZCBwcmFjdGljYWxseSBhZmZvcmRhYmxlIGFyZQo+
IGRpZmZlcmVudC4gVGhlIGF1ZGl0IHN1YnN5c3RlbSBjb3VsZCBoYW5kbGUgdGhlIGxvYWQsIGJ1
dCB0aGUgc3lzdGVtIGFkbWluaXN0cmF0b3IKPiBjYW4ndCBoYW5kbGUgdGhlIGxvYWQuCgpJZiBh
biBhZG1pbmlzdHJhdG9yL3VzZXIgd2FudHMgdGhpcyB0eXBlIG9mIGluZm9ybWF0aW9uIGluIHRo
ZWlyIGF1ZGl0CmxvZ3MgdGhleSBuZWVkIHRvIGJlIHByZXBhcmVkIHRvIGhhbmRsZSB0aGF0IGlu
Zm9ybWF0aW9uLgoKPiBUaGF0J3Mgd2h5IEkgc2FpZAo+Cj4gICBUaGF0IGlzIGEgIk5vIExTTSBt
b2R1bGVzIG90aGVyIHRoYW4gU0VMaW51eCBpcyBuZWVkZWQgYmVjYXVzZSBTRUxpbnV4IGNhbiBk
bwo+ICAgZXZlcnl0aGluZyIgYXNzZXJ0aW9uLgoKV2hhdD8gIFRoYXQgZG9lc24ndCBtYWtlIGFu
eSBzZW5zZSBmb2xsb3dpbmcgd2hhdCB5b3Ugc2FpZCBhYm92ZS4KWW91J3JlIHN0YXJ0aW5nIHRv
IGNoZXJyeSBwaWNrIHF1b3RlcyBhbmQgYXBwbHkgdGhlbSBvdXQgb2YgY29udGV4dCwKd2hpY2gg
b25seSBodXJ0cyB5b3VyIGFyZ3VtZW50IGZ1cnRoZXIuCgo+IGFuZCB5b3VyIHJlc3BvbnNlCj4K
PiAgIEV4Y2VwdCB3ZSBhcmUgbm90IHRhbGtpbmcgU0VMaW51eCBvciBMU01zIGhlcmUsIHdlIGFy
ZSB0YWxraW5nIGFib3V0Cj4gICBhdWRpdCBhbmQgdGhlIGF1ZGl0IHN1YnN5c3RlbSBpcyB2ZXJ5
IGRpZmZlcmVudCBmcm9tIHRoZSBMU00gbGF5ZXIuCj4gICBUaGUgTFNNIGxheWVyIGlzIGRlc2ln
bmVkIHRvIGJlIHBsdWdnYWJsZSB3aXRoIHN1cHBvcnQgZm9yIG11bHRpcGxlCj4gICBpbmRpdmlk
dWFsIExTTXMsIHdoZXJlYXMgdGhlIGF1ZGl0IHN1YnN5c3RlbSBpcyBkZXNpZ25lZCB0byBzdXBw
b3J0IGEKPiAgIHNpbmdsZSBhdWRpdCBpbXBsZW1lbnRhdGlvbi4KPgo+IGlzIHRvdGFsbHkgbWlz
c2luZyB0aGUgcG9pbnQuCgpJdCBtYWtlcyBwZXJmZWN0IHNlbnNlIGluIHRoZSBvcmlnaW5hbCBj
b250ZXh0LCBzZWUgbXkgY29tbWVudCBhYm92ZSwKYW5kIHBlcmhhcHMgZ28gcmUtcmVhZCB0aGF0
IG9yaWdpbmFsIGVtYWlsLgoKPiBGb3IgZXhhbXBsZSwgZG9pbmcKPgo+ICAgYXVkaXRjdGwgLWEg
ZXhpdCxhbHdheXMgLUYgYXJjaD1iNjQgLVMgZXhpdCxleGl0X2dyb3VwCj4KPiAoaW4gb3JkZXIg
dG8gYWxsb3cgdXNlcnNwYWNlIGRhZW1vbiB3aGljaCB0cmllcyB0byBlbXVsYXRlIHRoaXMgcGF0
Y2gncwo+IGZ1bmN0aW9uYWxpdHkpIHdpbGwgbGV0IGF1ZGl0ZCB0byBnZW5lcmF0ZSBwcm9jZXNz
IHRlcm1pbmF0aW9uIGxvZ3MgdmlhIGV4aXQoKQo+IHN5c3RlbSBjYWxsLiBUaGlzIGNvbW1hbmQg
YWxvbmUgY2FuIGdlbmVyYXRlIHRvbyBtdWNoIHN0cmVzcyBvbiBhIGJ1c3kgc3lzdGVtCj4gKHBl
cmZvcm1hbmNlIERvUyBhbmQgc3RvcmFnZSBEb1MpLgoKSG93ZXZlciwgaW4gdGhpcyB2ZXJ5IHNh
bWUgZW1haWwsIGEgZmV3IHBhcmFncmFwaHMgYWJvdmUgeW91IGNvbmNlZGVkCnRoYXQgIlRoZSBh
dWRpdCBzdWJzeXN0ZW0gY291bGQgaGFuZGxlIHRoZSBsb2FkIi4KCj4gQW5kIG1vcmVvdmVyLCB0
aGlzIGNvbW1hbmQgd2lsbCBub3QgbGV0Cj4gYXVkaXRkIHRvIGdlbmVyYXRlIHByb2Nlc3MgdGVy
bWluYXRpb24gbG9ncyB2aWEga2lsbCgpIHN5c3RlbSBjYWxsLgo+Cj4gICBraWxsIC05ICQkCj4K
PiBBdWRpdGluZyBraWxsIHN5c3RlbSBjYWxsIG1heSBnZW5lcmF0ZSBtb3JlIHN0cmVzcyB0aGFu
IGF1ZGl0aW5nIGV4aXQgc3lzdGVtIGNhbGwuCj4gVG9vIG11Y2ggbm9pc3kgbG9ncyBmb3IgY2F0
Y2hpbmcgdGhlIGV4YWN0IG9uZSBldmVudCB3ZSB3YW50IHRvIGtub3cuCgpXZSd2ZSBhbHJlYWR5
IGRpc2N1c3NlZCB0aGlzIGJvdGggZnJvbSBhIGtlcm5lbCBsb2FkIHBlcnNwZWN0aXZlIChpdApz
aG91bGQgYmUgYWJsZSB0byBoYW5kbGUgdGhlIGxvYWQsIGlmIG5vdCB0aGF0IGlzIGEgc2VwYXJh
dGUgcHJvYmxlbQp0byBhZGRyZXNzKSBhcyB3ZWxsIGFzIHRoZSBodW1hbiBwZXJzcGVjdGl2ZSAo
aWYgeW91IHdhbnQgYXVkaXRpbmcsCnlvdSBuZWVkIHRvIGJlIGFibGUgdG8gaGFuZGxlIGF1ZGl0
aW5nKS4KClRldHN1bywgYXMgc2hvdWxkIGJlIGFwcGFyZW50IGF0IHRoaXMgcG9pbnQsIEknbSBm
aW5kaW5nIHlvdXIKYXJndW1lbnRzIHVuY29udmluY2luZyBhdCBiZXN0LCBhbmQgY29uZnVzaW5n
IGF0IHdvcnN0LiAgSWYgeW91IG9yCnNvbWVvbmUgZWxzZSB3YW50cyB0byB0YWtlIGEgZGlmZmVy
ZW50IGFwcHJvYWNoIHRvd2FyZHMgYXJndWluZyBmb3IKdGhpcyBwYXRjaCBJJ2xsIGVudGVydGFp
biB0aGUgZGlzY3Vzc2lvbiBmdXJ0aGVyLCBidXQgcGxlYXNlIGRvIG5vdApyZXBseSBiYWNrIHdp
dGggdGhlIHNhbWUgYXBwcm9hY2g7IGl0IHNpbXBseSBpc24ndCBjb25zdHJ1Y3RpdmUgYXQKdGhp
cyBwb2ludC4KCi0tIApwYXVsLW1vb3JlLmNvbQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0
CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1hdWRpdAo=


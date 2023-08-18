Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D6A780E6D
	for <lists+linux-audit@lfdr.de>; Fri, 18 Aug 2023 16:59:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692370787;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jPhoehsJUxylOHHyt84atVHwO9VeR5nKU/7fvX6N37M=;
	b=ih77o95DJ23olqfbWgFIXWzdQ3Dp4qM5MjmsKVySqRCdjLT311WX+a53sBPOndtdY0LWaP
	OlpprAItCp8NWYWqR+O7lRNIwo+4rBUFaqdeo2U4TpKEZHDS+23jV0pkuXtS43De1PlBwn
	0Axdgd11EquQML9QHAq0tag5M1oX8ic=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-L--Vi6AENqm1qvaJgfkKIA-1; Fri, 18 Aug 2023 10:59:43 -0400
X-MC-Unique: L--Vi6AENqm1qvaJgfkKIA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C2C43C100BE;
	Fri, 18 Aug 2023 14:59:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DABBD2026D68;
	Fri, 18 Aug 2023 14:59:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D1FEA1946594;
	Fri, 18 Aug 2023 14:59:33 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7DF921946587 for <linux-audit@listman.corp.redhat.com>;
 Fri, 18 Aug 2023 14:59:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3BC31492C14; Fri, 18 Aug 2023 14:59:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33829492C13
 for <linux-audit@redhat.com>; Fri, 18 Aug 2023 14:59:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1817C8015AB
 for <linux-audit@redhat.com>; Fri, 18 Aug 2023 14:59:32 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-XQedeuGnNpywXEJEmYYjkA-1; Fri, 18 Aug 2023 10:59:30 -0400
X-MC-Unique: XQedeuGnNpywXEJEmYYjkA-1
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-56ce156bd37so643672eaf.3
 for <linux-audit@redhat.com>; Fri, 18 Aug 2023 07:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692370769; x=1692975569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X3FWbfaq9oYxDMdoSRqO3/ZCBS86gjkbKF54xuC3zVs=;
 b=dGD8sYYr8P3whBlc0cjI00p9tBfD1Z5RffMGxS6/QXT1WEQphGtMOQ+5ar0urUVQ7C
 5Syc4v8bd936XQWhdF8HtudwowkDgVw07aVumhIiY8qekkMTnKKxfhq+7FRwGAaQtgCJ
 LZQeu+2E+osriJW4Yy6nX7Fh78IIDO78Kub5C6yoDdDMDakLqCzcCD2OA4CHipscdNr4
 VHjb+bdeibJqJ1h2NCmHY35iMrg2E4eMLk3lhP5vXIhtbwW9bRgxEzUOLgHfTxY7YaCp
 vvZMErc4hLDzVamePmo0Z+oea5rKQF3AgMwf7cMqtk6fJTVuYxvxsApM5L8JpvXXjNis
 7UtA==
X-Gm-Message-State: AOJu0YxI6Jj/w06jeHBzf8ahsA3RS5I60Adzgh8iyuEHQw7CUIpp9JrA
 /ke14e3bX5dvMJiAAxD8UYY874te0oBiWkSyz081
X-Google-Smtp-Source: AGHT+IFu1PEVIIyQi5YbuVUSDUoupB9Osv+vX2oO+RpB4setRkl+Jp9v7ufQDzVf/0yw9cbQmvv/7Xb8o/3w9ZNNk68=
X-Received: by 2002:a05:6358:2791:b0:12b:da97:aba6 with SMTP id
 l17-20020a056358279100b0012bda97aba6mr2728127rwb.24.1692370769230; Fri, 18
 Aug 2023 07:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <CAHC9VhTLQjjQ0QMfBDHYCz9LOAuO=rJWSDEUqPsFE+dowFbN=Q@mail.gmail.com>
 <b06dbdd8-d2f6-b190-5635-948c0a966103@I-love.SAKURA.ne.jp>
 <CAHC9VhSz=3utr_CigGvkMEb6_avJUQq1Ak2smB7neSd76mzjFw@mail.gmail.com>
 <6957af54-16a2-4c28-56ff-dafe95f4e276@I-love.SAKURA.ne.jp>
In-Reply-To: <6957af54-16a2-4c28-56ff-dafe95f4e276@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 18 Aug 2023 10:59:18 -0400
Message-ID: <CAHC9VhTj-PQ0qPTiphPLXyJx3bWeqgVS_GPCWNgjqFqBgH6Njg@mail.gmail.com>
Subject: Re: [PATCH] audit: add task history record
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
Cc: audit@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 linux-audit@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBBdWcgMTgsIDIwMjMgYXQgNjozMOKAr0FNIFRldHN1byBIYW5kYQo8cGVuZ3Vpbi1r
ZXJuZWxAaS1sb3ZlLnNha3VyYS5uZS5qcD4gd3JvdGU6Cj4gT24gMjAyMy8wOC8xNiAyMjo1Mywg
UGF1bCBNb29yZSB3cm90ZToKPiA+IE9uIFdlZCwgQXVnIDE2LCAyMDIzIGF0IDY6MTDigK9BTSBU
ZXRzdW8gSGFuZGEKPiA+IDxwZW5ndWluLWtlcm5lbEBpLWxvdmUuc2FrdXJhLm5lLmpwPiB3cm90
ZToKPiA+PiBPbiAyMDIzLzA4LzE2IDM6NDQsIFBhdWwgTW9vcmUgd3JvdGU6Cj4gPj4+IE9uIEZy
aSwgQXVnIDExLCAyMDIzIGF0IDY6NTjigK9BTSBUZXRzdW8gSGFuZGEKPiA+Pj4gPHBlbmd1aW4t
a2VybmVsQGktbG92ZS5zYWt1cmEubmUuanA+IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IFdoZW4gYW4g
dW5leHBlY3RlZCBzeXN0ZW0gZXZlbnQgb2NjdXJzLCB0aGUgYWRtaW5pc3RyYXRvciBtYXkgd2Fu
dCB0bwo+ID4+Pj4gaWRlbnRpZnkgd2hpY2ggYXBwbGljYXRpb24gdHJpZ2dlcmVkIHRoZSBldmVu
dC4gRm9yIGV4YW1wbGUsIHVuZXhwZWN0ZWQKPiA+Pj4+IHByb2Nlc3MgdGVybWluYXRpb24gaXMg
c3RpbGwgYSByZWFsIGNvbmNlcm4gZW5vdWdoIHRvIHdyaXRlIGFydGljbGVzCj4gPj4+PiBsaWtl
IGh0dHBzOi8vYWNjZXNzLnJlZGhhdC5jb20vc29sdXRpb25zLzE2NTk5MyAuCj4gPj4+Pgo+ID4+
Pj4gVGhpcyBwYXRjaCBhZGRzIGEgcmVjb3JkIHdoaWNoIGVtaXRzIFRPTU9ZTy1saWtlIHRhc2sg
aGlzdG9yeSBpbmZvcm1hdGlvbgo+ID4+Pj4gaW50byB0aGUgYXVkaXQgbG9ncyBmb3IgYmV0dGVy
IHVuZGVyc3RhbmRpbmcgb2YgdW5leHBlY3RlZCBzeXN0ZW0gZXZlbnRzLgo+ID4+Pj4KPiA+Pj4+
ICAgdHlwZT1VTktOT1dOWzEzNDBdIG1zZz1hdWRpdCgxNjkxNzUwNzM4LjI3MToxMDgpOiBoaXN0
b3J5PSJuYW1lPXN3YXBwZXIvMDtwaWQ9MTtzdGFydD0yMDIzMDgxMTE5NDMyOT0+bmFtZT1pbml0
O3BpZD0xO3N0YXJ0PTIwMjMwODExMTk0MzQzPT5uYW1lPXN5c3RlbWQ7cGlkPTE7c3RhcnQ9MjAy
MzA4MTExOTQ0Mzk9Pm5hbWU9c3NoZDtwaWQ9MzY2MDtzdGFydD0yMDIzMDgxMTEwNDUwND0+bmFt
ZT1zc2hkO3BpZD0zNzY3O3N0YXJ0PTIwMjMwODExMTA0NTM1Igo+ID4+Pgo+ID4+PiBXaGlsZSBJ
IHJlc3BlY3QgeW91ciBwZXJzaXN0ZW5jZSwgd2UndmUgdGFsa2VkIGFib3V0IHRoaXMgcXVpdGUg
YSBiaXQKPiA+Pj4gYWxyZWFkeSBpbiBvdGhlciB0aHJlYWRzLiAgV2hhdCB5b3UgYXJlIHRyeWlu
ZyB0byBkbyBpcyBhbHJlYWR5Cj4gPj4+IHBvc3NpYmxlIHdpdGggYXVkaXQKPiA+Pgo+ID4+IEhv
dz8KPiA+Cj4gPiBJZiB5b3UgY29uZmlndXJlIGF1ZGl0IHRvIHJlY29yZCBleGVjKCkgYW5kIGZy
aWVuZHMgeW91IHNob3VsZCBoYXZlIGEKPiA+IHByb3BlciBoaXN0b3J5IG9mIHRoZSBwcm9jZXNz
ZXMgc3RhcnRlZCBvbiB0aGUgc3lzdGVtLgo+Cj4gVGhhdCBpcyBhICJObyBMU00gbW9kdWxlcyBv
dGhlciB0aGFuIFNFTGludXggaXMgbmVlZGVkIGJlY2F1c2UgU0VMaW51eCBjYW4gZG8KPiBldmVy
eXRoaW5nIiBhc3NlcnRpb24uCgpFeGNlcHQgd2UgYXJlIG5vdCB0YWxraW5nIFNFTGludXggb3Ig
TFNNcyBoZXJlLCB3ZSBhcmUgdGFsa2luZyBhYm91dAphdWRpdCBhbmQgdGhlIGF1ZGl0IHN1YnN5
c3RlbSBpcyB2ZXJ5IGRpZmZlcmVudCBmcm9tIHRoZSBMU00gbGF5ZXIuClRoZSBMU00gbGF5ZXIg
aXMgZGVzaWduZWQgdG8gYmUgcGx1Z2dhYmxlIHdpdGggc3VwcG9ydCBmb3IgbXVsdGlwbGUKaW5k
aXZpZHVhbCBMU01zLCB3aGVyZWFzIHRoZSBhdWRpdCBzdWJzeXN0ZW0gaXMgZGVzaWduZWQgdG8g
c3VwcG9ydCBhCnNpbmdsZSBhdWRpdCBpbXBsZW1lbnRhdGlvbi4gIEl0IGlzIG15IG9waW5pb24g
dGhhdCB0aGUgYXVkaXQgcGF0Y2gKeW91IGhhdmUgcHJvcG9zZWQgaGVyZSBkb2VzIG5vdCBwcm92
aWRlIGFuIGF1ZGl0IGFkbWluaXN0cmF0b3Igd2l0aAphbnkgbmV3IGNhcGFiaWxpdGllcyB0aGF0
IHRoZXkgZG8gbm90IGN1cnJlbnRseSBoYXZlIGFzIGFuIG9wdGlvbi4KClRoZXJlIGFyZSBhbHNv
IGNvbmNlcm5zIGFyb3VuZCBmaWVsZCBmb3JtYXR0aW5nLCByZWNvcmQgbGVuZ3RoLCBldGMuLApi
dXQgdGhvc2UgYXJlIHNlY29uZGFyeSBpc3N1ZXMgY29tcGFyZWQgdG8gdGhlIG1vcmUgaW1wb3J0
YW50IGlzc3VlIG9mCnJlZHVuZGFudCBmdW5jdGlvbmFsaXR5LgoKPiBQZW9wbGUgcHJvcG9zZSBk
aWZmZXJlbnQgYXBwcm9hY2hlcy9pbXBsZW1lbnRhdGlvbnMgYmVjYXVzZQo+IHRoZXkgY2FuJ3Qg
YWZmb3JkIHV0aWxpemluZy9jb25maWd1cmluZyBleGlzdGluZyBhcHByb2FjaGVzL2ltcGxlbWVu
dGF0aW9ucy4KCkZyb20gd2hhdCBJJ3ZlIHNlZW4sIGJvdGggaW4gdGhpcyB0aHJlYWQgYXMgd2Vs
bCBhcyB0aGUgb3RoZXIgcmVsYXRlZAp0aHJlYWRzIGZyb20geW91LCB0aGVzZSByZWNlbnQgZWZm
b3J0cyBhcmUgZHVlIHRvIGEgbGFjayBvZiBUT01PWU8Kc3VwcG9ydCBpbiBtYWluc3RyZWFtIExp
bnV4IGRpc3RyaWJ1dGlvbnMuICBNeSBhZHZpY2UgaXMgdG8gc3RvcAp0cnlpbmcgdG8gZHVwbGlj
YXRlIHRoZSBUT01PWU8gZnVuY3Rpb25hbGl0eSBpbiBvdGhlciBzdWJzeXN0ZW1zL0xTTXMKYW5k
IHN0YXJ0IHdvcmtpbmcgd2l0aCB0aGUgZGlzdHJpYnV0aW9ucyB0byBiZXR0ZXIgdW5kZXJzdGFu
ZCB3aHkgdGhleQphcmUgbm90IHN1cHBvcnRpbmcgVE9NT1lPLiAgSSBiZWxpZXZlIHRoYXQgaWYg
eW91IGNhbiBkZXRlcm1pbmUgd2h5CnRoZSBkaXN0cmlidXRpb25zIGFyZSBub3QgZW5hYmxpbmcg
VE9NT1lPLCB5b3Ugc2hvdWxkIGJlIGFibGUgdG8KZGV2ZWxvcCBhIHBsYW4gdG8gYWRkcmVzcyB0
aG9zZSBpc3N1ZXMgYW5kIGV2ZW50dWFsbHkgZ2FpbgpkaXN0cmlidXRpb24gc3VwcG9ydCBmb3Ig
VE9NT1lPLiAgSSB1bmRlcnN0YW5kIHRoYXQgc3VjaCBhbiBhcHByb2FjaAp3aWxsIGxpa2VseSBi
ZSB0aW1lIGNvbnN1bWluZyBhbmQgZGlmZmljdWx0LCBidXQgSSB0aGluayB0aGF0IGlzIHlvdXIK
YmVzdCBvcHRpb24gZm9yIHN1Y2Nlc3MuCgo+IFlvdXIgYXNzZXJ0aW9uIGlzIGEgZmF0YWwgcHJv
YmxlbSBmb3IgbWVyZ2luZyAiUmU6IFtQQVRDSCB2MTMgMDAvMTFdIExTTTogVGhyZWUgYmFzaWMg
c3lzY2FsbHMiCj4gYXQgaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci9DQUhDOVZoUTR0dGtTTFRC
Q3JYTlpTQlIxRlA5VVpfZ1VIbW8wQlMzN0xDZHlCbVVleUFAbWFpbC5nbWFpbC5jb20gLgo+Cj4g
UGxlYXNlIHBsZWFzZSBhbGxvdyBMU00gbW9kdWxlcyBsaWtlIGh0dHBzOi8vbGttbC5rZXJuZWwu
b3JnL3IvNDFkMDMyNzEtZmY4YS05ODg4LTExZGUtYTdmNTNkYTQ3MzI4QEktbG92ZS5TQUtVUkEu
bmUuanAKPiB0byBvYnRhaW4gYSBzdGFibGUgTFNNIElECgpXZSd2ZSBhbHJlYWR5IGRpc2N1c3Nl
ZCB0aGF0IGluIHRoZSBUYXNrVHJhY2tlciB0aHJlYWQuCgo+IGlmIHlvdSBkb24ndCB3YW50IHRv
IHN1cHBvcnQgc29tZXRoaW5nIHRoYXQgcG9zc2libHkgaGF2ZSBhbiBhbHRlcm5hdGl2ZS4KCldl
J3ZlIGFscmVhZHkgdXBzdHJlYW1lZCBhbiBhbHRlcm5hdGl2ZSBhcHByb2FjaCB0byBUYXNrVHJh
Y2tlcjogVE9NT1lPLgoKLS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWlsaW5n
IGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5091782E7D
	for <lists+linux-audit@lfdr.de>; Mon, 21 Aug 2023 18:36:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692635797;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ALQbJf3bYU1Qa8Cc8nGewXxb/KIWh2U8deKKrzLsaWU=;
	b=LFYgdx29mKB2E3mO4RV34y44/57Jjb2/2bLjYJksdllmtTm4p0HHiGH8BGpqeMVMgC23mh
	Apu5fj3GArPAxnzTP/JU73ObWzwiGM17RhAUG8EmY3KKELs8pgTu6+/Xl+fpodT2b1TcY6
	Lp3Rg4z5wvsp410X7mPDayhcQIcdwhE=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-0UTApDzQPU62UCdDv2YqJQ-1; Mon, 21 Aug 2023 12:36:29 -0400
X-MC-Unique: 0UTApDzQPU62UCdDv2YqJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2BC91C09A40;
	Mon, 21 Aug 2023 16:36:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7858140E950;
	Mon, 21 Aug 2023 16:36:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 78B6D1946594;
	Mon, 21 Aug 2023 16:36:16 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AB5501946587 for <linux-audit@listman.corp.redhat.com>;
 Mon, 21 Aug 2023 16:36:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 751351121314; Mon, 21 Aug 2023 16:36:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D3EC1121318
 for <linux-audit@redhat.com>; Mon, 21 Aug 2023 16:36:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 525398D40A2
 for <linux-audit@redhat.com>; Mon, 21 Aug 2023 16:36:08 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-WyEH3uSzNRWPWbW91cEqSQ-1; Mon, 21 Aug 2023 12:36:05 -0400
X-MC-Unique: WyEH3uSzNRWPWbW91cEqSQ-1
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-58df8cab1f2so39511037b3.3
 for <linux-audit@redhat.com>; Mon, 21 Aug 2023 09:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692635764; x=1693240564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sQv4L/PA9hY8HSrQBW7aq0hnDdsWEt0E4rTSB2AJsSQ=;
 b=lOtWRY54wRoVemntdLZ0WhMI6SEl1yO5d6oIHzDQUiqd3hWGfhdK0JW0b8ftaukjJZ
 7dP+AKV9cQu5If7ApeX7PFH07YMoxuA4yX3dB9ndquisluYk3R2phYrzRc0BSa/JNrXJ
 uxVEpFDfoqXkLgZJjoPyKwE1UkfBy5VIEfRzKDNDcEBS/Qzsn+zzHF5QEg5p6fY/hBwB
 24prmldBEx1E4NtbYDkLuYl8eOCmzRIToUQsuZ9m9hWxLnAoaz26Jtmdo410wWM9utXz
 6BnVqatu9VfJBKKtxMRZhjqrVST3FrviqsoBvEQpQG5yTszkgmGx0HIvPoPzVWS6RY4L
 ty2Q==
X-Gm-Message-State: AOJu0YzMgFQ8mCEa6ZzDi0qfxCJNRQ/jEzsf/nW3FSyeUVV8vaHbzes0
 oQQ8t/LSd7nzaGZ3F039nZmvi3hHflUjYuzuru6t
X-Google-Smtp-Source: AGHT+IGvrYxl2ATR99fLkx+ccMWXaAajiFR3da/YtTYl68Cg1mIR3qSvlj19aljN17/0G+gBMNsEw321rCUGMLHiEws=
X-Received: by 2002:a81:6d0c:0:b0:581:2887:22be with SMTP id
 i12-20020a816d0c000000b00581288722bemr8465445ywc.37.1692635764580; Mon, 21
 Aug 2023 09:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <CAHC9VhTLQjjQ0QMfBDHYCz9LOAuO=rJWSDEUqPsFE+dowFbN=Q@mail.gmail.com>
 <b06dbdd8-d2f6-b190-5635-948c0a966103@I-love.SAKURA.ne.jp>
 <CAHC9VhSz=3utr_CigGvkMEb6_avJUQq1Ak2smB7neSd76mzjFw@mail.gmail.com>
 <6957af54-16a2-4c28-56ff-dafe95f4e276@I-love.SAKURA.ne.jp>
 <CAHC9VhTj-PQ0qPTiphPLXyJx3bWeqgVS_GPCWNgjqFqBgH6Njg@mail.gmail.com>
 <b0b60fdc-4484-2265-7fdf-8367bf218d18@I-love.SAKURA.ne.jp>
In-Reply-To: <b0b60fdc-4484-2265-7fdf-8367bf218d18@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 21 Aug 2023 12:35:53 -0400
Message-ID: <CAHC9VhRaUxN=oEyKCOrfrGzJeXDGxv2EKbZH3qwAB6AhKcSfog@mail.gmail.com>
Subject: Re: [PATCH] audit: add task history record
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU2F0LCBBdWcgMTksIDIwMjMgYXQgMzowOeKAr0FNIFRldHN1byBIYW5kYQo8cGVuZ3Vpbi1r
ZXJuZWxAaS1sb3ZlLnNha3VyYS5uZS5qcD4gd3JvdGU6Cj4gT24gMjAyMy8wOC8xOCAyMzo1OSwg
UGF1bCBNb29yZSB3cm90ZToKPiA+IEV4Y2VwdCB3ZSBhcmUgbm90IHRhbGtpbmcgU0VMaW51eCBv
ciBMU01zIGhlcmUsIHdlIGFyZSB0YWxraW5nIGFib3V0Cj4gPiBhdWRpdCBhbmQgdGhlIGF1ZGl0
IHN1YnN5c3RlbSBpcyB2ZXJ5IGRpZmZlcmVudCBmcm9tIHRoZSBMU00gbGF5ZXIuCj4gPiBUaGUg
TFNNIGxheWVyIGlzIGRlc2lnbmVkIHRvIGJlIHBsdWdnYWJsZSB3aXRoIHN1cHBvcnQgZm9yIG11
bHRpcGxlCj4gPiBpbmRpdmlkdWFsIExTTXMsIHdoZXJlYXMgdGhlIGF1ZGl0IHN1YnN5c3RlbSBp
cyBkZXNpZ25lZCB0byBzdXBwb3J0IGEKPiA+IHNpbmdsZSBhdWRpdCBpbXBsZW1lbnRhdGlvbi4g
IEl0IGlzIG15IG9waW5pb24gdGhhdCB0aGUgYXVkaXQgcGF0Y2gKPiA+IHlvdSBoYXZlIHByb3Bv
c2VkIGhlcmUgZG9lcyBub3QgcHJvdmlkZSBhbiBhdWRpdCBhZG1pbmlzdHJhdG9yIHdpdGgKPiA+
IGFueSBuZXcgY2FwYWJpbGl0aWVzIHRoYXQgdGhleSBkbyBub3QgY3VycmVudGx5IGhhdmUgYXMg
YW4gb3B0aW9uLgo+Cj4gQmVmb3JlIGV4cGxhaW5pbmcgd2h5IGFuIGF1ZGl0IGFkbWluaXN0cmF0
b3IgY2Fubm90IGFmZm9yZCBlbXVsYXRpbmcKPiB0aGlzIHBhdGNoLCBJIGV4cGxhaW4gd2hhdCB0
aGlzIHBhdGNoIHdpbGwgZG8uCj4KPiBUaGVyZSBhcmUgdGhyZWUgc3lzdGVtIGNhbGxzIGZvciBt
YW5hZ2luZyBhIHByb2Nlc3M6IGZvcmsoKS9leGVjdmUoKS9leGl0KCkuCj4KPiAgIGh0dHBzOi8v
SS1sb3ZlLlNBS1VSQS5uZS5qcC90b21veW8vZm9yay5naWYKPiAgIGh0dHBzOi8vSS1sb3ZlLlNB
S1VSQS5uZS5qcC90b21veW8vZXhlY3ZlLmdpZgo+ICAgaHR0cHM6Ly9JLWxvdmUuU0FLVVJBLm5l
LmpwL3RvbW95by9leGl0LmdpZgo+Cj4gQXMgYSByZXN1bHQsIGhpc3Rvcnkgb2YgYSBwcm9jZXNz
IGNhbiBiZSByZXByZXNlbnRlZCBhcyBhIHRyZWUsIHdoZXJlIHRoZQo+IHJvb3Qgb2YgdGhlIHRy
ZWUgaXMgdGhlIGtlcm5lbCB0aHJlYWQgd2hpY2ggaXMgc3RhcnRlZCBieSB0aGUgYm9vdCBsb2Fk
ZXIuCj4KPiAgIGh0dHBzOi8vSS1sb3ZlLlNBS1VSQS5uZS5qcC90b21veW8vcmFpbHdheS5naWYK
Pgo+IFRoaXMgZnVuZGFtZW50YWwgbWVjaGFuaXNtIGNhbm5vdCBiZSBjaGFuZ2VkIGFzIGxvbmcg
YXMgTGludXggcmVtYWlucyBhcyBhCj4gVW5peC1saWtlIE9TLiBUaGF0IGlzLCBhZGRpbmcgdGhp
cyBpbmZvcm1hdGlvbiB3aWxsIG5vdCBjYXVzZSB3aGF0IHlvdSBjYWxsCj4gInRoZSBzdXBwb3J0
IGJ1cmRlbiIgLi4uCgpBbnkgbmV3IGZ1bmN0aW9uYWxpdHkgYWRkZWQgdG8gdGhlIGtlcm5lbCwg
ZXNwZWNpYWxseSB1c2VyIHZpc2libGUKZnVuY3Rpb25hbGl0eSBvciBzb21lIHNvcnQgb2YgaW50
ZXJmYWNlLCBhZGRzIGEgc3VwcG9ydCBidXJkZW4uCk5vdGhpbmcgaXMgImZyZWUiLgoKPiA+IFRo
ZXJlIGFyZSBhbHNvIGNvbmNlcm5zIGFyb3VuZCBmaWVsZCBmb3JtYXR0aW5nLCByZWNvcmQgbGVu
Z3RoLCBldGMuLAo+ID4gYnV0IHRob3NlIGFyZSBzZWNvbmRhcnkgaXNzdWVzIGNvbXBhcmVkIHRv
IHRoZSBtb3JlIGltcG9ydGFudCBpc3N1ZSBvZgo+ID4gcmVkdW5kYW50IGZ1bmN0aW9uYWxpdHku
Cj4KPiBJZiBzb21lb25lIHRyaWVzIHRvIGVtdWxhdGUgdGhpcyBwYXRjaCwgd2UgbmVlZCB0byBi
ZSBhYmxlIHRvIHRyYWNlIGFsbAo+IGZvcmsoKS9leGVjdmUoKS9leGl0KCkgc3lzdGVtIGNhbGxz
LiBPciwgdGhlIGhpc3RvcnkgdHJlZSB3aWxsIGJlIGJyb2tlbi4KPgo+IElmIGFuIGF1ZGl0IGFk
bWluaXN0cmF0b3IgdHJpZXMgdG8gZW11bGF0ZSB0aGlzIHBhdGNoIHVzaW5nIHN5c3RlbSBjYWxs
Cj4gYXVkaXRpbmcgZnVuY3Rpb25hbGl0eSwgd2UgbmVlZCB0byBtYWtlIHN1cmUgdGhhdAo+Cj4g
ICAiYXVkaXRjdGwgLUQiIG11c3Qgbm90IGNsZWFyIHJ1bGVzIGZvciB0cmFjaW5nIGZvcmsoKS9l
eGVjdmUoKS9leGl0KCkKPiAgIHN5c3RlbSBjYWxscy4gVGhpcyBpcyBpbXBvc3NpYmxlIGJlY2F1
c2UgdGhpcyBjaGFuZ2Ugd2lsbCBicmVhayB1c2Vyc3BhY2UKPiAgIHByb2dyYW1zIGV4cGVjdGlu
ZyB0aGF0ICJhdWRpdGN0bCAtRCIgY2xlYXJzIGFsbCBydWxlcy4KCkl0J3MgYSBnb29kIHRoaW5n
IHRoYXQgJ2F1ZHRpY3RsIC1kIC4uLicgZXhpc3RzIHNvIHRoYXQgb25lIGNhbgpzZWxlY3RpdmVs
eSBkZWxldGUgYXVkaXQgcnVsZXMgZnJvbSB0aGUga2VybmVsLiAgSWYgc29tZW9uZSB3YW50cyB0
bwpwcmVzZXJ2ZSBzcGVjaWZpYyBhdWRpdCBydWxlcywgdGhhdCBpcyB0aGUgd2F5IHRvIGRvIGl0
OyAnYXVkaXRjdGwgLUQnCmlzIGEgdmVyeSBjb2Fyc2UgdG9vbCBhbmQgbm90IHNvbWV0aGluZyB0
aGF0IGlzIGxpa2VseSB2ZXJ5IHVzZWZ1bCBmb3IKdXNlcnMgd2l0aCBzdHJpY3QgYXVkaXRpbmcg
cmVxdWlyZW1lbnRzLgoKPiAgIFJ1bGVzIGZvciB0cmFjaW5nIGZvcmsoKS9leGVjdmUoKS9leGl0
KCkgc3lzdGVtIGNhbGxzIG11c3QgYmUgZW5hYmxlZAo+ICAgd2hlbiB0aGUga2VybmVsIHRocmVh
ZCB3aGljaCBpcyBzdGFydGVkIGJ5IHRoZSBib290IGxvYWRlciBzdGFydHMuCj4gICBIb3cgY2Fu
IHdlIGVtYmVkIHN1Y2ggc3lzdGVtIGNhbGwgYXVkaXRpbmcgcnVsZXMgaW50byB0aGUga2VybmVs
IGFuZAo+ICAgdGVsbCB3aGV0aGVyIHRvIGVuYWJsZSB0aGVzZSBydWxlcyB1c2luZyB0aGUga2Vy
bmVsIGNvbW1hbmQgbGluZSBvcHRpb25zPwoKSSB3b3VsZCBib290IHRoZSBzeXN0ZW0gd2l0aCAn
YXVkaXQ9MScgb24gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUgYW5kCmVuc3VyZSB0aGF0IHlvdXIg
ZGVzaXJlZCBhdWRpdCBydWxlcyBhcmUgbG9hZGVkIGFzIGVhcmx5IGluIHRoZSBib290CnByb2Nl
c3MgYXMgcG9zc2libGUsIGJlZm9yZSBhbnkgbG9uZy1ydW5uaW5nIHByb2Nlc3Nlcy9kYWVtb25z
L2xvZ2lucwphcmUgc3RhcnRlZC4gIEhvbmVzdGx5LCB0aGF0J3Mgc2ltcGx5IGEgZ29vZCBiZXN0
IHByYWN0aWNlIGZvciBhbnlvbmUKd2hvIGNhcmVzIGFib3V0IG1haW50YWluaW5nIGEgcHJvcGVy
IGF1ZGl0IGxvZywgaW5kZXBlbmRlbnQgb2YgdGhlCnNwZWNpZmljIHVzZSBjYXNlIGhlcmUuCgo+
ICAgSW4gb3JkZXIgdG8gYXZvaWQgcG9zc2liaWxpdHkgb2YgbG9vc2luZyBmb3JrKCkvZXhlY3Zl
KCkvZXhpdCgpIHJlY29yZHMsCj4gICBhdWRpdGQgbXVzdCBub3QgYmUgc3RvcHBlZCBldmVuIHRl
bXBvcmFyaWx5LiBXaG8gd2FudHMgdG8gZW5mb3JjZSBzdWNoCj4gICByZXF1aXJlbWVudCBpbiBv
cmRlciB0byBiZSBhYmxlIHRvIG9idGFpbiBwcm9jZXNzIGhpc3RvcnkgaW5mb3JtYXRpb24/CgpB
IHNpbGx5IGFtb3VudCBvZiB3b3JrIGhhcyBnb25lIGludG8gZW5zdXJpbmcgdGhhdCB0aGUgYXVk
aXQgc3Vic3lzdGVtCmluIHRoZSBrZXJuZWwgZG9lc24ndCBsb3NlIHJlY29yZHMgd2hlbiBwcm9w
ZXJseSBjb25maWd1cmVkLiAgSWYgeW91CmhhdmVuJ3QgYWxyZWFkeSwgSSB3b3VsZCBlbmNvdXJh
Z2UgeW91IHRvIHJlYWQgdGhlIGF1ZGl0Y3RsKDgpIG1hbgpwYWdlIGFuZCBsb29rIGZvciB0aGUg
cGFyYW1ldGVycyB0aGF0IGFkanVzdCB0aGUgYXVkaXQgYmFja2xvZwpjb25maWd1cmF0aW9uLgoK
LS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVk
aXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWF1ZGl0Cg==


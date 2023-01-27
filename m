Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 285D467F20C
	for <lists+linux-audit@lfdr.de>; Sat, 28 Jan 2023 00:09:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674860947;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ULY7L3iudDJyOrNBLOgeOd7T0kc6dSjzSgzJXqfWZ6I=;
	b=eKgj8LFlxm4gD2W2fU+A/mXmXupJudzdwan7wcDy2Ol4aCqAubBRlzc3a+oIh8KbIiWRGp
	kWEnoxlGOaJTCcQoS2GTBCeL9MAUnCM6PsNxJ3f6pujPj9B08PhwAFXVqfuEjAtPMjXo1n
	f+nGJDXat6+Ar9sOCO9GgwHrSBUSxWM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-Ik0VfYRHMQenyNlmfenRDg-1; Fri, 27 Jan 2023 18:09:05 -0500
X-MC-Unique: Ik0VfYRHMQenyNlmfenRDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D517985C1AD;
	Fri, 27 Jan 2023 23:09:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 425AE14171BE;
	Fri, 27 Jan 2023 23:09:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E907719465A3;
	Fri, 27 Jan 2023 23:09:02 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 22D5A194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 23:09:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1598F4010D2A; Fri, 27 Jan 2023 23:09:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DF7C40C141B
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 23:09:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E736C3C021AA
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 23:09:01 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-h_rxt0ZoOn-9oMLcTV6RMA-1; Fri, 27 Jan 2023 18:09:00 -0500
X-MC-Unique: h_rxt0ZoOn-9oMLcTV6RMA-1
Received: by mail-pj1-f47.google.com with SMTP id b10so6030030pjo.1
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 15:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6d/NJ7u5M57ZMs5/XSzme6T+NlQRBMweiU7KSI07KS4=;
 b=0IjXvtkweCQ8aWtIaEgH52UCnDw6xK0OY4wl2jno6Wr4SU+psda3bPWvIdnHHn1wSu
 WXCBY5vc7z/FCT+qGFoKSypB9nDMvZPt/JXq9RFoxYnBT80MSUdr8d5Vqqc8NZox5D+d
 oHihpCc2+47krduoZfoIYMPuBlHZhT/lO3Fn1O5IAXwIfiAquGClVE7ZJunoIfp5QEQv
 ABq9Y5iH81N63UN5dDHKjFRsJ8r1DS9JJrlDwjhAHjkSK/GchQb72+KDcDa94MaV0J+d
 4PtsaPgjoW9On8v/gDzL9wevrxbKz7B/AS1wdPHC9V4gMrTl0Eh0DfiKw8s1Rte15XkW
 1qGQ==
X-Gm-Message-State: AFqh2kovy+YGbtc9k406n+7sfHZK7VmqucWnma6/Xo3ubS2c736UBPPL
 AxGM9enVWWb4U313hRGY8WsgcWg76mEUmqrfelhs
X-Google-Smtp-Source: AMrXdXuDLNSwckzSbYBFhsjXhjIrmP5IfNXjBk21l5WN/BcBzKlpCMhzzC2X4ht26fooVzU6d6eV9Xcu/nsn2XzBtNI=
X-Received: by 2002:a17:902:b496:b0:172:86a2:8e68 with SMTP id
 y22-20020a170902b49600b0017286a28e68mr4831485plr.27.1674860939399; Fri, 27
 Jan 2023 15:08:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674682056.git.rgb@redhat.com>
 <da695bf4-bd9b-a03d-3fbc-686724a7b602@kernel.dk>
 <CAHC9VhSRbay5bEUMJngpj+6Ss=WLeRoyJaNNMip+TyTkTJ6=Lg@mail.gmail.com>
 <24fbe6cb-ee80-f726-b260-09f394ead764@kernel.dk>
 <CAHC9VhRuvV9vjhmTM4eGJkWmpZmSkgVaoQ=L6g3cahej-F52tQ@mail.gmail.com>
 <d9da8035-ed81-fb28-bf3a-f98c8a1e044a@kernel.dk>
 <CAHC9VhRpu7WZDqWKcLDj18A0Z5FJdUU=eUL3wbJH1CnEBWB4GA@mail.gmail.com>
 <7904e869-f885-e406-9fe6-495a6e9790e4@kernel.dk>
In-Reply-To: <7904e869-f885-e406-9fe6-495a6e9790e4@kernel.dk>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 27 Jan 2023 18:08:48 -0500
Message-ID: <CAHC9VhRipXMCiaGZ-9YLycKWaq1FnV0ybC2B7G8Dua56P7bHkw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] two suggested iouring op audit updates
To: Jens Axboe <axboe@kernel.dk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: Christian Brauner <brauner@kernel.org>, Richard Guy Briggs <rgb@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Pavel Begunkov <asml.silence@gmail.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBKYW4gMjcsIDIwMjMgYXQgNjowMiBQTSBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwu
ZGs+IHdyb3RlOgo+IE9uIDEvMjcvMjMgMzo1M+KAr1BNLCBQYXVsIE1vb3JlIHdyb3RlOgo+ID4g
T24gRnJpLCBKYW4gMjcsIDIwMjMgYXQgNTo0NiBQTSBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwu
ZGs+IHdyb3RlOgo+ID4+IE9uIDEvMjcvMjMgMzozOOKAr1BNLCBQYXVsIE1vb3JlIHdyb3RlOgo+
ID4+PiBPbiBGcmksIEphbiAyNywgMjAyMyBhdCAyOjQzIFBNIEplbnMgQXhib2UgPGF4Ym9lQGtl
cm5lbC5kaz4gd3JvdGU6Cj4gPj4+PiBPbiAxLzI3LzIzIDEyOjQy4oCvUE0sIFBhdWwgTW9vcmUg
d3JvdGU6Cj4gPj4+Pj4gT24gRnJpLCBKYW4gMjcsIDIwMjMgYXQgMTI6NDAgUE0gSmVucyBBeGJv
ZSA8YXhib2VAa2VybmVsLmRrPiB3cm90ZToKPiA+Pj4+Pj4gT24gMS8yNy8yMyAxMDoyM+KAr0FN
LCBSaWNoYXJkIEd1eSBCcmlnZ3Mgd3JvdGU6Cj4gPj4+Pj4+PiBBIGNvdXBsZSBvZiB1cGRhdGVz
IHRvIHRoZSBpb3VyaW5nIG9wcyBhdWRpdCBieXBhc3Mgc2VsZWN0aW9ucyBzdWdnZXN0ZWQgaW4K
PiA+Pj4+Pj4+IGNvbnN1bHRhdGlvbiB3aXRoIFN0ZXZlIEdydWJiLgo+ID4+Pj4+Pj4KPiA+Pj4+
Pj4+IFJpY2hhcmQgR3V5IEJyaWdncyAoMik6Cj4gPj4+Pj4+PiAgIGlvX3VyaW5nLGF1ZGl0OiBh
dWRpdCBJT1JJTkdfT1BfRkFEVklTRSBidXQgbm90IElPUklOR19PUF9NQURWSVNFCj4gPj4+Pj4+
PiAgIGlvX3VyaW5nLGF1ZGl0OiBkbyBub3QgbG9nIElPUklOR19PUF8qR0VUWEFUVFIKPiA+Pj4+
Pj4+Cj4gPj4+Pj4+PiAgaW9fdXJpbmcvb3BkZWYuYyB8IDQgKysrLQo+ID4+Pj4+Pj4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Pj4+Pj4KPiA+Pj4+
Pj4gTG9vayBmaW5lIHRvIG1lIC0gd2Ugc2hvdWxkIHByb2JhYmx5IGFkZCBzdGFibGUgdG8gYm90
aCBvZiB0aGVtLCBqdXN0Cj4gPj4+Pj4+IHRvIGtlZXAgdGhpbmdzIGNvbnNpc3RlbnQgYWNyb3Nz
IHJlbGVhc2VzLiBJIGNhbiBxdWV1ZSB0aGVtIHVwIGZvciA2LjMuCj4gPj4+Pj4KPiA+Pj4+PiBQ
bGVhc2UgaG9sZCBvZmYgdW50aWwgSSd2ZSBoYWQgYSBjaGFuY2UgdG8gbG9vayB0aGVtIG92ZXIg
Li4uCj4gPj4+Pgo+ID4+Pj4gSSBoYXZlbid0IHRha2VuIGFueXRoaW5nIHlldCwgZm9yIHRoaW5n
cyBsaWtlIHRoaXMgSSBhbHdheXMgbGV0IGl0Cj4gPj4+PiBzaW1tZXIgdW50aWwgcGVvcGxlIGhh
dmUgaGFkIGEgY2hhbmNlIHRvIGRvIHNvLgo+ID4+Pgo+ID4+PiBUaGFua3MuICBGV0lXLCB0aGF0
IHNvdW5kcyB2ZXJ5IHJlYXNvbmFibGUgdG8gbWUsIGJ1dCBJJ3ZlIHNlZW4gbG90cwo+ID4+PiBv
ZiBkaWZmZXJlbnQgYmVoYXZpb3JzIGFjcm9zcyBzdWJzeXN0ZW1zIGFuZCB3YW50ZWQgdG8gbWFr
ZSBzdXJlIHdlCj4gPj4+IHdlcmUgb24gdGhlIHNhbWUgcGFnZS4KPiA+Pgo+ID4+IFNvdW5kcyBm
YWlyLiBCVFcsIGNhbiB3ZSBzdG9wIENDJ2luZyBjbG9zZWQgbGlzdHMgb24gcGF0Y2gKPiA+PiBz
dWJtaXNzaW9ucz8gR2V0dGluZyB0aGVzZToKPiA+Pgo+ID4+IFlvdXIgbWVzc2FnZSB0byBMaW51
eC1hdWRpdCBhd2FpdHMgbW9kZXJhdG9yIGFwcHJvdmFsCj4gPj4KPiA+PiBvbiBldmVyeSByZXBs
eSBpcyByZWFsbHkgYW5ub3lpbmcuCj4gPgo+ID4gV2Uga2luZGEgbmVlZCBhdWRpdCByZWxhdGVk
IHN0dWZmIG9uIHRoZSBsaW51eC1hdWRpdCBsaXN0LCB0aGF0J3Mgb3VyCj4gPiBtYWlsaW5nIGxp
c3QgZm9yIGF1ZGl0IHN0dWZmLgo+Cj4gU3VyZSwgYnV0IHRoZW4gaXQgc2hvdWxkIGJlIG9wZW4u
IE9yIGRvIHNlcGFyYXRlIHBvc3RpbmdzIG9yIHNvbWV0aGluZy4KPiBDQydpbmcgYSBjbG9zZWQg
bGlzdCB3aXRoIG9wZW4gbGlzdHMgYW5kIHNlbmRpbmcgZW1haWwgdG8gcGVvcGxlIHRoYXQKPiBh
cmUgbm90IG9uIHRoYXQgY2xvc2VkIGxpc3QgaXMgYmFkIGZvcm0uCgpBZ3JlZSwgdGhhdCdzIHdo
eSBJIHNhaWQgaW4gbXkgcmVwbHkgdGhhdCBpdCB3YXMgY3JhcCB0aGF0IHRoZQpsaW51eC1hdWRp
dCBsaXN0IGlzIG1vZGVyYXRlZCBhbmQgYXNrZWQgUmljaGFyZC9TdGV2ZSB0byBvcGVuIGl0IHVw
LgoKLS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgt
YXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWF1ZGl0Cg==


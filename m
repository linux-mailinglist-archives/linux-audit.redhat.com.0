Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 71734692266
	for <lists+linux-audit@lfdr.de>; Fri, 10 Feb 2023 16:39:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676043582;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HG4r91WzzTYGYl3gWmxRHkNguZriUZtGSOJwVWLLd+s=;
	b=chmqhyLpu8wt8/pf9rkHltIjMcEwDQPgzYgp+op0kNxOza54PBOvODuPtfUmbUb84NE18C
	gbqK53WM8qNydjU/nBbX9G67c3AuzUBuaeao7He105bSKYXKfe7hbcLVfAjWZgeIrKTxyW
	zn36CzZUDz6tod1WRnz4PH/EM6c/0B8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-1OmqdBMgPbeUTJWRvTSpvA-1; Fri, 10 Feb 2023 10:39:38 -0500
X-MC-Unique: 1OmqdBMgPbeUTJWRvTSpvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43D6580D0E0;
	Fri, 10 Feb 2023 15:39:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 994922166B2A;
	Fri, 10 Feb 2023 15:39:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 50AB419465A3;
	Fri, 10 Feb 2023 15:39:35 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C94A1194658F for <linux-audit@listman.corp.redhat.com>;
 Fri, 10 Feb 2023 15:39:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AC72D1415113; Fri, 10 Feb 2023 15:39:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4B7A140EBF4
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 15:39:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85FD6101A521
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 15:39:33 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-Ad0K5exDNRyg2a1OQ64NNQ-1; Fri, 10 Feb 2023 10:39:31 -0500
X-MC-Unique: Ad0K5exDNRyg2a1OQ64NNQ-1
Received: by mail-pf1-f173.google.com with SMTP id 144so3689205pfv.11
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 07:39:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676043570;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvRly2U+sCgGvEcPil/n1kT1uf7hR8ywFA21WCXqph0=;
 b=IKNlEK7bUGDc5Fg6PLomQwLRjYFgwVjZOEcCx18jlvmf0msWmZo8sTyaaIkyvfZ5tI
 hXTisC2qJFyLY64n2pRG5r6bifdBF/yTGWA4k5KDSCvHUJTu33WowqdkVDe0trFe4rWt
 Ff1E/cMqZkNIbUlC/no30RO7/TKV9+3g9k01PSefsGsAMAE1ATLYmEn+7TC09VCLmKcB
 LEU9HwVDGXBZyn7B0fH75RqFO/VE8K+Tj40VI9Z4i+PUVL25WLL7weBMuTWz0fXT66m4
 RxdJQa3VMMMuIxz8iL8A29h4NZYq+wTU9eBMKkX0EtXO+pt8jhF4jwVIQw5cTEbmSvBl
 eOVw==
X-Gm-Message-State: AO0yUKXnPlrSRVNnvfppePBxBtwaSO3INFpUSvQuFLSFtbTSPERq2lar
 zxGNa1XX9ia2jqcqkG50GrY3jgj7JHXxAk1GV5l4
X-Google-Smtp-Source: AK7set+wCx2QL0mp3Ry5zhoh712ELZsFVGrSVHsRG9bb1cWzRQ28Qqq5D9cm5akwetXgY83HEmq0ABlPquIPy79JaDg=
X-Received: by 2002:a05:6a00:dd:b0:5a8:189d:b53f with SMTP id
 e29-20020a056a0000dd00b005a8189db53fmr2236320pfj.6.1676043570619; Fri, 10 Feb
 2023 07:39:30 -0800 (PST)
MIME-Version: 1.0
References: <b5dfdcd541115c86dbc774aa9dd502c964849c5f.1675282642.git.rgb@redhat.com>
 <Y+VrSLZKZoAGikUS@madcap2.tricolour.ca>
 <CAHC9VhTNb4gOpk9=49-ABtYs1DFKqqwXPSc-2bhJX7wcZ82o=g@mail.gmail.com>
 <13293926.uLZWGnKmhe@x2> <6939adfb-ce2c-1911-19ee-af32f7d9a5ca@kernel.dk>
In-Reply-To: <6939adfb-ce2c-1911-19ee-af32f7d9a5ca@kernel.dk>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 10 Feb 2023 10:39:19 -0500
Message-ID: <CAHC9VhTGmGJ81M2CZWsTf1kNf8XNz2WsYFAP=5VAVSUfUiu1yQ@mail.gmail.com>
Subject: Re: [PATCH v2] io_uring,audit: don't log IORING_OP_MADVISE
To: Jens Axboe <axboe@kernel.dk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
 LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBGZWIgOSwgMjAyMyBhdCA3OjE1IFBNIEplbnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5k
az4gd3JvdGU6Cj4gT24gMi85LzIzIDM6NTTigK9QTSwgU3RldmUgR3J1YmIgd3JvdGU6Cj4gPiBP
biBUaHVyc2RheSwgRmVicnVhcnkgOSwgMjAyMyA1OjM3OjIyIFBNIEVTVCBQYXVsIE1vb3JlIHdy
b3RlOgo+ID4+IE9uIFRodSwgRmViIDksIDIwMjMgYXQgNDo1MyBQTSBSaWNoYXJkIEd1eSBCcmln
Z3MgPHJnYkByZWRoYXQuY29tPiB3cm90ZToKPiA+Pj4gT24gMjAyMy0wMi0wMSAxNjoxOCwgUGF1
bCBNb29yZSB3cm90ZToKPiA+Pj4+IE9uIFdlZCwgRmViIDEsIDIwMjMgYXQgMzozNCBQTSBSaWNo
YXJkIEd1eSBCcmlnZ3MgPHJnYkByZWRoYXQuY29tPgo+ID4gd3JvdGU6Cj4gPj4+Pj4gZmFkdmlz
ZSBhbmQgbWFkdmlzZSBib3RoIHByb3ZpZGUgaGludHMgZm9yIGNhY2hpbmcgb3IgYWNjZXNzIHBh
dHRlcm4KPiA+Pj4+PiBmb3IgZmlsZSBhbmQgbWVtb3J5IHJlc3BlY3RpdmVseS4gIFNraXAgdGhl
bS4KPiA+Pj4+Cj4gPj4+PiBZb3UgZm9yZ290IHRvIHVwZGF0ZSB0aGUgZmlyc3Qgc2VudGVuY2Ug
aW4gdGhlIGNvbW1pdCBkZXNjcmlwdGlvbiA6Lwo+ID4+Pgo+ID4+PiBJIGRpZG4ndCBmb3JnZXQu
ICBJIHVwZGF0ZWQgdGhhdCBzZW50ZW5jZSB0byByZWZsZWN0IHRoZSBmYWN0IHRoYXQgdGhlCj4g
Pj4+IHR3byBzaG91bGQgYmUgdHJlYXRlZCBzaW1pbGFybHkgcmF0aGVyIHRoYW4gZGlmZmVyZW50
bHkuCj4gPj4KPiA+PiBPb29va2F5LiAgQ2FuIHdlIGF0IGxlYXN0IGFncmVlIHRoYXQgdGhlIGNv
bW1pdCBkZXNjcmlwdGlvbiBzaG91bGQgYmUKPiA+PiByZXBocmFzZWQgdG8gbWFrZSBpdCBjbGVh
ciB0aGF0IHRoZSBwYXRjaCBvbmx5IGFkanVzdHMgbWFkdmlzZT8gIFJpZ2h0Cj4gPj4gbm93IEkg
cmVhZCB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIGFuZCBpdCBzb3VuZHMgbGlrZSB5b3UgYXJlIGFk
anVzdGluZwo+ID4+IHRoZSBiZWhhdmlvciBmb3IgYm90aCBmYWR2aXNlIGFuZCBtYWR2aXNlIGlu
IHRoaXMgcGF0Y2gsIHdoaWNoIGlzIG5vdAo+ID4+IHRydWUuCj4gPj4KPiA+Pj4+IEknbSBzdGls
bCBsb29raW5nIGZvciBzb21lIHR5cGUgb2Ygc3RhdGVtZW50IHRoYXQgeW91J3ZlIGRvbmUgc29t
ZQo+ID4+Pj4gaG9tZXdvcmsgb24gdGhlIElPUklOR19PUF9NQURWSVNFIGNhc2UgdG8gZW5zdXJl
IHRoYXQgaXQgZG9lc24ndCBlbmQKPiA+Pj4+IHVwIGNhbGxpbmcgaW50byB0aGUgTFNNLCBzZWUg
bXkgcHJldmlvdXMgZW1haWxzIG9uIHRoaXMuICBJIG5lZWQgbW9yZQo+ID4+Pj4gdGhhbiAiU3Rl
dmUgdG9sZCBtZSB0byBkbyB0aGlzIi4KPiA+Pj4+Cj4gPj4+PiBJIGJhc2ljYWxseSBqdXN0IHdh
bnQgdG8gc2VlIHRoYXQgc29tZSBjYXJlIGFuZCB0aG91Z2h0IGhhcyBnb25lIGludG8KPiA+Pj4+
IHRoaXMgcGF0Y2ggdG8gdmVyaWZ5IGl0IGlzIGNvcnJlY3QgYW5kIGdvb2QuCj4gPj4+Cj4gPj4+
IFN0ZXZlIHN1Z2dlc3RlZCBJIGxvb2sgaW50byBhIG51bWJlciBvZiBpb3VyaW5nIG9wcy4gIEkg
bG9va2VkIGF0IHRoZQo+ID4+PiBkZXNjcmlwdGlvbiBjb2RlIGFuZCBhZ3JlZWQgdGhhdCBpdCB3
YXNuJ3QgbmVjZXNzYXJ5IHRvIGF1ZGl0IG1hZHZpc2UuCj4gPj4+IFRoZSByYXRpb25hbGUgZm9y
IGZhZHZpc2Ugd2FzIGRldGVtaW5lZCB0byBoYXZlIGJlZW4gY29uZmxhdGVkIHdpdGgKPiA+Pj4g
ZmFsbG9jYXRlIGFuZCBzdWJzZXF1ZW50bHkgZHJvcHBlZC4gIFN0ZXZlIGFsc28gc3VnZ2VzdGVk
IGEgbnVtYmVyIG9mCj4gPj4+IG90aGVycyBhbmQgYWZ0ZXIgaW52ZXN0aWdhdGlvbiBJIGRlY2lk
ZWQgdGhhdCB0aGVpciBjdXJyZW50IHN0YXRlIHdhcwo+ID4+PiBjb3JyZWN0LiAgKmdldHhhdHRy
IHlvdSd2ZSBhZHZpc2VkIGFnYWluc3QsIHNvIGl0IHdhcyBkcm9wcGVkLiAgSXQKPiA+Pj4gYXBw
ZWFycyBmZXdlciBtb2RpZmljYXRpb25zIHdlcmUgbmVjZXNzYXJ5IHRoYW4gb3JpZ2luYWxseSBz
dXNwZWN0ZWQuCj4gPj4KPiA+PiBNeSBjb25jZXJuIGlzIHRoYXQgdGhyZWUgb2YgdGhlIGZvdXIg
Y2hhbmdlcyB5b3UgaW5pdGlhbGx5IHByb3Bvc2VkCj4gPj4gd2VyZSByZWplY3RlZCwgd2hpY2gg
Z2l2ZXMgbWUgcGF1c2UgYWJvdXQgdGhlIGZvdXJ0aC4gIFlvdSBtZW50aW9uCj4gPj4gdGhhdCBi
YXNlZCBvbiB5b3VyIHJlYWRpbmcgb2YgbWFkdmlzZSdzIGRlc2NyaXB0aW9uIHlvdSBmZWVsIGF1
ZGl0aW5nCj4gPj4gaXNuJ3QgbmVjZXNzYXJ5IC0gYW5kIHlvdSBtYXkgYmUgcmlnaHQgLSBidXQg
YmFzZWQgb24gb3VyIGV4cGVyaWVuY2UKPiA+PiBzbyBmYXIgd2l0aCB0aGlzIHBhdGNoc2V0IEkg
d291bGQgbGlrZSB0byBoZWFyIHRoYXQgeW91IGhhdmUgcHJvcGVybHkKPiA+PiBpbnZlc3RpZ2F0
ZWQgYWxsIG9mIHRoZSBtYWR2aXNlIGNvZGUgcGF0aHMsIGFuZCBJIHdvdWxkIGxpa2UgdGhhdCBp
bgo+ID4+IHRoZSBjb21taXQgZGVzY3JpcHRpb24uCj4gPgo+ID4gSSB0aGluayB5b3UncmUgYmVp
bmcgdW5uZWNlc3NhcmlseSBoYXJkIG9uIHRoaXMuIFllcywgdGhlIGNvbW1pdCBtZXNzYWdlCj4g
PiBtaWdodCBiZSB0b3VjaGVkIHVwLiBCdXQgbWFkdmlzZSBpcyBhZHZpc29yeSBpbiBuYXR1cmUu
IEl0IGlzIG5vdCBzZWN1cml0eQo+ID4gcmVsZXZhbnQuIEFuZCBhIGdyZXAgdGhyb3VnaCB0aGUg
c2VjdXJpdHkgZGlyZWN0b3J5IGRvZXNuJ3QgdHVybiB1cCBhbnkKPiA+IGhvb2tzLgo+Cj4gQWdy
ZWUsIGl0J3MgZ2V0dGluZyBhIGJpdCBhbmFsLi4uIEZXSVcsIHBhdGNoIGxvb2tzIGZpbmUgdG8g
bWUuCgpDYWxsIGl0IHdoYXRldmVyIHlvdSB3YW50LCBidXQgdGhlIGRldGFpbHMgYXJlIG9mdGVu
IGltcG9ydGFudCBhdCB0aGlzCmxldmVsIG9mIGNvZGUsIGFuZCB3aGVuIEkgc2VlIGEgcGF0Y2gg
YXV0aG9yIHB1c2hpbmcgYmFjayBvbiB2ZXJpZnlpbmcKdGhhdCB0aGVpciBwYXRjaCBpcyBjb3Jy
ZWN0IGl0IG1ha2VzIG1lIHZlcnkgc2tlcHRpY2FsLgoKSSByZWFsbHkgd291bGQgaGF2ZSBwcmVm
ZXJyZWQgdGhhdCB5b3UgaGVsZCBvZmYgZnJvbSBtZXJnaW5nIHRoaXMKdW50aWwgdGhpcyB3YXMg
cmVzb2x2ZWQgYW5kIEFDSydkIC4uLiBvaCB3ZWxsLgoKLS0gCnBhdWwtbW9vcmUuY29tCgotLQpM
aW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xp
c3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


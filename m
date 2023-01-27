Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8222167F13D
	for <lists+linux-audit@lfdr.de>; Fri, 27 Jan 2023 23:38:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674859113;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=javnDEODQsJdiG3tP3SMEWkZ9nLX6dPXlKBgtproABQ=;
	b=imi14qeQ6b8N/hQMy1Hs9o1gnvoHIqcSKIxMd4cDHI9uqpv+CXLyz9pPTO/8/NfVzDrnnq
	PIG05wOenONn43DRWaeM8w7EenPGG78QcafMVVnTabnmV1/sGzmsHFbbOFfewzMK860o+t
	suVeLj4yHl18c4MbQ8cCXid1UVDktNk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-AgFz8NerPrCerEyBm_QAow-1; Fri, 27 Jan 2023 17:38:29 -0500
X-MC-Unique: AgFz8NerPrCerEyBm_QAow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 751863806703;
	Fri, 27 Jan 2023 22:38:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0592614171BE;
	Fri, 27 Jan 2023 22:38:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9139219465A3;
	Fri, 27 Jan 2023 22:38:26 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 47009194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 22:38:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1C381492B03; Fri, 27 Jan 2023 22:38:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14B10492B01
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 22:38:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED6AB8828C0
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 22:38:19 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-226-OxASGlomPKqw3K8mDZhZyQ-1; Fri, 27 Jan 2023 17:38:18 -0500
X-MC-Unique: OxASGlomPKqw3K8mDZhZyQ-1
Received: by mail-pj1-f41.google.com with SMTP id 88so5939795pjo.3
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 14:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wT576QX9xHllxN0lRYKR47JyczROgIwu1/PNvL2Rutc=;
 b=FRcs8f5Bl6eRgCfD6bCWlduLYC2wNrMS4Qq1+S7pRlcUrzb1ox0INOmnQu93ItVBij
 Pkm262GvFxouX52Q8Ncyrfr8nkSgvN7jN+woxQiHMM3a9yxmCDBXIB6I9X351abDEWDP
 IK43+3fY24yE4rd1dPJUVH26iYNZ8wVQHzbKBpAoTykwy78ewK9rraiztNqYc3/XVJ+h
 kNZofSOHkr6CNvaYJfKtB23HcZytw3MxDFSYnbfM9BWNHvIUe3QuWZo8QTe6cPsL1BXz
 fY9BD1t/NGsqX4DbMy2e2uQaFIzIhHhkOHEdGXGSUbFiDPZfBX/ODgp0H9qoR8FBSdTX
 lMxg==
X-Gm-Message-State: AFqh2kqEQmMM5H4zwZYkUYFQMYQJMcBi1P7MxG0EB6G/Qi1XzJN2eeSy
 +/qUpLXX8mfUi+UAlK+C6QbYaHXRjfMmZfcDBYl6
X-Google-Smtp-Source: AMrXdXunM/785t5txnw7UTNhE9KblolcGjVvpPCwHuVLwD9hj4/sdRedAvzglIcjinAMhc5wbooE+A37rMqn4q3jEpU=
X-Received: by 2002:a17:90b:3903:b0:225:de08:b714 with SMTP id
 ob3-20020a17090b390300b00225de08b714mr5008556pjb.193.1674859097412; Fri, 27
 Jan 2023 14:38:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674682056.git.rgb@redhat.com>
 <da695bf4-bd9b-a03d-3fbc-686724a7b602@kernel.dk>
 <CAHC9VhSRbay5bEUMJngpj+6Ss=WLeRoyJaNNMip+TyTkTJ6=Lg@mail.gmail.com>
 <24fbe6cb-ee80-f726-b260-09f394ead764@kernel.dk>
In-Reply-To: <24fbe6cb-ee80-f726-b260-09f394ead764@kernel.dk>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 27 Jan 2023 17:38:06 -0500
Message-ID: <CAHC9VhRuvV9vjhmTM4eGJkWmpZmSkgVaoQ=L6g3cahej-F52tQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] two suggested iouring op audit updates
To: Jens Axboe <axboe@kernel.dk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

T24gRnJpLCBKYW4gMjcsIDIwMjMgYXQgMjo0MyBQTSBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwu
ZGs+IHdyb3RlOgo+IE9uIDEvMjcvMjMgMTI6NDLigK9QTSwgUGF1bCBNb29yZSB3cm90ZToKPiA+
IE9uIEZyaSwgSmFuIDI3LCAyMDIzIGF0IDEyOjQwIFBNIEplbnMgQXhib2UgPGF4Ym9lQGtlcm5l
bC5kaz4gd3JvdGU6Cj4gPj4gT24gMS8yNy8yMyAxMDoyM+KAr0FNLCBSaWNoYXJkIEd1eSBCcmln
Z3Mgd3JvdGU6Cj4gPj4+IEEgY291cGxlIG9mIHVwZGF0ZXMgdG8gdGhlIGlvdXJpbmcgb3BzIGF1
ZGl0IGJ5cGFzcyBzZWxlY3Rpb25zIHN1Z2dlc3RlZCBpbgo+ID4+PiBjb25zdWx0YXRpb24gd2l0
aCBTdGV2ZSBHcnViYi4KPiA+Pj4KPiA+Pj4gUmljaGFyZCBHdXkgQnJpZ2dzICgyKToKPiA+Pj4g
ICBpb191cmluZyxhdWRpdDogYXVkaXQgSU9SSU5HX09QX0ZBRFZJU0UgYnV0IG5vdCBJT1JJTkdf
T1BfTUFEVklTRQo+ID4+PiAgIGlvX3VyaW5nLGF1ZGl0OiBkbyBub3QgbG9nIElPUklOR19PUF8q
R0VUWEFUVFIKPiA+Pj4KPiA+Pj4gIGlvX3VyaW5nL29wZGVmLmMgfCA0ICsrKy0KPiA+Pj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Pgo+ID4+IExv
b2sgZmluZSB0byBtZSAtIHdlIHNob3VsZCBwcm9iYWJseSBhZGQgc3RhYmxlIHRvIGJvdGggb2Yg
dGhlbSwganVzdAo+ID4+IHRvIGtlZXAgdGhpbmdzIGNvbnNpc3RlbnQgYWNyb3NzIHJlbGVhc2Vz
LiBJIGNhbiBxdWV1ZSB0aGVtIHVwIGZvciA2LjMuCj4gPgo+ID4gUGxlYXNlIGhvbGQgb2ZmIHVu
dGlsIEkndmUgaGFkIGEgY2hhbmNlIHRvIGxvb2sgdGhlbSBvdmVyIC4uLgo+Cj4gSSBoYXZlbid0
IHRha2VuIGFueXRoaW5nIHlldCwgZm9yIHRoaW5ncyBsaWtlIHRoaXMgSSBhbHdheXMgbGV0IGl0
Cj4gc2ltbWVyIHVudGlsIHBlb3BsZSBoYXZlIGhhZCBhIGNoYW5jZSB0byBkbyBzby4KClRoYW5r
cy4gIEZXSVcsIHRoYXQgc291bmRzIHZlcnkgcmVhc29uYWJsZSB0byBtZSwgYnV0IEkndmUgc2Vl
biBsb3RzCm9mIGRpZmZlcmVudCBiZWhhdmlvcnMgYWNyb3NzIHN1YnN5c3RlbXMgYW5kIHdhbnRl
ZCB0byBtYWtlIHN1cmUgd2UKd2VyZSBvbiB0aGUgc2FtZSBwYWdlLgoKLS0gCnBhdWwtbW9vcmUu
Y29tCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpo
dHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


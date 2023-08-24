Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B76178717A
	for <lists+linux-audit@lfdr.de>; Thu, 24 Aug 2023 16:26:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692887212;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=37rp9au8HaFx1aCkjWmYsxxa3UJwj247gchbEBOMwJY=;
	b=aGRw3LqrS+XO38lLKa7PhWccDobCkVfOCz4L/bC5FtdjU2x1RJozwXFpauz7VA+YW+kGAZ
	qbJYdiLfOY1ArZrSTeeWWImclN6CPbbIMJw/sr0BPlhKg2kYYRseqhO73VgyLNxGG/Jw0c
	Arkl5+laWmsdmkb70UerwVQDumeVSdY=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-iJTOQHjYNLySONN6mgH3JA-1; Thu, 24 Aug 2023 10:26:48 -0400
X-MC-Unique: iJTOQHjYNLySONN6mgH3JA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCD32280AA2F;
	Thu, 24 Aug 2023 14:26:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BFCA2026D68;
	Thu, 24 Aug 2023 14:26:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9C7F319465A8;
	Thu, 24 Aug 2023 14:26:20 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 24C471946589 for <linux-audit@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 14:26:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 039DA40C2073; Thu, 24 Aug 2023 14:26:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F144040C2079
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 14:26:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D32A5280AA23
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 14:26:19 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-SOxQZnFBPvuRzp8UCX9Jrw-1; Thu, 24 Aug 2023 10:26:18 -0400
X-MC-Unique: SOxQZnFBPvuRzp8UCX9Jrw-1
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-5924093a9b2so34164047b3.2
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 07:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887177; x=1693491977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QGP6/LbeEHsJtc9AXv1aIkTp3x9dNPX7hclZu5wr4Y4=;
 b=cXnw168w3g58/4twopZIOsuxsfhio9Cn0roU6jB5AgOr8ZxZAsC19fEZ6YafP0+Ax8
 YGpF5+GUOKMy39DxRCQBsasqi9fsfoXYQ/KBQEUw1qspGS99Jg04rVIipkzUMoSY01AQ
 nhMWr++HvsUYOi1dVwQJDkmlR+rQ2DwfFXafLPZutIy1zpDuZWEAEKg5xFba2BYRz8Ih
 1P45Yk8XHtmzVxodNr+q9Jx+Z92IB4UMkI2/Qksufoa9sW8E5S/AS0NzoP0NGj5xBOlx
 ncTyQgNGvJg7HRu0BrYmRGCBP60dpE6+Q94zBSYcUmTTnpPF9g6rxmBrS6eULMRGz1Pt
 5Nug==
X-Gm-Message-State: AOJu0Yx67DVSTJ0aPpsm/dD7mqBtbXCaYYhQCB1CQND9/LB/2Cb1+ziA
 pEWwGG/vOo3F+dyJ5Q3AJH9/+qJwQmUbei0hP0sd
X-Google-Smtp-Source: AGHT+IHl3NM8vm7cLOKE3+nd7wsJCWNCuL99CMcc0vTdr0+3ZFXdYX5pmvqo0mTr9XkYOGAXhXvyy81Cxy64434mr5Q=
X-Received: by 2002:a0d:c781:0:b0:58a:d281:a275 with SMTP id
 j123-20020a0dc781000000b0058ad281a275mr17321106ywd.21.1692887176882; Thu, 24
 Aug 2023 07:26:16 -0700 (PDT)
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
 <CAHC9VhTPgnzdn1tmEmufcbseN_Q1CyzxTEzfvZW7OCBTeAadmA@mail.gmail.com>
 <d2557f88-0cda-b0bf-5c76-7c18912798c9@I-love.SAKURA.ne.jp>
 <CAHC9VhTZE2BinivPRLJ9S_21YcmXA6tMdDtAm5w3nk0dbZ0j1w@mail.gmail.com>
 <e9c593d9-6369-2987-ce20-5832dbebd027@I-love.SAKURA.ne.jp>
 <e56ed3a6-9d82-a181-bbc7-e322ea47cb98@I-love.SAKURA.ne.jp>
In-Reply-To: <e56ed3a6-9d82-a181-bbc7-e322ea47cb98@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 24 Aug 2023 10:26:06 -0400
Message-ID: <CAHC9VhRTVsoMWhP1+j7RcUqy2EiV=Z7W_00h55PE-WezzLg=Ew@mail.gmail.com>
Subject: Re: [PATCH] audit: add task history record
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgOTo0N+KAr0FNIFRldHN1byBIYW5kYQo8cGVuZ3Vpbi1r
ZXJuZWxAaS1sb3ZlLnNha3VyYS5uZS5qcD4gd3JvdGU6Cj4gT24gMjAyMy8wOC8yNCAyMjozOSwg
VGV0c3VvIEhhbmRhIHdyb3RlOgo+ID4+PiAgICgxKSBDYXRjaCBfYWxsXyBwcm9jZXNzIGNyZWF0
aW9ucyAoYm90aCB2aWEgZm9yaygpL2Nsb25lKCkgc3lzdGVtIGNhbGxzIGFuZAo+ID4+PiAgICAg
ICBrdGhyZWFkX2NyZWF0ZSgpIGZyb20gdGhlIGtlcm5lbCksIGFuZCBkdXBsaWNhdGUgdGhlIGhp
c3RvcnkgdXBvbiBwcm9jZXNzCj4gPj4+ICAgICAgIGNyZWF0aW9uLgo+ID4+Cj4gPj4gQ3JlYXRl
IGFuIGF1ZGl0IGZpbHRlciBydWxlIHRvIHJlY29yZCB0aGUgc3lzY2FsbHMgeW91IGFyZSBpbnRl
cmVzdGVkCj4gPj4gaW4gbG9nZ2luZy4KPiA+Cj4gPiBJIGNhbid0IGludGVycHJldCB3aGF0IHlv
dSBhcmUgdGFsa2luZyBhYm91dC4gUGxlYXNlIHNob3cgbWUgdXNpbmcgY29tbWFuZCBsaW5lLgo+
Cj4gSSdtIG5vdCBpbnRlcmVzdGVkIGluIGxvZ2dpbmcgdGhlIHN5c2NhbGxzIGp1c3QgZm9yIG1h
aW50YWluaW5nIHByb2Nlc3MgaGlzdG9yeQo+IGluZm9ybWF0aW9uLgoKVGhhdCdzIHVuZm9ydHVu
YXRlIGJlY2F1c2UgSSdtIG5vdCBpbnRlcmVzdGVkIGluIG1lcmdpbmcgeW91ciBwYXRjaAp3aGVu
IHdlIGFscmVhZHkgaGF2ZSBhbiBhdWRpdCBsb2cgd2hpY2ggY2FuIGJlIHVzZWQgdG8gdHJhY2Ug
cHJvY2VzcwpoaXN0b3J5IGluZm9ybWF0aW9uLgoKLS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51
eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3Rt
YW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


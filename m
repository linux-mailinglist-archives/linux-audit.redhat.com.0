Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C5A7848DF
	for <lists+linux-audit@lfdr.de>; Tue, 22 Aug 2023 19:59:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692727157;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OOXuW2/9LibcRMmNaBez2/wh3wIEyJi2nJXXKhHag8o=;
	b=HpqgIKX4/l2ZkMkXUtZypTUGkgAs0Xc02zeDe4cQ+zlSwogBbYgLhHUqQpacQVjyqdQmsF
	xnbzdDQ18+eo8PBC05F47viEmRrcO3B7JHsQ9HCCafrhm6piPEZ7dOE6qOgSklR8s1ioi/
	n+xIdowcVDU2unlzy63y4YGaOI9lR8w=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-OZBsDZDFPcCyt040HnB66A-1; Tue, 22 Aug 2023 13:59:15 -0400
X-MC-Unique: OZBsDZDFPcCyt040HnB66A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70CFA1C05B17;
	Tue, 22 Aug 2023 17:59:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8BC5140E96F;
	Tue, 22 Aug 2023 17:59:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E62F01946594;
	Tue, 22 Aug 2023 17:59:00 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C0E551946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 22 Aug 2023 17:58:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AC4C9492C18; Tue, 22 Aug 2023 17:58:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A48D1492C13
 for <linux-audit@redhat.com>; Tue, 22 Aug 2023 17:58:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87265800193
 for <linux-audit@redhat.com>; Tue, 22 Aug 2023 17:58:59 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-OOQh9SaPOGCtegwQ_qXYQw-1; Tue, 22 Aug 2023 13:58:57 -0400
X-MC-Unique: OOQh9SaPOGCtegwQ_qXYQw-1
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-58dce1f42d6so79616727b3.0
 for <linux-audit@redhat.com>; Tue, 22 Aug 2023 10:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692727137; x=1693331937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZJNO4DpweFGif48FgwOo4h5q6LSFLw60E3Noa2q77zU=;
 b=crgetKCF5csbtLMHw/dxR89XmIEcQ2FOTDiIOJ4PjWep175luRpLGtz/HJPgSPpKXY
 UIqsOghUqu+WTZuiYqUZsWX+WBuZrr2JXDX0XKhoO3MUVZ3UaTHvslCKWz3+8T+BZ6o7
 7KpcDH24lLceDMEctNN5bf1fpc1uwxoaS3NHXMvBqxNbIsbLOpwphNvVojBOoRUZcUIq
 z0T2Xx5yhDE0QRqwQqoGqLqriiKuBmXpi1RSem7rkFKliTrWHKcuj7m90uSb+Iygg6Rb
 PoLNFhkOHuBOvKJ9LA8zNjVb72Td60KPgOn6Y2jfTZCSJUK/dn6SyY6N0cqXWMeGpzbV
 fTIw==
X-Gm-Message-State: AOJu0YyNGjLGhe0ptXOgZfYo67upYuwAYCP+4Mjfdu/vpcigRqsFZx2l
 f9VGGoo9bzHqsAfpxB4+oZPBuo1+ueiY8V7Rw7nr
X-Google-Smtp-Source: AGHT+IEyDfy0CMSqPUd439p96k1PQIF8AF7NcYT6/KkkAcqmqIDP4pgMgV538sua5wmJ8oyoG1MTh7ku1JPl8x1envE=
X-Received: by 2002:a0d:e206:0:b0:583:9db5:7e89 with SMTP id
 l6-20020a0de206000000b005839db57e89mr9299641ywe.24.1692727137183; Tue, 22 Aug
 2023 10:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <b06dbdd8-d2f6-b190-5635-948c0a966103@I-love.SAKURA.ne.jp>
 <CAHC9VhSz=3utr_CigGvkMEb6_avJUQq1Ak2smB7neSd76mzjFw@mail.gmail.com>
 <4865772.31r3eYUQgx@x2>
In-Reply-To: <4865772.31r3eYUQgx@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 22 Aug 2023 13:58:46 -0400
Message-ID: <CAHC9VhTGQ7LF8BjZDJMj7F8Uo0AYsWtyce98kyQrsRYK1Ui1xg@mail.gmail.com>
Subject: Re: [PATCH] audit: add task history record
To: Steve Grubb <sgrubb@redhat.com>
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
 linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBBdWcgMjIsIDIwMjMgYXQgMTI6MjnigK9QTSBTdGV2ZSBHcnViYiA8c2dydWJiQHJl
ZGhhdC5jb20+IHdyb3RlOgo+IE9uIFdlZG5lc2RheSwgQXVndXN0IDE2LCAyMDIzIDk6NTM6NTgg
QU0gRURUIFBhdWwgTW9vcmUgd3JvdGU6Cj4gPiBPbiBXZWQsIEF1ZyAxNiwgMjAyMyBhdCA2OjEw
4oCvQU0gVGV0c3VvIEhhbmRhCj4gPiA8cGVuZ3Vpbi1rZXJuZWxAaS1sb3ZlLnNha3VyYS5uZS5q
cD4gd3JvdGU6Cj4gPiA+IE9uIDIwMjMvMDgvMTYgMzo0NCwgUGF1bCBNb29yZSB3cm90ZToKPiA+
ID4gPiBPbiBGcmksIEF1ZyAxMSwgMjAyMyBhdCA2OjU44oCvQU0gVGV0c3VvIEhhbmRhCj4gPiA+
ID4gPHBlbmd1aW4ta2VybmVsQGktbG92ZS5zYWt1cmEubmUuanA+IHdyb3RlOgo+ID4gPiA+PiBX
aGVuIGFuIHVuZXhwZWN0ZWQgc3lzdGVtIGV2ZW50IG9jY3VycywgdGhlIGFkbWluaXN0cmF0b3Ig
bWF5IHdhbnQgdG8KPiA+ID4gPj4gaWRlbnRpZnkgd2hpY2ggYXBwbGljYXRpb24gdHJpZ2dlcmVk
IHRoZSBldmVudC4gRm9yIGV4YW1wbGUsCj4gPiA+ID4+IHVuZXhwZWN0ZWQgcHJvY2VzcyB0ZXJt
aW5hdGlvbiBpcyBzdGlsbCBhIHJlYWwgY29uY2VybiBlbm91Z2ggdG8gd3JpdGUKPiA+ID4gPj4g
YXJ0aWNsZXMgbGlrZSBodHRwczovL2FjY2Vzcy5yZWRoYXQuY29tL3NvbHV0aW9ucy8xNjU5OTMg
Lgo+ID4gPiA+Pgo+ID4gPiA+PiBUaGlzIHBhdGNoIGFkZHMgYSByZWNvcmQgd2hpY2ggZW1pdHMg
VE9NT1lPLWxpa2UgdGFzayBoaXN0b3J5Cj4gPiA+ID4+IGluZm9ybWF0aW9uIGludG8gdGhlIGF1
ZGl0IGxvZ3MgZm9yIGJldHRlciB1bmRlcnN0YW5kaW5nIG9mIHVuZXhwZWN0ZWQKPiA+ID4gPj4g
c3lzdGVtIGV2ZW50cy4KPiA+ID4gPj4KPiA+ID4gPj4gdHlwZT1VTktOT1dOWzEzNDBdIG1zZz1h
dWRpdCgxNjkxNzUwNzM4LjI3MToxMDgpOgo+ID4gPiA+PiBoaXN0b3J5PSJuYW1lPXN3YXBwZXIv
MDtwaWQ9MTtzdGFydD0yMDIzMDgxMTE5NDMyOT0+bmFtZT1pbml0O3BpZD0xO3MKPiA+ID4gPj4g
dGFydD0yMDIzMDgxMTE5NDM0Mz0+bmFtZT1zeXN0ZW1kO3BpZD0xO3N0YXJ0PTIwMjMwODExMTk0
NDM5PT5uYW1lPXNzaAo+ID4gPiA+PiBkO3BpZD0zNjYwO3N0YXJ0PTIwMjMwODExMTA0NTA0PT5u
YW1lPXNzaGQ7cGlkPTM3Njc7c3RhcnQ9MjAyMzA4MTExMDQ1Cj4gPiA+ID4+IDM1Igo+ID4gPiA+
Cj4gPiA+ID4gV2hpbGUgSSByZXNwZWN0IHlvdXIgcGVyc2lzdGVuY2UsIHdlJ3ZlIHRhbGtlZCBh
Ym91dCB0aGlzIHF1aXRlIGEgYml0Cj4gPiA+ID4gYWxyZWFkeSBpbiBvdGhlciB0aHJlYWRzLiAg
V2hhdCB5b3UgYXJlIHRyeWluZyB0byBkbyBpcyBhbHJlYWR5Cj4gPiA+ID4gcG9zc2libGUgd2l0
aCBhdWRpdAo+ID4gPgo+ID4gPiBIb3c/Cj4gPgo+ID4gSWYgeW91IGNvbmZpZ3VyZSBhdWRpdCB0
byByZWNvcmQgZXhlYygpIGFuZCBmcmllbmRzIHlvdSBzaG91bGQgaGF2ZSBhCj4gPiBwcm9wZXIg
aGlzdG9yeSBvZiB0aGUgcHJvY2Vzc2VzIHN0YXJ0ZWQgb24gdGhlIHN5c3RlbS4KPgo+IFRoaXMg
aXMgbm90IGEgcHJhY3RpY2FsIHNvbHV0aW9uLiBZZXMsIHRlY2huaWNhbGx5IHRoaXMgY291bGQg
YmUgZG9uZS4gQnV0IGl0Cj4gd291bGQgYmUgYSBodWdlIGJ1cmRlbiBvbiB0aGUgc3lzdGVtIHRv
IGtlZXAgdXAgd2l0aCB0aGlzLiBBbmQgaXQgd291bGQgYnVyeQo+IGV2ZW50cyB5b3UgdHJ1bHkg
d2FudGVkIHRvIHNlZSBlZmZlY3RpdmVseSBEb1MnaW5nIHRoZSBhdWRpdCBzeXN0ZW0uCgpJZiB0
aGUgYXVkaXQgc3Vic3lzdGVtIGNhbid0IGhhbmRsZSB0aGUgbG9hZCwgdGhhdCBpcyBhIHNlcGFy
YXRlIGlzc3VlLgoKLS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxp
c3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


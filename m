Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6991D6F44F7
	for <lists+linux-audit@lfdr.de>; Tue,  2 May 2023 15:27:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683034069;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4YlB7UHy4Sdp2wvn/rq5jewmfA8UxPDf+iYsSk6RThY=;
	b=C6+0MKt2uexOfv+nR1iR10q0SU/DW0ksbX301HUNmG8VV5Q2vPpHo+I4FUPSOXxzIykFHC
	HwlHyv12DIOrEV8SZhLB6tbTSgVrNpFRT0XEopq18tErdbmZPgT7Yt1eOKnvW3zmOUlaIl
	BAgkXGNPDxz74GCyW60nj3ZMgh265wU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-PYW2DQRXO-6hjm6I_zYHXA-1; Tue, 02 May 2023 09:27:47 -0400
X-MC-Unique: PYW2DQRXO-6hjm6I_zYHXA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B8E385A5B1;
	Tue,  2 May 2023 13:27:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E81B63F5E;
	Tue,  2 May 2023 13:27:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 25EF819465A8;
	Tue,  2 May 2023 13:27:40 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 04C4B194658C for <linux-audit@listman.corp.redhat.com>;
 Tue,  2 May 2023 13:27:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DA4032026D3C; Tue,  2 May 2023 13:27:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.22.48.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6CF12026D16;
 Tue,  2 May 2023 13:27:36 +0000 (UTC)
Date: Tue, 2 May 2023 09:27:31 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Daniel Walsh <dwalsh@redhat.com>
Subject: Re: "service auditd start" fails inside a container
Message-ID: <ZFEPw2k8KLcbbO0K@madcap2.tricolour.ca>
References: <CABvEhECpywJRHDW6dFZU8Q3_rCZ0MpG45UQVu8fgH7ENSK37dA@mail.gmail.com>
 <4526563.LvFx2qVVIh@x2>
 <c7d87c7c-f475-eb90-e4ba-8bb13c035488@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c7d87c7c-f475-eb90-e4ba-8bb13c035488@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjAyMy0wNS0wMSAxMTowMSwgRGFuaWVsIFdhbHNoIHdyb3RlOgo+IE9uIDQvMjgvMjMgMTQ6
NDgsIFN0ZXZlIEdydWJiIHdyb3RlOgo+ID4gT24gRnJpZGF5LCBBcHJpbCAyOCwgMjAyMyAzOjU0
OjMyIEFNIEVEVCDmsZ/mnaggd3JvdGU6Cj4gPiA+IE1heSBJIGFzayBpZiBBdWRpdGQgc3VwcG9y
dHMgRG9ja2VyPyBUaGFuayB5b3UKPiA+ID4gaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vYXJj
aGl2ZXMvbGludXgtYXVkaXQvMjAxOC1KdWx5L21zZzAwMDc4Lmh0bWwKPiA+IFRoZXJlIGlzIG5v
IGFjdGl2ZSB3b3JrIHRoYXQgSSBrbm93IG9mIHRvIHB1dCBhdWRpdGQgaW4gYSBjb250YWluZXIu
IEl0J3MKPiA+IGxpYnJhcmllcyBhcmUgdXNlZCBieSBtYW55IGFwcGxpY2F0aW9ucy4gU28sIEkg
ZG9uJ3Qga25vdyB3aGF0IHVzZSBpdCB3b3VsZAo+ID4gYmUgdG8gY29udGFpbmVyaXplIGl0Lgo+
ID4gCj4gPiBBbmQgaWYgeW91IGFyZSBhc2tpbmcgaWYgYXVkaXRkIGNhbiBhdWRpdCBldmVudHMg
aW4gYSBjb250YWluZXIsIEkgdGhpbmsgdGhhdAo+ID4gYW5zd2VyIGlzIGFsc28gbm8uCj4gPiAK
PiA+IC1TdGV2ZQo+IAo+IEkgZG9uJ3QgYmVsaWV2ZSB0aGVyZSBpcyBhbnl0aGluZyB0byBwcmV2
ZW50IGF1ZGl0ZCBmcm9tIHJ1bm5pbmcgd2l0aGluIGEKPiBjb250YWluZXIuwqAgWW91IGNhbiB0
dXJuIHVwIGFuZCBkb3duIHRoZSBjb250YWluZXIgdG8gbWFueSBkaWZmZXJlbnQgbGV2ZWxzCj4g
b3Igc2VjdXJpdHkgc2VwYXJhdGlvbi4gVGhlcmUgd2lsbCBiZSBzb21lIHNlY3VyaXR5IHRoaW5n
cyB0aGF0IG5lZWQgdG8gYmUKPiB0dXJuZWQgb2ZmLgo+IAo+IFJ1bm5pbmcgYSBjb250aWFuZXIg
cHJpdmlsZWdlZCB3aWxsIHR1cm4gb2ZmIGFsbW9zdCBldmVyeXRoaW5nIGZvcm0gYQo+IHNlY3Vy
aXR5IHBlcnNwZWN0aXZlLCBhbmQgdGhlbiBydW5uaW5nIHdpdGggc29tZSBvZiB0aGUgbmFtZXNw
YWNlcyBzaGFyZWQKPiB3aXRoIHRoZSBob3N0Lgo+IAo+IFNvbWV0aGluZyBsaWtlCj4gCj4gcG9k
bWFuIHJ1biAtLXByaXZpbGVnZWQgLS1uZXR3b3JrPWhvc3QgLS1waWQ9aG9zdCAuLi4gYXVkaXRp
bWFnZQo+IAo+IFNob3VsZCB3b3JrLgo+IAo+IExhdGVyIHRpZ2h0ZW5pbmcgdXAgdGhlIHNlY3Vy
aXR5IHNob3VsZCBhbHNvIGJlIHBvc3NpYmxlLCBidXQgeW91IHdvdWxkIG5lZWQKPiB0byBrbm93
IHdoYXQgYXVkaXRkIG5lZWRzIGFjY2VzcyB0by4KPiAKPiBXaXRoIGFsbCB0aGF0IHNhaWQsIEkg
YW0gbm90IHN1cmUgd2hhdCB5b3UgYXJlIHRyeWluZyB0byBhY2hpZXZlIGJ5Cj4gY29udGFpbmVy
aXppbmcgdGhlIGF1ZGl0IGRhZW1vbi4KCkF1ZGl0IGN1cnJlbnRseSByZXF1aXJlcyBhY2Nlc3Mg
dG8gdGhlIHJvb3QgdXNlcnNwYWNlIGFuZCBwaWQKbmFtZXNwYWNlcywgc28gaWYgdGhlIGNvbnRh
aW5lciBzaGFyZXMgdGhvc2Ugd2l0aCB0aGUgaG9zdCwgaXQgc2hvdWxkCnJ1bi4KClRoZXJlIGFy
ZSB3b3JrIGl0ZW1zIHRvIGFkZHJlc3MgdGhpcywgYnV0IHRoZXkgaGF2ZW4ndCBiZWVuIHN0YXJ0
ZWQgaW4KZXJuZXN0IHlldDoKCWh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1hdWRpdC9hdWRpdC1r
ZXJuZWwvaXNzdWVzLzkzCmRlcGVuZGFuY2llczoKCWh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1h
dWRpdC9hdWRpdC1rZXJuZWwvaXNzdWVzLzkwCglodHRwczovL2dpdGh1Yi5jb20vbGludXgtYXVk
aXQvYXVkaXQta2VybmVsL2lzc3Vlcy85MQoJaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LWF1ZGl0
L2F1ZGl0LWtlcm5lbC9pc3N1ZXMvOTIKCWh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1hdWRpdC9h
dWRpdC1rZXJuZWwvaXNzdWVzLzc1CgotIFJHQgoKLS0KUmljaGFyZCBHdXkgQnJpZ2dzIDxyZ2JA
cmVkaGF0LmNvbT4KU3IuIFMvVyBFbmdpbmVlciwgS2VybmVsIFNlY3VyaXR5LCBCYXNlIE9wZXJh
dGluZyBTeXN0ZW1zClJlbW90ZSwgT3R0YXdhLCBSZWQgSGF0IENhbmFkYQpJUkM6IHJnYiwgU3Vu
UmF5Y2VyClZvaWNlOiArMS42NDcuNzc3LjI2MzUsIEludGVybmFsOiAoODEpIDMyNjM1Ci0tCkxp
bnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vbGlz
dG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQK


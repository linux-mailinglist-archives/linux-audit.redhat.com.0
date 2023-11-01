Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E23EA7DDB83
	for <lists+linux-audit@lfdr.de>; Wed,  1 Nov 2023 04:28:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698809327;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jo80wQUFOpzYaD4aHsyiXsVhAl5ykPO94AdVQjPbvl4=;
	b=HoRSnlVmwRpkN0YKbcizrCs5f1VFNu1zP4SnjDxhY3625VYsPD/NFVztJovRGWDEthTOqX
	fjp4U7cq26hAiycnXF1IN1yOq+I8pwXvwi6LLfNSQI0tSuSYJwFHrSb2f2X0AHfxyaozJv
	RTsV+t9UTIkpuAHWVFzL5vSK8msh25s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-sPKHn4ObPgKZBGgUyVblDw-1; Tue, 31 Oct 2023 23:28:43 -0400
X-MC-Unique: sPKHn4ObPgKZBGgUyVblDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AF1A811E82;
	Wed,  1 Nov 2023 03:28:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C7A31121306;
	Wed,  1 Nov 2023 03:28:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 556F819465A0;
	Wed,  1 Nov 2023 03:28:07 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A5C541946586 for <linux-audit@listman.corp.redhat.com>;
 Wed,  1 Nov 2023 03:28:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3F615492BE9; Wed,  1 Nov 2023 03:28:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.16.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10B92492BE0;
 Wed,  1 Nov 2023 03:28:05 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: Linux Audit Mail List
Date: Tue, 31 Oct 2023 23:28:04 -0400
Message-ID: <2307123.ElGaqSPkdT@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhQ41T2aLHChormOzRC_bTyC0_rcLC-v4K=kZaJar36pbg@mail.gmail.com>
References: <2179196.irdbgypaU6@x2>
 <CAHC9VhQ41T2aLHChormOzRC_bTyC0_rcLC-v4K=kZaJar36pbg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sCgpUcnlpbmcgdG8gZ2V0IG9uZSBsYXN0IGVtYWlsIGluIGp1c3QgaW4gY2FzZS4uLgoK
T24gVHVlc2RheSwgT2N0b2JlciAzMSwgMjAyMyA5OjE3OjE3IFBNIEVEVCBQYXVsIE1vb3JlIHdy
b3RlOgo+IE9uIFR1ZSwgT2N0IDMxLCAyMDIzIGF0IDU6MjTigK9QTSBTdGV2ZSBHcnViYiA8c2dy
dWJiQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gSSB0aGluayB0aGUgbGludXgtYXVkaXQgbWFpbCBs
aXN0IHdpbGwgYmUgc2h1dGRvd24gYXQgbWlkbmlnaHQgdG9uaWdodAo+ID4gLi4uCj4gCj4gV2hv
YSwgdGhhdCBzZWVtcyByYXRoZXIgYWJydXB0LCBpcyB0aGUgbWFpbCBzZXJ2ZXIgYmVpbmcgc2h1
dCBkb3duPwo+IE9yIHNvbWV0aGluZyBlbHNlPwoKVGhpcyBtYWlsIGxpc3QgaXMgcnVuIGJ5IGFu
IGFuY2llbnQgdmVyc2lvbiBvZiBtYWlsbWFuLiBJdCBoYXMgbm90IGJlZW4gCnVwZGF0ZWQgaW4g
YSBkZWNhZGUgKG5vIHVwc3RyZWFtIHJlbGVhc2VzKS4gSXQgd2FzIGRlZW1lZCBhIHNlY3VyaXR5
IHJpc2suIEkgCmhhdmUgYmVlbiB3b3JraW5nIGJlaGluZCB0aGUgc2NlbmVzIHRvIHRyeSB0byBr
ZWVwIGl0IGFsaXZlLCBidXQgSSBub3cgd29yayAKaW4gdGhlIEFJIGdyb3VwIC0gbm90IHNlY3Vy
aXR5LiBTbywgSSBoYXZlIG5vIHdheSB0byBrZWVwIHRoaXMgYWxpdmUgZXhjZXB0IApieSBnb29k
IGx1Y2suLi53aGljaCBJIHRoaW5rIHJ1biBpdHMgY291cnNlLiBUaGV5IGdhdmUgbWUgc2V2ZXJh
bCBvcHRpb25zIAp3aGljaCBhbGwgd2VyZSBiYWQuIEkgd2FzIGhvcGluZyBmb3IgYSBkaWZmZXJl
bnQgb3V0Y29tZS4gRm9yIGV4YW1wbGUsIG9uZSAKb3B0aW9uIHdhcyBnb29nbGUgZ3JvdXBzIHdo
aWNoIHdvdWxkIGludm9sdmUgbWUgbWFudWFsbHkgYWRkaW5nIGFueSBuZXcgCnN1YnNjcmliZXIu
IFRoYXQncyBubyBnb29kIGFzIEkgaGF2ZSBubyBpZGVhIHdobyB3YW50cyB0byBzdWJzY3JpYmUu
IFNvcnJ5IApmb3IgdGhlIGluY29udmVuaWVuY2UgZm9sa3MuLi4KCj4gPiBUaGVyZSBhcmUgbWFp
bCBhcmNoaXZlcyBzdWNoIGFzCj4gPiAKPiA+IGh0dHBzOi8vbWFyYy5pbmZvLz9sPWxpbnV4LWF1
ZGl0JnI9MSZ3PTIKPiAKPiBUaGUgbGludXgtYXVkaXRAcmVkaGF0IGxpc3QgaXMgYWxzbyBhcmNo
aXZlZCBvbiBsb3JlLmtlcm5lbC5vcmcsIGEKPiBsaW5rIHRvIHRoZSBhcmNoaXZlIGlzIGJlbG93
Ogo+IAo+ICogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXVkaXQKClllcywgdGhlcmUg
YXJlIHNldmVyYWwgb3RoZXJzIHN1YnNjcmliZWQsIHRvby4KIAo+IElmIHRob3NlIGludGVyZXN0
ZWQgaW4gdXBzdHJlYW0gdXNlcnNwYWNlIGRldmVsb3BtZW50IHdhbnRlZCB0bwo+IG1pZ3JhdGUg
dG8gdGhlIGF1ZGl0QHZnZXIgbGlzdCBJIHNlZSBubyBwcm9ibGVtIHdpdGggdGhhdCwgbGluayBi
ZWxvdzoKPiAKPiAqIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvdmdlci1saXN0cy5odG1sI2F1ZGl0
CgpNYXliZS4gSSBndWVzcyB3ZSdsbCBuZWVkIHRvIGNoYXQgYnkgcHJpdmF0ZSBlbWFpbC4gQnV0
IGlmIHdlIGZpbmQgYSBuZXcgaG9tZSwgCkknbGwgcG9zdCBpdCB0byBteSBwZW9wbGUgcGFnZS4K
Ci1TdGV2ZQoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQu
Y29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVk
aXQK


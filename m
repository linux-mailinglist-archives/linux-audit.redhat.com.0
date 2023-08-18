Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C60780A11
	for <lists+linux-audit@lfdr.de>; Fri, 18 Aug 2023 12:30:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692354621;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=czrpMoltE8Dazp09A37R9TRFhKrHxz4m5CdRDboCorI=;
	b=hn/DknOR8MN4ccIGFC9VbtBcJQnPg5okk3wDHJZObK70Z4QiRsGTdKtn55POjkqmEn+h7P
	QvXAfjOWVtZ6710xNmVALrWw8nIDZXmbkRGsRNHK503qo81TmDDphKWwz1pkaQ/H8mecKt
	2S9+KwUZCw77lL3+FvU6uzPl0uYW81M=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-GV5NduxXOD2HkZeMOcobUw-1; Fri, 18 Aug 2023 06:30:18 -0400
X-MC-Unique: GV5NduxXOD2HkZeMOcobUw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9A192999B3D;
	Fri, 18 Aug 2023 10:30:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F2656403D;
	Fri, 18 Aug 2023 10:30:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 281C51946594;
	Fri, 18 Aug 2023 10:30:06 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DDA3D1946587 for <linux-audit@listman.corp.redhat.com>;
 Fri, 18 Aug 2023 10:30:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AF999C15BAE; Fri, 18 Aug 2023 10:30:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7C88C15BAD
 for <linux-audit@redhat.com>; Fri, 18 Aug 2023 10:30:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AA323C0FCA7
 for <linux-audit@redhat.com>; Fri, 18 Aug 2023 10:30:04 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-f5GI71JtNZWkr9U5RLMRzw-3; Fri, 18 Aug 2023 06:30:02 -0400
X-MC-Unique: f5GI71JtNZWkr9U5RLMRzw-3
Received: from fsav415.sakura.ne.jp (fsav415.sakura.ne.jp [133.242.250.114])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 37IATtGB020408;
 Fri, 18 Aug 2023 19:29:55 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav415.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp);
 Fri, 18 Aug 2023 19:29:55 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 37IATsT5020404
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 18 Aug 2023 19:29:55 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <6957af54-16a2-4c28-56ff-dafe95f4e276@I-love.SAKURA.ne.jp>
Date: Fri, 18 Aug 2023 19:29:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] audit: add task history record
To: Paul Moore <paul@paul-moore.com>
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <CAHC9VhTLQjjQ0QMfBDHYCz9LOAuO=rJWSDEUqPsFE+dowFbN=Q@mail.gmail.com>
 <b06dbdd8-d2f6-b190-5635-948c0a966103@I-love.SAKURA.ne.jp>
 <CAHC9VhSz=3utr_CigGvkMEb6_avJUQq1Ak2smB7neSd76mzjFw@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CAHC9VhSz=3utr_CigGvkMEb6_avJUQq1Ak2smB7neSd76mzjFw@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by www262.sakura.ne.jp id
 37IATtGB020408
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: i-love.sakura.ne.jp
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjAyMy8wOC8xNiAyMjo1MywgUGF1bCBNb29yZSB3cm90ZToKPiBPbiBXZWQsIEF1ZyAxNiwg
MjAyMyBhdCA2OjEw4oCvQU0gVGV0c3VvIEhhbmRhCj4gPHBlbmd1aW4ta2VybmVsQGktbG92ZS5z
YWt1cmEubmUuanA+IHdyb3RlOgo+PiBPbiAyMDIzLzA4LzE2IDM6NDQsIFBhdWwgTW9vcmUgd3Jv
dGU6Cj4+PiBPbiBGcmksIEF1ZyAxMSwgMjAyMyBhdCA2OjU44oCvQU0gVGV0c3VvIEhhbmRhCj4+
PiA8cGVuZ3Vpbi1rZXJuZWxAaS1sb3ZlLnNha3VyYS5uZS5qcD4gd3JvdGU6Cj4+Pj4KPj4+PiBX
aGVuIGFuIHVuZXhwZWN0ZWQgc3lzdGVtIGV2ZW50IG9jY3VycywgdGhlIGFkbWluaXN0cmF0b3Ig
bWF5IHdhbnQgdG8KPj4+PiBpZGVudGlmeSB3aGljaCBhcHBsaWNhdGlvbiB0cmlnZ2VyZWQgdGhl
IGV2ZW50LiBGb3IgZXhhbXBsZSwgdW5leHBlY3RlZAo+Pj4+IHByb2Nlc3MgdGVybWluYXRpb24g
aXMgc3RpbGwgYSByZWFsIGNvbmNlcm4gZW5vdWdoIHRvIHdyaXRlIGFydGljbGVzCj4+Pj4gbGlr
ZSBodHRwczovL2FjY2Vzcy5yZWRoYXQuY29tL3NvbHV0aW9ucy8xNjU5OTMgLgo+Pj4+Cj4+Pj4g
VGhpcyBwYXRjaCBhZGRzIGEgcmVjb3JkIHdoaWNoIGVtaXRzIFRPTU9ZTy1saWtlIHRhc2sgaGlz
dG9yeSBpbmZvcm1hdGlvbgo+Pj4+IGludG8gdGhlIGF1ZGl0IGxvZ3MgZm9yIGJldHRlciB1bmRl
cnN0YW5kaW5nIG9mIHVuZXhwZWN0ZWQgc3lzdGVtIGV2ZW50cy4KPj4+Pgo+Pj4+ICAgdHlwZT1V
TktOT1dOWzEzNDBdIG1zZz1hdWRpdCgxNjkxNzUwNzM4LjI3MToxMDgpOiBoaXN0b3J5PSJuYW1l
PXN3YXBwZXIvMDtwaWQ9MTtzdGFydD0yMDIzMDgxMTE5NDMyOT0+bmFtZT1pbml0O3BpZD0xO3N0
YXJ0PTIwMjMwODExMTk0MzQzPT5uYW1lPXN5c3RlbWQ7cGlkPTE7c3RhcnQ9MjAyMzA4MTExOTQ0
Mzk9Pm5hbWU9c3NoZDtwaWQ9MzY2MDtzdGFydD0yMDIzMDgxMTEwNDUwND0+bmFtZT1zc2hkO3Bp
ZD0zNzY3O3N0YXJ0PTIwMjMwODExMTA0NTM1Igo+Pj4KPj4+IFdoaWxlIEkgcmVzcGVjdCB5b3Vy
IHBlcnNpc3RlbmNlLCB3ZSd2ZSB0YWxrZWQgYWJvdXQgdGhpcyBxdWl0ZSBhIGJpdAo+Pj4gYWxy
ZWFkeSBpbiBvdGhlciB0aHJlYWRzLiAgV2hhdCB5b3UgYXJlIHRyeWluZyB0byBkbyBpcyBhbHJl
YWR5Cj4+PiBwb3NzaWJsZSB3aXRoIGF1ZGl0Cj4+Cj4+IEhvdz8KPiAKPiBJZiB5b3UgY29uZmln
dXJlIGF1ZGl0IHRvIHJlY29yZCBleGVjKCkgYW5kIGZyaWVuZHMgeW91IHNob3VsZCBoYXZlIGEK
PiBwcm9wZXIgaGlzdG9yeSBvZiB0aGUgcHJvY2Vzc2VzIHN0YXJ0ZWQgb24gdGhlIHN5c3RlbS4K
ClRoYXQgaXMgYSAiTm8gTFNNIG1vZHVsZXMgb3RoZXIgdGhhbiBTRUxpbnV4IGlzIG5lZWRlZCBi
ZWNhdXNlIFNFTGludXggY2FuIGRvCmV2ZXJ5dGhpbmciIGFzc2VydGlvbi4gUGVvcGxlIHByb3Bv
c2UgZGlmZmVyZW50IGFwcHJvYWNoZXMvaW1wbGVtZW50YXRpb25zIGJlY2F1c2UKdGhleSBjYW4n
dCBhZmZvcmQgdXRpbGl6aW5nL2NvbmZpZ3VyaW5nIGV4aXN0aW5nIGFwcHJvYWNoZXMvaW1wbGVt
ZW50YXRpb25zLgoKWW91ciBhc3NlcnRpb24gaXMgYSBmYXRhbCBwcm9ibGVtIGZvciBtZXJnaW5n
ICJSZTogW1BBVENIIHYxMyAwMC8xMV0gTFNNOiBUaHJlZSBiYXNpYyBzeXNjYWxscyIKYXQgaHR0
cHM6Ly9sa21sLmtlcm5lbC5vcmcvci9DQUhDOVZoUTR0dGtTTFRCQ3JYTlpTQlIxRlA5VVpfZ1VI
bW8wQlMzN0xDZHlCbVVleUFAbWFpbC5nbWFpbC5jb20gLgoKUGxlYXNlIHBsZWFzZSBhbGxvdyBM
U00gbW9kdWxlcyBsaWtlIGh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3IvNDFkMDMyNzEtZmY4YS05
ODg4LTExZGUtYTdmNTNkYTQ3MzI4QEktbG92ZS5TQUtVUkEubmUuanAKdG8gb2J0YWluIGEgc3Rh
YmxlIExTTSBJRCBpZiB5b3UgZG9uJ3Qgd2FudCB0byBzdXBwb3J0IHNvbWV0aGluZyB0aGF0IHBv
c3NpYmx5IGhhdmUgYW4gYWx0ZXJuYXRpdmUuCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QK
TGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4D6772E6C
	for <lists+linux-audit@lfdr.de>; Mon,  7 Aug 2023 21:03:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691435011;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YYjP96FoEu48KdE+arw8OrCJphjm8sjUxAvFBWbGqVA=;
	b=LS3n8IAuZ8t+h2ZUsDOUb8VTLjkekWMdY8JBA8WtQBJPHRPecXOdFha+F0gohcK2hY9kid
	2bU40gpWnMUK5j8GYp5tci3NNYTFuk6BDQCSqt1Td9/7NhUMq6guQ9wjmOAPlYrWbLzG3w
	x4tWSTgdnsCf2+QLGRQUKTkvlyW8Sf0=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-jdC0ffu3MbOMYUWcwYM57A-1; Mon, 07 Aug 2023 15:03:28 -0400
X-MC-Unique: jdC0ffu3MbOMYUWcwYM57A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFF693C0F672;
	Mon,  7 Aug 2023 19:03:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4952840C2078;
	Mon,  7 Aug 2023 19:03:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7D288194658F;
	Mon,  7 Aug 2023 19:03:25 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 13BB51946586 for <linux-audit@listman.corp.redhat.com>;
 Mon,  7 Aug 2023 19:03:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C1EDE2166B27; Mon,  7 Aug 2023 19:03:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.17.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 536C42166B25;
 Mon,  7 Aug 2023 19:03:23 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, linux-audit@redhat.com
Subject: Re: [PATCH v2] TaskTracker : Simplified thread information tracker.
Date: Mon, 07 Aug 2023 15:03:22 -0400
Message-ID: <2155117.irdbgypaU6@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhSsDTyfae6f0XvYYcCRH590L1ZEqbHSM4UgUCHRGm7X_g@mail.gmail.com>
References: <41d03271-ff8a-9888-11de-a7f53da47328@I-love.SAKURA.ne.jp>
 <CAHC9VhSsDTyfae6f0XvYYcCRH590L1ZEqbHSM4UgUCHRGm7X_g@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uZGF5LCBBdWd1c3QgNywgMjAyMyAyOjUzOjQwIFBNIEVEVCBQYXVsIE1vb3JlIHdyb3Rl
Ogo+IE9uIFN1biwgQXVnIDYsIDIwMjMgYXQgOTowNeKAr0FNIFRldHN1byBIYW5kYQo+IAo+IDxw
ZW5ndWluLWtlcm5lbEBpLWxvdmUuc2FrdXJhLm5lLmpwPiB3cm90ZToKPiA+IFdoZW4gYW4gdW5l
eHBlY3RlZCBzeXN0ZW0gZXZlbnQgb2NjdXJzLCB0aGUgYWRtaW5pc3RyYXRvciBtYXkgd2FudCB0
bwo+ID4gaWRlbnRpZnkgd2hpY2ggYXBwbGljYXRpb24gdHJpZ2dlcmVkIHRoZSBldmVudC4gRm9y
IGV4YW1wbGUsIHVuZXhwZWN0ZWQKPiA+IHByb2Nlc3MgdGVybWluYXRpb24gaXMgc3RpbGwgYSBy
ZWFsIGNvbmNlcm4gZW5vdWdoIHRvIHdyaXRlIGFydGljbGVzCj4gPiBsaWtlIGh0dHBzOi8vYWNj
ZXNzLnJlZGhhdC5jb20vc29sdXRpb25zLzE2NTk5MyAuIFRhc2tUcmFja2VyIGlzIGEKPiA+IHRy
aXZpYWwgTFNNIG1vZHVsZSB3aGljaCBlbWl0cyBUT01PWU8tbGlrZSBpbmZvcm1hdGlvbiBpbnRv
IHRoZSBhdWRpdAo+ID4gbG9ncyBmb3IgYmV0dGVyIHVuZGVyc3RhbmRpbmcgb2YgdW5leHBlY3Rl
ZCBzeXN0ZW0gZXZlbnRzLgo+IAo+IEhlbHAgbWUgdW5kZXJzdGFuZCB3aHkgYWxsIG9mIHRoaXMg
aW5mb3JtYXRpb24gaXNuJ3QgYWxyZWFkeSBhdmFpbGFibGUKPiB2aWEgc29tZSBjb21iaW5hdGlv
biBvZiBBdWRpdCBhbmQgVE9NT1lPLCBvciBzaW1wbHkgYXVkaXQgaXRzZWxmPwoKVXN1YWxseSB3
aGVuIHlvdSB3YW50IHRoaXMga2luZCBvZiBpbmZvcm1hdGlvbiwgeW91IGFyZSBpbnZlc3RpZ2F0
aW5nIGFuIAppbmNpZGVudC4gWW91IHdvdWxkbid0IHBsYWNlIGEgc3lzY2FsbCBhdWRpdCBmb3Ig
ZXZlcnkgZXhlY3ZlIGFuZCB0aGVuIApyZWNvbnN0cnVjdCB0aGUgY2FsbCBjaGFpbiBmcm9tIHRo
YXQuIEluIHRoZSBjYXNlIG9mIGxvbmcgcnVubmluZyBkYWVtb25zLCAKdGhlIGluZm9ybWF0aW9u
IGNvdWxkIGhhdmUgYmVlbiByb3RhdGVkIGF3YXkuIEJ1dCB0eXBpY2FsbHkgeW91IHdhbnQgdG8g
c2VlIAp3aGF0IHRoZSBlbnRyeSBwb2ludCBpcy4gQSBzdWRkZW4gc2hlbGwgZnJvbSBiaW5kIHdv
dWxkIGJlIHN1c3BpY2lvdXMgd2hpbGUgYSAKc2hlbGwgZnJvbSBzc2hkIGlzIG5vdC4KCi1TdGV2
ZQoKPiBJbiB0aGUgY2FzZSBvZiBhbiBhdWRpdC1vbmx5IGRlc2lnbiB5b3Ugd291bGQgbGlrZWx5
IG5lZWQgdG8gZG8gc29tZQo+IHByb2Nlc3Npbmcgb2YgdGhlIGF1ZGl0IGxvZyB0byBkZXRlcm1p
bmUgdGhlIGZ1bGwgaGlzdG9yaWNhbCBwcm9jZXNzCj4gdHJlZSBvZiB0aGUgcHJvY2VzcyBiZWlu
ZyBraWxsZWQsIGJ1dCBhbGwgb2YgdGhlIGluZm9ybWF0aW9uIHNob3VsZCBiZQo+IHRoZXJlIGlm
IHlvdSBjb25maWd1cmUgYXVkaXQgcHJvcGVybHkuICBJJ20gbGVzcyBmYW1pbGlhciB3aXRoIFRP
TU9ZTywKPiBidXQgeW91ciBjb21tZW50IGFib3V0IHRoaXMgTFNNIHJlY29yZGluZyAiVE9NT1lP
LWxpa2UiIGluZm9ybWF0aW9uCj4gbWFrZXMgbWUgYmVsaWV2ZSB0aGF0IFRPTU9ZTyBhbHJlYWR5
IHJlY29yZHMgdGhpcyBpbmZvcm1hdGlvbi4KCgoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlz
dApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXVkaXQK


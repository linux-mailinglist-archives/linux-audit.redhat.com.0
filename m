Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8868677398D
	for <lists+linux-audit@lfdr.de>; Tue,  8 Aug 2023 12:07:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691489258;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ticOuYqi8nJyrtlUrjHBojVeI9N8IKYkZJg6cpi0qeU=;
	b=YK40BdYR4KuXvrAPWlR/R/gr8cxRqWIoeU10ll2tC7M6TrdY3T6vfhIKYU6tYMVbjcFbKq
	oG5vDTelTOnBqqxVC2XllBsWSaVK1rT9tj9Tdj3oZZKIOjJy5tMB1SsCIPsfOgnFgUUiRn
	QXOKY8CBE/vssC6XB25713eSf3qMtrc=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-5BGkgwKLPuG3c96T66NC1g-1; Tue, 08 Aug 2023 06:07:35 -0400
X-MC-Unique: 5BGkgwKLPuG3c96T66NC1g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 044E42A59558;
	Tue,  8 Aug 2023 10:07:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C221E492C18;
	Tue,  8 Aug 2023 10:07:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3F4351946595;
	Tue,  8 Aug 2023 10:07:23 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DA8E01946586 for <linux-audit@listman.corp.redhat.com>;
 Tue,  8 Aug 2023 10:07:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9FC46400D700; Tue,  8 Aug 2023 10:07:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9803A40C6F53
 for <linux-audit@redhat.com>; Tue,  8 Aug 2023 10:07:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B8381C0E0CF
 for <linux-audit@redhat.com>; Tue,  8 Aug 2023 10:07:21 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-ATmcY1bJNn67kWy2Wm391A-1; Tue, 08 Aug 2023 06:07:16 -0400
X-MC-Unique: ATmcY1bJNn67kWy2Wm391A-1
Received: from fsav414.sakura.ne.jp (fsav414.sakura.ne.jp [133.242.250.113])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 378A7BCl055363;
 Tue, 8 Aug 2023 19:07:11 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav414.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav414.sakura.ne.jp);
 Tue, 08 Aug 2023 19:07:11 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav414.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 378A7BmK055360
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 8 Aug 2023 19:07:11 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <6f3a90b9-b210-512a-f74a-6003aebf5c30@I-love.SAKURA.ne.jp>
Date: Tue, 8 Aug 2023 19:07:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] TaskTracker : Simplified thread information tracker.
To: Paul Moore <paul@paul-moore.com>, Steve Grubb <sgrubb@redhat.com>
References: <41d03271-ff8a-9888-11de-a7f53da47328@I-love.SAKURA.ne.jp>
 <CAHC9VhSsDTyfae6f0XvYYcCRH590L1ZEqbHSM4UgUCHRGm7X_g@mail.gmail.com>
 <2155117.irdbgypaU6@x2>
 <CAHC9VhRG2aX-_ye7ZRWpZkR7rq8Op7RUVS3cMtxhF8t1bdw5oQ@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CAHC9VhRG2aX-_ye7ZRWpZkR7rq8Op7RUVS3cMtxhF8t1bdw5oQ@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by www262.sakura.ne.jp id
 378A7BCl055363
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
Cc: audit@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: i-love.sakura.ne.jp
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjAyMy8wOC8wOCA1OjEzLCBQYXVsIE1vb3JlIHdyb3RlOgo+IE9uIE1vbiwgQXVnIDcsIDIw
MjMgYXQgMzowM+KAr1BNIFN0ZXZlIEdydWJiIDxzZ3J1YmJAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+
IE9uIE1vbmRheSwgQXVndXN0IDcsIDIwMjMgMjo1Mzo0MCBQTSBFRFQgUGF1bCBNb29yZSB3cm90
ZToKPj4+IE9uIFN1biwgQXVnIDYsIDIwMjMgYXQgOTowNeKAr0FNIFRldHN1byBIYW5kYQo+Pj4K
Pj4+IDxwZW5ndWluLWtlcm5lbEBpLWxvdmUuc2FrdXJhLm5lLmpwPiB3cm90ZToKPj4+PiBXaGVu
IGFuIHVuZXhwZWN0ZWQgc3lzdGVtIGV2ZW50IG9jY3VycywgdGhlIGFkbWluaXN0cmF0b3IgbWF5
IHdhbnQgdG8KPj4+PiBpZGVudGlmeSB3aGljaCBhcHBsaWNhdGlvbiB0cmlnZ2VyZWQgdGhlIGV2
ZW50LiBGb3IgZXhhbXBsZSwgdW5leHBlY3RlZAo+Pj4+IHByb2Nlc3MgdGVybWluYXRpb24gaXMg
c3RpbGwgYSByZWFsIGNvbmNlcm4gZW5vdWdoIHRvIHdyaXRlIGFydGljbGVzCj4+Pj4gbGlrZSBo
dHRwczovL2FjY2Vzcy5yZWRoYXQuY29tL3NvbHV0aW9ucy8xNjU5OTMgLiBUYXNrVHJhY2tlciBp
cyBhCj4+Pj4gdHJpdmlhbCBMU00gbW9kdWxlIHdoaWNoIGVtaXRzIFRPTU9ZTy1saWtlIGluZm9y
bWF0aW9uIGludG8gdGhlIGF1ZGl0Cj4+Pj4gbG9ncyBmb3IgYmV0dGVyIHVuZGVyc3RhbmRpbmcg
b2YgdW5leHBlY3RlZCBzeXN0ZW0gZXZlbnRzLgo+Pj4KPj4+IEhlbHAgbWUgdW5kZXJzdGFuZCB3
aHkgYWxsIG9mIHRoaXMgaW5mb3JtYXRpb24gaXNuJ3QgYWxyZWFkeSBhdmFpbGFibGUKPj4+IHZp
YSBzb21lIGNvbWJpbmF0aW9uIG9mIEF1ZGl0IGFuZCBUT01PWU8sIG9yIHNpbXBseSBhdWRpdCBp
dHNlbGY/Cj4+Cj4+IFVzdWFsbHkgd2hlbiB5b3Ugd2FudCB0aGlzIGtpbmQgb2YgaW5mb3JtYXRp
b24sIHlvdSBhcmUgaW52ZXN0aWdhdGluZyBhbgo+PiBpbmNpZGVudC4gWW91IHdvdWxkbid0IHBs
YWNlIGEgc3lzY2FsbCBhdWRpdCBmb3IgZXZlcnkgZXhlY3ZlIGFuZCB0aGVuCj4+IHJlY29uc3Ry
dWN0IHRoZSBjYWxsIGNoYWluIGZyb20gdGhhdC4gSW4gdGhlIGNhc2Ugb2YgbG9uZyBydW5uaW5n
IGRhZW1vbnMsCj4+IHRoZSBpbmZvcm1hdGlvbiBjb3VsZCBoYXZlIGJlZW4gcm90YXRlZCBhd2F5
LiBCdXQgdHlwaWNhbGx5IHlvdSB3YW50IHRvIHNlZQo+PiB3aGF0IHRoZSBlbnRyeSBwb2ludCBp
cy4gQSBzdWRkZW4gc2hlbGwgZnJvbSBiaW5kIHdvdWxkIGJlIHN1c3BpY2lvdXMgd2hpbGUgYQo+
PiBzaGVsbCBmcm9tIHNzaGQgaXMgbm90Lgo+IAo+IE9uY2UgYWdhaW4sIHdoeSBub3QgdXNlIHRo
ZSBleGlzdGluZyBhdWRpdCBhbmQvb3IgVE9NT1lPIGNhcGFiaWxpdGllcy4KPiAKCkNhbid0LCBm
b3IgRmVkb3JhL1JIRUwgZG9lcyBub3QgZW5hYmxlIFRPTU9ZTy4KSSBuZWVkIGEgd2F5IHRoYXQg
Y2FuIGJlIHVzZWQgYnkgUkhFTCB1c2VycyBydW5uaW5nIHdpdGggc2VsaW51eD0wLgoKVGhpcyBo
aXN0b3J5IGluZm9ybWF0aW9uIGlzIGV4cGVjdGVkIHRvIGJlY29tZSBhdmFpbGFibGUgZm9yIHRo
b3NlIHdobwptaWdodCB3YW50IHRvIGludmVzdGlnYXRlIHVuZXhwZWN0ZWQgc3lzdGVtIGV2ZW50
cywgYnV0IHNob3VsZCBub3QgYmVjb21lCnVuY29uZGl0aW9uYWxseSBhdmFpbGFibGUgZm9yIHRo
b3NlIHdobyBkbyBub3Qgd2FudCB0byBibG9hdCBhdWRpdCBsb2dzLgpTd2l0Y2hpbmcgdmlhIGxz
bT10dCBpcyBhIGhhbmR5IHdheSBmb3Igc2F0aXNmeWluZyBib3RoLgoKLS0KTGludXgtYXVkaXQg
bWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhh
dC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=


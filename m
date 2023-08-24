Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E0362787073
	for <lists+linux-audit@lfdr.de>; Thu, 24 Aug 2023 15:40:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692884409;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rP/xoJ67WfnMqIz0glhH5ujqrX9ZT4t35lo3ZxrPQOA=;
	b=fd28rUgEHZy3tMsXFcwmKBAzGokq6LIi39XOsOBiLlmMjfOKjeLW4UCTMsXvCgLHa4d8H7
	SkhqYwv+PRMXO11Yneiqb+BsIzxv+0erkZobXvE+2Zgqg1Ho8urq7UpDonwjpDk0RbIM0q
	gzIfrrki/FSta8aLsXImOZa+zVEajcg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-DgJWVbU3MsmpiHHWnQKJeQ-1; Thu, 24 Aug 2023 09:40:07 -0400
X-MC-Unique: DgJWVbU3MsmpiHHWnQKJeQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A1BE8022E4;
	Thu, 24 Aug 2023 13:39:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83A62492C14;
	Thu, 24 Aug 2023 13:39:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B428C19465A2;
	Thu, 24 Aug 2023 13:39:56 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 850A51946589 for <linux-audit@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 13:39:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5C9C81121319; Thu, 24 Aug 2023 13:39:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54D761121315
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 13:39:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 336A53C0DDBC
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 13:39:50 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-7ZHnodRvPnavVSKA0tp7og-3; Thu, 24 Aug 2023 09:39:48 -0400
X-MC-Unique: 7ZHnodRvPnavVSKA0tp7og-3
Received: from fsav118.sakura.ne.jp (fsav118.sakura.ne.jp [27.133.134.245])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 37ODdgl0045477;
 Thu, 24 Aug 2023 22:39:42 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav118.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp);
 Thu, 24 Aug 2023 22:39:42 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 37ODdgaB045474
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 24 Aug 2023 22:39:42 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <e9c593d9-6369-2987-ce20-5832dbebd027@I-love.SAKURA.ne.jp>
Date: Thu, 24 Aug 2023 22:39:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] audit: add task history record
To: Paul Moore <paul@paul-moore.com>
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
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CAHC9VhTZE2BinivPRLJ9S_21YcmXA6tMdDtAm5w3nk0dbZ0j1w@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by www262.sakura.ne.jp id
 37ODdgl0045477
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: i-love.sakura.ne.jp
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjAyMy8wOC8yNCAyMjozMCwgUGF1bCBNb29yZSB3cm90ZToKPiBPbiBUaHUsIEF1ZyAyNCwg
MjAyMyBhdCA5OjIx4oCvQU0gVGV0c3VvIEhhbmRhCj4gPHBlbmd1aW4ta2VybmVsQGktbG92ZS5z
YWt1cmEubmUuanA+IHdyb3RlOgo+Pgo+PiBPbiAyMDIzLzA4LzIzIDIzOjQ4LCBQYXVsIE1vb3Jl
IHdyb3RlOgo+Pj4gV2UndmUgYWxyZWFkeSBkaXNjdXNzZWQgdGhpcyBib3RoIGZyb20gYSBrZXJu
ZWwgbG9hZCBwZXJzcGVjdGl2ZSAoaXQKPj4+IHNob3VsZCBiZSBhYmxlIHRvIGhhbmRsZSB0aGUg
bG9hZCwgaWYgbm90IHRoYXQgaXMgYSBzZXBhcmF0ZSBwcm9ibGVtCj4+PiB0byBhZGRyZXNzKSBh
cyB3ZWxsIGFzIHRoZSBodW1hbiBwZXJzcGVjdGl2ZSAoaWYgeW91IHdhbnQgYXVkaXRpbmcsCj4+
PiB5b3UgbmVlZCB0byBiZSBhYmxlIHRvIGhhbmRsZSBhdWRpdGluZykuCj4+Cj4+IE5vLiBZb3Ug
aGF2ZW4ndCBzaG93biB1cyBhdWRpdCBydWxlcyB0aGF0IGNhbiBzYXRpc2Z5IHJlcXVpcmVtZW50
cyBzaG93biBiZWxvdy4KPj4KPj4gICAoMSkgQ2F0Y2ggX2FsbF8gcHJvY2VzcyBjcmVhdGlvbnMg
KGJvdGggdmlhIGZvcmsoKS9jbG9uZSgpIHN5c3RlbSBjYWxscyBhbmQKPj4gICAgICAga3RocmVh
ZF9jcmVhdGUoKSBmcm9tIHRoZSBrZXJuZWwpLCBhbmQgZHVwbGljYXRlIHRoZSBoaXN0b3J5IHVw
b24gcHJvY2Vzcwo+PiAgICAgICBjcmVhdGlvbi4KPiAKPiBDcmVhdGUgYW4gYXVkaXQgZmlsdGVy
IHJ1bGUgdG8gcmVjb3JkIHRoZSBzeXNjYWxscyB5b3UgYXJlIGludGVyZXN0ZWQKPiBpbiBsb2dn
aW5nLgoKSSBjYW4ndCBpbnRlcnByZXQgd2hhdCB5b3UgYXJlIHRhbGtpbmcgYWJvdXQuIFBsZWFz
ZSBzaG93IG1lIHVzaW5nIGNvbW1hbmQgbGluZS4KCj4gCj4+ICAgKDIpIENhdGNoIF9hbGxfIGV4
ZWN2ZSgpLCBhbmQgdXBkYXRlIHRoZSBoaXN0b3J5IHVwb24gc3VjY2Vzc2Z1bCBleGVjdmUoKS4K
PiAKPiBDcmVhdGUgYW4gYXVkaXQgZmlsdGVyIHJ1bGUgdG8gcmVjb3JkIHRoZSBzeXNjYWxscyB5
b3UgYXJlIGludGVyZXN0ZWQKPiBpbiBsb2dnaW5nLgo+IAo+PiAgICgzKSBDYXRjaCBfYWxsXyBw
cm9jZXNzIHRlcm1pbmF0aW9ucyAoYm90aCBleGl0KCkvZXhpdF9ncm91cCgpL2tpbGwoKSBzeXN0
ZW0KPj4gICAgICAgY2FsbHMgYW5kIGludGVybmFsIHJlYXNvbnMgc3VjaCBhcyBPT00ga2lsbGVy
KSwgYW5kIGVyYXNlIHRoZSBoaXN0b3J5IHVwb24KPj4gICAgICAgcHJvY2VzcyB0ZXJtaW5hdGlv
bi4KPiAKPiBDcmVhdGUgYW4gYXVkaXQgZmlsdGVyIHJ1bGUgdG8gcmVjb3JkIHRoZSBldmVudHMg
eW91IGFyZSBpbnRlcmVzdGVkIGluCj4gbG9nZ2luZywgaWYgdGhlcmUgaXMgYW4gZXZlbnQgd2hp
Y2ggaXNuJ3QgYmVpbmcgcmVjb3JkZWQgZmVlbCBmcmVlIHRvCj4gc3VibWl0IGEgcGF0Y2ggdG8g
Z2VuZXJhdGUgYW4gYXVkaXQgcmVjb3JkLgo+IAoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0
CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1hdWRpdAo=


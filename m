Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 02757787B71
	for <lists+linux-audit@lfdr.de>; Fri, 25 Aug 2023 00:25:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692915906;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i0Z52j7oyTSf3JkKCGZuSNl2uo17hClt5JyoZPP6Y2M=;
	b=f/xA5Wdd53zM9D2hi+XZQPz3DeaXDFxXIv9C3wPJd064kCBcXSSPKrQUA690UU3NZA/N9l
	fRH+45VYTBuoCrf1a48W6wh8wg3aXmMQ2SC2lcx4HIwOtFLfA6H7/Bl17Hq/OdnGNTWjEQ
	SyRFG90OHLyBT9MA74OBhvwtYZxUA5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-695-FtuNWxnYN_uYNeUBDY4SwA-1; Thu, 24 Aug 2023 18:25:02 -0400
X-MC-Unique: FtuNWxnYN_uYNeUBDY4SwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5CE485CBE2;
	Thu, 24 Aug 2023 22:25:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A6ABA1121319;
	Thu, 24 Aug 2023 22:24:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5393D19465B3;
	Thu, 24 Aug 2023 22:24:53 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E78871946589 for <linux-audit@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 22:24:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 94370140E964; Thu, 24 Aug 2023 22:24:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C274140E962
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 22:24:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65A4E185A78F
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 22:24:51 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-JF2jbyXoMgKkz_kIXQTSfQ-3; Thu, 24 Aug 2023 18:24:48 -0400
X-MC-Unique: JF2jbyXoMgKkz_kIXQTSfQ-3
Received: from fsav118.sakura.ne.jp (fsav118.sakura.ne.jp [27.133.134.245])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 37OMOfJq021925;
 Fri, 25 Aug 2023 07:24:41 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav118.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp);
 Fri, 25 Aug 2023 07:24:41 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 37OMObZj021910
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 25 Aug 2023 07:24:41 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <693f623f-76dd-a709-4916-6d78fe29c9b4@I-love.SAKURA.ne.jp>
Date: Fri, 25 Aug 2023 07:24:35 +0900
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
 <e9c593d9-6369-2987-ce20-5832dbebd027@I-love.SAKURA.ne.jp>
 <e56ed3a6-9d82-a181-bbc7-e322ea47cb98@I-love.SAKURA.ne.jp>
 <CAHC9VhRTVsoMWhP1+j7RcUqy2EiV=Z7W_00h55PE-WezzLg=Ew@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CAHC9VhRTVsoMWhP1+j7RcUqy2EiV=Z7W_00h55PE-WezzLg=Ew@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by www262.sakura.ne.jp id
 37OMOfJq021925
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
Cc: audit@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 linux-audit@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: i-love.sakura.ne.jp
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjAyMy8wOC8yNCAyMzoyNiwgUGF1bCBNb29yZSB3cm90ZToKPiBPbiBUaHUsIEF1ZyAyNCwg
MjAyMyBhdCA5OjQ34oCvQU0gVGV0c3VvIEhhbmRhCj4gPHBlbmd1aW4ta2VybmVsQGktbG92ZS5z
YWt1cmEubmUuanA+IHdyb3RlOgo+PiBPbiAyMDIzLzA4LzI0IDIyOjM5LCBUZXRzdW8gSGFuZGEg
d3JvdGU6Cj4+Pj4+ICAgKDEpIENhdGNoIF9hbGxfIHByb2Nlc3MgY3JlYXRpb25zIChib3RoIHZp
YSBmb3JrKCkvY2xvbmUoKSBzeXN0ZW0gY2FsbHMgYW5kCj4+Pj4+ICAgICAgIGt0aHJlYWRfY3Jl
YXRlKCkgZnJvbSB0aGUga2VybmVsKSwgYW5kIGR1cGxpY2F0ZSB0aGUgaGlzdG9yeSB1cG9uIHBy
b2Nlc3MKPj4+Pj4gICAgICAgY3JlYXRpb24uCj4+Pj4KPj4+PiBDcmVhdGUgYW4gYXVkaXQgZmls
dGVyIHJ1bGUgdG8gcmVjb3JkIHRoZSBzeXNjYWxscyB5b3UgYXJlIGludGVyZXN0ZWQKPj4+PiBp
biBsb2dnaW5nLgo+Pj4KPj4+IEkgY2FuJ3QgaW50ZXJwcmV0IHdoYXQgeW91IGFyZSB0YWxraW5n
IGFib3V0LiBQbGVhc2Ugc2hvdyBtZSB1c2luZyBjb21tYW5kIGxpbmUuCj4+Cj4+IEknbSBub3Qg
aW50ZXJlc3RlZCBpbiBsb2dnaW5nIHRoZSBzeXNjYWxscyBqdXN0IGZvciBtYWludGFpbmluZyBw
cm9jZXNzIGhpc3RvcnkKPj4gaW5mb3JtYXRpb24uCj4gCj4gVGhhdCdzIHVuZm9ydHVuYXRlIGJl
Y2F1c2UgSSdtIG5vdCBpbnRlcmVzdGVkIGluIG1lcmdpbmcgeW91ciBwYXRjaAo+IHdoZW4gd2Ug
YWxyZWFkeSBoYXZlIGFuIGF1ZGl0IGxvZyB3aGljaCBjYW4gYmUgdXNlZCB0byB0cmFjZSBwcm9j
ZXNzCj4gaGlzdG9yeSBpbmZvcm1hdGlvbi4KPiAKCkl0IGlzIHVuZm9ydHVuYXRlIHRoYXQgeW91
IGNvbnRpbnVlIGlnbm9yaW5nIHRoZQoKICBIb3cgY2FuIGF1ZGl0ZCBnZW5lcmF0ZSBsb2dzIHRo
YXQgYXJlIG5vdCB0cmlnZ2VyZWQgdmlhIHN5c2NhbGxzPwoKbGluZS4gSSBrbm93IGhvdyB0byBj
b25maWd1cmUgc3lzY2FsbCBydWxlcyB1c2luZyAiLVMiIG9wdGlvbi4gQnV0IEkgZG8Kbm90IGtu
b3cgaG93IHRvIGNvbmZpZ3VyZSBub24gc3lzY2FsbCBydWxlcyAoc3VjaCBhcyBwcm9jZXNzIGNy
ZWF0aW9uIHZpYQprdGhyZWFkX2NyZWF0ZSgpLCBwcm9jZXNzIHRlcm1pbmF0aW9uIGR1ZSB0byB0
dHkgaGFuZ3VwIG9yIE9PTSBraWxsZXIpLgoKSXQgaXMgdW5mb3J0dW5hdGUgdGhhdCB5b3UgY29u
dGludWUgaWdub3JpbmcgdGhlCgogIFdoYXQgdGhpcyBwYXRjaCBkb2VzIGlzIHRvIGFsbG93IHBl
b3BsZSBkbyBsaWtlCgogICAgcHJpbnRrKCJbJXNdIHNvbWUgbXNnIGNvbWVzIGhlcmVcbiIsIGN1
cnJlbnQtPmNvbW1faGlzdG9yeSk7CgogIGZvciBnaXZpbmcgaGludHMgZm9yIGlkZW50aWZ5aW5n
IGEgcHJvY2VzcyBtb3JlIHByZWNpc2VseS4KICBUaGF0IGlzLCB1c2VycyBvZiB0aGlzIGluZm9y
bWF0aW9uIGlzIG5vdCBsaW1pdGVkIHRvIGF1ZGl0LiBGb3IgZXhhbXBsZSwKICBhbiBMU00gbW9k
dWxlIGNhbiB1c2UgdGhpcyBpbmZvcm1hdGlvbiwgYW4gYXVkaXQgcmVjb3JkIGNhbiB1c2UgdGhp
cwogIGluZm9ybWF0aW9uLCBhIFN5c3RlbVRhcCBzY3JpcHQgY2FuIHVzZSB0aGlzIGluZm9ybWF0
aW9uLCBhbmQgc28gb24uLi4KCmJsb2NrLiBUaGUgbG9ncyBnZW5lcmF0ZWQgdmlhIHN5c3RlbSBj
YWxsIGF1ZGl0aW5nIGlzIGp1c3QgYW4gZXhhbXBsZS4KSSB3YW50IHRvIHVzZSB0aGlzIGluZm9y
bWF0aW9uIGZyb20gZS5nLiBTeXN0ZW1UYXAgc2NyaXB0cywgYnV0IHlvdSBjYXJlCmFib3V0IG9u
bHkgc3lzdGVtIGNhbGwgYXVkaXRpbmcuCgpUaGVyZSBhcmUgY2FzZXMgd2hlcmUgdGhlIGxvZ3Mg
Z2VuZXJhdGVkIHZpYSBzeXN0ZW0gY2FsbCBhdWRpdGluZyBjYW4gc29sdmUKcHJvYmxlbXMuIEJ1
dCB0aGVyZSBhcmUgY2FzZXMgd2UgbmVlZCB0byBob29rIGRpZmZlcmVudCBsb2NhdGlvbnMgdXNp
bmcgZS5nLgpTeXN0ZW1UYXAgc2NyaXB0cyBpbiBvcmRlciB0byBjYXRjaCB0aGUgZXZlbnQuCgpJ
IHJlcGVhdDoKCiAgVGhlIGF1ZGl0ZCBpcyBub3QgY2FwYWJsZSBvZiBnZW5lcmF0aW5nIF9hbGxf
IHJlY29yZHMgbmVlZGVkIGZvciBtYWludGFpbmluZwogIHRoaXMgaW5mb3JtYXRpb24uCgogIFRo
ZSBsb2dzIGdlbmVyYXRlZCB2aWEgc3lzdGVtIGNhbGwgYXVkaXRpbmcgaXMganVzdCBhbiBleGFt
cGxlIHVzZXIKICBvZiB0aGlzIGluZm9ybWF0aW9uLgoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBs
aXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=


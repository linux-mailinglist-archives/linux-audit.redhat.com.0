Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E6169787170
	for <lists+linux-audit@lfdr.de>; Thu, 24 Aug 2023 16:25:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692887124;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VpkBKXiv79FyGSW3zYNO/cjy1NpliOw463S67zMMlG4=;
	b=F4OJ6WARS93k7xpuItb8XqpwAsNu6kkoRPANBTHrMO3omSzPvYx2MOSV5siPGxUW+Exk/l
	QaUy+/951xDecsepL9U2qJ+3KphEHajVx51FXc3Z7iWlFJq9x7VFr0ViRuT19ANxDNlsYQ
	CZ3xjataglBIKnsuBZnVD7afBSNfbgU=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-EWZ5bddRNd6UnS3MaR6BqQ-1; Thu, 24 Aug 2023 10:25:21 -0400
X-MC-Unique: EWZ5bddRNd6UnS3MaR6BqQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF366280AA30;
	Thu, 24 Aug 2023 14:25:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2CC5D492C18;
	Thu, 24 Aug 2023 14:25:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 546B719465A4;
	Thu, 24 Aug 2023 14:24:56 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7138E1946589 for <linux-audit@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 14:24:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4ADAA4A9004; Thu, 24 Aug 2023 14:24:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 431C6492C13
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 14:24:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E7C93C10151
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 14:24:50 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-5q_AK2ZUP2uieok61mmO5Q-1; Thu, 24 Aug 2023 10:24:47 -0400
X-MC-Unique: 5q_AK2ZUP2uieok61mmO5Q-1
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-d77c5414433so1682368276.0
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 07:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887087; x=1693491887;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TQODFugwFQATTifdJpfcBkrlfhOPxEM2aLP5PLkcWDo=;
 b=aZDsFvHu+ojBl2ceptNVTupfEldaBKqtLEv3U3yVgIkn9AEJ6WEtd5Jnvn5udMKSTG
 zoq95poGLPSle0HYjKW6g84yiNKfGj+V+Q4Jx2qm247Rdn9Ttgs+xFtIOccKBEc64GWB
 4nAD1mUPw/IOkvz8wSRkP1s7zS6l5VHIhyu6xNyFo8hsT5i7j6EQN/MzPhdjz39JLWQs
 CgP7gw2BD9eFvM6u+DMLZK5Qs9EwNpXUGPUCiRBxwFRBl2sNWEJbKC/3iDdDzI+NNEyA
 YxqlbOUjpEexUx9GWmifhO6IFAfkPChpQlTfxE4h6QfyqpSnDsPR6Cs2Vcb9u9smiTIO
 gqtw==
X-Gm-Message-State: AOJu0Yy3GjdH7u8nLK/Hsio6zOkGCq4c788B6Mw5RWE6a3SKdHmvIWDK
 ff+52LSN+PLMCc+zfvpLKXnDXfrd5KMPDowxKWLE
X-Google-Smtp-Source: AGHT+IGO907DnsDPiOagBnLztV7nZjRdb6OeAA8Xp9UXE2XLs2sDNyPZoYlNozrqEhuowMRVVcJnxsBFT386TpPDXAk=
X-Received: by 2002:a81:6cd5:0:b0:54f:ba89:225d with SMTP id
 h204-20020a816cd5000000b0054fba89225dmr14608213ywc.19.1692887086898; Thu, 24
 Aug 2023 07:24:46 -0700 (PDT)
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
In-Reply-To: <e9c593d9-6369-2987-ce20-5832dbebd027@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 24 Aug 2023 10:24:35 -0400
Message-ID: <CAHC9VhSUjG7Ap-aRtNrryXkRP5oaGVthkTDVH5o8dbEo9bBgCw@mail.gmail.com>
Subject: Re: [PATCH] audit: add task history record
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
Cc: audit@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 linux-audit@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgOTozOeKAr0FNIFRldHN1byBIYW5kYQo8cGVuZ3Vpbi1r
ZXJuZWxAaS1sb3ZlLnNha3VyYS5uZS5qcD4gd3JvdGU6Cj4gT24gMjAyMy8wOC8yNCAyMjozMCwg
UGF1bCBNb29yZSB3cm90ZToKPiA+IE9uIFRodSwgQXVnIDI0LCAyMDIzIGF0IDk6MjHigK9BTSBU
ZXRzdW8gSGFuZGEKPiA+IDxwZW5ndWluLWtlcm5lbEBpLWxvdmUuc2FrdXJhLm5lLmpwPiB3cm90
ZToKPiA+Pgo+ID4+IE9uIDIwMjMvMDgvMjMgMjM6NDgsIFBhdWwgTW9vcmUgd3JvdGU6Cj4gPj4+
IFdlJ3ZlIGFscmVhZHkgZGlzY3Vzc2VkIHRoaXMgYm90aCBmcm9tIGEga2VybmVsIGxvYWQgcGVy
c3BlY3RpdmUgKGl0Cj4gPj4+IHNob3VsZCBiZSBhYmxlIHRvIGhhbmRsZSB0aGUgbG9hZCwgaWYg
bm90IHRoYXQgaXMgYSBzZXBhcmF0ZSBwcm9ibGVtCj4gPj4+IHRvIGFkZHJlc3MpIGFzIHdlbGwg
YXMgdGhlIGh1bWFuIHBlcnNwZWN0aXZlIChpZiB5b3Ugd2FudCBhdWRpdGluZywKPiA+Pj4geW91
IG5lZWQgdG8gYmUgYWJsZSB0byBoYW5kbGUgYXVkaXRpbmcpLgo+ID4+Cj4gPj4gTm8uIFlvdSBo
YXZlbid0IHNob3duIHVzIGF1ZGl0IHJ1bGVzIHRoYXQgY2FuIHNhdGlzZnkgcmVxdWlyZW1lbnRz
IHNob3duIGJlbG93Lgo+ID4+Cj4gPj4gICAoMSkgQ2F0Y2ggX2FsbF8gcHJvY2VzcyBjcmVhdGlv
bnMgKGJvdGggdmlhIGZvcmsoKS9jbG9uZSgpIHN5c3RlbSBjYWxscyBhbmQKPiA+PiAgICAgICBr
dGhyZWFkX2NyZWF0ZSgpIGZyb20gdGhlIGtlcm5lbCksIGFuZCBkdXBsaWNhdGUgdGhlIGhpc3Rv
cnkgdXBvbiBwcm9jZXNzCj4gPj4gICAgICAgY3JlYXRpb24uCj4gPgo+ID4gQ3JlYXRlIGFuIGF1
ZGl0IGZpbHRlciBydWxlIHRvIHJlY29yZCB0aGUgc3lzY2FsbHMgeW91IGFyZSBpbnRlcmVzdGVk
Cj4gPiBpbiBsb2dnaW5nLgo+Cj4gSSBjYW4ndCBpbnRlcnByZXQgd2hhdCB5b3UgYXJlIHRhbGtp
bmcgYWJvdXQuIFBsZWFzZSBzaG93IG1lIHVzaW5nIGNvbW1hbmQgbGluZS4KCkknbSBzb3JyeSBU
ZXRzdW8sIGJ1dCBJJ3ZlIGFscmVhZHkgc3BlbnQgZmFyIHRvbyBtdWNoIHRpbWUgZ29pbmcgaW4K
Y2lyY2xlcyB3aXRoIHlvdSBvbiB0aGlzIHRvcGljLiAgQXMgeW91IGFyZSBjYXBhYmxlIG9mIHN1
Ym1pdHRpbmcKa2VybmVsIHBhdGNoZXMsIHlvdSBzaG91bGQgYmUgY2FwYWJsZSBvZiByZWFkaW5n
IGEgbWFucGFnZSBhbmQKZXhwZXJpbWVudGluZyB5b3Vyc2VsZjoKCmh0dHBzOi8vbWFuNy5vcmcv
bGludXgvbWFuLXBhZ2VzL21hbjgvYXVkaXRjdGwuOC5odG1sCgotLSAKcGF1bC1tb29yZS5jb20K
Ci0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBz
Oi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQK


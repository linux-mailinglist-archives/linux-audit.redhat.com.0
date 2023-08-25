Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 09640787EA1
	for <lists+linux-audit@lfdr.de>; Fri, 25 Aug 2023 05:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692934621;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ttjg4K4gCCE7i5OmGMVS948Lnfuqtoekfo60KtK7j2A=;
	b=EVH/gsB5TmeCRWM4OqHjNhEI5N4YAQn7goQHLD4M/xhWwVodVeLaa0PfFkoZfUi87hrGhd
	MK26q1x33pTNpiuOctY+VFXbVOr8MDklnTy1qm0IJd3rAfPCJm8aYnM59GWjJqUV751ngM
	I0Lgozh9tVHERi0tBIbVSsl098mQQOM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-695-U-AN-V5-MZm-Fuc-N_FAAQ-1; Thu, 24 Aug 2023 23:36:58 -0400
X-MC-Unique: U-AN-V5-MZm-Fuc-N_FAAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E8D28D40A2;
	Fri, 25 Aug 2023 03:36:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BC7B2166B27;
	Fri, 25 Aug 2023 03:36:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4149619465B5;
	Fri, 25 Aug 2023 03:36:49 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9662B1946589 for <linux-audit@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 03:36:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7483E2166B27; Fri, 25 Aug 2023 03:36:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C9EC2166B26
 for <linux-audit@redhat.com>; Fri, 25 Aug 2023 03:36:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3584485CBE2
 for <linux-audit@redhat.com>; Fri, 25 Aug 2023 03:36:48 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-mvRcwyQrMMeDa1dVX3iZ9w-1; Thu, 24 Aug 2023 23:36:45 -0400
X-MC-Unique: mvRcwyQrMMeDa1dVX3iZ9w-1
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4121130e7afso451091cf.2
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 20:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692934605; x=1693539405;
 h=content-transfer-encoding:mime-version:subject:user-agent
 :references:in-reply-to:message-id:date:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rUP5xV4ps2qb19CJS7E2ogVi3bHciOLw3ERo752H6f4=;
 b=NlR4jBDU3uypy/nJINTMSHnfQNvklQfLgUnG4ppp7xDNdoZyFZRm9nlhRTyX8GKQF7
 yWys/WXKol36vDgrTQ9Mx9APov31aCuOX8DPl3htbT3pGGXWK0IX0ucjNkgj+6mi7VJx
 ViOqe4DMbRKOjC2r1m+aHScXZJwgOF71UqsQbR6ypRpwzv2IXhT2x0SZrH/0rl8pmkDd
 7VMYB1XDevhXW3+JFq5p+XP3M2cflQtnin1RUJCsFRgEexAWLdTPOav0sniicMXXhrL+
 IY0/KCkjidXXgs7x39eK3nphlUqtTfp/qFmuf11vwsRUjXN9u26QU7sjkAY7yScAzKb3
 bjNw==
X-Gm-Message-State: AOJu0YyXElPLWO613NBKdczO/ZoiTpCZkTCv60MHrPBAtFnjvKnOp1Gf
 tfq1QeAR/tlnFO/ThSG68qE9
X-Google-Smtp-Source: AGHT+IHYNhPJ58sUIqtpETLSUxXc8N0Q61g9Y0d/9tuKjWhOTTm6XvEC6DeBRl6ENKTeyR5n3fSarA==
X-Received: by 2002:ac8:5c0c:0:b0:403:66f7:ae66 with SMTP id
 i12-20020ac85c0c000000b0040366f7ae66mr21103271qti.13.1692934605163; 
 Thu, 24 Aug 2023 20:36:45 -0700 (PDT)
Received: from [192.168.7.16] ([70.22.175.108])
 by smtp.gmail.com with ESMTPSA id
 b6-20020ac87fc6000000b00410a91e9f26sm276082qtk.20.2023.08.24.20.36.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Aug 2023 20:36:44 -0700 (PDT)
From: Paul Moore <paul@paul-moore.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Date: Thu, 24 Aug 2023 23:36:43 -0400
Message-ID: <18a2ac400f8.28a4.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <693f623f-76dd-a709-4916-6d78fe29c9b4@I-love.SAKURA.ne.jp>
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
 <693f623f-76dd-a709-4916-6d78fe29c9b4@I-love.SAKURA.ne.jp>
User-Agent: AquaMail/1.46.0 (build: 104600328)
Subject: Re: [PATCH] audit: add task history record
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
 linux-audit@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gQXVndXN0IDI0LCAyMDIzIDY6MjQ6NDcgUE0gVGV0c3VvIEhhbmRhIAo8cGVuZ3Vpbi1rZXJu
ZWxASS1sb3ZlLlNBS1VSQS5uZS5qcD4gd3JvdGU6Cj4gT24gMjAyMy8wOC8yNCAyMzoyNiwgUGF1
bCBNb29yZSB3cm90ZToKPj4gT24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgOTo0N+KAr0FNIFRldHN1
byBIYW5kYQo+PiA8cGVuZ3Vpbi1rZXJuZWxAaS1sb3ZlLnNha3VyYS5uZS5qcD4gd3JvdGU6Cj4+
PiBPbiAyMDIzLzA4LzI0IDIyOjM5LCBUZXRzdW8gSGFuZGEgd3JvdGU6Cj4+Pj4+PiAoMSkgQ2F0
Y2ggX2FsbF8gcHJvY2VzcyBjcmVhdGlvbnMgKGJvdGggdmlhIGZvcmsoKS9jbG9uZSgpIHN5c3Rl
bSBjYWxscyBhbmQKPj4+Pj4+ICBrdGhyZWFkX2NyZWF0ZSgpIGZyb20gdGhlIGtlcm5lbCksIGFu
ZCBkdXBsaWNhdGUgdGhlIGhpc3RvcnkgdXBvbiBwcm9jZXNzCj4+Pj4+PiAgY3JlYXRpb24uCj4+
Pj4+Cj4+Pj4+IENyZWF0ZSBhbiBhdWRpdCBmaWx0ZXIgcnVsZSB0byByZWNvcmQgdGhlIHN5c2Nh
bGxzIHlvdSBhcmUgaW50ZXJlc3RlZAo+Pj4+PiBpbiBsb2dnaW5nLgo+Pj4+Cj4+Pj4gSSBjYW4n
dCBpbnRlcnByZXQgd2hhdCB5b3UgYXJlIHRhbGtpbmcgYWJvdXQuIFBsZWFzZSBzaG93IG1lIHVz
aW5nIGNvbW1hbmQgCj4+Pj4gbGluZS4KPj4+Cj4+PiBJJ20gbm90IGludGVyZXN0ZWQgaW4gbG9n
Z2luZyB0aGUgc3lzY2FsbHMganVzdCBmb3IgbWFpbnRhaW5pbmcgcHJvY2VzcyBoaXN0b3J5Cj4+
PiBpbmZvcm1hdGlvbi4KPj4KPj4gVGhhdCdzIHVuZm9ydHVuYXRlIGJlY2F1c2UgSSdtIG5vdCBp
bnRlcmVzdGVkIGluIG1lcmdpbmcgeW91ciBwYXRjaAo+PiB3aGVuIHdlIGFscmVhZHkgaGF2ZSBh
biBhdWRpdCBsb2cgd2hpY2ggY2FuIGJlIHVzZWQgdG8gdHJhY2UgcHJvY2Vzcwo+PiBoaXN0b3J5
IGluZm9ybWF0aW9uLgo+Cj4gSXQgaXMgdW5mb3J0dW5hdGUgdGhhdCB5b3UgY29udGludWUgaWdu
b3JpbmcgdGhlCj4KPiAgSG93IGNhbiBhdWRpdGQgZ2VuZXJhdGUgbG9ncyB0aGF0IGFyZSBub3Qg
dHJpZ2dlcmVkIHZpYSBzeXNjYWxscz8KPgo+IGxpbmUuIEkga25vdyBob3cgdG8gY29uZmlndXJl
IHN5c2NhbGwgcnVsZXMgdXNpbmcgIi1TIiBvcHRpb24uIEJ1dCBJIGRvCj4gbm90IGtub3cgaG93
IHRvIGNvbmZpZ3VyZSBub24gc3lzY2FsbCBydWxlcyAoc3VjaCBhcyBwcm9jZXNzIGNyZWF0aW9u
IHZpYQo+IGt0aHJlYWRfY3JlYXRlKCksIHByb2Nlc3MgdGVybWluYXRpb24gZHVlIHRvIHR0eSBo
YW5ndXAgb3IgT09NIGtpbGxlcikuCgpBdCB0aGlzIHBvaW50IHlvdSd2ZSBleGhhdXN0ZWQgbXkg
Z29vZHdpbGwgc28gSSB3b3VsZCBzdWdnZXN0IHNpbXBseSAKcmVhZGluZyB0aGUgYXVkaXQgY29k
ZSwgbWFuYWdlcywgYW5kIGV4cGVyaW1lbnRpbmcgd2l0aCBhIHJ1bm5pbmcgc3lzdGVtIHRvIAp1
bmRlcnN0YW5kIGhvdyB0aGluZ3Mgd29yaywgZXNwZWNpYWxseSBmb3Igbm9uLXN5c2NhbGwgcmVj
b3Jkcy4KCj4gSSByZXBlYXQ6Cj4KPiAgVGhlIGF1ZGl0ZCBpcyBub3QgY2FwYWJsZSBvZiBnZW5l
cmF0aW5nIF9hbGxfIHJlY29yZHMgbmVlZGVkIGZvciBtYWludGFpbmluZwo+ICB0aGlzIGluZm9y
bWF0aW9uLgo+Cj4gIFRoZSBsb2dzIGdlbmVyYXRlZCB2aWEgc3lzdGVtIGNhbGwgYXVkaXRpbmcg
aXMganVzdCBhbiBleGFtcGxlIHVzZXIKPiAgb2YgdGhpcyBpbmZvcm1hdGlvbi4KCkkgcmVwZWF0
OgoKSWYgeW91IGZpbmQgYSBwbGFjZSBpbiB0aGUgY29kZSB3aGVyZSB5b3UgYmVsaWV2ZSB0aGVy
ZSBzaG91bGQgYmUgYW4gYXVkaXQgCnJlY29yZCwgcG9zdCBhIHBhdGNoIGFuZCB3ZSBjYW4gZGlz
Y3VzcyBpdC4KCi0tCnBhdWwtbW9vcmUuY29tCgoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlz
dApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXVkaXQK


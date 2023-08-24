Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5148F787652
	for <lists+linux-audit@lfdr.de>; Thu, 24 Aug 2023 19:03:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692896585;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LChWiSknxR7ERxdsBNkcknZzlNVzgUTL5qbp2NaZFfY=;
	b=PxogWSr5DmMladXcFBYdjQW69CRy+M0+7cjwdC0mJnNnNH7Lo+8T3G3uK/uOQKanYOr5bP
	i+1DTE+dX9BGKAEntTnIVljjfCu3yhhJkbo5eNrind99YMQrsX1WkeIyNseW1lZDf9fGQ4
	vhxM5ntKpt2U2EX3r3K61HJ65iCBmLE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-Yn-GUMVoPuiwpi5ZUqEzaw-1; Thu, 24 Aug 2023 13:03:01 -0400
X-MC-Unique: Yn-GUMVoPuiwpi5ZUqEzaw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D036185A78F;
	Thu, 24 Aug 2023 17:02:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD7D92166B26;
	Thu, 24 Aug 2023 17:02:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2E68819465B5;
	Thu, 24 Aug 2023 17:02:48 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 48CEE1946589 for <linux-audit@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 17:02:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1911E1121315; Thu, 24 Aug 2023 17:02:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEBBD1121314
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 17:02:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D08E9108C1C2
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 17:02:41 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-XmjUP07lM5ya3x7glJlfgQ-1; Thu, 24 Aug 2023 13:02:40 -0400
X-MC-Unique: XmjUP07lM5ya3x7glJlfgQ-1
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-58cbdf3eecaso1439567b3.0
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 10:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692896559; x=1693501359;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tTyH2Pa733qbbxMfLrK7WffNUetmNfwdk8lCtzoIDPM=;
 b=LwhaGMpW4CQe1VS/zAGKX2umi8ALIDXplJmI+ban7NzVCpCg0TgCJIipURauRuS2tL
 GHFoE3XKpNJTLZOQeP28DhwS4fDAgfeagDL4xMfL1U/csaxpB6EtaZHCkOSD9k1tNfcr
 9ex9n6BCZq1Nir9FNPPjUiuqwlw0JBQZuRK4vJgME3EoY/vBspP6ogYizeKw0lcf5NHy
 j/W5JZnJwvxrQJSYEZ7cdQnm37DJ4p61myVKwtSJdRb/zg6fcv+fV0i287D6Qj+G8Cw4
 Zy+mYbyNi52gEP6vPeZb+qtRnZJnVpkpUv327VO4yoLljoxDza/oMWBsMPfduCOJtNdk
 6Dcw==
X-Gm-Message-State: AOJu0Yy9TMb3ZIdXI3xo7pLJFHlokeqTWqH1CbaBwtDqbZFW6m6gmnGl
 9mLnb0W2gkR8UCo2BGoSYRK1Hcmn4vxsADSg2giY
X-Google-Smtp-Source: AGHT+IEKQMSprTGuRzIQiuY7eWIp8UKCKLurDjdMEkJhFN0ofdJczicTvl4yRJW4AcdDwtsI7aMxZUpHBq+gyHuAOm0=
X-Received: by 2002:a81:72c1:0:b0:577:606c:284b with SMTP id
 n184-20020a8172c1000000b00577606c284bmr15213438ywc.16.1692896559400; Thu, 24
 Aug 2023 10:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <d2557f88-0cda-b0bf-5c76-7c18912798c9@I-love.SAKURA.ne.jp>
 <CAHC9VhTZE2BinivPRLJ9S_21YcmXA6tMdDtAm5w3nk0dbZ0j1w@mail.gmail.com>
 <5966626.lOV4Wx5bFT@x2>
In-Reply-To: <5966626.lOV4Wx5bFT@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 24 Aug 2023 13:02:28 -0400
Message-ID: <CAHC9VhSa6XDoie1=ZcqDc9=F2q8JGn2bu6-AwMGcZ=HEzBYK5w@mail.gmail.com>
Subject: Re: [PATCH] audit: add task history record
To: Steve Grubb <sgrubb@redhat.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgMTE6NTXigK9BTSBTdGV2ZSBHcnViYiA8c2dydWJiQHJl
ZGhhdC5jb20+IHdyb3RlOgo+IE9uIFRodXJzZGF5LCBBdWd1c3QgMjQsIDIwMjMgOTozMDoxMCBB
TSBFRFQgUGF1bCBNb29yZSB3cm90ZToKPiA+IE9uIFRodSwgQXVnIDI0LCAyMDIzIGF0IDk6MjHi
gK9BTSBUZXRzdW8gSGFuZGEKPiA+IDxwZW5ndWluLWtlcm5lbEBpLWxvdmUuc2FrdXJhLm5lLmpw
PiB3cm90ZToKPiA+ID4gT24gMjAyMy8wOC8yMyAyMzo0OCwgUGF1bCBNb29yZSB3cm90ZToKPiA+
ID4gPiBXZSd2ZSBhbHJlYWR5IGRpc2N1c3NlZCB0aGlzIGJvdGggZnJvbSBhIGtlcm5lbCBsb2Fk
IHBlcnNwZWN0aXZlIChpdAo+ID4gPiA+IHNob3VsZCBiZSBhYmxlIHRvIGhhbmRsZSB0aGUgbG9h
ZCwgaWYgbm90IHRoYXQgaXMgYSBzZXBhcmF0ZSBwcm9ibGVtCj4gPiA+ID4gdG8gYWRkcmVzcykg
YXMgd2VsbCBhcyB0aGUgaHVtYW4gcGVyc3BlY3RpdmUgKGlmIHlvdSB3YW50IGF1ZGl0aW5nLAo+
ID4gPiA+IHlvdSBuZWVkIHRvIGJlIGFibGUgdG8gaGFuZGxlIGF1ZGl0aW5nKS4KPiA+ID4KPiA+
ID4gTm8uIFlvdSBoYXZlbid0IHNob3duIHVzIGF1ZGl0IHJ1bGVzIHRoYXQgY2FuIHNhdGlzZnkg
cmVxdWlyZW1lbnRzIHNob3duCj4gPiA+IGJlbG93Lj4KPiA+ID4gICAoMSkgQ2F0Y2ggX2FsbF8g
cHJvY2VzcyBjcmVhdGlvbnMgKGJvdGggdmlhIGZvcmsoKS9jbG9uZSgpIHN5c3RlbSBjYWxscwo+
ID4gPiAgIGFuZCBrdGhyZWFkX2NyZWF0ZSgpIGZyb20gdGhlIGtlcm5lbCksIGFuZCBkdXBsaWNh
dGUgdGhlIGhpc3RvcnkgdXBvbgo+ID4gPiAgIHByb2Nlc3MgY3JlYXRpb24uCj4gPgo+ID4gQ3Jl
YXRlIGFuIGF1ZGl0IGZpbHRlciBydWxlIHRvIHJlY29yZCB0aGUgc3lzY2FsbHMgeW91IGFyZSBp
bnRlcmVzdGVkCj4gPiBpbiBsb2dnaW5nLgo+ID4KPiA+ID4gICAoMikgQ2F0Y2ggX2FsbF8gZXhl
Y3ZlKCksIGFuZCB1cGRhdGUgdGhlIGhpc3RvcnkgdXBvbiBzdWNjZXNzZnVsCj4gPiA+ICAgZXhl
Y3ZlKCkuCj4gPgo+ID4gQ3JlYXRlIGFuIGF1ZGl0IGZpbHRlciBydWxlIHRvIHJlY29yZCB0aGUg
c3lzY2FsbHMgeW91IGFyZSBpbnRlcmVzdGVkCj4gPiBpbiBsb2dnaW5nLgo+ID4KPiA+ID4gICAo
MykgQ2F0Y2ggX2FsbF8gcHJvY2VzcyB0ZXJtaW5hdGlvbnMgKGJvdGggZXhpdCgpL2V4aXRfZ3Jv
dXAoKS9raWxsKCkKPiA+ID4gICBzeXN0ZW0gIGNhbGxzIGFuZCBpbnRlcm5hbCByZWFzb25zIHN1
Y2ggYXMgT09NIGtpbGxlciksIGFuZCBlcmFzZSB0aGUKPiA+ID4gICBoaXN0b3J5IHVwb24gcHJv
Y2VzcyB0ZXJtaW5hdGlvbi4KPiA+Cj4gPiBDcmVhdGUgYW4gYXVkaXQgZmlsdGVyIHJ1bGUgdG8g
cmVjb3JkIHRoZSBldmVudHMgeW91IGFyZSBpbnRlcmVzdGVkIGluCj4gPiBsb2dnaW5nLCBpZiB0
aGVyZSBpcyBhbiBldmVudCB3aGljaCBpc24ndCBiZWluZyByZWNvcmRlZCBmZWVsIGZyZWUgdG8K
PiA+IHN1Ym1pdCBhIHBhdGNoIHRvIGdlbmVyYXRlIGFuIGF1ZGl0IHJlY29yZC4KPgo+IEknbSBu
b3QgZm9yIG9yIGFnYWluc3QgdGhpcyBvciBhIHNpbWlsYXIgcGF0Y2guCgpUaGF0IHdhcyBteSBp
bXByZXNzaW9uIGJhc2VkIG9uIHlvdXIgcHJldmlvdXMgY29tbWVudHMsIG15IG9waW5pb24KcmVt
YWlucyB1bmNoYW5nZWQuCgo+IFRoZSBpbmZvcm1hdGlvbiBUZXRzdW8gaXMKPiBsb29raW5nIGZv
ciBjYW5ub3QgYmUgcmVjcmVhdGVkIGZyb20gbG9ncy4gV2hhdCBpZiBpdCB3ZXJlIGEgZGFlbW9u
IHRoYXQncwo+IGJlZW4gcnVubmluZyBmb3IgYSB5ZWFyPyBXaXRoIHRoZSBhbW91bnQgb2YgZGF0
YSB5b3UgYXJlIHN1Z2dlc3RpbmcgdG8gbG9nLAo+IGl0IHdvdWxkIGhhdmUgcm90YXRlZCBhd2F5
IG1vbnRocyBhZ28uCgpKdXN0IGJlY2F1c2UgaXQgcmVxdWlyZXMgY29uZmlndXJhdGlvbiBhbmQv
b3IgYSB3YXkgb2YgbWFpbnRhaW5pbmcgbG9nCmluZm9ybWF0aW9uIG92ZXIgYSBwZXJpb2Qgb2Yg
dGltZSBkb2VzIG5vdCBtZWFuIGl0ICJjYW5ub3QiIGJlIGRvbmUuCkkgYWxzbyBzdXNwZWN0IHRo
YXQgdGhlIG51bWJlciBvZiB3ZWxsIG1hbmFnZWQsIGFuZCBwcm9wZXJseSB1cGRhdGVkCnN5c3Rl
bXMgdGhhdCBoYXZlIHVwdGltZXMgb3ZlciBhIHllYXIgYXJlIGluY3JlYXNpbmdseSByYXJlLiAg
WWVzLAp0aGVyZSBhcmUgc3lzdGVtcyB3aXRoIHVwdGltZXMgbXVjaCBsb25nZXIgdGhhbiB0aGF0
LCBidXQgbXkgYXJndW1lbnQKaXMgdGhhdCB0aG9zZSBzeXN0ZW1zIGFyZSBub3QgbGlrZWx5IGFz
IHNlY3VyaXR5IGZvY3VzZWQgYXMgdGhleSBtYXkKY2xhaW0uCgo+IFRvIGxvZyBhbGwgb2YgdGhl
IHN5c3RlbSBjYWxscyB5b3UKPiBtZW50aW9uIHdvdWxkIGJlIGFidXNpdmUgb2YgdGhlIGF1ZGl0
IHN5c3RlbSwgaHVydCBwZXJmb3JtYW5jZSwgd2VhciBvdXQgU1NECj4gZHJpdmVzLCBhbmQgdWx0
aW1hdGVseSBmYWlsLgoKVGhhbmsgeW91IGZvciB5b3VyIGlucHV0LiAgSXQgaXMgY2xlYXIgdGhh
dCB3ZSBoYXZlIGRpZmZlcmVudCBvcGluaW9ucwpvbiB0aGlzIG1hdHRlci4KCj4gVGhlcmUgbWF5
IGJlIG90aGVyIHJlYXNvbnMgeW91IGRvbid0IGxpa2UgdGhlIHBhdGNoIGFuZCB0aGF0J3MgZmlu
ZS4gQnV0Cj4gc2F5aW5nIGl0IGNhbiBiZSBkb25lIGZyb20gdXNlciBzcGFjZSBhZnRlciB0aGUg
ZmFjdCBpcyBub3QgaGVscGZ1bC4KCkFyZ3VhYmx5IHlvdXIgY2hvaWNlIHRvIHJlaW50cm9kdWNl
IGFyZ3VtZW50cyB5b3UgaGF2ZSBwcmV2aW91c2x5Cm1hZGUsIHdoaWNoIEkgYmVsaWV2ZSBJJ3Zl
IGFuc3dlcmVkLCBpcyBhbHNvIG5vdCBoZWxwZnVsLCB5ZXQgaGVyZSB3ZQphcmUuCgotLSAKcGF1
bC1tb29yZS5jb20KCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRo
YXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXVkaXQK


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F397874AC
	for <lists+linux-audit@lfdr.de>; Thu, 24 Aug 2023 17:56:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692892562;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rvvqo7E4kCtK/CUD9gc9v5FbPchJn2wgBsQyjfP+RvU=;
	b=gTAWB42U+xQ58LI1Q4Oq465vihNZh9L55RMDEQ71QQ6F2ShTaC5NP/ihMY0QnhOsD4nd0d
	T1I3QawTVdiIorr1MoVLd08QuxUxjHHMVXHFhCNPW4mclV8wAeHafIxTwMXlOCHufc8y1h
	uWNZKqJXiqxR6I9kEBifLMsb3wl9ehQ=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-eCWX8jlaNhWfK8GhVWGSdA-1; Thu, 24 Aug 2023 11:55:59 -0400
X-MC-Unique: eCWX8jlaNhWfK8GhVWGSdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90C0C3C0FC90;
	Thu, 24 Aug 2023 15:55:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 559356B2B4;
	Thu, 24 Aug 2023 15:55:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DF1D619465B1;
	Thu, 24 Aug 2023 15:55:39 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D451619465A0 for <linux-audit@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 15:55:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C043D40282C; Thu, 24 Aug 2023 15:55:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.18.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EB58492C13;
 Thu, 24 Aug 2023 15:55:32 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: add task history record
Date: Thu, 24 Aug 2023 11:55:31 -0400
Message-ID: <5966626.lOV4Wx5bFT@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhTZE2BinivPRLJ9S_21YcmXA6tMdDtAm5w3nk0dbZ0j1w@mail.gmail.com>
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <d2557f88-0cda-b0bf-5c76-7c18912798c9@I-love.SAKURA.ne.jp>
 <CAHC9VhTZE2BinivPRLJ9S_21YcmXA6tMdDtAm5w3nk0dbZ0j1w@mail.gmail.com>
MIME-Version: 1.0
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gUGF1bCwKCk9uIFRodXJzZGF5LCBBdWd1c3QgMjQsIDIwMjMgOTozMDoxMCBBTSBFRFQg
UGF1bCBNb29yZSB3cm90ZToKPiBPbiBUaHUsIEF1ZyAyNCwgMjAyMyBhdCA5OjIx4oCvQU0gVGV0
c3VvIEhhbmRhCj4gPHBlbmd1aW4ta2VybmVsQGktbG92ZS5zYWt1cmEubmUuanA+IHdyb3RlOgo+
ID4gT24gMjAyMy8wOC8yMyAyMzo0OCwgUGF1bCBNb29yZSB3cm90ZToKPiA+ID4gV2UndmUgYWxy
ZWFkeSBkaXNjdXNzZWQgdGhpcyBib3RoIGZyb20gYSBrZXJuZWwgbG9hZCBwZXJzcGVjdGl2ZSAo
aXQKPiA+ID4gc2hvdWxkIGJlIGFibGUgdG8gaGFuZGxlIHRoZSBsb2FkLCBpZiBub3QgdGhhdCBp
cyBhIHNlcGFyYXRlIHByb2JsZW0KPiA+ID4gdG8gYWRkcmVzcykgYXMgd2VsbCBhcyB0aGUgaHVt
YW4gcGVyc3BlY3RpdmUgKGlmIHlvdSB3YW50IGF1ZGl0aW5nLAo+ID4gPiB5b3UgbmVlZCB0byBi
ZSBhYmxlIHRvIGhhbmRsZSBhdWRpdGluZykuCj4gPiAKPiA+IE5vLiBZb3UgaGF2ZW4ndCBzaG93
biB1cyBhdWRpdCBydWxlcyB0aGF0IGNhbiBzYXRpc2Z5IHJlcXVpcmVtZW50cyBzaG93bgo+ID4g
YmVsb3cuPiAKPiA+ICAgKDEpIENhdGNoIF9hbGxfIHByb2Nlc3MgY3JlYXRpb25zIChib3RoIHZp
YSBmb3JrKCkvY2xvbmUoKSBzeXN0ZW0gY2FsbHMKPiA+ICAgYW5kIGt0aHJlYWRfY3JlYXRlKCkg
ZnJvbSB0aGUga2VybmVsKSwgYW5kIGR1cGxpY2F0ZSB0aGUgaGlzdG9yeSB1cG9uCj4gPiAgIHBy
b2Nlc3MgY3JlYXRpb24uCj4gCj4gQ3JlYXRlIGFuIGF1ZGl0IGZpbHRlciBydWxlIHRvIHJlY29y
ZCB0aGUgc3lzY2FsbHMgeW91IGFyZSBpbnRlcmVzdGVkCj4gaW4gbG9nZ2luZy4KPiAKPiA+ICAg
KDIpIENhdGNoIF9hbGxfIGV4ZWN2ZSgpLCBhbmQgdXBkYXRlIHRoZSBoaXN0b3J5IHVwb24gc3Vj
Y2Vzc2Z1bAo+ID4gICBleGVjdmUoKS4KPiAKPiBDcmVhdGUgYW4gYXVkaXQgZmlsdGVyIHJ1bGUg
dG8gcmVjb3JkIHRoZSBzeXNjYWxscyB5b3UgYXJlIGludGVyZXN0ZWQKPiBpbiBsb2dnaW5nLgo+
IAo+ID4gICAoMykgQ2F0Y2ggX2FsbF8gcHJvY2VzcyB0ZXJtaW5hdGlvbnMgKGJvdGggZXhpdCgp
L2V4aXRfZ3JvdXAoKS9raWxsKCkKPiA+ICAgc3lzdGVtICBjYWxscyBhbmQgaW50ZXJuYWwgcmVh
c29ucyBzdWNoIGFzIE9PTSBraWxsZXIpLCBhbmQgZXJhc2UgdGhlCj4gPiAgIGhpc3RvcnkgdXBv
biBwcm9jZXNzIHRlcm1pbmF0aW9uLgo+IAo+IENyZWF0ZSBhbiBhdWRpdCBmaWx0ZXIgcnVsZSB0
byByZWNvcmQgdGhlIGV2ZW50cyB5b3UgYXJlIGludGVyZXN0ZWQgaW4KPiBsb2dnaW5nLCBpZiB0
aGVyZSBpcyBhbiBldmVudCB3aGljaCBpc24ndCBiZWluZyByZWNvcmRlZCBmZWVsIGZyZWUgdG8K
PiBzdWJtaXQgYSBwYXRjaCB0byBnZW5lcmF0ZSBhbiBhdWRpdCByZWNvcmQuCgpJJ20gbm90IGZv
ciBvciBhZ2FpbnN0IHRoaXMgb3IgYSBzaW1pbGFyIHBhdGNoLiBUaGUgaW5mb3JtYXRpb24gVGV0
c3VvIGlzIApsb29raW5nIGZvciBjYW5ub3QgYmUgcmVjcmVhdGVkIGZyb20gbG9ncy4gV2hhdCBp
ZiBpdCB3ZXJlIGEgZGFlbW9uIHRoYXQncyAKYmVlbiBydW5uaW5nIGZvciBhIHllYXI/IFdpdGgg
dGhlIGFtb3VudCBvZiBkYXRhIHlvdSBhcmUgc3VnZ2VzdGluZyB0byBsb2csIAppdCB3b3VsZCBo
YXZlIHJvdGF0ZWQgYXdheSBtb250aHMgYWdvLiBUbyBsb2cgYWxsIG9mIHRoZSBzeXN0ZW0gY2Fs
bHMgeW91IAptZW50aW9uIHdvdWxkIGJlIGFidXNpdmUgb2YgdGhlIGF1ZGl0IHN5c3RlbSwgaHVy
dCBwZXJmb3JtYW5jZSwgd2VhciBvdXQgU1NEIApkcml2ZXMsIGFuZCB1bHRpbWF0ZWx5IGZhaWwu
CgpUaGVyZSBtYXkgYmUgb3RoZXIgcmVhc29ucyB5b3UgZG9uJ3QgbGlrZSB0aGUgcGF0Y2ggYW5k
IHRoYXQncyBmaW5lLiBCdXQgCnNheWluZyBpdCBjYW4gYmUgZG9uZSBmcm9tIHVzZXIgc3BhY2Ug
YWZ0ZXIgdGhlIGZhY3QgaXMgbm90IGhlbHBmdWwuCgotU3RldmUKCgotLQpMaW51eC1hdWRpdCBt
YWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


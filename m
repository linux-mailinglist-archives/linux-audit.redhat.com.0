Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D94784797
	for <lists+linux-audit@lfdr.de>; Tue, 22 Aug 2023 18:29:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692721796;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dGxLz0OriRqiWcjPwzlxQ+Ri6+jG76qS07y2cfSmE4k=;
	b=g2d3WSWTaX4CI07zfjMCrCRVpVym//n0Plf7SYXLAG6hZvH7U/jnbmMFI2xXnhgxPz7SqX
	HoTBMmrCpSyNpCnBHoDQD2RkwayzYz1PT2sayq86NVc1KhQC2k5XUjn1jnbyjrGYte5cuC
	ForHclIqU5Kb/Sk/HNHS7SptlE76MmE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-MMI6jSItMA6E2htklCTLQw-1; Tue, 22 Aug 2023 12:29:51 -0400
X-MC-Unique: MMI6jSItMA6E2htklCTLQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CB48185A792;
	Tue, 22 Aug 2023 16:29:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45FA56B2AE;
	Tue, 22 Aug 2023 16:29:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CA8431946594;
	Tue, 22 Aug 2023 16:29:30 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1F05A1946587 for <linux-audit@listman.corp.redhat.com>;
 Tue, 22 Aug 2023 16:29:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ED53140282C; Tue, 22 Aug 2023 16:29:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.33.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DD6F492C13;
 Tue, 22 Aug 2023 16:29:29 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: add task history record
Date: Tue, 22 Aug 2023 12:29:28 -0400
Message-ID: <4865772.31r3eYUQgx@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhSz=3utr_CigGvkMEb6_avJUQq1Ak2smB7neSd76mzjFw@mail.gmail.com>
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <b06dbdd8-d2f6-b190-5635-948c0a966103@I-love.SAKURA.ne.jp>
 <CAHC9VhSz=3utr_CigGvkMEb6_avJUQq1Ak2smB7neSd76mzjFw@mail.gmail.com>
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
 linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkbmVzZGF5LCBBdWd1c3QgMTYsIDIwMjMgOTo1Mzo1OCBBTSBFRFQgUGF1bCBNb29yZSB3
cm90ZToKPiBPbiBXZWQsIEF1ZyAxNiwgMjAyMyBhdCA2OjEw4oCvQU0gVGV0c3VvIEhhbmRhCj4g
PHBlbmd1aW4ta2VybmVsQGktbG92ZS5zYWt1cmEubmUuanA+IHdyb3RlOgo+ID4gT24gMjAyMy8w
OC8xNiAzOjQ0LCBQYXVsIE1vb3JlIHdyb3RlOgo+ID4gPiBPbiBGcmksIEF1ZyAxMSwgMjAyMyBh
dCA2OjU44oCvQU0gVGV0c3VvIEhhbmRhCj4gPiA+IDxwZW5ndWluLWtlcm5lbEBpLWxvdmUuc2Fr
dXJhLm5lLmpwPiB3cm90ZToKPiA+ID4+IFdoZW4gYW4gdW5leHBlY3RlZCBzeXN0ZW0gZXZlbnQg
b2NjdXJzLCB0aGUgYWRtaW5pc3RyYXRvciBtYXkgd2FudCB0bwo+ID4gPj4gaWRlbnRpZnkgd2hp
Y2ggYXBwbGljYXRpb24gdHJpZ2dlcmVkIHRoZSBldmVudC4gRm9yIGV4YW1wbGUsCj4gPiA+PiB1
bmV4cGVjdGVkIHByb2Nlc3MgdGVybWluYXRpb24gaXMgc3RpbGwgYSByZWFsIGNvbmNlcm4gZW5v
dWdoIHRvIHdyaXRlCj4gPiA+PiBhcnRpY2xlcyBsaWtlIGh0dHBzOi8vYWNjZXNzLnJlZGhhdC5j
b20vc29sdXRpb25zLzE2NTk5MyAuCj4gPiA+PiAKPiA+ID4+IFRoaXMgcGF0Y2ggYWRkcyBhIHJl
Y29yZCB3aGljaCBlbWl0cyBUT01PWU8tbGlrZSB0YXNrIGhpc3RvcnkKPiA+ID4+IGluZm9ybWF0
aW9uIGludG8gdGhlIGF1ZGl0IGxvZ3MgZm9yIGJldHRlciB1bmRlcnN0YW5kaW5nIG9mIHVuZXhw
ZWN0ZWQKPiA+ID4+IHN5c3RlbSBldmVudHMuCj4gPiA+PiAKPiA+ID4+IHR5cGU9VU5LTk9XTlsx
MzQwXSBtc2c9YXVkaXQoMTY5MTc1MDczOC4yNzE6MTA4KToKPiA+ID4+IGhpc3Rvcnk9Im5hbWU9
c3dhcHBlci8wO3BpZD0xO3N0YXJ0PTIwMjMwODExMTk0MzI5PT5uYW1lPWluaXQ7cGlkPTE7cwo+
ID4gPj4gdGFydD0yMDIzMDgxMTE5NDM0Mz0+bmFtZT1zeXN0ZW1kO3BpZD0xO3N0YXJ0PTIwMjMw
ODExMTk0NDM5PT5uYW1lPXNzaAo+ID4gPj4gZDtwaWQ9MzY2MDtzdGFydD0yMDIzMDgxMTEwNDUw
ND0+bmFtZT1zc2hkO3BpZD0zNzY3O3N0YXJ0PTIwMjMwODExMTA0NQo+ID4gPj4gMzUiCj4gPiA+
Cj4gPiA+IFdoaWxlIEkgcmVzcGVjdCB5b3VyIHBlcnNpc3RlbmNlLCB3ZSd2ZSB0YWxrZWQgYWJv
dXQgdGhpcyBxdWl0ZSBhIGJpdAo+ID4gPiBhbHJlYWR5IGluIG90aGVyIHRocmVhZHMuICBXaGF0
IHlvdSBhcmUgdHJ5aW5nIHRvIGRvIGlzIGFscmVhZHkKPiA+ID4gcG9zc2libGUgd2l0aCBhdWRp
dAo+ID4gCj4gPiBIb3c/Cj4gCj4gSWYgeW91IGNvbmZpZ3VyZSBhdWRpdCB0byByZWNvcmQgZXhl
YygpIGFuZCBmcmllbmRzIHlvdSBzaG91bGQgaGF2ZSBhCj4gcHJvcGVyIGhpc3Rvcnkgb2YgdGhl
IHByb2Nlc3NlcyBzdGFydGVkIG9uIHRoZSBzeXN0ZW0uCgpUaGlzIGlzIG5vdCBhIHByYWN0aWNh
bCBzb2x1dGlvbi4gWWVzLCB0ZWNobmljYWxseSB0aGlzIGNvdWxkIGJlIGRvbmUuIEJ1dCBpdCAK
d291bGQgYmUgYSBodWdlIGJ1cmRlbiBvbiB0aGUgc3lzdGVtIHRvIGtlZXAgdXAgd2l0aCB0aGlz
LiBBbmQgaXQgd291bGQgYnVyeSAKZXZlbnRzIHlvdSB0cnVseSB3YW50ZWQgdG8gc2VlIGVmZmVj
dGl2ZWx5IERvUydpbmcgdGhlIGF1ZGl0IHN5c3RlbS4KCi1TdGV2ZQoKCi0tCkxpbnV4LWF1ZGl0
IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRo
YXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQK


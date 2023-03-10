Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADBB6B520C
	for <lists+linux-audit@lfdr.de>; Fri, 10 Mar 2023 21:38:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678480701;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cwoYtnCao8l2H+lFBw1rGxdGXZRHq+GxVvJEWOqY6v8=;
	b=Cc7uSw07WgV3z/rfs8vmvxhGQiNNbp75t3EqliV6+EWQOrj6tnVal9CVBkGmWNcupjxrFM
	vyx06JBdH6nuTT2a+rGUEk2C7psc3WIPksI2yh0wLBqgc2tTh1pD9OJ9R50SFZih9yS6ks
	6t3wkrpah936TA7kCuCApzLYEu6B5Xs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-RhN-9nXkMTeYB5-kSigjQg-1; Fri, 10 Mar 2023 15:38:17 -0500
X-MC-Unique: RhN-9nXkMTeYB5-kSigjQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 624F63806118;
	Fri, 10 Mar 2023 20:38:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7128C40C1106;
	Fri, 10 Mar 2023 20:38:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E0101946A69;
	Fri, 10 Mar 2023 20:38:07 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5CC291946587 for <linux-audit@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 20:38:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E0137492B05; Fri, 10 Mar 2023 20:37:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.22.48.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26437492B04;
 Fri, 10 Mar 2023 20:37:58 +0000 (UTC)
Date: Fri, 10 Mar 2023 15:37:56 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: Auditing nftables changes
Message-ID: <ZAuVJGYnCljvFNcL@madcap2.tricolour.ca>
References: <CAH6unQK=a54uxPjvdgNrZy57cHwZKw72rJMNeDRxAch8q46dcQ@mail.gmail.com>
 <ZApM8u7iq7mDsdLW@madcap2.tricolour.ca>
 <CAH6unQJgo93VMKHUF7_LtjWu=L8yMEXfhGx6xHSDkATwG-SL=A@mail.gmail.com>
 <4470524.LvFx2qVVIh@x2>
 <CAHC9VhSeZpD3d0kOoNY0_y=RbwA1X1TCF97f8xA8XH9hyzsmvw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSeZpD3d0kOoNY0_y=RbwA1X1TCF97f8xA8XH9hyzsmvw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjAyMy0wMy0xMCAxMTowNCwgUGF1bCBNb29yZSB3cm90ZToKPiBPbiBGcmksIE1hciAxMCwg
MjAyMyBhdCA5OjM24oCvQU0gU3RldmUgR3J1YmIgPHNncnViYkByZWRoYXQuY29tPiB3cm90ZToK
PiA+IE9uIFRodXJzZGF5LCBNYXJjaCA5LCAyMDIzIDU6NTI6MjggUE0gRVNUIEJydWNlIEVscmlj
ayB3cm90ZToKPiA+ID4gQW55d2F5LCBJIHRoaW5rIEkgbmVlZCB0byBzcGVuZCBzb21lIHRpbWUg
cGxheWluZyB1bnRpbCB0aGF0ICJhaGEhIgo+ID4gPiBtb21lbnQgY29tZXMuIEl0J3MgZmVlbHMg
YSBsb3QgY2xvc2VyIHRoYW5rcyB0byBib3RoIG9mIHlvdXIgcmVzcG9uc2VzCj4gPiA+IGFuZCBJ
IHJlYWxseSBhcHByZWNhaXRlIHRoZSB0aW1lIHlvdSd2ZSB0YWtlbiB0byByZWFkIG15IGVtYWls
cyBhbmQKPiA+ID4gcmVzcG9uZCB0byB0aGVtLgo+ID4KPiA+IFRoZXJlIGFyZSBzaW1wbGUgZXZl
bnRzIHdoaWNoIGFyZSBvbmUgbGluZSBhbmQgY29tcG91bmQgZXZlbnRzIHdoaWNoIGFyZQo+ID4g
bXVsdGlwbGUgbGluZXMgLSBjYWxsZWQgcmVjb3Jkcy4gVGhlIHNpbXBsZSBldmVudHMgdGVuZCB0
byBiZSBoYXJkd2lyZWQgYW5kCj4gPiBub3Qgb3B0aW9uYWwuIEZvciBleGFtcGxlLCBsb2dpbnMg
YXJlIGhhcmR3aXJlZDsga2VybmVsIGNvbmZpZyBjaGFuZ2VzIGFyZQo+ID4gaGFyZHdpcmVkOyBh
dXRoZW50aWNhdGlvbiBpcyBoYXJkd2lyZWQuCj4gCj4gUmVhZGluZyBTdGV2ZSdzIHJlc3BvbnNl
IEknbSBub3Qgc3VyZSB3ZSB1c2UgdGhlIHNhbWUgdGVybWlub2xvZ3ksIG9yCj4gcGVyaGFwcyB3
ZSBleHBsYWluIGl0IGEgYml0IGRpZmZlcmVudGx5LiAgUmVnYXJkbGVzcywgaGVyZSBpcyBhIHF1
aWNrCj4gZGVmaW5pdGlvbiB0aGF0IEkgc3RpY2sgdG8gd2hlbiBkaXNjdXNzaW5nIGF1ZGl0Ogo+
IAo+ICJhdWRpdCByZWNvcmQiOiBBbiBhdWRpdCByZWNvcmQgaXMgYSBzaW5nbGUgbGluZSBpbiB0
aGUgYXVkaXQgbG9nIHRoYXQKPiBjb25zaXN0cyBvZiBhIHRpbWVzdGFtcCwgcmVjb3JkIHR5cGUg
KHR5cGU9WFhYKSwgYW5kIGEgc2VyaWVzIG9mCj4gZmllbGRzIHdoaWNoIGFyZSBkZXBlbmRlbnQg
b24gdGhlIHJlY29yZCB0eXBlLiAgSGVyZSBpcyBhbiBleGFtcGxlIG9mCj4gYSBTWVNDQUxMIHJl
Y29yZDoKPiAKPiAgdHlwZT1TWVNDQUxMIG1zZz1hdWRpdCgwMy8xMC8yMDIzIDEwOjU5OjAwLjc5
Nzo1NjMpIDoKPiAgIGFyY2g9eDg2XzY0IHN5c2NhbGw9YnBmIHN1Y2Nlc3M9eWVzIGV4aXQ9MTIg
YTA9QlBGX1BST0dfTE9BRAo+ICAgYTE9MHg3ZmZkZTBlZmM2NTAgYTI9MHg4MCBhMz0weDEzIGl0
ZW1zPTAgcHBpZD0xIHBpZD0yNjgzCj4gICBhdWlkPXJvb3QgdWlkPXJvb3QgZ2lkPXJvb3QgZXVp
ZD1yb290IHN1aWQ9cm9vdCBmc3VpZD1yb290Cj4gICBlZ2lkPXJvb3Qgc2dpZD1yb290IGZzZ2lk
PXJvb3QgdHR5PShub25lKSBzZXM9MTAgY29tbT1zeXN0ZW1kCj4gICBleGU9L3Vzci9saWIvc3lz
dGVtZC9zeXN0ZW1kCj4gICBzdWJqPXVuY29uZmluZWRfdTp1bmNvbmZpbmVkX3I6dW5jb25maW5l
ZF90OnMwLXMwOmMwLmMxMDIzIGtleT0obnVsbCkKPiAKPiAiYXVkaXQgZXZlbnQiOiBBbiBhdWRp
dCBldmVudCBjb25zaXN0cyBvZiBtdWx0aXBsZSBhdWRpdCByZWNvcmRzCj4gZ3JvdXBlZCB0b2dl
dGhlciBieSBhIHNpbmdsZSB0aW1lc3RhbXAuICBTaW5nbGUgcmVjb3JkIGF1ZGl0IGV2ZW50cwo+
IGFyZSBhbGxvd2VkIGFuZCBkbyBleGlzdC4gIFRoZXJlIGlzIG5vIHVwcGVyIGJvdW5kIG9uIHRo
ZSBudW1iZXIgb2YKPiByZWNvcmRzIGFsbG93ZWQgaW4gYW4gYXVkaXQgZXZlbnQuICBIZXJlIGlz
IGFuIGV4YW1wbGUgb2YgYW4gYXVkaXQKPiBldmVudCBjb25zaXN0aW5nIG9mIFBST0NUSVRMRSwg
U1lTQ0FMTCwgYW5kIEJQRiBhdWRpdCByZWNvcmRzOgo+IAo+ICB0eXBlPVBST0NUSVRMRSBtc2c9
YXVkaXQoMDMvMTAvMjAyMyAxMDo1OTowMC43OTc6NTYzKSA6Cj4gICBwcm9jdGl0bGU9KHN5c3Rl
bWQpCj4gIHR5cGU9U1lTQ0FMTCBtc2c9YXVkaXQoMDMvMTAvMjAyMyAxMDo1OTowMC43OTc6NTYz
KSA6Cj4gICBhcmNoPXg4Nl82NCBzeXNjYWxsPWJwZiBzdWNjZXNzPXllcyBleGl0PTEyIGEwPUJQ
Rl9QUk9HX0xPQUQKPiAgIGExPTB4N2ZmZGUwZWZjNjUwIGEyPTB4ODAgYTM9MHgxMyBpdGVtcz0w
IHBwaWQ9MSBwaWQ9MjY4Mwo+ICAgYXVpZD1yb290IHVpZD1yb290IGdpZD1yb290IGV1aWQ9cm9v
dCBzdWlkPXJvb3QgZnN1aWQ9cm9vdAo+ICAgZWdpZD1yb290IHNnaWQ9cm9vdCBmc2dpZD1yb290
IHR0eT0obm9uZSkgc2VzPTEwIGNvbW09c3lzdGVtZAo+ICAgZXhlPS91c3IvbGliL3N5c3RlbWQv
c3lzdGVtZAo+ICAgc3Viaj11bmNvbmZpbmVkX3U6dW5jb25maW5lZF9yOnVuY29uZmluZWRfdDpz
MC1zMDpjMC5jMTAyMyBrZXk9KG51bGwpCj4gIHR5cGU9QlBGIG1zZz1hdWRpdCgwMy8xMC8yMDIz
IDEwOjU5OjAwLjc5Nzo1NjMpIDoKPiAgIHByb2ctaWQ9MTcyIG9wPUxPQUQKCkFuICJhdWRpdCBl
dmVudCIgd2hpY2ggaXMgYSBjb2xsZWN0aW9uIG9mIGF1ZGl0IHJlY29yZHMgd2l0aCB0aGUgc2Ft
ZQp0aW1lc3RhbXAgYW5kIHNlcmlhbCBudW1iZXIgY29ycmVzcG9uZCB0byAqb25lKiBldmVudCBv
ZiBpbnRlcmVzdCB0byB0aGUKYXVkaXQgc3Vic3lzdGVtIGVpdGhlciBkdWUgdG8gaW50ZXJuYWwg
cnVsZXMgb3IgYWRkZWQgYXVkaXQgcnVsZXMgdGhhdAp3aGVuIHRyaWdnZXJlZCByZWNvcmQgYXVk
aXQgaW5mb3JtYXRpb24gaW50byBhIHNldCBvZiByZWNvcmRzIHRoYXQgYXJlCmFsbCByZWxhdGVk
IHRvIGdpdmUgYSBsYXJnZXIgcGljdHVyZSBvZiB0aGUgY2lyY3Vtc3RhbmNlcyBvZiB0aGF0IGV2
ZW50LgpDb25maWd1cmF0aW9uIGNoYW5nZXMsIGJlaW5nIGF1ZGl0IHJ1bGVzIGFkZGVkLCBvciBm
aXJld2FsbCBydWxlcwpjaGFuZ2VzLCBhcmUgaGFyZHdpcmVkLgoKPiBJIGhvcGUgdGhhdCBoZWxw
cy4KPiAKPiAtLQo+IHBhdWwtbW9vcmUuY29tCj4gCgotIFJHQgoKLS0KUmljaGFyZCBHdXkgQnJp
Z2dzIDxyZ2JAcmVkaGF0LmNvbT4KU3IuIFMvVyBFbmdpbmVlciwgS2VybmVsIFNlY3VyaXR5LCBC
YXNlIE9wZXJhdGluZyBTeXN0ZW1zClJlbW90ZSwgT3R0YXdhLCBSZWQgSGF0IENhbmFkYQpJUkM6
IHJnYiwgU3VuUmF5Y2VyClZvaWNlOiArMS42NDcuNzc3LjI2MzUsIEludGVybmFsOiAoODEpIDMy
NjM1Ci0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0
dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQK


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 129F52F6271
	for <lists+linux-audit@lfdr.de>; Thu, 14 Jan 2021 14:54:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-QAf9q8O1P6ifr3cnnpM18Q-1; Thu, 14 Jan 2021 08:54:15 -0500
X-MC-Unique: QAf9q8O1P6ifr3cnnpM18Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DDB1DF8A5;
	Thu, 14 Jan 2021 13:54:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A61210023AF;
	Thu, 14 Jan 2021 13:54:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B88EE180954D;
	Thu, 14 Jan 2021 13:54:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10EDPKMD021547 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 14 Jan 2021 08:25:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 003BB2166B2D; Thu, 14 Jan 2021 13:25:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF88D2166B2C
	for <linux-audit@redhat.com>; Thu, 14 Jan 2021 13:25:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D45D0800140
	for <linux-audit@redhat.com>; Thu, 14 Jan 2021 13:25:16 +0000 (UTC)
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-595-C8TR4nDUNNCjg4kjNCgxeA-1;
	Thu, 14 Jan 2021 08:25:12 -0500
X-MC-Unique: C8TR4nDUNNCjg4kjNCgxeA-1
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
	by Forcepoint Email with ESMTPS id DA21D987A2F7BD8FF1DB;
	Thu, 14 Jan 2021 21:25:07 +0800 (CST)
Received: from kjyxapp03.zte.com.cn ([10.30.12.202])
	by mse-fl2.zte.com.cn with SMTP id 10EDP1bw027505;
	Thu, 14 Jan 2021 21:25:01 +0800 (GMT-8)
	(envelope-from yang.yang29@zte.com.cn)
Received: from mapi (kjyxapp03[null]) by mapi (Zmail) with MAPI id mid14;
	Thu, 14 Jan 2021 21:25:01 +0800 (CST)
Date: Thu, 14 Jan 2021 21:25:01 +0800 (CST)
X-Zmail-TransId: 2b056000462d8a26d952
Message-ID: <202101142125016321850@zte.com.cn>
References: 202101132038409309743@zte.com.cn,
	CAHC9VhSB0UvbQZbCa4hTHgnx23+9FR-P+ytXw547c7YjSH0rMw@mail.gmail.com
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <paul@paul-moore.com>
Subject: =?UTF-8?B?Rnc6UmU6W1JGQyx2MSwxLzFdIGF1ZGl0OiBzcGVlZCB1cCBzeXNjYWxsIHJ1bGUgbWF0Y2ggd2hpbGUgZXhpdGluZyBzeXNjYWxs?=
X-MAIL: mse-fl2.zte.com.cn 10EDP1bw027505
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 14 Jan 2021 08:53:52 -0500
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
	boundary="=====_001_next====="

--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="

--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

UGVyZm9ybWFuY2UgbWVhc3VyZW1lbnRzOgoxLkVudmlyb25tZW50CkNQVTogSW50ZWwoUikgQ29y
ZShUTSkgaTctNjcwMCBDUFUgQCAzLjQwR0h6CkxpbnV4IGtlcm5lbCB2ZXJzaW9uOiA1LjExLXJj
MwpBdWRpdCB2ZXJzaW9uOiAyLjguNAoKMi5SZXN1bHQKMi4xIFN5c2NhbGwgaW52b2NhdGlvbnMK
VGVzdCBtZXRob2Q6IAogICAgUnVuIGNvbW1hbmQgInRvcCIgd2l0aCBuby1sb2FkLgogICAgQWRk
IHJ1bGUgbGlrZXMgImF1ZGl0Y3RsIC1hIGFsd2F5cyxleGl0IC1GIGFyY2g9YjY0IC1TIGNobW9k
IC1GIGF1aWQ9W251bWJlcl0iIHdoaWNoIGRvZXNuJ3QgaGl0IGF1ZGl0LgogICAgVXNlciBjb21t
YW5kICJwZXJmIHJlY29yZCAtUmcgLXQgW3RvcCdzIHBpZF0gc2xlZXAgOTAwIiB0byBnZXQgYXVk
aXRfZmlsdGVyX3N5c2NhbGwoKSdzIGV4ZWN1dGUgdGltZSByYXRpby4KCmF1ZGl0X2ZpbHRlcl9z
eXNjYWxsKCkgcmF0aW8gd2l0aCAxMDAgcnVsZXM6CiAgICBiZWZvcmUgdGhpcyBwYXRjaDogMTUu
MjklLgogICAgYWZ0ZXIgdGhpcyBwYXRjaDogMC44OCUsIHJlZHVjZSAxNC40MSUuCmF1ZGl0X2Zp
bHRlcl9zeXNjYWxsKCkgcmF0aW8gd2l0aCBDSVNbMV0gcnVsZXM6CiAgICBiZWZvcmUgdGhpcyBw
YXRjaDogMi4yNSUuCiAgICBhZnRlciB0aGlzIHBhdGNoOiAxLjkzJSUsIHJlZHVjZSAwLjMyJS4K
YXVkaXRfZmlsdGVyX3N5c2NhbGwoKSByYXRpbyB3aXRoIDEwIHJ1bGVzOgogICAgYmVmb3JlIHRo
aXMgcGF0Y2g6IDAuOTQlLgogICAgYWZ0ZXIgdGhpcyBwYXRjaDogMS4wMiUsIGluY3JlYXNlIDAu
MDglLgphdWRpdF9maWx0ZXJfc3lzY2FsbCgpIHJhdGlvIHdpdGggMSBydWxlOgogICAgYmVmb3Jl
IHRoaXMgcGF0Y2g6IDAuMjAlLgogICAgYWZ0ZXIgdGhpcyBwYXRjaDogMC44OCUsIGluY3JlYXNl
IDAuNjglLgoKQW5hbHlzZToKICAgIFdpdGggMSBydWxlLCBhZnRlciB0aGlzIHBhdGNoIHBlcmZv
cm1hbmNlIGlzIHdvcnNlLCBiZWNhdXNlIG11dGV4X2xvY2soKS9tdXRleF91bmxvY2soKS4gQnV0
IHVzZXIganVzdCBhZGQgb25lIHJ1bGUgc2VlbXMgdW51c3VhbC4KICAgIFdpdGggbW9yZSBydWxl
LCBhZnRlciB0aGlzIHBhdGNoIHBlcmZvcm1hbmNlIGlzIGltcHJvdmVkLlR5cGljYWwgbGlrZXMg
Q0lTIGJlbmNobWFyay4KCjIuMiBSdWxlIGNoYW5nZQpUZXN0IG1ldGhvZDogCiAgICBVc2Uga3Rp
bWVfZ2V0X3JlYWxfdHM2NCgpIGJlZm9yZSBhbmQgYWZ0ZXIgYXVkaXRfYWRkX3J1bGUoKS9hdWRp
dF9kZWxfcnVsZSgpIHRvIGNhbGN1bGF0ZSB0aW1lLgogICAgIEFkZC9kZWxldGUgcnVsZSBieSBj
b21tYW5kICJhdWRpdGN0bCIuIEVhY2ggdGVzdCAxMHRpbWVzIGFuZCBnZXQgYXZlcmFnZS4KCmF1
ZGl0X2FkZF9ydWxlKCkgdGltZToKICAgIGJlZm9yZSB0aGlzIHBhdGNoOiAzMTIwbnMuCiAgICBh
ZnRlciB0aGlzIHBhdGNoOiA3NzgzbnMsIGluY3JlYXNlIDE0OSUuCmF1ZGl0X2RlbF9ydWxlKCkg
dGltZToKICAgIGJlZm9yZSB0aGlzIHBhdGNoOiAzNTEwbnMuCiAgICBhZnRlciB0aGlzIHBhdGNo
OiA4NTE5bnMsIGluY3JlYXNlIDE0MyUuCgpBbmFseXNlOgogICAgQWZ0ZXIgdGhpcyBwYXRjaCwg
cnVsZSBjaGFuZ2UgdGltZSBvYnZpb3VzbHkgaW5jcmVhc2UuIEJ1dCBydWxlIGNoYW5nZSBtYXkg
bm90IGhhcHBlbiB2ZXJ5IG9mdGVuLgoKWzFdIENJUyBpcyBhIExpbnV4IEJlbmNobWFya3MgZm9y
IHNlY3VyaXR5IHB1cnBvc2UuCmh0dHBzOi8vd3d3LmNpc2VjdXJpdHkub3JnL2JlbmNobWFyay9k
aXN0cmlidXRpb25faW5kZXBlbmRlbnRfbGludXgvCgotLS0tLS0tLS0tLS0tLS0tLS1PcmlnaW5h
bCBNYWlsLS0tLS0tLS0tLS0tLS0tLS0tClNlbmRlcjogUGF1bE1vb3JlClRvOiB5YW5nIHlhbmcx
MDE5MjAyMTsKQ0M6IEVyaWMgUGFyaXM7bGludXgtYXVkaXRAcmVkaGF0LmNvbTtsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOwpEYXRlOiAyMDIxLzAxLzEzIDIxOjQ4ClN1YmplY3Q6IFJlOltS
RkMsdjEsMS8xXSBhdWRpdDogc3BlZWQgdXAgc3lzY2FsbCBydWxlIG1hdGNoIHdoaWxlIGV4aXRp
bmcgc3lzY2FsbApPbiBXZWQsIEphbiAxMywgMjAyMSBhdCA3OjM5IEFNIDx5YW5nLnlhbmcyOUB6
dGUuY29tLmNuPiB3cm90ZToKPiBGcm9tIDgyZWJjZjQzNDgxYmUyMWVlM2UzMmVjMTc0OWI0MmY2
NTE3Mzc4ODAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gRnJvbTogWWFuZyBZYW5nIDx5YW5n
LnlhbmcyOUB6dGUuY29tLmNuPgo+IERhdGU6IFdlZCwgMTMgSmFuIDIwMjEgMjA6MTg6MDQgKzA4
MDAKPiBTdWJqZWN0OiBbUEFUQ0hdIFtSRkMsdjEsMS8xXSBzcGVlZCB1cCBzeXNjYWxsIHJ1bGUg
bWF0Y2ggd2hpbGUgZXhpdGluZyBzeXNjYWxsCj4gIElmIHVzZXIgYWRkIGFueSBzeXNjYWxsIHJ1
bGUsIGluIGFsbCBzeXNjYWxscywgYXVkaXRfZmlsdGVyX3N5c2NhbGwoKQo+ICB0cmF2ZXJzZXMg
c3RydWN0IGxpc3RfaGVhZCBhdWRpdF9maWx0ZXJfbGlzdCB0byBmaW5kIG91dCB3aGV0aGVyIGN1
cnJlbnQKPiAgc3lzY2FsbCBtYXRjaCBvbmUgcnVsZS4gVGhpcyB0YWtlcyBvKG4pLCB3aGljaCBp
cyBub3QgbmVjZXNzYXJ5LCBzcGVjaWFsbHkKPiAgZm9yIHVzZXIgd2hvIGFkZCBhIHZlcnkgZmV3
IHN5c2NhbGwgcnVsZXMuIE9uIHRoZSBvdGhlciBoYW5kLCB1c2VyIG1heSBub3QKPiAgbXVjaCBj
YXJlIGFib3V0IHJ1bGUgYWRkL2RlbGV0ZSBzcGVlZC4gU28gZG8gbyhuKSBjYWxjdWxhdGUgYXQg
cnVsZSBjaGFuZ2luZywKPiAgYW5kIGVhc2UgdGhlIGJ1cmRlbiBvZiBhdWRpdF9maWx0ZXJfc3lz
Y2FsbCgpLgo+Cj4gIERlZmluZSBhdWRpdF9zeXNjYWxsW05SX3N5c2NhbGxzXSwgZXZlcnkgZWxl
bWVudCBzdGFuZHMgZm9yIG9uZSBzeXNjYWxsLgo+ICBhdWRpdF9maWx0ZXJfc3lzY2FsbCgpIGNo
ZWNrcyBhdWRpdF9zeXNjYWxsW05SX3N5c2NhbGxzXS4KPiAgYXVkaXRfc3lzY2FsbFtuXSA9PSAw
IGluZGljYXRlcyBubyBydWxlIGF1ZGl0IHN5c2NhbGwgbiwgZG8gYSBxdWljayBleGl0Lgo+ICBh
dWRpdF9zeXNjYWxsW25dID4gMCBpbmRpY2F0ZXMgYXQgbGVhc3Qgb25lIHJ1bGUgYXVkaXQgc3lz
Y2FsbCBuLgo+ICBhdWRpdF9zeXNjYWxsW25dIHVwZGF0ZSB3aGVuIHN5c2NhbGwgcnVsZSBjaGFu
Z2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWFuZyBZYW5nIDx5YW5nLnlhbmcyOUB6dGUuY29tLmNu
Pgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L2F1ZGl0LmggfCAgMiArKwo+ICBrZXJuZWwvYXVkaXQu
YyAgICAgICAgfCAgMiArKwo+ICBrZXJuZWwvYXVkaXRmaWx0ZXIuYyAgfCAxNiArKysrKysrKysr
KysrKysrCj4gIGtlcm5lbC9hdWRpdHNjLmMgICAgICB8ICA5ICsrKysrKysrLQo+ICA0IGZpbGVz
IGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCkJlZm9yZSB3ZSBnbyB0
b28gZmFyIGludG8gYSByZXZpZXcgb2YgdGhpcyBwYXRjaCwgcGxlYXNlIHByb3ZpZGUgc29tZQpw
ZXJmb3JtYW5jZSBtZWFzdXJlbWVudHMgdXNpbmcgYSB2YXJpZXR5IG9mIHJ1bGUgY291bnRzLCBi
b3RoIGNvbW1vbgphbmQgZXh0cmVtZSwgc28gdGhhdCB3ZSBjYW4gYmV0dGVyIGp1ZGdlIHRoZSBi
ZW5lZml0cyBvZiB0aGlzIHBhdGNoLgpUaGUgbWVhc3VyZW1lbnRzIHNob3VsZCBpbmNsdWRlIGJv
dGggdGhlIHJ1bGUgYWRkL2RlbGV0ZSB0aW1lIGRlbHRhcwphcyB3ZWxsIGFzIHRoZSBpbXBhY3Qg
b24gdGhlIHN5c2NhbGwgaW52b2NhdGlvbnMuICBJZiBub24tb2J2aW91cywKcGxlYXNlIGFsc28g
aW5jbHVkZSBob3cgeW91IHBlcmZvcm1lZCB0aGUgbWVhc3VyZW1lbnRzIGFuZCBjYXB0dXJlZAp0
aGUgZGF0YS4KClRoZXNlIGFyZSBnb29kIHRoaW5ncyB0byBpbmNsdWRlIGluIHRoZSBjb21taXQg
ZGVzY3JpcHRpb24gd2hlbgpzdWJtaXR0aW5nIHBhdGNoZXMgZm9jdXNlZCBvbiBpbXByb3Zpbmcg
cGVyZm9ybWFuY2UuCgotLQpwYXVsIG1vb3JlCnd3dy5wYXVsLW1vb3JlLmNvbQ==
--=====_003_next=====--

--=====_001_next=====
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--=====_001_next=====--


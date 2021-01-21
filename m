Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CC0672FED5E
	for <lists+linux-audit@lfdr.de>; Thu, 21 Jan 2021 15:50:21 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-qrrcme5rPJCqArWs4HAdPQ-1; Thu, 21 Jan 2021 09:50:18 -0500
X-MC-Unique: qrrcme5rPJCqArWs4HAdPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE32D8030B4;
	Thu, 21 Jan 2021 14:50:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D589850A8D;
	Thu, 21 Jan 2021 14:50:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B898D180954D;
	Thu, 21 Jan 2021 14:50:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10LEP96t013160 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 21 Jan 2021 09:25:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 92E762026D35; Thu, 21 Jan 2021 14:25:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DF452026D11
	for <linux-audit@redhat.com>; Thu, 21 Jan 2021 14:25:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 136AC811E76
	for <linux-audit@redhat.com>; Thu, 21 Jan 2021 14:25:06 +0000 (UTC)
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-233-5pVzQZl2PDWFKwTqZ_Mdaw-1;
	Thu, 21 Jan 2021 09:25:02 -0500
X-MC-Unique: 5pVzQZl2PDWFKwTqZ_Mdaw-1
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
	by Forcepoint Email with ESMTPS id 63B61F9270F6656A5400;
	Thu, 21 Jan 2021 22:24:58 +0800 (CST)
Received: from kjyxapp01.zte.com.cn ([10.30.12.200])
	by mse-fl1.zte.com.cn with SMTP id 10LEOv9R039556;
	Thu, 21 Jan 2021 22:24:57 +0800 (GMT-8)
	(envelope-from yang.yang29@zte.com.cn)
Received: from mapi (kjyxapp01[null]) by mapi (Zmail) with MAPI id mid14;
	Thu, 21 Jan 2021 22:25:03 +0800 (CST)
Date: Thu, 21 Jan 2021 22:25:03 +0800 (CST)
X-Zmail-TransId: 2b0360098ebf8f786e98
Message-ID: <202101212225030936472@zte.com.cn>
References: 202101142125016321850@zte.com.cn,
	CAHC9VhS=FWMWeTmLHtpVOrjL=j-89cjH+rYktcUZd8rj_fSc=w@mail.gmail.com
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <paul@paul-moore.com>
Subject: =?UTF-8?B?Rnc6UmU6Rnc6UmU6W1JGQyx2MSwxLzFdIGF1ZGl0OiBzcGVlZCB1cCBzeXNjYWxsIHJ1bGUgbWF0Y2ggd2hpbGUgZXhpdGluZyBzeXNjYWxs?=
X-MAIL: mse-fl1.zte.com.cn 10LEOv9R039556
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 21 Jan 2021 09:49:45 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

VGhhbmtzIGZvciByZXBseSwgSSBoYXZlIHNlbnQgYSBuZXcgcGF0Y2ggd2l0aCBiZXR0ZXIgcGVy
Zm9ybWFuY2UuClRoZSB2MSBwYXRjaCB1c2VzIG11dGV4KCkgaXMgbm90IG5lY2Vzc2FyeS4KClBl
cmZvcm1hbmNlIG1lYXN1cmVtZW50czoKMS5FbnZpcm9ubWVudApDUFU6IEludGVsKFIpIENvcmUo
VE0pIGk3LTY3MDAgQ1BVIEAgMy40MEdIegpMaW51eCBrZXJuZWwgdmVyc2lvbjogNS4xMS1yYzMK
QXVkaXQgdmVyc2lvbjogMi44LjQKCjIuUmVzdWx0CjIuMSBTeXNjYWxsIHJhdGlvClJ1biBjb21t
YW5kICJ0b3AiIHdpdGggbm8tbG9hZC4KQWRkIHJ1bGUgbGlrZXMgImF1ZGl0Y3RsIC1hIGFsd2F5
cyxleGl0IC1GIGFyY2g9YjY0IC1TIGNobW9kIC1GIGF1aWQ9W251bWJlcl0iIHdoaWNoIGRvZXNu
J3QgaGl0IGF1ZGl0LgpVc2VyIGNvbW1hbmQgInBlcmYgcmVjb3JkIC1SZyAtdCBbdG9wJ3MgcGlk
XSBzbGVlcCA5MDAiIHRvIGdldCBhdWRpdF9maWx0ZXJfc3lzY2FsbCgpJ3MgZXhlY3V0ZSB0aW1l
IHJhdGlvLgoKYXVkaXRfZmlsdGVyX3N5c2NhbGwoKSByYXRpbyB3aXRoIDEwMCBydWxlczoKYmVm
b3JlIHRoaXMgcGF0Y2g6IDE1LjI5JS4KYWZ0ZXIgdGhpcyBwYXRjaDogMC4xMyUsIHJlZHVjZSAx
NS4xNiUuCgphdWRpdF9maWx0ZXJfc3lzY2FsbCgpIHJhdGlvIHdpdGggQ0lTIHJ1bGVzOgpiZWZv
cmUgdGhpcyBwYXRjaDogMi4yNSUuCmFmdGVyIHRoaXMgcGF0Y2g6IDEuMjElJSwgcmVkdWNlIDEu
MDQlLgoKYXVkaXRfZmlsdGVyX3N5c2NhbGwoKSByYXRpbyB3aXRoIDEwIHJ1bGVzOgpiZWZvcmUg
dGhpcyBwYXRjaDogMC45NCUuCmFmdGVyIHRoaXMgcGF0Y2g6IDAuMTYlLCByZWR1Y2UgMC43OCUu
CgphdWRpdF9maWx0ZXJfc3lzY2FsbCgpIHJhdGlvIHdpdGggMSBydWxlOgpiZWZvcmUgdGhpcyBw
YXRjaDogMC4yMCUuCmFmdGVyIHRoaXMgcGF0Y2g6IDAuMDQlLCByZWR1Y2UgMC4xNiUuCgpBbmFs
eXNlOgpQZXJmb3JtYW5jZSBpcyBiZXR0ZXIgb3ZlcmFsbC4KCjIuMiBTeXNjYWxsIGFic29sdXRl
IHRpbWUKVGVzdCBtZXRob2Q6IApVc2Uga3RpbWVfZ2V0X3JlYWxfdHM2NCgpIGluIGRvX3N5c2Nh
bGxfNjQoKSB0byBjYWxjdWxhdGUgdGltZS4KUnVuIGNvbW1hbmQgImNobW9kIDc3NyAvZXRjL2Zz
dGFiIiB3aXRoIGNob3duIHJ1bGVzLiBFYWNoIHRlc3QgMTB0aW1lcyBhbmQgZ2V0IGF2ZXJhZ2Uu
Cgpkb19zeXNjYWxsXzY0KCkgdGltZSB3aXRoIDEwMCBydWxlczoKYmVmb3JlIHRoaXMgcGF0Y2g6
IDc2MDRucwphZnRlciB0aGlzIHBhdGNoOiA1MjQ0bnMsIHJlZHVjZSAyMzYwbnMuCgpkb19zeXNj
YWxsXzY0KCkgdGltZSB3aXRoIENJUyBydWxlczoKYmVmb3JlIHRoaXMgcGF0Y2g6IDY3MTBucwph
ZnRlciB0aGlzIHBhdGNoOiA3MjkzbnMsIGluY3JlYXNlIDU4M25zLgoKZG9fc3lzY2FsbF82NCgp
IHRpbWUgd2l0aCAxMCBydWxlczoKYmVmb3JlIHRoaXMgcGF0Y2g6IDUzODJucwphZnRlciB0aGlz
IHBhdGNoOiA1MTcxbnMsIHJlZHVjZSAyMTFucy4KCmRvX3N5c2NhbGxfNjQoKSB0aW1lIHdpdGgg
MSBydWxlOgpiZWZvcmUgdGhpcyBwYXRjaDogNTM2MW5zCmFmdGVyIHRoaXMgcGF0Y2g6IDUzNzVu
cywgaW5jcmVhc2UgMTRucy4KCmRvX3N5c2NhbGxfNjQoKSB0aW1lIHdpdGggbm8gcnVsZXM6CmJl
Zm9yZSB0aGlzIHBhdGNoOiA0NzM1bnMKYWZ0ZXIgdGhpcyBwYXRjaDogNDgwNG5zLCBpbmNyZWFz
ZSA2OW5zLgoKQW5hbHlzZToKV2l0aCBhIGZldyBydWxlcywgcGVyZm9ybWFuY2UgaXMgY2xvc2Uu
CldpdGggMTAwIHJ1bGVzLCBwZXJmb3JtYW5jZSBpcyBiZXR0ZXIsIGJ1dCB3aXRoIENJUyBydWxl
cyBwZXJmb3JtYW5jZSByZWdyZXNzLiBNYXliZSByZWxldmFudCB0byBjZXJ0YWluIHN5c2NhbGwu
CgoyLjMgUnVsZSBjaGFuZ2UgYWJzb2x1dGUgdGltZSAKVGVzdCBtZXRob2Q6IApVc2UgY29tbWFu
ZCAidGltZSAuLi4iIHRvIGdldCBydWxlIGNoYW5nZSBhYnNvbHV0ZSB0aW1lLgoKYWRkIDEgcnVs
ZTogdGltZSBhdWRpdGN0bCAtYSBhbHdheXMsZXhpdCAtRiBhcmNoPWI2NCAtUyBjaG1vZCAtRiBh
dWlkPTEKYmVmb3JlIHRoaXMgcGF0Y2g6CiAgICByZWFsICAgIDBtIDAuMDBzCiAgICB1c2VyICAg
IDBtIDAuMDBzCiAgICBzeXMgICAgIDBtIDAuMDBzCmFmdGVyIHRoaXMgcGF0Y2g6IAogICAgcmVh
bCAgICAwbSAwLjAwcwogICAgdXNlciAgICAwbSAwLjAwcwogICAgc3lzICAgICAwbSAwLjAwcwoK
ZGVsZXRlIDEgcnVsZTogdGltZSBhdWRpdGN0bCAtZCBhbHdheXMsZXhpdCAtRiBhcmNoPWI2NCAt
UyBjaG1vZCAtRiBhdWlkPTEKYmVmb3JlIHRoaXMgcGF0Y2g6CiAgICByZWFsICAgIDBtIDAuMDBz
CiAgICB1c2VyICAgIDBtIDAuMDBzCiAgICBzeXMgICAgIDBtIDAuMDBzCmFmdGVyIHRoaXMgcGF0
Y2g6IAogICAgcmVhbCAgICAwbSAwLjAwcwogICAgdXNlciAgICAwbSAwLjAwcwogICAgc3lzICAg
ICAwbSAwLjAwcwoKYWRkIDEwMCBydWxlOiB0aW1lIGF1Z2VucnVsZXMgLS1sb2FkCmJlZm9yZSB0
aGlzIHBhdGNoOgogICAgcmVhbCAgICAwbSAwLjAxcwogICAgdXNlciAgICAwbSAwLjAwcwogICAg
c3lzICAgICAwbSAwLjAwcwphZnRlciB0aGlzIHBhdGNoOiAKICAgIHJlYWwgICAgMG0gMC4wMnMK
ICAgIHVzZXIgICAgMG0gMC4wMXMKICAgIHN5cyAgICAgMG0gMC4wMHMKCmRlbGV0ZSAxMDAgcnVs
ZTp0aW1lIGF1ZGl0Y3RsIC1ECmJlZm9yZSB0aGlzIHBhdGNoOgogICAgcmVhbCAgICAwbSAwLjAw
cwogICAgdXNlciAgICAwbSAwLjAwcwogICAgc3lzICAgICAwbSAwLjAwcwphZnRlciB0aGlzIHBh
dGNoOiAKICAgIHJlYWwgICAgMG0gMC4wMHMKICAgIHVzZXIgICAgMG0gMC4wMHMKICAgIHN5cyAg
ICAgMG0gMC4wMHMKCkFuYWx5c2U6ClBlcmZvcm1hbmNlIHJlZ3Jlc3MgaXMgcmVhbGx5IHRyaXZp
YWwuCgoKLS0tLS0tLS0tLS0tLS0tLS0tT3JpZ2luYWwgTWFpbC0tLS0tLS0tLS0tLS0tLS0tLQpT
ZW5kZXI6IFBhdWxNb29yZQpUbzogeWFuZyB5YW5nMTAxOTIwMjE7CkNDOiBFcmljIFBhcmlzO2xp
bnV4LWF1ZGl0QHJlZGhhdC5jb207bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsKRGF0ZTog
MjAyMS8wMS8xNCAyMzoyMwpTdWJqZWN0OiBSZTpGdzpSZTpbUkZDLHYxLDEvMV0gYXVkaXQ6IHNw
ZWVkIHVwIHN5c2NhbGwgcnVsZSBtYXRjaCB3aGlsZSBleGl0aW5nIHN5c2NhbGwKT24gVGh1LCBK
YW4gMTQsIDIwMjEgYXQgODoyNSBBTSA8eWFuZy55YW5nMjlAenRlLmNvbS5jbj4gd3JvdGU6Cj4K
PiBQZXJmb3JtYW5jZSBtZWFzdXJlbWVudHM6Cj4gMS5FbnZpcm9ubWVudAo+IENQVTogSW50ZWwo
UikgQ29yZShUTSkgaTctNjcwMCBDUFUgQCAzLjQwR0h6Cj4gTGludXgga2VybmVsIHZlcnNpb246
IDUuMTEtcmMzCj4gQXVkaXQgdmVyc2lvbjogMi44LjQKPgo+IDIuUmVzdWx0Cj4gMi4xIFN5c2Nh
bGwgaW52b2NhdGlvbnMKPiBUZXN0IG1ldGhvZDoKPiAgICAgUnVuIGNvbW1hbmQgInRvcCIgd2l0
aCBuby1sb2FkLgo+ICAgICBBZGQgcnVsZSBsaWtlcyAiYXVkaXRjdGwgLWEgYWx3YXlzLGV4aXQg
LUYgYXJjaD1iNjQgLVMgY2htb2QgLUYgYXVpZD1bbnVtYmVyXSIgd2hpY2ggZG9lc24ndCBoaXQg
YXVkaXQuCj4gICAgIFVzZXIgY29tbWFuZCAicGVyZiByZWNvcmQgLVJnIC10IFt0b3AncyBwaWRd
IHNsZWVwIDkwMCIgdG8gZ2V0IGF1ZGl0X2ZpbHRlcl9zeXNjYWxsKCkncyBleGVjdXRlIHRpbWUg
cmF0aW8uCgpUaGFua3MgZm9yIHByb3ZpZGluZyBzb21lIHBlcmZvcm1hbmNlIG51bWJlcnMgc28g
cXVpY2tseSwgYSBmZXcKY29tbWVudHMgYW5kIHRob3VnaHRzIGJlbG93IC4uLgoKPiBhdWRpdF9m
aWx0ZXJfc3lzY2FsbCgpIHJhdGlvIHdpdGggMTAwIHJ1bGVzOgo+ICAgICBiZWZvcmUgdGhpcyBw
YXRjaDogMTUuMjklLgo+ICAgICBhZnRlciB0aGlzIHBhdGNoOiAwLjg4JSwgcmVkdWNlIDE0LjQx
JS4KPiBhdWRpdF9maWx0ZXJfc3lzY2FsbCgpIHJhdGlvIHdpdGggQ0lTWzFdIHJ1bGVzOgo+ICAg
ICBiZWZvcmUgdGhpcyBwYXRjaDogMi4yNSUuCj4gICAgIGFmdGVyIHRoaXMgcGF0Y2g6IDEuOTMl
JSwgcmVkdWNlIDAuMzIlLgo+IGF1ZGl0X2ZpbHRlcl9zeXNjYWxsKCkgcmF0aW8gd2l0aCAxMCBy
dWxlczoKPiAgICAgYmVmb3JlIHRoaXMgcGF0Y2g6IDAuOTQlLgo+ICAgICBhZnRlciB0aGlzIHBh
dGNoOiAxLjAyJSwgaW5jcmVhc2UgMC4wOCUuCj4gYXVkaXRfZmlsdGVyX3N5c2NhbGwoKSByYXRp
byB3aXRoIDEgcnVsZToKPiAgICAgYmVmb3JlIHRoaXMgcGF0Y2g6IDAuMjAlLgo+ICAgICBhZnRl
ciB0aGlzIHBhdGNoOiAwLjg4JSwgaW5jcmVhc2UgMC42OCUuCgpJZiB3ZSBhc3N1bWUgdGhlIENJ
UyBydWxlcyB0byBiZSBhIHJlYXNvbmFibGUgY29tbW9uIGNhc2UgKEknbSBub3QKc3VyZSBpZiB0
aGF0IGlzIGNvcnJlY3Qgb3Igbm90LCBidXQgd2UnbGwgc2tpcCB0aGF0IGRpc2N1c3Npb24gZm9y
Cm5vdyksIHdlIHNlZSBhbiBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCBvZiAwLjMyJSBjb3JyZWN0
LCB5ZXM/ICBXZQphbHNvIHNlZSBhIHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb24gd2l0aCBzbWFsbCBu
dW1iZXIgb2Ygc3lzY2FsbCBydWxlcwp0aGF0IGVxdWFsaXplcyBhYm92ZSB0ZW4gcnVsZXMsIHll
cz8KCk9uIHlvdXIgc3lzdGVtIGNhbiB5b3UgcHJvdmlkZSBzb21lIGFic29sdXRlIG51bWJlcnM/
ICBGb3IgZXhhbXBsZSwKd2hhdCBkb2VzIDAuMzIlIGVxdWF0ZSB0byBpbiB0ZXJtcyBvZiB3YWxs
IGNsb2NrIHRpbWUgZm9yIGEgZ2l2ZW4Kc3lzY2FsbCBpbnZvY2F0aW9uPwoKPiBBbmFseXNlOgo+
ICAgICBXaXRoIDEgcnVsZSwgYWZ0ZXIgdGhpcyBwYXRjaCBwZXJmb3JtYW5jZSBpcyB3b3JzZSwg
YmVjYXVzZSBtdXRleF9sb2NrKCkvbXV0ZXhfdW5sb2NrKCkuIEJ1dCB1c2VyIGp1c3QgYWRkIG9u
ZSBydWxlIHNlZW1zIHVudXN1YWwuCj4gICAgIFdpdGggbW9yZSBydWxlLCBhZnRlciB0aGlzIHBh
dGNoIHBlcmZvcm1hbmNlIGlzIGltcHJvdmVkLlR5cGljYWwgbGlrZXMgQ0lTIGJlbmNobWFyay4K
Pgo+IDIuMiBSdWxlIGNoYW5nZQo+IFRlc3QgbWV0aG9kOgo+ICAgICBVc2Uga3RpbWVfZ2V0X3Jl
YWxfdHM2NCgpIGJlZm9yZSBhbmQgYWZ0ZXIgYXVkaXRfYWRkX3J1bGUoKS9hdWRpdF9kZWxfcnVs
ZSgpIHRvIGNhbGN1bGF0ZSB0aW1lLgo+ICAgICAgQWRkL2RlbGV0ZSBydWxlIGJ5IGNvbW1hbmQg
ImF1ZGl0Y3RsIi4gRWFjaCB0ZXN0IDEwdGltZXMgYW5kIGdldCBhdmVyYWdlLgoKSW4gdGhpcyBj
YXNlIEknbSBsZXNzIGNvbmNlcm5lZCBhYm91dCBtaWNybyBiZW5jaG1hcmtzLCBhbmQgbW9yZQpp
bnRlcmVzdGVkIGluIHRoZSB3YWxsIGNsb2NrIHRpbWUgZGlmZmVyZW5jZSB3aGVuIHJ1bm5pbmcg
YXVkaXRjdGwgdG8KYWRkL3JlbW92ZSBydWxlcy4gIFRoZSBkaWZmZXJlbmNlIGhlcmUgaW4gdGhl
IG1pY3JvIGJlbmNobWFyayBpcyBub3QKdHJpdmlhbCwgYnV0IHdpdGggYSBkZWx0YSBvZiA0fjV1
cyBpdCBpcyBwb3NzaWJsZSB0aGF0IGl0IGlzIGEKc21hbGwoZXIpIHBlcmNlbnRhZ2Ugd2hlbiBj
b21wYXJlZCB0byB0aGUgdG90YWwgdGltZSBzcGVudCBleGVjdXRpbmcKYXVkaXRjdGwuCgo+IGF1
ZGl0X2FkZF9ydWxlKCkgdGltZToKPiAgICAgYmVmb3JlIHRoaXMgcGF0Y2g6IDMxMjBucy4KPiAg
ICAgYWZ0ZXIgdGhpcyBwYXRjaDogNzc4M25zLCBpbmNyZWFzZSAxNDklLgo+IGF1ZGl0X2RlbF9y
dWxlKCkgdGltZToKPiAgICAgYmVmb3JlIHRoaXMgcGF0Y2g6IDM1MTBucy4KPiAgICAgYWZ0ZXIg
dGhpcyBwYXRjaDogODUxOW5zLCBpbmNyZWFzZSAxNDMlLgo+Cj4gQW5hbHlzZToKPiAgICAgQWZ0
ZXIgdGhpcyBwYXRjaCwgcnVsZSBjaGFuZ2UgdGltZSBvYnZpb3VzbHkgaW5jcmVhc2UuIEJ1dCBy
dWxlIGNoYW5nZSBtYXkgbm90IGhhcHBlbiB2ZXJ5IG9mdGVuLgo+Cj4gWzFdIENJUyBpcyBhIExp
bnV4IEJlbmNobWFya3MgZm9yIHNlY3VyaXR5IHB1cnBvc2UuCj4gaHR0cHM6Ly93d3cuY2lzZWN1
cml0eS5vcmcvYmVuY2htYXJrL2Rpc3RyaWJ1dGlvbl9pbmRlcGVuZGVudF9saW51eC8KCi0tCnBh
dWwgbW9vcmUKd3d3LnBhdWwtbW9vcmUuY29t
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


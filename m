Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC0D2DEA03
	for <lists+linux-audit@lfdr.de>; Fri, 18 Dec 2020 21:11:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-aejTMOKwPD252n_4u7ITxg-1; Fri, 18 Dec 2020 15:11:32 -0500
X-MC-Unique: aejTMOKwPD252n_4u7ITxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C718192202D;
	Fri, 18 Dec 2020 20:11:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A45B648A3;
	Fri, 18 Dec 2020 20:11:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2FE0180954D;
	Fri, 18 Dec 2020 20:11:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BIKBAkd012549 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 15:11:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B11EA2166B28; Fri, 18 Dec 2020 20:11:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB97D2166B27
	for <linux-audit@redhat.com>; Fri, 18 Dec 2020 20:11:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46016858EEC
	for <linux-audit@redhat.com>; Fri, 18 Dec 2020 20:11:08 +0000 (UTC)
Received: from aplegw01.jhuapl.edu (aplegw01.jhuapl.edu [128.244.251.168])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-539-7r3VCkUFP9qmcq8FowM-wQ-1; Fri, 18 Dec 2020 15:11:05 -0500
X-MC-Unique: 7r3VCkUFP9qmcq8FowM-wQ-1
Received: from pps.filterd (aplegw01.jhuapl.edu [127.0.0.1])
	by aplegw01.jhuapl.edu (8.16.0.42/8.16.0.42) with SMTP id
	0BIJrxkZ105629; Fri, 18 Dec 2020 15:03:09 -0500
Received: from aplex08.dom1.jhuapl.edu (aplex08.dom1.jhuapl.edu
	[128.244.198.151]) by aplegw01.jhuapl.edu with ESMTP id 35cqskvxmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 18 Dec 2020 15:03:09 -0500
X-CrossPremisesHeadersFilteredBySendConnector: APLEX08.dom1.jhuapl.edu
Received: from APLEX10.dom1.jhuapl.edu (128.244.198.156) by
	APLEX08.dom1.jhuapl.edu (128.244.198.151) with Microsoft SMTP Server
	(TLS) id 15.0.1497.2; Fri, 18 Dec 2020 15:03:08 -0500
Received: from APLEX10.dom1.jhuapl.edu ([fe80::68a1:65c8:f703:ede]) by
	APLEX10.dom1.jhuapl.edu ([fe80::68a1:65c8:f703:ede%17]) with mapi id
	15.00.1497.007; Fri, 18 Dec 2020 15:03:08 -0500
From: "Wieprecht, Karen M." <Karen.Wieprecht@jhuapl.edu>
To: Steve Grubb <sgrubb@redhat.com>, Andreas Hasenack <andreas@canonical.com>
Subject: RE: [EXT] Re: "key=" on all related log lines
Thread-Topic: [EXT] Re: "key=" on all related log lines
Thread-Index: AQHW1UReNO+jWlmzS0K8URch+WI4y6n9Q6Pw
Date: Fri, 18 Dec 2020 20:03:07 +0000
Message-ID: <c5802824538e481ca088a5a9ca02a343@APLEX10.dom1.jhuapl.edu>
References: <CANYNYEEfJGivaVCmBcRHisVOOQDLDQ5qjthO3ZA6niO28mT=7Q@mail.gmail.com>
	<4613628.31r3eYUQgx@x2>
In-Reply-To: <4613628.31r3eYUQgx@x2>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [128.244.198.168]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: APLEX08.dom1.jhuapl.edu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
	definitions=2020-12-18_12:2020-12-18,
	2020-12-18 signatures=0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BIKBAkd012549
X-loop: linux-audit@redhat.com
Cc: "Linux-audit@redhat.com" <Linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SXQncyBmdW5ueSB0aGF0IHRoaXMgdG9waWMgY2FtZSB1cCB0b2RheSwgSSBqdXN0IGVtYWlsZWQg
bXkgdGVhbSBvbiBNb25kYXkgIGFib3V0IHNvbWUgIGNvbmNlcm5zIEkgaGF2ZSByZWdhcmRpbmcg
dGhlIGRpZmZlcmVuY2UgYmV0d2VlbiAtayBrZXluYW1lIGFuZCBrZXk9a2V5bmFtZSBpbiB0aGUg
YXVkaXQucnVsZXMgZmlsZXMuICAgSWYgSSB1bmRlcnN0YW5kIHRoaXMgY29ycmVjdGx5LCAgc29t
ZSBydWxlcyBhc3NpZ24gYSBrZXluYW1lIHdpdGggIOKAk2sga2V5bmFtZSwgYW5kIG90aGVyIHJ1
bGVzIHVzZSB0aG9zZSBhc3NpZ25lZCBrZXluYW1lcyB0byBmaWx0ZXIvbGltaXQgdGhlIHNjb3Bl
IG9mIHRoZSAgcnVsZSAoLUYga2V5PWtleW5hbWUpLiAgIElmIHRoaXMgaXMgY29ycmVjdCwgSSBi
ZWxpZXZlIHdlIG1heSBoYXZlIHNvbWUgcnVsZXMgaW4gdGhlIHNhbXBsZSAzMC1zdGlnLnJ1bGVz
IHRoYXQgd291bGQgbmV2ZXIgZ2VuZXJhdGUgdGhlIGtleW5hbWUgdGhleSBhcmUgZmlsdGVyaW5n
IGFnYWluc3QuICAgUGVyaGFwcyB0aGlzIGlzIGluIGVycm9yPyAgRm9yIGV4YW1wbGU6CgpGb3Ig
aW5zdGFuY2UsIGluIHRoZSBjYXNlIG9mIHN5c3RlbS1sb2NhbGUsIHRoZXJlIGFyZSBzb21lIHJ1
bGVzIGFyZSBhc3NpZ25pbmcgdGhlIGtleW5hbWUgIHdpdGggIi1rIHN5c3RlbS1sb2NhbGXigJ0g
dG8gY2VydGFpbiBldmVudHMgYW5kIG90aGVyIHJ1bGVzIGZpbHRlcmluZyB3aGF0IGlzIGNvbGxl
Y3RlZCAgYmFzZWQgb24g4oCTRiBrZXk9c3lzdGVtLWxvY2FsZSwgc28gdGhpcyBvbmUgbWF5IGJl
IG9rCgoJLWEgYWx3YXlzLGV4aXQgLUYgYXJjaD1iMzIgLVMgc2V0aG9zdG5hbWUsc2V0ZG9tYWlu
bmFtZSAtRiBrZXk9c3lzdGVtLWxvY2FsZSAgCgktYSBhbHdheXMsZXhpdCAtRiBhcmNoPWI2NCAt
UyBzZXRob3N0bmFtZSxzZXRkb21haW5uYW1lIC1GIGtleT1zeXN0ZW0tbG9jYWxlICAKCS13IC9l
dGMvaXNzdWUgLXAgd2EgLWsgc3lzdGVtLWxvY2FsZSAgCgktdyAvZXRjL2lzc3VlLm5ldCAtcCB3
YSAtayBzeXN0ZW0tbG9jYWxlICAKCS13IC9ldGMvaG9zdHMgLXAgd2EgLWsgc3lzdGVtLWxvY2Fs
ZSAKCS13IC9ldGMvaG9zdG5hbWUgLXAgd2EgLWsgc3lzdGVtLWxvY2FsZSAgCgktYSBhbHdheXMs
ZXhpdCAtRiBkaXI9L2V0Yy9OZXR3b3JrTWFuYWdlci8gLUYgcGVybT13YSAtRiBrZXk9c3lzdGVt
LWxvY2FsZSAKCkhvd2V2ZXIsIGluIHRoZSBjYXNlIG9mIHBlcm1fbW9kLCAgdGhlcmUgYXJlIG5v
IHJ1bGVzIGFzc2lnbmluZyB0aGUga2V5bmFtZSB3aXRoICItayBwZXJtX21vZCIsIHNvIEkgc3Vz
cGVjdCB0aGF0IG5vdGhpbmcgd2lsbCBldmVyIGJlIGNvbGxlY3RlZCBmb3IgdGhlIHJ1bGVzIHRo
YXQgYXJlIGZpbHRlcmluZyBiYXNlZCBvbiBwZXJtX21vZDoKCgktYSBhbHdheXMsZXhpdCAtRiBh
cmNoPWIzMiAtUyBjaG1vZCxmY2htb2QsZmNobW9kYXQgLUYgYXVpZD49MTAwMCAtRiBhdWlkIT11
bnNldCAtRiBrZXk9cGVybV9tb2QgIAoJLWEgYWx3YXlzLGV4aXQgLUYgYXJjaD1iNjQgLVMgY2ht
b2QsZmNobW9kLGZjaG1vZGF0IC1GIGF1aWQ+PTEwMDAgLUYgYXVpZCE9dW5zZXQgLUYga2V5PXBl
cm1fbW9kIAogCS1hIGFsd2F5cyxleGl0IC1GIGFyY2g9YjMyIC1TIGxjaG93bixmY2hvd24sY2hv
d24sZmNob3duYXQgLUYgYXVpZD49MTAwMCAtRiBhdWlkIT11bnNldCAtRiBrZXk9cGVybV9tb2Qg
IAoJLWEgYWx3YXlzLGV4aXQgLUYgYXJjaD1iNjQgLVMgY2hvd24sZmNob3duLGxjaG93bixmY2hv
d25hdCAtRiBhdWlkPj0xMDAwIC1GIGF1aWQhPXVuc2V0IC1GIGtleT1wZXJtX21vZCAgCgktYSBh
bHdheXMsZXhpdCAtRiBhcmNoPWIzMiAtUyBzZXR4YXR0cixsc2V0eGF0dHIsZnNldHhhdHRyLHJl
bW92ZXhhdHRyLGxyZW1vdmV4YXR0cixmcmVtb3ZleGF0dHIgLUYgYXVpZD49MTAwMCAtRiBhdWlk
IT11bnNldCAtRiBrZXk9cGVybV9tb2QgIAoJLWEgYWx3YXlzLGV4aXQgLUYgYXJjaD1iNjQgLVMg
c2V0eGF0dHIsbHNldHhhdHRyLGZzZXR4YXR0cixyZW1vdmV4YXR0cixscmVtb3ZleGF0dHIsZnJl
bW92ZXhhdHRyIC1GIGF1aWQ+PTEwMDAgLUYgYXVpZCE9dW5zZXQgLUYga2V5PXBlcm1fbW9kCgpJ
cyB0aGlzIGNvcnJlY3Q/ICBJZiBzbywgd2UgbWF5IG5lZWQgdG8gbWFrZSBzb21lIGNvcnJlY3Rp
b25zIHNvIHJlbGF0ZWQgZXZlbnRzIGdldCBhc3NpZ25lZCB0aGUgcGVybV9tb2Qga2V5bmFtZSAs
IGFuZCBjb3JyZWN0IGFueSBvdGhlciBzaW1pbGFyIGlzc3VlcyB0aGF0IG1heSBleGlzdC4gIElm
IG5vdCwgY2FuIHlvdSBleHBsYWluIGhvdyBldmVudHMgd291b2xkIGJlIGdlbmVyYXRlZCB3aXRo
IHRoZSAgcGVybV9tb2Qga2V5bmFtZT8gIAoKVGhhbmtzIHNvIG11Y2gsCkthcmVuIFdpZXByZWNo
dCAKCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCkZyb206IGxpbnV4LWF1ZGl0LWJvdW5jZXNA
cmVkaGF0LmNvbSA8bGludXgtYXVkaXQtYm91bmNlc0ByZWRoYXQuY29tPiBPbiBCZWhhbGYgT2Yg
U3RldmUgR3J1YmIKU2VudDogRnJpZGF5LCBEZWNlbWJlciAxOCwgMjAyMCA4OjQ0IEFNClRvOiBB
bmRyZWFzIEhhc2VuYWNrIDxhbmRyZWFzQGNhbm9uaWNhbC5jb20+CkNjOiBMaW51eC1hdWRpdEBy
ZWRoYXQuY29tClN1YmplY3Q6IFtFWFRdIFJlOiAia2V5PSIgb24gYWxsIHJlbGF0ZWQgbG9nIGxp
bmVzCgpBUEwgZXh0ZXJuYWwgZW1haWwgd2FybmluZzogVmVyaWZ5IHNlbmRlciBsaW51eC1hdWRp
dC1ib3VuY2VzQHJlZGhhdC5jb20gYmVmb3JlIGNsaWNraW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRz
wqAKCk9uIEZyaWRheSwgRGVjZW1iZXIgMTgsIDIwMjAgODoyNDowNCBBTSBFU1QgQW5kcmVhcyBI
YXNlbmFjayB3cm90ZToKPiBJIHVzZSB0aGUgLWsgInNvbWV0ZXh0IiBwYXJhbWV0ZXIgaW4gbXkg
YXVkaXQgcnVsZXMsIHRvIGhlbHAgYW5hbHl6ZSAKPiB0aGUgbG9ncy4gSSBub3RpY2VkIHRoYXQg
aXQncyBvbmx5IGFkZGVkIHRvIG9uZSBvZiB0aGUgbG9nIGxpbmVzLCBub3QgCj4gdGhlIG90aGVy
cywgYnV0IHRoZSB0b29scyAoYXVzZWFyY2gsIGF1cmVwb3J0KSBmaW5kIHRoZSBvdGhlciByZWxh
dGVkIAo+IGVudHJpZXMgbmV2ZXJ0aGVsZXNzLgoKQ29ycmVjdC4KCj4gRm9yIGV4YW1wbGU6Cj4g
Cj4gLXcgL2V0Yy9zaGFkb3cgLXAgd2EgLWsgc2hhZG93LWZpbGUtY2hhbmdlZAo+IAo+IEFmdGVy
IGEgIiMgdG91Y2ggL2V0Yy9zaGFkb3ciIEkgZ2V0Ogo+IHR5cGU9U1lTQ0FMTCBtc2c9YXVkaXQo
MTYwODI5NzU3MS4wMDU6MTYwKTogYXJjaD1jMDAwMDAzZSBzeXNjYWxsPTI1NyAKPiBzdWNjZXNz
PXllcyBleGl0PTMgYTA9ZmZmZmZmOWMgYTE9N2ZmZWRjZWNiODY1IGEyPTk0MSBhMz0xYjYgaXRl
bXM9Mgo+IHBwaWQ9MTYyMyBwaWQ9MjM4MiBhdWlkPTEwMDAgdWlkPTAgZ2lkPTAgZXVpZD0wIHN1
aWQ9MCBmc3VpZD0wIGVnaWQ9MAo+IHNnaWQ9MCBmc2dpZD0wIHR0eT1wdHMxIHNlcz0xIGNvbW09
InRvdWNoIiBleGU9Ii9iaW4vdG91Y2giCj4ga2V5PSJzaGFkb3ctZmlsZS1jaGFuZ2VkIgo+IHR5
cGU9Q1dEIG1zZz1hdWRpdCgxNjA4Mjk3NTcxLjAwNToxNjApOiBjd2Q9Ii9yb290Igo+IHR5cGU9
UEFUSCBtc2c9YXVkaXQoMTYwODI5NzU3MS4wMDU6MTYwKTogaXRlbT0wIG5hbWU9Ii9ldGMvIiBp
bm9kZT0yMDYKPiBkZXY9ZmM6MDEgbW9kZT0wNDA3NTUgb3VpZD0wIG9naWQ9MCByZGV2PTAwOjAw
IG5hbWV0eXBlPVBBUkVOVAo+IGNhcF9mcD0wMDAwMDAwMDAwMDAwMDAwIGNhcF9maT0wMDAwMDAw
MDAwMDAwMDAwIGNhcF9mZT0wIGNhcF9mdmVyPTAgCj4gdHlwZT1QQVRIIG1zZz1hdWRpdCgxNjA4
Mjk3NTcxLjAwNToxNjApOiBpdGVtPTEgbmFtZT0iL2V0Yy9zaGFkb3ciCj4gaW5vZGU9NjQwMTMg
ZGV2PWZjOjAxIG1vZGU9MDEwMDY0MCBvdWlkPTAgb2dpZD00MiByZGV2PTAwOjAwIAo+IG5hbWV0
eXBlPU5PUk1BTCBjYXBfZnA9MDAwMDAwMDAwMDAwMDAwMCBjYXBfZmk9MDAwMDAwMDAwMDAwMDAw
MAo+IGNhcF9mZT0wIGNhcF9mdmVyPTAKPiB0eXBlPVBST0NUSVRMRSBtc2c9YXVkaXQoMTYwODI5
NzU3MS4wMDU6MTYwKToKPiBwcm9jdGl0bGU9NzQ2Rjc1NjM2ODAwMkY2NTc0NjMyRjczNjg2MTY0
NkY3Nwo+IAo+IEJ1dCBvbmx5IHRoZSBmaXJzdCBsaW5lIGhhcyBteSBrZXkuCgpDb3JyZWN0LgoK
PiBBcmUgdGhlIG90aGVyIGVudHJpZXMgY29ycmVsYXRlZCB2aWEgdGhlIGlkIGluICJhdWRpdChp
ZCkiPwoKVGhleSBhcmUgY29ycmVsYXRlZCBieSB0aGUgY29tYmluYXRpb24gb2Ygc2Vjb25kcyBz
aW5jZSAxOTcwLCBtaWxsaXNlY29uZCwgYW5kIHNlcmlhbCBudW1iZXIuIEFuZCB0aGUgcmVjb3Jk
cyBiZXR3ZWVuIHR3byBldmVudHMgY2FuIGJlIGludGVybGFjZWQgaW4gdGhlIGxvZ3MuIE5vdGhp
bmcgaW4gdGhlIGtsZXJuZWwgc2VyaWFsaXplcyB0aGUgb3V0cHV0LiBTbywgaXRzIGVudGlyZWx5
IG9uIHVzZXIgc3BhY2UgdG8gY29ycmVsYXRlIHRoaW5ncy4KCj4gSXMgdGhlcmUgYSB3YXkgdG8g
aGF2ZSB0aGUga2V5IHBhcmFtZXRlciBhdHRhY2hlZCB0byBhbGwgb2YgdGhlbT8gCgpOby4KCj4g
SSdkIGxpa2UgdG8gc2VuZCB0byBhIHJlbW90ZSBsb2cgc2VydmVyIG9ubHkgY2VydGFpbiBldmVu
dHMsIGFuZCBpZiBJIAo+IGZpbHRlciBieSBrZXksIEkgb25seSBnZXQgb25lIG9mIHRoZXNlIGxv
ZyBsaW5lcy4KClRoZW4sIEknZCBzYXkgeW91J3JlIG5vdCBkb2luZyBpdCB0aGUgd2F5IGl0IHdh
cyBpbnRlbmRlZC4gQSBzaW1wbGUgZ3JlcCBpcyBub3Qgc3VmZmljaWVudC4gWW91IHdvdWxkIHdh
bnQgdG8gdXNlIHRoZSBhdWRpdCB0b29scyBvciBhdXBhcnNlIGxpYnJhcnkgdG8gZG8gdGhpcyBm
b3IgeW91LiBUaGV5IHRha2UgY2FyZSBvZiB0aGUgY29ycmVsYXRpb24gYW5kIGRlLWludGVybGFj
aW5nIG9mIGV2ZW50cy4gCkFuZCB0aGV5IGNhbiBkbyB0aGUgZmlsdGVyaW5nLiBBIGdvb2QgZXhh
bXBsZSBpcyB0aGUgc2V0cm91Ymxlc2hvb3RlciBwbHVnaW4uIApJdCBmaWx0ZXJzIGp1c3QgZm9y
IEFWQydzIGFuZCB0aGVuIHNlZXMgaWYgdGhleSBoYXZlIGNvbmZpZ3VyYXRpb24gc29sdXRpb25z
IHRvIGF2b2lkIHRoZSBBVkMncy4KCldyaXRpbmcgYSBmaWxyZSB1c2luZyB0aGUgYXVwYXJzZSBs
aWJyYXJ5IGlzIHByZXR0eSBzaW1wbGUuIFlvdSBjYW4gZmluZCBhbiBleGFtcGxlIHRvIHN0YXJ0
IGZyb20gaGVyZToKCmh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1hdWRpdC9hdWRpdC11c2Vyc3Bh
Y2UvYmxvYi9tYXN0ZXIvY29udHJpYi9wbHVnaW4vCmF1ZGlzcC1leGFtcGxlLmMKCkknZCBhbHNv
IHN1Z2dlc3QgbWFraW5nIGFueSBwbHVnaW4gZG91YmxlIHRocmVhZGVkLCB3aXRoIG9uZSBzaWRl
IGRlcXVldWluZyBldmVudHMgYW5kIHRoZSBvdGhlciB0aHJlYWQgcHJvY2Vzc2luZyB0aGVtIGFu
ZCBzb21lIGtpbmQgb2YgcXVldWUgaW4gYmV0d2Vlbi4gSWYgdGhlIHNvY2tldCBidWZmZXIgYmV0
d2VlbiBhdWRpdGQgYW5kIHRoZSBwbHVnaW4gZ2V0cyBmdWxsLCBpdCBjYW4gYWZmZWN0IHRoZSBh
dWRpdCBkYWVtb24ncyBwZXJmb3JtYW5jZS4KCi1TdGV2ZQoKCi0tCkxpbnV4LWF1ZGl0IG1haWxp
bmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1hdWRpdAoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApM
aW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1hdWRpdA==


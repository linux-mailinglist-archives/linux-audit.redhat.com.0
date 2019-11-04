Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 90EA7EE2C2
	for <lists+linux-audit@lfdr.de>; Mon,  4 Nov 2019 15:42:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572878522;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kexlVg2z2eo1m90lvbXBDqcE+dR8mUQVYi7e5JK4yxI=;
	b=EecXNz/qYA1CnV+ILhZV6JDz4O4+IFaJJmu6rVKf2qTMoBfV5r0Oh3FeO+fdffwT7/H6OU
	PlC/7CEOCuGLwgtPExvFGtembZUsEYyATy7on3l4130LWnwfH4zudv6yNJXjACMXC2HO8z
	bVOhtaEAv01ifwYKJa8NzUTktHw7DiI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-ZQvdoTWRN2uXKjHuCpJ2EQ-1; Mon, 04 Nov 2019 09:41:59 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63C8D1005500;
	Mon,  4 Nov 2019 14:41:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A76511001938;
	Mon,  4 Nov 2019 14:41:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BAB6C4BB65;
	Mon,  4 Nov 2019 14:41:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA4DfKwo014372 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 4 Nov 2019 08:41:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 70AB360FCC; Mon,  4 Nov 2019 13:41:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E2A160CD0;
	Mon,  4 Nov 2019 13:41:09 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 052E74BB5B;
	Mon,  4 Nov 2019 13:41:09 +0000 (UTC)
Date: Mon, 4 Nov 2019 08:41:08 -0500 (EST)
From: Vladis Dronov <vdronov@redhat.com>
To: Jiri Benc <jbenc@redhat.com>
Message-ID: <2121793119.12241099.1572874868937.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191104140518.67471654@redhat.com>
References: <20190809141831.GB9377@krava> <2985228.9kGasGrDWd@x2>
	<20190812075922.GA3012@krava> <5293423.BmRMD7FMx9@x2>
	<20190812143257.GC23992@krava> <20190814073323.GA16363@krava>
	<20190820135453.GH24105@krava> <20191104140518.67471654@redhat.com>
Subject: Re: [RFC] audit support for BPF notification
MIME-Version: 1.0
X-Originating-IP: [10.40.205.146, 10.4.195.16]
Thread-Topic: audit support for BPF notification
Thread-Index: yyP/eyTWpVxya8VnobhNPfs+1ThYyg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA4DfKwo014372
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 04 Nov 2019 09:41:36 -0500
Cc: Rashid Khan <rkhan@redhat.com>, Stanislav Kozina <skozina@redhat.com>,
	Yauheni Kaliuta <yauheni.kaliuta@redhat.com>,
	Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-audit@redhat.com,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Petr Matousek <pmatouse@redhat.com>, Jiri Olsa <jolsa@redhat.com>
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
X-MC-Unique: ZQvdoTWRN2uXKjHuCpJ2EQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG8sIEppcmksCgpVbmZvcnR1bmF0ZWx5LCBJJ20gbm90IHdpdGggdGhlIFByb2R1Y3QgU2Vj
dXJpdHkgYW55bW9yZSBhbmQgY2Fubm90IHNwZWFrIGluClByb2RTZWMgbmFtZS4gTXkgcGVyc29u
YWwgdmlldyBpcyB0aGF0IHdlL2N1c3RvbWVycyBtdXN0IGJlIGFibGUgdG8gbG9nIGVCUEYKcHJv
Z3JhbSBsb2FkL3VubG9hZCBldmVudHMgaW4gc29tZSB3YXkgKG5vdCBuZWNlc3NhcnkgYnkgYXVk
aXQpLgoKQmVzdCByZWdhcmRzLApWbGFkaXMgRHJvbm92IHwgUmVkIEhhdCwgSW5jLiB8IFRoZSBD
b3JlIEtlcm5lbCB8IFNlbmlvciBTb2Z0d2FyZSBFbmdpbmVlcgoKLS0tLS0gT3JpZ2luYWwgTWVz
c2FnZSAtLS0tLQo+IEZyb206ICJKaXJpIEJlbmMiIDxqYmVuY0ByZWRoYXQuY29tPgo+IFRvOiAi
SmlyaSBPbHNhIiA8am9sc2FAcmVkaGF0LmNvbT4KPiBDYzogIlN0ZXZlIEdydWJiIiA8c2dydWJi
QHJlZGhhdC5jb20+LCBsaW51eC1hdWRpdEByZWRoYXQuY29tLCAiU3RhbmlzbGF2IEtvemluYSIg
PHNrb3ppbmFAcmVkaGF0LmNvbT4sICJZYXVoZW5pCj4gS2FsaXV0YSIgPHlhdWhlbmkua2FsaXV0
YUByZWRoYXQuY29tPiwgIlRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiIgPHRva2VAcmVkaGF0LmNv
bT4sICJBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8iCj4gPGFjbWVAcmVkaGF0LmNvbT4sICJKZXNw
ZXIgRGFuZ2FhcmQgQnJvdWVyIiA8YnJvdWVyQHJlZGhhdC5jb20+LCAiVmxhZCBEcm9ub3YiIDx2
ZHJvbm92QHJlZGhhdC5jb20+LCAiUGV0ciBNYXRvdXNlayIKPiA8cG1hdG91c2VAcmVkaGF0LmNv
bT4sICJSYXNoaWQgS2hhbiIgPHJraGFuQHJlZGhhdC5jb20+Cj4gU2VudDogTW9uZGF5LCBOb3Zl
bWJlciA0LCAyMDE5IDI6MDU6MTggUE0KPiBTdWJqZWN0OiBSZTogW1JGQ10gYXVkaXQgc3VwcG9y
dCBmb3IgQlBGIG5vdGlmaWNhdGlvbgo+IAo+IFNlZW1zIHRoZXJlIGhhdmUgYmVlbiBubyByZXBs
eSB0byB0aGlzLi4uCj4gCj4gSmlyaSwgd2hhdCBpcyB0aGUgY3VycmVudCBzdGF0dXM/Cj4gCj4g
VmxhZCwgd2hhdCBpcyB0aGUgUHJvZHVjdCBTZWN1cml0eSdzIHZpZXcgb24gdGhpcz8gSXMgdGhl
IGF1ZGl0IHN1cHBvcnQKPiBmb3IgYnBmIHByb2dyYW1zIGxvYWRpbmcvdW5sb2FkaW5nIGEgcmVx
dWlyZW1lbnQgZm9yIGZ1bGwgc3VwcG9ydCBvZgo+IGVCUEYgKGFzIG9wcG9zZWQgdG8gdGVjaCBw
cmV2aWV3KT8KPiAKPiBUaGFua3MsCj4gCj4gIEppcmkKPiAKPiBPbiBUdWUsIDIwIEF1ZyAyMDE5
IDE1OjU0OjUzICswMjAwLCBKaXJpIE9sc2Egd3JvdGU6Cj4gPiBjYy1pbmcgUGV0ciBNYXRvdXNl
awo+ID4gCj4gPiBqaXJrYQo+ID4gCj4gPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAwOTozMzoz
NEFNICswMjAwLCBKaXJpIE9sc2Egd3JvdGU6Cj4gPiA+IGhpLAo+ID4gPiBBZGRpbmcgVmxhZCBE
cm9ub3YgdG8gdGhlIGxvb3AsIGJlY2F1c2UgaGUgYXNrZWQKPiA+ID4gYWJvdXQgdGhpcyBmdW5j
dGlvbmFsaXR5IHNvbWUgdGltZSBhZ28uCj4gPiA+IAo+ID4gPiBWbGFkLCB0aGUgZnVsbCB0aHJl
YWQgY2FuIGJlIGZvdW5kIGluIGhlcmU6Cj4gPiA+ICAgaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9h
cmNoaXZlcy9saW51eC1hdWRpdC8yMDE5LUF1Z3VzdC9tc2cwMDAwNC5odG1sCj4gPiA+IAo+ID4g
PiBBbnkgdGhvdWdodHMgb24gdGhpcz8KPiA+ID4gCj4gPiA+IHRoYW5rcywKPiA+ID4gamlya2EK
PiA+ID4gCj4gPiA+IE9uIE1vbiwgQXVnIDEyLCAyMDE5IGF0IDA0OjMzOjEwUE0gKzAyMDAsIEpp
cmkgT2xzYSB3cm90ZToKPiA+ID4gPiBPbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCAwOTo0OTo0M0FN
IC0wNDAwLCBTdGV2ZSBHcnViYiB3cm90ZToKPiA+ID4gPiA+IE9uIE1vbmRheSwgQXVndXN0IDEy
LCAyMDE5IDM6NTk6MjIgQU0gRURUIEppcmkgT2xzYSB3cm90ZToKPiA+ID4gPiA+ID4gT24gRnJp
LCBBdWcgMDksIDIwMTkgYXQgMDE6NDU6MjFQTSAtMDQwMCwgU3RldmUgR3J1YmIgd3JvdGU6Cj4g
PiA+ID4gPiA+ID4gSGVsbG8sCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gT24gRnJpZGF5
LCBBdWd1c3QgOSwgMjAxOSAxMDoxODozMSBBTSBFRFQgSmlyaSBPbHNhIHdyb3RlOgo+ID4gPiA+
ID4gPiA+ID4gSSBwb3N0ZWQgaW5pdGlhbCBjaGFuZ2UgdGhhdCBhbGxvd3MgYXVkaXRkIHRvIGxv
ZyBCUEYgcHJvZ3JhbQo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBsb2FkL3VubG9h
ZCBldmVudHMsIGl0J3MgaW4gaGVyZToKPiA+ID4gPiA+ID4gPiA+ICAgaHR0cHM6Ly9naXRodWIu
Y29tL2xpbnV4LWF1ZGl0L2F1ZGl0LXVzZXJzcGFjZS9wdWxsLzEwNAo+ID4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiA+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLi4uYnV0IHdlIHByb2JhYmx5IHNob3Vs
ZCBoYXZlIHRhbGtlZCBhIGJpdAo+ID4gPiA+ID4gPiA+IG1vcmUKPiA+ID4gPiA+ID4gPiBiZWZv
cmUgdW5kZXJ0YWtpbmcgdGhpcyBlZmZvcnQuIFdlIG5vcm1hbGx5IGRvIG5vdCBhdWRpdCBmcm9t
Cj4gPiA+ID4gPiA+ID4gdXNlciBzcGFjZQo+ID4gPiA+ID4gPiA+IHdoYXQgaGFwcGVucyBpbiB0
aGUga2VybmVsLiBEb2luZyB0aGlzIGNhbiBiZSByYWN5IGFuZCBpdCBrZWVwcwo+ID4gPiA+ID4g
PiA+IGF1ZGl0ZAo+ID4gPiA+ID4gPiA+IGZyb20gZG9pbmcgdGhlIG9uZSBqb2IgaXQgaGFzIC0g
d2hpY2ggaXMgdG8gZ3JhYiBldmVudHMgYW5kCj4gPiA+ID4gPiA+ID4gcmVjb3JkIHRoZW0KPiA+
ID4gPiA+ID4gPiB0byBkaXNrIGFuZCBzZW5kIHRoZW0gb3V0IHRoZSByZWFsdGltZSBpbnRlcmZh
Y2UuCj4gPiA+ID4gPiA+ID4gICAKPiA+ID4gPiA+ID4gPiA+IFdlIHRyaWVkIHRvIHB1c2ggcHVy
ZSBBVURJVCBpbnRlcmZhY2UgZm9yIEJQRiBwcm9ncmFtCj4gPiA+ID4gPiA+ID4gPiBub3RpZmlj
YXRpb24sCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IGJ1dCBpdCB3YXMgZGVuaWVk
LCB0aGUgZGlzY3Vzc2lvbiBpcyBpbiBoZXJlOgo+ID4gPiA+ID4gPiA+ID4gICBodHRwczovL21h
cmMuaW5mby8/dD0xNTM4NjYxMjMyMDAwMDMmcj0xJnc9Mgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiA+IEhtbS4gVGhlIGVtYWlsIEkgcmVtZW1iZXIgd2FzIGhlcmU6Cj4gPiA+ID4gPiA+ID4g
aHR0cHM6Ly93d3cucmVkaGF0LmNvbS9hcmNoaXZlcy9saW51eC1hdWRpdC8yMDE4LU9jdG9iZXIv
bXNnMDAwNTMuaHRtbAo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IGFuZCB3YXMgb25seSAy
IGVtYWlscyBsb25nIHdpdGggbm8gYW5zd2VyIHRvIG15IHF1ZXN0aW9uLiA6LSkKPiA+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+IG9vcHMsIHNyeSBhYm91dCB0aGF0LCB5b3VyIHF1ZXN0aW9uIHdhczoK
PiA+ID4gPiA+ID4gCT4gSSdtIG5vdCBzdXJlIGV4YWN0bHkgd2hhdCB0aGUgaXNzdWUgaXMuIFlv
dSBjYW4gYXVkaXQgZm9yCj4gPiA+ID4gPiA+IAk+IHNwZWNpZmljCj4gPiA+ID4gPiA+IAk+IHN5
c2NhbGwKPiA+ID4gPiA+ID4gCT4gYW5kIGFyZ3VtZW50LiBTbywgaWYgeW91IHdhbnQgdG8gc2Vl
IGxvYWRzLCB0aGVuIHlvdSBjYW4gbWFrZSBhCj4gPiA+ID4gPiA+IAk+IHJ1bGUKPiA+ID4gPiA+
ID4gCT4gbGlrZToKPiA+ID4gPiA+ID4gCT4gCj4gPiA+ID4gPiA+IAk+IC1hIGFsd2F5cyxleGl0
IC1GIGFyY2g9YjY0IC1TIGJwZiAtRiBhMD01Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBUaGUg
cHJvYmxlbSB3aXRoIGFib3ZlIGZvciB1cyBpcyB0aGF0IHdlIGFsc286Cj4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiAgIC0gbmVlZCB0byBsb2cgYWxzbyBvdGhlciBwcm9wZXJ0aWVzIG9mIHRoZSBC
UEYgcHJvZ3JhbSwKPiA+ID4gPiA+ID4gICAgIHdoaWNoIGFyZSBub3QgdmlzaWJsZSBmcm9tIEJQ
RiBzeXNjYWxsIGFyZ3VtZW50cywgbGlrZQo+ID4gPiA+ID4gPiAgICAgaXRzIElELCBKSVQgc3Rh
dHVzCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoZSB3YXkgdGhpcyBpcyBub3JtYWxseSBkb25lIGlz
IHRvIGFkZCBhIHN1cHBsZW1lbnRhbCByZWNvcmQuIEZvcgo+ID4gPiA+ID4gZXhhbXBsZSwKPiA+
ID4gPiA+IHdoZW4gYXVkaXRpbmcgdGhlIG9wZW4gc3lzY2FsbCwgd2UgYWxzbyBnZXQgQ1dEICYg
UEFUSCBzdXBwbGVtZW50YWwKPiA+ID4gPiA+IHJlY29yZHMuCj4gPiA+ID4gPiBXaGVuIGF1ZGl0
aW5nIGNvbm5lY3QsIHdlIGdldCBhIFNPQ0tBRERSIHN1cHBsZW1lbnRhbCByZWNvcmQuIFdlIGhh
dmUKPiA+ID4gPiA+IHJlcXVpcmVtZW50cyBhcm91bmQgc2VsZWN0aXZlIGF1ZGl0IHdoZXJlYnkg
dGhlIGFkbWluIGlzIGluIGNvbnRyb2wKPiA+ID4gPiA+IG9mIHdoYXQKPiA+ID4gPiA+IGlzIHNl
bGVjdGVkIGZvciBhdWRpdCB2aWEgYXVkaXQgcnVsZXMuIFNvLCB3aGF0IG9uZSBjb3VsZCBkbyBp
cyBzZXQgYQo+ID4gPiA+ID4gcnVsZQo+ID4gPiA+ID4gZm9yIHRoZSBicGYgc3lzY2FsbCBhbmQg
dGhlbiB3aGVuIGl0IHRyaWdnZXJzLCB3ZSBnZXQgdGhlc2Ugb3RoZXIKPiA+ID4gPiA+IHJlY29y
ZHMKPiA+ID4gPiA+IGFkZGVkIHRvIHRoZSBicGYgc3lzY2FsbCBldmVudC4KPiA+ID4gPiAKPiA+
ID4gPiByaWdodCwgdGhhdCB3YXMgdGhlIGluaXRpYWwgcGxhbiwgYnV0IEJQRiBndXlzIHdhbnRl
ZCBqdXN0Cj4gPiA+ID4gc2luZ2xlIG5vdGlmaWNhdGlvbiBzeXN0ZW0gd2l0aG91dCBzcGVjaWZp
YyBob29rcyBmb3IgYXVkaXQsCj4gPiA+ID4gc28gd2UgZW5kZWQgdXAgd2l0aCBwZXJmIHNwZWNp
ZmljIGludGVyZmFjZQo+ID4gPiA+ICAgCj4gPiA+ID4gPiA+ICAgICBvciBsaWNlbnNlIGluZm8K
PiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhpcyBeXiBpcyBub3QgYSBzZWN1cml0eSBpc3N1ZS4KPiA+
ID4gPiA+IAo+ID4gPiA+ID4gICAKPiA+ID4gPiA+ID4gICAtIG5lZWQgdG8gc2VlIEJQRiBwcm9n
cmFtIFVOTE9BRCwgd2hpY2ggaXMgbm90IGRvbmUKPiA+ID4gPiA+ID4gICAgIHZpYSBzeXNjYWxs
LCBzbyB0aG9zZSB3b3VsZCBiZSB1bnZpc2libGUgYXQgYWxsCj4gPiA+ID4gPiAKPiA+ID4gPiA+
IElzIHRoZXJlIGEgcGxhY2UgaW4gdGhlIGtlcm5lbCB3aGVyZSB0aGlzIGhhcHBlbnM/IEkgY291
bGQgc2VlCj4gPiA+ID4gPiBhYm5vcm1hbAo+ID4gPiA+ID4gdGVybWluYXRpb24gYmVpbmcgc29t
ZXRoaW5nIHdlIG1pZ2h0IHdhbnQuIERvZXMgdGhlIHByb2dyYW0gZ28KPiA+ID4gPiA+IHRocm91
Z2gKPiA+ID4gPiA+IHNvbWV0aGluZyBsaWtlIGFuIGV4aXQgc3lzY2FsbCBpbnRlcm5hbGx5Pwo+
ID4gPiA+IAo+ID4gPiA+IGl0J3MgaGFwcGVuaW5nIGluIGhlcmUgKGtlcm5lbC9icGYvc3lzY2Fs
bC5jKToKPiA+ID4gPiAKPiA+ID4gPiAJYnBmX3Byb2dfcHV0Cj4gPiA+ID4gCSAgX19icGZfcHJv
Z19wdXQKPiA+ID4gPiAJICB7Cj4gPiA+ID4gCQkgICAgaWYgKGF0b21pY19kZWNfYW5kX3Rlc3Qo
JnByb2ctPmF1eC0+cmVmY250KSkgewo+ID4gPiA+IAkJCXBlcmZfZXZlbnRfYnBmX2V2ZW50KHBy
b2csIFBFUkZfQlBGX0VWRU5UX1BST0dfVU5MT0FELCAwKTsKPiA+ID4gPiAJCQkuLi4KPiA+ID4g
PiAJICB9Cj4gPiA+ID4gCj4gPiA+ID4gQlBGIHByb2dyYW0gaXMgcmVsZWFzZWQgd2hlbiBpdCBk
cm9wcyB0aGUgcmVmZXJlbmNlIGNvdW50LAo+ID4gPiA+IHdoaWNoIGlzIG5vcm1hbGx5IHdoZW4g
aXRzIGZpbGUgZGVzY3JpcHRvciBpcyBjbG9zZWQuCj4gPiA+ID4gCj4gPiA+ID4gSG93ZXZlciBp
dCBtaWdodCBnZXQgcGlubmVkIGFuZCBzdGF5IGFsaXZlIGV2ZW4gd2hlbiB0aGUgaW5pdGlhbAo+
ID4gPiA+IGZpbGUgZGVzY3JpcHRvciBpcyBjbG9zZWQuLiBhbmQgdGhlbiB0aGVyZSdzIHRoZSBu
ZXR3b3JraW5nIHdvcmxkLAo+ID4gPiA+IHdoaWNoIG1pZ2h0IGhhdmUgc29tZSBvdGhlciBzcGVj
aWZpYyB3YXlzLi4gYnV0IGl0IGFsbCBlbmRzIHVwCj4gPiA+ID4gaW4gYnBmX3Byb2dfcHV0IGFu
ZCB6ZXJvIHJlZmVyZW5jZSBjb3VudC4KPiA+ID4gPiAgIAo+ID4gPiA+ID4gPiA+ID4gVGhlIG91
dGNvbWUgb2YgdGhlIGRpc2N1c3Npb24gd2FzIHRvIHVzZSBwZXJmIGV2ZW50IGludGVyZmFjZQo+
ID4gPiA+ID4gPiA+ID4gZm9yIEJQRiBub3RpZmljYXRpb24gYW5kIHVzZSBpdCBpbiBzb21lIGRl
YW1vbi4uIGF1ZGl0IHdhcyBvdXIKPiA+ID4gPiA+ID4gPiA+IGZpcnN0IGNob2ljZS4KPiA+ID4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gdGhvdWdodHM/Cj4gPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+ID4gSSdkIGxpa2UgdG8gdW5kZXJzdGFuZCB3aGF0IHRoZSBiYXNpYyBwcm9ibGVtIGlz
IHRoYXQgbmVlZHMgdG8gYmUKPiA+ID4gPiA+ID4gPiBzb2x2ZWQuCj4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiB3ZSBuZWVkIGEgd2F5IGZvciBhZG1pbmlzdHJhdG9ycyB0byBzZWUgdGhlIGhpc3Rv
cnkgb2YgbG9hZGVkIEJQRgo+ID4gPiA+ID4gPiBwcm9ncmFtcywgdG8gaGVscCBpbnZlc3RpZ2F0
aW5nIGlzc3VlcyByZWxhdGVkIHRvIEJQRi4uIGFuZCB0aGUKPiA+ID4gPiA+ID4gb25seSBCUEYg
aW50ZXJmYWNlIGZvciB0aGlzIGRhdGEgaXMgdGhyb3VnaCBwZXJmIHJpbmcgYnVmZmVyCj4gPiA+
ID4gPiAKPiA+ID4gPiA+IFRoYXQgaXMgcmVhbGx5IG5vdCB0aGUgYXVkaXQgd2F5LiBMZXQncyBr
ZWVwIHRhbGtpbmcgdG8gc2VlIHdoZXJlCj4gPiA+ID4gPiB0aGlzIGVuZHMKPiA+ID4gPiA+IHVw
Lgo+ID4gPiA+IAo+ID4gPiA+IFdvdWxkIHlvdSBzZWUgc29tZSBvdGhlciBhdWRpdGluZyBkYWVt
b24vYXBwIGluIHBsYWNlIGZvciB0aGlzIGtpbmQgb2YKPiA+ID4gPiBkYXRhPwo+ID4gPiA+IAo+
ID4gPiA+IHRoYW5rcywKPiA+ID4gPiBqaXJrYQo+IAo+IAoKLS0KTGludXgtYXVkaXQgbWFpbGlu
ZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0


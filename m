Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B1D3D344
	for <lists+linux-audit@lfdr.de>; Tue, 11 Jun 2019 19:03:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9ADE430C0DD6;
	Tue, 11 Jun 2019 17:03:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3D835D705;
	Tue, 11 Jun 2019 17:03:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF50C206D2;
	Tue, 11 Jun 2019 17:02:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5BH2Od5024706 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 13:02:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7BE2660BFC; Tue, 11 Jun 2019 17:02:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF51B60BF7;
	Tue, 11 Jun 2019 17:02:15 +0000 (UTC)
Date: Tue, 11 Jun 2019 13:02:13 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH] selinux: log raw contexts as untrusted strings
Message-ID: <20190611170213.ecw2hhxxcy3d476n@madcap2.tricolour.ca>
References: <20190611080719.28625-1-omosnace@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611080719.28625-1-omosnace@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: selinux@vger.kernel.org, linux-audit@redhat.com, stable@vger.kernel.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 11 Jun 2019 17:03:55 +0000 (UTC)

T24gMjAxOS0wNi0xMSAxMDowNywgT25kcmVqIE1vc25hY2VrIHdyb3RlOgo+IFRoZXNlIHN0cmlu
Z3MgbWF5IGNvbWUgZnJvbSB1bnRydXN0ZWQgc291cmNlcyAoZS5nLiBmaWxlIHhhdHRycykgc28g
dGhleQo+IG5lZWQgdG8gYmUgcHJvcGVybHkgZXNjYXBlZC4KPiAKPiBSZXByb2R1Y2VyOgo+ICAg
ICAjIHNldGVuZm9yY2UgMAo+ICAgICAjIHRvdWNoIC90bXAvdGVzdAo+ICAgICAjIHNldGZhdHRy
IC1uIHNlY3VyaXR5LnNlbGludXggLXYgJ2t1xZllY8OtIMWZw616ZWsnIC90bXAvdGVzdAo+ICAg
ICAjIHJ1bmNvbiBzeXN0ZW1fdTpzeXN0ZW1fcjpzc2hkX3Q6czAgY2F0IC90bXAvdGVzdAo+ICAg
ICAobG9vayBhdCB0aGUgZ2VuZXJhdGVkIEFWQ3MpCj4gCj4gQWN0dWFsIHJlc3VsdDoKPiAgICAg
dHlwZT1BVkMgWy4uLl0gdHJhd2Nvbj1rdcWZZWPDrSDFmcOtemVrCj4gCj4gRXhwZWN0ZWQgcmVz
dWx0Ogo+ICAgICB0eXBlPUFWQyBbLi4uXSB0cmF3Y29uPTZCNzVDNTk5NjU2M0MzQUQyMEM1OTlD
M0FEN0E2NTZCCj4gCj4gRml4ZXM6IGZlZGUxNDgzMjRjMyAoInNlbGludXg6IGxvZyBpbnZhbGlk
IGNvbnRleHRzIGluIEFWQ3MiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgdjUuMSsK
PiBTaWduZWQtb2ZmLWJ5OiBPbmRyZWogTW9zbmFjZWsgPG9tb3NuYWNlQHJlZGhhdC5jb20+CgpB
Y2tlZC1ieTogUmljaGFyZCBHdXkgQnJpZ2dzIDxyZ2JAcmVkaGF0LmNvbT4KCj4gLS0tCj4gIHNl
Y3VyaXR5L3NlbGludXgvYXZjLmMgfCAxMCArKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5
L3NlbGludXgvYXZjLmMgYi9zZWN1cml0eS9zZWxpbnV4L2F2Yy5jCj4gaW5kZXggODM0NmE0Zjdj
NWQ3Li5hOTliZTUwOGY5M2QgMTAwNjQ0Cj4gLS0tIGEvc2VjdXJpdHkvc2VsaW51eC9hdmMuYwo+
ICsrKyBiL3NlY3VyaXR5L3NlbGludXgvYXZjLmMKPiBAQCAtNzM5LDE0ICs3MzksMjAgQEAgc3Rh
dGljIHZvaWQgYXZjX2F1ZGl0X3Bvc3RfY2FsbGJhY2soc3RydWN0IGF1ZGl0X2J1ZmZlciAqYWIs
IHZvaWQgKmEpCj4gIAlyYyA9IHNlY3VyaXR5X3NpZF90b19jb250ZXh0X2ludmFsKHNhZC0+c3Rh
dGUsIHNhZC0+c3NpZCwgJnNjb250ZXh0LAo+ICAJCQkJCSAgICZzY29udGV4dF9sZW4pOwo+ICAJ
aWYgKCFyYyAmJiBzY29udGV4dCkgewo+IC0JCWF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgc3Jhd2Nv
bj0lcyIsIHNjb250ZXh0KTsKPiArCQlpZiAoc2NvbnRleHRfbGVuICYmIHNjb250ZXh0W3Njb250
ZXh0X2xlbiAtIDFdID09ICdcMCcpCj4gKwkJCXNjb250ZXh0X2xlbi0tOwo+ICsJCWF1ZGl0X2xv
Z19mb3JtYXQoYWIsICIgc3Jhd2Nvbj0iKTsKPiArCQlhdWRpdF9sb2dfbl91bnRydXN0ZWRzdHJp
bmcoYWIsIHNjb250ZXh0LCBzY29udGV4dF9sZW4pOwo+ICAJCWtmcmVlKHNjb250ZXh0KTsKPiAg
CX0KPiAgCj4gIAlyYyA9IHNlY3VyaXR5X3NpZF90b19jb250ZXh0X2ludmFsKHNhZC0+c3RhdGUs
IHNhZC0+dHNpZCwgJnNjb250ZXh0LAo+ICAJCQkJCSAgICZzY29udGV4dF9sZW4pOwo+ICAJaWYg
KCFyYyAmJiBzY29udGV4dCkgewo+IC0JCWF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgdHJhd2Nvbj0l
cyIsIHNjb250ZXh0KTsKPiArCQlpZiAoc2NvbnRleHRfbGVuICYmIHNjb250ZXh0W3Njb250ZXh0
X2xlbiAtIDFdID09ICdcMCcpCj4gKwkJCXNjb250ZXh0X2xlbi0tOwo+ICsJCWF1ZGl0X2xvZ19m
b3JtYXQoYWIsICIgdHJhd2Nvbj0iKTsKPiArCQlhdWRpdF9sb2dfbl91bnRydXN0ZWRzdHJpbmco
YWIsIHNjb250ZXh0LCBzY29udGV4dF9sZW4pOwo+ICAJCWtmcmVlKHNjb250ZXh0KTsKPiAgCX0K
PiAgfQo+IC0tIAo+IDIuMjAuMQo+IAo+IC0tCj4gTGludXgtYXVkaXQgbWFpbGluZyBsaXN0Cj4g
TGludXgtYXVkaXRAcmVkaGF0LmNvbQo+IGh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hdWRpdAoKLSBSR0IKCi0tClJpY2hhcmQgR3V5IEJyaWdncyA8cmdiQHJl
ZGhhdC5jb20+ClNyLiBTL1cgRW5naW5lZXIsIEtlcm5lbCBTZWN1cml0eSwgQmFzZSBPcGVyYXRp
bmcgU3lzdGVtcwpSZW1vdGUsIE90dGF3YSwgUmVkIEhhdCBDYW5hZGEKSVJDOiByZ2IsIFN1blJh
eWNlcgpWb2ljZTogKzEuNjQ3Ljc3Ny4yNjM1LCBJbnRlcm5hbDogKDgxKSAzMjYzNQoKLS0KTGlu
dXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cu
cmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

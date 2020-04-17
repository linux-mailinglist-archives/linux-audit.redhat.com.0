Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C584D1ADE71
	for <lists+linux-audit@lfdr.de>; Fri, 17 Apr 2020 15:39:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587130784;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gu/mQbd0qi8vsGUAeo/ShCHQQhqnerlXOmozpw3ob+w=;
	b=A+Ih628jo5x/kCRn3m4mIVqvWKT+l9p5d+gZmpqp/OHEQQ8BP7x2ZVfpoomoD8RWpur5KI
	nYhZmFQvU1buiV2SNX4Zuon0pAjpKJwnO4tjzZhgBleEF5GQddYsdKjtG9JfkP4xkcSkIO
	zrsXaH97bIrt9261kodQHEUqwqZTozU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-v0_UOHkdN_OeS6Evy-L5Lw-1; Fri, 17 Apr 2020 09:39:41 -0400
X-MC-Unique: v0_UOHkdN_OeS6Evy-L5Lw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81F581083E81;
	Fri, 17 Apr 2020 13:39:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AF6711958D;
	Fri, 17 Apr 2020 13:39:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE84118089C8;
	Fri, 17 Apr 2020 13:39:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03HDd22e030816 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 17 Apr 2020 09:39:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 669CC5C1C5; Fri, 17 Apr 2020 13:39:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-177.phx2.redhat.com [10.3.113.177])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 381705C1C3
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 13:38:59 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Fwd: [oss-security] CVE-2020-10708 kernel: race condition in
	kernel/audit.c may allow low privilege users trigger kernel panic
Date: Fri, 17 Apr 2020 09:38:58 -0400
Message-ID: <6039238.vel3c4OXdL@x2>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03HDd22e030816
X-loop: linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sCgpTaW5jZSB0aGlzIGlzIHB1YmxpYy4uLm5vIGhhcm0gZHJvcHBpbmcgYSBjb3B5IG92
ZXIgaGVyZS4gTXkgdGhvdWdodHMgYXJlIAp0aGF0IHRoZXJlIGlzIGEgcmFjZSBoZXJlLiBCdXQg
c2luY2Ugc3RhcnRpbmcvc3RvcHBpbmcgdGhlIGF1ZGl0IGRhZW1vbiAKcmVxdWlyZXMgcm9vdCBw
cml2cyBhbmQgYXMgcm9vdCB5b3UgY2FuIGRvIHdvcnNlIHRoaW5ncy4gSSBkb24ndCBrbm93IGlm
IHRoaXMgCmlzIGZpeGFibGUgb3Igd29ya2luZyBwZXIgZGVzaWduLgoKLVN0ZXZlCgotLS0tLS0t
LS0tICBGb3J3YXJkZWQgTWVzc2FnZSAgLS0tLS0tLS0tLQoKU3ViamVjdDogW29zcy1zZWN1cml0
eV0gQ1ZFLTIwMjAtMTA3MDgga2VybmVsOiByYWNlIGNvbmRpdGlvbiBpbiBrZXJuZWwvCmF1ZGl0
LmMgbWF5IGFsbG93IGxvdyBwcml2aWxlZ2UgdXNlcnMgdHJpZ2dlciBrZXJuZWwgcGFuaWMKRGF0
ZTogRnJpZGF5LCBBcHJpbCAxNywgMjAyMCwgMTI6NDA6MTAgQU0gRURUCkZyb206IOmZiOS8n+Wu
uCjnlLDlkIQpIDxzcGxlbmRpZHNreS5jd2NAYWxpYmFiYS1pbmMuY29tPgpUbzogb3NzLXNlY3Vy
aXR5IDxvc3Mtc2VjdXJpdHlAbGlzdHMub3BlbndhbGwuY29tPgoKCiJBIHJhY2UgY29uZGl0aW9u
IHdhcyBmb3VuZCBpbiB0aGUgTGludXgga2VybmVsIGF1ZGl0IHN1YnN5c3RlbS4gV2hlbiB0aGUg
CnN5c3RlbSBpcyBjb25maWd1cmVkIHRvIHBhbmljIG9uIGV2ZW50cyBiZWluZyBkcm9wcGVkLCBh
biBhdHRhY2tlciB3aG8gaXMgYWJsZSAKdG8gdHJpZ2dlciBhbiBhdWRpdCBldmVudCB0aGF0IHN0
YXJ0cyB3aGlsZSBhdWRpdGQgaXMgaW4gdGhlIHByb2Nlc3Mgb2YgCnN0YXJ0aW5nIG1heSBiZSBh
YmxlIHRvIGNhdXNlIHRoZSBzeXN0ZW0gdG8gcGFuaWMgYnkgZXhwbG9pdGluZyBhIHJhY2UgCmNv
bmRpdGlvbiBpbiBhdWRpdCBldmVudCBoYW5kbGluZy4gVGhpcyBjcmVhdGVzIGEgZGVuaWFsIG9m
IHNlcnZpY2UgYnkgCmNhdXNpbmcgYSBwYW5pYy4iCgpodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5j
b20vc2hvd19idWcuY2dpP2lkPTE4MjI1OTMKCkVudjoKICAgIFJlZCBIYXQgRW50ZXJwcmlzZSBM
aW51eCBTZXJ2ZXIgcmVsZWFzZSA3LjcgKE1haXBvKQogICAgMy4xMC4wLTEwNjIuMTIuMS5lbDcu
eDg2XzY0CgpEZXRhaWxzOgpGdW5jdGlvbiBhdWRpdF9sb2dfZW5kIGFuZCBhdWRpdF9wYW5pYyBt
YXkgaGF2ZSByYWNlIGNvbmRpdGlvbnMgd2hlbiBhdWRpdGQgCmlzIHJlc3RhcnRpbmcgYmVjYXVz
ZSBhdWRpdF9waWQgY2FuIGJlIE5VTEwgaW4gYXVkaXRfbG9nX2VuZCBhbmQgdGhlbiBiZWNvbWUg
Cm5vdCBOVUxMIGluIGF1ZGl0X3BhbmljLCB3aGljaCBtYXkgYWxsb3cgYXR0YWNrZXJzIHRvIHRy
aWdnZXIga2VybmVsIHBhbmljLiAKSGVyZSBpcyBwYW5pYyBjYWxsIHN0YWNrOgoKCnZvaWQgYXVk
aXRfbG9nX2VuZChzdHJ1Y3QgYXVkaXRfYnVmZmVyICphYikKewogICAgaWYgKCFhYikKICAgICAg
ICByZXR1cm47CiAgICBpZiAoIWF1ZGl0X3JhdGVfY2hlY2soKSkgewogICAgICAgIGF1ZGl0X2xv
Z19sb3N0KCJyYXRlIGxpbWl0IGV4Y2VlZGVkIik7CiAgICB9IGVsc2UgewogICAgICAgIHN0cnVj
dCBubG1zZ2hkciAqbmxoID0gbmxtc2dfaGRyKGFiLT5za2IpOwogICAgICAgIG5saC0+bmxtc2df
bGVuID0gYWItPnNrYi0+bGVuIC0gTkxNU0dfSERSTEVOOwoKICAgICAgICBpZiAoYXVkaXRfcGlk
KSB7CiAgICAgICAgICAgIHNrYl9xdWV1ZV90YWlsKCZhdWRpdF9za2JfcXVldWUsIGFiLT5za2Ip
OwogICAgICAgICAgICB3YWtlX3VwX2ludGVycnVwdGlibGUoJmthdWRpdGRfd2FpdCk7CiAgICAg
ICAgfSBlbHNlIHsKICAgICAgICAgICAgYXVkaXRfcHJpbnRrX3NrYihhYi0+c2tiKTsgLy8gPC0g
YXVkaXRfcGlkID09IE5VTEwgd2hlbiBhdWRpdGQgaXMgCmtpbGxlZAogICAgICAgIH0KICAgICAg
ICBhYi0+c2tiID0gTlVMTDsKICAgIH0KICAgIGF1ZGl0X2J1ZmZlcl9mcmVlKGFiKTsKfQotPiBh
dWRpdF9wcmludGtfc2tiIC0+IGF1ZGl0X2xvZ19sb3N0IC0+CnZvaWQgYXVkaXRfcGFuaWMoY29u
c3QgY2hhciAqbWVzc2FnZSkKewogICAgc3dpdGNoIChhdWRpdF9mYWlsdXJlKQogICAgewogICAg
Y2FzZSBBVURJVF9GQUlMX1NJTEVOVDoKICAgICAgICBicmVhazsKICAgIGNhc2UgQVVESVRfRkFJ
TF9QUklOVEs6CiAgICAgICAgaWYgKHByaW50a19yYXRlbGltaXQoKSkKICAgICAgICAgICAgcHJp
bnRrKEtFUk5fRVJSICJhdWRpdDogJXNcbiIsIG1lc3NhZ2UpOwogICAgICAgIGJyZWFrOwogICAg
Y2FzZSBBVURJVF9GQUlMX1BBTklDOgogICAgICAgIC8qIHRlc3QgYXVkaXRfcGlkIHNpbmNlIHBy
aW50ayBpcyBhbHdheXMgbG9zZXksIHdoeSBib3RoZXI/ICovCiAgICAgICAgaWYgKGF1ZGl0X3Bp
ZCkgLy8gPC0gYXVkaXRfcGlkIG5vdCBOVUxMIGJlY2F1c2UgYXVkaXRkIGlzIHJlc3RhcnRpbmcK
ICAgICAgICAgICAgcGFuaWMoImF1ZGl0OiAlc1xuIiwgbWVzc2FnZSk7CiAgICAgICAgYnJlYWs7
CiAgICB9Cn0KCkhvdyB0byByZXByb2R1Y2XvvJoKMS4gc2V0IGF1ZGl0LWZhaWx1cmUgdG8gQVVE
SVRfRkFJTF9QQU5JQygyKSBhbmQgYWRkIGEgcmFuZG9tIGF1ZGl0IHJ1bGUgbGlrZToKW3Jvb3RA
dGVzdCB+XSMgY2F0IC9ldGMvYXVkaXQvcnVsZXMuZC9hdWRpdC5ydWxlcwotRAotYiA4MTkyCi1m
IDIKLXcgL2V0Yy9ob3N0cyAtcCByd2EgLWsgaG9zdHMKMi4ga2VlcCBraWxsaW5nIGF1ZGl0ZCBh
bmQgdGhlbiBzdGFydGluZyBhdWRpdGQsIGZvciBleGFtcGxlOgp3aGlsZSB0cnVlOyBkbyBwcyBh
dXggfCBncmVwICIvc2Jpbi9hdWRpdGQiIHwgZ3JlcCAtdiAiZ3JlcCIgfCBhd2sgJ3twcmludCAK
JDJ9JyB8IHhhcmdzIGtpbGw7IHNlcnZpY2UgYXVkaXRkIHN0YXJ0OyBzeXN0ZW1jdGwgcmVzZXQt
ZmFpbGVkIAphdWRpdGQuc2VydmljZTsgZG9uZQozLiBsb2cgaW4gYSBsb3cgcHJpdmlsZWdlIHVz
ZXIgYW5kIGtlZXAgcmVhZGluZyAvZXRjL2hvc3RzLCBmb3IgZXhhbXBsZToKd2hpbGUgdHJ1ZTsg
ZG8gY2F0IC9ldGMvaG9zdHMgPiAvZGV2L251bGw7IGRvbmUKNC4ga2VybmVsIHBhbmljIHdpbGwg
aGFwcGVuIHdpdGhpbiBzZXZlcmFsIG1pbnV0ZXMKClRoYW5rcy4KCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QK
TGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtYXVkaXQ=


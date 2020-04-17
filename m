Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BCEA71ADEF0
	for <lists+linux-audit@lfdr.de>; Fri, 17 Apr 2020 16:03:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587132238;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zF38IOA8Ub7+baC52yCCoBAbJR8/1uTMoXTmV6/BqdY=;
	b=ZpLQ5rhAiqvuBzjIledMF+X4yg1ChvieP3CQVOiKSMxlMeIXgyd0akptG3rJAh2qWK1GXO
	E0quTfzi+9wcH5hyWzn2cOTBGUSrO+fhcqsBsqJq0OkAGvIu5Jxtwkn0rOpPbNTw17u2lu
	YWnhHsEjgBRsEQTjRXEUJsC+ayUPC74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-AmcdhD4cNaOynWg76fhGRg-1; Fri, 17 Apr 2020 10:03:56 -0400
X-MC-Unique: AmcdhD4cNaOynWg76fhGRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F05A8018A2;
	Fri, 17 Apr 2020 14:03:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8118FA1024;
	Fri, 17 Apr 2020 14:03:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D5E7C93393;
	Fri, 17 Apr 2020 14:03:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03HE3d0H032332 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 17 Apr 2020 10:03:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 090562026983; Fri, 17 Apr 2020 14:03:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0525720267F2
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 14:03:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A49691017E45
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 14:03:36 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
	[209.85.218.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-50-NHFEHUCxMxWCBcuhJsngHw-1; Fri, 17 Apr 2020 10:03:34 -0400
X-MC-Unique: NHFEHUCxMxWCBcuhJsngHw-1
Received: by mail-ej1-f49.google.com with SMTP id nv1so1652904ejb.0
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 07:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WSZbY/xqMIu2Ixo+h8RzV7Q4MYTnRt9Y9HJRqoAmKvM=;
	b=HnhFJLvmmHf5nBzSrqZVlVCkPQJE4B9ABtBODeQ/7vDsuoCfnGLpxrxRIMpB0+fx+9
	SjEus4Xon0JADcF26rxlox+qILXjq6Xv9Pty3gMkyvg63WBzNKaurmyipFQXz5GbJEfm
	A/Jo6kta2G/OdBqrHqz1HpXQpo7BOM6DMuk26RabvdSN1JFjqLxhJVg7cNg9UZB0w8iT
	kxsH4S1OW6P7YbX+yX/zk/LziNIOu4wEn9hpKJ2u4bvdquMzJZ66sg1Oy75vEFPtx+OY
	wO8T3YZzJLCtJ2Cy6cNj+QAqfMHzK8a3dXPnDoozkfmQ8fbZBER1jUQ2xQxHLDLhyrjk
	lj5w==
X-Gm-Message-State: AGi0PuYTyk+ICyscsCYiSklK/H+/IGZmUBT54zfgvcxeHGMc282bgGK4
	478RvDXix3ViiWLHoxDA/gt2jhK8iMuDTC4FNG48tyI=
X-Google-Smtp-Source: APiQypIl6BAOLs/+wojecOwVROJLpNsiZJ9YkokMBg3uoPyj+u4lKVTDBI61ObdFdgjNAlztQVWFye6/pDdg3rmMWlc=
X-Received: by 2002:a17:906:d7a2:: with SMTP id
	pk2mr3277077ejb.272.1587132212418; 
	Fri, 17 Apr 2020 07:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <6039238.vel3c4OXdL@x2>
In-Reply-To: <6039238.vel3c4OXdL@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 17 Apr 2020 10:03:20 -0400
Message-ID: <CAHC9VhR=gs5p8Bn6gJspSvtgcHsR1zOxG_gdGjsWVEzY0XRzcg@mail.gmail.com>
Subject: Re: [oss-security] CVE-2020-10708 kernel: race condition in
	kernel/audit.c may allow low privilege users trigger kernel panic
To: Steve Grubb <sgrubb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03HE3d0H032332
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgOTozOSBBTSBTdGV2ZSBHcnViYiA8c2dydWJiQHJlZGhh
dC5jb20+IHdyb3RlOgo+IEhlbGxvLAo+Cj4gU2luY2UgdGhpcyBpcyBwdWJsaWMuLi5ubyBoYXJt
IGRyb3BwaW5nIGEgY29weSBvdmVyIGhlcmUuIE15IHRob3VnaHRzIGFyZQo+IHRoYXQgdGhlcmUg
aXMgYSByYWNlIGhlcmUuIEJ1dCBzaW5jZSBzdGFydGluZy9zdG9wcGluZyB0aGUgYXVkaXQgZGFl
bW9uCj4gcmVxdWlyZXMgcm9vdCBwcml2cyBhbmQgYXMgcm9vdCB5b3UgY2FuIGRvIHdvcnNlIHRo
aW5ncy4gSSBkb24ndCBrbm93IGlmIHRoaXMKPiBpcyBmaXhhYmxlIG9yIHdvcmtpbmcgcGVyIGRl
c2lnbi4KClRoZSBmaXJzdCB0aGluZyB0byBub3RlIGlzIHRoYXQgdGhlIGNvZGUgc25pcHBldHMg
YmVsb3cgYXJlIG5vdCBmcm9tIGEKbW9kZXJuIHVwc3RyZWFtIGtlcm5lbDsgSSdtIGd1ZXNzaW5n
IGl0J3MgYSBSSEVMLTcueCBiYXNlZCBrZXJuZWwKZ2l2ZW4gdGhlIHByb2JsZW0gcmVwb3J0LiAg
VGhlIHJlbGV2YW50IGNvZGUgY2hhbmdlZCBzdWJzdGFudGlhbGx5CndoZW4gSSByZXdvcmtlZCBo
b3cgdGhlIGF1ZGl0IHF1ZXVlIHdhcyBtYW5hZ2VkOyBpdCdzIGJlZW4gYSB3aGlsZSBub3cKc28g
SSBjYW4ndCBzYXkgd2l0aCAxMDAlIGNvbmZpZGVuY2UgdGhhdCB0aGlzIGhhcyBiZWVuIHNvcnRl
ZCBvdXQsIGJ1dApJIGJlbGlldmUgdGhlIGN1cnJlbnQgdXBzdHJlYW0gY29kZSBzaG91bGQgaGFu
ZGxlIGF1ZGl0ZCByZXN0YXJ0cwp3aXRoaW4gdGhlIGJvdW5kcyBvZiB0aGUgcmVjb3JkIHF1ZXVl
LgoKVWx0aW1hdGVseSBpZiB5b3UgY29uZmlndXJlIHRoZSBzeXN0ZW0gdG8gcGFuaWMgd2hlbiB5
b3Ugc3RhcnQKZHJvcHBpbmcgYXVkaXQgcmVjb3JkcywgYW5kIHlvdSBzdG9wIHRoZSBhdWRpdCBk
YWVtb24gZm9yIGEgcGVyaW9kIG9mCnRpbWUgc3VjaCB0aGF0IHRoZSBxdWV1ZXMgc3RhcnQgdG8g
b3ZlcmZsb3csIHRoZSBzeXN0ZW0gd2lsbCBwYW5pYy4KVGhhdCdzIHdoYXQgeW91IGhhdmUgY29u
ZmlndXJlZCBpdCB0byBkbyA6KQoKSXQgaXMgYWxzbyBpbXBvcnRhbnQgdG8gbm90ZSB0aGF0IHRo
ZSBwYW5pYy1vbi1vdmVyZmxvdyBiZWhhdmlvciBpcwpub3QgdGhlIGRlZmF1bHQsIHRoZSBzeXNh
ZG1pbiBtdXN0IGV4cGxpY2l0bHkgY29uZmlndXJlIHRoZSBzeXN0ZW0gdG8KYmVoYXZlIGluIHRo
aXMgd2F5LgoKPiAtLS0tLS0tLS0tICBGb3J3YXJkZWQgTWVzc2FnZSAgLS0tLS0tLS0tLQo+Cj4g
U3ViamVjdDogW29zcy1zZWN1cml0eV0gQ1ZFLTIwMjAtMTA3MDgga2VybmVsOiByYWNlIGNvbmRp
dGlvbiBpbiBrZXJuZWwvCj4gYXVkaXQuYyBtYXkgYWxsb3cgbG93IHByaXZpbGVnZSB1c2VycyB0
cmlnZ2VyIGtlcm5lbCBwYW5pYwo+IERhdGU6IEZyaWRheSwgQXByaWwgMTcsIDIwMjAsIDEyOjQw
OjEwIEFNIEVEVAo+IEZyb206IOmZiOS8n+WuuCjnlLDlkIQpIDxzcGxlbmRpZHNreS5jd2NAYWxp
YmFiYS1pbmMuY29tPgo+IFRvOiBvc3Mtc2VjdXJpdHkgPG9zcy1zZWN1cml0eUBsaXN0cy5vcGVu
d2FsbC5jb20+Cj4KPgo+ICJBIHJhY2UgY29uZGl0aW9uIHdhcyBmb3VuZCBpbiB0aGUgTGludXgg
a2VybmVsIGF1ZGl0IHN1YnN5c3RlbS4gV2hlbiB0aGUKPiBzeXN0ZW0gaXMgY29uZmlndXJlZCB0
byBwYW5pYyBvbiBldmVudHMgYmVpbmcgZHJvcHBlZCwgYW4gYXR0YWNrZXIgd2hvIGlzIGFibGUK
PiB0byB0cmlnZ2VyIGFuIGF1ZGl0IGV2ZW50IHRoYXQgc3RhcnRzIHdoaWxlIGF1ZGl0ZCBpcyBp
biB0aGUgcHJvY2VzcyBvZgo+IHN0YXJ0aW5nIG1heSBiZSBhYmxlIHRvIGNhdXNlIHRoZSBzeXN0
ZW0gdG8gcGFuaWMgYnkgZXhwbG9pdGluZyBhIHJhY2UKPiBjb25kaXRpb24gaW4gYXVkaXQgZXZl
bnQgaGFuZGxpbmcuIFRoaXMgY3JlYXRlcyBhIGRlbmlhbCBvZiBzZXJ2aWNlIGJ5Cj4gY2F1c2lu
ZyBhIHBhbmljLiIKPgo+IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/
aWQ9MTgyMjU5Mwo+Cj4gRW52Ogo+ICAgICBSZWQgSGF0IEVudGVycHJpc2UgTGludXggU2VydmVy
IHJlbGVhc2UgNy43IChNYWlwbykKPiAgICAgMy4xMC4wLTEwNjIuMTIuMS5lbDcueDg2XzY0Cj4K
PiBEZXRhaWxzOgo+IEZ1bmN0aW9uIGF1ZGl0X2xvZ19lbmQgYW5kIGF1ZGl0X3BhbmljIG1heSBo
YXZlIHJhY2UgY29uZGl0aW9ucyB3aGVuIGF1ZGl0ZAo+IGlzIHJlc3RhcnRpbmcgYmVjYXVzZSBh
dWRpdF9waWQgY2FuIGJlIE5VTEwgaW4gYXVkaXRfbG9nX2VuZCBhbmQgdGhlbiBiZWNvbWUKPiBu
b3QgTlVMTCBpbiBhdWRpdF9wYW5pYywgd2hpY2ggbWF5IGFsbG93IGF0dGFja2VycyB0byB0cmln
Z2VyIGtlcm5lbCBwYW5pYy4KPiBIZXJlIGlzIHBhbmljIGNhbGwgc3RhY2s6Cj4KPgo+IHZvaWQg
YXVkaXRfbG9nX2VuZChzdHJ1Y3QgYXVkaXRfYnVmZmVyICphYikKPiB7Cj4gICAgIGlmICghYWIp
Cj4gICAgICAgICByZXR1cm47Cj4gICAgIGlmICghYXVkaXRfcmF0ZV9jaGVjaygpKSB7Cj4gICAg
ICAgICBhdWRpdF9sb2dfbG9zdCgicmF0ZSBsaW1pdCBleGNlZWRlZCIpOwo+ICAgICB9IGVsc2Ug
ewo+ICAgICAgICAgc3RydWN0IG5sbXNnaGRyICpubGggPSBubG1zZ19oZHIoYWItPnNrYik7Cj4g
ICAgICAgICBubGgtPm5sbXNnX2xlbiA9IGFiLT5za2ItPmxlbiAtIE5MTVNHX0hEUkxFTjsKPgo+
ICAgICAgICAgaWYgKGF1ZGl0X3BpZCkgewo+ICAgICAgICAgICAgIHNrYl9xdWV1ZV90YWlsKCZh
dWRpdF9za2JfcXVldWUsIGFiLT5za2IpOwo+ICAgICAgICAgICAgIHdha2VfdXBfaW50ZXJydXB0
aWJsZSgma2F1ZGl0ZF93YWl0KTsKPiAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgYXVk
aXRfcHJpbnRrX3NrYihhYi0+c2tiKTsgLy8gPC0gYXVkaXRfcGlkID09IE5VTEwgd2hlbiBhdWRp
dGQgaXMKPiBraWxsZWQKPiAgICAgICAgIH0KPiAgICAgICAgIGFiLT5za2IgPSBOVUxMOwo+ICAg
ICB9Cj4gICAgIGF1ZGl0X2J1ZmZlcl9mcmVlKGFiKTsKPiB9Cj4gLT4gYXVkaXRfcHJpbnRrX3Nr
YiAtPiBhdWRpdF9sb2dfbG9zdCAtPgo+IHZvaWQgYXVkaXRfcGFuaWMoY29uc3QgY2hhciAqbWVz
c2FnZSkKPiB7Cj4gICAgIHN3aXRjaCAoYXVkaXRfZmFpbHVyZSkKPiAgICAgewo+ICAgICBjYXNl
IEFVRElUX0ZBSUxfU0lMRU5UOgo+ICAgICAgICAgYnJlYWs7Cj4gICAgIGNhc2UgQVVESVRfRkFJ
TF9QUklOVEs6Cj4gICAgICAgICBpZiAocHJpbnRrX3JhdGVsaW1pdCgpKQo+ICAgICAgICAgICAg
IHByaW50ayhLRVJOX0VSUiAiYXVkaXQ6ICVzXG4iLCBtZXNzYWdlKTsKPiAgICAgICAgIGJyZWFr
Owo+ICAgICBjYXNlIEFVRElUX0ZBSUxfUEFOSUM6Cj4gICAgICAgICAvKiB0ZXN0IGF1ZGl0X3Bp
ZCBzaW5jZSBwcmludGsgaXMgYWx3YXlzIGxvc2V5LCB3aHkgYm90aGVyPyAqLwo+ICAgICAgICAg
aWYgKGF1ZGl0X3BpZCkgLy8gPC0gYXVkaXRfcGlkIG5vdCBOVUxMIGJlY2F1c2UgYXVkaXRkIGlz
IHJlc3RhcnRpbmcKPiAgICAgICAgICAgICBwYW5pYygiYXVkaXQ6ICVzXG4iLCBtZXNzYWdlKTsK
PiAgICAgICAgIGJyZWFrOwo+ICAgICB9Cj4gfQo+Cj4gSG93IHRvIHJlcHJvZHVjZe+8mgo+IDEu
IHNldCBhdWRpdC1mYWlsdXJlIHRvIEFVRElUX0ZBSUxfUEFOSUMoMikgYW5kIGFkZCBhIHJhbmRv
bSBhdWRpdCBydWxlIGxpa2U6Cj4gW3Jvb3RAdGVzdCB+XSMgY2F0IC9ldGMvYXVkaXQvcnVsZXMu
ZC9hdWRpdC5ydWxlcwo+IC1ECj4gLWIgODE5Mgo+IC1mIDIKPiAtdyAvZXRjL2hvc3RzIC1wIHJ3
YSAtayBob3N0cwo+IDIuIGtlZXAga2lsbGluZyBhdWRpdGQgYW5kIHRoZW4gc3RhcnRpbmcgYXVk
aXRkLCBmb3IgZXhhbXBsZToKPiB3aGlsZSB0cnVlOyBkbyBwcyBhdXggfCBncmVwICIvc2Jpbi9h
dWRpdGQiIHwgZ3JlcCAtdiAiZ3JlcCIgfCBhd2sgJ3twcmludAo+ICQyfScgfCB4YXJncyBraWxs
OyBzZXJ2aWNlIGF1ZGl0ZCBzdGFydDsgc3lzdGVtY3RsIHJlc2V0LWZhaWxlZAo+IGF1ZGl0ZC5z
ZXJ2aWNlOyBkb25lCj4gMy4gbG9nIGluIGEgbG93IHByaXZpbGVnZSB1c2VyIGFuZCBrZWVwIHJl
YWRpbmcgL2V0Yy9ob3N0cywgZm9yIGV4YW1wbGU6Cj4gd2hpbGUgdHJ1ZTsgZG8gY2F0IC9ldGMv
aG9zdHMgPiAvZGV2L251bGw7IGRvbmUKPiA0LiBrZXJuZWwgcGFuaWMgd2lsbCBoYXBwZW4gd2l0
aGluIHNldmVyYWwgbWludXRlcwo+Cj4gVGhhbmtzLgoKLS0gCnBhdWwgbW9vcmUKd3d3LnBhdWwt
bW9vcmUuY29tCgoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhh
dC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0


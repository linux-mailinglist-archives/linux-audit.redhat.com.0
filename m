Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 515121B0E41
	for <lists+linux-audit@lfdr.de>; Mon, 20 Apr 2020 16:25:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587392715;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VLV7/9WvGm1eveZOba4M+TWYeDG0fJxODi55kenYCbw=;
	b=GsMGIIMtLPHyE/ZvpR1cSsIraGKdVuVbDxlKgjwBIO1n2Y0VqwrmFlGlYX8LBUVVcXce2L
	ViClwaBF04WwDz/UgGy3c9b1tyaVW5aZMCpz98LCd1T5cMQKMclC3/pmhc5eDGy6Jb5SkS
	eiyCV+OH1OvEgwY/FBsa6GHYQ0YAEKI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-dI3UdF_CPuWUEajpJpLHJg-1; Mon, 20 Apr 2020 10:25:13 -0400
X-MC-Unique: dI3UdF_CPuWUEajpJpLHJg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41F85800D5C;
	Mon, 20 Apr 2020 14:25:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F111E4DA29;
	Mon, 20 Apr 2020 14:25:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0A1B18089C8;
	Mon, 20 Apr 2020 14:24:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KEOlWi027754 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 10:24:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9A3172166B2A; Mon, 20 Apr 2020 14:24:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 962862166B29
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 14:24:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92DE2800296
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 14:24:45 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-319-xpt4xzolObOqYLyoogvENQ-1; Mon, 20 Apr 2020 10:24:43 -0400
X-MC-Unique: xpt4xzolObOqYLyoogvENQ-1
Received: by mail-ej1-f68.google.com with SMTP id n4so8059536ejs.11
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 07:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=S7AQQkwMe4TZOuAIonqMFpAj9Q7C4Xn/N4CzlGnI9Oo=;
	b=Si5EtTrHYGHV3/VUWz79PwFn1MYhjB8fMRsHTxqDR106/ynkTvxHZv01aYJuKWr/FD
	IeWHA/K87siY0iweGFxiSGESI2+yX7cBTtKfSEGIWA8pflOCAgv7Ax9x/fwlN4YUmG9I
	PgCa94vMU33/aVLNsw4jshUlyO/RMU91yJ2f41k4dCZsQgUSWaSn8mCqS/4JJ3l+3hrg
	/R9mggrykTsMc+n3eLajNTDgZ0zoMCyorXULtm7biWWuWwQMGdhjr442UHQrC9r1I4Ni
	kM5iSJE4xPItBiT3XVR3EqfLvSn+fToB38DBHAhdsat8HKmwj8m7m0B5oQZ/hpW/Bz0J
	yuMQ==
X-Gm-Message-State: AGi0PuZNyfcLm/YFgWELvyAv1nscGxt9zwRXzaMQpxNS+ZNYrE1svxqS
	cnVZj7esxf5TwsgKxZa7iCDqdPHPFesxL6TaUo8J
X-Google-Smtp-Source: APiQypKtXLBl0Hla/LYOHmk4XQNgnEKyeZrNLZRNSbaFx7whxQUDOVdKC3tGRoAOqEN5eYbRj0D5F03hUBIVbt5Q9i4=
X-Received: by 2002:a17:906:4cd2:: with SMTP id
	q18mr9255670ejt.70.1587392681737; 
	Mon, 20 Apr 2020 07:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <CANTwqXCxk0_U2heNR0ua3Pb-ic=vsJj0Jot9z=3WhTMwfRKSag@mail.gmail.com>
In-Reply-To: <CANTwqXCxk0_U2heNR0ua3Pb-ic=vsJj0Jot9z=3WhTMwfRKSag@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 20 Apr 2020 10:24:30 -0400
Message-ID: <CAHC9VhQEqrwmWt8MSwv-sDXbo25K=YtBtHSy_-zR4Cy6Uk2X4w@mail.gmail.com>
Subject: Re: kernel: audit.c: is it a memleak of net in function
	audit_send_reply
To: =?UTF-8?B?5Lq/5LiA?= <teroincn@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03KEOlWi027754
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBBcHIgMjAsIDIwMjAgYXQgMzo1NCBBTSDkur/kuIAgPHRlcm9pbmNuQGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiBIaSwgYWxsOgo+Cj4gd2hlbiByZXZpZXdpbmcgY29kZSBpbiBmdW5jdGlv
biBhdWRpdF9zZW5kX3JlcGx5LCBJIG5vdGljZSB0aGF0IGlmCj4ga3RocmVhZF9ydW4gcmV0dXJu
IGZhaWx1cmUsIHRoZSBuZXQgcmVmZXJlbmNlIHdvdWxkIG5vdCBiZSByZWxlYXNlZAo+IGJlY2F1
c2UgcmVwbHkgaGFzIGJlZW4ga2ZyZWUgZGlyZWN0bHkuCgpUaGFua3MgZm9yIHJlcG9ydGluZyB0
aGlzLgoKTG9va2luZyBhdCB0aGUgY29kZSwgaXQncyBhIGxpdHRsZSB3b3JzZSB0aGFuIHRoYXQu
ICBJZiBrdGhyZWFkX3J1bigpCmZhaWxzIHRoZW4gYXVkaXRfc2VuZF9yZXBseSgpIHdpbGwgcmV0
dXJuIGVhcmx5LCBob2xkaW5nIGJvdGggYQpyZWZlcmVuY2UgdG8gQG5ldCBhcyB3ZWxsIGFzIGxl
YWtpbmcgQHJlcGx5LgoKTGV0IG1lIGZpbmlzaCBnZXR0aW5nIHRocm91Z2ggbXkgbWFpbCBhbmQg
SSdsbCBwdXQgdG9nZXRoZXIgYSBxdWljawpwYXRjaCB0byByZXNvbHZlIHRoaXMgKEknbSBzZWVp
bmcgYSBmZXcgb3RoZXIgcmVsYXRlZCB0aGluZ3Mgd2Ugc2hvdWxkCmZpeCBpbiBhdWRpdF9zZW5k
X3JlcGx5KCkpLgoKPiBzdGF0aWMgdm9pZCBhdWRpdF9zZW5kX3JlcGx5KHN0cnVjdCBza19idWZm
ICpyZXF1ZXN0X3NrYiwgaW50IHNlcSwgaW50Cj4gdHlwZSwgaW50IGRvbmUsCj4gICAgICBpbnQg
bXVsdGksIGNvbnN0IHZvaWQgKnBheWxvYWQsIGludCBzaXplKQo+IHsKPiAgICAgc3RydWN0IG5l
dCAqbmV0ID0gc29ja19uZXQoTkVUTElOS19DQihyZXF1ZXN0X3NrYikuc2spOwo+ICAgICBzdHJ1
Y3Qgc2tfYnVmZiAqc2tiOwo+ICAgICBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzazsKPiAgICAgc3Ry
dWN0IGF1ZGl0X3JlcGx5ICpyZXBseSA9IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCBhdWRpdF9yZXBs
eSksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBHRlBfS0VSTkVMKTsKPgo+ICAgICBpZiAoIXJlcGx5KQo+ICAgICAgICAgcmV0dXJu
Owo+Cj4gICAgIHNrYiA9IGF1ZGl0X21ha2VfcmVwbHkoc2VxLCB0eXBlLCBkb25lLCBtdWx0aSwg
cGF5bG9hZCwgc2l6ZSk7Cj4gICAgIGlmICghc2tiKQo+ICAgICAgICAgZ290byBvdXQ7Cj4KPiAg
ICAgcmVwbHktPm5ldCA9IGdldF9uZXQobmV0KTsgICAgIC8vIGhvbGQgYSByZWZlcmVuY2Ugb2Yg
bmV0IGhlcmUKPiAgICAgcmVwbHktPnBvcnRpZCA9IE5FVExJTktfQ0IocmVxdWVzdF9za2IpLnBv
cnRpZDsKPiAgICAgcmVwbHktPnNrYiA9IHNrYjsKPgo+ICAgICB0c2sgPSBrdGhyZWFkX3J1bihh
dWRpdF9zZW5kX3JlcGx5X3RocmVhZCwgcmVwbHksICJhdWRpdF9zZW5kX3JlcGx5Iik7Cj4gICAg
IGlmICghSVNfRVJSKHRzaykpCj4gICAgICAgICByZXR1cm47Cj4gICAgIGtmcmVlX3NrYihza2Ip
Owo+Cj4gICAgIG91dDoKPiAgICAgICAgIGtmcmVlKHJlcGx5KTsgICAgICAvLyBrZnJlZSByZXBs
eSB3aXRob3V0IHJlbGVhc2UgdGhlIG5ldCByZWZlcmVuY2UuCj4gfQoKCgotLSAKcGF1bCBtb29y
ZQp3d3cucGF1bC1tb29yZS5jb20KCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgt
YXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtYXVkaXQ=


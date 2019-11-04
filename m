Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 948A8EE2C3
	for <lists+linux-audit@lfdr.de>; Mon,  4 Nov 2019 15:42:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572878523;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YGyWp1zPOjOM2xPECbk6GALMvxL2URigwpDeSRXAUDE=;
	b=Za0N8o31AdGnfLcv9C9+XIcpXzE62SUi3eXxqzdKe6T4lprIltsovNjSB9k7yNDxaj1tEw
	ftmE6gsot/EuNykOnLGuJgc5e3jMyMmFZ++x+YvtehRAwkzrjIqUPXiPLw4guxFlUsQXMj
	AAJxEvgtd07HYyxuA0VyYfQ8+exDqc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-bpBK0YVcMxanTGSmN6fZUA-1; Mon, 04 Nov 2019 09:42:00 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76C2A1005509;
	Mon,  4 Nov 2019 14:41:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45DEC60C88;
	Mon,  4 Nov 2019 14:41:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE2B74BB5B;
	Mon,  4 Nov 2019 14:41:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA4DkH29014622 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 4 Nov 2019 08:46:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2C936600F0; Mon,  4 Nov 2019 13:46:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA628600C4;
	Mon,  4 Nov 2019 13:46:06 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B59F44BB78;
	Mon,  4 Nov 2019 13:46:06 +0000 (UTC)
Date: Mon, 4 Nov 2019 08:46:06 -0500 (EST)
From: Vladis Dronov <vdronov@redhat.com>
To: Jiri Benc <jbenc@redhat.com>
Message-ID: <1790619604.12242825.1572875166654.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191104140518.67471654@redhat.com>
References: <20190809141831.GB9377@krava> <2985228.9kGasGrDWd@x2>
	<20190812075922.GA3012@krava> <5293423.BmRMD7FMx9@x2>
	<20190812143257.GC23992@krava> <20190814073323.GA16363@krava>
	<20190820135453.GH24105@krava> <20191104140518.67471654@redhat.com>
Subject: Re: [RFC] audit support for BPF notification
MIME-Version: 1.0
X-Originating-IP: [10.40.205.146, 10.4.195.23]
Thread-Topic: audit support for BPF notification
Thread-Index: sgcox/7XoSlP4GHZyiGz5ocfl3xlSw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA4DkH29014622
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: bpBK0YVcMxanTGSmN6fZUA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

W2FuIGFkZGl0aW9uXQoKSSBhbHNvIGJlbGlldmUgdGhhdCB0aGlzIGxvZyBlbnRyeSBzaG91bGQg
aW5jbHVkZSBwcm9ncmFtIHNvdXJjZSBhbmQvb3IgYnl0ZWNvZGUKY2hlY2tzdW0gc28gY3VzdG9t
ZXIvb3VyIHN1cHBvcnQgY2FuIHZlcmlmeSB0aGF0IGV4YWN0bHkgdGhpcyBlQlBGIHByb2dyYW0g
d2FzCmxvYWRlZC91bmxvYWRlZCBhbmQgbm90IHRoZSBwcm9ncmFtIHRoYXQgc29tZW9uZSBzdGF0
ZXMgdGhhdCBpdCB3YXMgbG9hZGVkLgoKQmVzdCByZWdhcmRzLApWbGFkaXMgRHJvbm92IHwgUmVk
IEhhdCwgSW5jLiB8IFRoZSBDb3JlIEtlcm5lbCB8IFNlbmlvciBTb2Z0d2FyZSBFbmdpbmVlcgoK
LS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+IEZyb206ICJKaXJpIEJlbmMiIDxqYmVuY0By
ZWRoYXQuY29tPgo+IFRvOiAiSmlyaSBPbHNhIiA8am9sc2FAcmVkaGF0LmNvbT4KPiBDYzogIlN0
ZXZlIEdydWJiIiA8c2dydWJiQHJlZGhhdC5jb20+LCBsaW51eC1hdWRpdEByZWRoYXQuY29tLCAi
U3RhbmlzbGF2IEtvemluYSIgPHNrb3ppbmFAcmVkaGF0LmNvbT4sICJZYXVoZW5pCj4gS2FsaXV0
YSIgPHlhdWhlbmkua2FsaXV0YUByZWRoYXQuY29tPiwgIlRva2UgSMO4aWxhbmQtSsO4cmdlbnNl
biIgPHRva2VAcmVkaGF0LmNvbT4sICJBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8iCj4gPGFjbWVA
cmVkaGF0LmNvbT4sICJKZXNwZXIgRGFuZ2FhcmQgQnJvdWVyIiA8YnJvdWVyQHJlZGhhdC5jb20+
LCAiVmxhZCBEcm9ub3YiIDx2ZHJvbm92QHJlZGhhdC5jb20+LCAiUGV0ciBNYXRvdXNlayIKPiA8
cG1hdG91c2VAcmVkaGF0LmNvbT4sICJSYXNoaWQgS2hhbiIgPHJraGFuQHJlZGhhdC5jb20+Cj4g
U2VudDogTW9uZGF5LCBOb3ZlbWJlciA0LCAyMDE5IDI6MDU6MTggUE0KPiBTdWJqZWN0OiBSZTog
W1JGQ10gYXVkaXQgc3VwcG9ydCBmb3IgQlBGIG5vdGlmaWNhdGlvbgo+IAo+IFNlZW1zIHRoZXJl
IGhhdmUgYmVlbiBubyByZXBseSB0byB0aGlzLi4uCj4gCj4gSmlyaSwgd2hhdCBpcyB0aGUgY3Vy
cmVudCBzdGF0dXM/Cj4gCj4gVmxhZCwgd2hhdCBpcyB0aGUgUHJvZHVjdCBTZWN1cml0eSdzIHZp
ZXcgb24gdGhpcz8gSXMgdGhlIGF1ZGl0IHN1cHBvcnQKPiBmb3IgYnBmIHByb2dyYW1zIGxvYWRp
bmcvdW5sb2FkaW5nIGEgcmVxdWlyZW1lbnQgZm9yIGZ1bGwgc3VwcG9ydCBvZgo+IGVCUEYgKGFz
IG9wcG9zZWQgdG8gdGVjaCBwcmV2aWV3KT8KPiAKPiBUaGFua3MsCj4gCj4gIEppcmkKCi0tCkxp
bnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3
LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdA==


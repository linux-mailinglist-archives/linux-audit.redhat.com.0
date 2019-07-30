Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C0E7A876
	for <lists+linux-audit@lfdr.de>; Tue, 30 Jul 2019 14:29:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB55E3082141;
	Tue, 30 Jul 2019 12:29:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1666660BF7;
	Tue, 30 Jul 2019 12:29:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 301FA1800202;
	Tue, 30 Jul 2019 12:29:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6UCTU68027542 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 30 Jul 2019 08:29:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 67A71100EBA2; Tue, 30 Jul 2019 12:29:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-145.phx2.redhat.com [10.3.116.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF7D110016EB;
	Tue, 30 Jul 2019 12:29:25 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: =?utf-8?B?5p2o5rW3?= <hai.yang@magic-shield.com>
Subject: Re: How to filter PROCTITLE events
Date: Tue, 30 Jul 2019 08:29:24 -0400
Message-ID: <7248178.66rVtY164I@x2>
Organization: Red Hat
In-Reply-To: <tencent_5D3084A9009B5E362A73C120@qq.com>
References: <tencent_2653C64E6532CFFE233BCDFC@qq.com> <1899046.JkZJ7mvpU2@x2>
	<tencent_5D3084A9009B5E362A73C120@qq.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6UCTU68027542
X-loop: linux-audit@redhat.com
Cc: linux-audit <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 30 Jul 2019 12:29:37 +0000 (UTC)

SGVsbG8sCgpPbiBUdWVzZGF5LCBKdWx5IDMwLCAyMDE5IDg6MTg6NDEgQU0gRURUIOadqOa1tyB3
cm90ZToKPiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uIG9uIHJlYWQvd3JpdGUuIEkgaGF2ZSB0
d28gbW9yZSBxdWVzdGlvbnMgd2hpY2ggSQo+IGhhdmVuJ3QgZmlndXJlZCBvdXQuCj4gMSkgRG9l
cyBhdWRpdGN0bCBydWxlcyBzdXBwb3J0IHJlZ3VsYXIgZXhwcmVzc2lvbnM/Cj4gRm9yIHNvbWUg
cGFyYW1zLCBpdCBpcyBub3QgZWFzeSB0byBmaWx0ZXIgc3BlY2lmaWMgbWVzc2FnZXMgdXNpbmcg
4oCcPeKAnSBvcgo+ICIhPSIuIAoKTm8uIE1vc3QgdGhpbmdzIGluc2lkZSB0aGUga2VybmVsIGFy
ZSBudW1iZXJzLiBUZXh0IGlzIGEgaHVtYW4gY29udmVuaWVuY2UuCgo+IDIpIEluIG1lc3NhZ2Ug
cGF5bG9hZCwgc29tZSBmaWVsZHMgYXJlIG5vdCB3aGF0IHdlIGNhcmUgYWJvdXQuIEFueQo+IHdh
eSB3ZSBjYW4gcmVkdWNlIHRoZSBmaWVsZHMvcGFyYW1zIGluIGF1ZGl0IGxvZz8gCgpCeSBkZWZh
dWx0LCBuby4gWW91IGNvdWxkIHBhdGNoIGF1ZGl0ZCB0byBkbyBzbyBpZiBpdHMgcmVhbGx5IG5l
Y2Vzc2FyeS4KCi1TdGV2ZQoKCgoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1
ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWF1ZGl0

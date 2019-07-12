Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B036B66C52
	for <lists+linux-audit@lfdr.de>; Fri, 12 Jul 2019 14:14:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F389B356D2;
	Fri, 12 Jul 2019 12:14:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D27795DAAC;
	Fri, 12 Jul 2019 12:14:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66C0841F40;
	Fri, 12 Jul 2019 12:14:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6CCEEg7000640 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 12 Jul 2019 08:14:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A90E519C58; Fri, 12 Jul 2019 12:14:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-22.phx2.redhat.com [10.3.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3529419C4F;
	Fri, 12 Jul 2019 12:14:11 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: overhead of auditd
Date: Fri, 12 Jul 2019 08:14:11 -0400
Message-ID: <9307307.NKOEW2x8Z6@x2>
Organization: Red Hat
In-Reply-To: <tencent_5FA425C1329B32126C1D89F1@qq.com>
References: <tencent_5FA425C1329B32126C1D89F1@qq.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6CCEEg7000640
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Fri, 12 Jul 2019 12:14:34 +0000 (UTC)

SGVsbG8sCgpPbiBUaHVyc2RheSwgSnVseSAxMSwgMjAxOSAxMToyMzo0NSBQTSBFRFQg5p2o5rW3
IHdyb3RlOgo+IFR1cm5pbmcgb24gYWxsIHN5c3RlbSBjYWxscyBpbiBhdWRpdC5ydWxlcywgYW5k
IHRyYW5zZmVycmluZyBhIHRhciBmaWxlIHRvCj4gdGhlIHRhcmdldCBzeXN0ZW0gKENlbnRPUyA3
LCA0IGNvcmVzKSwgSSBmb3VuZCAiYXVkaXRkIiBjb25zdW1lcyBoaWdoIENQVQo+IHVzYWdlLiBJ
cyBpdCBleHBlY3RlZD8KCkl0IHdvdWxkIG5vdCBiZSBzdXJwcmlzaW5nLiBTb21lIHN5c3RlbSBj
YWxscyBoYXZlIG1vcmUgb3ZlcmhlYWQgdGhhbiBvdGhlcnMuIApTbywgZGVwZW5kaW5nIG9uIGV2
ZXJ5dGhpbmcgdGhhdCBpcyBydW5uaW5nLCB5b3UgY2FuIGtpbGwgeW91ciBzeXN0ZW0uCgo+IEJU
VywgYWZ0ZXIgdHVybmluZyB3cml0ZS1sb2dzIG9mZiwgYW5kIGFkZCBkaXNwYXRjaGVyLCBib3Ro
ICJhdWRpc3BkIiBhbmQKPiAiYXVkaXRkIiBhcmUgY29uc3VtaW5nIGhpZ2ggQ1BVLgoKVGhleSBo
YXZlIGEgbG90IG9mIGV2ZW50cyB0byBoYW5kbGUuCgotU3RldmUKCgoKLS0KTGludXgtYXVkaXQg
bWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

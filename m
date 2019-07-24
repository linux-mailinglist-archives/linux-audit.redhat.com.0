Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B92E572E84
	for <lists+linux-audit@lfdr.de>; Wed, 24 Jul 2019 14:14:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A478A3061211;
	Wed, 24 Jul 2019 12:14:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10ABC5D9DE;
	Wed, 24 Jul 2019 12:14:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A0DE1800206;
	Wed, 24 Jul 2019 12:14:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6OCE6CL003247 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 24 Jul 2019 08:14:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2849F601B7; Wed, 24 Jul 2019 12:14:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-128.phx2.redhat.com [10.3.116.128])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A93AE600C7;
	Wed, 24 Jul 2019 12:14:03 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: How to filter PROCTITLE events
Date: Wed, 24 Jul 2019 08:14:02 -0400
Message-ID: <1846383.7Xiv5u5QpR@x2>
Organization: Red Hat
In-Reply-To: <tencent_2653C64E6532CFFE233BCDFC@qq.com>
References: <tencent_2653C64E6532CFFE233BCDFC@qq.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6OCE6CL003247
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 24 Jul 2019 12:14:24 +0000 (UTC)

T24gV2VkbmVzZGF5LCBKdWx5IDI0LCAyMDE5IDU6Mjc6NTkgQU0gRURUIOadqOa1tyB3cm90ZToK
PiBIaQo+IAo+IEkgYW0gbG9va2luZyBmb3IgdGhlIG1ldGhvZCB0byBmaWx0ZXIgdGhlIFBST0NU
SVRMRSBldmVudHMgdmlhIGF1ZGl0Y3RsLgo+IAo+IEl0IGlzIHNhaWQgd2UgY2FuIGRvIGl0LCBi
dXQgSSBjb3VsZCBub3QgZmlndXJlIG91dCBob3cuCgpEaWQgeW91IHJlYWQgYWJvdXQgdGhlIGV4
Y2x1ZGUgZmlsdGVyPyAgOi0pCgo+ICJUaGUgcHJvY3RpdGxlIGV2ZW50IGlzIGVtaXR0ZWQgZHVy
aW5nIHN5c2NhbGwgYXVkaXRzLCBhbmQgY2FuIGJlIGZpbHRlcmVkCj4gd2l0aCBhdWRpdGN0bC4i
CgotYSBhbHdheXMsZXhjbHVkZSAtRiBtc2d0eXBlPVBST0NUSVRMRQoKVGhlcmUgaXMgYW5vdGhl
ciBleGFtcGxlIGluIHRoZSAyMC1kb250LWF1ZGl0LnJ1bGVzIGZpbGUuCgotU3RldmUKCgoKLS0K
TGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93
d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

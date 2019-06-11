Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9D341882
	for <lists+linux-audit@lfdr.de>; Wed, 12 Jun 2019 00:59:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5CD803082E68;
	Tue, 11 Jun 2019 22:58:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A67525E7A9;
	Tue, 11 Jun 2019 22:58:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC2331806B11;
	Tue, 11 Jun 2019 22:58:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5BMudQw019096 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 18:56:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 49EBE64025; Tue, 11 Jun 2019 22:56:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 435AF60C7F
	for <linux-audit@redhat.com>; Tue, 11 Jun 2019 22:56:37 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C99881DFF
	for <linux-audit@redhat.com>; Tue, 11 Jun 2019 22:56:21 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id x25so8694980ljh.2
	for <linux-audit@redhat.com>; Tue, 11 Jun 2019 15:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UScBCj1990BVlduYhjEjZO8DvaVBEZygOQq5R++5jBU=;
	b=h/fMYVlzXohUsYXVqGlAQg+VF1DcgMP20jyQOEs9YAX4WZmM8C4gkGlDl3BrOHKrNg
	YniodCgimo7I2vE96B9XnivOnwGbtKDlOzoDSdVwEH5HAzKks5PVy+Nhl8bnSARMsxST
	UNOs6JL7vMWACSK3nSKWioA0RmwRl/zFcdR+P/T+OiDHFfxOF7Ief9VEsd2R/irMIAdg
	HrNAehA5YJamdl8Uky0VnmfBkXhamENu+qvJTjv6gAxfxgG1XhOo3/SRbrSAfPnc/CQG
	8rqjAXdHTsFrTf1fuNqBQ6fkzhOyCnbhGL8uwzGLQOkmjo7abnqX55wP4z8KjM0fgMqO
	HLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UScBCj1990BVlduYhjEjZO8DvaVBEZygOQq5R++5jBU=;
	b=GugvexHQwVwKpdxii4hCFHz1H8Gzt5kI1YAVDJOuomTLgVYx+du8lVDr6CFBV2lUCP
	imZl1ge7HsS+ABBQUyX5YidGKz8OVE5MJjEVHPeNrKOsYEzL5JkKjPhvPDapPr/Uj8cf
	bfAYkx6kmeRqcHHmh7M0I68JPtI7ObX5+0A36KH8tUMJVwmgJ0RJ182/JDj+bOzUJXCh
	Bxs8ljdIX8aZE+Wltx4avGneQsy32JfoCaL3mX2pINFjvkUNrWixr8drHb5GGHgC+mKd
	CrN8q9U9E3lgKeWDUyBoQHhiUia6BvU1Ge283vJlYZtJu73zuR6rcnC5kDh7Z5CkA18U
	HvBA==
X-Gm-Message-State: APjAAAUx8mYE4ZlHf8BNWe2Xh9PU7tzNoLrQDIl2h4+bDEAiLVBQZ6Jk
	cxBDKltBbQNOAHZFqkNhUiPP28PcrCFGl5Mv9dn/dG4=
X-Google-Smtp-Source: APXvYqwtxK+/bIRr62KFoQFlOyzNPs5ldqCN7Rv6OQD1h2T8J38lOn5K6QCTh1FuTca1QK796UfokyzhNWn9yHXqvgI=
X-Received: by 2002:a2e:9dd7:: with SMTP id x23mr8869166ljj.160.1560293779452; 
	Tue, 11 Jun 2019 15:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190611080719.28625-1-omosnace@redhat.com>
In-Reply-To: <20190611080719.28625-1-omosnace@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 11 Jun 2019 18:56:07 -0400
Message-ID: <CAHC9VhSXZp6QierOGRBXmyUf=pT3Y4mf=78AmQAquuQ8-WBSGw@mail.gmail.com>
Subject: Re: [PATCH] selinux: log raw contexts as untrusted strings
To: Ondrej Mosnacek <omosnace@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 11 Jun 2019 22:56:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Tue, 11 Jun 2019 22:56:21 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.191  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5BMudQw019096
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 11 Jun 2019 22:59:00 +0000 (UTC)

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNDowNyBBTSBPbmRyZWogTW9zbmFjZWsgPG9tb3NuYWNl
QHJlZGhhdC5jb20+IHdyb3RlOgo+IFRoZXNlIHN0cmluZ3MgbWF5IGNvbWUgZnJvbSB1bnRydXN0
ZWQgc291cmNlcyAoZS5nLiBmaWxlIHhhdHRycykgc28gdGhleQo+IG5lZWQgdG8gYmUgcHJvcGVy
bHkgZXNjYXBlZC4KPgo+IFJlcHJvZHVjZXI6Cj4gICAgICMgc2V0ZW5mb3JjZSAwCj4gICAgICMg
dG91Y2ggL3RtcC90ZXN0Cj4gICAgICMgc2V0ZmF0dHIgLW4gc2VjdXJpdHkuc2VsaW51eCAtdiAn
a3XFmWVjw60gxZnDrXplaycgL3RtcC90ZXN0Cj4gICAgICMgcnVuY29uIHN5c3RlbV91OnN5c3Rl
bV9yOnNzaGRfdDpzMCBjYXQgL3RtcC90ZXN0Cj4gICAgIChsb29rIGF0IHRoZSBnZW5lcmF0ZWQg
QVZDcykKPgo+IEFjdHVhbCByZXN1bHQ6Cj4gICAgIHR5cGU9QVZDIFsuLi5dIHRyYXdjb249a3XF
mWVjw60gxZnDrXplawo+Cj4gRXhwZWN0ZWQgcmVzdWx0Ogo+ICAgICB0eXBlPUFWQyBbLi4uXSB0
cmF3Y29uPTZCNzVDNTk5NjU2M0MzQUQyMEM1OTlDM0FEN0E2NTZCCj4KPiBGaXhlczogZmVkZTE0
ODMyNGMzICgic2VsaW51eDogbG9nIGludmFsaWQgY29udGV4dHMgaW4gQVZDcyIpCj4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyB2NS4xKwo+IFNpZ25lZC1vZmYtYnk6IE9uZHJlaiBNb3Nu
YWNlayA8b21vc25hY2VAcmVkaGF0LmNvbT4KPiAtLS0KPiAgc2VjdXJpdHkvc2VsaW51eC9hdmMu
YyB8IDEwICsrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKClRoYW5rcywgdGhlIHBhdGNoIGxvb2tzIGZpbmUgdG8gbWUsIGJ1dCBpdCBp
cyBib3JkZXJsaW5lIC1zdGFibGUKbWF0ZXJpYWwgaW4gbXkgb3Bpbmlvbi4gIEknbGwgYWRkIGl0
IHRvIHRoZSBzdGFibGUtNS4yIGJyYW5jaCwgYnV0IGluCnRoZSBmdXR1cmUgSSB3b3VsZCBwcmVm
ZXIgaWYgeW91IGxlZnQgdGhlIHN0YWJsZSBtYXJraW5nIG9mZiBwYXRjaGVzCmFuZCBzZW50IGEg
cmVwbHkgZGlzY3Vzc2luZyAqd2h5KiB0aGlzIHNob3VsZCBnbyB0byBzdGFibGUgc28gd2UgY2Fu
CmRpc2N1c3MgaXQuICBJIHJlYWxpemUgR3JlZyBsaWtlcyB0byBwdWxsIGEgbG90IG9mIHN0dWZm
IGludG8gc3RhYmxlLApidXQgSSB0cnkgdG8gYmUgYSBiaXQgbW9yZSBjb25zZXJ2YXRpdmUgYWJv
dXQgd2hhdCBnZXRzIG1hcmtlZC4gIEV2ZW4KdGhlIHNpbXBsZXN0IGZpeCBjYW4gc3RpbGwgYnJl
YWsgdGhpbmdzIDopCgpJJ20gZ29pbmcgdG8gc3RhcnQgYnVpbGRpbmcgYSB0ZXN0IGtlcm5lbCBu
b3cgd2l0aCB0aGlzIGZpeCwgYnV0IEkKbWlnaHQgaG9sZCBvZmYgb24gc2VuZGluZyB0aGlzIHVw
IHRvIExpbnVzIGZvciBhIGNvdXBsZSBvZiBkYXlzIHRvIHNlZQppZiBJIGNhbiBjYXRjaCBHZW4g
WmhhbmcncyBwYXRjaGVzIGluIHRoZSBzYW1lIFBSLgoKPiBkaWZmIC0tZ2l0IGEvc2VjdXJpdHkv
c2VsaW51eC9hdmMuYyBiL3NlY3VyaXR5L3NlbGludXgvYXZjLmMKPiBpbmRleCA4MzQ2YTRmN2M1
ZDcuLmE5OWJlNTA4ZjkzZCAxMDA2NDQKPiAtLS0gYS9zZWN1cml0eS9zZWxpbnV4L2F2Yy5jCj4g
KysrIGIvc2VjdXJpdHkvc2VsaW51eC9hdmMuYwo+IEBAIC03MzksMTQgKzczOSwyMCBAQCBzdGF0
aWMgdm9pZCBhdmNfYXVkaXRfcG9zdF9jYWxsYmFjayhzdHJ1Y3QgYXVkaXRfYnVmZmVyICphYiwg
dm9pZCAqYSkKPiAgICAgICAgIHJjID0gc2VjdXJpdHlfc2lkX3RvX2NvbnRleHRfaW52YWwoc2Fk
LT5zdGF0ZSwgc2FkLT5zc2lkLCAmc2NvbnRleHQsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICZzY29udGV4dF9sZW4pOwo+ICAgICAgICAgaWYgKCFyYyAmJiBz
Y29udGV4dCkgewo+IC0gICAgICAgICAgICAgICBhdWRpdF9sb2dfZm9ybWF0KGFiLCAiIHNyYXdj
b249JXMiLCBzY29udGV4dCk7Cj4gKyAgICAgICAgICAgICAgIGlmIChzY29udGV4dF9sZW4gJiYg
c2NvbnRleHRbc2NvbnRleHRfbGVuIC0gMV0gPT0gJ1wwJykKPiArICAgICAgICAgICAgICAgICAg
ICAgICBzY29udGV4dF9sZW4tLTsKPiArICAgICAgICAgICAgICAgYXVkaXRfbG9nX2Zvcm1hdChh
YiwgIiBzcmF3Y29uPSIpOwo+ICsgICAgICAgICAgICAgICBhdWRpdF9sb2dfbl91bnRydXN0ZWRz
dHJpbmcoYWIsIHNjb250ZXh0LCBzY29udGV4dF9sZW4pOwo+ICAgICAgICAgICAgICAgICBrZnJl
ZShzY29udGV4dCk7Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIHJjID0gc2VjdXJpdHlfc2lkX3Rv
X2NvbnRleHRfaW52YWwoc2FkLT5zdGF0ZSwgc2FkLT50c2lkLCAmc2NvbnRleHQsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzY29udGV4dF9sZW4pOwo+ICAg
ICAgICAgaWYgKCFyYyAmJiBzY29udGV4dCkgewo+IC0gICAgICAgICAgICAgICBhdWRpdF9sb2df
Zm9ybWF0KGFiLCAiIHRyYXdjb249JXMiLCBzY29udGV4dCk7Cj4gKyAgICAgICAgICAgICAgIGlm
IChzY29udGV4dF9sZW4gJiYgc2NvbnRleHRbc2NvbnRleHRfbGVuIC0gMV0gPT0gJ1wwJykKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBzY29udGV4dF9sZW4tLTsKPiArICAgICAgICAgICAgICAg
YXVkaXRfbG9nX2Zvcm1hdChhYiwgIiB0cmF3Y29uPSIpOwo+ICsgICAgICAgICAgICAgICBhdWRp
dF9sb2dfbl91bnRydXN0ZWRzdHJpbmcoYWIsIHNjb250ZXh0LCBzY29udGV4dF9sZW4pOwo+ICAg
ICAgICAgICAgICAgICBrZnJlZShzY29udGV4dCk7Cj4gICAgICAgICB9Cj4gIH0KPiAtLQo+IDIu
MjAuMQoKLS0gCnBhdWwgbW9vcmUKd3d3LnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBt
YWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=

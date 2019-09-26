Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A3332BF5F7
	for <lists+linux-audit@lfdr.de>; Thu, 26 Sep 2019 17:33:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F97210DCC8B;
	Thu, 26 Sep 2019 15:33:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2762D5C21A;
	Thu, 26 Sep 2019 15:33:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5DEC4EE68;
	Thu, 26 Sep 2019 15:33:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8QFVlY6030753 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 26 Sep 2019 11:31:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F276600CE; Thu, 26 Sep 2019 15:31:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88BB7600C6
	for <linux-audit@redhat.com>; Thu, 26 Sep 2019 15:31:47 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3568302C08D
	for <linux-audit@redhat.com>; Thu, 26 Sep 2019 15:31:45 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id 7so2643273ljw.7
	for <linux-audit@redhat.com>; Thu, 26 Sep 2019 08:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hn2BKNpEDnETMG1vl6OlBxnJv0OsEgm43gqddiFd3L8=;
	b=jeIGSlfnHuHWOnlWJUXcqKnbIdtnf3eWKQxCunNgHckAhzlBxayQpkTC8CGsAocTzR
	28l759p4wcIfkD8PTb8w7tHgWMTGhcKFEsdSYyVn3Ol2Tva1qSdQHvrK2kJzzzTR0M4X
	R4d8clVtGay4RTZN+AK8muNTkRnzt3q/gnBVFX+5h8icTy35ERDgxU4ZHsnlSrRo7qK+
	/5SheILQ9oO3DrsBO/zby3bauJC8AtCYXfuBQSAD17b7qB4PivNmnBjvwZUWyMKR0vlf
	RsdO39Es8vsQ50QKJpBDd9ZdQcRqUiTLr5+LwBqHO1ctMg8Fi2k6SCZETaqVkT0K1eGt
	xFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hn2BKNpEDnETMG1vl6OlBxnJv0OsEgm43gqddiFd3L8=;
	b=M7cscz2meobJa/3JoaID5lNEIEdEB2kdbAg8iif9z0a5AkEG84NbdqtRUguOAohF5b
	lNbeG9abLPwpFSyS3UdJhxDCQbD3ZQLrQCuo4pkIDugulXP6piWau3XZZECwkbYfUYpi
	hMjX6Enq7WmC3guOaoEFSCVKmZmFuZB7/ssEakZpn7vpznDkmRPA21r9qn4YKWcY1qU+
	8SXAwpgK6MnPNUnT+062H3UUMwJzHCPnjO5hoWaBTzdWbVydx4ls+D+BQWfojMbHApiq
	zVLb6S5vtLNyoBDho6vcZAlXM22ud++ztOWG+Ljkj5uAjpBSMYerMtgHDxlBJZz+TUvG
	fLeQ==
X-Gm-Message-State: APjAAAXFNtc+LmTQh1EQIJYq6CxOaq/4xaC/NCwdFPPM3PMV2txpaGcg
	/3p9WloyoEIkcuH0xT9pT9OudePEwbtaawtB31WD
X-Google-Smtp-Source: APXvYqzWZrnFx6WcIfnXVd8l3472Lw3xc7e+WWjTgm0YDldFz3u6OHTdrHgyM65PbAKbGJQkQjJelej7+XCsPXOygvw=
X-Received: by 2002:a2e:7c09:: with SMTP id x9mr2988571ljc.87.1569511904242;
	Thu, 26 Sep 2019 08:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <201909251348.A1542A52@keescook>
In-Reply-To: <201909251348.A1542A52@keescook>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 26 Sep 2019 11:31:32 -0400
Message-ID: <CAHC9VhRNmWw1__-haD1ZEekADTho3EJyXQMd6ETpOv4c8Qn9nw@mail.gmail.com>
Subject: Re: [PATCH] audit: Report suspicious O_CREAT usage
To: Kees Cook <keescook@chromium.org>, sgrubb@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 26 Sep 2019 15:31:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Thu, 26 Sep 2019 15:31:46 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8QFVlY6030753
X-loop: linux-audit@redhat.com
Cc: s.mesoraca16@gmail.com, kernel-hardening@lists.openwall.com,
	linux-kernel@vger.kernel.org, linux-audit@redhat.com,
	=?UTF-8?Q?J=C3=A9r=C3=A9mie_Galarneau?=
	<jeremie.galarneau@efficios.com>, viro@zeniv.linux.org.uk,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
	dan.carpenter@oracle.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Thu, 26 Sep 2019 15:33:08 +0000 (UTC)

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgNTowMiBQTSBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9t
aXVtLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIHJlbmFtZXMgdGhlIHZlcnkgc3BlY2lmaWMgYXVkaXRf
bG9nX2xpbmtfZGVuaWVkKCkgdG8KPiBhdWRpdF9sb2dfcGF0aF9kZW5pZWQoKSBhbmQgYWRkcyB0
aGUgQVVESVRfKiB0eXBlIGFzIGFuIGFyZ3VtZW50LiBUaGlzCj4gYWxsb3dzIGZvciB0aGUgY3Jl
YXRpb24gb2YgdGhlIG5ldyBBVURJVF9BTk9NX0NSRUFUIHRoYXQgY2FuIGJlIHVzZWQgdG8KPiBy
ZXBvcnQgdGhlIGZpZm8vcmVndWxhciBmaWxlIGNyZWF0aW9uIHJlc3RyaWN0aW9ucyB0aGF0IHdl
cmUgaW50cm9kdWNlZAo+IGluIGNvbW1pdCAzMGFiYTY2NTZmNjEgKCJuYW1laTogYWxsb3cgcmVz
dHJpY3RlZCBPX0NSRUFUIG9mIEZJRk9zIGFuZAo+IHJlZ3VsYXIgZmlsZXMiKS4gV2l0aG91dCB0
aGlzIGNoYW5nZSwgZGlzY292ZXJpbmcgdGhhdCB0aGUgcmVzdHJpY3Rpb24KPiBpcyBlbmFibGVk
IGNhbiBiZSB2ZXJ5IGNoYWxsZW5naW5nOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwv
Q0ErakpNeHZrcWpYSHkzRG5WNU1WaEZUTDJSVWhnMFdRLVhWRlczbmdEUU9ka0ZxMFBBQG1haWwu
Z21haWwuY29tCj4KPiBSZXBvcnRlZC1ieTogSsOpcsOpbWllIEdhbGFybmVhdSA8amVyZW1pZS5n
YWxhcm5lYXVAZWZmaWNpb3MuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEtlZXMgQ29vayA8a2Vlc2Nv
b2tAY2hyb21pdW0ub3JnPgo+IC0tLQo+IFRoaXMgaXMgbm90IGEgY29tcGxldGUgZml4IGJlY2F1
c2UgcmVwb3J0aW5nIHdhcyBicm9rZW4gaW4gY29tbWl0Cj4gMTU1NjRmZjBhMTZlICgiYXVkaXQ6
IG1ha2UgQU5PTV9MSU5LIG9iZXkgYXVkaXRfZW5hYmxlZCBhbmQKPiBhdWRpdF9kdW1teV9jb250
ZXh0IikKPiB3aGljaCBzcGVjaWZpY2FsbHkgZ29lcyBhZ2FpbnN0IHRoZSBpbnRlbnRpb24gb2Yg
dGhlc2UgcmVjb3JkczogdGhleQo+IHNob3VsZCBfYWx3YXlzXyBiZSByZXBvcnRlZC4gSWYgYXVk
aXRpbmcgaXNuJ3QgZW5hYmxlZCwgdGhleSBzaG91bGQgYmUKPiByYXRlbGltaXRlZC4KPgo+IElu
c3RlYWQgb2YgdXNpbmcgYXVkaXQsIHNob3VsZCB0aGlzIGp1c3QgZ28gYmFjayB0byB1c2luZwo+
IHByX3JhdGVsaW1pdGVkKCk/CgpJJ20gZ29pbmcgdG8gaWdub3JlIHRoZSByZW5hbWUgYW5kIG90
aGVyIGFzcGVjdHMgb2YgdGhpcyBwYXRjaCBmb3IgdGhlCm1vbWVudCBzbyB3ZSBjYW4gZm9jdXMg
b24gdGhlIHRvcGljIG9mIGlmL3doZW4vaG93IHRoZXNlIHJlY29yZHMKc2hvdWxkIGJlIGVtaXR0
ZWQgYnkgdGhlIGtlcm5lbC4KClVuZm9ydHVuYXRlbHksIHBlb3BsZSB0ZW5kIHRvIGdldCB2ZXJ5
IHVwc2V0IGlmIGF1ZGl0IGVtaXRzICphbnkqCnJlY29yZHMgd2hlbiB0aGV5IGhhdmVuJ3QgZXhw
bGljaXRseSBlbmFibGVkIGF1ZGl0LCB0aGUgc2lnbmlmaWNhbmNlCm9mIHRoZSByZWNvcmQgZG9l
c24ndCBzZWVtIHRvIG1hdHRlciwgd2hpY2ggaXMgd2h5IHlvdSBzZWUgcGF0Y2hlcwpsaWtlIDE1
NTY0ZmYwYTE2ZSAoImF1ZGl0OiBtYWtlIEFOT01fTElOSyBvYmV5IGF1ZGl0X2VuYWJsZWQgYW5k
CmF1ZGl0X2R1bW15X2NvbnRleHQiKS4gIFdlIGNvdWxkIGNvbnNpZGVyIGNvbnZlcnRpbmcgc29t
ZSByZWNvcmRzIHRvCnByaW50aygpcywgcmF0ZS1saW1pdGVkIG9yIG5vdCwgYnV0IHdlIG5lZWQg
dG8gYmFsYW5jZSB0aGlzIHdpdGggdGhlCnZhcmlvdXMgc2VjdXJpdHkgY2VydGlmaWNhdGlvbnMg
d2hpY2ggYXVkaXQgd2FzIGNyZWF0ZWQgdG8gc2F0aXNmeS4KSW4gc29tZSBjYXNlcyBhIHByaW50
aygpIGlzbid0IHN1ZmZpY2llbnQuCgpTdGV2ZSBpcyBwcm9iYWJseSB0aGUgb25seSBvbmUgd2hv
IHJlYWxseSBrZWVwcyB0cmFjayBvZiB0aGUgdmFyaW91cwphdWRpdGluZyByZXF1aXJlbWVudHMg
b2YgdGhlIGRpZmZlcmVudCBzZWN1cml0eSBjZXJ0aWZpY2F0aW9uczsgd2hhdApzYXkgeW91IFN0
ZXZlIG9uIHRoaXMgaXNzdWUgd2l0aCBBTk9NX0NSRUFUIHJlY29yZHM/CgotLSAKcGF1bCBtb29y
ZQp3d3cucGF1bC1tb29yZS5jb20KCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1h
dWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hdWRpdA==

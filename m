Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B20747C467
	for <lists+linux-audit@lfdr.de>; Wed, 31 Jul 2019 16:09:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A24E309C9B2;
	Wed, 31 Jul 2019 14:09:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 562FD16A59;
	Wed, 31 Jul 2019 14:09:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A372D1800203;
	Wed, 31 Jul 2019 14:09:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6VB7CdY025013 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 31 Jul 2019 07:07:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 129435DA61; Wed, 31 Jul 2019 11:07:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B9845D72A
	for <linux-audit@redhat.com>; Wed, 31 Jul 2019 11:07:06 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 473893082201
	for <linux-audit@redhat.com>; Wed, 31 Jul 2019 11:07:05 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id u14so31695838pfn.2
	for <linux-audit@redhat.com>; Wed, 31 Jul 2019 04:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SA2FyglQqmPOmJWHgGOn19B3x/OOhN5THVMapwQIFp8=;
	b=OkPTHLAVd2xaCa9LPdY85UATwdIPQG1muyd46rjGL9+KAjLSpaWDJjKjLh93yUVR4/
	zQg1157OHd86HN0ifqvJXK60J18Meu1RScCtMkvRgbAjxmKRWtZrvm5pm4EsXx5p9S0W
	GVxKF1tqOMNCkN0Oz7dUKuqbaO+OpLQfiJtx8YxChXDkYeh3zz8/DPb/qkoHGVgJVxOv
	sqVtIhJrb2MdHi47k3v/Dr0ddhJw6OeVOtKWgjWM4HLwwUDet9Txe7pN5kl5KrLn5QKb
	DKMGGH1v8U3UrjO39nn+UpMCuUK/kiPgDZXGujQIl/C56PszXImoryyxuraV8iiC4+v4
	qieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SA2FyglQqmPOmJWHgGOn19B3x/OOhN5THVMapwQIFp8=;
	b=WkqyK1Ife7LFTwrf2zasyuD7XvWZvQnTLQ64wKgEUZJXS4IQ4UD87u0/mx/H0JlBI5
	qjJ5h+gNEGK+y7ZPPcoafzxQy0/FTHoX3QsdwEbB1mBRB2rxfroet4WZMpGPpRtqUGhq
	NX8URNTA4ubvtSXWT9r3hKFTCxuSX4lkizZYQ9yFScVNavyKL+IEa1CBirzEYuVN5JXH
	uvSlsqNEjpux/Dwu85GgcJKp8+noWtr3qvzz26DdP5Yg8vVeTAz7H38iFIGXmSfrzs52
	AGgmZKxt6jTB4eQb7oafnhh4lRW1DRIS9UqWonp8lVXmZVpMONf2xxnG7x1dmONKrpJN
	bCWQ==
X-Gm-Message-State: APjAAAVjr/PVbBaVVrjx/UwnQyNiiiZZ3JqdCRY8bCY1/VVyQxiAk3w+
	cYbqvHvOcEkOX9gj1ioO57dfiQwVsu/aed0XdcsUwVGq
X-Google-Smtp-Source: APXvYqz7G3eAZkBnSDLgZ7Ryi7yYVAgtI37Yz7uOoYyoNPQ7JHnXZB7aI6ypaP6l5tPCge7bsueKYQsACk136H5zRpQ=
X-Received: by 2002:a62:16:: with SMTP id 22mr48504382pfa.151.1564571224636;
	Wed, 31 Jul 2019 04:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <DB7PR07MB551327DB6DFB72921559C9839FC00@DB7PR07MB5513.eurprd07.prod.outlook.com>
In-Reply-To: <DB7PR07MB551327DB6DFB72921559C9839FC00@DB7PR07MB5513.eurprd07.prod.outlook.com>
From: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Date: Wed, 31 Jul 2019 13:06:53 +0200
Message-ID: <CAAUqJDvcWcmaC5MTEEni6BDJfBN0HCR=K6wB7+kpPpuEuZWM6A@mail.gmail.com>
Subject: Re: Linux Audit userspace query
To: Ali Ahad <20100284@lums.edu.pk>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Wed, 31 Jul 2019 11:07:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Wed, 31 Jul 2019 11:07:05 +0000 (UTC) for IP:'209.85.210.196'
	DOMAIN:'mail-pf1-f196.google.com'
	HELO:'mail-pf1-f196.google.com' FROM:'omosnacek@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.096  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, FROM_EXCESS_BASE64, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.196 mail-pf1-f196.google.com 209.85.210.196
	mail-pf1-f196.google.com <omosnacek@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6VB7CdY025013
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 31 Jul 2019 10:09:23 -0400
Cc: Muhammad Adil Inam <20100180@lums.edu.pk>, linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 31 Jul 2019 14:09:45 +0000 (UTC)

SGVsbG8gQWxpLAoKcGkgMjYuIDcuIDIwMTkgbyAxNTowMCBBbGkgQWhhZCA8MjAxMDAyODRAbHVt
cy5lZHUucGs+IG5hcMOtc2FsKGEpOgo+IERlYXIgT25kcmVqLAo+Cj4gICAgICAgICAgICAgICAg
ICAgICBJIGFtIGNvbXB1dGVyIHNjaWVuY2Ugc3R1ZGVudCBjdXJyZW50bHkgZW5yb2xsZWQgaW4g
bXkgc2VuaW9yIHllYXIgYXQgTGFob3JlIFVuaXZlcnNpdHkgb2YgTWFuYWdlbWVudCBTY2llbmNl
cyAoTFVNUykgLCBQYWtpc3RhbiAuIEkgYW0gd3JpdGluZyB0aGlzIGVtYWlsIGluIHJlZ2FyZHMg
dG8gYSBwcm9ibGVtIHRoYXQgSSBhbSBmYWNpbmcgd2hpbGUgd29ya2luZyBvbiB0aGUgcmVwb3Np
dG9yeSAiTGludXggQXVkaXQgdXNlcnNwYWNlIi4KPgo+ICAgICAgICAgICAgICAgICAgICBUaGUg
c3VtbWVyIHJlc2VhcmNoIHByb2plY3QgSSBoYXZlIGJlZW4gd29ya2luZyBvbiBpbnZvbHZlcyBt
b2RpZnlpbmcgYW5kIGN1c3RvbWl6aW5nIHRoZSBsaW51eCBhdWRpdCB1c2Vyc3BhY2Ugc3VjaCB0
aGF0IEkgY2FuIGN1c3RvbWl6ZSB0aGUgQVVESVRfQVJHUyAoYTAsYTEsYTIgZXRjKSBvZiB0aGUg
d3JpdGUgc3lzdGVtIGNhbGxzIGJlaW5nIHJlY29yZGVkLiBJIGhhdmUgYmVlbiBsb29raW5nIHRo
ZSByZXBvc2l0b3J5IGZvciBkYXlzIG5vdyBhbmQgYW0gdW5hYmxlIHRvIGZpZ3VyZSBvdXQgdGhl
IHNvdXJjZSBvZiB3aGVyZSB0aGUgc3lzY2FsbHMgb3IgYW55IG90aGVyIGV2ZW50cyBhcmUgYmVp
bmcgcmVjb3JkZWQuCgpJJ20gbm90IHN1cmUgd2hhdCBleGFjdGx5IHlvdSBhcmUgdHJ5aW5nIHRv
IGFjaGlldmUsIGJ1dCB0aGUgYXVkaXQKcmVjb3JkcyBhcmUgbm90IGdlbmVyYXRlZCBpbiB0aGUg
dXNlcnNwYWNlIHByb2dyYW1zLCBidXQgaW4gdGhlCmtlcm5lbC4gVGhlIHVzZXJzcGFjZSBjb2Rl
IChhdWRpdGQpIG9ubHkgcmVjZWl2ZXMgdGhlbSwgd3JpdGVzIHRoZW0KaW50byBsb2cgZmlsZXMg
YW5kIG9wdGlvbmFsbHkgcGFzc2VzIHRoZW0gb24gdG8gb3RoZXIgcHJvZ3JhbXMuIFRoZXJlCmFy
ZSBhbHNvIHV0aWxpdGllcyBmb3IgcGFyc2luZyAobGliYXVwYXJzZSwgLi4uKSBhbmQgc2VhcmNo
aW5nIHRoZQpyZWNvcmRzIChhdXNlYXJjaCwgLi4uKS4KCj4KPiAgICAgICAgICAgICAgICAgIEJh
c2ljYWxseSwgSSBhbSB1bmFibGUgdG8gZmlndXJlIG91dCB3aGVyZSBhbiBhdWRpdF9ldmVudCBp
cyBiZWluZyBwb3B1bGF0ZWQgd2l0aCB0aGUgcmVsZXZhbnQgZGF0YSBzdWNoIGFzIHRoZSBhdWRp
dF9hcmdzIChhMCxhMSxhMikgc28gdGhhdCBJIGNhbiBjaGFuZ2UgYW5kIHBsYXkgYXJvdW5kIHdp
dGggdGhlIGFyZ3VtZW50cyB0aGF0ICBhcmUgYmVpbmcgcmVjb3JkZWQgYW5kIHBvcHVsYXRlZCBh
dCB0aGUgc291cmNlLgoKQWdhaW4sIHRvIGNoYW5nZSB0aGUgd2F5IHZhbHVlcyBhcmUgYmVpbmcg
cmVjb3JkZWQgaW50byB0aGUgcmVjb3JkLAp5b3UnZCBuZWVkIHRvIG1vZGlmeSB0aGUga2VybmVs
LgoKPgo+ICAgICAgICAgICAgICAgICAgIEtpbmRseSBsZXQgbWUga25vdyBpZiB5b3UgY2FuIHNs
aWdodGx5IGd1aWRlIG1lIGluIHRoaXMgcmVnYXJkLiBJIHdvdWxkIGJlIHJlYWxseSBncmF0ZWZ1
bC4gQWxzbyBraW5kbHkgbGV0IG1lIGtub3cgb2YgdGhlIGZlYXNpYmlsaXR5IG9mIHRoZSBwcm9i
bGVtLiBTbyBiYXNpY2FsbHkgdGhlIGFyZ3VtZW50IGExIG9mIHRoZSB3cml0ZSBzeXNjYWxsIHJl
Y29yZHMgdGhlIHBvaW50ZXIgdG8gYSBidWZmZXIuIElzIGl0IHBvc3NpYmxlIHRvIHN0b3JlIHRo
ZSBkZXJlZmVyZW5jZWQgY29tcGxldGUgYnVmZmVyIGFzIHRoZSBhcmd1bWVudCBpbnN0ZWFkPwoK
SXQgaXMgdGVjaG5pY2FsbHkgcG9zc2libGUsIGFnYWluIGF0IHRoZSBrZXJuZWwgbGV2ZWwuIE9i
dmlvdXNseSB3ZQpkb24ndCBkbyB0aGF0IGN1cnJlbnRseSwgc2luY2UgdG8gcG9zdC1wcm9jZXNz
IHRoZSBhcmd1bWVudHMgeW91J2QKbmVlZCB0byBkbyBzcGVjaWZpYyBzdHVmZiBmb3IgZWFjaCBz
cGVjaWZpYyBzeXNjYWxsLCB3aGljaCB3b3VsZCBsZWFkCnRvIGV4Y2Vzc2l2ZSBsb2dnaW5nLCBj
aGFsbGVuZ2VzIHdpdGggcmVjb3JkIGZvcm1hdCwga2VlcGluZyB0aGUgY29kZQppbiBzeW5jIHdp
dGggYWxsIHRoZSBzeXNjYWxscyBiZWluZyBzdXBwb3J0ZWQgaW4gdGhlIGtlcm5lbCwgZXRjLi4u
CkZvciBsb2dnaW5nIGV4dGVuZGVkIGluZm9ybWF0aW9uIGFib3V0IHdoYXQgaXMgaGFwcGVuaW5n
IGluIGVhY2gKc3lzY2FsbCwgd2UgdXN1YWxseSB1c2Ugc2VwYXJhdGUgcmVjb3JkcyB3aXRoIHNw
ZWNpZmljIHR5cGUgYW5kIGZpZWxkcwp0aGF0IGFyZSBhc3NvY2lhdGVkIHRvIHRoZSBzeXNjYWxs
IHJlY29yZCBiYXNlZCBvbiByZWNvcmQgSUQuCgpJJ20gYWRkaW5nIHRoZSBsaW51eC1hdWRpdCBt
YWlsaW5nIGxpc3QgdG8gQ2MgLSB0aGF0IGlzIHRoZSBvZmZpY2lhbApwbGFjZSB0byBkaXNjdXNz
IHF1ZXN0aW9ucyBhYm91dCBMaW51eCBhdWRpdCBzdWJzeXN0ZW0gYW5kIHRoZQphc3NvY2lhdGVk
IHVzZXJzcGFjZSB0b29scy4gWW91IGFyZSBsaWtlbHkgdG8gZ2V0IGEgcmVwbHkgZnJvbSBwZW9w
bGUKbXVjaCBtb3JlIGludm9sdmVkIGFuZCBlZHVjYXRlZCBpbiBhdWRpdCB0aGFuIG1lIDopCgo+
Cj4gICAgICAgICAgICAgICAgICBUaGFua3MgaW4gYW50aWNpcGF0aW9uLiBSZWFsbHkgbG9va2lu
ZyBmb3J3YXJkIHRvIGhlYXJpbmcgYmFjayBmcm9tIHlvdS4KPgo+IEJlc3QsCj4gQWxpIEFoYWQs
Cj4gTGFob3JlIFVuaXZlcnNpdHkgb2YgTWFuYWdlbWVudCBTY2llbmNlcyAoTFVNUykKCkNoZWVy
cyBhbmQgZ29vZCBsdWNrIHdpdGggeW91ciBwcm9qZWN0IQoKT25kcmVqIE1vc25hY2VrCgotLQpM
aW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3
dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=

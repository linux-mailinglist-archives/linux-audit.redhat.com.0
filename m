Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D76842A3D
	for <lists+linux-audit@lfdr.de>; Wed, 12 Jun 2019 17:05:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE66E22387E;
	Wed, 12 Jun 2019 15:04:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8500709F1;
	Wed, 12 Jun 2019 15:04:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8FD401806B16;
	Wed, 12 Jun 2019 15:03:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5CF21GT006133 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 12 Jun 2019 11:02:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9F161ACDB; Wed, 12 Jun 2019 15:02:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D488946E7A
	for <linux-audit@redhat.com>; Wed, 12 Jun 2019 15:01:59 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B816E30C1207
	for <linux-audit@redhat.com>; Wed, 12 Jun 2019 15:01:46 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id u10so12377269lfm.12
	for <linux-audit@redhat.com>; Wed, 12 Jun 2019 08:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HHCDrti6hZOHHFd1mpKnLx73brcB9mCERSd3hAVv5pE=;
	b=KkwQ3OChlT1SGhZHjb9KzgGArXdQ0Dq/std7lS1DpML+cI6hpP/WBT4ne8hr2hmYkw
	PqYf+g1JoepAjFhtN4AONq2Y9oe/QcsF5s7ZEMjrhzjPzEuTX8Wzpfb5AdborLNmQsHE
	8p3d6NsfYZIW5C3BrbDXWCiymcil4LNea/80AlG9Uvfu0Q0MjoLG2viuI3z4cBnH5yef
	b4TUUqzUa2BIu7E0XcaUUOitQIlHSTF3sSaurPeWkDEnDZ9yzW7We8sXG1uQADJmkSD9
	6IF5aJ+vpR50hNyD/iQwdoUXgukc7tCtqIlGYiRFZuCtzWj5TuItQF//y37eSc/spbTY
	CR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HHCDrti6hZOHHFd1mpKnLx73brcB9mCERSd3hAVv5pE=;
	b=X0RARn3Ju/EBoqW46h7TNEdJ4IabiiN1BuXSkLlKsWLQW4+jz9o0wLmYXS2GYs2Vu9
	D+KSG61U8yl1pykwK/uSQuNz1MGo8emlQnezmGpx+1vAf3sr7J+uNUv8+LpNnEJsAzh7
	nTh18t1T8hnD6eGU/VHlD6OTOgndSYgCsGGtN1TVRgJvu6I5EdUD686AfQrELtHwSw6J
	ycaZWVumvPaF5L/nfHAs8LBW9+bwMFdSOAIlRR91FajJQZvEeLceIwCO6xMzK9gzOdGX
	0Gwt0LVYsYrtnz/9+7rBSPB/O+6ucFmfrA7Ey1YAvivBsgMstyZx3wKA9pvluqONoC8I
	6RBw==
X-Gm-Message-State: APjAAAXDOD1s1Z4msbSW2CqyTcbdHsDsSNrsxdUgRnzHlsRhER2XRz6M
	SM5mTacD+8Xw43x4F0UnqSqOaJs6v4dLy7gmjoKKtzs=
X-Google-Smtp-Source: APXvYqzUa4qPIMP44F+BRabfYCSqJIepdYV6MTPHD6iv/GuQEMcoUX0OYLpUf6gPQK1dgHDLAI0smjWtlweRABY8wvI=
X-Received: by 2002:a19:230e:: with SMTP id j14mr2053068lfj.13.1560351704859; 
	Wed, 12 Jun 2019 08:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190611080719.28625-1-omosnace@redhat.com>
	<CAHC9VhSXZp6QierOGRBXmyUf=pT3Y4mf=78AmQAquuQ8-WBSGw@mail.gmail.com>
	<CAFqZXNsD06JYYNmpOYyGrxLHCfvVyUSJMZ3mRTWG5-b2Ws7zQw@mail.gmail.com>
In-Reply-To: <CAFqZXNsD06JYYNmpOYyGrxLHCfvVyUSJMZ3mRTWG5-b2Ws7zQw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 12 Jun 2019 11:01:33 -0400
Message-ID: <CAHC9VhSs4pEDL+fSFCqd4xNLqXgEQ42Qh0p2uhePnbx9ZuxwgQ@mail.gmail.com>
Subject: Re: [PATCH] selinux: log raw contexts as untrusted strings
To: Ondrej Mosnacek <omosnace@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Wed, 12 Jun 2019 15:01:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Wed, 12 Jun 2019 15:01:47 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.009  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5CF21GT006133
X-loop: linux-audit@redhat.com
Cc: selinux@vger.kernel.org, Linux-Audit Mailing List <linux-audit@redhat.com>,
	stable@vger.kernel.org
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 12 Jun 2019 15:05:23 +0000 (UTC)

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMzozNyBBTSBPbmRyZWogTW9zbmFjZWsgPG9tb3NuYWNl
QHJlZGhhdC5jb20+IHdyb3RlOgo+IE9uIFdlZCwgSnVuIDEyLCAyMDE5IGF0IDEyOjU2IEFNIFBh
dWwgTW9vcmUgPHBhdWxAcGF1bC1tb29yZS5jb20+IHdyb3RlOgo+ID4gT24gVHVlLCBKdW4gMTEs
IDIwMTkgYXQgNDowNyBBTSBPbmRyZWogTW9zbmFjZWsgPG9tb3NuYWNlQHJlZGhhdC5jb20+IHdy
b3RlOgo+ID4gPiBUaGVzZSBzdHJpbmdzIG1heSBjb21lIGZyb20gdW50cnVzdGVkIHNvdXJjZXMg
KGUuZy4gZmlsZSB4YXR0cnMpIHNvIHRoZXkKPiA+ID4gbmVlZCB0byBiZSBwcm9wZXJseSBlc2Nh
cGVkLgo+ID4gPgo+ID4gPiBSZXByb2R1Y2VyOgo+ID4gPiAgICAgIyBzZXRlbmZvcmNlIDAKPiA+
ID4gICAgICMgdG91Y2ggL3RtcC90ZXN0Cj4gPiA+ICAgICAjIHNldGZhdHRyIC1uIHNlY3VyaXR5
LnNlbGludXggLXYgJ2t1xZllY8OtIMWZw616ZWsnIC90bXAvdGVzdAo+ID4gPiAgICAgIyBydW5j
b24gc3lzdGVtX3U6c3lzdGVtX3I6c3NoZF90OnMwIGNhdCAvdG1wL3Rlc3QKPiA+ID4gICAgIChs
b29rIGF0IHRoZSBnZW5lcmF0ZWQgQVZDcykKPiA+ID4KPiA+ID4gQWN0dWFsIHJlc3VsdDoKPiA+
ID4gICAgIHR5cGU9QVZDIFsuLi5dIHRyYXdjb249a3XFmWVjw60gxZnDrXplawo+ID4gPgo+ID4g
PiBFeHBlY3RlZCByZXN1bHQ6Cj4gPiA+ICAgICB0eXBlPUFWQyBbLi4uXSB0cmF3Y29uPTZCNzVD
NTk5NjU2M0MzQUQyMEM1OTlDM0FEN0E2NTZCCj4gPiA+Cj4gPiA+IEZpeGVzOiBmZWRlMTQ4MzI0
YzMgKCJzZWxpbnV4OiBsb2cgaW52YWxpZCBjb250ZXh0cyBpbiBBVkNzIikKPiA+ID4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyB2NS4xKwo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBPbmRyZWog
TW9zbmFjZWsgPG9tb3NuYWNlQHJlZGhhdC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgc2VjdXJpdHkv
c2VsaW51eC9hdmMuYyB8IDEwICsrKysrKysrLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gVGhhbmtzLCB0aGUgcGF0Y2ggbG9v
a3MgZmluZSB0byBtZSwgYnV0IGl0IGlzIGJvcmRlcmxpbmUgLXN0YWJsZQo+ID4gbWF0ZXJpYWwg
aW4gbXkgb3Bpbmlvbi4gIEknbGwgYWRkIGl0IHRvIHRoZSBzdGFibGUtNS4yIGJyYW5jaCwgYnV0
IGluCj4gPiB0aGUgZnV0dXJlIEkgd291bGQgcHJlZmVyIGlmIHlvdSBsZWZ0IHRoZSBzdGFibGUg
bWFya2luZyBvZmYgcGF0Y2hlcwo+ID4gYW5kIHNlbnQgYSByZXBseSBkaXNjdXNzaW5nICp3aHkq
IHRoaXMgc2hvdWxkIGdvIHRvIHN0YWJsZSBzbyB3ZSBjYW4KPiA+IGRpc2N1c3MgaXQuICBJIHJl
YWxpemUgR3JlZyBsaWtlcyB0byBwdWxsIGEgbG90IG9mIHN0dWZmIGludG8gc3RhYmxlLAo+ID4g
YnV0IEkgdHJ5IHRvIGJlIGEgYml0IG1vcmUgY29uc2VydmF0aXZlIGFib3V0IHdoYXQgZ2V0cyBt
YXJrZWQuICBFdmVuCj4gPiB0aGUgc2ltcGxlc3QgZml4IGNhbiBzdGlsbCBicmVhayB0aGluZ3Mg
OikKPgo+IE9LLCBJIHdhcyBhIGJpdCB1bnN1cmUgd2hldGhlciB0byBtYXJrIGl0IGFzIHN0YWJs
ZSBvciBub3QgYW5kCj4gZXZlbnR1YWxseSBpbmNsaW5lZCB0byBkbyBzby4uLiBJJ2xsIHRyeSBi
ZSBtb3JlIGNhcmVmdWwgYWJvdXQgaXQgaW4KPiB0aGUgZnV0dXJlLgoKSWYgaXQgbWFrZXMgeW91
IGZlZWwgYmV0dGVyLCBpdCdzIG5vdCB0aGF0IGJpZyBvZiBhIGRlYWwsIEkganVzdCBmZWx0Cml0
IHdhcyB3b3J0aCBtZW50aW9uaW5nIHNpbmNlIHdlJ3ZlIGJlZW4gZG9pbmcgYSBiaXQgb2YgYSAi
YmVzdApwcmFjdGljZXMgZm9yIHN1Ym1pdHRpbmcgU0VMaW51eCBrZXJuZWwgcGF0Y2hlcyIgb24g
dGhlIG1haWxpbmcgbGlzdApsYXRlbHkgYW5kIEkgZmVsdCB0aGlzIHdhcyB3b3J0aCBtZW50aW9u
aW5nLiAgVGhlIGJhc2ljIGlkZWEgaXMgdGhhdCBJCnRoaW5rIG1hcmtpbmcgc29tZXRoaW5nIGZv
ciBzdGFibGUgc2hvdWxkbid0IGJlIHRha2VuIGxpZ2h0bHkgYW5kIGl0CmlzIHdvcnRoIGEgZGlz
Y3Vzc2lvbiwgZXZlbiBpZiBpdCBpcyBzaG9ydC4KCi0tIApwYXVsIG1vb3JlCnd3dy5wYXVsLW1v
b3JlLmNvbQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5j
b20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 366ADC2CEB
	for <lists+linux-audit@lfdr.de>; Tue,  1 Oct 2019 07:32:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1316B2A09DB;
	Tue,  1 Oct 2019 05:32:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1B9819C7F;
	Tue,  1 Oct 2019 05:32:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 804D0180085A;
	Tue,  1 Oct 2019 05:31:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x915Vgnb030724 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 1 Oct 2019 01:31:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1625819D70; Tue,  1 Oct 2019 05:31:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E76919C7F
	for <linux-audit@redhat.com>; Tue,  1 Oct 2019 05:31:39 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68A824E832
	for <linux-audit@redhat.com>; Tue,  1 Oct 2019 05:31:32 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id u28so8827189lfc.5
	for <linux-audit@redhat.com>; Mon, 30 Sep 2019 22:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SaFoYhmwuNCCe0dxD4a30Zl6Go0ZxpMOGqzzubMUHdw=;
	b=azESaA0rdcy9GMB3FE8I4/zNalw7ysfkd8tfzjgj0RmnGawU5l6mzRJjHXNAt4IEyV
	wy9qVNdmmcOgGESFc3PXu9o5lOAVD8PNRdHmmwtMPqkOCowpNOH1ZwnKZ4cMbCKxzWFk
	32kbYx/D+sDYwixF1TtIg0L2ChdH/rsPBcJuO4AlNhlaigIWk68u0LZ4GJiHi35pEaV3
	yUXj0FmfrNF7QeT/p4m119G4iN4IhZq3+oylQ55x8rv4IxA/iKr+DPFlVc5zlSLoU1TJ
	wWeja5LAMc/L+1lHON5BZkGiXmIridIuk4ZepjpHGQpgE85tvZp5HOTo5c8QL0/opDhu
	Bv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SaFoYhmwuNCCe0dxD4a30Zl6Go0ZxpMOGqzzubMUHdw=;
	b=r4Rduf71vq61vf8rUlX1JwCpcB1uLK/L3ATpCP93ZfH5k/lZmVyLTmNG8Rr/SJ5X35
	T281BmPmSi+cY7OvmOfY/qIgJ0eo/VdkFXK0oncYotvnReNa3uzulkObmS9BUv3hBfRy
	/+vnO8iAwjLuXZCx+mKMyTyMw7JUmvdww1/Ol/EOHTM7AIyWeHLKkKT534bvJpEPNchw
	j4Z54ElJVE5mvrLUVAcp/DJHHgLo5AX4k8ShJdglQENgfMtct8CJbP0tVXgaCzABNPYq
	VZccp/PFLjTc1ROxieBPGzg7++UD3A0/gZI/VgMwSnzkC1LqL3plLa+6F4PAzi9izCrA
	F/fA==
X-Gm-Message-State: APjAAAVSiIfLndFYUPidnjq3v5PEfsTSB3IURFAnJeFq73FhGjW9GKkN
	VMGexNIsaId7ejDcE88vab7zklw2dm597tui4Q2N
X-Google-Smtp-Source: APXvYqxzu/y3a+l/E1zfJ1GOYAu4oXQyAYURFEX7eRMkz3mjRmcinntM7JzqNurwlxoUk87hd8Bu9ZzmdAjySpJiO8k=
X-Received: by 2002:a05:6512:202:: with SMTP id
	a2mr13379491lfo.175.1569907890668; 
	Mon, 30 Sep 2019 22:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <201909251348.A1542A52@keescook>
	<CAHC9VhRNmWw1__-haD1ZEekADTho3EJyXQMd6ETpOv4c8Qn9nw@mail.gmail.com>
	<2065829.xbNJnTdZ4q@x2> <201909301128.5951C390@keescook>
In-Reply-To: <201909301128.5951C390@keescook>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 1 Oct 2019 01:31:19 -0400
Message-ID: <CAHC9VhR-3CkARf7mVOCW1vLDgygjspcw_JEcteBBrdpxpdBY7g@mail.gmail.com>
Subject: Re: [PATCH] audit: Report suspicious O_CREAT usage
To: Kees Cook <keescook@chromium.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 01 Oct 2019 05:31:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Tue, 01 Oct 2019 05:31:32 +0000 (UTC) for IP:'209.85.167.66'
	DOMAIN:'mail-lf1-f66.google.com' HELO:'mail-lf1-f66.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.66 mail-lf1-f66.google.com 209.85.167.66
	mail-lf1-f66.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x915Vgnb030724
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Tue, 01 Oct 2019 05:32:07 +0000 (UTC)

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMjoyOSBQTSBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9t
aXVtLm9yZz4gd3JvdGU6Cj4gT24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDk6NTA6MDBBTSAtMDQw
MCwgU3RldmUgR3J1YmIgd3JvdGU6Cj4gPiBPbiBUaHVyc2RheSwgU2VwdGVtYmVyIDI2LCAyMDE5
IDExOjMxOjMyIEFNIEVEVCBQYXVsIE1vb3JlIHdyb3RlOgo+ID4gPiBPbiBXZWQsIFNlcCAyNSwg
MjAxOSBhdCA1OjAyIFBNIEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPiB3cm90ZToK
PiA+ID4gPiBUaGlzIHJlbmFtZXMgdGhlIHZlcnkgc3BlY2lmaWMgYXVkaXRfbG9nX2xpbmtfZGVu
aWVkKCkgdG8KPiA+ID4gPiBhdWRpdF9sb2dfcGF0aF9kZW5pZWQoKSBhbmQgYWRkcyB0aGUgQVVE
SVRfKiB0eXBlIGFzIGFuIGFyZ3VtZW50LiBUaGlzCj4gPiA+ID4gYWxsb3dzIGZvciB0aGUgY3Jl
YXRpb24gb2YgdGhlIG5ldyBBVURJVF9BTk9NX0NSRUFUIHRoYXQgY2FuIGJlIHVzZWQgdG8KPiA+
ID4gPiByZXBvcnQgdGhlIGZpZm8vcmVndWxhciBmaWxlIGNyZWF0aW9uIHJlc3RyaWN0aW9ucyB0
aGF0IHdlcmUgaW50cm9kdWNlZAo+ID4gPiA+IGluIGNvbW1pdCAzMGFiYTY2NTZmNjEgKCJuYW1l
aTogYWxsb3cgcmVzdHJpY3RlZCBPX0NSRUFUIG9mIEZJRk9zIGFuZAo+ID4gPiA+IHJlZ3VsYXIg
ZmlsZXMiKS4gV2l0aG91dCB0aGlzIGNoYW5nZSwgZGlzY292ZXJpbmcgdGhhdCB0aGUgcmVzdHJp
Y3Rpb24KPiA+ID4gPiBpcyBlbmFibGVkIGNhbiBiZSB2ZXJ5IGNoYWxsZW5naW5nOgo+ID4gPiA+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0ErakpNeHZrcWpYSHkzRG5WNU1WaEZUTDJS
VWhnMFdRLVhWRlczbmdEUU8KPiA+ID4gPiBka0ZxMFBBQG1haWwuZ21haWwuY29tCj4gPiA+ID4K
PiA+ID4gPiBSZXBvcnRlZC1ieTogSsOpcsOpbWllIEdhbGFybmVhdSA8amVyZW1pZS5nYWxhcm5l
YXVAZWZmaWNpb3MuY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEtlZXMgQ29vayA8a2Vlc2Nv
b2tAY2hyb21pdW0ub3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+IFRoaXMgaXMgbm90IGEgY29tcGxl
dGUgZml4IGJlY2F1c2UgcmVwb3J0aW5nIHdhcyBicm9rZW4gaW4gY29tbWl0Cj4gPiA+ID4gMTU1
NjRmZjBhMTZlICgiYXVkaXQ6IG1ha2UgQU5PTV9MSU5LIG9iZXkgYXVkaXRfZW5hYmxlZCBhbmQK
PiA+ID4gPiBhdWRpdF9kdW1teV9jb250ZXh0IikKPiA+ID4gPiB3aGljaCBzcGVjaWZpY2FsbHkg
Z29lcyBhZ2FpbnN0IHRoZSBpbnRlbnRpb24gb2YgdGhlc2UgcmVjb3JkczogdGhleQo+ID4gPiA+
IHNob3VsZCBfYWx3YXlzXyBiZSByZXBvcnRlZC4gSWYgYXVkaXRpbmcgaXNuJ3QgZW5hYmxlZCwg
dGhleSBzaG91bGQgYmUKPiA+ID4gPiByYXRlbGltaXRlZC4KPiA+ID4gPgo+ID4gPiA+IEluc3Rl
YWQgb2YgdXNpbmcgYXVkaXQsIHNob3VsZCB0aGlzIGp1c3QgZ28gYmFjayB0byB1c2luZwo+ID4g
PiA+IHByX3JhdGVsaW1pdGVkKCk/Cj4gPiA+Cj4gPiA+IEknbSBnb2luZyB0byBpZ25vcmUgdGhl
IHJlbmFtZSBhbmQgb3RoZXIgYXNwZWN0cyBvZiB0aGlzIHBhdGNoIGZvciB0aGUKPiA+ID4gbW9t
ZW50IHNvIHdlIGNhbiBmb2N1cyBvbiB0aGUgdG9waWMgb2YgaWYvd2hlbi9ob3cgdGhlc2UgcmVj
b3Jkcwo+ID4gPiBzaG91bGQgYmUgZW1pdHRlZCBieSB0aGUga2VybmVsLgo+ID4gPgo+ID4gPiBV
bmZvcnR1bmF0ZWx5LCBwZW9wbGUgdGVuZCB0byBnZXQgdmVyeSB1cHNldCBpZiBhdWRpdCBlbWl0
cyAqYW55Kgo+ID4gPiByZWNvcmRzIHdoZW4gdGhleSBoYXZlbid0IGV4cGxpY2l0bHkgZW5hYmxl
ZCBhdWRpdCwgdGhlIHNpZ25pZmljYW5jZQo+ID4gPiBvZiB0aGUgcmVjb3JkIGRvZXNuJ3Qgc2Vl
bSB0byBtYXR0ZXIsIHdoaWNoIGlzIHdoeSB5b3Ugc2VlIHBhdGNoZXMKPiA+ID4gbGlrZSAxNTU2
NGZmMGExNmUgKCJhdWRpdDogbWFrZSBBTk9NX0xJTksgb2JleSBhdWRpdF9lbmFibGVkIGFuZAo+
ID4gPiBhdWRpdF9kdW1teV9jb250ZXh0IikuICBXZSBjb3VsZCBjb25zaWRlciBjb252ZXJ0aW5n
IHNvbWUgcmVjb3JkcyB0bwo+ID4gPiBwcmludGsoKXMsIHJhdGUtbGltaXRlZCBvciBub3QsIGJ1
dCB3ZSBuZWVkIHRvIGJhbGFuY2UgdGhpcyB3aXRoIHRoZQo+ID4gPiB2YXJpb3VzIHNlY3VyaXR5
IGNlcnRpZmljYXRpb25zIHdoaWNoIGF1ZGl0IHdhcyBjcmVhdGVkIHRvIHNhdGlzZnkuCj4gPiA+
IEluIHNvbWUgY2FzZXMgYSBwcmludGsoKSBpc24ndCBzdWZmaWNpZW50Lgo+ID4gPgo+ID4gPiBT
dGV2ZSBpcyBwcm9iYWJseSB0aGUgb25seSBvbmUgd2hvIHJlYWxseSBrZWVwcyB0cmFjayBvZiB0
aGUgdmFyaW91cwo+ID4gPiBhdWRpdGluZyByZXF1aXJlbWVudHMgb2YgdGhlIGRpZmZlcmVudCBz
ZWN1cml0eSBjZXJ0aWZpY2F0aW9uczsgd2hhdAo+ID4gPiBzYXkgeW91IFN0ZXZlIG9uIHRoaXMg
aXNzdWUgd2l0aCBBTk9NX0NSRUFUIHJlY29yZHM/Cj4gPgo+ID4gQ29tbW9uIENyaXRlcmlhIGFu
ZCBvdGhlciBzZWN1cml0eSBzdGFuZGFyZHMgSSB0cmFjayBkbyBub3QgY2FsbCBvdXQgZm9yCj4g
PiBhbm9tb2x5IGRldGVjdGlvbi4gU28sIHRoZXJlIGFyZSBubyByZXF1aXJlbWVudHMgb24gdGhp
cy4gVGhhdCBzYWlkLCB3ZSBkbwo+ID4gaGF2ZSBvdGhlciBhbm9tYWx5IGRldGVjdGlvbnMgYmVj
YXVzZSB0aGV5IGdpdmUgZWFybHkgd2FybmluZyB0aGF0IHNvbWV0aGluZwo+ID4gc3RyYW5nZSBp
cyBoYXBwZW5pbmcuIEkgdGhpbmsgYWRkaW5nIHRoaXMgZXZlbnQgaXMgYSBuaWNlIGltcHJvdmVt
ZW50IGFzIGxvbmcKPiA+IGFzIGl0IG9iZXlzIGF1ZGl0X2VuYWJsZWQgYmVmb3JlIGVtaXR0aW5n
IGFuIGV2ZW50IC0gZm9yIGV4YW1wbGUsIGxvb2sgYXQgdGhlCj4gPiBBVURJVF9BTk9NX0FCRU5E
IGV2ZW50Lgo+Cj4gT2theSwgc28gdGhlIHBhdGNoIGlzIGdvb2QgYXMtaXM/IChUaGUgInJlcG9y
dCB0aGluZ3MgYWx3YXlzIiBpc3N1ZSBJCj4gd2lsbCBkZWFsIHdpdGggc2VwYXJhdGVseS4gRm9y
IG5vdyBJJ2QganVzdCBsaWtlIHRvIGdhaW4gdGhpcyBhbm9tYWx5Cj4gZGV0ZWN0aW9uIGNvcm5l
ciBjYXNlLi4uKQo+Cj4gUGF1bCwgd2hhdCBkbyB5b3Ugc2VlIGFzIG5leHQgc3RlcHMgaGVyZT8K
CkknbGwgcmVwbHkgYmFjayBvbiB0aGUgb3JpZ2luYWwgcG9zdCBzbyBJIGNhbiBtb3JlIGVhc2ls
eSBjb21tZW50IG9uCnRoZSBkZXRhaWxzIG9mIHBhdGNoLgoKLS0gCnBhdWwgbW9vcmUKd3d3LnBh
dWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVk
aGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVk
aXQ=

Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F43C2CF6
	for <lists+linux-audit@lfdr.de>; Tue,  1 Oct 2019 07:38:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 540DD3018ECE;
	Tue,  1 Oct 2019 05:38:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D378519C58;
	Tue,  1 Oct 2019 05:38:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8D451808876;
	Tue,  1 Oct 2019 05:38:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x915cKlc030895 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 1 Oct 2019 01:38:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 087A85C22C; Tue,  1 Oct 2019 05:38:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02DC45C224
	for <linux-audit@redhat.com>; Tue,  1 Oct 2019 05:38:15 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3FA5483F42
	for <linux-audit@redhat.com>; Tue,  1 Oct 2019 05:38:13 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id d17so8839805lfa.7
	for <linux-audit@redhat.com>; Mon, 30 Sep 2019 22:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=a+1iZ6wS7UmVYZ5VqPhsnf3EVMkX+PkLBru96WlvsJc=;
	b=No55bwmG/L3BtmQiCDl24RyHnFVFpkgAKrDjLGbvq1NfTtAOkrykGkj6Imi9ZnHyXa
	EiNq6uW0Nm9WNHePE1W7du6eNPRxhtGDghLypTe3iULUwZftnmW35zxZ3XkmHDBkqvvW
	/RPPUPeB9Nu0Ogi9PrtPxQrUIEVvELc5RLq4MjS2+p7R+/FDEeZpnXdoU1qJuaE52Hze
	NTtHO2EJUMeM+iXZT6U7/+eGoKEu8JB4wsVRqiB+hndY+CxidLc4V/hDDuDrYChX/PGM
	YYK9C4p77VymqVtn5l/ER6MXhoCVNF4DzJ8MDYjBiew2cHUWBVmiEkgGCeasXo2YIzvi
	DzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=a+1iZ6wS7UmVYZ5VqPhsnf3EVMkX+PkLBru96WlvsJc=;
	b=LA2IrNHnvPdlQU/4w++tRtIEBwbLf/4NY5ih0kM9Cyausdz4vUGi16J0FyuxC5283R
	NuvHjePk9gJG7upTAfzki/tphpLCojUEnNY2J+OP7nmJzfGk/I/Wr4Havn3B2WefHsfH
	zWtQzeupx0GfjEDLj8DmVZsIAhf+6owu46wczEW+Yn9U615amGtKTTZzlFd25nAsioCc
	+vvx34g08jIRsXoF4PpmYMuIK3KAOBfIeNYjRWvbx8CVm0t1ousUwaMOsx3ZJ2C9634W
	sG3P3t6xSPoTFHYRlTXd3zhSC3mAUbYN4t7UnIeUn/We1WdQhW8M+c9xIGU51IfEi75Y
	AbfA==
X-Gm-Message-State: APjAAAUdcD39wWdjuKNmZ6xxrzloc98y4eTzrZj+oZeWD34TkCUC/run
	BgXjKPUoR6y6AdRbvhkuj4uJsL4kQhbSBTSKMBI5
X-Google-Smtp-Source: APXvYqy/yAx/jAVUndYWQYKxPBhFnrOpQXpPdMFCCav/qlkLpgYJVFIVF2+aoOudD+nt/Qyd7Dj4SpqfugOAcxDaE04=
X-Received: by 2002:a19:6517:: with SMTP id z23mr7656913lfb.31.1569908291445; 
	Mon, 30 Sep 2019 22:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <201909251348.A1542A52@keescook>
In-Reply-To: <201909251348.A1542A52@keescook>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 1 Oct 2019 01:37:59 -0400
Message-ID: <CAHC9VhQGAVejYvkvDQ_-egvMYn7VvY9WtdCZvANhmkDswBL8YA@mail.gmail.com>
Subject: Re: [PATCH] audit: Report suspicious O_CREAT usage
To: Kees Cook <keescook@chromium.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 01 Oct 2019 05:38:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Tue, 01 Oct 2019 05:38:13 +0000 (UTC) for IP:'209.85.167.67'
	DOMAIN:'mail-lf1-f67.google.com' HELO:'mail-lf1-f67.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.167.67 mail-lf1-f67.google.com 209.85.167.67
	mail-lf1-f67.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x915cKlc030895
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 01 Oct 2019 05:38:55 +0000 (UTC)

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
IHByX3JhdGVsaW1pdGVkKCk/Cj4gLS0tCj4gIGZzL25hbWVpLmMgICAgICAgICAgICAgICAgIHwg
IDcgKysrKystLQo+ICBpbmNsdWRlL2xpbnV4L2F1ZGl0LmggICAgICB8ICA1ICsrKy0tCj4gIGlu
Y2x1ZGUvdWFwaS9saW51eC9hdWRpdC5oIHwgIDEgKwo+ICBrZXJuZWwvYXVkaXQuYyAgICAgICAg
ICAgICB8IDExICsrKysrKy0tLS0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKCi4uLgoKPiBkaWZmIC0tZ2l0IGEvZnMvbmFtZWkuYyBiL2ZzL25h
bWVpLmMKPiBpbmRleCA2NzFjM2MxYTM0MjUuLjBlNjBmODFlMWQ1YSAxMDA2NDQKPiAtLS0gYS9m
cy9uYW1laS5jCj4gKysrIGIvZnMvbmFtZWkuYwo+IEBAIC0xMDMxLDYgKzEwMzEsOSBAQCBzdGF0
aWMgaW50IG1heV9jcmVhdGVfaW5fc3RpY2t5KHN0cnVjdCBkZW50cnkgKiBjb25zdCBkaXIsCj4g
ICAgICAgICAgICAgKGRpci0+ZF9pbm9kZS0+aV9tb2RlICYgMDAyMCAmJgo+ICAgICAgICAgICAg
ICAoKHN5c2N0bF9wcm90ZWN0ZWRfZmlmb3MgPj0gMiAmJiBTX0lTRklGTyhpbm9kZS0+aV9tb2Rl
KSkgfHwKPiAgICAgICAgICAgICAgIChzeXNjdGxfcHJvdGVjdGVkX3JlZ3VsYXIgPj0gMiAmJiBT
X0lTUkVHKGlub2RlLT5pX21vZGUpKSkpKSB7Cj4gKyAgICAgICAgICAgICAgIGF1ZGl0X2xvZ19w
YXRoX2RlbmllZChBVURJVF9BTk9NX0NSRUFULAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgU19JU0ZJRk8oaW5vZGUtPmlfbW9kZSkgPyAiZmlmbyIKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogInJl
Z3VsYXIiKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FQUNDRVM7CgpPdGhlciBjYWxsZXJz
IHR5cGljYWxseSBwYXNzIGFuIG9wZXJhdGlvbiB2YWx1ZSBtb3JlIGNsb3NlbHkgdGllZCB0bwp0
aGUgc3lzY2FsbC9mdW5jdGlvbiBuYW1lLCBhbmQgdGhhdCBzb21ld2hhdCBtYWtlcyBzZW5zZSBz
aW5jZSB0aGUKc3lzY2FsbC9mdW5jdGlvbiBuYW1lIGlzIG9mdGVuIHZlcmItaXNoLiAgVGhlIGNv
ZGUgYWJvdmUsIHdoaWxlCmhlbHBmdWwgaW4gdGhlIHNlbnNlIHRoYXQgaXQgZGlzdGluZ3Vpc2hl
cyBiZXR3ZWVuIHR5cGVzIG9mIGlub2RlcywgaXQKZG9lc24ndCBnaXZlIG11Y2ggaW5kaWNhdGlv
biBhYm91dCB0aGUgIm9wZXJhdGlvbiIgd2hpY2ggZmFpbGVkLiAgSSdtCm9wZW4gdG8gc3VnZ2Vz
dGlvbnMsIGJ1dCBzb21ldGhpbmcgbGlrZSAic3RpY2t5X2NyZWF0ZV9maWZvIiBzZWVtcwptb3Jl
IGNvbnNpc3RlbnQgd2hpY2ggY3VycmVudCB1c2FnZS4gIFRob3VnaHRzPwoKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9hdWRpdC5oIGIvaW5jbHVkZS9saW51eC9hdWRpdC5oCj4gaW5kZXgg
YWVlM2RjOWViMzc4Li5iMzcxNWUyZWUxYzUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9h
dWRpdC5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9hdWRpdC5oCj4gQEAgLTIxNyw3ICsyMTgsNyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgYXVkaXRfbG9nX2RfcGF0aChzdHJ1Y3QgYXVkaXRfYnVmZmVy
ICphYiwKPiAgeyB9Cj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBhdWRpdF9sb2dfa2V5KHN0cnVjdCBh
dWRpdF9idWZmZXIgKmFiLCBjaGFyICprZXkpCj4gIHsgfQo+IC1zdGF0aWMgaW5saW5lIHZvaWQg
YXVkaXRfbG9nX2xpbmtfZGVuaWVkKGNvbnN0IGNoYXIgKnN0cmluZykKPiArc3RhdGljIGlubGlu
ZSB2b2lkIGF1ZGl0X2xvZ19wYXRoX2RlbmllZChpbnQgdHlwZSwgY29uc3QgY2hhciAqc3RyaW5n
KTsKPiAgeyB9CgpJIHByb2JhYmx5IHdvdWxkbid0IG1ha2UgeW91IHJlc3BpbiBqdXN0IGZvciB0
aGlzLCBidXQgc2luY2UgeW91IG1heQpuZWVkIHRvIHJlc3BpbiB0aGlzIGFueXdheSwgeW91IG1p
Z2h0IGFzIHdlbGwgZml4IHRoZSBhYm92ZS4KCi0tIApwYXVsIG1vb3JlCnd3dy5wYXVsLW1vb3Jl
LmNvbQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20K
aHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

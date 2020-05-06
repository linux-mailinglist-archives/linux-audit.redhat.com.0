Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4E31C7C6C
	for <lists+linux-audit@lfdr.de>; Wed,  6 May 2020 23:28:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588800518;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mLf7Tkk7Y5aVDFMz7SfXc90S4EIpzI8CTB7gb/junEw=;
	b=HexauQvwHlPrwoc9vWtKk/RiNumRykHEExeuRM9dnfjaEGpc7ii1SogywCWlzcmFAi8owX
	5tCk6yZwjk7s2+W7hsoOpIA/uviC/AyeDRDiqbxn1MBFkzq747ekwgpLsaraFW4HtxI9Kc
	Eh5tW/xwnDVwNrYvqEpCIpTlFpGB27c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-xlV1UIffMXKjLb_Uh9tUGA-1; Wed, 06 May 2020 17:28:36 -0400
X-MC-Unique: xlV1UIffMXKjLb_Uh9tUGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 719B27BAC;
	Wed,  6 May 2020 21:28:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED20C5D9C5;
	Wed,  6 May 2020 21:28:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EAF2D4CAAE;
	Wed,  6 May 2020 21:28:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 046LQXq7013082 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 6 May 2020 17:26:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6110710021B3; Wed,  6 May 2020 21:26:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-240.phx2.redhat.com [10.3.113.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE2B510013D9;
	Wed,  6 May 2020 21:26:26 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak25 v4 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
Date: Wed, 06 May 2020 17:26:25 -0400
Message-ID: <3250272.v6NOfJhyum@x2>
Organization: Red Hat
In-Reply-To: <20200429213247.6ewxqf66i2apgyuz@madcap2.tricolour.ca>
References: <cover.1587500467.git.rgb@redhat.com> <3348737.k9gCtgYObn@x2>
	<20200429213247.6ewxqf66i2apgyuz@madcap2.tricolour.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 046LQXq7013082
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkbmVzZGF5LCBBcHJpbCAyOSwgMjAyMCA1OjMyOjQ3IFBNIEVEVCBSaWNoYXJkIEd1eSBC
cmlnZ3Mgd3JvdGU6Cj4gT24gMjAyMC0wNC0yOSAxNDo0NywgU3RldmUgR3J1YmIgd3JvdGU6Cj4g
PiBPbiBXZWRuZXNkYXksIEFwcmlsIDI5LCAyMDIwIDEwOjMxOjQ2IEFNIEVEVCBSaWNoYXJkIEd1
eSBCcmlnZ3Mgd3JvdGU6Cj4gPiA+IE9uIDIwMjAtMDQtMjggMTg6MjUsIFBhdWwgTW9vcmUgd3Jv
dGU6Cj4gPiA+ID4gT24gV2VkLCBBcHIgMjIsIDIwMjAgYXQgNTo0MCBQTSBSaWNoYXJkIEd1eSBC
cmlnZ3MgPHJnYkByZWRoYXQuY29tPgo+ID4gCj4gPiB3cm90ZToKPiA+ID4gPiA+IFNvbWUgdGFi
bGUgdW5yZWdpc3RlciBhY3Rpb25zIHNlZW0gdG8gYmUgaW5pdGlhdGVkIGJ5IHRoZSBrZXJuZWwg
dG8KPiA+ID4gPiA+IGdhcmJhZ2UgY29sbGVjdCB1bnVzZWQgdGFibGVzIHRoYXQgYXJlIG5vdCBp
bml0aWF0ZWQgYnkgYW55Cj4gPiA+ID4gPiB1c2Vyc3BhY2UKPiA+ID4gPiA+IGFjdGlvbnMuICBJ
dCB3YXMgZm91bmQgdG8gYmUgbmVjZXNzYXJ5IHRvIGFkZCB0aGUgc3ViamVjdAo+ID4gPiA+ID4g
Y3JlZGVudGlhbHMKPiA+ID4gPiA+IHRvICBjb3ZlciB0aGlzIGNhc2UgdG8gcmV2ZWFsIHRoZSBz
b3VyY2Ugb2YgdGhlc2UgYWN0aW9ucy4gIEEKPiA+ID4gPiA+IHNhbXBsZQo+ID4gPiA+ID4gcmVj
b3JkOgo+ID4gPiA+ID4gdHlwZT1ORVRGSUxURVJfQ0ZHIG1zZz1hdWRpdCgyMDIwLTAzLTExIDIx
OjI1OjIxLjQ5MToyNjkpIDoKPiA+ID4gPiA+IHRhYmxlPW5hdAo+ID4gPiA+ID4gZmFtaWx5PWJy
aWRnZSBlbnRyaWVzPTAgb3A9dW5yZWdpc3RlciBwaWQ9MTUzIHVpZD1yb290IGF1aWQ9dW5zZXQK
PiA+ID4gPiA+IHR0eT0obm9uZSkgc2VzPXVuc2V0IHN1Ymo9c3lzdGVtX3U6c3lzdGVtX3I6a2Vy
bmVsX3Q6czAKPiA+ID4gPiA+IGNvbW09a3dvcmtlci91NDoyIGV4ZT0obnVsbCk+Cj4gPiA+ID4g
Cj4gPiA+ID4gW0knbSBnb2luZyB0byBjb21tZW50IHVwIGhlcmUgaW5zdGVhZCBvZiBpbiB0aGUg
Y29kZSBiZWNhdXNlIGl0IGlzIGEKPiA+ID4gPiBiaXQgZWFzaWVyIGZvciBldmVyeW9uZSB0byBz
ZWUgd2hhdCB0aGUgYWN0dWFsIGltcGFjdCBtaWdodCBiZSBvbiB0aGUKPiA+ID4gPiByZWNvcmRz
Ll0KPiA+ID4gPiAKPiA+ID4gPiBTdGV2ZSB3YW50cyBzdWJqZWN0IGluZm8gaW4gdGhpcyBjYXNl
LCBva2F5LCBidXQgbGV0J3MgdHJ5IHRvIHRyaW0KPiA+ID4gPiBvdXQKPiA+ID4gPiBzb21lIG9m
IHRoZSBmaWVsZHMgd2hpY2ggc2ltcGx5IGRvbid0IG1ha2Ugc2Vuc2UgaW4gdGhpcyByZWNvcmQ7
IEknbQo+ID4gPiA+IHRoaW5raW5nIG9mIGZpZWxkcyB0aGF0IGFyZSB1bnNldC9lbXB0eSBpbiB0
aGUga2VybmVsIGNhc2UgYW5kIGFyZQo+ID4gPiA+IGR1cGxpY2F0ZXMgb2Ygb3RoZXIgcmVjb3Jk
cyBpbiB0aGUgdXNlcnNwYWNlL3N5c2NhbGwgY2FzZS4gIEkgdGhpbmsKPiA+ID4gPiB0aGF0IG1l
YW5zIHdlIGNhbiBkcm9wICJ0dHkiLCAic2VzIiwgImNvbW0iLCBhbmQgImV4ZSIgLi4uIHllcz8K
PiA+ID4gCj4gPiA+IEZyb20gdGhlIGdoYWsyOCBkaXNjdXNzaW9uLCB0aGlzIGxpc3QgYW5kIG9y
ZGVyIHdhcyBzZWxlY3RlZCBkdWUgdG8KPiA+ID4gU3RldmUncyBwcmVmZXJlbmNlIGZvciB0aGUg
Imtlcm5lbCIgcmVjb3JkIGNvbnZlbnRpb24sIHNvIGRldmlhdGluZwo+ID4gPiBmcm9tIHRoaXMg
d2lsbCBjcmVhdGUgeWV0IGEgbmV3IGZpZWxkIGxpc3QuICBJJ2xsIGRlZmVyIHRvIFN0ZXZlIG9u
Cj4gPiA+IHRoaXMuIEl0IGFsc28gaGFzIHRvIGRvIHdpdGggdGhlIHNlYXJjaGFiaWxpdHkgb2Yg
ZmllbGRzIGlmIHRoZXkgYXJlCj4gPiA+IG1pc3NpbmcuCj4gPiA+IAo+ID4gPiBJIGRvIGFncmVl
IHRoYXQgc29tZSBmaWVsZHMgd2lsbCBiZSBzdXBlcmZsdW91cyBpbiB0aGUga2VybmVsIGNhc2Uu
Cj4gPiA+IFRoZSBtb3N0IGltcG9ydGFudCBmaWVsZCB3b3VsZCBiZSAic3ViaiIsIGJ1dCB0aGVu
ICJwaWQiIGFuZCAiY29tbSIsIEkKPiA+ID4gd291bGQgdGhpbmsuICBCYXNlZCBvbiB0aGlzIGNv
bnRlbnRzIG9mIHRoZSAic3ViaiIgZmllbGQsIEknZCB0aGluawo+ID4gPiB0aGF0ICJ1aWQiLCAi
YXVpZCIsICJ0dHkiLCAic2VzIiBhbmQgImV4ZSIgYXJlIG5vdCBuZWVkZWQuCj4gPiAKPiA+IFdl
IGNhbid0IGJlIGFkZGluZyBkZWxldGluZyBmaWVsZHMgYmFzZWQgb24gaG93IGl0cyB0cmlnZ2Vy
ZWQuIElmIHRoZXkKPiA+IGFyZSB1bnNldCwgdGhhdCBpcyBmaW5lLiBUaGUgbWFpbiBpc3N1ZSBp
cyB0aGV5IGhhdmUgdG8gYmVoYXZlIHRoZSBzYW1lLgo+IAo+IEkgZG9uJ3QgdGhpbmsgdGhlIGlu
dGVudCB3YXMgdG8gaGF2ZSBmaWVsZHMgc3dpbmcgaW4gYW5kIG91dCBkZXBlbmRpbmcKPiBvbiB0
cmlnZ2VyLiAgVGhlIGlkZWEgaXMgdG8gcG90ZW50aWFsbHkgcGVybWFuZW50bHkgbm90IGluY2x1
ZGUgdGhlbSBpbgo+IHRoaXMgcmVjb3JkIHR5cGUgb25seS4gIFRoZSBqdXN0aWZpY2F0aW9uIGlz
IHRoYXQgd2hlcmUgdGhleSBhcmVuJ3QKPiBuZWVkZWQgZm9yIHRoZSBrZXJuZWwgdHJpZ2dlciBz
aXR1YXRpb24gaXQgbWFkZSBzZW5zZSB0byBkZWxldGUgdGhlbQo+IGJlY2F1c2UgaWYgaXQgaXMg
YSB1c2VyIGNvbnRleHQgZXZlbnQgaXQgd2lsbCBiZSBhY2NvbXBhbmllZCBieSBhCj4gc3lzY2Fs
bCByZWNvcmQgdGhhdCBhbHJlYWR5IGhhcyB0aGF0IGluZm9ybWF0aW9uIGFuZCB0aGVyZSB3b3Vs
ZCBiZSBubwo+IHNlbnNlIGluIGR1cGxpY2F0aW5nIGl0LgoKV2Ugc2hvdWxkIG5vdCBiZSBhZGRp
bmcgc3lzY2FsbCByZWNvcmRzIHRvIGFueXRoaW5nIHRoYXQgZG9lcyBub3QgcmVzdWx0IGZyb20g
CmEgc3lzY2FsbCBydWxlIHRyaWdnZXJpbmcgdGhlIGV2ZW50LiBJdHMgdmVyeSB3YXN0ZWZ1bC4g
TW9yZSB3YXN0ZWZ1bCB0aGFuIApqdXN0IGFkZGluZyB0aGUgbmVjZXNzYXJ5IGZpZWxkcy4KCkkg
YWxzbyB3aXNoZWQgd2UgaGFkIGEgY29kaW5nIHNwZWNpZmljYXRpb24gdGhhdCBwdXQgdGhpcyBp
biB3cml0aW5nIHNvIHRoYXQgCmV2ZXJ5IGV2ZW50IGlzIG5vdCBhIGNvbW1pdHRlZSBkZWNpc2lv
bi4gVGhhdCBhbnlvbmUgY2FuIGxvb2sgYXQgdGhlIGRvY3VtZW50IAphbmQgRG8gVGhlIFJpZ2h0
IFRoaW5nIOKEoi4KCklmIEkgYWRkIGEgc2VjdGlvbiB0byBXcml0aW5nLUdvb2QtRXZlbnRzIG91
dGxpbmluZyB0aGUgZXhwZWN0ZWQgb3JkZXJpbmcgb2YgCmZpZWxkcywgd291bGQgdGhhdCBiZSBl
bm91Z2ggdGhhdCB3ZSBkbyBub3QgaGF2ZSBsb25nIGRpc2N1c3Npb25zIGFib3V0IGV2ZW50IApm
b3JtYXQ/IEknbSB0aGlua2luZyB0aGlzIHdvdWxkIGFsc28gaGVscCBuZXcgcGVvcGxlIHRoYXQg
d2FudCB0byBjb250cmlidXRlLgoKLVN0ZXZlCgoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlz
dApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hdWRpdA==


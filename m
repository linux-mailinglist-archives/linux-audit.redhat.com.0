Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F078723CBD6
	for <lists+linux-audit@lfdr.de>; Wed,  5 Aug 2020 17:55:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-TlI3FyWSNVOebCZto7iuyQ-1; Wed, 05 Aug 2020 11:55:32 -0400
X-MC-Unique: TlI3FyWSNVOebCZto7iuyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C3D057;
	Wed,  5 Aug 2020 15:55:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D4855D9E2;
	Wed,  5 Aug 2020 15:55:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3017996913;
	Wed,  5 Aug 2020 15:55:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 075F1kfQ004483 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 5 Aug 2020 11:01:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E456E2029F71; Wed,  5 Aug 2020 15:01:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7649B20234BD
	for <linux-audit@redhat.com>; Wed,  5 Aug 2020 15:01:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 376DE104984F
	for <linux-audit@redhat.com>; Wed,  5 Aug 2020 15:01:43 +0000 (UTC)
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [66.63.167.143]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-22-I-aLXAhPMsWSxOR_FbyMJA-1;
	Wed, 05 Aug 2020 11:01:36 -0400
X-MC-Unique: I-aLXAhPMsWSxOR_FbyMJA-1
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id D79E28EE1DD; 
	Wed,  5 Aug 2020 08:01:31 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id FBfBPUShTYhM; Wed,  5 Aug 2020 08:01:31 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.76.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 3D9978EE0F8;
	Wed,  5 Aug 2020 08:01:30 -0700 (PDT)
Message-ID: <1596639689.3457.17.camel@HansenPartnership.com>
Subject: Re: [dm-devel] [RFC PATCH v5 00/11] Integrity Policy Enforcement
	LSM (IPE)
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: Deven Bowers <deven.desai@linux.microsoft.com>, Pavel Machek
	<pavel@ucw.cz>, Sasha Levin <sashal@kernel.org>
Date: Wed, 05 Aug 2020 08:01:29 -0700
In-Reply-To: <fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 075F1kfQ004483
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 05 Aug 2020 11:55:03 -0400
Cc: snitzer@redhat.com, zohar@linux.ibm.com, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, agk@redhat.com, corbet@lwn.net,
	jmorris@namei.org, nramas@linux.microsoft.com, serge@hallyn.com,
	pasha.tatashin@soleen.com, jannh@google.com,
	linux-block@vger.kernel.org, viro@zeniv.linux.org.uk,
	axboe@kernel.dk, mdsakib@microsoft.com, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIwLTA4LTA0IGF0IDA5OjA3IC0wNzAwLCBEZXZlbiBCb3dlcnMgd3JvdGU6Cj4g
T24gOC8yLzIwMjAgOTo0MyBBTSwgSmFtZXMgQm90dG9tbGV5IHdyb3RlOgo+ID4gT24gU3VuLCAy
MDIwLTA4LTAyIGF0IDE2OjMxICswMjAwLCBQYXZlbCBNYWNoZWsgd3JvdGU6Cj4gPiA+IE9uIFN1
biAyMDIwLTA4LTAyIDEwOjAzOjAwLCBTYXNoYSBMZXZpbiB3cm90ZToKPiA+ID4gPiBPbiBTdW4s
IEF1ZyAwMiwgMjAyMCBhdCAwMTo1NTo0NVBNICswMjAwLCBQYXZlbCBNYWNoZWsgd3JvdGU6Cj4g
PiA+ID4gPiBIaSEKPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJUEUgaXMgYSBMaW51eCBTZWN1cml0
eSBNb2R1bGUgd2hpY2ggYWxsb3dzIGZvciBhCj4gPiA+ID4gPiA+IGNvbmZpZ3VyYWJsZSBwb2xp
Y3kgdG8gZW5mb3JjZSBpbnRlZ3JpdHkgcmVxdWlyZW1lbnRzIG9uCj4gPiA+ID4gPiA+IHRoZSB3
aG9sZSBzeXN0ZW0uIEl0IGF0dGVtcHRzIHRvIHNvbHZlIHRoZSBpc3N1ZSBvZiBDb2RlCj4gPiA+
ID4gPiA+IEludGVncml0eTogdGhhdCBhbnkgY29kZSBiZWluZyBleGVjdXRlZCAob3IgZmlsZXMg
YmVpbmcKPiA+ID4gPiA+ID4gcmVhZCksIGFyZSBpZGVudGljYWwgdG8gdGhlIHZlcnNpb24gdGhh
dCB3YXMgYnVpbHQgYnkgYQo+ID4gPiA+ID4gPiB0cnVzdGVkIHNvdXJjZS4KPiA+ID4gPiA+IAo+
ID4gPiA+ID4gSG93IGlzIHRoYXQgZGlmZmVyZW50IGZyb20gc2VjdXJpdHkvaW50ZWdyaXR5L2lt
YT8KPiA+ID4gPiAKPiA+ID4gPiBNYXliZSBpZiB5b3Ugd291bGQgaGF2ZSByZWFkIHRoZSBjb3Zl
ciBsZXR0ZXIgYWxsIHRoZSB3YXkgZG93bgo+ID4gPiA+IHRvIHRoZSA1dGggcGFyYWdyYXBoIHdo
aWNoIGV4cGxhaW5zIGhvdyBJUEUgaXMgZGlmZmVyZW50IGZyb20KPiA+ID4gPiBJTUEgd2UgY291
bGQgYXZvaWRlZCB0aGlzIG1haWwgZXhjaGFuZ2UuLi4KPiA+ID4gCj4gPiA+ICIKPiA+ID4gSVBF
IGRpZmZlcnMgZnJvbSBvdGhlciBMU01zIHdoaWNoIHByb3ZpZGUgaW50ZWdyaXR5IGNoZWNraW5n
IChmb3IKPiA+ID4gaW5zdGFuY2UsIElNQSksIGFzIGl0IGhhcyBubyBkZXBlbmRlbmN5IG9uIHRo
ZSBmaWxlc3lzdGVtCj4gPiA+IG1ldGFkYXRhIGl0c2VsZi4KPiA+ID4gVGhlIGF0dHJpYnV0ZXMg
dGhhdCBJUEUgY2hlY2tzIGFyZSBkZXRlcm1pbmlzdGljIHByb3BlcnRpZXMgdGhhdAo+ID4gPiBl
eGlzdCBzb2xlbHkgaW4gdGhlIGtlcm5lbC4gQWRkaXRpb25hbGx5LCBJUEUgcHJvdmlkZXMgbm8K
PiA+ID4gYWRkaXRpb25hbCBtZWNoYW5pc21zIG9mIHZlcmlmeWluZyB0aGVzZSBmaWxlcyAoZS5n
LiBJTUEKPiA+ID4gU2lnbmF0dXJlcykgLSBhbGwgb2YgdGhlIGF0dHJpYnV0ZXMgb2YgdmVyaWZ5
aW5nIGZpbGVzIGFyZQo+ID4gPiBleGlzdGluZyBmZWF0dXJlcyB3aXRoaW4gdGhlIGtlcm5lbCwg
c3VjaCBhcyBkbS12ZXJpdHkKPiA+ID4gb3IgZnN2ZXJpdHkuCj4gPiA+ICIKPiA+ID4gCj4gPiA+
IFRoYXQgaXMgbm90IHJlYWxseSBoZWxwZnVsLgo+IAo+IFBlcmhhcHMgSSBjYW4gZXhwbGFpbiAo
YW5kIHJlLXdvcmQgdGhpcyBwYXJhZ3JhcGgpIGEgYml0IGJldHRlci4KPiAKPiBBcyBKYW1lcyBp
bmRpY2F0ZXMsIElQRSBkb2VzIHRyeSB0byBjbG9zZSB0aGUgZ2FwIG9mIHRoZSBJTUEKPiBsaW1p
dGF0aW9uIHdpdGggeGF0dHIuIEkgaG9uZXN0bHkgd2FzbuKAmXQgZmFtaWxpYXIgd2l0aCB0aGUg
YXBwZW5kZWQKPiBzaWduYXR1cmVzLCB3aGljaCBzZWVtcyBmaW5lLgo+IAo+IFJlZ2FyZGxlc3Ms
IHRoaXMgaXNu4oCZdCB0aGUgbGFyZ2VyIGJlbmVmaXQgdGhhdCBJUEUgcHJvdmlkZXMuIFRoZQo+
IGxhcmdlciBiZW5lZml0IG9mIHRoaXMgaXMgaG93IElQRSBzZXBhcmF0ZXMgX21lY2hhbmlzbXNf
IChwcm9wZXJ0aWVzKQo+IHRvIGVuZm9yY2UgaW50ZWdyaXR5IHJlcXVpcmVtZW50cywgZnJvbSBf
cG9saWN5Xy4gVGhlIExTTSBwcm92aWRlcwo+IHBvbGljeSwgd2hpbGUgdGhpbmdzIGxpa2UgZG0t
dmVyaXR5IHByb3ZpZGUgbWVjaGFuaXNtLgoKQ29sb3VyIG1lIGNvbmZ1c2VkIGhlcmUsIGJ1dCBJ
IHRob3VnaHQgdGhhdCdzIGV4YWN0bHkgd2hhdCBJTUEgZG9lcy4gClRoZSBtZWNoYW5pc20gaXMg
dGhlIGdhdGVzIGFuZCB0aGUgcG9saWN5IGlzIHNpbXBseSBhIGxpc3Qgb2YgcnVsZXMKd2hpY2gg
YXJlIGFwcGxpZWQgd2hlbiBhIGdhdGUgaXMgdHJpZ2dlcmVkLiAgVGhlIHBvbGljeSBuZWNlc3Nh
cmlseSBoYXMKdG8gYmUgdGFpbG9yZWQgdG8gdGhlIGluZm9ybWF0aW9uIGF2YWlsYWJsZSBhdCB0
aGUgZ2F0ZSAoc28gdGhlIGJwcm0KZXhlYyBnYXRlIGtub3dzIGZpbGVzeXN0ZW0gdGhpbmdzIGxp
a2UgdGhlIGlub2RlIGZvciBpbnN0YW5jZSkgYnV0IHRoZQp3aG9sZSB0aGluZyBsb29rcyB2ZXJ5
IGV4dGVuc2libGUuCgo+IFNvIHRvIHNwZWFrLCBJUEUgYWN0cyBhcyB0aGUgZ2x1ZSBmb3Igb3Ro
ZXIgbWVjaGFuaXNtcyB0byBsZXZlcmFnZSBhCj4gY3VzdG9taXphYmxlLCBzeXN0ZW0td2lkZSBw
b2xpY3kgdG8gZW5mb3JjZS4gV2hpbGUgdGhpcyBpbml0aWFsCj4gcGF0Y2hzZXQgb25seSBvbmJv
YXJkcyBkbS12ZXJpdHksIHRoZXJl4oCZcyBhbHNvIHBvdGVudGlhbCBmb3IgTUFDCj4gbGFiZWxz
LCBmcy12ZXJpdHksIGF1dGhlbnRpY2F0ZWQgQlRSRlMsIGRtLWludGVncml0eSwgZXRjLiBJUEUK
PiBsZXZlcmFnZXMgZXhpc3Rpbmcgc3lzdGVtcyBpbiB0aGUga2VybmVsLCB3aGlsZSBJTUEgdXNl
cyBpdHMgb3duLgoKSXMgdGhpcyBhYm91dCB3aG8gZG9lcyB0aGUgbWVhc3VyZW1lbnQ/ICBJIHRo
aW5rIHRoZXJlJ3Mgbm8gcmVhc29uIGF0CmFsbCB3aHkgSU1BIGNhbid0IGxldmVyYWdlIGV4aXN0
aW5nIG1lYXN1cmVtZW50cywgaXQncyBqdXN0IG5vdGhpbmcgdG8KbGV2ZXJhZ2UgZXhpc3RlZCB3
aGVuIGl0IHdhcyBjcmVhdGVkLgoKPiBBbm90aGVyIGRpZmZlcmVuY2UgaXMgdGhlIGdlbmVyYWwg
Y292ZXJhZ2UuIElNQSBoYXMgc29tZSBkaWZmaWN1bHRpZXMKPiBpbiBjb3ZlcmluZyBtcHJvdGVj
dFsxXSwgSVBFIGRvZXNu4oCZdCAodGhlIE1BUF9BTk9OWU1PVVMgaW5kaWNhdGVkIGJ5Cj4gSmFu
biBpbiB0aGF0IHRocmVhZCB3b3VsZCBiZSBkZW5pZWQgYXMgdGhlIGZpbGUgc3RydWN0IHdvdWxk
IGJlIG51bGwsCj4gd2l0aCBJUEXigJlzIGN1cnJlbnQgc2V0IG9mIHN1cHBvcnRlZCBtZWNoYW5p
c21zLiBtcHJvdGVjdCB3b3VsZAo+IGNvbnRpbnVlIHRvIGZ1bmN0aW9uIGFzIGV4cGVjdGVkIGlm
IHlvdSBjaGFuZ2UgdG8gUFJPVF9FWEVDKS4KCkkgZG9uJ3QgcmVhbGx5IHRoaW5rIGEgZGViYXRl
IG92ZXIgd2hvIGRvZXMgd2hhdCBhbmQgd2h5IGlzIHByb2R1Y3RpdmUKYXQgdGhpcyBzdGFnZS4g
IEkganVzdCBub3RlIHRoYXQgSU1BIHBvbGljeSBjb3VsZCBiZSB1cGRhdGVkIHRvIGRlbnkKTUFQ
X0FOT05ZTU9VUywgYnV0IG5vLW9uZSdzIGFza2VkIGZvciB0aGF0IChwcm9iYWJseSBiZWNhdXNl
IG9mIHRoZQpodWdlIGFwcGxpY2F0aW9uIGJyZWFrYWdlIHRoYXQgd291bGQgZW5zdWUpLiAgVGhl
IHBvbGljeSBpcyBhIHByb2R1Y3QKb2YgdGhlIHVzZSBjYXNlIGFuZCB0aGUgY3VycmVudCB1c2Ug
Y2FzZSBmb3IgSU1BIGlzIHdvcmtpbmcgd2l0aApleGlzdGluZyBmaWxlc3lzdGVtIHNlbWFudGlj
cy4KCj4gPiBQZXJoYXBzIHRoZSBiaWcgcXVlc3Rpb24gaXM6IElmIHdlIHVzZWQgdGhlIGV4aXN0
aW5nIElNQSBhcHBlbmRlZAo+ID4gc2lnbmF0dXJlIGZvciBkZXRhY2hlZCBzaWduYXR1cmVzIChl
ZmZlY3RpdmVseSBiZWNvbWluZyB0aGUKPiA+ICJwcm9wZXJ0aWVzIiByZWZlcnJlZCB0byBpbiB0
aGUgY292ZXIgbGV0dGVyKSBhbmQgaG9va2VkIElNQSBpbnRvCj4gPiBkZXZpY2UgbWFwcGVyIHVz
aW5nIGFkZGl0aW9uYWwgcG9saWN5IHRlcm1zLCB3b3VsZCB0aGF0IHNhdGlzZnkgYWxsCj4gPiB0
aGUgcmVxdWlyZW1lbnRzIHRoaXMgbmV3IExTTSBoYXM/Cj4gCj4gV2VsbCwgTWltaSwgd2hhdCBk
byB5b3UgdGhpbms/IFNob3VsZCB3ZSBpbnRlZ3JhdGUgYWxsIHRoZSBmZWF0dXJlcwo+IG9mIElQ
RSBpbnRvIElNQSwgb3IgZG8geW91IHRoaW5rIHRoZXkgYXJlIHN1ZmZpY2llbnRseSBkaWZmZXJl
bnQgaW4KPiBhcmNoaXRlY3R1cmUgdGhhdCBpdCB3b3VsZCBiZSB3b3J0aCBpdCB0byBrZWVwIHRo
ZSBjb2RlIGJhc2UgaW4KPiBzZXBhcmF0ZSBMU01zPwoKSSdsbCBsZWF2ZSBNaW1pIHRvIGFuc3dl
ciwgYnV0IHJlYWxseSB0aGlzIGlzIGV4YWN0bHkgdGhlIHF1ZXN0aW9uIHRoYXQKc2hvdWxkIGhh
dmUgYmVlbiBhc2tlZCBiZWZvcmUgd3JpdGluZyBJUEUuICBIb3dldmVyLCBzaW5jZSB3ZSBoYXZl
IHRoZQpjYXJ0IGJlZm9yZSB0aGUgaG9yc2UsIGxldCBtZSBicmVhayB0aGUgYWJvdmUgZG93biBp
bnRvIHR3byBzcGVjaWZpYwpxdWVzdGlvbnMuCgogICAxLiBDb3VsZCB3ZSBpbXBsZW1lbnQgSVBF
IGluIElNQSAoYXMgaW4gd291bGQgZXh0ZW5zaW9ucyB0byBJTUEgY292ZXIKICAgICAgZXZlcnl0
aGluZykuICBJIHRoaW5rIHRoZSBhbnN3ZXJzIGFib3ZlIGluZGljYXRlIHRoaXMgaXMgYSAieWVz
Ii4KICAgMi4gU2hvdWxkIHdlIGV4dGVuZCBJTUEgdG8gaW1wbGVtZW50IGl0PyAgVGhpcyBpcyBy
ZWFsbHkgd2hldGhlciBmcm9tIGEKICAgICAgdXNhYmlsaXR5IHN0YW5kcG9pbnQgdHdvIHNlcGVy
YXRlIExTTXMgd291bGQgbWFrZSBzZW5zZSB0byBjb3ZlciB0aGUKICAgICAgZGlmZmVyZW50IHVz
ZSBjYXNlcy4gIEkndmUgZ290IHRvIHNheSB0aGUgbGVhc3QgYXR0cmFjdGl2ZSB0aGluZwogICAg
ICBhYm91dCBzZXBhcmF0aW9uIGlzIHRoZSBmYWN0IHRoYXQgeW91IG5vdyBib3RoIGhhdmUgYSBw
b2xpY3kgcGFyc2VyLgogICAgICAgWW91J3ZlIHRyaWVkIHRvIGRpZmZlcmVudGlhdGUgeW91cnMg
YnkgbWFraW5nIGl0IG1vcmUgS2NvbmZpZwogICAgICBiYXNlZCwgYnV0IHBvbGljeSBoYXMgYSB3
YXkgb2YgYmVjb21pbmcgdXNlciBzcGFjZSBzdXBwbGllZCBiZWNhdXNlCiAgICAgIHRoZSBkaXN0
cm9zIGhhdGUgY29uZmlnIG9wdGlvbnMsIHNvIEkgdGhpbmsgeW91J3JlIGdvaW5nIHRvIGVuZCB1
cAogICAgICB3aXRoIGEgcG9saWN5IHBhcnNlciB2ZXJ5IGxpa2UgSU1Bcy4KCkphbWVzCgoKLS0K
TGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93
d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0


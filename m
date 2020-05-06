Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 01F0A1C7D89
	for <lists+linux-audit@lfdr.de>; Thu,  7 May 2020 00:43:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588805012;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yY5FyLxHP+LMBW6tZAkicNVJXr3X+LrbJssiuKv07j0=;
	b=X8k/47MCgOTLlZ7Y5cUXeTSsshjwX0gnt7dwHZy7mXkWnU++xxWc0tj0lPNYlZyGhuUQks
	8X0m1g1JcJBfIZB486EWtHVdjduK9YhUmU6T1PoFN4WAAROdE6IjdMsHchnP231HbPU2m2
	hrYEnHseeJkVU/5VZAaUQR3fa55pJug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-SazWpehfPnKgBYn6Gl5DSQ-1; Wed, 06 May 2020 18:43:30 -0400
X-MC-Unique: SazWpehfPnKgBYn6Gl5DSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6BC3107ACCD;
	Wed,  6 May 2020 22:43:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 383CD60619;
	Wed,  6 May 2020 22:43:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A49954CAA0;
	Wed,  6 May 2020 22:43:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 046Mgje5017826 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 6 May 2020 18:42:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 98D4664441; Wed,  6 May 2020 22:42:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C82170460;
	Wed,  6 May 2020 22:42:36 +0000 (UTC)
Date: Wed, 6 May 2020 18:42:33 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH ghak25 v4 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
Message-ID: <20200506224233.najv6ltb5gzcicqb@madcap2.tricolour.ca>
References: <cover.1587500467.git.rgb@redhat.com> <3348737.k9gCtgYObn@x2>
	<20200429213247.6ewxqf66i2apgyuz@madcap2.tricolour.ca>
	<3250272.v6NOfJhyum@x2>
MIME-Version: 1.0
In-Reply-To: <3250272.v6NOfJhyum@x2>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gMjAyMC0wNS0wNiAxNzoyNiwgU3RldmUgR3J1YmIgd3JvdGU6Cj4gT24gV2VkbmVzZGF5LCBB
cHJpbCAyOSwgMjAyMCA1OjMyOjQ3IFBNIEVEVCBSaWNoYXJkIEd1eSBCcmlnZ3Mgd3JvdGU6Cj4g
PiBPbiAyMDIwLTA0LTI5IDE0OjQ3LCBTdGV2ZSBHcnViYiB3cm90ZToKPiA+ID4gT24gV2VkbmVz
ZGF5LCBBcHJpbCAyOSwgMjAyMCAxMDozMTo0NiBBTSBFRFQgUmljaGFyZCBHdXkgQnJpZ2dzIHdy
b3RlOgo+ID4gPiA+IE9uIDIwMjAtMDQtMjggMTg6MjUsIFBhdWwgTW9vcmUgd3JvdGU6Cj4gPiA+
ID4gPiBPbiBXZWQsIEFwciAyMiwgMjAyMCBhdCA1OjQwIFBNIFJpY2hhcmQgR3V5IEJyaWdncyA8
cmdiQHJlZGhhdC5jb20+Cj4gPiA+IAo+ID4gPiB3cm90ZToKPiA+ID4gPiA+ID4gU29tZSB0YWJs
ZSB1bnJlZ2lzdGVyIGFjdGlvbnMgc2VlbSB0byBiZSBpbml0aWF0ZWQgYnkgdGhlIGtlcm5lbCB0
bwo+ID4gPiA+ID4gPiBnYXJiYWdlIGNvbGxlY3QgdW51c2VkIHRhYmxlcyB0aGF0IGFyZSBub3Qg
aW5pdGlhdGVkIGJ5IGFueQo+ID4gPiA+ID4gPiB1c2Vyc3BhY2UKPiA+ID4gPiA+ID4gYWN0aW9u
cy4gIEl0IHdhcyBmb3VuZCB0byBiZSBuZWNlc3NhcnkgdG8gYWRkIHRoZSBzdWJqZWN0Cj4gPiA+
ID4gPiA+IGNyZWRlbnRpYWxzCj4gPiA+ID4gPiA+IHRvICBjb3ZlciB0aGlzIGNhc2UgdG8gcmV2
ZWFsIHRoZSBzb3VyY2Ugb2YgdGhlc2UgYWN0aW9ucy4gIEEKPiA+ID4gPiA+ID4gc2FtcGxlCj4g
PiA+ID4gPiA+IHJlY29yZDoKPiA+ID4gPiA+ID4gdHlwZT1ORVRGSUxURVJfQ0ZHIG1zZz1hdWRp
dCgyMDIwLTAzLTExIDIxOjI1OjIxLjQ5MToyNjkpIDoKPiA+ID4gPiA+ID4gdGFibGU9bmF0Cj4g
PiA+ID4gPiA+IGZhbWlseT1icmlkZ2UgZW50cmllcz0wIG9wPXVucmVnaXN0ZXIgcGlkPTE1MyB1
aWQ9cm9vdCBhdWlkPXVuc2V0Cj4gPiA+ID4gPiA+IHR0eT0obm9uZSkgc2VzPXVuc2V0IHN1Ymo9
c3lzdGVtX3U6c3lzdGVtX3I6a2VybmVsX3Q6czAKPiA+ID4gPiA+ID4gY29tbT1rd29ya2VyL3U0
OjIgZXhlPShudWxsKT4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gW0knbSBnb2luZyB0byBjb21tZW50
IHVwIGhlcmUgaW5zdGVhZCBvZiBpbiB0aGUgY29kZSBiZWNhdXNlIGl0IGlzIGEKPiA+ID4gPiA+
IGJpdCBlYXNpZXIgZm9yIGV2ZXJ5b25lIHRvIHNlZSB3aGF0IHRoZSBhY3R1YWwgaW1wYWN0IG1p
Z2h0IGJlIG9uIHRoZQo+ID4gPiA+ID4gcmVjb3Jkcy5dCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFN0
ZXZlIHdhbnRzIHN1YmplY3QgaW5mbyBpbiB0aGlzIGNhc2UsIG9rYXksIGJ1dCBsZXQncyB0cnkg
dG8gdHJpbQo+ID4gPiA+ID4gb3V0Cj4gPiA+ID4gPiBzb21lIG9mIHRoZSBmaWVsZHMgd2hpY2gg
c2ltcGx5IGRvbid0IG1ha2Ugc2Vuc2UgaW4gdGhpcyByZWNvcmQ7IEknbQo+ID4gPiA+ID4gdGhp
bmtpbmcgb2YgZmllbGRzIHRoYXQgYXJlIHVuc2V0L2VtcHR5IGluIHRoZSBrZXJuZWwgY2FzZSBh
bmQgYXJlCj4gPiA+ID4gPiBkdXBsaWNhdGVzIG9mIG90aGVyIHJlY29yZHMgaW4gdGhlIHVzZXJz
cGFjZS9zeXNjYWxsIGNhc2UuICBJIHRoaW5rCj4gPiA+ID4gPiB0aGF0IG1lYW5zIHdlIGNhbiBk
cm9wICJ0dHkiLCAic2VzIiwgImNvbW0iLCBhbmQgImV4ZSIgLi4uIHllcz8KPiA+ID4gPiAKPiA+
ID4gPiBGcm9tIHRoZSBnaGFrMjggZGlzY3Vzc2lvbiwgdGhpcyBsaXN0IGFuZCBvcmRlciB3YXMg
c2VsZWN0ZWQgZHVlIHRvCj4gPiA+ID4gU3RldmUncyBwcmVmZXJlbmNlIGZvciB0aGUgImtlcm5l
bCIgcmVjb3JkIGNvbnZlbnRpb24sIHNvIGRldmlhdGluZwo+ID4gPiA+IGZyb20gdGhpcyB3aWxs
IGNyZWF0ZSB5ZXQgYSBuZXcgZmllbGQgbGlzdC4gIEknbGwgZGVmZXIgdG8gU3RldmUgb24KPiA+
ID4gPiB0aGlzLiBJdCBhbHNvIGhhcyB0byBkbyB3aXRoIHRoZSBzZWFyY2hhYmlsaXR5IG9mIGZp
ZWxkcyBpZiB0aGV5IGFyZQo+ID4gPiA+IG1pc3NpbmcuCj4gPiA+ID4gCj4gPiA+ID4gSSBkbyBh
Z3JlZSB0aGF0IHNvbWUgZmllbGRzIHdpbGwgYmUgc3VwZXJmbHVvdXMgaW4gdGhlIGtlcm5lbCBj
YXNlLgo+ID4gPiA+IFRoZSBtb3N0IGltcG9ydGFudCBmaWVsZCB3b3VsZCBiZSAic3ViaiIsIGJ1
dCB0aGVuICJwaWQiIGFuZCAiY29tbSIsIEkKPiA+ID4gPiB3b3VsZCB0aGluay4gIEJhc2VkIG9u
IHRoaXMgY29udGVudHMgb2YgdGhlICJzdWJqIiBmaWVsZCwgSSdkIHRoaW5rCj4gPiA+ID4gdGhh
dCAidWlkIiwgImF1aWQiLCAidHR5IiwgInNlcyIgYW5kICJleGUiIGFyZSBub3QgbmVlZGVkLgo+
ID4gPiAKPiA+ID4gV2UgY2FuJ3QgYmUgYWRkaW5nIGRlbGV0aW5nIGZpZWxkcyBiYXNlZCBvbiBo
b3cgaXRzIHRyaWdnZXJlZC4gSWYgdGhleQo+ID4gPiBhcmUgdW5zZXQsIHRoYXQgaXMgZmluZS4g
VGhlIG1haW4gaXNzdWUgaXMgdGhleSBoYXZlIHRvIGJlaGF2ZSB0aGUgc2FtZS4KPiA+IAo+ID4g
SSBkb24ndCB0aGluayB0aGUgaW50ZW50IHdhcyB0byBoYXZlIGZpZWxkcyBzd2luZyBpbiBhbmQg
b3V0IGRlcGVuZGluZwo+ID4gb24gdHJpZ2dlci4gIFRoZSBpZGVhIGlzIHRvIHBvdGVudGlhbGx5
IHBlcm1hbmVudGx5IG5vdCBpbmNsdWRlIHRoZW0gaW4KPiA+IHRoaXMgcmVjb3JkIHR5cGUgb25s
eS4gIFRoZSBqdXN0aWZpY2F0aW9uIGlzIHRoYXQgd2hlcmUgdGhleSBhcmVuJ3QKPiA+IG5lZWRl
ZCBmb3IgdGhlIGtlcm5lbCB0cmlnZ2VyIHNpdHVhdGlvbiBpdCBtYWRlIHNlbnNlIHRvIGRlbGV0
ZSB0aGVtCj4gPiBiZWNhdXNlIGlmIGl0IGlzIGEgdXNlciBjb250ZXh0IGV2ZW50IGl0IHdpbGwg
YmUgYWNjb21wYW5pZWQgYnkgYQo+ID4gc3lzY2FsbCByZWNvcmQgdGhhdCBhbHJlYWR5IGhhcyB0
aGF0IGluZm9ybWF0aW9uIGFuZCB0aGVyZSB3b3VsZCBiZSBubwo+ID4gc2Vuc2UgaW4gZHVwbGlj
YXRpbmcgaXQuCj4gCj4gV2Ugc2hvdWxkIG5vdCBiZSBhZGRpbmcgc3lzY2FsbCByZWNvcmRzIHRv
IGFueXRoaW5nIHRoYXQgZG9lcyBub3QgcmVzdWx0IGZyb20gCj4gYSBzeXNjYWxsIHJ1bGUgdHJp
Z2dlcmluZyB0aGUgZXZlbnQuIEl0cyB2ZXJ5IHdhc3RlZnVsLiBNb3JlIHdhc3RlZnVsIHRoYW4g
Cj4ganVzdCBhZGRpbmcgdGhlIG5lY2Vzc2FyeSBmaWVsZHMuCgpTbyB3aGF0IHlvdSBhcmUgc2F5
aW5nIGlzIHlvdSB3YW50IGFsbCB0aGUgZmllbGRzIHRoYXQgYXJlIGJlaW5nCnByb3Bvc2VkIHRv
IGJlIGFkZGVkIHRvIHRoaXMgcmVjb3JkPwoKSWYgdGhlIHJlY29yZHMgYXJlIGFsbCBmcm9tIG9u
ZSBldmVudCwgdGhleSBhbGwgc2hvdWxkIGFsbCBoYXZlIHRoZSBzYW1lCnRpbWVzdGFtcC9zZXJp
YWwgbnVtYmVyIHNvIHRoYXQgdGhlIHJlY29yZHMgYXJlIGtlcHQgdG9nZXRoZXIgYW5kIG5vdApt
aXN0YWtlbiBmb3IgbXVsdGlwbGUgZXZlbnRzLiAgT25lIHJlYXNvbiBmb3IgaGF2aW5nIGluZm9y
bWF0aW9uIGluCnNlcGVyYXRlIHJlY29yZHMgaXMgdG8gYmUgYWJsZSB0byBmaWx0ZXIgdGhlbSBl
aXRoZXIgaW4ga2VybmVsIG9yIGluCnVzZXJzcGFjZSBpZiB5b3UgZG9uJ3QgbmVlZCBjZXJ0YWlu
IHJlY29yZHMuCgo+IEkgYWxzbyB3aXNoZWQgd2UgaGFkIGEgY29kaW5nIHNwZWNpZmljYXRpb24g
dGhhdCBwdXQgdGhpcyBpbiB3cml0aW5nIHNvIHRoYXQgCj4gZXZlcnkgZXZlbnQgaXMgbm90IGEg
Y29tbWl0dGVlIGRlY2lzaW9uLiBUaGF0IGFueW9uZSBjYW4gbG9vayBhdCB0aGUgZG9jdW1lbnQg
Cj4gYW5kIERvIFRoZSBSaWdodCBUaGluZyDihKIuCj4gCj4gSWYgSSBhZGQgYSBzZWN0aW9uIHRv
IFdyaXRpbmctR29vZC1FdmVudHMgb3V0bGluaW5nIHRoZSBleHBlY3RlZCBvcmRlcmluZyBvZiAK
PiBmaWVsZHMsIHdvdWxkIHRoYXQgYmUgZW5vdWdoIHRoYXQgd2UgZG8gbm90IGhhdmUgbG9uZyBk
aXNjdXNzaW9ucyBhYm91dCBldmVudCAKPiBmb3JtYXQ/IEknbSB0aGlua2luZyB0aGlzIHdvdWxk
IGFsc28gaGVscCBuZXcgcGVvcGxlIHRoYXQgd2FudCB0byBjb250cmlidXRlLgoKSWYgeW91IGFk
ZCB0aGlzIGV4cGVjdGVkIG9yZGVyaW5nIG9mIGZpZWxkcywgY2FuIHdlIHJlLWZhY3RvciBhbGwg
dGhlCmtlcm5lbCBjb2RlIHRvIHVzZSB0aGlzIG9yZGVyIGJlY2F1c2UgdGhlIHVzZXJzcGFjZSBw
YXJzZXIgd29uJ3QgY2FyZQp3aGF0IG9yZGVyIHRoZXkgYXJlIGluPwoKSSByZWFsaXplIHRoaXMg
aXNuJ3Qgd2hhdCB5b3UgYXJlIHNheWluZywgYnV0IGhhdmluZyBhIGNsZWFyIGRlc2NyaXB0aW9u
CmluIHRoYXQgZG9jdW1lbnQgdGhhdCB0YWxrcyBhYm91dCB0aGUgZGlmZmVyZW50IGNsYXNzZXMg
b2YgZXZlbnRzIGFuZAp3aGF0IGVhY2ggb25lIG5lZWRzIGluIHRlcm1zIG9mIG1pbmltdW0gdG8g
ZnVsbCBzdWJqZWN0IGF0dHJpYnV0ZXMgYW5kCm9iamVjdCBhdHRyaWJ1dGVzIHdvdWxkIGhlbHAg
YSBsb3QuICBJdCB3b3VsZCBhbHNvIGhlbHAgZm9yIG5ldyByZWNvcmRzCnRvIGJlIGFibGUgdG8g
ZGVjaWRlIGlmIGl0IHNob3VsZCBmb2xsb3cgdGhlIGZvcm1hdCBvZiBhbiBleGlzdGluZwpyZWxh
dGVkIG9yIHNpbWlsYXIgcmVjb3JkLCBvciBhIG5ldyBjbGFzcyB3aXRoIHRoZSBleHBlY3RlZCBz
dGFuZGFyZCBvcmRlci4KCj4gLVN0ZXZlCgotIFJHQgoKLS0KUmljaGFyZCBHdXkgQnJpZ2dzIDxy
Z2JAcmVkaGF0LmNvbT4KU3IuIFMvVyBFbmdpbmVlciwgS2VybmVsIFNlY3VyaXR5LCBCYXNlIE9w
ZXJhdGluZyBTeXN0ZW1zClJlbW90ZSwgT3R0YXdhLCBSZWQgSGF0IENhbmFkYQpJUkM6IHJnYiwg
U3VuUmF5Y2VyClZvaWNlOiArMS42NDcuNzc3LjI2MzUsIEludGVybmFsOiAoODEpIDMyNjM1Cgot
LQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczov
L3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=


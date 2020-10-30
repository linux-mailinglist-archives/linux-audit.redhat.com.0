Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 10FA92A462D
	for <lists+linux-audit@lfdr.de>; Tue,  3 Nov 2020 14:23:58 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-mj3g_w6lPeqb_lT6xMqEeg-1; Tue, 03 Nov 2020 08:23:55 -0500
X-MC-Unique: mj3g_w6lPeqb_lT6xMqEeg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A77B87953A;
	Tue,  3 Nov 2020 13:23:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB6635C88D;
	Tue,  3 Nov 2020 13:23:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F87A8C7C9;
	Tue,  3 Nov 2020 13:23:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09UGHMpf018246 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 12:17:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3B182023438; Fri, 30 Oct 2020 16:17:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD973201EF59
	for <linux-audit@redhat.com>; Fri, 30 Oct 2020 16:17:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 675AA185A78B
	for <linux-audit@redhat.com>; Fri, 30 Oct 2020 16:17:20 +0000 (UTC)
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-514-nI5l594aPBa4vTu_PPgRlQ-1;
	Fri, 30 Oct 2020 12:17:15 -0400
X-MC-Unique: nI5l594aPBa4vTu_PPgRlQ-1
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id D02C58FF; Fri, 30 Oct 2020 11:17:12 -0500 (CDT)
Date: Fri, 30 Oct 2020 11:17:12 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH 00/34] fs: idmapped mounts
Message-ID: <20201030161712.GA30381@mail.hallyn.com>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<8E455D54-FED4-4D06-8CB7-FC6291C64259@amacapital.net>
	<20201030120157.exz4rxmebruh7bgp@wittgenstein>
MIME-Version: 1.0
In-Reply-To: <20201030120157.exz4rxmebruh7bgp@wittgenstein>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09UGHMpf018246
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:23:38 -0500
Cc: Phil Estes <estesp@gmail.com>, Lennart Poettering <lennart@poettering.net>,
	Amir Goldstein <amir73il@gmail.com>, Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	containers@lists.linux-foundation.org, Tycho Andersen <tycho@tycho.ws>,
	Miklos Szeredi <miklos@szeredi.hu>,
	James Morris <jmorris@namei.org>, smbarber@chromium.org,
	Christoph Hellwig <hch@infradead.org>,
	linux-ext4@vger.kernel.org, Mrunal Patel <mpatel@redhat.com>,
	Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
	Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>,
	linux-fsdevel@vger.kernel.org, Aleksa Sarai <cyphar@cyphar.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andy Lutomirski <luto@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Geoffrey Thomas <geofft@ldpreload.com>,
	James Bottomley <james.bottomley@hansenpartnership.com>,
	John Johansen <john.johansen@canonical.com>, Theodore Tso <tytso@mit.edu>,
	Seth Forshee <seth.forshee@canonical.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-unionfs@vger.kernel.org,
	Andy Lutomirski <luto@amacapital.net>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-api@vger.kernel.org, Alban Crequy <alban@kinvolk.io>,
	linux-integrity@vger.kernel.org,
	=?iso-8859-1?Q?St=E9phane?= Graber <stgraber@ubuntu.com>,
	Todd Kjos <tkjos@google.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBPY3QgMzAsIDIwMjAgYXQgMDE6MDE6NTdQTSArMDEwMCwgQ2hyaXN0aWFuIEJyYXVu
ZXIgd3JvdGU6Cj4gT24gVGh1LCBPY3QgMjksIDIwMjAgYXQgMDI6NTg6NTVQTSAtMDcwMCwgQW5k
eSBMdXRvbWlyc2tpIHdyb3RlOgo+ID4gCj4gPiAKPiA+ID4gT24gT2N0IDI4LCAyMDIwLCBhdCA1
OjM1IFBNLCBDaHJpc3RpYW4gQnJhdW5lciA8Y2hyaXN0aWFuLmJyYXVuZXJAdWJ1bnR1LmNvbT4g
d3JvdGU6Cj4gPiA+IAo+ID4gPiDvu79IZXkgZXZlcnlvbmUsCj4gPiA+IAo+ID4gPiBJIHZhbmlz
aGVkIGZvciBhIGxpdHRsZSB3aGlsZSB0byBmb2N1cyBvbiB0aGlzIHdvcmsgaGVyZSBzbyBzb3Jy
eSBmb3IKPiA+ID4gbm90IGJlaW5nIGF2YWlsYWJsZSBieSBtYWlsIGZvciBhIHdoaWxlLgo+ID4g
PiAKPiA+ID4gU2luY2UgcXVpdGUgYSBsb25nIHRpbWUgd2UgaGF2ZSBpc3N1ZXMgd2l0aCBzaGFy
aW5nIG1vdW50cyBiZXR3ZWVuCj4gPiA+IG11bHRpcGxlIHVucHJpdmlsZWdlZCBjb250YWluZXJz
IHdpdGggZGlmZmVyZW50IGlkIG1hcHBpbmdzLCBzaGFyaW5nIGEKPiA+ID4gcm9vdGZzIGJldHdl
ZW4gbXVsdGlwbGUgY29udGFpbmVycyB3aXRoIGRpZmZlcmVudCBpZCBtYXBwaW5ncywgYW5kIGFs
c28KPiA+ID4gc2hhcmluZyByZWd1bGFyIGRpcmVjdG9yaWVzIGFuZCBmaWxlc3lzdGVtcyBiZXR3
ZWVuIHVzZXJzIHdpdGggZGlmZmVyZW50Cj4gPiA+IHVpZHMgYW5kIGdpZHMuIFRoZSBsYXR0ZXIg
dXNlLWNhc2VzIGhhdmUgYmVjb21lIGV2ZW4gbW9yZSBpbXBvcnRhbnQgd2l0aAo+ID4gPiB0aGUg
YXZhaWxhYmlsaXR5IGFuZCBhZG9wdGlvbiBvZiBzeXN0ZW1kLWhvbWVkIChjZi4gWzFdKSB0byBp
bXBsZW1lbnQKPiA+ID4gcG9ydGFibGUgaG9tZSBkaXJlY3Rvcmllcy4KPiA+ID4gCj4gPiA+IFRo
ZSBzb2x1dGlvbnMgd2UgaGF2ZSB0cmllZCBhbmQgcHJvcG9zZWQgc28gZmFyIGluY2x1ZGUgdGhl
IGludHJvZHVjdGlvbgo+ID4gPiBvZiBmc2lkIG1hcHBpbmdzLCBhIHRpbnkgb3ZlcmxheSBiYXNl
ZCBmaWxlc3lzdGVtLCBhbmQgYW4gYXBwcm9hY2ggdG8KPiA+ID4gY2FsbCBvdmVycmlkZSBjcmVk
cyBpbiB0aGUgdmZzLiBOb25lIG9mIHRoZXNlIHNvbHV0aW9ucyBoYXZlIGNvdmVyZWQgYWxsCj4g
PiA+IG9mIHRoZSBhYm92ZSB1c2UtY2FzZXMuCj4gPiA+IAo+ID4gPiBUaGUgc29sdXRpb24gcHJv
cG9zZWQgaGVyZSBoYXMgaXQncyBvcmlnaW5zIGluIG11bHRpcGxlIGRpc2N1c3Npb25zCj4gPiA+
IGR1cmluZyBMaW51eCBQbHVtYmVycyAyMDE3IGR1cmluZyBhbmQgYWZ0ZXIgdGhlIGVuZCBvZiB0
aGUgY29udGFpbmVycwo+ID4gPiBtaWNyb2NvbmZlcmVuY2UuCj4gPiA+IFRvIHRoZSBiZXN0IG9m
IG15IGtub3dsZWRnZSB0aGlzIGludm9sdmVkIEFsZWtzYSwgU3TDqXBoYW5lLCBFcmljLCBEYXZp
ZCwKPiA+ID4gSmFtZXMsIGFuZCBteXNlbGYuIEEgdmFyaWFudCBvZiB0aGUgc29sdXRpb24gcHJv
cG9zZWQgaGVyZSBoYXMgYWxzbyBiZWVuCj4gPiA+IGRpc2N1c3NlZCwgYWdhaW4gdG8gdGhlIGJl
c3Qgb2YgbXkga25vd2xlZGdlLCBhZnRlciBhIExpbnV4IGNvbmZlcmVuY2UKPiA+ID4gaW4gU3Qu
IFBldGVyc2J1cmcgaW4gUnVzc2lhIGJldHdlZW4gQ2hyaXN0b3BoLCBUeWNobywgYW5kIG15c2Vs
ZiBpbiAyMDE3Cj4gPiA+IGFmdGVyIExpbnV4IFBsdW1iZXJzLgo+ID4gPiBJJ3ZlIHRha2VuIHRo
ZSB0aW1lIHRvIGZpbmFsbHkgaW1wbGVtZW50IGEgd29ya2luZyB2ZXJzaW9uIG9mIHRoaXMKPiA+
ID4gc29sdXRpb24gb3ZlciB0aGUgbGFzdCB3ZWVrcyB0byB0aGUgYmVzdCBvZiBteSBhYmlsaXRp
ZXMuIFR5Y2hvIGhhcwo+ID4gPiBzaWduZWQgdXAgZm9yIHRoaXMgc2xpZ3RobHkgY3JhenkgZW5k
ZWF2b3VyIGFzIHdlbGwgYW5kIGhlIGhhcyBoZWxwZWQKPiA+ID4gd2l0aCB0aGUgY29udmVyc2lv
biBvZiB0aGUgeGF0dHIgY29kZXBhdGhzLgo+ID4gPiAKPiA+ID4gVGhlIGNvcmUgaWRlYSBpcyB0
byBtYWtlIGlkbWFwcGluZ3MgYSBwcm9wZXJ0eSBvZiBzdHJ1Y3QgdmZzbW91bnQKPiA+ID4gaW5z
dGVhZCBvZiB0eWluZyBpdCB0byBhIHByb2Nlc3MgYmVpbmcgaW5zaWRlIG9mIGEgdXNlciBuYW1l
c3BhY2Ugd2hpY2gKPiA+ID4gaGFzIGJlZW4gdGhlIGNhc2UgZm9yIGFsbCBvdGhlciBwcm9wb3Nl
ZCBhcHByb2FjaGVzLgo+ID4gPiBJdCBtZWFucyB0aGF0IGlkbWFwcGluZ3MgYmVjb21lIGEgcHJv
cGVydHkgb2YgYmluZC1tb3VudHMsIGkuZS4gZWFjaAo+ID4gPiBiaW5kLW1vdW50IGNhbiBoYXZl
IGEgc2VwYXJhdGUgaWRtYXBwaW5nLiBUaGlzIGhhcyB0aGUgb2J2aW91cyBhZHZhbnRhZ2UKPiA+
ID4gdGhhdCBpZG1hcHBlZCBtb3VudHMgY2FuIGJlIGNyZWF0ZWQgaW5zaWRlIG9mIHRoZSBpbml0
aWFsIHVzZXIKPiA+ID4gbmFtZXNwYWNlLCBpLmUuIG9uIHRoZSBob3N0IGl0c2VsZiBpbnN0ZWFk
IG9mIHJlcXVpcmluZyB0aGUgY2FsbGVyIHRvIGJlCj4gPiA+IGxvY2F0ZWQgaW5zaWRlIG9mIGEg
dXNlciBuYW1lc3BhY2UuIFRoaXMgZW5hYmxlcyBzdWNoIHVzZS1jYXNlcyBhcyBlLmcuCj4gPiA+
IG1ha2luZyBhIHVzYiBzdGljayBhdmFpbGFibGUgaW4gbXVsdGlwbGUgbG9jYXRpb25zIHdpdGgg
ZGlmZmVyZW50Cj4gPiA+IGlkbWFwcGluZ3MgKHNlZSB0aGUgdmZhdCBwb3J0IHRoYXQgaXMgcGFy
dCBvZiB0aGlzIHBhdGNoIHNlcmllcykuCj4gPiA+IAo+ID4gPiBUaGUgdmZzbW91bnQgc3RydWN0
IGdhaW5zIGEgbmV3IHN0cnVjdCB1c2VyX25hbWVzcGFjZSBtZW1iZXIuIFRoZQo+ID4gPiBpZG1h
cHBpbmcgb2YgdGhlIHVzZXIgbmFtZXNwYWNlIGJlY29tZXMgdGhlIGlkbWFwcGluZyBvZiB0aGUg
bW91bnQuIEEKPiA+ID4gY2FsbGVyIHRoYXQgaXMgZWl0aGVyIHByaXZpbGVnZWQgd2l0aCByZXNw
ZWN0IHRvIHRoZSB1c2VyIG5hbWVzcGFjZSBvZgo+ID4gPiB0aGUgc3VwZXJibG9jayBvZiB0aGUg
dW5kZXJseWluZyBmaWxlc3lzdGVtIG9yIGEgY2FsbGVyIHRoYXQgaXMKPiA+ID4gcHJpdmlsZWdl
ZCB3aXRoIHJlc3BlY3QgdG8gdGhlIHVzZXIgbmFtZXNwYWNlIGEgbW91bnQgaGFzIGJlZW4gaWRt
YXBwZWQKPiA+ID4gd2l0aCBjYW4gY3JlYXRlIGEgbmV3IGJpbmQtbW91bnQgYW5kIG1hcmsgaXQg
d2l0aCBhIHVzZXIgbmFtZXNwYWNlLgo+ID4gCj4gPiBTbyBvbmUgd2F5IG9mIHRoaW5raW5nIGFi
b3V0IHRoaXMgaXMgdGhhdCBhIHVzZXIgbmFtZXNwYWNlIHRoYXQgaGFzIGFuIGlkbWFwcGVkIG1v
dW50IGNhbiwgZWZmZWN0aXZlbHksIGNyZWF0ZSBvciBjaG93biBmaWxlcyB3aXRoICphbnkqIG9u
LWRpc2sgdWlkIG9yIGdpZCBieSBkb2luZyBpdCBkaXJlY3RseSAoaWYgdGhhdCB1aWQgZXhpc3Rz
IGluLW5hbWVzcGFjZSwgd2hpY2ggaXMgbGlrZWx5IGZvciBpbnRlcmVzdGluZyBpZHMgbGlrZSAw
KSBvciBieSBjcmVhdGluZyBhIG5ldyB1c2VybnMgd2l0aCB0aGF0IGlkIGluc2lkZS4KPiA+IAo+
ID4gRm9yIGEgZmlsZSBzeXN0ZW0gdGhhdCBpcyBwcml2YXRlIHRvIGEgY29udGFpbmVyLCB0aGlz
IHNlZW1zIG1vZGVyYXRlbHkgc2FmZSwgYWx0aG91Z2ggdGhpcyBtYXkgZGVwZW5kIG9uIHdoYXQg
ZXhhY3RseSDigJxwcml2YXRl4oCdIG1lYW5zLiBXZSBwcm9iYWJseSB3YW50IGEgbWVjaGFuaXNt
IHN1Y2ggdGhhdCwgaWYgeW91IGFyZSBvdXRzaWRlIHRoZSBuYW1lc3BhY2UsIGEgcmVmZXJlbmNl
IHRvIGEgZmlsZSB3aXRoIHRoZSBuYW1lc3BhY2XigJlzIHZmc21udCBkb2VzIG5vdCBjb25mZXIg
c3VpZCBwcml2aWxlZ2UuCj4gPiAKPiA+IEltYWdpbmUgdGhlIGZvbGxvd2luZyBhdHRhY2s6IHVz
ZXIgY3JlYXRlcyBhIG5hbWVzcGFjZSB3aXRoIGEgcm9vdCB1c2VyIGFuZCBhcnJhbmdlcyB0byBn
ZXQgYW4gaWRtYXBwZWQgZnMsIGUuZy4gYnkgaW5zZXJ0aW5nIGFuIGV4dDQgdXNiIHN0aWNrIG9y
IHVzaW5nIHdoYXRldmVyIGNvbnRhaW5lciBtYW5hZ2VtZW50IHRvb2wgZG9lcyB0aGlzLiAgSW5z
aWRlIHRoZSBuYW1lc3BhY2UsIHRoZSB1c2VyIGNyZWF0ZXMgYSBzdWlkLXJvb3QgZmlsZS4KPiA+
IAo+ID4gTm93LCBvdXRzaWRlIHRoZSBuYW1lc3BhY2UsIHRoZSB1c2VyIGhhcyBwcml2aWxlZ2Ug
b3ZlciB0aGUgbmFtZXNwYWNlLiAgKEnigJltIGFzc3VtaW5nIHRoZXJlIGlzIHNvbWUgdG9vbCB0
aGF0IHdpbGwgaWRtYXAgdGhpbmdzIGluIGEgbmFtZXNwYWNlIG93bmVkIGJ5IGFuIHVucHJpdmls
ZWdlZCB1c2VyLCB3aGljaCBzZWVtcyBsaWtlbHkuKS4gU28gdGhlIHVzZXIgbWFrZXMgYSBuZXcg
YmluZCBtb3VudCBhbmQgaWYgbWFwcyBpdCB0byB0aGUgaW5pdCBuYW1lc3BhY2UuIEdhbWUgb3Zl
ci4KPiA+IAo+ID4gU28gSSB0aGluayB3ZSBuZWVkIHRvIGhhdmUgc29tZSBjb250cm9sIHRvIG1p
dGlnYXRlIHRoaXMgaW4gYSBjb21wcmVoZW5zaWJsZSB3YXkuIEEgYmlnIGhhbW1lciB3b3VsZCBi
ZSB0byByZXF1aXJlIG5vc3VpZC4gQSBzbWFsbGVyIGhhbW1lciBtaWdodCBiZSB0byBzYXkgdGhh
dCB5b3UgY2Fu4oCZdCBjcmVhdGUgYSBuZXcgaWRtYXBwZWQgbW91bnQgdW5sZXNzIHlvdSBoYXZl
IHByaXZpbGVnZSBvdmVyIHRoZSB1c2VybnMgdGhhdCB5b3Ugd2FudCB0byB1c2UgZm9yIHRoZSBp
ZG1hcCBhbmQgdG8gc2F5IHRoYXQgYSB2ZnNtbnTigJlzIHBhdGhzIGRvbuKAmXQgZG8gc3VpZCBv
dXRzaWRlIHRoZSBpZG1hcCBuYW1lc3BhY2UuICBXZSBhbHJlYWR5IGRvIHRoZSBsYXR0ZXIgZm9y
IHRoZSB2ZnNtbnTigJlzIG1udG5z4oCZcyB1c2VybnMuCj4gCj4gV2l0aCB0aGlzIHNlcmllcywg
aW4gb3JkZXIgdG8gY3JlYXRlIGFuIGlkbWFwcGVkIG1vdW50IHRoZSB1c2VyIG11c3QKPiBlaXRo
ZXIgYmUgY2FwX3N5c19hZG1pbiBpbiB0aGUgc3VwZXJibG9jayBvZiB0aGUgdW5kZXJseWluZyBm
aWxlc3lzdGVtCj4gb3IgaWYgdGhlIG1vdW50IGlzIGFscmVhZHkgaWRtYXBwZWQgYW5kIHRoZXkg
d2FudCB0byBjcmVhdGUgYW5vdGhlcgo+IGlkbWFwcGVkIG1vdW50IGZyb20gaXQgdGhleSBtdXN0
IGhhdmUgY2FwX3N5c19hZG1pbiBpbiB0aGUgdXNlcm5zIHRoYXQKPiB0aGUgbW91bnQgaXMgY3Vy
cnJlbnRseSBtYXJrZWQgd2l0aC4gSXQgaXMgYWxzbyBub3QgcG9zc2libGUgdG8gY2hhbmdlCj4g
YW4gaWRtYXBwZWQgbW91bnQgb25jZSBpdCBoYXMgYmVlbiBpZG1hcHBlZCwgaS5lLiB0aGUgdXNl
ciBtdXN0IGNyZWF0ZSBhCj4gbmV3IGRldGFjaGVkIGJpbmQtbW91bnQgZmlyc3QuCgpZZWFoIEkg
c3BlbnQgcXVpdGUgc29tZSB0aW1lIGxhc3QgbmlnaHQgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgdGhl
IHNjZW5hcmlvCnlvdSB3ZXJlIHByZXNlbnRpbmcsIGJ1dCBJIGZhaWxlZC4gIEFuZHksIGNvdWxk
IHlvdSBlaXRoZXIgcmVwaHJhc2Ugb3IKZ2l2ZSBhIG1vcmUgY29uY3JldGUgZW5kIHRvIGVuZCBh
dHRhY2sgc2NlbmFyaW8/CgoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0
QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWF1ZGl0


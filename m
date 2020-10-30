Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 06D5F2A057C
	for <lists+linux-audit@lfdr.de>; Fri, 30 Oct 2020 13:33:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-0AouDGxXMvC3ldwq0FzuAQ-1; Fri, 30 Oct 2020 08:33:22 -0400
X-MC-Unique: 0AouDGxXMvC3ldwq0FzuAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 991CA922A86;
	Fri, 30 Oct 2020 12:33:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AFE919656;
	Fri, 30 Oct 2020 12:33:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C7AD5810F;
	Fri, 30 Oct 2020 12:33:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09UC2QIj014002 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 08:02:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 11553F51A1; Fri, 30 Oct 2020 12:02:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B126F519A
	for <linux-audit@redhat.com>; Fri, 30 Oct 2020 12:02:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3F188D632C
	for <linux-audit@redhat.com>; Fri, 30 Oct 2020 12:02:23 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-361-CBHVkdUCNhacXTLAgbniaw-1; Fri, 30 Oct 2020 08:02:21 -0400
X-MC-Unique: CBHVkdUCNhacXTLAgbniaw-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1kYT6V-0006JV-Px; Fri, 30 Oct 2020 12:01:59 +0000
Date: Fri, 30 Oct 2020 13:01:57 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 00/34] fs: idmapped mounts
Message-ID: <20201030120157.exz4rxmebruh7bgp@wittgenstein>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<8E455D54-FED4-4D06-8CB7-FC6291C64259@amacapital.net>
MIME-Version: 1.0
In-Reply-To: <8E455D54-FED4-4D06-8CB7-FC6291C64259@amacapital.net>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:32:56 -0400
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
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-api@vger.kernel.org, Alban Crequy <alban@kinvolk.io>,
	linux-integrity@vger.kernel.org,
	=?utf-8?B?U3TDqXBoYW5l?= Graber <stgraber@ubuntu.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBPY3QgMjksIDIwMjAgYXQgMDI6NTg6NTVQTSAtMDcwMCwgQW5keSBMdXRvbWlyc2tp
IHdyb3RlOgo+IAo+IAo+ID4gT24gT2N0IDI4LCAyMDIwLCBhdCA1OjM1IFBNLCBDaHJpc3RpYW4g
QnJhdW5lciA8Y2hyaXN0aWFuLmJyYXVuZXJAdWJ1bnR1LmNvbT4gd3JvdGU6Cj4gPiAKPiA+IO+7
v0hleSBldmVyeW9uZSwKPiA+IAo+ID4gSSB2YW5pc2hlZCBmb3IgYSBsaXR0bGUgd2hpbGUgdG8g
Zm9jdXMgb24gdGhpcyB3b3JrIGhlcmUgc28gc29ycnkgZm9yCj4gPiBub3QgYmVpbmcgYXZhaWxh
YmxlIGJ5IG1haWwgZm9yIGEgd2hpbGUuCj4gPiAKPiA+IFNpbmNlIHF1aXRlIGEgbG9uZyB0aW1l
IHdlIGhhdmUgaXNzdWVzIHdpdGggc2hhcmluZyBtb3VudHMgYmV0d2Vlbgo+ID4gbXVsdGlwbGUg
dW5wcml2aWxlZ2VkIGNvbnRhaW5lcnMgd2l0aCBkaWZmZXJlbnQgaWQgbWFwcGluZ3MsIHNoYXJp
bmcgYQo+ID4gcm9vdGZzIGJldHdlZW4gbXVsdGlwbGUgY29udGFpbmVycyB3aXRoIGRpZmZlcmVu
dCBpZCBtYXBwaW5ncywgYW5kIGFsc28KPiA+IHNoYXJpbmcgcmVndWxhciBkaXJlY3RvcmllcyBh
bmQgZmlsZXN5c3RlbXMgYmV0d2VlbiB1c2VycyB3aXRoIGRpZmZlcmVudAo+ID4gdWlkcyBhbmQg
Z2lkcy4gVGhlIGxhdHRlciB1c2UtY2FzZXMgaGF2ZSBiZWNvbWUgZXZlbiBtb3JlIGltcG9ydGFu
dCB3aXRoCj4gPiB0aGUgYXZhaWxhYmlsaXR5IGFuZCBhZG9wdGlvbiBvZiBzeXN0ZW1kLWhvbWVk
IChjZi4gWzFdKSB0byBpbXBsZW1lbnQKPiA+IHBvcnRhYmxlIGhvbWUgZGlyZWN0b3JpZXMuCj4g
PiAKPiA+IFRoZSBzb2x1dGlvbnMgd2UgaGF2ZSB0cmllZCBhbmQgcHJvcG9zZWQgc28gZmFyIGlu
Y2x1ZGUgdGhlIGludHJvZHVjdGlvbgo+ID4gb2YgZnNpZCBtYXBwaW5ncywgYSB0aW55IG92ZXJs
YXkgYmFzZWQgZmlsZXN5c3RlbSwgYW5kIGFuIGFwcHJvYWNoIHRvCj4gPiBjYWxsIG92ZXJyaWRl
IGNyZWRzIGluIHRoZSB2ZnMuIE5vbmUgb2YgdGhlc2Ugc29sdXRpb25zIGhhdmUgY292ZXJlZCBh
bGwKPiA+IG9mIHRoZSBhYm92ZSB1c2UtY2FzZXMuCj4gPiAKPiA+IFRoZSBzb2x1dGlvbiBwcm9w
b3NlZCBoZXJlIGhhcyBpdCdzIG9yaWdpbnMgaW4gbXVsdGlwbGUgZGlzY3Vzc2lvbnMKPiA+IGR1
cmluZyBMaW51eCBQbHVtYmVycyAyMDE3IGR1cmluZyBhbmQgYWZ0ZXIgdGhlIGVuZCBvZiB0aGUg
Y29udGFpbmVycwo+ID4gbWljcm9jb25mZXJlbmNlLgo+ID4gVG8gdGhlIGJlc3Qgb2YgbXkga25v
d2xlZGdlIHRoaXMgaW52b2x2ZWQgQWxla3NhLCBTdMOpcGhhbmUsIEVyaWMsIERhdmlkLAo+ID4g
SmFtZXMsIGFuZCBteXNlbGYuIEEgdmFyaWFudCBvZiB0aGUgc29sdXRpb24gcHJvcG9zZWQgaGVy
ZSBoYXMgYWxzbyBiZWVuCj4gPiBkaXNjdXNzZWQsIGFnYWluIHRvIHRoZSBiZXN0IG9mIG15IGtu
b3dsZWRnZSwgYWZ0ZXIgYSBMaW51eCBjb25mZXJlbmNlCj4gPiBpbiBTdC4gUGV0ZXJzYnVyZyBp
biBSdXNzaWEgYmV0d2VlbiBDaHJpc3RvcGgsIFR5Y2hvLCBhbmQgbXlzZWxmIGluIDIwMTcKPiA+
IGFmdGVyIExpbnV4IFBsdW1iZXJzLgo+ID4gSSd2ZSB0YWtlbiB0aGUgdGltZSB0byBmaW5hbGx5
IGltcGxlbWVudCBhIHdvcmtpbmcgdmVyc2lvbiBvZiB0aGlzCj4gPiBzb2x1dGlvbiBvdmVyIHRo
ZSBsYXN0IHdlZWtzIHRvIHRoZSBiZXN0IG9mIG15IGFiaWxpdGllcy4gVHljaG8gaGFzCj4gPiBz
aWduZWQgdXAgZm9yIHRoaXMgc2xpZ3RobHkgY3JhenkgZW5kZWF2b3VyIGFzIHdlbGwgYW5kIGhl
IGhhcyBoZWxwZWQKPiA+IHdpdGggdGhlIGNvbnZlcnNpb24gb2YgdGhlIHhhdHRyIGNvZGVwYXRo
cy4KPiA+IAo+ID4gVGhlIGNvcmUgaWRlYSBpcyB0byBtYWtlIGlkbWFwcGluZ3MgYSBwcm9wZXJ0
eSBvZiBzdHJ1Y3QgdmZzbW91bnQKPiA+IGluc3RlYWQgb2YgdHlpbmcgaXQgdG8gYSBwcm9jZXNz
IGJlaW5nIGluc2lkZSBvZiBhIHVzZXIgbmFtZXNwYWNlIHdoaWNoCj4gPiBoYXMgYmVlbiB0aGUg
Y2FzZSBmb3IgYWxsIG90aGVyIHByb3Bvc2VkIGFwcHJvYWNoZXMuCj4gPiBJdCBtZWFucyB0aGF0
IGlkbWFwcGluZ3MgYmVjb21lIGEgcHJvcGVydHkgb2YgYmluZC1tb3VudHMsIGkuZS4gZWFjaAo+
ID4gYmluZC1tb3VudCBjYW4gaGF2ZSBhIHNlcGFyYXRlIGlkbWFwcGluZy4gVGhpcyBoYXMgdGhl
IG9idmlvdXMgYWR2YW50YWdlCj4gPiB0aGF0IGlkbWFwcGVkIG1vdW50cyBjYW4gYmUgY3JlYXRl
ZCBpbnNpZGUgb2YgdGhlIGluaXRpYWwgdXNlcgo+ID4gbmFtZXNwYWNlLCBpLmUuIG9uIHRoZSBo
b3N0IGl0c2VsZiBpbnN0ZWFkIG9mIHJlcXVpcmluZyB0aGUgY2FsbGVyIHRvIGJlCj4gPiBsb2Nh
dGVkIGluc2lkZSBvZiBhIHVzZXIgbmFtZXNwYWNlLiBUaGlzIGVuYWJsZXMgc3VjaCB1c2UtY2Fz
ZXMgYXMgZS5nLgo+ID4gbWFraW5nIGEgdXNiIHN0aWNrIGF2YWlsYWJsZSBpbiBtdWx0aXBsZSBs
b2NhdGlvbnMgd2l0aCBkaWZmZXJlbnQKPiA+IGlkbWFwcGluZ3MgKHNlZSB0aGUgdmZhdCBwb3J0
IHRoYXQgaXMgcGFydCBvZiB0aGlzIHBhdGNoIHNlcmllcykuCj4gPiAKPiA+IFRoZSB2ZnNtb3Vu
dCBzdHJ1Y3QgZ2FpbnMgYSBuZXcgc3RydWN0IHVzZXJfbmFtZXNwYWNlIG1lbWJlci4gVGhlCj4g
PiBpZG1hcHBpbmcgb2YgdGhlIHVzZXIgbmFtZXNwYWNlIGJlY29tZXMgdGhlIGlkbWFwcGluZyBv
ZiB0aGUgbW91bnQuIEEKPiA+IGNhbGxlciB0aGF0IGlzIGVpdGhlciBwcml2aWxlZ2VkIHdpdGgg
cmVzcGVjdCB0byB0aGUgdXNlciBuYW1lc3BhY2Ugb2YKPiA+IHRoZSBzdXBlcmJsb2NrIG9mIHRo
ZSB1bmRlcmx5aW5nIGZpbGVzeXN0ZW0gb3IgYSBjYWxsZXIgdGhhdCBpcwo+ID4gcHJpdmlsZWdl
ZCB3aXRoIHJlc3BlY3QgdG8gdGhlIHVzZXIgbmFtZXNwYWNlIGEgbW91bnQgaGFzIGJlZW4gaWRt
YXBwZWQKPiA+IHdpdGggY2FuIGNyZWF0ZSBhIG5ldyBiaW5kLW1vdW50IGFuZCBtYXJrIGl0IHdp
dGggYSB1c2VyIG5hbWVzcGFjZS4KPiAKPiBTbyBvbmUgd2F5IG9mIHRoaW5raW5nIGFib3V0IHRo
aXMgaXMgdGhhdCBhIHVzZXIgbmFtZXNwYWNlIHRoYXQgaGFzIGFuIGlkbWFwcGVkIG1vdW50IGNh
biwgZWZmZWN0aXZlbHksIGNyZWF0ZSBvciBjaG93biBmaWxlcyB3aXRoICphbnkqIG9uLWRpc2sg
dWlkIG9yIGdpZCBieSBkb2luZyBpdCBkaXJlY3RseSAoaWYgdGhhdCB1aWQgZXhpc3RzIGluLW5h
bWVzcGFjZSwgd2hpY2ggaXMgbGlrZWx5IGZvciBpbnRlcmVzdGluZyBpZHMgbGlrZSAwKSBvciBi
eSBjcmVhdGluZyBhIG5ldyB1c2VybnMgd2l0aCB0aGF0IGlkIGluc2lkZS4KPiAKPiBGb3IgYSBm
aWxlIHN5c3RlbSB0aGF0IGlzIHByaXZhdGUgdG8gYSBjb250YWluZXIsIHRoaXMgc2VlbXMgbW9k
ZXJhdGVseSBzYWZlLCBhbHRob3VnaCB0aGlzIG1heSBkZXBlbmQgb24gd2hhdCBleGFjdGx5IOKA
nHByaXZhdGXigJ0gbWVhbnMuIFdlIHByb2JhYmx5IHdhbnQgYSBtZWNoYW5pc20gc3VjaCB0aGF0
LCBpZiB5b3UgYXJlIG91dHNpZGUgdGhlIG5hbWVzcGFjZSwgYSByZWZlcmVuY2UgdG8gYSBmaWxl
IHdpdGggdGhlIG5hbWVzcGFjZeKAmXMgdmZzbW50IGRvZXMgbm90IGNvbmZlciBzdWlkIHByaXZp
bGVnZS4KPiAKPiBJbWFnaW5lIHRoZSBmb2xsb3dpbmcgYXR0YWNrOiB1c2VyIGNyZWF0ZXMgYSBu
YW1lc3BhY2Ugd2l0aCBhIHJvb3QgdXNlciBhbmQgYXJyYW5nZXMgdG8gZ2V0IGFuIGlkbWFwcGVk
IGZzLCBlLmcuIGJ5IGluc2VydGluZyBhbiBleHQ0IHVzYiBzdGljayBvciB1c2luZyB3aGF0ZXZl
ciBjb250YWluZXIgbWFuYWdlbWVudCB0b29sIGRvZXMgdGhpcy4gIEluc2lkZSB0aGUgbmFtZXNw
YWNlLCB0aGUgdXNlciBjcmVhdGVzIGEgc3VpZC1yb290IGZpbGUuCj4gCj4gTm93LCBvdXRzaWRl
IHRoZSBuYW1lc3BhY2UsIHRoZSB1c2VyIGhhcyBwcml2aWxlZ2Ugb3ZlciB0aGUgbmFtZXNwYWNl
LiAgKEnigJltIGFzc3VtaW5nIHRoZXJlIGlzIHNvbWUgdG9vbCB0aGF0IHdpbGwgaWRtYXAgdGhp
bmdzIGluIGEgbmFtZXNwYWNlIG93bmVkIGJ5IGFuIHVucHJpdmlsZWdlZCB1c2VyLCB3aGljaCBz
ZWVtcyBsaWtlbHkuKS4gU28gdGhlIHVzZXIgbWFrZXMgYSBuZXcgYmluZCBtb3VudCBhbmQgaWYg
bWFwcyBpdCB0byB0aGUgaW5pdCBuYW1lc3BhY2UuIEdhbWUgb3Zlci4KPiAKPiBTbyBJIHRoaW5r
IHdlIG5lZWQgdG8gaGF2ZSBzb21lIGNvbnRyb2wgdG8gbWl0aWdhdGUgdGhpcyBpbiBhIGNvbXBy
ZWhlbnNpYmxlIHdheS4gQSBiaWcgaGFtbWVyIHdvdWxkIGJlIHRvIHJlcXVpcmUgbm9zdWlkLiBB
IHNtYWxsZXIgaGFtbWVyIG1pZ2h0IGJlIHRvIHNheSB0aGF0IHlvdSBjYW7igJl0IGNyZWF0ZSBh
IG5ldyBpZG1hcHBlZCBtb3VudCB1bmxlc3MgeW91IGhhdmUgcHJpdmlsZWdlIG92ZXIgdGhlIHVz
ZXJucyB0aGF0IHlvdSB3YW50IHRvIHVzZSBmb3IgdGhlIGlkbWFwIGFuZCB0byBzYXkgdGhhdCBh
IHZmc21udOKAmXMgcGF0aHMgZG9u4oCZdCBkbyBzdWlkIG91dHNpZGUgdGhlIGlkbWFwIG5hbWVz
cGFjZS4gIFdlIGFscmVhZHkgZG8gdGhlIGxhdHRlciBmb3IgdGhlIHZmc21udOKAmXMgbW50bnPi
gJlzIHVzZXJucy4KCldpdGggdGhpcyBzZXJpZXMsIGluIG9yZGVyIHRvIGNyZWF0ZSBhbiBpZG1h
cHBlZCBtb3VudCB0aGUgdXNlciBtdXN0CmVpdGhlciBiZSBjYXBfc3lzX2FkbWluIGluIHRoZSBz
dXBlcmJsb2NrIG9mIHRoZSB1bmRlcmx5aW5nIGZpbGVzeXN0ZW0Kb3IgaWYgdGhlIG1vdW50IGlz
IGFscmVhZHkgaWRtYXBwZWQgYW5kIHRoZXkgd2FudCB0byBjcmVhdGUgYW5vdGhlcgppZG1hcHBl
ZCBtb3VudCBmcm9tIGl0IHRoZXkgbXVzdCBoYXZlIGNhcF9zeXNfYWRtaW4gaW4gdGhlIHVzZXJu
cyB0aGF0CnRoZSBtb3VudCBpcyBjdXJycmVudGx5IG1hcmtlZCB3aXRoLiBJdCBpcyBhbHNvIG5v
dCBwb3NzaWJsZSB0byBjaGFuZ2UKYW4gaWRtYXBwZWQgbW91bnQgb25jZSBpdCBoYXMgYmVlbiBp
ZG1hcHBlZCwgaS5lLiB0aGUgdXNlciBtdXN0IGNyZWF0ZSBhCm5ldyBkZXRhY2hlZCBiaW5kLW1v
dW50IGZpcnN0LgoKPiAKPiBIbW0uICBXaGF0IGhhcHBlbnMgaWYgd2UgcmVxdWlyZSB0aGF0IGFu
IGlkbWFwIHVzZXJucyBlcXVhbCB0aGUgdmZzbW504oCZcyBtbnRuc+KAmXMgdXNlcm5zPyAgSXMg
dGhhdCB0b28gbGltaXRpbmc/Cj4gCj4gSSBob3BlIHRoYXQgd2hhdGV2ZXIgc29sdXRpb24gZ2V0
cyB1c2VkIGlzIHN0cmFpZ2h0Zm9yd2FyZCBlbm91Z2ggdG8gd3JhcCBvbmXigJlzIGhlYWQgYXJv
dW5kLgo+IAo+ID4gV2hlbiBhIGZpbGUvaW5vZGUgaXMgYWNjZXNzZWQgdGhyb3VnaCBhbiBpZG1h
cHBlZCBtb3VudCB0aGUgaV91aWQgYW5kCj4gPiBpX2dpZCBvZiB0aGUgaW5vZGUgd2lsbCBiZSBy
ZW1hcHBlZCBhY2NvcmRpbmcgdG8gdGhlIHVzZXIgbmFtZXNwYWNlIHRoZQo+ID4gbW91bnQgaGFz
IGJlZW4gbWFya2VkIHdpdGguIFdoZW4gYSBuZXcgb2JqZWN0IGlzIGNyZWF0ZWQgYmFzZWQgb24g
dGhlCj4gPiBmc3VpZCBhbmQgZnNnaWQgb2YgdGhlIGNhbGxlciB0aGV5IHdpbGwgc2ltaWxhcmx5
IGJlIHJlbWFwcGVkIGFjY29yZGluZwo+ID4gdG8gdGhlIHVzZXIgbmFtZXNwYWNlIG9mIHRoZSBt
b3VudCB0aGV5IGNhcmUgY3JlYXRlZCBmcm9tLgo+IAo+IEJ5IOKAnG1hcHBlZCBhY2NvcmRpbmcg
dG/igJ0sIEkgcHJlc3VtZSB5b3UgbWVhbiB0aGF0IHRoZSBvbi1kaXNrIHVpZC9naWQgaXMgdGhl
IGdpZCBhcyBzZWVuIGluIHRoZSB1c2VyIG5hbWVzcGFjZSBpbiBxdWVzdGlvbi4KCklmIEkgdW5k
ZXJzdGFuZCB5b3UgY29ycmVjdGx5LCB0aGVuIHllcy4KCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcg
bGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1hdWRpdA==


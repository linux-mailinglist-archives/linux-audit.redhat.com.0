Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 73C4D2AC8E1
	for <lists+linux-audit@lfdr.de>; Mon,  9 Nov 2020 23:54:03 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-GJiaVwfOOAikMtP1frBI_g-1; Mon, 09 Nov 2020 17:53:59 -0500
X-MC-Unique: GJiaVwfOOAikMtP1frBI_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6938064155;
	Mon,  9 Nov 2020 22:53:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99D8E5B4C1;
	Mon,  9 Nov 2020 22:53:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D7BF180B658;
	Mon,  9 Nov 2020 22:53:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A3EAsn5027533 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 3 Nov 2020 09:10:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D1E7794646; Tue,  3 Nov 2020 14:10:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC5642EF97
	for <linux-audit@redhat.com>; Tue,  3 Nov 2020 14:10:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A57C48007A4
	for <linux-audit@redhat.com>; Tue,  3 Nov 2020 14:10:52 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-492-k13TeLBqMfqrvn5VJYbTnw-1; Tue, 03 Nov 2020 09:10:48 -0500
X-MC-Unique: k13TeLBqMfqrvn5VJYbTnw-1
Received: by mail-ed1-f67.google.com with SMTP id b9so8183733edu.10
	for <linux-audit@redhat.com>; Tue, 03 Nov 2020 06:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=y8WQjpT9rqVrgeh99s8m7L7lW+jgLfIjyGz2M8+krP0=;
	b=V4VQ9r1bV7pK2VYA6vb8+srl4/9f/dN/SYlHdgNz3ryTiKm2MZyuNxckw3aISR3sec
	k331F17GBZyw2buEcA1azDVxwyMu9FfNOr4iEBqRtFt8Cw5Y9cEaUjoo1GWWsHRSaRmp
	2Kl69M65Dw5nJkkZhNDwhSiQmHSIP4VSqpN+Evfw6V2m1gbh1RcmBEsiAtu1rihRWkBY
	/PrneawWzj+s9axKx2+JiqK1NImiDMt5mCeVchJxA1Os065vxMcs3O0XxG2OA/OZfBF1
	YW1wRWIFJ7ygNsTkTP29TAFx5rej9EDSzOLDNMsQIIoMesuTgo18o9LMPHkjdOaVbM6J
	32ow==
X-Gm-Message-State: AOAM530lZuA8Ca7giMT491Rk6OF70OauPa/nGYlpPeU91aGRP+D5Fr9C
	fdztQkW67wXR2eGa8rMcycHIom17z4/j28gS/zHGPQ==
X-Google-Smtp-Source: ABdhPJwp4QL8RwmQmcT2CoPcUplHSU9HiByLsXAEntwM01IPEN+3MiJMYkcJQ6Od81V70aDSuFwsTxILAnA/OMfjXrI=
X-Received: by 2002:a05:6402:a57:: with SMTP id
	bt23mr10741907edb.62.1604412647178; 
	Tue, 03 Nov 2020 06:10:47 -0800 (PST)
MIME-Version: 1.0
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<87pn51ghju.fsf@x220.int.ebiederm.org>
	<20201029155148.5odu4j2kt62ahcxq@yavin.dot.cyphar.com>
	<87361xdm4c.fsf@x220.int.ebiederm.org>
In-Reply-To: <87361xdm4c.fsf@x220.int.ebiederm.org>
From: Alban Crequy <alban@kinvolk.io>
Date: Tue, 3 Nov 2020 15:10:35 +0100
Message-ID: <CADZs7q4abuN6n8HMrpe2R2kRBUDVPoYRNpezKk4cvXRk7CVHng@mail.gmail.com>
Subject: Re: [PATCH 00/34] fs: idmapped mounts
To: "Eric W. Biederman" <ebiederm@xmission.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0A3EAsn5027533
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 09 Nov 2020 17:53:46 -0500
Cc: Phil Estes <estesp@gmail.com>, Lennart Poettering <lennart@poettering.net>,
	Amir Goldstein <amir73il@gmail.com>, Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Linux Containers <containers@lists.linux-foundation.org>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Tycho Andersen <tycho@tycho.ws>, Miklos Szeredi <miklos@szeredi.hu>,
	James Morris <jmorris@namei.org>, smbarber@chromium.org,
	Christoph Hellwig <hch@infradead.org>,
	linux-ext4@vger.kernel.org, Mrunal Patel <mpatel@redhat.com>,
	Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
	Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Aleksa Sarai <cyphar@cyphar.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Andy Lutomirski <luto@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Geoffrey Thomas <geofft@ldpreload.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John Johansen <john.johansen@canonical.com>, Theodore Tso <tytso@mit.edu>,
	Seth Forshee <seth.forshee@canonical.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-unionfs@vger.kernel.org,
	LSM <linux-security-module@vger.kernel.org>,
	linux-audit@redhat.com, linux-api@vger.kernel.org,
	linux-integrity <linux-integrity@vger.kernel.org>,
	=?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@ubuntu.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBPY3QgMjksIDIwMjAgYXQgNTozNyBQTSBFcmljIFcuIEJpZWRlcm1hbiA8ZWJpZWRl
cm1AeG1pc3Npb24uY29tPiB3cm90ZToKPgo+IEFsZWtzYSBTYXJhaSA8Y3lwaGFyQGN5cGhhci5j
b20+IHdyaXRlczoKPgo+ID4gT24gMjAyMC0xMC0yOSwgRXJpYyBXLiBCaWVkZXJtYW4gPGViaWVk
ZXJtQHhtaXNzaW9uLmNvbT4gd3JvdGU6Cj4gPj4gQ2hyaXN0aWFuIEJyYXVuZXIgPGNocmlzdGlh
bi5icmF1bmVyQHVidW50dS5jb20+IHdyaXRlczoKPiA+Pgo+ID4+ID4gSGV5IGV2ZXJ5b25lLAo+
ID4+ID4KPiA+PiA+IEkgdmFuaXNoZWQgZm9yIGEgbGl0dGxlIHdoaWxlIHRvIGZvY3VzIG9uIHRo
aXMgd29yayBoZXJlIHNvIHNvcnJ5IGZvcgo+ID4+ID4gbm90IGJlaW5nIGF2YWlsYWJsZSBieSBt
YWlsIGZvciBhIHdoaWxlLgo+ID4+ID4KPiA+PiA+IFNpbmNlIHF1aXRlIGEgbG9uZyB0aW1lIHdl
IGhhdmUgaXNzdWVzIHdpdGggc2hhcmluZyBtb3VudHMgYmV0d2Vlbgo+ID4+ID4gbXVsdGlwbGUg
dW5wcml2aWxlZ2VkIGNvbnRhaW5lcnMgd2l0aCBkaWZmZXJlbnQgaWQgbWFwcGluZ3MsIHNoYXJp
bmcgYQo+ID4+ID4gcm9vdGZzIGJldHdlZW4gbXVsdGlwbGUgY29udGFpbmVycyB3aXRoIGRpZmZl
cmVudCBpZCBtYXBwaW5ncywgYW5kIGFsc28KPiA+PiA+IHNoYXJpbmcgcmVndWxhciBkaXJlY3Rv
cmllcyBhbmQgZmlsZXN5c3RlbXMgYmV0d2VlbiB1c2VycyB3aXRoIGRpZmZlcmVudAo+ID4+ID4g
dWlkcyBhbmQgZ2lkcy4gVGhlIGxhdHRlciB1c2UtY2FzZXMgaGF2ZSBiZWNvbWUgZXZlbiBtb3Jl
IGltcG9ydGFudCB3aXRoCj4gPj4gPiB0aGUgYXZhaWxhYmlsaXR5IGFuZCBhZG9wdGlvbiBvZiBz
eXN0ZW1kLWhvbWVkIChjZi4gWzFdKSB0byBpbXBsZW1lbnQKPiA+PiA+IHBvcnRhYmxlIGhvbWUg
ZGlyZWN0b3JpZXMuCj4gPj4KPiA+PiBDYW4geW91IHdhbGsgdXMgdGhyb3VnaCB0aGUgbW90aXZh
dGluZyB1c2UgY2FzZT8KPiA+Pgo+ID4+IEFzIG9mIHRoaXMgeWVhcidzIExQQyBJIGhhZCB0aGUg
ZGlzdGluY3QgaW1wcmVzc2lvbiB0aGF0IHRoZSBwcmltYXJ5IHVzZQo+ID4+IGNhc2UgZm9yIHN1
Y2ggYSBmZWF0dXJlIHdhcyBkdWUgdG8gdGhlIFJMSU1JVF9OUFJPQyBwcm9ibGVtIHdoZXJlIHR3
bwo+ID4+IGNvbnRhaW5lcnMgd2l0aCB0aGUgc2FtZSB1c2VycyBzdGlsbCB3YW50ZWQgZGlmZmVy
ZW50IHVpZCBtYXBwaW5ncyB0bwo+ID4+IHRoZSBkaXNrIGJlY2F1c2UgdGhlIHVzZXJzIHdlcmUg
Y29uZmxpY3Rpbmcgd2l0aCBlYWNoIG90aGVyIGJlY2F1c2Ugb2YKPiA+PiB0aGUgcGVyIHVzZXIg
cmxpbWl0cy4KPiA+Pgo+ID4+IEZpeGluZyBybGltaXRzIGlzIHN0cmFpZ2h0IGZvcndhcmQgdG8g
aW1wbGVtZW50LCBhbmQgZWFzaWVyIHRvIG1hbmFnZQo+ID4+IGZvciBpbXBsZW1lbnRhdGlvbnMg
YW5kIGFkbWluaXN0cmF0b3JzLgo+ID4KPiA+IFRoaXMgaXMgc2VwYXJhdGUgdG8gdGhlIHF1ZXN0
aW9uIG9mICJpc29sYXRlZCB1c2VyIG5hbWVzcGFjZXMiIGFuZAo+ID4gbWFuYWdpbmcgZGlmZmVy
ZW50IG1hcHBpbmdzIGJldHdlZW4gY29udGFpbmVycy4gVGhpcyBwYXRjaHNldCBpcyBzb2x2aW5n
Cj4gPiB0aGUgc2FtZSBwcm9ibGVtIHRoYXQgc2hpZnRmcyBzb2x2ZWQgLS0gc2hhcmluZyBhIHNp
bmdsZSBkaXJlY3RvcnkgdHJlZQo+ID4gYmV0d2VlbiBjb250YWluZXJzIHRoYXQgaGF2ZSBkaWZm
ZXJlbnQgSUQgbWFwcGluZ3MuIHJsaW1pdHMgKG5vciBhbnkgb2YKPiA+IHRoZSBvdGhlciBwcm9w
b3NhbHMgd2UgZGlzY3Vzc2VkIGF0IExQQykgd2lsbCBoZWxwIHdpdGggdGhpcyBwcm9ibGVtLgo+
Cj4gRmlyc3QgYW5kIGZvcmVtb3N0OiBBIHVpZCBzaGlmdCBvbiB3cml0ZSB0byBhIGZpbGVzeXN0
ZW0gaXMgYSBzZWN1cml0eQo+IGJ1ZyB3YWl0aW5nIHRvIGhhcHBlbi4gIFRoaXMgaXMgZXNwZWNp
YWxseSBpbiB0aGUgY29udGV4dCBvZiBmYWNpbGl0aWVzCj4gbGlrZSBpb3VyaW5nLCB0aGF0IHBs
YXkgdmVyeSBhZ3Jlc3NpdmUgZ2FtZXMgd2l0aCBob3cgcHJvY2VzcyBjb250ZXh0Cj4gbWFrZXMg
aXQgdG8gIHN5c3RlbSBjYWxscy4KPgo+IFRoZSBvbmx5IHJlYXNvbiBjb250YWluZXJzIHdlcmUg
bm90IGltbWVkaWF0ZWx5IGV4cGxvaXRhYmxlIHdoZW4gaW91cmluZwo+IHdhcyBpbnRyb2R1Y2Vk
IGlzIGJlY2F1c2UgdGhlIG1lY2hhbmlzbXMgYXJlIGJ1aWx0IHNvIHRoYXQgZXZlbiBpZgo+IHNv
bWV0aGluZyBlc2NhcGVzIGNvbnRhaW5tZW50IHRoZSBzZWN1cml0eSBwcm9wZXJ0aWVzIHN0aWxs
IGFwcGx5Lgo+IENoYW5nZXMgdG8gdGhlIHVpZCB3aGVuIHdyaXRpbmcgdG8gdGhlIGZpbGVzeXN0
ZW0gZG9lcyBub3QgaGF2ZSB0aGF0Cj4gcHJvcGVydHkuICBUaGUgdGluaWVzdCBzbGlwIGluIGNv
bnRhaW5tZW50IHdpbGwgYmUgYSBzZWN1cml0eSBpc3N1ZS4KPgo+IFRoaXMgaXMgbm90IGV2ZW4g
dGhlIGxlYXN0IGJpdCB0aGVvcmV0aWNhbC4gIEkgaGF2ZSBzZWVtIHJlcG9ydHMgb2YgaG93Cj4g
c2hpdGZzK292ZXJsYXlmcyBjcmVhdGVkIGEgc2l0dWF0aW9uIHdoZXJlIGFueW9uZSBjb3VsZCBy
ZWFkCj4gL2V0Yy9zaGFkb3cuCj4KPiBJZiB5b3UgYXJlIGdvaW5nIHRvIHdyaXRlIHVzaW5nIHRo
ZSBzYW1lIHVpZCB0byBkaXNrIGZyb20gZGlmZmVyZW50Cj4gY29udGFpbmVycyB0aGUgcXVlc3Rp
b24gYmVjb21lcyB3aHkgY2FuJ3QgdGhvc2UgY29udGFpbmVycyBjb25maWd1cmUKPiB0aG9zZSB1
c2VycyB0byB1c2UgdGhlIHNhbWUga3VpZD8KPgo+IFdoYXQgZml4aW5nIHJsaW1pdHMgZG9lcyBp
cyBpdCBmaXhlcyBvbmUgb2YgdGhlIHJlYXNvbnMgdGhhdCBkaWZmZXJlbnQKPiBjb250YWluZXJz
IGNvdWxkIG5vdCBzaGFyZSB0aGUgc2FtZSBrdWlkIGZvciB1c2VycyB0aGF0IHdhbnQgdG8gd3Jp
dGUgdG8KPiBkaXNrIHdpdGggdGhlIHNhbWUgdWlkLgo+Cj4KPiBJIGh1bWJseSBzdWdnZXN0IHRo
YXQgaXQgd2lsbCBiZSBtb3JlIHNlY3VyZSwgYW5kIGVhc2llciB0byBtYWludGFpbiBmb3IKPiBi
b3RoIGRldmVsb3BlcnMgYW5kIHVzZXJzIGlmIHdlIGZpeCB0aGUgcmVhc29ucyBwZW9wbGUgd2Fu
dCBkaWZmZXJlbnQKPiBjb250YWluZXJzIHRvIGhhdmUgdGhlIHNhbWUgdXNlciBydW5uaW5nIHdp
dGggZGlmZmVyZW50IGt1aWRzLgo+Cj4gSWYgbm90IHdoYXQgYXJlIHRoZSByZWFzb25zIHdlIGZ1
bmRhbWVudGFsbHkgbmVlZCB0aGUgc2FtZSBvbi1kaXNrIHVzZXIKPiB1c2luZyBtdWx0aXBsZSBr
dWlkcyBpbiB0aGUga2VybmVsPwoKSSB3b3VsZCBsaWtlIHRvIHVzZSB0aGlzIHBhdGNoIHNldCBp
biB0aGUgY29udGV4dCBvZiBLdWJlcm5ldGVzLiBJCmRlc2NyaWJlZCBteSB0d28gcG9zc2libGUg
c2V0dXBzIGluCmh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LWNvbnRhaW5lcnMv
bXNnMzY1MzcuaHRtbDoKCjEuIEVhY2ggS3ViZXJuZXRlcyBwb2QgaGFzIGl0cyBvd24gdXNlcm5z
IGJ1dCB3aXRoIHRoZSBzYW1lIHVzZXIgaWQgbWFwcGluZwoyLiBFYWNoIEt1YmVybmV0ZXMgcG9k
IGhhcyBpdHMgb3duIHVzZXJucyB3aXRoIG5vbi1vdmVybGFwcGluZyB1c2VyIGlkCm1hcHBpbmcg
KHByb3ZpZGluZyBhZGRpdGlvbmFsIGlzb2xhdGlvbiBiZXR3ZWVuIHBvZHMpCgpCdXQgZXZlbiBp
biB0aGUgc2V0dXAgd2hlcmUgYWxsIHBvZHMgcnVuIHdpdGggdGhlIHNhbWUgaWQgbWFwcGluZ3Ms
CnRoaXMgcGF0Y2ggc2V0IGlzIHN0aWxsIHVzZWZ1bCB0byBtZSBmb3IgMiByZWFzb25zOgoKMS4g
VG8gYXZvaWQgdGhlIGV4cGVuc2l2ZSByZWN1cnNpdmUgY2hvd24gb2YgdGhlIHJvb3Rmcy4gV2Ug
Y2Fubm90Cm5lY2Vzc2FyaWx5IGV4dHJhY3QgdGhlIHRhcmJhbGwgZGlyZWN0bHkgd2l0aCB0aGUg
cmlnaHQgdWlkcyBiZWNhdXNlCndlIG1pZ2h0IHVzZSB0aGUgc2FtZSBjb250YWluZXIgaW1hZ2Ug
Zm9yIHByaXZpbGVnZWQgY29udGFpbmVycyAod2l0aAp0aGUgaG9zdCB1c2VybnMpIGFuZCB1bnBy
aXZpbGVnZWQgY29udGFpbmVycyAod2l0aCBhIG5ldyB1c2VybnMpLCBzbwp3ZSBoYXZlIGF0IGxl
YXN0IDIg4oCcbWFwcGluZ3PigJ0gKHRha2luZyBtb3JlIHRpbWUgYW5kIHJlc3VsdGluZyBpbiBt
b3JlCnN0b3JhZ2Ugc3BhY2UpLiBBbHRob3VnaCB0aGUg4oCcbWV0YWNvcHnigJ0gbW91bnQgb3B0
aW9uIGluIG92ZXJsYXlmcwpoZWxwcyB0byBtYWtlIHRoZSByZWN1cnNpdmUgY2hvd24gZmFzdGVy
LCBpdCBjYW4gc3RpbGwgdGFrZSB0aW1lIHdpdGgKbGFyZ2UgY29udGFpbmVyIGltYWdlcyB3aXRo
IGxvdHMgb2YgZmlsZXMuIEnigJlkIGxpa2UgdG8gdXNlIHRoaXMgcGF0Y2gKc2V0IHRvIHNldCB1
cCB0aGUgcm9vdCBmcyBpbiBjb25zdGFudCB0aW1lLgoKMi4gVG8gbWFuYWdlIGxhcmdlIGV4dGVy
bmFsIHZvbHVtZXMgKE5GUyBvciBvdGhlciBmaWxlc3lzdGVtcykuIEV2ZW4KaWYgYWRtaW5zIGNh
biBkZWNpZGUgdG8gdXNlIHRoZSBzYW1lIGt1aWQgb24gYWxsIHRoZSBub2RlcyBvZiB0aGUKS3Vi
ZXJuZXRlcyBjbHVzdGVyLCB0aGlzIGlzIGltcHJhY3RpY2FsIGZvciBtaWdyYXRpb24uIFBlb3Bs
ZSBjYW4gaGF2ZQpleGlzdGluZyBLdWJlcm5ldGVzIGNsdXN0ZXJzIChjdXJyZW50bHkgd2l0aG91
dCB1c2luZyB1c2VyIG5hbWVzcGFjZXMpCmFuZCBsYXJnZSBORlMgdm9sdW1lcy4gSWYgdGhleSB3
YW50IHRvIHN3aXRjaCB0byBhIG5ldyB2ZXJzaW9uIG9mCkt1YmVybmV0ZXMgd2l0aCB0aGUgdXNl
ciBuYW1lc3BhY2UgZmVhdHVyZSBlbmFibGVkLCB0aGV5IHdvdWxkIG5lZWQgdG8KcmVjdXJzaXZl
bHkgY2hvd24gYWxsIHRoZSBmaWxlcyBvbiB0aGUgTkZTIHNoYXJlcy4gVGhpcyBjb3VsZCB0YWtl
CnRpbWUgb24gbGFyZ2UgZmlsZXN5c3RlbXMgYW5kIHJlYWxpc3RpY2FsbHksIHdlIHdhbnQgdG8g
c3VwcG9ydApyb2xsaW5nIHVwZGF0ZXMgd2hlcmUgc29tZSBub2RlcyB1c2UgdGhlIHByZXZpb3Vz
IHZlcnNpb24gd2l0aG91dCB1c2VyCm5hbWVzcGFjZXMgYW5kIG5ldyBub2RlcyBhcmUgcHJvZ3Jl
c3NpdmVseSBtaWdyYXRlZCB0byB0aGUgbmV3IHVzZXJucwp3aXRoIHRoZSBuZXcgaWQgbWFwcGlu
Zy4gSWYgYm90aCBzZXRzIG9mIG5vZGVzIHVzZSB0aGUgc2FtZSBORlMgc2hhcmUsCnRoYXQgY2Fu
4oCZdCB3b3JrLgoKQWxiYW4KCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVk
aXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYXVkaXQ=


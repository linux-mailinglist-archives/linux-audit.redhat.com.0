Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2C629F803
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 23:31:17 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-RxPf_pJgOFapMojvK5_g1g-1; Thu, 29 Oct 2020 18:31:13 -0400
X-MC-Unique: RxPf_pJgOFapMojvK5_g1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B49D4186DD31;
	Thu, 29 Oct 2020 22:31:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDCF75C22D;
	Thu, 29 Oct 2020 22:31:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E4D1CF69;
	Thu, 29 Oct 2020 22:31:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09TLxLw8010728 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 29 Oct 2020 17:59:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C4AC2201154F; Thu, 29 Oct 2020 21:59:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB3AC2011556
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 21:59:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6642B858298
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 21:59:19 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-143-uZ6u8zMYPCqPA4m0scgDJA-1; Thu, 29 Oct 2020 17:59:17 -0400
X-MC-Unique: uZ6u8zMYPCqPA4m0scgDJA-1
Received: by mail-pg1-f196.google.com with SMTP id x13so3464063pgp.7
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 14:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:content-transfer-encoding:from:mime-version
	:subject:date:message-id:references:cc:in-reply-to:to;
	bh=7mpKGmhk7KbAdNRg8CrtKSJUwgz+Qb8kytsY0ITcAGk=;
	b=JeWq5v4L8u/BeWhkRpZPvcc/mAYkWuLjrKJ0ehNgJAtUzgcSZa7v4PHWUkwWhZkxAp
	/ULGdWgYsawZPXL3JBjRXNdaXePmzaphrhjlkqhV0GVvewwXMjwrtNOdIRQxqKVfFZXA
	UFnetrSoP6n6SwMhP7DooH6D3iITGRdime4HTjNXibYtSNj5SSCIK3bcva4pX+U87EL6
	iujbGut4WSXT+iT1NkpgPlzcrPqqWbYbhRIpd3BTW/eYrVyLxxAFnkrlxnbsCCjNE/W9
	DH76KFLI9czx03mRhcFTJk2aEcssyC5FgHiWeQ1WYn621JTnJM5jiXbeUpLsyVbXGBBr
	1HxQ==
X-Gm-Message-State: AOAM532ZuMbcKFvE/o7YqJNHbX/eLPyPUtwYVZoUHGWuElONabee99Na
	bozoicbUZe/YeZD5vlnvzGtkfw==
X-Google-Smtp-Source: ABdhPJxSWOh4ftHI47KiCrZ0illEdrC1OP4fiqquB1QRs+VL+ywYh7woPj1uc9hDTpndfsW71KZ7Hw==
X-Received: by 2002:a63:1d12:: with SMTP id d18mr5911604pgd.314.1604008755871; 
	Thu, 29 Oct 2020 14:59:15 -0700 (PDT)
Received: from ?IPv6:2600:1012:b011:6d49:b5a8:d1fb:e286:b4a2?
	([2600:1012:b011:6d49:b5a8:d1fb:e286:b4a2])
	by smtp.gmail.com with ESMTPSA id
	mp13sm814127pjb.36.2020.10.29.14.59.14
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 29 Oct 2020 14:59:15 -0700 (PDT)
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 00/34] fs: idmapped mounts
Date: Thu, 29 Oct 2020 14:58:55 -0700
Message-Id: <8E455D54-FED4-4D06-8CB7-FC6291C64259@amacapital.net>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
In-Reply-To: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09TLxLw8010728
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 29 Oct 2020 18:30:40 -0400
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
	=?utf-8?Q?St=C3=A9phane_Graber?= <stgraber@ubuntu.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Cgo+IE9uIE9jdCAyOCwgMjAyMCwgYXQgNTozNSBQTSwgQ2hyaXN0aWFuIEJyYXVuZXIgPGNocmlz
dGlhbi5icmF1bmVyQHVidW50dS5jb20+IHdyb3RlOgo+IAo+IO+7v0hleSBldmVyeW9uZSwKPiAK
PiBJIHZhbmlzaGVkIGZvciBhIGxpdHRsZSB3aGlsZSB0byBmb2N1cyBvbiB0aGlzIHdvcmsgaGVy
ZSBzbyBzb3JyeSBmb3IKPiBub3QgYmVpbmcgYXZhaWxhYmxlIGJ5IG1haWwgZm9yIGEgd2hpbGUu
Cj4gCj4gU2luY2UgcXVpdGUgYSBsb25nIHRpbWUgd2UgaGF2ZSBpc3N1ZXMgd2l0aCBzaGFyaW5n
IG1vdW50cyBiZXR3ZWVuCj4gbXVsdGlwbGUgdW5wcml2aWxlZ2VkIGNvbnRhaW5lcnMgd2l0aCBk
aWZmZXJlbnQgaWQgbWFwcGluZ3MsIHNoYXJpbmcgYQo+IHJvb3RmcyBiZXR3ZWVuIG11bHRpcGxl
IGNvbnRhaW5lcnMgd2l0aCBkaWZmZXJlbnQgaWQgbWFwcGluZ3MsIGFuZCBhbHNvCj4gc2hhcmlu
ZyByZWd1bGFyIGRpcmVjdG9yaWVzIGFuZCBmaWxlc3lzdGVtcyBiZXR3ZWVuIHVzZXJzIHdpdGgg
ZGlmZmVyZW50Cj4gdWlkcyBhbmQgZ2lkcy4gVGhlIGxhdHRlciB1c2UtY2FzZXMgaGF2ZSBiZWNv
bWUgZXZlbiBtb3JlIGltcG9ydGFudCB3aXRoCj4gdGhlIGF2YWlsYWJpbGl0eSBhbmQgYWRvcHRp
b24gb2Ygc3lzdGVtZC1ob21lZCAoY2YuIFsxXSkgdG8gaW1wbGVtZW50Cj4gcG9ydGFibGUgaG9t
ZSBkaXJlY3Rvcmllcy4KPiAKPiBUaGUgc29sdXRpb25zIHdlIGhhdmUgdHJpZWQgYW5kIHByb3Bv
c2VkIHNvIGZhciBpbmNsdWRlIHRoZSBpbnRyb2R1Y3Rpb24KPiBvZiBmc2lkIG1hcHBpbmdzLCBh
IHRpbnkgb3ZlcmxheSBiYXNlZCBmaWxlc3lzdGVtLCBhbmQgYW4gYXBwcm9hY2ggdG8KPiBjYWxs
IG92ZXJyaWRlIGNyZWRzIGluIHRoZSB2ZnMuIE5vbmUgb2YgdGhlc2Ugc29sdXRpb25zIGhhdmUg
Y292ZXJlZCBhbGwKPiBvZiB0aGUgYWJvdmUgdXNlLWNhc2VzLgo+IAo+IFRoZSBzb2x1dGlvbiBw
cm9wb3NlZCBoZXJlIGhhcyBpdCdzIG9yaWdpbnMgaW4gbXVsdGlwbGUgZGlzY3Vzc2lvbnMKPiBk
dXJpbmcgTGludXggUGx1bWJlcnMgMjAxNyBkdXJpbmcgYW5kIGFmdGVyIHRoZSBlbmQgb2YgdGhl
IGNvbnRhaW5lcnMKPiBtaWNyb2NvbmZlcmVuY2UuCj4gVG8gdGhlIGJlc3Qgb2YgbXkga25vd2xl
ZGdlIHRoaXMgaW52b2x2ZWQgQWxla3NhLCBTdMOpcGhhbmUsIEVyaWMsIERhdmlkLAo+IEphbWVz
LCBhbmQgbXlzZWxmLiBBIHZhcmlhbnQgb2YgdGhlIHNvbHV0aW9uIHByb3Bvc2VkIGhlcmUgaGFz
IGFsc28gYmVlbgo+IGRpc2N1c3NlZCwgYWdhaW4gdG8gdGhlIGJlc3Qgb2YgbXkga25vd2xlZGdl
LCBhZnRlciBhIExpbnV4IGNvbmZlcmVuY2UKPiBpbiBTdC4gUGV0ZXJzYnVyZyBpbiBSdXNzaWEg
YmV0d2VlbiBDaHJpc3RvcGgsIFR5Y2hvLCBhbmQgbXlzZWxmIGluIDIwMTcKPiBhZnRlciBMaW51
eCBQbHVtYmVycy4KPiBJJ3ZlIHRha2VuIHRoZSB0aW1lIHRvIGZpbmFsbHkgaW1wbGVtZW50IGEg
d29ya2luZyB2ZXJzaW9uIG9mIHRoaXMKPiBzb2x1dGlvbiBvdmVyIHRoZSBsYXN0IHdlZWtzIHRv
IHRoZSBiZXN0IG9mIG15IGFiaWxpdGllcy4gVHljaG8gaGFzCj4gc2lnbmVkIHVwIGZvciB0aGlz
IHNsaWd0aGx5IGNyYXp5IGVuZGVhdm91ciBhcyB3ZWxsIGFuZCBoZSBoYXMgaGVscGVkCj4gd2l0
aCB0aGUgY29udmVyc2lvbiBvZiB0aGUgeGF0dHIgY29kZXBhdGhzLgo+IAo+IFRoZSBjb3JlIGlk
ZWEgaXMgdG8gbWFrZSBpZG1hcHBpbmdzIGEgcHJvcGVydHkgb2Ygc3RydWN0IHZmc21vdW50Cj4g
aW5zdGVhZCBvZiB0eWluZyBpdCB0byBhIHByb2Nlc3MgYmVpbmcgaW5zaWRlIG9mIGEgdXNlciBu
YW1lc3BhY2Ugd2hpY2gKPiBoYXMgYmVlbiB0aGUgY2FzZSBmb3IgYWxsIG90aGVyIHByb3Bvc2Vk
IGFwcHJvYWNoZXMuCj4gSXQgbWVhbnMgdGhhdCBpZG1hcHBpbmdzIGJlY29tZSBhIHByb3BlcnR5
IG9mIGJpbmQtbW91bnRzLCBpLmUuIGVhY2gKPiBiaW5kLW1vdW50IGNhbiBoYXZlIGEgc2VwYXJh
dGUgaWRtYXBwaW5nLiBUaGlzIGhhcyB0aGUgb2J2aW91cyBhZHZhbnRhZ2UKPiB0aGF0IGlkbWFw
cGVkIG1vdW50cyBjYW4gYmUgY3JlYXRlZCBpbnNpZGUgb2YgdGhlIGluaXRpYWwgdXNlcgo+IG5h
bWVzcGFjZSwgaS5lLiBvbiB0aGUgaG9zdCBpdHNlbGYgaW5zdGVhZCBvZiByZXF1aXJpbmcgdGhl
IGNhbGxlciB0byBiZQo+IGxvY2F0ZWQgaW5zaWRlIG9mIGEgdXNlciBuYW1lc3BhY2UuIFRoaXMg
ZW5hYmxlcyBzdWNoIHVzZS1jYXNlcyBhcyBlLmcuCj4gbWFraW5nIGEgdXNiIHN0aWNrIGF2YWls
YWJsZSBpbiBtdWx0aXBsZSBsb2NhdGlvbnMgd2l0aCBkaWZmZXJlbnQKPiBpZG1hcHBpbmdzIChz
ZWUgdGhlIHZmYXQgcG9ydCB0aGF0IGlzIHBhcnQgb2YgdGhpcyBwYXRjaCBzZXJpZXMpLgo+IAo+
IFRoZSB2ZnNtb3VudCBzdHJ1Y3QgZ2FpbnMgYSBuZXcgc3RydWN0IHVzZXJfbmFtZXNwYWNlIG1l
bWJlci4gVGhlCj4gaWRtYXBwaW5nIG9mIHRoZSB1c2VyIG5hbWVzcGFjZSBiZWNvbWVzIHRoZSBp
ZG1hcHBpbmcgb2YgdGhlIG1vdW50LiBBCj4gY2FsbGVyIHRoYXQgaXMgZWl0aGVyIHByaXZpbGVn
ZWQgd2l0aCByZXNwZWN0IHRvIHRoZSB1c2VyIG5hbWVzcGFjZSBvZgo+IHRoZSBzdXBlcmJsb2Nr
IG9mIHRoZSB1bmRlcmx5aW5nIGZpbGVzeXN0ZW0gb3IgYSBjYWxsZXIgdGhhdCBpcwo+IHByaXZp
bGVnZWQgd2l0aCByZXNwZWN0IHRvIHRoZSB1c2VyIG5hbWVzcGFjZSBhIG1vdW50IGhhcyBiZWVu
IGlkbWFwcGVkCj4gd2l0aCBjYW4gY3JlYXRlIGEgbmV3IGJpbmQtbW91bnQgYW5kIG1hcmsgaXQg
d2l0aCBhIHVzZXIgbmFtZXNwYWNlLgoKU28gb25lIHdheSBvZiB0aGlua2luZyBhYm91dCB0aGlz
IGlzIHRoYXQgYSB1c2VyIG5hbWVzcGFjZSB0aGF0IGhhcyBhbiBpZG1hcHBlZCBtb3VudCBjYW4s
IGVmZmVjdGl2ZWx5LCBjcmVhdGUgb3IgY2hvd24gZmlsZXMgd2l0aCAqYW55KiBvbi1kaXNrIHVp
ZCBvciBnaWQgYnkgZG9pbmcgaXQgZGlyZWN0bHkgKGlmIHRoYXQgdWlkIGV4aXN0cyBpbi1uYW1l
c3BhY2UsIHdoaWNoIGlzIGxpa2VseSBmb3IgaW50ZXJlc3RpbmcgaWRzIGxpa2UgMCkgb3IgYnkg
Y3JlYXRpbmcgYSBuZXcgdXNlcm5zIHdpdGggdGhhdCBpZCBpbnNpZGUuCgpGb3IgYSBmaWxlIHN5
c3RlbSB0aGF0IGlzIHByaXZhdGUgdG8gYSBjb250YWluZXIsIHRoaXMgc2VlbXMgbW9kZXJhdGVs
eSBzYWZlLCBhbHRob3VnaCB0aGlzIG1heSBkZXBlbmQgb24gd2hhdCBleGFjdGx5IOKAnHByaXZh
dGXigJ0gbWVhbnMuIFdlIHByb2JhYmx5IHdhbnQgYSBtZWNoYW5pc20gc3VjaCB0aGF0LCBpZiB5
b3UgYXJlIG91dHNpZGUgdGhlIG5hbWVzcGFjZSwgYSByZWZlcmVuY2UgdG8gYSBmaWxlIHdpdGgg
dGhlIG5hbWVzcGFjZeKAmXMgdmZzbW50IGRvZXMgbm90IGNvbmZlciBzdWlkIHByaXZpbGVnZS4K
CkltYWdpbmUgdGhlIGZvbGxvd2luZyBhdHRhY2s6IHVzZXIgY3JlYXRlcyBhIG5hbWVzcGFjZSB3
aXRoIGEgcm9vdCB1c2VyIGFuZCBhcnJhbmdlcyB0byBnZXQgYW4gaWRtYXBwZWQgZnMsIGUuZy4g
YnkgaW5zZXJ0aW5nIGFuIGV4dDQgdXNiIHN0aWNrIG9yIHVzaW5nIHdoYXRldmVyIGNvbnRhaW5l
ciBtYW5hZ2VtZW50IHRvb2wgZG9lcyB0aGlzLiAgSW5zaWRlIHRoZSBuYW1lc3BhY2UsIHRoZSB1
c2VyIGNyZWF0ZXMgYSBzdWlkLXJvb3QgZmlsZS4KCk5vdywgb3V0c2lkZSB0aGUgbmFtZXNwYWNl
LCB0aGUgdXNlciBoYXMgcHJpdmlsZWdlIG92ZXIgdGhlIG5hbWVzcGFjZS4gIChJ4oCZbSBhc3N1
bWluZyB0aGVyZSBpcyBzb21lIHRvb2wgdGhhdCB3aWxsIGlkbWFwIHRoaW5ncyBpbiBhIG5hbWVz
cGFjZSBvd25lZCBieSBhbiB1bnByaXZpbGVnZWQgdXNlciwgd2hpY2ggc2VlbXMgbGlrZWx5Liku
IFNvIHRoZSB1c2VyIG1ha2VzIGEgbmV3IGJpbmQgbW91bnQgYW5kIGlmIG1hcHMgaXQgdG8gdGhl
IGluaXQgbmFtZXNwYWNlLiBHYW1lIG92ZXIuCgpTbyBJIHRoaW5rIHdlIG5lZWQgdG8gaGF2ZSBz
b21lIGNvbnRyb2wgdG8gbWl0aWdhdGUgdGhpcyBpbiBhIGNvbXByZWhlbnNpYmxlIHdheS4gQSBi
aWcgaGFtbWVyIHdvdWxkIGJlIHRvIHJlcXVpcmUgbm9zdWlkLiBBIHNtYWxsZXIgaGFtbWVyIG1p
Z2h0IGJlIHRvIHNheSB0aGF0IHlvdSBjYW7igJl0IGNyZWF0ZSBhIG5ldyBpZG1hcHBlZCBtb3Vu
dCB1bmxlc3MgeW91IGhhdmUgcHJpdmlsZWdlIG92ZXIgdGhlIHVzZXJucyB0aGF0IHlvdSB3YW50
IHRvIHVzZSBmb3IgdGhlIGlkbWFwIGFuZCB0byBzYXkgdGhhdCBhIHZmc21udOKAmXMgcGF0aHMg
ZG9u4oCZdCBkbyBzdWlkIG91dHNpZGUgdGhlIGlkbWFwIG5hbWVzcGFjZS4gIFdlIGFscmVhZHkg
ZG8gdGhlIGxhdHRlciBmb3IgdGhlIHZmc21udOKAmXMgbW50bnPigJlzIHVzZXJucy4KCkhtbS4g
IFdoYXQgaGFwcGVucyBpZiB3ZSByZXF1aXJlIHRoYXQgYW4gaWRtYXAgdXNlcm5zIGVxdWFsIHRo
ZSB2ZnNtbnTigJlzIG1udG5z4oCZcyB1c2VybnM/ICBJcyB0aGF0IHRvbyBsaW1pdGluZz8KCkkg
aG9wZSB0aGF0IHdoYXRldmVyIHNvbHV0aW9uIGdldHMgdXNlZCBpcyBzdHJhaWdodGZvcndhcmQg
ZW5vdWdoIHRvIHdyYXAgb25l4oCZcyBoZWFkIGFyb3VuZC4KCj4gV2hlbiBhIGZpbGUvaW5vZGUg
aXMgYWNjZXNzZWQgdGhyb3VnaCBhbiBpZG1hcHBlZCBtb3VudCB0aGUgaV91aWQgYW5kCj4gaV9n
aWQgb2YgdGhlIGlub2RlIHdpbGwgYmUgcmVtYXBwZWQgYWNjb3JkaW5nIHRvIHRoZSB1c2VyIG5h
bWVzcGFjZSB0aGUKPiBtb3VudCBoYXMgYmVlbiBtYXJrZWQgd2l0aC4gV2hlbiBhIG5ldyBvYmpl
Y3QgaXMgY3JlYXRlZCBiYXNlZCBvbiB0aGUKPiBmc3VpZCBhbmQgZnNnaWQgb2YgdGhlIGNhbGxl
ciB0aGV5IHdpbGwgc2ltaWxhcmx5IGJlIHJlbWFwcGVkIGFjY29yZGluZwo+IHRvIHRoZSB1c2Vy
IG5hbWVzcGFjZSBvZiB0aGUgbW91bnQgdGhleSBjYXJlIGNyZWF0ZWQgZnJvbS4KCkJ5IOKAnG1h
cHBlZCBhY2NvcmRpbmcgdG/igJ0sIEkgcHJlc3VtZSB5b3UgbWVhbiB0aGF0IHRoZSBvbi1kaXNr
IHVpZC9naWQgaXMgdGhlIGdpZCBhcyBzZWVuIGluIHRoZSB1c2VyIG5hbWVzcGFjZSBpbiBxdWVz
dGlvbi4KCgoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5j
b20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0


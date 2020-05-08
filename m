Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBEC1CA109
	for <lists+linux-audit@lfdr.de>; Fri,  8 May 2020 04:46:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588906006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=biNSXJW5srlbA7JocJfg47AtJ/ZmUnD7ya5xX0sNRaA=;
	b=P28xRSCgJ2OcuDSK2GKkJEjgEhdMgnpOeimdZ3G+pSLHVxdx5Zv+eO04m1aY/J2SeYXeqh
	W1wv5NijQmRnmarbgCfKUPpqnt8Sl1kLQJYKWGj5/16JpxDS5gzKdIf8Qu3ImD7A9S2qWT
	5gQzleRtrnqCYbcKlyQnQlIrjsATIEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-N8VqeewpMWKLuyt2SUYlag-1; Thu, 07 May 2020 22:46:44 -0400
X-MC-Unique: N8VqeewpMWKLuyt2SUYlag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18F1A107ACCA;
	Fri,  8 May 2020 02:46:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BD6E60C05;
	Fri,  8 May 2020 02:46:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFD921809543;
	Fri,  8 May 2020 02:46:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0482kEYL012654 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 22:46:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0CBB2166B28; Fri,  8 May 2020 02:46:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CD512156A3A
	for <linux-audit@redhat.com>; Fri,  8 May 2020 02:46:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB19180CDB0
	for <linux-audit@redhat.com>; Fri,  8 May 2020 02:46:11 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-396-NT2xidFGO6WSPZOZEClr7A-1; Thu, 07 May 2020 22:46:09 -0400
X-MC-Unique: NT2xidFGO6WSPZOZEClr7A-1
Received: by mail-ej1-f65.google.com with SMTP id e2so78736eje.13
	for <linux-audit@redhat.com>; Thu, 07 May 2020 19:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iQ2gUFI81zeg1a5zdsIjwtK5Rb6dwen8h/jBk+vpiRo=;
	b=aS7i7cuua5mHL1jBoP18HldDL/RAqrXOb5FUvreNdvlk73US0VUVT5uYHC8tsaYowc
	C97K3aRbv2VUpwpXHGntw77lkbgyI0RNiGbGPQvFBbSJ9r3O41JoULWwVymeOzwtMWoL
	Y4PzibQQB3FFqZnRi0ush+YbABT/lI8aHhsv/Ys48GFyttfH6Owmhbj8Cp6NTYKNvj1f
	rXwX8XT3oWKVAoUvezf3MBOeNxRqbw+uAJ3MLkPZC/fDirOmjg3Iq4zj5nM6duRehEUS
	LrwEL6Wdtcx63/ynOvBQAzYnbwDVkBCiXh7vetaKftsgwc0JDkUzSQJpVD86A6OZf+Ng
	ox5g==
X-Gm-Message-State: AGi0PuYGv05Jyt0hSyMySYTNaikpINIqqWThk0H6z2HN+L388gNWBBRp
	t1qVWfsYfsXhxjqP2E9Gy5xY2pQ1CfLsl/Uz2Hvz
X-Google-Smtp-Source: APiQypKBWRGQwD/uc5JAkuFDrcSqR2UWelW7Dr/hOdDJa+TxQZq0gB42kyMFgxPvFYbL+Yt1dZQwE7YU8IFhMIsZExc=
X-Received: by 2002:a17:906:f106:: with SMTP id
	gv6mr92903ejb.271.1588905967163; 
	Thu, 07 May 2020 19:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587500467.git.rgb@redhat.com> <3348737.k9gCtgYObn@x2>
	<20200429213247.6ewxqf66i2apgyuz@madcap2.tricolour.ca>
	<3250272.v6NOfJhyum@x2>
	<20200506224233.najv6ltb5gzcicqb@madcap2.tricolour.ca>
In-Reply-To: <20200506224233.najv6ltb5gzcicqb@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 7 May 2020 22:45:56 -0400
Message-ID: <CAHC9VhQyzqw_c8b4v1eby59hP_UM8tn=4yUBoMv9Td6UYdEQsw@mail.gmail.com>
Subject: Re: [PATCH ghak25 v4 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0482kEYL012654
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBNYXkgNiwgMjAyMCBhdCA2OjQzIFBNIFJpY2hhcmQgR3V5IEJyaWdncyA8cmdiQHJl
ZGhhdC5jb20+IHdyb3RlOgo+IE9uIDIwMjAtMDUtMDYgMTc6MjYsIFN0ZXZlIEdydWJiIHdyb3Rl
Ogo+ID4gT24gV2VkbmVzZGF5LCBBcHJpbCAyOSwgMjAyMCA1OjMyOjQ3IFBNIEVEVCBSaWNoYXJk
IEd1eSBCcmlnZ3Mgd3JvdGU6Cj4gPiA+IE9uIDIwMjAtMDQtMjkgMTQ6NDcsIFN0ZXZlIEdydWJi
IHdyb3RlOgo+ID4gPiA+IE9uIFdlZG5lc2RheSwgQXByaWwgMjksIDIwMjAgMTA6MzE6NDYgQU0g
RURUIFJpY2hhcmQgR3V5IEJyaWdncyB3cm90ZToKPiA+ID4gPiA+IE9uIDIwMjAtMDQtMjggMTg6
MjUsIFBhdWwgTW9vcmUgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFdlZCwgQXByIDIyLCAyMDIwIGF0
IDU6NDAgUE0gUmljaGFyZCBHdXkgQnJpZ2dzIDxyZ2JAcmVkaGF0LmNvbT4KPiA+ID4gPgo+ID4g
PiA+IHdyb3RlOgo+ID4gPiA+ID4gPiA+IFNvbWUgdGFibGUgdW5yZWdpc3RlciBhY3Rpb25zIHNl
ZW0gdG8gYmUgaW5pdGlhdGVkIGJ5IHRoZSBrZXJuZWwgdG8KPiA+ID4gPiA+ID4gPiBnYXJiYWdl
IGNvbGxlY3QgdW51c2VkIHRhYmxlcyB0aGF0IGFyZSBub3QgaW5pdGlhdGVkIGJ5IGFueQo+ID4g
PiA+ID4gPiA+IHVzZXJzcGFjZQo+ID4gPiA+ID4gPiA+IGFjdGlvbnMuICBJdCB3YXMgZm91bmQg
dG8gYmUgbmVjZXNzYXJ5IHRvIGFkZCB0aGUgc3ViamVjdAo+ID4gPiA+ID4gPiA+IGNyZWRlbnRp
YWxzCj4gPiA+ID4gPiA+ID4gdG8gIGNvdmVyIHRoaXMgY2FzZSB0byByZXZlYWwgdGhlIHNvdXJj
ZSBvZiB0aGVzZSBhY3Rpb25zLiAgQQo+ID4gPiA+ID4gPiA+IHNhbXBsZQo+ID4gPiA+ID4gPiA+
IHJlY29yZDoKPiA+ID4gPiA+ID4gPiB0eXBlPU5FVEZJTFRFUl9DRkcgbXNnPWF1ZGl0KDIwMjAt
MDMtMTEgMjE6MjU6MjEuNDkxOjI2OSkgOgo+ID4gPiA+ID4gPiA+IHRhYmxlPW5hdAo+ID4gPiA+
ID4gPiA+IGZhbWlseT1icmlkZ2UgZW50cmllcz0wIG9wPXVucmVnaXN0ZXIgcGlkPTE1MyB1aWQ9
cm9vdCBhdWlkPXVuc2V0Cj4gPiA+ID4gPiA+ID4gdHR5PShub25lKSBzZXM9dW5zZXQgc3Viaj1z
eXN0ZW1fdTpzeXN0ZW1fcjprZXJuZWxfdDpzMAo+ID4gPiA+ID4gPiA+IGNvbW09a3dvcmtlci91
NDoyIGV4ZT0obnVsbCk+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFtJJ20gZ29pbmcgdG8gY29t
bWVudCB1cCBoZXJlIGluc3RlYWQgb2YgaW4gdGhlIGNvZGUgYmVjYXVzZSBpdCBpcyBhCj4gPiA+
ID4gPiA+IGJpdCBlYXNpZXIgZm9yIGV2ZXJ5b25lIHRvIHNlZSB3aGF0IHRoZSBhY3R1YWwgaW1w
YWN0IG1pZ2h0IGJlIG9uIHRoZQo+ID4gPiA+ID4gPiByZWNvcmRzLl0KPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gU3RldmUgd2FudHMgc3ViamVjdCBpbmZvIGluIHRoaXMgY2FzZSwgb2theSwgYnV0
IGxldCdzIHRyeSB0byB0cmltCj4gPiA+ID4gPiA+IG91dAo+ID4gPiA+ID4gPiBzb21lIG9mIHRo
ZSBmaWVsZHMgd2hpY2ggc2ltcGx5IGRvbid0IG1ha2Ugc2Vuc2UgaW4gdGhpcyByZWNvcmQ7IEkn
bQo+ID4gPiA+ID4gPiB0aGlua2luZyBvZiBmaWVsZHMgdGhhdCBhcmUgdW5zZXQvZW1wdHkgaW4g
dGhlIGtlcm5lbCBjYXNlIGFuZCBhcmUKPiA+ID4gPiA+ID4gZHVwbGljYXRlcyBvZiBvdGhlciBy
ZWNvcmRzIGluIHRoZSB1c2Vyc3BhY2Uvc3lzY2FsbCBjYXNlLiAgSSB0aGluawo+ID4gPiA+ID4g
PiB0aGF0IG1lYW5zIHdlIGNhbiBkcm9wICJ0dHkiLCAic2VzIiwgImNvbW0iLCBhbmQgImV4ZSIg
Li4uIHllcz8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBGcm9tIHRoZSBnaGFrMjggZGlzY3Vzc2lvbiwg
dGhpcyBsaXN0IGFuZCBvcmRlciB3YXMgc2VsZWN0ZWQgZHVlIHRvCj4gPiA+ID4gPiBTdGV2ZSdz
IHByZWZlcmVuY2UgZm9yIHRoZSAia2VybmVsIiByZWNvcmQgY29udmVudGlvbiwgc28gZGV2aWF0
aW5nCj4gPiA+ID4gPiBmcm9tIHRoaXMgd2lsbCBjcmVhdGUgeWV0IGEgbmV3IGZpZWxkIGxpc3Qu
ICBJJ2xsIGRlZmVyIHRvIFN0ZXZlIG9uCj4gPiA+ID4gPiB0aGlzLiBJdCBhbHNvIGhhcyB0byBk
byB3aXRoIHRoZSBzZWFyY2hhYmlsaXR5IG9mIGZpZWxkcyBpZiB0aGV5IGFyZQo+ID4gPiA+ID4g
bWlzc2luZy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIGRvIGFncmVlIHRoYXQgc29tZSBmaWVsZHMg
d2lsbCBiZSBzdXBlcmZsdW91cyBpbiB0aGUga2VybmVsIGNhc2UuCj4gPiA+ID4gPiBUaGUgbW9z
dCBpbXBvcnRhbnQgZmllbGQgd291bGQgYmUgInN1YmoiLCBidXQgdGhlbiAicGlkIiBhbmQgImNv
bW0iLCBJCj4gPiA+ID4gPiB3b3VsZCB0aGluay4gIEJhc2VkIG9uIHRoaXMgY29udGVudHMgb2Yg
dGhlICJzdWJqIiBmaWVsZCwgSSdkIHRoaW5rCj4gPiA+ID4gPiB0aGF0ICJ1aWQiLCAiYXVpZCIs
ICJ0dHkiLCAic2VzIiBhbmQgImV4ZSIgYXJlIG5vdCBuZWVkZWQuCj4gPiA+ID4KPiA+ID4gPiBX
ZSBjYW4ndCBiZSBhZGRpbmcgZGVsZXRpbmcgZmllbGRzIGJhc2VkIG9uIGhvdyBpdHMgdHJpZ2dl
cmVkLiBJZiB0aGV5Cj4gPiA+ID4gYXJlIHVuc2V0LCB0aGF0IGlzIGZpbmUuIFRoZSBtYWluIGlz
c3VlIGlzIHRoZXkgaGF2ZSB0byBiZWhhdmUgdGhlIHNhbWUuCj4gPiA+Cj4gPiA+IEkgZG9uJ3Qg
dGhpbmsgdGhlIGludGVudCB3YXMgdG8gaGF2ZSBmaWVsZHMgc3dpbmcgaW4gYW5kIG91dCBkZXBl
bmRpbmcKPiA+ID4gb24gdHJpZ2dlci4gIFRoZSBpZGVhIGlzIHRvIHBvdGVudGlhbGx5IHBlcm1h
bmVudGx5IG5vdCBpbmNsdWRlIHRoZW0gaW4KPiA+ID4gdGhpcyByZWNvcmQgdHlwZSBvbmx5LiAg
VGhlIGp1c3RpZmljYXRpb24gaXMgdGhhdCB3aGVyZSB0aGV5IGFyZW4ndAo+ID4gPiBuZWVkZWQg
Zm9yIHRoZSBrZXJuZWwgdHJpZ2dlciBzaXR1YXRpb24gaXQgbWFkZSBzZW5zZSB0byBkZWxldGUg
dGhlbQo+ID4gPiBiZWNhdXNlIGlmIGl0IGlzIGEgdXNlciBjb250ZXh0IGV2ZW50IGl0IHdpbGwg
YmUgYWNjb21wYW5pZWQgYnkgYQo+ID4gPiBzeXNjYWxsIHJlY29yZCB0aGF0IGFscmVhZHkgaGFz
IHRoYXQgaW5mb3JtYXRpb24gYW5kIHRoZXJlIHdvdWxkIGJlIG5vCj4gPiA+IHNlbnNlIGluIGR1
cGxpY2F0aW5nIGl0Lgo+ID4KPiA+IFdlIHNob3VsZCBub3QgYmUgYWRkaW5nIHN5c2NhbGwgcmVj
b3JkcyB0byBhbnl0aGluZyB0aGF0IGRvZXMgbm90IHJlc3VsdCBmcm9tCj4gPiBhIHN5c2NhbGwg
cnVsZSB0cmlnZ2VyaW5nIHRoZSBldmVudC4gSXRzIHZlcnkgd2FzdGVmdWwuIE1vcmUgd2FzdGVm
dWwgdGhhbgo+ID4ganVzdCBhZGRpbmcgdGhlIG5lY2Vzc2FyeSBmaWVsZHMuCj4KPiBTbyB3aGF0
IHlvdSBhcmUgc2F5aW5nIGlzIHlvdSB3YW50IGFsbCB0aGUgZmllbGRzIHRoYXQgYXJlIGJlaW5n
Cj4gcHJvcG9zZWQgdG8gYmUgYWRkZWQgdG8gdGhpcyByZWNvcmQ/Cj4KPiBJZiB0aGUgcmVjb3Jk
cyBhcmUgYWxsIGZyb20gb25lIGV2ZW50LCB0aGV5IGFsbCBzaG91bGQgYWxsIGhhdmUgdGhlIHNh
bWUKPiB0aW1lc3RhbXAvc2VyaWFsIG51bWJlciBzbyB0aGF0IHRoZSByZWNvcmRzIGFyZSBrZXB0
IHRvZ2V0aGVyIGFuZCBub3QKPiBtaXN0YWtlbiBmb3IgbXVsdGlwbGUgZXZlbnRzLiAgT25lIHJl
YXNvbiBmb3IgaGF2aW5nIGluZm9ybWF0aW9uIGluCj4gc2VwZXJhdGUgcmVjb3JkcyBpcyB0byBi
ZSBhYmxlIHRvIGZpbHRlciB0aGVtIGVpdGhlciBpbiBrZXJuZWwgb3IgaW4KPiB1c2Vyc3BhY2Ug
aWYgeW91IGRvbid0IG5lZWQgY2VydGFpbiByZWNvcmRzLgoKWWVzLCBJJ20gb3Bwb3NlZCB0byBk
dXBsaWNhdGluZyBmaWVsZHMgYWNyb3NzIHJlY29yZHMgaW4gYSBzaW5nbGUKZXZlbnQuICBJZiB0
aGVyZSBhcmUgY2FzZXMgd2hlcmUgd2UgaGF2ZSBhIHN0YW5kYWxvbmUgcmVjb3JkLCBzdWNoIGFz
CndpdGggInVucmVnaXN0ZXIiLCB0aGVuIHRoZXJlIGlzIGFuIGFyZ3VtZW50IHRvIGJlIG1hZGUg
YWJvdXQKZHVwbGljYXRpbmcgc29tZSBmaWVsZHMgdGhhdCBhcmUgaW1wb3J0YW50IGluIHRoZSBz
dGFuZGFsb25lCnVucmVnaXN0ZXIgY2FzZS4gIEhvd2V2ZXIsIHRoaXMgaXMgKm9ubHkqIGZvciB0
aG9zZSBmaWVsZHMgd2hpY2ggbWFrZQpzZW5zZSBpbiB0aGUgc3RhbmRhbG9uZSBrZXJuZWwgdW5y
ZWdpc3RlciBldmVudDsgaWYgdGhlIGZpZWxkIGlzbid0CnVzZWZ1bCBpbiB0aGlzIHVucmVnaXN0
ZXIgY29ybmVyIGNhc2UgKmFuZCogaXQgaXMgZHVwbGljYXRlZCBpbgphbm90aGVyIHJlY29yZCB0
eXBlIHdoaWNoIG5vcm1hbGx5IGFjY29tcGFuaWVzIHRoaXMgcmVjb3JkIGluIGFuIGV2ZW50CnRo
ZXJlIGlzIG5vIHJlYXNvbiBpdCBuZWVkcyB0byBiZSBpbiB0aGlzIHJlY29yZC4KCj4gPiBJIGFs
c28gd2lzaGVkIHdlIGhhZCBhIGNvZGluZyBzcGVjaWZpY2F0aW9uIHRoYXQgcHV0IHRoaXMgaW4g
d3JpdGluZyBzbyB0aGF0Cj4gPiBldmVyeSBldmVudCBpcyBub3QgYSBjb21taXR0ZWUgZGVjaXNp
b24uIFRoYXQgYW55b25lIGNhbiBsb29rIGF0IHRoZSBkb2N1bWVudAo+ID4gYW5kIERvIFRoZSBS
aWdodCBUaGluZyDihKIuCj4gPgo+ID4gSWYgSSBhZGQgYSBzZWN0aW9uIHRvIFdyaXRpbmctR29v
ZC1FdmVudHMgb3V0bGluaW5nIHRoZSBleHBlY3RlZCBvcmRlcmluZyBvZgo+ID4gZmllbGRzLCB3
b3VsZCB0aGF0IGJlIGVub3VnaCB0aGF0IHdlIGRvIG5vdCBoYXZlIGxvbmcgZGlzY3Vzc2lvbnMg
YWJvdXQgZXZlbnQKPiA+IGZvcm1hdD8gSSdtIHRoaW5raW5nIHRoaXMgd291bGQgYWxzbyBoZWxw
IG5ldyBwZW9wbGUgdGhhdCB3YW50IHRvIGNvbnRyaWJ1dGUuCgpUbyBiZSBjbGVhciwgd2UgYXJl
IG5vdCBjaGFuZ2luZyBhbnkgZXhpc3RpbmcgcmVjb3JkIGZvcm1hdHM7IHRoZXkgYXJlCnBhcnQg
b2YgdGhlIGtlcm5lbC91c2Vyc3BhY2UgQUJJIGFuZCBjaGFuZ2luZyB0aGVtIHdvdWxkIGJyZWFr
IHRoZQpBQkkuCgpJbiBhIHBlcmZlY3Qgd29ybGQgYm90aCB0aGUgYXVkaXQga2VybmVsIGFuZCB1
c2Vyc3BhY2Ugd291bGQgaGF2ZSBiZWVuCmRlc2lnbmVkLCBpbXBsZW1lbnRlZCwgYW5kIGRvY3Vt
ZW50ZWQgYmV0dGVyLiAgVW5mb3J0dW5hdGVseSBpdCB3YXNuJ3QKYW5kIHdlIGhhdmUgdG8gbGl2
ZSB3aXRoIHdoYXQgd2UgaGF2ZS4KCi0tIApwYXVsIG1vb3JlCnd3dy5wYXVsLW1vb3JlLmNvbQoK
Ci0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBz
Oi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdA==


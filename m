Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 13BC42C2B9D
	for <lists+linux-audit@lfdr.de>; Tue, 24 Nov 2020 16:43:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-8nzwu7yQNFe_07zp4u124A-1; Tue, 24 Nov 2020 10:43:42 -0500
X-MC-Unique: 8nzwu7yQNFe_07zp4u124A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55DC718C43C4;
	Tue, 24 Nov 2020 15:43:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 354335D719;
	Tue, 24 Nov 2020 15:43:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD65318095C7;
	Tue, 24 Nov 2020 15:43:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AOFhKM4004759 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 10:43:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 699392166B2A; Tue, 24 Nov 2020 15:43:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 648D32166B27
	for <linux-audit@redhat.com>; Tue, 24 Nov 2020 15:43:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 516708007D9
	for <linux-audit@redhat.com>; Tue, 24 Nov 2020 15:43:18 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
	[209.85.167.169]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-200-SeKspmUNMfGsc8mPN6SUcg-1; Tue, 24 Nov 2020 10:43:15 -0500
X-MC-Unique: SeKspmUNMfGsc8mPN6SUcg-1
Received: by mail-oi1-f169.google.com with SMTP id s18so23083187oih.1
	for <linux-audit@redhat.com>; Tue, 24 Nov 2020 07:43:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=/vPVvWv0LjIWFWjqz1299fL9Y4irMRvg9pdYdLVpRZ4=;
	b=E2bIIx4nTjGu38uHUOClVjFWYS0+8KkeGoQDqe0U2XlY9iQMsms1k6AvtfyGFvdtsc
	CnP1g1eZZd7LqNUZ699fYrzQAKL+QE/z06rCM4nhSdVFaIxqEuvlQ8Ucz4QkR/YMP6Zf
	xhj9lvlRTHNi/+s8wTbfClKINchI/OH/3jCJ2sdZXFaWQ7Uui45bu9KGhQBHyMHaRqyJ
	2CGGcNZCeI6gm7v4YjIcw3utLoRLuH7/jAQYbiqNLRNpVtCAnaZFpmigJXCBqUgHDsTQ
	fZu5uijybgq30NQ9lUzltLYRimOoUbJTHflewpvvsww4P4MqOsB6eqWxmWuVlRWfYp8m
	DCnA==
X-Gm-Message-State: AOAM530yTXELMbAQXzGCMClEAVA2V/EkY1Vgu8q2X+jwQ7QkRsPQQpc6
	+3I8tKrPKis/PxzQH9PtyAHwrwvQWVty6Eii
X-Google-Smtp-Source: ABdhPJybZvpuZzjh0qpjWEjiX2Ne7q88CdTDN81sysdGu13yb3vNVYvbqb5sRKajLK9I9PKKtPXY3w==
X-Received: by 2002:a05:6808:24d:: with SMTP id
	m13mr957725oie.106.1606232594565; 
	Tue, 24 Nov 2020 07:43:14 -0800 (PST)
Received: from [192.168.1.19]
	(47-220-175-246.gtwncmkt04.res.dyn.suddenlink.net. [47.220.175.246])
	by smtp.gmail.com with ESMTPSA id
	h94sm6942490otb.21.2020.11.24.07.43.13 for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 24 Nov 2020 07:43:13 -0800 (PST)
Subject: Re: Identifying thread/process termination
To: linux-audit@redhat.com
References: <5FB81C79.9090103@tlinx.org>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <a1fbfa76-beb1-ffb7-da0a-5a451d163f4f@magitekltd.com>
Date: Tue, 24 Nov 2020 09:43:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5FB81C79.9090103@tlinx.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMTEvMjAvMjAgMTo0MyBQTSwgTC4gQS4gV2Fsc2ggd3JvdGU6Cgo+IFJlcG9zdCBmcm9tIHJp
Z2h0IGFkZHJlc3MuCj4gT24gMjAyMC8xMC8wOCAwODozMywgTGVubnkgQnJ1emVuYWsgd3JvdGU6
Cj4KPj4gT24gMTAvNy8yMCA3OjI3IFBNLCBQYXVsIE1vb3JlIHdyb3RlOgo+Pgo+PiDCoAo+Pj4g
QWxtb3N0IGV2ZXJ5d2hlcmUgaW4gdGhlIGtlcm5lbCB3ZSByZWNvcmQgdGhlIFRHSUQgZm9yIHRo
ZSAicGlkPSIKPj4+IHZhbHVlcyBhbmQgbm90IHRoZSBhY3R1YWwgdGFzay90aHJlYWQgSUQuwqAg
VGhhdCBkZWNpc2lvbiB3YXMgbWFkZQo+Pj4gYmVmb3JlIG15IGhlYXZ5IGludm9sdmVtZW50IHdp
dGggYXVkaXQsIGJ1dCBteSBndWVzcyBpcyB0aGF0IG1vc3QKPj4+IGF1ZGl0IHVzZXJzIGFyZSBm
b2N1c2VkIG1vcmUgb24gc2VjdXJpdHkgcmVsZXZhbnQgZXZlbnRzIGF0IHRoZQo+Pj4gcHJvY2Vz
cyBsZXZlbCwgbm90IHRoZSB0aHJlYWQgbGV2ZWwuwqAgQWZ0ZXIgYWxsLCB0aGVyZSBpc24ndCBy
ZWFsbHkKPj4+IG11Y2ggaW4gdGhlIHdheSBvZiBzaWduaWZpY2FudCBib3VuZGFyaWVzIGJldHdl
ZW4gdGhyZWFkcy4KPj4+IMKgwqDCoCAKPj4KPj4gVGhhdCdzIHJpZ2h0LCBQYXVsLiBUaGUgcHJv
Y2VzcyAoZXhlL2NvbW0pIGlzIHRoZSBkaXNjcmltaW5hdG9yIGZyb20KPj4gYSBzZWN1cml0eSBw
ZXJzcGVjdGl2ZS4KPj4gwqAgCj4gLS0tLQo+IMKgU28sIHdoZW4gZGlmZmVyZW50IHRocmVhZHMg
cGVyZm9ybSAvIGV4ZWN1dGUgZGlmZmVyZW50IGZ1bmN0aW9uYWxpdHkKPiBhcyBsb2FkZWQgYnkg
YSBydW50aW1lIGxvYWRhYmxlIGxpYnJhcmllcywgaG93IGlzIHRoYXQgZGlzY3JpbWluYXRlZAo+
IGZyb20gdGhlIGluaXRpYWxseSBzdGFydGVkIHByb2dyYW0/Cj4KPiDCoE9mdGVuLCBwcm9ncmFt
cyB3aXRoIG1hbnkgdGhyZWFkcyB3aWxsIHJlbmFtZSB0aGUgdGhyZWFkcyBzbyB0aGV5Cj4gc2hv
dyB1cCBkaWZmZXJlbnRseSwgdGhvdWdoIHNvbWUgb2YgdGhvc2UgbWF5IGJlIHByb2Nlc3Nlcywg
b24gbGludXgKPiB0aGVyZSByZWFsbHkgYXJlbid0IGFueSB0aHJlYWRzIGFzIGJlaW5nIHNlcGFy
YXRlIGZyb20gcHJvY2Vzc2VzIC0tIGkuZS4KPiB0aHJlYWRzLCBhdCB0aGUgbGludXgga2VybmVs
IGxldmVsIGFyZSBidWlsdCBvbiBwcm9jZXNzZXMgQUZBSUsuwqAgRWl0aGVyCj4gd2F5LCB0aGVy
ZSBjYW4gYmUgYSBzZXBhcmF0aW9uIG9mIHdoYXQgaXMgZXhlY3V0ZWQgYmFzZWQgb24gd2hhdCB0
aHJlYWRzCj4gYXJlIGFzc2lnbmVkIHdoYXQgcHVycG9zZXMuwqAgSSdkIGJlIGhlc2l0YW50IHRv
IGxhYmVsIHRoZSBleGUvY29tbSBhcwo+IHRoZSBvbmx5IGRpc2NyaW1pbmF0b3IgaW4gYW4gImFy
Yml0cmFyeSB0YXJnZXQgZW52aXJvbm1lbnQiLsKgIENlcnRhaW5seQo+IGl0IGNhbiBiZSBpbiBz
b21lLCBidXQgdGhhdCBkb2Vzbid0IG1lYW4gaXQgaGFzIHRvIGJlIHNvbGUgZGlzY3JpbWluYXRv
cgo+IHdoZW4gZGlmZmVyZW50IHRocmVhZHMgY2FuIGJlIG1hcHBlZCB0byBkaWZmZXJlbnQgZnVu
Y3Rpb25zIGluCj4gMSBzdGFydGluZyBiaW5hcnkuCj4KPiDCoEluIGEgc2ltaWxhciB3YXksIGNv
cmV1dGlscywgY2FuIGJlIHVzZWQgYXMgMSBsaWJyYXJ5L2JpbmFyeSB3aGVyZQo+IGZ1bmN0aW9u
YWxpdHkgaXMgZGV0ZXJtaW5lZCBieSB0aGUgaW52b2tpbmcgbmFtZS7CoCBXaGlsZSBjb3JldXRp
bHMgdXNlcwo+IHNlcGFyYXRlIG5hbWVzIGZvciBlYWNoIGZ1bmN0aW9uLCB0aGVyZSdzIG5vdGhp
bmcgc3RvcHBpbmcgY3JlYXRpbmcKPiAxIGJpbmFyeSB3aXRoIGFsbCBmdW5jdGlvbnMgbGF1bmNo
ZWQgaW4gc2VwYXJhdGUgdGhyZWFkcyBsYXVuY2hlZCBvdXQgb2YKPiDCoHNvbWUgc2hlbGwgcGVy
Zm9ybWluZyBkaXZlcnNlIGZ1bmN0aW9ucyBiYXNlZCBvbiBhIHRocmVhZCBJRCBvciBuYW1lLgo+
IENlcnRhaW5seSBpdCBpc24ndCB0aGUgY29tbW9uIGNhc2UsIGJ1dCBpdCB3b3VsZCBiZSBhIHdh
eSBmb3IgYSBoYWNrZXIKPiB0byBtYWtlIHRoZWlyIGFjdGlvbnMgbW9yZSBvcGFxdWUgZ2l2ZW4g
Y3VycmVudCBsaW1pdGF0aW9ucy7CoCBBdCB0aGUKPiBzYW1lIHRpbWUsIGl0IG1pZ2h0IGJlIHRo
ZSB3YXkgdG8gY3JlYXRlIHNvbWUgdHlwZSBvZiAnYWxsLWluLW9uZScgc2hlbGwKPiB0aGF0IGNv
dWxkIGJlIGNvbmZpZ3VyZWQgYnkgcnVudGltZSBwcmVzZW5jZSBvZiBsb2FkYWJsZSBvYmplY3Rz
Lgo+Cj4gwqBBbiBhdWRpdCBzeXN0ZW0gc3VwcG9ydGluZyBhcHBlbmRpbmcgb2YgYXJiaXRyYXJ5
IGRhdGEgdHlwZXMgY291bGQKPiBzdXBwb3J0IGFwcGVuZGluZyBuZXcgZGF0YSBpdGVtcy90eXBl
cyBhcyBuZWVkZWQgZm9yIGV4dGVuc2lvbi7CoCBTdWNoCj4gd2FzIHRoZSBJcml4IGF1ZGl0IHN5
c3RlbSB0aGF0IHdhcyBwb3J0ZWQgdG8gc2dpJ3MgbGludXggYmVmb3JlIHRoZQo+IHByb2plY3Qg
d2FzIGNhbmNlbGxlZC4gSXQgaGFkIHNpbWlsYXIgYmVuZWZpdHMgdG8gdGhlIHZhcmlvdXMgbGF5
ZXJzIGFuZAo+IHByb3RvY29scyB0aGF0IGhhdmUgYmVlbiBhZGRlZCBvbiB0b3Agb2YgSVB2NCBu
ZXR3b3JraW5nLCB3aXRoIHdyYXBwZXJzCj4gYXJvdW5kIHRoZSBsb3ctbGV2ZWwgSVAgbGF5ZXIg
YmVpbmcgYWRkZWQgYXMgbmV3IHByb3RvY29scyBkZW1hbmRlZC4KPgo+IMKgSnVzdCBzYXlpbmcs
IGEgY2FzZSBjYW4gYmUgbWFkZSBmb3IgbmVlZGVkIGFkZGl0aW9ucyBub3Qgb3JpZ2luYWxseQo+
IHBsYW5uZWQgLS0gc29tZXRoaW5nIHRoYXQgaXMgYWxtb3N0IGFsd2F5cyBuZWVkZWQgaW4gdGlt
ZS4KPgpTb3JyeSBmb3IgdGhlIGJlbGF0ZWQgcmVwbHkuIEdvb2QgcG9pbnRzLgoKVGhlIG1haW4g
Zm9jdXMgKG9mIGFuIGF1ZGl0IHN5c3RlbSkgaXMgb24gYmVpbmcgYWJsZSB0byBwcm92ZQphY2Nv
dW50YWJpbGl0eS4gQmVjYXVzZSB0aHJlYWRzIGNhbm5vdCBiZSBpbml0aWF0ZWQgZGlyZWN0bHkg
YnkgYQpwZXJzb24sIG9ubHkgdGhlIHBhcmVudCBleGVjdXRhYmxlLCB0aGlzIGlzIGFzIG11Y2gg
YXMgaXMgcmVhc29uYWJseQpyZXF1aXJlZCwgY3VycmVudGx5LgoKU3VyZSwgdGVjaG5pY2FsbHkg
YWxsIHlvdSBzYXkgaXMgcHJldHR5IHJlYXNvbmFibGUsIGJ1dCB1c2luZyB5b3VyCmV4YW1wbGUg
b2YgUlRMcywgZXh0ZW5kIHRoYXQgdG8gdGhvc2UgZW50aXRpZXMgYXMgd2VsbC4gWW91IG9mdGVu
IGRvbid0CmhhdmUgaW5zaWdodCBpbnRvIHRoZWlyIGludGVybmFscyBleGNlcHQgdmlhIHRoZSBh
dWRpdCB0cmFpbCAoc3lzY2FsbHMpCi0gYW5kIHlvdSBrbm93IHRoZSBsYXVuY2hlZCBleGVjdXRh
YmxlLgoKVGhyZWFkcy9saWJyYXJpZXMvZXhlY3V0YWJsZXMgZG9uJ3QgZmFjZSBjb25zZXF1ZW5j
ZXMsIHBlb3BsZSBkby4gU28KdW50aWwgYSBwZXJzb24gKG9yIHN5c3RlbWQvY3Jvbi8uLi4pIGNh
biBsYXVuY2ggYSB0aHJlYWQgb24gaXRzIG93biwgaXQKZG9lc24ndCBtYWtlIGEgbG90IG9mIGRp
ZmZlcmVuY2UsIGFzIGl0IGlzIGlkZW50aWZpYWJsZSB0byB0aGUgcGFyZW50CnByb2Nlc3MsIHdo
aWNoIHNvIGZhciwgZ2l2ZXMgdXMgZW5vdWdoIHRyYWNlYWJpbGl0eS4KClRoZSBydWxlcyBuZWVk
IHRvIGJlIHN1Y2ggdGhhdCBmb3IgYSBnaXZlbiBzeXN0ZW0gc2VjdXJpdHkgc3RhbmNlLCBXaG8K
bGF1bmNoZWQgV2hpY2ggV2hlbiBjYXVzaW5nIFdoYXQgaXMgdGhlIG1haW4gZm9jdXMuIERlZmlu
aXRlbHkgdGhlIG1vcmUKcmVsZXZhbnQgaW5mb3JtYXRpb24gdGhlIGJldHRlciBmcm9tIGEgZm9y
ZW5zaWNzIHBlcnNwZWN0aXZlLiBIb3dldmVyLApJJ2Qgc3VibWl0IHRoYXQgaGF2aW5nIHRoZSB0
aHJlYWQgSUQgd291bGQgbm90IGxlbmQgbXVjaCB0byBhbgppbnZlc3RpZ2F0aW9uLiBQcm9iYWJs
eSBub3QgZXZlbiBpbiBhIHN1YnNlcXVlbnQgYXR0ZW1wdCB0byByZWNyZWF0ZSB0aGUKaXNzdWUg
eW91IHdvdWxkIGJlIGludmVzdGlnYXRpbmcuIEJ1dCBpdCBpcyBwb3NzaWJsZSBJJ20gb3Zlcmxv
b2tpbmcKc29tZXRoaW5nLiBBcyBQYXVsIHNhaWQgaW4gdGhlIE9QLCB0aGVyZSBpc24ndCB0aGF0
IG11Y2ggYm91bmRhcnkKYmV0d2VlbiB0aHJlYWRzIGluc3RhbnRpYXRlZCBmcm9tIGEgY29tbW9u
IHBhcmVudCBwcm9jZXNzLCBzbyBleGFtaW5pbmcKdGhlIHByb2Nlc3MgZW50aXR5IGFzIGEgd2hv
bGUgaXMgd2hhdCB3b3VsZCBuZWVkIHRvIGhhcHBlbi4KCllvdXIgcG9pbnQgYWJvdXQgZGlmZmVy
ZW50bHktbmFtZWQgZXhlY3V0YWJsZXMgYmVpbmcgdGhlIHNhbWUgaXMgYSBnb29kCm9uZSwgc3Vy
ZSB0aGVyZSBhcmUgbG90cyBvZiBleGVjdXRhYmxlcyBoYXJkLWxpbmtlZCB0byB0aGUgc2FtZSBj
b2RlLApsb29rIGF0IC9zYmluL2x2bSAtIEkgc2VlIDoKCiUgbHMgLWFsIC9zYmluIHwgZ3JlcCAi
XC0+IGx2bSIgfCB3YyAtbAo0MwoKRG9lc24ndCByZWFsbHkgbWF0dGVyOyB5b3Ugc3RpbGwgc2hv
dWxkIGhhdmUgdGhlIHN5c2NhbGwgcmVjb3JkcyB5b3UKbmVlZCwgc3Vycm91bmRlZCBieSBhbGwg
dGhlIHJlbGV2YW50IGZhY3RzIChhdWlkLCBkYXRlL3RpbWUsIGV4ZWN1dGFibGUKbmFtZSwgZXRj
LiwgZXRjLikuIFRoZSB0aHJlYWQgSUQgKG1heWJlIHJlYWxseSBldmVuIHRoZSBwYXJlbnQgcHJv
Y2VzcwpJRCwgZXhjZXB0IHBvc3NpYmx5IGZvciBpbmNsdXNpb24gd2l0aCBvdGhlciBldmVudHMs
IGJ1dCB0aGF0J3MgYQpzdHJldGNoKSBpcyBpcnJlbGV2YW50IEFGQUlLLgoKSWYgdGhlIGN1cnJl
bnQgZ3JhbnVsYXJpdHkgcHJvdmVzIGluYWRlcXVhdGUgdG8gYWNoaWV2ZSB0aGUgYXVkaXRpbmcK
Z29hbHMsIHRoZW4gSU1ITyB0aGlzIHdvdWxkIG5lZWQgdG8gYmUgcmV2aXNpdGVkLCBiZWNhdXNl
IEkgYWdyZWUsIGFzCkknbSBzdXJlIG1vc3QgZXZlcnlvbmUgd291bGQsIHdpdGggeW91ciBmaW5h
bCBzdGF0ZW1lbnQgLSB0aGluZ3MgY2hhbmdlLgoKClYvUiwKCkxDQgoKLS0gCkxlbm55IEJydXpl
bmFrCk1hZ2l0ZWtMVEQKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEBy
ZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1h
dWRpdA==


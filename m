Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5BA2DC65
	for <lists+linux-audit@lfdr.de>; Wed, 29 May 2019 14:05:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1597D301EA90;
	Wed, 29 May 2019 12:04:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 803A870A1C;
	Wed, 29 May 2019 12:04:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA4411806B18;
	Wed, 29 May 2019 12:04:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TC32qm018278 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 08:03:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7915478552; Wed, 29 May 2019 12:03:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from localhost.localdomain (unknown [10.18.25.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 166216149A;
	Wed, 29 May 2019 12:02:44 +0000 (UTC)
Subject: Re: [PATCH ghak90 V6 00/10] audit: implement container identifier
To: Richard Guy Briggs <rgb@redhat.com>, Steve Grubb <sgrubb@redhat.com>
References: <cover.1554732921.git.rgb@redhat.com>
	<509ea6b0-1ac8-b809-98c2-37c34dd98ca3@redhat.com>
	<CAHC9VhRW9f6GbhvvfifbOzd9p=PgdB2gq1E7tACcaqvfb85Y8A@mail.gmail.com>
	<3299293.RYyUlNkVNy@x2>
	<20190529004352.vvicec7nnk6pvkwt@madcap2.tricolour.ca>
From: Daniel Walsh <dwalsh@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=dwalsh@redhat.com; prefer-encrypt=mutual; keydata=
	mQENBFsaqOEBCADBSnZCZpi262vX8m7iL/OdHKP9G9dhS28FR60cjd8nMPqHDNhQJBjLMZra
	66L2cCIEhc4HEItail7KU1BckrMc4laFaxL8tLoVTKHZwb74n2OcAJ4FtgzkNNlB1XJvSwC/
	909uwt7cpDqwXpJvyP3t17iuklB1OY0EEjTDt9aU4+0QjHzV18L4Cpd9iQ4ksu+EHT+pjlBk
	DdQB+hKoAjxPl11Eh6pZfrAcrNWpYBBk0A3XE9Jb6ghbmHWltNgVOsCa9GcswJHUEeFiOup6
	J5DTv6Xzwt0t6QB8nIs+wDJH+VxqAXcrxscnAhViIfGGS2AtxzjnVOz/J+UZPaauIGXTABEB
	AAG0LERhbmllbCBKIFdhbHNoIChGb3IgR2l0KSA8ZHdhbHNoQHJlZGhhdC5jb20+iQE4BBMB
	AgAiBQJbGqjhAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCi35Adq+LAKHuJB/98
	nZB5RmNjMWua4Ms8q5a1R9XWlDAb3mrST6JeL+uV/M0fa18e2Aw4/hi/WZHjAjoypLmcuaRx
	GeCbC8iYdpfRDUG79Y956Qq+Vs8c6VfNDMY1mvtfb00eeTaYoOCu0Aa9LDeR9iLKh2g0RI+N
	Zr3EU45RxZdacIs1v6mU8pGpyUq/FvuTGK9GzR9d1YeVCuSpQKN4ckHNZHJUXyk0vOZft1oO
	nSgLqM9EDWA+yz1JLmRYwbNsim7IvfVOav5mCgnKzHcL2mLv8qCnMFZjoQV8aGny/W739Z3a
	YJo1CdOg6zSu5SOvmq9idYrBRkwEtyLXss2oceTVBs0MxqQ/9mLPuQENBFsaqOEBCADDl2hl
	bUpqJGgwt2eQvs0Z0DCx/7nn0hlLfEn4WAv2HqP25AjIRXUX31Mzu68C4QnsvNtY4zN+FGRC
	EfUpYsjiL7vBYlRePhIohyMYU4RLp5eXFQKahHO/9Xlhe8mwueQNwYxNBPfMQ65U2AuqxpcS
	scx4s5w208mhqHoKz6IB2LuKeflhYfH5Y1FNAtVGHfhg22xlcAdupPPcxGuS4fBEW6PD/SDf
	Y4HT5iUHsyksQKjM0IFalqZ7YuLfXBl07OD2zU7WI9c3W0dwkvwIRjt3aD4iAah544uOLff+
	BzfxWghXeo80S2a1WCL0S/2qR0NVct/ExaDWboYr/bKpTa/1ABEBAAGJAR8EGAECAAkFAlsa
	qOECGwwACgkQot+QHaviwCi2hgf/XRvrt+VBmp1ZFxQAR9E6S7AtRT8KSytjFiqEC7TpOx3r
	2OZ4gZ3ZiW4TMW8hS7aYRgF1uYpLzl7BbrCfCHfAWEcXZ+uG8vayg8G/mLAcNlLY+JE76ATs
	53ziEY9R2Vb/wLMFd2nNBdqfwGcRH9N9VOej9vP76nCP01ZolY8Nms2hE383/+1Quxp5EedU
	BN5W5l7x9riBJyqCA63hr4u8wNsTuQgrDyhm/U1IvYeLtMopgotjnIR3KiTKOElbppLeXW3w
	EO/sQTPk+vQ4vcsJYY9Dnf1NlvHE4klj60GHjtjitsBEHzdE7s+J9FOxPmt8l+gMogGumKpN
	Y4lO0pfTyg==
Organization: Red Hat
Message-ID: <31804653-7518-1a9c-83af-f6ce6a6ce408@redhat.com>
Date: Wed, 29 May 2019 08:02:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529004352.vvicec7nnk6pvkwt@madcap2.tricolour.ca>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: Neil Horman <nhorman@tuxdriver.com>, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, Mrunal Patel <mpatel@redhat.com>,
	Serge Hallyn <serge@hallyn.com>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: dwalsh@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 29 May 2019 12:05:12 +0000 (UTC)

T24gNS8yOC8xOSA4OjQzIFBNLCBSaWNoYXJkIEd1eSBCcmlnZ3Mgd3JvdGU6Cj4gT24gMjAxOS0w
NS0yOCAxOTowMCwgU3RldmUgR3J1YmIgd3JvdGU6Cj4+IE9uIFR1ZXNkYXksIE1heSAyOCwgMjAx
OSA2OjI2OjQ3IFBNIEVEVCBQYXVsIE1vb3JlIHdyb3RlOgo+Pj4gT24gVHVlLCBNYXkgMjgsIDIw
MTkgYXQgNTo1NCBQTSBEYW5pZWwgV2Fsc2ggPGR3YWxzaEByZWRoYXQuY29tPiB3cm90ZToKPj4+
PiBPbiA0LzIyLzE5IDk6NDkgQU0sIFBhdWwgTW9vcmUgd3JvdGU6Cj4+Pj4+IE9uIE1vbiwgQXBy
IDIyLCAyMDE5IGF0IDc6MzggQU0gTmVpbCBIb3JtYW4gPG5ob3JtYW5AdHV4ZHJpdmVyLmNvbT4g
Cj4+IHdyb3RlOgo+Pj4+Pj4gT24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMTE6Mzk6MDdQTSAtMDQw
MCwgUmljaGFyZCBHdXkgQnJpZ2dzIHdyb3RlOgo+Pj4+Pj4+IEltcGxlbWVudCBrZXJuZWwgYXVk
aXQgY29udGFpbmVyIGlkZW50aWZpZXIuCj4+Pj4+PiBJJ20gc29ycnksIEkndmUgbG9zdCB0cmFj
ayBvZiB0aGlzLCB3aGVyZSBoYXZlIHdlIGxhbmRlZCBvbiBpdD8gQXJlIHdlCj4+Pj4+PiBnb29k
IGZvciBpbmNsdXNpb24/Cj4+Pj4+IEkgaGF2ZW4ndCBmaW5pc2hlZCBnb2luZyB0aHJvdWdoIHRo
aXMgbGF0ZXN0IHJldmlzaW9uLCBidXQgdW5sZXNzCj4+Pj4+IFJpY2hhcmQgbWFkZSBhbnkgc2ln
bmlmaWNhbnQgY2hhbmdlcyBvdXRzaWRlIG9mIHRoZSBmZWVkYmFjayBmcm9tIHRoZQo+Pj4+PiB2
NSBwYXRjaHNldCBJJ20gZ3Vlc3Npbmcgd2UgYXJlICJjbG9zZSIuCj4+Pj4+Cj4+Pj4+IEJhc2Vk
IG9uIGRpc2N1c3Npb25zIFJpY2hhcmQgYW5kIEkgaGFkIHNvbWUgdGltZSBhZ28sIEkgaGF2ZSBh
bHdheXMKPj4+Pj4gZW52aXNpb25lZCB0aGUgcGxhbiBhcyBiZWluZyBnZXQgdGhlIGtlcm5lbCBw
YXRjaHNldCwgdGVzdHMsIGRvY3MKPj4+Pj4gcmVhZHkgKHdoaWNoIFJpY2hhcmQgaGFzIGJlZW4g
ZG9pbmcpIGFuZCB0aGVuIHJ1biB0aGUgYWN0dWFsCj4+Pj4+IGltcGxlbWVudGVkIEFQSSBieSB0
aGUgdXNlcmxhbmQgY29udGFpbmVyIGZvbGtzLCBlLmcuIGNyaS1vL2x4Yy9ldGMuLAo+Pj4+PiB0
byBtYWtlIHN1cmUgdGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbiBpcyBzYW5lIGZyb20gdGhlaXIg
cGVyc3BlY3RpdmUuCj4+Pj4+IFRoZXkndmUgYWxyZWFkeSBzZWVuIHRoZSBkZXNpZ24sIHNvIEkn
bSBub3QgZXhwZWN0aW5nIGFueSByZWFsCj4+Pj4+IHN1cnByaXNlcyBoZXJlLCBidXQgc29tZXRp
bWVzIG9waW5pb25zIGNoYW5nZSB3aGVuIHRoZXkgaGF2ZSBhY3R1YWwKPj4+Pj4gY29kZSBpbiBm
cm9udCBvZiB0aGVtIHRvIHBsYXkgd2l0aCBhbmQgcmV2aWV3Lgo+Pj4+Pgo+Pj4+PiBCZXlvbmQg
dGhhdCwgd2hpbGUgdGhlIGNyaS1vL2x4Yy9ldGMuIGZvbGtzIGFyZSBsb29raW5nIGl0IG92ZXIs
Cj4+Pj4+IHdoYXRldmVyIGFkZGl0aW9uYWwgdGVzdGluZyB3ZSBjYW4gZG8gd291bGQgYmUgYSBi
aWcgd2luLiAgSSdtCj4+Pj4+IHRoaW5raW5nIEknbGwgcHVsbCBpdCBpbnRvIGEgc2VwYXJhdGUg
YnJhbmNoIGluIHRoZSBhdWRpdCB0cmVlCj4+Pj4+IChhdWRpdC93b3JraW5nLWNvbnRhaW5lciA/
KSBhbmQgaW5jbHVkZSB0aGF0IGluIG15IHNlY25leHQga2VybmVscwo+Pj4+PiB0aGF0IEkgYnVp
bGQvdGVzdCBvbiBhIHJlZ3VsYXIgYmFzaXM7IHRoaXMgaXMgYWxzbyBhIGhhbmR5IHdheSB0byBr
ZWVwCj4+Pj4+IGl0IGJhc2VkIGFnYWluc3QgdGhlIGN1cnJlbnQgYXVkaXQvbmV4dCBicmFuY2gu
ICBJZiBhbnkgY2hhbmdlcyBhcmUKPj4+Pj4gbmVlZGVkIFJpY2hhcmQgY2FuIGVpdGhlciBjaG9z
ZSB0byBiYXNlIHRob3NlIGNoYW5nZXMgb24gYXVkaXQvbmV4dCBvcgo+Pj4+PiB0aGUgc2VwYXJh
dGUgYXVkaXQgY29udGFpbmVyIElEIGJyYW5jaDsgdGhhdCdzIHVwIHRvIGhpbS4gIEkndmUgZG9u
ZQo+Pj4+PiB0aGlzIHdpdGggb3RoZXIgYmlnIGNoYW5nZXMgaW4gb3RoZXIgdHJlZXMsIGUuZy4g
U0VMaW51eCwgYW5kIGl0IGhhcwo+Pj4+PiB3b3JrZWQgd2VsbCB0byBnZXQgc29tZSBleHRyYSB0
ZXN0aW5nIGluIGFuZCBrZWVwIHRoZSBwYXRjaHNldCAibWVyZ2UKPj4+Pj4gcmVhZHkiIHdoaWxl
IG90aGVycyBvdXRzaWRlIHRoZSBzdWJzeXN0ZW0gbG9vayB0aGluZ3Mgb3Zlci4KPj4+PiBNcnVu
YWwgUGF0ZWwgKG1haW50YWluZXIgb2YgQ1JJLU8pIGFuZCBJIGhhdmUgcmV2aWV3ZWQgdGhlIEFQ
SSwgYW5kCj4+Pj4gYmVsaWV2ZSB0aGlzIGlzIHNvbWV0aGluZyB3ZSBjYW4gd29yayBvbiBpbiB0
aGUgY29udGFpbmVyIHJ1bnRpbWVzIHRlYW0KPj4+PiB0byBpbXBsZW1lbnQgdGhlIGNvbnRhaW5l
ciBhdWRpdGluZyBjb2RlIGluIENSSS1PIGFuZCBQb2RtYW4uCj4+PiBUaGFua3MgRGFuLiAgSWYg
SSBwdWxsZWQgdGhpcyBpbnRvIGEgYnJhbmNoIGFuZCBidWlsdCB5b3Ugc29tZSB0ZXN0Cj4+PiBr
ZXJuZWxzIHRvIHBsYXkgd2l0aCwgYW55IGlkZWEgaG93IGxvbmcgaXQgbWlnaHQgdGFrZSB0byBn
ZXQgYSBwcm9vZgo+Pj4gb2YgY29uY2VwdCB3b3JraW5nIG9uIHRoZSBjcmktbyBzaWRlPwo+PiBX
ZSdkIG5lZWQgdG8gbWVyZ2UgdXNlciBzcGFjZSBwYXRjaGVzIGFuZCBsZXQgdGhlbSB1c2UgdGhh
dCBpbnN0ZWFkIG9mIHRoZSAKPj4gcmF3IGludGVyZmFjZS4gSSdtIG5vdCBnb2luZyB0byBtZXJn
ZSB1c2VyIHNwYWNlIHVudGlsIHdlIGFyZSBwcmV0dHkgc3VyZSB0aGUgCj4+IHBhdGNoIGlzIGdv
aW5nIGludG8gdGhlIGtlcm5lbC4KPiBJIGhhdmUgYW4gZjI5IHRlc3QgcnBtIG9mIHRoZSB1c2Vy
c3BhY2UgYml0cyBpZiB0aGF0IGhlbHBzIGZvciB0ZXN0aW5nOgo+IAlodHRwOi8vcGVvcGxlLnJl
ZGhhdC5jb20vfnJicmlnZ3MvZ2hhazkwL2dpdC0xZGI3ZTIxLwo+Cj4gSGVyZSdzIHdoYXQgaXQg
Y29udGFpbnMgKG1pbnVzIHRoZSBsYXN0IHBhdGNoKToKPiAJaHR0cHM6Ly9naXRodWIuY29tL2xp
bnV4LWF1ZGl0L2F1ZGl0LXVzZXJzcGFjZS9jb21wYXJlL21hc3Rlci4uLnJnYnJpZ2dzOmdoYXU0
MC1jb250YWluZXJpZC1maWx0ZXIudjcuMAo+Cj4+IC1TdGV2ZQo+Pgo+Pj4gRldJVywgSSd2ZSBh
bHNvIHJlYWNoZWQgb3V0IHRvIHNvbWUgb2YgdGhlIExYQyBmb2xrcyBJIGtub3cgdG8gZ2V0Cj4+
PiB0aGVpciB0YWtlIG9uIHRoZSBBUEkuICBJIHRoaW5rIGlmIHdlIGNhbiBnZXQgdHdvIGRpZmZl
cmVudCBjb250YWluZXIKPj4+IHJ1bnRpbWVzIHRvIGdpdmUgdGhlIEFQSSBhIHRodW1icy11cCB0
aGVuIEkgdGhpbmsgd2UgYXJlIGluIGdvb2Qgc2hhcGUKPj4+IHdpdGggcmVzcGVjdCB0byB0aGUg
dXNlcnNwYWNlIGludGVyZmFjZS4KPj4+Cj4+PiBJIGp1c3QgZmluaXNoZWQgbG9va2luZyBvdmVy
IHRoZSBsYXN0IG9mIHRoZSBwZW5kaW5nIGF1ZGl0IGtlcm5lbAo+Pj4gcGF0Y2hlcyB0aGF0IHdl
cmUgcXVldWVkIHdhaXRpbmcgZm9yIHRoZSBtZXJnZSB3aW5kb3cgdG8gb3BlbiBzbyB0aGlzCj4+
PiBpcyBuZXh0IG9uIG15IGxpc3QgdG8gbG9vayBhdC4gIEkgcGxhbiB0byBzdGFydCBkb2luZyB0
aGF0Cj4+PiB0b25pZ2h0L3RvbW9ycm93LCBhbmQgYXMgbG9uZyBhcyB0aGUgY2hhbmdlcyBiZXR3
ZWVuIHY1L3Y2IGFyZSBub3QKPj4+IHRoYXQgYmlnLCBpdCBzaG91bGRuJ3QgdGFrZSB0b28gbG9u
Zy4KPiAtIFJHQgo+Cj4gLS0KPiBSaWNoYXJkIEd1eSBCcmlnZ3MgPHJnYkByZWRoYXQuY29tPgo+
IFNyLiBTL1cgRW5naW5lZXIsIEtlcm5lbCBTZWN1cml0eSwgQmFzZSBPcGVyYXRpbmcgU3lzdGVt
cwo+IFJlbW90ZSwgT3R0YXdhLCBSZWQgSGF0IENhbmFkYQo+IElSQzogcmdiLCBTdW5SYXljZXIK
PiBWb2ljZTogKzEuNjQ3Ljc3Ny4yNjM1LCBJbnRlcm5hbDogKDgxKSAzMjYzNQoKT3VyIGN1cnJl
bnQgdGhvdWdodHMgYXJlIHRvIHB1dCB0aGUgc2V0dGluZyBvZiB0aGUgSUQgaW5zaWRlIG9mIGNv
bm1vbiwKYW5kIHRoZW4gbGF1bmNoaW5nIHRoZSBPQ0kgUnVudGltZS7CoCBJbiBhIHBlcmZlY3Qg
d29ybGQgdGhpcyB3b3VsZApoYXBwZW4gaW4gdGhlIE9DSSBSdW50aW1lLCBidXQgd2UgaGF2ZSBu
byBjb250cm9scyBvdmVyIGRpZmZlcmVudCBPQ0kKUnVudGltZXMuwqAKCkJ5IHB1dHRpbmcgaXQg
aW50byBjb25tb24sIHRoZW4gQ1JJLU8gYW5kIFBvZG1hbiB3aWxsIGF1dG9tYXRpY2FsbHkgZ2V0
CnRoZSBjb250YWluZXIgaWQgc3VwcG9ydC7CoCBBZnRlciB3ZSBoYXZlIHRoaXMgd2UgaGF2ZSB0
byBwbHVtYiBpdCBiYWNrCnVwIHRocm91Z2ggdGhlIGNvbnRpYW5lciBlbmdpbmVzIHRvIGJlIGFi
bGUgdG8gZWFzaWx5IHJlcG9ydCB0aGUgbGluawpiZXR3ZWVuIHRoZSBDb250YWluZXIgVVVJRCBh
bmQgVGhlIEtlcm5lbCBDb250YWluZXIgQXVkaXQgSUQuCgoKLS0KTGludXgtYXVkaXQgbWFpbGlu
ZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

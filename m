Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A89340D9
	for <lists+linux-audit@lfdr.de>; Tue,  4 Jun 2019 09:56:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 38D11307C941;
	Tue,  4 Jun 2019 07:55:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A1922B5B6;
	Tue,  4 Jun 2019 07:55:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F23381806B15;
	Tue,  4 Jun 2019 07:55:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x547rnAp004210 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 4 Jun 2019 03:53:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0A9A5B686; Tue,  4 Jun 2019 07:53:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from localhost.localdomain (unknown [10.33.36.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46FCE5B683
	for <linux-audit@redhat.com>; Tue,  4 Jun 2019 07:53:45 +0000 (UTC)
Subject: Re: [PATCH ghak90 V6] fixup! audit: add containerid filtering
To: linux-audit@redhat.com
References: <fadb320e38a899441fcc693bbbc822a3b57f1a46.1559239558.git.rgb@redhat.com>
	<CAHC9VhQZuOXiK4yj4xeRwGF_qepeg7qDL02GDdYhwTNRLRdmPA@mail.gmail.com>
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
Message-ID: <7059722c-99a5-fd0b-9a7a-7a9afc99cb39@redhat.com>
Date: Tue, 4 Jun 2019 09:53:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQZuOXiK4yj4xeRwGF_qepeg7qDL02GDdYhwTNRLRdmPA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 04 Jun 2019 07:56:24 +0000 (UTC)

VGhlIG5lZWQgZm9yIG5lc3RlZCBjb250YWluZXIgc3VwcG9ydCBpcyB0aGUgYEVuZW15IG9mIHRo
ZSBnb29kYC7CoCBUaGlzCmlkZWEgaGFzIGJlZW4gYmVpbmcgd29ya2VkIG9uIGZvciB5ZWFycyBh
bmQgaGFzIGFsd2F5cyBiZWVuIGJsb2NrZWQgYnkKdGhpcyBzZWxkb20gdXNlZCBmZWF0dXJlLgoK
V2UgYXJlIHdvcmtpbmcgb24gYSBwcm9qZWN0IHJpZ2h0IHRoaXMgc3VtbWVyIHRvIGFsbG93IHVz
IHRvIHVzZSB0aGUKYXVkaXQgc3lzdGVtIHRvIHRyYWNrIHRoZSBzeXNjYWxscyB1c2VkIGJ5IGEg
Y29udGFpbmVyIGFuZCB0aGVuIGdlbmVyYXRlCmEgc2VjY29tcC5qc29uIGZpbGUgdG8gbG9jayBk
b3duIHRoZSBjb250YWluZXIgaW4gdGhlIGZ1dHVyZS7CoCBUaGluayBvZgppdCBhcyBBdWRpdDJh
bGxvdyBmb3Igc2VjY29tcCBydWxlcyBvbiBhIGNvbnRhaW5lci7CoCBUaGUgcHJvYmxlbSBpcywK
b3RoZXIgdGhlbiBQSUQxIGluc2lkZSBvZiB0aGUgY29udGFpbmVyLCBpdCBpcyByZWFsIGRpZmZp
Y3VsdCB0byBmb2xsb3cKdGhlIG90aGVyIHByb2Nlc3NlcyBpbnNpZGUgb2YgdGhlIGNvbnRhaW5l
ciB3aXRob3V0IGEgY29udGFpbmVyaWQuwqAKCklzIHRoZXJlIGEgY2hhbmNlIHdlIGNvdWxkIGdl
dCBhIHNpbmdsZSBJRCBmb3IgYSBjb250YWluZXIgZm9yIG5vdywgYW5kCnRoZW4gZW5oYW5jZSB0
aGUgZmVhdHVyZSBpbiB0aGUgZnV0dXJlIGZvciBuZXN0ZWQgQ29udGFpbmVySURzLsKgCgpJIGZl
YXIgdGhhdCB0aGlzIHdpbGwgYmxvY2sgdGhlIGNvbnRhaW5lciBpZCBmb3IgeWVhcnMuCgoKT24g
Ni8zLzE5IDY6MDEgUE0sIFBhdWwgTW9vcmUgd3JvdGU6Cj4gT24gRnJpLCBNYXkgMzEsIDIwMTkg
YXQgMTo1NCBQTSBSaWNoYXJkIEd1eSBCcmlnZ3MgPHJnYkByZWRoYXQuY29tPiB3cm90ZToKPj4g
UmVtb3ZlIHRoZSBCVUcoKSBjYWxsIHNpbmNlIHdlIHdpbGwgbmV2ZXIgaGF2ZSBhbiBpbnZhbGlk
IG9wIHZhbHVlIGFzCj4+IGF1ZGl0X2RhdGFfdG9fZW50cnkoKS9hdWRpdF90b19vcCgpIGVuc3Vy
ZSB0aGF0IHRoZSBvcCB2YWx1ZSBpcyBhIGEKPj4ga25vd24gZ29vZCB2YWx1ZS4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogUmljaGFyZCBHdXkgQnJpZ2dzIDxyZ2JAcmVkaGF0LmNvbT4KPj4gLS0tCj4+
ICBrZXJuZWwvYXVkaXRmaWx0ZXIuYyB8IDEgLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKPiBUaGFua3MgZm9yIHNlbmRpbmcgdGhpcyBvdXQuICBIb3dldmVyLCBpbiBsaWdodCBv
ZiB0aGUgZGlzY3Vzc2lvbiBpbgo+IHRoZSBwYXRjaHNldCdzIGNvdmVyIGxldHRlciBpdCBsb29r
cyBsaWtlIHdlIG5lZWQgdG8gYmV0dGVyIHN1cHBvcnQKPiBuZXN0ZWQgY29udGFpbmVyIG9yY2hl
c3RyYXRvcnMgd2hpY2ggaXMgbGlrZWx5IGdvaW5nIHRvIHJlcXVpcmUgc29tZQo+IG5vbi10cml2
aWFsIGNoYW5nZXMgdG8gdGhlIGtlcm5lbC91c2Vyc3BhY2UgQVBJLiAgQmVjYXVzZSBvZiB0aGlz
IEknbQo+IGdvaW5nIHRvIGhvbGQgb2ZmIHB1bGxpbmcgdGhlc2UgcGF0Y2hlcyBpbnRvIGEgIndv
cmtpbmciIGJyYW5jaCwKPiBob3BlZnVsbHkgdGhlIG5leHQgcmV2aXNpb24gb2YgdGhlc2UgcGF0
Y2hlcyB3aWxsIHNvbHZlIHRoZSBuZXN0ZWQKPiBvcmNoZXN0cmF0b3IgaXNzdWUgZW5vdWdoIHRo
YXQgd2UgY2FuIGNvbnRpbnVlIHRvIG1vdmUgZm9yd2FyZCB3aXRoCj4gdGVzdGluZy4KPgo+PiBk
aWZmIC0tZ2l0IGEva2VybmVsL2F1ZGl0ZmlsdGVyLmMgYi9rZXJuZWwvYXVkaXRmaWx0ZXIuYwo+
PiBpbmRleCA0MDdiNWJiM2I0YzYuLjM4NWExMTRhMTI1NCAxMDA2NDQKPj4gLS0tIGEva2VybmVs
L2F1ZGl0ZmlsdGVyLmMKPj4gKysrIGIva2VybmVsL2F1ZGl0ZmlsdGVyLmMKPj4gQEAgLTEyNDQs
NyArMTI0NCw2IEBAIGludCBhdWRpdF9jb21wYXJhdG9yNjQodTY0IGxlZnQsIHUzMiBvcCwgdTY0
IHJpZ2h0KQo+PiAgICAgICAgIGNhc2UgQXVkaXRfYml0dGVzdDoKPj4gICAgICAgICAgICAgICAg
IHJldHVybiAoKGxlZnQgJiByaWdodCkgPT0gcmlnaHQpOwo+PiAgICAgICAgIGRlZmF1bHQ6Cj4+
IC0gICAgICAgICAgICAgICBCVUcoKTsKPj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+PiAg
ICAgICAgIH0KPj4gIH0KPj4gLS0KPj4gMS44LjMuMQo+Pgo+CgotLQpMaW51eC1hdWRpdCBtYWls
aW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=

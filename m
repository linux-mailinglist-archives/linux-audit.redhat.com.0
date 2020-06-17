Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E12AE1FD942
	for <lists+linux-audit@lfdr.de>; Thu, 18 Jun 2020 00:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592434484;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Lq5yBw/5GZWSi/sC1HrRt3ORToSH7FbFd8IBvmK2uoo=;
	b=gxGnhnGk+ni8I+kVXgX8i2YmHmWwA9KsQUKte+k1tbDIhLWHo/SDKuVOohR7U7pMZ4Ow8e
	IbCwivs8kcdVpsiZ3LUlVWTtDlu6BRx1HdIPfDS+PEfK1krv69vpaD29Qjxv90g1SGa8Wo
	E+m2CbfBRVS4ShvjBVYyU10R5tvnuYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-kgCvYm9TMK-GoBg6RCO76g-1; Wed, 17 Jun 2020 18:54:42 -0400
X-MC-Unique: kgCvYm9TMK-GoBg6RCO76g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A08C8015CE;
	Wed, 17 Jun 2020 22:54:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C44B7FE82;
	Wed, 17 Jun 2020 22:54:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0A3A1809547;
	Wed, 17 Jun 2020 22:54:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05HMsOWH017752 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 18:54:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C7A810073C7; Wed, 17 Jun 2020 22:54:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27F5F1007A36
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 22:54:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F63118A6660
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 22:54:21 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-246-D4w6ycypMR-oYmk3kaA6hw-1; Wed, 17 Jun 2020 18:54:18 -0400
X-MC-Unique: D4w6ycypMR-oYmk3kaA6hw-1
Received: by mail-qt1-f196.google.com with SMTP id c12so2942671qtq.11;
	Wed, 17 Jun 2020 15:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=AcaJuY/Shr1da5zM7Y5yAXiWCsReFbbBISJKlCL2WfY=;
	b=EHQ89GkgH6312aqfaVf11lvxW4EBMK9jM4cPdwr/R5ZmrWBp4duq5MurgbtP1LDvbH
	k8PUpf2bFn+efuN4kAxI7l7+JjcEQvZT987nNXCDz9degxunsFQJKCsrvUZYSk4LnAv/
	kjG2dzhzYClJqN2d/TT7TH19fP4WLSo64VgsBa8NHepN0oJ8zNV7ldMPwqxbfpYeJ/jA
	My5yZhe3sYowNwxXyaxVdP0CgOYpzTpOWid9SPXmIedVkG38PrRQ1iXbhenxvvgQCZOr
	s3aExbTsMsp/baPAKNbIeVbaWOpioyZAwoQm1dp8CuIqrhE4NN+DJOMl2MdQ4tyuY0wh
	z/SQ==
X-Gm-Message-State: AOAM530zUDye1PiyWUBKgopejbCFqZNGjslQFyiaE1VetqMofO3XExDa
	b+vKntuf56k4c1dtkLhKXATxh8prXcc=
X-Google-Smtp-Source: ABdhPJxsHEW1o28Gt6kOibl7I7YfzC24gJNh02cXvdagPJ+MoB+uM+syUxPzGWapkmYXmg8RD4+FqA==
X-Received: by 2002:ac8:43ce:: with SMTP id w14mr1537140qtn.80.1592434457997; 
	Wed, 17 Jun 2020 15:54:17 -0700 (PDT)
Received: from linux-kernel-dev (ool-182c9054.dyn.optonline.net.
	[24.44.144.84]) by smtp.gmail.com with ESMTPSA id
	c189sm1455362qkb.8.2020.06.17.15.54.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 17 Jun 2020 15:54:17 -0700 (PDT)
Date: Wed, 17 Jun 2020 22:54:16 +0000
From: Max Englander <max.englander@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: optionally print warning after waiting to enqueue
	record
Message-ID: <20200617225416.GA2688@linux-kernel-dev>
References: <20200616045855.GA1699@linux-kernel-dev>
	<CAHC9VhSotFw2i7HzWrHUyc6VSbwTpv8ZBeP58H_mzi6bd=Uouw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSotFw2i7HzWrHUyc6VSbwTpv8ZBeP58H_mzi6bd=Uouw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gV2VkLCBKdW4gMTcsIDIwMjAgYXQgMDI6NDc6MTlQTSAtMDQwMCwgUGF1bCBNb29yZSB3cm90
ZToKPiBPbiBUdWUsIEp1biAxNiwgMjAyMCBhdCAxMjo1OCBBTSBNYXggRW5nbGFuZGVyIDxtYXgu
ZW5nbGFuZGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSW4gZW52aXJvbm1lbnRzIHdoZXJl
IHNlY3VyaXR5IGlzIHByaW9yaXRpemVkLCB1c2VycyBtYXkgc2V0Cj4gPiAtLWJhY2tsb2dfd2Fp
dF90aW1lIHRvIGEgaGlnaCB2YWx1ZSBpbiBvcmRlciB0byByZWR1Y2UgdGhlIGxpa2VsaWhvb2QK
PiA+IHRoYXQgYW55IGF1ZGl0IGV2ZW50IGlzIGxvc3QsIGV2ZW4gdGhvdWdoIGRvaW5nIHNvIG1h
eSByZXN1bHQgaW4KPiA+IHVucHJlZGljdGFibGUgcGVyZm9ybWFuY2UgaWYgdGhlIGtlcm5lbCBz
Y2hlZHVsZXMgYSB0aW1lb3V0IHdoZW4gdGhlCj4gPiBiYWNrbG9nIGxpbWl0IGlzIGV4Y2VlZGVk
LiBGb3IgdGhlc2UgdXNlcnMsIHRoZSBuZXh0IGJlc3QgdGhpbmcgdG8KPiA+IHByZWRpY3RhYmxl
IHBlcmZvcm1hbmNlIGlzIHRoZSBhYmlsaXR5IHRvIHF1aWNrbHkgZGV0ZWN0IGFuZCByZWFjdCB0
bwo+ID4gZGVncmFkZWQgcGVyZm9ybWFuY2UuIFRoaXMgcGF0Y2ggcHJvcG9zZXMgdG8gYWlkIHRo
ZSBkZXRlY3Rpb24gb2Yga2VybmVsCj4gPiBhdWRpdCBzdWJzeXN0ZW0gcGF1c2VzIHRocm91Z2gg
dGhlIGZvbGxvd2luZyBjaGFuZ2VzOgo+ID4KPiA+IEFkZCBhIHZhcmlhYmxlIG5hbWVkIGF1ZGl0
X2JhY2tsb2dfd2Fybl90aW1lLiBFbmZvcmNlIHRoZSB2YWx1ZSBvZiB0aGlzCj4gPiB2YXJpYWJs
ZSB0byBiZSBubyBsZXNzIHRoYW4gemVybywgYW5kIG5vIG1vcmUgdGhhbiB0aGUgdmFsdWUgb2YK
PiA+IGF1ZGl0X2JhY2tsb2dfd2FpdF90aW1lLgo+ID4KPiA+IElmIGF1ZGl0X2JhY2tsb2dfd2Fy
bl90aW1lIGlzIGdyZWF0ZXIgdGhhbiB6ZXJvIGFuZCBpZiB0aGUgdG90YWwgdGltZQo+ID4gc3Bl
bnQgd2FpdGluZyB0byBlbnF1ZXVlIGFuIGF1ZGl0IHJlY29yZCBpcyBncmVhdGVyIHRoYW4gb3Ig
ZXF1YWwgdG8KPiA+IGF1ZGl0X2JhY2tsb2dfd2Fybl90aW1lLCB0aGVuIHByaW50IGEgd2Fybmlu
ZyB3aXRoIHRoZSB0b3RhbCB0aW1lCj4gPiBzcGVudCB3YWl0aW5nLgo+ID4KPiA+IEFuIGV4YW1w
bGUgY29uZmlndXJhdGlvbjoKPiA+Cj4gPiAgICAgICAgIGF1ZGl0Y3RsIC0tYmFja2xvZ193YXJu
X3RpbWUgNTAKPiA+Cj4gPiBBbiBleGFtcGxlIHdhcm5pbmcgbWVzc2FnZToKPiA+Cj4gPiAgICAg
ICAgIGF1ZGl0OiBzbGVlcF90aW1lPTUyID49IGF1ZGl0X2JhY2tsb2dfd2Fybl90aW1lPTUwCj4g
Pgo+ID4gVGVzdGVkIG9uIFVidW50dSAxOC4wNC4wNCB1c2luZyBjb21wbGVtZW50YXJ5IGNoYW5n
ZXMgdG8gdGhlIGF1ZGl0Cj4gPiB1c2Vyc3BhY2U6IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1h
dWRpdC9hdWRpdC11c2Vyc3BhY2UvcHVsbC8xMzEuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTWF4
IEVuZ2xhbmRlciA8bWF4LmVuZ2xhbmRlckBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRl
L3VhcGkvbGludXgvYXVkaXQuaCB8ICA3ICsrKysrKy0KPiA+ICBrZXJuZWwvYXVkaXQuYyAgICAg
ICAgICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gSWYgYW4g
YWRtaW4gaXMgcHJpb3JpdGl6aW5nIHNlY3VyaXR5LCBha2EgZG9uJ3QgbG9vc2UgYW55IGF1ZGl0
Cj4gcmVjb3JkcywgYW5kIHRoZXJlIGlzIGEgY29uY2VybiBvdmVyIHZhcmlhYmxlIHN5c3RlbSBs
YXRlbmN5IGR1ZSB0byBhbgo+IGF1ZGl0IHF1ZXVlIGJhY2tsb2csIHdoeSBub3Qgc2ltcGx5IGRp
c2FibGUgdGhlIGJhY2tsb2cgbGltaXQ/Cj4gCj4gLS0gCj4gcGF1bCBtb29yZQo+IHd3dy5wYXVs
LW1vb3JlLmNvbQoKVGhhdOKAmXMgZ29vZCBpbiBzb21lIGNhc2VzLCBidXQgaW4gb3RoZXIgY2Fz
ZXMgdW5ib3VuZGVkIGdyb3d0aCBvZiB0aGUKYmFja2xvZyBjb3VsZCByZXN1bHQgaW4gbWVtb3J5
IGlzc3Vlcy4gSWYgdGhlIGtlcm5lbCBydW5zIG91dCBvZiBtZW1vcnkKaXQgd291bGQgZHJvcCB0
aGUgYXVkaXQgZXZlbnQgb3IgcG9zc2libHkgaGF2ZSBvdGhlciBwcm9ibGVtcy4gSXQgY291bGQK
YWxzbyBhbHNvIGNvbnN1bWUgbWVtb3J5IGluIGEgd2F5IHRoYXQgc3RhcnZlcyB1c2VyIHdvcmts
b2FkcyBvciBjYXVzZXMKdGhlbSB0byBiZSBraWxsZWQgYnkgdGhlIE9PTUtpbGxlci4KClRvIHJl
ZmluZSBteSBtb3RpdmF0aW5nIHVzZSBjYXNlIGEgYml0LCBpZiBhIEt1YmVybmV0ZXMgYWRtaW4g
d2FudHMgdG8KcHJpb3JpdGl6ZSBzZWN1cml0eSwgYW5kIGFsc28gYXZvaWQgdW5ib3VuZGVkIGdy
b3d0aCBvZiB0aGUgYXVkaXQKYmFja2xvZywgdGhleSBtYXkgc2V0IC1iIGFuZCAtLWJhY2tsb2df
d2FpdF90aW1lIGluIGEgd2F5IHRoYXQgbGltaXRzCmtlcm5lbCBtZW1vcnkgdXNhZ2UgYW5kIHJl
ZHVjZXMgdGhlIGxpa2VsaWhvb2QgdGhhdCBhbnkgYXVkaXQgZXZlbnQgaXMKbG9zdC4gT2NjYXNp
b25hbCBwZXJmb3JtYW5jZSBkZWdyYWRhdGlvbiBtYXkgYmUgYWNjZXB0YWJsZSB0byB0aGUgYWRt
aW4sCmJ1dCB0aGV5IHdvdWxkIGxpa2UgYSB3YXkgdG8gYmUgYWxlcnRlZCB0byBwcm9sb25nZWQg
a2VybmVsIHBhdXNlcywgc28KdGhhdCB0aGV5IGNhbiBpbnZlc3RpZ2F0ZSBhbmQgdGFrZSBjb3Jy
ZWN0aXZlIGFjdGlvbiAoaW5jcmVhc2UgYmFja2xvZywKaW5jcmVhc2Ugc2VydmVyIGNhcGFjaXR5
LCBtb3ZlIHNvbWUgd29ya2xvYWRzIHRvIG90aGVyIHNlcnZlcnMsIGV0Yy4pLgoKVG8gc3RhdGUg
YW5vdGhlciB3YXkuIFRoZSBrZXJuZWwgY3VycmVudGx5IGNhbiBiZSBjb25maWd1cmVkIHRvIHBy
aW50IGEKbWVzc2FnZSB3aGVuIHRoZSBiYWNrbG9nIGxpbWl0IGlzIGV4Y2VlZGVkIGFuZCBpdCBt
dXN0IGRpc2NhcmQgdGhlIGF1ZGl0CmV2ZW50LiBUaGlzIGlzIGEgdXNlZnVsIG1lc3NhZ2UgZm9y
IGFkbWlucywgd2hpY2ggdGhleSBjYW4gYWRkcmVzcyB3aXRoCmNvcnJlY3RpdmUgYWN0aW9uLiBJ
IHRoaW5rIGEgbWVzc2FnZSBzaW1pbGFyIHRvIHRoZSBvbmUgcHJvcG9zZWQgYnkgdGhpcwpwYXRj
aCB3b3VsZCBiZSBlcXVhbGx5IHVzZWZ1bCB3aGVuIHRoZSBiYWNrbG9nIGxpbWl0IGlzIGV4Y2Vl
ZGVkIGFuZCB0aGUKa2VybmVsIGlzIGNvbmZpZ3VyZWQgdG8gd2FpdCBmb3IgdGhlIGJhY2tsb2cg
dG8gZHJhaW4uIEFkbWlucyBjb3VsZAphZGRyZXNzIHRoYXQgbWVzc2FnZSBpbiB0aGUgc2FtZSB3
YXksIGJ1dCB3aXRob3V0IHRoZSBjb3N0IG9mIGxvc3QgYXVkaXQKZXZlbnRzLgoKLS0KTGludXgt
YXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0


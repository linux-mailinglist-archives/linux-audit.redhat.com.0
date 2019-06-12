Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A167D41E1B
	for <lists+linux-audit@lfdr.de>; Wed, 12 Jun 2019 09:44:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30A1A3092677;
	Wed, 12 Jun 2019 07:44:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26F2B60CCC;
	Wed, 12 Jun 2019 07:44:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3EC4A206D2;
	Wed, 12 Jun 2019 07:43:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5C7c10j014972 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 12 Jun 2019 03:38:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 866D35D9D1; Wed, 12 Jun 2019 07:38:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80B815D9CA
	for <linux-audit@redhat.com>; Wed, 12 Jun 2019 07:37:59 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
	[209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B0FA81DFB
	for <linux-audit@redhat.com>; Wed, 12 Jun 2019 07:37:59 +0000 (UTC)
Received: by mail-oi1-f198.google.com with SMTP id r203so3398049oie.0
	for <linux-audit@redhat.com>; Wed, 12 Jun 2019 00:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=l8RlG1QWsV/msA4GPsw+qPoVYVJEbhy9x3gDEX1sGFk=;
	b=t9AYj1pORAKeYRYPd7jKbdq6raEpkc79OfNQFIHMayrtq3/pOChxFBvrz5juISaKyU
	B6nULMUtm0eQ8qHLdb+w6MsJugeJtY8H8UjaUAZ+A97eaULsPYSCOYvi3a9uJVCNVz7o
	2FxkGM0jih7GEWE36XPS3iVEd/aJGOjYhDbveG46besJsYHPuiW/OfQwoH4kL6C6zj0x
	s4kjc+JbYWmtFHMwo2WBMz1tqAEDVwlkr3XjMbXhSdRQrZ3dOvPyrtN0AgprgXJ/NoAT
	QT1Ql+25cHUfn9oe011EqVN6rclawtGgci+gJTwAXAQZFyqf6e1XALDyqx43agIUkur6
	trFA==
X-Gm-Message-State: APjAAAVTcjCV+B092y+iJomlnr/zqjQGUWF2L9ukiwsjChZCgKgs9Auk
	zIkyNL2S2EtlgKdxrJl2O8+DD2NdNjtp0cq7wEM34I/NUtC0OeqIsHky1cqZ7WOprKE3vFgr+XD
	G8n4MISo7TcnIVDzOtuVrwWfSHDMjuc7o5+E=
X-Received: by 2002:aca:ed04:: with SMTP id l4mr18335545oih.26.1560325078655; 
	Wed, 12 Jun 2019 00:37:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxGKrbj6VKPiGuz//7rL8OPpyEVFKxqjgiw5dinTi//xSsvie2H8Alt5tbXuOOO3FPX86WAo29s+gzREwF6Roc=
X-Received: by 2002:aca:ed04:: with SMTP id l4mr18335533oih.26.1560325078322; 
	Wed, 12 Jun 2019 00:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190611080719.28625-1-omosnace@redhat.com>
	<CAHC9VhSXZp6QierOGRBXmyUf=pT3Y4mf=78AmQAquuQ8-WBSGw@mail.gmail.com>
In-Reply-To: <CAHC9VhSXZp6QierOGRBXmyUf=pT3Y4mf=78AmQAquuQ8-WBSGw@mail.gmail.com>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Wed, 12 Jun 2019 09:37:47 +0200
Message-ID: <CAFqZXNsD06JYYNmpOYyGrxLHCfvVyUSJMZ3mRTWG5-b2Ws7zQw@mail.gmail.com>
Subject: Re: [PATCH] selinux: log raw contexts as untrusted strings
To: Paul Moore <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5C7c10j014972
X-loop: linux-audit@redhat.com
Cc: selinux@vger.kernel.org, Linux-Audit Mailing List <linux-audit@redhat.com>,
	stable@vger.kernel.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 12 Jun 2019 07:44:20 +0000 (UTC)

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTI6NTYgQU0gUGF1bCBNb29yZSA8cGF1bEBwYXVsLW1v
b3JlLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNDowNyBBTSBPbmRyZWog
TW9zbmFjZWsgPG9tb3NuYWNlQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gVGhlc2Ugc3RyaW5ncyBt
YXkgY29tZSBmcm9tIHVudHJ1c3RlZCBzb3VyY2VzIChlLmcuIGZpbGUgeGF0dHJzKSBzbyB0aGV5
Cj4gPiBuZWVkIHRvIGJlIHByb3Blcmx5IGVzY2FwZWQuCj4gPgo+ID4gUmVwcm9kdWNlcjoKPiA+
ICAgICAjIHNldGVuZm9yY2UgMAo+ID4gICAgICMgdG91Y2ggL3RtcC90ZXN0Cj4gPiAgICAgIyBz
ZXRmYXR0ciAtbiBzZWN1cml0eS5zZWxpbnV4IC12ICdrdcWZZWPDrSDFmcOtemVrJyAvdG1wL3Rl
c3QKPiA+ICAgICAjIHJ1bmNvbiBzeXN0ZW1fdTpzeXN0ZW1fcjpzc2hkX3Q6czAgY2F0IC90bXAv
dGVzdAo+ID4gICAgIChsb29rIGF0IHRoZSBnZW5lcmF0ZWQgQVZDcykKPiA+Cj4gPiBBY3R1YWwg
cmVzdWx0Ogo+ID4gICAgIHR5cGU9QVZDIFsuLi5dIHRyYXdjb249a3XFmWVjw60gxZnDrXplawo+
ID4KPiA+IEV4cGVjdGVkIHJlc3VsdDoKPiA+ICAgICB0eXBlPUFWQyBbLi4uXSB0cmF3Y29uPTZC
NzVDNTk5NjU2M0MzQUQyMEM1OTlDM0FEN0E2NTZCCj4gPgo+ID4gRml4ZXM6IGZlZGUxNDgzMjRj
MyAoInNlbGludXg6IGxvZyBpbnZhbGlkIGNvbnRleHRzIGluIEFWQ3MiKQo+ID4gQ2M6IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcgIyB2NS4xKwo+ID4gU2lnbmVkLW9mZi1ieTogT25kcmVqIE1vc25h
Y2VrIDxvbW9zbmFjZUByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgc2VjdXJpdHkvc2VsaW51eC9h
dmMuYyB8IDEwICsrKysrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Cj4gVGhhbmtzLCB0aGUgcGF0Y2ggbG9va3MgZmluZSB0byBtZSwg
YnV0IGl0IGlzIGJvcmRlcmxpbmUgLXN0YWJsZQo+IG1hdGVyaWFsIGluIG15IG9waW5pb24uICBJ
J2xsIGFkZCBpdCB0byB0aGUgc3RhYmxlLTUuMiBicmFuY2gsIGJ1dCBpbgo+IHRoZSBmdXR1cmUg
SSB3b3VsZCBwcmVmZXIgaWYgeW91IGxlZnQgdGhlIHN0YWJsZSBtYXJraW5nIG9mZiBwYXRjaGVz
Cj4gYW5kIHNlbnQgYSByZXBseSBkaXNjdXNzaW5nICp3aHkqIHRoaXMgc2hvdWxkIGdvIHRvIHN0
YWJsZSBzbyB3ZSBjYW4KPiBkaXNjdXNzIGl0LiAgSSByZWFsaXplIEdyZWcgbGlrZXMgdG8gcHVs
bCBhIGxvdCBvZiBzdHVmZiBpbnRvIHN0YWJsZSwKPiBidXQgSSB0cnkgdG8gYmUgYSBiaXQgbW9y
ZSBjb25zZXJ2YXRpdmUgYWJvdXQgd2hhdCBnZXRzIG1hcmtlZC4gIEV2ZW4KPiB0aGUgc2ltcGxl
c3QgZml4IGNhbiBzdGlsbCBicmVhayB0aGluZ3MgOikKCk9LLCBJIHdhcyBhIGJpdCB1bnN1cmUg
d2hldGhlciB0byBtYXJrIGl0IGFzIHN0YWJsZSBvciBub3QgYW5kCmV2ZW50dWFsbHkgaW5jbGlu
ZWQgdG8gZG8gc28uLi4gSSdsbCB0cnkgYmUgbW9yZSBjYXJlZnVsIGFib3V0IGl0IGluCnRoZSBm
dXR1cmUuCgo+Cj4gSSdtIGdvaW5nIHRvIHN0YXJ0IGJ1aWxkaW5nIGEgdGVzdCBrZXJuZWwgbm93
IHdpdGggdGhpcyBmaXgsIGJ1dCBJCj4gbWlnaHQgaG9sZCBvZmYgb24gc2VuZGluZyB0aGlzIHVw
IHRvIExpbnVzIGZvciBhIGNvdXBsZSBvZiBkYXlzIHRvIHNlZQo+IGlmIEkgY2FuIGNhdGNoIEdl
biBaaGFuZydzIHBhdGNoZXMgaW4gdGhlIHNhbWUgUFIuCj4KPiA+IGRpZmYgLS1naXQgYS9zZWN1
cml0eS9zZWxpbnV4L2F2Yy5jIGIvc2VjdXJpdHkvc2VsaW51eC9hdmMuYwo+ID4gaW5kZXggODM0
NmE0ZjdjNWQ3Li5hOTliZTUwOGY5M2QgMTAwNjQ0Cj4gPiAtLS0gYS9zZWN1cml0eS9zZWxpbnV4
L2F2Yy5jCj4gPiArKysgYi9zZWN1cml0eS9zZWxpbnV4L2F2Yy5jCj4gPiBAQCAtNzM5LDE0ICs3
MzksMjAgQEAgc3RhdGljIHZvaWQgYXZjX2F1ZGl0X3Bvc3RfY2FsbGJhY2soc3RydWN0IGF1ZGl0
X2J1ZmZlciAqYWIsIHZvaWQgKmEpCj4gPiAgICAgICAgIHJjID0gc2VjdXJpdHlfc2lkX3RvX2Nv
bnRleHRfaW52YWwoc2FkLT5zdGF0ZSwgc2FkLT5zc2lkLCAmc2NvbnRleHQsCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnNjb250ZXh0X2xlbik7Cj4gPiAg
ICAgICAgIGlmICghcmMgJiYgc2NvbnRleHQpIHsKPiA+IC0gICAgICAgICAgICAgICBhdWRpdF9s
b2dfZm9ybWF0KGFiLCAiIHNyYXdjb249JXMiLCBzY29udGV4dCk7Cj4gPiArICAgICAgICAgICAg
ICAgaWYgKHNjb250ZXh0X2xlbiAmJiBzY29udGV4dFtzY29udGV4dF9sZW4gLSAxXSA9PSAnXDAn
KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc2NvbnRleHRfbGVuLS07Cj4gPiArICAgICAg
ICAgICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBzcmF3Y29uPSIpOwo+ID4gKyAgICAgICAg
ICAgICAgIGF1ZGl0X2xvZ19uX3VudHJ1c3RlZHN0cmluZyhhYiwgc2NvbnRleHQsIHNjb250ZXh0
X2xlbik7Cj4gPiAgICAgICAgICAgICAgICAga2ZyZWUoc2NvbnRleHQpOwo+ID4gICAgICAgICB9
Cj4gPgo+ID4gICAgICAgICByYyA9IHNlY3VyaXR5X3NpZF90b19jb250ZXh0X2ludmFsKHNhZC0+
c3RhdGUsIHNhZC0+dHNpZCwgJnNjb250ZXh0LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICZzY29udGV4dF9sZW4pOwo+ID4gICAgICAgICBpZiAoIXJjICYm
IHNjb250ZXh0KSB7Cj4gPiAtICAgICAgICAgICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiB0
cmF3Y29uPSVzIiwgc2NvbnRleHQpOwo+ID4gKyAgICAgICAgICAgICAgIGlmIChzY29udGV4dF9s
ZW4gJiYgc2NvbnRleHRbc2NvbnRleHRfbGVuIC0gMV0gPT0gJ1wwJykKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHNjb250ZXh0X2xlbi0tOwo+ID4gKyAgICAgICAgICAgICAgIGF1ZGl0X2xv
Z19mb3JtYXQoYWIsICIgdHJhd2Nvbj0iKTsKPiA+ICsgICAgICAgICAgICAgICBhdWRpdF9sb2df
bl91bnRydXN0ZWRzdHJpbmcoYWIsIHNjb250ZXh0LCBzY29udGV4dF9sZW4pOwo+ID4gICAgICAg
ICAgICAgICAgIGtmcmVlKHNjb250ZXh0KTsKPiA+ICAgICAgICAgfQo+ID4gIH0KPiA+IC0tCj4g
PiAyLjIwLjEKPgo+IC0tCj4gcGF1bCBtb29yZQo+IHd3dy5wYXVsLW1vb3JlLmNvbQoKCgotLSAK
T25kcmVqIE1vc25hY2VrIDxvbW9zbmFjZSBhdCByZWRoYXQgZG90IGNvbT4KU29mdHdhcmUgRW5n
aW5lZXIsIFNlY3VyaXR5IFRlY2hub2xvZ2llcwpSZWQgSGF0LCBJbmMuCgotLQpMaW51eC1hdWRp
dCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQu
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=

Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 239716AD2B1
	for <lists+linux-audit@lfdr.de>; Tue,  7 Mar 2023 00:13:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678144389;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LZ5XjN3yFa/Z1f6/BAYFwZzTV1KfvWx3e9+pxb9MRr0=;
	b=cMZ4qNaIUq2SifwNJGRpcLzn+c5sgRNL5EnaiUnMh+HQ4c3/10psJIY/RwMu8fxVRSc3Dy
	754ThEUcuXcqsdfWKEpdbqWVsuFR4IioT0FxIJfQagAxtOjAwVA0FWbfkD6RQboS+z853Q
	GqnLPGVLNmIUcWrahkNF5oMAJnw65vE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-Pid7Kwe7Mg-yNHk8sZrfAw-1; Mon, 06 Mar 2023 18:13:06 -0500
X-MC-Unique: Pid7Kwe7Mg-yNHk8sZrfAw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BDEC80D0E3;
	Mon,  6 Mar 2023 23:12:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7CD0C1602B;
	Mon,  6 Mar 2023 23:12:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C7D8419465A4;
	Mon,  6 Mar 2023 23:12:50 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2EFF71946589 for <linux-audit@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 23:12:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E25682166B2B; Mon,  6 Mar 2023 23:12:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAEDA2166B26
 for <linux-audit@redhat.com>; Mon,  6 Mar 2023 23:12:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC7EB101A521
 for <linux-audit@redhat.com>; Mon,  6 Mar 2023 23:12:49 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-xrTzOKyBNaCys8NIuSOCXA-1; Mon, 06 Mar 2023 18:12:48 -0500
X-MC-Unique: xrTzOKyBNaCys8NIuSOCXA-1
Received: by mail-pg1-f173.google.com with SMTP id z10so6571639pgr.8
 for <linux-audit@redhat.com>; Mon, 06 Mar 2023 15:12:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678144367;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Dz/KuGZvZv3dqQ1/0+WoDQTp5gazdvpmT4yutoEpaU=;
 b=zRRI687CoZRycVX5qPvMZHfdtMIln1JEYSsi4lrD22PocqXFz3uLVKNB1LQ/dzbPx4
 8K0oW3qe4yT6J/+V1pq9BsWYUAKzk7Uf2SvCU14LDjpvAm8cs7ASuO6wtaWBwXxP1z8a
 sW1gPRzKXUqXN0J7uysnnc9DwwuiJTsFOElR0LS0prAXMJEwLPhPlHb3hoBcS9dPcMUE
 Lqhfu1ro7ZufcD3/FSjmukvQOLHrsFnzNvVFtSxJa8gAscD9AkQrbEbLOOiriDPAJIns
 coF2bOALWmtNb5GBdt5uRSV9KMglrpx2YfbC404j9yQmtYBZKvDDkkwUEBns/XJaGzKu
 gVvg==
X-Gm-Message-State: AO0yUKUPRf6GrxW0ay8vrfLWN1WaWsM88gYhyuPSrzPPQgJuNlwthKL4
 p534FPMycrypNo3bIe4MjEYgZ+0mBrAqvv26SfqA
X-Google-Smtp-Source: AK7set+zfpKC9F+lXCEGkQ27jz45rgNyJcVs4GQAtF4NlBLwTHPrhh6hpvcNFq5egdAHYUoF0FYqlNmogUdqlbMiFec=
X-Received: by 2002:a62:d41a:0:b0:5a8:e197:736f with SMTP id
 a26-20020a62d41a000000b005a8e197736fmr5300548pfh.0.1678144366916; Mon, 06 Mar
 2023 15:12:46 -0800 (PST)
MIME-Version: 1.0
References: <CAHC9VhRMJq1gJPoR79AxM1JphmGtxhGMYBkd=Ptuaq3WBjX2Bw@mail.gmail.com>
 <CAHC9VhRUGKcJrOh4G_aUk3B9xZxZfjwZYDDsDfvF3pcxAjp_uA@mail.gmail.com>
 <2143990.irdbgypaU6@x2>
In-Reply-To: <2143990.irdbgypaU6@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 6 Mar 2023 18:12:35 -0500
Message-ID: <CAHC9VhTU0xYmh-ZuyEjMOvP0g2UPpUDzxfOWmDUzkpVf9XZBSg@mail.gmail.com>
Subject: Re: audit userspace problems with io_uring async ops
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBNYXIgNiwgMjAyMyBhdCAzOjU44oCvUE0gU3RldmUgR3J1YmIgPHNncnViYkByZWRo
YXQuY29tPiB3cm90ZToKPgo+IEhlbGxvIFBhdWwsCj4KPiBPbiBNb25kYXksIE1hcmNoIDYsIDIw
MjMgMzowNzozNyBQTSBFU1QgUGF1bCBNb29yZSB3cm90ZToKPiA+IE9uIFR1ZSwgRmViIDI4LCAy
MDIzIGF0IDU6MDTigK9QTSBQYXVsIE1vb3JlIDxwYXVsQHBhdWwtbW9vcmUuY29tPiB3cm90ZToK
PiA+ID4gSGkgYWxsLAo+ID4gPgo+ID4gPiBXZSBqdXN0IHJlY2VudGx5IHN0YXJ0ZWQgcGlja2lu
ZyB1cCBhdWRpdC10ZXN0c3VpdGUgZmFpbHVyZXMgd2l0aCB0aGUKPiA+ID4gbGF0ZXN0IHVwc3Ry
ZWFtIGtlcm5lbHMgYW5kIEkgdHJhY2tlZCBpdCBkb3duIHRvIGEgY2hhbmdlIGluIGhvdyB0aGUK
PiA+ID4gSU9SSU5HX09QX09QRU5BVCBvcGVyYXRpb24gaXMgaGFuZGxlZCwgYW5kIGhvdyBTdGV2
ZSdzIGF1ZGl0IHVzZXJzcGFjZQo+ID4gPiBkaXNwbGF5cyBhc3luYyBpb191cmluZyBvcHMuICBJ
dCBhcHBlYXJzIHRoYXQgd2hlbiBhdXNlYXJjaCBpcyB1c2VkIHRvCj4gPiA+IGxvb2sgZm9yIGV2
ZW50cyBpdCBkb2Vzbid0IGRpc3BsYXkgYXN5bmMgaW9fdXJpbmcgZXZlbnRzIChVUklOR09QCj4g
PiA+IHJlY29yZHMvZXZlbnRzIHdpdGhvdXQgYW4gYXNzb2NpYXRlZCBTWVNDQUxMIHJlY29yZC9l
dmVudCkuICBUYWtlIHRoZQo+ID4gPiBmb2xsb3dpbmcgc25pcHBldCBmcm9tIC92YXIvbG9nL2F1
ZGl0L2F1ZGl0LmxvZyAuLi4KPiA+Cj4gPiBIaSBTdGV2ZSwKPiA+Cj4gPiBCZWZvcmUgSSBzdGFy
dCB3b3JraW5nIGFyb3VuZCB0aGlzIGluIHRoZSBhdWRpdC10ZXN0c3VpdGUgSSBqdXN0Cj4gPiB3
YW50ZWQgdG8gY2hlY2sgYW5kIHNlZSBpZiB5b3UgYWxyZWFkeSBoYWQgYSBmaXggZm9yIGF1c2Vh
cmNoPwo+Cj4gVGhhbmtzIGZvciB0aGUgYnVnIHJlcG9ydC4gSSBoYXZlIGJlZW4gb3V0IGZvciB0
aGUgbGFzdCA4IGRheXMgYW5kIG5vdyBoYXZlCj4gfjM2MDAgdW5yZWFkIGVtYWlscy4gSSB3aWxs
IHRyeSBsb29rIGludG8gdGhpcyB0b21vcnJvdy4KCkdyZWF0IHRoYW5rcy4gIEknbGwgaG9sZCBv
ZmYgYW4gYSB3b3JrYXJvdW5kLgoKLS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBt
YWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8120B67F178
	for <lists+linux-audit@lfdr.de>; Fri, 27 Jan 2023 23:54:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674860040;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vWUeLbfKKpJoniYq5eEncFgApp36eoBi5fzVBoksadY=;
	b=FqMsK7fprd/aqKTk6gO/tNPEPkkWpkFVfb22DBRU+arq2PuAk/avfjGhfuVqKT+H4HJIZ0
	/rai2x4myUUJ2MOdmSpdv0PL5CkW1MqDQsyC0AxWFX7GKtFvEnIvRQ8Nw9OG4N4Ye4SyX9
	s8WdnCvs97zBa8yz/xG9xxO6IaCHKwE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-5XK1SpYsNg6BH-x0MSPFLg-1; Fri, 27 Jan 2023 17:53:57 -0500
X-MC-Unique: 5XK1SpYsNg6BH-x0MSPFLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0CF33C025B6;
	Fri, 27 Jan 2023 22:53:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 90A897AD4;
	Fri, 27 Jan 2023 22:53:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0FCBC19465A3;
	Fri, 27 Jan 2023 22:53:41 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1E0C1194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 22:53:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DE6AF14171C0; Fri, 27 Jan 2023 22:53:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D68EC14171BE
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 22:53:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B96793C025C9
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 22:53:38 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-vOhDX2dFO0Om9mDWQ_QQxw-1; Fri, 27 Jan 2023 17:53:37 -0500
X-MC-Unique: vOhDX2dFO0Om9mDWQ_QQxw-1
Received: by mail-pj1-f53.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso9282894pju.0
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 14:53:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IV1QL6twj3JbhXkP12EpxrGpBWc/55NNcKUr7Mxc/IE=;
 b=nvhM/kxGeMEdfXxUFOHUxusDEHxwbWvG51ncb4NRIBwcpNsOSaPihYK2DEUxoubBNm
 pSQP6gqRbmI7rgXGFOrLkpiTzIOe36jRxnMA9sAW1qCD6izwOvtF3qtBuXUC3rQgaXZD
 C7cDDmKg6m741r5DFENdPiYoptV2RYku855MRtKdZ6/5E9Ys0jnr/jgPTTt4NAZGge/s
 LANP9g2n6lfF65TjTz/Wq3hVc8btVVR3kBRVNhS+3HHz/6u0LrjAWtMG5jLUcuqp43/s
 qf+uibAu1kA5Bs6gArbm19mO5J0y536Paad+subIBlhicwQPVWH4kOosp+SS08eUV8pI
 beIw==
X-Gm-Message-State: AFqh2krXF1O0HbNd1k8cf894gddzWoe9YSVqdh2LdGVr9hs3OL3rb4we
 BuBZGp3xRDLrZ+ZUangdDVYoyej6tbxa+QWVOe5D
X-Google-Smtp-Source: AMrXdXufkx+kARXGM/WQldtmYWplok4guDRE8z7yAssUVY4SPs2oyYPKUpHQdS8QvQhpPla60vomTv3S+RkjSqPlqy4=
X-Received: by 2002:a17:90a:5b0c:b0:223:fa07:7bfb with SMTP id
 o12-20020a17090a5b0c00b00223fa077bfbmr5377808pji.38.1674860016129; Fri, 27
 Jan 2023 14:53:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674682056.git.rgb@redhat.com>
 <da695bf4-bd9b-a03d-3fbc-686724a7b602@kernel.dk>
 <CAHC9VhSRbay5bEUMJngpj+6Ss=WLeRoyJaNNMip+TyTkTJ6=Lg@mail.gmail.com>
 <24fbe6cb-ee80-f726-b260-09f394ead764@kernel.dk>
 <CAHC9VhRuvV9vjhmTM4eGJkWmpZmSkgVaoQ=L6g3cahej-F52tQ@mail.gmail.com>
 <d9da8035-ed81-fb28-bf3a-f98c8a1e044a@kernel.dk>
In-Reply-To: <d9da8035-ed81-fb28-bf3a-f98c8a1e044a@kernel.dk>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 27 Jan 2023 17:53:24 -0500
Message-ID: <CAHC9VhRpu7WZDqWKcLDj18A0Z5FJdUU=eUL3wbJH1CnEBWB4GA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] two suggested iouring op audit updates
To: Jens Axboe <axboe@kernel.dk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: Christian Brauner <brauner@kernel.org>, Richard Guy Briggs <rgb@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Pavel Begunkov <asml.silence@gmail.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBKYW4gMjcsIDIwMjMgYXQgNTo0NiBQTSBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwu
ZGs+IHdyb3RlOgo+IE9uIDEvMjcvMjMgMzozOOKAr1BNLCBQYXVsIE1vb3JlIHdyb3RlOgo+ID4g
T24gRnJpLCBKYW4gMjcsIDIwMjMgYXQgMjo0MyBQTSBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwu
ZGs+IHdyb3RlOgo+ID4+IE9uIDEvMjcvMjMgMTI6NDLigK9QTSwgUGF1bCBNb29yZSB3cm90ZToK
PiA+Pj4gT24gRnJpLCBKYW4gMjcsIDIwMjMgYXQgMTI6NDAgUE0gSmVucyBBeGJvZSA8YXhib2VA
a2VybmVsLmRrPiB3cm90ZToKPiA+Pj4+IE9uIDEvMjcvMjMgMTA6MjPigK9BTSwgUmljaGFyZCBH
dXkgQnJpZ2dzIHdyb3RlOgo+ID4+Pj4+IEEgY291cGxlIG9mIHVwZGF0ZXMgdG8gdGhlIGlvdXJp
bmcgb3BzIGF1ZGl0IGJ5cGFzcyBzZWxlY3Rpb25zIHN1Z2dlc3RlZCBpbgo+ID4+Pj4+IGNvbnN1
bHRhdGlvbiB3aXRoIFN0ZXZlIEdydWJiLgo+ID4+Pj4+Cj4gPj4+Pj4gUmljaGFyZCBHdXkgQnJp
Z2dzICgyKToKPiA+Pj4+PiAgIGlvX3VyaW5nLGF1ZGl0OiBhdWRpdCBJT1JJTkdfT1BfRkFEVklT
RSBidXQgbm90IElPUklOR19PUF9NQURWSVNFCj4gPj4+Pj4gICBpb191cmluZyxhdWRpdDogZG8g
bm90IGxvZyBJT1JJTkdfT1BfKkdFVFhBVFRSCj4gPj4+Pj4KPiA+Pj4+PiAgaW9fdXJpbmcvb3Bk
ZWYuYyB8IDQgKysrLQo+ID4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPj4+Pgo+ID4+Pj4gTG9vayBmaW5lIHRvIG1lIC0gd2Ugc2hvdWxkIHBy
b2JhYmx5IGFkZCBzdGFibGUgdG8gYm90aCBvZiB0aGVtLCBqdXN0Cj4gPj4+PiB0byBrZWVwIHRo
aW5ncyBjb25zaXN0ZW50IGFjcm9zcyByZWxlYXNlcy4gSSBjYW4gcXVldWUgdGhlbSB1cCBmb3Ig
Ni4zLgo+ID4+Pgo+ID4+PiBQbGVhc2UgaG9sZCBvZmYgdW50aWwgSSd2ZSBoYWQgYSBjaGFuY2Ug
dG8gbG9vayB0aGVtIG92ZXIgLi4uCj4gPj4KPiA+PiBJIGhhdmVuJ3QgdGFrZW4gYW55dGhpbmcg
eWV0LCBmb3IgdGhpbmdzIGxpa2UgdGhpcyBJIGFsd2F5cyBsZXQgaXQKPiA+PiBzaW1tZXIgdW50
aWwgcGVvcGxlIGhhdmUgaGFkIGEgY2hhbmNlIHRvIGRvIHNvLgo+ID4KPiA+IFRoYW5rcy4gIEZX
SVcsIHRoYXQgc291bmRzIHZlcnkgcmVhc29uYWJsZSB0byBtZSwgYnV0IEkndmUgc2VlbiBsb3Rz
Cj4gPiBvZiBkaWZmZXJlbnQgYmVoYXZpb3JzIGFjcm9zcyBzdWJzeXN0ZW1zIGFuZCB3YW50ZWQg
dG8gbWFrZSBzdXJlIHdlCj4gPiB3ZXJlIG9uIHRoZSBzYW1lIHBhZ2UuCj4KPiBTb3VuZHMgZmFp
ci4gQlRXLCBjYW4gd2Ugc3RvcCBDQydpbmcgY2xvc2VkIGxpc3RzIG9uIHBhdGNoCj4gc3VibWlz
c2lvbnM/IEdldHRpbmcgdGhlc2U6Cj4KPiBZb3VyIG1lc3NhZ2UgdG8gTGludXgtYXVkaXQgYXdh
aXRzIG1vZGVyYXRvciBhcHByb3ZhbAo+Cj4gb24gZXZlcnkgcmVwbHkgaXMgcmVhbGx5IGFubm95
aW5nLgoKV2Uga2luZGEgbmVlZCBhdWRpdCByZWxhdGVkIHN0dWZmIG9uIHRoZSBsaW51eC1hdWRp
dCBsaXN0LCB0aGF0J3Mgb3VyCm1haWxpbmcgbGlzdCBmb3IgYXVkaXQgc3R1ZmYuCgpIb3dldmVy
LCBJIGFncmVlIHRoYXQgaXQgaXMgY3JhcCB0aGF0IHRoZSBsaW51eC1hdWRpdCBsaXN0IGlzCm1v
ZGVyYXRlZCwgYnV0IHVuZm9ydHVuYXRlbHkgdGhhdCBpc24ndCBzb21ldGhpbmcgSSBjb250cm9s
IChJIGhhdmVuJ3QKd29ya2VkIGZvciBSSCBpbiB5ZWFycywgYW5kIGV2ZW4gdGhlbiB0aGUgbGlz
dCBvd25lciB3YXMgcmVhbGx5IHdlaXJkCmFib3V0IG1hbmFnaW5nIHRoZSBsaXN0KS4gIE9jY2Fz
aW9uYWxseSBJIGdydW1ibGUgYWJvdXQgbW92aW5nIHRoZQprZXJuZWwgYXVkaXQgZGV2ZWxvcG1l
bnQgdG8gYSBsaW51eC1hdWRpdCBsaXN0IG9uIHZnZXIgYnV0IGhhdmVuJ3QKYm90aGVyZWQgeWV0
LCBwZXJoYXBzIHRoaXMgaXMgYXMgZ29vZCBhIHJlYXNvbiBhcyBhbnkuCgpSaWNoYXJkLCBTdGV2
ZSAtIGFueSBjaGFuY2Ugb2Ygb3BlbmluZyB0aGUgbGludXgtYXVkaXQgbGlzdD8KCi0tIApwYXVs
LW1vb3JlLmNvbQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhh
dC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1h
dWRpdAo=


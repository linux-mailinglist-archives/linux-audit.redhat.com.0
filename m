Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C38C77D249
	for <lists+linux-audit@lfdr.de>; Tue, 15 Aug 2023 20:45:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692125112;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mjhlLTidD3w4Li8RJDSacwPJ4fHSlj/eHBDc9OGj4MA=;
	b=i4JqJ9HRzTYekce9F+GcuiuaiSid4WeWejvA/61YVmiN3W7LDaWHKfiNTvWpMiPoua8ry5
	1xLGvsoK8hN8NhLyn4fPPTldAZCeUmF2+GczDchhe7YT1eeF59LY+fSikZOTvJfpE8eg5v
	eE/g58L+u5HBEvS1BnTQNrV1Qas7ws8=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-idQY04mwN8qKgCF2tGD9cg-1; Tue, 15 Aug 2023 14:45:08 -0400
X-MC-Unique: idQY04mwN8qKgCF2tGD9cg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDB1B381C178;
	Tue, 15 Aug 2023 18:45:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 299B0C15BAE;
	Tue, 15 Aug 2023 18:44:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5955A1946595;
	Tue, 15 Aug 2023 18:44:58 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0A4A61946587 for <linux-audit@listman.corp.redhat.com>;
 Tue, 15 Aug 2023 18:44:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CBFFAC15BAE; Tue, 15 Aug 2023 18:44:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3F35C15BAD
 for <linux-audit@redhat.com>; Tue, 15 Aug 2023 18:44:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8C5B185A78F
 for <linux-audit@redhat.com>; Tue, 15 Aug 2023 18:44:56 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-W2jaO9-mPSivB5sYciQXwA-1; Tue, 15 Aug 2023 14:44:54 -0400
X-MC-Unique: W2jaO9-mPSivB5sYciQXwA-1
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-589addee1c1so51415927b3.3
 for <linux-audit@redhat.com>; Tue, 15 Aug 2023 11:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692125094; x=1692729894;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZps84ysRP0NeVlJT28XZWO+nki5NsVjjdBZ2Y0DhN0=;
 b=HtgIFfkQc8nMYAiQl2BMXRgCTjxt+9vMmz2xO9GK0HHHHKSLAson3L6D/0aON4w+o3
 mqCCKLDV/4x+C3TsFKer6buPQBdXEbq2iGRhhwM9kjcXkDdHLpv/5n//7NzTN4QJDmX5
 zhvFn/pGyHhpc28FuoBWDk3Kqdqn7yJ1L0XJfwTHyO9CGuDL8AnwR28eEvE03gfp+sv1
 iReTVRhiR4uf9GisoWBhwmxhqsRhR5NPUc7JKSIytWMJhKwPsQXMf3o/hMsJucXCipJO
 7BV3gkLUYWuukGqRoBGmuzLwwle39cIDctO4zyPcKhO4mewFhYs6EZEzMk/E6gJFwHVi
 q+pA==
X-Gm-Message-State: AOJu0Yzo6lr+qaHlOdiSorcRO6dq5RHxO6CHuq98SknLlCSwGQgz9CHP
 xrKB0cstmJzuDyMAGtMzKQGZAWW9gUbfPFlO+7ACNLMSwHkHv82JXQ==
X-Google-Smtp-Source: AGHT+IHx8o0tREZgd80T1D1EvXrYw6lYsELJicHooOd7UFD+IsRuzuHRtwAOfNqacGvlfkvvf80IxXfCwrgpjqTabic=
X-Received: by 2002:a0d:ca8d:0:b0:589:eeb6:b503 with SMTP id
 m135-20020a0dca8d000000b00589eeb6b503mr5786073ywd.35.1692125094192; Tue, 15
 Aug 2023 11:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
In-Reply-To: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 15 Aug 2023 14:44:43 -0400
Message-ID: <CAHC9VhTLQjjQ0QMfBDHYCz9LOAuO=rJWSDEUqPsFE+dowFbN=Q@mail.gmail.com>
Subject: Re: [PATCH] audit: add task history record
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: audit@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBBdWcgMTEsIDIwMjMgYXQgNjo1OOKAr0FNIFRldHN1byBIYW5kYQo8cGVuZ3Vpbi1r
ZXJuZWxAaS1sb3ZlLnNha3VyYS5uZS5qcD4gd3JvdGU6Cj4KPiBXaGVuIGFuIHVuZXhwZWN0ZWQg
c3lzdGVtIGV2ZW50IG9jY3VycywgdGhlIGFkbWluaXN0cmF0b3IgbWF5IHdhbnQgdG8KPiBpZGVu
dGlmeSB3aGljaCBhcHBsaWNhdGlvbiB0cmlnZ2VyZWQgdGhlIGV2ZW50LiBGb3IgZXhhbXBsZSwg
dW5leHBlY3RlZAo+IHByb2Nlc3MgdGVybWluYXRpb24gaXMgc3RpbGwgYSByZWFsIGNvbmNlcm4g
ZW5vdWdoIHRvIHdyaXRlIGFydGljbGVzCj4gbGlrZSBodHRwczovL2FjY2Vzcy5yZWRoYXQuY29t
L3NvbHV0aW9ucy8xNjU5OTMgLgo+Cj4gVGhpcyBwYXRjaCBhZGRzIGEgcmVjb3JkIHdoaWNoIGVt
aXRzIFRPTU9ZTy1saWtlIHRhc2sgaGlzdG9yeSBpbmZvcm1hdGlvbgo+IGludG8gdGhlIGF1ZGl0
IGxvZ3MgZm9yIGJldHRlciB1bmRlcnN0YW5kaW5nIG9mIHVuZXhwZWN0ZWQgc3lzdGVtIGV2ZW50
cy4KPgo+ICAgdHlwZT1VTktOT1dOWzEzNDBdIG1zZz1hdWRpdCgxNjkxNzUwNzM4LjI3MToxMDgp
OiBoaXN0b3J5PSJuYW1lPXN3YXBwZXIvMDtwaWQ9MTtzdGFydD0yMDIzMDgxMTE5NDMyOT0+bmFt
ZT1pbml0O3BpZD0xO3N0YXJ0PTIwMjMwODExMTk0MzQzPT5uYW1lPXN5c3RlbWQ7cGlkPTE7c3Rh
cnQ9MjAyMzA4MTExOTQ0Mzk9Pm5hbWU9c3NoZDtwaWQ9MzY2MDtzdGFydD0yMDIzMDgxMTEwNDUw
ND0+bmFtZT1zc2hkO3BpZD0zNzY3O3N0YXJ0PTIwMjMwODExMTA0NTM1IgoKV2hpbGUgSSByZXNw
ZWN0IHlvdXIgcGVyc2lzdGVuY2UsIHdlJ3ZlIHRhbGtlZCBhYm91dCB0aGlzIHF1aXRlIGEgYml0
CmFscmVhZHkgaW4gb3RoZXIgdGhyZWFkcy4gIFdoYXQgeW91IGFyZSB0cnlpbmcgdG8gZG8gaXMg
YWxyZWFkeQpwb3NzaWJsZSB3aXRoIGF1ZGl0IGFuZC9vciBUT01PWU8gZW5hYmxlZCBhbmQgY29u
ZmlndXJlZCBzbyBJIHNlZSBubwpyZWFzb24gd2h5IHdlIHdhbnQgdG8gbWVyZ2UgdGhpcy4gIEkg
dW5kZXJzdGFuZCB5b3VyIGZydXN0cmF0aW9uIHRoYXQKVE9NT1lPIGlzIG5vdCBlbmFibGVkIGJ5
IHlvdXIgcHJlZmVyZWQgZGlzdHJpYnV0aW9uLCBidXQgYWRkaW5nCmFkZGl0aW9uYWwgKGFuZCBh
cmd1YWJseSByZWR1bmRhbnQgY29kZSkgY29kZSB0byB0aGUgdXBzdHJlYW0ga2VybmVsCmlzIG5v
dCBhIHNvbHV0aW9uIEkgYW0gd2lsbGluZyB0byBzdXBwb3J0IGFuZCBtYWludGFpbiBsb25nIHRl
cm0uCgo+IFRvIGJlIGFibGUgdG8gYXZvaWQgYmxvYXRpbmcgYXVkaXQgbG9nIGZpbGVzIGR1ZSB0
byB0aGlzIGluZm9ybWF0aW9uLCB0aGlzCj4gcGF0Y2ggdXNlcyBhdWRpdF9oaXN0b3J5PSBrZXJu
ZWwgY29tbWFuZCBsaW5lIHBhcmFtZXRlciB0aGF0IGNvbnRyb2xzIG1heAo+IGxlbmd0aCBvZiBo
aXN0b3J5IGluIGJ5dGVzIChkZWZhdWx0IGlzIDEwMjQsIGFuZCBzZXR0aW5nIHRvIDAgZGlzYWJs
ZXMKPiByZWNvcmRpbmcgYW5kIGVtaXR0aW5nKS4KPgo+IFVubGlrZSBleGVjdmUoKSdzIGFyZ3Yg
cmVjb3JkLCByZWNvcmRzIGluIHRoaXMgaGlzdG9yeSBpbmZvcm1hdGlvbiBpcwo+IGVtaXR0ZWQg
YXMgb25lIHN0cmluZyBpbiBvcmRlciB0byByZWR1Y2UgYmxvYXQgb2YgdGhlIGF1ZGl0IGxvZyBm
aWxlcy4KPiBUaGlzIGluZm9ybWF0aW9uIGNhbiBiZSBzcGxpdCBpbnRvIGFuIGFycmF5IHVzaW5n
ID0+IGFzIHRoZSB0b2tlbml6ZXIuCj4gQnV0IGRvbid0IGV4cGVjdCB0aGF0IHlvdSBjYW4gY29t
cGFyZSBhcnJheSBlbGVtZW50cyB0aHJvdWdob3V0IHRoZSB3aG9sZQo+IGF1ZGl0IGxvZ3MgYnkg
c3BsaXR0aW5nIGludG8gYW4gYXJyYXksIGZvciBvbGQgcmVjb3JkcyBnZXQgcmVtb3ZlZCBmcm9t
Cj4gaGlzdG9yeSB3aGVuIGhpc3RvcnkgYmVjYW1lIHRvbyBsb25nIHRvIGFwcGVuZCB0aGUgbmV3
ZXN0IHJlY29yZC4gVGhpcwo+IGhpc3RvcnkgaW5mb3JtYXRpb24gaXMgbWVhbnQgdG8gYmUgaW50
ZXJwcmV0ZWQgYnkgaHVtYW5zIHJhdGhlciB0aGFuIGJlCj4gYW5hbHl6ZWQgYnkgcHJvZ3JhbXMu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBUZXRzdW8gSGFuZGEgPHBlbmd1aW4ta2VybmVsQEktbG92ZS5T
QUtVUkEubmUuanA+Cj4gLS0tCj4gIGZzL2V4ZWMuYyAgICAgICAgICAgICAgICAgIHwgICAxICsK
PiAgaW5jbHVkZS9saW51eC9hdWRpdC5oICAgICAgfCAgIDUgKysKPiAgaW5jbHVkZS9saW51eC9z
Y2hlZC5oICAgICAgfCAgIDEgKwo+ICBpbmNsdWRlL3VhcGkvbGludXgvYXVkaXQuaCB8ICAgMSAr
Cj4gIGluaXQvaW5pdF90YXNrLmMgICAgICAgICAgIHwgICA3ICsrKwo+ICBrZXJuZWwvYXVkaXQu
YyAgICAgICAgICAgICB8ICAgMSArCj4gIGtlcm5lbC9hdWRpdHNjLmMgICAgICAgICAgIHwgMTA4
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgNyBmaWxlcyBjaGFuZ2Vk
LCAxMjQgaW5zZXJ0aW9ucygrKQoKLS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBt
YWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


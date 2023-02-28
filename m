Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED546A5AA4
	for <lists+linux-audit@lfdr.de>; Tue, 28 Feb 2023 15:12:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677593541;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oPCgJ5N0UyoSQDIl8sJPy+qadR1U9Bw58Y+ZISWOY7Y=;
	b=aHFWoGxdx4bhQXRMgZFqEyHolIw1C7ZcpfoYMFrbWXrBF7/akXFyrL0hgq2gq2F6WoKR2w
	j0OJYj1b+ftfbg9JZ0/nvGGGCuMId7BXc7n8YkgGls8bXJwldtiWwmwVEleCLN6gFiYz1i
	tTSeUPgH83VSzxzPfZZ2HbmXbHzZFMY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-QOf0Z4zxPuKedQlbP6elJA-1; Tue, 28 Feb 2023 09:12:20 -0500
X-MC-Unique: QOf0Z4zxPuKedQlbP6elJA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 273993C0CD53;
	Tue, 28 Feb 2023 14:12:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E65918EC6;
	Tue, 28 Feb 2023 14:12:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E9AE219465A3;
	Tue, 28 Feb 2023 14:12:11 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C5D981946597 for <linux-audit@listman.corp.redhat.com>;
 Tue, 28 Feb 2023 14:11:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 995A92026D76; Tue, 28 Feb 2023 14:11:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91AD72026D4B
 for <linux-audit@redhat.com>; Tue, 28 Feb 2023 14:11:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 737C0101B42B
 for <linux-audit@redhat.com>; Tue, 28 Feb 2023 14:11:58 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-119-DovaCwtTNheUxdyUItq_yw-1; Tue, 28 Feb 2023 09:11:56 -0500
X-MC-Unique: DovaCwtTNheUxdyUItq_yw-1
Received: by mail-pj1-f42.google.com with SMTP id kb15so9977988pjb.1
 for <Linux-audit@redhat.com>; Tue, 28 Feb 2023 06:11:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677593515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2z66yIeoCDnGTcQWS6A+lElETlnbCKbPv45mKP8upPM=;
 b=T570zgMrar0s6bvWR7F3ksIuL6IQO8ZUcNWfFMonA14MkQRXiHumBG+eNy/DRJEX6Q
 DHPqJLCBBsTQsjjCRO6KLzSb9dXpXsvGOVovxOFjA46hjPOwbdCp9GDP490yxPKjLuCW
 EPbRSyobbIz569khnkAjp0yosEi6ziaUeV7kYzN/vDF7lJk7wjjSWOZ3/zS7naPZFuK8
 F/bVr3B0iPLYvTsTuYQTfvdxotFxiPC7xfRn/yLSr9MIJ3lV4uNel+jxLwf88EXl/8dr
 MXbP5hbRjBBTWLYXq9br0Bm1yODnNlF/zdUr65/uyRsxJOaeCe7bfj0hjCfd0RyQN253
 D9Ww==
X-Gm-Message-State: AO0yUKXfWLhbBNVynK0/Fuk3melwmRE2DDoPGeJmBEzUXnOIpA4JlOnM
 BvE52t4+dJ9HhgXcxZFum7yS1+NvE12Y3Er88l6Y+HaHRlXO
X-Google-Smtp-Source: AK7set9+8i6d94ZVz7j/hsBtV+oEd2yBY8pIaNsAwkPNEpes/Kn0LjfsVdnZo0BKc2zB/GI32KLutPPjuRDj5pANePE=
X-Received: by 2002:a17:902:f7c5:b0:19a:f80f:9619 with SMTP id
 h5-20020a170902f7c500b0019af80f9619mr1071320plw.3.1677593515562; Tue, 28 Feb
 2023 06:11:55 -0800 (PST)
MIME-Version: 1.0
References: <CAPoNrttQKG1uiUx=v6Cj8U0MnYMoU-ZP_Htmxn7F_Q7ZdUc9RA@mail.gmail.com>
In-Reply-To: <CAPoNrttQKG1uiUx=v6Cj8U0MnYMoU-ZP_Htmxn7F_Q7ZdUc9RA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Feb 2023 09:11:44 -0500
Message-ID: <CAHC9VhQAFgv5e3rvoaDTnQvQOoGawoAUfcRonayEwrvJu6znBg@mail.gmail.com>
Subject: Re: Key based rate limiter (audit_set_rate_limit)
To: Anurag Aggarwal <anurag19aggarwal@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: Linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBGZWIgMjgsIDIwMjMgYXQgNTo1M+KAr0FNIEFudXJhZyBBZ2dhcndhbAo8YW51cmFn
MTlhZ2dhcndhbEBnbWFpbC5jb20+IHdyb3RlOgo+IEhlbGxvIEFsbCwKPgo+IFRoZSBjdXJyZW50
IHJhdGUgbGltaXRlciwgYXVkaXRfc2V0X3JhdGVfbGltaXQgbGltaXRzIGFsbCB0eXBlcyBvZiBl
dmVudHMuIEluIG91ciBjYXNlLCB3ZSB3YW50IHRvIGxpbWl0IGF1ZGl0ZCBldmVudHMgd2l0aCBh
IHNwZWNpZmljIGtleSwgYXMgdGhleSBhcmUgdmVyeSBub2lzeSBhbmQgY29uc3VtZSB2ZXJ5IGhp
Z2ggQ1BVLgo+Cj4gRnJvbSBteSB1bmRlcnN0YW5kaW5nLCB0aGlzIHN1cHBvcnQgaXMgY3VycmVu
dGx5IG1pc3NpbmcgaW4gQXVkaXRELgo+Cj4gSXMgbXkgdW5kZXJzdGFuZGluZyBjb3JyZWN0PwoK
SGVsbG8uCgpMaW1pdGluZyBvZiBhdWRpdCByZWNvcmRzIGlzIGFjdHVhbGx5IGRvbmUgaW4gdGhl
IGtlcm5lbCwgYW5kCmN1cnJlbnRseSB0aGUgcmF0ZSBsaW1pdCBhcHBsaWVzIGVxdWFsbHlbMV0g
dG8gYWxsIHJlY29yZHMsIHRoZXJlIGlzCm5vIGFiaWxpdHkgdG8gZW5mb3JjZSBsaW1pdHMgcGVy
LWtleS4gIElmIHlvdSBoYXZlIGEgcGFydGljdWxhciBhdWRpdApydWxlIHdoaWNoIGlzIHRvbyB2
ZXJib3NlICphbmQqIHlvdSBhcmUgd2lsbGluZyB0byBsb3NlIGF1ZGl0IHJlY29yZHMKZnJvbSB0
aGF0IGZpbHRlciBydWxlICh3aGljaCBpcyB3aGF0IHdvdWxkIGhhcHBlbiBpZiB0aGV5IHdlcmUg
cmF0ZQpsaW1pdGVkKSwgeW91IG1pZ2h0IHdhbnQgdG8gY29uc2lkZXIgbWFraW5nIHRoYXQgYXVk
aXQgZmlsdGVyIHJ1bGUKbW9yZSB0YXJnZXRlZCB0byB0aGUgZXZlbnQgeW91IGFyZSBpbnRlcmVz
dGVkIGluIGxvZ2dpbmcuICBHZW5lcmF0aW5nCm1vcmUgYXVkaXQgcmVjb3JkcyB0aGFuIHlvdSB3
YW50IHRvIHNlZSBjYW4gYmUgYSBzaWduIG9mIGFuIG92ZXJseQpnZW5lcmFsIGF1ZGl0IHJ1bGUu
CgpHb29kIGx1Y2shCgpbMV0gQXVkaXQgcmVjb3JkcyBnZW5lcmF0ZWQgYnkgYXVkaXRkL2F1ZGl0
Y3RsIGFyZSBleGVtcHQgZnJvbSByYXRlCmxpbWl0aW5nIHRvIGhlbHAgcHJldmVudCBsb2NrdXBz
L2NvbnRlbnRpb24uCgotLSAKcGF1bC1tb29yZS5jb20KCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcg
bGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQK


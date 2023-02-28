Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DEF6A5D24
	for <lists+linux-audit@lfdr.de>; Tue, 28 Feb 2023 17:32:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677601923;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sbmqkFis2k7JHH7FmnuvGCk6wzGXtI4Mn4bHURbP1rE=;
	b=LrHN8SVeh5Rl+x3OgW3xjOc+zFmV9MoZmwZmKikGQAEXHkB614u4/Hv+51uPMy7fkiZvHH
	+vdeU6/GzAxc2zHQh0uZcYKvOlR2KZH+kUC5PBARJ4yI1lv3kgIJLhIO6/+AjKQEy/VOWt
	85wHjGO/S5P5pvfgPBBIIt3n9Ul9zd0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-mg3-FygqPSCfLvqmNaxs_g-1; Tue, 28 Feb 2023 11:31:56 -0500
X-MC-Unique: mg3-FygqPSCfLvqmNaxs_g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5E5B18E6C42;
	Tue, 28 Feb 2023 16:31:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1B4C40C6EC4;
	Tue, 28 Feb 2023 16:31:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 76F3319465A3;
	Tue, 28 Feb 2023 16:31:51 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 533A2194658C for <linux-audit@listman.corp.redhat.com>;
 Tue, 28 Feb 2023 16:31:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3EE1D40C945A; Tue, 28 Feb 2023 16:31:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 373C940C6EC4
 for <linux-audit@redhat.com>; Tue, 28 Feb 2023 16:31:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06D603C10C61
 for <linux-audit@redhat.com>; Tue, 28 Feb 2023 16:31:50 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-550-kMxmnBz0MIueXaXiB0EzNA-1; Tue, 28 Feb 2023 11:31:47 -0500
X-MC-Unique: kMxmnBz0MIueXaXiB0EzNA-1
Received: by mail-pj1-f53.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso9102425pjs.3
 for <Linux-audit@redhat.com>; Tue, 28 Feb 2023 08:31:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677601906;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9jdaA8FTsG2unLdYf50j/mwMGuKplUl33KFIz6XCTU=;
 b=KhArZI9OWE65bipHR4sdKB0Vz7706oUIzA3Or2Si0sXLyICcCCX6eIIBnBxWcXoQpa
 frTX/TQGTt/3ulcXUha+yr807+iaMCsHQEy7oS2VwHI8qGfCUtb7e2SXZq+9S3LiKEa/
 bVIdkcQDxGk4D9mQvKPOXd9601hIzbngRIle3mYVO4cLv6wqVFf3oERQxPke3LoVoEOQ
 wv14LIi1eQ61NOgtOhPklC3Vxmm/SREyEhV85ubBCTxwCgZJUK0sHcdSUFIhvoxyOtSX
 4mtXVaKADwQnoKwIptSQRe/ewU80eHtzmh+cvT3+p5n/mC+Y4tD38Uce7nsP1MNFLDju
 UNQQ==
X-Gm-Message-State: AO0yUKWxMFLzAO09H6h/Vfz+Ga1eo99kPgW5zrTjCbx7n/FP45RuuWel
 Uyvngw93gew1+dEIvhyJWJKKmVp8eN1wHEyuVUjm
X-Google-Smtp-Source: AK7set8UAJ/6cqRfpCYBkHtwWvMpPboqv61qnZHVHmjjtTdRkJjFrNktGyy60vBuQ2g0mfiKp9M0k9RoqXVj9GjPN6w=
X-Received: by 2002:a17:90a:4a09:b0:233:be3d:8a42 with SMTP id
 e9-20020a17090a4a0900b00233be3d8a42mr1420844pjh.0.1677601906395; Tue, 28 Feb
 2023 08:31:46 -0800 (PST)
MIME-Version: 1.0
References: <CAPoNrttQKG1uiUx=v6Cj8U0MnYMoU-ZP_Htmxn7F_Q7ZdUc9RA@mail.gmail.com>
 <CAHC9VhQAFgv5e3rvoaDTnQvQOoGawoAUfcRonayEwrvJu6znBg@mail.gmail.com>
 <CAPoNrtswDzsghShzAvf72xOQ-vWUj6DdkVPRWnBWp-qG9Xa8Vw@mail.gmail.com>
In-Reply-To: <CAPoNrtswDzsghShzAvf72xOQ-vWUj6DdkVPRWnBWp-qG9Xa8Vw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Feb 2023 11:31:35 -0500
Message-ID: <CAHC9VhSr3groyZpA34L3swqDoU8_WJWbWsHz7GDR0QqNpSjhyA@mail.gmail.com>
Subject: Re: Key based rate limiter (audit_set_rate_limit)
To: Anurag Aggarwal <anurag19aggarwal@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBGZWIgMjgsIDIwMjMgYXQgMTA6MzXigK9BTSBBbnVyYWcgQWdnYXJ3YWwKPGFudXJh
ZzE5YWdnYXJ3YWxAZ21haWwuY29tPiB3cm90ZToKPgo+IEhlbGxvIFBhdWwsCj4KPiBUaGFuayB5
b3UgZm9yIHlvdXIgaW5mb3JtYXRpb24uCj4KPj4gSWYgeW91IGhhdmUgYSBwYXJ0aWN1bGFyIGF1
ZGl0Cj4+IHJ1bGUgd2hpY2ggaXMgdG9vIHZlcmJvc2UgKmFuZCogeW91IGFyZSB3aWxsaW5nIHRv
IGxvc2UgYXVkaXQgcmVjb3Jkcwo+PiBmcm9tIHRoYXQgZmlsdGVyIHJ1bGUgKHdoaWNoIGlzIHdo
YXQgd291bGQgaGFwcGVuIGlmIHRoZXkgd2VyZSByYXRlCj4+IGxpbWl0ZWQpLCB5b3UgbWlnaHQg
d2FudCB0byBjb25zaWRlciBtYWtpbmcgdGhhdCBhdWRpdCBmaWx0ZXIgcnVsZQo+PiBtb3JlIHRh
cmdldGVkIHRvIHRoZSBldmVudCB5b3UgYXJlIGludGVyZXN0ZWQgaW4gbG9nZ2luZy4gIEdlbmVy
YXRpbmcKPj4gbW9yZSBhdWRpdCByZWNvcmRzIHRoYW4geW91IHdhbnQgdG8gc2VlIGNhbiBiZSBh
IHNpZ24gb2YgYW4gb3Zlcmx5Cj4+IGdlbmVyYWwgYXVkaXQgcnVsZS4KPgo+IEkgYWdyZWUgdGhh
dCBoYXZpbmcgcnVsZXMgd2hpY2ggYXJlIHRvbyB2ZXJib3NlIGlzIG5vdCBhIHZlcnkgZ29vZCBp
ZGVhLgo+Cj4gQmVzaWRlIHRoaXMsIGlzIHRoZXJlIGFueSBvdGhlciBtZWNoYW5pc20gd2hpY2gg
d2UgY2FuIHVzZSB0byBnZXQgYSBzaW1pbGFyIGVmZmVjdD8KCk5vdGhpbmcgY29tZXMgcXVpY2ts
eSB0byBtaW5kLCBwZXJoYXBzIG90aGVycyBvbiB0aGUgbWFpbGluZyBsaXN0Cm1pZ2h0IGhhdmUg
c29tZSBpZGVhcyAuLi4gPwoKLS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWls
aW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


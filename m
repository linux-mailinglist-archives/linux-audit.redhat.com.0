Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6510A67EEC4
	for <lists+linux-audit@lfdr.de>; Fri, 27 Jan 2023 20:50:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674849001;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KMH/4d7uBH+32l/iiuEz6zeTLqFjSx6PvCV8CpKeRqw=;
	b=Y7jIX3Vy/GBB5LmkJVWQIQfwuf9brv0CG6Plck3tyjLqFLlUh7aq5ZOourtWx+MZc/h7rz
	J9j15PKvnSHcDO7orqUZZ2EYtb0MViPxd+VHH2dHxl4vBs7qPrfjI1SMEelf1Pkf+NhFml
	rCM8v7vVfcPfTs+a8h2xOtuCEFDp57w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-tjyHTsMxO8GAFmIykOZzZA-1; Fri, 27 Jan 2023 14:49:58 -0500
X-MC-Unique: tjyHTsMxO8GAFmIykOZzZA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 901BE1802CE4;
	Fri, 27 Jan 2023 19:49:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75568492D8A;
	Fri, 27 Jan 2023 19:49:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F209719465A3;
	Fri, 27 Jan 2023 19:49:43 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 16F96194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 19:43:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BC2D5400DE84; Fri, 27 Jan 2023 19:43:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B326C40C945A
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 19:43:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C19485C6E2
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 19:43:43 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-8htY8XUaMmGX1nM2qHGazQ-1; Fri, 27 Jan 2023 14:43:41 -0500
X-MC-Unique: 8htY8XUaMmGX1nM2qHGazQ-1
Received: by mail-pl1-f176.google.com with SMTP id jl3so6042645plb.8
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 11:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4FpsNM4Bdeby2MkenGuWGLbgk6pVqfQ79XLW3mUcsw8=;
 b=bEOruF+64V9vz7JH6wTgcKtaTnEsU+PdFk6lBi5XgWIcVJyrQVzmin7QK7qWBV1Z1+
 0hO039JTF6OG/m5BvXSkPEaEowXgk9g9Rjah6YfiECxvQfABDjSbn8nr8Y1TZJoyO2v5
 a3Tm4zWXoQtc9UOeqgqGE6odpQbd1n5fiybNnElZj/CmbbKGdVWC3jPhOtZE0ZThIzTI
 DF9zYbYn2hHsgIafv2E47AUxpLfVADqHy4Xm/68q2Oz9F7qqJrUMYM9FZNmTkY+EWwKy
 lOSvkgTuRYyuh67Fmy7qB2ryz8zQlAewz72CJc4pIs3AsZK33BiYHbmz4uyml4NJPeUW
 RknA==
X-Gm-Message-State: AO0yUKUcVwGllJiKCg3zxibF0HCEBClS05g59omnvxiurBrjmrdySGst
 +3njylokHMif0FZQYYE8dyJkiQ==
X-Google-Smtp-Source: AK7set/JiYkD1dPFXX0spEZ4uMEWwjgdpN2oFU19P2Z0/IgGbk/hInjo9DftHh34XEOc/4I/lRZl0g==
X-Received: by 2002:a17:902:d4d1:b0:196:1f80:105a with SMTP id
 o17-20020a170902d4d100b001961f80105amr3004568plg.5.1674848620397; 
 Fri, 27 Jan 2023 11:43:40 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a170902d48c00b001894198d0ebsm3254490plg.24.2023.01.27.11.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 11:43:39 -0800 (PST)
Message-ID: <24fbe6cb-ee80-f726-b260-09f394ead764@kernel.dk>
Date: Fri, 27 Jan 2023 12:43:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 0/2] two suggested iouring op audit updates
To: Paul Moore <paul@paul-moore.com>
References: <cover.1674682056.git.rgb@redhat.com>
 <da695bf4-bd9b-a03d-3fbc-686724a7b602@kernel.dk>
 <CAHC9VhSRbay5bEUMJngpj+6Ss=WLeRoyJaNNMip+TyTkTJ6=Lg@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAHC9VhSRbay5bEUMJngpj+6Ss=WLeRoyJaNNMip+TyTkTJ6=Lg@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Fri, 27 Jan 2023 19:49:42 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMS8yNy8yMyAxMjo0MuKAr1BNLCBQYXVsIE1vb3JlIHdyb3RlOgo+IE9uIEZyaSwgSmFuIDI3
LCAyMDIzIGF0IDEyOjQwIFBNIEplbnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4gd3JvdGU6Cj4+
IE9uIDEvMjcvMjMgMTA6MjPigK9BTSwgUmljaGFyZCBHdXkgQnJpZ2dzIHdyb3RlOgo+Pj4gQSBj
b3VwbGUgb2YgdXBkYXRlcyB0byB0aGUgaW91cmluZyBvcHMgYXVkaXQgYnlwYXNzIHNlbGVjdGlv
bnMgc3VnZ2VzdGVkIGluCj4+PiBjb25zdWx0YXRpb24gd2l0aCBTdGV2ZSBHcnViYi4KPj4+Cj4+
PiBSaWNoYXJkIEd1eSBCcmlnZ3MgKDIpOgo+Pj4gICBpb191cmluZyxhdWRpdDogYXVkaXQgSU9S
SU5HX09QX0ZBRFZJU0UgYnV0IG5vdCBJT1JJTkdfT1BfTUFEVklTRQo+Pj4gICBpb191cmluZyxh
dWRpdDogZG8gbm90IGxvZyBJT1JJTkdfT1BfKkdFVFhBVFRSCj4+Pgo+Pj4gIGlvX3VyaW5nL29w
ZGVmLmMgfCA0ICsrKy0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4+Cj4+IExvb2sgZmluZSB0byBtZSAtIHdlIHNob3VsZCBwcm9iYWJseSBhZGQg
c3RhYmxlIHRvIGJvdGggb2YgdGhlbSwganVzdAo+PiB0byBrZWVwIHRoaW5ncyBjb25zaXN0ZW50
IGFjcm9zcyByZWxlYXNlcy4gSSBjYW4gcXVldWUgdGhlbSB1cCBmb3IgNi4zLgo+IAo+IFBsZWFz
ZSBob2xkIG9mZiB1bnRpbCBJJ3ZlIGhhZCBhIGNoYW5jZSB0byBsb29rIHRoZW0gb3ZlciAuLi4K
CkkgaGF2ZW4ndCB0YWtlbiBhbnl0aGluZyB5ZXQsIGZvciB0aGluZ3MgbGlrZSB0aGlzIEkgYWx3
YXlzIGxldCBpdApzaW1tZXIgdW50aWwgcGVvcGxlIGhhdmUgaGFkIGEgY2hhbmNlIHRvIGRvIHNv
LgoKLS0gCkplbnMgQXhib2UKCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVk
aXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWF1ZGl0Cg==


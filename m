Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 98350773ABF
	for <lists+linux-audit@lfdr.de>; Tue,  8 Aug 2023 16:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691505513;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BN8O+rhBkybtwj7F53hSmh542KrGdlNksFd/3bqZC/k=;
	b=J7unXh5H3MBAnVFv6/LIDNNTOmDxhPAX0M6XRwUkJTx0x/zIRJTANGDCfkG/e2WzoFFyTL
	pye41aTJcBh70SYPbx0S2Q6f9kJH+lAjTfI2pB5JIPGKWqfmmSs0PEvCEsNK1u8A7BO002
	wHyDu7hWKXR0Ya/XsHx+fY07PrQfQ1U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-ouMKqlpAPmeYuxTzPPmTjw-1; Tue, 08 Aug 2023 10:38:30 -0400
X-MC-Unique: ouMKqlpAPmeYuxTzPPmTjw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5350F823D60;
	Tue,  8 Aug 2023 14:38:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE70D1121315;
	Tue,  8 Aug 2023 14:38:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CCB9519465A4;
	Tue,  8 Aug 2023 14:38:21 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 63EA61946A61 for <linux-audit@listman.corp.redhat.com>;
 Tue,  8 Aug 2023 14:38:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 29C27140E965; Tue,  8 Aug 2023 14:38:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21654140E962
 for <linux-audit@redhat.com>; Tue,  8 Aug 2023 14:38:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05658857A84
 for <linux-audit@redhat.com>; Tue,  8 Aug 2023 14:38:20 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-IXJAesAWPZyxesva7d-O9A-1; Tue, 08 Aug 2023 10:38:18 -0400
X-MC-Unique: IXJAesAWPZyxesva7d-O9A-1
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-583ae4818c8so62054757b3.3
 for <linux-audit@redhat.com>; Tue, 08 Aug 2023 07:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691505497; x=1692110297;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Em0u3rAwfsJ9DADQmbz8jINXwrAXQCvwsoKWZ+kvbag=;
 b=MpYnJ4Mu0i/7zJfvFs3FmKDR0ccO1o+w2UNaP3KW0CGiUNKesD747lMm4PlNDUoi59
 3kV8D+DhDsVEUYl5ysBbCbqaYFQjgioGbnk6YNgspt7Y9ZR6HyN4uth48fsW7MZRhg53
 K0xBcBA3GXLrG+GD8mXw7O51owlnRc9169ScgNd4LwwT1ahgAWTUdKhf27CUYIGulj8I
 KPQ+H++1ccrD3Tqp36od91zPlgoFe0Vwywenep9mDlrh5n5ulQH2xezdT+YLPrG5JZE8
 40XrhFh6b3Nyz/7LBF0+aUIc27JtgiMJdFFm6ppT751kjQELrkPj+bZ+cBazXoGh3qfh
 03tw==
X-Gm-Message-State: AOJu0YwefhUMfx5LBc/GUGgru55geiOI1ArPE3LenFtkRxdA+TqYXsj3
 ZabTZ5PxcfvHqqkYZi0K76L/dWJw04gjJ9fVCifO37QvZ7OLBBVz0g==
X-Google-Smtp-Source: AGHT+IGLc34aLVA9ZLIe34W64Ir8n1SwTlr71PLKuPbf1vupgTPfoQCmYXbLiBv77geHjnpKt9FR9UZG6Qiq89sY/1I=
X-Received: by 2002:a81:7741:0:b0:583:7b49:15dd with SMTP id
 s62-20020a817741000000b005837b4915ddmr13398514ywc.48.1691505497509; Tue, 08
 Aug 2023 07:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <41d03271-ff8a-9888-11de-a7f53da47328@I-love.SAKURA.ne.jp>
 <CAHC9VhSsDTyfae6f0XvYYcCRH590L1ZEqbHSM4UgUCHRGm7X_g@mail.gmail.com>
 <2155117.irdbgypaU6@x2>
 <CAHC9VhRG2aX-_ye7ZRWpZkR7rq8Op7RUVS3cMtxhF8t1bdw5oQ@mail.gmail.com>
 <6f3a90b9-b210-512a-f74a-6003aebf5c30@I-love.SAKURA.ne.jp>
In-Reply-To: <6f3a90b9-b210-512a-f74a-6003aebf5c30@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 8 Aug 2023 10:38:06 -0400
Message-ID: <CAHC9VhQPROcbN5MfS5pnNDe-YDgLTAY7W9eQkNAJU3kBH43ZEA@mail.gmail.com>
Subject: Re: [PATCH v2] TaskTracker : Simplified thread information tracker.
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
Cc: audit@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCA2OjA34oCvQU0gVGV0c3VvIEhhbmRhCjxwZW5ndWluLWtl
cm5lbEBpLWxvdmUuc2FrdXJhLm5lLmpwPiB3cm90ZToKPiBPbiAyMDIzLzA4LzA4IDU6MTMsIFBh
dWwgTW9vcmUgd3JvdGU6Cj4gPiBPbiBNb24sIEF1ZyA3LCAyMDIzIGF0IDM6MDPigK9QTSBTdGV2
ZSBHcnViYiA8c2dydWJiQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4+IE9uIE1vbmRheSwgQXVndXN0
IDcsIDIwMjMgMjo1Mzo0MCBQTSBFRFQgUGF1bCBNb29yZSB3cm90ZToKPiA+Pj4gT24gU3VuLCBB
dWcgNiwgMjAyMyBhdCA5OjA14oCvQU0gVGV0c3VvIEhhbmRhCj4gPj4+Cj4gPj4+IDxwZW5ndWlu
LWtlcm5lbEBpLWxvdmUuc2FrdXJhLm5lLmpwPiB3cm90ZToKPiA+Pj4+IFdoZW4gYW4gdW5leHBl
Y3RlZCBzeXN0ZW0gZXZlbnQgb2NjdXJzLCB0aGUgYWRtaW5pc3RyYXRvciBtYXkgd2FudCB0bwo+
ID4+Pj4gaWRlbnRpZnkgd2hpY2ggYXBwbGljYXRpb24gdHJpZ2dlcmVkIHRoZSBldmVudC4gRm9y
IGV4YW1wbGUsIHVuZXhwZWN0ZWQKPiA+Pj4+IHByb2Nlc3MgdGVybWluYXRpb24gaXMgc3RpbGwg
YSByZWFsIGNvbmNlcm4gZW5vdWdoIHRvIHdyaXRlIGFydGljbGVzCj4gPj4+PiBsaWtlIGh0dHBz
Oi8vYWNjZXNzLnJlZGhhdC5jb20vc29sdXRpb25zLzE2NTk5MyAuIFRhc2tUcmFja2VyIGlzIGEK
PiA+Pj4+IHRyaXZpYWwgTFNNIG1vZHVsZSB3aGljaCBlbWl0cyBUT01PWU8tbGlrZSBpbmZvcm1h
dGlvbiBpbnRvIHRoZSBhdWRpdAo+ID4+Pj4gbG9ncyBmb3IgYmV0dGVyIHVuZGVyc3RhbmRpbmcg
b2YgdW5leHBlY3RlZCBzeXN0ZW0gZXZlbnRzLgo+ID4+Pgo+ID4+PiBIZWxwIG1lIHVuZGVyc3Rh
bmQgd2h5IGFsbCBvZiB0aGlzIGluZm9ybWF0aW9uIGlzbid0IGFscmVhZHkgYXZhaWxhYmxlCj4g
Pj4+IHZpYSBzb21lIGNvbWJpbmF0aW9uIG9mIEF1ZGl0IGFuZCBUT01PWU8sIG9yIHNpbXBseSBh
dWRpdCBpdHNlbGY/Cj4gPj4KPiA+PiBVc3VhbGx5IHdoZW4geW91IHdhbnQgdGhpcyBraW5kIG9m
IGluZm9ybWF0aW9uLCB5b3UgYXJlIGludmVzdGlnYXRpbmcgYW4KPiA+PiBpbmNpZGVudC4gWW91
IHdvdWxkbid0IHBsYWNlIGEgc3lzY2FsbCBhdWRpdCBmb3IgZXZlcnkgZXhlY3ZlIGFuZCB0aGVu
Cj4gPj4gcmVjb25zdHJ1Y3QgdGhlIGNhbGwgY2hhaW4gZnJvbSB0aGF0LiBJbiB0aGUgY2FzZSBv
ZiBsb25nIHJ1bm5pbmcgZGFlbW9ucywKPiA+PiB0aGUgaW5mb3JtYXRpb24gY291bGQgaGF2ZSBi
ZWVuIHJvdGF0ZWQgYXdheS4gQnV0IHR5cGljYWxseSB5b3Ugd2FudCB0byBzZWUKPiA+PiB3aGF0
IHRoZSBlbnRyeSBwb2ludCBpcy4gQSBzdWRkZW4gc2hlbGwgZnJvbSBiaW5kIHdvdWxkIGJlIHN1
c3BpY2lvdXMgd2hpbGUgYQo+ID4+IHNoZWxsIGZyb20gc3NoZCBpcyBub3QuCj4gPgo+ID4gT25j
ZSBhZ2Fpbiwgd2h5IG5vdCB1c2UgdGhlIGV4aXN0aW5nIGF1ZGl0IGFuZC9vciBUT01PWU8gY2Fw
YWJpbGl0aWVzLgo+ID4KPgo+IENhbid0LCBmb3IgRmVkb3JhL1JIRUwgZG9lcyBub3QgZW5hYmxl
IFRPTU9ZTy4KPiBJIG5lZWQgYSB3YXkgdGhhdCBjYW4gYmUgdXNlZCBieSBSSEVMIHVzZXJzIHJ1
bm5pbmcgd2l0aCBzZWxpbnV4PTAuCgpXaGF0IG1ha2VzIHlvdSB0aGluayB5b3VyIGRpc3RyaWJ1
dGlvbiBvZiBjaG9pY2Ugd291bGQgZW5hYmxlIHRoaXMgbmV3CkxTTT8gIEknbSBzb3JyeSwgYnV0
IHRoaXMgc291bmRzIGxpa2UgbW9yZSBvZiBhbiBpc3N1ZSB3aXRoIHRoZQpjaG9pY2VzIG1hZGUg
YnkgYSBkaXN0cm8gcmF0aGVyIHRoYW4gc29tZXRoaW5nIG1pc3NpbmcgdXBzdHJlYW0uCgotLSAK
cGF1bC1tb29yZS5jb20KCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEBy
ZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYXVkaXQK


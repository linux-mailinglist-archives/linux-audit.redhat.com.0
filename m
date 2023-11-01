Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA9A7DDA8C
	for <lists+linux-audit@lfdr.de>; Wed,  1 Nov 2023 02:18:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698801511;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LJhv5oiBtqnzCa+rlTsivwBSWnGshmbniGNX9MOIKb4=;
	b=bCAY9e05NrgRardT15CD4st7KcOALKwSy52d7lpR2wS0+ydg0qhXD6FHWX62AXFXTdr433
	uClgrWjuCFySmMi/hRWLhozLSZnHEuDe2bT4+YIzZIaNkSwsK/8kJ/tDszNvy3uCXG5NVO
	yOx7AdqC4iRDE83u/hu3PODaV1qSd10=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619-5IJLQiv_PiyVs9e01AiBYg-1; Tue,
 31 Oct 2023 21:18:27 -0400
X-MC-Unique: 5IJLQiv_PiyVs9e01AiBYg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFAA53810B1E;
	Wed,  1 Nov 2023 01:18:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4E302E0;
	Wed,  1 Nov 2023 01:17:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CAC7219465A0;
	Wed,  1 Nov 2023 01:17:31 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DB3951946586 for <linux-audit@listman.corp.redhat.com>;
 Wed,  1 Nov 2023 01:17:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 95BBD2026D66; Wed,  1 Nov 2023 01:17:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EEB62026D4C
 for <linux-audit@redhat.com>; Wed,  1 Nov 2023 01:17:30 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69A04821938
 for <linux-audit@redhat.com>; Wed,  1 Nov 2023 01:17:30 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-PnO7_qXJOh2nT6dcYimFLg-1; Tue, 31 Oct 2023 21:17:28 -0400
X-MC-Unique: PnO7_qXJOh2nT6dcYimFLg-1
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-d9ac3b4f42cso409903276.0
 for <linux-audit@redhat.com>; Tue, 31 Oct 2023 18:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698801448; x=1699406248;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/2KRcHkADJYiB7GRi7PQMnQCUbZwXQr33FJwiqa5cFo=;
 b=VGimxoY+W7q04ujdvYLYpHOFPvdPJ5X5lhnNBP2LvJS/SMugxdAc0RCXydT1wAJ6nN
 EMDfwku5kaII2maedu9FqdIkRXtjK31wVXoEgZ4vD2rpvW1zPHWO4npZKVZLTFiOPNiy
 riU0RbkxzMV3gN0cTgZu6MiO7WMvGJmWTeuvNBLZ6Le3cbgKlrQ+HJSPI5VRhh+iLNwM
 /Y4cXbVjZNpcgeIjz7Lfpu/4dcIAg4elDGWW6N3pSPFgyVTgA0I99dcfl9P76tWENa7P
 5ad+gYmzEleek+psBbQoc74gDLD85T/+W6S0B+peKAv+6jjkj8UhTny+ASaVqE42CpRn
 jx2w==
X-Gm-Message-State: AOJu0YxOS3muVA7uk8a6arqOU/iRG0sjZw0DLVTEMb52OeTMynlC1cjF
 Ny3Hnicac72OcMwpZyLiAFKZD/wSUBKWt1vWsLB4Z1BOVXXh4jR63g==
X-Google-Smtp-Source: AGHT+IGm1l7hBr2jbqpkM2YPmPceEiWr8gBsWT2K4YbCMDHGxmolp165dw7cRGPYfowADq/ygYYAgfxZa1titphq3p8=
X-Received: by 2002:a25:d088:0:b0:da0:5707:9abb with SMTP id
 h130-20020a25d088000000b00da057079abbmr4080821ybg.29.1698801447800; Tue, 31
 Oct 2023 18:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <2179196.irdbgypaU6@x2>
In-Reply-To: <2179196.irdbgypaU6@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 31 Oct 2023 21:17:17 -0400
Message-ID: <CAHC9VhQ41T2aLHChormOzRC_bTyC0_rcLC-v4K=kZaJar36pbg@mail.gmail.com>
Subject: Re: Linux Audit Mail List
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBPY3QgMzEsIDIwMjMgYXQgNToyNOKAr1BNIFN0ZXZlIEdydWJiIDxzZ3J1YmJAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IEkgdGhpbmsgdGhlIGxpbnV4LWF1ZGl0IG1h
aWwgbGlzdCB3aWxsIGJlIHNodXRkb3duIGF0IG1pZG5pZ2h0IHRvbmlnaHQgLi4uCgpXaG9hLCB0
aGF0IHNlZW1zIHJhdGhlciBhYnJ1cHQsIGlzIHRoZSBtYWlsIHNlcnZlciBiZWluZyBzaHV0IGRv
d24/Ck9yIHNvbWV0aGluZyBlbHNlPwoKPiBUaGVyZSBhcmUgbWFpbCBhcmNoaXZlcyBzdWNoIGFz
Cj4KPiBodHRwczovL21hcmMuaW5mby8/bD1saW51eC1hdWRpdCZyPTEmdz0yCgpUaGUgbGludXgt
YXVkaXRAcmVkaGF0IGxpc3QgaXMgYWxzbyBhcmNoaXZlZCBvbiBsb3JlLmtlcm5lbC5vcmcsIGEK
bGluayB0byB0aGUgYXJjaGl2ZSBpcyBiZWxvdzoKCiogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtYXVkaXQKCklmIHRob3NlIGludGVyZXN0ZWQgaW4gdXBzdHJlYW0gdXNlcnNwYWNlIGRl
dmVsb3BtZW50IHdhbnRlZCB0bwptaWdyYXRlIHRvIHRoZSBhdWRpdEB2Z2VyIGxpc3QgSSBzZWUg
bm8gcHJvYmxlbSB3aXRoIHRoYXQsIGxpbmsgYmVsb3c6CgoqIGh0dHA6Ly92Z2VyLmtlcm5lbC5v
cmcvdmdlci1saXN0cy5odG1sI2F1ZGl0CgotLSAKcGF1bC1tb29yZS5jb20KCi0tCkxpbnV4LWF1
ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5y
ZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQK


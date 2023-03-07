Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 445476AF99B
	for <lists+linux-audit@lfdr.de>; Tue,  7 Mar 2023 23:54:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678229685;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UJwNkVTiYRXxV424/j1yg3dibSPBefNEkxzPgGni7r8=;
	b=YyXE9kGcWtcpbYSPFDlBSEpNVQY5cnshwRKu+afoJHsalYoWBTjFmfiP/mQ9dYcAvaUHPE
	5xO00qj3nInPXZkP/fOqhnxb1FQsKkHYEdC2YyOuff9lYn6Lnt9PqhNlXw3LjRhNC74IuE
	5mHvyLS5sLNq4piSvlcennECoyVFfa8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-o25j4X0VNSOrQTb9HQkKuw-1; Tue, 07 Mar 2023 17:54:41 -0500
X-MC-Unique: o25j4X0VNSOrQTb9HQkKuw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61B2B802C18;
	Tue,  7 Mar 2023 22:54:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A90B40AE20A;
	Tue,  7 Mar 2023 22:54:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 00A5A19465B5;
	Tue,  7 Mar 2023 22:54:34 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9C2171946594 for <linux-audit@listman.corp.redhat.com>;
 Tue,  7 Mar 2023 22:54:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 85B0735454; Tue,  7 Mar 2023 22:54:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E9CE18EC6
 for <linux-audit@redhat.com>; Tue,  7 Mar 2023 22:54:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EA6B2808E65
 for <linux-audit@redhat.com>; Tue,  7 Mar 2023 22:54:20 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-F-doV6PEMfudLAt6H8-gRA-1; Tue, 07 Mar 2023 17:54:18 -0500
X-MC-Unique: F-doV6PEMfudLAt6H8-gRA-1
Received: by mail-pg1-f178.google.com with SMTP id p6so8618793pga.0
 for <linux-audit@redhat.com>; Tue, 07 Mar 2023 14:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678229657;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yYURgi5OnBmevVI5kB8i+Bq0JHeWdAC6WSF1A2mhnyc=;
 b=eBJLGCm9atO208K8Bscc0iQGSuc2cjqV6ZXW4wjgw8qZwvF9hxRtYS3vqtEIHMFLEM
 YpNvqi34kaR9xpaRdJ/Ul7NsBgKDa6lnVBt766rv7WeHYo+qBgCgQ1RkT19tbC6iw/Md
 4gLi3Q3/f6bYZ9BcTyx1tCgIgNfZS1Gq9ZR37ppEM0t1VP1pSpz3Xn+KGK0vLgYnL7rr
 zeR039mPxbE2tKpgcrGF16+fKxVdYCXO3IumlumJtelwYDLqbC1x472TKeBaY0qbW01I
 VPG9LesptVomrL2pmMF/zlMuE8Q7dhumeJyIkAnf+AMJSN26AG6gYWbtgwYbYpiNRZEg
 QTgQ==
X-Gm-Message-State: AO0yUKWcEpqcrtYF7rcUu3lLuaUyEbRKXah0xwbMl5+zRjYKxYDPOO61
 rkcQrzB8EKRlvB29xgLg3svZ9+m6IMx65KApusAx8ajz/KHJwv4yHg==
X-Google-Smtp-Source: AK7set/8sZS+sKlnzX0U6YWoRb2amMaf5ZKZHVDpa7U54RD9ZV0o0S/Gd1bQTNrPIUqW8HDNxIfCFBq5QDW0IUAZf7A=
X-Received: by 2002:a63:ab42:0:b0:4fd:72f3:5859 with SMTP id
 k2-20020a63ab42000000b004fd72f35859mr5635834pgp.2.1678229657432; Tue, 07 Mar
 2023 14:54:17 -0800 (PST)
MIME-Version: 1.0
References: <CAHC9VhRMJq1gJPoR79AxM1JphmGtxhGMYBkd=Ptuaq3WBjX2Bw@mail.gmail.com>
 <12213468.O9o76ZdvQC@x2>
In-Reply-To: <12213468.O9o76ZdvQC@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 7 Mar 2023 17:54:06 -0500
Message-ID: <CAHC9VhT-MTYoSPT3GE8coNiG+6QWDdcyNZR2iUQPLb4LX8buEg@mail.gmail.com>
Subject: Re: audit userspace problems with io_uring async ops
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBNYXIgNywgMjAyMyBhdCA0OjE34oCvUE0gU3RldmUgR3J1YmIgPHNncnViYkByZWRo
YXQuY29tPiB3cm90ZToKPgo+IEhlbGxvIFBhdWwsCj4KPiBPbiBUdWVzZGF5LCBGZWJydWFyeSAy
OCwgMjAyMyA1OjA0OjA0IFBNIEVTVCBQYXVsIE1vb3JlIHdyb3RlOgo+ID4gLi4uIGlmIHlvdSBs
b29rIGNsb3NlbHkgeW91J2xsIG5vdGljZSB0aGF0IHRoZSAjMjg5IGV2ZW50ICh0aGUgYXN5bmMK
PiA+IFVSSU5HT1ApIGlzIG1pc3NpbmcgZnJvbSB0aGUgYXVzZWFyY2ggb3V0cHV0Lgo+Cj4gVGhh
bmtzIGZvciB0aGUgYnVnIHJlcG9ydC4gTGV0IG1lIGtub3cgaWYgeW91IHNlZSBhbnl0aGluZyBl
bHNlLgo+Cj4gVXBzdHJlYW0gY29tbWl0IDdkMzVlMTQgc2hvdWxkIGZpeCBwYXJzaW5nIFVSSU5H
T1AgYW5kIERNX0NUUkwgcmVjb3Jkcy4KClRoYW5rcyBTdGV2ZS4gIEknbSB3b3JraW5nIHRocm91
Z2ggdGhlIHBvc3QgbWVyZ2Ugd2luZG93IGJhdGNoIG9mCnJldmlld3MvbWVyZ2luZywgYnV0IEkn
bGwgZ2l2ZSB0aGF0IGNvbW1pdCBhIHNob3QgYW5kIGxldCB5b3Uga25vdyBob3cKaXQgZ29lcy4K
Cj4gQnR3LCBoYXMgYW55b25lIGV2ZXIgc2VlbiBhIERNX0NUUkwgcmVjb3JkPyBJIGRvbid0IHRo
aW5rIHRoZXkgYXJlIGZvbGxvd2luZyBvdXIKPiBndWlkZWxpbmVzLgoKVGhleSB3ZXJlIGFkZGVk
IGJhY2sgaW4gdGhlIHY1LjE2IHRpbWVmcmFtZToKCiogaHR0cHM6Ly93d3cucGF1bC1tb29yZS5j
b20vYmxvZy9kLzIwMjIvMDEvbGludXhfdjUxNi5odG1sCgouLi4gd2l0aCBwYXRjaGVzIGZpcnN0
IGJlaW5nIHBvc3RlZCB0byB0aGUgbGludXgtYXVkaXRAcmVkaGF0IGxpc3QgaW4KQXVndXN0IDIw
MjE6CgoqIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWF1ZGl0LzIwMjEwODEyMTQ1NzQ4
LjQ0NjAtMS1taWNoYWVsLndlaXNzQGFpc2VjLmZyYXVuaG9mZXIuZGUKCi0tIApwYXVsLW1vb3Jl
LmNvbQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20K
aHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=


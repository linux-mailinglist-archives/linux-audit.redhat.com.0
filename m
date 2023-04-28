Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 900026F1E34
	for <lists+linux-audit@lfdr.de>; Fri, 28 Apr 2023 20:49:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682707749;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sczmM8mZSQ+WR6RUQ814Hi0nT2wxP8iBoveLZWc4oyA=;
	b=ilBK6wFOInzLsxVS/W8cNzLFcsYHLN5sj4bRx/EtAAZhVvndIWCojRJwuOiA7sEOlBxKt9
	lPNBu6CeW9YlR8ZMYAI0AlOgRLTARt/vpHGMbqCv4V8G1Ab91cVVv3WaRLffzzoOoQSw3R
	t5/YmwHQcBM900wMD3VRZCXmVPYcDQk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-yuvyP9-eOpqGXH1o07x-Jw-1; Fri, 28 Apr 2023 14:49:07 -0400
X-MC-Unique: yuvyP9-eOpqGXH1o07x-Jw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 075443C0E454;
	Fri, 28 Apr 2023 18:49:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0AE7477F7F;
	Fri, 28 Apr 2023 18:48:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AED5F1946A54;
	Fri, 28 Apr 2023 18:48:57 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 48CE91946A45 for <linux-audit@listman.corp.redhat.com>;
 Fri, 28 Apr 2023 18:48:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3664A63F2D; Fri, 28 Apr 2023 18:48:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.33.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12B4B440BC;
 Fri, 28 Apr 2023 18:48:57 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: "service auditd start" fails inside a container
Date: Fri, 28 Apr 2023 14:48:56 -0400
Message-ID: <4526563.LvFx2qVVIh@x2>
Organization: Red Hat
In-Reply-To: <CABvEhECpywJRHDW6dFZU8Q3_rCZ0MpG45UQVu8fgH7ENSK37dA@mail.gmail.com>
References: <CABvEhECpywJRHDW6dFZU8Q3_rCZ0MpG45UQVu8fgH7ENSK37dA@mail.gmail.com>
MIME-Version: 1.0
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
Cc: =?utf-8?B?5rGf5p2o?= <jiangyang.me@gmail.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpZGF5LCBBcHJpbCAyOCwgMjAyMyAzOjU0OjMyIEFNIEVEVCDmsZ/mnaggd3JvdGU6Cj4g
TWF5IEkgYXNrIGlmIEF1ZGl0ZCBzdXBwb3J0cyBEb2NrZXI/IFRoYW5rIHlvdQo+IGh0dHBzOi8v
bGlzdG1hbi5yZWRoYXQuY29tL2FyY2hpdmVzL2xpbnV4LWF1ZGl0LzIwMTgtSnVseS9tc2cwMDA3
OC5odG1sCgpUaGVyZSBpcyBubyBhY3RpdmUgd29yayB0aGF0IEkga25vdyBvZiB0byBwdXQgYXVk
aXRkIGluIGEgY29udGFpbmVyLiBJdCdzIApsaWJyYXJpZXMgYXJlIHVzZWQgYnkgbWFueSBhcHBs
aWNhdGlvbnMuIFNvLCBJIGRvbid0IGtub3cgd2hhdCB1c2UgaXQgd291bGQgCmJlIHRvIGNvbnRh
aW5lcml6ZSBpdC4KCkFuZCBpZiB5b3UgYXJlIGFza2luZyBpZiBhdWRpdGQgY2FuIGF1ZGl0IGV2
ZW50cyBpbiBhIGNvbnRhaW5lciwgSSB0aGluayB0aGF0IAphbnN3ZXIgaXMgYWxzbyBuby4KCi1T
dGV2ZQoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29t
Cmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQK


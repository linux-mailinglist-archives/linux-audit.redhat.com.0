Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F15526ACEDE
	for <lists+linux-audit@lfdr.de>; Mon,  6 Mar 2023 21:08:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678133286;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W16NjwmY67yYaz3qSycvEy9ebSR8kL2E9GtyTG4794U=;
	b=eTL6zrIBpXsm2RrwDNxf4wRaWsoiucjXFyjf5v8zoiqtVmpIqiGCxdv+kHYHyRHRJV70WG
	nyaz2Kb972lOcJ7fMYCGjDEQBVYoSitUofq1cPszNzHC+jgqDm6wTj8SoiD/cPcQ2BSc8w
	1jjuuIsDbndNhl9rbod+iXiHcY+rgVI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-JH0TzGK5O0GgNQjTKa7cOg-1; Mon, 06 Mar 2023 15:08:05 -0500
X-MC-Unique: JH0TzGK5O0GgNQjTKa7cOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D5B02807D6A;
	Mon,  6 Mar 2023 20:08:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC93744101;
	Mon,  6 Mar 2023 20:07:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8DC5019465A2;
	Mon,  6 Mar 2023 20:07:53 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8572C1946589 for <linux-audit@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 20:07:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3E50D175AD; Mon,  6 Mar 2023 20:07:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36E5A51FF
 for <linux-audit@redhat.com>; Mon,  6 Mar 2023 20:07:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1871A802D2A
 for <linux-audit@redhat.com>; Mon,  6 Mar 2023 20:07:52 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-fe9r5jlJPlyz7r5hkbDSmw-1; Mon, 06 Mar 2023 15:07:50 -0500
X-MC-Unique: fe9r5jlJPlyz7r5hkbDSmw-1
Received: by mail-pg1-f181.google.com with SMTP id y19so6308360pgk.5
 for <linux-audit@redhat.com>; Mon, 06 Mar 2023 12:07:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678133269;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rx437f3rR3V4aXYv/9y2Q0MpzwPfOUkCgUF2FXSEWKk=;
 b=qCqJKu6luqwE4t7iQBgVAuy5/atLJKkx3/Wpe+9dHMQWDB8WMKHLfJF7rZwushYRc3
 g1HwLmQlEV9nQ7gxEW+VR9poIs8+YafjdkELa1nxukPG5Y15pqYwexh15WWnyer6b214
 fgUOc+hv2m5VhHhcml+KhVl9+xBHREP6z+iXSd/xQfWWuXd9Oxb7G5XK+dbmnsMsv5m6
 jhXCctWwRm1tCXyDe0/zL7wWVe2f5rva2KNCQsgDtAPzkhLLd1u9OieeWMym3v/7SPUt
 c5OZD6Ccxtwq9ZFkvuCKJpj1ox1GduxetviEhzf8bWs9z+k6K4qZhs0jvqFzHfOdTDnE
 gRZA==
X-Gm-Message-State: AO0yUKU84sViWaHf14H+rTCMWpYvrTcOlEgPTz1fFaAlLvP8NhtK76gd
 yBnEKvvxcl7IwYCkToMpDkEAI28bGxsWjD61Ek8/u5R76BI57Co=
X-Google-Smtp-Source: AK7set8BCG57y0ysUjZfcnDXC4d1zFzLlsAYhAPjmsSvvsp6GnerdzLFbe2kFwZagaYy/2eiQFZ+TtT9geoMfwdlOJ0=
X-Received: by 2002:a63:7f1a:0:b0:4d9:8f44:e1d7 with SMTP id
 a26-20020a637f1a000000b004d98f44e1d7mr4319745pgd.4.1678133269001; Mon, 06 Mar
 2023 12:07:49 -0800 (PST)
MIME-Version: 1.0
References: <CAHC9VhRMJq1gJPoR79AxM1JphmGtxhGMYBkd=Ptuaq3WBjX2Bw@mail.gmail.com>
In-Reply-To: <CAHC9VhRMJq1gJPoR79AxM1JphmGtxhGMYBkd=Ptuaq3WBjX2Bw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 6 Mar 2023 15:07:37 -0500
Message-ID: <CAHC9VhRUGKcJrOh4G_aUk3B9xZxZfjwZYDDsDfvF3pcxAjp_uA@mail.gmail.com>
Subject: Re: audit userspace problems with io_uring async ops
To: linux-audit@redhat.com, "sgrubb@redhat.com" <sgrubb@redhat.com>
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBGZWIgMjgsIDIwMjMgYXQgNTowNOKAr1BNIFBhdWwgTW9vcmUgPHBhdWxAcGF1bC1t
b29yZS5jb20+IHdyb3RlOgo+Cj4gSGkgYWxsLAo+Cj4gV2UganVzdCByZWNlbnRseSBzdGFydGVk
IHBpY2tpbmcgdXAgYXVkaXQtdGVzdHN1aXRlIGZhaWx1cmVzIHdpdGggdGhlCj4gbGF0ZXN0IHVw
c3RyZWFtIGtlcm5lbHMgYW5kIEkgdHJhY2tlZCBpdCBkb3duIHRvIGEgY2hhbmdlIGluIGhvdyB0
aGUKPiBJT1JJTkdfT1BfT1BFTkFUIG9wZXJhdGlvbiBpcyBoYW5kbGVkLCBhbmQgaG93IFN0ZXZl
J3MgYXVkaXQgdXNlcnNwYWNlCj4gZGlzcGxheXMgYXN5bmMgaW9fdXJpbmcgb3BzLiAgSXQgYXBw
ZWFycyB0aGF0IHdoZW4gYXVzZWFyY2ggaXMgdXNlZCB0bwo+IGxvb2sgZm9yIGV2ZW50cyBpdCBk
b2Vzbid0IGRpc3BsYXkgYXN5bmMgaW9fdXJpbmcgZXZlbnRzIChVUklOR09QCj4gcmVjb3Jkcy9l
dmVudHMgd2l0aG91dCBhbiBhc3NvY2lhdGVkIFNZU0NBTEwgcmVjb3JkL2V2ZW50KS4gIFRha2Ug
dGhlCj4gZm9sbG93aW5nIHNuaXBwZXQgZnJvbSAvdmFyL2xvZy9hdWRpdC9hdWRpdC5sb2cgLi4u
CgpIaSBTdGV2ZSwKCkJlZm9yZSBJIHN0YXJ0IHdvcmtpbmcgYXJvdW5kIHRoaXMgaW4gdGhlIGF1
ZGl0LXRlc3RzdWl0ZSBJIGp1c3QKd2FudGVkIHRvIGNoZWNrIGFuZCBzZWUgaWYgeW91IGFscmVh
ZHkgaGFkIGEgZml4IGZvciBhdXNlYXJjaD8KCi0tIApwYXVsLW1vb3JlLmNvbQoKLS0KTGludXgt
YXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFu
LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=


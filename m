Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 063156F7202
	for <lists+linux-audit@lfdr.de>; Thu,  4 May 2023 20:41:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683225672;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sOAtg+bhyBbw8EXdPRqDIYLaK0chFAzu5dd7WXwavB0=;
	b=StghryI82EOsxNGY5bGh4ORs3LhahFSTY+f0LYO/lAYz6945fy/stUSjYHevPIYpDNvgPT
	t6b7efVGSFEyBOD9vThwNcy1iMRNqFNaNvWnydu+QrYDAAWvjdeW0Y/4wBrAs1Fm6nVwTI
	wjl6ggh4KkAiDiptpXC3/ZnZz/rGAIo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-G0nG5x6qP2OQJymTNepfvQ-1; Thu, 04 May 2023 14:41:09 -0400
X-MC-Unique: G0nG5x6qP2OQJymTNepfvQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF2EE3C0CEFF;
	Thu,  4 May 2023 18:41:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5E442027043;
	Thu,  4 May 2023 18:41:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 177F31946A4A;
	Thu,  4 May 2023 18:41:03 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ED2AC19465BB for <linux-audit@listman.corp.redhat.com>;
 Thu,  4 May 2023 18:41:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D71F040BC79B; Thu,  4 May 2023 18:41:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D059240BC799
 for <linux-audit@redhat.com>; Thu,  4 May 2023 18:41:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B164D3806649
 for <linux-audit@redhat.com>; Thu,  4 May 2023 18:41:01 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-d5rmObUdNSq89-ZqT9RLOg-1; Thu, 04 May 2023 14:40:59 -0400
X-MC-Unique: d5rmObUdNSq89-ZqT9RLOg-1
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-b9a6f17f2b6so10309280276.1
 for <linux-audit@redhat.com>; Thu, 04 May 2023 11:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683225659; x=1685817659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c9xdhwUAnQWSOiwrZeQw6aoX3Gy+eNLBtGfDo4KMXaY=;
 b=OjttrkM/61JmFwQdLr4PRR91OTsNOWefE17IuQSGZyA7TQbslLteRutLobCVezvvmq
 YcGo1ifZ53VnCMyT8z1CI+pMJAJxs9z8lkJ8Ku+0VPxUtmOugows+BK28p6J2d4yateJ
 i2TU/P22bH33c8Y5fruobGxF/gcXJHXJ+3dGu1+ECUgwnPdEbq0Jrbv4w/x6vxc5fNVX
 1gVDE45KfPHnYLbBomfQfwG+ZwRPyOWLIu/45cs/EpvSa9VR9O3FrKwVsa6W3cRVp0gg
 rALgTujeBjHYNJ1uGZXxlfABDaMS05cQH7iD2JWNoJuYerG0EKb/6dqeGMVuFCGVrcnM
 wmnA==
X-Gm-Message-State: AC+VfDwadPs79XvAAnuqlJKwaoRqkjeCFlsXmeCuilhS0c6olZRO+6Ju
 ukyNkcIVhjf8nqSSrMd6BkaSHWQVGccVetUD7f4MgE5G6+tic2tAHQ==
X-Google-Smtp-Source: ACHHUZ580oimtnPGGVNllOaIowynCQqC408i0OYmqbn0PN9cueyS7S+NjBcjgqJJZQDVIzbHB6SByrwfsP+907qqOvg=
X-Received: by 2002:a81:1445:0:b0:55d:6a47:f3e1 with SMTP id
 66-20020a811445000000b0055d6a47f3e1mr3146303ywu.17.1683225659305; Thu, 04 May
 2023 11:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <ecd4bf68-3bf1-a1d8-4da5-5fbd28c51a6b@gmail.com>
 <CAHC9VhTXHLS7bsDJ8-dSp4dQSQRcKRLiTMRYJOJVCY11G5D85A@mail.gmail.com>
 <e5713a91-37b0-d32f-a0d2-eb668122c9e4@gmail.com>
 <9ae2c1df-1f20-a40b-35ed-1dc76b122a4f@I-love.SAKURA.ne.jp>
In-Reply-To: <9ae2c1df-1f20-a40b-35ed-1dc76b122a4f@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 4 May 2023 14:40:48 -0400
Message-ID: <CAHC9VhTfxqrWaJrBccDY9LJR+Fggr__zufD-Wd=0VZwN5bBU6g@mail.gmail.com>
Subject: Re: Can AUDIT_LIST_RULES causes kthreadd-spam?
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
Cc: Rinat Gadelshin <rgadelsh@gmail.com>, linux-audit@redhat.com,
 audit@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBNYXkgMywgMjAyMyBhdCAxMDo1MOKAr1BNIFRldHN1byBIYW5kYQo8cGVuZ3Vpbi1r
ZXJuZWxAaS1sb3ZlLnNha3VyYS5uZS5qcD4gd3JvdGU6Cj4gT24gMjAyMy8wNS8wNCA3OjEyLCBS
aW5hdCBHYWRlbHNoaW4gd3JvdGU6Cj4gPiBPbiAwNC4wNS4yMDIzIDAwOjI3LCBQYXVsIE1vb3Jl
IHdyb3RlOgo+ID4+IENhbiB5b3UgYmUgbW9yZSBzcGVjaWZpYyBhYm91dCB0aGUga2VybmVsIHRo
cmVhZHMgeW91IGFyZSBzZWVpbmcsIGFyZQo+ID4+IHlvdSBzZWVpbmcgbXVsdGlwbGUgImthdWRp
dGQiIHRocmVhZHM/Cj4gPj4KPiA+PiAlIHBzIC1mQyBrYXVkaXRkCj4gPj4gVUlEICAgICAgICAg
IFBJRCAgICBQUElEICBDIFNUSU1FIFRUWSAgICAgICAgICBUSU1FIENNRAo+ID4+IHJvb3QgICAg
ICAgICAgODkgICAgICAgMiAgMCBBcHIyOCA/ICAgICAgICAwMDowMDowMCBba2F1ZGl0ZF0KPgo+
IEkgZG9uJ3QgdGhpbmsgc28uCj4KPiBrZXJuZWwgYXVkaXQgc3Vic3lzdGVtIHVzZXMga3RocmVh
ZF9ydW4oKSBpbiBvcmRlciB0byBydW4gc2hvcnQtbGl2ZWQga2VybmVsIHRocmVhZHMuCgpUaGFu
a3MgVGV0c3VvLCBJIGFncmVlIHRoYXQncyBmYXIgbW9yZSBsaWtlbHkuICBFdmVyIHNpbmNlIEkg
dG9vayBvdmVyCnNoZXBoZXJkaW5nIHRoZSBhdWRpdCBjb2RlLCBhbGwgb2YgdGhlIHRocmVhZCBp
c3N1ZXMgaGF2ZSBiZWVuIGFyb3VuZAp0aGUgbWFpbiBhdWRpdCBxdWV1ZSB0aHJlYWQgc28gaXQn
cyBhIGJpdCByZWZsZXhpdmUgdG8gYXNzdW1lIHRoYXQgaXMKdGhlIGNhc2UgOikKCi0tIApwYXVs
LW1vb3JlLmNvbQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhh
dC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1h
dWRpdAo=


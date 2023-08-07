Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9035877302E
	for <lists+linux-audit@lfdr.de>; Mon,  7 Aug 2023 22:13:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691439223;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gC94h/I+fYlS4i1waAYNWWEN5muJcPGnFzqi6acqqSU=;
	b=R0EaqEu0dFql8A/RfWHaLLrlpP235xcebk7ddUXRxU195gjYXx1jtWtTdLGHbviv4QVDLz
	IjhOmir0gHSmyo24ECxa3g4I86OaI3/rdp3QSdhDnYr1CVODcLZSjygKNgEvyCKU1hP13f
	OnZ41JzgS2LOzat2ZA22yUTvXfR7ctY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-NxmdfHTUNweabdAslcu0kQ-1; Mon, 07 Aug 2023 16:13:40 -0400
X-MC-Unique: NxmdfHTUNweabdAslcu0kQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 541F6185A78B;
	Mon,  7 Aug 2023 20:13:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E98DC1121315;
	Mon,  7 Aug 2023 20:13:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8AF931946594;
	Mon,  7 Aug 2023 20:13:31 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 10DCB1946586 for <linux-audit@listman.corp.redhat.com>;
 Mon,  7 Aug 2023 20:13:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A6E4E40D283C; Mon,  7 Aug 2023 20:13:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F33C40D2839
 for <linux-audit@redhat.com>; Mon,  7 Aug 2023 20:13:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E6FB3C02B74
 for <linux-audit@redhat.com>; Mon,  7 Aug 2023 20:13:29 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-e6OaXLwzNsuUhCeKLa5_XQ-1; Mon, 07 Aug 2023 16:13:28 -0400
X-MC-Unique: e6OaXLwzNsuUhCeKLa5_XQ-1
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-583fe10bb3cso56424537b3.2
 for <linux-audit@redhat.com>; Mon, 07 Aug 2023 13:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691439207; x=1692044007;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2BSiKRKC9HfnpxyZNhhglUB5KhJQ++JbCDmWfWXMqA0=;
 b=eRx0TBcYER6xNK10tp2DVUbBeL4Sb0Uhobs5TWzCxP5meU6taAtyU++CV4eJwreOFv
 LeA3ZNB9ZCwhy33Hwctmv7nwMYe0hl83BGsKB7v5eghCdX1+yIeM9iqgGMxbkSthHWRs
 /gIed9++gZlxEIrH7QOby71Rwk3Ck4VEcDD0+LchBE4A/E1yuhtRZ0I9ZjGhDdR1jf82
 oCeFXwTTmjoJ5PB50ClcbhkrrtabnPMuXs169vgCAQMwkPI9bpjR02uePa77uiEBzk1u
 LbT85sE6nIPlP8NSwsNL90JC6JcfXxcR4tfb8oxQ/my7rCFmC6PxukX78QOk5cNuo+Dz
 chNw==
X-Gm-Message-State: AOJu0YwHRQ6YwGF+w6+gptRUDt+SP3OvZLnB1HsH155cKQ8tiQgDhXUw
 ekP4uHqAIAC6j79mNMFdClygP+M4rb1A791IbaL9
X-Google-Smtp-Source: AGHT+IEDEy77xCD9qkQ07ozj1FNjsVU9wqnTnVkAMARkmSMMoED2HhOM4oxaUbEi/gP5JDTBkKCj1fGsjl7m7EssEJI=
X-Received: by 2002:a0d:ff84:0:b0:573:30c8:6e1d with SMTP id
 p126-20020a0dff84000000b0057330c86e1dmr12665460ywf.44.1691439207362; Mon, 07
 Aug 2023 13:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <41d03271-ff8a-9888-11de-a7f53da47328@I-love.SAKURA.ne.jp>
 <CAHC9VhSsDTyfae6f0XvYYcCRH590L1ZEqbHSM4UgUCHRGm7X_g@mail.gmail.com>
 <2155117.irdbgypaU6@x2>
In-Reply-To: <2155117.irdbgypaU6@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 7 Aug 2023 16:13:16 -0400
Message-ID: <CAHC9VhRG2aX-_ye7ZRWpZkR7rq8Op7RUVS3cMtxhF8t1bdw5oQ@mail.gmail.com>
Subject: Re: [PATCH v2] TaskTracker : Simplified thread information tracker.
To: Steve Grubb <sgrubb@redhat.com>
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

T24gTW9uLCBBdWcgNywgMjAyMyBhdCAzOjAz4oCvUE0gU3RldmUgR3J1YmIgPHNncnViYkByZWRo
YXQuY29tPiB3cm90ZToKPiBPbiBNb25kYXksIEF1Z3VzdCA3LCAyMDIzIDI6NTM6NDAgUE0gRURU
IFBhdWwgTW9vcmUgd3JvdGU6Cj4gPiBPbiBTdW4sIEF1ZyA2LCAyMDIzIGF0IDk6MDXigK9BTSBU
ZXRzdW8gSGFuZGEKPiA+Cj4gPiA8cGVuZ3Vpbi1rZXJuZWxAaS1sb3ZlLnNha3VyYS5uZS5qcD4g
d3JvdGU6Cj4gPiA+IFdoZW4gYW4gdW5leHBlY3RlZCBzeXN0ZW0gZXZlbnQgb2NjdXJzLCB0aGUg
YWRtaW5pc3RyYXRvciBtYXkgd2FudCB0bwo+ID4gPiBpZGVudGlmeSB3aGljaCBhcHBsaWNhdGlv
biB0cmlnZ2VyZWQgdGhlIGV2ZW50LiBGb3IgZXhhbXBsZSwgdW5leHBlY3RlZAo+ID4gPiBwcm9j
ZXNzIHRlcm1pbmF0aW9uIGlzIHN0aWxsIGEgcmVhbCBjb25jZXJuIGVub3VnaCB0byB3cml0ZSBh
cnRpY2xlcwo+ID4gPiBsaWtlIGh0dHBzOi8vYWNjZXNzLnJlZGhhdC5jb20vc29sdXRpb25zLzE2
NTk5MyAuIFRhc2tUcmFja2VyIGlzIGEKPiA+ID4gdHJpdmlhbCBMU00gbW9kdWxlIHdoaWNoIGVt
aXRzIFRPTU9ZTy1saWtlIGluZm9ybWF0aW9uIGludG8gdGhlIGF1ZGl0Cj4gPiA+IGxvZ3MgZm9y
IGJldHRlciB1bmRlcnN0YW5kaW5nIG9mIHVuZXhwZWN0ZWQgc3lzdGVtIGV2ZW50cy4KPiA+Cj4g
PiBIZWxwIG1lIHVuZGVyc3RhbmQgd2h5IGFsbCBvZiB0aGlzIGluZm9ybWF0aW9uIGlzbid0IGFs
cmVhZHkgYXZhaWxhYmxlCj4gPiB2aWEgc29tZSBjb21iaW5hdGlvbiBvZiBBdWRpdCBhbmQgVE9N
T1lPLCBvciBzaW1wbHkgYXVkaXQgaXRzZWxmPwo+Cj4gVXN1YWxseSB3aGVuIHlvdSB3YW50IHRo
aXMga2luZCBvZiBpbmZvcm1hdGlvbiwgeW91IGFyZSBpbnZlc3RpZ2F0aW5nIGFuCj4gaW5jaWRl
bnQuIFlvdSB3b3VsZG4ndCBwbGFjZSBhIHN5c2NhbGwgYXVkaXQgZm9yIGV2ZXJ5IGV4ZWN2ZSBh
bmQgdGhlbgo+IHJlY29uc3RydWN0IHRoZSBjYWxsIGNoYWluIGZyb20gdGhhdC4gSW4gdGhlIGNh
c2Ugb2YgbG9uZyBydW5uaW5nIGRhZW1vbnMsCj4gdGhlIGluZm9ybWF0aW9uIGNvdWxkIGhhdmUg
YmVlbiByb3RhdGVkIGF3YXkuIEJ1dCB0eXBpY2FsbHkgeW91IHdhbnQgdG8gc2VlCj4gd2hhdCB0
aGUgZW50cnkgcG9pbnQgaXMuIEEgc3VkZGVuIHNoZWxsIGZyb20gYmluZCB3b3VsZCBiZSBzdXNw
aWNpb3VzIHdoaWxlIGEKPiBzaGVsbCBmcm9tIHNzaGQgaXMgbm90LgoKT25jZSBhZ2Fpbiwgd2h5
IG5vdCB1c2UgdGhlIGV4aXN0aW5nIGF1ZGl0IGFuZC9vciBUT01PWU8gY2FwYWJpbGl0aWVzLgoK
LS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVk
aXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWF1ZGl0Cg==


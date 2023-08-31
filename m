Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4435F78EFA9
	for <lists+linux-audit@lfdr.de>; Thu, 31 Aug 2023 16:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693492761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PwjyJBysZbZx44YtoxDvZH7Z/bZnIzMuokg6DaHWhds=;
	b=F3f52FYsWfegSFNIyf1h6WH5+HQM3+lyJCuSK3M9hGLDMq6A5UGDW4fNcUGcMLHbLV9oQ/
	AwKpuxBO0+/HQ40UsDMGfD5YHCfqPhJY4BOsjU7IWIqcM6uQ5qRapopro6I5gCzOg7Cri7
	Tk4qaCicN5ORBw3Zl+b4TvEOOQs90H0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-L1viC9KiP4CzEIHckj6p7g-1; Thu, 31 Aug 2023 10:39:20 -0400
X-MC-Unique: L1viC9KiP4CzEIHckj6p7g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D1E6381AE55;
	Thu, 31 Aug 2023 14:39:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6879B492C13;
	Thu, 31 Aug 2023 14:39:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5699719465B7;
	Thu, 31 Aug 2023 14:39:09 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6F9B91946587 for <linux-audit@listman.corp.redhat.com>;
 Thu, 31 Aug 2023 14:39:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 11D6C40D283A; Thu, 31 Aug 2023 14:39:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F279040D2839
 for <linux-audit@redhat.com>; Thu, 31 Aug 2023 14:39:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6E56185A7AB
 for <linux-audit@redhat.com>; Thu, 31 Aug 2023 14:39:07 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-i18YVcTfNiuxSTXO1R8l0g-1; Thu, 31 Aug 2023 10:39:05 -0400
X-MC-Unique: i18YVcTfNiuxSTXO1R8l0g-1
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-594ebdf7bceso10491817b3.2
 for <linux-audit@redhat.com>; Thu, 31 Aug 2023 07:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693492745; x=1694097545;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tLZrBGnLZs2pRE/KvifoHn+CI1rpeJi7JyyHMepmqgM=;
 b=h29+L1aph1N4IMYVdOSqChQCxMGbVDTeSg/ZGW6y0XLrOEglUmFfrKVGnZXK/1whtC
 9PqDq9LqN31YNzuPyPQ13sAaooYr3XaG7h43yFiuU319q+7YBd0gvF/wYqGy9hb+oqyd
 TWtnAXAqXjgEGRRaAmpETHY1F48S4CMUcYqEzDPKb5Gtw/drH62LV6AFfOvK6BFTTedW
 x2+I7/qSE9tyKAgCTK9GFopUg8YyKBAVOxjVEawibIzwKP53/zG5kEKmIjfoxy8QXr+r
 resqvCDGYzAg4ZlAe1mjPXUX4xyRKTqjkWtlPbcR9bs72tAkKG3eIesFRkcVwDSdH/aK
 U6YQ==
X-Gm-Message-State: AOJu0Yxq79rd37njTsCeiM2wUJE2k1UcLCGOzgH5EB8N0o9j7MRmiGFK
 NIOCjx6LzEZzsKEsZnt7ctgzmA6aP1MOegzhJtwl
X-Google-Smtp-Source: AGHT+IGlvktnyds773cVOckzfrRiCq9Hr2UGcPh7WhbuB2zn1wCLypOEdnosfpZzT+35z4FMVFwhUXHkoDfzjbfWDDs=
X-Received: by 2002:a0d:e606:0:b0:595:973:b4b5 with SMTP id
 p6-20020a0de606000000b005950973b4b5mr6195696ywe.12.1693492745139; Thu, 31 Aug
 2023 07:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <202308301248.hEwyeVEl-lkp@intel.com>
 <CAHC9VhQZFZTaXb_S5YCy9KniVfPBmEQrY74_dMi5cBftZsrwNg@mail.gmail.com>
 <4d8308622a1513099fe461ed41409c3768d95946.camel@intel.com>
In-Reply-To: <4d8308622a1513099fe461ed41409c3768d95946.camel@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 31 Aug 2023 10:38:54 -0400
Message-ID: <CAHC9VhTjb8E0GUVNbdbgR2wzbXaGYFYZ6gNSMns+TF1muRA3+A@mail.gmail.com>
Subject: Re: [pcmoore-audit:main 1/1] README.orig: warning: ignored by one of
 the .gitignore files
To: "Liu, Yujie" <yujie.liu@intel.com>
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
Cc: "audit@vger.kernel.org" <audit@vger.kernel.org>,
 "linux-audit@redhat.com" <linux-audit@redhat.com>, lkp <lkp@intel.com>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBBdWcgMzEsIDIwMjMgYXQgNTozM+KAr0FNIExpdSwgWXVqaWUgPHl1amllLmxpdUBp
bnRlbC5jb20+IHdyb3RlOgo+IE9uIFdlZCwgMjAyMy0wOC0zMCBhdCAxMDoyOSAtMDQwMCwgUGF1
bCBNb29yZSB3cm90ZToKPiA+IEkgaGF2ZSBubyBpZGVhIGlmIHRoZXJlIGlzIGEgcGVyc29uIGF0
dGFjaGVkIHRvIGFueSBvZiB0aGUgYWRkcmVzc2VzCj4gPiBvbiB0aGUgVG8gbGluZSBhYm92ZSwg
YnV0IHBsZWFzZSBzZW5kIGF1ZGl0IGtlcm5lbCBpc3N1ZXMgdG8KPiA+IGF1ZGl0QHZnZXIua2Vy
bmVsLm9yZyBhbmQgbm90IGxpbnV4LWF1ZGl0QHJlZGhhdC5jb20uCj4KPiBTb3JyeSBmb3IgdGhl
IGluY29udmVuaWVuY2UuIFdlJ3ZlIHVwZGF0ZWQgdGhlIGJvdCdzIGVtYWlsCj4gY29uZmlndXJh
dGlvbiB0byBzZW5kIGF1ZGl0LXJlbGF0ZWQgcmVwb3J0cyB0byBhdWRpdEB2Z2VyLmtlcm5lbC5v
cmcuCgpHcmVhdCwgdGhhbmsgeW91IQoKLS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRp
dCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2161C78E4BA
	for <lists+linux-audit@lfdr.de>; Thu, 31 Aug 2023 04:27:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693448844;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jQH/TprKTulAfGTbRPkgAFywplf5DgBo9qjkH1vqeq0=;
	b=RV8QgSG/0mvL6SuYOrUTJFIWECeE+a9h7+FHDmnna2THKP79MI0SoEmm+x3ITdMB/AEBoZ
	JpMFsPpxVgLCLyDHH3J1oEAStwIQj8CEI2CADlgKuF2+rhUqTBAOh4xLG8ZbMxzlgvVKSf
	8FsrZrgMdcffVcAF0MvxhBwEQvK+9zE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-02Tky3_4MViQHYI1sATwJw-1; Wed, 30 Aug 2023 22:27:20 -0400
X-MC-Unique: 02Tky3_4MViQHYI1sATwJw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EF04800D9C;
	Thu, 31 Aug 2023 02:27:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5ACE140316A;
	Thu, 31 Aug 2023 02:27:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EA93819452C2;
	Thu, 31 Aug 2023 02:27:15 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 894AA1946589 for <linux-audit@listman.corp.redhat.com>;
 Thu, 31 Aug 2023 02:27:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 64C062026D3F; Thu, 31 Aug 2023 02:27:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CBBD2026D35
 for <linux-audit@redhat.com>; Thu, 31 Aug 2023 02:27:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 416CD80027F
 for <linux-audit@redhat.com>; Thu, 31 Aug 2023 02:27:14 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-dCHK-I7YPVGiPPAmzyksqw-1; Wed, 30 Aug 2023 22:27:12 -0400
X-MC-Unique: dCHK-I7YPVGiPPAmzyksqw-1
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-58dce1f42d6so21171627b3.0
 for <linux-audit@redhat.com>; Wed, 30 Aug 2023 19:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693448831; x=1694053631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UxPIrfMOSgJoCJ0abPoHMU83KuuFZMtAqB1RmHO2mPk=;
 b=jNNa88Hb3bqfcE3oQBeJ2Zh/KB25PBQ43O6jjF+66OpYvm+aX3EHuonpyU8R9YwCmf
 HNHso7kH47e4wqlh/lbngaIKnPVowjzF9UEEU78Bc9Rwklk/JevrTda6nBl/5WoVmmvn
 rPb4oD5jI9YzfVApjAVpuCEYOo6qu+i/z98crcooO+75TcxCaxW/3QCXsKTmzfHuCyzF
 WnI7ELVpk+sD+hPUShSSlsms7loc2lHO1ELWMwjgOXPdPRg4ueVER1ujx1DcdZM8wD92
 BAgz+uLhnpZdZXez1+Ria2cxSlazlJOFfurEPZ2EpeCjeOLhtAGdYsKHNHiYbgQuMSXC
 xcag==
X-Gm-Message-State: AOJu0YwmnT7DBE9DO6DbPKZ/E+S2SiVhWwX5YGe2I/SAR9z8tSCEaJsf
 Qe5uXksRQse6roNgtEQry0andqHE3pYJk6OZS9GW
X-Google-Smtp-Source: AGHT+IGFBWfHD3oP8mUz0d73L6lvJ9J4UgM6Xhhr2BsahXYXIcJCnWEaHwUQIoSgHhkng/j4tXkRAiU49y5Cbd/KUb8=
X-Received: by 2002:a81:8547:0:b0:56c:e480:2b2b with SMTP id
 v68-20020a818547000000b0056ce4802b2bmr1364155ywf.12.1693448831752; Wed, 30
 Aug 2023 19:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230829175158.20202-1-phil@nwl.cc>
 <20230829175158.20202-2-phil@nwl.cc>
In-Reply-To: <20230829175158.20202-2-phil@nwl.cc>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 30 Aug 2023 22:27:01 -0400
Message-ID: <CAHC9VhTMMp6Xsc2phTqx9T4h9VQ-ZK4mfa_+RTmOBN-8CBgnng@mail.gmail.com>
Subject: Re: [nf PATCH 2/2] netfilter: nf_tables: Audit log rule reset
To: Phil Sutter <phil@nwl.cc>, Pablo Neira Ayuso <pablo@netfilter.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: Richard Guy Briggs <rgb@redhat.com>, audit@vger.kernel.org,
 linux-audit@redhat.com, netfilter-devel@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBBdWcgMjksIDIwMjMgYXQgMjoyNOKAr1BNIFBoaWwgU3V0dGVyIDxwaGlsQG53bC5j
Yz4gd3JvdGU6Cj4KPiBSZXNldHRpbmcgcnVsZXMnIHN0YXRlZnVsIGRhdGEgaGFwcGVucyBvdXRz
aWRlIG9mIHRoZSB0cmFuc2FjdGlvbiBsb2dpYywKPiBzbyAnZ2V0JyBhbmQgJ2R1bXAnIGhhbmRs
ZXJzIGhhdmUgdG8gZW1pdCBhdWRpdCBsb2cgZW50cmllcyB0aGVtc2VsdmVzLgo+Cj4gQ2M6IFJp
Y2hhcmQgR3V5IEJyaWdncyA8cmdiQHJlZGhhdC5jb20+Cj4gRml4ZXM6IDhkYWE4ZmRlM2ZjM2Yg
KCJuZXRmaWx0ZXI6IG5mX3RhYmxlczogSW50cm9kdWNlIE5GVF9NU0dfR0VUUlVMRV9SRVNFVCIp
Cj4gU2lnbmVkLW9mZi1ieTogUGhpbCBTdXR0ZXIgPHBoaWxAbndsLmNjPgo+IC0tLQo+ICBpbmNs
dWRlL2xpbnV4L2F1ZGl0LmggICAgICAgICB8ICAxICsKPiAga2VybmVsL2F1ZGl0c2MuYyAgICAg
ICAgICAgICAgfCAgMSArCj4gIG5ldC9uZXRmaWx0ZXIvbmZfdGFibGVzX2FwaS5jIHwgMTggKysr
KysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoKU2Vl
IG15IGNvbW1lbnRzIGluIHBhdGNoIDEvMi4KCkFja2VkLWJ5OiBQYXVsIE1vb3JlIDxwYXVsQHBh
dWwtbW9vcmUuY29tPgoKLS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWlsaW5n
IGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


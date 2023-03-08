Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4AB6B0FB1
	for <lists+linux-audit@lfdr.de>; Wed,  8 Mar 2023 18:04:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678295091;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rJf/wXDBWohXFuTX8fCeWHrGUix1eac/IQYn64xuja8=;
	b=eOzpDDCmU4uX7PzDPtrgCPr/wcAJfSqMqY0ixCeahk1fBqwTodyU5SQGyeZPuTvo+9MQKM
	D0AIk6b4q2IKKYyXIPWpHhoKM7OTxqaFrbBQKkSXzBjcJkJnmCZJgjH1k2iQxwllwhqOoe
	F98plNNTh47kHUFnVGq/vJ0rN/ySvQk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-uQbO5_V4OPC9uxCod4wjVQ-1; Wed, 08 Mar 2023 12:04:47 -0500
X-MC-Unique: uQbO5_V4OPC9uxCod4wjVQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2077018A6462;
	Wed,  8 Mar 2023 17:04:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C1384492B01;
	Wed,  8 Mar 2023 17:04:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A56551946A44;
	Wed,  8 Mar 2023 17:04:33 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1E75A19465B5 for <linux-audit@listman.corp.redhat.com>;
 Wed,  8 Mar 2023 17:04:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B8ED314171C3; Wed,  8 Mar 2023 17:04:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1A9C14171B6
 for <linux-audit@redhat.com>; Wed,  8 Mar 2023 17:04:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E07985CCE8
 for <linux-audit@redhat.com>; Wed,  8 Mar 2023 17:04:31 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-s2J1U3DOMzy7qHvUG_J6pA-1; Wed, 08 Mar 2023 12:04:29 -0500
X-MC-Unique: s2J1U3DOMzy7qHvUG_J6pA-1
Received: by mail-pj1-f43.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so4172758pjb.0
 for <Linux-audit@redhat.com>; Wed, 08 Mar 2023 09:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678295068;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NVOd7y6JIIsp4UstjsQIPrmSH3bXWaZvfJWkwNPIKmE=;
 b=uvG31VHHrp0y5gxmXAGTINsHsm/15KhikO8hvFKaLI4m7FcMXi30VdFGkt1XJUU2Xk
 +cO9SOzW9sMGOWBRzh/FSfHgahZ9G5CjoOr5plgdrV18/qA/aXjFhR7XOLZPTLDI3+Lv
 ypD4MP49Jucd03BqRf38Ha/md0dIaFthRGJ7sFfU0+YvtyQLT1jJ5nm1kxMKdvTCshl+
 ksmd8F/MDlhzIWgc5B6EGHDwMqDn5qN++cA4T7jGYrR7Sz4GGZ6ebJeFdKqb7emA7Tkr
 w8aCyTU3kvXZmXe9ar1E26yJwVutJCXPbuxopN0HT+4aw2qGRa0w57GsHrdvIx9HNRFT
 UzIA==
X-Gm-Message-State: AO0yUKX2WlvdfsU4DlGpjrCj3ijslTwh7ePx70XQQu8PXYVJ8EJJv/Rd
 RT67LsPXrdM/NDZjhsRHVujhnrlTIofHb0ov9tlxfX6H3QVPy0Q=
X-Google-Smtp-Source: AK7set+PPqv++4Io+mqffofTpbVRGspVcAZUemA9lyqYveMhFbB8ptdsuFzQ0GbLUw8VnLhKz9uBBPISH6ZwS1AQTfo=
X-Received: by 2002:a17:90a:6783:b0:233:cc2c:7dae with SMTP id
 o3-20020a17090a678300b00233cc2c7daemr6991582pjj.8.1678295067842; Wed, 08 Mar
 2023 09:04:27 -0800 (PST)
MIME-Version: 1.0
References: <CAPoNrttQKG1uiUx=v6Cj8U0MnYMoU-ZP_Htmxn7F_Q7ZdUc9RA@mail.gmail.com>
 <CAHC9VhQAFgv5e3rvoaDTnQvQOoGawoAUfcRonayEwrvJu6znBg@mail.gmail.com>
 <CAPoNrtvt_RZfPYLAWdPp6gTu_67f1RzOz3s4T62SdoG4ryyzGw@mail.gmail.com>
In-Reply-To: <CAPoNrtvt_RZfPYLAWdPp6gTu_67f1RzOz3s4T62SdoG4ryyzGw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 8 Mar 2023 12:04:16 -0500
Message-ID: <CAHC9VhRGFL8MDtNXbSoes-gV=qM3YmCU20=UQoCfR29nnU7dcA@mail.gmail.com>
Subject: Re: Key based rate limiter (audit_set_rate_limit)
To: Anurag Aggarwal <anurag19aggarwal@gmail.com>
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
Cc: Linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBNYXIgOCwgMjAyMyBhdCA2OjUz4oCvQU0gQW51cmFnIEFnZ2Fyd2FsCjxhbnVyYWcx
OWFnZ2Fyd2FsQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IExpbWl0aW5nIG9mIGF1ZGl0IHJlY29yZHMg
aXMgYWN0dWFsbHkgZG9uZSBpbiB0aGUga2VybmVsLCBhbmQKPj4gY3VycmVudGx5IHRoZSByYXRl
IGxpbWl0IGFwcGxpZXMgZXF1YWxseVsxXSB0byBhbGwgcmVjb3JkcywgdGhlcmUgaXMKPj4gbm8g
YWJpbGl0eSB0byBlbmZvcmNlIGxpbWl0cyBwZXIta2V5Lgo+Cj4gT25lIHF1ZXN0aW9uIFBhdWws
IHdpbGwgaXQgYmUgb2ssIGlmIHdlIGNvbnRyaWJ1dGUgc29tZXRoaW5nIHNpbWlsYXIgdG8gdGhl
IEF1ZGl0ZCBLZXJuZWwgcmVwb3NpdG9yeT8KCkkgZG9uJ3QgbGlrZSB0ZWxsaW5nIHBlb3BsZSAq
bm90KiB0byB3b3JrIG9uIGltcHJvdmVtZW50cyB0byB0aGUKa2VybmVsLCBJJ20gaGFwcHkgdG8g
c2VlIG1vcmUgY29udHJpYnV0b3JzLCBlc3BlY2lhbGx5IGluIHRoZSBhdWRpdApzcGFjZSA6KQoK
SG93ZXZlciwgSSBhbSBmYWlybHkgc2tlcHRpY2FsIHRoYXQgd2UgY291bGQgYWRkIHBlci1rZXkg
cmF0ZSBsaW1pdGluZwp3aXRob3V0IGludHJvZHVjaW5nIGEgbm9uLXRyaXZpYWwgYW1vdW50IG9m
IG92ZXJoZWFkIHRvIHJlY29yZApnZW5lcmF0aW9uLCB3aGljaCB3b3VsZCBiZSBhIHNob3cgc3Rv
cHBlciBmb3IgdGhpcyBmZWF0dXJlIGdpdmVuIGl0cwpleHBlY3RlZCBsaW1pdGVkIGFwcGVhbC4K
Ci0tIApwYXVsLW1vb3JlLmNvbQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1
ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1hdWRpdAo=


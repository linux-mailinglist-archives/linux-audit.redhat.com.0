Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2E8772E38
	for <lists+linux-audit@lfdr.de>; Mon,  7 Aug 2023 20:54:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691434445;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4DwTsJxJbKVBdMIcgkXI0HX13rCCpxNs47rWepX3roE=;
	b=OAdNjoQlAygZAVZFsv9DIqNQi6ZqR2EyJqAxMfQdapkgDteEsjv8dAjLMgKSb9W4dKCb4q
	4HahlZ+SfboKkwMq7XsXBovvFZLb6XQOaxsm/XxT2as9A4ZsIdmEAb+3CNWJwWEYJOxfzD
	M0JNpD3G1t34EYNJw0c2ralDmWMHrtA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-kjx9737rP_6FobCV-FdBGw-1; Mon, 07 Aug 2023 14:54:02 -0400
X-MC-Unique: kjx9737rP_6FobCV-FdBGw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 586268087B9;
	Mon,  7 Aug 2023 18:54:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DEE040C125C;
	Mon,  7 Aug 2023 18:53:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 77DC7194658F;
	Mon,  7 Aug 2023 18:53:55 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 31BA01946586 for <linux-audit@listman.corp.redhat.com>;
 Mon,  7 Aug 2023 18:53:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CD4F140C2077; Mon,  7 Aug 2023 18:53:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C60EA40C2076
 for <linux-audit@redhat.com>; Mon,  7 Aug 2023 18:53:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB3161C0E0CA
 for <linux-audit@redhat.com>; Mon,  7 Aug 2023 18:53:53 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-fR4uTPt-P7mxfraoCTY4yw-1; Mon, 07 Aug 2023 14:53:51 -0400
X-MC-Unique: fR4uTPt-P7mxfraoCTY4yw-1
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-579de633419so45327597b3.3
 for <linux-audit@redhat.com>; Mon, 07 Aug 2023 11:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691434431; x=1692039231;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5QQzTAj8Pbqv3+mVuh8/yIVIuCWrisEf9OKlYzxnFeI=;
 b=ZsSR74BA3Y82VHKPS0c5gPoOIuKFqxPKU31pw82XVRBy80i7F0zvfJ2VSo88drUftp
 OJXu8gtFJ0toUggcvfbbM0RHLL4nQbFixiOiHlBuPinjBWfMOXsek1N0f+zmtpVSjnJW
 Ty84l9RCFJM8T3PsHyZJBWgrjFXCVkErr8m6Z7hNVIKfn3yJ6WnWhFLI2LFJMbHuOUnz
 5sSfNv0TsnA89pSSrjoZGsFpPFrhPGJ647r676QMh0s8+w26IIzZ6vFlrqj2uiXKb/qk
 oufmXr7JRHYwZSunMZZYR/LfT1xVh8JHPjnxJiqNBV3FcVLOZyD8rABE8lg3fyntDIkv
 3G/Q==
X-Gm-Message-State: AOJu0YyAZ9LQ4M4ce34ikOCp8ZKDsyh91x30FwKtKzHIZP407w+frbiC
 vOLv1+NCV6hfMeDeMbcR+UeK8No8R+K7QqVxqKI9
X-Google-Smtp-Source: AGHT+IG1afV8u+sL288doaRx2Pgb6JRTUIxE+TVIx9Qg3KBE/BALrEmVgJnZGdCOvBxsVgJpQQaf8dMjXUu4YT5ynyo=
X-Received: by 2002:a0d:fa44:0:b0:583:741c:5fe6 with SMTP id
 k65-20020a0dfa44000000b00583741c5fe6mr6661985ywf.52.1691434430935; Mon, 07
 Aug 2023 11:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <41d03271-ff8a-9888-11de-a7f53da47328@I-love.SAKURA.ne.jp>
In-Reply-To: <41d03271-ff8a-9888-11de-a7f53da47328@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 7 Aug 2023 14:53:40 -0400
Message-ID: <CAHC9VhSsDTyfae6f0XvYYcCRH590L1ZEqbHSM4UgUCHRGm7X_g@mail.gmail.com>
Subject: Re: [PATCH v2] TaskTracker : Simplified thread information tracker.
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU3VuLCBBdWcgNiwgMjAyMyBhdCA5OjA14oCvQU0gVGV0c3VvIEhhbmRhCjxwZW5ndWluLWtl
cm5lbEBpLWxvdmUuc2FrdXJhLm5lLmpwPiB3cm90ZToKPgo+IFdoZW4gYW4gdW5leHBlY3RlZCBz
eXN0ZW0gZXZlbnQgb2NjdXJzLCB0aGUgYWRtaW5pc3RyYXRvciBtYXkgd2FudCB0bwo+IGlkZW50
aWZ5IHdoaWNoIGFwcGxpY2F0aW9uIHRyaWdnZXJlZCB0aGUgZXZlbnQuIEZvciBleGFtcGxlLCB1
bmV4cGVjdGVkCj4gcHJvY2VzcyB0ZXJtaW5hdGlvbiBpcyBzdGlsbCBhIHJlYWwgY29uY2VybiBl
bm91Z2ggdG8gd3JpdGUgYXJ0aWNsZXMKPiBsaWtlIGh0dHBzOi8vYWNjZXNzLnJlZGhhdC5jb20v
c29sdXRpb25zLzE2NTk5MyAuIFRhc2tUcmFja2VyIGlzIGEKPiB0cml2aWFsIExTTSBtb2R1bGUg
d2hpY2ggZW1pdHMgVE9NT1lPLWxpa2UgaW5mb3JtYXRpb24gaW50byB0aGUgYXVkaXQKPiBsb2dz
IGZvciBiZXR0ZXIgdW5kZXJzdGFuZGluZyBvZiB1bmV4cGVjdGVkIHN5c3RlbSBldmVudHMuCgpI
ZWxwIG1lIHVuZGVyc3RhbmQgd2h5IGFsbCBvZiB0aGlzIGluZm9ybWF0aW9uIGlzbid0IGFscmVh
ZHkgYXZhaWxhYmxlCnZpYSBzb21lIGNvbWJpbmF0aW9uIG9mIEF1ZGl0IGFuZCBUT01PWU8sIG9y
IHNpbXBseSBhdWRpdCBpdHNlbGY/CgpJbiB0aGUgY2FzZSBvZiBhbiBhdWRpdC1vbmx5IGRlc2ln
biB5b3Ugd291bGQgbGlrZWx5IG5lZWQgdG8gZG8gc29tZQpwcm9jZXNzaW5nIG9mIHRoZSBhdWRp
dCBsb2cgdG8gZGV0ZXJtaW5lIHRoZSBmdWxsIGhpc3RvcmljYWwgcHJvY2Vzcwp0cmVlIG9mIHRo
ZSBwcm9jZXNzIGJlaW5nIGtpbGxlZCwgYnV0IGFsbCBvZiB0aGUgaW5mb3JtYXRpb24gc2hvdWxk
IGJlCnRoZXJlIGlmIHlvdSBjb25maWd1cmUgYXVkaXQgcHJvcGVybHkuICBJJ20gbGVzcyBmYW1p
bGlhciB3aXRoIFRPTU9ZTywKYnV0IHlvdXIgY29tbWVudCBhYm91dCB0aGlzIExTTSByZWNvcmRp
bmcgIlRPTU9ZTy1saWtlIiBpbmZvcm1hdGlvbgptYWtlcyBtZSBiZWxpZXZlIHRoYXQgVE9NT1lP
IGFscmVhZHkgcmVjb3JkcyB0aGlzIGluZm9ybWF0aW9uLgoKLS0gCnBhdWwtbW9vcmUuY29tCgot
LQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczov
L2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


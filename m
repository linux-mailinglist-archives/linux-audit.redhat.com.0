Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E11A6AAC8C
	for <lists+linux-audit@lfdr.de>; Sat,  4 Mar 2023 21:55:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677963339;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5Bgv7YY9Cy8adOiuDqOUAFZM5IH6OBXTHNakcsEENvw=;
	b=g/VcJyq6jx6Xj0IkzQuqKE2NwXBQtT6H4XGgH5UdxFwxb9LzUrZsqo2lCVWSLdneJUUrmQ
	fBjCaWWY9hwWbDDqUg5zW1ZQcfUD0xxPm5WtUUyENRPVjYa+7BiPwaCnnUqDNyc3ENLeb3
	S7qokkeCMuDcB8ORvNzQ5SJVARIewGk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-EJ48oG6gNCGQy624pv_WFQ-1; Sat, 04 Mar 2023 15:55:36 -0500
X-MC-Unique: EJ48oG6gNCGQy624pv_WFQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4086F830F81;
	Sat,  4 Mar 2023 20:55:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BC71492B02;
	Sat,  4 Mar 2023 20:55:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9860D194865E;
	Sat,  4 Mar 2023 20:55:25 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1E1A919472FC for <linux-audit@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 02:33:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DB2E91121318; Thu,  2 Mar 2023 02:33:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D36841121315
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 02:33:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B59DB185A78B
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 02:33:33 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-NB-e5-6gOYC9ltCpqU4QAA-1; Wed, 01 Mar 2023 21:33:31 -0500
X-MC-Unique: NB-e5-6gOYC9ltCpqU4QAA-1
Received: by mail-pl1-f182.google.com with SMTP id z2so16073551plf.12
 for <linux-audit@redhat.com>; Wed, 01 Mar 2023 18:33:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677724410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b0lZNoVt9lJ6J8uwaJdMmpDSpbdScMq/0KTuhIjVkUQ=;
 b=EPvq1ixgFlLZoDBKEKACLGN9zk0P1Zq5kKEdZFHF+G2nWXFatoLleAeQNta1334EB8
 gHmAvpqm8hWn7wn2eS+wXvaz2RRCb/fumj/zTtE7RGMtkN7t+hDGUpocqcNwjijIlT/D
 cX705v8i5JUTSfZ815RHkY4KPHp4fqAXvH4fa9tSzVJAcXHAijRA7cfQoLj5BMGjKEdZ
 KLlAUJbWkrrKdSLvZXcSnlKSMszxv3La4rj6Sl3g+vvRfD8KDw/AunvL0iS/DZoZoSsM
 I6Phzl4nK10sGpXwKW9rD7ea2gLnwTwrLzZ2xrVXRvBWRgMtIr75lqCjLJOSpgu6jspH
 yiZQ==
X-Gm-Message-State: AO0yUKVitqd1RXUu60vtr+8jLlB9Sh2RYAD5j2yGTEzLRZXgVwZZVSL3
 2sSoYxnbXdEPIh+Za95QJ128FQUPxKjZMwZoWbpC
X-Google-Smtp-Source: AK7set+xzLCM6twBgJCibMqi0G3TLp91UnzEQU5FoUMwEXykcRoWlNU/HbsG/K6w+XprDCA87nJQJ5CJfxasDk2ZryU=
X-Received: by 2002:a17:903:2782:b0:19b:373:94ad with SMTP id
 jw2-20020a170903278200b0019b037394admr3206594plb.3.1677724410550; Wed, 01 Mar
 2023 18:33:30 -0800 (PST)
MIME-Version: 1.0
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-4-git-send-email-wufan@linux.microsoft.com>
 <061df661004a06ef1e8790d48157c7ba4ecfc009.camel@huaweicloud.com>
 <20230210232154.GA17962@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <20230210232154.GA17962@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 1 Mar 2023 21:33:19 -0500
Message-ID: <CAHC9VhShcgFtdxxoFX9x+QOM3Qb7xWa-AJuJGrHgaK_N8nKtzQ@mail.gmail.com>
Subject: Re: [RFC PATCH v9 03/16] ipe: add evaluation loop and introduce
 'boot_verified' as a trust provider
To: Fan Wu <wufan@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Sat, 04 Mar 2023 20:55:24 +0000
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, tytso@mit.edu,
 dm-devel@redhat.com, corbet@lwn.net, roberto.sassu@huawei.com,
 Deven Bowers <deven.desai@linux.microsoft.com>, linux-doc@vger.kernel.org,
 snitzer@kernel.org, jmorris@namei.org, zohar@linux.ibm.com,
 linux-kernel@vger.kernel.org, ebiggers@kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 Roberto Sassu <roberto.sassu@huaweicloud.com>, eparis@redhat.com,
 linux-fscrypt@vger.kernel.org, linux-integrity@vger.kernel.org, agk@redhat.com,
 serge@hallyn.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBGZWIgMTAsIDIwMjMgYXQgNjoyMeKAr1BNIEZhbiBXdSA8d3VmYW5AbGludXgubWlj
cm9zb2Z0LmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBKYW4gMzEsIDIwMjMgYXQgMDQ6NDk6NDRQTSAr
MDEwMCwgUm9iZXJ0byBTYXNzdSB3cm90ZToKPiA+IE9uIE1vbiwgMjAyMy0wMS0zMCBhdCAxNDo1
NyAtMDgwMCwgRmFuIFd1IHdyb3RlOgo+ID4gPiBGcm9tOiBEZXZlbiBCb3dlcnMgPGRldmVuLmRl
c2FpQGxpbnV4Lm1pY3Jvc29mdC5jb20+Cj4gPiA+Cj4gPiA+IElQRSBtdXN0IGhhdmUgYSBjZW50
cmFsaXplZCBmdW5jdGlvbiB0byBldmFsdWF0ZSBpbmNvbWluZyBjYWxsZXJzCj4gPiA+IGFnYWlu
c3QgSVBFJ3MgcG9saWN5LiBUaGlzIGl0ZXJhdGlvbiBvZiB0aGUgcG9saWN5IGFnYWluc3QgdGhl
IHJ1bGVzCj4gPiA+IGZvciB0aGF0IHNwZWNpZmljIGNhbGxlciBpcyBrbm93biBhcyB0aGUgZXZh
bHVhdGlvbiBsb29wLgo+ID4KPiA+IE5vdCBzdXJlIGlmIHlvdSBjaGVjayB0aGUgcHJvcGVydGll
cyBhdCBldmVyeSBhY2Nlc3MuCj4gPgo+ID4gPkZyb20gbXkgcHJldmlvdXMgY29tbWVudHMgKGFs
c28gZm9yIHByZXZpb3VzIHZlcnNpb25zIG9mIHRoZSBwYXRjaGVzKQo+ID4geW91IGNvdWxkIGV2
YWx1YXRlIHRoZSBwcm9wZXJ0eSBvbmNlLCBieSBjYWxsaW5nIHRoZSByZXNwZWN0aXZlCj4gPiBm
dW5jdGlvbnMgaW4gdGhlIG90aGVyIHN1YnN5c3RlbXMuCj4gPgo+ID4gVGhlbiwgeW91IHJlc2Vy
dmUgc3BhY2UgaW4gdGhlIHNlY3VyaXR5IGJsb2IgZm9yIGlub2RlcyBhbmQgc3VwZXJibG9ja3MK
PiA+IHRvIGNhY2hlIHRoZSBkZWNpc2lvbi4gVGhlIGZvcm1hdCBjb3VsZCBiZSBhIHBvbGljeSBz
ZXF1ZW5jZSBudW1iZXIsIHRvCj4gPiBlbnN1cmUgdGhhdCB0aGUgY2FjaGUgaXMgdmFsaWQgb25s
eSBmb3IgdGhlIGN1cnJlbnQgcG9saWN5LCBhbmQgYSBiaXQKPiA+IGZvciBldmVyeSBob29rIHlv
dSBlbmZvcmNlLgo+Cj4gVGhhbmtzIGZvciByYWlzaW5nIHRoaXMgaWRlYS4gSSBhZ3JlZSB0aGF0
IGlmIHRoZSBwcm9wZXJ0eSBldmFsdWF0aW9uCj4gbGVhZHMgdG8gYSBwZXJmb3JtYW5jZSBpc3N1
ZSwgaXQgd2lsbCBiZSBiZXR0ZXIgdG8gY2FjaGUgdGhlIGV2YWx1YXRpb24KPiByZXN1bHQuIEJ1
dCBmb3IgdGhpcyB2ZXJzaW9uLCBhbGwgdGhlIHByb3BlcnR5IGV2YWx1YXRpb25zIGFyZSBzaW1w
bGUsCj4gc28gaXQgaXMganVzdCBhcyBmYXN0IGFzIGFjY2Vzc2luZyBhIGNhY2hlLiBBbHNvLCBm
b3IgdGhlIGluaXRpYWwKPiB2ZXJzaW9uIHdlIHByZWZlciB0byBrZWVwIHRoZSBwYXRjaCBhcyBt
aW5pbWFsIGFzIHBvc3NpYmxlLgoKRldJVywgSSB0aGluayB0aGF0IGlzIHRoZSByaWdodCBkZWNp
c2lvbi4gIEtlZXBpbmcgdGhlIGluaXRpYWwKc3VibWlzc2lvbiByZWxhdGl2ZWx5IHNtYWxsIGFu
ZCBmb2N1c2VkIGhhcyBhIGxvdCBvZiBhZHZhbnRhZ2VzIHdoZW4KaXQgY29tZXMgYm90aCB0byBy
ZXZpZXcgYW5kIHByZW1hdHVyZWx5IG9wdGltaXppbmcgdGhpbmdzIHRoYXQgbWlnaHQKbm90IG5l
ZWQgb3B0aW1pemF0aW9uLgoKLS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWls
aW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


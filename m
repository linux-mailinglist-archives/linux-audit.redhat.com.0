Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A448E6AAC88
	for <lists+linux-audit@lfdr.de>; Sat,  4 Mar 2023 21:55:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677963338;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+Me/H+STGCJFQXQ3HrAl6XLpHwxxiMROjNh80LUc8cs=;
	b=bQBN/DFEMumb+CEa5/3J4FPRc//S4jcLlc/cpjtAVbt6CxL7Ef+kOxDOVCUZ8Hl0DImZXu
	qV7FDfBaxkfAAaZQAmqAtrH9u+uuXPm8ZuMd1Xew+KZzRBH4TYaAIpMmPf+svysQo19IZl
	ErOF3/v3zSSRLISUv/BsfV4Li4GAHxg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-j5sCHuepPECKxoX0hVraRg-1; Sat, 04 Mar 2023 15:55:36 -0500
X-MC-Unique: j5sCHuepPECKxoX0hVraRg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4032D185A794;
	Sat,  4 Mar 2023 20:55:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 998BF440DC;
	Sat,  4 Mar 2023 20:55:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 645461943403;
	Sat,  4 Mar 2023 20:55:27 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4C21619452CD for <linux-audit@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 19:08:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 377C6440D8; Thu,  2 Mar 2023 19:08:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 303E0440DC
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 19:08:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F63285A588
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 19:08:18 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-CtV3IREGNCubE-xKR7MfMg-1; Thu, 02 Mar 2023 14:08:16 -0500
X-MC-Unique: CtV3IREGNCubE-xKR7MfMg-1
Received: by mail-pj1-f45.google.com with SMTP id l1so164963pjt.2
 for <linux-audit@redhat.com>; Thu, 02 Mar 2023 11:08:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677784095;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vdu6kOAJ1Ups+aUuKMhdxW9mbKAGnc9mpfEPZtQ5oYc=;
 b=u3q+jBFo6+RuTZLjlfGbVEBQaVmABR+lmzCKkugZtD0Y6rzStui+0JupRajf8QQxR3
 PBL3Gn4EpTyUo8F6c1k18RL6VP4e0xBjcmjFpGc73IuZGGxSKu44bFFcrnhb2hPsR1sz
 M1CMdu10Oe+/wvz2e+U1eOtGeOhiFFs6GslgnPar/iQXsv1XOP42iE9UZzecqNDwWhEo
 AX0t40ekIVbVjSYpkj+x61vHW2Vvitk4JpC5jhSuI5aYzdF7qxp9N4h5EuqM3lY0lY4h
 2fWT5XjtGwqAkQbzfHj94s9CfGjlf5n7QHrHJtnsLPMzOoG1O16ShP+ps0k077idTSlb
 CiKw==
X-Gm-Message-State: AO0yUKVQSLYU6R1dfKLqNnQ2vy94Pe2r+IXP0RJsLeAIWKv4ACAaksrs
 PsfmBK7IT4LQxyBUJeL6gNlCxhyBP44hX+SOluT2
X-Google-Smtp-Source: AK7set9s3MxX+z1dx88uX1Fs1h5mTCDHnH5bToYcnqr8ZticQMwTWq2upjnKLw2DFG5CIW3NG3MUdlWUtltns+RDwxc=
X-Received: by 2002:a17:903:1d1:b0:19c:cb32:bfef with SMTP id
 e17-20020a17090301d100b0019ccb32bfefmr4510758plh.3.1677784095231; Thu, 02 Mar
 2023 11:08:15 -0800 (PST)
MIME-Version: 1.0
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-12-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1675119451-23180-12-git-send-email-wufan@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 2 Mar 2023 14:08:04 -0500
Message-ID: <CAHC9VhRdm_xpXNQvSVO2hkx2js=_zzo2DiQ6PvEjAEet4OjxNw@mail.gmail.com>
Subject: Re: [RFC PATCH v9 11/16] ipe: add support for dm-verity as a trust
 provider
To: Fan Wu <wufan@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
 eparis@redhat.com, linux-fscrypt@vger.kernel.org,
 linux-integrity@vger.kernel.org, agk@redhat.com, serge@hallyn.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBKYW4gMzAsIDIwMjMgYXQgNTo1OOKAr1BNIEZhbiBXdSA8d3VmYW5AbGludXgubWlj
cm9zb2Z0LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBEZXZlbiBCb3dlcnMgPGRldmVuLmRlc2FpQGxp
bnV4Lm1pY3Jvc29mdC5jb20+Cj4KPiBBbGxvd3MgYXV0aG9yIG9mIElQRSBwb2xpY3kgdG8gaW5k
aWNhdGUgdHJ1c3QgZm9yIGEgc2luZ3VsYXIgZG0tdmVyaXR5Cj4gdm9sdW1lLCBpZGVudGlmaWVk
IGJ5IHJvb3RoYXNoLCB0aHJvdWdoICJkbXZlcml0eV9yb290aGFzaCIgYW5kIGFsbAo+IHNpZ25l
ZCBkbS12ZXJpdHkgdm9sdW1lcywgdGhyb3VnaCAiZG12ZXJpdHlfc2lnbmF0dXJlIi4KPgo+IFNp
Z25lZC1vZmYtYnk6IERldmVuIEJvd2VycyA8ZGV2ZW4uZGVzYWlAbGludXgubWljcm9zb2Z0LmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBGYW4gV3UgPHd1ZmFuQGxpbnV4Lm1pY3Jvc29mdC5jb20+Cgou
Li4KCj4gLS0tCj4gIHNlY3VyaXR5L2lwZS9LY29uZmlnICAgICAgICAgfCAgMjAgKysrKysKPiAg
c2VjdXJpdHkvaXBlL01ha2VmaWxlICAgICAgICB8ICAgMiArCj4gIHNlY3VyaXR5L2lwZS9hdWRp
dC5jICAgICAgICAgfCAgMjQgKysrKysrCj4gIHNlY3VyaXR5L2lwZS9kaWdlc3QuYyAgICAgICAg
fCAxNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgc2VjdXJpdHkvaXBl
L2RpZ2VzdC5oICAgICAgICB8ICAyNiArKysrKysrCj4gIHNlY3VyaXR5L2lwZS9ldmFsLmMgICAg
ICAgICAgfCAxMDMgKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBzZWN1cml0eS9pcGUvZXZh
bC5oICAgICAgICAgIHwgIDEzICsrKysKPiAgc2VjdXJpdHkvaXBlL2hvb2tzLmMgICAgICAgICB8
ICA1MSArKysrKysrKysrKysrCj4gIHNlY3VyaXR5L2lwZS9ob29rcy5oICAgICAgICAgfCAgIDgg
KysKPiAgc2VjdXJpdHkvaXBlL2lwZS5jICAgICAgICAgICB8ICAxNSArKysrCj4gIHNlY3VyaXR5
L2lwZS9pcGUuaCAgICAgICAgICAgfCAgIDQgKwo+ICBzZWN1cml0eS9pcGUvcG9saWN5LmggICAg
ICAgIHwgICAzICsKPiAgc2VjdXJpdHkvaXBlL3BvbGljeV9wYXJzZXIuYyB8ICAxNiArKysrCj4g
IDEzIGZpbGVzIGNoYW5nZWQsIDQyOSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBzZWN1cml0eS9pcGUvZGlnZXN0LmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lw
ZS9kaWdlc3QuaAo+Cj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2lwZS9LY29uZmlnIGIvc2VjdXJp
dHkvaXBlL0tjb25maWcKPiBpbmRleCBhYzRkNTU4ZTY5ZDUuLjE2ZTgzNWNlNjFiMCAxMDA2NDQK
PiAtLS0gYS9zZWN1cml0eS9pcGUvS2NvbmZpZwo+ICsrKyBiL3NlY3VyaXR5L2lwZS9LY29uZmln
Cj4gQEAgLTE1LDMgKzE1LDIzIEBAIG1lbnVjb25maWcgU0VDVVJJVFlfSVBFCj4gICAgICAgICAg
IGFkbWlucyB0byByZWNvbmZpZ3VyZSB0cnVzdCByZXF1aXJlbWVudHMgb24gdGhlIGZseS4KPgo+
ICAgICAgICAgICBJZiB1bnN1cmUsIGFuc3dlciBOLgo+ICsKPiAraWYgU0VDVVJJVFlfSVBFCj4g
K21lbnUgIklQRSBUcnVzdCBQcm92aWRlcnMiCj4gKwo+ICtjb25maWcgSVBFX1BST1BfRE1fVkVS
SVRZCj4gKyAgICAgICBib29sICJFbmFibGUgc3VwcG9ydCBmb3IgZG0tdmVyaXR5IHZvbHVtZXMi
Cj4gKyAgICAgICBkZXBlbmRzIG9uIERNX1ZFUklUWSAmJiBETV9WRVJJVFlfVkVSSUZZX1JPT1RI
QVNIX1NJRwo+ICsgICAgICAgZGVmYXVsdCBZCj4gKyAgICAgICBoZWxwCj4gKyAgICAgICAgIFRo
aXMgb3B0aW9uIGVuYWJsZXMgdGhlIHByb3BlcnRpZXMgJ2RtdmVyaXR5X3NpZ25hdHVyZScgYW5k
Cj4gKyAgICAgICAgICdkbXZlcml0eV9yb290aGFzaCcgaW4gSVBFIHBvbGljeS4gVGhlc2UgcHJv
cGVydGllcyBldmFsdWF0ZXMKPiArICAgICAgICAgdG8gVFJVRSB3aGVuIGEgZmlsZSBpcyBldmFs
dWF0ZWQgYWdhaW5zdCBhIGRtLXZlcml0eSB2b2x1bWUKPiArICAgICAgICAgdGhhdCB3YXMgbW91
bnRlZCB3aXRoIGEgc2lnbmVkIHJvb3QtaGFzaCBvciB0aGUgdm9sdW1lJ3MKPiArICAgICAgICAg
cm9vdCBoYXNoIG1hdGNoZXMgdGhlIHN1cHBsaWVkIHZhbHVlIGluIHRoZSBwb2xpY3kuCj4gKwo+
ICsgICAgICAgICBJZiB1bnN1cmUsIGFuc3dlciBZLgoKSWYgeW91IGhhZCBib3RoIElQRSBhbmQg
ZG0tdmVyaXR5IGVuYWJsZWQgaW4geW91ciBrZXJuZWwgYnVpbGQsIGlzCnRoZXJlIGV2ZXIgYSBj
YXNlIHdoZXJlIHlvdSB3b3VsZG4ndCB3YW50IElQRV9QUk9QX0RNX1ZFUklUWT8gIEkKc3VzcGVj
dCB5b3UgY2FuIGp1c3QgaGF2ZSBJUEUgYW5kIGRtLXZlcml0eSBzZWxlY3QgSVBFX1BST1BfRE1f
VkVSSVRZCmFuZCBub3QgYm90aGVyIHRoZSB1c2VyL2FkbWluIHdpdGggdGhlIGFkZGl0aW9uYWwg
S2NvbmZpZyBrbm9iLgoKPiArZW5kbWVudQo+ICsKPiArZW5kaWYKCi0tCnBhdWwtbW9vcmUuY29t
CgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRw
czovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


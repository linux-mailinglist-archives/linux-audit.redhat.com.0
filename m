Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DEF78D697
	for <lists+linux-audit@lfdr.de>; Wed, 30 Aug 2023 16:40:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693406446;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pm9lVrLsl4bfKgDYHAWTPYhO7DBwxaHYlrEosJBeH8c=;
	b=bQjWXY3e7PCrHtCX2NyIlJXb/94WvcpE4+5e3WtQtGzNa6gJj0AA/khaUvTRIy4/Fb/VsO
	87Mt7U+AcqKik9iMXLWgUcKZ9ri35IeG633JLZzcMHlyWVuEFFomyTe8qzcFbhy1xsgs/D
	BgWgz/O5+SkWY9jZIqB30J6OAPDkNQs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-HgCECqayN_SGark7DpW1Tg-1; Wed, 30 Aug 2023 10:40:44 -0400
X-MC-Unique: HgCECqayN_SGark7DpW1Tg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7E1B185A78B;
	Wed, 30 Aug 2023 14:40:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 01684140E96E;
	Wed, 30 Aug 2023 14:40:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 698B41946A47;
	Wed, 30 Aug 2023 14:40:38 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D98411946589 for <linux-audit@listman.corp.redhat.com>;
 Wed, 30 Aug 2023 14:29:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 97A4B6B292; Wed, 30 Aug 2023 14:29:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FFA26466B
 for <linux-audit@redhat.com>; Wed, 30 Aug 2023 14:29:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D14E1C06924
 for <linux-audit@redhat.com>; Wed, 30 Aug 2023 14:29:58 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-_qs2UkgfMCG5StfjsOqaXA-1; Wed, 30 Aug 2023 10:29:56 -0400
X-MC-Unique: _qs2UkgfMCG5StfjsOqaXA-1
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-58d70c441d5so67258957b3.2
 for <linux-audit@redhat.com>; Wed, 30 Aug 2023 07:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693405795; x=1694010595;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NghURf49RK5ylycOOwon5RzRxws9/PW8JtsRCxfmiyY=;
 b=Gq1EpqgO0yABfAK+xTjEfRbV/yMrF+tekUmzF+tle49wqGYVo180BVcHYL1eiPBkEZ
 8vhA/BSOyqXU5dX0fau0u8G1iH/ZUq2buYSp21+EU+qtzIhjqkEstaNnW9nulgSjCqqx
 4/N8ZrjnuLn8yebBsFlqSBaeV0t4cLjVQQijRXNe9lbkeEwyHlgcZMzEP2ihishmmbKO
 iwfOVXEpEUIwkJJeXyOVmEPJdJdJTs1qNtW/qqXw5Zh6ruzs8gamjRcwxC3B9Ujo+2IY
 3sX5rlH8H8sxlSXnM6g5YtbR2yFoX/MPnKbrGzRM4S4Nl/Zbw4mUjFzWwuVL8/+nrbln
 NkEQ==
X-Gm-Message-State: AOJu0YzNVavK+U5uPkU8IgVW/XjgLlC28Qvf6YIJnECrDL+4v2lenv+/
 xe+Xui0Yybyn3XXCRaduVw10DtO6DKkMkrv/oMuG
X-Google-Smtp-Source: AGHT+IENUcGV1zmTTBYYJ4iI6kb1uCtEbWSrgnMVUQ/8HiTd3flLhgpR3sz66wZeZ1ViiieOOnosB8xqzoOlplCZg5w=
X-Received: by 2002:a0d:f747:0:b0:595:80e4:907d with SMTP id
 h68-20020a0df747000000b0059580e4907dmr2056857ywf.32.1693405795614; Wed, 30
 Aug 2023 07:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <202308301248.hEwyeVEl-lkp@intel.com>
In-Reply-To: <202308301248.hEwyeVEl-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 30 Aug 2023 10:29:44 -0400
Message-ID: <CAHC9VhQZFZTaXb_S5YCy9KniVfPBmEQrY74_dMi5cBftZsrwNg@mail.gmail.com>
Subject: Re: [pcmoore-audit:main 1/1] README.orig: warning: ignored by one of
 the .gitignore files
To: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
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
Cc: audit@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBBdWcgMzAsIDIwMjMgYXQgMTI6MTfigK9BTSBrZXJuZWwgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4gd3JvdGU6Cj4gdHJlZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9wY21vb3JlL2F1ZGl0LmdpdCBtYWluCj4gaGVhZDogICA5NGU1
ZWY5YjE1N2M2YzM3NzkzNTJhOGQ0MTIxNTQyZjcxZGU1MmExCj4gY29tbWl0OiA5NGU1ZWY5YjE1
N2M2YzM3NzkzNTJhOGQ0MTIxNTQyZjcxZGU1MmExIFsxLzFdIGF1ZGl0OiBhZGQgYSBMaW51eCBB
dWRpdCBzcGVjaWZpYyBSRUFETUUubWQgYW5kIFNFQ1VSSVRZLm1kCj4gY29uZmlnOiBwYXJpc2Mt
cmFuZGNvbmZpZy1yMDEyLTIwMjMwODMwIChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNp
L2FyY2hpdmUvMjAyMzA4MzAvMjAyMzA4MzAxMjQ4LmhFd3llVkVsLWxrcEBpbnRlbC5jb20vY29u
ZmlnKQo+IGNvbXBpbGVyOiBocHBhLWxpbnV4LWdjYyAoR0NDKSAxMy4yLjAKPiByZXByb2R1Y2Ug
KHRoaXMgaXMgYSBXPTEgYnVpbGQpOiAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9h
cmNoaXZlLzIwMjMwODMwLzIwMjMwODMwMTI0OC5oRXd5ZVZFbC1sa3BAaW50ZWwuY29tL3JlcHJv
ZHVjZSkKPgo+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUgcGF0Y2gvY29tbWl0
IChpLmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YKPiB0aGUgc2FtZSBwYXRjaC9jb21taXQp
LCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzCj4gfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qg
cm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gfCBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L29lLWtidWlsZC1hbGwvMjAyMzA4MzAxMjQ4LmhFd3llVkVsLWxrcEBpbnRlbC5jb20vCj4KPiBB
bGwgd2FybmluZ3MgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToKPgo+ID4+IFJFQURNRS5vcmln
OiB3YXJuaW5nOiBpZ25vcmVkIGJ5IG9uZSBvZiB0aGUgLmdpdGlnbm9yZSBmaWxlcwo+ICAgIHRv
b2xzL3BlcmYvdXRpbC9icGZfc2tlbC92bWxpbnV4L3ZtbGludXguaDogd2FybmluZzogaWdub3Jl
ZCBieSBvbmUgb2YgdGhlIC5naXRpZ25vcmUgZmlsZXMKPiAgICB0b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9hcm02NC90YWdzLy5naXRpZ25vcmU6IHdhcm5pbmc6IGlnbm9yZWQgYnkgb25lIG9mIHRo
ZSAuZ2l0aWdub3JlIGZpbGVzCj4gICAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFn
cy9NYWtlZmlsZTogd2FybmluZzogaWdub3JlZCBieSBvbmUgb2YgdGhlIC5naXRpZ25vcmUgZmls
ZXMKPiAgICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC90YWdzL3J1bl90YWdzX3Rlc3Qu
c2g6IHdhcm5pbmc6IGlnbm9yZWQgYnkgb25lIG9mIHRoZSAuZ2l0aWdub3JlIGZpbGVzCj4gICAg
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFncy90YWdzX3Rlc3QuYzogd2FybmluZzog
aWdub3JlZCBieSBvbmUgb2YgdGhlIC5naXRpZ25vcmUgZmlsZXMKPiAgICB0b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0vLmdpdGlnbm9yZTogd2FybmluZzogaWdub3JlZCBieSBvbmUgb2YgdGhl
IC5naXRpZ25vcmUgZmlsZXMKPiAgICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZp
bGU6IHdhcm5pbmc6IGlnbm9yZWQgYnkgb25lIG9mIHRoZSAuZ2l0aWdub3JlIGZpbGVzCj4gICAg
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2NvbmZpZzogd2FybmluZzogaWdub3JlZCBieSBv
bmUgb2YgdGhlIC5naXRpZ25vcmUgZmlsZXMKPiAgICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0vc2V0dGluZ3M6IHdhcm5pbmc6IGlnbm9yZWQgYnkgb25lIG9mIHRoZSAuZ2l0aWdub3JlIGZp
bGVzCgpJIGhhdmUgbm8gaWRlYSBpZiB0aGVyZSBpcyBhIHBlcnNvbiBhdHRhY2hlZCB0byBhbnkg
b2YgdGhlIGFkZHJlc3NlcwpvbiB0aGUgVG8gbGluZSBhYm92ZSwgYnV0IHBsZWFzZSBzZW5kIGF1
ZGl0IGtlcm5lbCBpc3N1ZXMgdG8KYXVkaXRAdmdlci5rZXJuZWwub3JnIGFuZCBub3QgbGludXgt
YXVkaXRAcmVkaGF0LmNvbS4KClRoYW5rcy4KCi0tIApwYXVsLW1vb3JlLmNvbQoKLS0KTGludXgt
YXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFu
LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=


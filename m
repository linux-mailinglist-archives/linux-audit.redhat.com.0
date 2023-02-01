Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEB86870D4
	for <lists+linux-audit@lfdr.de>; Wed,  1 Feb 2023 23:09:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675289346;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fOJ9BPxKD8xNseEs6Dx/CGrjRr0Be/LIi6kRnNqG5Y0=;
	b=H4bbyFYwB9uoQepxjRfqKtGMjLsB0pj+V9ZsbOBXH4S5mFiQ528TwBhNwscyTvhKwJdt+V
	ROGSywRIAKD29hqNpDe5aFGjhnV+ftxKzXqE4G7w1ItcMZw5DyJtWYtAZuSk8X6BJLnT3x
	fD2mYDguWrEe0mXd3AVFizAl+h+b+0o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-KhEoTL5cNnSiL88O5S1adA-1; Wed, 01 Feb 2023 17:09:04 -0500
X-MC-Unique: KhEoTL5cNnSiL88O5S1adA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF7DB185A794;
	Wed,  1 Feb 2023 22:09:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B1F9F53A0;
	Wed,  1 Feb 2023 22:09:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0479319465B8;
	Wed,  1 Feb 2023 22:08:58 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 16BF3194658F for <linux-audit@listman.corp.redhat.com>;
 Wed,  1 Feb 2023 22:08:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B5198112132D; Wed,  1 Feb 2023 22:08:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.10.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59250112132C;
 Wed,  1 Feb 2023 22:08:55 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Re: audit library license
Date: Wed, 01 Feb 2023 17:08:54 -0500
Message-ID: <2683616.mvXUDI8C0e@x2>
Organization: Red Hat
In-Reply-To: <1446618833.679148.1675231237246.JavaMail.yahoo@mail.yahoo.co.jp>
References: <1446618833.679148.1675231237246.JavaMail.yahoo.ref@mail.yahoo.co.jp>
 <1446618833.679148.1675231237246.JavaMail.yahoo@mail.yahoo.co.jp>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Cc: "hiroaki.fuse@ymail.ne.jp" <hiroaki.fuse@ymail.ne.jp>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sCgpPbiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDEsIDIwMjMgMTowMDozNyBBTSBFU1Qg5biD
5pa9IOWNmuaYjiB3cm90ZToKPiBUaGFuayB5b3UgZm9yIHRoZSBjb21tZW50Lgo+IEkgYWxzbyBm
aW5kIGZvbGxvd2luZyBjb21taXQuCj4gICAtCj4gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LWF1
ZGl0L2F1ZGl0LXVzZXJzcGFjZS9jb21taXQvZTYzYThiMTYyODE3MDE1MTAxNjQKPiA3MDA3NTM5
NmUzNjk3ZGQ1N2E5Ygo+IAo+IEJUVywgSSBmb3VuZCBhbm90aGVyIGxpY2Vuc2UgcXVlc3Rpb24u
Cj4gCj4gVGhlIGxpYmF1cGFyc2Uuc28gYXJlIGNyZWF0ZWQgZm9sbG93aW5nIHNvdXJjZSBjb2Rl
cy4KPiAKPiBJbiAnYXVwYXJzZS9NYWtlZmlsZS5hbScKPiAKPiBBTV9DUFBGTEFHUyA9IC1JLiAt
SSR7dG9wX3NyY2Rpcn0gLUkke3RvcF9zcmNkaXJ9L3NyYyAtSSR7dG9wX3NyY2Rpcn0vbGliCj4g
LUkke3RvcF9zcmNkaXJ9L2NvbW1vbgo+IAo+IGxpYmF1cGFyc2VfbGFfU09VUkNFUyA9IGxydS5j
IGludGVycHJldC5jIG52bGlzdC5jIGVsbGlzdC5jCQlcCj4gCWF1cGFyc2UuYyBhdWRpdGQtY29u
ZmlnLmMgbWVzc2FnZS5jIGRhdGFfYnVmLmMgCQkJXAo+IAlhdXBhcnNlLWRlZnMuaAlhdXBhcnNl
LWlkYXRhLmggZGF0YV9idWYuaCAJCQlcCj4gCW52bGlzdC5oIGF1cGFyc2UuaCBlbGxpc3QuaAkJ
CQkJXAo+IAlpbnRlcm5hbC5oIGxydS5oIHJub2RlLmggaW50ZXJwcmV0LmgJCQkJXAo+IAlwcml2
YXRlLmggZXhwcmVzc2lvbi5jIGV4cHJlc3Npb24uaCB0dHlfbmFtZWRfa2V5cy5oCQlcCj4gCW5v
cm1hbGl6ZS5jIG5vcm1hbGl6ZS1sbGlzdC5jIG5vcm1hbGl6ZS1sbGlzdC5oIAkJXAo+IAlub3Jt
YWxpemUtaW50ZXJuYWwuaCBub3JtYWxpemVfb2JqX2tpbmRfbWFwLmgJCQlcCj4gCW5vcm1hbGl6
ZV9yZWNvcmRfbWFwLmggbm9ybWFsaXplX3N5c2NhbGxfbWFwLmgKPiAKPiBXZSBjYW4gZmluZCBm
b2xsb3dpbmcgbGluZSBpbiBpbnRlcm5hbC5oCj4gCj4gI2luY2x1ZGUgImF1ZGl0ZC1jb25maWcu
aCIKPiAKPiBJIGNhbiBmaW5kIHNyYy9hdWRpdGQtY29uZmlnLmggZmlsZSB3aGljaCBpcyBHUEx2
Mi4KPiAKPiBUaGUgInNyYy9hdWRpdGQtY29uZmlnLmgiIHNob3VsZCBiZSBhbHNvIExHUEx2Mi4x
CgpUaGF0IGZpbGUgaXMgYWxzbyBtaXNsYWJlbGVkLiBJdCBpcyBub3cgY29ycmVjdGVkLiBUaGFu
a3MgZm9yIHRoZSByZXZpZXcuCgotU3RldmUKCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QK
TGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


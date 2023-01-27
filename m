Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B6167EE79
	for <lists+linux-audit@lfdr.de>; Fri, 27 Jan 2023 20:42:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674848567;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VVh2KAF4KUnMBnlcfcemZ9oY5GGdBBcMFx95WJeBqzY=;
	b=Ic+S1pporSabzRpJ2NGL2E230ic2k+ruTD+uN9nCGK2hR5pXoXzZPdCmfmq6P5p39QI8CG
	Y/Be2XSADW3byPCbSmwPutItoyPCaWBbP0bQblPTMC9J87bqP/S6+dkq+bZZeaV4rT14s7
	hVyp8Ng2SB85hQYhB1uWRV59SX9XGT0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-YxSPDxJZN9qSSLt12OURIw-1; Fri, 27 Jan 2023 14:42:45 -0500
X-MC-Unique: YxSPDxJZN9qSSLt12OURIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 106BF3C0DDC1;
	Fri, 27 Jan 2023 19:42:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D6FF1400AFC;
	Fri, 27 Jan 2023 19:42:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2E14019465A3;
	Fri, 27 Jan 2023 19:42:35 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 67CAE194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 19:42:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 293871121315; Fri, 27 Jan 2023 19:42:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 219A11121314
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 19:42:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 025B0857F41
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 19:42:34 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-hooGaZWzMaGpR91wj8Pi9A-1; Fri, 27 Jan 2023 14:42:32 -0500
X-MC-Unique: hooGaZWzMaGpR91wj8Pi9A-1
Received: by mail-pg1-f175.google.com with SMTP id e10so3865303pgc.9
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 11:42:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QmDDVckbP60b67QFuvxzlip37K6XOtYFQo26wANXj3g=;
 b=BqaV9/CbKnxMjI7pnXWtbs731ccbUW9nnUVQyb7PmKAa25AuQ0aMOvrWkBRZhH2+qd
 QOSsIwBJKdcIZfg5SHKpCHRv0FN2+Y1AeCnB/aY7fV2j8T69nO0FV/NJfxi73rchAfkE
 4RVm1ei5gWU3DtF5EjFP0ie5YIPtoehCa0IAF2uzWhpRi60k8hcx/zy362f0TSV6wDPx
 76XqyXJNx32xjhvs9fDzOdm7Or3d23WGemKyfCoErJNJ4eNcDTFhqGwDe00Q5IzngjFP
 iYgzXQzEwUBmcEN9CSkPBdjSTLYYAdJX/Zx+icYPzKjenTZ94od2iR8CVr6ENcIIBXY0
 CK+w==
X-Gm-Message-State: AO0yUKU1CDcMUI/8xB3o0Qf84jydLhqRjraMh6vXaQIrto/P9AlZnIuS
 YC4mEZIQQokU6greN9EDNGitruEcyd5oqx5lhAgG
X-Google-Smtp-Source: AK7set/EhaMGlKO8EQNDwR2mglpOAt1yI0o594u65BpZ2HPfyXB4F31hvK5EMUvVABTiD6vdFZYnbGsRfqP9gGXCn7k=
X-Received: by 2002:a62:8e0a:0:b0:592:a8af:4ffc with SMTP id
 k10-20020a628e0a000000b00592a8af4ffcmr479150pfe.52.1674848551078; Fri, 27 Jan
 2023 11:42:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674682056.git.rgb@redhat.com>
 <da695bf4-bd9b-a03d-3fbc-686724a7b602@kernel.dk>
In-Reply-To: <da695bf4-bd9b-a03d-3fbc-686724a7b602@kernel.dk>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 27 Jan 2023 14:42:19 -0500
Message-ID: <CAHC9VhSRbay5bEUMJngpj+6Ss=WLeRoyJaNNMip+TyTkTJ6=Lg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] two suggested iouring op audit updates
To: Jens Axboe <axboe@kernel.dk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
Cc: Christian Brauner <brauner@kernel.org>, Richard Guy Briggs <rgb@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Pavel Begunkov <asml.silence@gmail.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBKYW4gMjcsIDIwMjMgYXQgMTI6NDAgUE0gSmVucyBBeGJvZSA8YXhib2VAa2VybmVs
LmRrPiB3cm90ZToKPiBPbiAxLzI3LzIzIDEwOjIz4oCvQU0sIFJpY2hhcmQgR3V5IEJyaWdncyB3
cm90ZToKPiA+IEEgY291cGxlIG9mIHVwZGF0ZXMgdG8gdGhlIGlvdXJpbmcgb3BzIGF1ZGl0IGJ5
cGFzcyBzZWxlY3Rpb25zIHN1Z2dlc3RlZCBpbgo+ID4gY29uc3VsdGF0aW9uIHdpdGggU3RldmUg
R3J1YmIuCj4gPgo+ID4gUmljaGFyZCBHdXkgQnJpZ2dzICgyKToKPiA+ICAgaW9fdXJpbmcsYXVk
aXQ6IGF1ZGl0IElPUklOR19PUF9GQURWSVNFIGJ1dCBub3QgSU9SSU5HX09QX01BRFZJU0UKPiA+
ICAgaW9fdXJpbmcsYXVkaXQ6IGRvIG5vdCBsb2cgSU9SSU5HX09QXypHRVRYQVRUUgo+ID4KPiA+
ICBpb191cmluZy9vcGRlZi5jIHwgNCArKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gTG9vayBmaW5lIHRvIG1lIC0gd2Ugc2hvdWxkIHBy
b2JhYmx5IGFkZCBzdGFibGUgdG8gYm90aCBvZiB0aGVtLCBqdXN0Cj4gdG8ga2VlcCB0aGluZ3Mg
Y29uc2lzdGVudCBhY3Jvc3MgcmVsZWFzZXMuIEkgY2FuIHF1ZXVlIHRoZW0gdXAgZm9yIDYuMy4K
ClBsZWFzZSBob2xkIG9mZiB1bnRpbCBJJ3ZlIGhhZCBhIGNoYW5jZSB0byBsb29rIHRoZW0gb3Zl
ciAuLi4KCi0tIApwYXVsLW1vb3JlLmNvbQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0Ckxp
bnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hdWRpdAo=


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D276C14B7
	for <lists+linux-audit@lfdr.de>; Mon, 20 Mar 2023 15:29:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679322574;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iQNlz/HhBEzhjUAY4WceVHq2dPc62CyR10HISeUjD5I=;
	b=S1SR1B5oFXkAZyj+xx6TmvoeQWIjQfa5PwOwBqqDfl0kocFGObIklsMgN06GRZhMduRRjM
	zHXf2VJLj4A+5JWh5lTfcYXtazx9EH/Aq6++tRqZkuLHsBpu5GFtpVgc8ts1fQ4prz7bQK
	pZSec1bXEeSsSW6lUuB7FQd69fYTEB8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-Jz_3n4QMPOmhNQwUjdWKww-1; Mon, 20 Mar 2023 10:29:33 -0400
X-MC-Unique: Jz_3n4QMPOmhNQwUjdWKww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E0191C27D83;
	Mon, 20 Mar 2023 14:29:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16EED40C6E67;
	Mon, 20 Mar 2023 14:29:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 66E4E19465B9;
	Mon, 20 Mar 2023 14:29:24 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EF6241946594 for <linux-audit@listman.corp.redhat.com>;
 Mon, 20 Mar 2023 14:29:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 97125483EC4; Mon, 20 Mar 2023 14:29:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F1884619F4
 for <linux-audit@redhat.com>; Mon, 20 Mar 2023 14:29:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71AAE85A588
 for <linux-audit@redhat.com>; Mon, 20 Mar 2023 14:29:17 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-hGHyOgYFMPuDWITz4Bxi7w-1; Mon, 20 Mar 2023 10:29:15 -0400
X-MC-Unique: hGHyOgYFMPuDWITz4Bxi7w-1
Received: by mail-yb1-f181.google.com with SMTP id y5so13298871ybu.3
 for <Linux-audit@redhat.com>; Mon, 20 Mar 2023 07:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679322555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E7cAW+riGo65m5nlRty2lgvV05cf5OOCb60RdyGoRe8=;
 b=I/mGrNpg2YFHbezZoFJRWC0f/XzBcKMD2ZlJcVryUzf1ZYMa7OkBK/ognmaQmPeUEB
 /WeYm9H0TAko68jGpkmrlkO1CvisQy0ojgOxJEAHDqGFRrHHUKg9R4qcfQuSbE00MnPs
 bNA0EVWvDCCWFtQge2bvI03YbPMumlclIgILKt/uCM7YjbmayQoff8Nld3DRhQ/7DXju
 uk+1FSR1kF47W406rvrrxD8BK/hVmZOD/x5+1lUsBLvi9AAEG70goBK73dR4wzp6a4rA
 Fgu6R3yJwIbL8E3foIh5CGf0KXSr0ca8MetsjXs4uFkUvcQNEH/fbKwnOB9bTVQQZqkf
 ONzA==
X-Gm-Message-State: AO0yUKUsa4bF7uDNQgD2/sKu1mJaSqPkzEZKwpiPtOQj/tWR4d2z1n7O
 II31eDSX8OFiPJtIQ/CByXHEECXMk9gVR4TYYH8a
X-Google-Smtp-Source: AK7set85X+yGiiSDdSnSu0UShypKZumPhH5ED8/nyxkmgkKuT75QWbanSjBEek0Q/Dt05GnVWQETW3lv0c4rA25nkLk=
X-Received: by 2002:a05:6902:1147:b0:b3c:cbdb:ed5e with SMTP id
 p7-20020a056902114700b00b3ccbdbed5emr5933530ybu.3.1679322554957; Mon, 20 Mar
 2023 07:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAPoNrtsy+ckCHQZGYM-8DW3S3FckABGyZtvVG3LJPDT8PLzMUQ@mail.gmail.com>
In-Reply-To: <CAPoNrtsy+ckCHQZGYM-8DW3S3FckABGyZtvVG3LJPDT8PLzMUQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 20 Mar 2023 10:29:04 -0400
Message-ID: <CAHC9VhTPYw_YprXkZ2h-XAg3WGsqkTxBVzZiyo0XOaRmmeC71w@mail.gmail.com>
Subject: Re: Help with setting up Auditd kernel repository
To: Anurag Aggarwal <anurag19aggarwal@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBNYXIgMjAsIDIwMjMgYXQgODoyMOKAr0FNIEFudXJhZyBBZ2dhcndhbAo8YW51cmFn
MTlhZ2dhcndhbEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gQWxsLAo+Cj4gV2lsbCBhbnlv
bmUgaGVscCBtZSB3aXRoIHNvbWUgZG9jdW1lbnRhdGlvbiBvbiBob3cgdG8gYnVpbGQgYW5kIHRl
c3QKPiBhdWRpdGQta2VybmVsIHJlcG9zaXRvcnk/CgpDYW4geW91IGJlIG1vcmUgc3BlY2lmaWMg
YWJvdXQgdGhlIGV4YWN0IHJlcG9zaXRvcnk/ICBUaGVyZSBpcyBhCnJlcG9zaXRvcnkgd2hpY2gg
Y29udGFpbnMgdGhlIGRldmVsb3BtZW50IGNvZGUgZm9yIHRoZSBMaW51eCBLZXJuZWwncwphdWRp
dCBzdWJzeXN0ZW0sIGFuZCB0aGVyZSBpcyBhIHNlY29uZCByZXBvc2l0b3J5IHdoaWNoIGNvbnRh
aW5zClN0ZXZlJ3MgYXVkaXQgdXNlcnNwYWNlIGNvZGUgKHdoaWNoIGNvbnRhaW5zIGF1ZGl0ZCBh
cyBhIGNvbXBvbmVudCkuClRoZXJlIGlzIG5vIGNvbWJpbmVkICJhdWRpdGQta2VybmVsIiByZXBv
c2l0b3J5LgoKLS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QK
TGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


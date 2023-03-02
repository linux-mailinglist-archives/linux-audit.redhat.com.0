Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB186A8937
	for <lists+linux-audit@lfdr.de>; Thu,  2 Mar 2023 20:11:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677784304;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bcVryrrVTPPKGFCH4ihAbPlgl+fPKPVSt0YIc0qTyDQ=;
	b=AL0DtslsGqcfOqf+qKXDbP4nWvKyTwtiutwnvkAWoOjFxzpMErOrNWT5CpwgkZiE45KkMR
	1rqelr11L0A/1TtcUqWDxjrUgVovlHXXxFsSQlK+4JVvOOblfEk7KVVkyb8NCiWJuGuYXs
	i36NXUrrgxOR+NyAcCJhA2KsbdB7dVw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-YDKEdeHyMtWkrfmACXGlUQ-1; Thu, 02 Mar 2023 14:11:43 -0500
X-MC-Unique: YDKEdeHyMtWkrfmACXGlUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADD7E855307;
	Thu,  2 Mar 2023 19:11:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4B001415117;
	Thu,  2 Mar 2023 19:11:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C5FAE1948642;
	Thu,  2 Mar 2023 19:11:34 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B456A19452CD for <linux-audit@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 19:11:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 715A91121318; Thu,  2 Mar 2023 19:11:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69A391121315
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 19:11:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A302100883D
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 19:11:33 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-t0HCYGueOgSHtoNlJONmjQ-1; Thu, 02 Mar 2023 14:11:31 -0500
X-MC-Unique: t0HCYGueOgSHtoNlJONmjQ-1
Received: by mail-pg1-f175.google.com with SMTP id y19so90942pgk.5
 for <linux-audit@redhat.com>; Thu, 02 Mar 2023 11:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677784290;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s1hIk08u9MNdol5vwaw807noCUmyzG/t08u0e26nwVM=;
 b=bU/EMQNcEfpv6Kwlf+DO+PU3LkHZ2dBkpzjNRQaXmezL0+8lmQemj1a+1GJMhcTEPC
 nw85htRGur8q7fhW6epZtrYBzjcjpZpvUyeyncb4nqReJKsObik6QRl8a/mxGtOlB4P3
 xXM/WQ31FAMr0lK5ca/OO9BUGIFyyWGuqbKHp99w8kQKjpuElMMYdKpnQlNKrSPPMvR6
 4RJv9MVGN8gqeRLj4tZgejbhbm3EBJ/yzAg49MGLfIlI3zVu+heG6J4ynmWWeIEYWFcf
 tT/b+YbpEfY73j7ohSRqY1SpIo0MTJKti0/CvmmBKYYUUcLy1xsVsooMSW731192oVkW
 A3BA==
X-Gm-Message-State: AO0yUKWbgpNI8ruUZT2NU7vqBJDFCG/6bcX28QH8LZgiFQ9S6PENJ4Nc
 sUvIqIJStYuZHJIh0zyi3JLXB1YiZB/T1+p3zsee
X-Google-Smtp-Source: AK7set/0S4Y4S1Fh5L8D/IAcoI1FqFMCmdhk39IoYlSiKisfGBaV/ufh8ohQXgyDO+9m4O8UEpOerNoX5OdCS5owF00=
X-Received: by 2002:a63:b21b:0:b0:502:f4c6:3992 with SMTP id
 x27-20020a63b21b000000b00502f4c63992mr3888913pge.4.1677784289955; Thu, 02 Mar
 2023 11:11:29 -0800 (PST)
MIME-Version: 1.0
References: <CAPoNrttQKG1uiUx=v6Cj8U0MnYMoU-ZP_Htmxn7F_Q7ZdUc9RA@mail.gmail.com>
 <CAHC9VhQAFgv5e3rvoaDTnQvQOoGawoAUfcRonayEwrvJu6znBg@mail.gmail.com>
 <CAPoNrtswDzsghShzAvf72xOQ-vWUj6DdkVPRWnBWp-qG9Xa8Vw@mail.gmail.com>
 <CAHC9VhSr3groyZpA34L3swqDoU8_WJWbWsHz7GDR0QqNpSjhyA@mail.gmail.com>
 <d0c20f21-7064-e199-c052-5d049a681ecf@magitekltd.com>
 <CAPoNrtsiXr=-w5OT0J_i5Ekun0FKVc3Ocs2oY-bAj+ZjvEwCmg@mail.gmail.com>
 <37a373df-97cd-133a-381f-6d6d4b20c3fa@magitekltd.com>
 <CAPoNrtvj1xXDXfgNe=r2ETqYYODqXqYn6LX=w=eGYon1PO2TBA@mail.gmail.com>
 <ba3891d6-21ed-9e86-6bf9-c049ae8a1b3b@magitekltd.com>
In-Reply-To: <ba3891d6-21ed-9e86-6bf9-c049ae8a1b3b@magitekltd.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 2 Mar 2023 14:11:18 -0500
Message-ID: <CAHC9VhRTMMW8ArLTNk-cuYpiQzU+VyKvdg6+HfqWX3yS7RtK1A@mail.gmail.com>
Subject: Re: Key based rate limiter (audit_set_rate_limit)
To: Lenny Bruzenak <lenny@magitekltd.com>
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
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBNYXIgMiwgMjAyMyBhdCAxMjoyNOKAr1BNIExlbm55IEJydXplbmFrIDxsZW5ueUBt
YWdpdGVrbHRkLmNvbT4gd3JvdGU6Cj4gT24gMy8xLzIzIDIyOjEzLCBBbnVyYWcgQWdnYXJ3YWwg
d3JvdGU6Cj4+Cj4+IE9yIGlmIHNlbGludXggaXMgaW4gZm9yY2UsIGNyZWF0ZSBwb2xpY3kgZm9y
IHRoZSBldmVudHMgeW91IGRlZmluaXRlbHkgd2FudCwgdGhlbiBsb29rIGZvciB0aG9zZSB0eXBl
cyAoZWl0aGVyIHN1YmplY3Qgb3Igb2JqZWN0KSBpbiB5b3VyIHJ1bGUuIFRoaXMgaXMgc29tZXRo
aW5nIEkndmUgc2VlbiBiZWZvcmUsIHdoZXJlIHJlbmFtZXMgdGhhdCBhcmUgZGVzaXJlZCB0byBi
ZSBhdWRpdGVkIHVzZSB0aGUgcHJvdmlkZWQgc3lzdGVtIHRvb2xzLCBidXQgZm9yIGxvY2FsbHkg
ZGV2ZWxvcGVkIGFwcGxpY2F0aW9uIGNvZGUsIHRoZXkgYXJlIG1hZGUgdG8gcnVuIGluc2lkZSBh
IGNlcnRhaW4gdHlwZSBvZiBhIGN1c3RvbSBleGVjdXRhYmxlIGFuZCB0aGVuIHRoYXQgdHlwZSBp
cyBleGNsdWRlZCBmcm9tIHRoZSByZW5hbWUgc3lzY2FsbCBydWxlLiBJZGVhbGx5LCB0aGUgY29k
ZSB3aGljaCBpcyB3cml0dGVuIHdvdWxkIHNlbGYtYXVkaXQgYSAxLWxpbmVyIGxpa2UgIkkgYW0g
Z29pbmcgdG8gcmVuYW1lIGV2ZXJ5IGZpbGUgdW5kZXIgZGlyIC9vcHQvc3BlY2lhbC9zdHVmZi8i
IHVzaW5nIGF1ZGl0X2xvZ191c2VyX21lc3NhZ2Ugc28geW91IHN0aWxsIGhhdmUgc29tZSBpZGVh
IHdoYXQgaXMgaGFwcGVuaW5nIChpZiB5b3UgY2FyZSkuCj4+Cj4+IFRoZW4geW91ciAibXktcmVu
YW1lIiBwcm9ncmFtIHN1YmplY3QgdHlwZSBvZiBteV9yZW5hbWVfdCBjYW4gYmUgdXNlZCBhcyBh
biBleGNsdWRlIG9uIHRoZSBydWxlLiBPZiBjb3Vyc2UsIHRoZSBjYWxsZXIgbXVzdCB0aGVuIGtu
b3cgdG8gdXNlIHRoaXMgcmF0aGVyIHRoYW4gdGhlIHN0YW5kYXJkIHV0aWxpdGllcy4KPgo+Cj4g
VGhpcyBzb3VuZHMgdXNlZnVsIGFuZCBtaWdodCBzb2x2ZSBvdXIgcHJvYmxlbSwgd2lsbCBpdCBi
ZSBwb3NzaWJsZSB0byBzaGFyZSBzb21lIGV4YW1wbGVzIG9uIGhvdyB0aGlzIGNhbiBiZSBhY2hp
ZXZlZD8KPgo+IFJlcGx5aW5nIG9mZi1saXN0IGFzIGl0IGlzIG5vdCBzcGVjaWZpY2FsbHkgYXVk
aXQtZm9jdXNlZC4gU2VlIFBhdWwsIEkgQ0FOIGxlYXJuLiDwn5iBCgogOykKCi0tIApwYXVsLW1v
b3JlLmNvbQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5j
b20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRp
dAo=


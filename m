Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C3467F987
	for <lists+linux-audit@lfdr.de>; Sat, 28 Jan 2023 17:23:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674923029;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AQG+HlsFor9l4+bzJ4jJpESE+BqsAqAZaSI7gMmWnik=;
	b=ee9qsvpRyVFYn2KzQG3OEwK+nFDbRgn0B1KlWf/EF1J7cPoKe9UkAROp6+U36V6dIE4rYt
	BSk9971Tn2X6Me49f/NHZsBbWD72DKtWlT7knAs2Xl+uEIvNVr1QyNf0DhoixjdixP7+Nl
	a3mArG9B9+gynCfLwJQDyD8vNKTEPYk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-K47EI_m1OHSLG6R-FEyWSg-1; Sat, 28 Jan 2023 11:23:45 -0500
X-MC-Unique: K47EI_m1OHSLG6R-FEyWSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1204A3804526;
	Sat, 28 Jan 2023 16:23:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D88B114171C1;
	Sat, 28 Jan 2023 16:23:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B979219465B7;
	Sat, 28 Jan 2023 16:23:33 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BD28F194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 23:02:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0FE6E492C18; Fri, 27 Jan 2023 23:02:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 086FC492C14
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 23:02:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DECFA1C04B7A
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 23:02:44 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-115-EqVIdFQ1NAKvOE9FdxIW7Q-1; Fri, 27 Jan 2023 18:02:43 -0500
X-MC-Unique: EqVIdFQ1NAKvOE9FdxIW7Q-1
Received: by mail-pj1-f53.google.com with SMTP id 88so5993766pjo.3
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 15:02:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PnZ4M8G6osMqcq0cay4H65EdY9MFfyodwQo99UDcY5Q=;
 b=SYZyR6mphVKXgWvq6dZIMLupkIqR+3Cqu3J2m9EEakfoB6kS/svpdk5i0hAXaO9OIu
 TiV7zfrfyS8mAr6PNsdifxF/LH8E7P1lrBqhnMuokNvbfjiIwMjEOPWRsCrLLUz4E1Tv
 dzm4wrKDviCPu4ecwhHDJV09JWoPhMS4UPp9qXHGYFtrVnmHgXyOrIkQ5DcAl5Jv3zXc
 9wCc1Fd1OhVFCp21Re3JJcMfPmzoos+jnEVKO3l73kCq8kH38goNWckC9yMsv/d17Nub
 c0fES5DET19DzLXBBe96TI11oN9MZTEu1EhCBbXghdABPbyVzr9STG0Z/SaN5s1+oLvW
 QOlg==
X-Gm-Message-State: AFqh2ko/V6rE1X7hblBjI4x8Uc8NJZ7I2hdCDa53dnMIZV9ikkRE5LfO
 0LBmTQYFxC67HyPXDlAZfY502A==
X-Google-Smtp-Source: AMrXdXt8a5YQA7h7/dDv6oqEhYSkfw+aGca5wCXf3mUxmcixKWjND2mhoCZqx6+wNxe4j6Run/cFXw==
X-Received: by 2002:a05:6a20:158e:b0:b6:5687:17b1 with SMTP id
 h14-20020a056a20158e00b000b6568717b1mr12564706pzj.4.1674860562142; 
 Fri, 27 Jan 2023 15:02:42 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 f190-20020a636ac7000000b004a737a6e62fsm2748893pgc.14.2023.01.27.15.02.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 15:02:41 -0800 (PST)
Message-ID: <7904e869-f885-e406-9fe6-495a6e9790e4@kernel.dk>
Date: Fri, 27 Jan 2023 16:02:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 0/2] two suggested iouring op audit updates
To: Paul Moore <paul@paul-moore.com>
References: <cover.1674682056.git.rgb@redhat.com>
 <da695bf4-bd9b-a03d-3fbc-686724a7b602@kernel.dk>
 <CAHC9VhSRbay5bEUMJngpj+6Ss=WLeRoyJaNNMip+TyTkTJ6=Lg@mail.gmail.com>
 <24fbe6cb-ee80-f726-b260-09f394ead764@kernel.dk>
 <CAHC9VhRuvV9vjhmTM4eGJkWmpZmSkgVaoQ=L6g3cahej-F52tQ@mail.gmail.com>
 <d9da8035-ed81-fb28-bf3a-f98c8a1e044a@kernel.dk>
 <CAHC9VhRpu7WZDqWKcLDj18A0Z5FJdUU=eUL3wbJH1CnEBWB4GA@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAHC9VhRpu7WZDqWKcLDj18A0Z5FJdUU=eUL3wbJH1CnEBWB4GA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Sat, 28 Jan 2023 16:23:32 +0000
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
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMS8yNy8yMyAzOjUz4oCvUE0sIFBhdWwgTW9vcmUgd3JvdGU6Cj4gT24gRnJpLCBKYW4gMjcs
IDIwMjMgYXQgNTo0NiBQTSBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+IHdyb3RlOgo+PiBP
biAxLzI3LzIzIDM6MzjigK9QTSwgUGF1bCBNb29yZSB3cm90ZToKPj4+IE9uIEZyaSwgSmFuIDI3
LCAyMDIzIGF0IDI6NDMgUE0gSmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRrPiB3cm90ZToKPj4+
PiBPbiAxLzI3LzIzIDEyOjQy4oCvUE0sIFBhdWwgTW9vcmUgd3JvdGU6Cj4+Pj4+IE9uIEZyaSwg
SmFuIDI3LCAyMDIzIGF0IDEyOjQwIFBNIEplbnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4gd3Jv
dGU6Cj4+Pj4+PiBPbiAxLzI3LzIzIDEwOjIz4oCvQU0sIFJpY2hhcmQgR3V5IEJyaWdncyB3cm90
ZToKPj4+Pj4+PiBBIGNvdXBsZSBvZiB1cGRhdGVzIHRvIHRoZSBpb3VyaW5nIG9wcyBhdWRpdCBi
eXBhc3Mgc2VsZWN0aW9ucyBzdWdnZXN0ZWQgaW4KPj4+Pj4+PiBjb25zdWx0YXRpb24gd2l0aCBT
dGV2ZSBHcnViYi4KPj4+Pj4+Pgo+Pj4+Pj4+IFJpY2hhcmQgR3V5IEJyaWdncyAoMik6Cj4+Pj4+
Pj4gICBpb191cmluZyxhdWRpdDogYXVkaXQgSU9SSU5HX09QX0ZBRFZJU0UgYnV0IG5vdCBJT1JJ
TkdfT1BfTUFEVklTRQo+Pj4+Pj4+ICAgaW9fdXJpbmcsYXVkaXQ6IGRvIG5vdCBsb2cgSU9SSU5H
X09QXypHRVRYQVRUUgo+Pj4+Pj4+Cj4+Pj4+Pj4gIGlvX3VyaW5nL29wZGVmLmMgfCA0ICsrKy0K
Pj4+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Pj4+Pj4KPj4+Pj4+IExvb2sgZmluZSB0byBtZSAtIHdlIHNob3VsZCBwcm9iYWJseSBhZGQgc3Rh
YmxlIHRvIGJvdGggb2YgdGhlbSwganVzdAo+Pj4+Pj4gdG8ga2VlcCB0aGluZ3MgY29uc2lzdGVu
dCBhY3Jvc3MgcmVsZWFzZXMuIEkgY2FuIHF1ZXVlIHRoZW0gdXAgZm9yIDYuMy4KPj4+Pj4KPj4+
Pj4gUGxlYXNlIGhvbGQgb2ZmIHVudGlsIEkndmUgaGFkIGEgY2hhbmNlIHRvIGxvb2sgdGhlbSBv
dmVyIC4uLgo+Pj4+Cj4+Pj4gSSBoYXZlbid0IHRha2VuIGFueXRoaW5nIHlldCwgZm9yIHRoaW5n
cyBsaWtlIHRoaXMgSSBhbHdheXMgbGV0IGl0Cj4+Pj4gc2ltbWVyIHVudGlsIHBlb3BsZSBoYXZl
IGhhZCBhIGNoYW5jZSB0byBkbyBzby4KPj4+Cj4+PiBUaGFua3MuICBGV0lXLCB0aGF0IHNvdW5k
cyB2ZXJ5IHJlYXNvbmFibGUgdG8gbWUsIGJ1dCBJJ3ZlIHNlZW4gbG90cwo+Pj4gb2YgZGlmZmVy
ZW50IGJlaGF2aW9ycyBhY3Jvc3Mgc3Vic3lzdGVtcyBhbmQgd2FudGVkIHRvIG1ha2Ugc3VyZSB3
ZQo+Pj4gd2VyZSBvbiB0aGUgc2FtZSBwYWdlLgo+Pgo+PiBTb3VuZHMgZmFpci4gQlRXLCBjYW4g
d2Ugc3RvcCBDQydpbmcgY2xvc2VkIGxpc3RzIG9uIHBhdGNoCj4+IHN1Ym1pc3Npb25zPyBHZXR0
aW5nIHRoZXNlOgo+Pgo+PiBZb3VyIG1lc3NhZ2UgdG8gTGludXgtYXVkaXQgYXdhaXRzIG1vZGVy
YXRvciBhcHByb3ZhbAo+Pgo+PiBvbiBldmVyeSByZXBseSBpcyByZWFsbHkgYW5ub3lpbmcuCj4g
Cj4gV2Uga2luZGEgbmVlZCBhdWRpdCByZWxhdGVkIHN0dWZmIG9uIHRoZSBsaW51eC1hdWRpdCBs
aXN0LCB0aGF0J3Mgb3VyCj4gbWFpbGluZyBsaXN0IGZvciBhdWRpdCBzdHVmZi4KClN1cmUsIGJ1
dCB0aGVuIGl0IHNob3VsZCBiZSBvcGVuLiBPciBkbyBzZXBhcmF0ZSBwb3N0aW5ncyBvciBzb21l
dGhpbmcuCkNDJ2luZyBhIGNsb3NlZCBsaXN0IHdpdGggb3BlbiBsaXN0cyBhbmQgc2VuZGluZyBl
bWFpbCB0byBwZW9wbGUgdGhhdAphcmUgbm90IG9uIHRoYXQgY2xvc2VkIGxpc3QgaXMgYmFkIGZv
cm0uCgotLSAKSmVucyBBeGJvZQoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1h
dWRpdEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYXVkaXQK


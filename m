Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 634E278E4B7
	for <lists+linux-audit@lfdr.de>; Thu, 31 Aug 2023 04:26:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693448801;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SnUzUNxUyZGeQnEhxNp7mjGWGiwYjPzpZzDENk4KuHM=;
	b=LskEHoHlpMwdKPOvAgPT1aZAnjtbuYLM4MFK6S9nihUsqdgTgm3+n1+OcQIWormDFGqyrL
	izdu1leLOsaPMqemlHdj6Atl562QLxLmv19SotirY1eqpQipMAC30/0YtUATsbhjsRFarD
	faBuknIU55ndXMJzpRj11iTP/oWIgfE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-VtO6vV7nM-edc5XFOkVucw-1; Wed, 30 Aug 2023 22:26:37 -0400
X-MC-Unique: VtO6vV7nM-edc5XFOkVucw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E30471C0754F;
	Thu, 31 Aug 2023 02:26:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5047D492C3C;
	Thu, 31 Aug 2023 02:26:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 62B2D19459F1;
	Thu, 31 Aug 2023 02:26:29 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2FE5D1946589 for <linux-audit@listman.corp.redhat.com>;
 Thu, 31 Aug 2023 02:26:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1AB9D400F271; Thu, 31 Aug 2023 02:26:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12A4F40C6F4F
 for <linux-audit@redhat.com>; Thu, 31 Aug 2023 02:26:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBCE5185A78B
 for <linux-audit@redhat.com>; Thu, 31 Aug 2023 02:26:27 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-meaL7xV3Nt65yrDy4CfxIA-1; Wed, 30 Aug 2023 22:26:24 -0400
X-MC-Unique: meaL7xV3Nt65yrDy4CfxIA-1
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-58fae4a5285so4933787b3.0
 for <linux-audit@redhat.com>; Wed, 30 Aug 2023 19:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693448783; x=1694053583;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZsfJ/MEEgYAJXY6xphXxWpd/ISMRnmTjf9MyGGBs+Ec=;
 b=BiNj+OeqVyLUrV8lHQjTCb0GLGvzIrrTOgZrQWcKUnSWye78aDwIPKJ4Jz4GoYBdSq
 QYuzVV3x5ms89Wcl9vC1MPht5XEqcBNXrng7UYMvpYc5ko6hnwxW82aFmp71MfahR94b
 gC+iV3ZUYZLEjVkiFSpv1zOxEod93+zI1Frsg5h/uoaPyDxTOlxpngj2/9qnrBKyiCu4
 ikKnDr9hWRaoew7Oa0yNvpI3cSSs6eBWQPNztIFlzm3PUzymAxJV3hJLN6XM6NmG+X4e
 9hptUJd0xWQ95u94t6s/prC77Nc2nuVfJv2keadqBewC+opwd5MPU9e8tYv+kUsle+E2
 tbfA==
X-Gm-Message-State: AOJu0YwhQ5aMouRNp/D8ECmN/0IZyacMMo9q1dRmR2jP10uvsywdCSy0
 QOJDNyJIg1B4MciUGrNHDZQQg1vzfx0HQlXeos+P
X-Google-Smtp-Source: AGHT+IH4UOT9KZGz6mMxMoKEsv724UIFMMXL1G/OLrTQrFR1/baKTwwLhVq6AEEM0LNJnjVnhlHHLhruUHmjvhx6gjE=
X-Received: by 2002:a0d:d9ca:0:b0:570:7b4d:f694 with SMTP id
 b193-20020a0dd9ca000000b005707b4df694mr3547864ywe.3.1693448783584; Wed, 30
 Aug 2023 19:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230829175158.20202-1-phil@nwl.cc> <ZO9kberk3iNZv2qj@calendula>
 <ZO+sbVTuNOZ4hfOe@madcap2.tricolour.ca>
In-Reply-To: <ZO+sbVTuNOZ4hfOe@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 30 Aug 2023 22:26:12 -0400
Message-ID: <CAHC9VhTJofX9c6fsB_x6wbmXunPjdaOjJe0o78AMrTHGcUAmdw@mail.gmail.com>
Subject: Re: [nf PATCH 1/2] netfilter: nf_tables: Audit log setelem reset
To: Phil Sutter <phil@nwl.cc>, Pablo Neira Ayuso <pablo@netfilter.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: Richard Guy Briggs <rgb@redhat.com>, audit@vger.kernel.org,
 linux-audit@redhat.com, netfilter-devel@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBBdWcgMzAsIDIwMjMgYXQgNDo1NOKAr1BNIFJpY2hhcmQgR3V5IEJyaWdncyA8cmdi
QHJlZGhhdC5jb20+IHdyb3RlOgo+IE9uIDIwMjMtMDgtMzAgMTc6NDYsIFBhYmxvIE5laXJhIEF5
dXNvIHdyb3RlOgo+ID4gT24gVHVlLCBBdWcgMjksIDIwMjMgYXQgMDc6NTE6NTdQTSArMDIwMCwg
UGhpbCBTdXR0ZXIgd3JvdGU6Cj4gPiA+IFNpbmNlIHNldCBlbGVtZW50IHJlc2V0IGlzIG5vdCBp
bnRlZ3JhdGVkIGludG8gbmZfdGFibGVzJyB0cmFuc2FjdGlvbgo+ID4gPiBsb2dpYywgYW4gZXhw
bGljaXQgbG9nIGNhbGwgaXMgbmVlZGVkLCBzaW1pbGFyIHRvIE5GVF9NU0dfR0VUT0JKX1JFU0VU
Cj4gPiA+IGhhbmRsaW5nLgo+ID4gPgo+ID4gPiBGb3IgdGhlIHNha2Ugb2Ygc2ltcGxpY2l0eSwg
Y2F0Y2hhbGwgZWxlbWVudCByZXNldCB3aWxsIGFsd2F5cyBnZW5lcmF0ZQo+ID4gPiBhIGRlZGlj
YXRlZCBsb2cgZW50cnkuIFRoaXMgcmVsaWV2ZXMgbmZfdGFibGVzX2R1bXBfc2V0KCkgZnJvbSBo
YXZpbmcgdG8KPiA+ID4gYWRqdXN0IHRoZSBsb2dnZWQgZWxlbWVudCBjb3VudCBkZXBlbmRpbmcg
b24gd2hldGhlciBhIGNhdGNoYWxsIGVsZW1lbnQKPiA+ID4gd2FzIGZvdW5kIG9yIG5vdC4KPiA+
Cj4gPiBBcHBsaWVkLCB0aGFua3MgUGhpbAo+Cj4gVGhhbmtzIFBoaWwsIFBhYmxvLiAgSWYgaXQg
aXNuJ3QgdG9vIGxhdGUsIHBsZWFzZSBhZGQgbXkKPiBSZXZpZXdlZC1ieTogUmljaGFyZCBHdXkg
QnJpZ2dzIDxyZ2JAcmVkaGF0LmNvbT4KClNpbWlsYXJseSwgeW91IGNhbiBhZGQgbXkgQUNLLiAg
RldJVywgaWYgeW91J3JlIHNlbmRpbmcgcGF0Y2hlcyBvdXQKZHVyaW5nIHRoZSBmaXJzdCBmZXcg
ZGF5cyBvZiB0aGUgbWVyZ2Ugd2luZG93IGl0IG1pZ2h0IGJlIGFkdmlzYWJsZSB0bwp3YWl0IG1v
cmUgdGhhbiBhIGRheSBvciB0d28gdG8gZ2l2ZSB0aGUgcmVsZXZhbnQgbWFpbnRhaW5lcnMgYSBj
aGFuY2UKdG8gcmV2aWV3IHRoZSBwYXRjaC4KCkFsc28sIGFzIGEgbm90ZSBmb3IgZnV0dXJlIHN1
Ym1pc3Npb25zLCB3ZSd2ZSBtb3ZlZCB0aGUgYXVkaXQga2VybmVsCm1haWxpbmcgbGlzdCB0byBh
dWRpdEB2Z2VyLmtlcm5lbC5vcmcuCgpBY2tlZC1ieTogUGF1bCBNb29yZSA8cGF1bEBwYXVsLW1v
b3JlLmNvbT4KCi0tIApwYXVsLW1vb3JlLmNvbQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0
CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1hdWRpdAo=


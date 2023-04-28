Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFD66F1A44
	for <lists+linux-audit@lfdr.de>; Fri, 28 Apr 2023 16:13:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682691231;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sGNlODU6kUN6H/dPiw3tRMyPoAzyQJPZJjnPn9y3mZM=;
	b=ghI9GOWE9os1/VFSBl12JguAUAIVmcMko+/yXvxqAt13TdcJKPcJap7bQRcs/sqNBZ6ZgW
	rPVztTgPsrErRoRvdOa2St5yt2GjG9ToHBPKOLa1QXdiNt45sPWULv1pU6cblJ3fhFtGql
	cSMnmPY3CFtsE+WESpGtHlRqo0O+KsA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-j8BM3vvjNdOqzMm73bR1Uw-1; Fri, 28 Apr 2023 10:13:49 -0400
X-MC-Unique: j8BM3vvjNdOqzMm73bR1Uw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A3831C08791;
	Fri, 28 Apr 2023 14:13:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1062614171B6;
	Fri, 28 Apr 2023 14:13:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E9341946A54;
	Fri, 28 Apr 2023 14:13:17 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 555551946A45 for <linux-audit@listman.corp.redhat.com>;
 Fri, 28 Apr 2023 14:13:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 200602027045; Fri, 28 Apr 2023 14:13:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17FEF2027043
 for <linux-audit@redhat.com>; Fri, 28 Apr 2023 14:13:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB25C3C0F424
 for <linux-audit@redhat.com>; Fri, 28 Apr 2023 14:13:06 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-seb_q2WjMy2PrWCNa8_lKA-1; Fri, 28 Apr 2023 10:12:59 -0400
X-MC-Unique: seb_q2WjMy2PrWCNa8_lKA-1
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-b9a6eec8611so8991082276.0
 for <linux-audit@redhat.com>; Fri, 28 Apr 2023 07:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682691178; x=1685283178;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JTbKQcfjd5D9iH8EtkRGlpw+QklSndoPT3xTwsyUZAU=;
 b=CsJ4mrJwZb5wlVwy80DXqF7/7nX8g5u2hyMLOzK+qTLRvA3oZ0yrsNZXBL6gd8E19S
 VkR/38MN8ls9EWCASbkJ0CS3TlmU3qhVmIP5OdMPhNdR4sMclP3zl7vHtIR+UWJFIoAi
 1jVV+Jr8Sxgi5D1C+tg+eeFkIrpqNjecVLKXYsSaCh5Nh0PqjhVm/S/0BvwzR7W9FJm/
 U9HPAEQODNMPdX88Ibuzf1F27oPa1AcshZk/tlagUPsGpGRg2drOwLQ1pC2vKuna1SGr
 U+taPb9aGWzQQxRLJKTvHSq0H0e2W1zAvIhIhj4kEa5CtU+4n5rDX6dSBEG225JxYT/G
 RWFA==
X-Gm-Message-State: AC+VfDyx/lx8Ip2gsg3aI2mJIZl2HnNqKaA/XBFn5vfo1jiGaZn6F8eO
 /0v738souAxea0+wIZ5iSWOPs/rqqCDY9s/+GqBHfTnef2pp8Gk=
X-Google-Smtp-Source: ACHHUZ5kpkFviSNHcxOapmLCiv0c/FJEc0z++GlMCtSO7sH/rbYy7Bq4NdR5L45vngM+lxlvM61OTCsoZ+ODnoeaTME=
X-Received: by 2002:a25:410b:0:b0:b8f:557e:d76c with SMTP id
 o11-20020a25410b000000b00b8f557ed76cmr4559318yba.25.1682691177757; Fri, 28
 Apr 2023 07:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <CABvEhECpywJRHDW6dFZU8Q3_rCZ0MpG45UQVu8fgH7ENSK37dA@mail.gmail.com>
In-Reply-To: <CABvEhECpywJRHDW6dFZU8Q3_rCZ0MpG45UQVu8fgH7ENSK37dA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 28 Apr 2023 10:12:47 -0400
Message-ID: <CAHC9VhRyYQVFErk8zFN80GVc1A4qYGpnY5-9uRLBRnL_sQX3Rg@mail.gmail.com>
Subject: Re: Re: "service auditd start" fails inside a container
To: =?UTF-8?B?5rGf5p2o?= <jiangyang.me@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBBcHIgMjgsIDIwMjMgYXQgODoyNeKAr0FNIOaxn+adqCA8amlhbmd5YW5nLm1lQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBNYXkgSSBhc2sgaWYgQXVkaXRkIHN1cHBvcnRzIERvY2tlcj8g
VGhhbmsgeW91Cj4gaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vYXJjaGl2ZXMvbGludXgtYXVk
aXQvMjAxOC1KdWx5L21zZzAwMDc4Lmh0bWwKCkhhdmUgeW91IHRyaWVkIHRoZSBjb25maWd1cmF0
aW9uIGNoYW5nZXMgc3VnZ2VzdGVkIGluIHRoZSBtYWlsaW5nIGxpc3QKcG9zdCB5b3UgbGlua2Vk
IGFib3ZlPwoKLS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QK
TGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


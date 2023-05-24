Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D269470F937
	for <lists+linux-audit@lfdr.de>; Wed, 24 May 2023 16:53:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684940009;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UGTLM1ubteZlCTt3q/dU93auckwkvGb63ZhhMtEyXXU=;
	b=XeWS8o4S/186nkd7v1ksudmATCf6mYpY4BbUgXHQRt5SmeQV/ECpTKO8+zQaELI/5dwiro
	18u6CuymI5JVxsjdfdAWiXWMemu9CL/Crymp9905yFfinSq0IMVvPKsMtIiChuoG5+KJck
	Q/iKo2pwlmofvNLX9hnmNUYv803fZMg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-VR4UICZfP5WrbWECRojzQw-1; Wed, 24 May 2023 10:53:28 -0400
X-MC-Unique: VR4UICZfP5WrbWECRojzQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 551D11C08DAE;
	Wed, 24 May 2023 14:53:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7C55C1ED99;
	Wed, 24 May 2023 14:53:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4B08E19465B9;
	Wed, 24 May 2023 14:53:23 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5EB7019465A0 for <linux-audit@listman.corp.redhat.com>;
 Wed, 24 May 2023 14:53:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3127940D1B60; Wed, 24 May 2023 14:53:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 293BE40C6EC4
 for <linux-audit@redhat.com>; Wed, 24 May 2023 14:53:21 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E2B5811E7C
 for <linux-audit@redhat.com>; Wed, 24 May 2023 14:53:21 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-PvI5FRj6Mr2agohwmHjHjQ-1; Wed, 24 May 2023 10:53:19 -0400
X-MC-Unique: PvI5FRj6Mr2agohwmHjHjQ-1
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-561d611668eso9477917b3.0
 for <linux-audit@redhat.com>; Wed, 24 May 2023 07:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684939998; x=1687531998;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xE6lNBuu4YoKMISZcORQzNf+nJW+X1mV2jIw3RSCm5Q=;
 b=ULbJvBtVksPbAwMpKl19OTi6cgtks2Ycxi4fvkbOPfp2K911EOHc8AIBXm/Z8QZ16H
 GTsbcl1rONO8C2uF+5F4eexucgU3XlZBf4sDv6ZNl1zO4U41pzGXmCp8gx2Hq6BEFl/Q
 Sa4p0bq9qcyEhrTCrro1gNaAXtWovBw16jxDgEfG1XlzS6pIRcx28UeLub3bWoLr3I7u
 vQqN06zcXMplahGEozYo8reIBzF7xEdxmGhEJsFAoNWsZHKIUxzKEVXk5K5pfJNUCFq/
 bKydrR6fnE/0Iyoh/t4/3x/unkm00qh6wXd3QU4XBiVZaTSE2ydWOFV0rAvtHztL3oZt
 VOWw==
X-Gm-Message-State: AC+VfDzcC0vdDEKtj1CjL/p8EacdLHLOI5kDKGI5Qkz8Drq+5/d6hpXU
 P5eWTMaQFSiQj4utAfvGLGGsne8Yoi7vV3O3CMgoaZhARG5YdUyP/A==
X-Google-Smtp-Source: ACHHUZ77Rq4elY0z3/4AT5NhEIQGxI8/zjnClKywexRa7FId94N0oB/LlqzNEOOSQ8hSqkeUgVb9IBw55edGc3/FZlA=
X-Received: by 2002:a81:6c57:0:b0:562:b9b:2a95 with SMTP id
 h84-20020a816c57000000b005620b9b2a95mr20488652ywc.3.1684939998476; Wed, 24
 May 2023 07:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <b5e87a11-7605-6745-516a-8004569bbe5d@gmail.com>
 <2151809.irdbgypaU6@x2>
In-Reply-To: <2151809.irdbgypaU6@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 24 May 2023 10:53:07 -0400
Message-ID: <CAHC9VhThSLtni=JuStofi78=18SdH+VCUA4eGdOkbM9=J+wzLA@mail.gmail.com>
Subject: Re: Auditd doesn't receive syscalls after installation for the
 current shell.
To: Steve Grubb <sgrubb@redhat.com>
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
Cc: audit@vger.kernel.org, linux-audit@redhat.com,
 Rinat Gadelshin <rgadelsh@gmail.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBNYXkgMjQsIDIwMjMgYXQgMTA6NDbigK9BTSBTdGV2ZSBHcnViYiA8c2dydWJiQHJl
ZGhhdC5jb20+IHdyb3RlOgo+IE9uIFdlZG5lc2RheSwgTWF5IDI0LCAyMDIzIDc6Mzc6MjcgQU0g
RURUIFJpbmF0IEdhZGVsc2hpbiB3cm90ZToKPiA+IEhlbGxvIHRoZXJlLgo+ID4KPiA+IEl0IHNl
ZW1zIHRoYXQgdGhlIGtlcm5lbCBkb2Vzbid0IHNlbmQgbWVzc2FnZXMgZm9yIHN5c2NhbGxzIG9m
IHRoZSBzaGVsbAo+ID4gcHJvY2VzcyBmcm9tIHdoaWNoIGF1ZGl0ZCBpcyBpbnN0YWxsZWQuCj4g
Pgo+ID4gUmVwcm9kdWNpbmcgc3RlcHMgKHBlcmZvcm1lZCBvbiBVYnVudHUgMjIuMDQgeDg2XzY0
IG9uIHZpcnR1YWwgYm94IGJ5Cj4gPiBgcm9vdGApOgo+ID4KPiA+IHN0ZXAgIzE6ICQgYXB0IGlu
c3RhbGwgYXVkaXRkCj4gPiBzdGVwICMyOiAkIGF1ZGl0Y3RsIC1hIGFsd2F5cyxleGl0IC1GIGFy
Y2g9YjY0IC1TIG9wZW5hdCxyZW5hbWVhdDIsdW5saW5rYXQKPiA+IHN0ZXAgIzM6ICQgZWNobyB0
PmRlbG1lO2VjaG8gdDI+PmRlbG1lO2NhdCBkZWxtZTttdiBkZWxtZSBkO212IGQKPiA+IGRlbG1l
O3JtIGRlbG1lCj4gPiBzdGVwICM0OiAkIHNlcnZpY2UgYXVkaXRkIHN0b3AKPiA+IHN0ZXAgIzU6
ICQgYXVzZWFyY2ggLWYgZGVsbWUKPiA+Cj4gPiBUaGVyZSBhcmUgc3lzY2FsbHMgZnJvbSAvdXNy
L2Jpbi9jYXQsIC91c3IvYmluL212LCAvdXNyL2Jpbi9ybSBidXQgdGhlcmUKPiA+IGFyZSBubyBh
bnkgc3lzY2FsbHMgKG9wZW5hdCBleHBlY3RlZCkKPiA+IGZvciAvdXNyL2Jpbi9iYXNoIChjdXJy
ZW50IHNoZWxsIHByb2Nlc3MpIGZvciB0aGUgZmlsZS4KPiA+Cj4gPiBJZiBzdGVwICMzIGlzIHBl
cmZvcm1lZCBmcm9tIGFub3RoZXIgdHR5LCB0aGVuIG9wZW5hdCBzeXNjYWxscwo+ID4gKENSRUFU
RSBmb3IgdGhlIGZpcnN0IGVjaG8gYW5kIE5PUk1BTCBmb3IgdGhlIHNlY29uZCBvbmUpCj4gPiBp
cyBsb2dnZWQgZm9yIHRoZSAvdXNyL2Jpbi9iYXNoIHByb2Nlc3MuCj4gPgo+ID4gYHVuYW1lIC1h
YCByZXR1cm5zOiBMaW51eCBncmluLXZiLXVidW50dS0yMi0wLTQgNS4xOS4wLTQxLWdlbmVyaWMK
PiA+ICM0Mn4yMi4wNC4wMS1VYnVudHUgU01QIFBSRUVNUFRfRFlOQU1JQyBUdWUgQXByIDE4IDE3
OjQwOjAwIFVUQyAyIHg4Nl82NAo+ID4geDg2XzY0IHg4Nl82NCBHTlUvTGludXgKPiA+Cj4gPiBT
aG91bGQgSSBvcGVuIGFuIGlzc3VlIGZvciB0aGUgY2FzZSBhdAo+ID4gaHR0cHM6Ly9naXRodWIu
Y29tL2xpbnV4LWF1ZGl0L2F1ZGl0LWtlcm5lbCA/Cj4KPiBBcmUgeW91IGJvb3Rpbmcgd2l0aCBh
dWRpdD0xID8gSWYgbm90LCB0aGUgaW5zdGFsbCBwcm9jZXNzIGFuZCBhbnkgYmVmb3JlIGl0Cj4g
YXJlIG5vdCBhdWRpdGFibGUuIFlvdSB3aWxsIG9ubHkgZ2V0IGV2ZW50cyBmb3IgcHJvY2Vzc2Vz
IHN0YXJ0ZWQgYWZ0ZXIgYXVkaXQKPiBlbmFibGVkID0gMS4KCkl0IGlzIGFsc28gd29ydGggbm90
aW5nIHRoYXQgc29tZSBkaXN0cmlidXRpb25zIChJJ20gbm90IHN1cmUgaWYgdGhpcwphcHBsaWVz
IHRvIFVidW50dSkgZWZmZWN0aXZlbHkgbGltaXQgYXVkaXRpbmcgd2l0aCB0aGVpciBkZWZhdWx0
CnJ1bnRpbWUgY29uZmlndXJhdGlvbiwgc2VlIHRoZSB3aWtpIHBhZ2UgYmVsb3cgZm9yIG1vcmUg
aW5mb3JtYXRpb246CgoqIGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1hdWRpdC9hdWRpdC1kb2N1
bWVudGF0aW9uL3dpa2kvSE9XVE8tRmVkb3JhLUVuYWJsZS1BdWRpdGluZwoKLS0gCnBhdWwtbW9v
cmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNv
bQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0
Cg==


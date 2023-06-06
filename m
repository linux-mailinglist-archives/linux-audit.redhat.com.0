Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E463E724F63
	for <lists+linux-audit@lfdr.de>; Wed,  7 Jun 2023 00:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686088948;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DblVzxqZSJR6tJcI4o8e/gYbhqNkK94xRGvdf0HdPA8=;
	b=U8c6WgoBpPjlApQNSNbDbO4btOgJyDuRExR14tB7si7GkdTEjYbz+ZhM3M+xDsq7w5Nl4l
	+dxVeaZANoKJOc+gdC2jIjKPca1TZOXtKjKBqGDH8COYEFPuZT1S1SwUvbWecjvDKjIdi/
	YiyBZ0wZrpMeUPEAOFuyryoTuTvNjlY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-5yqqw-h3PdSFmDCwiSvwtA-1; Tue, 06 Jun 2023 18:02:27 -0400
X-MC-Unique: 5yqqw-h3PdSFmDCwiSvwtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A10785A5B5;
	Tue,  6 Jun 2023 22:02:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 470D61121314;
	Tue,  6 Jun 2023 22:02:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 10AE519452C2;
	Tue,  6 Jun 2023 22:02:16 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4814819465BA for <linux-audit@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 22:02:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DFA9640CFD47; Tue,  6 Jun 2023 22:02:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D881240CFD46
 for <linux-audit@redhat.com>; Tue,  6 Jun 2023 22:02:08 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6328384953B
 for <linux-audit@redhat.com>; Tue,  6 Jun 2023 22:02:08 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-VSM3WeIRMK-XcR77LcaQmQ-1; Tue, 06 Jun 2023 18:02:07 -0400
X-MC-Unique: VSM3WeIRMK-XcR77LcaQmQ-1
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-543a6cc5f15so2851010a12.2
 for <linux-audit@redhat.com>; Tue, 06 Jun 2023 15:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686088926; x=1688680926;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7JyluoZcq+MYjmYmYkG6pHnEIWXeh/Qh9FnqVrLo02Q=;
 b=hTrIM62oBun5GtmxWqXCtqPcfDUqb3GKweJ2ShV2CSbEo2dvU39h8i0yofJksQpdFa
 hMFBEHp4Sd6I1sK4+1IE1tQvBn7tNa0d0wDrFEw9AP+g92DSvshbVU1wUj/929EwYy0E
 cMgB0UlkPPDRWmjYXnVZiEB/OZekSrfxI41tIxj0YClXOScnhkcqtt6y0asD2oysR07X
 W5CHq1BaDhvHWzcMTwv5oZdRusMEeHqiK+A+TIqpXPNGKHzkSiK5pg/Nevnb/0ea3Liw
 nn4GG7Z01qSObyPsVC5b+dNSGOG5OFQOedjW2c6zwC4M+9ruZ1YyTbOw/bSeEvj9XCjq
 ju5A==
X-Gm-Message-State: AC+VfDy8eKHrY/HxoaUNX6Jp8iDBe4Nvj0N6ThpSifomoeThxaTA5Spa
 KdbkQyF2egZPe/AIvwqjQ+NUlnX2w4ZkF3hfrEOo
X-Google-Smtp-Source: ACHHUZ71xAEzUzKi+okLdS4optrps6B33Y5/xff3LIV45tLJjlmU+hdNhG2H4xkTmu582zig2olHCCTcpebQoOHgI3E=
X-Received: by 2002:a05:6a20:1e60:b0:10c:f674:3bab with SMTP id
 cy32-20020a056a201e6000b0010cf6743babmr912004pzb.61.1686088925871; Tue, 06
 Jun 2023 15:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKmEH-s9kZn5kqkjb_QHA2X02TWX+utqu365-7cRKMM7E5eVQ@mail.gmail.com>
 <ZH5VgjpTytqaj5i5@madcap2.tricolour.ca>
 <CAMKmEH_hfOO_9a=QmUC9dQezA_hn0Kj-78hsK5GpXFbNXx2G_w@mail.gmail.com>
 <10292049.nUPlyArG6x@x2>
In-Reply-To: <10292049.nUPlyArG6x@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 6 Jun 2023 18:01:55 -0400
Message-ID: <CAHC9VhRkCJSLm8CG6tYX+fV7+J8QfJkqBcvZQ=6_MdbzsjuiXw@mail.gmail.com>
Subject: Re: Comprehensive Documentation on the Linux Audit Framework
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com,
 Vincent Abraham <vincent.ahm@gmail.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBKdW4gNiwgMjAyMyBhdCAzOjA54oCvUE0gU3RldmUgR3J1YmIgPHNncnViYkByZWRo
YXQuY29tPiB3cm90ZToKPiBPbiBUdWVzZGF5LCBKdW5lIDYsIDIwMjMgNjozMTo1NSBQTSBFRFQg
VmluY2VudCBBYnJhaGFtIHdyb3RlOgo+ID4gVGhhbmtzLiBDb3VsZCB5b3UgYWxzbyBwb2ludCB0
byBwb3J0aW9ucyBpbiB0aGUgY29kZWJhc2Ugd2hlcmUgdGhlc2UKPiA+IGZ1bmN0aW9ucyBhcmUg
Y2FsbGVkIGZvciBtb25pdG9yaW5nIGZpbGUgYWNjZXNzPwo+Cj4gSSdsbCBsZXQgUmljaGFyZCBv
ciBQYXVsIHBvaW50IHRvIHRoZSBwbGFjZSBpbiB0aGUga2VybmVsIGlmIHRoYXQncwo+IG5lY2Vz
c2FyeS4gSSB0aGluayB0aGVyZSdzIGEgZnVuZGFtZW50YWwgbWlzbWF0Y2ggYW5kIGl0IG1pZ2h0
IG5vdCBtYXR0ZXIuCgpUaGUgYXVkaXQgc3Vic3lzdGVtIGluIHRoZSBMaW51eCBLZXJuZWwgaXMg
Y3VycmVudGx5IGZvdW5kIGluIHRoZSBjb3JlCmtlcm5lbC8gZGlyZWN0b3J5OgoKJSBscyAtMSBr
ZXJuZWwvYXVkaXQqCmtlcm5lbC9hdWRpdC5jCmtlcm5lbC9hdWRpdGZpbHRlci5jCmtlcm5lbC9h
dWRpdF9mc25vdGlmeS5jCmtlcm5lbC9hdWRpdC5oCmtlcm5lbC9hdWRpdHNjLmMKa2VybmVsL2F1
ZGl0X3RyZWUuYwprZXJuZWwvYXVkaXRfd2F0Y2guYwoKPiAuLi4gd291bGQgYmUgcGF0aCwga2lu
ZCBvZiBhY2Nlc3MsIHdobyBpcyBhY2Nlc3NpbmcgaXQsIHByb2dyYW0gYWNjZXNzaW5nCj4gaXQs
IHBvcnRpb25zIG9mIHNlIGxpbnV4IGxhYmVsaW5nLCBhbmQgYSBmZXcgb3RoZXIgdGhpbmdzLgoK
RllJIGZvciBldmVyeW9uZSBvbiB0aGUgdGhyZWFkLCB0aGUgZ2VuZXJhbGx5IGFjY2VwdGVkIHdh
eSB0byB3cml0ZSB0bwoiU0VMaW51eCIgaXMgYXMgb25lIHdvcmQgKG5vIHNwYWNlIGJldHdlZW4g
dGhlICJTRSIgYW5kICJMaW51eCIpIGFuZAp3aXRoIHRoZSBmaXJzdCB0aHJlZSBsZXR0ZXJzIGNh
cGl0YWxpemVkLiAgSSBrbm93IHdlIGNhbiBiZSBhIGxpdHRsZQpsYXp5IHdpdGggY2FwaXRhbGl6
YXRpb24sIEkgZGVmaW5pdGVseSBhbSwgYnV0IHdyaXRpbmcgaXQgYXMgb25lIHdvcmQKaXMgdGhl
IGltcG9ydGFudCBwYXJ0LgoKLS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWls
aW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD7877E316
	for <lists+linux-audit@lfdr.de>; Wed, 16 Aug 2023 15:55:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692194132;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N8RXdx8pPgonfg/9AhSIva/gaP1fTDn4JGjgBHPUyyA=;
	b=IuZ0Ayob2wMyskVsveSyYar6ip7+HJuCEhVg0T9kFs5YwLBdCPFwHWV2tmtX7pOL9OIP/G
	TSUfLdwUwm97Yznf/uPG6zR2VBZISW9OMF9FXNsAttrBpKEhG4akV2QWEQerpsYezlBPEH
	0rmdeXugw2RMbhQL76kUJCvzAjQ0ROc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-lAbE4XZtPbatWv8T98xhng-1; Wed, 16 Aug 2023 09:55:28 -0400
X-MC-Unique: lAbE4XZtPbatWv8T98xhng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B6E81021E16;
	Wed, 16 Aug 2023 13:55:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8BD01C15BAE;
	Wed, 16 Aug 2023 13:55:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DBB8F1946594;
	Wed, 16 Aug 2023 13:55:18 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3B5DC1946587 for <linux-audit@listman.corp.redhat.com>;
 Wed, 16 Aug 2023 13:54:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 08CEC1121315; Wed, 16 Aug 2023 13:54:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 012A81121314
 for <linux-audit@redhat.com>; Wed, 16 Aug 2023 13:54:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9D4E856F67
 for <linux-audit@redhat.com>; Wed, 16 Aug 2023 13:54:11 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-N5Zb_01tMEWoKSpisFscxg-1; Wed, 16 Aug 2023 09:54:09 -0400
X-MC-Unique: N5Zb_01tMEWoKSpisFscxg-1
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-583d702129cso70931247b3.3
 for <linux-audit@redhat.com>; Wed, 16 Aug 2023 06:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692194049; x=1692798849;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8P8KQwRllSmi1NLwh9WWVFV2msAXlqeZx1gKCUEZWtc=;
 b=R9XUeHplXiwb/hAk9iBMpO1/Fk6Y1hMYocebVTntfIRRcf9oud0y+ywnIV+kaiAxnY
 tod47VyqyQDjUMFUzpJxqLgMhc6U7BPcCE69s1oBihyFggRS/Kw+TDRtQHkQ92c02NQT
 tcb25scQFxiOfEGDYAaCcwHoaUW6WjOJ7QbSpR54q6bfWjqoxAkx2EhKbpDpYHXw32o4
 jkzSkrBn2ylvlm3VtA7CFWEP9041/jA2hzfwMJyoO97bCOYjRgWqDSX3XWIg/ccQTWFd
 vvhDC4QFxUlQR4xEVx50yL1K7Wr+wQk6MdZdvV7K/1AFNisnUlkuzMWOG67DthZAgIuD
 zeMw==
X-Gm-Message-State: AOJu0YxVWpyVOq97Io51kE3mcfsyvdicaYwCJFVaOLyRe8iu16GDo5kc
 l4RBHLZvE4L2m1rnj2a9z+udfe1h9LOzaTWMx7ZSHm75rpooRdZqvQ==
X-Google-Smtp-Source: AGHT+IHB1ZhaV7FF5rurwVNAWtXSYkk01yX3izFX2omlCKCDMCSWprsPXt5C353QVqz40iBGAzxYwAswjfz2m7BehsA=
X-Received: by 2002:a81:4e0c:0:b0:58c:4fbb:1bb7 with SMTP id
 c12-20020a814e0c000000b0058c4fbb1bb7mr1465119ywb.5.1692194049253; Wed, 16 Aug
 2023 06:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <CAHC9VhTLQjjQ0QMfBDHYCz9LOAuO=rJWSDEUqPsFE+dowFbN=Q@mail.gmail.com>
 <b06dbdd8-d2f6-b190-5635-948c0a966103@I-love.SAKURA.ne.jp>
In-Reply-To: <b06dbdd8-d2f6-b190-5635-948c0a966103@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 16 Aug 2023 09:53:58 -0400
Message-ID: <CAHC9VhSz=3utr_CigGvkMEb6_avJUQq1Ak2smB7neSd76mzjFw@mail.gmail.com>
Subject: Re: [PATCH] audit: add task history record
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
Cc: audit@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgNjoxMOKAr0FNIFRldHN1byBIYW5kYQo8cGVuZ3Vpbi1r
ZXJuZWxAaS1sb3ZlLnNha3VyYS5uZS5qcD4gd3JvdGU6Cj4gT24gMjAyMy8wOC8xNiAzOjQ0LCBQ
YXVsIE1vb3JlIHdyb3RlOgo+ID4gT24gRnJpLCBBdWcgMTEsIDIwMjMgYXQgNjo1OOKAr0FNIFRl
dHN1byBIYW5kYQo+ID4gPHBlbmd1aW4ta2VybmVsQGktbG92ZS5zYWt1cmEubmUuanA+IHdyb3Rl
Ogo+ID4+Cj4gPj4gV2hlbiBhbiB1bmV4cGVjdGVkIHN5c3RlbSBldmVudCBvY2N1cnMsIHRoZSBh
ZG1pbmlzdHJhdG9yIG1heSB3YW50IHRvCj4gPj4gaWRlbnRpZnkgd2hpY2ggYXBwbGljYXRpb24g
dHJpZ2dlcmVkIHRoZSBldmVudC4gRm9yIGV4YW1wbGUsIHVuZXhwZWN0ZWQKPiA+PiBwcm9jZXNz
IHRlcm1pbmF0aW9uIGlzIHN0aWxsIGEgcmVhbCBjb25jZXJuIGVub3VnaCB0byB3cml0ZSBhcnRp
Y2xlcwo+ID4+IGxpa2UgaHR0cHM6Ly9hY2Nlc3MucmVkaGF0LmNvbS9zb2x1dGlvbnMvMTY1OTkz
IC4KPiA+Pgo+ID4+IFRoaXMgcGF0Y2ggYWRkcyBhIHJlY29yZCB3aGljaCBlbWl0cyBUT01PWU8t
bGlrZSB0YXNrIGhpc3RvcnkgaW5mb3JtYXRpb24KPiA+PiBpbnRvIHRoZSBhdWRpdCBsb2dzIGZv
ciBiZXR0ZXIgdW5kZXJzdGFuZGluZyBvZiB1bmV4cGVjdGVkIHN5c3RlbSBldmVudHMuCj4gPj4K
PiA+PiAgIHR5cGU9VU5LTk9XTlsxMzQwXSBtc2c9YXVkaXQoMTY5MTc1MDczOC4yNzE6MTA4KTog
aGlzdG9yeT0ibmFtZT1zd2FwcGVyLzA7cGlkPTE7c3RhcnQ9MjAyMzA4MTExOTQzMjk9Pm5hbWU9
aW5pdDtwaWQ9MTtzdGFydD0yMDIzMDgxMTE5NDM0Mz0+bmFtZT1zeXN0ZW1kO3BpZD0xO3N0YXJ0
PTIwMjMwODExMTk0NDM5PT5uYW1lPXNzaGQ7cGlkPTM2NjA7c3RhcnQ9MjAyMzA4MTExMDQ1MDQ9
Pm5hbWU9c3NoZDtwaWQ9Mzc2NztzdGFydD0yMDIzMDgxMTEwNDUzNSIKPiA+Cj4gPiBXaGlsZSBJ
IHJlc3BlY3QgeW91ciBwZXJzaXN0ZW5jZSwgd2UndmUgdGFsa2VkIGFib3V0IHRoaXMgcXVpdGUg
YSBiaXQKPiA+IGFscmVhZHkgaW4gb3RoZXIgdGhyZWFkcy4gIFdoYXQgeW91IGFyZSB0cnlpbmcg
dG8gZG8gaXMgYWxyZWFkeQo+ID4gcG9zc2libGUgd2l0aCBhdWRpdAo+Cj4gSG93PwoKSWYgeW91
IGNvbmZpZ3VyZSBhdWRpdCB0byByZWNvcmQgZXhlYygpIGFuZCBmcmllbmRzIHlvdSBzaG91bGQg
aGF2ZSBhCnByb3BlciBoaXN0b3J5IG9mIHRoZSBwcm9jZXNzZXMgc3RhcnRlZCBvbiB0aGUgc3lz
dGVtLgoKPiA+ICAgICAgICAgICAgICAgICAgICAgYW5kL29yIFRPTU9ZTyBlbmFibGVkIGFuZCBj
b25maWd1cmVkCj4KPiBXcm9uZy4gU2luY2Ugbm90IGFsbCBMU00gaG9va3MgYWxsb3cgc2xlZXBp
bmcsIFRPTU9ZTyBpcyB1bmFibGUgdG8KPiBjaGVjayBzZW5kaW5nIHNpZ25hbHMuIEFsc28sIFRP
TU9ZTyBpcyBub3QgdXNpbmcgYXVkaXQgaW50ZXJmYWNlLgoKSSBzYWlkICJhdWRpdCBhbmQvb3Ig
VE9NT1lPIjsgSSBiZWxpZXZlIHRoZSAiYW5kL29yIiBpcyBpbXBvcnRhbnQuICBJZgpJIHJlY2Fs
bCBjb3JyZWN0bHksIGFuZCBwZXJoYXBzIEkgbWlzdW5kZXJzdG9vZCB5b3UsIHlvdSBjb25jZWRl
ZCB0aGF0CmEgY29tYmluYXRpb24gb2YgYXVkaXQgKmFuZC9vciogVE9NT1lPIHdvdWxkIHNvbHZl
IHRoaXMgaXNzdWUuCgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc28gSSBzZWUgbm8KPiA+IHJlYXNvbiB3aHkgd2Ugd2FudCB0byBt
ZXJnZSB0aGlzLgo+Cj4gVGhpcyBjb2RlIG1ha2VzIGl0IHBvc3NpYmxlIHRvIHJlY29yZCBzZW5k
aW5nIHNpZ25hbHMgd2l0aCBUT01PWU8tbGlrZSBjb250ZXh0LAo+IGFuZCB3ZSBjYW4gYXZvaWQg
YXNzaWduaW5nIExTTSBJRCBmb3IgdGhpcyBjb2RlIGlmIHdlIGNhbiBtZXJnZSB0aGlzIGNvZGUg
YXMKPiBhIHBhcnQgb2YgYXVkaXQuCgpJZiB5b3Ugd2FudCBUT01PWU8tbGlrZSBpbmZvcm1hdGlv
biwgcnVuIFRPTU9ZTy4gIElmIHlvdXIgcHJlZmVycmVkCmRpc3RyaWJ1dGlvbiBkb2Vzbid0IHN1
cHBvcnQgVE9NT1lPLCB5b3UgbmVlZCB0byBlaXRoZXIgYXNrIHRoZW0gdG8Kc3VwcG9ydCBpdCwg
ZmluZCBhIG5ldyBkaXN0cmlidXRpb24gdGhhdCBkb2VzLCBvciBidWlsZCB5b3VyIG93bgprZXJu
ZWwuCgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJIHVuZGVyc3RhbmQg
eW91ciBmcnVzdHJhdGlvbiB0aGF0Cj4gPiBUT01PWU8gaXMgbm90IGVuYWJsZWQgYnkgeW91ciBw
cmVmZXJlZCBkaXN0cmlidXRpb24sIGJ1dCBhZGRpbmcKPiA+IGFkZGl0aW9uYWwgKGFuZCBhcmd1
YWJseSByZWR1bmRhbnQgY29kZSkgY29kZSB0byB0aGUgdXBzdHJlYW0ga2VybmVsCj4gPiBpcyBu
b3QgYSBzb2x1dGlvbiBJIGFtIHdpbGxpbmcgdG8gc3VwcG9ydCBhbmQgbWFpbnRhaW4gbG9uZyB0
ZXJtLgo+Cj4gTmV2ZXIgYSByZWR1bmRhbnQgY29kZS4gQWJzb2x1dGVseSBubyByZWFzb24gd2Ug
ZG9uJ3Qgd2FudCB0byBtZXJnZS4KCkF0IHRoaXMgcG9pbnQgaW4gdGltZSwgSSBvYnZpb3VzbHkg
ZGlzYWdyZWUuCgo+IFRoZSBvbmx5IGNob2ljZSBpcyB3aGljaCBhcHByb2FjaCAoYSBzdGFuZGFs
b25lIExTTSBtb2R1bGUgb3IgYSBwYXJ0IG9mIGF1ZGl0KQo+IHRvIGdvLiBDYXNleSBzdWdnZXN0
cyB0aGlzIGNvZGUgYXMgYSBwYXJ0IG9mIGF1ZGl0LiBZb3UgbXVzdCBwZXJzdWFkZSBDYXNleQo+
IGlmIHlvdSBkb24ndCB3YW50IHRoaXMgY29kZSBhcyBhIHBhcnQgb2YgYXVkaXQuCgpUbyBiZSB2
ZXJ5IGNsZWFyLCBpdCBpc24ndCBteSBkdXR5IHRvIHBlcnN1YWRlIENhc2V5IGFib3V0IGFueXRo
aW5nCihhbHRob3VnaCBpZiB5b3UndmUgZm9sbG93ZWQgdGhlIExTTSBzdGFja2luZyBzYWdhIHlv
dSBrbm93IEkndmUKZGVmaW5pdGVseSB0cmllZCBvbiBvY2Nhc2lvbiEgPGc+KS4gIE15IHJvbGUg
aGVyZSBpcyB0byBtYWludGFpbiB0aGUKYXVkaXQgc3Vic3lzdGVtIGFuZCBMU00gbGF5ZXIgKGFs
b25nIHdpdGggb3RoZXJzIHdoaWNoIGFyZW4ndCByZWxldmFudApoZXJlKSB0byB0aGUgYmVzdCBv
ZiBteSBhYmlsaXR5LiAgQSBiaWcgcGFydCBvZiB0aGF0IGlzIGVuc3VyaW5nIHdlCm1ha2UgInNt
YXJ0IGRlY2lzaW9ucyIgd2l0aCByZXNwZWN0IHRvIHdoYXQgY29kZSB3ZSBtZXJnZSBhcyB0aGlu
Z3MKbGlrZSBuZXcgTFNNcyBhbmQgbmV3IGF1ZGl0IHJlY29yZHMgYXJlIHRoaW5ncyB0aGF0IHdl
IGhhdmUgdG8gc3VwcG9ydAoqZm9yZXZlciouICBCZWNhdXNlIG9mIHRoaXMgcmF0aGVyIGV4dHJl
bWUgc3VwcG9ydCBidXJkZW4gSSBuZWVkIHRvCm1ha2Ugc3VyZSB0aGF0IHdlIGFyZW4ndCBtYWtp
bmcgb3VyIGpvYnMgKGN1cnJlbnQgZGV2ZWxvcGVycywgY3VycmVudAptYWludGFpbmVycywgYW5k
IHRob3NlIHRoYXQgd2lsbCBmb2xsb3cgdXMpIG1vcmUgZGlmZmljdWx0IHRoYW4KYWJzb2x1dGVs
eSBuZWNlc3NhcnkuICBGcm9tIG15IGN1cnJlbnQgcGVyc3BlY3RpdmUsIHRoZSBiZW5lZml0cyBv
Zgp0aGlzIHBhdGNoLCBib3RoIGluIHRlcm1zIG9mIHVuaXF1ZSBmdW5jdGlvbmFsaXR5IGFuZCBk
dXJhYmlsaXR5IG9mCnRoZSBkZXNpZ24vY29kZSwgYXJlIG5vdCBlbm91Z2ggdG8gb3V0d2VpZ2gg
dGhlIHN1cHBvcnQgYnVyZGVuLgoKLS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBt
YWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


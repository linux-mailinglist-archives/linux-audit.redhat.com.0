Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F786F6117
	for <lists+linux-audit@lfdr.de>; Thu,  4 May 2023 00:12:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683151951;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=g8QKdIW8ChElXW7l2pPeKBzv0sQALPs/0GYro1zad2U=;
	b=IllgUB6ORQapBy0e5GU4KVf5iTAGECPwzXaI5gkYSNv7CDndOQgU+DIqPV3NcjCWVyEjpZ
	cqUQOEu1pAQVwdqM43Y1KkC5mWMy6kwU4GCpNxHKtNpprJruXUWkqwqh8LzkpGu7tuja5g
	0R3R0C+yVOyK8AaL3rBW9UiIFdKpRAo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-zH13Lmc7PrGKTI64rhBxyw-1; Wed, 03 May 2023 18:12:29 -0400
X-MC-Unique: zH13Lmc7PrGKTI64rhBxyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1A58811E7B;
	Wed,  3 May 2023 22:12:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D5B7407D450;
	Wed,  3 May 2023 22:12:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C60411946A43;
	Wed,  3 May 2023 22:12:25 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6F8DE19465BB for <linux-audit@listman.corp.redhat.com>;
 Wed,  3 May 2023 22:12:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3664A2027179; Wed,  3 May 2023 22:12:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F03A2027043
 for <linux-audit@redhat.com>; Wed,  3 May 2023 22:12:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CAA2100B17F
 for <linux-audit@redhat.com>; Wed,  3 May 2023 22:12:25 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-ykTCxF6bPJqPTG_sDwApdg-1; Wed, 03 May 2023 18:12:23 -0400
X-MC-Unique: ykTCxF6bPJqPTG_sDwApdg-1
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-4f13a72ff53so1352408e87.0
 for <linux-audit@redhat.com>; Wed, 03 May 2023 15:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683151942; x=1685743942;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wmJV+5KKP6ZleB1YiKlxYeo/FavUxOXpB7BbSpovIXs=;
 b=RVxzi0RfTkAnJWRxuXPjonMhMr69wBv3FLSIsX0BnpLmUyb37V0Bui6wiRAqtxJQfN
 zujsulOVTFTPPlrZJxOHm0ws8CaFeG66lOXgqeB68xM4bYdilmZ/i18q0ZIll8JDxBgE
 E1Z2gYxSrcbduCz9B3qewVlkHabWmyvam935Gk4fCgj8NCWMKAheUScOkgPbviJYaPwp
 Ruy7c3FJK+qhK9z0eELgjKp7ppJR0XOSkJJjqFkMuE4MlUgU43JEMmXiSQyq9/FmcNVp
 wOaLRvoB8i+6rYtC5DsboxnWlwgAAnUNhNIVwaZi2NnoH72NvxmoSQLdDS1d3uBW6nVD
 W68w==
X-Gm-Message-State: AC+VfDzzgiDzy+CYvcbYxTUNNWimE1r3DRCWCz7wCUefbXTv3xmTn/ch
 36KLdOwrq2SK6u2RdxH+0Pg=
X-Google-Smtp-Source: ACHHUZ7SlB2sz4xex/XkRZVAVRIMDkKkZmhtb8ZSrwuaIlZyYvUiJFfySG5D7iEGAu4GIqSDgtHa0A==
X-Received: by 2002:ac2:5467:0:b0:4eb:252e:3ec5 with SMTP id
 e7-20020ac25467000000b004eb252e3ec5mr1205720lfn.14.1683151941622; 
 Wed, 03 May 2023 15:12:21 -0700 (PDT)
Received: from [192.168.0.31] ([94.242.171.165])
 by smtp.gmail.com with ESMTPSA id
 c8-20020ac24148000000b004edc20b8929sm6212595lfi.69.2023.05.03.15.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 15:12:21 -0700 (PDT)
Message-ID: <e5713a91-37b0-d32f-a0d2-eb668122c9e4@gmail.com>
Date: Thu, 4 May 2023 01:12:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Can AUDIT_LIST_RULES causes kthreadd-spam?
To: Paul Moore <paul@paul-moore.com>
References: <ecd4bf68-3bf1-a1d8-4da5-5fbd28c51a6b@gmail.com>
 <CAHC9VhTXHLS7bsDJ8-dSp4dQSQRcKRLiTMRYJOJVCY11G5D85A@mail.gmail.com>
From: Rinat Gadelshin <rgadelsh@gmail.com>
In-Reply-To: <CAHC9VhTXHLS7bsDJ8-dSp4dQSQRcKRLiTMRYJOJVCY11G5D85A@mail.gmail.com>
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
Cc: audit@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, ru-RU
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gMDQuMDUuMjAyMyAwMDoyNywgUGF1bCBNb29yZSB3cm90ZToKPiBPbiBXZWQsIE1heSAzLCAy
MDIzIGF0IDU6MTTigK9QTSBSaW5hdCBHYWRlbHNoaW4gPHJnYWRlbHNoQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+IEhlbGxvIHRoZXJlID0pCj4+Cj4+IE15IG5hbWUgaXMgUmluYXQuCj4+IEknbSBhIG5l
d2JpZSBoZXJlIChhdCBMaW51eCBrZXJuZWwgZGV2ZWxvcGVyIGNvbW11bml0eSkuCj4+Cj4+IE15
IGN1cnJlbnQgam9iIGlzIHRvIHdvcmsgd2l0aCBhdWRpdCBzdWJzeXN0ZW0gb24gZGlmZmVyZW50
Cj4+IHZlcnNpb25zIG9mIExpbnV4IChhbmQgZGlmZmVyZW50IGtlcm5lbCB2ZXJzaW9ucyBmcm9t
IDMuMTAgdG8gdGhlIGxhdGVzdCkKPj4gd2l0aCBhbmQgd2l0aG91dCBhdWRpdGQuCj4+Cj4+IE15
IHByb2dyYW0gd29ya3MgYmVoYWxmIG9mIHJvb3QgYWNjb3VudCBhbmQgdXNlcyBuZXRsaW5rCj4+
ICh1bmljYXN0IG9yIG11bHRpY2FzdCBkZXBlbmRzIG9mICB0aGUga2VybmVsJ3MgdmVyc2lvbikK
Pj4gdG8gY29tbXVuaWNhdGUgd2l0aCBhdWRpdCBzdWJzeXN0ZW0gb2YgdGhlIGtlcm5lbC4KPj4K
Pj4gSWYgYWN0dWFsIGF1ZGl0IHJ1bGUgbGlzdCBoYXMgYmVlbiBjaGFuZ2VkCj4+IHRoZW4gbXkg
cHJvZ3JhbSBzaG91bGQgcmVzdG9yZSB0aGUgY29uZmlndXJlZCBhdWRpdCBydWxlIGxpc3QuCj4+
Cj4+IFRvIGRvIGl0IHRoZSBwcm9ncmFtIHBlcmlvZGljYWxseSAod2l0aCA2MCBzZWNvbmRzIGlu
dGVydmFsKQo+PiByZXF1ZXN0cyB0aGUgYWN0dWFsIHJ1bGUgbGlzdCBiZSBzZW5kaW5nIEFVRElU
X0xJU1RfUlVMRVMuCj4+Cj4+IEFsbCBydWxlcyBhcmUgcmVjZWl2aW5nIHBlcmZlY3RseS4KPj4K
Pj4gQnV0IEkndmUgbm90aWNlZCB0aGF0IHRoZXJlIGFyZSBtYW55ICgySysgZm9yIDUgbWludXRl
cyB0ZXN0KQo+PiBrdGhyZWFkZCBwcm9jZXNzIGhhdmUgYmVlbiBzcGF3bmVkIGFmdGVyIHRoYXQg
cmVxdWVzdAo+PiAoSSd2ZSBzdHViYmVkIHRoZSBwb2xsIGNvZGUgYW5kIGNvbXBhcmUgbG9ncyku
Cj4gSGkgUmluYXQsCj4KPiBGaXJzdCwgYSBxdWljayBub3RlIHRoYXQgYXVkaXQgZGlzY3Vzc2lv
bnMgaW52b2x2aW5nIHRoZSB1cHN0cmVhbQo+IExpbnV4IEtlcm5lbCBoYXZlIG1vdmVkIHRvIHRo
ZSBhdWRpdEB2Z2VyLmtlcm5lbC5vcmcgbGlzdCAoQ0MnZCksCj4gcGxlYXNlIGRpcmVjdCBmdXR1
cmUgZW1haWxzIHRoZXJlLgo+Cj4gQ2FuIHlvdSBiZSBtb3JlIHNwZWNpZmljIGFib3V0IHRoZSBr
ZXJuZWwgdGhyZWFkcyB5b3UgYXJlIHNlZWluZywgYXJlCj4geW91IHNlZWluZyBtdWx0aXBsZSAi
a2F1ZGl0ZCIgdGhyZWFkcz8KPgo+ICUgcHMgLWZDIGthdWRpdGQKPiBVSUQgICAgICAgICAgUElE
ICAgIFBQSUQgIEMgU1RJTUUgVFRZICAgICAgICAgIFRJTUUgQ01ECj4gcm9vdCAgICAgICAgICA4
OSAgICAgICAyICAwIEFwcjI4ID8gICAgICAgIDAwOjAwOjAwIFtrYXVkaXRkXQo+Cj4+IFBsZWFz
ZSwgY2FuIHlvdSBwb2ludCBtZSwgd2hhdCBjYW4gSSBkbyB0byBhdm9pZCB0aGlzIGt0aHJlYWRk
LXNwYW0uCj4+Cj4+IFRoYW5rIHlvdS4KPj4KPj4gQmVzdCByZWdhcmRzCj4+IFJpbmF0aApIaSBQ
YXVsLAoKVGhhbmsgeW91IGZvciB5b3VyIHF1aWNrIGFuc3dlci4KSSBzd2VhciB0byBjb3B5IG15
IGZ1dHVyZSBxdWVzdGlvbnMgYWJvdXQgYXVkaXQgc3Vic3lzdGVtIHRvIAphdWRpdEB2Z2VyLmtl
cm5lbC5vcmcgPSkKCk15IGxvZ3MgZG9uJ3QgcHJvdmlkZSBsb3Qgb2YgaW5mbyBhYm91dCBuYXR1
cmUgb2YgdGhlIGt0aHJlYWRkcy4KKEkgaGFkbid0IHdyaXR0ZW4gdGhlIGxvZyBzeXN0ZW0pLgoK
SSBoYXZlIHNvbWV0aGluZyBsaWtlIHRoaXM6CgouLi5waWQ6IDIsIHVuaXF1ZVBpZDogMDAwMDgy
ZDgwMDAwMDAwMiwgZmlsZU5hbWU6IGt0aHJlYWRkLCBsY0ZpbGVOYW1lOiAKa3RocmVhZGQsIG5h
bWU6IGt0aHJlYWRkLCBjb21tYW5kTGluZTogU2tpcHBlZCwgbGNDb21tYW5kTGluZTogU2tpcHBl
ZCwgCnNlc3Npb25JZDogMCwgaXNSZW1vdGU6IDAsIHN5c2NhbGxOYW1lOiBmb3JrLCB1aWQ6IDQy
OTQ5NjcyOTUsIGdpZDogCjQyOTQ5NjcyOTUsIGV1aWQ6IDQyOTQ5NjcyOTUsIGVnaWQ6IDQyOTQ5
NjcyOTUsIGxvZ29uU2Vzc2lvblVpZDogLTEsIApsb2dvblNlc3Npb25Vc2VybmFtZTogU2tpcHBl
ZCwgbG9nb25TZXNzaW9uUmVtb3RlSG9zdDogLCBleGVPd25lclVpZDogMCwgCmV4ZU93bmVyR2lk
OiAwLCBleGVNb2RlOiAwLCBleGVJbm9kZTogMCwgZXhlQ2Fwc1ZlcnNpb246ICwgCmV4ZUNhcHNS
b290SWQ6ICwgZXhlQ2Fwc0VmZmVjdGl2ZTogLCBleGVDYXBzUGVybWl0dGVkOiAsIApleGVDYXBz
SW5oZXJpdGFibGU6ICwgZHN0UGlkOiAxMDY1NzQsIGRzdFRpZDogMCwgZHN0VW5pcXVlUGlkOiAK
MDAwMDgzYjEwMDAxYTA0ZSwgcmVxdWVzdElkOiAyNjg0MzU0OTQ5LCBzdGFydFRpbWU6IDAxZDk3
ZDFmYjI0YWEzOGUsIApoYXNoOiAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCwgY3dk
OiAsIGZsYWdzOiAwMDAwMDAxMSwgCnByb2Nlc3NTdGF0ZTogMywgaW50OiAwLCB0eXBlOiAwMDAw
MDAwMC4uCgpBbmQgc3VjaCBldmVudHMgb2NjdXJyZWQgMTIwOCB0aW1lcyB3aGVuIEFVRElUX0xJ
U1RfUlVMRVMgaXMgc2VuZGluZy4KVGhlIHRlc3QgaGFzIGxhc3RlZCAyIG1pbnV0ZXMuCgpUaGUg
c2FtZSB0ZXN0IGluIHdoaWNoIHRoZSByZXF1ZXN0IHdhcyBkaXNhYmxlZCBwcm9kdWNlZCBvbmx5
IDEyMiBzdWNoIApyZWNvcmRzLgoKSXQgd2FzIHRoZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiB0
aGUgdGVzdHMuCgpBcyBJIGNhbiBzZWUgaXQgd2FzIGEgZm9yayBzeXNjYWxsIG9mIGt0aHJlYWRk
LgoKQXJlIHRoZXJlIGFueSBkZWJ1ZyBvcHRpb25zIGZvciB0aGUga2VybmVsIHRoYXQgSSBjYW4g
c2V0LCByZWJ1aWxkIHRoZSAKa2VybmVsLCByZS1ydW4gdGhlIHRlc3QgYW5kIGNsYXJpZnkgdGhl
IHNpdHVhdGlvbj8KCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRo
YXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXVkaXQK


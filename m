Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E45F56B2E59
	for <lists+linux-audit@lfdr.de>; Thu,  9 Mar 2023 21:15:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678392917;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Auj8VhVuTWwlDBloqpGH4NFPfENNgXlTKMKTYdmk5YM=;
	b=H7gNtSPGbKP4wZQ2QH7HP9tgVmBmfFd64TOeeKo01TMTJL5wBpJo/S+Fjw0tM80Z/5VPR4
	D3Rqt5+ggjZIU7W8nl6x/UEnXN4e54ctYYBLMQMu+aXCbD1v8JNDal9/jlvXvg+Wavh919
	rB6gcxLuRATCg7JDQwBykPKGONdwxxE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-_NTPuXpTOxWnkbgpd4pG2A-1; Thu, 09 Mar 2023 15:15:15 -0500
X-MC-Unique: _NTPuXpTOxWnkbgpd4pG2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14DFB88646B;
	Thu,  9 Mar 2023 20:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DB2F2166B26;
	Thu,  9 Mar 2023 20:15:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AD5061946A49;
	Thu,  9 Mar 2023 20:15:07 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6870E1946597 for <linux-audit@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 20:15:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 472F21121330; Thu,  9 Mar 2023 20:15:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FBAE112132D
 for <linux-audit@redhat.com>; Thu,  9 Mar 2023 20:15:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22321811E9C
 for <linux-audit@redhat.com>; Thu,  9 Mar 2023 20:15:06 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-lMKAUmuYOAucCBueFTy2yg-1; Thu, 09 Mar 2023 15:15:04 -0500
X-MC-Unique: lMKAUmuYOAucCBueFTy2yg-1
Received: by mail-pj1-f52.google.com with SMTP id bo22so3161108pjb.4
 for <linux-audit@redhat.com>; Thu, 09 Mar 2023 12:15:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392903;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1wuOuyG4WokXW2VW1rVl6C+5LDaglsIg+F2nQF68mkk=;
 b=rp5NaRQi48z9vQijdkdKfIsBg+kMhd9qA/EOTxiH0rFWMX65ZZUbNpb7s0R/DMqkEY
 4MFxoL/pVJUIJA10RWcGC0Ut860DLH6SN7NKn0HuZQiCMgnjZTyv2oN2Invbjec4l5y6
 eg0xESy1s8DvqiIIPYMj7PHM6yyXVOPkv7PZrP5ppJIawV2D4wPNfubV7NLZPyGS6OJe
 Bjan8Lq4yrjc1ziklhvAovwIux/xVM8hImbJglnkAZckvtPWi2PSfaJ4QnMEclgRuzGs
 6jrdZY1g18KwM4hmdcB8/uGima/zbcUCnvRJ3jM3W+/Fc4K5cUJJKsxkEO8+rsVOnlIV
 sCgw==
X-Gm-Message-State: AO0yUKWHKfgvNK72rmDbIe+5iV7fb509s+jOUvEVRTDsp/n4zp2r/Cn7
 aL2DKrOgzhvF6+dCeWPFflJWUFOKc/uOTaYYII9sh1+7L9aLaNDLMA==
X-Google-Smtp-Source: AK7set/HF4eY3GsHTt9gJcWAJ1RDtp/TOFqCfOnrZHVfJz7ngjcR8XOaxSzhas+wDGKqB8jTiJsxOel1+At3vyVl+CQ=
X-Received: by 2002:a17:903:2687:b0:19a:f82f:bb25 with SMTP id
 jf7-20020a170903268700b0019af82fbb25mr8778447plb.7.1678392902828; Thu, 09 Mar
 2023 12:15:02 -0800 (PST)
MIME-Version: 1.0
References: <CAH6unQK=a54uxPjvdgNrZy57cHwZKw72rJMNeDRxAch8q46dcQ@mail.gmail.com>
 <CAHC9VhR-51mMWvrdU3AJsBi7RRiKE49rQV+PX6cifT5P=r3pqA@mail.gmail.com>
 <CAH6unQKQ7xYHpHmOoXbZK748Ge7nYTkZODVMLLiFnYTvsQBbRw@mail.gmail.com>
In-Reply-To: <CAH6unQKQ7xYHpHmOoXbZK748Ge7nYTkZODVMLLiFnYTvsQBbRw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 9 Mar 2023 15:14:51 -0500
Message-ID: <CAHC9VhQf1R_BAiGo3br4qnHN8_GR=qT=-EguMyq=K2N6N2wL-A@mail.gmail.com>
Subject: Re: Auditing nftables changes
To: Bruce Elrick <bruce.elrick@canonical.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBNYXIgOSwgMjAyMyBhdCAxMTozM+KAr0FNIEJydWNlIEVscmljayA8YnJ1Y2UuZWxy
aWNrQGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gSSB0aGluayBJIG5lZWQgdG8gY2xhcmlmeSB3
aGVyZSBJJ20gY29uZnVzZWQgOy0pCj4KPiBXaXRoIGlwdGFibGVzIHlvdSBjb3VsZCB3cml0ZSBh
IHJ1bGUgdGhhdCB3b3VsZCBvbmx5IGNhdGNoIHN5c3RlbQo+IGNhbGxzIHRoYXQgd2VyZSBmb3Ig
aXB0YWJsZXMgY2hhbmdlcy4gVGhhdCBpcywgeW91IGRpZG4ndCBuZWVkIHRvCj4gY2FwdHVyZSAq
YWxsKiBzZXRzb2Nrb3B0IGNhbGxzIChub3QgdGhhdCB0aGVyZSB3b3VsZCBiZSBsb3RzIG9mCj4g
KnRob3NlKikgYnV0IHJhdGhlciB5b3UgY291bGQgYWRkIHRoZSBhMj02NCB0byBvbmx5IGdldCB0
aGUKPiBvcD1JUFRfU09fU0VUX1JFUExBQ0Ugb25lcy4KPgo+IFdpdGggbmV0ZmlsdGVyLCBob3dl
dmVyLCBzaW5jZSB0aGUgY29udHJvbCBpbnRlcmZhY2UgaXMgbmV0bGluayBhbmQKPiBuZXRsaW5r
IHJlcXVpcmVzIGEgbWVzc2FnZSB0byBhIHNvY2tldCBhbmQgbWVzc2FnZXMgYXJlIHN0cnVjdHMs
IHRoZXJlCj4gaXMgbm8gd2F5IHRvIGhhdmUgYSBzaW1pbGFybHkgbmFycm93IGF1ZGl0IHJ1bGUg
YXMgaW4gdGhlIGNhc2Ugb2YKPiBpcHRhYmxlcy4KPgo+IFRoYXQncyB0aGUgZmlyc3QgdGhpbmcg
SSB3YW50IHRvIGNvbmZpcm06IHdoZXRoZXIgbXkgdW5kZXJzdGFuZGluZwo+IGFib3ZlIGlzIGNv
cnJlY3Q/CgpZZXMsIHlvdSBhcmUgY29ycmVjdC4KCj4gSSdtIGNvbmZ1c2VkIGJlY2F1c2UgeW91
ciBhbnN3ZXIgaW1wbGllcyBJJ20gY29ycmVjdAo+IGJ1dCB5b3UgZGlkbid0IGV4cGxpY2l0bHkg
Y29uZmlybSB0aGF0IG15IGludGVycHJldGF0aW9uIG9mIGhvdyBpdAo+IHdvcmtzIHdhcyBjb3Jy
ZWN0Lgo+Cj4gWW91IHRhbGsgYWJvdXQgaGF2aW5nIGFuIGV4Y2x1ZGUgZmlsdGVyIG9uIE5FVEZJ
TFRFUl9DRkcgKG9yIHJhdGhlcgo+IGV4Y2x1ZGUgZXZlcnl0aGluZyBleGNlcHQgTkVURklMVEVS
X0NGRz8/KSBidXQgbXkgdW5kZXJzdGFuZGluZyBpcwo+IHRoYXQgeW91IGNhbiBvbmx5IGRvIHRo
YXQgZmlsdGVyaW5nIGFmdGVyIHRoZSBmYWN0IHVzaW5nIGF1c2VhcmNoIG9yCj4gd3JpdGluZyBz
b21lIHNvcnQgb2YgY29ycmVsYXRpb24gY29kZSB1c2luZyB0aGUgYXVwYXJzZSBsaWJyYXJ5LgoK
VGhlIGtlcm5lbCBpbXBsZW1lbnRzIGFuIGV4Y2x1ZGUgZmlsdGVyIHdoaWNoIGlzIGRlc2NyaWJl
ZCBpbiB0aGUKYXVkaXRjdGwoOCkgbWFucGFnZToKCiAiQWRkIGEgcnVsZSB0byB0aGUgZXZlbnQg
dHlwZSBleGNsdXNpb24gZmlsdGVyIGxpc3QuCiAgVGhpcyBsaXN0IGlzIHVzZWQgdG8gZmlsdGVy
IGV2ZW50cyB0aGF0IHlvdSBkbyBub3QKICB3YW50IHRvIHNlZS4gRm9yIGV4YW1wbGUsIGlmIHlv
dSBkbyBub3Qgd2FudCB0byBzZWUKICBhbnkgYXZjIG1lc3NhZ2VzLCB5b3Ugd291bGQgdXNpbmcg
dGhpcyBsaXN0IHRvCiAgcmVjb3JkIHRoYXQuIEV2ZW50cyBjYW4gYmUgZXhjbHVkZWQgYnkgcHJv
Y2VzcyBJRCwKICB1c2VyIElELCBncm91cCBJRCwgbG9naW4gdXNlciBJRCwgbWVzc2FnZSB0eXBl
LAogIHN1YmplY3QgY29udGV4dCwgb3IgZXhlY3V0YWJsZSBuYW1lLiBUaGUgYWN0aW9uIGlzCiAg
aWdub3JlZCBhbmQgdXNlcyBpdHMgZGVmYXVsdCBvZiAibmV2ZXIiLgoKVGFrZW4gZnJvbSBodHRw
czovL21hbjcub3JnL2xpbnV4L21hbi1wYWdlcy9tYW44L2F1ZGl0Y3RsLjguaHRtbAoKSG93ZXZl
ciwgaW4gbXkgbGFzdCByZXBseSBJIHdhc24ndCBhZHZvY2F0aW5nIGZvciB0aGlzIHVzZSBvZiB0
aGUKZXhjbHVkZSBmaWx0ZXIsIEkgd2FzIHNpbXBseSB0cnlpbmcgdG8gZXhwbGFpbiB0aGF0IHVu
bGVzcyB5b3UgYXJlCmV4cGxpY2l0bHkgZXhjbHVkaW5nIHRoZSBjcmVhdGlvbiBvZiBORVRGSUxU
RVJfQ0ZHIHJlY29yZHMgdmlhIHRoZQpleGNsdWRlIGZpbHRlciB5b3Ugc2hvdWxkIGJlIHNlZWlu
ZyBORVRGSUxURVJfQ0ZHIGluIHlvdXIgYXVkaXQgc3RyZWFtCndpdGggYmFzaWMgYXVkaXRpbmcg
ZW5hYmxlZC4KCj4gSXQganVzdCBzZWVtZWQgc3VycHJpc2luZyB0aGF0IHRoZXJlIGlzIGEgbm9u
LXRyaXZpYWwgbG9zcyBvZiBhdWRpdAo+IGZ1bmN0aW9uYWxpdHkgYnV0IHRoYXQgSSBjb3VsZCBu
b3QgZmluZCBhbnkgb2J2aW91cyBkaXNjdXNzaW9uIGFib3V0Cj4gdGhhdC4gQnkgb2J2aW91cyBk
aXNjdXNzaW9uIEkgbWVhbiBhcyBleHBsaWNpdGx5IGFzIHdoYXQgSSdtIHRyeWluZyB0bwo+IHNh
eSBoZXJlLgoKVW5mb3J0dW5hdGVseSBpdCBpcyBhIGZhaXJseSBjb21tb24gcHJhY3RpY2UgZm9y
IGtlcm5lbCBmZWF0dXJlcyB0byBiZQphZGRlZCwgYW5kIHJlbW92ZWQsIHdpdGhvdXQgY29uc3Vs
dGluZyB3aXRoIHRoZSB2YXJpb3VzIExpbnV4IEtlcm5lbApzZWN1cml0eSBkZXZlbG9wZXJzLCBl
LmcuIGF1ZGl0LCBTRUxpbnV4LCBMU00sIGV0Yy4gIFNvbWV0aW1lcyB3ZSBhcmUKc3VjY2Vzc2Z1
bCBpbiByZXRyb2ZpdHRpbmcgdGhlIG5lY2Vzc2FyeSBzZWN1cml0eSBhbmQvb3IgYXVkaXRpbmcK
aG9va3MsIHNvbWV0aW1lcyB3ZSBhcmUgbGltaXRlZCBkdWUgdG8gZGVzaWduIGNob2ljZXMuCgo+
IFRoZSBvdGhlciB0aGluZyBJJ20gdHJ5aW5nIHRvIHVuZGVyc3RhbmQgaXMgaG93IGhlYXZ5IGFu
IGF1ZGl0IGxvYWQKPiB3b3VsZCBpdCBiZSB0byBoYXZlIGFuIGF1ZGl0IHJ1bGUgdGhhdCBjYXB0
dXJlcyAqYWxsKiBzZW5kbXNnIGNhbGxzCj4gKHdlbGwsIGFsbCBleGNlcHQgd2hlcmUgYXVpZD0t
MSBvciBhdWlkPSR7c2VydmljZXVzZXJfdWlkfSkuIEkgZG9uJ3QKPiBoYXZlIGEgZ29vZCBlbm91
Z2ggdW5kZXJzdGFuZGluZyBvZiBzeXN0ZW1zIHByb2dyYW1taW5nIHRvIGtub3cgd2hlcmUKPiBh
bmQgaG93IG9mdGVuIHRoZSBzZW5kbXNnIGlzIGNhbGxlZC4gT2YgY291cnNlIEkga25vdyB0aGlz
IGlzIGhpZ2hseQo+IGRlcGVuZGVudCBvbiB3b3JrbG9hZCwgYnV0IG15IGtub3dsZWRnZSBpcyBs
aW1pdGVkIGVub3VnaCB0aGF0IEkgSSBjYW4KPiBjb252aW5jZSBteXNlbGYgYm90aCB0aGF0IHRo
ZSBhdWRpdCBsb2FkIHdvdWxkIGJlIG5vdCB0cml2aWFsIGJ1dAo+IHN0aWxsIG1hbmFnZWFibGUg
aW4gbW9zdCBjYXNlcyBidXQgYWxzbyBJIGNhbiBjb252aW5jZSBteXNlbGYgdGhhdCBubwo+IHNh
bWUgc3lzYWRtaW4gd291bGQgY29uc2lkZXIgcnVubmluZyBzdWNoIGFuIGF1ZGl0IHJ1bGUuIFdp
dGggZmlsZSBJTwo+IGl0J3MgZWFzeSB0byBkaXN0aW5ndWlzaCB0aGF0IGZpbGUgb3BlbnMgYXJl
IHdvcnRoIGF1ZGl0aW5nIGJ1dCBmaWxlCj4gcmVhZHMgYW5kIHdyaXRlcyB3b3VsZCBiZSBpbnNh
bmUgdG8gYXVkaXQuIEl0J3Mgbm90IHNvIGNsZWFyIGZvciBtZQo+IGZvciBzb2NrZXRzLgoKVGhp
cyBpcyBnb2luZyB0byBiZSBkZXBlbmRlbnQgb24gYm90aCB0aGUgd29ya2xvYWRzIGFuZCBhcHBs
aWNhdGlvbnMKdXNlZCBvbiB0aGUgc3lzdGVtLCB0aGVyZSBpcyBubyBvbmUgInJpZ2h0IiBhbnN3
ZXIgaGVyZS4KCi0tCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QK
TGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==


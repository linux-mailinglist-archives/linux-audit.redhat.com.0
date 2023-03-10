Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2F66B4BEA
	for <lists+linux-audit@lfdr.de>; Fri, 10 Mar 2023 17:05:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678464303;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xpjd16hUHtEGU8yIszGvF9hZI2yJFgiwntJhuRUfJCg=;
	b=JdH4a3Ss/61+8RApxtcgVTaPGpf+UO/n783hUoCk4qpqTOfDW0l+Dui6oOTHPWaWvNGmEF
	bB0rPkHVMBjSUn4muvMQe2BvSWsvIxfrJagXMmQRANOzRty2QSpzrZWwRaVgQHjEy+q8Ur
	CSTez8zE/PBFZ1e413ivflgog7NE4rI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-5cfArZUHMwWuDhaoZ7_WQQ-1; Fri, 10 Mar 2023 11:05:02 -0500
X-MC-Unique: 5cfArZUHMwWuDhaoZ7_WQQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BE2C858F09;
	Fri, 10 Mar 2023 16:04:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5301A400D796;
	Fri, 10 Mar 2023 16:04:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4C0601946A66;
	Fri, 10 Mar 2023 16:04:53 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C5B211946587 for <linux-audit@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 16:04:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A57C5140EBF6; Fri, 10 Mar 2023 16:04:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DC3D140EBF4
 for <linux-audit@redhat.com>; Fri, 10 Mar 2023 16:04:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80F76100F908
 for <linux-audit@redhat.com>; Fri, 10 Mar 2023 16:04:51 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-w_PG0I11NBSw3qLsVDM4uQ-1; Fri, 10 Mar 2023 11:04:49 -0500
X-MC-Unique: w_PG0I11NBSw3qLsVDM4uQ-1
Received: by mail-pf1-f175.google.com with SMTP id ay18so3955662pfb.2
 for <linux-audit@redhat.com>; Fri, 10 Mar 2023 08:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678464288;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SMXw5SHNou9jpGHDJYRUr4a5WK4PhnJbGrw+OxpnDYs=;
 b=43gdZzq7xNfmcr4BRDbSUADkUlIALk7GYhq6BOJ4SE/rEex5k3rL2VfjYagofcumor
 ig7vSm1tKIBZ4bROJcOfFTxN9X7gBiM7ZICS2hm4bgf5LvPOXW8lnbTF8GN1X7DTRTek
 RqwicDKYA++BT37b+uFTLOYzUchC7bvP6U2woswhhF1Ac6252Bp7ccPyv4RGoa1FrnjT
 xY470G3PaqNt7JYUlJYEYNSUP/gt3VUzYxhNS7S/ANZfttHSuMms2mfHSxbaMqhTqlpR
 I3CVxE54Xty4Pr9CiTW4UyDhG1+8d7aD7GImW4QAf2uidnUXOl09CXk9hK8NJ41HuO6W
 +lEw==
X-Gm-Message-State: AO0yUKULGyJPdUxWiz/zCM17x/IeaPi9oOh63rqHPj2sBSBTAki/M8N7
 LBDNosaL1d/PPnKlCrcMstgIsKaO+mJOj8h+5s7N
X-Google-Smtp-Source: AK7set+WHjvWumpCYNeRhEJT2ayShRb8MvpX1vs3f1Ns0WvtC3hdQ+0r5xlfjuM7xQFOxjy+nkCDmlZKs7z6YZ95l00=
X-Received: by 2002:a63:b003:0:b0:503:91ff:8dd8 with SMTP id
 h3-20020a63b003000000b0050391ff8dd8mr9060862pgf.4.1678464288419; Fri, 10 Mar
 2023 08:04:48 -0800 (PST)
MIME-Version: 1.0
References: <CAH6unQK=a54uxPjvdgNrZy57cHwZKw72rJMNeDRxAch8q46dcQ@mail.gmail.com>
 <ZApM8u7iq7mDsdLW@madcap2.tricolour.ca>
 <CAH6unQJgo93VMKHUF7_LtjWu=L8yMEXfhGx6xHSDkATwG-SL=A@mail.gmail.com>
 <4470524.LvFx2qVVIh@x2>
In-Reply-To: <4470524.LvFx2qVVIh@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 10 Mar 2023 11:04:37 -0500
Message-ID: <CAHC9VhSeZpD3d0kOoNY0_y=RbwA1X1TCF97f8xA8XH9hyzsmvw@mail.gmail.com>
Subject: Re: Auditing nftables changes
To: Bruce Elrick <bruce.elrick@canonical.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgOTozNuKAr0FNIFN0ZXZlIEdydWJiIDxzZ3J1YmJAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHVyc2RheSwgTWFyY2ggOSwgMjAyMyA1OjUyOjI4IFBN
IEVTVCBCcnVjZSBFbHJpY2sgd3JvdGU6Cj4gPiBBbnl3YXksIEkgdGhpbmsgSSBuZWVkIHRvIHNw
ZW5kIHNvbWUgdGltZSBwbGF5aW5nIHVudGlsIHRoYXQgImFoYSEiCj4gPiBtb21lbnQgY29tZXMu
IEl0J3MgZmVlbHMgYSBsb3QgY2xvc2VyIHRoYW5rcyB0byBib3RoIG9mIHlvdXIgcmVzcG9uc2Vz
Cj4gPiBhbmQgSSByZWFsbHkgYXBwcmVjYWl0ZSB0aGUgdGltZSB5b3UndmUgdGFrZW4gdG8gcmVh
ZCBteSBlbWFpbHMgYW5kCj4gPiByZXNwb25kIHRvIHRoZW0uCj4KPiBUaGVyZSBhcmUgc2ltcGxl
IGV2ZW50cyB3aGljaCBhcmUgb25lIGxpbmUgYW5kIGNvbXBvdW5kIGV2ZW50cyB3aGljaCBhcmUK
PiBtdWx0aXBsZSBsaW5lcyAtIGNhbGxlZCByZWNvcmRzLiBUaGUgc2ltcGxlIGV2ZW50cyB0ZW5k
IHRvIGJlIGhhcmR3aXJlZCBhbmQKPiBub3Qgb3B0aW9uYWwuIEZvciBleGFtcGxlLCBsb2dpbnMg
YXJlIGhhcmR3aXJlZDsga2VybmVsIGNvbmZpZyBjaGFuZ2VzIGFyZQo+IGhhcmR3aXJlZDsgYXV0
aGVudGljYXRpb24gaXMgaGFyZHdpcmVkLgoKUmVhZGluZyBTdGV2ZSdzIHJlc3BvbnNlIEknbSBu
b3Qgc3VyZSB3ZSB1c2UgdGhlIHNhbWUgdGVybWlub2xvZ3ksIG9yCnBlcmhhcHMgd2UgZXhwbGFp
biBpdCBhIGJpdCBkaWZmZXJlbnRseS4gIFJlZ2FyZGxlc3MsIGhlcmUgaXMgYSBxdWljawpkZWZp
bml0aW9uIHRoYXQgSSBzdGljayB0byB3aGVuIGRpc2N1c3NpbmcgYXVkaXQ6CgoiYXVkaXQgcmVj
b3JkIjogQW4gYXVkaXQgcmVjb3JkIGlzIGEgc2luZ2xlIGxpbmUgaW4gdGhlIGF1ZGl0IGxvZyB0
aGF0CmNvbnNpc3RzIG9mIGEgdGltZXN0YW1wLCByZWNvcmQgdHlwZSAodHlwZT1YWFgpLCBhbmQg
YSBzZXJpZXMgb2YKZmllbGRzIHdoaWNoIGFyZSBkZXBlbmRlbnQgb24gdGhlIHJlY29yZCB0eXBl
LiAgSGVyZSBpcyBhbiBleGFtcGxlIG9mCmEgU1lTQ0FMTCByZWNvcmQ6CgogdHlwZT1TWVNDQUxM
IG1zZz1hdWRpdCgwMy8xMC8yMDIzIDEwOjU5OjAwLjc5Nzo1NjMpIDoKICBhcmNoPXg4Nl82NCBz
eXNjYWxsPWJwZiBzdWNjZXNzPXllcyBleGl0PTEyIGEwPUJQRl9QUk9HX0xPQUQKICBhMT0weDdm
ZmRlMGVmYzY1MCBhMj0weDgwIGEzPTB4MTMgaXRlbXM9MCBwcGlkPTEgcGlkPTI2ODMKICBhdWlk
PXJvb3QgdWlkPXJvb3QgZ2lkPXJvb3QgZXVpZD1yb290IHN1aWQ9cm9vdCBmc3VpZD1yb290CiAg
ZWdpZD1yb290IHNnaWQ9cm9vdCBmc2dpZD1yb290IHR0eT0obm9uZSkgc2VzPTEwIGNvbW09c3lz
dGVtZAogIGV4ZT0vdXNyL2xpYi9zeXN0ZW1kL3N5c3RlbWQKICBzdWJqPXVuY29uZmluZWRfdTp1
bmNvbmZpbmVkX3I6dW5jb25maW5lZF90OnMwLXMwOmMwLmMxMDIzIGtleT0obnVsbCkKCiJhdWRp
dCBldmVudCI6IEFuIGF1ZGl0IGV2ZW50IGNvbnNpc3RzIG9mIG11bHRpcGxlIGF1ZGl0IHJlY29y
ZHMKZ3JvdXBlZCB0b2dldGhlciBieSBhIHNpbmdsZSB0aW1lc3RhbXAuICBTaW5nbGUgcmVjb3Jk
IGF1ZGl0IGV2ZW50cwphcmUgYWxsb3dlZCBhbmQgZG8gZXhpc3QuICBUaGVyZSBpcyBubyB1cHBl
ciBib3VuZCBvbiB0aGUgbnVtYmVyIG9mCnJlY29yZHMgYWxsb3dlZCBpbiBhbiBhdWRpdCBldmVu
dC4gIEhlcmUgaXMgYW4gZXhhbXBsZSBvZiBhbiBhdWRpdApldmVudCBjb25zaXN0aW5nIG9mIFBS
T0NUSVRMRSwgU1lTQ0FMTCwgYW5kIEJQRiBhdWRpdCByZWNvcmRzOgoKIHR5cGU9UFJPQ1RJVExF
IG1zZz1hdWRpdCgwMy8xMC8yMDIzIDEwOjU5OjAwLjc5Nzo1NjMpIDoKICBwcm9jdGl0bGU9KHN5
c3RlbWQpCiB0eXBlPVNZU0NBTEwgbXNnPWF1ZGl0KDAzLzEwLzIwMjMgMTA6NTk6MDAuNzk3OjU2
MykgOgogIGFyY2g9eDg2XzY0IHN5c2NhbGw9YnBmIHN1Y2Nlc3M9eWVzIGV4aXQ9MTIgYTA9QlBG
X1BST0dfTE9BRAogIGExPTB4N2ZmZGUwZWZjNjUwIGEyPTB4ODAgYTM9MHgxMyBpdGVtcz0wIHBw
aWQ9MSBwaWQ9MjY4MwogIGF1aWQ9cm9vdCB1aWQ9cm9vdCBnaWQ9cm9vdCBldWlkPXJvb3Qgc3Vp
ZD1yb290IGZzdWlkPXJvb3QKICBlZ2lkPXJvb3Qgc2dpZD1yb290IGZzZ2lkPXJvb3QgdHR5PShu
b25lKSBzZXM9MTAgY29tbT1zeXN0ZW1kCiAgZXhlPS91c3IvbGliL3N5c3RlbWQvc3lzdGVtZAog
IHN1Ymo9dW5jb25maW5lZF91OnVuY29uZmluZWRfcjp1bmNvbmZpbmVkX3Q6czAtczA6YzAuYzEw
MjMga2V5PShudWxsKQogdHlwZT1CUEYgbXNnPWF1ZGl0KDAzLzEwLzIwMjMgMTA6NTk6MDAuNzk3
OjU2MykgOgogIHByb2ctaWQ9MTcyIG9wPUxPQUQKCkkgaG9wZSB0aGF0IGhlbHBzLgoKLS0KcGF1
bC1tb29yZS5jb20KCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRo
YXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXVkaXQK


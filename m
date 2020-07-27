Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D08A422F469
	for <lists+linux-audit@lfdr.de>; Mon, 27 Jul 2020 18:13:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-LVYM8y0ENX-nRM981ZCpOQ-1; Mon, 27 Jul 2020 12:13:02 -0400
X-MC-Unique: LVYM8y0ENX-nRM981ZCpOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C3D3186A838;
	Mon, 27 Jul 2020 16:12:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C23B71D3F;
	Mon, 27 Jul 2020 16:12:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D7E91809554;
	Mon, 27 Jul 2020 16:12:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06RGCUVP001113 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 12:12:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5517A201828A; Mon, 27 Jul 2020 16:12:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A3F02018284
	for <linux-audit@redhat.com>; Mon, 27 Jul 2020 16:12:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 334048007CD
	for <linux-audit@redhat.com>; Mon, 27 Jul 2020 16:12:28 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-343-LEdwe1-xNoSXJgcAYHdmEg-1; Mon, 27 Jul 2020 12:12:24 -0400
X-MC-Unique: LEdwe1-xNoSXJgcAYHdmEg-1
Received: by mail-oi1-f193.google.com with SMTP id k6so14771956oij.11
	for <linux-audit@redhat.com>; Mon, 27 Jul 2020 09:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=piFsRY7JOm24njFZpgZZGCe0rwON4Csurmi1k3Fom/s=;
	b=pIvmqtpUDVcqDjzZBdllhyx9qE/gbvOwQaCXrbCIKadvrldM5qY/KMiwG0rZzXHiOy
	Hkcjw095uVB/zRyNtytcm70W+wRi6N3oxv4K9AZqJjuVc8tVFivvUpgIqx+5Au4Nv9Rn
	+eASotVLMvOaiARjI49te3Fx2wMFbfEQQ+74qbH961CQlqTgRZhCCH9sKapOQz/hLBTh
	rsIQ/MlAo2XAdcQLrJPkYgi4le0kWdLSNg59u8Zp78Y0BHI3Kww6XvczsRejDUTIDfy9
	HkllKLnmE9GS/TdSi5rONwUr4kDsJPFMrwJr0qRJ1J7VoAP8fcYfBpbBG7Wo8mSy99gS
	omAg==
X-Gm-Message-State: AOAM531hclSDcJowtW/Mk41gTn5jYa97QO0cm3Wfrp3gIDkmJm1TtGnb
	JKvauvuHo2sreR+X3BLQyPdWWI36EhCbrAKZW7w=
X-Google-Smtp-Source: ABdhPJxzbXrmkz19yELtpn/YxAJN5p300896o7TLZsr1hdQEGgmj6ERW5cTYe5V1vbtSJwkncp45dtNUGsy/Vz4qvyg=
X-Received: by 2002:aca:c4cc:: with SMTP id u195mr56473oif.160.1595866343429; 
	Mon, 27 Jul 2020 09:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200724203226.16374-1-casey@schaufler-ca.com>
	<20200724203226.16374-3-casey@schaufler-ca.com>
In-Reply-To: <20200724203226.16374-3-casey@schaufler-ca.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 27 Jul 2020 12:12:12 -0400
Message-ID: <CAEjxPJ453W-8PmB4WPq2vZHfvvG6yWFmoqnuHtHvz5Y5MYaj1g@mail.gmail.com>
Subject: Re: [PATCH v19 02/23] LSM: Create and manage the lsmblob data
	structure.
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06RGCUVP001113
X-loop: linux-audit@redhat.com
Cc: John Johansen <john.johansen@canonical.com>,
	SElinux list <selinux@vger.kernel.org>, James Morris <jmorris@namei.org>,
	LSM List <linux-security-module@vger.kernel.org>, linux-audit@redhat.com,
	Casey Schaufler <casey.schaufler@intel.com>,
	Stephen Smalley <sds@tycho.nsa.gov>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBKdWwgMjQsIDIwMjAgYXQgNDozNSBQTSBDYXNleSBTY2hhdWZsZXIgPGNhc2V5QHNj
aGF1Zmxlci1jYS5jb20+IHdyb3RlOgo+Cj4gV2hlbiBtb3JlIHRoYW4gb25lIHNlY3VyaXR5IG1v
ZHVsZSBpcyBleHBvcnRpbmcgZGF0YSB0bwo+IGF1ZGl0IGFuZCBuZXR3b3JraW5nIHN1Yi1zeXN0
ZW1zIGEgc2luZ2xlIDMyIGJpdCBpbnRlZ2VyCj4gaXMgbm8gbG9uZ2VyIHN1ZmZpY2llbnQgdG8g
cmVwcmVzZW50IHRoZSBkYXRhLiBBZGQgYQo+IHN0cnVjdHVyZSB0byBiZSB1c2VkIGluc3RlYWQu
Cj4KPiBUaGUgbHNtYmxvYiBzdHJ1Y3R1cmUgaXMgY3VycmVudGx5IGFuIGFycmF5IG9mCj4gdTMy
ICJzZWNpZHMiLiBUaGVyZSBpcyBhbiBlbnRyeSBmb3IgZWFjaCBvZiB0aGUKPiBzZWN1cml0eSBt
b2R1bGVzIGJ1aWx0IGludG8gdGhlIHN5c3RlbSB0aGF0IHdvdWxkCj4gdXNlIHNlY2lkcyBpZiBh
Y3RpdmUuIFRoZSBzeXN0ZW0gYXNzaWducyB0aGUgbW9kdWxlCj4gYSAic2xvdCIgd2hlbiBpdCBy
ZWdpc3RlcnMgaG9va3MuIElmIG1vZHVsZXMgYXJlCj4gY29tcGlsZWQgaW4gYnV0IG5vdCByZWdp
c3RlcmVkIHRoZXJlIHdpbGwgYmUgdW51c2VkCj4gc2xvdHMuCj4KPiBBIG5ldyBsc21faWQgc3Ry
dWN0dXJlLCB3aGljaCBjb250YWlucyB0aGUgbmFtZQo+IG9mIHRoZSBMU00gYW5kIGl0cyBzbG90
IG51bWJlciwgaXMgY3JlYXRlZC4gVGhlcmUKPiBpcyBhbiBpbnN0YW5jZSBmb3IgZWFjaCBMU00s
IHdoaWNoIGFzc2lnbnMgdGhlIG5hbWUKPiBhbmQgcGFzc2VzIGl0IHRvIHRoZSBpbmZyYXN0cnVj
dHVyZSB0byBzZXQgdGhlIHNsb3QuCj4KPiBUaGUgYXVkaXQgcnVsZXMgZGF0YSBpcyBleHBhbmRl
ZCB0byB1c2UgYW4gYXJyYXkgb2YKPiBzZWN1cml0eSBtb2R1bGUgZGF0YSByYXRoZXIgdGhhbiBh
IHNpbmdsZSBpbnN0YW5jZS4KPiBCZWNhdXNlIElNQSB1c2VzIHRoZSBhdWRpdCBydWxlIGZ1bmN0
aW9ucyBpdCBpcwo+IGFmZmVjdGVkIGFzIHdlbGwuCj4KPiBBY2tlZC1ieTogU3RlcGhlbiBTbWFs
bGV5IDxzZHNAdHljaG8ubnNhLmdvdj4KPiBBY2tlZC1ieTogUGF1bCBNb29yZSA8cGF1bEBwYXVs
LW1vb3JlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDYXNleSBTY2hhdWZsZXIgPGNhc2V5QHNjaGF1
Zmxlci1jYS5jb20+CgpXaXRoIENPTkZJR19CUEZfTFNNPXk6CgpzZWN1cml0eS9icGYvaG9va3Mu
YzogSW4gZnVuY3Rpb24g4oCYYnBmX2xzbV9pbml04oCZOgpzZWN1cml0eS9icGYvaG9va3MuYzox
ODo2MzogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMyBvZgrigJhzZWN1cml0eV9hZGRfaG9va3Pi
gJkgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlClstV2Vycm9yPWluY29tcGF0aWJsZS1w
b2ludGVyLXR5cGVzXQogICAxOCB8ICBzZWN1cml0eV9hZGRfaG9va3MoYnBmX2xzbV9ob29rcywg
QVJSQVlfU0laRShicGZfbHNtX2hvb2tzKSwgImJwZiIpOwogICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn4KICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNoYXIgKgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gc2Vj
dXJpdHkvYnBmL2hvb2tzLmM6NjoKLi9pbmNsdWRlL2xpbnV4L2xzbV9ob29rcy5oOjE1OTI6MjY6
IG5vdGU6IGV4cGVjdGVkIOKAmHN0cnVjdCBsc21faWQgKuKAmQpidXQgYXJndW1lbnQgaXMgb2Yg
dHlwZSDigJhjaGFyICrigJkKIDE1OTIgfCAgICAgICAgICAgc3RydWN0IGxzbV9pZCAqbHNtaWQp
OwogICAgICB8ICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5efn5+fgoKCi0tCkxpbnV4LWF1ZGl0
IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdA==


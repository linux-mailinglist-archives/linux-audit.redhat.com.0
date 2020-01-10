Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 485F913775F
	for <lists+linux-audit@lfdr.de>; Fri, 10 Jan 2020 20:40:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578685254;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:openpgp:openpgp:autocrypt:autocrypt;
	bh=kDNSsAk6bahw8m5opL65JsYYWoMjWFYKdXR5TYT91jw=;
	b=Xiwr2vO9FZBpglWVTrUECpwyLshUmAT/cH6b1iaWblQdQP+a9EoxFdCmN+ashm7bAcrl92
	NcEiu9i10UnkXahgsGyiNIIu6+0jG/kn6EXvGFy+gO86vUtu7EsVkvM61AagXs3WyazmUJ
	q8jeSozlNskSfV2/k2Rj8hOLaDTlXrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-IwOe3dYdOSO-U-Hhry-5Qg-1; Fri, 10 Jan 2020 14:40:52 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 827EA800D48;
	Fri, 10 Jan 2020 19:40:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D8639A84;
	Fri, 10 Jan 2020 19:40:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D5484503BA;
	Fri, 10 Jan 2020 19:40:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00AJeOVs006383 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 10 Jan 2020 14:40:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E92F620316DF; Fri, 10 Jan 2020 19:40:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E44302026D67
	for <linux-audit@redhat.com>; Fri, 10 Jan 2020 19:40:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14998802E44
	for <linux-audit@redhat.com>; Fri, 10 Jan 2020 19:40:22 +0000 (UTC)
X-YMail-OSG: YOYwdwUVM1mAkhv0uA0Bs8FCVZKcL3unUIOVrJLdc19rBxw_7kFiJV3KYB0DBb7
	9.o.fwmDY969GNYtRNkB1lejAnyfMpgubJimC1g00LiavX3zYgo_C_KPAGRsp8u5g4xhhc5lzn7J
	DmJeD6Ui4ecxZKaQQnGQtDUrC0jfwscFJXxme4ky8K4iaxxdbWSdeSFxhWAI9MsHyjySN_XohYYk
	GpM58P2guy6byBwp4J3i2hhiaRY0FcmA2UtS9LS54NYuz5RuFNmXtWJCLiAygnKQ5IY6bft0rNIC
	kb4wvZwqYP7NztHtUSIKfgI7kjpcS5h5zvx9Mh8y8.LuEfwrwAoujFHlPsDskE1y4dJu_I6p.vqB
	YF1aG29D.Z.8v0kOkkBZzybGGxdOn3WZXXL335zE.S7fa0msYGHa5cgZ5T39kHpEsJ1Cm9SuplZN
	yf5ctqR9lk5aEb315xZkOZEYJNrnyd1hTAd2KGt2NAkGrQEdreHuL1_B1Vna3pHslSGWDV8t5WXz
	OBXZmIVwXX8o_FFrkCSZOkxNKuCUJoNNKJf4MbVJ0KKsoVlcMBHh5ViqMuemhwg6VoyxqoU4X2cP
	BfdCb5xvCfgpZw6d9by6TH1nIad33t4Vj03j4SZpYPO3jTxI_4y3MQqEyxR8x8HQBeHVZJbQUnEu
	yRLVTYiBYg5P1ZE5qA5QgXkN.C3HP.S8rTTkqI61jM3stkRWNEU7pn_5TvfqRGZxD.3779qJ9dg.
	DVXwAd2o4TbfKmGtfiUeEM7MOHmQF1ZeqIEfZyVdMsHwFJAvuXtw9umGI4N7L0F.BSF3rjbr_wmQ
	fbDFrVFa5VXi9hh7_rEycBowqt2xlpPZ4N0x04VnemN7TrGFCmVjn8fjGkNQkPR7vXp3sv_1sKdA
	bMDHO4XrVAXNKi._dkRLhoV_KesBA.4UxFm9p.543zOHlk9rb8wOHvWQjGm8LUI4tSn0SPuMoraQ
	_Yio2TqmfSTKm0UpmwWhl0RJ431JzFwlcvKR3QPrRpR.kA3U88N97bnH4qPeu_M4vvIxuN7AU1Wr
	op8wxjGHCTkCfYG9mm6dY46ZxnniRNa8Xhb_EKT0ngX07eD6vsFU3zjbTudoG749PuZTOhW4Ad.3
	GwpXGbIo2SYBkiK.HvDoVI90rX9D7hKJxg9qVTFl2lg_K4LbAVvnIlBGgUvmZz7FkAm3HmUzECdd
	p10DPLgeoFV2SJ.plSucteN63jNANXJ0d9Rs7Kd6G_KwfHhgESrmwgBkKqCkodDT0v_8pa2Ot8IH
	pY4.lJrfUcrWFlr4lfUXDEX_m8GfojE8_jyMS7VA.1YYpojgN2KDd8ck9Uj5MBobOX2YdJnN_7L1
	k3D4FB97iYhFfKQB67xvux74vfMdL2Mx50AcxyKkJ038k5bhNK3B0pGxyzlRrNYVzelQvnfAw1IM
	4sGUn38AfqzQ56jRUCuIJxLxU8V6eiszCRtex
Received: from sonic306-8.consmr.mail.bf2.yahoo.com
	(sonic306-8.consmr.mail.bf2.yahoo.com [74.6.132.47]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-29-n4JDjOdHPMK7dS0UW3SOJA-1;
	Fri, 10 Jan 2020 14:40:20 -0500
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.bf2.yahoo.com with HTTP;
	Fri, 10 Jan 2020 19:40:19 +0000
Received: by smtp410.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 914338581e9972fab9bf8856862b4e8a; 
	Fri, 10 Jan 2020 19:40:14 +0000 (UTC)
Subject: Re: [PATCH v13 26/25] Audit: Multiple LSM support in audit rules
To: Mimi Zohar <zohar@linux.ibm.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
References: <20191224235939.7483-1-casey.ref@schaufler-ca.com>
	<20191224235939.7483-1-casey@schaufler-ca.com>
	<ee5e4cea-b6c1-fa12-30de-8fc9007d69e9@schaufler-ca.com>
	<1578587607.5147.63.camel@linux.ibm.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <e6945c33-a540-9d0a-ba71-3602b8e38154@schaufler-ca.com>
Date: Fri, 10 Jan 2020 11:40:13 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1578587607.5147.63.camel@linux.ibm.com>
Content-Language: en-US
X-MC-Unique: n4JDjOdHPMK7dS0UW3SOJA-1
X-MC-Unique: IwOe3dYdOSO-U-Hhry-5Qg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00AJeOVs006383
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com,
	"linux-audit@redhat.com" <linux-audit@redhat.com>,
	linux-integrity@vger.kernel.org, sds@tycho.nsa.gov
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMS85LzIwMjAgODozMyBBTSwgTWltaSBab2hhciB3cm90ZToKPiBIaSBDYXNleSwKPgo+IE9u
IEZyaSwgMjAyMC0wMS0wMyBhdCAxMDo1MyAtMDgwMCwgQ2FzZXkgU2NoYXVmbGVyIHdyb3RlOgo+
PiBXaXRoIG11bHRpcGxlIHBvc3NpYmxlIHNlY3VyaXR5IG1vZHVsZXMgc3VwcG9ydGluZyBhdWRp
dCBydWxlCj4+IGl0IGlzIG5lY2Vzc2FyeSB0byBrZWVwIHNlcGFyYXRlIGRhdGEgZm9yIGVhY2gg
bW9kdWxlIGluIHRoZQo+PiBhdWRpdCBydWxlcy4gVGhpcyBhZmZlY3RzIElNQSBhcyB3ZWxsLCBh
cyBpdCByZS11c2VzIHRoZSBhdWRpdAo+PiBydWxlIGxpc3QgbWVjaGFuaXNtcy4KPiBXaGlsZSBy
ZXZpZXdpbmcgdGhpcyBwYXRjaCwgSSByZWFsaXplZCB0aGVyZSB3YXMgYSBidWcgaW4gdGhlIGJh
c2UgSU1BCj4gY29kZS4gwqBXaXRoIEphbm5lJ3MgYnVnIGZpeCwgdGhhdCBoZSBqdXN0IHBvc3Rl
ZCwgSSB0aGluayB0aGlzIHBhdGNoCj4gY2FuIG5vdyBiZSBzaW1wbGlmaWVkLgoKSG93IGFuZCB3
aGVuIGRvIHlvdSBwbGFuIHRvIGdldCBKYW5uZSdzIGZpeCBpbj8gSXQncyBsb29raW5nIGxpa2UK
c3RhY2tpbmcgd29uJ3QgYmUgaW4gZm9yIDUuNi4KCj4gTXkgbWFpbiBjb25jZXJuIGlzIHRoZSBu
dW1iZXIgb2Ygd2FybmluZyBtZXNzYWdlcyB0aGF0IHdpbGwgYmUKPiBnZW5lcmF0ZWQuIMKgQW55
IHRpbWUgYSBuZXcgTFNNIHBvbGljeSBpcyBsb2FkZWQsIHRoZSBsYWJlbHMgd2lsbCBiZQo+IHJl
LWV2YXVsYXRlZCB3aGV0aGVyIG9yIG5vdCB0aGV5IGFyZSBhcHBsaWNhYmxlIHRvIHRoZSBwYXJ0
aWN1bGFyIExTTSwKPiBjYXVzaW5nIHVubmVjZXNzYXJ5IHdhcm5pbmdzLgoKVWhnLiAKCj4KPiBN
aW1pCj4KCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNv
bQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=


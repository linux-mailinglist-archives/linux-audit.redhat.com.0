Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D2F72177E2F
	for <lists+linux-audit@lfdr.de>; Tue,  3 Mar 2020 18:59:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583258358;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=Pp8VLqzmPk5ApoG826SRrmgn7X1C9gYDb4Zc/+mwMMs=;
	b=YzCODGhmPpzs1RKXSBaDiYMB/GLu0JydlB6jaQpfhyT3wX+EtK9/bwMliAb7wA3S5T3xT8
	YVdZI2QQJHMw71DiWtuyzkvNAwZYWxL4NIcWgSbczm/bjTgRVWHAMjy4l+XsczGnlktBRM
	7O7hxJPGKYWNp8a19PLaLtaSOMQYcf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-gcBThVKAPA2Nh7vL8KH0Dw-1; Tue, 03 Mar 2020 12:59:12 -0500
X-MC-Unique: gcBThVKAPA2Nh7vL8KH0Dw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8C6013E4;
	Tue,  3 Mar 2020 17:59:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DE6119C7F;
	Tue,  3 Mar 2020 17:59:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6F1B18089CE;
	Tue,  3 Mar 2020 17:59:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 023Hx1OK008690 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 3 Mar 2020 12:59:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1835AED179; Tue,  3 Mar 2020 17:59:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14399F18C0
	for <linux-audit@redhat.com>; Tue,  3 Mar 2020 17:58:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70AD68007AC
	for <linux-audit@redhat.com>; Tue,  3 Mar 2020 17:58:58 +0000 (UTC)
Received: from sonic315-26.consmr.mail.ne1.yahoo.com
	(sonic315-26.consmr.mail.ne1.yahoo.com [66.163.190.152]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-319-_JzEYyM9MOO_L-_1e65cDg-1;
	Tue, 03 Mar 2020 12:58:56 -0500
X-MC-Unique: _JzEYyM9MOO_L-_1e65cDg-1
X-YMail-OSG: xA21w_AVM1m2TbNiEDPDwVvqzfOYNSGdXQt1DkHKX7GU9oOjqnfo0hxxCy4d661
	I8tvHWIdwfd2ExM8tBRmLBoffHImpmoNYqAUPVqXeKmeOdIpwuFNDgKVP79lbbt6Cb2Fga3pW1sn
	nzunKnEwwq5kD3ZCFOKtDBySUVhaiNO.bdq75suMbUbDs6902c_yo2eavocgRgQXFDJY5WcNIRYM
	c6Czh145ZSEv3a4oSZdbAaIMGfnoVOMcezvSUrSXC7i3G4Z1.lX56gIMqIdOGRNVP4Y.E63hH1f4
	sDeDMIDmTSSGbj9KwMW5o6w5h8NABsJxzSh_UtM6EbHkhCt0KvbtHklQQ7F0ooAOmkIarGDhuovk
	mG990xDJEAffkbXXf6L9ANR5Co2AGnRkQCzaJhfhCTuzY09j6WqMQGp.8C6vWc9tRLPmrtsPJrJu
	S4jZczOIxt9Iuax31TCY6Ct3EgFgCA4ZabfD7S99LNiPnQzOzeBom1yIvfS8V7TjLoVV_5FNOvpd
	AKFk5h5O_P8cpTi7h1rBqqxGr0ERshnDFzRipE4h7SWQNTYjPVIdlAsTqE9.wJWbYZpMU65kGbIf
	ZPR1ZODQeTElLRGrFRIQgw4ef.1dY7e7pDcGkJAAsbbvEYLr7P46HdimSh0Y3ssomQkax_YNZ.Ay
	DuSM5sfgzlGCZtiwZUmRnF0tZsYlW9GgjRiN2AyXXDWFxQbVRhs2ZnjY0Jozi8dapJQwyBLxUb5p
	XVe4YVO6HMHCQdEuLwGYzO3Yt74AGmBWEbAiTTT0Q.bn2eoHGD.k2K6I22uRBke1m4fHN2hrl23K
	adqyhHRzaOWihAIOKSoGX87eLrpHpCaefW90xnqPEvqCnld7WqvKLPf2ypmrSN9sKWN5xcxasQbt
	OGyf4VeNCXCRwCfQA0BN8EK3sH9SI.T62hUcO8tOzfrL0iytRRwgWsO4e0dTs1Tmrt26kXymOPuB
	r7rXpeQR5UqO2abG3dBKX8RcaOX67QIBHxA89NVfGSRtsnM2mj3JwJRQCXimDjPyYQpahvPR4peQ
	6RFQ9SEACCsOwmGfHofps6J3lzHXMIBbpAT9Ke4rDMae6SfuHXGRnN6Spol8C.CRsNdCMxxMvqMB
	CG11G1aRA3Lsj76Ul.lknEjhf8qBWa_T9CpdumNQtK4pr0vRvjAv6WAsNdIxXDZtvU5OgwZ3z1sQ
	E1QcCb2CPPVAvgYkgG7EiEfDJ8ncZ_UVDIMeazzEAjs9QRWhbdxeGRNgIEGYJqR2Pu2gYn.pv8fr
	l3UQq2S_kYw5cSNFPRH4Vzk7AhruolWYpJnrX8tYLiM1S7p._IfNlWtSaobtYwR5nvVfa3_5C0XN
	f3LCmJSDgRID8280vMvxJ.SfvUOYTdgY8HfTS7u5PsjS0mILohTW9OMtaFkD70e_dy5F85qxjm5q
	RzJDjER.UeauBogxAgnWuekTxoF9rJV.iKqUM2UPL
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic315.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 3 Mar 2020 17:58:55 +0000
Received: by smtp417.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID eba2199137d6ab86e2d1cf67589d94a7; 
	Tue, 03 Mar 2020 17:58:51 +0000 (UTC)
Subject: Re: [PATCH v15 00/23] LSM: Module stacking for AppArmor
To: Paul Moore <paul@paul-moore.com>
References: <20200222000407.110158-1-casey.ref@schaufler-ca.com>
	<20200222000407.110158-1-casey@schaufler-ca.com>
	<853ac380-2132-febe-fda0-ff0a0a74d480@schaufler-ca.com>
	<658202b8-c257-e74f-1769-af40cb2325ab@schaufler-ca.com>
	<CAHC9VhRVhza1wJzkxaFvJuwjifHrf_8PMuPtatkrnpWGczc6vQ@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <47ef1169-46d5-4aa3-ba19-6bc88fea0b2f@schaufler-ca.com>
Date: Tue, 3 Mar 2020 09:58:49 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRVhza1wJzkxaFvJuwjifHrf_8PMuPtatkrnpWGczc6vQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 023Hx1OK008690
X-loop: linux-audit@redhat.com
Cc: casey.schaufler@intel.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-audit@redhat.com, James Morris <jmorris@namei.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMy8zLzIwMjAgOTo1NCBBTSwgUGF1bCBNb29yZSB3cm90ZToKPiBPbiBUdWUsIE1hciAzLCAy
MDIwIGF0IDEyOjIyIFBNIENhc2V5IFNjaGF1ZmxlciA8Y2FzZXlAc2NoYXVmbGVyLWNhLmNvbT4g
d3JvdGU6Cj4+IE9uIDIvMjcvMjAyMCA5OjI5IEFNLCBDYXNleSBTY2hhdWZsZXIgd3JvdGU6Cj4+
PiBPbiAyLzIxLzIwMjAgNDowMyBQTSwgQ2FzZXkgU2NoYXVmbGVyIHdyb3RlOgo+Pj4+IFJlc2Vu
ZGluZyB0aGUgYXVkaXQgcmVsYXRlZCBwYXRjaGVzIHRvIHRoZSBhdWRpdCBsaXN0LAo+Pj4+IGFz
IHRoZXJlIGhhdmUgYmVlbiBwcm9ibGVtcyB3aXRoIHRoZSBDQyBsaXN0cy4KPj4+IFRoZXJlJ3Mg
YW4gYXdmdWwgbG90IG9mIGludGVyYWN0aW9uIGJldHdlZW4gdGhlIG1vZHVsZSBzdGFja2luZwo+
Pj4gYW5kIHRoZSBhdWRpdCBzdWItc3lzdGVtLiBJIGhhdmUgbm90IGdvdHRlbiBtdWNoIGZlZWRi
YWNrIGFib3V0Cj4+PiB0aGUgYXVkaXQgY2hhbmdlcyByZWNlbnRseSwgYnV0IEkgY2FuJ3QgYnJp
bmcgbXlzZWxmIHRvIHRoaW5rCj4+PiB0aGlzIG1lYW5zIHRoZXJlIGFyZW4ndCBhbnkgY29uY2Vy
bnMuIEJlZm9yZSBJIHN0YXJ0IHB1c2hpbmcgZm9yCj4+PiB0aGUgc3RhY2tpbmcgdG8gZ2V0IHB1
bGxlZCBJIHdvdWxkIHJlYWxseSBhcHByZWNpYXRlIGVpdGhlciBBQ0tzCj4+PiBvciBtZWFuaW5n
ZnVsIGNvbW1lbnRzIGZyb20gdGhlIGF1ZGl0IGNvbW11bml0eS4gSSBjYW4gc2VlIHRoYXQKPj4+
IHRoZXJlJ3MgYSBsb3QgZ29pbmcgb24gaW4gdGhlIGF1ZGl0IHN1Yi1zeXN0ZW0sIGFuZCBhcHBy
ZWNpYXRlCj4+PiB0aGF0IHByaW9yaXRpZXMgbWF5IGJlIGVsc2V3aGVyZS4KPj4+Cj4+PiBUaGFu
ayB5b3UuCj4+IEkgaGF2ZSB0byBzdGFydCBwdXNoaW5nIG9uIHRoaXMgc2VyaWVzLiBJZiB0aGUg
YXVkaXQgY29tbXVuaXR5Cj4+IGhhc24ndCBhbnkgYWRkaXRpb25hbCBmZWVkYmFjaywgSSdsbCB0
YWtlIGl0IHRoYXQgd2hhdCdzIGhlcmUgaXMKPj4gYWNjZXB0YWJsZSBhbmQgbW92ZSBteSBsb2Ji
eWluZyBlZmZvcnRzIGVsc2V3aGVyZS4KPiBJJ2xsIHRha2UgYW5vdGhlciBsb29rIGxhdGVyIHRo
aXMgd2Vlay4KClRoYW5rIHlvdS4gTXVjaCBhcHByZWNpYXRlZC4KwqAKCgotLQpMaW51eC1hdWRp
dCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQu
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=


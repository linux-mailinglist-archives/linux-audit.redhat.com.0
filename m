Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DF8582A36C9
	for <lists+linux-audit@lfdr.de>; Mon,  2 Nov 2020 23:51:40 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-GFfg0AuyP76En-FL9vdmEg-1; Mon, 02 Nov 2020 17:51:37 -0500
X-MC-Unique: GFfg0AuyP76En-FL9vdmEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9FBA1006C83;
	Mon,  2 Nov 2020 22:51:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D29C5B4A5;
	Mon,  2 Nov 2020 22:51:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CDF3F180B658;
	Mon,  2 Nov 2020 22:51:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A2MpKSN022218 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 17:51:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AE5075D230; Mon,  2 Nov 2020 22:51:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5A5A7CA4F
	for <linux-audit@redhat.com>; Mon,  2 Nov 2020 22:51:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DA95101CC67
	for <linux-audit@redhat.com>; Mon,  2 Nov 2020 22:51:17 +0000 (UTC)
Received: from sonic313-15.consmr.mail.ne1.yahoo.com
	(sonic313-15.consmr.mail.ne1.yahoo.com [66.163.185.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-272-cbmchGP5N72UTVoqEIyz4g-1;
	Mon, 02 Nov 2020 17:51:15 -0500
X-MC-Unique: cbmchGP5N72UTVoqEIyz4g-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1604357474; bh=VwgKbZQkU2nWGS9yf6ido7LzpItxhP/ElCsIOxQMaC2=;
	h=Subject:To:From:Date;
	b=qDvibxH3BpqHE77ijvSwMjKt5Do0DYAtoPExV88gUWNIBimo0ZWy1m8jGycxeLlMMZrCFarKLpAZomZGKmRdeo6IOCB8EpmLo/ULeT0tfEBBhtiO+oQ8JKa9gTEoTYwu3WCYMRKBQJfkUCtdnLou5qW/sLxPc1E7NkClDksMVBO/MqJXcA8uQLggij0zzOlci1HJmyUpdklccRddMRl0nM7ec6SBZeepFbIX3DOV9FWxsUzyXOz3am75XfG5BM/XlxxB2jasua95TBllD1KFD78b44gJ8R4s6dhpjMuLowPmM8ZYPwRamd7TPVE/j1KPG28Ck6NpMtDjfqkrcD9wUQ==
X-YMail-OSG: PRaNyLYVM1n2bIdT_U2ifrr5uH6kZHdXEF0Gc8eOSPI5uxWS39rDMFwIY9lVmWk
	tvd_j9deV9dUejUNcLI8E.Pz33S2FQE6wZ8LEbhCQDbdz9kGXOty0MiktJ0B4hRQezdH4ZW9dKzU
	tqivFYu6eChV4fVwXus2.ZcdOZAhNz0UfSwHMt5UFozTmPCrqGqwPDmi2.imgMofsy3UCF9vSzwL
	TRB5CCTvMyXCOUJDLmKNmjt2xe3Hy.n1L_6b7shSIqnBVEPdA5vfIljv3277k.Sn.LmwNkQ.0_zd
	21miPrFe9sSxWw6n4YZk5_6VDqeq0xEHBolb8nmJYjDGelgCFL5_a_XusluLGVraMh.9me2qhrFc
	NLvFIuEezKQDhr4UHa2ukUmtPKu2a6fQttusP4KTc_59teIIPGuTfv41GvG2y2sPDXlsVuRsL8lL
	MiIE.ia4gy.oiUC8FT3mmyqYhOiou51hyKvnUoY.oO8X88rbpAOCSHkinA5ShFT9FIWXCXPGt38A
	jMFSEWk9eVeZKbg2sVsJCVxfl6QqllLWe7QI1vrDYYcIBJgLpaWBMfA.yKZU3RO1QN5y.6zAnYFh
	85OellqElMml.oeXh8y2M3pklveQZ5vPPNI.jgAtG.AceqJOC9WGBq7zM6pU_BdiB_wu0rl0nKHQ
	ukxqHIkRQs5ycEXr3xeTT3KZ5AMzebizgzTcWq__T9fb.CTbyeO2ZmS4pdeQ0RjTsqYRJFQ0CPww
	1Z4XoFftf12hoCaWB4wXjk7j9_jqnmlC9TseF4QBfEBn7XYxxTXBV_tPM6zUwXyhwBkOillwUSID
	uwr2QGaF.lybkrW7d135UPHk0eK3Mab.rC9SFUBdix71CqL6ruUELfzpe2vZ07VSpn3WPvIgejRT
	I4OFbduWKIdQul71CKNrhs28DBgsuicpPkBXM.PWMtA4_cz2X6xciU7LGn3xb1QQqMkJ4jwHCqLu
	DRimhfLJ2CJ8q_CIWLmA8QN8OSwi.cPPQIzKo4gh6NYobMP0Rv4A0EjB0ItmKn8afC3SILxPuvAm
	6ga9heHeAnAJyv0WSC0Ud3SqYx4mX2M2M15eC6yB0VC8BMLhuHD9JvbzUjFEONgrEWdkAN1UlEGS
	ycaqGx408Zrh23F2jRoax4WKF2kpug2fwYWK0ZsWSkMu3jzN5qiNxOKVOUiLGUMovghcKmD7vwGQ
	rXSA3vGXpZEd7ARrBqhGGNO0i0vv_wTBKmWYTdQ7Wg6bcbQefg2iO1xkxkLWxmfMXqFx9MEdwrB_
	d0cuIEMPpUAqfMZIRjtQoccRCY_YFrrBDJoyjQ5nDIF9fETs8kBa3ncz97SCYP60b6jsAmuWPxLs
	jLBz6hIOit65294TdT76qsXyS9LkAVXZ4x6JANRG5my8d31rGrAymPyiwMVtRffmy.1knhhWASFp
	W6vY_KqgSiOubwO3gSJrkDkv.LqEiOfNtsvnGwKQZN0bdsuL5tKItwQDX4ACif9fs3LNEYPBByms
	E6.WaX_JbVbcRWZE9RpeWjsTpjSDbLbsgNuRa0975RbNfThq5S4bmxCFYwmu2VqS8QMutB6Kwqr6
	UNpiu0tNsg1GTzj2_WqlJW5VRNOTeG.ptwQBSHrGeXwc.ZzUqUAvtipm02LAgI2thPu.7cQlq9yP
	thrJ04qWtzEc01NGHftPcSfzAXtwWAjZnH5wcOxHU.4KycMpXKJqGZsqZWX26L368q592mV6B50L
	JJvliKu1T5uFiXBLxrJ0G0SZOinhjnMn.6R5do2A3uj55.iGIMIDSPE9Zh.BWpPgYRyRveA5ySym
	1yJaEYWjk7YA8BNdS7fKU84TIU43aXwqRzISO6r5J2xnomGvfBF.YW6OAofWM.KmxLnQGqZNvofZ
	nBO3xouG7gJj_NxgkrF14l_EAlCO7DmIATSXp1LoYsVcGiUDrYLvRDqyNlmmOSCQoteMyVAVtael
	AQ9QpKjvcbboAmVIMjPp.BS3cMdsj2q4VuP7MggHzVISfkRCtWICPvDMYef3Hv1Nxq9oHYM2ltT4
	a8tZro32ZuKcdMX9MGl_RquIwcyZIlC9e5H_qVNX.sa5XnEBkhvfIbkp7wmKqqNreGl5m3Ap2adI
	83YP6T7mlF04YfnwAaun8tYZMgWqgKflXEENjLY3ZDGSLj7yrQ88QWgr8915q032xnou8JSXGXTA
	0S.IhXt6t_mvSFrVNs_mzeEDRa0blJCCmlUDKj920M6LuCWZXy7aUCrj8Wlw3c8BUv_qgjShDAWy
	OSYT01EsuaLJNTVxbQOk39obltABU6lSvunv51QSSUJSVWJ8pLodSOm6mtPWdaj0n5BRx6BelcfA
	FZ.YXI5jizHH_.Z9Gbgv_M3IZjSuslgO_TfBlEl09_iofRQhlyF5XEWIJ9QbMAlBxzVLfh4f09Ef
	qEMLrS26QklsAaZMbzwDSRBzVNBbpR0hlGygRCMbOZGTgTdqYYbQikQQ0Na7Jcniy9a.DLICSMPZ
	eSN5OwJtghbRonoDHlrCE4jixC9qnEEJMLwXvZ9sCVIUlDgnZYuiBMbPU5s.s3bMn0iWwsWgAFMz
	a0dTC8PAR4iDKAkakMG8mFUT_RrdmpZ8uwDBpw5_OdPtsWycRDz2WomwG9fDCRIIPB4esPOcRsnq
	4iQiDkPTeTgXMIJNw4S0KMEzBYEYT4gNtuGU_lN6BgJAfev7SDloVYguNJWkilxDXjzCgyCeaTUk
	CGUiEvdBkmNcF1bo_bjcKg6nzy17j5suOVDJXT4LmfOOzafeLwgme.qK0wuYSSFPvFfgb1kkpU..
	tL4z2pdTVJl7GZ8EVoAAenwkKXCxAKGwt3NWuDEi3QVR0ncVFVCTGtVSHsFtjkY_DTdCsKwJA6GR
	iS8k4XDbuFdOu_uqWa_cz17baWv2Jfyh94AjHBt7a3cPGqz9fSpcwFLNPUtl3mLmZFAFQSi9hAuu
	4apUxjKshCkeToJwiR_ZfVJh.hjeJ74S8abCnSronEQwEsA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 2 Nov 2020 22:51:14 +0000
Received: by smtp403.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID fa3f7b4475e22ed23aa62386af82e4db; 
	Mon, 02 Nov 2020 22:51:12 +0000 (UTC)
Subject: Re: [RFC PATCH] audit-testsuite: tests for subject and object
	correctness
To: Richard Guy Briggs <rgb@redhat.com>
References: <e4bf30e2-a92f-99b7-30d0-3e3473e30399.ref@schaufler-ca.com>
	<e4bf30e2-a92f-99b7-30d0-3e3473e30399@schaufler-ca.com>
	<20201102220834.GD55072@madcap2.tricolour.ca>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <6c950188-a516-e9ed-caa5-42de40861596@schaufler-ca.com>
Date: Mon, 2 Nov 2020 14:51:11 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201102220834.GD55072@madcap2.tricolour.ca>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMTEvMi8yMDIwIDI6MDggUE0sIFJpY2hhcmQgR3V5IEJyaWdncyB3cm90ZToKPiBPbiAyMDIw
LTExLTAyIDEzOjU0LCBDYXNleSBTY2hhdWZsZXIgd3JvdGU6Cj4+IFZlcmlmeSB0aGF0IHRoZXJl
IGFyZSBzdWJqPSBhbmQgb2JqPSBmaWVsZHMgaW4gYSByZWNvcmQKPj4gaWYgYW5kIG9ubHkgaWYg
dGhleSBhcmUgZXhwZWN0ZWQuIEEgc3lzdGVtIHdpdGhvdXQgYSBzZWN1cml0eQo+PiBtb2R1bGUg
dGhhdCBwcm92aWRlcyB0aGVzZSBmaWVsZHMgc2hvdWxkIG5vdCBpbmNsdWRlIHRoZW0uCj4+IEEg
c3lzdGVtIHdpdGggbXVsdGlwbGUgc2VjdXJpdHkgbW9kdWxlcyBwcm92aWRpbmcgdGhlc2UgZmll
bGRzCj4+IChlLmcuIFNFTGludXggYW5kIEFwcEFybW9yKSBzaG91bGQgYWx3YXlzIHByb3ZpZGUg
Ij8iIGZvciB0aGUKPj4gZGF0YSBhbmQgYWxzbyBpbmNsdWRlIGEgQVVESVRfTUFDX1RBU0tfQ09O
VEVYVFMgb3IKPj4gQVVESVRfTUFDX09CSl9DT05URVhUUyByZWNvcmQuIFRoZSB0ZXN0IHVzZXMg
dGhlIExTTSBsaXN0IGZyb20KPj4gL3N5cy9rZXJuZWwvc2VjdXJpdHkvbHNtIHRvIGRldGVybWlu
ZSB3aGljaCBmb3JtYXQgaXMgZXhwZWN0ZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENhc2V5IFNj
aGF1ZmxlciA8Y2FzZXlAc2NoYXVmbGVyLWNhLmNvbT4KPj4gLS0tCj4+ICB0ZXN0cy9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4+ICB0ZXN0cy9tdWx0aXBsZV9jb250ZXh0cy9N
YWtlZmlsZSB8ICAxMiArKysKPj4gIHRlc3RzL211bHRpcGxlX2NvbnRleHRzL3Rlc3QgICAgIHwg
MTY2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gIDMgZmlsZXMgY2hhbmdlZCwg
MTc5IGluc2VydGlvbnMoKykKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9tdWx0aXBsZV9j
b250ZXh0cy9NYWtlZmlsZQo+PiAgY3JlYXRlIG1vZGUgMTAwNzU1IHRlc3RzL211bHRpcGxlX2Nv
bnRleHRzL3Rlc3QKPj4KPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL01ha2VmaWxlIGIvdGVzdHMvTWFr
ZWZpbGUKPj4gaW5kZXggYTdmMjQyYS4uZjIwZjZiMSAxMDA2NDQKPj4gLS0tIGEvdGVzdHMvTWFr
ZWZpbGUKPj4gKysrIGIvdGVzdHMvTWFrZWZpbGUKPj4gQEAgLTE4LDYgKzE4LDcgQEAgVEVTVFMg
Oj0gXAo+PiAgCWZpbGVfY3JlYXRlIFwKPj4gIAlmaWxlX2RlbGV0ZSBcCj4+ICAJZmlsZV9yZW5h
bWUgXAo+PiArCW11bHRpcGxlX2NvbnRleHRzIFwKPiAiY29udGV4dCIgaXMgYSBiaXQgYW1iaWd1
b3VzLiAgQ291bGQgdGhpcyBiZSBuYW1lZCBzb21ldGhpbmcgdG8gaW5kaWNhdGUKPiBhIHNlY3Vy
aXR5IGNvbnRleHQgcmF0aGVyIHRoYW4gYW55IG90aGVyIHNvcnQsIHN1Y2ggYXMgYXVkaXQgb3Ig
dXNlcgo+IGNvbnRleHQ/CgpXb3VsZCAic3Vial9vYmpfZmllbGRzIiBiZSBiZXR0ZXI/CsKgCgot
LQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczov
L3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=


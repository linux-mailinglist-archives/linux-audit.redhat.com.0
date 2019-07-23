Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B7E70DEC
	for <lists+linux-audit@lfdr.de>; Tue, 23 Jul 2019 02:11:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D648308A958;
	Tue, 23 Jul 2019 00:11:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F3F05C225;
	Tue, 23 Jul 2019 00:11:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6BD041800207;
	Tue, 23 Jul 2019 00:11:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6N0BLe4018159 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 22 Jul 2019 20:11:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 254CA1024802; Tue, 23 Jul 2019 00:11:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EF611024807
	for <linux-audit@redhat.com>; Tue, 23 Jul 2019 00:11:18 +0000 (UTC)
Received: from sonic308-14.consmr.mail.gq1.yahoo.com
	(sonic308-14.consmr.mail.gq1.yahoo.com [98.137.68.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5866B8552A
	for <linux-audit@redhat.com>; Tue, 23 Jul 2019 00:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1563840676; bh=DBV7/x3xoW7QTC3hwriPXJs6iZdKAX+urpRThTirHEU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject;
	b=HCHeFRAxYN6WH22rEPudEj7YxAkFXqn2/24LQdhv65F9UbGgEpBjON0AXgGWgjNelDH/Qb23jy0NQhwJyouP85f5jVfWwTmILt1FXvQXZGsp4L2dLYX7/EpKGnbh3Zf8Ehpj0q3i2E4RPpv/I4dEDcL0HPJAFkVoYVSalGZL9yB+GLPd/aj6cg8eB1o8WMItumfUpsPr6R+/h0jk6Q99n9JP1BLoPgbS4QP9+C6owJME/Hx9GprY6PzKRIHXBKf+l7XjGDaTJCjNVYWG0N9KAh33ij9Y34qwZ6IWpXn/V3WDQu2QOB58E1ZofUq7nbjHDP3FVlXgQuSCfbjvJPppbg==
X-YMail-OSG: y.mn210VM1moypHHlL8H9hwSNTZVuELVEumtFU4XWQtSeimdTREDIaHyhsfVu6H
	92fRSLZB5w7.kNVumOzf0HnnDd1.F967QvurCdWFgJpg6u_l5QXNUARbK0qgcfMZIRxujiKst0rR
	FBq5ion0r1WRN1sf2yPFP9N_vi.1.JvISwC5CG7ZxF9On._casHqmtzkuUOsZzxh5KVEQoJix9sO
	HXcqZzmlxs2UbZIzR9GDjGispFmIAawgCOrpLxff4sNR1BDY0Qu.b_d0vYTygGQ4es27O64l9sPK
	jsAryGJmw5l0AmdihE3HeruTQ1dmh9z.9fPcAcfkOPp25hJzmiXEytG38rsVWPGIdh92y41h9r8D
	hgwkZFMs9DZpqW.s9UVEU6PZpOpd_TM.dTufvCK6IvOGu5uKmpckGEhZpdul.k3dJwa1ag6yqboA
	ohhHCw5oJ4s2aR2qlYxpUc5nKWD0oG549eQhvffH6VgS7Q8Vbi8x2yhBSwH6ZD_CxkbP1xDJ1LU0
	lgs7BrsUDCM36AJ88gcCIqLp4r_UM_gSeZPUnkWV3xgdEGVJPxdnvcToFDutBSWVZfImOZAkjl.g
	EdLbOyL4VRuDWt6eOamR2i0BI4bSxLcZCzGe0.0fYjRHhwtPfox.c5QhiU1CsWiA6eaQ81mflej5
	FUH70yA96snWFQQlfbTOqjus16EOD5tN5WKKc9PAVyYWrcOe1tfh5OWTMrR8sTgnP7MYr_25fkhJ
	JmWfALNyJn.N_lw6VSL0kIU636mwUoiinYt8tXWFwRPslse6.caVw3T5hzYQjEgXUtIe89AxEVTH
	21USXr8fAF.AXR6MAAE7ql78rblofVJK3K_Zufx6KyH1gBI.iK.sloxkZb1TqOGWaiT7qE0ud9ab
	E1zdv4Wo1jN.rkVA7VTiTsdEjQZS4t7R.7WcFqnB2D2MfQpiiZnP7zOJKg4BeQXMr6jrSFjq.81U
	sftGHKs6pFBHW3w_qPqN6G2_q.L.zvVrTeI5ZqjH.BZBlsnX8UBW9JkUpn9oojnZ_6h8TKGr6cop
	Xd8OCqXmxb9O8rt1wk7MOuVlSOglhLO9z1ecexzpEbzO454eo3dpjvg28xXuVKZTHjr4LmeTRXS0
	8hsWehBiqzMLUja4MOB2RBsk4QT8In2l6yQbDHBItDvq59nVboqyT_0qz8YaVGyXUaX9iV4u82Eo
	IDq6ApYy.VNo.n3dPB_w1lD83SIIqYMOW8v68ySBH3MeQdM6_omdn22JW.6ecuWTVyhI3sXrqklG
	EgisT
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic308.consmr.mail.gq1.yahoo.com with HTTP;
	Tue, 23 Jul 2019 00:11:16 +0000
Received: by smtp408.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 56845b65d4aaa757f603e99d53fc3c4c; 
	Tue, 23 Jul 2019 00:11:12 +0000 (UTC)
Subject: Re: Preferred subj= with multiple LSMs
To: Paul Moore <paul@paul-moore.com>
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<d1a237d3-4b72-48b0-27d6-fb168354ad31@schaufler-ca.com>
	<CAHC9VhTQLihNQ1iGjJB=LAn=C6BQokFsjsRcj8O_O9AjqQ7HBg@mail.gmail.com>
	<2517266.eHZzEmjMsX@x2>
	<27e2c710-efe6-d9cd-d4f9-bc217df5ede3@schaufler-ca.com>
	<CAHC9VhTpcnyGg5j3b6Z7Yi0Ob01JETRiBmz1AuLqPWqP9tEAnA@mail.gmail.com>
	<5ea2a25b-364f-3c30-79c6-cfb18515d7ba@schaufler-ca.com>
	<CAHC9VhQ9MSh5zCkhMja4r9j0RT952LwKSaG5dR-BqXzXrtEAUw@mail.gmail.com>
	<e9cf875a-0d0f-a56f-71dd-c22c67bdcc2d@schaufler-ca.com>
	<CAHC9VhQS9We1TNqRfuR_E-kV4aZddx9euaiv5Gzd5B5AkiDAUQ@mail.gmail.com>
	<f375c23c-29e6-dc98-d71c-328db91117bc@schaufler-ca.com>
	<CAHC9VhTf0yYDZBxOtfv2E5=GtrBYonoqr46hyBy7qdNdjVLoVg@mail.gmail.com>
	<alpine.LRH.2.21.1907230649460.18217@namei.org>
	<ca22ea45-3f3b-4f79-8d77-7528877b8b36@schaufler-ca.com>
	<CAHC9VhSbg7BxPSA4NkQV3_1zx6cj3ej25e6fJ2FBWX9fU104rg@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <7bf96896-8a6b-bec7-3bbe-3b5dad74e1f8@schaufler-ca.com>
Date: Mon, 22 Jul 2019 17:11:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSbg7BxPSA4NkQV3_1zx6cj3ej25e6fJ2FBWX9fU104rg@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Tue, 23 Jul 2019 00:11:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Tue, 23 Jul 2019 00:11:17 +0000 (UTC) for IP:'98.137.68.38'
	DOMAIN:'sonic308-14.consmr.mail.gq1.yahoo.com'
	HELO:'sonic308-14.consmr.mail.gq1.yahoo.com'
	FROM:'casey@schaufler-ca.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 98.137.68.38 sonic308-14.consmr.mail.gq1.yahoo.com
	98.137.68.38 sonic308-14.consmr.mail.gq1.yahoo.com
	<casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6N0BLe4018159
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, James Morris <jmorris@namei.org>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>,
	Simon McVittie <smcv@collabora.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 23 Jul 2019 00:11:40 +0000 (UTC)

T24gNy8yMi8yMDE5IDM6MzAgUE0sIFBhdWwgTW9vcmUgd3JvdGU6Cj4gT24gTW9uLCBKdWwgMjIs
IDIwMTkgYXQgNjowMSBQTSBDYXNleSBTY2hhdWZsZXIgPGNhc2V5QHNjaGF1Zmxlci1jYS5jb20+
IHdyb3RlOgo+PiBPbiA3LzIyLzIwMTkgMTo1MCBQTSwgSmFtZXMgTW9ycmlzIHdyb3RlOgo+Pj4g
T24gRnJpLCAxOSBKdWwgMjAxOSwgUGF1bCBNb29yZSB3cm90ZToKPj4+Cj4+Pj4+IFdlJ3ZlIG5l
dmVyIGhhZCB0byB0aGluayBhYm91dCBoYXZpbmcgZ2VuZXJhbCBydWxlcyBvbgo+Pj4+PiB3aGF0
IHNlY3VyaXR5IG1vZHVsZXMgZG8gYmVmb3JlLCBiZWNhdXNlIHdpdGggb25seSBvbmUKPj4+Pj4g
YWN0aXZlIGVhY2ggY291bGQgZG8gd2hhdGV2ZXIgaXQgd2FudGVkIHdpdGhvdXQgZmVhciBvZgo+
Pj4+PiBjb25mbGljdC4gSWYgdGhlcmUgaXMgYWxyZWFkeSBhIGNoYXJhY3RlciB0aGF0IG5vbmUg
b2YKPj4+Pj4gdGhlIGV4aXN0aW5nIG1vZHVsZXMgdXNlLCBob3cgd291bGQgaXQgYmUgd3Jvbmcg
dG8KPj4+Pj4gcmVzZXJ2ZSBpdD8KPj4+PiAiV2UndmUgbmV2ZXIgaGFkIHRvIHRoaW5rIGFib3V0
IGhhdmluZyBnZW5lcmFsIHJ1bGVzIG9uIHdoYXQgc2VjdXJpdHkKPj4+PiBtb2R1bGVzIGRvIGJl
Zm9yZS4uLiIKPj4+Pgo+Pj4+IFdlIGZhbW91c2x5IGhhdmVuJ3QgaW1wb3NlZCByZXN0cmljdGlv
bnMgb24gdGhlIGxhYmVsIGZvcm1hdCBiZWZvcmUKPj4+PiBub3csIGFuZCB0aGlzIHNlZW1zIGxp
a2UgYSBwcmV0dHkgcG9vciByZWFzb24gdG8gc3RhcnQuCj4+PiBBZ3JlZWQuCj4+IEluIGEgZm9s
bG93IG9uIHRocmVhZAo+Pgo+PiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC1z
ZWN1cml0eS1tb2R1bGUvbXNnMjk5OTYuaHRtbAo+Pgo+PiB3ZSd2ZSBiZWVuIGRpc2N1c3Npbmcg
dGhlIG5lZWRzIG9mIGRidXMtZGFlbW9uIGluIGEgbXVsdGlwbGUgTFNNCj4+IGVudmlyb25tZW50
LiBJIHN1Z2dlc3QgdGhhdCBpZiBzdXBwb3J0aW5nIGRidXMgd2VsbCBpcyBhc3Npc3RlZCBieQo+
PiBtYWtpbmcgcmVhc29uYWJsZSByZXN0cmljdGlvbnMgb24gd2hhdCBjb25zdGl0dXRlcyBhIHZh
bGlkIExTTQo+PiAiY29udGV4dCIgdGhhdCB3ZSBoYXZlIGEgZ29vZCByZWFzb24uIFdoaWxlIHRo
ZXJlIGFyZSB3YXlzIHRvCj4+IHByZXNlbnQgZ3JvdXBzIG9mIGFyYml0cmFyeSBodW5rcyBvZiBk
YXRhLCB3aHkgd291bGQgd2Ugd2FudCB0bz8KPiBJIGNvbnRpbnVlIHRvIGJlbGlldmUgdGhhdCBy
ZXN0cmljdGlvbnMgb24gdGhlIGxhYmVsIGZvcm1hdCBhcmUgYSBiYWQKPiBpZGVhLCBhbmQgSSBm
dXJ0aGVyIGJlbGlldmUgdGhhdCBtdWx0aXBsZXhpbmcgdGhlIGxhYmVscyBpcyBnb2luZyB0bwo+
IGJlIGEgbWFqb3IgcHJvYmxlbSB0aGF0IHdpbGwgaGF1bnQgdXMgZm9yIG1hbnksIG1hbnkgeWVh
cnMuICBJZiB3ZSBhcmUKPiBnb2luZyB0byBzdXBwb3J0IG11bHRpcGxlIHNpbXVsdGFuZW91cyBM
U01zIEkgdGhpbmsgd2UgbmVlZCB0byBmaW5kIGEKPiB3YXkgdG8gcmVwcmVzZW50IHRob3NlIGxh
YmVscyBpbmRlcGVuZGVudGx5LgoKTGV0J3MgcmV2aWV3IHRoZSBiaWRkaW5nOgoKQXVkaXQgd2Fu
dHMgdG8gbWFpbnRhaW4gYmFja3dhcmQgY29tcGF0aWJpbGl0eSB3aGlsZSBhbHNvIGdldHRpbmcK
dGhlIGluZm9ybWF0aW9uIGFib3V0IG11bHRpcGxlIHN1YmplY3QgYW5kIG9iamVjdCBsYWJlbHMu
IFRoZSBjdXJyZW50CnByb3Bvc2FsOgoKCS4uLiBzdWJqPWE6YjpjOmQgXAoJLi4uIG9iaj1lOmY6
ZzpoIG9ial9zZWxpbnV4PWU6ZjpnOmggb2JqX211bWJsZT1Dcml2ZW5zIFwKCS4uLiBzdWJqX3Nl
bGludXg9YTpiOmM6ZCBzdWJqX211bWJsZT1GZWVnbGUgXAoJLi4uCgp3aGVyZSBvYmpfPGxzbT4g
YW5kIHN1YmpfPGxzbT4gYXJlIG9ubHkgcHJvdmlkZWQgaWYgdGhlcmUncyBtb3JlIHRoYW4Kb25l
IGFjdGl2ZSAiZGlzcGxheSIgTFNNLgoKRGJ1cyB3YW50cyBhbiBhdG9taWMgZmV0Y2ggb2YgdGhl
IHNlY3VyaXR5IGF0dHJpYnV0ZXMgZnJvbSBhIHNvY2tldAphbmQgZnJvbSBhIC9wcm9jIGVudHJ5
LiBXZSBkb24ndCB3YW50IHRvIGJyZWFrIGNvbXBhdGliaWxpdHksIHNvIG5ldwppbnRlcmZhY2Vz
IGFyZSBwcm92aWRlZDoKCglTT19QRUVSQ09OVEVYVAkJLSBwYWNrZXQgbGFiZWwgaW4gdGhlICJI
aWRlb3VzIiBmb3JtYXQKCS9wcm9jLy4uLi9hdHRyL2NvbnRleHQJLSBwcm9jZXNzIGxhYmVsIGlu
IHRoZSAiSGlkZW91cyIgZm9ybWF0CgpMZWdhY3kgcHJvZ3JhbXMgd2FudCB0aGUgc2VjdXJpdHkg
YXR0cmlidXRlcyBmcm9tIGEgc29ja2V0CmFuZCBmcm9tIGEgL3Byb2MgZW50cnkuIFNpbmNlIHRo
ZXkgZG9uJ3Qga25vdyBob3cgdG8gZGlmZmVyZW50aWF0ZQp3aGljaCBzZWN1cml0eSBtb2R1bGUg
aXMgYWN0aXZlLCB0aGVzZSBhcmUgY29udHJvbGxlZCBieSB0aGUKImRpc3BsYXkiLCB3aGljaCBk
ZWZhdWx0cyB0byB0aGUgZmlyc3QgbW9kdWxlIGxvYWRlZCB0aGF0IHByb3ZpZGVzCmEgc2VjaWRf
dG9fc2VjY3R4KCkgaG9vay4gKG5vdCBxdWl0ZSB0aGUgZGVmaW5pdGlvbiwgYnV0IGNsb3NlIGVu
b3VnaCkKCsKgCVNPX1BFRVJTRUMJCS0gImRpc3BsYXkiIExTTSBwYWNrZXQgbGFiZWwgaW4gbW9k
dWxlIG5hdGl2ZSBmb3JtYXQKCS9wcm9jLy4uLi9hdHRyL2Rpc3BsYXkJLSBzZXQvZ2V0IHRoZSAi
ZGlzcGxheSIgdmFsdWUKCS9wcm9jLy4uLi9hdHRyL2N1cnJlbnQJLSAiZGlzcGxheSIgTFNNIHBy
b2Nlc3MgbGFiZWwgaW4gbW9kdWxlIG5hdGl2ZSBmb3JtYXQKCS9wcm9jLy4uLi9hdHRyL3NtYWNr
L2N1cnJlbnQgLSBTbWFjayBwcm9jZXNzIGxhYmVsIGluIG1vZHVsZSBuYXRpdmUgZm9ybWF0CgpB
IGNsYXNzaWMgQW5kcm9pZCwgVGl6ZW4sIEZlZG9yYSBvciBVYnVudHUgc3lzdGVtIHdpbGwgY29u
dGludWUgdG8gdXNlIHRoZXNlCmludGVyZmFjZXMgYW5kIHNlZSBubyBkaWZmZXJlbmNlIGluIGJl
aGF2aW9yLgoKQSBzeXN0ZW0gdGhhdCByZWFsbHkgd2FudHMgdG8gdXNlIG11bHRpcGxlICJkaXNw
bGF5ImluZyAgbW9kdWxlcyB3aWxsCmhhdmUgdGhlIHNhbWUgaXNzdWVzIHRoYXQgZGJ1cyBoYXMs
IGFuZCB3aWxsIGxpa2VseSBjb252ZXJ0IHRvIHRoZSBuZXcsCiJoaWRlb3VzIiBpbnRlcmZhY2Vz
LCBlc3BlY2lhbGx5IGlmIGEgbGlibHNtIChOT1QgbGlic2VjdXJpdHkhKSBpcwpwcm92aWRlZC4K
CgoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0
cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

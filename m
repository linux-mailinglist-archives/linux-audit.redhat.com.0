Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8D17E22FAF5
	for <lists+linux-audit@lfdr.de>; Mon, 27 Jul 2020 23:04:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-YJPTs__gNG-zfXoMfudnKw-1; Mon, 27 Jul 2020 17:04:55 -0400
X-MC-Unique: YJPTs__gNG-zfXoMfudnKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37C6E106B243;
	Mon, 27 Jul 2020 21:04:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EC7C10013D0;
	Mon, 27 Jul 2020 21:04:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 847A49547F;
	Mon, 27 Jul 2020 21:04:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06RL4fEi004531 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 17:04:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 016202156A3A; Mon, 27 Jul 2020 21:04:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0CFD2156A2E
	for <linux-audit@redhat.com>; Mon, 27 Jul 2020 21:04:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57DF18007B1
	for <linux-audit@redhat.com>; Mon, 27 Jul 2020 21:04:38 +0000 (UTC)
Received: from sonic304-28.consmr.mail.ne1.yahoo.com
	(sonic304-28.consmr.mail.ne1.yahoo.com [66.163.191.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-282-j0TVqjElOMy3bbN3xRUEiA-1;
	Mon, 27 Jul 2020 17:04:35 -0400
X-MC-Unique: j0TVqjElOMy3bbN3xRUEiA-1
X-YMail-OSG: JarmxxAVM1mMDnv3HlZ97NX4qK6nDNkjyZpVY7.9lD7IR.oWl4R_rTEWLcCCSIY
	RVFu4I7KDavx7.KQ1CyWJ.72ghbi8xLX6MY01IJDgKhFphYLBKnBHDZTzBE8J8u4hqGflp7SE5iE
	wSbvRUXtj9tYy7_YAqFT4AN_yD9n.viTAqcTQWJa6ZegCACqqaVTdv_AfXOVPteIaF_83qGCm42j
	kxomiVdI.Cam3SGGKlS9f0rjPMYKfqApVOSMHCiGfOUwC5.m1aC9QgFgD_w17OI1rfA9kwndnwWZ
	LsITA3aECA4Vc8b.WGkTVD7ojJgvoYD8rIgIBs8BdnIDxqMM9OghUQiTrrI7SpkE8sTAAI7A.Ngg
	MODGO_OkTR3neMLEQbdeUgrU9xlvGWk0ajW.G1qsyPSU7h32Zhyug39Ch.j.jEpAGrGK_zDJ31LO
	KVDtuTDISZqnM7Ia9Chcw0nUPxZ25rMzz5BekdYsufrVQ0yZn79xasQHKsoMkYdLzIgcfVzZv_Fk
	ak27N9P.t.uUzpJn2h_GBCDCDm7m38Gi6uos8NSRV1B_o0e5kWMgajz9GrATeviqLKj2Y4gsJtSy
	iasn6cjRuq1.AaYeW38.8CyaBlymPQr1zM6iaHW81O6qMeTWrsnJLfz5un3rvsqVdEEap2hWH.sU
	0cuYLkrdbRsUE2pG3O9Zv_yOLGb8NpTu_tzbNSUcFuMNlufwZL.xu32NlhaXPRecsCusFiQHrUR4
	QeEKo4jmgCKTbK4mKwkqYeU8_CQPKPLoiXpqhJ_2MdJMbzMEa_j126q_KZsccOa9fLqVAWbGZWBq
	LhGq74ca.j8OPy0LWhJkbnxpI86hD0piBEj_kYA.8uwvzViPJWOw5TisXKtJTWjuJZN5LYDGXW.9
	0oKNn_sy2oFflwlNRO7O1YEmTRpEYSjcmGS6gF46_MES9rZ6PDT3Uz40PliZC.0uj0BjL6HJ_aSm
	KOZR9Z6skBHWH6iwAPrX44bhYPJR0uHlFY3WyTfzowH6FS5VUjLh.98tAqDukyX147SWSRkGWNJ6
	0Ljh3KZXEa4Q6sPH6zMwWxzOkXQjbZDqYxpyoMXI8IzEMc4n0uHz8WqAu.gg1fRtUf5JGPG2GVYT
	wIJp87iWtGpXibh1pr4MPJKaoZYx6KPzWmKkqdAGXVwobUVf335kU3flxJRhjYcgflETdiCl4s45
	HvoE35ejx7X.mdI6uOdNc5Ji6GDwPmARtDchov1RPjH_KHD4mqbYJyVe5nBcrBGKKDPaCJxQ.nhY
	xgUqQG8wGKS10yPGyoGr8Sg.9WdvTCthqIRE4ht5zN.gYzEqpJBHz_WFhbl03QdsitjTS_muuwZS
	0ROlvUMB_leYbHOZfxKMAYLPdlt69pah0xCQWlrwrnQPAgW3_AJ1B7mItV0IMTf7QbOGe_v5JDGB
	cEGrqDKn8jcIhzHmqymnf25y1JcrSkOuj4fo-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic304.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 27 Jul 2020 21:04:35 +0000
Received: by smtp421.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 17477479602f8a087f902e3ee11d52e9; 
	Mon, 27 Jul 2020 21:04:34 +0000 (UTC)
Subject: Re: [PATCH v19 02/23] LSM: Create and manage the lsmblob data
	structure.
To: Stephen Smalley <stephen.smalley.work@gmail.com>
References: <20200724203226.16374-1-casey@schaufler-ca.com>
	<20200724203226.16374-3-casey@schaufler-ca.com>
	<CAEjxPJ453W-8PmB4WPq2vZHfvvG6yWFmoqnuHtHvz5Y5MYaj1g@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <4802a880-ce53-989f-8771-76349532b89c@schaufler-ca.com>
Date: Mon, 27 Jul 2020 14:04:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEjxPJ453W-8PmB4WPq2vZHfvvG6yWFmoqnuHtHvz5Y5MYaj1g@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gNy8yNy8yMDIwIDk6MTIgQU0sIFN0ZXBoZW4gU21hbGxleSB3cm90ZToKPiBPbiBGcmksIEp1
bCAyNCwgMjAyMCBhdCA0OjM1IFBNIENhc2V5IFNjaGF1ZmxlciA8Y2FzZXlAc2NoYXVmbGVyLWNh
LmNvbT4gd3JvdGU6Cj4+IFdoZW4gbW9yZSB0aGFuIG9uZSBzZWN1cml0eSBtb2R1bGUgaXMgZXhw
b3J0aW5nIGRhdGEgdG8KPj4gYXVkaXQgYW5kIG5ldHdvcmtpbmcgc3ViLXN5c3RlbXMgYSBzaW5n
bGUgMzIgYml0IGludGVnZXIKPj4gaXMgbm8gbG9uZ2VyIHN1ZmZpY2llbnQgdG8gcmVwcmVzZW50
IHRoZSBkYXRhLiBBZGQgYQo+PiBzdHJ1Y3R1cmUgdG8gYmUgdXNlZCBpbnN0ZWFkLgo+Pgo+PiBU
aGUgbHNtYmxvYiBzdHJ1Y3R1cmUgaXMgY3VycmVudGx5IGFuIGFycmF5IG9mCj4+IHUzMiAic2Vj
aWRzIi4gVGhlcmUgaXMgYW4gZW50cnkgZm9yIGVhY2ggb2YgdGhlCj4+IHNlY3VyaXR5IG1vZHVs
ZXMgYnVpbHQgaW50byB0aGUgc3lzdGVtIHRoYXQgd291bGQKPj4gdXNlIHNlY2lkcyBpZiBhY3Rp
dmUuIFRoZSBzeXN0ZW0gYXNzaWducyB0aGUgbW9kdWxlCj4+IGEgInNsb3QiIHdoZW4gaXQgcmVn
aXN0ZXJzIGhvb2tzLiBJZiBtb2R1bGVzIGFyZQo+PiBjb21waWxlZCBpbiBidXQgbm90IHJlZ2lz
dGVyZWQgdGhlcmUgd2lsbCBiZSB1bnVzZWQKPj4gc2xvdHMuCj4+Cj4+IEEgbmV3IGxzbV9pZCBz
dHJ1Y3R1cmUsIHdoaWNoIGNvbnRhaW5zIHRoZSBuYW1lCj4+IG9mIHRoZSBMU00gYW5kIGl0cyBz
bG90IG51bWJlciwgaXMgY3JlYXRlZC4gVGhlcmUKPj4gaXMgYW4gaW5zdGFuY2UgZm9yIGVhY2gg
TFNNLCB3aGljaCBhc3NpZ25zIHRoZSBuYW1lCj4+IGFuZCBwYXNzZXMgaXQgdG8gdGhlIGluZnJh
c3RydWN0dXJlIHRvIHNldCB0aGUgc2xvdC4KPj4KPj4gVGhlIGF1ZGl0IHJ1bGVzIGRhdGEgaXMg
ZXhwYW5kZWQgdG8gdXNlIGFuIGFycmF5IG9mCj4+IHNlY3VyaXR5IG1vZHVsZSBkYXRhIHJhdGhl
ciB0aGFuIGEgc2luZ2xlIGluc3RhbmNlLgo+PiBCZWNhdXNlIElNQSB1c2VzIHRoZSBhdWRpdCBy
dWxlIGZ1bmN0aW9ucyBpdCBpcwo+PiBhZmZlY3RlZCBhcyB3ZWxsLgo+Pgo+PiBBY2tlZC1ieTog
U3RlcGhlbiBTbWFsbGV5IDxzZHNAdHljaG8ubnNhLmdvdj4KPj4gQWNrZWQtYnk6IFBhdWwgTW9v
cmUgPHBhdWxAcGF1bC1tb29yZS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IENhc2V5IFNjaGF1Zmxl
ciA8Y2FzZXlAc2NoYXVmbGVyLWNhLmNvbT4KPiBXaXRoIENPTkZJR19CUEZfTFNNPXk6CgpUaGFu
a3MuIEkgYW0gc3VycHJpc2VkIHRoYXQgdGhpcyBjb25maWcgb3B0aW9uIGlzbid0CnVuZGVyIHNl
Y3VyaXR5LiBObyBwcm9ibGVtLCBhbiBlYXN5IGZpeC4KCj4KPiBzZWN1cml0eS9icGYvaG9va3Mu
YzogSW4gZnVuY3Rpb24g4oCYYnBmX2xzbV9pbml04oCZOgo+IHNlY3VyaXR5L2JwZi9ob29rcy5j
OjE4OjYzOiBlcnJvcjogcGFzc2luZyBhcmd1bWVudCAzIG9mCj4g4oCYc2VjdXJpdHlfYWRkX2hv
b2tz4oCZIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZQo+IFstV2Vycm9yPWluY29tcGF0
aWJsZS1wb2ludGVyLXR5cGVzXQo+ICAgIDE4IHwgIHNlY3VyaXR5X2FkZF9ob29rcyhicGZfbHNt
X2hvb2tzLCBBUlJBWV9TSVpFKGJwZl9sc21faG9va3MpLCAiYnBmIik7Cj4gICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hhciAqCj4gSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIHNlY3VyaXR5L2JwZi9ob29rcy5jOjY6Cj4gLi9pbmNsdWRlL2xpbnV4L2xz
bV9ob29rcy5oOjE1OTI6MjY6IG5vdGU6IGV4cGVjdGVkIOKAmHN0cnVjdCBsc21faWQgKuKAmQo+
IGJ1dCBhcmd1bWVudCBpcyBvZiB0eXBlIOKAmGNoYXIgKuKAmQo+ICAxNTkyIHwgICAgICAgICAg
IHN0cnVjdCBsc21faWQgKmxzbWlkKTsKPiAgICAgICB8ICAgICAgICAgICB+fn5+fn5+fn5+fn5+
fn5efn5+fgoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5j
b20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0


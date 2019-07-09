Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D73D163AEB
	for <lists+linux-audit@lfdr.de>; Tue,  9 Jul 2019 20:26:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6ACAE30832C2;
	Tue,  9 Jul 2019 18:25:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 468B98705E;
	Tue,  9 Jul 2019 18:25:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CA56206D2;
	Tue,  9 Jul 2019 18:25:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69IFQLf004149 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 14:15:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2BEA7871C7; Tue,  9 Jul 2019 18:15:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24752871C3
	for <linux-audit@redhat.com>; Tue,  9 Jul 2019 18:15:23 +0000 (UTC)
Received: from uhil19pa13.eemsg.mail.mil (uhil19pa13.eemsg.mail.mil
	[214.24.21.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50CDA30C34C0
	for <linux-audit@redhat.com>; Tue,  9 Jul 2019 18:14:42 +0000 (UTC)
X-EEMSG-check-017: 413504859|UHIL19PA13_EEMSG_MP11.csd.disa.mil
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
	by uhil19pa13.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
	09 Jul 2019 18:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
	s=tycho.nsa.gov; t=1562695974; x=1594231974;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=r2Syc4dVlrBOYhwpJv1XNLiFAnYfl3jJYHCbzUb+4CU=;
	b=dfLJFgceyb1k90cuiwiGtRyJ8/8iXsHre2qyx+j9OlWGNAbGIhoES0w/
	OIdxdsY91VWslU+nz7MZogJswi+9Db6oLxgsYktaLjRemF0hIC6ZbajTt
	bBJ0KgvDo7utJSUlDd1WsrqKi1DL2T9o0aanlk6ST4grIv+bk1GjabZnq
	qJVeztKiCoylsrQU+7rF/8h808ncK2YFe1/Ds3FQ9Qh8ycCrRvEt2o6lQ
	hZlT9LtJajV+UbfZUDvriagUnBkKaUcezcwDMhNmMx9FuUxAoAYqk+p6I
	7MvlqTmOUbAg1L356CRzcvA1yuGknTrD31hXGj/qRw9380QOHNoIabJAl g==;
X-IronPort-AV: E=Sophos;i="5.63,471,1557187200"; d="scan'208";a="25519160"
IronPort-PHdr: =?us-ascii?q?9a23=3Ab7sgmxK2RnkDYn09JtmcpTZWNBhigK39O0sv0r?=
	=?us-ascii?q?FitYgXL/jyrarrMEGX3/hxlliBBdydt6sezbaM+Pm6AyQp2tWoiDg6aptCVh?=
	=?us-ascii?q?sI2409vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFR?=
	=?us-ascii?q?rhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTagf79+Nhq7oRveusULn4duNLs6xw?=
	=?us-ascii?q?fUrHdPZ+lY335jK0iJnxb76Mew/Zpj/DpVtvk86cNOUrj0crohQ7BAAzsoL2?=
	=?us-ascii?q?465MvwtRneVgSP/WcTUn8XkhVTHQfI6gzxU4rrvSv7sup93zSaPdHzQLspVz?=
	=?us-ascii?q?mu87tnRRn1gyocKTU37H/YhdBxjKJDoRKuuRp/w5LPYIqIMPZyZ77Rcc8GSW?=
	=?us-ascii?q?ZEWMteWTZBAoehZIURCeQPM/tTo43kq1YOqRayAA+hD/7txDBVnH/7xbA03f?=
	=?us-ascii?q?ovEQ/G3wIuEdwBv3vWo9rpO6kfSvy1warSwDnfc/9b1zXw5Y7VeR4hu/GMWr?=
	=?us-ascii?q?dwfNLMx0kzCQzFllWQppLjPziIy+oNtnKU7+5kVe2xi28stgZ8oiOyycc3kY?=
	=?us-ascii?q?TJmoIUxUzE9SV+2oo1I8a4R1Rhbd6rF5tQqTiXOo1rSc0sRGFovTw1yrwAuZ?=
	=?us-ascii?q?OjeigF1I8nyALFZ/yCcoiI5hTuX/uSLzdgnH9pZb2yihmo/UWg1+HwTNe43V?=
	=?us-ascii?q?lUoiZfj9XBsG0G2QbJ5cidUPR9+1+s2TOI1w/O9O5JOVs0la/HK545xb4wi4?=
	=?us-ascii?q?YTvVzDHiDonEX2i7ebdlk+9eiy6uTnf67mqoWAN450lg7+MqMulta5AeskKQ?=
	=?us-ascii?q?gBQ3KX+eG91L3n5UH5QbNKgeMqkqTBrZzXKssWqrS5DgNIyIov9RmyAym83N?=
	=?us-ascii?q?gFhXUHKUhKeBODj4jnIVHOJ/X4AO+kg1uxizdm3OzGP739DZXNKXjPirHhfa?=
	=?us-ascii?q?1n5EJGxwozys5f64pOCr4dOPLzRlPxtNvAAxAlKQO02PjoCdVm24MFRW2PAr?=
	=?us-ascii?q?WWML7csV+M+O0vOfCAa5MPtzrnN/cl4Pvuh2cjmVABZampwYcXaHegE/t6OU?=
	=?us-ascii?q?qZemTjg9cbHWcRogU+TPbliECMUT5XeXmyRbkx5jA9CIK6E4jDQpqhj6CG3C?=
	=?us-ascii?q?e+BpdWfHxJCkiQEXf0cIWJQ/UMaCeVIs97iDwEVKOhRpQn1R60sQ/11btnIv?=
	=?us-ascii?q?DT+i0CupLpzMJ16PHLlREu6Tx0CNyQ02WMT2Fyg2MJSCY63LthrkNh11eDy6?=
	=?us-ascii?q?l4g+BYFNBK4vNJVRo1NYPYz+NkEN3yRA3BccmTSFq8QdWpHysxTtQvzN8KeU?=
	=?us-ascii?q?p9HM+ijh/b1SqwH7AVj6CLBIAz8q/ExHj+OcJ9y3fA1Kk8gFgrWdVPNWK4ia?=
	=?us-ascii?q?5l7QTTBJDGk1+fl6m0caQQxinN9H2MzWCWpkFXTBZwUbnZXXAYfkbWrsr26V?=
	=?us-ascii?q?3ZT7CyDrQnNQhBxNWeJatKcN3pilBGRPb+ONTbeW6xnH2wBRmQzLOWcIXqY3?=
	=?us-ascii?q?kd3DnaCEUckQAT+naGNQ4kCiejpGLeDCZhFVT0Y0zy9+lzs2+0QVUyzwGNaU?=
	=?us-ascii?q?1h1qa69QQRhfCGV/wT2bcEsj87qzpoBFa9w87WC92Yqgp5YqpcZ9w94EpG1W?=
	=?us-ascii?q?LfrgB9PYKvL7pkhlEAdwR6pELu2wxzCoVHj8glsmkmzBFoJqKbzVNBbSmX0Y?=
	=?us-ascii?q?r2OrLJMGXy/givYbbM2l7CyNaW5rsP6PMgplX7pg6pC04i/m5/09ZPznuc4o?=
	=?us-ascii?q?zGDA8VUZL2SEY46QJ2qK3dYik4/4nUz2FjMbGosj/e3NIkHO8lyhemf9dCP6?=
	=?us-ascii?q?KIDRX9E9AHCMivNOwngEKpYQwZM+BS7qE0I9mqeOeB2K6ub65cm2eNhH9K8c?=
	=?us-ascii?q?hG2UKF6iR4R/SAi50M2PyJ9hCMVz7hglOsqIX8kMZPYjREWiK0wDPpFchKba?=
	=?us-ascii?q?17YIgPBH2GIsury9E4jJnoHzZa8Vm5HVId8MmgfBeTKVvn0kkY0UURvGzigi?=
	=?us-ascii?q?az0iZ1jyBsq62TwSjD6/rteQBBOWNRQmRmy1D2Lsz8lN0eXU61fyA3mxa/o0?=
	=?us-ascii?q?X33a5WoOJ4NWaAb11Pen3NM2x6Uqa2/oGHaspL5YJg5T5bS8ygcFuaTfj7uB?=
	=?us-ascii?q?Jc3CT9STgNjAsnfi2n782q1ydxj3iQeTMq8SvU?=
X-IPAS-Result: =?us-ascii?q?A2C5AgBF2CRd/wHyM5BmHAEBAQQBAQcEAQGBZ4FoBSpqU?=
	=?us-ascii?q?jIohByTLgEBAQEBAQaBNolbkRQJAQEBAQEBAQEBKwkBAgEBhEACgkMjOBMBA?=
	=?us-ascii?q?wEBAQQBAQEBBAEBbIU8DII6KQGCZgEBAQECASMPAQU2CxALGAICFAwGAgJXB?=
	=?us-ascii?q?gEMCAEBgl8/AYF2BQ8PrD+BMoNEggODJ4FHgQwoi18XeIEHgTiCaz6FE4I7g?=
	=?us-ascii?q?lgEjAULh3yCCJQ+CYIZgh+EN40pBhuCLIstiieNMIEwmB0hgVgrCAIYCCEPO?=
	=?us-ascii?q?4JsCYJEF4dohlUjAzABAYEEAQGMIoIuAQE?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
	by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 09 Jul 2019 18:12:51 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id
	x69ICn3o030233; Tue, 9 Jul 2019 14:12:50 -0400
Subject: Re: [PATCH v5 15/23] LSM: Specify which LSM to display
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
References: <20190703212538.7383-1-casey@schaufler-ca.com>
	<20190703212538.7383-16-casey@schaufler-ca.com>
	<6f593ae9-4c79-7a04-41a3-c04ebd689658@tycho.nsa.gov>
	<a3537a96-84d7-ad82-f76e-af0f44331c1b@schaufler-ca.com>
From: Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <dbdcfb3d-a88a-67eb-a100-848f3335e9a3@tycho.nsa.gov>
Date: Tue, 9 Jul 2019 14:12:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a3537a96-84d7-ad82-f76e-af0f44331c1b@schaufler-ca.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, ACL 243 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Tue, 09 Jul 2019 18:15:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Tue, 09 Jul 2019 18:15:13 +0000 (UTC) for IP:'214.24.21.86'
	DOMAIN:'uhil19pa13.eemsg.mail.mil'
	HELO:'uhil19pa13.eemsg.mail.mil' FROM:'sds@tycho.nsa.gov' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 214.24.21.86 uhil19pa13.eemsg.mail.mil 214.24.21.86
	uhil19pa13.eemsg.mail.mil <sds@tycho.nsa.gov>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 09 Jul 2019 14:24:20 -0400
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>,
	john.johansen@canonical.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Tue, 09 Jul 2019 18:26:12 +0000 (UTC)

T24gNy85LzE5IDE6NTEgUE0sIENhc2V5IFNjaGF1ZmxlciB3cm90ZToKPiBPbiA3LzkvMjAxOSAx
MDoxMyBBTSwgU3RlcGhlbiBTbWFsbGV5IHdyb3RlOgo+PiBPbiA3LzMvMTkgNToyNSBQTSwgQ2Fz
ZXkgU2NoYXVmbGVyIHdyb3RlOgo+Pj4gQ3JlYXRlIGEgbmV3IGVudHJ5ICJkaXNwbGF5IiBpbiAv
cHJvYy8uLi4vYXR0ciBmb3IgY29udHJvbGxpbmcKPj4+IHdoaWNoIExTTSBzZWN1cml0eSBpbmZv
cm1hdGlvbiBpcyBkaXNwbGF5ZWQgZm9yIGEgcHJvY2Vzcy4KPj4+IFRoZSBuYW1lIG9mIGFuIGFj
dGl2ZSBMU00gdGhhdCBzdXBwbGllcyBob29rcyBmb3IgaHVtYW4gcmVhZGFibGUKPj4+IGRhdGEg
bWF5IGJlIHdyaXR0ZW4gdG8gImRpc3BsYXkiIHRvIHNldCB0aGUgdmFsdWUuIFRoZSBuYW1lIG9m
Cj4+PiB0aGUgTFNNIGN1cnJlbnRseSBpbiB1c2UgY2FuIGJlIHJlYWQgZnJvbSAiZGlzcGxheSIu
Cj4+PiBBdCB0aGlzIHBvaW50IHRoZXJlIGNhbiBvbmx5IGJlIG9uZSBMU00gY2FwYWJsZSBvZiBk
aXNwbGF5Cj4+PiBhY3RpdmUuIEEgaGVscGVyIGZ1bmN0aW9uIGxzbV90YXNrX2Rpc3BsYXkoKSB0
byBnZXQgdGhlIGRpc3BsYXkKPj4+IHNsb3QgZm9yIGEgdGFza19zdHJ1Y3QuCj4+Cj4+IEFzIEkg
ZXhwbGFpbmVkIHByZXZpb3VzbHksIHRoaXMgaXMgYSBzZWN1cml0eSBob2xlIHdhaXRpbmcgdG8g
aGFwcGVuLiBJdCBzdGlsbCBwZXJtaXRzIGEgcHJvY2VzcyB0byBhZmZlY3QgdGhlIG91dHB1dCBv
ZiBhdWRpdCwgYWx0ZXIgdGhlIHJlc3VsdCBvZiByZWFkaW5nIG9yIHdyaXRpbmcgL3Byb2Mvc2Vs
Zi9hdHRyIG5vZGVzIGV2ZW4gYnkgc2V0dWlkL3NldGdpZC9maWxlLWNhcHMvY29udGV4dC1jaGFu
Z2luZyBwcm9ncmFtcywgYWx0ZXIgdGhlIGNvbnRleHRzIGdlbmVyYXRlZCBpbiBuZXRsaW5rIG1l
c3NhZ2VzIGRlbGl2ZXJlZCB0byBvdGhlciBwcm9jZXNzZXMgKEkgdGhpbms/KSwgYW5kIHBvc3Np
Ymx5IG90aGVyIGVmZmVjdHMgYmV5b25kIGFmZmVjdGluZyB0aGUgcHJvY2Vzcycgb3duIHZpZXcg
b2YgdGhpbmdzLgo+IAo+IEkgd291bGQgdmVyeSBtdWNoIGxpa2Ugc29tZSBmZWVkYmFjayByZWdh
cmRpbmcgd2hpY2ggb2YgdGhlCj4gcG9zc2libGUgZm9ybWF0cyBmb3IgcHV0dGluZyBtdWx0aXBs
ZSBzdWJqZWN0IGNvbnRleHRzIGluCj4gYXVkaXQgcmVjb3JkcyB3b3VsZCBiZSBwcmVmZXJyZWQ6
Cj4gCj4gCWxzbT1zZWxpbnV4LHN1Ymo9eHl6enlfdCBsc209c21hY2ssc3Viaj1YeXp6eQo+IAls
c209c2VsaW51eCxzbWFjayBzdWJqPXh5enp5X3QsWHl6enkKPiAJc3Viaj0ic2VsaW51eD0neHl6
enlfdCcsc21hY2s9J1h5enp5JyIKCihjYydkIGxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdCkKCj4g
Cj4gT3Igc29tZXRoaW5nIGVsc2UuIEZyZWUgYmlrZXNoZWRkaW5nIQo+IAo+IEkgZG9uJ3Qgc2Vl
IGhvdyB5b3UgaGF2ZSBhIHByb2JsZW0gd2l0aCBuZXRsaW5rLiBNeSBsb29rCj4gYXQgd2hhdCdz
IGluIHRoZSBrZXJuZWwgZGlkbid0IGV4cG9zZSBhbnl0aGluZywgYnV0IEkgYW0KPiB3aWxsaW5n
IHRvIGJlIGVkdWNhdGVkLgoKSSBoYXZlbid0IHRyYWNlZCB0aHJvdWdoIGl0IGluIGRldGFpbCwg
YnV0IGl0IHdhc24ndCBjbGVhciB0byBtZSB0aGF0IAp0aGUgc2VjdXJpdHlfc2VjaWRfdG9fc2Vj
Y3R4KCkgY2FsbCBhbHdheXMgb2NjdXJzIGluIHRoZSBjb250ZXh0IG9mIHRoZSAKcmVjZWl2aW5n
IHByb2Nlc3MgKGFuZCBoZW5jZSB1c2UgaXRzIGRpc3BsYXkgdmFsdWUpLiAgSWYgbm90LCB0aGVu
IHRoZSAKZGlzcGxheSBvZiB0aGUgc2VuZGVyIGNhbiBhZmZlY3Qgd2hhdCBpcyByZXBvcnRlZCB0
byB0aGUgcmVjZWl2ZXI7IApoZW5jZSwgdGhlcmUgaXMgYSBmb3JnZXJ5IGNvbmNlcm4gc2ltaWxh
ciB0byB0aGUgYmluZGVyIGlzc3VlLiAgSXQgd291bGQgCmJlIGNsZWFuZXIgaWYgd2UgZGlkbid0
IGFsdGVyIHRoZSBkZWZhdWx0IGJlaGF2aW9yIG9mIApzZWN1cml0eV9zZWNpZF90b19zZWNjdHgo
KSBhbmQgc2VjdXJpdHlfc2VjY3R4X3RvX3NlY2lkKCkgYW5kIGluc3RlYWQgCmludHJvZHVjZWQg
bmV3IGhvb2tzIGZvciBhbnkgY2FzZSB3aGVyZSB3ZSB0cnVseSB3YW50IHRoZSBkaXNwbGF5IHRv
IAp0YWtlIGVmZmVjdC4KCj4gCj4+Cj4+IEJlZm9yZToKPj4gJCBpZAo+PiB1aWQ9MTAwMihzZHMy
KSBnaWQ9MTAwMihzZHMyKSBncm91cHM9MTAwMihzZHMyKSBjb250ZXh0PXN0YWZmX3U6c3RhZmZf
cjpzdGFmZl90OnMwLXMwOmMwLmMxMDIzCj4+ICQgc3UKPj4gUGFzc3dvcmQ6Cj4+IHN1OiBBdXRo
ZW50aWNhdGlvbiBmYWlsdXJlCj4+Cj4+IHN5c2NhbGwgYXVkaXQgcmVjb3JkOgo+PiB0eXBlPVNZ
U0NBTEwgbXNnPWF1ZGl0KDA3LzA5LzIwMTkgMTE6NTI6NDkuNzg0OjM2NSkgOiBhcmNoPXg4Nl82
NCBzeXNjYWxsPW9wZW5hdAo+PiAgwqBzdWNjZXNzPW5vIGV4aXQ9RUFDQ0VTKFBlcm1pc3Npb24g
ZGVuaWVkKSBhMD0weGZmZmZmZjljIGExPTB4NTYwODk3ZTU4ZTAwIGEyPU9fCj4+IFdST05MWSBh
Mz0weDAgaXRlbXM9MSBwcGlkPTMyNTggcGlkPTM3ODEgYXVpZD1zZHMyIHVpZD1zZHMyIGdpZD1z
ZHMyIGV1aWQ9cm9vdCBzCj4+IHVpZD1yb290IGZzdWlkPXJvb3QgZWdpZD1zZHMyIHNnaWQ9c2Rz
MiBmc2dpZD1zZHMyIHR0eT1wdHMyIHNlcz02IGNvbW09c3UgZXhlPS91c3IvYmluL3N1IHN1Ymo9
c3RhZmZfdTpzdGFmZl9yOnN0YWZmX3Q6czAtczA6YzAuYzEwMjMga2V5PShudWxsKQo+Pgo+PiBB
ZnRlcjoKPj4gJCBpZAo+PiB1aWQ9MTAwMihzZHMyKSBnaWQ9MTAwMihzZHMyKSBncm91cHM9MTAw
MihzZHMyKSBjb250ZXh0PXN0YWZmX3U6c3RhZmZfcjpzdGFmZl90OnMwLXMwOmMwLmMxMDIzCj4+
ICQgZWNobyBhcHBhcm1vciA+IC9wcm9jL3NlbGYvYXR0ci9kaXNwbGF5Cj4+ICQgc3UKPj4gUGFz
c3dvcmQ6Cj4+IHN1OiBBdXRoZW50aWNhdGlvbiBmYWlsdXJlCj4+Cj4+IGF1ZGl0IHJlY29yZDoK
Pj4gdHlwZT1TWVNDQUxMIG1zZz1hdWRpdCgwNy8wOS8yMDE5IDEyOjA1OjMyLjQwMjo0MDYpIDog
YXJjaD14ODZfNjQgc3lzY2FsbD1vcGVuYXQgc3VjY2Vzcz1ubyBleGl0PUVBQ0NFUyhQZXJtaXNz
aW9uIGRlbmllZCkgYTA9MHhmZmZmZmY5YyBhMT0weDU1NmI0MWUxYWUwMCBhMj1PX1dST05MWSBh
Mz0weDAgaXRlbXM9MSBwcGlkPTMyNTggcGlkPTk0MjYgYXVpZD1zZHMyIHVpZD1zZHMyIGdpZD1z
ZHMyIGV1aWQ9cm9vdCBzdWlkPXJvb3QgZnN1aWQ9cm9vdCBlZ2lkPXNkczIgc2dpZD1zZHMyIGZz
Z2lkPXNkczIgdHR5PXB0czIgc2VzPTYgY29tbT1zdSBleGU9L3Vzci9iaW4vc3Ugc3Viaj09dW5j
b25maW5lZCBrZXk9KG51bGwpCj4+Cj4+IE5CIFRoZSBzdWJqPSBmaWVsZCBvZiB0aGUgU1lTQ0FM
TCBhdWRpdCByZWNvcmQgaXMgbG9uZ2VyIGFjY3VyYXRlIGFuZCBpcyBwb3RlbnRpYWxseSB1bmRl
ciB0aGUgY29udHJvbCBvZiBhIHByb2Nlc3MgdGhhdCB3b3VsZCBub3QgYmUgYXV0aG9yaXplZCB0
byBzZXQgaXRzIHN1YmplY3QgbGFiZWwgdG8gdGhhdCB2YWx1ZSBieSBTRUxpbnV4Lgo+IAo+IEl0
J3Mgc3RpbGwgYWNjdXJhdGUsIGl0J3MganVzdCBub3QgY29tcGxldGUuIEl0J3MgYSBtYXR0ZXIK
PiBvZiBob3cgYmVzdCB0byBjb21wbGV0ZSBpdC4KPiAKPj4KPj4gTm93LCBsZXQncyBwbGF5IHdp
dGggdXNlcnNwYWNlLgo+Pgo+PiBCZWZvcmU6Cj4+ICMgaWQKPj4gdWlkPTAocm9vdCkgZ2lkPTAo
cm9vdCkgZ3JvdXBzPTAocm9vdCkgY29udGV4dD1zdGFmZl91OnN0YWZmX3I6c3RhZmZfdDpzMC1z
MDpjMC5jMTAyMwo+PiAjIHBhc3N3ZCByb290Cj4+IHBhc3N3ZDogU0VMaW51eCBkZW55IGFjY2Vz
cyBkdWUgdG8gc2VjdXJpdHkgcG9saWN5Lgo+Pgo+PiBhdWRpdCByZWNvcmQ6Cj4+IHR5cGU9VVNF
Ul9BVkMgbXNnPWF1ZGl0KDA3LzA5LzIwMTkgMTI6MjQ6MzUuMTM1OjgxMikgOiBwaWQ9MTI2OTMg
dWlkPXJvb3QgYXVpZD1zZHMyIHNlcz03IHN1Ymo9c3RhZmZfdTpzdGFmZl9yOnBhc3N3ZF90OnMw
LXMwOmMwLmMxMDIzIG1zZz0nYXZjOsKgIGRlbmllZMKgIHsgcGFzc3dkIH0gZm9yIHNjb250ZXh0
PXN0YWZmX3U6c3RhZmZfcjpzdGFmZl90OnMwLXMwOmMwLmMxMDIzIHRjb250ZXh0PXN0YWZmX3U6
c3RhZmZfcjpzdGFmZl90OnMwLXMwOmMwLmMxMDIzIHRjbGFzcz1wYXNzd2QgcGVybWlzc2l2ZT0w
wqAgZXhlPS91c3IvYmluL3Bhc3N3ZCBzYXVpZD1yb290IGhvc3RuYW1lPT8gYWRkcj0/IHRlcm1p
bmFsPXB0cy8yJwo+PiB0eXBlPVVTRVJfQ0hBVVRIVE9LIG1zZz1hdWRpdCgwNy8wOS8yMDE5IDEy
OjI0OjM1LjEzNTo4MTMpIDogcGlkPTEyNjkzIHVpZD1yb290IGF1aWQ9c2RzMiBzZXM9NyBzdWJq
PXN0YWZmX3U6c3RhZmZfcjpwYXNzd2RfdDpzMC1zMDpjMC5jMTAyMyBtc2c9J29wPWF0dGVtcHRl
ZC10by1jaGFuZ2UtcGFzc3dvcmQgaWQ9cm9vdCBleGU9L3Vzci9iaW4vcGFzc3dkIGhvc3RuYW1l
PW1vc3MtcGx1dG8uaW5mb3NlYy50eWNoby5uY3NjLm1pbCBhZGRyPT8gdGVybWluYWw9cHRzLzIg
cmVzPWZhaWxlZCcKPj4KPj4gQWZ0ZXI6Cj4+ICMgaWQKPj4gdWlkPTAocm9vdCkgZ2lkPTAocm9v
dCkgZ3JvdXBzPTAocm9vdCkgY29udGV4dD1zdGFmZl91OnN0YWZmX3I6c3RhZmZfdDpzMC1zMDpj
MC5jMTAyMwo+PiAjIGVjaG8gYXBwYXJtb3IgPiAvcHJvYy9zZWxmL2F0dHIvZGlzcGxheQo+PiAj
IHBhc3N3ZCByb290Cj4+IHBhc3N3ZDogU0VMaW51eCBkZW55IGFjY2VzcyBkdWUgdG8gc2VjdXJp
dHkgcG9saWN5Lgo+Pgo+PiBhdWRpdCByZWNvcmQ6Cj4+IHR5cGU9VVNFUl9DSEFVVEhUT0sgbXNn
PWF1ZGl0KDA3LzA5LzIwMTkgMTI6Mjg6NDEuMzQ5OjgzMikgOiBwaWQ9MTMwODMgdWlkPXJvb3Qg
YXVpZD1zZHMyIHNlcz03IHN1Ymo9PXVuY29uZmluZWQgbXNnPSdvcD1hdHRlbXB0ZWQtdG8tY2hh
bmdlLXBhc3N3b3JkIGlkPXJvb3QgZXhlPS91c3IvYmluL3Bhc3N3ZCBob3N0bmFtZT1tb3NzLXBs
dXRvLmluZm9zZWMudHljaG8ubmNzYy5taWwgYWRkcj0/IHRlcm1pbmFsPXB0cy8yIHJlcz1mYWls
ZWQnCj4+Cj4+IEhlcmUgd2UgYWdhaW4gZ2V0IHRoZSB3cm9uZyB2YWx1ZSBmb3Igc3Viaj0gaW4g
dGhlIFVTRVJfQ0hBVVRIVE9LIGF1ZGl0IHJlY29yZCwgYW5kIHdlIGZ1cnRoZXIgbG9zZSB0aGUg
VVNFUl9BVkMgcmVjb3JkIGVudGlyZWx5IGJlY2F1c2UgaXQgZGlkbid0IGV2ZW4gcmVhY2ggdGhl
IHBvaW50IG9mIHRoZSBwZXJtaXNzaW9uIGNoZWNrIGR1ZSB0byBub3QgYmVpbmcgYWJsZSB0byBn
ZXQgdGhlIGNhbGxlciBjb250ZXh0Lgo+Pgo+PiBUaGUgc2l0dWF0aW9uIGdldHMgd29yc2UgaWYg
dGhlIGNhbGxlciBjYW4gc2V0IHRoaW5ncyB1cCBzdWNoIHRoYXQgaXQgY2FuIHNldCBhbiBhdHRy
aWJ1dGUgdmFsdWUgZm9yIG9uZSBzZWN1cml0eSBtb2R1bGUgdGhhdCBpcyB2YWxpZCBhbmQgcHJp
dmlsZWdlZCB3aXRoIHJlc3BlY3QgdG8gYW5vdGhlciBzZWN1cml0eSBtb2R1bGUuwqAgVGhpcyBp
c24ndCBhIGZhci1mZXRjaGVkIHNjZW5hcmlvOyBBcHBBcm1vciB3aWxsIGRlZmF1bHQgdG8gcnVu
bmluZyBldmVyeXRoaW5nIHVuY29uZmluZWQsIHNvIGFzIHNvb24gYXMgeW91IGVuYWJsZSBpdCwg
YW55IHJvb3QgcHJvY2VzcyBjYW4gcG90ZW50aWFsbHkgbG9hZCBhIHBvbGljeSB0aGF0IGRlZmlu
ZXMgY29udGV4dHMgdGhhdCBsb29rIGV4YWN0bHkgbGlrZSBTRUxpbnV4IGNvbnRleHRzLiBTbWFj
ayBpcyBldmVuIHNpbXBsZXI7IHlvdSBjYW4gc2V0IGFueSBhcmJpdHJhcnkgc3RyaW5nIHlvdSB3
YW50IGFzIGxvbmcgYXMgeW91IGFyZSByb290IChieSBkZWZhdWx0KTsgbm8gcG9saWN5IHJlcXVp
cmVkLsKgIFNvIGEgcm9vdCBwcm9jZXNzIHRoYXQgaXMgY29uZmluZWQgYnkgU0VMaW51eCAob3Ig
YnkgQXBwQW1vcikgY2FuIHN1ZGRlbmx5IGZvcmdlIGFyYml0cmFyeSBjb250ZXh0cyBpbiBhdWRp
dCByZWNvcmRzIG9yIHJlYWRzIG9mIC9wcm9jL3NlbGYvYXR0ciBub2RlcyBvciBuZXRsaW5rIG1l
c3NhZ2VzIG9yIC4uLiwganVzdCBieSB2aXJ0dWUgb2YgYXBwbHlpbmcgdGhlc2UgcGF0Y2hlcyBh
bmQgZW5hYmxpbmcgYW5vdGhlciBzZWN1cml0eSBtb2R1bGUgbGlrZSBTbWFjay4gT3IgY29uc2lk
ZXIgaWYgcHRhZ3Mgd2VyZSBldmVyIG1hZGUgcmVhbCBhbmQgbWVyZ2VkIC0gYnkgZGVzaWduLCB0
aGF0J3MgYWxsIGFib3V0IHNldHRpbmcgYXJiaXRyYXJ5IHRhZ3MgZnJvbSB1c2Vyc3BhY2UuwqAg
VGhlbiB0aGVyZSBpcyB0aGUgc2VwYXJhdGUgaXNzdWUgb2Ygc3dpdGNoaW5nCj4+IGRpc3BsYXkg
dG8gcHJldmVudCBhdHRlbXB0cyBieSBhIG1vcmUgcHJpdmlsZWdlZCBwcm9ncmFtIHRvIHNldCBv
bmUgb2YgaXRzIGF0dHJpYnV0ZXMgZnJvbSB0YWtpbmcgZWZmZWN0LiBXaGVyZSBoYXZlIHdlIHNl
ZW4gdGhhdCBiZWZvcmUgLSBzZW5kbWFpbCBjYXBhYmlsaXRpZXMgYnVnIGFueW9uZT/CoCBBbmQg
aXQgaXMgYWN0dWFsbHkgd29yc2UgdGhhbiB0aGF0IGJ1ZywgYmVjYXVzZSB3aXRoIHRoZSBhc3Np
c3RhbmNlIG9mIGEgZnJpZW5kbHkgc2VjdXJpdHkgbW9kdWxlLCB0aGUgd3JpdGUgbWF5IGFjdHVh
bGx5IHN1Y2NlZWQ7IGl0IGp1c3Qgd29uJ3QgYWx0ZXIgdGhlIFNFTGludXggY29udGV4dCBvZiB0
aGUgcHJvZ3JhbSBvciBhbnl0aGluZyBpdCBjcmVhdGVzIQo+Pgo+PiBUaGlzIGdldHMgYSBOQUsg
ZnJvbSBtZSBzbyBsb25nIGFzIGl0IGhhcyB0aGVzZSBpc3N1ZXMgYW5kIHNldHRpbmcgdGhlIGRp
c3BsYXkgcmVtYWlucyBvdXRzaWRlIHRoZSBjb250cm9sIG9mIGFueSBzZWN1cml0eSBtb2R1bGUu
Cj4gCj4gVGhlIGlzc3VlcyB5b3UndmUgcmFpc2VkIGFyb3VuZCBhdWRpdCBhcmUgbWVyaXRvcmlv
dXMuCj4gQW55IHN1Z2dlc3Rpb25zIHJlZ2FyZGluZyBob3cgdG8gYWRkcmVzcyB0aGVtIHdvdWxk
IGJlCj4gcXVpdGUgd2VsY29tZS4KPiAKPiBBcyBmYXIgYXMgdGhlIGdlbmVyYWwgb2JqZWN0aW9u
IHRvIHRoZSBkaXNwbGF5IG1lY2hhbmlzbSwKPiBJIGFtIGVhZ2VyIHRvIHVuZGVyc3RhbmQgd2hh
dCB5b3UgbWlnaHQgcHJvcG9zZSBhcyBhbgo+IGFsdGVybmF0aXZlLiBXZSBjYW4ndCBkaXNtaXNz
IGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgZm9yCj4gYW55IG9mIHRoZSBtb2R1bGVzLiBXZSBjYW4n
dCBwcmVjbHVkZSBhbnkgbW9kdWxlIGNvbWJpbmF0aW9uLgo+IAo+IFdlIGNhbiByZXF1aXJlIHVz
ZXIgc3BhY2UgY2hhbmdlcyBmb3IgY29uZmlndXJhdGlvbnMgdGhhdAo+IHdlcmUgaW1wb3NzaWJs
ZSBiZWZvcmUsIGp1c3QgYXMgdGhlIGFkZGl0aW9uIG9mIFNFTGludXggdG8KPiBhIHN5c3RlbSBy
ZXF1aXJlZCB1c2VyIHNwYWNlIGNoYW5nZXMuIFVwZGF0ZSBsaWJzZWxpbnV4Cj4gdG8gY2hlY2sg
dGhlIGRpc3BsYXkgYmVmb3JlIHVzaW5nIHRoZSBhdHRyIGludGVyZmFjZXMgYW5kCj4geW91J3Zl
IGFkZHJlc3NlZCBtb3N0IG9mIHRoZSBpc3N1ZXMuCgpFaXRoZXIgd2UgZW5zdXJlIHRoYXQgc2V0
dGluZyBvZiB0aGUgZGlzcGxheSBjYW4gb25seSBhZmZlY3QgcHJvY2Vzc2VzIAppbiB0aGUgc2Ft
ZSBzZWN1cml0eSBlcXVpdmFsZW5jZSBjbGFzcyAoc2FtZSBjcmVkZW50aWFscykgb3IgdGhlIApz
ZWN1cml0eSBtb2R1bGVzIG5lZWQgdG8gYmUgYWJsZSB0byBjb250cm9sIHdobyBjYW4gc2V0IHRo
ZSBkaXNwbGF5LiAgT3IgCmJvdGguCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgt
YXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtYXVkaXQ=

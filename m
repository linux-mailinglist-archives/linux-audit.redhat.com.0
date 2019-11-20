Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCA2103A05
	for <lists+linux-audit@lfdr.de>; Wed, 20 Nov 2019 13:25:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574252718;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v3/P/kCiMzAtVoQYT8/Bn6f3zMjJdUUsIfBZ43ew7P0=;
	b=hsHFp4qeb8krntd/pWztHN4RbXuk8IZeTyx/h/tfpsH+U6yUl3zXkLa0YRJhRhjUkh6j/7
	nrt9CtzL5zrV66ppCysTHVjArgNUlUZRD+VbAA3+c2cM/SAt7XsYCdsxuGpHOGf0E1sLU2
	Xh/WivgrG3Zm7obAak7Veg4ok3TNJ2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-P-jqchlsPkmB0Mixk0qt_A-1; Wed, 20 Nov 2019 07:25:16 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5213C107ACC4;
	Wed, 20 Nov 2019 12:25:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A011E67276;
	Wed, 20 Nov 2019 12:25:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 91EBC4BB78;
	Wed, 20 Nov 2019 12:24:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAKCOahm031703 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 Nov 2019 07:24:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EFA92200BC1A; Wed, 20 Nov 2019 12:24:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA9E8206400A
	for <linux-audit@redhat.com>; Wed, 20 Nov 2019 12:24:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4D7F801022
	for <linux-audit@redhat.com>; Wed, 20 Nov 2019 12:24:33 +0000 (UTC)
IronPort-SDR: doFZr1YsGPCnuoKMWCTwcZrBzUAh1K3awHNO3h++ZtCIKulcF2+owXyu1/kZS2vUo7WAZIi4JE
	sD3Apy5mAzn28P3+qIO/JXYUL6Hbroz+UxSAbDi2huVwLvlAHhrBWv+vYRRlVAFbK16/ZCx7xn
	UFaedgIHsCD02MvT+1KSkQhzpG15aMhpFzsDExeCjv2xoKbdnG0V/viv86FpBYDZNQm+9y12Qh
	IctEe+GP1Xb/pJ+jDUxvgkiPnB2OJGlawQTRf11H8+koflcOa3TMHlkLxOPLy8HynER4cq+k7A
	oq4=
IronPort-PHdr: =?us-ascii?q?9a23=3AiJAxIRLMot88kysVRNmcpTZWNBhigK39O0sv0r?=
	=?us-ascii?q?FitYgeL/TxwZ3uMQTl6Ol3ixeRBMOHsqkC0reO+Pu+EUU7or+5+EgYd5JNUx?=
	=?us-ascii?q?JXwe43pCcHRPC/NEvgMfTxZDY7FskRHHVs/nW8LFQHUJ2mPw6arXK99yMdFQ?=
	=?us-ascii?q?viPgRpOOv1BpTSj8Oq3Oyu5pHfeQpFiCezbL9oMRm7rRndusYYjIZjN6081g?=
	=?us-ascii?q?bHrnxUdupM2GhmP0iTnxHy5sex+J5s7SFdsO8/+sBDTKv3Yb02QaRXAzo6PW?=
	=?us-ascii?q?814tbrtQTYQguU+nQcSGQWnQFWDAXD8Rr3Q43+sir+tup6xSmaIcj7Rq06VD?=
	=?us-ascii?q?i+86tmTgLjhTwZPDAl7m7Yls1wjLpaoB2/oRx/35XUa5yROPZnY6/RYc8WSW?=
	=?us-ascii?q?9HU81MVSJOH5m8YpMPAeQfIOhYs4fzqVgArRS8BAmjGOzhxTBTi3/qxqI61v?=
	=?us-ascii?q?gtHR3a0AEiGd8FrXTarM/yNKcXSe270qjIzTDeZP1Xwzj97IjJfQ47rvGKQL?=
	=?us-ascii?q?l9dtbRyUY1GAPBjlSft5bqPzWO2+QWq2ib6/dgVeSsi2I9tw5xpT2vy94qh4?=
	=?us-ascii?q?LUhYwV0kjJ+CR2zYovJ9C1S1R3bN66HJdKsyyXNpN6Tt0+T2xnoio216EKtJ?=
	=?us-ascii?q?yhcCQXx5kr2gTTZ+KIfoWI5B/oSfyfLi1ihH1/fbKynxOy8U+9xeLiTsS0y1?=
	=?us-ascii?q?NKrjZdktnLq3ANywTf6siZRft5+UeswTGP1x3P6u1eIU87i7HbK4I7zr41jJ?=
	=?us-ascii?q?UTsEDDEjXtmEXuiK+Wa0Mk+uuy5+v7ZbXmo4eQN45yig7gLqQjgs2yDOsiPg?=
	=?us-ascii?q?UMXGWX4+Sx2KP58UD9QbhGlvg2nbPYsJDeK8QbvKm5AwpN34Y/5BawFTOm0d?=
	=?us-ascii?q?QGknYdKlJIYwmHj5DtO1HTJvD4Du2zjEirkDdu3/zGJKHuAo3RLnjfl7fsZa?=
	=?us-ascii?q?1960FGyAou1t9Q/IlZCqsfL/3uWk/+rsDYAgUlPAyzxubtEM992Z8GWWKTHq?=
	=?us-ascii?q?+ZN7vfsVuJ5uIpPumNa5YZtyzgK/c45v7ukWQ0mUUDcqa03ZsYcmy4Eu56LE?=
	=?us-ascii?q?WeZHq/yusGRFwWsxQzBMPwlVeIGWpIaGyvVagU/Dw3CIu6S4zEQ9b+rqaG2X?=
	=?us-ascii?q?KHH5geSWlCG12FFz+8a4qNX+YBYSS6OddljzoHE7OmTtlyhlmVqAbmxu8/fa?=
	=?us-ascii?q?Lv8SoCuMemjYAtvbeBvAwu9TFyE8WW2n2MSGcxpG4TWjsqx/4g80Fmww3Fyr?=
	=?us-ascii?q?B8nvpbU91L5/ZZFAw9MM2Uw+97DoX0XQTMNpeMRU29S9qrSTc2UpoqwtAIbk?=
	=?us-ascii?q?o8U9WvhxzOxWyrVrkSkbGG?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EHAAAGL9VdmGA0TkBlGgEBAQEBAQE?=
	=?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYFtAgEBAQELAYIagUYBMSoKhCCQbSWDapVYgWc?=
	=?us-ascii?q?JBAEBAQotAgEBhEACF4IRJDcGDgIDAQwBAQUBAQEBAQUEAQECEAEBAQEBCAs?=
	=?us-ascii?q?LBimFSoI7KQGDQgEBAQIBEhERRRACAQgODAImAgICMBUQAgQOBSKDAIJYIKQ?=
	=?us-ascii?q?ePQIjAUyBBIhUgSqBMoVOgzaBSIEOKAGFGocSgUA/gTgME4JMPoQICgESAR8?=
	=?us-ascii?q?XFYJkMoIsBJARnh2CNZVPG4I+h2mPbah8gWiBC3FNIxVlAYJBUBEUVoV8Dgm?=
	=?us-ascii?q?OI0EBATGBKItcgSIBgQ4BAQ?=
X-IPAS-Result: =?us-ascii?q?A2EHAAAGL9VdmGA0TkBlGgEBAQEBAQEBAQMBAQEBEQEBA?=
	=?us-ascii?q?QICAQEBAYFtAgEBAQELAYIagUYBMSoKhCCQbSWDapVYgWcJBAEBAQotAgEBh?=
	=?us-ascii?q?EACF4IRJDcGDgIDAQwBAQUBAQEBAQUEAQECEAEBAQEBCAsLBimFSoI7KQGDQ?=
	=?us-ascii?q?gEBAQIBEhERRRACAQgODAImAgICMBUQAgQOBSKDAIJYIKQePQIjAUyBBIhUg?=
	=?us-ascii?q?SqBMoVOgzaBSIEOKAGFGocSgUA/gTgME4JMPoQICgESAR8XFYJkMoIsBJARn?=
	=?us-ascii?q?h2CNZVPG4I+h2mPbah8gWiBC3FNIxVlAYJBUBEUVoV8DgmOI0EBATGBKItcg?=
	=?us-ascii?q?SIBgQ4BAQ?=
X-IronPort-AV: E=Sophos;i="5.69,221,1571702400"; d="scan'208";a="21309445"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from esa2.splunk.iphmx.com (esa2.splunk.iphmx.com
	[68.232.148.147]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-425-HL01IC5FMAaoMHERo58a3A-1; Wed, 20 Nov 2019 07:24:29 -0500
Received: from out.west.mail.splunk.com ([64.78.52.96])
	by esa2.splunk.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	20 Nov 2019 12:24:28 +0000
Received: from MBX111-W2-CA-3.pexch111.serverpod.net (10.254.185.98) by
	MBX111-W2-CA-1.pexch111.serverpod.net (10.254.185.94) with Microsoft
	SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Nov 2019 04:24:26 -0800
Received: from MBX111-W2-CA-3.pexch111.serverpod.net ([10.254.186.8]) by
	MBX111-W2-CA-3.pexch111.serverpod.net ([10.254.186.8]) with mapi id
	15.00.1473.003; Wed, 20 Nov 2019 04:24:26 -0800
From: Tim Galyean <tgalyean@splunk.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: Auditd SYSCALL argument decoding
Thread-Topic: Auditd SYSCALL argument decoding
Thread-Index: AQHVnv4uv74rVgVE+E+5JN6sG+CB66eTmw4AgACC6YA=
Date: Wed, 20 Nov 2019 12:24:26 +0000
Message-ID: <D1708E65-33E4-4561-A732-F6ADC42DFC78@splunk.com>
References: <2B96DB9C-982F-4B8D-94A9-AC08073A55E3@splunk.com>
	<20191119233412.436030c1@ivy-bridge>
In-Reply-To: <20191119233412.436030c1@ivy-bridge>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [204.107.141.245]
Content-ID: <B56D7892A987394599E6D4178EABAA06@pexch111.serverpod.net>
MIME-Version: 1.0
X-MC-Unique: HL01IC5FMAaoMHERo58a3A-1
X-MC-Unique: P-jqchlsPkmB0Mixk0qt_A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAKCOahm031703
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmsgeW91IGJvdGggZm9yIHRoZSBhZGRpdGlvbmFsIGluZm9ybWF0aW9uLiBUaGlzIHdvdWxk
IGV4cGxhaW4gd2h5IEkgd2FzIHNlZWluZyB2YWx1ZXMgbGlrZSwgYTA9MHgyNzQ4OWU4LCB3aGVu
IEkgd2FzIHVzaW5nIC0taW50ZXJwcmV0IHdpdGggYXVzZWFyY2guIAogCgrvu79PbiAxMS8xOS8x
OSwgNDozNCBQTSwgIlN0ZXZlIEdydWJiIiA8c2dydWJiQHJlZGhhdC5jb20+IHdyb3RlOgoKICAg
IFstLS0gVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0
aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJl
Y29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuIC0tLV0KICAg
IAogICAgT24gVHVlLCAxOSBOb3YgMjAxOSAxNzoyNDoyMSArMDAwMAogICAgVGltIEdhbHllYW4g
PHRnYWx5ZWFuQHNwbHVuay5jb20+IHdyb3RlOgogICAgCiAgICA+IEhlbGxvLAogICAgPiAKICAg
ID4gQXMgSSB1bmRlcnN0YW5kIGl0LCBsb25nIHZhbHVlcyByZWNvcmRlZCBieSBhdWRpdGQgYXJl
IHN0b3JlZCBhcyBoZXgKICAgID4gZW5jb2RlZCBzdHJpbmdzLiBIb3dldmVyLCB3aGVuIEkgYXR0
ZW1wdCB0byBkZWNvZGUgYXJndW1lbnRzIHN1Y2ggYXMKICAgID4gYTAgb3IgYTEgaW4gU1lTQ0FM
TCBldmVudHMsIHRoZXkgYXJlIGRlY29kZWQgaW50byBzcGVjaWFsIGNoYXJhY3RlcnMKICAgID4g
aW5zdGVhZCBvZiBBU0NJSS4gQXJlIHRoZXNlIHZhbHVlcyBlbmNvZGVkIGRpZmZlcmVudGx5IHRo
YW4gUFJPQ1RJVExFCiAgICA+IGV2ZW50cz8KICAgID4gCiAgICA+IEJlbG93IGlzIGFuIGV4YW1w
bGUgbG9nIGxpbmU6CiAgICA+IAogICAgPiB0eXBlPVNZU0NBTEwgbXNnPWF1ZGl0KDE1NzQxODIw
OTkuNTU5OjIwMDIpOiBhcmNoPWMwMDAwMDNlIHN5c2NhbGw9NTkKICAgID4gc3VjY2Vzcz15ZXMg
ZXhpdD0wIGEwPTU1ZGYzMzBhM2MxMCBhMT01NWRmMzMwYTNjNzggYTI9NTVkZjMzMGEzYzkwCiAg
ICA+IGEzPTAgaXRlbXM9MyBwcGlkPTI5NjY0IHBpZD0yOTY3OCBhdWlkPTExNzEgdWlkPTAgZ2lk
PTAgZXVpZD0wIHN1aWQ9MAogICAgPiBmc3VpZD0wIGVnaWQ9MCBzZ2lkPTAgZnNnaWQ9MCB0dHk9
KG5vbmUpIHNlcz0xNzAgY29tbT0iYXB0LWNoZWNrIgogICAgPiBleGU9Ii91c3IvYmluL3B5dGhv
bjMuNSIga2V5PSJyb290Y21kIgogICAgPiAKICAgID4gSW4gdGhpcyBleGFtcGxlLCBJIGFtIGxv
b2tpbmcgdG8gZGVjb2RlIGEwLCBhMSwgYW5kIGEyLiBZZXMsIGl0IHNlZW1zCiAgICA+IHRoYXQg
YXVzZWFyY2ggY2FuIGRlY29kZSB0aGVzZSB2YWx1ZXMuIEhvd2V2ZXIsIEkgYW0gbG9va2luZyB0
bwogICAgPiBkZWNvZGUgdGhlbSB2aWEgU3BsdW5rLgogICAgCiAgICBQbGVhc2UgaGF2ZSBhdXBh
cnNlIGRlY29kZSB0aGVtLiBUaGlzIGlzIHdlbGwgbWFpbnRhaW5lZCBhbmQgYWNjdXJhdGUuCiAg
ICBTb21ldGltZXMgdGhleSBwb2ludCB0byBtZW1vcnkuIFNvbWV0aW1lcyB0aGV5IGhhdmUgbWVh
bmluZy4gQWxsIG9mCiAgICB0aGlzIGlzIGVuY29kZWQgaW4gdGhlIGF1cGFyc2UgbGlicmFyeS4g
TGV0IG1lIGtub3cgaWYgeW91IGhhdmUgYW55CiAgICBpc3N1ZXMgZGVjb2RpbmcgYW55dGhpbmcg
dmlhIGxpYmF1cGFyc2UuCiAgICAKICAgID4gV2hhdCBmb3JtYXQgYXJlIHRoZXNlIHN0cmluZ3Mg
ZW5jb2RlZCBpbiBhbmQgaXMgdGhlcmUgYSB3YXkgdG8KICAgID4gZGVjb2RlIHRoZXNlIHZhbHVl
cyBpbiBhbnkgb3RoZXIgd2F5IG90aGVyIHRoYW4gYnkgdXNpbmcgYXVzZWFyY2g/CiAgICAKICAg
IExpYmF1cGFyc2UgaXMgd2hhdCBhdXNlYXJjaCB1c2VzLiBJdCBoYXMgYWxsIGtub3dsZWRnZSBl
bmNvZGVkIHdpdGhpbgogICAgaXQuIEl0IGRldGFuZ2xlcyBpbnRlcnR3aW5lZCBldmVudHMgYXMg
d2VsbCBhcyBub3JtYWwgZXZlbnRzLgogICAgCiAgICAtU3RldmUKICAgIAogICAgCgoKLS0KTGlu
dXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cu
cmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0


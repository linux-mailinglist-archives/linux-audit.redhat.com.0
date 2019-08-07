Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AAA8559E
	for <lists+linux-audit@lfdr.de>; Thu,  8 Aug 2019 00:17:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99C2812AC9;
	Wed,  7 Aug 2019 22:17:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7D995D9CD;
	Wed,  7 Aug 2019 22:17:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DFBCD18005B9;
	Wed,  7 Aug 2019 22:16:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x77MDRIx014389 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 7 Aug 2019 18:13:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CC9B1608A5; Wed,  7 Aug 2019 22:13:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C50B860852
	for <linux-audit@redhat.com>; Wed,  7 Aug 2019 22:13:25 +0000 (UTC)
Received: from Emailgw01.pnnl.gov (emailgw01.pnnl.gov [192.101.109.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E944C882FB
	for <linux-audit@redhat.com>; Wed,  7 Aug 2019 22:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pnnl.gov; s=s20171204;
	h=from:to:subject:date:message-id:mime-version;
	bh=8G0Z/pN/QHC3SZW+TFAbQGk0GfYceexpHz7jqolNpPc=;
	b=Cm5PvGcNLvQhI+kp7O7MV9fcOk67T+YNqC6Bm9BGr5RR40hyamlKtdds
	KMndjntleg8AtiNtInfen9/TYra9j9E5LflmweZ41BnPEinN9XmfMX05K
	L1cpNGr/fKlzdR4sAaPflmoE8N2YYuccz0IVsCX1VtkpR43uKERjjEVp2
	BL2ZnC5z95zGLL2y7SB0HC8xLyN1NfjGpq6ghFjYhBc3vxV2z8UZu8cfw
	QKANSB4aoQRoTQ6qaEgmn1bjP2p/XtfkaTHrbjB/mMyilHBzX6R3CS2Fv
	wXGhaXuu/w1uMfiW0XCkwW/xk9B3yOjG1f12tcKLDeIYAfm0MPk3SwbHb g==;
Received: from ex10cashub06.pnnl.gov ([130.20.248.212])
	by Emailgw01.pnnl.gov with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2019 15:13:22 -0700
Received: from GCC01-CY1-obe.outbound.protection.outlook.com (130.20.128.10)
	by hybrid.pnnl.gov (130.20.248.212) with Microsoft SMTP Server (TLS) id
	14.3.439.0; Wed, 7 Aug 2019 15:13:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=arT4uw2Cequ5zgH8Pb/YqeP9kuoMHCUdM7aaaKLHZNbfgu8/4ub5tuMwb7eOYuXWTFb/s0B3JmWHr1JzKwp1sez1qybGkkvLLMsKIJ1/m3FTObF8N4fc0tDG5tWqusfdNyzoTkToem2wJg0kZR0CFgyMG3x8omFSnHUqsM/0XjGQpBPPTI7GAr+zuYR+qEEbcsaZd603MO9gL5wp1jZ5Rb+/MQ0JW8n5SIL1mBs0MvWy0UsmqF/1qmg+Fyj+wm5CUnKpFEd3G8hV0nPTI8zOJ75E6PuIJ+Wrg4GORDIoHVdPyKUES1txfZzw2r3KmBJYPL9n42hQSgTTtqq23XGHTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8G0Z/pN/QHC3SZW+TFAbQGk0GfYceexpHz7jqolNpPc=;
	b=Lev4CgDqTy/UQDZDauWGAfCL472DWH5Vev0w9UqBdn5DPeE5s6LsrQqWlBy9aKT4oHOhLx4pdUOtF9YhahTLM1N/oKmpUkbdTUjp/7V8n2+UR5lWfW9gHAf7rSgoDvjMw5Qk+gvEWGDtP2+dfb95mzQVcS3oSerQpfUKX0Axow8HQgCCWNRJyb4Lrp4/5A652SItg6SZIyzFFk/eldWVMRCkfOxrUARKuh7waByg2SwK7ZDqpomaA1j5D1Sl6fdO7+KjjufiJXPFqmKqNaSTU/cW0ygqPmEIIRHUjenF/17Yq9hkh4uNBU11r157/aIX4LQHGINYbSMMi+aSjcEHhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=pnnl.gov; dmarc=pass action=none header.from=pnnl.gov;
	dkim=pass header.d=pnnl.gov;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=PNNL.onmicrosoft.com; 
	s=selector1-PNNL-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8G0Z/pN/QHC3SZW+TFAbQGk0GfYceexpHz7jqolNpPc=;
	b=tQZernI7YEA7jkJWhO/ZU79oqXloNZszyYmo4HtN3UHProb07HR8NWjxVm2VXUoseav8s6roJnf6gH8veXPC2o71X3lfRoyoq8oL/hmV2aQ1WjrqMQzYwT0PcD3i2bowTIdG7ymQIHYI55XJ2nfEkDk6BAa96pjFNY9W/IRIVlE=
Received: from BYAPR09MB3286.namprd09.prod.outlook.com (20.178.1.24) by
	BYAPR09MB3045.namprd09.prod.outlook.com (20.178.0.87) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.16; Wed, 7 Aug 2019 22:13:20 +0000
Received: from BYAPR09MB3286.namprd09.prod.outlook.com
	([fe80::143e:d492:e39b:2472]) by
	BYAPR09MB3286.namprd09.prod.outlook.com
	([fe80::143e:d492:e39b:2472%4]) with mapi id 15.20.2136.018;
	Wed, 7 Aug 2019 22:13:19 +0000
From: "Smith, Gary R" <Gary.Smith@pnnl.gov>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Number of TTY events vs Number of USER_TTY events
Thread-Topic: Number of TTY events vs Number of USER_TTY events
Thread-Index: AQHVTW1RdI/Xj4fH7Uy1PLCcy2ZOAA==
Date: Wed, 7 Aug 2019 22:13:19 +0000
Message-ID: <AC213336-71F2-4FC4-9712-AFB7E62EB07B@pnnl.gov>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.1b.0.190715
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Gary.Smith@pnnl.gov; 
x-originating-ip: [130.20.225.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2d3d919-9b8c-437f-09a4-08d71b847463
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:BYAPR09MB3045; 
x-ms-traffictypediagnostic: BYAPR09MB3045:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BYAPR09MB3045DD5199AD508B85E91827FED40@BYAPR09MB3045.namprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(136003)(366004)(39860400002)(376002)(396003)(199004)(189003)(40764003)(478600001)(66066001)(53936002)(33656002)(58126008)(5640700003)(66476007)(66556008)(6506007)(64756008)(6436002)(102836004)(186003)(66446008)(14454004)(76116006)(6486002)(66946007)(6916009)(99286004)(26005)(2501003)(36756003)(2906002)(6116002)(8676002)(8936002)(5660300002)(3846002)(7736002)(71200400001)(71190400001)(86362001)(2351001)(4744005)(54896002)(316002)(2616005)(6306002)(25786009)(81156014)(6512007)(476003)(486006)(256004)(14444005)(81166006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR09MB3045;
	H:BYAPR09MB3286.namprd09.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eM3zYpHcPEftdK/KTk4ANf3sZyLFMoIJmcIP3D1d0b4DKks7pJgdXUeUn+3Nw8SfSrg+asNW45e+cVsffS08HovbU3SjhhakQ26Rs9dFmOy7fP5+/8WlpSIPZD8kXW13c0rmt8SnT4DspYtTmshhMojcEYiRrpQbbpV7TtCQD8SInCsAj+je3NJAcdNtnCTrzZH4JucSvKkTlCDBP+PPLS1KvJ+p5BYf0OJ+En2skRBwqu5xbtzRKQzSIrWcWE9ut/Iin8gp/7Njksf2Kw+qp8hj4OrpoqHrrzljvOi4mlcvF8gB75/4pCHHKffWLd5xpjlus/FwPotIfhEylG+je+q0lXa26msxDScXjXutr1nOnMLRDFT0S2+5mhvD2ef/8Fy+2Q1b4/ku4i/8n0nGD6D2yy7Oa5OSWLfDDMzt1u4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d3d919-9b8c-437f-09a4-08d71b847463
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 22:13:19.6806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d6faa5f9-0ae2-4033-8c01-30048a38deeb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gary.smith@pnnl.gov
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR09MB3045
X-OriginatorOrg: pnnl.gov
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Wed, 07 Aug 2019 22:13:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Wed, 07 Aug 2019 22:13:24 +0000 (UTC) for IP:'192.101.109.61'
	DOMAIN:'emailgw01.pnnl.gov' HELO:'Emailgw01.pnnl.gov'
	FROM:'Gary.Smith@pnnl.gov' RCPT:''
X-RedHat-Spam-Score: -2.401  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	HTML_MESSAGE, RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_PASS) 192.101.109.61 emailgw01.pnnl.gov 192.101.109.61
	emailgw01.pnnl.gov <Gary.Smith@pnnl.gov>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
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
Content-Type: multipart/mixed; boundary="===============3720228608600920695=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Wed, 07 Aug 2019 22:17:08 +0000 (UTC)

--===============3720228608600920695==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AC21333671F24FC49712AFB7E62EB07Bpnnlgov_"

--_000_AC21333671F24FC49712AFB7E62EB07Bpnnlgov_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

R29vZCBhZnRlcm5vb24sDQoNCkkgaGF2ZSBUVFkgYXVkaXRpbmcgc2V0IHVwIG9uIGEgbnVtYmVy
IG9mIGhvc3RzIHVzaW5nIHBhbV90dHlfYXVkaXQgZm9yIHRoZSByb290IGFjY291bnQuIEkgaGF2
ZSB0aGlzIGxpbmUgaW4gYSBQQU0gZmlsZSB0byBlbmFibGUgaXQ6DQoNCnNlc3Npb24gICByZXF1
aXJlZCBwYW1fdHR5X2F1ZGl0LnNvIGRpc2FibGU9KiBlbmFibGU9cm9vdA0KDQpJbiBsb29raW5n
IGF0IHRoZSByZXBvcnRzIGZyb20gYXVyZXBvcnQgYW5kIGF1c2VhcmNoLCB0aGUgbnVtYmVyIG9m
IFRUWSBldmVudHMgaXMgYWx3YXlzIGVxdWFsIHRvIHRoZSBudW1iZXIgb2YgVVNFUl9UVFkgZXZl
bnRzLiBGb3IgaW5zdGFuY2U6DQoNCiMgYXVzZWFyY2ggLWkgLW0gVFRZIC10cyB0b2RheSB8IHdj
IC1sIDsgYXVzZWFyY2ggLWkgLW0gVVNFUl9UVFkgLXRzIHRvZGF5IHwgd2MgLWwNCjIwDQoyMA0K
DQpJIHN0YXJ0ZWQgd29uZGVyaW5nLCDigJxBcmUgdGhlcmUgYWx3YXlzIHRoZSBzYW1lIG51bWJl
ciBvZiB0aGVzZSB0d28gZXZlbnQgdHlwZXM/4oCdIEkgdHJpZWQgY29uc3RydWN0aW5nIHNvbWUg
c3ludGhldGljIGNhc2VzIHRvIHNlZSBpZiB0aGVyZSBpcyBhIGNhc2Ugd2hlcmUgdGhlcmUgaXNu
4oCZdCBhbiBlcXVhbCBudW1iZXIgb2YgdGhlIHR3byBldmVudHMuIEkgY291bGRu4oCZdCBjb25z
dHJ1Y3Qgc3VjaCBhIGNhc2UuICBJcyB0aGVyZSBhIGNhc2Ugb2YgY2FzZXMgd2hlcmUgdGhlIHR3
byB0eXBlIGV2ZW50IHR5cGVzIGFyZW7igJl0IG9mIGVxdWFsIG51bWJlcj8NCg0KVGhhbmtzIGZv
ciB5b3VyIGhlbHAsDQoNCkdhcnkgU21pdGgNCg0K

--_000_AC21333671F24FC49712AFB7E62EB07Bpnnlgov_
Content-Type: text/html; charset="utf-8"
Content-ID: <3536D5D3C938E24495A1E94E259D4696@namprd09.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpz
cGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0KCWZv
bnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1z
b0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4g
MTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rp
b24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBs
YW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0i
V29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij5Hb29kIGFmdGVybm9vbiw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8
L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQiPkkgaGF2ZSBUVFkgYXVkaXRpbmcgc2V0IHVwIG9uIGEgbnVtYmVyIG9mIGhv
c3RzIHVzaW5nIHBhbV90dHlfYXVkaXQgZm9yIHRoZSByb290IGFjY291bnQuIEkgaGF2ZSB0aGlz
IGxpbmUgaW4gYSBQQU0gZmlsZSB0byBlbmFibGUgaXQ6PG86cD48L286cD48L3NwYW4+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+
Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTEuMHB0Ij5zZXNzaW9uJm5ic3A7Jm5ic3A7IHJlcXVpcmVkIHBhbV90dHlf
YXVkaXQuc28gZGlzYWJsZT0qIGVuYWJsZT1yb290PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5i
c3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij5JbiBsb29raW5nIGF0IHRoZSByZXBvcnRzIGZyb20gYXVyZXBvcnQg
YW5kIGF1c2VhcmNoLCB0aGUgbnVtYmVyIG9mIFRUWSBldmVudHMgaXMgYWx3YXlzIGVxdWFsIHRv
IHRoZSBudW1iZXIgb2YgVVNFUl9UVFkgZXZlbnRzLiBGb3IgaW5zdGFuY2U6PG86cD48L286cD48
L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
MS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4jIGF1c2VhcmNoIC1pIC1tIFRUWSAtdHMg
dG9kYXkgfCB3YyAtbCA7IGF1c2VhcmNoIC1pIC1tIFVTRVJfVFRZIC10cyB0b2RheSB8IHdjIC1s
PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMS4wcHQiPjIwPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjIwPG86cD48L286cD48L3Nw
YW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4w
cHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5JIHN0YXJ0ZWQgd29uZGVyaW5nLCDigJxBcmUg
dGhlcmUgYWx3YXlzIHRoZSBzYW1lIG51bWJlciBvZiB0aGVzZSB0d28gZXZlbnQgdHlwZXM/4oCd
IEkgdHJpZWQgY29uc3RydWN0aW5nIHNvbWUgc3ludGhldGljIGNhc2VzIHRvIHNlZSBpZiB0aGVy
ZSBpcyBhIGNhc2Ugd2hlcmUgdGhlcmUgaXNu4oCZdCBhbiBlcXVhbCBudW1iZXIgb2YgdGhlIHR3
byBldmVudHMuIEkNCiBjb3VsZG7igJl0IGNvbnN0cnVjdCBzdWNoIGEgY2FzZS4gJm5ic3A7SXMg
dGhlcmUgYSBjYXNlIG9mIGNhc2VzIHdoZXJlIHRoZSB0d28gdHlwZSBldmVudCB0eXBlcyBhcmVu
4oCZdCBvZiBlcXVhbCBudW1iZXI/PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0Ij5UaGFua3MgZm9yIHlvdXIgaGVscCw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJz
cDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMS4wcHQiPkdhcnkgU21pdGg8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8
L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_AC21333671F24FC49712AFB7E62EB07Bpnnlgov_--


--===============3720228608600920695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============3720228608600920695==--


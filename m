Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8FAEA102EEE
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 23:15:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574201720;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=fCGE86d4Ws9hZKsI1L8cNQxBGONvGKcCM2nboAwZ0Fs=;
	b=IxhbEPZ8p5UAM7zAo2F986HlYMqEM5DOMQQuc+DAaWjrJpJnT7gic5reFk56DMBjuiJsLS
	nvVZl/dpRDGk0tEqG+GlkPiPvFdQKL09LBlccZ0S0aXZmob3r0i1zL2P1OZuYRtZwbh0tv
	GiaEAeweppmX5uS5e/t3qkOpvIfkC6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-4pAah0ItN6m_vi__7SdoQQ-1; Tue, 19 Nov 2019 17:15:18 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC641800EBE;
	Tue, 19 Nov 2019 22:15:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B218646E8A;
	Tue, 19 Nov 2019 22:15:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6B0B18089C8;
	Tue, 19 Nov 2019 22:15:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJHRna2032710 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 12:27:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 15634201803C; Tue, 19 Nov 2019 17:27:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 105022022EB3
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 17:27:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6293101A55E
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 17:27:46 +0000 (UTC)
IronPort-SDR: G2t4PaEP8eF0gGNI2MBZwdq4XdU8YZkwtwSIYut3raVpG9SQ09a4Wfk9jbEDmI3U7G9kxXjkcW
	NakSyD8MPU6tHbcBuBa+UMnKT/EtK7Xv6aMM0IpH5J4N340RH8crAOTREKTCcnQZjEn0vuxHvX
	1dkqTySMzQzWn0gCumCvNqrFkEM3BumAsu6r0MOyhW7Qp9MO8Yl2VAWTaWsCDB1diyeJcc+VUk
	Zkql3MjNgNVrqCYOx0GmjY4put8ddBWiK3jlotFLXdY9qXWIpNJKVSBCT6wj/u/0cAJevKW6Dn
	AQU=
IronPort-PHdr: =?us-ascii?q?9a23=3AhwTauxNUB7o794pZbLsl6mtUPXoX/o7sNwtQ0K?=
	=?us-ascii?q?IMzox0LfT5rarrMEGX3/hxlliBBdydt6sfzbOK4+u5ATVIyK3CmUhKSIZLWR?=
	=?us-ascii?q?4BhJdetC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBx?=
	=?us-ascii?q?rwKxd+KPjrFY7OlcS30P2594HObwlSizexfL1/IA+roQjetcQajpZuJrosxh?=
	=?us-ascii?q?DUvnZGZuNayH9yK1mOhRj8/MCw/JBi8yRUpf0s8tNLXLv5caolU7FWFSwqPG?=
	=?us-ascii?q?8p6sLlsxnDVhaP6WAHUmoKiBpIAhPK4w/8U5zsryb1rOt92C2dPc3rUbA5XC?=
	=?us-ascii?q?mp4ql3RBP0jioMKjg0+3zVhMNtlqJWuBKvqQJizY7Ibo+bN/t+cb/Sct4BX2?=
	=?us-ascii?q?VNQsNRWjZdDo+gbYYCCfcKM+ZCr4n6olsDtQWwBQipBOjyyzFHnHv23K0k3O?=
	=?us-ascii?q?s7FwHNwQstH84BsHvOqNX0NLkdXvqzzKTT1jXDd/dW2Sr76IjLaBwuvfaMXb?=
	=?us-ascii?q?dpfMfX1EIhFBvFg02RpIHqJT+Y1OcAv3Kb4uZ+T+6ij28qpxlvrjSzycogkJ?=
	=?us-ascii?q?TFip4Xx1ze6Cl0z5s5KcemREN0YdOpFoZbuTuAOItsWMwiRnlluCM9yrIbp5?=
	=?us-ascii?q?G2ZDMKyJE7xx7HbPyHbpSI7grjVOmPJTd4g2poeLWihxau60SvyvPzVtKo0F?=
	=?us-ascii?q?pQqypKiNjMtnQX2xzI8siHTuZ9/kGi2TqVyw/T7eRELVg1lardNZEh3qY9m5?=
	=?us-ascii?q?scvEjZHCL7m1/6ga+Iekk+/uWl6vzrYrD8qZ+dM490hBv+MqMrmsGnHeQ4PR?=
	=?us-ascii?q?IBX2yb+OuizrLj+1b0QK5Sjv0yj6nZtpPaKd4Hqa6+Bg9Zypwj5AqnDze6zN?=
	=?us-ascii?q?QYmmEKLFZEeBKBkojoNEjCL+rlDfiiglSsjCxmx+rYMbL8ApXCNGTDnK39cr?=
	=?us-ascii?q?Z67k4PgDY0mJpb5pRJGvQIPf7yRmfrudDYBwN/OAuxia6zDNR7y5NbUH+DA7?=
	=?us-ascii?q?OxKq7esVaUoOkoJr/fSpUSvWPBKv1tyPfqnHIwnxdJYaag2YoaYXaQBexiPk?=
	=?us-ascii?q?OaJ3Hrh4FSQi8xogMiQbmy2xW5WjlJaiPqBfhuzywnCI+gEYbIT5ysh7rE5i?=
	=?us-ascii?q?qgA5lKfT4ZWF2XGCyubJ2ARvEPLiOKIspx1DcDUOvpR4wg0ESoswn3g/piI/?=
	=?us-ascii?q?HP8yIV/ZTkyJBu5uLVmB1zvTx5BsiQySeMGmdzmG4F?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2F/AADPJNRdmGA0TkBlHQEBAQkBEQU?=
	=?us-ascii?q?FAYFtBQELAYEbf3FVATE0hCCVBpc/CQQBAQEKLQIBAYRZgg8kNwYOAgMBDAE?=
	=?us-ascii?q?BBQEBAQEBBQQBAQIQAQEBAQEICwsGKYU/C4I7IoNiEWgBDD4CBDAnBDWDAAG?=
	=?us-ascii?q?BeX6lGz0CIwFMgQSJfoEyhU6DLYFIgTYBhRqHEoFAP4E4H4pfMoIsBI0tgmK?=
	=?us-ascii?q?FR5hTgjWGNo8ZG5oRjkiaMIFogXxNIxVlAYJCTxEUVpBQDgmOI0EBAYFZjQI?=
	=?us-ascii?q?BgQ4BAQ?=
X-IPAS-Result: =?us-ascii?q?A2F/AADPJNRdmGA0TkBlHQEBAQkBEQUFAYFtBQELAYEbf?=
	=?us-ascii?q?3FVATE0hCCVBpc/CQQBAQEKLQIBAYRZgg8kNwYOAgMBDAEBBQEBAQEBBQQBA?=
	=?us-ascii?q?QIQAQEBAQEICwsGKYU/C4I7IoNiEWgBDD4CBDAnBDWDAAGBeX6lGz0CIwFMg?=
	=?us-ascii?q?QSJfoEyhU6DLYFIgTYBhRqHEoFAP4E4H4pfMoIsBI0tgmKFR5hTgjWGNo8ZG?=
	=?us-ascii?q?5oRjkiaMIFogXxNIxVlAYJCTxEUVpBQDgmOI0EBAYFZjQIBgQ4BAQ?=
X-IronPort-AV: E=Sophos;i="5.69,218,1571702400"; d="scan'208,217";a="25137691"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from esa3.splunk.iphmx.com (esa3.splunk.iphmx.com
	[216.71.153.223]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-67-fpxy1OfINsyeydmplpNP5A-1; Tue, 19 Nov 2019 12:27:43 -0500
Received: from out.west.mail.splunk.com ([64.78.52.96])
	by esa3.splunk.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	19 Nov 2019 17:24:23 +0000
Received: from MBX111-W2-CA-3.pexch111.serverpod.net (10.254.186.8) by
	MBX111-W2-CA-3.pexch111.serverpod.net (10.254.186.8) with Microsoft
	SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov 2019 09:24:21 -0800
Received: from MBX111-W2-CA-3.pexch111.serverpod.net ([10.254.186.8]) by
	MBX111-W2-CA-3.pexch111.serverpod.net ([10.254.186.8]) with mapi id
	15.00.1473.003; Tue, 19 Nov 2019 09:24:21 -0800
From: Tim Galyean <tgalyean@splunk.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Auditd SYSCALL argument decoding
Thread-Topic: Auditd SYSCALL argument decoding
Thread-Index: AQHVnv4uv74rVgVE+E+5JN6sG+CB6w==
Date: Tue, 19 Nov 2019 17:24:21 +0000
Message-ID: <2B96DB9C-982F-4B8D-94A9-AC08073A55E3@splunk.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [204.107.141.245]
MIME-Version: 1.0
X-MC-Unique: fpxy1OfINsyeydmplpNP5A-1
X-MC-Unique: 4pAah0ItN6m_vi__7SdoQQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 19 Nov 2019 17:14:54 -0500
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
Content-Type: multipart/mixed; boundary="===============2593094206791641088=="

--===============2593094206791641088==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2B96DB9C982F4B8D94A9AC08073A55E3splunkcom_"

--_000_2B96DB9C982F4B8D94A9AC08073A55E3splunkcom_
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkFzIEkgdW5kZXJzdGFuZCBpdCwgbG9uZyB2YWx1ZXMgcmVjb3JkZWQgYnkgYXVk
aXRkIGFyZSBzdG9yZWQgYXMgaGV4IGVuY29kZWQgc3RyaW5ncy4gSG93ZXZlciwgd2hlbiBJIGF0
dGVtcHQgdG8gZGVjb2RlIGFyZ3VtZW50cyBzdWNoIGFzIGEwIG9yIGExIGluIFNZU0NBTEwgZXZl
bnRzLCB0aGV5IGFyZSBkZWNvZGVkIGludG8gc3BlY2lhbCBjaGFyYWN0ZXJzIGluc3RlYWQgb2Yg
QVNDSUkuIEFyZSB0aGVzZSB2YWx1ZXMgZW5jb2RlZCBkaWZmZXJlbnRseSB0aGFuIFBST0NUSVRM
RSBldmVudHM/DQoNCkJlbG93IGlzIGFuIGV4YW1wbGUgbG9nIGxpbmU6DQoNCnR5cGU9U1lTQ0FM
TCBtc2c9YXVkaXQoMTU3NDE4MjA5OS41NTk6MjAwMik6IGFyY2g9YzAwMDAwM2Ugc3lzY2FsbD01
OSBzdWNjZXNzPXllcyBleGl0PTAgYTA9NTVkZjMzMGEzYzEwIGExPTU1ZGYzMzBhM2M3OCBhMj01
NWRmMzMwYTNjOTAgYTM9MCBpdGVtcz0zIHBwaWQ9Mjk2NjQgcGlkPTI5Njc4IGF1aWQ9MTE3MSB1
aWQ9MCBnaWQ9MCBldWlkPTAgc3VpZD0wIGZzdWlkPTAgZWdpZD0wIHNnaWQ9MCBmc2dpZD0wIHR0
eT0obm9uZSkgc2VzPTE3MCBjb21tPSJhcHQtY2hlY2siIGV4ZT0iL3Vzci9iaW4vcHl0aG9uMy41
IiBrZXk9InJvb3RjbWQiDQoNCkluIHRoaXMgZXhhbXBsZSwgSSBhbSBsb29raW5nIHRvIGRlY29k
ZSBhMCwgYTEsIGFuZCBhMi4gWWVzLCBpdCBzZWVtcyB0aGF0IGF1c2VhcmNoIGNhbiBkZWNvZGUg
dGhlc2UgdmFsdWVzLiBIb3dldmVyLCBJIGFtIGxvb2tpbmcgdG8gZGVjb2RlIHRoZW0gdmlhIFNw
bHVuay4gV2hhdCBmb3JtYXQgYXJlIHRoZXNlIHN0cmluZ3MgZW5jb2RlZCBpbiBhbmQgaXMgdGhl
cmUgYSB3YXkgdG8gZGVjb2RlIHRoZXNlIHZhbHVlcyBpbiBhbnkgb3RoZXIgd2F5IG90aGVyIHRo
YW4gYnkgdXNpbmcgYXVzZWFyY2g/DQo=
--_000_2B96DB9C982F4B8D94A9AC08073A55E3splunkcom_
Content-Type: text/html; charset=UTF-8
Content-ID: <F3B7C98A379C7F4C897C378E6A0C200B@pexch111.serverpod.net>
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
emU6MTEuMHB0Ij5IZWxsbyw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3Nw
YW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4w
cHQiPkFzIEkgdW5kZXJzdGFuZCBpdCwgbG9uZyB2YWx1ZXMgcmVjb3JkZWQgYnkgYXVkaXRkIGFy
ZSBzdG9yZWQgYXMgaGV4IGVuY29kZWQgc3RyaW5ncy4gSG93ZXZlciwgd2hlbiBJIGF0dGVtcHQg
dG8gZGVjb2RlIGFyZ3VtZW50cyBzdWNoIGFzIGEwIG9yIGExIGluIFNZU0NBTEwgZXZlbnRzLCB0
aGV5IGFyZSBkZWNvZGVkIGludG8gc3BlY2lhbCBjaGFyYWN0ZXJzDQogaW5zdGVhZCBvZiBBU0NJ
SS4gQXJlIHRoZXNlIHZhbHVlcyBlbmNvZGVkIGRpZmZlcmVudGx5IHRoYW4gUFJPQ1RJVExFIGV2
ZW50cz8gPG86cD4NCjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkJlbG93
IGlzIGFuIGV4YW1wbGUgbG9nIGxpbmU6PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij50eXBlPVNZU0NBTEwgbXNnPWF1ZGl0KDE1NzQxODIwOTkuNTU5OjIwMDIpOiBh
cmNoPWMwMDAwMDNlIHN5c2NhbGw9NTkgc3VjY2Vzcz15ZXMgZXhpdD0wIGEwPTU1ZGYzMzBhM2Mx
MCBhMT01NWRmMzMwYTNjNzggYTI9NTVkZjMzMGEzYzkwIGEzPTAgaXRlbXM9MyBwcGlkPTI5NjY0
IHBpZD0yOTY3OCBhdWlkPTExNzEgdWlkPTAgZ2lkPTAgZXVpZD0wIHN1aWQ9MA0KIGZzdWlkPTAg
ZWdpZD0wIHNnaWQ9MCBmc2dpZD0wIHR0eT0obm9uZSkgc2VzPTE3MCBjb21tPSZxdW90O2FwdC1j
aGVjayZxdW90OyBleGU9JnF1b3Q7L3Vzci9iaW4vcHl0aG9uMy41JnF1b3Q7IGtleT0mcXVvdDty
b290Y21kJnF1b3Q7PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5J
biB0aGlzIGV4YW1wbGUsIEkgYW0gbG9va2luZyB0byBkZWNvZGUgYTAsIGExLCBhbmQgYTIuIFll
cywgaXQgc2VlbXMgdGhhdCBhdXNlYXJjaCBjYW4gZGVjb2RlIHRoZXNlIHZhbHVlcy4gSG93ZXZl
ciwgSSBhbSBsb29raW5nIHRvIGRlY29kZSB0aGVtIHZpYSBTcGx1bmsuIFdoYXQgZm9ybWF0IGFy
ZSB0aGVzZSBzdHJpbmdzIGVuY29kZWQgaW4gYW5kIGlzDQogdGhlcmUgYSB3YXkgdG8gZGVjb2Rl
IHRoZXNlIHZhbHVlcyBpbiBhbnkgb3RoZXIgd2F5IG90aGVyIHRoYW4gYnkgdXNpbmcgYXVzZWFy
Y2g/PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=
--_000_2B96DB9C982F4B8D94A9AC08073A55E3splunkcom_--

--===============2593094206791641088==
Content-Type: text/plain; charset=WINDOWS-1252
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============2593094206791641088==--


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AF095686FA
	for <lists+linux-audit@lfdr.de>; Mon, 15 Jul 2019 12:25:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 331A0308FB82;
	Mon, 15 Jul 2019 10:25:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25F1F5D9D2;
	Mon, 15 Jul 2019 10:25:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A15041F40;
	Mon, 15 Jul 2019 10:25:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6FAPVPG030447 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 15 Jul 2019 06:25:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3E50120267EB; Mon, 15 Jul 2019 10:25:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.rdu2.redhat.com
	[10.11.55.6])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3678A2026D5B
	for <linux-audit@redhat.com>; Mon, 15 Jul 2019 10:25:29 +0000 (UTC)
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A78954029AF9
	for <linux-audit@redhat.com>; Mon, 15 Jul 2019 10:25:22 +0000 (UTC)
X-QQ-GoodBg: 0
X-QQ-SSF: 00100000000000F0
X-QQ-FEAT: jfJxHuYZxOAdZKFH+UtEGa8sC5o+vH364dkO6xAn4jIISuqRUdjzr7K3NSdD1
	ZzuDoh8wvMUKCQrBWa6PYyOAqX6YzZBm4+rqzfA7gcYrNkJElLjd303KFqxonAmqIzHmWSp
	3iUvY/hr/gMjXdrED2KZ5hwUn4UwRITk6UWORI3MgYCQgTBDeI+waGn20maJzmKv5M94Ynb
	xUw5jaVWbOH8P5X2CZj5UsncwAnaOJvuanOqcRjgwO4lqjQ0e+IQG6yinrss2AXb0f5C4DV
	x4l2n2KnYPWYRB3Jwb74lC6RLQtzsoEZZMGx4hFW1g/oUq
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 115.204.28.51
X-QQ-STYLE: 
X-QQ-mid: bizmailfree10t1563186071t8004
From: "=?utf-8?B?5p2o5rW3?=" <hai.yang@magic-shield.com>
To: "=?utf-8?B?U3RldmUgR3J1YmI=?=" <sgrubb@redhat.com>,
	"=?utf-8?B?bGludXgtYXVkaXQ=?=" <linux-audit@redhat.com>
Subject: Re: overhead of auditd
Mime-Version: 1.0
Date: Mon, 15 Jul 2019 18:21:11 +0800
X-Priority: 3
Message-ID: <tencent_426F741872D994171406DF95@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-QQ-Mailer: QQMail 2.x
References: <tencent_5FA425C1329B32126C1D89F1@qq.com> <9307307.NKOEW2x8Z6@x2>
In-Reply-To: <9307307.NKOEW2x8Z6@x2>
X-QQ-ReplyHash: 2098390384
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
	id ; Mon, 15 Jul 2019 18:21:12 +0800 (CST)
Feedback-ID: bizmailfree:magic-shield.com:qybgforeign:qybgforeign4
X-QQ-Bgrelay: 1
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.11.55.6]); Mon, 15 Jul 2019 10:25:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 15 Jul 2019 10:25:24 +0000 (UTC) for IP:'54.254.200.128'
	DOMAIN:'smtpbgsg2.qq.com' HELO:'smtpbgsg2.qq.com'
	FROM:'hai.yang@magic-shield.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (FROM_EXCESS_BASE64, HTML_MESSAGE,
	MSGID_FROM_MTA_HEADER, RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 54.254.200.128 smtpbgsg2.qq.com 54.254.200.128
	smtpbgsg2.qq.com <hai.yang@magic-shield.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.55.6
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Content-Type: multipart/mixed; boundary="===============3110057858877587878=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Mon, 15 Jul 2019 10:25:53 +0000 (UTC)

This is a multi-part message in MIME format.

--===============3110057858877587878==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5D2C5397_09466F10_4034AF6D"
Content-Transfer-Encoding: 8Bit

This is a multi-part message in MIME format.

------=_NextPart_5D2C5397_09466F10_4034AF6D
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgU3RldmUsDQoNCg0KSSBldmVyIHJlYWQgdGhlIGRvY3VtZW50IHlvdSB3cm90ZSBhYm91
dCBsYXlpbmcgSURTIG9uIHRvcCBvZiBhdWRpdGQuIEFuZCBJIHN1cHBvc2UgaW5vdGlmeSBj
b3VsZCBiZSBsaWdodHdlaWdodCBmb3IgSURTLiBBbnkgY29tbWVudD8NCg0KDQpCZXN0IHJl
Z2FyZHMNCkhhaQ0KDQoNCg0KDQoNCg0KDQogDQotLS0tLS0tLS0tLS0tLS0tLS0gT3JpZ2lu
YWwgLS0tLS0tLS0tLS0tLS0tLS0tDQpGcm9tOiAgIlN0ZXZlIEdydWJiIjxzZ3J1YmJAcmVk
aGF0LmNvbT47DQpEYXRlOiAgRnJpLCBKdWwgMTIsIDIwMTkgMDg6MTQgUE0NClRvOiAgImxp
bnV4LWF1ZGl0IjxsaW51eC1hdWRpdEByZWRoYXQuY29tPjsgDQpDYzogICLmnajmtbciPGhh
aS55YW5nQG1hZ2ljLXNoaWVsZC5jb20+OyANClN1YmplY3Q6ICBSZTogb3ZlcmhlYWQgb2Yg
YXVkaXRkDQoNCiANCg0KSGVsbG8sDQoNCk9uIFRodXJzZGF5LCBKdWx5IDExLCAyMDE5IDEx
OjIzOjQ1IFBNIEVEVCDmnajmtbcgd3JvdGU6DQo+IFR1cm5pbmcgb24gYWxsIHN5c3RlbSBj
YWxscyBpbiBhdWRpdC5ydWxlcywgYW5kIHRyYW5zZmVycmluZyBhIHRhciBmaWxlIHRvDQo+
IHRoZSB0YXJnZXQgc3lzdGVtIChDZW50T1MgNywgNCBjb3JlcyksIEkgZm91bmQgImF1ZGl0
ZCIgY29uc3VtZXMgaGlnaCBDUFUNCj4gdXNhZ2UuIElzIGl0IGV4cGVjdGVkPw0KDQpJdCB3
b3VsZCBub3QgYmUgc3VycHJpc2luZy4gU29tZSBzeXN0ZW0gY2FsbHMgaGF2ZSBtb3JlIG92
ZXJoZWFkIHRoYW4gb3RoZXJzLiANClNvLCBkZXBlbmRpbmcgb24gZXZlcnl0aGluZyB0aGF0
IGlzIHJ1bm5pbmcsIHlvdSBjYW4ga2lsbCB5b3VyIHN5c3RlbS4NCg0KPiBCVFcsIGFmdGVy
IHR1cm5pbmcgd3JpdGUtbG9ncyBvZmYsIGFuZCBhZGQgZGlzcGF0Y2hlciwgYm90aCAiYXVk
aXNwZCIgYW5kDQo+ICJhdWRpdGQiIGFyZSBjb25zdW1pbmcgaGlnaCBDUFUuDQoNClRoZXkg
aGF2ZSBhIGxvdCBvZiBldmVudHMgdG8gaGFuZGxlLg0KDQotU3RldmU=

------=_NextPart_5D2C5397_09466F10_4034AF6D
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGRpdj5IaSBTdGV2ZSw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgZXZlciByZWFkIHRo
ZSBkb2N1bWVudCB5b3Ugd3JvdGUgYWJvdXQgbGF5aW5nIElEUyBvbiB0b3Agb2YgYXVkaXRk
LiBBbmQgSSBzdXBwb3NlIGlub3RpZnkgY291bGQgYmUgbGlnaHR3ZWlnaHQgZm9yIElEUy4g
QW55IGNvbW1lbnQ/PC9kaXY+PGRpdj48c2lnbiBzaWduaWQ9Ijk4Ij48YnI+PC9zaWduPjwv
ZGl2PjxkaXY+PHNpZ24gc2lnbmlkPSI5OCI+QmVzdCByZWdhcmRzPC9zaWduPjwvZGl2Pjxk
aXY+PHNpZ24gc2lnbmlkPSI5OCI+SGFpPC9zaWduPjxzaWduIHNpZ25pZD0iOTgiPjxicj48
L3NpZ24+PC9kaXY+PGRpdj48c2lnbiBzaWduaWQ9Ijk4Ij48ZGl2IHN0eWxlPSJmb250LXNp
emU6MTRweDtmb250LWZhbWlseTpWZXJkYW5hO2NvbG9yOiMwMDA7Ij48ZGl2IHN0eWxlPSJv
dmVyZmxvdzpoaWRkZW47Ij48dGFibGUgY2xhc3M9InByZXZpZXdfdGFibGUiPjx0Ym9keT48
dHI+PHRkIHZhbGlnbj0ibWlkZGxlIj48YnI+PC90ZD48dGQgdmFsaWduPSJtaWRkbGUiIHN0
eWxlPSJjb2xvcjojYTBhMGEwO2ZvbnQtc2l6ZToxMnB4OyI+PC90ZD48L3RyPjwvdGJvZHk+
PC90YWJsZT48L2Rpdj48L2Rpdj48L3NpZ24+PC9kaXY+PGRpdj48aW5jbHVkZXRhaWw+PGRp
dj48L2Rpdj48ZGl2PiZuYnNwOzwvZGl2PjxkaXYgc3R5bGU9ImZvbnQ6VmVyZGFuYSBub3Jt
YWwgMTRweDtjb2xvcjojMDAwOyI+PGRpdiBzdHlsZT0iRk9OVC1TSVpFOiAxMnB4O0ZPTlQt
RkFNSUxZOiBBcmlhbCBOYXJyb3c7cGFkZGluZzoycHggMCAycHggMDsiPi0tLS0tLS0tLS0t
LS0tLS0tLSZuYnNwO09yaWdpbmFsJm5ic3A7LS0tLS0tLS0tLS0tLS0tLS0tPC9kaXY+PGRp
diBzdHlsZT0iRk9OVC1TSVpFOiAxMnB4O2JhY2tncm91bmQ6I2VmZWZlZjtwYWRkaW5nOjhw
eDsiPjxkaXYgaWQ9Im1lbnVfc2VuZGVyIj48Yj5Gcm9tOiA8L2I+Jm5ic3A7IlN0ZXZlIEdy
dWJiIiZsdDtzZ3J1YmJAcmVkaGF0LmNvbSZndDs7PC9kaXY+PGRpdj48Yj5EYXRlOiA8L2I+
Jm5ic3A7RnJpLCBKdWwgMTIsIDIwMTkgMDg6MTQgUE08L2Rpdj48ZGl2PjxiPlRvOiA8L2I+
Jm5ic3A7ImxpbnV4LWF1ZGl0IiZsdDtsaW51eC1hdWRpdEByZWRoYXQuY29tJmd0OzsgPHdi
cj48L2Rpdj48ZGl2PjxiPkNjOiA8L2I+Jm5ic3A7IuadqOa1tyImbHQ7aGFpLnlhbmdAbWFn
aWMtc2hpZWxkLmNvbSZndDs7IDx3YnI+PC9kaXY+PGRpdj48Yj5TdWJqZWN0OiA8L2I+Jm5i
c3A7UmU6IG92ZXJoZWFkIG9mIGF1ZGl0ZDwvZGl2PjwvZGl2PjxkaXY+Jm5ic3A7PC9kaXY+
PGRpdiBzdHlsZT0icG9zaXRpb246cmVsYXRpdmU7Ij48ZGl2IGlkPSJ0bXBjb250ZW50X3Jl
cyI+PC9kaXY+SGVsbG8sPGJyPjxicj5PbiBUaHVyc2RheSwgSnVseSAxMSwgMjAxOSAxMToy
Mzo0NSBQTSBFRFQg5p2o5rW3IHdyb3RlOjxicj4mZ3Q7IFR1cm5pbmcgb24gYWxsIHN5c3Rl
bSBjYWxscyBpbiBhdWRpdC5ydWxlcywgYW5kIHRyYW5zZmVycmluZyBhIHRhciBmaWxlIHRv
PGJyPiZndDsgdGhlIHRhcmdldCBzeXN0ZW0gKENlbnRPUyA3LCA0IGNvcmVzKSwgSSBmb3Vu
ZCAiYXVkaXRkIiBjb25zdW1lcyBoaWdoIENQVTxicj4mZ3Q7IHVzYWdlLiBJcyBpdCBleHBl
Y3RlZD88YnI+PGJyPkl0IHdvdWxkIG5vdCBiZSBzdXJwcmlzaW5nLiBTb21lIHN5c3RlbSBj
YWxscyBoYXZlIG1vcmUgb3ZlcmhlYWQgdGhhbiBvdGhlcnMuIDxicj5TbywgZGVwZW5kaW5n
IG9uIGV2ZXJ5dGhpbmcgdGhhdCBpcyBydW5uaW5nLCB5b3UgY2FuIGtpbGwgeW91ciBzeXN0
ZW0uPGJyPjxicj4mZ3Q7IEJUVywgYWZ0ZXIgdHVybmluZyB3cml0ZS1sb2dzIG9mZiwgYW5k
IGFkZCBkaXNwYXRjaGVyLCBib3RoICJhdWRpc3BkIiBhbmQ8YnI+Jmd0OyAiYXVkaXRkIiBh
cmUgY29uc3VtaW5nIGhpZ2ggQ1BVLjxicj48YnI+VGhleSBoYXZlIGEgbG90IG9mIGV2ZW50
cyB0byBoYW5kbGUuPGJyPjxicj4tU3RldmU8YnI+PGJyPjwvZGl2PjwvZGl2PjwhLS08IVtl
bmRpZl0tLT48L2luY2x1ZGV0YWlsPjwvZGl2Pg==

------=_NextPart_5D2C5397_09466F10_4034AF6D--




--===============3110057858877587878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============3110057858877587878==--




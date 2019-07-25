Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A2D74592
	for <lists+linux-audit@lfdr.de>; Thu, 25 Jul 2019 07:44:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A31C3330265;
	Thu, 25 Jul 2019 05:44:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF08D5C22F;
	Thu, 25 Jul 2019 05:44:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FD4B41F53;
	Thu, 25 Jul 2019 05:44:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6P5iQm0018050 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 25 Jul 2019 01:44:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B97E060497; Thu, 25 Jul 2019 05:44:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B41FA60148
	for <linux-audit@redhat.com>; Thu, 25 Jul 2019 05:44:24 +0000 (UTC)
Received: from smtpbg202.qq.com (smtpbg202.qq.com [184.105.206.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3CB9D2BF02
	for <linux-audit@redhat.com>; Thu, 25 Jul 2019 05:44:19 +0000 (UTC)
X-QQ-GoodBg: 0
X-QQ-SSF: 00100000000000F0
X-QQ-FEAT: eCI7g6vD7lXFBRzXGyHpIrDARJ70Zgf4U8NLAvgs7qiiYEwp38nNkwXnVjO2g
	byJr32FrIxQch+UTn2Pnhgigc2qmccdTQuJ40qhN9b466HRTlJq3y306cdze7Hdp8sqHHtM
	JIAofFtK0VXgk0FLWxtZK2oDd8f6Ku9K3qKvKvJloMsaZs3+YMzv/NK9QzqhAb09UJHjrFE
	tEJ+rY7mftKihjT804f8iV9puAqfLkpKFbJoztDzuSy2z1SQIIXBXdcHKg5aOPZJeSvSXW4
	/4fPRx+T/TBTS873aYRZIB8T81hEur9O+zAZ9suyomIv1ANsxMJQWuujs=
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 183.128.154.209
X-QQ-STYLE: 
X-QQ-mid: bizmailfree10t1564033447t1883
From: "=?utf-8?B?5p2o5rW3?=" <hai.yang@magic-shield.com>
To: "=?utf-8?B?U3RldmUgR3J1YmI=?=" <sgrubb@redhat.com>,
	"=?utf-8?B?bGludXgtYXVkaXQ=?=" <linux-audit@redhat.com>
Subject: Re: How to filter PROCTITLE events
Mime-Version: 1.0
Date: Thu, 25 Jul 2019 13:44:07 +0800
X-Priority: 3
Message-ID: <tencent_51B48DB510141AD94C0292D1@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-QQ-Mailer: QQMail 2.x
References: <tencent_2653C64E6532CFFE233BCDFC@qq.com> <1846383.7Xiv5u5QpR@x2>
In-Reply-To: <1846383.7Xiv5u5QpR@x2>
X-QQ-ReplyHash: 279285674
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
	id ; Thu, 25 Jul 2019 13:44:08 +0800 (CST)
Feedback-ID: bizmailfree:magic-shield.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Thu, 25 Jul 2019 05:44:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Thu, 25 Jul 2019 05:44:20 +0000 (UTC) for IP:'184.105.206.29'
	DOMAIN:'smtpbg202.qq.com' HELO:'smtpbg202.qq.com'
	FROM:'hai.yang@magic-shield.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (FROM_EXCESS_BASE64, HTML_MESSAGE,
	MSGID_FROM_MTA_HEADER, RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 184.105.206.29 smtpbg202.qq.com 184.105.206.29
	smtpbg202.qq.com <hai.yang@magic-shield.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Content-Type: multipart/mixed; boundary="===============7933749836213279221=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 25 Jul 2019 05:44:45 +0000 (UTC)

This is a multi-part message in MIME format.

--===============7933749836213279221==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5D3941A7_0D4031D0_2E323AA9"
Content-Transfer-Encoding: 8Bit

This is a multi-part message in MIME format.

------=_NextPart_5D3941A7_0D4031D0_2E323AA9
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIFN0ZXZlLiBJdCB3b3JrcyA6LSkNCk1lYW53aGlsZSwgZm9yIHJlYWQvd3JpdGUg
c3lzdGVtIGNhbGwsIGlmIHRoZXkgYmVsb25ncyB0byBzYW1lIHBpZCBhbmQgc2FtZSBmZCwg
d2UgYXJlIHRyeWluZyB0byBzdXBwcmVzcyB0aGVtIGludG8gb25lIG1zZy4gSSBndWVzcyBp
dCB3b3VsZCBub3QgYmUgYWJsZSB0byBmaWx0ZXIgdXNpbmcgYXVkaXRjdGwsIGlzIHRoYXQg
cmlnaHQ/DQoNCg0KUmVnYXJkcw0KSGFpDQoNCg0KDQoNCg0KDQoNCg0KDQogDQogDQotLS0t
LS0tLS0tLS0tLS0tLS0gT3JpZ2luYWwgLS0tLS0tLS0tLS0tLS0tLS0tDQpGcm9tOiAgIlN0
ZXZlIEdydWJiIjxzZ3J1YmJAcmVkaGF0LmNvbT47DQpEYXRlOiAgV2VkLCBKdWwgMjQsIDIw
MTkgMDg6MTQgUE0NClRvOiAgImxpbnV4LWF1ZGl0IjxsaW51eC1hdWRpdEByZWRoYXQuY29t
PjsgDQpDYzogICLmnajmtbciPGhhaS55YW5nQG1hZ2ljLXNoaWVsZC5jb20+OyANClN1Ympl
Y3Q6ICBSZTogSG93IHRvIGZpbHRlciBQUk9DVElUTEUgZXZlbnRzDQoNCiANCg0KT24gV2Vk
bmVzZGF5LCBKdWx5IDI0LCAyMDE5IDU6Mjc6NTkgQU0gRURUIOadqOa1tyB3cm90ZToNCj4g
SGkNCj4gDQo+IEkgYW0gbG9va2luZyBmb3IgdGhlIG1ldGhvZCB0byBmaWx0ZXIgdGhlIFBS
T0NUSVRMRSBldmVudHMgdmlhIGF1ZGl0Y3RsLg0KPiANCj4gSXQgaXMgc2FpZCB3ZSBjYW4g
ZG8gaXQsIGJ1dCBJIGNvdWxkIG5vdCBmaWd1cmUgb3V0IGhvdy4NCg0KRGlkIHlvdSByZWFk
IGFib3V0IHRoZSBleGNsdWRlIGZpbHRlcj8gIDotKQ0KDQo+ICJUaGUgcHJvY3RpdGxlIGV2
ZW50IGlzIGVtaXR0ZWQgZHVyaW5nIHN5c2NhbGwgYXVkaXRzLCBhbmQgY2FuIGJlIGZpbHRl
cmVkDQo+IHdpdGggYXVkaXRjdGwuIg0KDQotYSBhbHdheXMsZXhjbHVkZSAtRiBtc2d0eXBl
PVBST0NUSVRMRQ0KDQpUaGVyZSBpcyBhbm90aGVyIGV4YW1wbGUgaW4gdGhlIDIwLWRvbnQt
YXVkaXQucnVsZXMgZmlsZS4NCg0KLVN0ZXZl

------=_NextPart_5D3941A7_0D4031D0_2E323AA9
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGRpdj5UaGFua3MgU3RldmUuIEl0IHdvcmtzIDotKTwvZGl2PjxkaXY+TWVhbndoaWxlLCBm
b3IgcmVhZC93cml0ZSBzeXN0ZW0gY2FsbCwgaWYgdGhleSBiZWxvbmdzIHRvIHNhbWUgcGlk
IGFuZCBzYW1lIGZkLCB3ZSBhcmUgdHJ5aW5nIHRvIHN1cHByZXNzIHRoZW0gaW50byBvbmUg
bXNnLiBJIGd1ZXNzIGl0IHdvdWxkIG5vdCBiZSBhYmxlIHRvIGZpbHRlciB1c2luZyBhdWRp
dGN0bCwgaXMgdGhhdCByaWdodD88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxzaWduIHNp
Z25pZD0iOTgiPjxkaXYgc3R5bGU9ImNvbG9yOiM5MDkwOTA7Zm9udC1mYW1pbHk6QXJpYWwg
TmFycm93O2ZvbnQtc2l6ZToxMnB4Ij5SZWdhcmRzPC9kaXY+PGRpdiBzdHlsZT0iY29sb3I6
IzkwOTA5MDtmb250LWZhbWlseTpBcmlhbCBOYXJyb3c7Zm9udC1zaXplOjEycHgiPkhhaTxi
cj48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1zaXplOjE0cHg7Zm9udC1mYW1pbHk6VmVy
ZGFuYTtjb2xvcjojMDAwOyI+PGRpdiBzdHlsZT0ib3ZlcmZsb3c6aGlkZGVuOyI+PHRhYmxl
IGNsYXNzPSJwcmV2aWV3X3RhYmxlIj48dGJvZHk+PHRyPjx0ZCB2YWxpZ249Im1pZGRsZSI+
PGRpdj48YnI+PC9kaXY+PC90ZD48dGQgdmFsaWduPSJtaWRkbGUiIHN0eWxlPSJjb2xvcjoj
YTBhMGEwO2ZvbnQtc2l6ZToxMnB4OyI+PC90ZD48L3RyPjwvdGJvZHk+PC90YWJsZT48L2Rp
dj48L2Rpdj48L3NpZ24+PC9kaXY+PGRpdj48L2Rpdj48ZGl2PjxpbmNsdWRldGFpbD48ZGl2
PiZuYnNwOzwvZGl2PjxkaXY+Jm5ic3A7PC9kaXY+PGRpdiBzdHlsZT0iZm9udDpWZXJkYW5h
IG5vcm1hbCAxNHB4O2NvbG9yOiMwMDA7Ij48ZGl2IHN0eWxlPSJGT05ULVNJWkU6IDEycHg7
Rk9OVC1GQU1JTFk6IEFyaWFsIE5hcnJvdztwYWRkaW5nOjJweCAwIDJweCAwOyI+LS0tLS0t
LS0tLS0tLS0tLS0tJm5ic3A7T3JpZ2luYWwmbmJzcDstLS0tLS0tLS0tLS0tLS0tLS08L2Rp
dj48ZGl2IHN0eWxlPSJGT05ULVNJWkU6IDEycHg7YmFja2dyb3VuZDojZWZlZmVmO3BhZGRp
bmc6OHB4OyI+PGRpdiBpZD0ibWVudV9zZW5kZXIiPjxiPkZyb206IDwvYj4mbmJzcDsiU3Rl
dmUgR3J1YmIiJmx0O3NncnViYkByZWRoYXQuY29tJmd0Ozs8L2Rpdj48ZGl2PjxiPkRhdGU6
IDwvYj4mbmJzcDtXZWQsIEp1bCAyNCwgMjAxOSAwODoxNCBQTTwvZGl2PjxkaXY+PGI+VG86
IDwvYj4mbmJzcDsibGludXgtYXVkaXQiJmx0O2xpbnV4LWF1ZGl0QHJlZGhhdC5jb20mZ3Q7
OyA8d2JyPjwvZGl2PjxkaXY+PGI+Q2M6IDwvYj4mbmJzcDsi5p2o5rW3IiZsdDtoYWkueWFu
Z0BtYWdpYy1zaGllbGQuY29tJmd0OzsgPHdicj48L2Rpdj48ZGl2PjxiPlN1YmplY3Q6IDwv
Yj4mbmJzcDtSZTogSG93IHRvIGZpbHRlciBQUk9DVElUTEUgZXZlbnRzPC9kaXY+PC9kaXY+
PGRpdj4mbmJzcDs8L2Rpdj48ZGl2IHN0eWxlPSJwb3NpdGlvbjpyZWxhdGl2ZTsiPjxkaXYg
aWQ9InRtcGNvbnRlbnRfcmVzIj48L2Rpdj5PbiBXZWRuZXNkYXksIEp1bHkgMjQsIDIwMTkg
NToyNzo1OSBBTSBFRFQg5p2o5rW3IHdyb3RlOjxicj4mZ3Q7IEhpPGJyPiZndDsgPGJyPiZn
dDsgSSBhbSBsb29raW5nIGZvciB0aGUgbWV0aG9kIHRvIGZpbHRlciB0aGUgUFJPQ1RJVExF
IGV2ZW50cyB2aWEgYXVkaXRjdGwuPGJyPiZndDsgPGJyPiZndDsgSXQgaXMgc2FpZCB3ZSBj
YW4gZG8gaXQsIGJ1dCBJIGNvdWxkIG5vdCBmaWd1cmUgb3V0IGhvdy48YnI+PGJyPkRpZCB5
b3UgcmVhZCBhYm91dCB0aGUgZXhjbHVkZSBmaWx0ZXI/Jm5ic3A7IDotKTxicj48YnI+Jmd0
OyAiVGhlIHByb2N0aXRsZSBldmVudCBpcyBlbWl0dGVkIGR1cmluZyBzeXNjYWxsIGF1ZGl0
cywgYW5kIGNhbiBiZSBmaWx0ZXJlZDxicj4mZ3Q7IHdpdGggYXVkaXRjdGwuIjxicj48YnI+
LWEgYWx3YXlzLGV4Y2x1ZGUgLUYgbXNndHlwZT1QUk9DVElUTEU8YnI+PGJyPlRoZXJlIGlz
IGFub3RoZXIgZXhhbXBsZSBpbiB0aGUgMjAtZG9udC1hdWRpdC5ydWxlcyBmaWxlLjxicj48
YnI+LVN0ZXZlPGJyPjxicj48L2Rpdj48L2Rpdj48IS0tPCFbZW5kaWZdLS0+PC9pbmNsdWRl
dGFpbD48L2Rpdj4=

------=_NextPart_5D3941A7_0D4031D0_2E323AA9--




--===============7933749836213279221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============7933749836213279221==--




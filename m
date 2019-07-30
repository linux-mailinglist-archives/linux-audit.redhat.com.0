Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7947A815
	for <lists+linux-audit@lfdr.de>; Tue, 30 Jul 2019 14:19:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC7F03179B4C;
	Tue, 30 Jul 2019 12:19:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBE035C1B4;
	Tue, 30 Jul 2019 12:19:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E82741F53;
	Tue, 30 Jul 2019 12:19:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6UCJ7aN025977 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 30 Jul 2019 08:19:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A1E92166BA5; Tue, 30 Jul 2019 12:19:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.rdu2.redhat.com
	[10.11.55.6])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 558A42166BA1
	for <linux-audit@redhat.com>; Tue, 30 Jul 2019 12:19:05 +0000 (UTC)
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3D90402813D
	for <linux-audit@redhat.com>; Tue, 30 Jul 2019 12:18:58 +0000 (UTC)
X-QQ-GoodBg: 0
X-QQ-SSF: 00100000000000F0
X-QQ-FEAT: Uv7+hkXTRUMdvo+lYDFpoZYUsviKB9YAz8XU9DIvquelDhmhY+HXgFM0VEUBH
	vAGvm85KXwBKxWvVBUOroJI47suiFkqORF4nN6yWssPywuFQ5SJryttfrUWhuMsg3bsU5u5
	4+GNYMOFsOHU/zRrwCMf5SmptgA1PC17d8zwnyNPlmeUZSiQBVZgKtKjL11FRrS8Q9HOCO0
	84l0luNNjdBcl4BbhC2ar6g+4R7pXbV/6Y0pi0kwQMMJmc+R4Sd4z56aHxVXcRYMF9GHbVG
	BAszybBur4YtnZxR1D2StQpDGHh49JiFWh1Q2JLsZo4GjtOKh/R+mHcFo=
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 183.128.216.145
X-QQ-STYLE: 
X-QQ-mid: bizmailfree10t1564489121t5985
From: "=?utf-8?B?5p2o5rW3?=" <hai.yang@magic-shield.com>
To: "=?utf-8?B?U3RldmUgR3J1YmI=?=" <sgrubb@redhat.com>
Subject: Re: How to filter PROCTITLE events
Mime-Version: 1.0
Date: Tue, 30 Jul 2019 20:18:41 +0800
X-Priority: 3
Message-ID: <tencent_5D3084A9009B5E362A73C120@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-QQ-Mailer: QQMail 2.x
References: <tencent_2653C64E6532CFFE233BCDFC@qq.com> <1846383.7Xiv5u5QpR@x2>
	<tencent_51B48DB510141AD94C0292D1@qq.com> <1899046.JkZJ7mvpU2@x2>
In-Reply-To: <1899046.JkZJ7mvpU2@x2>
X-QQ-ReplyHash: 3639519356
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
	id ; Tue, 30 Jul 2019 20:18:42 +0800 (CST)
Feedback-ID: bizmailfree:magic-shield.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.11.55.6]); Tue, 30 Jul 2019 12:19:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 30 Jul 2019 12:19:01 +0000 (UTC) for IP:'54.207.22.56'
	DOMAIN:'smtpbgbr2.qq.com' HELO:'smtpbgbr2.qq.com'
	FROM:'hai.yang@magic-shield.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (FROM_EXCESS_BASE64, HTML_MESSAGE,
	HTML_NONELEMENT_30_40, MSGID_FROM_MTA_HEADER, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,
	SPF_PASS) 54.207.22.56 smtpbgbr2.qq.com 54.207.22.56 smtpbgbr2.qq.com
	<hai.yang@magic-shield.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.55.6
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: =?utf-8?B?bGludXgtYXVkaXQ=?= <linux-audit@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============7522048463664981411=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 30 Jul 2019 12:19:28 +0000 (UTC)

This is a multi-part message in MIME format.

--===============7522048463664981411==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5D4035A1_0A9353C8_62FBE598"
Content-Transfer-Encoding: 8Bit

This is a multi-part message in MIME format.

------=_NextPart_5D4035A1_0A9353C8_62FBE598
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgU3RldmUsDQoNCg0KVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiBvbiByZWFkL3dyaXRl
LiBJIGhhdmUgdHdvIG1vcmUgcXVlc3Rpb25zIHdoaWNoIEkgaGF2ZW4ndCBmaWd1cmVkIG91
dC4NCjEpIERvZXMgYXVkaXRjdGwgcnVsZXMgc3VwcG9ydCByZWd1bGFyIGV4cHJlc3Npb25z
PyBGb3Igc29tZSBwYXJhbXMsIGl0IGlzIG5vdCBlYXN5IHRvIGZpbHRlciBzcGVjaWZpYyBt
ZXNzYWdlcyB1c2luZyDigJw94oCdIG9yICIhPSIuDQoyKSBJbiBtZXNzYWdlIHBheWxvYWQs
IHNvbWUgZmllbGRzIGFyZSBub3Qgd2hhdCB3ZSBjYXJlIGFib3V0LiBBbnkgd2F5IHdlIGNh
biByZWR1Y2UgdGhlIGZpZWxkcy9wYXJhbXMgaW4gYXVkaXQgbG9nPw0KDQoNClJlZ2FyZHMN
CkhhaQ0KIA0KIA0KLS0tLS0tLS0tLS0tLS0tLS0tIE9yaWdpbmFsIC0tLS0tLS0tLS0tLS0t
LS0tLQ0KRnJvbTogICJTdGV2ZSBHcnViYiI8c2dydWJiQHJlZGhhdC5jb20+Ow0KRGF0ZTog
IFRodSwgSnVsIDI1LCAyMDE5IDEwOjUxIFBNDQpUbzogICLmnajmtbciPGhhaS55YW5nQG1h
Z2ljLXNoaWVsZC5jb20+OyANCkNjOiAgImxpbnV4LWF1ZGl0IjxsaW51eC1hdWRpdEByZWRo
YXQuY29tPjsgDQpTdWJqZWN0OiAgUmU6IEhvdyB0byBmaWx0ZXIgUFJPQ1RJVExFIGV2ZW50
cw0KDQogDQoNCk9uIFRodXJzZGF5LCBKdWx5IDI1LCAyMDE5IDE6NDQ6MDcgQU0gRURUIOad
qOa1tyB3cm90ZToNCj4gVGhhbmtzIFN0ZXZlLiBJdCB3b3JrcyA6LSkNCj4gTWVhbndoaWxl
LCBmb3IgcmVhZC93cml0ZSBzeXN0ZW0gY2FsbCwgaWYgdGhleSBiZWxvbmdzIHRvIHNhbWUg
cGlkIGFuZCBzYW1lDQo+IGZkLCB3ZSBhcmUgdHJ5aW5nIHRvIHN1cHByZXNzIHRoZW0gaW50
byBvbmUgbXNnLiBJIGd1ZXNzIGl0IHdvdWxkIG5vdCBiZQ0KPiBhYmxlIHRvIGZpbHRlciB1
c2luZyBhdWRpdGN0bCwgaXMgdGhhdCByaWdodD8NCg0KVGVjaG5pY2FsbHkgeW91IGNvdWxk
IHN1cHByZXNzIHRoZW0uIEluIHByYWN0aWNlLCBpdCdzIG5vdCBmZWFzaWJsZS4gWW91IA0K
d291bGQgbmVlZCB0byBoYXZlIGFwcGxpY2F0aW9uIHNwZWNpZmljIHJ1bGVzIHRvIHN1cHBy
ZXNzLiBUaGUgbW9yZSBydWxlcyB5b3UgDQpoYXZlIHRoZSBtb3JlIHBlcmZvcm1hbmNlIHlv
dSBsb3NlLg0KDQpCdXQgSSB3b3VsZCBzdGFydCBieSBxdWVzdGlvbmluZyB3aGV0aGVyIHlv
dSByZWFsbHkgbmVlZCB0byBtb25pdG9yIHJlYWRzIGFuZCANCndyaXRlcz8gSWYgYSBmaWxl
IGlzIG9wZW5lZCB3aXRoIE9fV1JPTkxZIG9yIE9fUkRXUiwgY2FuIGl0IGp1c3QgYmUgYXNz
dW1lZCANCnRoYXQgdGhlIGZpbGUgd2FzIHdyaXR0ZW4gdG8/DQoNCi1TdGV2ZQ==

------=_NextPart_5D4035A1_0A9353C8_62FBE598
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGRpdj5IaSBTdGV2ZSw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5rcyBmb3IgdGhl
IHN1Z2dlc3Rpb24gb24gcmVhZC93cml0ZS4gSSBoYXZlIHR3byBtb3JlIHF1ZXN0aW9ucyB3
aGljaCBJIGhhdmVuJ3QgZmlndXJlZCBvdXQuPC9kaXY+PGRpdj4xKSBEb2VzIGF1ZGl0Y3Rs
IHJ1bGVzIHN1cHBvcnQgcmVndWxhciBleHByZXNzaW9ucz8gRm9yIHNvbWUgcGFyYW1zLCBp
dCBpcyBub3QgZWFzeSB0byBmaWx0ZXIgc3BlY2lmaWMgbWVzc2FnZXMgdXNpbmcg4oCcPeKA
nSBvciAiIT0iLjwvZGl2PjxkaXY+MikgSW4gbWVzc2FnZSBwYXlsb2FkLCBzb21lIGZpZWxk
cyBhcmUgbm90IHdoYXQgd2UgY2FyZSBhYm91dC4gQW55IHdheSB3ZSBjYW4gcmVkdWNlIHRo
ZSBmaWVsZHMvcGFyYW1zIGluIGF1ZGl0IGxvZz88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PlJlZ2FyZHM8L2Rpdj48ZGl2PkhhaTwvZGl2PjxkaXY+PGluY2x1ZGV0YWlsPjxkaXY+Jm5i
c3A7PC9kaXY+PGRpdj4mbmJzcDs8L2Rpdj48ZGl2IHN0eWxlPSJmb250OlZlcmRhbmEgbm9y
bWFsIDE0cHg7Y29sb3I6IzAwMDsiPjxkaXYgc3R5bGU9IkZPTlQtU0laRTogMTJweDtGT05U
LUZBTUlMWTogQXJpYWwgTmFycm93O3BhZGRpbmc6MnB4IDAgMnB4IDA7Ij4tLS0tLS0tLS0t
LS0tLS0tLS0mbmJzcDtPcmlnaW5hbCZuYnNwOy0tLS0tLS0tLS0tLS0tLS0tLTwvZGl2Pjxk
aXYgc3R5bGU9IkZPTlQtU0laRTogMTJweDtiYWNrZ3JvdW5kOiNlZmVmZWY7cGFkZGluZzo4
cHg7Ij48ZGl2IGlkPSJtZW51X3NlbmRlciI+PGI+RnJvbTogPC9iPiZuYnNwOyJTdGV2ZSBH
cnViYiImbHQ7c2dydWJiQHJlZGhhdC5jb20mZ3Q7OzwvZGl2PjxkaXY+PGI+RGF0ZTogPC9i
PiZuYnNwO1RodSwgSnVsIDI1LCAyMDE5IDEwOjUxIFBNPC9kaXY+PGRpdj48Yj5UbzogPC9i
PiZuYnNwOyLmnajmtbciJmx0O2hhaS55YW5nQG1hZ2ljLXNoaWVsZC5jb20mZ3Q7OyA8d2Jy
PjwvZGl2PjxkaXY+PGI+Q2M6IDwvYj4mbmJzcDsibGludXgtYXVkaXQiJmx0O2xpbnV4LWF1
ZGl0QHJlZGhhdC5jb20mZ3Q7OyA8d2JyPjwvZGl2PjxkaXY+PGI+U3ViamVjdDogPC9iPiZu
YnNwO1JlOiBIb3cgdG8gZmlsdGVyIFBST0NUSVRMRSBldmVudHM8L2Rpdj48L2Rpdj48ZGl2
PiZuYnNwOzwvZGl2PjxkaXYgc3R5bGU9InBvc2l0aW9uOnJlbGF0aXZlOyI+PGRpdiBpZD0i
dG1wY29udGVudF9yZXMiPjwvZGl2Pk9uIFRodXJzZGF5LCBKdWx5IDI1LCAyMDE5IDE6NDQ6
MDcgQU0gRURUIOadqOa1tyB3cm90ZTo8YnI+Jmd0OyBUaGFua3MgU3RldmUuIEl0IHdvcmtz
IDotKTxicj4mZ3Q7IE1lYW53aGlsZSwgZm9yIHJlYWQvd3JpdGUgc3lzdGVtIGNhbGwsIGlm
IHRoZXkgYmVsb25ncyB0byBzYW1lIHBpZCBhbmQgc2FtZTxicj4mZ3Q7IGZkLCB3ZSBhcmUg
dHJ5aW5nIHRvIHN1cHByZXNzIHRoZW0gaW50byBvbmUgbXNnLiBJIGd1ZXNzIGl0IHdvdWxk
IG5vdCBiZTxicj4mZ3Q7IGFibGUgdG8gZmlsdGVyIHVzaW5nIGF1ZGl0Y3RsLCBpcyB0aGF0
IHJpZ2h0Pzxicj48YnI+VGVjaG5pY2FsbHkgeW91IGNvdWxkIHN1cHByZXNzIHRoZW0uIElu
IHByYWN0aWNlLCBpdCdzIG5vdCBmZWFzaWJsZS4gWW91IDxicj53b3VsZCBuZWVkIHRvIGhh
dmUgYXBwbGljYXRpb24gc3BlY2lmaWMgcnVsZXMgdG8gc3VwcHJlc3MuIFRoZSBtb3JlIHJ1
bGVzIHlvdSA8YnI+aGF2ZSB0aGUgbW9yZSBwZXJmb3JtYW5jZSB5b3UgbG9zZS48YnI+PGJy
PkJ1dCBJIHdvdWxkIHN0YXJ0IGJ5IHF1ZXN0aW9uaW5nIHdoZXRoZXIgeW91IHJlYWxseSBu
ZWVkIHRvIG1vbml0b3IgcmVhZHMgYW5kIDxicj53cml0ZXM/IElmIGEgZmlsZSBpcyBvcGVu
ZWQgd2l0aCBPX1dST05MWSBvciBPX1JEV1IsIGNhbiBpdCBqdXN0IGJlIGFzc3VtZWQgPGJy
PnRoYXQgdGhlIGZpbGUgd2FzIHdyaXR0ZW4gdG8/PGJyPjxicj4tU3RldmU8YnI+PGJyPjwv
ZGl2PjwvZGl2PjwhLS08IVtlbmRpZl0tLT48L2luY2x1ZGV0YWlsPjwvZGl2Pg==

------=_NextPart_5D4035A1_0A9353C8_62FBE598--




--===============7522048463664981411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============7522048463664981411==--




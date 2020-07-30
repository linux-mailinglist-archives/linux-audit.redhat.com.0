Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C5844233819
	for <lists+linux-audit@lfdr.de>; Thu, 30 Jul 2020 20:03:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-_2C_7UpCPbWO6nTnDxAtJA-1; Thu, 30 Jul 2020 14:03:34 -0400
X-MC-Unique: _2C_7UpCPbWO6nTnDxAtJA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8811E79EC2;
	Thu, 30 Jul 2020 18:03:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 812CE88F05;
	Thu, 30 Jul 2020 18:03:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 822059A0E1;
	Thu, 30 Jul 2020 18:03:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UI1Jlq018482 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 14:01:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CC06110CD619; Thu, 30 Jul 2020 18:01:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7C4510CD618
	for <linux-audit@redhat.com>; Thu, 30 Jul 2020 18:01:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5889185A78B
	for <linux-audit@redhat.com>; Thu, 30 Jul 2020 18:01:17 +0000 (UTC)
Received: from mr85p00im-ztdg06011201.me.com (mr85p00im-ztdg06011201.me.com
	[17.58.23.181]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-241-yNj2nllVP9aVnmm16O-4Cg-1; Thu, 30 Jul 2020 14:01:15 -0400
X-MC-Unique: yNj2nllVP9aVnmm16O-4Cg-1
Received: from [192.168.7.96] (162-196-90-251.lightspeed.frokca.sbcglobal.net
	[162.196.90.251])
	by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id 87900400AC6
	for <linux-audit@redhat.com>; Thu, 30 Jul 2020 17:54:09 +0000 (UTC)
From: Todd Heberlein <todd_heberlein@mac.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: httpd auid = -1
Message-Id: <68DC7FD9-D7FA-4D7D-BE40-0636059BD9D2@mac.com>
Date: Thu, 30 Jul 2020 10:54:09 -0700
To: Linux-audit@redhat.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-07-30_13:2020-07-30,
	2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
	mlxlogscore=515 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-2004280000 definitions=main-2007300127
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06UI1Jlq018482
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SeKAmXZlIG5vdGljZWQgdGhhdCB0aGUgaHR0cGQgcHJvY2VzcyBvbiBhIENlbnRPUyA3Ljcgc3lz
dGVtIEkgYW0gd29ya2luZyB3aXRoIGlzIHJ1bm5pbmcgd2l0aCBhbiBBdWRpdCBJRCBvZiAtMS4g
RXhhbXBsZSBJRCB2YWx1ZXMgYXJlOgoKCWF1aWQ9NDI5NDk2NzI5NQoJdWlkPTQ4CglnaWQ9NDgK
CS4uLgoKU28gaWYgdXNlIHRoZSBzdGFuZGFyZCBmaWx0ZXIgIi1GIGF1aWQhPS0x4oCdIGluIHRo
ZSBhdWRpdCBydWxlcyBJIGRvIG5vdCBzZWUgaHR0cGQgYWN0aXZpdHkuCgpJcyB0aGlzIGNvbW1v
bj8KCkhvdyBkbyBJIGNoYW5nZSB0aGUgYXVpZCB0byBzb21ldGhpbmcgZWxzZSwgc28gSSBjYW4g
Y2FwdHVyZSB0aGUgaHR0cGQgYWN0aXZpdHkgaW4gdGhlIGF1ZGl0IGxvZz8KCgpFeGFtcGxlIGF1
ZGl0IGxpbmU6Cgp0eXBlPVNZU0NBTEwgbXNnPWF1ZGl0KDE1OTYwNjU1NjYuNzIxOjMxMzU3KTog
YXJjaD1jMDAwMDAzZSBzeXNjYWxsPTIgc3VjY2Vzcz15ZXMgZXhpdD0xNSBhMD01NWEwYTJkOWIz
YzAgYTE9ODAwMDAgYTI9MCBhMz03ZmZlNWQ0ZDY3MjAgaXRlbXM9MSBwcGlkPTExMzAgcGlkPTEy
NTMgYXVpZD00Mjk0OTY3Mjk1IHVpZD00OCBnaWQ9NDggZXVpZD00OCBzdWlkPTQ4IGZzdWlkPTQ4
IGVnaWQ9NDggc2dpZD00OCBmc2dpZD00OCB0dHk9KG5vbmUpIHNlcz00Mjk0OTY3Mjk1IGNvbW09
Imh0dHBkIiBleGU9Ii91c3Ivc2Jpbi9odHRwZCIga2V5PShudWxsKQoKClRoYW5rcywKClRvZGQK
CgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRw
czovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=


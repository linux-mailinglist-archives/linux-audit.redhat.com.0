Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 29757E7EDD
	for <lists+linux-audit@lfdr.de>; Tue, 29 Oct 2019 04:28:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572319711;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=IL7mhs9o1T5d1ElOoanpvegh3wAQqAGgNWU1RX+YNKQ=;
	b=YOK35tEu3yBiLJsC+pXHE0/QJNZNDNLfWi7CvXF6oaSsjlknH3FPcLzDCMPo6aG0eP8gaK
	YAH5vd1cqZeL966LImcfDoL8l7oyg0N9KbLTpznWgyI16pHPVX1zMIYBpPc+xKqUDZF9/F
	Q2h22eLNjUVDwxErG+GifDK1MdHbeuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-5oCcl2jHPhmbi-6aUhzB2Q-1; Mon, 28 Oct 2019 23:28:28 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75DA41005509;
	Tue, 29 Oct 2019 03:28:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D8E2600C1;
	Tue, 29 Oct 2019 03:28:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 356694E589;
	Tue, 29 Oct 2019 03:28:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9T3S4no007189 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 28 Oct 2019 23:28:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B7420600F0; Tue, 29 Oct 2019 03:28:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0C48600C1
	for <linux-audit@redhat.com>; Tue, 29 Oct 2019 03:28:02 +0000 (UTC)
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4ADA6307D88C
	for <linux-audit@redhat.com>; Tue, 29 Oct 2019 03:27:51 +0000 (UTC)
X-QQ-GoodBg: 0
X-QQ-SSF: 00100000000000F0
X-QQ-FEAT: DARUWoCBwmNCdKt51+NYjC8n+9nCY43a5PoyRHj5hnGw7Xh0QPNwRpwJrvAxw
	61gEMxGA1q+UMnLeEwE/SD0v8jhtcw7WbKUJfo6orA+UU5rjXA5l/sLbdGZWiZWBs0752JG
	tgUZOkOLHwUmhtAfOCCvU/88mpfnSo1p68g8FlFN5+Sk+bPnBKAr3hjpvUDtx1O5qyPSfdt
	59kBk5VS2C5/vvSOPEPNHxRPIlhRK0K5/2C7vMjwjrIckup/NZgXNS2d8vGJZ9dnQN98ub0
	257pjNEYg7TB79ifPultWBN3Aw33dI9trq6w==
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 125.119.70.180
X-QQ-STYLE: 
X-QQ-mid: bizmailfree10t1572319664t5651
From: "=?utf-8?B?5p2o5rW3?=" <hai.yang@magic-shield.com>
To: "=?utf-8?B?bGludXgtYXVkaXQ=?=" <linux-audit@redhat.com>
Subject: "echo" not logged in auditd
Mime-Version: 1.0
Date: Tue, 29 Oct 2019 11:27:44 +0800
X-Priority: 3
Message-ID: <tencent_0693B7A4459F8B8652881558@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
	id ; Tue, 29 Oct 2019 11:27:45 +0800 (CST)
Feedback-ID: bizmailfree:magic-shield.com:qybgforeign:qybgforeign4
X-QQ-Bgrelay: 1
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Tue, 29 Oct 2019 03:27:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Tue, 29 Oct 2019 03:27:53 +0000 (UTC) for IP:'203.205.195.102'
	DOMAIN:'smtpbg702.qq.com' HELO:'smtpproxy21.qq.com'
	FROM:'hai.yang@magic-shield.com' RCPT:''
X-RedHat-Spam-Score: 0  (HTML_MESSAGE, MSGID_FROM_MTA_HEADER, SPF_HELO_PASS,
	SPF_PASS) 203.205.195.102 smtpbg702.qq.com
	203.205.195.102 smtpbg702.qq.com <hai.yang@magic-shield.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 5oCcl2jHPhmbi-6aUhzB2Q-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/mixed; boundary="===============7847148700036168942=="

This is a multi-part message in MIME format.
--===============7847148700036168942==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5DB7B1B0_0D2AF2D0_6B1EC0F0"
Content-Transfer-Encoding: 7bit

This is a multi-part message in MIME format.
------=_NextPart_5DB7B1B0_0D2AF2D0_6B1EC0F0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGkgDQoNCg0KV2UgYXJlIGV4cGVyaWVuY2luZyB0aGUgc2FtZSBpc3N1ZSBiZWxvdywgdGhhdCAi
ZWNobyIgY2Fubm90IGJlIGxvZ2dlZCBpbiBhdWRpdGQuIFdvdWxkIGxpa2UgdG8ga25vdyBzb21l
IGRldGFpbGVkIGV4cGxhbmF0aW9uIGhlcmUsIGFuZCB1bmRlcnN0YW5kIGluIGdlbmVyYWwgd2hh
dCB3b3VsZCBOT1QgYmUgaW4gdGhlIHNjb3BlIG9mIGF1ZGl0ZCBsb2cuDQoNCg0KaHR0cHM6Ly9z
ZXJ2ZXJmYXVsdC5jb20vcXVlc3Rpb25zLzg3MTM0My93aHktZG9lcy1hdWRpdGQtb25seS1sb2ct
ZWNoby13aGVuLWktdXNlLXRoZS1hYnNvbHV0ZS1wYXRoDQoNCg0KUmVnYXJkcw0KSGFp
------=_NextPart_5DB7B1B0_0D2AF2D0_6B1EC0F0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSZuYnNwOzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+V2UgYXJlIGV4cGVyaWVuY2lu
ZyB0aGUgc2FtZSBpc3N1ZSBiZWxvdywgdGhhdCAiZWNobyIgY2Fubm90IGJlIGxvZ2dlZCBpbiBh
dWRpdGQuIFdvdWxkIGxpa2UgdG8ga25vdyBzb21lIGRldGFpbGVkIGV4cGxhbmF0aW9uIGhlcmUs
IGFuZCB1bmRlcnN0YW5kIGluIGdlbmVyYWwgd2hhdCB3b3VsZCBOT1QgYmUgaW4gdGhlIHNjb3Bl
IG9mIGF1ZGl0ZCBsb2cuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5odHRwczovL3NlcnZlcmZh
dWx0LmNvbS9xdWVzdGlvbnMvODcxMzQzL3doeS1kb2VzLWF1ZGl0ZC1vbmx5LWxvZy1lY2hvLXdo
ZW4taS11c2UtdGhlLWFic29sdXRlLXBhdGg8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlJlZ2Fy
ZHM8L2Rpdj48ZGl2PkhhaTwvZGl2Pg==
------=_NextPart_5DB7B1B0_0D2AF2D0_6B1EC0F0--

--===============7847148700036168942==
Content-Type: text/plain; charset=WINDOWS-1252
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============7847148700036168942==--




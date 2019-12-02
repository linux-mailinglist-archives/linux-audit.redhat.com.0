Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A2C6610F276
	for <lists+linux-audit@lfdr.de>; Mon,  2 Dec 2019 22:57:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575323862;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=MVKwEzxsT77QKa3/HV3/+j+dWGKcp/gnnNjgx8wea8c=;
	b=HRmNp4L6yit0QqXZOGQgNQZljVNM7ywFZF1t4VL2XF7uj9buxr/FJUbUWYxx2qXcWUMd3D
	EuoRtpki/Wan04aO/BrOYUT/h+8DswckK6lHOUo//Gv7XhX2Ss0HQCHd/aJe+yIIepKsim
	Kmn4EhG4fdmFQCBHEIsHTAs92e1DW+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-dovFpQ0iPTmvAcuTghdGVw-1; Mon, 02 Dec 2019 16:57:38 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 831FF107ACC7;
	Mon,  2 Dec 2019 21:57:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 331875DA32;
	Mon,  2 Dec 2019 21:57:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 739EC18089CD;
	Mon,  2 Dec 2019 21:57:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB2B5lV3018258 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Dec 2019 06:05:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CBE4F2022ACC; Mon,  2 Dec 2019 11:05:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7B312022ACA
	for <linux-audit@redhat.com>; Mon,  2 Dec 2019 11:05:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9943F185AB8B
	for <linux-audit@redhat.com>; Mon,  2 Dec 2019 11:05:45 +0000 (UTC)
Received: from mr85p00im-ztdg06021101.me.com (mr85p00im-ztdg06021101.me.com
	[17.58.23.180]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-243-Bqpr-v9NPjqrm5gHn6XTVg-1; Mon, 02 Dec 2019 06:05:43 -0500
Received: from [192.168.1.203] (athedsl-4366642.home.otenet.gr [79.130.17.34])
	by mr85p00im-ztdg06021101.me.com (Postfix) with ESMTPSA id
	7AFBB340CBC
	for <linux-audit@redhat.com>; Mon,  2 Dec 2019 10:58:00 +0000 (UTC)
From: Harold-Owen Wilke <harywilke@me.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Typo in /audit-userspace/src/ausearch-options.c on line 228. 
	'starting data' instead of 'starting date'
Message-Id: <69A96564-7961-4A2E-AABD-F1C254A0BEB1@me.com>
Date: Mon, 2 Dec 2019 12:57:55 +0200
To: linux-audit@redhat.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-12-02_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
	mlxlogscore=744 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1908290000 definitions=main-1912020100
X-MC-Unique: Bqpr-v9NPjqrm5gHn6XTVg-1
X-MC-Unique: dovFpQ0iPTmvAcuTghdGVw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 02 Dec 2019 16:57:16 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: multipart/mixed; boundary="===============0202197795123127116=="

--===============0202197795123127116==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_D428E9E6-E067-4DD4-9F6E-DD3FDCA699C9"

--Apple-Mail=_D428E9E6-E067-4DD4-9F6E-DD3FDCA699C9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

As the subject says.
Apologies for the incorrect way of reporting this bug, the GitHub page said=
 it=E2=80=99s not really monitored, I got frustrated with the bugzilla port=
al, didn=E2=80=99t want to misfile it and it=E2=80=99s really minor.

https://github.com/linux-audit/audit-userspace/blob/master/src/ausearch-opt=
ions.c <https://github.com/linux-audit/audit-userspace/blob/master/src/ause=
arch-options.c>


-hary
--Apple-Mail=_D428E9E6-E067-4DD4-9F6E-DD3FDCA699C9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; -webk=
it-line-break: after-white-space;" class=3D"">As the subject says.<br class=
=3D""><div class=3D"">Apologies for the incorrect way of reporting this bug=
,&nbsp;the GitHub page said it=E2=80=99s not really monitored, I got frustr=
ated with the bugzilla portal, didn=E2=80=99t want to misfile it and it=E2=
=80=99s really minor.</div><div class=3D""><br class=3D""></div><div class=
=3D""><a href=3D"https://github.com/linux-audit/audit-userspace/blob/master=
/src/ausearch-options.c" class=3D"">https://github.com/linux-audit/audit-us=
erspace/blob/master/src/ausearch-options.c</a></div><div class=3D""><br cla=
ss=3D""></div><div class=3D""><br class=3D""></div><div class=3D"">-hary</d=
iv></body></html>
--Apple-Mail=_D428E9E6-E067-4DD4-9F6E-DD3FDCA699C9--

--===============0202197795123127116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============0202197795123127116==--


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 49D291A61A0
	for <lists+linux-audit@lfdr.de>; Mon, 13 Apr 2020 04:51:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586746295;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=VcBJemmyfQRJmfmwgsAFfzfHx4aP6CyKeZfG/yC08hk=;
	b=AjlfKYWWvxT5gKHpeL3/PNUVw7yMRXlrDT1q87iiPsI0A+2yomnK6oc9yoqGFWA9HGtDqR
	EtRKW2U2OeAm8GB7uNi2WFEbW132U7z2qA5/+2147AwjpJ37Jns+a/ad5/txuoP0WaiQ8w
	1mmob6JkFQRrR5rjD800F1TZIm6Faas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-8wnEJEr_PGKC1NRts41IOw-1; Sun, 12 Apr 2020 22:51:30 -0400
X-MC-Unique: 8wnEJEr_PGKC1NRts41IOw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5684B107ACC9;
	Mon, 13 Apr 2020 02:51:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 224BE6EF84;
	Mon, 13 Apr 2020 02:51:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 912E093097;
	Mon, 13 Apr 2020 02:51:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03AKdsc4018372 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 10 Apr 2020 16:39:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA014103D201; Fri, 10 Apr 2020 20:39:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D60D9103D203
	for <linux-audit@redhat.com>; Fri, 10 Apr 2020 20:39:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B0EE802D30
	for <linux-audit@redhat.com>; Fri, 10 Apr 2020 20:39:52 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-284-3dC6z5Q6O5uKi3lMjFP2wQ-1; Fri, 10 Apr 2020 16:39:49 -0400
X-MC-Unique: 3dC6z5Q6O5uKi3lMjFP2wQ-1
Received: by mail-wr1-f71.google.com with SMTP id d17so1051485wrr.17
	for <linux-audit@redhat.com>; Fri, 10 Apr 2020 13:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=jUNzfQhNMtSc1wVrD/VFIYBvxplp4rXJvBmOlkxSMDw=;
	b=IEu/E4eXxCUlTLkbevbtj++r+nUjsQcV5Yyc0ME6vBI/r6mgV7Nb/IfBKDPQlyDYeX
	rh3WbHiUPSLwtkONBnMfT8LWanDcjjsDFvqFLTF4If6Ju9qQFuT7j4NiETNCJGmvY/U2
	aEG/wvd4rKuhzM9ygsJflsHyrhxof024RTboRMqVW3iGvVPdomGjH4cxJaBCW8w5+jSo
	idd7VOFEoBl1o240YPyIb9EIP9b99+nY05j7nhjFj8g9qgLQWP7UaJD32AWYKDM5zcgX
	Qey0Dcs51COuw2mmpjpp969JEs6A9p2FXoLLns3L7HdS4AnOyXORLGVgSjTc/HrFoKRc
	D8ng==
X-Gm-Message-State: AGi0PuaJJ0IsADVqeptfaxoekKOx5mfkFIC9X/ZQPF3hLkjJtmb/KmVX
	7PQRiHVmlFM0nNRy+iMsrPh/2cbGTsZUinOqG2JUyxaYtfQI0ffOaNAaAS/JA2CwshPFiuZicZd
	9vv7ef4uP8rCL2BGh+g/e6QfPUz5pdVcKf6k=
X-Received: by 2002:adf:9564:: with SMTP id 91mr6485289wrs.246.1586551188201; 
	Fri, 10 Apr 2020 13:39:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypI8KDRvZ+PN0fCPLVsZBmwyP0vrJOltuxwlMHSOumCLPXoRELdbzlyUHWPkePoFZa3LdbQU7sV0w2TMCxN7ch0=
X-Received: by 2002:adf:9564:: with SMTP id 91mr6485272wrs.246.1586551187957; 
	Fri, 10 Apr 2020 13:39:47 -0700 (PDT)
MIME-Version: 1.0
From: Gabriel Alford <ralford@redhat.com>
Date: Fri, 10 Apr 2020 14:39:37 -0600
Message-ID: <CAOxyEpno-VdVb3sqX8q7hGX7L3fgEOLpf9j25u_o+mcezZ+EBg@mail.gmail.com>
Subject: auditing audispd vs kubernetes daemonsets
To: linux-audit@redhat.com, Juan Osorio Robles <josorior@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sun, 12 Apr 2020 22:49:46 -0400
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
Content-Type: multipart/mixed; boundary="===============4631681719287105106=="

--===============4631681719287105106==
Content-Type: multipart/alternative; boundary="000000000000fa034405a2f5bb2a"

--000000000000fa034405a2f5bb2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

In the midst of discussing sending audit logs from a Red Hat CoreOS node to
some central audit collection and evaluation tool, the question came up
about using audispd instead of Daemonsets. Daemonsets are what is planned
for OpenShift. As I understand it, the general principle is to allow
auditing to flow through the subsystem, but does it need to flow through
the entire auditing workflow? Can a Daemonset be used instead of audispd,
or are there reasons audispd should be used over a Daemonset that some of
us just aren't aware of?

Thanks,

Gabriel Alford

Member of the technical staff

office of the chief technologist

red hat Public Sector

Red Hat

<https://www.redhat.com>

ralford@redhat.com    T: 972-707-6483 <650-254-4391>    M: 303-550-7234
<https://red.ht/sig> <https://red.ht/sig>

--000000000000fa034405a2f5bb2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>In the midst of discussing sendi=
ng audit logs from a Red Hat CoreOS node to some central audit collection a=
nd evaluation tool, the question came up about using audispd instead of Dae=
monsets. Daemonsets are what is planned for OpenShift. As I understand it, =
the general principle is to allow auditing to flow through the subsystem, b=
ut does it need to flow through the entire auditing workflow? Can a Daemons=
et be used instead=C2=A0of audispd, or are there reasons audispd should be =
used over a Daemonset that some of us just aren&#39;t aware of?</div><div><=
br></div><div>Thanks,</div><div><br><div><div><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div d=
ir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr=
"><div><div dir=3D"ltr"><div><div><span>Gabriel Alford</span><span></span>
<p style=3D"font-weight:normal;font-size:10px;margin:0px 0px 4px;text-trans=
form:uppercase"><span>Member of the technical staff</span></p><p style=3D"f=
ont-weight:normal;font-size:10px;margin:0px 0px 4px;text-transform:uppercas=
e"><span>office of the chief technologist</span></p><p style=3D"font-weight=
:normal;font-size:10px;margin:0px 0px 4px;text-transform:uppercase"><span>r=
ed hat Public Sector<br></span></p></div><p style=3D"font-weight:normal;mar=
gin:0px;font-size:10px;color:rgb(153,153,153)"><a style=3D"color:rgb(0,136,=
206);font-size:10px;margin:0px;text-decoration:none;font-family:&quot;overp=
ass&quot;,sans-serif" href=3D"https://www.redhat.com" target=3D"_blank">Red=
 Hat <span><br><br></span></a></p>


<p style=3D"font-weight:normal;margin:0px 0px 6px;font-size:10px;color:rgb(=
153,153,153)"><span style=3D"margin:0px;padding:0px">
<a style=3D"color:rgb(0,136,206);font-size:10px;margin:0px;text-decoration:=
none;font-family:&quot;overpass&quot;,sans-serif" href=3D"mailto:ralford@re=
dhat.com" target=3D"_blank">ralford@redhat.com</a>=C2=A0 =C2=A0</span>
<span>T: <a href=3D"tel:650-254-4391" style=3D"color:rgb(0,136,206);font-si=
ze:10px;margin:0px;text-decoration:none;font-family:&quot;overpass&quot;,sa=
ns-serif" target=3D"_blank">972-707-6483</a>  =C2=A0 =C2=A0</span><span>M: =
<a href=3D"tel:303-550-7234" style=3D"color:rgb(0,136,206);font-size:11px;m=
argin:0px;text-decoration:none;font-family:&quot;overpass&quot;,sans-serif"=
 target=3D"_blank">303-550-7234</a>  =C2=A0 =C2=A0</span>
</p>
<a href=3D"https://red.ht/sig" target=3D"_blank"> </a><a href=3D"https://re=
d.ht/sig" target=3D"_blank"><img src=3D"https://static.redhat.com/libs/redh=
at/brand-assets/latest/corp/logo.png" width=3D"90" height=3D"auto"></a></di=
v></div></div></div></div></div></div></div></div></div></div></div></div><=
/div></div></div></div></div></div></div></div></div></div></div>

--000000000000fa034405a2f5bb2a--

--===============4631681719287105106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============4631681719287105106==--


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A54B014F440
	for <lists+linux-audit@lfdr.de>; Fri, 31 Jan 2020 23:04:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580508285;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=MzZMeWqXOZNEGiU6Oqi94hey+bvVAvkOS9SdNqSlVxg=;
	b=AC6rHY7NVRV8gWldFmbPfteoOqwuKONKBMwvX4XIH2lyhp+xgnoaiMlDQ6pwgi/6KH7IbN
	0yLF0C7Tm2Vsu9eH4kfE8gi7ZXPYYnuIcwvHUF1vcLYoxHCMHPxdMm2aRtkYL328ER/7Mz
	LwyENXssauTgQhPrNOp/X+UWBxIv+Sw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-7y4RwifIP_aZDp5vyHVmpg-1; Fri, 31 Jan 2020 17:04:41 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA1E28010D9;
	Fri, 31 Jan 2020 22:04:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB44684D9A;
	Fri, 31 Jan 2020 22:04:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2A3918089C8;
	Fri, 31 Jan 2020 22:04:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VM1hal000807 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 17:01:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6CB782166B27; Fri, 31 Jan 2020 22:01:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67A312166B28
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 22:01:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBFAB900820
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 22:01:40 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CNCACAojRe/9vbLXlbCh4BCxyFEHU?=
	=?us-ascii?q?SKoQUiQOGBwGDEZhcgVsJAQEBAQEBAQEBGxIHAQIBAYQ6BIJZOBMCEAEBAQQ?=
	=?us-ascii?q?BAQEBAQUDAW2Ea0wMhhAzRiwOAl+DOoJKAQEuEJ51hzeHT4EyhToRgisGgQy?=
	=?us-ascii?q?BOAaBOIwvgUw/gRE2giiDPhkCgTiDO4JeBJBShgRhiHOPNgeCPngEhUeBAo5?=
	=?us-ascii?q?6G5sFhk2Pb4ELlEIigVgzGh+CFhiBElAYDY4oAReDUIpnMDCBBgEBjUEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2CNCACAojRe/9vbLXlbCh4BCxyFEHUSKoQUiQOGBwGDE?=
	=?us-ascii?q?ZhcgVsJAQEBAQEBAQEBGxIHAQIBAYQ6BIJZOBMCEAEBAQQBAQEBAQUDAW2Ea?=
	=?us-ascii?q?0wMhhAzRiwOAl+DOoJKAQEuEJ51hzeHT4EyhToRgisGgQyBOAaBOIwvgUw/g?=
	=?us-ascii?q?RE2giiDPhkCgTiDO4JeBJBShgRhiHOPNgeCPngEhUeBAo56G5sFhk2Pb4ELl?=
	=?us-ascii?q?EIigVgzGh+CFhiBElAYDY4oAReDUIpnMDCBBgEBjUEBAQ?=
X-IronPort-AV: E=Sophos;i="5.70,387,1574092800"; 
	d="scan'208,217";a="273209021"
Received: from icp-osb-irony-out1.external.iinet.net.au
	(icp-osb-irony-out1.external.iinet.net.au [203.59.1.210]) by
	relay.mimecast.com with ESMTP id us-mta-13-Df_oOZaHNgeC5Ee4wUcE_Q-1;
	Fri, 31 Jan 2020 17:01:35 -0500
Received: from ppp121-45-219-219.bras1.cbr2.internode.on.net (HELO
	swtf.swtf.dyndns.org) ([121.45.219.219])
	by icp-osb-irony-out1.iinet.net.au with ESMTP;
	01 Feb 2020 05:58:20 +0800
Message-ID: <60ca6b1cdb64b8c27f328f93ec01fa6596dfce46.camel@iinet.net.au>
Subject: USBguard bug
From: Burn Alting <burn.alting@iinet.net.au>
To: Linux Audit <linux-audit@redhat.com>
Date: Sat, 01 Feb 2020 08:58:18 +1100
Mime-Version: 1.0
X-MC-Unique: Df_oOZaHNgeC5Ee4wUcE_Q-1
X-MC-Unique: 7y4RwifIP_aZDp5vyHVmpg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: burn@swtf.dyndns.org
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============7102869487060044956=="

--===============7102869487060044956==
Content-Type: multipart/alternative; boundary="=-6P945k8CNSKmQjWcnQj7"

--=-6P945k8CNSKmQjWcnQj7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

All,

I need some advice.

Currently when the USB management framework, usbguard (
https://github.com/USBGuard/usbguard),  is building it's key-value pairs pr=
ior to
calling audit_log_user_message() with a AUDIT_USER_DEVICE type, it looks at=
 each
value  and decides to hex encode the value if any character  in the value m=
atches
the expression (str[i] =3D=3D '"' || str[i] < 0x21 || str[i] =3D=3D 0x7F). =
This can be found
in https://github.com/USBGuard/usbguard/blob/master/src/Daemon/LinuxAuditBa=
ckend.cpp
 where it makes the call

=09audit_log_user_message(_audit_fd, AUDIT_USER_DEVICE, message.c_str(),
      /*hostname=3D*/nullptr, /*addr=3D*/nullptr, /*tty=3D*/nullptr, result=
);

As a result, one sees audit events such as

type=3DUSER_DEVICE msg=3Daudit(1580255002.606:352190): pid=3D3115 uid=3D0 a=
uid=3D4294967295
ses=3D4294967295 subj=3Dsystem_u:system_r:unconfined_service_t:s0 msg=3D'op=
=3D"changed-
authorization-state-for" device=3D"/devices/pci0000:00/0000:00:1a.0/usb1/1-=
1/1-1.3"
target=3D"allow"
device_rule=3D626C6F636B20696420303738313A353539312073657269616C20223443353=
33030303132
323034313231303533313322206E616D652022556C7472612055534220332E3022206861736=
820227953
6D433045594970734A575666474436414854774577712F624974344631466A78785856306C3=
552356B3D
2220706172656E742D6861736820226B763376322B726E713951765949332F48624A3145563=
97664756A
5A30615643512F43474259496B4542303D22207669612D706F72742022312D312E332220776=
974682D69
6E746572666163652030383A30363A3530 exe=3D"/usr/sbin/usbguard-daemon" hostna=
me=3D? addr=3D?
terminal=3D? res=3Dsuccess'=1DUID=3D"root" AUID=3D"unset"
where device_rule started as
=09block id 0781:5591 serial "4C530001220412105313" name "Ultra USB 3.0" ha=
sh
"ySmC0EYIpsJWVfGD6AHTwEwq/bIt4F1FjxxXV0l5R5k=3D" parent-hash
"kv3v2+rnq9QvYI3/HbJ1EV9vdujZ0aVCQ/CGBYIkEB0=3D" via-port "1-1.3" with-inte=
rface
08:06:50
or

type=3DUSER_DEVICE msg=3Daudit(1580255002.605:352187): pid=3D3115 uid=3D0 a=
uid=3D4294967295
ses=3D4294967295 subj=3Dsystem_u:system_r:unconfined_service_t:s0 msg=3D'op=
=3D"discovered-
device" device=3D"/devices/pci0000:00/0000:00:1d.0/usb2/2-1"
device_rule=3D616C6C6F7720696420383038373A303032342073657269616C202222206E6=
16D65202222
206861736820225A78377630464D51456A53634B534146454E41696F624573314F475050423=
05957522B
79584443564530343D2220706172656E742D68617368202257484254784E61456F4D474E534=
E6333314B
70464E53416546463448624C4D51675342714F526C433653383D22207669612D706F7274202=
2322D3122
20776974682D696E746572666163652030393A30303A3030 exe=3D"/usr/sbin/usbguard-=
daemon"
hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'=1DUID=3D"root" AUID=3D"un=
set"
where device_rule started as
=09allow id 8087:0024 serial "" name "" hash
"Zx7v0FMQEjScKSAFENAiobEs1OGPPB0YWR+yXDCVE04=3D" parent-hash
"WHBTxNaEoMGNSNc31KpFNSAeFF4HbLMQgSBqORlC6S8=3D" via-port "2-1" with-interf=
ace
09:00:00

I have a number of questions
- What is the best recommendation I can make in a bug report I'd like to ra=
ise so
that the auparse library can reliably interpret all their key's values?
- Should I also request they actually provide hostname and addr values to
audit_log_user_message()?
- If one want them to identify the user who participates in the activity wh=
at is the
best recommendation to make in terms of keys in the message?

Thanks in advance



--=-6P945k8CNSKmQjWcnQj7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>All,</div><div><br></div><div>I need some advice.</div><div><br></=
div><div>Currently when the USB management framework, usbguard (<a href=3D"=
https://github.com/USBGuard/usbguard">https://github.com/USBGuard/usbguard<=
/a>),  is building it's key-value pairs prior to calling audit_log_user_mes=
sage() with a AUDIT_USER_DEVICE type, it looks at each value  and decides t=
o hex encode the value if any character  in the value matches the expressio=
n (str[i] =3D=3D '"' || str[i] &lt; 0x21 || str[i] =3D=3D 0x7F). This can b=
e found in <a href=3D"https://github.com/USBGuard/usbguard/blob/master/src/=
Daemon/LinuxAuditBackend.cpp">https://github.com/USBGuard/usbguard/blob/mas=
ter/src/Daemon/LinuxAuditBackend.cpp</a> where it makes the call</div><div>=
<br></div><div>=09audit_log_user_message(_audit_fd, AUDIT_USER_DEVICE, mess=
age.c_str(),</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*hostname=3D*/n=
ullptr, /*addr=3D*/nullptr, /*tty=3D*/nullptr, result);</div><div><br></div=
><div>As a result, one sees audit events such as</div><div><br></div><div s=
tyle=3D"margin-left: 3ch;"><div>type=3DUSER_DEVICE msg=3Daudit(1580255002.6=
06:352190): pid=3D3115 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsy=
stem_u:system_r:unconfined_service_t:s0 msg=3D'op=3D"changed-authorization-=
state-for" device=3D"/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.3" targe=
t=3D"allow" device_rule=3D626C6F636B20696420303738313A353539312073657269616=
C2022344335333030303132323034313231303533313322206E616D652022556C7472612055=
534220332E30222068617368202279536D433045594970734A5756664744364148547745777=
12F624974344631466A78785856306C3552356B3D2220706172656E742D6861736820226B76=
3376322B726E713951765949332F48624A314556397664756A5A30615643512F43474259496=
B4542303D22207669612D706F72742022312D312E332220776974682D696E74657266616365=
2030383A30363A3530 exe=3D"/usr/sbin/usbguard-daemon" hostname=3D? addr=3D? =
terminal=3D? res=3Dsuccess'=1DUID=3D"root" AUID=3D"unset"</div></div><div>w=
here device_rule started as</div><div>=09block id 0781:5591 serial "4C53000=
1220412105313" name "Ultra USB 3.0" hash "ySmC0EYIpsJWVfGD6AHTwEwq/bIt4F1Fj=
xxXV0l5R5k=3D" parent-hash "kv3v2+rnq9QvYI3/HbJ1EV9vdujZ0aVCQ/CGBYIkEB0=3D"=
 via-port "1-1.3" with-interface 08:06:50</div><div>or</div><div><br></div>=
<div style=3D"margin-left: 3ch;"><div>type=3DUSER_DEVICE msg=3Daudit(158025=
5002.605:352187): pid=3D3115 uid=3D0 auid=3D4294967295 ses=3D4294967295 sub=
j=3Dsystem_u:system_r:unconfined_service_t:s0 msg=3D'op=3D"discovered-devic=
e" device=3D"/devices/pci0000:00/0000:00:1d.0/usb2/2-1" device_rule=3D616C6=
C6F7720696420383038373A303032342073657269616C202222206E616D6520222220686173=
6820225A78377630464D51456A53634B534146454E41696F624573314F47505042305957522=
B79584443564530343D2220706172656E742D68617368202257484254784E61456F4D474E53=
4E6333314B70464E53416546463448624C4D51675342714F526C433653383D22207669612D7=
06F72742022322D312220776974682D696E746572666163652030393A30303A3030 exe=3D"=
/usr/sbin/usbguard-daemon" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess=
'=1DUID=3D"root" AUID=3D"unset"</div></div><div>where device_rule started a=
s</div><div>=09allow id 8087:0024 serial "" name "" hash "Zx7v0FMQEjScKSAFE=
NAiobEs1OGPPB0YWR+yXDCVE04=3D" parent-hash "WHBTxNaEoMGNSNc31KpFNSAeFF4HbLM=
QgSBqORlC6S8=3D" via-port "2-1" with-interface 09:00:00</div><div><br></div=
><div>I have a number of questions</div><div>- What is the best recommendat=
ion I can make in a bug report I'd like to raise so that the auparse librar=
y can reliably interpret all their key's values?</div><div>- Should I also =
request they actually provide hostname and addr values to audit_log_user_me=
ssage()?</div><div>- If one want them to identify the user who participates=
 in the activity what is the best recommendation to make in terms of keys i=
n the message?</div><div><br></div><div>Thanks in advance</div><div><br></d=
iv></body></html>

--=-6P945k8CNSKmQjWcnQj7--

--===============7102869487060044956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============7102869487060044956==--


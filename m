Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7903E166B03
	for <lists+linux-audit@lfdr.de>; Fri, 21 Feb 2020 00:37:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582241854;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=O/7V6gmDrSi1U/kC1E1J1GNqfQ18IXGH928JPQUzSPk=;
	b=beox/CT+qrbsb62Z1J0ITzIHEqEsbcIZMZC7mqC8EJxxrjzT2Gr4YW1cFlzdk9vJYbb6/H
	BFuSAJVmmMb7+3jMS7qftKagLh24Ww78fQcE/y0J7eoBcRTt8XrHoofvV6pur9s7KaRVl0
	ymKlM4fUOwcrABzGBRfU4jHKMWpQAmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-PZIKLLVuMtqdWbg544bV_w-1; Thu, 20 Feb 2020 18:37:31 -0500
X-MC-Unique: PZIKLLVuMtqdWbg544bV_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A10918FE86D;
	Thu, 20 Feb 2020 23:37:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AA935C28E;
	Thu, 20 Feb 2020 23:37:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 116F735AF2;
	Thu, 20 Feb 2020 23:37:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KNb4La022554 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 18:37:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E2C991635A4; Thu, 20 Feb 2020 23:37:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE7821635A1
	for <linux-audit@redhat.com>; Thu, 20 Feb 2020 23:37:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F7CA101A55A
	for <linux-audit@redhat.com>; Thu, 20 Feb 2020 23:37:01 +0000 (UTC)
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
	[209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-432-NKjwZZRjOh6iNYNLCsBRFg-1; Thu, 20 Feb 2020 18:36:58 -0500
Received: by mail-vs1-f72.google.com with SMTP id f9so37841vsh.3
	for <linux-audit@redhat.com>; Thu, 20 Feb 2020 15:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=vqekHo0qVs0WWAN99kvtCqvo6xCPPizoJEkMMW82wwg=;
	b=Z7hyCIHArrTLTAu1zppD8lstjuKE3leSSOtAiSWxPFxzb3rnpKnB365StQ6mLuNQHF
	EWMSrOPu8SKbcxQdP80J0ZCy+8tvQfTl35Q5wEhUg69ktG8xWmLDPmbEf17jU+peuGnZ
	0nSd0iA0RNXQmZemRYjkiOtPsT9HAUglEs8106jxipr4ZaI2pE+zY2Yz+OqIB4GaOXQB
	aWOudMhUXqWAVymrF82hKE1EU3N5XkYO6odfeycBVhfODB/bxMulP66Tbz9Eu0v2I594
	/POTUt9DelYo4k0cM3b8UoFjTDlOHzjUVFaktyFan58/d1lVDmmzrjdO+O4TvXhFiyGm
	O+RQ==
X-Gm-Message-State: APjAAAVsHfPNhCmiZQwb8dHUuGKhgA0JQXJLy1NrLIogArftw/3hdvZK
	NbgTj2dq/kJtBt+srWWJr7LPoHGHHTLGF8kf38zHpg+RILbP1/VmX65b0u+b040pXjwODIFCSs8
	+HY9SJWF+rgwU+vQGwWW/UdziZLU6W1B/+Cg=
X-Received: by 2002:ac5:c844:: with SMTP id g4mr15319027vkm.25.1582241817434; 
	Thu, 20 Feb 2020 15:36:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqyL4rt5IfJo4v3S/mf3/p4kqikMxc24uf/5LE+r/EBLj69I2420uw8uXd0lVjwx7yV1JLQPSY62NeMLA+qqKoI=
X-Received: by 2002:ac5:c844:: with SMTP id g4mr15319021vkm.25.1582241817163; 
	Thu, 20 Feb 2020 15:36:57 -0800 (PST)
MIME-Version: 1.0
From: Moshe Rechtman <mrechtma@redhat.com>
Date: Fri, 21 Feb 2020 01:36:46 +0200
Message-ID: <CAM5ObREwVjihySamgkSGOxBK8Rwe0jgra5+Ec5ZHK5J5XzD_Ow@mail.gmail.com>
Subject: Question about excluding rules
To: linux-audit@redhat.com
X-MC-Unique: NKjwZZRjOh6iNYNLCsBRFg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============1820617000166021049=="

--===============1820617000166021049==
Content-Type: multipart/alternative; boundary="0000000000007608f8059f0a6146"

--0000000000007608f8059f0a6146
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Experts,

We have a big customer that facing the following issue on RHEL 6.2.
As per customer request I've configured the following rules:

$ cat audit.rules

# This file contains the auditctl rules that are loaded
# whenever the audit daemon is started via the initscripts.
# The rules are simply the parameters that would be passed
# to auditctl.

# First rule - delete all
-D

# Increase the buffers to survive stress events.
# Make this bigger for busy systems
-b 320

# Feel free to add below this line. See auditctl man page

-a exit,always -F arch=3Db64 -F euid=3D0 -S execve -k rootact
-a exit,always -F arch=3Db32 -F euid=3D0 -S execve -k rootact
-a exit,always -F arch=3Db64 -F euid>=3D500 -S execve -k useract
-a exit,always -F arch=3Db32 -F euid>=3D500 -S execve -k useract


Audit start working as expected. Now customer is asking to exclude/ignore
the following from audit logs:

type=3DSYSCALL msg=3Daudit(1581664357.597:257516): arch=3Dc000003e
syscall=3D59 success=3Dyes exit=3D0 a0=3D3869161ea3 a1=3D7ffd15530c20
a2=3D7ffd15534348 a3=3D3869617240 items=3D2 ppid=3D3350 pid=3D59266
auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=
=3D0
fsgid=3D0 tty=3D(none) ses=3D4294967295 comm=3D"sh" exe=3D"/bin/bash"
key=3D"rootact"
type=3DEXECVE msg=3Daudit(1581664357.597:257516): argc=3D3 a0=3D"sh" a1=3D"=
-c"
a2=3D2F62696E2F70732061757877777777
type=3DCWD msg=3Daudit(1581664357.597:257516):  cwd=3D"/opt/microfocus/Disc=
overy/bin"
type=3DPATH msg=3Daudit(1581664357.597:257516): item=3D0 name=3D"/bin/sh"
inode=3D398 dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00
nametype=3DNORMAL
type=3DPATH msg=3Daudit(1581664357.597:257516): item=3D1 name=3D(null)
inode=3D4481 dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00
nametype=3DNORMAL

ype=3DSYSCALL msg=3Daudit(1581664357.601:257517): arch=3Dc000003e syscall=
=3D59
success=3Dyes exit=3D0 a0=3D155c2f0 a1=3D155b8d0 a2=3D155b460 a3=3D18 items=
=3D2
ppid=3D3350 pid=3D59266 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0=
 fsuid=3D0
egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967295 comm=3D"ps"
exe=3D"/bin/ps" key=3D"rootact"
type=3DEXECVE msg=3Daudit(1581664357.601:257517): argc=3D2 a0=3D"/bin/ps" a=
1=3D"auxwwww"
type=3DCWD msg=3Daudit(1581664357.601:257517):  cwd=3D"/opt/microfocus/Disc=
overy/bin"
type=3DPATH msg=3Daudit(1581664357.601:257517): item=3D0 name=3D"/bin/ps"
inode=3D1451 dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00
nametype=3DNORMAL
type=3DPATH msg=3Daudit(1581664357.601:257517): item=3D1 name=3D(null)
inode=3D4481 dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00
nametype=3DNORMAL

What would be the best way to exclude such audit?
Your help would be much appreciated.

Thanks in advance & kind regards,
Moshe

Moshe Rechtman

Technical Support Engineer

Red Hat Israel <https://www.redhat.com/>

34 Jerusalem rd. Ra'anana, 43501

*mrechtma@redhat.com <kweg@redhat.com> *  T: *+972-9-**7692289 *
M: *+972-54-4971516*   F: +972-9-7692223
@RedHat <https://twitter.com/redhat>   Red Hat
<https://www.linkedin.com/company/red-hat>  Red Hat
<https://www.facebook.com/RedHatInc>
<https://red.ht/sig>

--0000000000007608f8059f0a6146
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Experts,</div><div><br></div><div>We have a big=
 customer that facing the following issue on RHEL 6.2.<br></div><div>As per=
 customer request I&#39;ve configured the following rules:</div><div><br></=
div><div><pre class=3D"gmail-caseCommentStyle" dir=3D"auto">$ cat audit.rul=
es
=20
# This file contains the auditctl rules that are loaded
# whenever the audit daemon is started via the initscripts.
# The rules are simply the parameters that would be passed
# to auditctl.

# First rule - delete all
-D

# Increase the buffers to survive stress events.
# Make this bigger for busy systems
-b 320

# Feel free to add below this line. See auditctl man page

-a exit,always -F arch=3Db64 -F euid=3D0 -S execve -k rootact
-a exit,always -F arch=3Db32 -F euid=3D0 -S execve -k rootact
-a exit,always -F arch=3Db64 -F euid&gt;=3D500 -S execve -k useract
-a exit,always -F arch=3Db32 -F euid&gt;=3D500 -S execve -k useract</pre></=
div><div><br></div><div>Audit start working as expected. Now customer is as=
king to exclude/ignore the following from audit logs:<br></div><div><br></d=
iv><div><pre class=3D"gmail-caseCommentStyle" dir=3D"auto">type=3DSYSCALL m=
sg=3Daudit(1581664357.597:257516): arch=3Dc000003e syscall=3D59 success=3Dy=
es exit=3D0 a0=3D3869161ea3 a1=3D7ffd15530c20 a2=3D7ffd15534348 a3=3D386961=
7240 items=3D2 ppid=3D3350 pid=3D59266 auid=3D4294967295 uid=3D0 gid=3D0 eu=
id=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D42=
94967295 comm=3D&quot;sh&quot; exe=3D&quot;/bin/bash&quot; key=3D&quot;root=
act&quot;
type=3DEXECVE msg=3Daudit(1581664357.597:257516): argc=3D3 a0=3D&quot;sh&qu=
ot; a1=3D&quot;-c&quot; a2=3D2F62696E2F70732061757877777777
type=3DCWD msg=3Daudit(1581664357.597:257516):  cwd=3D&quot;/opt/microfocus=
/Discovery/bin&quot;
type=3DPATH msg=3Daudit(1581664357.597:257516): item=3D0 name=3D&quot;/bin/=
sh&quot; inode=3D398 dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00=
:00 nametype=3DNORMAL
type=3DPATH msg=3Daudit(1581664357.597:257516): item=3D1 name=3D(null) inod=
e=3D4481 dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00 nametype=
=3DNORMAL</pre></div><div><pre class=3D"gmail-caseCommentStyle" dir=3D"auto=
">ype=3DSYSCALL msg=3Daudit(1581664357.601:257517): arch=3Dc000003e syscall=
=3D59 success=3Dyes exit=3D0 a0=3D155c2f0 a1=3D155b8d0 a2=3D155b460 a3=3D18=
 items=3D2 ppid=3D3350 pid=3D59266 auid=3D4294967295 uid=3D0 gid=3D0 euid=
=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294=
967295 comm=3D&quot;ps&quot; exe=3D&quot;/bin/ps&quot; key=3D&quot;rootact&=
quot;
type=3DEXECVE msg=3Daudit(1581664357.601:257517): argc=3D2 a0=3D&quot;/bin/=
ps&quot; a1=3D&quot;auxwwww&quot;
type=3DCWD msg=3Daudit(1581664357.601:257517):  cwd=3D&quot;/opt/microfocus=
/Discovery/bin&quot;
type=3DPATH msg=3Daudit(1581664357.601:257517): item=3D0 name=3D&quot;/bin/=
ps&quot; inode=3D1451 dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D0=
0:00 nametype=3DNORMAL
type=3DPATH msg=3Daudit(1581664357.601:257517): item=3D1 name=3D(null) inod=
e=3D4481 dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00 nametype=
=3DNORMAL</pre></div><div>What would be the best way to exclude such audit?=
<br></div><div>Your help would be much appreciated.</div><div><br></div><di=
v>Thanks in advance &amp; kind regards,</div><div>Moshe<br></div><div><br><=
/div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div style=3D"margin-left:44px"><div style=3D"mar=
gin-bottom:0px;margin-left:0px;padding-bottom:5px"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><p style=3D"margin:0px;font-weight:bol=
d;padding:0px;font-size:14px;text-transform:capitalize;font-family:RedHatTe=
xt,sans-serif">Moshe Rechtman<span style=3D"color:rgb(170,170,170);margin:0=
px"></span></p><p style=3D"margin:0px;font-size:14px;color:rgb(0,0,0);font-=
family:overpass,sans-serif;font-weight:bold;padding:0px;text-transform:uppe=
rcase"><span style=3D"font-family:RedHatText,sans-serif;font-size:12px;text=
-transform:capitalize;font-weight:normal;color:rgb(34,34,34)">Technical Sup=
port Engineer</span><br></p></div></div></div></div></div></div></div></div=
></div></div><div style=3D"margin-left:44px"><div style=3D"margin-bottom:0p=
x;margin-left:0px;padding-bottom:5px"><div dir=3D"ltr"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><p style=3D"margin:0px 0px 4px;font-size:12px;fon=
t-family:RedHatText,sans-serif"><a href=3D"https://www.redhat.com/" style=
=3D"color:rgb(0,136,206);margin:0px" target=3D"_blank">Red Hat=C2=A0Israel<=
/a></p><div style=3D"margin-bottom:4px"><p style=3D"margin:0px;font-size:12=
px;font-family:RedHatText,sans-serif">34 Jerusalem rd. Ra&#39;anana, 43501<=
/p></div><p style=3D"margin:0px"><span style=3D"font-family:RedHatText,sans=
-serif;font-size:12px;margin:0px;padding:0px"><u><a href=3D"mailto:kweg@red=
hat.com" style=3D"color:rgb(17,85,204)" target=3D"_blank">mrechtma@redhat.c=
om</a>=C2=A0</u>=C2=A0</span><font face=3D"RedHatText, sans-serif"><span st=
yle=3D"font-size:12px">=C2=A0T:=C2=A0</span></font><u style=3D"font-family:=
RedHatText,sans-serif;font-size:12px">+972-9-</u><font face=3D"RedHatText, =
sans-serif"><span style=3D"font-size:12px"><u>7692289=C2=A0</u></span></fon=
t><br><font face=3D"RedHatText, sans-serif"><span style=3D"font-size:12px">=
M:=C2=A0</span></font><u style=3D"font-family:RedHatText,sans-serif;font-si=
ze:12px"><span>+972-54-4971516</span></u><font face=3D"RedHatText, sans-ser=
if"><span style=3D"font-size:12px">=C2=A0 =C2=A0F:=C2=A0</span></font><a hr=
ef=3D"tel:+972-9-7692223" style=3D"color:rgb(0,0,0);font-family:RedHatText,=
sans-serif;font-size:12px;margin:0px" target=3D"_blank">+972-9-7692223</a><=
font face=3D"RedHatText, sans-serif"><span style=3D"font-size:12px">=C2=A0=
=C2=A0 =C2=A0</span></font></p><div style=3D"font-size:12px;font-family:Red=
HatText,sans-serif;margin-bottom:8px"><a href=3D"https://twitter.com/redhat=
" title=3D"twitter" style=3D"color:rgb(0,0,0);background:transparent url(&q=
uot;https://marketing-outfit-prod-images.s3-us-west-2.amazonaws.com/3780bd4=
ede961ef3cd4108b8c0e80186/web-icon-twitter.png&quot;) no-repeat scroll 0px =
50%/13px auto;display:inline-block;line-height:20px;padding-left:13px" targ=
et=3D"_blank"><span style=3D"margin-left:2px">@RedHat</span></a>=C2=A0=C2=
=A0=C2=A0<a href=3D"https://www.linkedin.com/company/red-hat" title=3D"Link=
edIn" style=3D"color:rgb(0,0,0);background:transparent url(&quot;https://ma=
rketing-outfit-prod-images.s3-us-west-2.amazonaws.com/8d3507e3c6b6c9ad10e30=
1accf1a4af0/web-icon-linkedin.png&quot;) no-repeat scroll 0px 50%/12px auto=
;display:inline-block;line-height:20px;padding-left:12px;margin:0px 4px 0px=
 3px;padding-top:1px" target=3D"_blank"><span style=3D"margin-left:4px">Red=
 Hat</span></a>=C2=A0=C2=A0<a href=3D"https://www.facebook.com/RedHatInc" t=
itle=3D"Facebook" style=3D"color:rgb(0,0,0);background:transparent url(&quo=
t;https://marketing-outfit-prod-images.s3-us-west-2.amazonaws.com/220b85e2f=
100025e94cb1bcd993bd51d/web-icon-facebook.png&quot;) no-repeat scroll 0px 5=
0%/11px auto;display:inline-block;line-height:20px;padding-left:13px" targe=
t=3D"_blank">Red Hat</a></div><div style=3D"margin-top:12px"><table border=
=3D"0"><tbody><tr><td width=3D"100px"><a href=3D"https://red.ht/sig" style=
=3D"color:rgb(17,85,204)" target=3D"_blank"><img src=3D"https://static.redh=
at.com/libs/redhat/brand-assets/latest/corp/logo.png" width=3D"90" height=
=3D"auto"></a></td></tr></tbody></table></div></div></div></div></div></div=
></div></div></div></div></div></div></div></div></div></div></div></div></=
div></div></div></div>

--0000000000007608f8059f0a6146--

--===============1820617000166021049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============1820617000166021049==--


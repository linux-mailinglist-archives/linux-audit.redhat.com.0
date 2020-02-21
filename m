Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A31C116702D
	for <lists+linux-audit@lfdr.de>; Fri, 21 Feb 2020 08:33:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582270437;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Vr0jpur0CcuhIaWRpXg5ArVhUdgikqWzzv29e/lTBr8=;
	b=MvAZyleLf6B6Fg5kLkcM1sMd5SUuWEBjnOra4w6MkAW24tPJDgNUfKGatSdNuw7Q75b4CD
	tO/FV0C5U2lZSN4FBbN/CoXllVYaQub0XTM0dvE9dCdPyLmj4SeJSvwsjhcG4hVUQY1aUF
	F2eAAIFy9qcvzQyUjQJ/d6U13G5hl5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-KixXA2CKNhagn-e4_LepmQ-1; Fri, 21 Feb 2020 02:33:54 -0500
X-MC-Unique: KixXA2CKNhagn-e4_LepmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C94F8010E7;
	Fri, 21 Feb 2020 07:33:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEEA990F69;
	Fri, 21 Feb 2020 07:33:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 38AC018089C8;
	Fri, 21 Feb 2020 07:33:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01L7XLXd011990 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 02:33:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 29762104FA53; Fri, 21 Feb 2020 07:33:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 244E6104FA4B
	for <linux-audit@redhat.com>; Fri, 21 Feb 2020 07:33:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41CA085A30E
	for <linux-audit@redhat.com>; Fri, 21 Feb 2020 07:33:19 +0000 (UTC)
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
	[209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-243-7qHSZA3MO2eFgqy6GvMTyA-1; Fri, 21 Feb 2020 02:33:10 -0500
Received: by mail-vk1-f197.google.com with SMTP id n9so582484vkc.14
	for <linux-audit@redhat.com>; Thu, 20 Feb 2020 23:33:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Qb/fWwwNcoa4EhxXm91gI6Lcs35ePu/7747Syu00Auw=;
	b=IU4+bqel90NXqpRyXHLUPLseT6W+VQK2lCX7Z12R9kBco1I7ASbtpDzOzH/8DLEL55
	rtmFTAgIBDrbuNtKxTQitXkwG6y+Z88/Bai2stCfhlOu2Mf980av9vs6MQwetRy2YKFN
	MdCmxoH/jtd4q+r4FbIDj5CO46WZVwrur4mYy2uEZOZhsJFRDobAe+epKf4s9vRr4gCF
	fNAO+XDoBb3dGOJKXzfBK9jUo89tQde2FyiHCYnTwMuJWd6x6blx1lnkJZDrFEvYw0n8
	Pi9Rj1BDDlbpkX+l/9qQerGhEFaJZnObuPpuIdzz/nKUMjD0kgTUccq4ppgxsYSCpVlc
	I8Jg==
X-Gm-Message-State: APjAAAV1oPv5A6Yez5CkDlr6lGdTsfCZ0ES/Y1z+tw0brSFgcthKFsNf
	q9Tcr22R94sa/e6DE+5cU5dVvGsGRSRVBdkHvSO3yRk70celESG3h9xBO5dNTk1pax6lMjcIKW7
	lub7NHKH/WQyG2Elxm8hVT2UsAqkr17hsZl0=
X-Received: by 2002:a1f:2188:: with SMTP id h130mr16520968vkh.72.1582270389602;
	Thu, 20 Feb 2020 23:33:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqyVrGDbrk0ZnWCFmr1rjSVKYRL5Z5iV4Tc32m3gZHAS4ikO+2nzHuJ1kDk7kvJeZIVqV0ti3A+62kz8UGFNWp8=
X-Received: by 2002:a1f:2188:: with SMTP id h130mr16520957vkh.72.1582270389121;
	Thu, 20 Feb 2020 23:33:09 -0800 (PST)
MIME-Version: 1.0
References: <CAM5ObREwVjihySamgkSGOxBK8Rwe0jgra5+Ec5ZHK5J5XzD_Ow@mail.gmail.com>
	<2400991.fjeXDc8RHV@x2>
	<CAM5ObRF7HEK2qyCX+bbW_CTVwuEbmrCJVKg9mHQZkHUcJXRWwA@mail.gmail.com>
	<3341724.7X2qyikPX2@x2>
In-Reply-To: <3341724.7X2qyikPX2@x2>
From: Moshe Rechtman <mrechtma@redhat.com>
Date: Fri, 21 Feb 2020 09:32:58 +0200
Message-ID: <CAM5ObRErKLEDB_2RAWBf_Xp+V+aEdBQhi_dnicM9o2Q7SK_y2g@mail.gmail.com>
Subject: Re: Question about excluding rules
To: Steve Grubb <sgrubb@redhat.com>
X-MC-Unique: 7qHSZA3MO2eFgqy6GvMTyA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
Content-Type: multipart/mixed; boundary="===============6681048485704698327=="

--===============6681048485704698327==
Content-Type: multipart/alternative; boundary="0000000000007e3602059f11086d"

--0000000000007e3602059f11086d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Steve,

Thanks so much for your help! I've included your suggested filter in
audit.rules as shown below:

# cat audit.rules1

      1 # This file contains the auditctl rules that are loaded
      2 # whenever the audit daemon is started via the initscripts.
      3 # The rules are simply the parameters that would be passed
      4 # to auditctl.
      5 # First rule - delete all
      6 -D
      7 # Increase the buffers to survive stress events.
      8 # Make this bigger for busy systems
      9 -b 320
     10 ### Feel free to add below this line. See auditctl man page
     11 -a exit,always -F arch=3Db64 -F euid=3D0 -S execve -k rootact
     12 -a exit,always -F arch=3Db32 -F euid=3D0 -S execve -k rootact
     13 -a exit,always -F arch=3Db64 -F euid>=3D500 -S execve -k useract
     14 -a exit,always -F arch=3Db32 -F euid>=3D500 -S execve -k useract
     15 -a exit,always -F arch=3Db64 -F euid=3D0 -F auid!=3Dunset -S execve=
 -k
rootact
     16 -a exit,always -F arch=3Db32 -F euid=3D0 -F auid!=3Dunset -S execve=
 -k
rootact

After restarting the auditd service following error received:

# service auditd restart
Stopping auditd:                                           [  OK  ]
Starting auditd:                                           [  OK  ]
Unknown user: unset
-F unknown field: auid
There was an error in line 15 of /etc/audit/audit.rules

# auditctl -l
LIST_RULES: exit,always arch=3D3221225534 (0xc000003e) euid=3D0 key=3Droota=
ct
syscall=3Dexecve
LIST_RULES: exit,always arch=3D1073741827 (0x40000003) euid=3D0 key=3Droota=
ct
syscall=3Dexecve
LIST_RULES: exit,always arch=3D3221225534 (0xc000003e) euid>=3D500 (0x1f4)
key=3Duseract syscall=3Dexecve
LIST_RULES: exit,always arch=3D1073741827 (0x40000003) euid>=3D500 (0x1f4)
key=3Duseract syscall=3Dexecve

# auditctl -a exit,always -F arch=3Db64 -F euid=3D0 -F auid!=3Dunset -S exe=
cve -k
rootact
Unknown user: unset
-F unknown field: auid

You advice would be much appreciated.

Many thanks,

Kind regards,
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


On Fri, Feb 21, 2020 at 2:27 AM Steve Grubb <sgrubb@redhat.com> wrote:

> Hello,
>
> On Thursday, February 20, 2020 7:04:37 PM EST Moshe Rechtman wrote:
> > Those particular logs generated by a third party monitoring application
> > named Microfocus, which keeps on running "ps -auxwwww" command and
> filling
> > up quickly the audit log.
>
> It looks like this is a daemon since auid is -1. So, I'd suggest that the
> rule be something like:
>
> -a exit,always -F arch=3Db64 -F euid=3D0 -F auid!=3Dunset -S execve -k ro=
otact
>
> This will not filter just that one item, it will filter all execution by
> all
> daemons.
>
> -Steve
>
> > > On Thursday, February 20, 2020 6:36:46 PM EST Moshe Rechtman wrote:
> > > > $ cat audit.rules
> > > >
> > > > # This file contains the auditctl rules that are loaded
> > > > # whenever the audit daemon is started via the initscripts.
> > > > # The rules are simply the parameters that would be passed
> > > > # to auditctl.
> > > >
> > > > # First rule - delete all
> > > > -D
> > > >
> > > > # Increase the buffers to survive stress events.
> > > > # Make this bigger for busy systems
> > > > -b 320
> > > >
> > > > # Feel free to add below this line. See auditctl man page
> > > >
> > > > -a exit,always -F arch=3Db64 -F euid=3D0 -S execve -k rootact
> > > > -a exit,always -F arch=3Db32 -F euid=3D0 -S execve -k rootact
> > > > -a exit,always -F arch=3Db64 -F euid>=3D500 -S execve -k useract
> > > > -a exit,always -F arch=3Db32 -F euid>=3D500 -S execve -k useract
> > > >
> > > >
> > > > Audit start working as expected. Now customer is asking to
> > > > exclude/ignore the following from audit logs:
> > > >
> > > > type=3DSYSCALL msg=3Daudit(1581664357.597:257516): arch=3Dc000003e
> > > > syscall=3D59 success=3Dyes exit=3D0 a0=3D3869161ea3 a1=3D7ffd15530c=
20
> > > > a2=3D7ffd15534348 a3=3D3869617240 items=3D2 ppid=3D3350 pid=3D59266
> > > > auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=
=3D0 sgid=3D0
> > > > fsgid=3D0 tty=3D(none) ses=3D4294967295 comm=3D"sh" exe=3D"/bin/bas=
h"
> > > > key=3D"rootact"
> > > > type=3DEXECVE msg=3Daudit(1581664357.597:257516): argc=3D3 a0=3D"sh=
" a1=3D"-c"
> > > > a2=3D2F62696E2F70732061757877777777
> > > > type=3DCWD msg=3Daudit(1581664357.597:257516):
> > > > cwd=3D"/opt/microfocus/Discovery/bin" type=3DPATH
> > > > msg=3Daudit(1581664357.597:257516): item=3D0 name=3D"/bin/sh" inode=
=3D398
> > > > dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00
> > > > nametype=3DNORMAL
> > > > type=3DPATH msg=3Daudit(1581664357.597:257516): item=3D1 name=3D(nu=
ll)
> > > > inode=3D4481 dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00=
:00
> > > > nametype=3DNORMAL
> > > >
> > > > ype=3DSYSCALL msg=3Daudit(1581664357.601:257517): arch=3Dc000003e
> syscall=3D59
> > > > success=3Dyes exit=3D0 a0=3D155c2f0 a1=3D155b8d0 a2=3D155b460 a3=3D=
18 items=3D2
> > > > ppid=3D3350 pid=3D59266 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 =
suid=3D0 fsuid=3D0
> > > > egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967295 comm=3D"p=
s"
> > > > exe=3D"/bin/ps" key=3D"rootact"
> > > > type=3DEXECVE msg=3Daudit(1581664357.601:257517): argc=3D2 a0=3D"/b=
in/ps"
> > > > a1=3D"auxwwww" type=3DCWD msg=3Daudit(1581664357.601:257517):
> > > > cwd=3D"/opt/microfocus/Discovery/bin" type=3DPATH
> > > > msg=3Daudit(1581664357.601:257517): item=3D0 name=3D"/bin/ps" inode=
=3D1451
> > > > dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00
> > > > nametype=3DNORMAL
> > > > type=3DPATH msg=3Daudit(1581664357.601:257517): item=3D1 name=3D(nu=
ll)
> > > > inode=3D4481 dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00=
:00
> > > > nametype=3DNORMAL
> > > >
> > > > What would be the best way to exclude such audit?
> > > > Your help would be much appreciated.
> > >
> > > What's objectionable about these events? The fact that its got a key
> says
> > > they think they wanted it.
> > >
> > > -Steve
>
>
>
>
>

--0000000000007e3602059f11086d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Steve,</div><div><br></div><div>Thanks so much =
for your help! I&#39;ve included your suggested filter in audit.rules as sh=
own below:</div><div><br></div><div># cat audit.rules1</div><div><br></div>=
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 # This file contains the auditctl rul=
es that are loaded<br>=C2=A0 =C2=A0 =C2=A0 2 # whenever the audit daemon is=
 started via the initscripts.<br>=C2=A0 =C2=A0 =C2=A0 3 # The rules are sim=
ply the parameters that would be passed<br>=C2=A0 =C2=A0 =C2=A0 4 # to audi=
tctl.<br>=C2=A0 =C2=A0 =C2=A0 5 # First rule - delete all<br>=C2=A0 =C2=A0 =
=C2=A0 6 -D<br>=C2=A0 =C2=A0 =C2=A0 7 # Increase the buffers to survive str=
ess events.<br>=C2=A0 =C2=A0 =C2=A0 8 # Make this bigger for busy systems<b=
r>=C2=A0 =C2=A0 =C2=A0 9 -b 320<br>=C2=A0 =C2=A0 =C2=A010 ### Feel free to =
add below this line. See auditctl man page<br>=C2=A0 =C2=A0 =C2=A011 -a exi=
t,always -F arch=3Db64 -F euid=3D0 -S execve -k rootact<br>=C2=A0 =C2=A0 =
=C2=A012 -a exit,always -F arch=3Db32 -F euid=3D0 -S execve -k rootact<br>=
=C2=A0 =C2=A0 =C2=A013 -a exit,always -F arch=3Db64 -F euid&gt;=3D500 -S ex=
ecve -k useract<br>=C2=A0 =C2=A0 =C2=A014 -a exit,always -F arch=3Db32 -F e=
uid&gt;=3D500 -S execve -k useract<br>=C2=A0 =C2=A0 =C2=A015 -a exit,always=
 -F arch=3Db64 -F euid=3D0 -F auid!=3Dunset -S execve -k rootact<br>=C2=A0 =
=C2=A0 =C2=A016 -a exit,always -F arch=3Db32 -F euid=3D0 -F auid!=3Dunset -=
S execve -k rootact</div><div><br></div><div>After restarting the auditd se=
rvice following error received:</div><div><br></div><div># service auditd r=
estart<br>Stopping auditd: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [ =C2=A0OK =C2=A0]<br>Starting auditd: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ =C2=A0OK =
=C2=A0]<br>Unknown user: unset<br>-F unknown field: auid<br>There was an er=
ror in line 15 of /etc/audit/audit.rules</div><div><br></div><div># auditct=
l -l<br>LIST_RULES: exit,always arch=3D3221225534 (0xc000003e) euid=3D0 key=
=3Drootact syscall=3Dexecve<br>LIST_RULES: exit,always arch=3D1073741827 (0=
x40000003) euid=3D0 key=3Drootact syscall=3Dexecve<br>LIST_RULES: exit,alwa=
ys arch=3D3221225534 (0xc000003e) euid&gt;=3D500 (0x1f4) key=3Duseract sysc=
all=3Dexecve<br>LIST_RULES: exit,always arch=3D1073741827 (0x40000003) euid=
&gt;=3D500 (0x1f4) key=3Duseract syscall=3Dexecve<br></div><div><br></div><=
div># auditctl -a exit,always -F arch=3Db64 -F euid=3D0 -F auid!=3Dunset -S=
 execve -k rootact<br>Unknown user: unset<br>-F unknown field: auid<br></di=
v><div><br></div><div>You advice would be much appreciated.</div><div><br><=
/div><div>Many thanks,</div><div><br></div><div>Kind regards,</div><div>Mos=
he<br></div><div><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signat=
ure" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div style=3D"margin-left:4=
4px"><div style=3D"margin-bottom:0px;margin-left:0px;padding-bottom:5px"><d=
iv dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><p style=3D"mar=
gin:0px;font-weight:bold;padding:0px;font-size:14px;text-transform:capitali=
ze;font-family:RedHatText,sans-serif">Moshe Rechtman<span style=3D"color:rg=
b(170,170,170);margin:0px"></span></p><p style=3D"margin:0px;font-size:14px=
;color:rgb(0,0,0);font-family:overpass,sans-serif;font-weight:bold;padding:=
0px;text-transform:uppercase"><span style=3D"font-family:RedHatText,sans-se=
rif;font-size:12px;text-transform:capitalize;font-weight:normal;color:rgb(3=
4,34,34)">Technical Support Engineer</span><br></p></div></div></div></div>=
</div></div></div></div></div></div><div style=3D"margin-left:44px"><div st=
yle=3D"margin-bottom:0px;margin-left:0px;padding-bottom:5px"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><p style=3D"margin:0px 0px 4=
px;font-size:12px;font-family:RedHatText,sans-serif"><a href=3D"https://www=
.redhat.com/" style=3D"color:rgb(0,136,206);margin:0px" target=3D"_blank">R=
ed Hat=C2=A0Israel</a></p><div style=3D"margin-bottom:4px"><p style=3D"marg=
in:0px;font-size:12px;font-family:RedHatText,sans-serif">34 Jerusalem rd. R=
a&#39;anana, 43501</p></div><p style=3D"margin:0px"><span style=3D"font-fam=
ily:RedHatText,sans-serif;font-size:12px;margin:0px;padding:0px"><u><a href=
=3D"mailto:kweg@redhat.com" style=3D"color:rgb(17,85,204)" target=3D"_blank=
">mrechtma@redhat.com</a>=C2=A0</u>=C2=A0</span><font face=3D"RedHatText, s=
ans-serif"><span style=3D"font-size:12px">=C2=A0T:=C2=A0</span></font><u st=
yle=3D"font-family:RedHatText,sans-serif;font-size:12px">+972-9-</u><font f=
ace=3D"RedHatText, sans-serif"><span style=3D"font-size:12px"><u>7692289=C2=
=A0</u></span></font><br><font face=3D"RedHatText, sans-serif"><span style=
=3D"font-size:12px">M:=C2=A0</span></font><u style=3D"font-family:RedHatTex=
t,sans-serif;font-size:12px"><span>+972-54-4971516</span></u><font face=3D"=
RedHatText, sans-serif"><span style=3D"font-size:12px">=C2=A0 =C2=A0F:=C2=
=A0</span></font><a href=3D"tel:+972-9-7692223" style=3D"color:rgb(0,0,0);f=
ont-family:RedHatText,sans-serif;font-size:12px;margin:0px" target=3D"_blan=
k">+972-9-7692223</a><font face=3D"RedHatText, sans-serif"><span style=3D"f=
ont-size:12px">=C2=A0=C2=A0 =C2=A0</span></font></p><div style=3D"font-size=
:12px;font-family:RedHatText,sans-serif;margin-bottom:8px"><a href=3D"https=
://twitter.com/redhat" title=3D"twitter" style=3D"color:rgb(0,0,0);backgrou=
nd:transparent url(&quot;https://marketing-outfit-prod-images.s3-us-west-2.=
amazonaws.com/3780bd4ede961ef3cd4108b8c0e80186/web-icon-twitter.png&quot;) =
no-repeat scroll 0px 50%/13px auto;display:inline-block;line-height:20px;pa=
dding-left:13px" target=3D"_blank"><span style=3D"margin-left:2px">@RedHat<=
/span></a>=C2=A0=C2=A0=C2=A0<a href=3D"https://www.linkedin.com/company/red=
-hat" title=3D"LinkedIn" style=3D"color:rgb(0,0,0);background:transparent u=
rl(&quot;https://marketing-outfit-prod-images.s3-us-west-2.amazonaws.com/8d=
3507e3c6b6c9ad10e301accf1a4af0/web-icon-linkedin.png&quot;) no-repeat scrol=
l 0px 50%/12px auto;display:inline-block;line-height:20px;padding-left:12px=
;margin:0px 4px 0px 3px;padding-top:1px" target=3D"_blank"><span style=3D"m=
argin-left:4px">Red Hat</span></a>=C2=A0=C2=A0<a href=3D"https://www.facebo=
ok.com/RedHatInc" title=3D"Facebook" style=3D"color:rgb(0,0,0);background:t=
ransparent url(&quot;https://marketing-outfit-prod-images.s3-us-west-2.amaz=
onaws.com/220b85e2f100025e94cb1bcd993bd51d/web-icon-facebook.png&quot;) no-=
repeat scroll 0px 50%/11px auto;display:inline-block;line-height:20px;paddi=
ng-left:13px" target=3D"_blank">Red Hat</a></div><div style=3D"margin-top:1=
2px"><table border=3D"0"><tbody><tr><td width=3D"100px"><a href=3D"https://=
red.ht/sig" style=3D"color:rgb(17,85,204)" target=3D"_blank"><img src=3D"ht=
tps://static.redhat.com/libs/redhat/brand-assets/latest/corp/logo.png" widt=
h=3D"90" height=3D"auto"></a></td></tr></tbody></table></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div></div=
></div></div></div></div><br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 21, 2020 at 2:27 AM Steve Gr=
ubb &lt;<a href=3D"mailto:sgrubb@redhat.com">sgrubb@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On Thursday, February 20, 2020 7:04:37 PM EST Moshe Rechtman wrote:<br>
&gt; Those particular logs generated by a third party monitoring applicatio=
n<br>
&gt; named Microfocus, which keeps on running &quot;ps -auxwwww&quot; comma=
nd and filling<br>
&gt; up quickly the audit log.<br>
<br>
It looks like this is a daemon since auid is -1. So, I&#39;d suggest that t=
he <br>
rule be something like:<br>
<br>
-a exit,always -F arch=3Db64 -F euid=3D0 -F auid!=3Dunset -S execve -k root=
act<br>
<br>
This will not filter just that one item, it will filter all execution by al=
l <br>
daemons.<br>
<br>
-Steve<br>
<br>
&gt; &gt; On Thursday, February 20, 2020 6:36:46 PM EST Moshe Rechtman wrot=
e:<br>
&gt; &gt; &gt; $ cat audit.rules<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; # This file contains the auditctl rules that are loaded<br>
&gt; &gt; &gt; # whenever the audit daemon is started via the initscripts.<=
br>
&gt; &gt; &gt; # The rules are simply the parameters that would be passed<b=
r>
&gt; &gt; &gt; # to auditctl.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; # First rule - delete all<br>
&gt; &gt; &gt; -D<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; # Increase the buffers to survive stress events.<br>
&gt; &gt; &gt; # Make this bigger for busy systems<br>
&gt; &gt; &gt; -b 320<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; # Feel free to add below this line. See auditctl man page<br=
>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; -a exit,always -F arch=3Db64 -F euid=3D0 -S execve -k rootac=
t<br>
&gt; &gt; &gt; -a exit,always -F arch=3Db32 -F euid=3D0 -S execve -k rootac=
t<br>
&gt; &gt; &gt; -a exit,always -F arch=3Db64 -F euid&gt;=3D500 -S execve -k =
useract<br>
&gt; &gt; &gt; -a exit,always -F arch=3Db32 -F euid&gt;=3D500 -S execve -k =
useract<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Audit start working as expected. Now customer is asking to<b=
r>
&gt; &gt; &gt; exclude/ignore the following from audit logs:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; type=3DSYSCALL msg=3Daudit(1581664357.597:257516): arch=3Dc0=
00003e<br>
&gt; &gt; &gt; syscall=3D59 success=3Dyes exit=3D0 a0=3D3869161ea3 a1=3D7ff=
d15530c20<br>
&gt; &gt; &gt; a2=3D7ffd15534348 a3=3D3869617240 items=3D2 ppid=3D3350 pid=
=3D59266<br>
&gt; &gt; &gt; auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D=
0 egid=3D0 sgid=3D0<br>
&gt; &gt; &gt; fsgid=3D0 tty=3D(none) ses=3D4294967295 comm=3D&quot;sh&quot=
; exe=3D&quot;/bin/bash&quot;<br>
&gt; &gt; &gt; key=3D&quot;rootact&quot;<br>
&gt; &gt; &gt; type=3DEXECVE msg=3Daudit(1581664357.597:257516): argc=3D3 a=
0=3D&quot;sh&quot; a1=3D&quot;-c&quot;<br>
&gt; &gt; &gt; a2=3D2F62696E2F70732061757877777777<br>
&gt; &gt; &gt; type=3DCWD msg=3Daudit(1581664357.597:257516):<br>
&gt; &gt; &gt; cwd=3D&quot;/opt/microfocus/Discovery/bin&quot; type=3DPATH<=
br>
&gt; &gt; &gt; msg=3Daudit(1581664357.597:257516): item=3D0 name=3D&quot;/b=
in/sh&quot; inode=3D398<br>
&gt; &gt; &gt; dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00<br=
>
&gt; &gt; &gt; nametype=3DNORMAL<br>
&gt; &gt; &gt; type=3DPATH msg=3Daudit(1581664357.597:257516): item=3D1 nam=
e=3D(null)<br>
&gt; &gt; &gt; inode=3D4481 dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rd=
ev=3D00:00<br>
&gt; &gt; &gt; nametype=3DNORMAL<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ype=3DSYSCALL msg=3Daudit(1581664357.601:257517): arch=3Dc00=
0003e syscall=3D59<br>
&gt; &gt; &gt; success=3Dyes exit=3D0 a0=3D155c2f0 a1=3D155b8d0 a2=3D155b46=
0 a3=3D18 items=3D2<br>
&gt; &gt; &gt; ppid=3D3350 pid=3D59266 auid=3D4294967295 uid=3D0 gid=3D0 eu=
id=3D0 suid=3D0 fsuid=3D0<br>
&gt; &gt; &gt; egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967295 co=
mm=3D&quot;ps&quot;<br>
&gt; &gt; &gt; exe=3D&quot;/bin/ps&quot; key=3D&quot;rootact&quot;<br>
&gt; &gt; &gt; type=3DEXECVE msg=3Daudit(1581664357.601:257517): argc=3D2 a=
0=3D&quot;/bin/ps&quot;<br>
&gt; &gt; &gt; a1=3D&quot;auxwwww&quot; type=3DCWD msg=3Daudit(1581664357.6=
01:257517):<br>
&gt; &gt; &gt; cwd=3D&quot;/opt/microfocus/Discovery/bin&quot; type=3DPATH<=
br>
&gt; &gt; &gt; msg=3Daudit(1581664357.601:257517): item=3D0 name=3D&quot;/b=
in/ps&quot; inode=3D1451<br>
&gt; &gt; &gt; dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00<br=
>
&gt; &gt; &gt; nametype=3DNORMAL<br>
&gt; &gt; &gt; type=3DPATH msg=3Daudit(1581664357.601:257517): item=3D1 nam=
e=3D(null)<br>
&gt; &gt; &gt; inode=3D4481 dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rd=
ev=3D00:00<br>
&gt; &gt; &gt; nametype=3DNORMAL<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; What would be the best way to exclude such audit?<br>
&gt; &gt; &gt; Your help would be much appreciated.<br>
&gt; &gt; <br>
&gt; &gt; What&#39;s objectionable about these events? The fact that its go=
t a key says<br>
&gt; &gt; they think they wanted it.<br>
&gt; &gt; <br>
&gt; &gt; -Steve<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000007e3602059f11086d--

--===============6681048485704698327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============6681048485704698327==--


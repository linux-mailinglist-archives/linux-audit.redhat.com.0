Return-Path: <linux-audit-bounces@listman.redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by mail.lfdr.de (Postfix) with ESMTP id 6A21831CFE9
	for <lists+linux-audit@lfdr.de>; Tue, 16 Feb 2021 19:12:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-fskzUPbiMKi5BjGgeCTzBA-1; Tue, 16 Feb 2021 13:12:32 -0500
X-MC-Unique: fskzUPbiMKi5BjGgeCTzBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97687189DF4E;
	Tue, 16 Feb 2021 18:12:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2685060D43;
	Tue, 16 Feb 2021 18:12:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB69E18095CE;
	Tue, 16 Feb 2021 18:12:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11C1nGO4022690 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 11 Feb 2021 20:49:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 867912026D3A; Fri, 12 Feb 2021 01:49:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80C482026D14
	for <linux-audit@redhat.com>; Fri, 12 Feb 2021 01:49:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37C7280231B
	for <linux-audit@redhat.com>; Fri, 12 Feb 2021 01:49:14 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
	[209.85.218.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-443-1EEwJoXAM8y9b4vpAZVBkQ-1; Thu, 11 Feb 2021 20:49:09 -0500
X-MC-Unique: 1EEwJoXAM8y9b4vpAZVBkQ-1
Received: by mail-ej1-f45.google.com with SMTP id f14so13121369ejc.8;
	Thu, 11 Feb 2021 17:49:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Uz8vtXLTIzUQh5zCh9fr6Ci0IIZ9f4mUPVPqOm08JMM=;
	b=C/k8TBD0yl0wi3oPj7HykowmVmF4/cHrzAvZx881ngr0zdqegSy/9qXnmHMEvaxYam
	FkRJd3evhdPckSfuoH8VSG6ZCOrj+lYRcqH8lcqQ37MWnZYvnudPhjbSFm3UMUDloOZC
	tr8gLNMN0ekbL5XnZcFnhKh/qsFftff3LQ4ML/3I8yMSJH+TA/Lrx+/+sBlCXOxb0rk2
	Xm4BJqWHIZc2i87bumuamEVU2lV9WxmeRo7Vq20dNWt6jEJLaQpbdMVMbQh5KDZvSZrM
	3+djtFycBkOBRt5sz9Vz314C05yLVFfb8LEICcjliGUhilxBZERsBeZ3Ajfv1EGoPyfL
	+lKg==
X-Gm-Message-State: AOAM533quqFZJfOvTT/pSfAzRvcMMt4YPfFiErCceE6ZCuZawbqXKQjn
	dy48V+lX9/0fAe5HHS0K6iAWqRKkWExCDQkC/tOytvAPk1hzmQ==
X-Google-Smtp-Source: ABdhPJykNu9gHIXgvNeKDrNnMf4s6Nq5XAHPqApXWuAxQlBj6jbNkpcRb+lrPyt4KcDROojTxAjeMxqlJsnWEQbaIRE=
X-Received: by 2002:a17:906:af41:: with SMTP id
	ly1mr559483ejb.525.1613094547985; 
	Thu, 11 Feb 2021 17:49:07 -0800 (PST)
MIME-Version: 1.0
References: <CAKz+TUvuOh849j=CaM=OjH1dwbr0bocM6_gdGO-i-wA2-bkr5g@mail.gmail.com>
	<2316118.jE0xQCEvom@x2>
	<CAKz+TUt3ECMNcbbUziVfeCuhy42R19Z+bi8R+Pj38Lee=pZhUA@mail.gmail.com>
	<1818319.taCxCBeP46@x2>
In-Reply-To: <1818319.taCxCBeP46@x2>
From: Alan Evangelista <alan.vitor@gmail.com>
Date: Thu, 11 Feb 2021 22:48:57 -0300
Message-ID: <CAKz+TUtuZWWd_xB3qA0Ha_yBHA0BPEZ6REeX22wromGnDAHo_Q@mail.gmail.com>
Subject: Re: Samba and AuditD
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 16 Feb 2021 13:11:57 -0500
Cc: linux-audit@redhat.com
X-BeenThere: linux-audit@listman.redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.listman.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@listman.redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@listman.redhat.com>
List-Help: <mailto:linux-audit-request@listman.redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@listman.redhat.com?subject=subscribe>
Sender: linux-audit-bounces@listman.redhat.com
Errors-To: linux-audit-bounces@listman.redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Type: multipart/mixed; boundary="===============7092895515323158249=="

--===============7092895515323158249==
Content-Type: multipart/alternative; boundary="00000000000085994b05bb19d78d"

--00000000000085994b05bb19d78d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

First, thanks for the feedback!

AV> I thought that any filesystem operation requested by a user in Windows
    > would necessarily be executed by some user in Linux in the end (...)
    > Is that assumption incorrect?

SG> Maybe. It depends on the implementation. If its all in the kernel, then
probably not.

AFAIK the Samba daemon in Linux just 1) listens to Windows file requests,
2) forwards them to the kernel via syscalls and 3) sends the file operation=
s
return codes back to Windows. There is no user-space filesystem
implementation
as in FUSE.

SG> if you can strace the daemon and see it accessing the file system
with the sycalls you expect, then the kernel's audit engine can capture the
access but won't know who to attribute it to.

If I strace the Samba daemon processes, I see the open syscalls called when
I create dummy files in the Windows network drive that is mapped to the
Linux
directory via Samba. I still don't understand why the kernel's audit engine
doesn't
know who to attribute the access to. Doesn't it have access to the files'
owner
Linux user ?

For instance, after creating two dummy files, I have this in the Linux
directory
served by Samba:

$ ls /data -lah
total 8.0K
drwxrwxrwx   2 root         root          48 Feb 11 20:08 .
dr-xr-xr-x. 21 root         root        4.0K Jan 27 10:32 ..
-rwxrwxr-x+  1 aevangelista domainusers    0 Feb 11 20:07 alantest1.txt
-rw-r--r--   1 aevangelista domainusers    0 Feb 11 20:08 alantest2.txt

Shouldn't auditd be able to see that aevangelista is the Linux user ID
related to the open syscall and log it ? Sorry if I'm missing something
obvious.

Thanks again in advance!

--00000000000085994b05bb19d78d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>First, thanks for the feedback!</div><div><br></div><=
div>AV&gt; I thought that any filesystem operation requested by a user in W=
indows<br>=C2=A0 =C2=A0 &gt; would necessarily be executed by some user in =
Linux in the end (...)</div><div>=C2=A0 =C2=A0 &gt; Is that assumption inco=
rrect?<br></div><div><br></div><div>SG&gt; Maybe. It depends on the impleme=
ntation. If its all in the kernel, then <br>
probably not.<br></div><div><br></div><div>AFAIK the Samba daemon in Linux =
just 1) listens to Windows file requests,=C2=A0</div><div>2) forwards them =
to the kernel via syscalls and 3) sends the file operations</div><div>retur=
n codes back to Windows. There is no user-space filesystem implementation</=
div><div>as in FUSE.</div><div><br></div><div>SG&gt; if you can strace the =
daemon and see it accessing the file system <br>
with the sycalls you expect, then the kernel&#39;s audit engine can capture=
 the <br>
access but won&#39;t know who to attribute it to.<br></div><div><br></div><=
div>If I strace the Samba daemon processes, I see the open syscalls called =
when</div><div>I create dummy files in the Windows network drive that is ma=
pped to the Linux</div><div>directory via Samba. I still don&#39;t understa=
nd why the kernel&#39;s audit engine doesn&#39;t</div><div>know who to attr=
ibute the access to. Doesn&#39;t it have access to the files&#39; owner=C2=
=A0</div><div>Linux user ?</div><div><br></div><div>For instance, after cre=
ating two dummy files, I have this in the Linux directory=C2=A0</div><div>s=
erved by Samba:</div><div><br></div><div>$ ls /data -lah<br>total 8.0K<br>d=
rwxrwxrwx =C2=A0 2 root =C2=A0 =C2=A0 =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A048 Feb 11 20:08 .<br>dr-xr-xr-x. 21 root =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A04.0K Jan 27 10:32 ..<br>-rwxrwxr=
-x+ =C2=A01 aevangelista domainusers =C2=A0 =C2=A00 Feb 11 20:07 alantest1.=
txt<br>-rw-r--r-- =C2=A0 1 aevangelista domainusers =C2=A0 =C2=A00 Feb 11 2=
0:08 alantest2.txt<br></div><div><br></div><div>Shouldn&#39;t=C2=A0auditd b=
e able to see that aevangelista is the Linux user ID=C2=A0</div><div>relate=
d to the open syscall and log it ? Sorry if I&#39;m missing something</div>=
<div>obvious.</div><div><br></div><div>Thanks again in advance!</div></div>

--00000000000085994b05bb19d78d--

--===============7092895515323158249==
Content-Type: text/plain; charset=WINDOWS-1252
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@listman.redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit
--===============7092895515323158249==--


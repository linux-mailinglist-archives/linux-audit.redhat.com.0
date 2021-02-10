Return-Path: <linux-audit-bounces@listman.redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by mail.lfdr.de (Postfix) with ESMTP id 9C89231CFEB
	for <lists+linux-audit@lfdr.de>; Tue, 16 Feb 2021 19:12:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-xLJpV0v8Nr-z8xEIi4s4Yg-1; Tue, 16 Feb 2021 13:12:49 -0500
X-MC-Unique: xLJpV0v8Nr-z8xEIi4s4Yg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D680801FD8;
	Tue, 16 Feb 2021 18:12:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3656D19D9F;
	Tue, 16 Feb 2021 18:12:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCFB058074;
	Tue, 16 Feb 2021 18:12:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11ANvmRH003742 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 10 Feb 2021 18:57:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 62F91AE7C4; Wed, 10 Feb 2021 23:57:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D791176DC
	for <linux-audit@redhat.com>; Wed, 10 Feb 2021 23:57:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F39FC800BFF
	for <linux-audit@redhat.com>; Wed, 10 Feb 2021 23:57:45 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
	[209.85.218.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-536-OiDRjW5jOByxRr0sWMG5rQ-1; Wed, 10 Feb 2021 18:57:40 -0500
X-MC-Unique: OiDRjW5jOByxRr0sWMG5rQ-1
Received: by mail-ej1-f52.google.com with SMTP id a9so7274323ejr.2;
	Wed, 10 Feb 2021 15:57:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=v05jRh0gwPSTkpMB0ZqVmjiFDcjlfiMsBGWe0YwDug8=;
	b=M+cwVeGzTqZH0gSHdMWpotrhUe1jLzEtFquI/m/W1aYa3B/mU0rvZdBD1K3GBTbUjK
	VTMhyni3OWYuUhRJZT3v7KgkymnRlv0HW+pqmBIUSfLiK2JeZ9dEix5lC8J8NaBSamLi
	ohdsHZ5HDDVjjM7lYCMTIbUEDIX1J9vVx05b/OO2c62ZpElt8zwNoD1jF2TqgoeAtQe2
	92jphtFI352tkHOBCNukSA1RlTsdSsqvc0tW9c9eMdt5yMoKVQqarSBH2+EkDtWArsoJ
	qbHMlkgrWN0IJjVJcW0dQO4PT833rrF922G+IZnd85lGz6QVpH2sYkkGvl5jbNkCkDW+
	6z4w==
X-Gm-Message-State: AOAM533FaYjvnrzcyThQEthixUzBUjPJwigvZm/iNsVUb+goWtir0lam
	Y4TO+SO/X3OHDzymrC8iB1e3tyzYp2F6oQBWHAH8gfLRmDEZQQ==
X-Google-Smtp-Source: ABdhPJxdh0JOZhstMHe0eIbQ62WePNUIPON4V3PN0AcyY2yzZSa/FQbaftayGkEQuSpif0yzjOqEVRqSp8+ZpDRcXsg=
X-Received: by 2002:a17:906:af41:: with SMTP id
	ly1mr5237020ejb.525.1613001459327; 
	Wed, 10 Feb 2021 15:57:39 -0800 (PST)
MIME-Version: 1.0
References: <CAKz+TUvuOh849j=CaM=OjH1dwbr0bocM6_gdGO-i-wA2-bkr5g@mail.gmail.com>
	<2316118.jE0xQCEvom@x2>
In-Reply-To: <2316118.jE0xQCEvom@x2>
From: Alan Evangelista <alan.vitor@gmail.com>
Date: Wed, 10 Feb 2021 20:57:28 -0300
Message-ID: <CAKz+TUt3ECMNcbbUziVfeCuhy42R19Z+bi8R+Pj38Lee=pZhUA@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Type: multipart/mixed; boundary="===============4155134118743651847=="

--===============4155134118743651847==
Content-Type: multipart/alternative; boundary="00000000000001697a05bb042bbb"

--00000000000001697a05bb042bbb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

SG>  The Linux kernel has no idea who the user is in the
Windows machine since they're not really logged in. This applies to all
remote files systems.

I thought that any filesystem operation requested by a user in Windows
would necessarily be executed by some user in Linux in the end (either a
generic user such as samba or, in my specific case, the Linux user which is
mapped to the MS Active Directory user by Centrify). After all, the
filesystem is managed by Linux. Is that assumption incorrect?

On Wed, Feb 10, 2021 at 6:26 PM Steve Grubb <sgrubb@redhat.com> wrote:

> Hello,
>
> Moderator system is acting up. But it'll go through eventually.
>
> On Wednesday, February 10, 2021 3:41:45 PM EST Alan Evangelista wrote:
> > I have installed audit 2.8.5 on a CentOS 7 and set up the following rul=
e
> in
> > /etc/audit/rules.d/audit.rules:
> >
> > -w /data
> >
> > /data is shared via Samba to a Windows Server 2016 system. If I write t=
o
> > /data in the CentOS7 system, I get the open syscall event in the auditd
> > log. If I write to the same directory in the Windows Server 2016, I see
> the
> > file in the /data directory in the CentOS7 system, but the event is not
> > logged by audit. Is that the expected behavior?
>
> Unfortunately, yes. The Linux kernel has no idea who the user is in the
> Windows machine since they're not really logged in. This applies to all
> remote files systems. They may yield a few events, but that is more by
> accident than design.
>
> -Steve
>
>
>
>

--00000000000001697a05bb042bbb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">SG&gt;=C2=A0=C2=A0The Linux kernel has no idea who the use=
r is in the<br>Windows machine since they&#39;re not really logged in. This=
 applies to all<br>remote files systems.=C2=A0<div><br></div><div>I thought=
 that any filesystem operation requested by a user in Windows would necessa=
rily be executed by some user in Linux in the end (either a generic user su=
ch as samba or, in my specific case, the Linux user which is mapped to the =
MS Active Directory user by Centrify). After all, the filesystem is managed=
 by Linux. Is that assumption incorrect?</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 10, 2021 at 6:26 =
PM Steve Grubb &lt;<a href=3D"mailto:sgrubb@redhat.com">sgrubb@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">He=
llo,<br>
<br>
Moderator system is acting up. But it&#39;ll go through eventually.<br>
<br>
On Wednesday, February 10, 2021 3:41:45 PM EST Alan Evangelista wrote:<br>
&gt; I have installed audit 2.8.5 on a CentOS 7 and set up the following ru=
le in<br>
&gt; /etc/audit/rules.d/audit.rules:<br>
&gt; <br>
&gt; -w /data<br>
&gt; <br>
&gt; /data is shared via Samba to a Windows Server 2016 system. If I write =
to<br>
&gt; /data in the CentOS7 system, I get the open syscall event in the audit=
d<br>
&gt; log. If I write to the same directory in the Windows Server 2016, I se=
e the<br>
&gt; file in the /data directory in the CentOS7 system, but the event is no=
t<br>
&gt; logged by audit. Is that the expected behavior?<br>
<br>
Unfortunately, yes. The Linux kernel has no idea who the user is in the <br=
>
Windows machine since they&#39;re not really logged in. This applies to all=
 <br>
remote files systems. They may yield a few events, but that is more by <br>
accident than design.<br>
<br>
-Steve<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000001697a05bb042bbb--

--===============4155134118743651847==
Content-Type: text/plain; charset=WINDOWS-1252
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@listman.redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit
--===============4155134118743651847==--


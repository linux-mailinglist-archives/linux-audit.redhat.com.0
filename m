Return-Path: <linux-audit-bounces@listman.redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by mail.lfdr.de (Postfix) with ESMTP id 648EE31D04A
	for <lists+linux-audit@lfdr.de>; Tue, 16 Feb 2021 19:35:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613500550;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a66bmuZ7RBTeqbp1M+KHua+82B8dqPg0abjmiTJPNtQ=;
	b=cO+tSewYKcz0qF5x7161MA9oXz4uEJxoAMIef+AgTTwULz4HK4Nv0kASVhsptkQb+/wpmg
	2u04NIzWhQOJ6H524Kd8jyTwO8Ywx3utLwrbidsuDwy/uHLuTMkjYTGmWBxfNuJKc1Wwry
	/ACQjMOND8KI4DLjbJhPHPf6dhRc5T8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-KAftVCwKNROo-Nql1gUUlg-1; Tue, 16 Feb 2021 13:35:45 -0500
X-MC-Unique: KAftVCwKNROo-Nql1gUUlg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEB8A192D785;
	Tue, 16 Feb 2021 18:35:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 320055D9D3;
	Tue, 16 Feb 2021 18:35:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE6FF58074;
	Tue, 16 Feb 2021 18:35:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11GIZFqs020840 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 13:35:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 27DEE10021AA; Tue, 16 Feb 2021 18:35:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-192.rdu2.redhat.com [10.10.113.192])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F10A110016DB;
	Tue, 16 Feb 2021 18:35:11 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Alan Evangelista <alan.vitor@gmail.com>
Subject: Re: Samba and AuditD
Date: Tue, 16 Feb 2021 13:35:11 -0500
Message-ID: <2761903.e9J7NaK4W3@x2>
Organization: Red Hat
In-Reply-To: <CAKz+TUtuZWWd_xB3qA0Ha_yBHA0BPEZ6REeX22wromGnDAHo_Q@mail.gmail.com>
References: <CAKz+TUvuOh849j=CaM=OjH1dwbr0bocM6_gdGO-i-wA2-bkr5g@mail.gmail.com>
	<1818319.taCxCBeP46@x2>
	<CAKz+TUtuZWWd_xB3qA0Ha_yBHA0BPEZ6REeX22wromGnDAHo_Q@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hello,

Moderation system finally works. All messages / membership requests are=20
approved.

On Thursday, February 11, 2021 8:48:57 PM EST Alan Evangelista wrote:
> AV> I thought that any filesystem operation requested by a user in Window=
s
>=20
>     > would necessarily be executed by some user in Linux in the end (...=
)
>     > Is that assumption incorrect?
>=20
> SG> Maybe. It depends on the implementation. If its all in the kernel, th=
en
> probably not.
>=20
> AFAIK the Samba daemon in Linux just 1) listens to Windows file requests,
> 2) forwards them to the kernel via syscalls and 3) sends the file
> operations return codes back to Windows. There is no user-space filesyste=
m
> implementation
> as in FUSE.
>=20
> SG> if you can strace the daemon and see it accessing the file system
> with the sycalls you expect, then the kernel's audit engine can capture t=
he
> access but won't know who to attribute it to.
>=20
> If I strace the Samba daemon processes, I see the open syscalls called wh=
en
> I create dummy files in the Windows network drive that is mapped to the
> Linux directory via Samba. I still don't understand why the kernel's audi=
t
> engine doesn't know who to attribute the access to. Doesn't it have acces=
s
> to the files' owner Linux user ?

Since Samba is accessing the file, it sees Samba's loginuid. It pulls this=
=20
from the task struct when the open occurs. The loginuid is set by pam durin=
g=20
authentication. Since the Samba process is started by systemd, it doesn't g=
o=20
through any kind of authentication and therefore has the default -1 loginui=
d.=20
The audit rules are generally written to avoid logging any daemon activity=
=20
since that is not as interesting. What users do is more interesting.

> For instance, after creating two dummy files, I have this in the Linux
> directory served by Samba:
>=20
> $ ls /data -lah
> total 8.0K
> drwxrwxrwx   2 root         root          48 Feb 11 20:08 .
> dr-xr-xr-x. 21 root         root        4.0K Jan 27 10:32 ..
> -rwxrwxr-x+  1 aevangelista domainusers    0 Feb 11 20:07 alantest1.txt
> -rw-r--r--   1 aevangelista domainusers    0 Feb 11 20:08 alantest2.txt
>=20
> Shouldn't auditd be able to see that aevangelista is the Linux user ID
> related to the open syscall and log it ? Sorry if I'm missing something
> obvious.

When it logs a PATH record, you will get the ownership and mode information=
=20
in that record. However, it is likely not triggering any rule because audit=
=20
rules that are shipped generally avoid daemons.

If your rule was:
-a always,exit -F dir=3D/data -F perm=3Dwra -F key=3DSamba-access

Then you should get every read or write in the /data dirctory.

Best Regards,
-Steve



--
Linux-audit mailing list
Linux-audit@listman.redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


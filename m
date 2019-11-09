Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9E755F5E59
	for <lists+linux-audit@lfdr.de>; Sat,  9 Nov 2019 11:09:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573294143;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vKK8eos8FkdoqYOqe4y6itZwUm8GEEDFJdmKGXw2OEY=;
	b=ecOCHCDVYbu8SMSS4hgG9zsDRC9kJ66tqDN7+4XO3Zl3sIubCHHUoCRCHO7As0R92YxwKy
	gl+jqLPSnCS6qxTrGJE4PrMZ0+iZHd2yj0sCCFLdZM/BXRVb+rAgj6RNai5hvi4uYmehbA
	Ysn1H0steb+DSXBp65ULLEei+vIWZ/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-CldZIzUmMYKf_4w9DVtusg-1; Sat, 09 Nov 2019 05:09:01 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8FA5800C72;
	Sat,  9 Nov 2019 10:08:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB6F01001281;
	Sat,  9 Nov 2019 10:08:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D94D61808878;
	Sat,  9 Nov 2019 10:08:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA9A8inS016703 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 9 Nov 2019 05:08:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 889C460BF7; Sat,  9 Nov 2019 10:08:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from ivy-bridge (ovpn-116-42.ams2.redhat.com [10.36.116.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 276AA60BE2;
	Sat,  9 Nov 2019 10:08:41 +0000 (UTC)
Date: Sat, 9 Nov 2019 11:08:41 +0100
From: Steve Grubb <sgrubb@redhat.com>
To: Lenny Bruzenak <lenny@magitekltd.com>
Subject: Re: Not seeing access denied audit messages in restricted
	subdirectories
Message-ID: <20191109110841.7760c408@ivy-bridge>
In-Reply-To: <4f152216-63dc-4785-d878-fc57f48217f0@magitekltd.com>
References: <OF3C0EFCFA.EE160C73-ON002584AC.006EBA93-072584AC.0071860C@notes.na.collabserv.com>
	<20191108223905.773a79d3@ivy-bridge>
	<4f152216-63dc-4785-d878-fc57f48217f0@magitekltd.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: CldZIzUmMYKf_4w9DVtusg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Sat, 9 Nov 2019 20:18:45 +1100
Lenny Bruzenak <lenny@magitekltd.com> wrote:
> On 11/9/19 8:39 AM, Steve Grubb wrote:
>=20
> > On Fri, 8 Nov 2019 13:39:58 -0700
> > "John T Olson" <jtolson@us.ibm.com> wrote:
> > =20
> >> Greetings,
> >>
> >> I have the following 2 audit rules set up:
> >>
> >> -a always,exit -F arch=3Db64 -S all -F exit=3D-EACCES -F dir=3D/gpfs/f=
s1
> >> -a always,exit -F arch=3Db64 -S all -F exit=3D-EPERM -F dir=3D/gpfs/fs=
1
> >>
> >> I have a directory structure like the following:
> >>
> >> (13:15:26) zippleback-vm1:~ # ls -la /gpfs/fs1/test/
> >> total 257
> >> drwx------.  3 root root   4096 Nov  7 12:46 .
> >> drwxr-xr-x. 15 root root 262144 Nov  7 12:50 ..
> >> drwx------.  2 root root   4096 Nov  7 12:46 test2
> >>
> >> Essentially, directory "/gpfs/fs1/test/" is owned by root and has
> >> permissions 700.  The subdirectory underneath it (with
> >> path /gpfs/fs1/test/test2) is also owned by root and has
> >> permissions 700.
> >>
> >> When I have a non-root user attempt to list the contents of
> >> directory "/gpfs/fs1/test/" I receive an audit message for the
> >> denied access. However, when the non-root user attempts to list
> >> the contents of the subdirectory (/gpfs/fs1/test/test2), there is
> >> no audit message generated. Does anyone know why this is and how I
> >> get audit messages in both cases? =20
> > Yes, the reason is because the path did not resolve so audit never
> > saw it. This has been this way for quite some time. In the past, it
> > was said because the path never resolved, a PATH record with all
> > attributes could not be generated. I have mentioned to kernel
> > maintainers, that the path is available as a syscall argument.
> > While a full PATH record cannot be generated with file attributes,
> > an abbreviated one could be generated. So, far...no one has saw
> > this as a big enough problem to fix. Personally, I think it should
> > be fixed.=20
> At first blush, I completely agree. However, I'm wondering if the
> first attempt completely failed, how would the second one even have
> the knowledge of the unattainable path?

Because it was an argument to the syscall. For example, if its the open
syscall, then arg0 points to the path. You cannot create a completed
PATH record because you have no device, inode, or mode. But you do have
the attempted path.


> In the real world if the first one failed (in this example
> /gpfs/fs1/test), because although the parent directory would list the
> test directory, it is not reachable. But the listing of that one
> would not happen at all (/gpfs/fs1/test/test2), because the non-root
> user had no access to the listing dir (/gpfs/fs1/test). The caller
> would have had to gain knowledge of its existence through other means.
>=20
> I wonder if even acknowledging its existence via a "denied access"
> event would be slightly counter-productive? The abbreviated PATH
> would be nice, and since it is there, sure, why not? Then, if all
> calls either to non-existent or say access-denied paths looked the
> same, then that would be fine I think. I would not be as happy if one
> could sniff out inaccessible directories (as opposed to non-existent)
> from audited events though.

Only sysadmins have access to the audit trail. And I think you can
sniff out inaccessible directories with a little shell or python
scripting as a non-admin user. Of course doing so should cause some
metric to spike.

-Steve

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


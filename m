Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 701E9F69E9
	for <lists+linux-audit@lfdr.de>; Sun, 10 Nov 2019 16:51:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573401066;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UZN1WV4kkRX/NZVEr8pCUotudT7OKaOxq5grGDEAc3k=;
	b=bt2A7JyAvsr//UyYfs/58hA0nS66Lhnn5sXaxGY4oJ5TGyrHw/yTDJkzizrTTBMjkdXsiP
	NbAt8ITs92txJuVK90oIQBFtACo3kUTtCQi86vO7VDS0I4gKXQoy0SIh5SeOYsxgKjUb3g
	+z11dLtcT6U52Fq/NDwweKVgp17o49g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-HsLMGVZlOAu1ct4L8vlF-g-1; Sun, 10 Nov 2019 10:51:00 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 030D3180496F;
	Sun, 10 Nov 2019 15:50:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71585608BB;
	Sun, 10 Nov 2019 15:50:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 283A64BB65;
	Sun, 10 Nov 2019 15:50:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAAFoFBT017823 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 10 Nov 2019 10:50:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8763D5D6D8; Sun, 10 Nov 2019 15:50:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from ivy-bridge (ovpn-204-48.brq.redhat.com [10.40.204.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B0405D6D2;
	Sun, 10 Nov 2019 15:50:09 +0000 (UTC)
Date: Sun, 10 Nov 2019 16:48:02 +0100
From: Steve Grubb <sgrubb@redhat.com>
To: "John T Olson" <jtolson@us.ibm.com>
Subject: Re: Not seeing access denied audit messages in restricted
	subdirectories
Message-ID: <20191110164802.456804a5@ivy-bridge>
In-Reply-To: <OF2EB856B2.9F56FBC0-ON002584AE.001B1E42-072584AE.001B5554@notes.na.collabserv.com>
References: <OF3C0EFCFA.EE160C73-ON002584AC.006EBA93-072584AC.0071860C@notes.na.collabserv.com>
	<20191108223905.773a79d3@ivy-bridge>
	<4f152216-63dc-4785-d878-fc57f48217f0@magitekltd.com>
	<20191109110841.7760c408@ivy-bridge>
	<OF2EB856B2.9F56FBC0-ON002584AE.001B1E42-072584AE.001B5554@notes.na.collabserv.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: HsLMGVZlOAu1ct4L8vlF-g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, 9 Nov 2019 21:58:33 -0700
"John T Olson" <jtolson@us.ibm.com> wrote:
> If I were to officially request this type of functionality from the
> kernel team (throw an event even without a valid path), how would I
> do that?

Just file an issue here:
https://github.com/linux-audit/audit-kernel/issues

-Steve


> From:=09Steve Grubb <sgrubb@redhat.com>
> To:=09Lenny Bruzenak <lenny@magitekltd.com>
> Cc:=09linux-audit@redhat.com
> Date:=0911/09/2019 03:09 AM
> Subject:=09[EXTERNAL] Re: Not seeing access denied audit
> messages in restricted=09subdirectories
> Sent by:=09linux-audit-bounces@redhat.com
>=20
>=20
>=20
> On Sat, 9 Nov 2019 20:18:45 +1100
> Lenny Bruzenak <lenny@magitekltd.com> wrote:
> > On 11/9/19 8:39 AM, Steve Grubb wrote:
> > =20
> > > On Fri, 8 Nov 2019 13:39:58 -0700
> > > "John T Olson" <jtolson@us.ibm.com> wrote:
> > > =20
> > >> Greetings,
> > >>
> > >> I have the following 2 audit rules set up:
> > >>
> > >> -a always,exit -F arch=3Db64 -S all -F exit=3D-EACCES -F
> > >> dir=3D/gpfs/fs1 -a always,exit -F arch=3Db64 -S all -F exit=3D-EPERM
> > >> -F dir=3D/gpfs/fs1
> > >>
> > >> I have a directory structure like the following:
> > >>
> > >> (13:15:26) zippleback-vm1:~ # ls -la /gpfs/fs1/test/
> > >> total 257
> > >> drwx------.  3 root root   4096 Nov  7 12:46 .
> > >> drwxr-xr-x. 15 root root 262144 Nov  7 12:50 ..
> > >> drwx------.  2 root root   4096 Nov  7 12:46 test2
> > >>
> > >> Essentially, directory "/gpfs/fs1/test/" is owned by root and has
> > >> permissions 700.  The subdirectory underneath it (with
> > >> path /gpfs/fs1/test/test2) is also owned by root and has
> > >> permissions 700.
> > >>
> > >> When I have a non-root user attempt to list the contents of
> > >> directory "/gpfs/fs1/test/" I receive an audit message for the
> > >> denied access. However, when the non-root user attempts to list
> > >> the contents of the subdirectory (/gpfs/fs1/test/test2), there is
> > >> no audit message generated. Does anyone know why this is and how
> > >> I get audit messages in both cases? =20
> > > Yes, the reason is because the path did not resolve so audit never
> > > saw it. This has been this way for quite some time. In the past,
> > > it was said because the path never resolved, a PATH record with
> > > all attributes could not be generated. I have mentioned to kernel
> > > maintainers, that the path is available as a syscall argument.
> > > While a full PATH record cannot be generated with file attributes,
> > > an abbreviated one could be generated. So, far...no one has saw
> > > this as a big enough problem to fix. Personally, I think it should
> > > be fixed. =20
> > At first blush, I completely agree. However, I'm wondering if the
> > first attempt completely failed, how would the second one even have
> > the knowledge of the unattainable path? =20
>=20
> Because it was an argument to the syscall. For example, if its the
> open syscall, then arg0 points to the path. You cannot create a
> completed PATH record because you have no device, inode, or mode. But
> you do have the attempted path.
>=20
>=20
> > In the real world if the first one failed (in this example
> > /gpfs/fs1/test), because although the parent directory would list
> > the test directory, it is not reachable. But the listing of that one
> > would not happen at all (/gpfs/fs1/test/test2), because the non-root
> > user had no access to the listing dir (/gpfs/fs1/test). The caller
> > would have had to gain knowledge of its existence through other
> > means.
> >
> > I wonder if even acknowledging its existence via a "denied access"
> > event would be slightly counter-productive? The abbreviated PATH
> > would be nice, and since it is there, sure, why not? Then, if all
> > calls either to non-existent or say access-denied paths looked the
> > same, then that would be fine I think. I would not be as happy if
> > one could sniff out inaccessible directories (as opposed to
> > non-existent) from audited events though. =20
>=20
> Only sysadmins have access to the audit trail. And I think you can
> sniff out inaccessible directories with a little shell or python
> scripting as a non-admin user. Of course doing so should cause some
> metric to spike.
>=20
> -Steve
>=20
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.redhat.com_mai=
lman_listinfo_linux-2Daudit&d=3DDwIF-g&c=3Djf_iaSHvJObTbx-siA1ZOg&r=3DzKt0O=
VPVj1IsYJ426vWytEm0W7ykoz5eLpKx1CRdg7g&m=3DuRWgnhi1IOG1-E_ehlnHOOsz0K6gqvbF=
ZqAC4_Ehqdc&s=3DI6e27HAAnCtaHVdDbyeoAZVog0bJDsoIjeAYljnyH-U&e=3D
>=20
>=20
>=20
>=20
>=20

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


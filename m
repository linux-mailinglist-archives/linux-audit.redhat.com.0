Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EC55A2D9249
	for <lists+linux-audit@lfdr.de>; Mon, 14 Dec 2020 05:35:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607920508;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hp70pDMRXPtEbIOqR43RfoGq196dGAa4Ht54mSCZENs=;
	b=A5BHKCdKRoP07XoJI0//fszxQHGBWB4iSgGfv58pK4RZHAm3adevGbp16P2AoYmWMLJylx
	7nYIfsjuNsxvqv22OQYd8KHaLAj2RJB19ba2dNSFixyNz70oDOiXC9HiHP5T4ODIs49NOX
	D54bXhS8FnxIRWwYVi4RH48TAnSoKcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-7UfXBj_iOLefXvB8wMVbMA-1; Sun, 13 Dec 2020 23:35:06 -0500
X-MC-Unique: 7UfXBj_iOLefXvB8wMVbMA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74D9A107ACF5;
	Mon, 14 Dec 2020 04:34:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DE877095C;
	Mon, 14 Dec 2020 04:34:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FA9C4BB40;
	Mon, 14 Dec 2020 04:34:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BE4YVgO028264 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 13 Dec 2020 23:34:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3BB7B60BFA; Mon, 14 Dec 2020 04:34:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-112.rdu2.redhat.com [10.10.113.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6A5C60BE2;
	Mon, 14 Dec 2020 04:34:27 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>,
	"Tia, Javier" <javier.tia@hpe.com>
Subject: Re: [PATCH] Fix audispd crash on ARM 32-Bits
Date: Sun, 13 Dec 2020 23:34:26 -0500
Message-ID: <1770439.tdWV9SEqCh@x2>
Organization: Red Hat
In-Reply-To: <f1c0ffd0-fbe0-5233-33e8-059a141ab55b@hpe.com>
References: <20201212021050.26656-1-javier.tia@hpe.com>
	<11696239.O9o76ZdvQC@x2>
	<f1c0ffd0-fbe0-5233-33e8-059a141ab55b@hpe.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BE4YVgO028264
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Saturday, December 12, 2020 3:21:25 PM EST Tia, Javier wrote:
> Thank you for your prompt response and for pointing to a solution.
>=20
> Yes, this patch it's applied to audit v2.4.3. It's an embedded device,=20
> and at the moment, we're unable to upgrade the audit to a higher audit=20
> version.

That's a shame. But if you have a reproducer, it might be worth seeing if i=
ts=20
fixed in 2.8.5 and bisecting back to find the official patch if it were fix=
ed.
=20
> If audit v2.4.y were still maintainable,=20

It's not

> would you accept this patch for audit v2.4.y?

That depends. You are zeroing out the path and then setting it to NULL.=20
Setting the pointer to NULL should be enough. If not, setting the first byt=
e=20
to 0 should wipe out the whole string for any string function. But usually=
=20
this kind of fixup is because it gets used again somewhere by accident. Tha=
t=20
would be a plugin lifecycle issue and would be the root cause. The plugin=
=20
lifecycle was reworked sometime after the release you have.

So, my guess (and it's pure speculation without a reproducer) is this cover=
s=20
up whatever problem you are seeing. But there may be a deeper issue about a=
=20
plugin not being fully decommissioned. It's a long way to say, I'd look=20
deeper as to how this goes wrong.

-Steve

>=20
> -Javier
>=20
> On 12/12/20 1:45 PM, Steve Grubb wrote:
>=20
> > Hello,
> >=20
> > Thanks for the patch. But if its true that this is against audit-2.4.3,
> > then
 there is a good chance this is fixed by 2.8.5. There were a number
> > of fixes in this area that fixed various issues with plugins.
> >=20
> > Best Regards,
> > -Steve
> >=20
> > On Friday, December 11, 2020 9:10:50 PM EST Javier Ti=E1 wrote:
> >=20
> >> On ARM 32-Bits, audispd is crashing. Backtrace:
> >>
> >>
> >>
> >> (gdb) bt
> >> 0  0xb6e20958 in __GI_raise (sig=3Dsig@entry=3D6)
> >>=20
> >>     at
> >>     /usr/src/debug/glibc/2.23-r0/git/sysdeps/unix/sysv/linux/raise.c:5=
4
> >>    =20
> >>=20
> >> 1  0xb6e21e58 in __GI_abort ()
> >>=20
> >>     at /usr/src/debug/glibc/2.23-r0/git/stdlib/abort.c:118
> >>=20
> >> 2  0xb6e59d64 in __libc_message (do_abort=3Ddo_abort@entry=3D2,
> >>=20
> >>     fmt=3D0xb6f1119c "*** Error in `%s': %s: 0x%s ***\n")
> >>     at /usr/src/debug/glibc/2.23-r0/git/sysdeps/posix/libc_fatal.c:175
> >>=20
> >> 3  0xb6e60108 in malloc_printerr (action=3D<optimized out>,
> >>=20
> >>     str=3D0xb6f11354 "double free or corruption (fasttop)",
> >>     ptr=3D<optimized
> >>=20
> >> out>, ar_ptr=3D<optimized out>)
> >>=20
> >>     at /usr/src/debug/glibc/2.23-r0/git/malloc/malloc.c:5007
> >>=20
> >> 4  0xb6e60a98 in _int_free (av=3D0xb6f2d79c <main_arena>, p=3D<optimiz=
ed
> >> out>,
>>=20
> >>     have_lock=3D<optimized out>)
> >>     at /usr/src/debug/glibc/2.23-r0/git/malloc/malloc.c:3868
> >>=20
> >> 5  0x004234b8 in free_pconfig (config=3D0x43b398)
> >>=20
> >>     at
> >>=20
> >> /usr/src/debug/audit/2.4.3-r8/audit-2.4.3/audisp/audispd-pconfig.c:513
> >> 6
> >> 0x00421244 in main (argc=3D<optimized out>, argv=3D<optimized out>) at
> >> /usr/src/debug/audit/2.4.3-r8/audit-2.4.3/audisp/audispd.c:464
> >>
> >>
> >>
> >> (gdb) f 5
> >> (gdb) p config->path
> >> $2 =3D 0x43b5f0 ""
> >> (gdb) p config->name
> >> $3 =3D 0x43b370 "h\264C
> >>
> >>
> >>
> >> Be paranoid and overwrite config->path with zero bytes before doing th=
e
> >> free().
> >> ---
> >>=20
> >>   audisp/audispd-pconfig.c | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >>
> >>
> >> diff --git a/audisp/audispd-pconfig.c b/audisp/audispd-pconfig.c
> >> index a8b7878..a13f681 100644
> >> --- a/audisp/audispd-pconfig.c
> >> +++ b/audisp/audispd-pconfig.c
> >> @@ -510,7 +510,11 @@ void free_pconfig(plugin_conf_t *config)
> >>=20
> >>   =09=09close(config->plug_pipe[0]);
> >>   =09
> >>   =09if (config->plug_pipe[1] >=3D 0)
> >>   =09
> >>   =09=09close(config->plug_pipe[1]);
> >>=20
> >> +=09/* Be paranoid and overwrite config->path with zero bytes before
> >> doing
> >> the +=09 * free() */
> >> +=09memset(config->path, 0, strlen(config->path));
> >>=20
> >>   =09free((void *)config->path);
> >>=20
> >> +=09config->path =3D NULL;
> >>=20
> >>   =09free((void *)config->name);
> >>  =20
> >>   }
> >=20
> >=20
> >=20
> >=20
> >=20





--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


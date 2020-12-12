Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2752D89D1
	for <lists+linux-audit@lfdr.de>; Sat, 12 Dec 2020 20:46:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607802372;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GP8k4sSd3z3fxW6RxH4KzuVOKl4CEBhTQ2PFh6T3rhA=;
	b=Pv21bzR4YKY1o+mzmITUf31GhpQ60QcIM/R+FNWkf4a5S5cx+5Dz7JVH/XBaBQ+S0SGj7n
	R0Pku6htFMcbN8HlISJ4JX6XQ+Bb/hedW3ZFKpPiQEcH4cPERDvqR6UIY8bL7u4skKwtcV
	c3mAuCHM19PAcpUNSHC6jY8T/fPp3Kc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-V6DuRj1TOC-9-v0LoYVfZA-1; Sat, 12 Dec 2020 14:46:09 -0500
X-MC-Unique: V6DuRj1TOC-9-v0LoYVfZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F596800D62;
	Sat, 12 Dec 2020 19:46:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B19B1F466;
	Sat, 12 Dec 2020 19:46:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB5F34BB7B;
	Sat, 12 Dec 2020 19:45:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BCJjpMa007588 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 12 Dec 2020 14:45:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 660531F05A; Sat, 12 Dec 2020 19:45:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-112-155.rdu2.redhat.com [10.10.112.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A387919746;
	Sat, 12 Dec 2020 19:45:46 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: [PATCH] Fix audispd crash on ARM 32-Bits
Date: Sat, 12 Dec 2020 14:45:46 -0500
Message-ID: <11696239.O9o76ZdvQC@x2>
Organization: Red Hat
In-Reply-To: <20201212021050.26656-1-javier.tia@hpe.com>
References: <20201212021050.26656-1-javier.tia@hpe.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BCJjpMa007588
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

Thanks for the patch. But if its true that this is against audit-2.4.3, the=
n=20
there is a good chance this is fixed by 2.8.5. There were a number of fixes=
 in=20
this area that fixed various issues with plugins.

Best Regards,
-Steve

On Friday, December 11, 2020 9:10:50 PM EST Javier Ti=E1 wrote:
> On ARM 32-Bits, audispd is crashing. Backtrace:
>=20
> (gdb) bt
> 0  0xb6e20958 in __GI_raise (sig=3Dsig@entry=3D6)
>    at /usr/src/debug/glibc/2.23-r0/git/sysdeps/unix/sysv/linux/raise.c:54
> 1  0xb6e21e58 in __GI_abort ()
>    at /usr/src/debug/glibc/2.23-r0/git/stdlib/abort.c:118
> 2  0xb6e59d64 in __libc_message (do_abort=3Ddo_abort@entry=3D2,
>    fmt=3D0xb6f1119c "*** Error in `%s': %s: 0x%s ***\n")
>    at /usr/src/debug/glibc/2.23-r0/git/sysdeps/posix/libc_fatal.c:175
> 3  0xb6e60108 in malloc_printerr (action=3D<optimized out>,
>    str=3D0xb6f11354 "double free or corruption (fasttop)", ptr=3D<optimiz=
ed
> out>, ar_ptr=3D<optimized out>)
>    at /usr/src/debug/glibc/2.23-r0/git/malloc/malloc.c:5007
> 4  0xb6e60a98 in _int_free (av=3D0xb6f2d79c <main_arena>, p=3D<optimized =
out>,
>    have_lock=3D<optimized out>)
>    at /usr/src/debug/glibc/2.23-r0/git/malloc/malloc.c:3868
> 5  0x004234b8 in free_pconfig (config=3D0x43b398)
>    at
> /usr/src/debug/audit/2.4.3-r8/audit-2.4.3/audisp/audispd-pconfig.c:513 6=
=20
> 0x00421244 in main (argc=3D<optimized out>, argv=3D<optimized out>) at
> /usr/src/debug/audit/2.4.3-r8/audit-2.4.3/audisp/audispd.c:464
>=20
> (gdb) f 5
> (gdb) p config->path
> $2 =3D 0x43b5f0 ""
> (gdb) p config->name
> $3 =3D 0x43b370 "h\264C
>=20
> Be paranoid and overwrite config->path with zero bytes before doing the
> free().
> ---
>  audisp/audispd-pconfig.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/audisp/audispd-pconfig.c b/audisp/audispd-pconfig.c
> index a8b7878..a13f681 100644
> --- a/audisp/audispd-pconfig.c
> +++ b/audisp/audispd-pconfig.c
> @@ -510,7 +510,11 @@ void free_pconfig(plugin_conf_t *config)
>  =09=09close(config->plug_pipe[0]);
>  =09if (config->plug_pipe[1] >=3D 0)
>  =09=09close(config->plug_pipe[1]);
> +=09/* Be paranoid and overwrite config->path with zero bytes before doin=
g
> the +=09 * free() */
> +=09memset(config->path, 0, strlen(config->path));
>  =09free((void *)config->path);
> +=09config->path =3D NULL;
>  =09free((void *)config->name);
>  }





--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


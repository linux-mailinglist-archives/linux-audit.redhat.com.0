Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 19C492359F7
	for <lists+linux-audit@lfdr.de>; Sun,  2 Aug 2020 20:42:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-2ZkAopHjPeu3m19014q2Mw-1; Sun, 02 Aug 2020 14:42:03 -0400
X-MC-Unique: 2ZkAopHjPeu3m19014q2Mw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A5178064DE;
	Sun,  2 Aug 2020 18:41:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A42B61A888;
	Sun,  2 Aug 2020 18:41:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 717D61809557;
	Sun,  2 Aug 2020 18:41:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 072EVtjD013068 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 2 Aug 2020 10:31:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D8B12029F60; Sun,  2 Aug 2020 14:31:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58A8C2026D67
	for <linux-audit@redhat.com>; Sun,  2 Aug 2020 14:31:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E1E5185A78B
	for <linux-audit@redhat.com>; Sun,  2 Aug 2020 14:31:52 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1596378712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=y+1ctAYM0bbAMopktHLT7ZIs6sUyFxvu1WlRrbMC+1g=;
	b=co1fUlPbFb9PwZv/nkWKUJjTx0VWvxofLni8HJu3k+MZ/UKMkhvN7x/aI4X6Xjm3epjb51
	thb9eve4onWM1x/9es8PqM6gmplnxfCAN8LhkHZOswNBsyH3gn2MgpjJ9vKOrTEnlhXQJM
	JlpjHjARsZNj6p8odVpeStoeP6v0n6O7HWTUFoXv2peVaUgnu9gRoILKePtjIx3Ac4Uyff
	y4j/SdMLil2EWW1wALnSQRoR6zaoWWBMSwkOzbK8I/SseBGmzVrPbinKU/r4poCbBaQbU/
	lcHvDxQv4W4TIHMvC0FcQdAriSt9wvAdhUVKH7ykOGUzm2ZU4i7FT2zBITllPQ==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1596378712; a=rsa-sha256;
	cv=none;
	b=Ct/s5kFQcEw3T8iutPL47uA5ptwhyK6TH/JWzp8nAP/Iz9oZBsvBYvJZq6qph8rDiefurc
	R8jxNPXK90hODVzUZPy3IC73gGZbRhcQSFO3dd/XFZ43g/N7BR3F1Ot7UyklhjSDWY+2Uu
	OWhrfJ5w7llM7js0VBHvgnOpVNiVD/8rK/brI1kdnY+Ci64n9zuckTJJbZULhKoqNS975T
	6yZOFQy8TMzZ8Ty+iABuU6N8lJ2vfX0fT6Z2lLcG2unxIb+5zoHgnfyVgL/KYVZzwwvjrN
	SN6LIH9i+LyDtMrTVKoW7P/qoz3I3fbJzyUTTFmHQhfNLc+JOYyTAIxP23aC7w==
ARC-Authentication-Results: i=1; relay.mimecast.com; dkim=none; dmarc=none;
	spf=none (relay.mimecast.com: domain of pavel@ucw.cz has no SPF policy
	when checking 46.255.230.98) smtp.mailfrom=pavel@ucw.cz
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-59-uAVVl7XZPKW0yas5Fq4LRQ-1; Sun, 02 Aug 2020 10:31:47 -0400
X-MC-Unique: uAVVl7XZPKW0yas5Fq4LRQ-1
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 127351C0BD4; Sun,  2 Aug 2020 16:31:44 +0200 (CEST)
Date: Sun, 2 Aug 2020 16:31:43 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [RFC PATCH v5 00/11] Integrity Policy Enforcement LSM (IPE)
Message-ID: <20200802143143.GB20261@amd>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
MIME-Version: 1.0
In-Reply-To: <20200802140300.GA2975990@sasha-vm>
User-Agent: Mutt/1.5.23 (2014-03-12)
Authentication-Results: relay.mimecast.com; dkim=none; dmarc=none;
	spf=none (relay.mimecast.com: domain of pavel@ucw.cz has no SPF policy
	when checking 46.255.230.98) smtp.mailfrom=pavel@ucw.cz
X-Mimecast-Spam-Score: 0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sun, 02 Aug 2020 14:41:38 -0400
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	zohar@linux.ibm.com, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, agk@redhat.com,
	mdsakib@microsoft.com, jmorris@namei.org,
	nramas@linux.microsoft.com, serge@hallyn.com,
	pasha.tatashin@soleen.com, jannh@google.com,
	linux-block@vger.kernel.org, viro@zeniv.linux.org.uk,
	axboe@kernel.dk, corbet@lwn.net, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com
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
Content-Type: multipart/mixed; boundary="===============1840553164049009894=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

--===============1840553164049009894==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline

--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2020-08-02 10:03:00, Sasha Levin wrote:
> On Sun, Aug 02, 2020 at 01:55:45PM +0200, Pavel Machek wrote:
> >Hi!
> >
> >>IPE is a Linux Security Module which allows for a configurable
> >>policy to enforce integrity requirements on the whole system. It
> >>attempts to solve the issue of Code Integrity: that any code being
> >>executed (or files being read), are identical to the version that
> >>was built by a trusted source.
> >
> >How is that different from security/integrity/ima?
>=20
> Maybe if you would have read the cover letter all the way down to the
> 5th paragraph which explains how IPE is different from IMA we could
> avoided this mail exchange...

"
IPE differs from other LSMs which provide integrity checking (for
instance,
IMA), as it has no dependency on the filesystem metadata itself. The
attributes that IPE checks are deterministic properties that exist
solely
in the kernel. Additionally, IPE provides no additional mechanisms of
verifying these files (e.g. IMA Signatures) - all of the attributes of
verifying files are existing features within the kernel, such as
dm-verity
or fsverity.
"

That is not really helpful.
=09=09=09=09=09=09=09=09=09Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8mzk8ACgkQMOfwapXb+vLIbgCaA3csU541jz7eEPNddFWHs7h3
kiUAn0UO6AiyKqQwqSNgE+2r+SZ3D4bn
=xwpV
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--


--===============1840553164049009894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============1840553164049009894==--


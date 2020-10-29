Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 613F729F10B
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 17:16:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-q0hq6hwFNhqgYlvKJhBxKQ-1; Thu, 29 Oct 2020 12:16:53 -0400
X-MC-Unique: q0hq6hwFNhqgYlvKJhBxKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37F3E1008549;
	Thu, 29 Oct 2020 16:16:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BDB65D9EF;
	Thu, 29 Oct 2020 16:16:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0173181A86E;
	Thu, 29 Oct 2020 16:16:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09TFw1Fb029373 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 29 Oct 2020 11:58:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1A06CE5B10; Thu, 29 Oct 2020 15:58:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1073BE7789
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 15:57:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D0CF858298
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 15:57:58 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1603987077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=HrGrrHXv4HIhAHbipZt2NfTk+oAu6o2ymXLw8HgniDI=;
	b=V+z9fLj6g7NlG2K9Kj9OUj/J360FGK9nnylo7hYUbqgpCGM/xGyB5PnH7h3Db92O5l856O
	Wfy+eXZ3QYx9rA4To0CCZVUhTjD6hgFdRnhlvICuhoFhaQTQDKEIUKNcrb4P+GBm8W4NW4
	LDmQk0WWDnnTOlisOaVJqL+FvTgsJMBMUasPpwecSWdguMi/Axb9KpcE7y1gFE7d/TNi9Y
	RdfFojoA1SSXOiZa2PGMDWYS/Tl1N9786+Chyhxo4GJYRYevkw5FAwudn4Kv23umeGcMOp
	JOFGLgnB8I7B5mcAnVyK0pblVLqx/FBdORyLFKvTVRG2VeHPPuaajVVitdYolA==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1603987077; a=rsa-sha256;
	cv=none;
	b=BxwENgabNsmKvWCIHldiJbkPNdy0McYkVTJcJ5YxmWx5AY34fS4midDvyBLi2YWpU8sZm5
	BoLk/x630gpXHwtEVKzw93mD8SzQ3lOmIxFTsML4u0QJVwxj28sqvSesQactrjJboE7B3Z
	0YaGeg0X23MwQoK0s6KHUtlWLERIyejRkfJpxISyWFxbPhjyIDM0JbQ/MsKghT0opodPRi
	7ICqpxuWNATmqEX/Sxl8paQRJpr5Lr71QsPKb7g8+abYL9o/m70TtrZr6gGMT8w5LJZsl+
	cJYHs+zhBt3QwILOifFCoSme+skv4rQXKr3zLN2WJTAv6nn20cOqQB/GqYMSpw==
ARC-Authentication-Results: i=1; relay.mimecast.com; dkim=none; dmarc=none;
	spf=pass (relay.mimecast.com: domain of cyphar@cyphar.com designates
	80.241.56.161 as permitted sender)
	smtp.mailfrom=cyphar@cyphar.com
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org
	[80.241.56.161]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-409--GG_KFhZOOi3ZdOaVainLg-1; Thu, 29 Oct 2020 11:57:55 -0400
X-MC-Unique: -GG_KFhZOOi3ZdOaVainLg-1
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4CMVLs2MljzQl31;
	Thu, 29 Oct 2020 16:52:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
	[80.241.56.117]) (amavisd-new, port 10030)
	with ESMTP id pzROom4hCQJX; Thu, 29 Oct 2020 16:52:14 +0100 (CET)
Date: Fri, 30 Oct 2020 02:51:48 +1100
From: Aleksa Sarai <cyphar@cyphar.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH 00/34] fs: idmapped mounts
Message-ID: <20201029155148.5odu4j2kt62ahcxq@yavin.dot.cyphar.com>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<87pn51ghju.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
In-Reply-To: <87pn51ghju.fsf@x220.int.ebiederm.org>
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.91 / 15.00 / 15.00
X-Rspamd-Queue-Id: 6627F1700
X-Rspamd-UID: 698b92
Authentication-Results: relay.mimecast.com; dkim=none; dmarc=none;
	spf=pass (relay.mimecast.com: domain of cyphar@cyphar.com designates
	80.241.56.161 as permitted sender)
	smtp.mailfrom=cyphar@cyphar.com
X-Mimecast-Spam-Score: -4
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
X-Mailman-Approved-At: Thu, 29 Oct 2020 12:16:30 -0400
Cc: Phil Estes <estesp@gmail.com>, Lennart Poettering <lennart@poettering.net>,
	Amir Goldstein <amir73il@gmail.com>, Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	containers@lists.linux-foundation.org,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Tycho Andersen <tycho@tycho.ws>, Miklos Szeredi <miklos@szeredi.hu>,
	James Morris <jmorris@namei.org>, smbarber@chromium.org,
	Christoph Hellwig <hch@infradead.org>,
	linux-ext4@vger.kernel.org, Mrunal Patel <mpatel@redhat.com>,
	Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
	Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>, linux-fsdevel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andy Lutomirski <luto@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Geoffrey Thomas <geofft@ldpreload.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John Johansen <john.johansen@canonical.com>, Theodore Tso <tytso@mit.edu>,
	Seth Forshee <seth.forshee@canonical.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-unionfs@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	linux-api@vger.kernel.org, Alban Crequy <alban@kinvolk.io>,
	linux-integrity@vger.kernel.org,
	=?utf-8?B?U3TDqXBoYW5l?= Graber <stgraber@ubuntu.com>,
	Todd Kjos <tkjos@google.com>
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
Content-Type: multipart/mixed; boundary="===============3597147964831381044=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14

--===============3597147964831381044==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kgfxsa7rlwd3wkqj"
Content-Disposition: inline

--kgfxsa7rlwd3wkqj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020-10-29, Eric W. Biederman <ebiederm@xmission.com> wrote:
> Christian Brauner <christian.brauner@ubuntu.com> writes:
>=20
> > Hey everyone,
> >
> > I vanished for a little while to focus on this work here so sorry for
> > not being available by mail for a while.
> >
> > Since quite a long time we have issues with sharing mounts between
> > multiple unprivileged containers with different id mappings, sharing a
> > rootfs between multiple containers with different id mappings, and also
> > sharing regular directories and filesystems between users with differen=
t
> > uids and gids. The latter use-cases have become even more important wit=
h
> > the availability and adoption of systemd-homed (cf. [1]) to implement
> > portable home directories.
>=20
> Can you walk us through the motivating use case?
>=20
> As of this year's LPC I had the distinct impression that the primary use
> case for such a feature was due to the RLIMIT_NPROC problem where two
> containers with the same users still wanted different uid mappings to
> the disk because the users were conflicting with each other because of
> the per user rlimits.
>=20
> Fixing rlimits is straight forward to implement, and easier to manage
> for implementations and administrators.

This is separate to the question of "isolated user namespaces" and
managing different mappings between containers. This patchset is solving
the same problem that shiftfs solved -- sharing a single directory tree
between containers that have different ID mappings. rlimits (nor any of
the other proposals we discussed at LPC) will help with this problem.

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--kgfxsa7rlwd3wkqj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCX5rlEgAKCRCdlLljIbnQ
EjiPAP9KREQ/2yXGdsYwcSMUpeqUj/wV1rG+UIzAlmjRSy5b2gEA+A5+ZdrAKLCh
v+4J3Z/kM0lgTkLGg8Ib1D4QT/HGDQY=
=Bh7P
-----END PGP SIGNATURE-----

--kgfxsa7rlwd3wkqj--


--===============3597147964831381044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============3597147964831381044==--


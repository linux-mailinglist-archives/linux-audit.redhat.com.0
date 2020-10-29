Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6296129EC45
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 13:48:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-3KgkysdPM3KNJOHhh5YYyg-1; Thu, 29 Oct 2020 08:48:56 -0400
X-MC-Unique: 3KgkysdPM3KNJOHhh5YYyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EFCB18B9F78;
	Thu, 29 Oct 2020 12:48:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D4845C22E;
	Thu, 29 Oct 2020 12:48:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1ED595811A;
	Thu, 29 Oct 2020 12:48:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09T7KHDk032449 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 29 Oct 2020 03:20:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70EA52156A49; Thu, 29 Oct 2020 07:20:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A8912156A3D
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 07:20:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31733185A794
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 07:20:14 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-591-VprDjI1gP5mB-JRt0GTFOA-1; Thu, 29 Oct 2020 03:20:11 -0400
X-MC-Unique: VprDjI1gP5mB-JRt0GTFOA-1
Received: by mail-io1-f66.google.com with SMTP id z17so2271908iog.11
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 00:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=fYJuh784A+cg3Z8+1Zy80X4u98CkOOu8oSlOndn6LP8=;
	b=hnnLJW8ZOE1/kqAmdpT8ZxNlFKb2+ZW33LaTFf+O4RpAKIagvxJhCqkylFnMKAHcuG
	yluU1OwhDdnfyy2qbVpNucuPlyXotX/LwFt1FKdDUnAbg0va582TP4iHQpoENm3ZclQY
	B5nTQe5ykUGz6JJND8nRAnjDO3pLKMPejsOh8bbGYFEbVQdyUWGEEYrKdHRDJ8kOz1YG
	FB7wUkatB5qYXR9qCAO/KNId9j4sIwg2yclgHsBGD1oSax72Blt4YDFVpg5Te1FCu+3p
	+NmF6fj5uyn4/eeEU8VWhJ/WMYFeoHQE8GYesMsPsDD5BtssCxS9qvoU20tUzwflAQgC
	Ur4g==
X-Gm-Message-State: AOAM531mPeLt2f6tcd+NqCoS6/yExvdMpgWMHRq5KjOZQV/dEgUIHqxh
	vT50iILrqKFhVX7KBnHYQKYLrA==
X-Google-Smtp-Source: ABdhPJyOF/iJB70V4z6Kj5OehxU+n1aNhIuE8pqzjl3KXVgPoawDTq88ZFqqZglnxTR3mWhjdU4O1Q==
X-Received: by 2002:a6b:c9c9:: with SMTP id z192mr2361774iof.175.1603956010838;
	Thu, 29 Oct 2020 00:20:10 -0700 (PDT)
Received: from ircssh-2.c.rugged-nimbus-611.internal
	(80.60.198.104.bc.googleusercontent.com. [104.198.60.80])
	by smtp.gmail.com with ESMTPSA id k6sm1247023iov.26.2020.10.29.00.20.09
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 29 Oct 2020 00:20:10 -0700 (PDT)
Date: Thu, 29 Oct 2020 07:20:08 +0000
From: Sargun Dhillon <sargun@sargun.me>
To: Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH 00/34] fs: idmapped mounts
Message-ID: <20201029071946.GA29881@ircssh-2.c.rugged-nimbus-611.internal>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
In-Reply-To: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:45:19 -0400
Cc: Andy Lutomirski <luto@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>, Tycho Andersen <tycho@tycho.ws>,
	Miklos Szeredi <miklos@szeredi.hu>, smbarber@chromium.org,
	Christoph Hellwig <hch@infradead.org>,
	linux-ext4@vger.kernel.org, Mrunal Patel <mpatel@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
	selinux@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>,
	Seth Forshee <seth.forshee@canonical.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Lennart Poettering <lennart@poettering.net>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Geoffrey Thomas <geofft@ldpreload.com>,
	David Howells <dhowells@redhat.com>,
	John Johansen <john.johansen@canonical.com>, Theodore Tso <tytso@mit.edu>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	containers@lists.linux-foundation.org,
	Jonathan Corbet <corbet@lwn.net>, linux-unionfs@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Alban Crequy <alban@kinvolk.io>, linux-integrity@vger.kernel.org,
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 01:32:18AM +0100, Christian Brauner wrote:
> Hey everyone,
>=20
> I vanished for a little while to focus on this work here so sorry for
> not being available by mail for a while.
>=20
> Since quite a long time we have issues with sharing mounts between
> multiple unprivileged containers with different id mappings, sharing a
> rootfs between multiple containers with different id mappings, and also
> sharing regular directories and filesystems between users with different
> uids and gids. The latter use-cases have become even more important with
> the availability and adoption of systemd-homed (cf. [1]) to implement
> portable home directories.
>=20
> The solutions we have tried and proposed so far include the introduction
> of fsid mappings, a tiny overlay based filesystem, and an approach to
> call override creds in the vfs. None of these solutions have covered all
> of the above use-cases.
>=20
> The solution proposed here has it's origins in multiple discussions
> during Linux Plumbers 2017 during and after the end of the containers
> microconference.
> To the best of my knowledge this involved Aleksa, St=C3=A9phane, Eric, Da=
vid,
> James, and myself. A variant of the solution proposed here has also been
> discussed, again to the best of my knowledge, after a Linux conference
> in St. Petersburg in Russia between Christoph, Tycho, and myself in 2017
> after Linux Plumbers.
> I've taken the time to finally implement a working version of this
> solution over the last weeks to the best of my abilities. Tycho has
> signed up for this sligthly crazy endeavour as well and he has helped
> with the conversion of the xattr codepaths.
>=20
> The core idea is to make idmappings a property of struct vfsmount
> instead of tying it to a process being inside of a user namespace which
> has been the case for all other proposed approaches.
> It means that idmappings become a property of bind-mounts, i.e. each
> bind-mount can have a separate idmapping. This has the obvious advantage
> that idmapped mounts can be created inside of the initial user
> namespace, i.e. on the host itself instead of requiring the caller to be
> located inside of a user namespace. This enables such use-cases as e.g.
> making a usb stick available in multiple locations with different
> idmappings (see the vfat port that is part of this patch series).
>=20
> The vfsmount struct gains a new struct user_namespace member. The
> idmapping of the user namespace becomes the idmapping of the mount. A
> caller that is either privileged with respect to the user namespace of
> the superblock of the underlying filesystem or a caller that is
> privileged with respect to the user namespace a mount has been idmapped
> with can create a new bind-mount and mark it with a user namespace. The
> user namespace the mount will be marked with can be specified by passing
> a file descriptor refering to the user namespace as an argument to the
> new mount_setattr() syscall together with the new MOUNT_ATTR_IDMAP flag.
> By default vfsmounts are marked with the initial user namespace and no
> behavioral or performance changes should be observed. All mapping
> operations are nops for the initial user namespace.
>=20
> When a file/inode is accessed through an idmapped mount the i_uid and
> i_gid of the inode will be remapped according to the user namespace the
> mount has been marked with. When a new object is created based on the
> fsuid and fsgid of the caller they will similarly be remapped according
> to the user namespace of the mount they care created from.
>=20
> This means the user namespace of the mount needs to be passed down into
> a few relevant inode_operations. This mostly includes inode operations
> that create filesystem objects or change file attributes. Some of them
> such as ->getattr() don't even need to change since they pass down a
> struct path and thus the struct vfsmount is already available. Other
> inode operations need to be adapted to pass down the user namespace the
> vfsmount has been marked with. Al was nice enough to point out that he
> will not tolerate struct vfsmount being passed to filesystems and that I
> should pass down the user namespace directly; which is what I did.
> The inode struct itself is never altered whenever the i_uid and i_gid
> need to be mapped, i.e. i_uid and i_gid are only remapped at the time of
> the check. An inode once initialized (during lookup or object creation)
> is never altered when accessed through an idmapped mount.
>=20
> To limit the amount of noise in this first iteration we have not changed
> the existing inode operations but rather introduced a few new struct
> inode operation methods such as ->mkdir_mapped which pass down the user
> namespace of the mount they have been called from. Should this solution
> be worth pursuing we have no problem adapting the existing inode
> operations instead.
>=20
> In order to support idmapped mounts, filesystems need to be changed and
> mark themselves with the FS_ALLOW_IDMAP flag in fs_flags. In this first
> iteration I tried to illustrate this by changing three different
> filesystem with different levels of complexity. Of course with some bias
> towards urgent use-cases and filesystems I was at least a little more
> familiar with. However, Tycho and I (and others) have no problem
> converting each filesystem one-by-one. This first iteration includes fat
> (msdos and vfat), ext4, and overlayfs (both with idmapped lower and
> upper directories and idmapped merged directories). I'm sure I haven't
> gotten everything right for all three of them in the first version of
> this patch.
>=20

Thanks for this patchset. It's been a long-time coming.

I'm curious as to for the most cases, how much the new fs mount APIs help, =
and=20
if focusing on those could solve the problem for everything other than bind=
=20
mounts? Specifically, the idea of doing fsopen (creation of fs_context) und=
er=20
the user namespace of question, and relying on a user with CAP_SYS_ADMIN to=
 call=20
fsmount[1]. I think this is actually especially valuable for places like=20
overlayfs that use the entire cred object, as opposed to just the uid / gid=
. I=20
imagine that soon, most filesystems will support the new mount APIs, and no=
t set=20
the global flag if they don't need to.

How popular is the "vfsmount (bind mounts) needs different uid mappings" us=
e=20
case?

The other thing I worry about is the "What UID are you really?" game that's=
 been=20
a thing recently. For example, you can have a different user namespace UID=
=20
mapping for your network namespace that netfilter checks[2], and a differen=
t one=20
for your mount namespace, and a different one that the process is actually =
in.
This proliferation of different mappings makes auditing, and doing things l=
ike
writing perf toolings more difficult (since I think bpf_get_current_uid_gid
use the initial user namespace still [3]).

[1]: https://lore.kernel.org/linux-nfs/20201016123745.9510-4-sargun@sargun.=
me/T/#u
[2]: https://elixir.bootlin.com/linux/v5.9.1/source/net/netfilter/xt_owner.=
c#L37
[3]: https://elixir.bootlin.com/linux/v5.9.1/source/kernel/bpf/helpers.c#L1=
96

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 141E329EC27
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 13:45:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-MH86TAnHNRuWPhjQV83t1w-1; Thu, 29 Oct 2020 08:45:57 -0400
X-MC-Unique: MH86TAnHNRuWPhjQV83t1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE31418B9F09;
	Thu, 29 Oct 2020 12:45:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2EB36EF46;
	Thu, 29 Oct 2020 12:45:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 91544181A270;
	Thu, 29 Oct 2020 12:45:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09T2mfce006697 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 28 Oct 2020 22:48:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E8BE22166BA3; Thu, 29 Oct 2020 02:48:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3FC42166BA4
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 02:48:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A77E2185A78B
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 02:48:37 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-500-2vQMINh3N0my_R1p40R7sQ-1; Wed, 28 Oct 2020 22:48:33 -0400
X-MC-Unique: 2vQMINh3N0my_R1p40R7sQ-1
Received: from dread.disaster.area (pa49-179-6-140.pa.nsw.optusnet.com.au
	[49.179.6.140])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 5E73A58C9C6;
	Thu, 29 Oct 2020 13:27:34 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1kXxf3-005Q9Q-Vd; Thu, 29 Oct 2020 13:27:33 +1100
Date: Thu, 29 Oct 2020 13:27:33 +1100
From: Dave Chinner <david@fromorbit.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH 00/34] fs: idmapped mounts
Message-ID: <20201029022733.GB306023@dread.disaster.area>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
In-Reply-To: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=YKPhNiOx c=1 sm=1 tr=0 cx=a_idp_d
	a=uDU3YIYVKEaHT0eX+MXYOQ==:117 a=uDU3YIYVKEaHT0eX+MXYOQ==:17
	a=8nJEP1OIZ-IA:10 a=afefHYAZSVUA:10 a=7-415B0cAAAA:8
	a=7FRnUTRuY4COAZBt7UUA:9 a=wPNLvfGTeEIA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09T2mfce006697
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:45:19 -0400
Cc: Phil Estes <estesp@gmail.com>, Lennart Poettering <lennart@poettering.net>,
	Amir Goldstein <amir73il@gmail.com>, Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	containers@lists.linux-foundation.org, Tycho Andersen <tycho@tycho.ws>,
	Miklos Szeredi <miklos@szeredi.hu>,
	James Morris <jmorris@namei.org>, smbarber@chromium.org,
	Christoph Hellwig <hch@infradead.org>,
	linux-ext4@vger.kernel.org, Mrunal Patel <mpatel@redhat.com>,
	Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
	Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>,
	linux-fsdevel@vger.kernel.org, Aleksa Sarai <cyphar@cyphar.com>,
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
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-api@vger.kernel.org, Alban Crequy <alban@kinvolk.io>,
	linux-integrity@vger.kernel.org,
	=?iso-8859-1?Q?St=E9phane?= Graber <stgraber@ubuntu.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
> To the best of my knowledge this involved Aleksa, St=E9phane, Eric, David=
,
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
> that create filesystem objects or change file attributes.

That's really quite ... messy.

Maybe I'm missing something, but if you have the user_ns to be used
for the VFS operation we are about to execute then why can't we use
the same model as current_fsuid/current_fsgid() for passing the
filesystem credentials down to the filesystem operations?  i.e.
attach it to the current->cred->fs_userns, and then the filesystem
code that actually needs to know the current userns can call
current_fs_user_ns() instead of current_user_ns().  i.e.

#define current_fs_user_ns()=09\
=09(current->cred->fs_userns ? current->cred->fs_userns \
=09=09=09=09  : current->cred->userns)

At this point, the filesystem will now always have the correct
userns it is supposed to use for mapping the uid/gid, right?

Also, if we are passing work off to worker threads, duplicating
the current creds will capture this information and won't leave
random landmines where stuff doesn't work as it should because the
worker thread is unaware of the userns that it is supposed to be
doing filesytsem operations under...

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


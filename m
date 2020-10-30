Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4381529FB2A
	for <lists+linux-audit@lfdr.de>; Fri, 30 Oct 2020 03:25:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213--eovhcZ_Mjq9PUne0_eVYg-1; Thu, 29 Oct 2020 22:25:16 -0400
X-MC-Unique: -eovhcZ_Mjq9PUne0_eVYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68CF6425D2;
	Fri, 30 Oct 2020 02:25:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCA106EF6D;
	Fri, 30 Oct 2020 02:25:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 884D2181A06C;
	Fri, 30 Oct 2020 02:25:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09U2IJ76008145 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 29 Oct 2020 22:18:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1949E2156A49; Fri, 30 Oct 2020 02:18:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13C932157F4F
	for <linux-audit@redhat.com>; Fri, 30 Oct 2020 02:18:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF2FB858298
	for <linux-audit@redhat.com>; Fri, 30 Oct 2020 02:18:12 +0000 (UTC)
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-445-LIxZr0yNNVmFA92tx6neeQ-1;
	Thu, 29 Oct 2020 22:18:08 -0400
X-MC-Unique: LIxZr0yNNVmFA92tx6neeQ-1
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id 027D69B4; Thu, 29 Oct 2020 21:18:05 -0500 (CDT)
Date: Thu, 29 Oct 2020 21:18:05 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH 00/34] fs: idmapped mounts
Message-ID: <20201030021805.GA20489@mail.hallyn.com>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<87pn51ghju.fsf@x220.int.ebiederm.org>
	<20201029155148.5odu4j2kt62ahcxq@yavin.dot.cyphar.com>
	<87361xdm4c.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
In-Reply-To: <87361xdm4c.fsf@x220.int.ebiederm.org>
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
X-Mailman-Approved-At: Thu, 29 Oct 2020 22:24:47 -0400
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 29, 2020 at 11:37:23AM -0500, Eric W. Biederman wrote:
> Aleksa Sarai <cyphar@cyphar.com> writes:
> 
> > On 2020-10-29, Eric W. Biederman <ebiederm@xmission.com> wrote:
> >> Christian Brauner <christian.brauner@ubuntu.com> writes:
> >> 
> >> > Hey everyone,
> >> >
> >> > I vanished for a little while to focus on this work here so sorry for
> >> > not being available by mail for a while.
> >> >
> >> > Since quite a long time we have issues with sharing mounts between
> >> > multiple unprivileged containers with different id mappings, sharing a
> >> > rootfs between multiple containers with different id mappings, and also
> >> > sharing regular directories and filesystems between users with different
> >> > uids and gids. The latter use-cases have become even more important with
> >> > the availability and adoption of systemd-homed (cf. [1]) to implement
> >> > portable home directories.
> >> 
> >> Can you walk us through the motivating use case?
> >> 
> >> As of this year's LPC I had the distinct impression that the primary use
> >> case for such a feature was due to the RLIMIT_NPROC problem where two
> >> containers with the same users still wanted different uid mappings to
> >> the disk because the users were conflicting with each other because of
> >> the per user rlimits.
> >> 
> >> Fixing rlimits is straight forward to implement, and easier to manage
> >> for implementations and administrators.
> >
> > This is separate to the question of "isolated user namespaces" and
> > managing different mappings between containers. This patchset is solving
> > the same problem that shiftfs solved -- sharing a single directory tree
> > between containers that have different ID mappings. rlimits (nor any of
> > the other proposals we discussed at LPC) will help with this problem.
> 
> First and foremost: A uid shift on write to a filesystem is a security
> bug waiting to happen.  This is especially in the context of facilities
> like iouring, that play very agressive games with how process context
> makes it to  system calls.
> 
> The only reason containers were not immediately exploitable when iouring
> was introduced is because the mechanisms are built so that even if
> something escapes containment the security properties still apply.
> Changes to the uid when writing to the filesystem does not have that
> property.  The tiniest slip in containment will be a security issue.
> 
> This is not even the least bit theoretical.  I have seem reports of how
> shitfs+overlayfs created a situation where anyone could read
> /etc/shadow.
> 
> If you are going to write using the same uid to disk from different
> containers the question becomes why can't those containers configure
> those users to use the same kuid?

Because if user 'myapp' in two otherwise isolated containers both have
the same kuid, so that they can write to a shared directory, then root
in container 1 has privilege over all files owned by 'myapp' in
container 2.

Whereas if they can each have distinct kuids, but when writing to the
shared fs have a shared uid not otherwise belonging to either container,
their rootfs's can remain completely off limits to each other.

> What fixing rlimits does is it fixes one of the reasons that different
> containers could not share the same kuid for users that want to write to
> disk with the same uid.
> 
> 
> I humbly suggest that it will be more secure, and easier to maintain for
> both developers and users if we fix the reasons people want different
> containers to have the same user running with different kuids.
> 
> If not what are the reasons we fundamentally need the same on-disk user
> using multiple kuids in the kernel?
> 
> Eric

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


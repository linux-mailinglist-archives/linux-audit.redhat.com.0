Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F085329F6BC
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 22:21:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-G7Ly29AWNCalJ2WAe_Hv6A-1; Thu, 29 Oct 2020 17:21:32 -0400
X-MC-Unique: G7Ly29AWNCalJ2WAe_Hv6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02CFB1019627;
	Thu, 29 Oct 2020 21:21:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E324B5D9D3;
	Thu, 29 Oct 2020 21:21:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE0A55810D;
	Thu, 29 Oct 2020 21:21:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09TL4369003590 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 29 Oct 2020 17:04:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9D370115D357; Thu, 29 Oct 2020 21:04:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9915D115D356
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 21:04:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 258F28007A4
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 21:04:01 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
	[66.111.4.229]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-563-QIX49vpTOHy-cYLQHZ3bnA-1; Thu, 29 Oct 2020 17:03:58 -0400
X-MC-Unique: QIX49vpTOHy-cYLQHZ3bnA-1
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id AC1F958082E;
	Thu, 29 Oct 2020 17:03:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute6.internal (MEProxy); Thu, 29 Oct 2020 17:03:57 -0400
X-ME-Sender: <xms:OS6bX17y2rChRn6myfBFu8PJ72ZKrV9ueWGDwCpnQ0VLe5o9QzKRgw>
	<xme:OS6bXy7Clz2wduRmpz7a2ekaV7sgjKgDOZgPpTfIMOyea9lOp3bnYEkrgy7DMBTl7
	uhbvm4xTOy6HzKzCYM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgddugeefucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhigthhho
	ucetnhguvghrshgvnhcuoehthigthhhosehthigthhhordhpihiiiigrqeenucggtffrrg
	htthgvrhhnpeegkeefjeegkedtjefgfeduleekueetjeeghffhuefgffefleehgeeifedv
	gfethfenucfkphepuddvkedruddtjedrvdeguddrudekieenucevlhhushhtvghrufhiii
	gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehthigthhhosehthigthhhordhpihii
	iigr
X-ME-Proxy: <xmx:OS6bX8dZ22_VtTfHRy8ro-DqoWupaN92F8fkrD12QX4SEnF8i26igA>
	<xmx:OS6bX-JvZU0o5gMwGrx8SkROSlmlRdlNaZDQ3hePbM1NKqUIl2xMmQ>
	<xmx:OS6bX5JzUXOe-tzqUlu14Hzeo18Gz9w2oUbIjHk8py9nASNnAUuHpQ>
	<xmx:PS6bX1qdvuSj9JeN5gin3MrPvQhViju6wyRCtD8hM7P1OMUsqzhP2w>
Received: from cisco (unknown [128.107.241.186])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3EF4D328005A;
	Thu, 29 Oct 2020 17:03:46 -0400 (EDT)
Date: Thu, 29 Oct 2020 15:03:44 -0600
From: Tycho Andersen <tycho@tycho.pizza>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH 00/34] fs: idmapped mounts
Message-ID: <20201029210344.GA135035@cisco>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<87pn51ghju.fsf@x220.int.ebiederm.org>
	<20201029161231.GA108315@cisco>
	<87blglc77y.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
In-Reply-To: <87blglc77y.fsf@x220.int.ebiederm.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 29 Oct 2020 17:21:09 -0400
Cc: Andy Lutomirski <luto@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Christian Brauner <christian.brauner@ubuntu.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Eric,

On Thu, Oct 29, 2020 at 11:44:33AM -0500, Eric W. Biederman wrote:
> Tycho Andersen <tycho@tycho.pizza> writes:
> 
> > Hi Eric,
> >
> > On Thu, Oct 29, 2020 at 10:47:49AM -0500, Eric W. Biederman wrote:
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
> > Our use case is to have the same directory exposed to several
> > different containers which each have disjoint ID mappings.
> 
> Why do the you have disjoint ID mappings for the users that are writing
> to disk with the same ID?

We don't today; right now we have a service that runs as root, since
that's the only thing that can be made to work. See below...

> >> Reading up on systemd-homed it appears to be a way to have encrypted
> >> home directories.  Those home directories can either be encrypted at the
> >> fs or at the block level.  Those home directories appear to have the
> >> goal of being luggable between systems.  If the systems in question
> >> don't have common administration of uids and gids after lugging your
> >> encrypted home directory to another system chowning the files is
> >> required.
> >> 
> >> Is that the use case you are looking at removing the need for
> >> systemd-homed to avoid chowning after lugging encrypted home directories
> >> from one system to another?  Why would it be desirable to avoid the
> >> chown?
> >
> > Not just systemd-homed, but LXD has to do this,
> 
> I asked why the same disk users are assigned different kuids and the
> only reason I have heard that LXD does this is the RLIMIT_NPROC problem.
> 
> Perhaps there is another reason.
> 
> In part this is why I am eager to hear peoples use case, and why I was
> trying very hard to make certain we get the requirements.
> 
> I want the real requirements though and some thought, not just we did
> this and it hurts.  Changning the uids on write is a very hard problem,
> and not just in implementating it but also in maintaining and
> understanding what is going on.

We have N services which we don't want to be able to talk to each
other, so we run them in containers with isolated uid maps. However,
we do want them to be able to share a single directory of metadata.
We'd like to bind mount this directory into each container with the
correct user ns mapping to accomplish this; this is the primary driver
for putting the parameterization on the struct vfsmount.

We could map some shared uid into all the containers. But then we have
to have some service running as root in the containers to shuttle the
data back and forth between the shared uid the uid of the actual
service.

So goals are:

* directory shared between containers
* containers can talk to this directory as "normal" uids, so there's
  no data shuttling
* container's rootfs is still disjoint, so writes by "normal" uids in
  each container are disjoint from the other and they can't talk
  except via the shared directory

Tycho

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0E27129F258
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 17:57:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-EyL0ATiLPfKlUpXfmtp6VQ-1; Thu, 29 Oct 2020 12:57:37 -0400
X-MC-Unique: EyL0ATiLPfKlUpXfmtp6VQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3235805EF6;
	Thu, 29 Oct 2020 16:57:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 072D255786;
	Thu, 29 Oct 2020 16:57:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E8A91800B72;
	Thu, 29 Oct 2020 16:57:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09TGU5Zg000838 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 29 Oct 2020 12:30:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 39BA8EB35C; Thu, 29 Oct 2020 16:30:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34001EC4AF
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 16:30:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFD91185A7A1
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 16:30:02 +0000 (UTC)
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-328-DrzGrvtaMeSznx12AKgiYw-1;
	Thu, 29 Oct 2020 12:29:57 -0400
X-MC-Unique: DrzGrvtaMeSznx12AKgiYw-1
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id C24CF11F1; Thu, 29 Oct 2020 11:23:17 -0500 (CDT)
Date: Thu, 29 Oct 2020 11:23:17 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Tycho Andersen <tycho@tycho.pizza>
Subject: Re: [PATCH 00/34] fs: idmapped mounts
Message-ID: <20201029162317.GA12461@mail.hallyn.com>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<87pn51ghju.fsf@x220.int.ebiederm.org>
	<20201029161231.GA108315@cisco>
MIME-Version: 1.0
In-Reply-To: <20201029161231.GA108315@cisco>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-Mailman-Approved-At: Thu, 29 Oct 2020 12:57:25 -0400
Cc: Andy Lutomirski <luto@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Miklos Szeredi <miklos@szeredi.hu>, smbarber@chromium.org,
	Christoph Hellwig <hch@infradead.org>,
	Alban Crequy <alban@kinvolk.io>, linux-ext4@vger.kernel.org,
	Mrunal Patel <mpatel@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>,
	Seth Forshee <seth.forshee@canonical.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Lennart Poettering <lennart@poettering.net>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Geoffrey Thomas <geofft@ldpreload.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John Johansen <john.johansen@canonical.com>, Theodore Tso <tytso@mit.edu>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	containers@lists.linux-foundation.org,
	Jonathan Corbet <corbet@lwn.net>, linux-unionfs@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-integrity@vger.kernel.org, Todd Kjos <tkjos@google.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 29, 2020 at 10:12:31AM -0600, Tycho Andersen wrote:
> Hi Eric,
> 
> On Thu, Oct 29, 2020 at 10:47:49AM -0500, Eric W. Biederman wrote:
> > Christian Brauner <christian.brauner@ubuntu.com> writes:
> > 
> > > Hey everyone,
> > >
> > > I vanished for a little while to focus on this work here so sorry for
> > > not being available by mail for a while.
> > >
> > > Since quite a long time we have issues with sharing mounts between
> > > multiple unprivileged containers with different id mappings, sharing a
> > > rootfs between multiple containers with different id mappings, and also
> > > sharing regular directories and filesystems between users with different
> > > uids and gids. The latter use-cases have become even more important with
> > > the availability and adoption of systemd-homed (cf. [1]) to implement
> > > portable home directories.
> > 
> > Can you walk us through the motivating use case?
> > 
> > As of this year's LPC I had the distinct impression that the primary use
> > case for such a feature was due to the RLIMIT_NPROC problem where two
> > containers with the same users still wanted different uid mappings to
> > the disk because the users were conflicting with each other because of
> > the per user rlimits.
> > 
> > Fixing rlimits is straight forward to implement, and easier to manage
> > for implementations and administrators.
> 
> Our use case is to have the same directory exposed to several
> different containers which each have disjoint ID mappings.
> 
> > Reading up on systemd-homed it appears to be a way to have encrypted
> > home directories.  Those home directories can either be encrypted at the
> > fs or at the block level.  Those home directories appear to have the
> > goal of being luggable between systems.  If the systems in question
> > don't have common administration of uids and gids after lugging your
> > encrypted home directory to another system chowning the files is
> > required.
> > 
> > Is that the use case you are looking at removing the need for
> > systemd-homed to avoid chowning after lugging encrypted home directories
> > from one system to another?  Why would it be desirable to avoid the
> > chown?
> 
> Not just systemd-homed, but LXD has to do this, as does our
> application at Cisco, and presumably others.
> 
> Several reasons:
> 
> * the chown is slow
> * the chown requires somewhere to write the delta in metadata (e.g. an
>   overlay workdir, or an LV or something), and there are N copies of
>   this delta, one for each container.
> * it means we need to have a +w filesystem at some point during
>   execution.
> * it's ugly :). Conceptually, the kernel solves the uid shifting
>   problem for us for most other kernel subsystems (including in a
>   limited way fscaps) by configuring a user namespace. It feels like
>   we should be able to do the same with the VFS.

And chown prevents the same inode from being shared by different
containers through different id mappings.  You can overlay, but then
they can't actually share updates.

-serge

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


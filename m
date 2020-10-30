Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A23EF2A0ABA
	for <lists+linux-audit@lfdr.de>; Fri, 30 Oct 2020 17:09:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-UaK0mE4QM9KJJuXYwY9d8g-1; Fri, 30 Oct 2020 12:09:09 -0400
X-MC-Unique: UaK0mE4QM9KJJuXYwY9d8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4FD71054FAA;
	Fri, 30 Oct 2020 16:08:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A9B95C1C4;
	Fri, 30 Oct 2020 16:08:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A995C1826D36;
	Fri, 30 Oct 2020 16:08:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09UG3ifR016757 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 12:03:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB27B1004176; Fri, 30 Oct 2020 16:03:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C630D1004165
	for <linux-audit@redhat.com>; Fri, 30 Oct 2020 16:03:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4AD4185A790
	for <linux-audit@redhat.com>; Fri, 30 Oct 2020 16:03:41 +0000 (UTC)
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-11-ikb1yYf2N_yTQwbn-TTXfQ-1; 
	Fri, 30 Oct 2020 12:03:36 -0400
X-MC-Unique: ikb1yYf2N_yTQwbn-TTXfQ-1
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id 0CBD712C3; Fri, 30 Oct 2020 11:03:32 -0500 (CDT)
Date: Fri, 30 Oct 2020 11:03:32 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH 00/34] fs: idmapped mounts
Message-ID: <20201030160332.GA30083@mail.hallyn.com>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<87pn51ghju.fsf@x220.int.ebiederm.org>
	<20201029155148.5odu4j2kt62ahcxq@yavin.dot.cyphar.com>
	<87361xdm4c.fsf@x220.int.ebiederm.org>
	<20201030150748.GA176340@ubuntu-x1>
MIME-Version: 1.0
In-Reply-To: <20201030150748.GA176340@ubuntu-x1>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-Mailman-Approved-At: Fri, 30 Oct 2020 12:08:47 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 30, 2020 at 10:07:48AM -0500, Seth Forshee wrote:
> On Thu, Oct 29, 2020 at 11:37:23AM -0500, Eric W. Biederman wrote:
> > First and foremost: A uid shift on write to a filesystem is a security
> > bug waiting to happen.  This is especially in the context of facilities
> > like iouring, that play very agressive games with how process context
> > makes it to  system calls.
> > 
> > The only reason containers were not immediately exploitable when iouring
> > was introduced is because the mechanisms are built so that even if
> > something escapes containment the security properties still apply.
> > Changes to the uid when writing to the filesystem does not have that
> > property.  The tiniest slip in containment will be a security issue.
> > 
> > This is not even the least bit theoretical.  I have seem reports of how
> > shitfs+overlayfs created a situation where anyone could read
> > /etc/shadow.
> 
> This bug was the result of a complex interaction with several
> contributing factors. It's fair to say that one component was overlayfs
> writing through an id-shifted mount, but the primary cause was related
> to how copy-up was done coupled with allowing unprivileged overlayfs
> mounts in a user ns. Checks that the mounter had access to the lower fs
> file were not done before copying data up, and so the file was copied up
> temporarily to the id shifted upperdir. Even though it was immediately
> removed, other factors made it possible for the user to get the file
> contents from the upperdir.
> 
> Regardless, I do think you raise a good point. We need to be wary of any
> place the kernel could open files through a shifted mount, especially
> when the open could be influenced by userspace.
> 
> Perhaps kernel file opens through shifted mounts should to be opt-in.
> I.e. unless a flag is passed, or a different open interface used, the
> open will fail if the dentry being opened is subject to id shifting.
> This way any kernel writes which would be subject to id shifting will
> only happen through code which as been written to take it into account.

For my use cases, it would be fine to require opt-in at original fs
mount time by init_user_ns admin.  I.e.
    mount -o allow_idmap /dev/mapper/whoozit /whatzit
I'm quite certain I would always be sharing a separate LV or loopback or
tmpfs.

-serge

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


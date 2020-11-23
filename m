Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 913592C0ECA
	for <lists+linux-audit@lfdr.de>; Mon, 23 Nov 2020 16:28:31 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-OlWfXVbiNA-yspltzE5ZRQ-1; Mon, 23 Nov 2020 10:28:28 -0500
X-MC-Unique: OlWfXVbiNA-yspltzE5ZRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F1BD1084440;
	Mon, 23 Nov 2020 15:28:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9B9A19D7C;
	Mon, 23 Nov 2020 15:28:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8AE8180954D;
	Mon, 23 Nov 2020 15:28:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AN7kG0W013110 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 02:46:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 233792166B27; Mon, 23 Nov 2020 07:46:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA2CE2166B2D
	for <linux-audit@redhat.com>; Mon, 23 Nov 2020 07:46:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48E3A185A7BC
	for <linux-audit@redhat.com>; Mon, 23 Nov 2020 07:46:13 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-181-n2vFvA26NQyI6XzfOyLJZQ-1; Mon, 23 Nov 2020 02:46:09 -0500
X-MC-Unique: n2vFvA26NQyI6XzfOyLJZQ-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1kh6X5-0007Jl-9M; Mon, 23 Nov 2020 07:45:07 +0000
Date: Mon, 23 Nov 2020 08:45:05 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v2 14/39] commoncap: handle idmapped mounts
Message-ID: <20201123074505.ds5hpqo5kgyvjksb@wittgenstein>
References: <20201115103718.298186-1-christian.brauner@ubuntu.com>
	<20201115103718.298186-15-christian.brauner@ubuntu.com>
	<CAHC9VhRqk1WMXyHTsrLcJnpxMPgJs_CxeG2uCaaBGgHqK_jj=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRqk1WMXyHTsrLcJnpxMPgJs_CxeG2uCaaBGgHqK_jj=g@mail.gmail.com>
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
X-Mailman-Approved-At: Mon, 23 Nov 2020 10:28:09 -0500
Cc: Phil Estes <estesp@gmail.com>, Lennart Poettering <lennart@poettering.net>,
	Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	containers@lists.linux-foundation.org,
	Christoph Hellwig <hch@lst.de>, Tycho Andersen <tycho@tycho.ws>,
	Jonathan Corbet <corbet@lwn.net>,
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
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	"Eric W. Biederman" <ebiederm@xmission.com>,
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Nov 22, 2020 at 04:18:55PM -0500, Paul Moore wrote:
> On Sun, Nov 15, 2020 at 5:39 AM Christian Brauner
> <christian.brauner@ubuntu.com> wrote:
> > When interacting with user namespace and non-user namespace aware
> > filesystem capabilities the vfs will perform various security checks to
> > determine whether or not the filesystem capabilities can be used by the
> > caller (e.g. during exec), or even whether they need to be removed. The
> > main infrastructure for this resides in the capability codepaths but they
> > are called through the LSM security infrastructure even though they are not
> > technically an LSM or optional. This extends the existing security hooks
> > security_inode_removexattr(), security_inode_killpriv(),
> > security_inode_getsecurity() to pass down the mount's user namespace and
> > makes them aware of idmapped mounts.
> > In order to actually get filesystem capabilities from disk the capability
> > infrastructure exposes the get_vfs_caps_from_disk() helper. For user
> > namespace aware filesystem capabilities a root uid is stored alongside the
> > capabilities.
> > In order to determine whether the caller can make use of the filesystem
> > capability or whether it needs to be ignored it is translated according to
> > the superblock's user namespace. If it can be translated to uid 0 according
> > to that id mapping the caller can use the filesystem capabilities stored on
> > disk. If we are accessing the inode that holds the filesystem capabilities
> > through an idmapped mount we need to map the root uid according to the
> > mount's user namespace.
> > Afterwards the checks are identical to non-idmapped mounts. Reading
> > filesystem caps from disk enforces that the root uid associated with the
> > filesystem capability must have a mapping in the superblock's user
> > namespace and that the caller is either in the same user namespace or is a
> > descendant of the superblock's user namespace. For filesystems that are
> > mountable inside user namespace the container can just mount the filesystem
> > and won't usually need to idmap it. If it does create an idmapped mount it
> > can mark it with a user namespace it has created and which is therefore a
> > descendant of the s_user_ns. For filesystems that are not mountable inside
> > user namespaces the descendant rule is trivially true because the s_user_ns
> > will be the initial user namespace.
> >
> > If the initial user namespace is passed all operations are a nop so
> > non-idmapped mounts will not see a change in behavior and will also not see
> > any performance impact.
> >
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: David Howells <dhowells@redhat.com>
> > Cc: Al Viro <viro@zeniv.linux.org.uk>
> > Cc: linux-fsdevel@vger.kernel.org
> > Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
> 
> ...
> 
> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index 8dba8f0983b5..ddb9213a3e81 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -1944,7 +1944,7 @@ static inline int audit_copy_fcaps(struct audit_names *name,
> >         if (!dentry)
> >                 return 0;
> >
> > -       rc = get_vfs_caps_from_disk(dentry, &caps);
> > +       rc = get_vfs_caps_from_disk(&init_user_ns, dentry, &caps);
> >         if (rc)
> >                 return rc;
> >
> > @@ -2495,7 +2495,8 @@ int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
> >         ax->d.next = context->aux;
> >         context->aux = (void *)ax;
> >
> > -       get_vfs_caps_from_disk(bprm->file->f_path.dentry, &vcaps);
> > +       get_vfs_caps_from_disk(mnt_user_ns(bprm->file->f_path.mnt),
> > +                              bprm->file->f_path.dentry, &vcaps);
> 
> As audit currently records information in the context of the
> initial/host namespace I'm guessing we don't want the mnt_user_ns()
> call above; it seems like &init_user_ns would be the right choice
> (similar to audit_copy_fcaps()), yes?

Ok, sounds good. It also makes the patchset simpler.
Note that I'm currently not on the audit mailing list so this is likely
not going to show up there.

(Fwiw, I responded to you in your other mail too.)

Christian

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA062BFEB4
	for <lists+linux-audit@lfdr.de>; Mon, 23 Nov 2020 04:24:47 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-uuui5ctSO4WMQyHsEKqfdQ-1; Sun, 22 Nov 2020 22:24:44 -0500
X-MC-Unique: uuui5ctSO4WMQyHsEKqfdQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A4D15205;
	Mon, 23 Nov 2020 03:24:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D7115D9DD;
	Mon, 23 Nov 2020 03:24:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 25B5A4A7C6;
	Mon, 23 Nov 2020 03:24:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AMLJDFX013373 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 22 Nov 2020 16:19:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6C5642026D14; Sun, 22 Nov 2020 21:19:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67B382026D12
	for <linux-audit@redhat.com>; Sun, 22 Nov 2020 21:19:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 131BE800157
	for <linux-audit@redhat.com>; Sun, 22 Nov 2020 21:19:11 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-492-JvElV7mzOQSq4YesF2oA1g-1; Sun, 22 Nov 2020 16:19:08 -0500
X-MC-Unique: JvElV7mzOQSq4YesF2oA1g-1
Received: by mail-ed1-f68.google.com with SMTP id t9so15083439edq.8
	for <linux-audit@redhat.com>; Sun, 22 Nov 2020 13:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TnYAfYzK9z2CU6n9f6EQEQr3kUIpHz74aN1sscdy0dE=;
	b=N5X8gIXPYI9ijP+aH5yDWRcl+lwc6G5KjXqOItsd56RYPsglmcZ88Zy5iXSV+/oAjn
	m0pp/pfejyRkxZ4RkRsGgeTL/FRDJs3oZRfYpZoh6rSQjQVnWDcqL7D9/OeGO8yBqnFB
	Y3vSrPXAdkoJuqOIFXU2iuomII2f9Tcr+64kN0zqNjh+4cs5bWkF4kBQTjnz4bxDo/Xw
	0bn2qfbU7ptz3o6YAdlym49L6DJqjKm5fhuSk5ttyGBTjWlv/yWsbZxs5fWUy28vOK9i
	tJzIXMolGLXhCqAfYC+/k0eKh+KHWrGPGeBp+XN5H2lsWUfMb/y7QFoj2NweOW9YNTfV
	LSFA==
X-Gm-Message-State: AOAM533LMNXAXak45tHOV4uRJLDxvcveIhyQ/z+wugY4QeT52lCqqj0d
	j9a/6HJzzD7kFYLZoofHnl3QCbHLzEC0MeShpl/3
X-Google-Smtp-Source: ABdhPJxWDVFzpcLiB/ip+VH1A679zZkgv5lzs7PTKex+TlERHeuhuyes1CoTwmWTuMvWpYfUdNgQEs+SrGqG31WGjjs=
X-Received: by 2002:aa7:de01:: with SMTP id h1mr44059484edv.269.1606079946987; 
	Sun, 22 Nov 2020 13:19:06 -0800 (PST)
MIME-Version: 1.0
References: <20201115103718.298186-1-christian.brauner@ubuntu.com>
	<20201115103718.298186-15-christian.brauner@ubuntu.com>
In-Reply-To: <20201115103718.298186-15-christian.brauner@ubuntu.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 22 Nov 2020 16:18:55 -0500
Message-ID: <CAHC9VhRqk1WMXyHTsrLcJnpxMPgJs_CxeG2uCaaBGgHqK_jj=g@mail.gmail.com>
Subject: Re: [PATCH v2 14/39] commoncap: handle idmapped mounts
To: Christian Brauner <christian.brauner@ubuntu.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sun, 22 Nov 2020 22:24:23 -0500
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
	=?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@ubuntu.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Nov 15, 2020 at 5:39 AM Christian Brauner
<christian.brauner@ubuntu.com> wrote:
> When interacting with user namespace and non-user namespace aware
> filesystem capabilities the vfs will perform various security checks to
> determine whether or not the filesystem capabilities can be used by the
> caller (e.g. during exec), or even whether they need to be removed. The
> main infrastructure for this resides in the capability codepaths but they
> are called through the LSM security infrastructure even though they are not
> technically an LSM or optional. This extends the existing security hooks
> security_inode_removexattr(), security_inode_killpriv(),
> security_inode_getsecurity() to pass down the mount's user namespace and
> makes them aware of idmapped mounts.
> In order to actually get filesystem capabilities from disk the capability
> infrastructure exposes the get_vfs_caps_from_disk() helper. For user
> namespace aware filesystem capabilities a root uid is stored alongside the
> capabilities.
> In order to determine whether the caller can make use of the filesystem
> capability or whether it needs to be ignored it is translated according to
> the superblock's user namespace. If it can be translated to uid 0 according
> to that id mapping the caller can use the filesystem capabilities stored on
> disk. If we are accessing the inode that holds the filesystem capabilities
> through an idmapped mount we need to map the root uid according to the
> mount's user namespace.
> Afterwards the checks are identical to non-idmapped mounts. Reading
> filesystem caps from disk enforces that the root uid associated with the
> filesystem capability must have a mapping in the superblock's user
> namespace and that the caller is either in the same user namespace or is a
> descendant of the superblock's user namespace. For filesystems that are
> mountable inside user namespace the container can just mount the filesystem
> and won't usually need to idmap it. If it does create an idmapped mount it
> can mark it with a user namespace it has created and which is therefore a
> descendant of the s_user_ns. For filesystems that are not mountable inside
> user namespaces the descendant rule is trivially true because the s_user_ns
> will be the initial user namespace.
>
> If the initial user namespace is passed all operations are a nop so
> non-idmapped mounts will not see a change in behavior and will also not see
> any performance impact.
>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: David Howells <dhowells@redhat.com>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: linux-fsdevel@vger.kernel.org
> Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>

...

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 8dba8f0983b5..ddb9213a3e81 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -1944,7 +1944,7 @@ static inline int audit_copy_fcaps(struct audit_names *name,
>         if (!dentry)
>                 return 0;
>
> -       rc = get_vfs_caps_from_disk(dentry, &caps);
> +       rc = get_vfs_caps_from_disk(&init_user_ns, dentry, &caps);
>         if (rc)
>                 return rc;
>
> @@ -2495,7 +2495,8 @@ int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
>         ax->d.next = context->aux;
>         context->aux = (void *)ax;
>
> -       get_vfs_caps_from_disk(bprm->file->f_path.dentry, &vcaps);
> +       get_vfs_caps_from_disk(mnt_user_ns(bprm->file->f_path.mnt),
> +                              bprm->file->f_path.dentry, &vcaps);

As audit currently records information in the context of the
initial/host namespace I'm guessing we don't want the mnt_user_ns()
call above; it seems like &init_user_ns would be the right choice
(similar to audit_copy_fcaps()), yes?

>         ax->fcap.permitted = vcaps.permitted;
>         ax->fcap.inheritable = vcaps.inheritable;

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


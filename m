Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2A26C29F278
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 18:01:30 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-TVa43LeVOxyQoN1CLdKQTA-1; Thu, 29 Oct 2020 13:01:26 -0400
X-MC-Unique: TVa43LeVOxyQoN1CLdKQTA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03318100F79F;
	Thu, 29 Oct 2020 17:00:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9DBC196FB;
	Thu, 29 Oct 2020 17:00:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8FE6258111;
	Thu, 29 Oct 2020 17:00:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09TGaLAm001520 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 29 Oct 2020 12:36:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D68A92156A4A; Thu, 29 Oct 2020 16:36:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D14852156A3D
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 16:36:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95AFD1021F63
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 16:36:19 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-553-GKcFRpAvMSm0PyvF3_zZtg-1; Thu, 29 Oct 2020 12:36:16 -0400
X-MC-Unique: GKcFRpAvMSm0PyvF3_zZtg-1
Received: by mail-il1-f195.google.com with SMTP id x7so3689061ili.5
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 09:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+1FzFFklP1YnmghHH9t5lyMT4QSfeCr4QK0lMLwAvZE=;
	b=e7XgkvTPMtIS6tFqdVFTlA3oYrug+gyqvfihH/13VrZ6r972pvvO47CJdRt2YGWfb/
	7NTbor/mfOH21gnsX6iIfD/lQdJB64K/CkL+3GUDlXf5BpJsuqccddMAtnmgL89Hmgm7
	1FQ4VKyMLuXGX/9OyrEihAN5jmKKXb1FR1QA2jni62sNA7nqADVXUDE+bbySidNrouVc
	61AmQSz6o8dz4QPRo1gHtCct+jc47CZGEXJXNDhTIxG76EbO7Sm8MyHyd3AGTw4yqhN2
	oCiloSCuI9L20EDbBc+7T5wIPcjuJZ40Tq1wzG1eNig0pUrNuPWULnbVz7xfsOaA6Dsj
	Sz5A==
X-Gm-Message-State: AOAM531tJmkr4ZSCV5UpftI8zkt+8gfrZtDzrYfbLRnr+CVv5bPMDtTn
	KMBfRlChaSpAOwljksOMPKq26A==
X-Google-Smtp-Source: ABdhPJwdjJsI8P3ncUgKVI0MZeddl6/4SUR4eqZ1yA/w3w9keNoMZjKAVre0rxJASmFJuoRVIJjAng==
X-Received: by 2002:a92:c7c7:: with SMTP id g7mr3777623ilk.303.1603989375791; 
	Thu, 29 Oct 2020 09:36:15 -0700 (PDT)
Received: from ircssh-2.c.rugged-nimbus-611.internal
	(80.60.198.104.bc.googleusercontent.com. [104.198.60.80])
	by smtp.gmail.com with ESMTPSA id t6sm2275768ilk.5.2020.10.29.09.36.14
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 29 Oct 2020 09:36:14 -0700 (PDT)
Date: Thu, 29 Oct 2020 16:36:13 +0000
From: Sargun Dhillon <sargun@sargun.me>
To: Lennart Poettering <lennart@poettering.net>
Subject: Re: [PATCH 00/34] fs: idmapped mounts
Message-ID: <20201029163612.GA15275@ircssh-2.c.rugged-nimbus-611.internal>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<87pn51ghju.fsf@x220.int.ebiederm.org>
	<20201029160502.GA333141@gardel-login>
MIME-Version: 1.0
In-Reply-To: <20201029160502.GA333141@gardel-login>
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
X-Mailman-Approved-At: Thu, 29 Oct 2020 12:57:25 -0400
Cc: Phil Estes <estesp@gmail.com>, Amir Goldstein <amir73il@gmail.com>,
	Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 29, 2020 at 05:05:02PM +0100, Lennart Poettering wrote:
> On Do, 29.10.20 10:47, Eric W. Biederman (ebiederm@xmission.com) wrote:
> 
> > Is that the use case you are looking at removing the need for
> > systemd-homed to avoid chowning after lugging encrypted home directories
> > from one system to another?  Why would it be desirable to avoid the
> > chown?
> 
> Yes, I am very interested in seeing Christian's work succeed, for the
> usecase in systemd-homed. In systemd-homed each user gets their own
> private file system, and these fs shall be owned by the user's local
> UID, regardless in which system it is used. The UID should be an
> artifact of the local, individual system in this model, and thus
> the UID on of the same user/home on system A might be picked as 1010
> and on another as 1543, and on a third as 1323, and it shouldn't
> matter. This way, home directories become migratable without having to
> universially sync UID assignments: it doesn't matter anymore what the
> local UID is.
> 
> Right now we do a recursive chown() at login time to ensure the home
> dir is properly owned. This has two disadvantages:
> 
> 1. It's slow. In particular on large home dirs, it takes a while to go
>    through the whole user's homedir tree and chown/adjust ACLs for
>    everything.
> 
> 2. Because it is so slow we take a shortcut right now: if the
>    top-level home dir inode itself is owned by the correct user, we
>    skip the recursive chowning. This means in the typical case where a
>    user uses the same system most of the time, and thus the UID is
>    stable we can avoid the slowness. But this comes at a drawback: if
>    the user for some reason ends up with files in their homedir owned
>    by an unrelated user, then we'll never notice or readjust.
> 
> > If the goal is to solve fragmented administration of uid assignment I
> > suggest that it might be better to solve the administration problem so
> > that all of the uids of interest get assigned the same way on all of the
> > systems of interest.
> 
> Well, the goal is to make things simple and be able to use the home
> dir everywhere without any prior preparation, without central UID
> assignment authority.
> 
> The goal is to have a scheme that requires no administration, by
> making the UID management problem go away. Hence, if you suggest
> solving this by having a central administrative authority: this is
> exactly what the model wants to get away from.
> 
> Or to say this differently: just because I personally use three
> different computers, I certainly don't want to set up LDAP or sync
> UIDs manually.
> 
> Lennart
> 
> --
> Lennart Poettering, Berlin

Can you help me understand systemd-homed a little bit?

In the man page it says:

systemd-homed is a system service that may be used to create, remove, change or 
inspect home areas (directories and network mounts and real or loopback block 
devices with a filesystem, optionally encrypted).

It seems that the "underlay?" (If you'll call it that, maybe there is a better 
term) can either be a standalone block device (this sounds close to systemd 
machined?), a btrfs subvolume (which receives its own superblock (IIRC?, I might 
be wrong. It's been a while since I've used btrfs), or just be a directory 
that's mapped?

What decides whether it's just a directory and bind-mounted (or a similar 
vfsmount), or an actual superblock?

How is the mapping of "real UIDs" to "namespace UIDs" works when it's just a 
bind mount? From the perspective of multiple user namespaces, are all 
"underlying" UIDs mapped through, or if I try to look at another user's
home directory will they not show up?

Is there a reason you can't / don't / wont use overlayfs instead of bind mounts?

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


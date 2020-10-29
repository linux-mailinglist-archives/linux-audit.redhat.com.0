Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D3A8229F10A
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 17:16:56 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-wh0YAGjoOG6Vpc2s2uSW7A-1; Thu, 29 Oct 2020 12:16:53 -0400
X-MC-Unique: wh0YAGjoOG6Vpc2s2uSW7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 034E757208;
	Thu, 29 Oct 2020 16:16:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4E2D6EF40;
	Thu, 29 Oct 2020 16:16:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2E8E5810D;
	Thu, 29 Oct 2020 16:16:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09TGFRjx031776 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 29 Oct 2020 12:15:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 991A1100417B; Thu, 29 Oct 2020 16:15:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 949391004C4C
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 16:15:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E99F811E8F
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 16:15:23 +0000 (UTC)
Received: from gardel.0pointer.net (gardel.0pointer.net [85.214.157.71])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-561-v4dxnI3NPaSjb0dcWdIxqQ-1; Thu, 29 Oct 2020 12:15:18 -0400
X-MC-Unique: v4dxnI3NPaSjb0dcWdIxqQ-1
Received: from gardel-login.0pointer.net (gardel.0pointer.net [85.214.157.71])
	by gardel.0pointer.net (Postfix) with ESMTP id 8D3CAE80409;
	Thu, 29 Oct 2020 17:05:05 +0100 (CET)
Received: by gardel-login.0pointer.net (Postfix, from userid 1000)
	id E22A4160834; Thu, 29 Oct 2020 17:05:03 +0100 (CET)
Date: Thu, 29 Oct 2020 17:05:02 +0100
From: Lennart Poettering <lennart@poettering.net>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH 00/34] fs: idmapped mounts
Message-ID: <20201029160502.GA333141@gardel-login>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<87pn51ghju.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
In-Reply-To: <87pn51ghju.fsf@x220.int.ebiederm.org>
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
X-Mailman-Approved-At: Thu, 29 Oct 2020 12:16:30 -0400
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

On Do, 29.10.20 10:47, Eric W. Biederman (ebiederm@xmission.com) wrote:

> Is that the use case you are looking at removing the need for
> systemd-homed to avoid chowning after lugging encrypted home directories
> from one system to another?  Why would it be desirable to avoid the
> chown?

Yes, I am very interested in seeing Christian's work succeed, for the
usecase in systemd-homed. In systemd-homed each user gets their own
private file system, and these fs shall be owned by the user's local
UID, regardless in which system it is used. The UID should be an
artifact of the local, individual system in this model, and thus
the UID on of the same user/home on system A might be picked as 1010
and on another as 1543, and on a third as 1323, and it shouldn't
matter. This way, home directories become migratable without having to
universially sync UID assignments: it doesn't matter anymore what the
local UID is.

Right now we do a recursive chown() at login time to ensure the home
dir is properly owned. This has two disadvantages:

1. It's slow. In particular on large home dirs, it takes a while to go
   through the whole user's homedir tree and chown/adjust ACLs for
   everything.

2. Because it is so slow we take a shortcut right now: if the
   top-level home dir inode itself is owned by the correct user, we
   skip the recursive chowning. This means in the typical case where a
   user uses the same system most of the time, and thus the UID is
   stable we can avoid the slowness. But this comes at a drawback: if
   the user for some reason ends up with files in their homedir owned
   by an unrelated user, then we'll never notice or readjust.

> If the goal is to solve fragmented administration of uid assignment I
> suggest that it might be better to solve the administration problem so
> that all of the uids of interest get assigned the same way on all of the
> systems of interest.

Well, the goal is to make things simple and be able to use the home
dir everywhere without any prior preparation, without central UID
assignment authority.

The goal is to have a scheme that requires no administration, by
making the UID management problem go away. Hence, if you suggest
solving this by having a central administrative authority: this is
exactly what the model wants to get away from.

Or to say this differently: just because I personally use three
different computers, I certainly don't want to set up LDAP or sync
UIDs manually.

Lennart

--
Lennart Poettering, Berlin

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 22BC92A463F
	for <lists+linux-audit@lfdr.de>; Tue,  3 Nov 2020 14:24:24 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-TbIoSe9YMwCNFjbnuA_l8g-1; Tue, 03 Nov 2020 08:24:04 -0500
X-MC-Unique: TbIoSe9YMwCNFjbnuA_l8g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E246101F010;
	Tue,  3 Nov 2020 13:23:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B7D37E160;
	Tue,  3 Nov 2020 13:23:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF78B18095FF;
	Tue,  3 Nov 2020 13:23:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A2DY23E028624 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 08:34:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 99AA72156A3C; Mon,  2 Nov 2020 13:34:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 956192156A3B
	for <linux-audit@redhat.com>; Mon,  2 Nov 2020 13:34:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1ECE2102F1E0
	for <linux-audit@redhat.com>; Mon,  2 Nov 2020 13:34:00 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-22-mnt_5Z0aOKKWfdVEQL3k8A-1; Mon, 02 Nov 2020 08:33:58 -0500
X-MC-Unique: mnt_5Z0aOKKWfdVEQL3k8A-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1kZZxl-0007ym-Lt; Mon, 02 Nov 2020 13:33:33 +0000
Date: Mon, 2 Nov 2020 14:33:31 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 01/34] namespace: take lock_mount_hash() directly when
	changing flags
Message-ID: <20201102133331.66v4hxtmlnjrucnn@wittgenstein>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<20201029003252.2128653-2-christian.brauner@ubuntu.com>
	<20201101144108.GA23378@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20201101144108.GA23378@infradead.org>
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
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:23:38 -0500
Cc: Phil Estes <estesp@gmail.com>, Lennart Poettering <lennart@poettering.net>,
	Amir Goldstein <amir73il@gmail.com>, Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	containers@lists.linux-foundation.org, Tycho Andersen <tycho@tycho.ws>,
	Miklos Szeredi <miklos@szeredi.hu>,
	James Morris <jmorris@namei.org>, smbarber@chromium.org,
	linux-ext4@vger.kernel.org, Mrunal Patel <mpatel@redhat.com>,
	Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
	Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>,
	linux-fsdevel@vger.kernel.org, Aleksa Sarai <cyphar@cyphar.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andy Lutomirski <luto@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Geoffrey Thomas <geofft@ldpreload.com>,
	David Howells <dhowells@redhat.com>,
	John Johansen <john.johansen@canonical.com>, Theodore Tso <tytso@mit.edu>,
	Seth Forshee <seth.forshee@canonical.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-unionfs@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-api@vger.kernel.org, Alban Crequy <alban@kinvolk.io>,
	linux-integrity@vger.kernel.org, St??phane Graber <stgraber@ubuntu.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Nov 01, 2020 at 02:41:08PM +0000, Christoph Hellwig wrote:
> > index cebaa3e81794..20ee291a7af4 100644
> > --- a/fs/namespace.c
> > +++ b/fs/namespace.c
> > @@ -463,7 +463,6 @@ static int mnt_make_readonly(struct mount *mnt)
> >  {
> >  	int ret = 0;
> >  
> > -	lock_mount_hash();
> 
> What about adding a lockdep_assert_lock_held in all the functions
> that used to take the lock to document the assumptions?

Good idea and will do. I wanted to do this but then didn't because I
haven't seen widespread use of lockdep assert in fs/namespace.c.

> 
> >  static int __mnt_unmake_readonly(struct mount *mnt)
> >  {
> > -	lock_mount_hash();
> >  	mnt->mnt.mnt_flags &= ~MNT_READONLY;
> > -	unlock_mount_hash();
> >  	return 0;
> 
> This helper is rather pointless now.

Ok, will remove.

> 
> >  static void set_mount_attributes(struct mount *mnt, unsigned int mnt_flags)
> >  {
> > -	lock_mount_hash();
> >  	mnt_flags |= mnt->mnt.mnt_flags & ~MNT_USER_SETTABLE_MASK;
> >  	mnt->mnt.mnt_flags = mnt_flags;
> >  	touch_mnt_namespace(mnt->mnt_ns);
> > -	unlock_mount_hash();
> 
> In linux-next there is an additional notify_mount after the unlock here.

Thanks! I can try rebasing on -next.

> 
> Also while you touch this lock_mount_hash/unlock_mount_hash could be
> moved to namespace.c and maked static now.

Ok, will try to do that.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


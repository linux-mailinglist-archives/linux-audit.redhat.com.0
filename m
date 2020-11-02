Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 719462A463A
	for <lists+linux-audit@lfdr.de>; Tue,  3 Nov 2020 14:24:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-Ioj0vGWrMzaRdYDuHm0pDg-1; Tue, 03 Nov 2020 08:24:04 -0500
X-MC-Unique: Ioj0vGWrMzaRdYDuHm0pDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E8B78014D8;
	Tue,  3 Nov 2020 13:23:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CE661E2;
	Tue,  3 Nov 2020 13:23:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19C7118095FF;
	Tue,  3 Nov 2020 13:23:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A2DU6sG027194 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 08:30:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0F99B200E21E; Mon,  2 Nov 2020 13:30:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B75A200E214
	for <linux-audit@redhat.com>; Mon,  2 Nov 2020 13:30:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2A36800296
	for <linux-audit@redhat.com>; Mon,  2 Nov 2020 13:30:03 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-550-xfY5bNsMP7-_LlZTNIRdiw-1; Mon, 02 Nov 2020 08:30:01 -0500
X-MC-Unique: xfY5bNsMP7-_LlZTNIRdiw-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1kZZtu-0007a7-Ep; Mon, 02 Nov 2020 13:29:34 +0000
Date: Mon, 2 Nov 2020 14:29:32 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 05/34] fs: introduce MOUNT_ATTR_IDMAP
Message-ID: <20201102132932.pseijsddvxo5hgpf@wittgenstein>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<20201029003252.2128653-6-christian.brauner@ubuntu.com>
	<20201101144544.GC23378@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20201101144544.GC23378@infradead.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Nov 01, 2020 at 02:45:44PM +0000, Christoph Hellwig wrote:
> On Thu, Oct 29, 2020 at 01:32:23AM +0100, Christian Brauner wrote:
> > Introduce a new mount bind mount property to allow idmapping mounts. The
> > MOUNT_ATTR_IDMAP flag can be set via the new mount_setattr() syscall
> > together with a file descriptor referring to a user namespace.
> 
> Shouldn't this go to the end of the series once all the infrastructure
> is in place?

Yeah, good idea. (I mostly did it to keep compile-times short when
rebasing.)

> 
> > +config IDMAP_MOUNTS
> > +	bool "Support id mappings per mount"
> > +	default n
> 
> n is the default default.

Ah, thanks.

> 
> But why do we need a config option here anyway?

My main concern was people complaining about code they want to compile
out. I've been burnt by that before but I'm happy to remove the config
option and make this unconditional.

> 
> > +#ifdef CONFIG_IDMAP_MOUNTS
> > +		if (kattr->attr_set & MNT_IDMAPPED) {
> > +			struct user_namespace *user_ns;
> > +			struct vfsmount *vmnt;
> 
> All the code here looks like it should go into a helper.

Will do.

> 
> > +				struct user_namespace *user_ns = READ_ONCE(m->mnt.mnt_user_ns);
> > +				WRITE_ONCE(m->mnt.mnt_user_ns, get_user_ns(kattr->userns));
> 
> More unreadable long lines.

Will wrap. I have somewhat adapted to the more lax 100 limit but I'm
happy to stick to 80.

> 
> > +	if (attr->attr_set & MOUNT_ATTR_IDMAP) {
> > +		struct ns_common *ns;
> > +		struct user_namespace *user_ns;
> > +		struct file *file;
> > +
> > +		file = fget(attr->userns);
> 
> The code here looks like another candidate for a self contained helper.

Noted.

> 
> > +
> > +static inline struct user_namespace *mnt_user_ns(const struct vfsmount *mnt)
> > +{
> > +#ifdef CONFIG_IDMAP_MOUNTS
> > +	return READ_ONCE(mnt->mnt_user_ns);
> > +#else
> > +	return &init_user_ns;
> > +#endif
> 
> How is the READ_ONCE on a pointer going to work?

Honestly, this is me following a pattern I've seen in other places and
it's mostly about visually indicating concurrency but I'll drop it.

Christian

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2104D2A4635
	for <lists+linux-audit@lfdr.de>; Tue,  3 Nov 2020 14:24:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-KgCJNQv-O02oyhQTJqoluw-1; Tue, 03 Nov 2020 08:23:59 -0500
X-MC-Unique: KgCJNQv-O02oyhQTJqoluw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBA2710199AB;
	Tue,  3 Nov 2020 13:23:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE14E5B4D6;
	Tue,  3 Nov 2020 13:23:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7ECF68C7C9;
	Tue,  3 Nov 2020 13:23:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A2DO8MM026858 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 08:24:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4682C2156720; Mon,  2 Nov 2020 13:24:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41F72215670C
	for <linux-audit@redhat.com>; Mon,  2 Nov 2020 13:24:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDCCD1078503
	for <linux-audit@redhat.com>; Mon,  2 Nov 2020 13:24:05 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-93-2HPaO5JdMwyhBBjKwstm_Q-1; Mon, 02 Nov 2020 08:24:03 -0500
X-MC-Unique: 2HPaO5JdMwyhBBjKwstm_Q-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1kZZoC-00072k-J9; Mon, 02 Nov 2020 13:23:40 +0000
Date: Mon, 2 Nov 2020 14:23:38 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 07/34] capability: handle idmapped mounts
Message-ID: <20201102132338.ocq7z4oyn3aholi4@wittgenstein>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<20201029003252.2128653-8-christian.brauner@ubuntu.com>
	<20201101144809.GE23378@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20201101144809.GE23378@infradead.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Nov 01, 2020 at 02:48:09PM +0000, Christoph Hellwig wrote:
> >  /**
> >   * capable_wrt_inode_uidgid - Check nsown_capable and uid and gid mapped
> >   * @inode: The inode in question
> > @@ -501,9 +513,7 @@ bool privileged_wrt_inode_uidgid(struct user_namespace *ns, const struct inode *
> >   */
> >  bool capable_wrt_inode_uidgid(const struct inode *inode, int cap)
> >  {
> > +	return capable_wrt_mapped_inode_uidgid(&init_user_ns, inode, cap);
> >  }
> >  EXPORT_SYMBOL(capable_wrt_inode_uidgid);
> 
> Please avoid these silly wrappers and just switch all callers to pass
> the namespaces instead of creating boilerplate code.  Same for the other
> functions where you do this even even worse the method calls.

Christoph,

Thanks for the review!  

Ok, so I'll switch:
- all helpers to take an additional argument
  (capable_wrt_inode_uidgid()/inode_permission()/vfs_*() etc.)
- all inode method calls to take an additional argument (I assume that's
  what you're referring to: ->create()/->mknod()/->mkdir() etc.)
  I've always assumed that this is what we'd be doing in the end anyway
  (I've mentioned it in the commit message for the inode_operations
  method's. This will be a bit of work but we can get that done!)

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


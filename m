Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 70BFE2C342E
	for <lists+linux-audit@lfdr.de>; Tue, 24 Nov 2020 23:45:42 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-nSduFSkwMSix3fXrtFxuwg-1; Tue, 24 Nov 2020 17:45:37 -0500
X-MC-Unique: nSduFSkwMSix3fXrtFxuwg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 934A51015C83;
	Tue, 24 Nov 2020 22:45:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74C165D9C0;
	Tue, 24 Nov 2020 22:45:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D26C74E58E;
	Tue, 24 Nov 2020 22:45:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AOE0AXC023386 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 09:00:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 24CFE80546; Tue, 24 Nov 2020 14:00:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B26682867
	for <linux-audit@redhat.com>; Tue, 24 Nov 2020 14:00:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E41AE800296
	for <linux-audit@redhat.com>; Tue, 24 Nov 2020 14:00:06 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-288-ZPLON7wjNzqiE0VuEba6sw-1; Tue, 24 Nov 2020 09:00:02 -0500
X-MC-Unique: ZPLON7wjNzqiE0VuEba6sw-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1khYrD-0002SV-VO; Tue, 24 Nov 2020 13:59:48 +0000
Date: Tue, 24 Nov 2020 14:59:46 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Tycho Andersen <tycho@tycho.pizza>
Subject: Re: [PATCH v2 07/39] mount: attach mappings to mounts
Message-ID: <20201124135946.27krt6za2qapyx43@wittgenstein>
References: <20201115103718.298186-1-christian.brauner@ubuntu.com>
	<20201115103718.298186-8-christian.brauner@ubuntu.com>
	<20201123154719.GD4025434@cisco> <20201123162428.GA24807@cisco>
	<20201124123035.hbv4sstyoucht7xp@wittgenstein>
	<20201124133740.GA52954@cisco>
	<20201124134035.2l36avuaqp6gxyum@wittgenstein>
	<20201124134459.GB52954@cisco>
MIME-Version: 1.0
In-Reply-To: <20201124134459.GB52954@cisco>
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
X-Mailman-Approved-At: Tue, 24 Nov 2020 17:45:20 -0500
Cc: Andy Lutomirski <luto@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
	smbarber@chromium.org, Christoph Hellwig <hch@infradead.org>,
	Alban Crequy <alban@kinvolk.io>, linux-ext4@vger.kernel.org,
	Mrunal Patel <mpatel@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>,
	Seth Forshee <seth.forshee@canonical.com>,
	Aleksa Sarai <cyphar@cyphar.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Lennart Poettering <lennart@poettering.net>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Geoffrey Thomas <geofft@ldpreload.com>,
	David Howells <dhowells@redhat.com>,
	John Johansen <john.johansen@canonical.com>, Theodore Tso <tytso@mit.edu>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	containers@lists.linux-foundation.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 24, 2020 at 08:44:59AM -0500, Tycho Andersen wrote:
> On Tue, Nov 24, 2020 at 02:40:35PM +0100, Christian Brauner wrote:
> > On Tue, Nov 24, 2020 at 08:37:40AM -0500, Tycho Andersen wrote:
> > > On Tue, Nov 24, 2020 at 01:30:35PM +0100, Christian Brauner wrote:
> > > > On Mon, Nov 23, 2020 at 11:24:28AM -0500, Tycho Andersen wrote:
> > > > > On Mon, Nov 23, 2020 at 10:47:19AM -0500, Tycho Andersen wrote:
> > > > > > On Sun, Nov 15, 2020 at 11:36:46AM +0100, Christian Brauner wrote:
> > > > > > > +static inline struct user_namespace *mnt_user_ns(const struct vfsmount *mnt)
> > > > > > > +{
> > > > > > > +	return mnt->mnt_user_ns;
> > > > > > > +}
> > > > > > 
> > > > > > I think you might want a READ_ONCE() here. Right now it seems ok, since the
> > > > > > mnt_user_ns can't change, but if we ever allow it to change (and I see you have
> > > > > > a idmapped_mounts_wip_v2_allow_to_change_idmapping branch on your public tree
> > > > > > :D), the pattern of,
> > > > > > 
> > > > > >         user_ns = mnt_user_ns(path->mnt);
> > > > > >         if (mnt_idmapped(path->mnt)) {
> > > > > >                 uid = kuid_from_mnt(user_ns, uid);
> > > > > >                 gid = kgid_from_mnt(user_ns, gid);
> > > > > >         }
> > > > > > 
> > > > > > could race.
> > > > > 
> > > > > Actually, isn't a race possible now?
> > > > > 
> > > > > kuid_from_mnt(mnt_user_ns(path->mnt) /* &init_user_ns */);
> > > > > WRITE_ONCE(mnt->mnt.mnt_user_ns, user_ns);
> > > > > WRITE_ONCE(m->mnt.mnt_flags, flags);
> > > > > kgid_from_mnt(mnt_user_ns(path->mnt) /* the right user ns */);
> > > > > 
> > > > > So maybe it should be:
> > > > > 
> > > > >          if (mnt_idmapped(path->mnt)) {
> > > > >                  barrier();
> > > > >                  user_ns = mnt_user_ns(path->mnt);
> > > > >                  uid = kuid_from_mnt(user_ns, uid);
> > > > >                  gid = kgid_from_mnt(user_ns, gid);
> > > > >          }
> > > > > 
> > > > > since there's no data dependency between mnt_idmapped() and
> > > > > mnt_user_ns()?
> > > > 
> > > > I think I had something to handle this case in another branch of mine.
> > > > The READ_ONCE() you mentioned in another patch I had originally dropped
> > > > because I wasn't sure whether it works on pointers but after talking to
> > > > Jann and David it seems that it handles pointers fine.
> > > > Let me take a look and fix it in the next version. I just finished
> > > > porting the test suite to xfstests as Christoph requested and I'm
> > > > looking at this now.
> > > 
> > > Another way would be to just have mnt_idmapped() test
> > > mnt_user_ns() != &init_user_ns instead of the flags; then I think you
> > > get the data dependency and thus correct ordering for free.
> > 
> > I indeed dropped mnt_idmapped() which is unnecessary. :)
> 
> It still might be a nice helper to prevent people from checking the
> flags and forgetting that there's a memory ordering issue, though.

I just mentioned this offline but for the record: the flag is gone since
we can rely on the pointer alone. :)

Christian

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


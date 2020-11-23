Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DDD272C104B
	for <lists+linux-audit@lfdr.de>; Mon, 23 Nov 2020 17:30:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-Ya2EBKRuNJaYoB_CRLwIDg-1; Mon, 23 Nov 2020 11:30:47 -0500
X-MC-Unique: Ya2EBKRuNJaYoB_CRLwIDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A95B106F6F2;
	Mon, 23 Nov 2020 16:30:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8AF05C1BD;
	Mon, 23 Nov 2020 16:30:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 601D65002C;
	Mon, 23 Nov 2020 16:30:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ANGOlnv019053 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 11:24:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3B6905F254; Mon, 23 Nov 2020 16:24:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3617A5F253
	for <linux-audit@redhat.com>; Mon, 23 Nov 2020 16:24:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D80C103B801
	for <linux-audit@redhat.com>; Mon, 23 Nov 2020 16:24:44 +0000 (UTC)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
	[66.111.4.230]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-358-Efo7EbmpMBmiX3POuNGwjw-1; Mon, 23 Nov 2020 11:24:39 -0500
X-MC-Unique: Efo7EbmpMBmiX3POuNGwjw-1
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id 74EC3580370;
	Mon, 23 Nov 2020 11:24:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute6.internal (MEProxy); Mon, 23 Nov 2020 11:24:39 -0500
X-ME-Sender: <xms:ROK7XwG4HmiTg6r-VtpaxQ8BUu5C7WtH7yBcDEY0pBc-xjHzCsqNmA>
	<xme:ROK7X5VaR7V6uDdE9dSztt7S7p_Nppv_Cqmy0ebDwP52dvBRPHRpx0s9-CG7CcIa_
	Gy7KnQpIy3MT8M_XjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgledtucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhigthhho
	ucetnhguvghrshgvnhcuoehthigthhhosehthigthhhordhpihiiiigrqeenucggtffrrg
	htthgvrhhnpeegkeefjeegkedtjefgfeduleekueetjeeghffhuefgffefleehgeeifedv
	gfethfenucfkphepuddvkedruddtjedrvdeguddrudejgeenucevlhhushhtvghrufhiii
	gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehthigthhhosehthigthhhordhpihii
	iigr
X-ME-Proxy: <xmx:ROK7X6LHf_mNExSBh-HxxcJKsQe01xb9FDOEOXarK8KYqYlrbdHcCA>
	<xmx:ROK7XyH4_tINpnuCxhWINI4B9cIUYfNZv_XFfRLd4ZrRCLzGrQy2sw>
	<xmx:ROK7X2UQLYJyie5vQRGBHgE4Xffguht8EUxvPlpHJ4ctfCLhIShHNg>
	<xmx:R-K7Xw33IJLVlu-7Jj36Cl8q_gbpZ3FG0VNLOTRskavmAPFl1i_qcA>
Received: from cisco (unknown [128.107.241.174])
	by mail.messagingengine.com (Postfix) with ESMTPA id 652D83280060;
	Mon, 23 Nov 2020 11:24:30 -0500 (EST)
Date: Mon, 23 Nov 2020 11:24:28 -0500
From: Tycho Andersen <tycho@tycho.pizza>
To: Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH v2 07/39] mount: attach mappings to mounts
Message-ID: <20201123162428.GA24807@cisco>
References: <20201115103718.298186-1-christian.brauner@ubuntu.com>
	<20201115103718.298186-8-christian.brauner@ubuntu.com>
	<20201123154719.GD4025434@cisco>
MIME-Version: 1.0
In-Reply-To: <20201123154719.GD4025434@cisco>
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
X-Mailman-Approved-At: Mon, 23 Nov 2020 11:30:29 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 23, 2020 at 10:47:19AM -0500, Tycho Andersen wrote:
> On Sun, Nov 15, 2020 at 11:36:46AM +0100, Christian Brauner wrote:
> > +static inline struct user_namespace *mnt_user_ns(const struct vfsmount *mnt)
> > +{
> > +	return mnt->mnt_user_ns;
> > +}
> 
> I think you might want a READ_ONCE() here. Right now it seems ok, since the
> mnt_user_ns can't change, but if we ever allow it to change (and I see you have
> a idmapped_mounts_wip_v2_allow_to_change_idmapping branch on your public tree
> :D), the pattern of,
> 
>         user_ns = mnt_user_ns(path->mnt);
>         if (mnt_idmapped(path->mnt)) {
>                 uid = kuid_from_mnt(user_ns, uid);
>                 gid = kgid_from_mnt(user_ns, gid);
>         }
> 
> could race.

Actually, isn't a race possible now?

kuid_from_mnt(mnt_user_ns(path->mnt) /* &init_user_ns */);
WRITE_ONCE(mnt->mnt.mnt_user_ns, user_ns);
WRITE_ONCE(m->mnt.mnt_flags, flags);
kgid_from_mnt(mnt_user_ns(path->mnt) /* the right user ns */);

So maybe it should be:

         if (mnt_idmapped(path->mnt)) {
                 barrier();
                 user_ns = mnt_user_ns(path->mnt);
                 uid = kuid_from_mnt(user_ns, uid);
                 gid = kgid_from_mnt(user_ns, gid);
         }

since there's no data dependency between mnt_idmapped() and
mnt_user_ns()?

Tycho

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


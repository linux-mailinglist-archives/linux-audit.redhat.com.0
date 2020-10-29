Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E60B129F6BD
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 22:21:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-mFjeZ7llP0yXQ6WXHHE4SA-1; Thu, 29 Oct 2020 17:21:32 -0400
X-MC-Unique: mFjeZ7llP0yXQ6WXHHE4SA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8B9310866AE;
	Thu, 29 Oct 2020 21:21:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B96F55761;
	Thu, 29 Oct 2020 21:21:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE45C181A06B;
	Thu, 29 Oct 2020 21:21:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09TL6cfa003789 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 29 Oct 2020 17:06:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 956D02166BD9; Thu, 29 Oct 2020 21:06:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F00D2157F45
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 21:06:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F66885829E
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 21:06:36 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
	[66.111.4.229]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-377-UFmqhyVLPqKc_6-OIgdZCA-1; Thu, 29 Oct 2020 17:06:33 -0400
X-MC-Unique: UFmqhyVLPqKc_6-OIgdZCA-1
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id 822B35807DF;
	Thu, 29 Oct 2020 17:06:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute6.internal (MEProxy); Thu, 29 Oct 2020 17:06:33 -0400
X-ME-Sender: <xms:1S6bX5X0UpnxyWSs_x7M_oxu-FyVmL880_Mr3lEYdR-yw_cxrFHMCg>
	<xme:1S6bX5kdYsfSJKzOWQAyfTttpu45AyIzE57ThzMTJJXOtdDqDR41UEF0KSvkYX9hK
	JkZ2QgjUrpBO_8LvQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgddugeegucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhigthhho
	ucetnhguvghrshgvnhcuoehthigthhhosehthigthhhordhpihiiiigrqeenucggtffrrg
	htthgvrhhnpeegkeefjeegkedtjefgfeduleekueetjeeghffhuefgffefleehgeeifedv
	gfethfenucfkphepuddvkedruddtjedrvdeguddrudekieenucevlhhushhtvghrufhiii
	gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehthigthhhosehthigthhhordhpihii
	iigr
X-ME-Proxy: <xmx:1S6bX1ZoyvmB-RXkwwzrD6Q2oIf_1ESIdFCLVwDWTBuqTDS4YVnfhw>
	<xmx:1S6bX8UcFz20aS5YwXGNV9AwhLoFcNUpLxr_kFg2lSHXJMZveaRo7Q>
	<xmx:1S6bXzkCkF5oVC1WJcury6tjEZs37W-4ObyK7W01GC8zfQszN60ZDw>
	<xmx:2S6bX06A-ibhhoXoh2nrAb9pUxvin50aNgPjmRu-yzswG5hG0IICjw>
Received: from cisco (unknown [128.107.241.186])
	by mail.messagingengine.com (Postfix) with ESMTPA id C96743280065;
	Thu, 29 Oct 2020 17:06:22 -0400 (EDT)
Date: Thu, 29 Oct 2020 15:06:20 -0600
From: Tycho Andersen <tycho@tycho.pizza>
To: Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH 00/34] fs: idmapped mounts
Message-ID: <20201029210620.GB135035@cisco>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<20201029022733.GB306023@dread.disaster.area>
	<20201029161920.zp7p3335x3q2a36e@wittgenstein>
MIME-Version: 1.0
In-Reply-To: <20201029161920.zp7p3335x3q2a36e@wittgenstein>
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
X-Mailman-Approved-At: Thu, 29 Oct 2020 17:21:09 -0400
Cc: Andy Lutomirski <luto@kernel.org>, Dave Chinner <david@fromorbit.com>,
	Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Miklos Szeredi <miklos@szeredi.hu>, smbarber@chromium.org,
	Christoph Hellwig <hch@infradead.org>,
	linux-ext4@vger.kernel.org, Mrunal Patel <mpatel@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
	selinux@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>,
	Seth Forshee <seth.forshee@canonical.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Lennart Poettering <lennart@poettering.net>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Geoffrey Thomas <geofft@ldpreload.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John Johansen <john.johansen@canonical.com>, Theodore Tso <tytso@mit.edu>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	containers@lists.linux-foundation.org,
	Jonathan Corbet <corbet@lwn.net>, linux-unionfs@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Alban Crequy <alban@kinvolk.io>, linux-integrity@vger.kernel.org,
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

On Thu, Oct 29, 2020 at 05:19:20PM +0100, Christian Brauner wrote:
> This approach (always) seemed conceptually wrong to me. Like Tycho said
> somewhere else this basically would act like a global variable which
> isn't great.

Elaborating on this a bit: the way Christian has organized this series
(by adding a parameter to the various inode operations) forces people
to make a choice about what user namespace to pass. They can of course
make the wrong choice, but that will show up in a diff somewhere, and
hopefully someone will notice.

If we pass things via current-> somewhere, people could potentially
avoid making this choice, and then we wind more of the kinds of bugs
Eric is worried about elsewhere in the thread.

While it does result in larger patches initally, requiring people to
reason about it explicitly is the right move, IMO.

Tycho

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


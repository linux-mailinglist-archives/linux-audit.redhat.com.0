Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E4CBD2C0F44
	for <lists+linux-audit@lfdr.de>; Mon, 23 Nov 2020 16:52:16 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-9Y3D3xKjOe679Gkz33soMA-1; Mon, 23 Nov 2020 10:52:14 -0500
X-MC-Unique: 9Y3D3xKjOe679Gkz33soMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B64C100960E;
	Mon, 23 Nov 2020 15:51:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E33E95D6D3;
	Mon, 23 Nov 2020 15:51:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D3592180954D;
	Mon, 23 Nov 2020 15:51:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ANFldXO014691 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 10:47:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 25D342166B2B; Mon, 23 Nov 2020 15:47:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20E5A2166B27
	for <linux-audit@redhat.com>; Mon, 23 Nov 2020 15:47:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A27D811E85
	for <linux-audit@redhat.com>; Mon, 23 Nov 2020 15:47:36 +0000 (UTC)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
	[66.111.4.230]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-172-vzsgBE0QOqO-XSQoLhE3vA-1; Mon, 23 Nov 2020 10:47:31 -0500
X-MC-Unique: vzsgBE0QOqO-XSQoLhE3vA-1
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id D00855803A4;
	Mon, 23 Nov 2020 10:47:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute6.internal (MEProxy); Mon, 23 Nov 2020 10:47:30 -0500
X-ME-Sender: <xms:kNm7X-6VybmnIE7HxBF78RbqSph39ZGAjm52Jziqp6YhvS6SutsV3g>
	<xme:kNm7X37G5hrBHr_ofSXlbfBd7NIArMQy5vyzjbdcfCZMiQhtsghJXDiLqbJDjXPbG
	4pkUDJOybMd7fnmfxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgkedvucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhigthhho
	ucetnhguvghrshgvnhcuoehthigthhhosehthigthhhordhpihiiiigrqeenucggtffrrg
	htthgvrhhnpeegkeefjeegkedtjefgfeduleekueetjeeghffhuefgffefleehgeeifedv
	gfethfenucfkphepuddvkedruddtjedrvdeguddrudejgeenucevlhhushhtvghrufhiii
	gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehthigthhhosehthigthhhordhpihii
	iigr
X-ME-Proxy: <xmx:kNm7X9cPIAKRhCP04Kj8q43f_nFo2EYWIGVCCaxjvTW9N8SJ8w8jVQ>
	<xmx:kNm7X7JU-QaZeelrk4qvOdP93F1LE0ucN_vNnd5Copq4DsgabUHEbQ>
	<xmx:kNm7XyLAnKZzuImxS6me0molLz2ayvhe0zjr3tUiP9xn0aaEnjdKTw>
	<xmx:ktm7X-pza5kZuwtkUTGD6q3OiEh8E1SHpU53XCgKODHJj5cEjL4fZA>
Received: from cisco (unknown [128.107.241.174])
	by mail.messagingengine.com (Postfix) with ESMTPA id C041D3064ABE;
	Mon, 23 Nov 2020 10:47:21 -0500 (EST)
Date: Mon, 23 Nov 2020 10:47:19 -0500
From: Tycho Andersen <tycho@tycho.pizza>
To: Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH v2 07/39] mount: attach mappings to mounts
Message-ID: <20201123154719.GD4025434@cisco>
References: <20201115103718.298186-1-christian.brauner@ubuntu.com>
	<20201115103718.298186-8-christian.brauner@ubuntu.com>
MIME-Version: 1.0
In-Reply-To: <20201115103718.298186-8-christian.brauner@ubuntu.com>
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
X-Mailman-Approved-At: Mon, 23 Nov 2020 10:51:29 -0500
Cc: Andy Lutomirski <luto@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
	smbarber@chromium.org, Christoph Hellwig <hch@infradead.org>,
	linux-ext4@vger.kernel.org, Mrunal Patel <mpatel@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
	selinux@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>,
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

On Sun, Nov 15, 2020 at 11:36:46AM +0100, Christian Brauner wrote:
> +static inline struct user_namespace *mnt_user_ns(const struct vfsmount *mnt)
> +{
> +	return mnt->mnt_user_ns;
> +}

I think you might want a READ_ONCE() here. Right now it seems ok, since the
mnt_user_ns can't change, but if we ever allow it to change (and I see you have
a idmapped_mounts_wip_v2_allow_to_change_idmapping branch on your public tree
:D), the pattern of,

        user_ns = mnt_user_ns(path->mnt);
        if (mnt_idmapped(path->mnt)) {
                uid = kuid_from_mnt(user_ns, uid);
                gid = kgid_from_mnt(user_ns, gid);
        }

could race.

Tycho

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A81BA2B7473
	for <lists+linux-audit@lfdr.de>; Wed, 18 Nov 2020 03:58:42 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-jjnsELkfMaKiGt_HIluG0g-1; Tue, 17 Nov 2020 21:58:39 -0500
X-MC-Unique: jjnsELkfMaKiGt_HIluG0g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6711F186DD37;
	Wed, 18 Nov 2020 02:58:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1EAB5D9CA;
	Wed, 18 Nov 2020 02:58:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0B69180B657;
	Wed, 18 Nov 2020 02:58:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AI03F4H012101 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Nov 2020 19:03:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B14A62011555; Wed, 18 Nov 2020 00:03:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC5642011551
	for <linux-audit@redhat.com>; Wed, 18 Nov 2020 00:03:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 763051021E19
	for <linux-audit@redhat.com>; Wed, 18 Nov 2020 00:03:13 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-178-VE1rFyQ2NwOwKy1vJHzrIw-1;
	Tue, 17 Nov 2020 19:03:09 -0500
X-MC-Unique: VE1rFyQ2NwOwKy1vJHzrIw-1
Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0326360C;
	Tue, 17 Nov 2020 23:54:34 +0000 (UTC)
Date: Tue, 17 Nov 2020 16:54:33 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH v2 00/39] fs: idmapped mounts
Message-ID: <20201117165433.316f5625@lwn.net>
In-Reply-To: <20201115103718.298186-1-christian.brauner@ubuntu.com>
References: <20201115103718.298186-1-christian.brauner@ubuntu.com>
Organization: LWN.net
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AI03F4H012101
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 17 Nov 2020 21:58:21 -0500
Cc: Phil Estes <estesp@gmail.com>, Lennart Poettering <lennart@poettering.net>,
	Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	containers@lists.linux-foundation.org, linux-api@vger.kernel.org,
	Andersen <tycho@tycho.ws>, James Morris <jmorris@namei.org>,
	smbarber@chromium.org, Christoph Hellwig <hch@infradead.org>,
	Stephen, linux-ext4@vger.kernel.org, Mrunal Patel <mpatel@redhat.com>,
	Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
	Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>, Tycho,
	linux-fsdevel@vger.kernel.org, Aleksa Sarai <cyphar@cyphar.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andy Lutomirski <luto@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Geoffrey Thomas <geofft@ldpreload.com>,
	Bottomley <James.Bottomley@hansenpartnership.com>,
	John Johansen <john.johansen@canonical.com>, Theodore Tso <tytso@mit.edu>,
	Seth Forshee <seth.forshee@canonical.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com, "Eric W.
	Biederman" <ebiederm@xmission.com>, James,
	Alban Crequy <alban@kinvolk.io>, linux-integrity@vger.kernel.org,
	=?UTF-8?B?U3TDqXBoYW5l?= Graber <stgraber@ubuntu.com>,
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

On Sun, 15 Nov 2020 11:36:39 +0100
Christian Brauner <christian.brauner@ubuntu.com> wrote:

One quick question...

> I have written a simple tool available at
> https://github.com/brauner/mount-idmapped that allows to create idmapped
> mounts so people can play with this patch series.

I spent a while looking at that tool.  When actually setting the namespace
for the mapping, it uses MOUNT_ATTR_SHIFT rather than MOUNT_ATTR_IDMAP.
The value is the same, so I expect it works...:)  But did that perhaps not
get updated to reflect a name change?

Thanks,

jon


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


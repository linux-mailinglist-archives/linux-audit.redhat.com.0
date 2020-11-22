Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E0CC32BFEB3
	for <lists+linux-audit@lfdr.de>; Mon, 23 Nov 2020 04:24:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-gjkv_Bd0OnCy8R9C2VnN3A-1; Sun, 22 Nov 2020 22:24:44 -0500
X-MC-Unique: gjkv_Bd0OnCy8R9C2VnN3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A535520F;
	Mon, 23 Nov 2020 03:24:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D2B660BF3;
	Mon, 23 Nov 2020 03:24:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 25E35180954D;
	Mon, 23 Nov 2020 03:24:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AMMHuOP018988 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 22 Nov 2020 17:17:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 48EB22026D14; Sun, 22 Nov 2020 22:17:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 449DA2026D12
	for <linux-audit@redhat.com>; Sun, 22 Nov 2020 22:17:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0399C103B800
	for <linux-audit@redhat.com>; Sun, 22 Nov 2020 22:17:54 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-161-8Z2l8BFdNBKr0vYOhCNxnQ-1; Sun, 22 Nov 2020 17:17:51 -0500
X-MC-Unique: 8Z2l8BFdNBKr0vYOhCNxnQ-1
Received: by mail-ej1-f67.google.com with SMTP id a16so20683904ejj.5
	for <linux-audit@redhat.com>; Sun, 22 Nov 2020 14:17:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T4CY2UVVySQTR/IgGfrcAE9Yvfw8Rpt8ESDEqvgdlV0=;
	b=iKxHTnYB0oiDsWkudZStizuqvOjjg8ElKuNNU29ZVKY00KnJIZKw5O63RSK4S/FyQl
	XsbDYtWzkJqrIb1Tm2xBnX48VmddH7tIka1yT+CdxTkOe85MEeYFLnHGI4vCD+bdzzaT
	P7KO4gS546C+FErVQ++Pl04OwlWikk5Jjullp8uF0bdw1tXBFzjjS6UJfmhCl1uN7Gw8
	dvZPWCyzkc53sMgLvYxUdPK18dKV5+a4WQ41IfjJW2yoRx/wdFog7LDlgqxeh+wvhbGH
	MvKwl3csEHaGFLYliyViQme3/lPJDF949qs94H+3hU01Bd52w45NtwsUqMc0p1JpNjRe
	hSFA==
X-Gm-Message-State: AOAM533WbYFcyN6JnNbJSzHxYpsyRQMp8Yx+5fzB6DrnD8MfomTncZ55
	Sd1Rb6wrb8l3rzYt8haxlCa3HNTzC/iqeKzlBO98
X-Google-Smtp-Source: ABdhPJw12xuRZoIeL/vGVBoUF4Pp6Vi1slczsoOA2TmXfkvzw8XIX8310DsMH/5qvds2YuOjg+U0QMN2daNuxBFO/6M=
X-Received: by 2002:a17:906:7c9:: with SMTP id
	m9mr40871916ejc.178.1606083470433; 
	Sun, 22 Nov 2020 14:17:50 -0800 (PST)
MIME-Version: 1.0
References: <20201115103718.298186-1-christian.brauner@ubuntu.com>
	<20201115103718.298186-32-christian.brauner@ubuntu.com>
In-Reply-To: <20201115103718.298186-32-christian.brauner@ubuntu.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 22 Nov 2020 17:17:39 -0500
Message-ID: <CAHC9VhQ5gcOa0+KKDtKEgg_v4SZV2hPdaKUbPGJAQrVB8mn0jA@mail.gmail.com>
Subject: Re: [PATCH v2 31/39] audit: handle idmapped mounts
To: Christian Brauner <christian.brauner@ubuntu.com>
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
X-Mailman-Approved-At: Sun, 22 Nov 2020 22:24:23 -0500
Cc: Phil Estes <estesp@gmail.com>, Lennart Poettering <lennart@poettering.net>,
	Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	containers@lists.linux-foundation.org, Tycho Andersen <tycho@tycho.ws>,
	Jonathan Corbet <corbet@lwn.net>,
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
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-api@vger.kernel.org, Alban Crequy <alban@kinvolk.io>,
	linux-integrity@vger.kernel.org,
	=?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@ubuntu.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Nov 15, 2020 at 5:43 AM Christian Brauner
<christian.brauner@ubuntu.com> wrote:
>
> Audit will sometimes log the inode's i_uid and i_gid. Enable audit to log the
> mapped inode when it is accessed from an idmapped mount.

I mentioned this in an earlier patch in this patchset, but it is worth
repeating here: audit currently records information in the context of
the initial/host namespace and I believe it should probably stay that
way until the rest of the namespace smarts that Richard is working on
is merged.  If we do change the context of the inode's UID and GID
information it has the potential to create a rather odd looking audit
record with inconsistent credentials and the filters would yield some
very interesting results.

> Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
> ---
> /* v2 */
> unchanged
> ---
>  fs/namei.c            | 14 +++++++-------
>  include/linux/audit.h | 10 ++++++----
>  ipc/mqueue.c          |  8 ++++----
>  kernel/auditsc.c      | 26 ++++++++++++++------------
>  4 files changed, 31 insertions(+), 27 deletions(-)

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


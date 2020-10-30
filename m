Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CFFD52A0580
	for <lists+linux-audit@lfdr.de>; Fri, 30 Oct 2020 13:34:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-bqbCeebwOriHb24uILByag-1; Fri, 30 Oct 2020 08:34:02 -0400
X-MC-Unique: bqbCeebwOriHb24uILByag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4726D18C9F44;
	Fri, 30 Oct 2020 12:33:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D29596EF40;
	Fri, 30 Oct 2020 12:33:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 70F86180B658;
	Fri, 30 Oct 2020 12:33:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09U9vg6L030793 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 05:57:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B7C8C115D7BD; Fri, 30 Oct 2020 09:57:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B35E6115D7B9
	for <linux-audit@redhat.com>; Fri, 30 Oct 2020 09:57:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5371B185A790
	for <linux-audit@redhat.com>; Fri, 30 Oct 2020 09:57:40 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-226-3DBMADXnNxuVDH1sp9q_ng-1; Fri, 30 Oct 2020 05:57:36 -0400
X-MC-Unique: 3DBMADXnNxuVDH1sp9q_ng-1
Received: by mail-il1-f196.google.com with SMTP id a20so5934576ilk.13;
	Fri, 30 Oct 2020 02:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/KHmwpEf5KO59HQ9FXioTrkHMQnSCZyA82voNpwNnxU=;
	b=Y2SpD0lIqJ4h2SA+dAgRYiOk8/sLyTninw1FNCMmCgjbzcT+bge4Qf+bGVKM3g1I3P
	BkXDp/+xqB3V/ogDrOaHNIcOXLuNazWcRnlYCGRor6yvJDkUkdBxtxb3tBB63KJGljdY
	BPdpd/wjzdLEG9CPdD5S01UI3RD2nt1Z7lCh7PMr/XlRdJUKTuGeGK/g4wxV4TL+bdoz
	J4rPOv3WJzZNOVu9+AZxuW3Qh8b98iR3mfTAhDeZfeelfwOwgikkV0ck+V95Hs9x5E6e
	C7cenBoIkceY+7TvQRGe9M2I8B1B396JAkheigw3ZVoEzTuRwBO2xVKuGTGQOuE295tn
	E/5A==
X-Gm-Message-State: AOAM531TWBnoG3OAhMYJ1s9pbufIud0XptODyocbTBxB5g1E5HlI7uDf
	Aej9jlDWRsVUWgCIooFcGPUCCTYaHHErBjAfjO0=
X-Google-Smtp-Source: ABdhPJxFlt//ACc/IV26fZ1qCGgWOIH/npCA4rcrvS/8aohcRHMILRDfiUHL83JStMqAq2lFcdcahBWGZNVdziI1h1E=
X-Received: by 2002:a05:6e02:14c9:: with SMTP id
	o9mr1218968ilk.137.1604051855144; 
	Fri, 30 Oct 2020 02:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<20201029003252.2128653-34-christian.brauner@ubuntu.com>
In-Reply-To: <20201029003252.2128653-34-christian.brauner@ubuntu.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 30 Oct 2020 11:57:24 +0200
Message-ID: <CAOQ4uxjyNB2zE+GE8Wmwjq__C7e4mrWMrS8RDVOOQFLtezjTkg@mail.gmail.com>
Subject: Re: [PATCH 33/34] overlayfs: handle idmapped merged mounts
To: Christian Brauner <christian.brauner@ubuntu.com>
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
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:32:56 -0400
Cc: Phil Estes <estesp@gmail.com>, Lennart Poettering <lennart@poettering.net>,
	Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Linux Containers <containers@lists.linux-foundation.org>,
	Tycho Andersen <tycho@tycho.ws>, Miklos Szeredi <miklos@szeredi.hu>,
	James Morris <jmorris@namei.org>, smbarber@chromium.org,
	Christoph Hellwig <hch@infradead.org>, Ext4 <linux-ext4@vger.kernel.org>,
	Mrunal Patel <mpatel@redhat.com>,
	Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
	Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Aleksa Sarai <cyphar@cyphar.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Andy Lutomirski <luto@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Geoffrey Thomas <geofft@ldpreload.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John Johansen <john.johansen@canonical.com>, Theodore Tso <tytso@mit.edu>,
	Seth Forshee <seth.forshee@canonical.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	overlayfs <linux-unionfs@vger.kernel.org>,
	LSM List <linux-security-module@vger.kernel.org>,
	Linux Audit <linux-audit@redhat.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Linux API <linux-api@vger.kernel.org>, Alban Crequy <alban@kinvolk.io>,
	linux-integrity <linux-integrity@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> -int ovl_permission(struct inode *inode, int mask)
> +int ovl_permission_mapped(struct user_namespace *user_ns,
> +                         struct inode *inode, int mask)
>  {
>         struct inode *upperinode = ovl_inode_upper(inode);
>         struct inode *realinode = upperinode ?: ovl_inode_lower(inode);
> -       struct user_namespace *user_ns;
> +       struct user_namespace *real_user_ns;
>         const struct cred *old_cred;
>         int err;
>
> @@ -302,15 +313,15 @@ int ovl_permission(struct inode *inode, int mask)
>         }
>
>         if (upperinode)
> -               user_ns = ovl_upper_mnt_user_ns(OVL_FS(inode->i_sb));
> +               real_user_ns = ovl_upper_mnt_user_ns(OVL_FS(inode->i_sb));
>         else
> -               user_ns = OVL_I(inode)->lower_user_ns;
> +               real_user_ns = OVL_I(inode)->lower_user_ns;

These changes look strange in this patch. Better use real_user_ns in previous
patch.

Thanks,
Amir.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


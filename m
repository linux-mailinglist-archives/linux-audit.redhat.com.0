Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 096932A0A70
	for <lists+linux-audit@lfdr.de>; Fri, 30 Oct 2020 16:54:14 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-_1NzB7N3MMOLmR1sBnmHmA-1; Fri, 30 Oct 2020 11:54:12 -0400
X-MC-Unique: _1NzB7N3MMOLmR1sBnmHmA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5B241074641;
	Fri, 30 Oct 2020 15:54:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDAE419D61;
	Fri, 30 Oct 2020 15:54:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C74C1826D36;
	Fri, 30 Oct 2020 15:53:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09UFOHBu009236 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 11:24:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 824312157F5E; Fri, 30 Oct 2020 15:24:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C5DF2156A50
	for <linux-audit@redhat.com>; Fri, 30 Oct 2020 15:24:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71F4E102F1E3
	for <linux-audit@redhat.com>; Fri, 30 Oct 2020 15:24:09 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-456-2ej0SM-ZOQ-nDfpcdaoGSA-1; Fri, 30 Oct 2020 11:24:07 -0400
X-MC-Unique: 2ej0SM-ZOQ-nDfpcdaoGSA-1
Received: from mail-oo1-f71.google.com ([209.85.161.71])
	by youngberry.canonical.com with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <seth.forshee@canonical.com>) id 1kYW0P-0001sN-HL
	for linux-audit@redhat.com; Fri, 30 Oct 2020 15:07:53 +0000
Received: by mail-oo1-f71.google.com with SMTP id r13so2942578ooi.3
	for <linux-audit@redhat.com>; Fri, 30 Oct 2020 08:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=xa7Ya7WFCD66IO3n4EspVdAVBWL69bn4xyiCQC0MCNc=;
	b=s7xbgyqp1Do7e2+MwR6CYougaIRe/fMu3DphNg0KT7nG3bJFyaPx9OL/jewYMAcE8R
	yU3WWmJE9Efm3OE9PADkOm1sfvDHadzSiefiXqN7/5spDy4Dl3xPfZNOvIk3EyYF6AVs
	p9tFUEaxuOcvszXTdDXgGZ+dZq1yZMbRwdFLkI+XynSc9x3Z/SgFeV8YhXFMWoop4H2x
	QkBv5WZNmK44Cb4nnHJo2gArmPKO5+YBRS4o/t/0d1AQnqdKXI07EuofAb3A3R65+6wh
	G5iTXupGfEPT1SvjNAZzn+YpoVCsL4374v9D2d5HvY2R/vEEu6d5WELtOuHmSI/aCyVA
	NOSw==
X-Gm-Message-State: AOAM530a25p1FDXQ6/pf6ZnvEBmP1wiGutA2SXotjznyFLnHkbwaSeyG
	NouuP9x/uv6QZae8S8n4/BVC1+JLGRAdLZ0pdz/HZHv5Edalj1RX0ooWklA5CIluOdhQbKbxnHz
	ouzVHIsnuxMnLUgY2IUlxvCavAYnwNb/C6g==
X-Received: by 2002:a9d:7f90:: with SMTP id t16mr2120448otp.231.1604070472478; 
	Fri, 30 Oct 2020 08:07:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrwanxbYDDJUUK4/p/rI4RmYyrOvYEAiYYd5ZsrwMuhegPWsvTXQZPd/YkhjdWXy2r86N00Q==
X-Received: by 2002:a9d:7f90:: with SMTP id t16mr2120406otp.231.1604070472204; 
	Fri, 30 Oct 2020 08:07:52 -0700 (PDT)
Received: from localhost ([2605:a601:ac0f:820:f03a:863:709:f18c])
	by smtp.gmail.com with ESMTPSA id
	d22sm1412368oij.53.2020.10.30.08.07.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Oct 2020 08:07:49 -0700 (PDT)
Date: Fri, 30 Oct 2020 10:07:48 -0500
From: Seth Forshee <seth.forshee@canonical.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH 00/34] fs: idmapped mounts
Message-ID: <20201030150748.GA176340@ubuntu-x1>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<87pn51ghju.fsf@x220.int.ebiederm.org>
	<20201029155148.5odu4j2kt62ahcxq@yavin.dot.cyphar.com>
	<87361xdm4c.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
In-Reply-To: <87361xdm4c.fsf@x220.int.ebiederm.org>
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
X-Mailman-Approved-At: Fri, 30 Oct 2020 11:53:42 -0400
Cc: Phil Estes <estesp@gmail.com>, Lennart Poettering <lennart@poettering.net>,
	Amir Goldstein <amir73il@gmail.com>, Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	containers@lists.linux-foundation.org,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Tycho Andersen <tycho@tycho.ws>, Miklos Szeredi <miklos@szeredi.hu>,
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
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-unionfs@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	linux-api@vger.kernel.org, Alban Crequy <alban@kinvolk.io>,
	linux-integrity@vger.kernel.org,
	=?utf-8?B?U3TDqXBoYW5l?= Graber <stgraber@ubuntu.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 29, 2020 at 11:37:23AM -0500, Eric W. Biederman wrote:
> First and foremost: A uid shift on write to a filesystem is a security
> bug waiting to happen.  This is especially in the context of facilities
> like iouring, that play very agressive games with how process context
> makes it to  system calls.
> 
> The only reason containers were not immediately exploitable when iouring
> was introduced is because the mechanisms are built so that even if
> something escapes containment the security properties still apply.
> Changes to the uid when writing to the filesystem does not have that
> property.  The tiniest slip in containment will be a security issue.
> 
> This is not even the least bit theoretical.  I have seem reports of how
> shitfs+overlayfs created a situation where anyone could read
> /etc/shadow.

This bug was the result of a complex interaction with several
contributing factors. It's fair to say that one component was overlayfs
writing through an id-shifted mount, but the primary cause was related
to how copy-up was done coupled with allowing unprivileged overlayfs
mounts in a user ns. Checks that the mounter had access to the lower fs
file were not done before copying data up, and so the file was copied up
temporarily to the id shifted upperdir. Even though it was immediately
removed, other factors made it possible for the user to get the file
contents from the upperdir.

Regardless, I do think you raise a good point. We need to be wary of any
place the kernel could open files through a shifted mount, especially
when the open could be influenced by userspace.

Perhaps kernel file opens through shifted mounts should to be opt-in.
I.e. unless a flag is passed, or a different open interface used, the
open will fail if the dentry being opened is subject to id shifting.
This way any kernel writes which would be subject to id shifting will
only happen through code which as been written to take it into account.

Seth

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


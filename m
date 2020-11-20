Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 67F2F2BB83F
	for <lists+linux-audit@lfdr.de>; Fri, 20 Nov 2020 22:23:16 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-SOxv1Fs4NUSg4mOts9F1Iw-1; Fri, 20 Nov 2020 16:23:13 -0500
X-MC-Unique: SOxv1Fs4NUSg4mOts9F1Iw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10A465B365;
	Fri, 20 Nov 2020 21:23:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F2885C224;
	Fri, 20 Nov 2020 21:23:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0BFFF4BB7B;
	Fri, 20 Nov 2020 21:23:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKLG5ov006913 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 16:16:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 941D0115D354; Fri, 20 Nov 2020 21:16:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 904B5115D350
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 21:16:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D6C1103B803
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 21:16:03 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-497-XjiE2OePOamlUnDdnXL4dA-1; Fri, 20 Nov 2020 16:16:01 -0500
X-MC-Unique: XjiE2OePOamlUnDdnXL4dA-1
Received: by mail-pf1-f194.google.com with SMTP id t8so9068363pfg.8
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 13:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=h3PVNgWJ4wv679ueVcfOMGTzPLuWakBRGW5tpcXVwpU=;
	b=qiOjVaeqDDUaJ51nOby5BNZT3KU+c3rxm5up32V73BaaRxcl1RtW7sSbzzknmPBD4o
	l/FVLwiwSYh5+kTtEeJKD05eutUk4Gl/WQAewZoYYRTPwqBnPUPCOWoFjijWOG/+u78b
	zINcQeYqIpILvoCfAnjKjQ2o8bmWV6VtJRYwXRPFAYo3WoGkNuvOt25T5f9f+t0umW1v
	ug/Ne1HrAJygAhvKKMXsfgYlZnleXnkA0XfmsjUyoD/gowBtU8t25Pd9qvdndbJP0Dtw
	PVc4aPOoApW9elZnsu66WWiq4Cm+ReR0ZUCJuG6DnPL9l/UBGR4ZorV8Wk/byN1yduRR
	2IOA==
X-Gm-Message-State: AOAM530K86PdaaXfZJPSZvMGQxpNUxD29fZ1T+4JJG3NGC68GQBZyIJn
	JzyTIqwzhAhE3wVgw4KpiaK43A==
X-Google-Smtp-Source: ABdhPJxKoNsqmJfw8FXBuNWzYTFCvMP4QSPsIPE4HroDYde9n5FBnmXaYeQPf9Hkrj1TBoT0dMj64g==
X-Received: by 2002:aa7:8ac1:0:b029:197:7198:e943 with SMTP id
	b1-20020aa78ac10000b02901977198e943mr14806170pfd.58.1605906959108;
	Fri, 20 Nov 2020 13:15:59 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	k9sm4598556pfi.188.2020.11.20.13.15.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Nov 2020 13:15:58 -0800 (PST)
Date: Fri, 20 Nov 2020 13:15:57 -0800
From: Kees Cook <keescook@chromium.org>
To: Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH v2 39/39] tests: add vfs/idmapped mounts test suite
Message-ID: <202011201300.B158F1E4B@keescook>
References: <20201115103718.298186-1-christian.brauner@ubuntu.com>
	<20201115103718.298186-40-christian.brauner@ubuntu.com>
MIME-Version: 1.0
In-Reply-To: <20201115103718.298186-40-christian.brauner@ubuntu.com>
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
X-Mailman-Approved-At: Fri, 20 Nov 2020 16:22:55 -0500
Cc: Phil Estes <estesp@gmail.com>, Lennart Poettering <lennart@poettering.net>,
	Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	containers@lists.linux-foundation.org,
	Christoph Hellwig <hch@lst.de>, Tycho Andersen <tycho@tycho.ws>,
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
	=?iso-8859-1?Q?St=E9phane?= Graber <stgraber@ubuntu.com>,
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

On Sun, Nov 15, 2020 at 11:37:18AM +0100, Christian Brauner wrote:
> This adds a whole test suite for idmapped mounts but in order to ensure that
> there are no regression for the vfs itself it also includes tests for correct
> functionality on non-idmapped mounts. The following tests are currently
> available with more to come in the future:

Awesome! :)

Some glitches in the build, though... something about the ordering or
the Make rules produces odd results on a failure:

$ make
gcc -g -I../../../../usr/include/ -Wall -O2 -pthread    xattr.c internal.h utils.c utils.h -lcap -o /home/kees/src/linux-build/seccomp/tools/testing/selftests/idmap_mounts/xattr
gcc -g -I../../../../usr/include/ -Wall -O2 -pthread    core.c internal.h utils.c utils.h -lcap -o /home/kees/src/linux-build/seccomp/tools/testing/selftests/idmap_mounts/core
core.c:19:10: fatal error: sys/acl.h: No such file or directory
   19 | #include <sys/acl.h>
      |          ^~~~~~~~~~~
compilation terminated.
make: *** [../lib.mk:139: /home/kees/src/linux-build/seccomp/tools/testing/selftests/idmap_mounts/core]
Error 1
$ make
make: Nothing to be done for 'all'.
$ file xattr core
xattr: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=7a3c1951e54f20e657b4181c1be77c7183a54f81, for GNU/Linux 3.2.0, with debug_info, not stripped
core:  GCC precompiled header (version 014) for C

Even after I install libacl1-dev, I still get a "core" file output which
breaks attempts to build again. :)


Is there any way to have the test suite not depend on
__NR_mount_setattr? Running this test on older kernels fails everything.


-- 
Kees Cook

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


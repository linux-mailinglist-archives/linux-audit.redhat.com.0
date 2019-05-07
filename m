Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B40C316910
	for <lists+linux-audit@lfdr.de>; Tue,  7 May 2019 19:23:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C395781E0F;
	Tue,  7 May 2019 17:23:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D198171AD;
	Tue,  7 May 2019 17:23:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C783641F3D;
	Tue,  7 May 2019 17:23:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x47HNLL4018681 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 13:23:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF2AD173BB; Tue,  7 May 2019 17:23:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B963D18645
	for <linux-audit@redhat.com>; Tue,  7 May 2019 17:23:19 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 36B252026B
	for <linux-audit@redhat.com>; Tue,  7 May 2019 17:23:18 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id h21so15009264ljk.13
	for <linux-audit@redhat.com>; Tue, 07 May 2019 10:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=u1BdfLbHAFQuPdTVB1WpvhAvzRrkkmJNUU8PH36DDjI=;
	b=ARRkitV0i38mi6ZYOWCQaRHdnDGOk/yUclCi0dkSPC291twr3CC18Z4lvRh/wlcRdY
	5IevgfijwFnUWyObhxfleMfJ7z8CZs7ChXp6CpA6Jnm+j6evE3dIXWlsvBdTuoyIkm84
	grqurOh7AGpkmWtonVe7Us5hW1YR+VgTiYIpKbz2HfVG6LekZr+aCK0lnN8mc4C0E8aX
	lC/9BZ8LGTsfhdq/vVNlmmzM17VjGQdNMKScGCt7pzgwUfOx6+LqIzemWw7lILOPGG7B
	yow36NzfOPHB8rGxzuJyMlob0yDov1nO8gv9w3pcCAp5eQr4xx8CtWI7v2cSD+9alYbf
	Q7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=u1BdfLbHAFQuPdTVB1WpvhAvzRrkkmJNUU8PH36DDjI=;
	b=HGXWCG8uESBkisy10qA6KwMYeMYSX2QgF8W9hs/CiPxuWwRWKSIQSjgA4kSmqvk6A2
	T8507RrvCzQYgehFlVKzNtoWqtY3Qpe/w+RMDAbHpCQfC/uha/oLZFLpp2n3HiVNqQfd
	Ke2J8w9+WjP0WKbLbqhcxaeFGLY6+JCvPwIK69II02KGAhF7sQbgqh+AJA3OnQeija4B
	ZEZSTPQ4XpnpAPRotMx/h3rW9MVDtscHVdbPQitLPWsJkN77M5mzOQQTJ2S4BqAl9go7
	4KoLOh3N0LopF6ID3ykVR4ZienL1Axrf/w0GsVQD31SiZyFYUzxTo+mu23tYgVLsbiaN
	JVFA==
X-Gm-Message-State: APjAAAU03HPh8yubu6aPgukg+QmXoZ9EQaY7nZ5k0el/V6TOPzdBrlAe
	r1yvVHz4gcaqrXUAUZCmrQAvn5JOyyn4aqCLOsLAes+VLVQN
X-Google-Smtp-Source: APXvYqytjtDNglgXvF6NDMnQSfRPy3x8pQ+7EN589dt1d0roPS0kOWlTbsE2cw5bGycgpVEYD5HHtlDqwm9tPvucuME=
X-Received: by 2002:a2e:9d0a:: with SMTP id t10mr3155031lji.95.1557249796468; 
	Tue, 07 May 2019 10:23:16 -0700 (PDT)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 7 May 2019 13:23:05 -0400
Message-ID: <CAHC9VhQ8aEqiKo6oj8-qMTzbs73ipEbTf5akENYc-m6xg7JRXg@mail.gmail.com>
Subject: [GIT PULL] Audit patches for v5.2
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 07 May 2019 17:23:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Tue, 07 May 2019 17:23:18 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.011  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2) 209.85.208.193
	mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 07 May 2019 17:23:40 +0000 (UTC)

Hi Linus,

We've got a reasonably broad set of audit patches for the v5.2 merge
window, the highlights are below:

- The biggest change, and the source of all the arch/* changes, is the
patchset from Dmitry to help enable some of the work he is doing
around PTRACE_GET_SYSCALL_INFO.  To be honest, including this in the
audit tree is a bit of a stretch, but it does help move audit a little
further along towards proper syscall auditing for all arches, and
everyone else seemed to agree that audit was a "good" spot for this to
land (or maybe they just didn't want to merge it?  dunno.).

- We can now audit time/NTP adjustments.

- We continue the work to connect associated audit records into a single event.

As a FYI, you will likely run into two minor merge problems in
kernel/seccomp.c and arch/mips/kernel/ptrace.c; both are very similar
and have to do with the change to syscall_get_arch() and
syscall_get_arguments().  It should be easy to sort this out (you'll
see what I mean), but if you have any questions just let us know.

Please pull this for v5.2,
-Paul

--
The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

 Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   tags/audit-pr-20190507

for you to fetch changes up to 70c4cf17e445264453bc5323db3e50aa0ac9e81f:

 audit: fix a memory leak bug (2019-04-22 11:22:03 -0400)

----------------------------------------------------------------
audit/stable-5.2 PR 20190507

----------------------------------------------------------------
Dmitry V. Levin (13):
     Move EM_ARCOMPACT and EM_ARCV2 to uapi/linux/elf-em.h
     arc: define syscall_get_arch()
     c6x: define syscall_get_arch()
     h8300: define syscall_get_arch()
     Move EM_HEXAGON to uapi/linux/elf-em.h
     hexagon: define syscall_get_arch()
     m68k: define syscall_get_arch()
     Move EM_NDS32 to uapi/linux/elf-em.h
     nds32: define syscall_get_arch()
     nios2: define syscall_get_arch()
     Move EM_UNICORE to uapi/linux/elf-em.h
     unicore32: define syscall_get_arch()
     syscall_get_arch: add "struct task_struct *" argument

Li RongQing (1):
     audit: fix a memleak caused by auditing load module

Ondrej Mosnacek (2):
     timekeeping: Audit clock adjustments
     ntp: Audit NTP parameters adjustment

Richard Guy Briggs (3):
     audit: connect LOGIN record to its syscall record
     audit: link integrity evm_write_xattrs record to syscall event
     audit: purge unnecessary list_empty calls

Wenwen Wang (1):
     audit: fix a memory leak bug

YueHaibing (1):
     audit: Make audit_log_cap and audit_copy_inode static

arch/alpha/include/asm/syscall.h      |   2 +-
arch/arc/include/asm/elf.h            |   6 +-
arch/arc/include/asm/syscall.h        |  11 ++++
arch/arm/include/asm/syscall.h        |   2 +-
arch/arm64/include/asm/syscall.h      |   4 +-
arch/c6x/include/asm/syscall.h        |   7 +++
arch/csky/include/asm/syscall.h       |   2 +-
arch/h8300/include/asm/syscall.h      |   6 ++
arch/hexagon/include/asm/elf.h        |   6 +-
arch/hexagon/include/asm/syscall.h    |   8 +++
arch/ia64/include/asm/syscall.h       |   2 +-
arch/m68k/include/asm/syscall.h       |  12 ++++
arch/microblaze/include/asm/syscall.h |   2 +-
arch/mips/include/asm/syscall.h       |   6 +-
arch/mips/kernel/ptrace.c             |   2 +-
arch/nds32/include/asm/elf.h          |   3 +-
arch/nds32/include/asm/syscall.h      |   9 +++
arch/nios2/include/asm/syscall.h      |   6 ++
arch/openrisc/include/asm/syscall.h   |   2 +-
arch/parisc/include/asm/syscall.h     |   4 +-
arch/powerpc/include/asm/syscall.h    |  10 ++-
arch/riscv/include/asm/syscall.h      |   2 +-
arch/s390/include/asm/syscall.h       |   4 +-
arch/sh/include/asm/syscall_32.h      |   2 +-
arch/sh/include/asm/syscall_64.h      |   2 +-
arch/sparc/include/asm/syscall.h      |   5 +-
arch/unicore32/include/asm/elf.h      |   3 +-
arch/unicore32/include/asm/syscall.h  |  12 ++++
arch/x86/include/asm/syscall.h        |   8 ++-
arch/x86/um/asm/syscall.h             |   2 +-
arch/xtensa/include/asm/syscall.h     |   2 +-
include/asm-generic/syscall.h         |   5 +-
include/linux/audit.h                 |  75 +++++++++++++++++++++++
include/uapi/linux/audit.h            |  14 +++++
include/uapi/linux/elf-em.h           |   6 ++
kernel/audit.c                        |   2 +-
kernel/auditfilter.c                  |  14 ++---
kernel/auditsc.c                      | 115 +++++++++++++++++++++------------
kernel/seccomp.c                      |   4 +-
kernel/time/ntp.c                     |  22 ++++++-
kernel/time/ntp_internal.h            |   4 +-
kernel/time/timekeeping.c             |  13 +++-
security/integrity/evm/evm_secfs.c    |  10 +--
43 files changed, 331 insertions(+), 107 deletions(-)
create mode 100644 arch/m68k/include/asm/syscall.h
create mode 100644 arch/unicore32/include/asm/syscall.h

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

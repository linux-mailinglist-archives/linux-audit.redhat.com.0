Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B43AF5D546
	for <lists+linux-audit@lfdr.de>; Tue,  2 Jul 2019 19:31:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EF43C01F28C;
	Tue,  2 Jul 2019 17:30:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6063B1001925;
	Tue,  2 Jul 2019 17:30:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CDBE1806B12;
	Tue,  2 Jul 2019 17:30:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x62HTKRu020693 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 2 Jul 2019 13:29:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 44D9637CE; Tue,  2 Jul 2019 17:29:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F3945D9E1
	for <linux-audit@redhat.com>; Tue,  2 Jul 2019 17:29:18 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AAD6E309265C
	for <linux-audit@redhat.com>; Tue,  2 Jul 2019 17:28:47 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id z15so11961594lfh.13
	for <linux-audit@redhat.com>; Tue, 02 Jul 2019 10:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=ESbvDEOdDN7N8DWL7d5n/EnOhVPr3X8R6VtdhGwRNQs=;
	b=lz/WdCzaZCnTbIbCuxpcV//e9TGNlh1GfKTw5RvdcDSkmJ6Dj78ko6p+cWWq0ZfArv
	b19JtebtGJImHC+u26CDonFRrWM42EGJR+i8qj/AwJaPvV8gfq6E2uxxIA+9SDc5Itm4
	xsvQ4VScX+i3WZtr0dXxkwZLuwA6xK/Nd70QR7POFURuTUyz10+1HEQs0Vp/QszcAKxH
	DZ1eEadO2vawg7hnJ2QN4lBXbpEpjM37CNzl6Mz/oyRHNoypBiz0Jsig530yPtd7lEsQ
	2hefryuBVodP3YGjE9FoyJqAkY+mRVEfh5zTALbvGCZM/zFcnZyTJYrxejReHxhOpzxT
	ncTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=ESbvDEOdDN7N8DWL7d5n/EnOhVPr3X8R6VtdhGwRNQs=;
	b=nppPusQv+IosQ/BgvBJqWIuX2TlbL7xJfAolP2RReHX89f5ZewbPALqKNto0+Rqy+O
	2v4ZKAVDXarOqpegdmpfgoHsbrcqUJ0PbWfankw2ziaZwBFQZI4+AmWEFyfqSdsSmefl
	fo+2RLCzjfRfWx/byz5vDB4Bx4UbTsi6lEZ2MwGvuWBzfV5SfctDhJmNboIq4txWptFI
	G/gBjzl6JfG8qB3D1dSxbYEvA+3Q505YwydtoSRinBI7vffxMeyZxl8pi37j5BcTRczk
	2okoVSAg9oM1S8F1nHKHTmkG5oJa3QrFz4rWmi8pDZa+1zjircXUXBAHeWDNOyLVLpWp
	MZCw==
X-Gm-Message-State: APjAAAW4xHOM3HKXrkWBXlz+fJoyByzEwta+O63xUGDCBEOe0rtQ94U6
	cUYPcSFFj04Vejz2L+sGkXBtSCc5kls8K3JgNH83
X-Google-Smtp-Source: APXvYqxl+hOO7NlDSd2NcPfDAxUqaJXo35Dg2EkyAhR8Wt+Mp/lkrTHU5Fea4EB9KnqRfSC0rFeY5SbDGBFVCJ1EV0w=
X-Received: by 2002:ac2:4109:: with SMTP id b9mr13868455lfi.31.1562088524511; 
	Tue, 02 Jul 2019 10:28:44 -0700 (PDT)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 2 Jul 2019 13:28:33 -0400
Message-ID: <CAHC9VhQ7md3PmUkzv8DNL-RTrq_4r2sRzGjwwaT0ZS-CPOxGBw@mail.gmail.com>
Subject: [GIT PULL] Audit patches for v5.3
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 02 Jul 2019 17:28:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Tue, 02 Jul 2019 17:28:56 +0000 (UTC) for IP:'209.85.167.67'
	DOMAIN:'mail-lf1-f67.google.com' HELO:'mail-lf1-f67.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.009  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE) 209.85.167.67 mail-lf1-f67.google.com
	209.85.167.67 mail-lf1-f67.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 02 Jul 2019 17:31:28 +0000 (UTC)

Hi Linus,

This PR is a bit early, but with some vacation time coming up I wanted
to send this out now just in case the remote Internet Gods decide not
to smile on me once the merge window opens.  The patchset for v5.3 is
pretty minor this time, the highlights include:

- When the audit daemon is sent a signal, ensure we deliver
information about the sender even when syscall auditing is not
enabled/supported.

- Add the ability to filter audit records based on network address family.

- Tighten the audit field filtering restrictions on string based fields.

- Cleanup the audit field filtering verification code.

- Remove a few BUG() calls from the audit code.

Please pull this once the merge window opens,
-Paul

--
The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

 Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   tags/audit-pr-20190702

for you to fetch changes up to 839d05e413856bd686a33b59294d4e8238169320:

 audit: remove the BUG() calls in the audit rule comparison functions
   (2019-05-30 12:53:42 -0400)

----------------------------------------------------------------
audit/stable-5.3 PR 20190702

----------------------------------------------------------------
Paul Moore (1):
     audit: remove the BUG() calls in the audit rule comparison functions

Richard Guy Briggs (4):
     audit: deliver signal_info regarless of syscall
     audit: re-structure audit field valid checks
     audit: add saddr_fam filter field
     audit: enforce op for string fields

include/linux/audit.h      |  9 +++++++
include/uapi/linux/audit.h |  1 +
kernel/audit.c             | 27 +++++++++++++++++++++
kernel/audit.h             |  8 ++++--
kernel/auditfilter.c       | 62 ++++++++++++++++++++++++++---------------
kernel/auditsc.c           | 42 +++++++++++++++++---------------
kernel/signal.c            |  2 +-
7 files changed, 105 insertions(+), 46 deletions(-)

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

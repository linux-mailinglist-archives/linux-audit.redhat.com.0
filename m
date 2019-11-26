Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CE94410A60C
	for <lists+linux-audit@lfdr.de>; Tue, 26 Nov 2019 22:34:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574804074;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GeJ6fBuxvVusr13a/kbeFhOeB8NxIqzIHczmUySb6XY=;
	b=CBvkpEHsAnexAHggwdvfZp16nx0qF9fA32kTzNbbFMNwHp5Cz7Lqxec2qPbPWaJTKLPV5A
	ocgMYSwdHm8M6RfKGED183mucLUY+kffd/G4sG6DIKQfsRbO+iralEFRUI20s5NlHDe9Ky
	UGpKyHO2fTN6Cg9JDNHUrtYeJ/h36OI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-1jQMRVkYNL27qy5Th3SAAw-1; Tue, 26 Nov 2019 16:34:32 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6000B100551D;
	Tue, 26 Nov 2019 21:34:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBBBB600C8;
	Tue, 26 Nov 2019 21:34:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87C664BB65;
	Tue, 26 Nov 2019 21:34:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAQLY9rw027608 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Nov 2019 16:34:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 62E17F9AA5; Tue, 26 Nov 2019 21:34:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E7EEF9AA3
	for <linux-audit@redhat.com>; Tue, 26 Nov 2019 21:34:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A18D9801032
	for <linux-audit@redhat.com>; Tue, 26 Nov 2019 21:34:06 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-401-XWz-yxmQN7C3CDY1FMT7EA-1; Tue, 26 Nov 2019 16:34:04 -0500
Received: by mail-lj1-f194.google.com with SMTP id j6so12949071lja.2
	for <linux-audit@redhat.com>; Tue, 26 Nov 2019 13:34:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=aJX5qdSFRHtCgBIpCX8dfES7Ed9Qciad/tFjyvqy864=;
	b=np/QkyAP6sLIRnQHrYGUAanqT6rhp0hGHJlP5Ip7RzibBi/+n2hQYoYg7EKUEEfB80
	rgJJVgzUTNIzuCWWNltZn775hRM2nIlK5/Fl+nFtTfY4htCdyxo+UwKxSYabyzZqsII0
	EFOpV0XTuMmTq3+EromjdA4l8WKhkt6IiqOp3vWZqxb5LkPI50oG3klVSij2ZVo/RHeO
	Y/Om3Rp1pTyHw0AvQVqAuO+jYIQ+xeXDNEIjNGfrjZOyu+k6OFZrlha7O+yI1F4sJbDm
	przxZCQVbXVJ7BGDd/gR5nKw9AIuqLjY0ph5ywyFOANIyEbJDdBh4rDWYnihVNEx0rHQ
	T3Xw==
X-Gm-Message-State: APjAAAXswaK9WkSIsuGkXOf4gRYab8mgmA2Hxmz6jAdXwGFg0kS4A6x9
	A3ZgL7uIox9+2rGtN9ay4citS0Mnc2dMuT8FmJAd
X-Google-Smtp-Source: APXvYqwYnQXp3LcVcUyqHAyVFGjBtP7la8FOZ4rueFza7IGmfxYs6IJRt4yP6q06fOK4HWYh2iEFpvP9jcjxZfA89yU=
X-Received: by 2002:a2e:85d5:: with SMTP id h21mr28003318ljj.243.1574804042523;
	Tue, 26 Nov 2019 13:34:02 -0800 (PST)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 26 Nov 2019 16:33:51 -0500
Message-ID: <CAHC9VhRnN4yWO0So+u4Ktm1N8EpAbe+W1AGPXU-U7Bd7cPBv7g@mail.gmail.com>
Subject: [GIT PULL] Audit patches for v5.5
To: Linus Torvalds <torvalds@linux-foundation.org>
X-MC-Unique: XWz-yxmQN7C3CDY1FMT7EA-1
X-MC-Unique: 1jQMRVkYNL27qy5Th3SAAw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAQLY9rw027608
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Audit is back for v5.5, albeit with only two patches.  Both patches
pass our test suite and are listed below, please merge for v5.5.

- Allow for the auditing of suspicious O_CREAT usage via the new
AUDIT_ANOM_CREAT record.

- Remove a redundant if-conditional check found during code analysis.
It's a minor change, but when the pull request is only two patches
long, you need filler in the pull request email.

Thanks,
-Paul
--
The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

 Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   tags/audit-pr-20191126

for you to fetch changes up to c34c78dfc1fc68a1f5403f996de8ca62f298d7b2:

 audit: remove redundant condition check in kauditd_thread()
   (2019-10-25 11:48:14 -0400)

----------------------------------------------------------------
audit/stable-5.5 PR 20191126

----------------------------------------------------------------
Kees Cook (1):
     audit: Report suspicious O_CREAT usage

Yunfeng Ye (1):
     audit: remove redundant condition check in kauditd_thread()

fs/namei.c                 |  8 ++++++--
include/linux/audit.h      |  5 +++--
include/uapi/linux/audit.h |  1 +
kernel/audit.c             | 15 ++++++++-------
4 files changed, 18 insertions(+), 11 deletions(-)

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


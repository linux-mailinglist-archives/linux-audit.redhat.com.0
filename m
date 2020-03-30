Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 06B9E1986D2
	for <lists+linux-audit@lfdr.de>; Mon, 30 Mar 2020 23:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585605284;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ojmwfg2uABQ37mw6hc0TvyPT883i0wmL4R/ZNzWx6k0=;
	b=PVgeZ+16hEGNqKVYupeO+bnX2QCMXgyGBde/VX/lrlU78RaUNEkzgRkGgtCsvCvZtqTvXk
	SvWxYO1PijIQVThL5HkdCbPQPwqsTvZLHKSuF5c3EhDnqk3VvyC/sFvt9yq2z5pP/f6Tkf
	DekkTAUvNNrlfPQZLhKeDgXzD8EJVs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-XeaoQAm9NAmQxLQkiF9r0w-1; Mon, 30 Mar 2020 17:54:41 -0400
X-MC-Unique: XeaoQAm9NAmQxLQkiF9r0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B2AFDBA3;
	Mon, 30 Mar 2020 21:54:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51FBE5D9E2;
	Mon, 30 Mar 2020 21:54:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 80EDC86BE0;
	Mon, 30 Mar 2020 21:54:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ULs07N017746 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 17:54:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B51672028CD3; Mon, 30 Mar 2020 21:54:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B17672026D69
	for <linux-audit@redhat.com>; Mon, 30 Mar 2020 21:53:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9957D8E3C0F
	for <linux-audit@redhat.com>; Mon, 30 Mar 2020 21:53:58 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-337-yRW-UcW_MK6GGlXJ5MYWeA-1; Mon, 30 Mar 2020 17:53:55 -0400
X-MC-Unique: yRW-UcW_MK6GGlXJ5MYWeA-1
Received: by mail-ed1-f68.google.com with SMTP id a20so22765200edj.2
	for <linux-audit@redhat.com>; Mon, 30 Mar 2020 14:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=WEI8RlkfGwY1LJxNbmmI1m9WKvjRJF1kJKU3ZaY/CKw=;
	b=fJauS4CfwKfdUWG8VERpQGH+uB9tVuEKTOLZVOOujw3nZYZwd2hNczfZIiN/1eaXqr
	GLuYZ/IQW20A0hJi8WjU66NGagiX2lGBI9vlKVAtJ5/EsrIcXsGjevcZAA4g1/WhiYgt
	ym5JDV05+AzB+m6cpMFo46MOd43YIxZIyxqnpnIxp5b/pwBBQ4C4wT84nNPcNV+B+w6N
	ugt8wg+VABJIemZDJhaipw1yThptuyzqUOekh7gYsY78YkXC3l12Y4KcHGozdVuJYtvv
	5DS+wWHEW7naJaXqnY6B1ugeXR6bnzeyMTJgnBVHMY9MLuGbf3R8dL0Dd2jfgzQWtS9P
	jjHA==
X-Gm-Message-State: ANhLgQ1tay+TuWnYbU+4R63/J/5D+wa6U5vS5EgLD7D6wtx7LQsn4gHp
	n65Lf0QSobozFrRuXg7lPMzso3Z832E9OJ6re/v6
X-Google-Smtp-Source: ADFU+vuKCcJSz05nRjKsDjE9wMbSUW8sIG/OSH8YlP7X3Hauzg7MzTGgYqlywxuE/mDL+sqDG7FyKSD5u5qjWMNeQ0w=
X-Received: by 2002:a17:906:7b8d:: with SMTP id
	s13mr12489406ejo.77.1585605234401; 
	Mon, 30 Mar 2020 14:53:54 -0700 (PDT)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 30 Mar 2020 17:53:45 -0400
Message-ID: <CAHC9VhS2y33mA4jnLUx_39H59JS+7wdOHPw41ffiFJFM7zgAGA@mail.gmail.com>
Subject: [GIT PULL] Audit patches for v5.7
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02ULs07N017746
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

We've got two audit patches for the v5.7 merge window with a stellar
14 lines changed between the two patches.  The patch descriptions are
far more lengthy than the patches themselves, which is a very good
thing for patches this size IMHO.  The patches pass our test suites
and a quick summary is below, please merge for v5.7.

- Stop logging inode information when updating an audit file watch.
Since we are not changing the inode, or the fact that we are watching
the associated file, the inode information is just noise that we can
do without.

- Fix a problem where mandatory audit records were missing their
accompanying audit records (e.g. SYSCALL records were missing).  The
missing records often meant that we didn't have the necessary context
to understand what was going on when the event occurred.

Thanks,
-Paul

--
The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

 Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   tags/audit-pr-20200330

for you to fetch changes up to 1320a4052ea11eb2879eb7361da15a106a780972:

 audit: trigger accompanying records when no rules present
   (2020-03-12 10:42:51-0400)

----------------------------------------------------------------
audit/stable-5.7 PR 20200330

----------------------------------------------------------------
Richard Guy Briggs (1):
     audit: trigger accompanying records when no rules present

Steve Grubb (1):
     audit: CONFIG_CHANGE don't log internal bookkeeping as an event

kernel/audit.c       | 1 +
kernel/audit.h       | 8 ++++++++
kernel/audit_watch.c | 2 --
kernel/auditsc.c     | 3 ---
4 files changed, 9 insertions(+), 5 deletions(-)

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


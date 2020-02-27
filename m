Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 337D9170E08
	for <lists+linux-audit@lfdr.de>; Thu, 27 Feb 2020 02:51:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582768300;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0SL3UyUi3bOWNoWYtKPhtrKS7uByoTPeOi9RMER6CwY=;
	b=UX+FFx1B8XBjfz8MixybB5mqUMna+UNifMYyaIMffdIPK7YKAed0QGhlw0XhD8Ze5/+V8h
	X/cXtfWp6+z8YtqJYDB+1CVop1ecSrMbdP0bJhEcDGAiH028LClTzCGQeUUPEom0jcPXnx
	ZUAC7Ycd8+B4rTzGifrD8vO1xGXCAIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-bDyO1OfEMWSnltGfrKjxKw-1; Wed, 26 Feb 2020 20:51:38 -0500
X-MC-Unique: bDyO1OfEMWSnltGfrKjxKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38FF88010F7;
	Thu, 27 Feb 2020 01:51:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A7855D9CD;
	Thu, 27 Feb 2020 01:51:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CEA8684464;
	Thu, 27 Feb 2020 01:51:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01R1p2R3020928 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 26 Feb 2020 20:51:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 06F8A2028CD6; Thu, 27 Feb 2020 01:51:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 011CA20267F2
	for <linux-audit@redhat.com>; Thu, 27 Feb 2020 01:50:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 931AC800675
	for <linux-audit@redhat.com>; Thu, 27 Feb 2020 01:50:59 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-184-6PgW36JWNdKNXIR1priXow-1; Wed, 26 Feb 2020 20:50:57 -0500
X-MC-Unique: 6PgW36JWNdKNXIR1priXow-1
Received: by mail-ed1-f67.google.com with SMTP id c26so1253982eds.8
	for <linux-audit@redhat.com>; Wed, 26 Feb 2020 17:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=HEgw/5vVD4QFTc9jVVzJqQpf9a5Q3H97p6+91MGqCtQ=;
	b=sXqb4z3Evn9LXE+SO9jLl7t2O+NMQ7FmWZaVg5Fi+nIsylYwNXpaB9BATLhwLYThZ1
	2nRRqLF24XyVVYkX2lDpKyQwvFrEUnDEBgLCnlhTnsh3m4oAzT0mTG6Yj+s5DCOdO2YV
	NLJZiBUs1JqAXo4ni+oXB1SJha/MWLz/TQB83mnBsak9QCt28gJ4uM2yQDsbL/sHr47e
	dJHrG8iQxiGuFGCoyFTV0D1TE8Xu7oRoOMv+Op2yW8pjR/o/V2xWgJaYkp+WZ8Y4UFAH
	+fXMvqeGXmDoOude+4NKXjqla1RNdCycK/Am42f+fzlAXnxM9tNZDodJXZv1PbuMMR1j
	9jNQ==
X-Gm-Message-State: APjAAAXrCmGUHseqe+Q8Q8Ko8WW01j9QM5gZjYcfRICXZWQTuMSFiGf8
	SHGK2/DKH9niNb2k7fcJZm0dRLNyYaTN21ilda5t
X-Google-Smtp-Source: APXvYqwsOqd6MVvm4O57PDlHa7osBKxW/22vVgKnbA1WKNc/rUwTveBb39RZyI73bFjbZ5zhBFK2I/5+qPzbao7EqV4=
X-Received: by 2002:a17:906:198b:: with SMTP id
	g11mr1410549ejd.271.1582768254942; 
	Wed, 26 Feb 2020 17:50:54 -0800 (PST)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 26 Feb 2020 20:50:44 -0500
Message-ID: <CAHC9VhSL2M4QBP-_z9U-MMNUAT9G_pnJxrPcNtQs03yi7epYxQ@mail.gmail.com>
Subject: [GIT PULL] Audit fixes for v5.6 (#1)
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01R1p2R3020928
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

Two audit patches to fix problems found by syzbot, please merge for
the next v5.6-rcX release.

* Moving audit filter structure fields into a union caused some
problems in the code which populates that filter structure.  We keep
the union (that idea is a good one), but we are fixing the code so
that it doesn't needlessly set fields in the union and mess up the
error handling.

* The audit_receive_msg() function wasn't validating user input as
well as it should in all cases, we add the necessary checks.

Thanks,
-Paul

--
The following changes since commit cb5172d96d16df72db8b55146b0ec00bfd97f079:

 audit: Add __rcu annotation to RCU pointer (2019-12-09 15:19:03 -0500)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   tags/audit-pr-20200226

for you to fetch changes up to 756125289285f6e55a03861bf4b6257aa3d19a93:

 audit: always check the netlink payload length in audit_receive_msg()
   (2020-02-24 16:38:57 -0500)

----------------------------------------------------------------
audit/stable-5.6 PR 20200226

----------------------------------------------------------------
Paul Moore (2):
     audit: fix error handling in audit_data_to_entry()
     audit: always check the netlink payload length in audit_receive_msg()

kernel/audit.c       | 40 +++++++++++++++--------------
kernel/auditfilter.c | 71 +++++++++++++++++++++++++++---------------------
2 files changed, 60 insertions(+), 51 deletions(-)

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


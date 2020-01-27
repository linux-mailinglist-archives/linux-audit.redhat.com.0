Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8C58014AB2A
	for <lists+linux-audit@lfdr.de>; Mon, 27 Jan 2020 21:33:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580157228;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RGQiBpZBH0mTAzWr230/wEbjLkDVfg2XE0OjKK0eYM4=;
	b=Mjj9pATqJQesSB+7D12kiiTK/bjQGm3HPyBMg9/sARX4s9sFz4Fqcji1wFQ1dY6Y4KviYO
	gmAQC/T5H70mDYLx2Gk//JGt7TrHOf1M9ypN5+yyaE/5Lr4hnNO5/CNwK+vKYU+5TVm+Mm
	GoX9MNTosjEgUaqwhWdzLbhhTLRTtbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-ESPabcnZNGORKYy7f54GGg-1; Mon, 27 Jan 2020 15:33:45 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E31519057A1;
	Mon, 27 Jan 2020 20:33:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 564681001B23;
	Mon, 27 Jan 2020 20:33:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D40878577A;
	Mon, 27 Jan 2020 20:33:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00RKXLer018910 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 27 Jan 2020 15:33:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6212820230A6; Mon, 27 Jan 2020 20:33:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C8892026D67
	for <linux-audit@redhat.com>; Mon, 27 Jan 2020 20:33:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AEC1800FF5
	for <linux-audit@redhat.com>; Mon, 27 Jan 2020 20:33:19 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-254-dT0th9alNB--DxGg8VXqOA-1; Mon, 27 Jan 2020 15:33:16 -0500
Received: by mail-ed1-f65.google.com with SMTP id p23so3429240edr.5
	for <linux-audit@redhat.com>; Mon, 27 Jan 2020 12:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=dEVQQBZ4iTYdQIjstHziIMop+sy3GzjT/sdtf1Lx2G4=;
	b=k6sUww+vDK95w1GzeblSKowzNrtHUQBq9SpanL62aB0ClwvD3j0eGa+E9IKVe2MDrL
	MRsKQ40vNkZwPuMlTEDbx9PGBo9BLO7u+rp9oTaQiYPOY/7hFRMPRbyU4/KmpqSx/Iou
	E6A1H/TaVPNA5MLZ29LCH9OwMIgsO8XX4dUgbE3oQa2R/lqtDKwCh+hGGSS8nvl4xQlz
	olp0nloSslVnzLBnfjb7s+IKa8SgyM+bXLy1io3BG4liNBjOix3/MxwP52tUWgj+NgRd
	vbUFU/GCjt83I7GiX7ZY0mNBbqyvwOrMA/LHmKPAbYruKWpkujLBOqkvssi2MAPcGz/2
	jVxA==
X-Gm-Message-State: APjAAAWlW2VtyCidAMGQbny6pd9AbrmCE6c/RZ4ihvrCU0Qw/FvsCoci
	pacIY9G6tsb18Q4YrJlc/PBjnFXycE47gpYq8QlBA3GtLD1w
X-Google-Smtp-Source: APXvYqyjOgNl/c9yixRA7xgRUSiMq5N0amWowrz3+VD4I8riDv2I6jMSb+8HRzixXT8AUuubV/L4e+GVyOqhQfKb4W4=
X-Received: by 2002:a17:906:c299:: with SMTP id
	r25mr388723ejz.272.1580157195274; 
	Mon, 27 Jan 2020 12:33:15 -0800 (PST)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 27 Jan 2020 15:33:04 -0500
Message-ID: <CAHC9VhRm1dAsc+_eH7iKj4C6RVdzYeZLLqShcOjvMMbEaB4VQA@mail.gmail.com>
Subject: [GIT PULL] Audit patch for v5.6
To: Linus Torvalds <torvalds@linux-foundation.org>
X-MC-Unique: dT0th9alNB--DxGg8VXqOA-1
X-MC-Unique: ESPabcnZNGORKYy7f54GGg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00RKXLer018910
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

One small audit patch for the Linux v5.6 merge window, and
unsurprisingly it passes our test suite with flying colors.  Please
merge.

Thanks,
-Paul

--
The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

 Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   tags/audit-pr-20200127

for you to fetch changes up to cb5172d96d16df72db8b55146b0ec00bfd97f079:

 audit: Add __rcu annotation to RCU pointer (2019-12-09 15:19:03 -0500)

----------------------------------------------------------------
audit/stable-5.6 PR 20200127

----------------------------------------------------------------
Amol Grover (1):
     audit: Add __rcu annotation to RCU pointer

kernel/audit.c | 5 +++--
1 file changed, 3 insertions(+), 2 deletions(-)

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


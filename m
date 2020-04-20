Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BCBAD1B1883
	for <lists+linux-audit@lfdr.de>; Mon, 20 Apr 2020 23:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587418620;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j7RYLM0S60OOTsr3lioEOYvWndvTJwhgRsOyzpRlRI4=;
	b=PJ075r7losdNiM1rardxc0KrrycsMFuvIrRm8bb0j8pyosJ8djk72Xtkig81XmqlAPMZKH
	Wp2GIrIUE1OFZhBUTIGuK9thFV+mgB1CQBn0yc22dvGsjJKKTX1ZjLZL+Quacq4NrrF0uu
	+hXlVZRNYDUvUyKWLrJ0T/nc5zn3vdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430--XkALqeTNaOsOSqfLfWkhA-1; Mon, 20 Apr 2020 17:36:56 -0400
X-MC-Unique: -XkALqeTNaOsOSqfLfWkhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7363413FB;
	Mon, 20 Apr 2020 21:36:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3378C60C63;
	Mon, 20 Apr 2020 21:36:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C463A180BA96;
	Mon, 20 Apr 2020 21:36:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KLaA1F028628 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 17:36:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E4FFE1003207; Mon, 20 Apr 2020 21:36:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9A6B10D17BE
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 21:36:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1B2F1019E0D
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 21:36:06 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-311-LzMv7dzCMTKtjNcJCVyi6w-1; Mon, 20 Apr 2020 17:36:04 -0400
X-MC-Unique: LzMv7dzCMTKtjNcJCVyi6w-1
Received: by mail-qk1-f194.google.com with SMTP id g74so12421895qke.13
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 14:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:date:message-id:user-agent
	:mime-version:content-transfer-encoding;
	bh=basZKrvgYvnBeWtxQDt7KJrwp8hjQ7r9IiBaUiaYfmQ=;
	b=GnyVf4CVtuG4ZmaGK3R5YbRWy92GtJhFiq4bQReztqHeod14oLOL/2G2bw5LECGXH3
	+FF1SQFzDMfSWVDK2Ik5Fa3QXVfLMWDVm6lpDxXQk6Gc1bxSMNpEFCy3F2LMwFYBesCf
	GRIch5kepa1jBBvzIvcvcnN6q3Mvqhhu94hwCttUSrcOrt81+Dr39VGtJ+roqhLBbRO+
	p/owXkB7fNycpzg8kUd7DseyoSMmmAMyjTFTzgCgdgOdcvroSmBeg6uqO2Fcjtz4FU75
	6U7psJBh6agkV29Xjm4uwPggJBdTeDbO77RzsCE7kBFk+7tHbD2U3tyx+rhQbfDhT5A4
	Q9vA==
X-Gm-Message-State: AGi0PuZ0x28lv2qJgM/8kmWgRg91Sgfny8z1vB99yHWzrHiH0oiwcgMt
	UDuVak6e6Zpp79d9wngtNt0K8Kd0xg==
X-Google-Smtp-Source: APiQypLw5UpuQFrzUfkk9n0oJ5+Q4J7lmpzl5HhBwXparWU3Id6GZnntrfjA6GXNZmTbwxOEynXZhQ==
X-Received: by 2002:a37:5e47:: with SMTP id s68mr17344656qkb.411.1587418562702;
	Mon, 20 Apr 2020 14:36:02 -0700 (PDT)
Received: from localhost (pool-71-245-238-133.bstnma.fios.verizon.net.
	[71.245.238.133])
	by smtp.gmail.com with ESMTPSA id g4sm359507qtq.93.2020.04.20.14.36.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Apr 2020 14:36:01 -0700 (PDT)
Subject: [PATCH] audit: check the length of userspace generated audit records
From: Paul Moore <paul@paul-moore.com>
To: linux-audit@redhat.com
Date: Mon, 20 Apr 2020 17:36:00 -0400
Message-ID: <158741856073.246860.5955712228915579.stgit@chester>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 756125289285 ("audit: always check the netlink payload length
in audit_receive_msg()") fixed a number of missing message length
checks, but forgot to check the length of userspace generated audit
records.  The good news is that you need CAP_AUDIT_WRITE to submit
userspace audit records, which is generally only given to trusted
processes, so the impact should be limited.

Cc: stable@vger.kernel.org
Fixes: 756125289285 ("audit: always check the netlink payload length in audit_receive_msg()")
Reported-by: syzbot+49e69b4d71a420ceda3e@syzkaller.appspotmail.com
Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 kernel/audit.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/audit.c b/kernel/audit.c
index b69c8b460341..87f31bf1f0a0 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1326,6 +1326,9 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 	case AUDIT_FIRST_USER_MSG2 ... AUDIT_LAST_USER_MSG2:
 		if (!audit_enabled && msg_type != AUDIT_USER_AVC)
 			return 0;
+		/* exit early if there isn't at least one character to print */
+		if (data_len < 2)
+			return -EINVAL;
 
 		err = audit_filter(msg_type, AUDIT_FILTER_USER);
 		if (err == 1) { /* match or error */

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


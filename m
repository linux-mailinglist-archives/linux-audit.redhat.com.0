Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 289593201B8
	for <lists+linux-audit@lfdr.de>; Sat, 20 Feb 2021 00:29:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-VunL68X5NFeB3ubHIQQzvw-1; Fri, 19 Feb 2021 18:29:42 -0500
X-MC-Unique: VunL68X5NFeB3ubHIQQzvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D5968030D0;
	Fri, 19 Feb 2021 23:29:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BBF960BFA;
	Fri, 19 Feb 2021 23:29:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7974218095CB;
	Fri, 19 Feb 2021 23:29:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11JNT6TO029855 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 19 Feb 2021 18:29:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 843F120CA48A; Fri, 19 Feb 2021 23:29:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F64420CA487
	for <linux-audit@redhat.com>; Fri, 19 Feb 2021 23:29:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08096800BFF
	for <linux-audit@redhat.com>; Fri, 19 Feb 2021 23:29:03 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-253-Tkbx5uLuNmqL2crbyeaUow-1; Fri, 19 Feb 2021 18:29:00 -0500
X-MC-Unique: Tkbx5uLuNmqL2crbyeaUow-1
Received: by mail-qk1-f180.google.com with SMTP id 204so2336723qke.11
	for <linux-audit@redhat.com>; Fri, 19 Feb 2021 15:29:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
	:mime-version:content-transfer-encoding;
	bh=I5IfKRdXnnleoBgn0KNJJhjGg9GGixgu98+3KfCYNQY=;
	b=bvZ0FlyZ1LcBtmRo7Ex1+MZxIwmfUUCuA3f6StTz2qP5uKGXtBb/MCkJW96Ea/RYKw
	xnkMVjyFVt2HroyeTAidVTpBxNaySNFzED2aNP1XUAqPW6AkEW8OXflz/qYhJicLq+Zy
	52lpfTabaT6r9ZvFlo+JNhtYsEkzhyuLn30OshThuxtRT26NEJBCLzTzzRbOsCemAORh
	bOkbivh7HfVg35VpF6FbryuvYHOSJogcsGrihFWGUYrtnwiZDuUgLFRWSOD8gLIiAK4/
	3zhOtcUrhqCgCQH8EGjHv2CzNUS8x4qF+GbvJ8OGIkHZX5OdAlYyHcscjhkM+ad5V8U1
	Rvzg==
X-Gm-Message-State: AOAM532gM6ZVk7qas9L8SlonQK4WKNdHLtQjjJxhM0FBPYsdmuyDjRkJ
	vHNejkdJVZqDeHl5zSAUP4jM
X-Google-Smtp-Source: ABdhPJwgWsJeEMkcOJmtUzyQANZ/Grg+TX2XWY1BJccuBbUg3v+MNFHxWd696WqhMyJQrJBCr9CNjg==
X-Received: by 2002:a05:620a:1315:: with SMTP id
	o21mr11803309qkj.3.1613777339953; 
	Fri, 19 Feb 2021 15:28:59 -0800 (PST)
Received: from localhost ([151.203.60.33]) by smtp.gmail.com with ESMTPSA id
	l24sm6370024qtj.50.2021.02.19.15.28.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 19 Feb 2021 15:28:59 -0800 (PST)
Subject: [RFC PATCH 0/4] Split security_task_getsecid() into subj and obj
	variants
From: Paul Moore <paul@paul-moore.com>
To: Casey Schaufler <casey@schaufler-ca.com>,
	John Johansen <john.johansen@canonical.com>
Date: Fri, 19 Feb 2021 18:28:58 -0500
Message-ID: <161377712068.87807.12246856567527156637.stgit@sifl>
User-Agent: StGit/1.0
MIME-Version: 1.0
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
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As discussed briefly on the list (lore link below), we are a little
sloppy when it comes to using task credentials, mixing both the
subjective and object credentials.  This patch set attempts to fix
this by replacing security_task_getsecid() with two new hooks that
return either the subjective (_subj) or objective (_obj) credentials.

https://lore.kernel.org/linux-security-module/806848326.0ifERbkFSE@x2/T/

Casey and John, I made a quick pass through the Smack and AppArmor
code in an effort to try and do the right thing, but I will admit
that I haven't tested those changes, just the SELinux code.  I
would really appreciate your help in reviewing those changes.  If
you find it easier, feel free to wholesale replace my Smack/AppArmor
patch with one of your own.

---

Paul Moore (4):
      lsm: separate security_task_getsecid() into subjective and objective variants
      selinux: clarify task subjective and objective credentials
      smack: differentiate between subjective and objective task credentials
      apparmor: differentiate between subjective and objective task credentials


 security/apparmor/domain.c       |  2 +-
 security/apparmor/include/cred.h | 19 +++++--
 security/apparmor/include/task.h |  3 +-
 security/apparmor/lsm.c          | 23 ++++++---
 security/apparmor/task.c         | 23 +++++++--
 security/selinux/hooks.c         | 85 ++++++++++++++++++--------------
 security/smack/smack.h           | 18 ++++++-
 security/smack/smack_lsm.c       | 40 ++++++++++-----
 8 files changed, 147 insertions(+), 66 deletions(-)

--
Signature

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


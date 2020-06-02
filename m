Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id AF6B01EB2CE
	for <lists+linux-audit@lfdr.de>; Tue,  2 Jun 2020 02:49:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591058977;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oveBfm7E6FCLTjDSUZtxbon6jn9r+r/bXBmkyu5i5TQ=;
	b=bd9crfVFZ2zcbGeZCXqM+SyUqNI0sGxjuH98oThq6+VzU3tGuGS7nXFz+6CF8nJOVc4zHm
	MhdlNR2yOZ+ybxg6ynsH58311h4+ZFM/oaUmgG5RqClbyCdYOcrIa/J7SqJJRKs3Lzlvks
	tGcaALbq3rpIZiAxy9dWnnxdUqe3Geg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-Zw6l-emnMQKKLsC0M7lBGQ-1; Mon, 01 Jun 2020 20:49:35 -0400
X-MC-Unique: Zw6l-emnMQKKLsC0M7lBGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 365ED835B40;
	Tue,  2 Jun 2020 00:49:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 134025D9CC;
	Tue,  2 Jun 2020 00:49:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 929BE1D82;
	Tue,  2 Jun 2020 00:49:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0520nIWx011838 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 20:49:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 03BB52026FFE; Tue,  2 Jun 2020 00:49:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E278D2026E1C
	for <linux-audit@redhat.com>; Tue,  2 Jun 2020 00:49:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F6381859163
	for <linux-audit@redhat.com>; Tue,  2 Jun 2020 00:49:15 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-69-XcuJA52IPiW09UTt5juz_A-1; Mon, 01 Jun 2020 20:49:13 -0400
X-MC-Unique: XcuJA52IPiW09UTt5juz_A-1
Received: by mail-ej1-f65.google.com with SMTP id a2so10986927ejb.10
	for <linux-audit@redhat.com>; Mon, 01 Jun 2020 17:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=hSYlpejsvywh9sHVQtlT/OLvvib16yqx/0D9m84zGsc=;
	b=CnG+jN8LGA3SR1c0ezqQ+MvmPTGoL1IQJN/tRLSE9ONkiSBQTCC/x+JI7KP/ISrtJM
	1QUfHfHSf2KPmwiM0omh11P8RA+yOJ6ikqkUVOFgVYsOR8ze4QtJLqg+tg24T6h3ZNyu
	4GLQlpfz4s5q05M2RTvILiIX6y8sFwLlUx0TPR6CRpC7DIeekKJomO6DaV3sR52YmjkY
	3rNDS5nAtJUYdoz8kGphfvWWGpX4N57mibNqONRoW4R5eCeJX8G5DIvq9HdytkDrhTB/
	gY0foN+gorktY8j5EyAccIONwqr1XRzeWbdIP01K7cxUveG7bQNLEJYZhAguneBAdL4g
	/hPA==
X-Gm-Message-State: AOAM530SDHk5IuXwjoyKo/TTOiBOKDinXfnNlGM0Gk93Ec4i8X0w/s7B
	RnCGLqk59K5++494pgTSXqezwcgN5CZLVGDyCKbb
X-Google-Smtp-Source: ABdhPJy/vttsQNaDUQlDfH83cE90V+Tdpb9iW20QoKXFDwTKaHbuoSov682reY1NrdOcnvvYCUJ7A4DwT7GfbhArnHY=
X-Received: by 2002:a17:906:e257:: with SMTP id
	gq23mr2274991ejb.398.1591058950669; 
	Mon, 01 Jun 2020 17:49:10 -0700 (PDT)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 1 Jun 2020 20:48:59 -0400
Message-ID: <CAHC9VhQqnAG5DxvoQKa643d06rDTVtHVFEj5arCsHwyoamCckA@mail.gmail.com>
Subject: [GIT PULL] Audit patches for v5.8
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

Here is the set of audit patches for the v5.8 merge window, all
patches pass our test suite and as of a few minutes ago they also
merge cleanly with the top of your tree.  Unfortunately I just noticed
that one of the commit subject lines is truncated - sorry about that,
it's my fault not Richard's - but since the important part is there
("add subj creds to NETFILTER_CFG") I opted to leave it as-is and not
disrupt the git log.  If you would rather have the subject line fixed,
let me know and I'll correct it.

A quick summary of the significant patches:

- Record information about binds/unbinds to the audit multicast
socket.  This helps identify which processes have/had access to the
information in the audit stream.

- Cleanup and add some additional information to the netfilter
configuration events collected by audit.

- Fix some of the audit error handling code so we don't leak network
namespace references.

Thanks,
-Paul

--
The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

 Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   tags/audit-pr-20200601

for you to fetch changes up to 9d44a121c5a79bc8a9d67c058456bd52a83c79e7:

 audit: add subj creds to NETFILTER_CFG record to
   (2020-05-20 18:09:19 -0400)

----------------------------------------------------------------
audit/stable-5.8 PR 20200601

----------------------------------------------------------------
Gustavo A. R. Silva (1):
     audit: Replace zero-length array with flexible-array

Paul Moore (2):
     audit: fix a net reference leak in audit_send_reply()
     audit: fix a net reference leak in audit_list_rules_send()

Richard Guy Briggs (4):
     audit: log audit netlink multicast bind and unbind
     audit: tidy and extend netfilter_cfg x_tables
     netfilter: add audit table unregister actions
     audit: add subj creds to NETFILTER_CFG record to

Zheng Bin (1):
     audit: make symbol 'audit_nfcfgs' static

include/linux/audit.h           |  24 +++++++++-
include/uapi/linux/audit.h      |   1 +
kernel/audit.c                  | 100 +++++++++++++++++++++++++++---------
kernel/audit.h                  |   2 +-
kernel/auditfilter.c            |  16 +++----
kernel/auditsc.c                |  31 +++++++++++++
net/bridge/netfilter/ebtables.c |  14 +++---
net/netfilter/x_tables.c        |  14 ++----
8 files changed, 148 insertions(+), 54 deletions(-)

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


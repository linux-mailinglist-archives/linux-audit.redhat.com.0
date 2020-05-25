Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 058CE1E07DF
	for <lists+linux-audit@lfdr.de>; Mon, 25 May 2020 09:22:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590391376;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FNPbRuKBx5NTWTzy+ToLBnh/WfqZEySFu4w0yHBMKiE=;
	b=MOKyNxZdjgSS04vu1ny41X9KpFaKOs9R48o7lpQw3aDNrJMbFv0KHOFwKqZNGwdzHm8Cu4
	rf/3/xShBASGkONZNQb1RufC9LLnLPtEN++bjO0aSFbZzPU5dA0RY6bN7MGqPZtvjBVcl3
	9d/2ZkTbWiL3w4QdgwFEjC9Cp2VPDIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-79t0G4sWPgyY_DR3stbBQQ-1; Mon, 25 May 2020 03:22:53 -0400
X-MC-Unique: 79t0G4sWPgyY_DR3stbBQQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 257B61902EC4;
	Mon, 25 May 2020 07:22:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05DDB60CC0;
	Mon, 25 May 2020 07:22:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4CE0454D25;
	Mon, 25 May 2020 07:22:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04P7MJO0021333 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 25 May 2020 03:22:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B2B5C3322C; Mon, 25 May 2020 07:22:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63C6A1731D
	for <linux-audit@redhat.com>; Mon, 25 May 2020 07:22:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95F78833B4C
	for <linux-audit@redhat.com>; Mon, 25 May 2020 07:22:15 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-96-ZLpgapjTM_Sm4agWKiRHQw-1; Mon, 25 May 2020 03:22:10 -0400
X-MC-Unique: ZLpgapjTM_Sm4agWKiRHQw-1
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 10878EB3AD0D68352DB7;
	Mon, 25 May 2020 15:22:05 +0800 (CST)
Received: from DESKTOP-KBFSBNP.china.huawei.com (10.67.101.172) by
	DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 25 May 2020 15:22:02 +0800
From: Yiwen Gu <guyiwen@huawei.com>
To: <paul@paul-moore.com>, <eparis@redhat.com>
Subject: [RFC] audit: allow audit_reusename to check kernel path
Date: Mon, 25 May 2020 15:21:56 +0800
Message-ID: <1590391317-71528-1-git-send-email-guyiwen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.101.172]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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

For now, we met a situation where the audit_reusename checking
function returns the same filename structure for files sharing
the same uptr. However, these files are different, and we are trying
to open them in a loop where the names are loaded into the same address.
Therefore, the function returns the same structure for different files.
By the way, may I ask in what situation would the audit_list be kept
across syscalls?

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


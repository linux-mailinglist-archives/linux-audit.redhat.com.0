Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F2042AA4
	for <lists+linux-audit@lfdr.de>; Wed, 12 Jun 2019 17:18:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B29B59469;
	Wed, 12 Jun 2019 15:17:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DFFB10018F9;
	Wed, 12 Jun 2019 15:17:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1ACF719725;
	Wed, 12 Jun 2019 15:17:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5CFG9TZ009764 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 12 Jun 2019 11:16:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 160F7196B1; Wed, 12 Jun 2019 15:16:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-122-222.rdu2.redhat.com [10.10.122.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCA7A19489
	for <linux-audit@redhat.com>; Wed, 12 Jun 2019 15:16:05 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Audit-3.0 alpha8 available
Date: Wed, 12 Jun 2019 11:16:05 -0400
Message-ID: <22294450.DJvtoXzMLv@x2>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 12 Jun 2019 15:18:40 +0000 (UTC)

Hello,

This is to let everyone know that another audit-3.0 pre-release was made. 
This rolls up a lot more fixes in the master branch since the last pre-release 
was announced. Despite the designation of alpha, I feel that this is a 
production quality release and can be treated that way. It has been pushed 
into all supported releases of Fedora to indicate that I feel it's a good 
release with significant fixes/features that people would want.  The release is 
based off of the tree as of commit f58ec40.

You can find the release here:
http://people.redhat.com/sgrubb/audit/audit-3.0-alpha8.tar.gz

Changelog is here:
https://github.com/linux-audit/audit-userspace/blob/
f58ec40668157969d7b55b7ad3cbd21f93ac428c/ChangeLog

The reason this has not been declared a stable 3.0 release is simply because 
we are still waiting for container support to land. In any event, if you find 
any problems with this "release", please email this list or file an issue in 
github.

Thanks,
-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
